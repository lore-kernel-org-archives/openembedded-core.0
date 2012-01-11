Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rksqs-00005h-Ie
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jan 2012 08:44:07 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Jan 2012 23:36:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="96880546"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.168])
	by orsmga002.jf.intel.com with ESMTP; 10 Jan 2012 23:36:33 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jan 2012 23:36:29 -0800
Message-Id: <db7dbe7f67a117e3ded972779e22231f3e2e69bd.1326267271.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326267271.git.sgw@linux.intel.com>
References: <cover.1326267271.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326267271.git.sgw@linux.intel.com>
References: <cover.1326267271.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 4/5] meta/PRService: Added export/import fuctions.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Jan 2012 07:44:07 -0000

From: Lianhao Lu <lianhao.lu@intel.com>

[YOCTO #1556]
- Modified meta/class/package.bbclass and prserv.bbclass according to
the change in PR service by adding PACKAGE_ARCH into the query tuple.

- Added prexport.bbclass, primport.bbclass to export/import AUTOPR
  values from/to PRService.

- Move PR service related common code to lib/oe/prservice.py.

- Supported reading the AUTOPR values from the exported .inc file
instead of reading it from remote PR service.

- Created a new script bitbake-prserv-tool to export/import the AUTOPR
values from/to the PR service.

Typical usage scenario of the export/import is:
1. bitbake-prserv-tool export <file> to export the AUTOPR values from
the current PR service into an exported .inc file.

2. Others may use that exported .inc file(to be included in the
local.conf) to lockdown and reproduce the same AUTOPR when generating
package feeds.

3. Others may "bitbake-prserv-tool import <file>" to import the AUTOPR
values into their own PR service and the AUTOPR values will be
incremented from there.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/classes/package.bbclass  |   13 ++++-
 meta/classes/prexport.bbclass |   45 ++++++++++++++++
 meta/classes/primport.bbclass |   17 ++++++
 meta/classes/prserv.bbclass   |   36 +++++--------
 meta/conf/bitbake.conf        |    4 +-
 meta/conf/prexport.conf       |    1 +
 meta/conf/primport.conf       |    1 +
 meta/lib/oe/prservice.py      |  113 +++++++++++++++++++++++++++++++++++++++++
 scripts/bitbake-prserv-tool   |   57 +++++++++++++++++++++
 9 files changed, 260 insertions(+), 27 deletions(-)
 create mode 100644 meta/classes/prexport.bbclass
 create mode 100644 meta/classes/primport.bbclass
 create mode 100644 meta/conf/prexport.conf
 create mode 100644 meta/conf/primport.conf
 create mode 100644 meta/lib/oe/prservice.py
 create mode 100755 scripts/bitbake-prserv-tool

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 9040eb4..65e6571 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -351,10 +351,17 @@ def runtime_mapping_rename (varname, d):
 
 python package_get_auto_pr() {
 	if d.getVar('USE_PR_SERV', True) != "0":
-		auto_pr=prserv_get_pr_auto(d)
-		if auto_pr is None:
-			bb.fatal("Can NOT get auto PR revision from remote PR service")
+		try:
+			auto_pr=prserv_get_pr_auto(d)
+		except Exception as e:
+			bb.fatal("Can NOT get PRAUTO, exception %s" %  str(e))
 			return
+		if auto_pr is None:
+			if d.getVar('PRSERV_LOCKDOWN', True):
+				bb.fatal("Can NOT get PRAUTO from lockdown exported file")
+			else:
+				bb.fatal("Can NOT get PRAUTO from remote PR service")
+			return 
 		d.setVar('PRAUTO',str(auto_pr))
 }
 
diff --git a/meta/classes/prexport.bbclass b/meta/classes/prexport.bbclass
new file mode 100644
index 0000000..5b5b707
--- /dev/null
+++ b/meta/classes/prexport.bbclass
@@ -0,0 +1,45 @@
+PRSERV_DUMPOPT_VERSION = "${PRAUTOINX}"
+PRSERV_DUMPOPT_PKGARCH  = ""
+PRSERV_DUMPOPT_CHECKSUM = ""
+PRSERV_DUMPOPT_COL = "0"
+
+PRSERV_DUMPDIR ??= "${LOG_DIR}/db"
+PRSERV_DUMPFILE ??= "${PRSERV_DUMPDIR}/prserv.inc"
+
+python prexport_handler () {
+    import bb.event
+    if not e.data:
+        return
+
+    if isinstance(e, bb.event.RecipeParsed):
+        import oe.prservice
+        #get all PR values for the current PRAUTOINX
+        ver = e.data.getVar('PRSERV_DUMPOPT_VERSION', True)
+        ver = ver.replace('%','-')
+        retval = oe.prservice.prserv_dump_db(e.data)
+        if not retval:
+            bb.fatal("prexport_handler: export failed!")
+        (metainfo, datainfo) = retval
+        if not datainfo:
+            bb.error("prexport_handler: No AUROPR values found for %s" % ver)
+            return
+        oe.prservice.prserv_export_tofile(e.data, None, datainfo, False)
+    elif isinstance(e, bb.event.ParseStarted):
+        import bb.utils
+        #remove dumpfile
+        bb.utils.remove(e.data.getVar('PRSERV_DUMPFILE', True))
+    elif isinstance(e, bb.event.ParseCompleted):
+        import oe.prservice
+        #dump meta info of tables
+        d = e.data.createCopy()
+        d.setVar('PRSERV_DUMPOPT_COL', "1")
+        retval = oe.prservice.prserv_dump_db(d)
+        if not retval:
+            bb.error("prexport_handler: export failed!")
+            return
+        (metainfo, datainfo) = retval
+        oe.prservice.prserv_export_tofile(d, metainfo, None, True)
+
+}
+
+addhandler prexport_handler
diff --git a/meta/classes/primport.bbclass b/meta/classes/primport.bbclass
new file mode 100644
index 0000000..08e5a8f
--- /dev/null
+++ b/meta/classes/primport.bbclass
@@ -0,0 +1,17 @@
+python primport_handler () {
+    import bb.event
+    if not e.data:
+        return
+
+    if isinstance(e, bb.event.ParseCompleted):
+        import oe.prservice
+        #import all exported AUTOPR values
+        imported = oe.prservice.prserv_import_db(e.data)
+        if imported is None:
+            bb.fatal("import failed!")
+
+        for (version, pkgarch, checksum, value) in imported:
+            bb.note("imported (%s,%s,%s,%d)" % (version, pkgarch, checksum, value))
+}
+
+addhandler primport_handler
diff --git a/meta/classes/prserv.bbclass b/meta/classes/prserv.bbclass
index 18b8589..0825306 100644
--- a/meta/classes/prserv.bbclass
+++ b/meta/classes/prserv.bbclass
@@ -1,29 +1,21 @@
-def prserv_make_conn(d):
-    import prserv.serv
-    host=d.getVar("PRSERV_HOST",True)
-    port=d.getVar("PRSERV_PORT",True)
-    try:
-        conn=None
-        conn=prserv.serv.PRServerConnection(host,int(port))
-        d.setVar("__PRSERV_CONN",conn)
-    except Exception, exc:
-        bb.fatal("Connecting to PR service %s:%s failed: %s" % (host, port, str(exc)))
-
-    return conn
-
 def prserv_get_pr_auto(d):
-    if d.getVar('USE_PR_SERV', True) != "0":
+    import oe.prservice
+    if d.getVar('USE_PR_SERV', True) != "1":
         bb.warn("Not using network based PR service")
         return None
 
-    conn=d.getVar("__PRSERV_CONN", True)
-    if conn is None:
-        conn=prserv_make_conn(d)
+    version = d.getVar("PRAUTOINX", True)
+    pkgarch = d.getVar("PACKAGE_ARCH", True)
+    checksum = d.getVar("BB_TASKHASH", True)
+
+    if d.getVar('PRSERV_LOCKDOWN', True):
+        auto_rev = d.getVar('PRAUTO_' + version + '_' + pkgarch, True) or d.getVar('PRAUTO_' + version, True) or None
+    else:
+        conn = d.getVar("__PRSERV_CONN", True)
         if conn is None:
-            return None
+            conn = oe.prservice.prserv_make_conn(d)
+            if conn is None:
+                return None
+        auto_rev = conn.getPR(version, pkgarch, checksum)
 
-    version=d.getVar("PF", True)
-    checksum=d.getVar("BB_TASKHASH", True)
-    auto_rev=conn.getPR(version,checksum)
-    bb.debug(1,"prserv_get_pr_auto: version: %s checksum: %s result %d" % (version, checksum, auto_rev))
     return auto_rev
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 336b1d7..43eedad 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -190,7 +190,7 @@ BP = "${BPN}-${PV}"
 #
 # network based PR service
 #
-USE_PR_SERV = "${@[1,0][(d.getVar('PRSERV_HOST',1) is None) or (d.getVar('PRSERV_PORT',1) is None)]}"
+USE_PR_SERV = "${@[1,0][((not d.getVar('PRSERV_HOST', True)) or (not d.getVar('PRSERV_PORT', True))) and (not d.getVar('PRSERV_LOCKDOWN', True))]}"
 
 # Package info.
 
@@ -732,7 +732,7 @@ BB_CONSOLELOG = "${TMPDIR}/cooker.log.${DATETIME}"
 # Setup our default hash policy
 BB_SIGNATURE_HANDLER ?= "basic"
 BB_HASHTASK_WHITELIST ?= "(.*-cross$|.*-native$|.*-cross-initial$|.*-cross-intermediate$|^virtual:native:.*|^virtual:nativesdk:.*)"
-BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH DL_DIR SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL TERM USER FILESPATH STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE"
+BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH DL_DIR SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL TERM USER FILESPATH STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE PRSERV_HOST PRSERV_PORT PRSERV_DUMPDIR PRSERV_DUMPFILE PRSERV_LOCKDOWN"
 
 MLPREFIX ??= ""
 MULTILIB_VARIANTS ??= ""
diff --git a/meta/conf/prexport.conf b/meta/conf/prexport.conf
new file mode 100644
index 0000000..12f3acb
--- /dev/null
+++ b/meta/conf/prexport.conf
@@ -0,0 +1 @@
+INHERIT += "prexport"
diff --git a/meta/conf/primport.conf b/meta/conf/primport.conf
new file mode 100644
index 0000000..d94ea1b
--- /dev/null
+++ b/meta/conf/primport.conf
@@ -0,0 +1 @@
+INHERIT += "primport"
diff --git a/meta/lib/oe/prservice.py b/meta/lib/oe/prservice.py
new file mode 100644
index 0000000..fa6718e
--- /dev/null
+++ b/meta/lib/oe/prservice.py
@@ -0,0 +1,113 @@
+import bb
+
+def prserv_make_conn(d):
+    import prserv.serv
+    host = d.getVar("PRSERV_HOST",True)
+    port = d.getVar("PRSERV_PORT",True)
+    try:
+        conn = None
+        conn = prserv.serv.PRServerConnection(host,int(port))
+        d.setVar("__PRSERV_CONN",conn)
+    except Exception, exc:
+        bb.fatal("Connecting to PR service %s:%s failed: %s" % (host, port, str(exc)))
+
+    return conn
+
+def prserv_dump_db(d):
+    if d.getVar('USE_PR_SERV', True) != "1":
+        bb.error("Not using network based PR service")
+        return None
+
+    conn = d.getVar("__PRSERV_CONN", True)
+    if conn is None:
+        conn = prserv_make_conn(d)
+        if conn is None:
+            bb.error("Making connection failed to remote PR service")
+            return None
+
+    #dump db
+    opt_version = d.getVar('PRSERV_DUMPOPT_VERSION', True)
+    opt_pkgarch = d.getVar('PRSERV_DUMPOPT_PKGARCH', True)
+    opt_checksum = d.getVar('PRSERV_DUMPOPT_CHECKSUM', True)
+    opt_col = ("1" == d.getVar('PRSERV_DUMPOPT_COL', True))
+    return conn.export(opt_version, opt_pkgarch, opt_checksum, opt_col)
+
+def prserv_import_db(d, filter_version=None, filter_pkgarch=None, filter_checksum=None):
+    if d.getVar('USE_PR_SERV', True) != "1":
+        bb.error("Not using network based PR service")
+        return None
+
+    conn = d.getVar("__PRSERV_CONN", True)
+    if conn is None:
+        conn = prserv_make_conn(d)
+        if conn is None:
+            bb.error("Making connection failed to remote PR service")
+            return None
+    #get the entry values
+    imported = []
+    prefix = "PRAUTO$"
+    for v in d.keys():
+        if v.startswith(prefix):
+            (remain, sep, checksum) = v.rpartition('$')
+            (remain, sep, pkgarch) = remain.rpartition('$')
+            (remain, sep, version) = remain.rpartition('$')
+            if (remain + '$' != prefix) or \
+               (filter_version and filter_version != version) or \
+               (filter_pkgarch and filter_pkgarch != pkgarch) or \
+               (filter_checksum and filter_checksum != checksum):
+               continue
+            try:
+                value = int(d.getVar(remain + '$' + version + '$' + pkgarch + '$' + checksum, True))
+            except BaseException as exc:
+                bb.debug("Not valid value of %s:%s" % (v,str(exc)))
+                continue
+            ret = conn.importone(version,pkgarch,checksum,value)
+            if ret != value:
+                bb.error("importing(%s,%s,%s,%d) failed. DB may have larger value %d" % (version,pkgarch,checksum,value,ret))
+            else:
+               imported.append((version,pkgarch,checksum,value))
+    return imported
+
+def prserv_export_tofile(d, metainfo, datainfo, lockdown, nomax=False):
+    import bb.utils
+    #initilize the output file
+    bb.utils.mkdirhier(d.getVar('PRSERV_DUMPDIR', True))
+    df = d.getVar('PRSERV_DUMPFILE', True)
+    #write data
+    lf = bb.utils.lockfile("%s.lock" % df)
+    f = open(df, "a")
+    if metainfo:
+        #dump column info 
+        f.write("#PR_core_ver = \"%s\"\n\n" % metainfo['core_ver']);
+        f.write("#Table: %s\n" % metainfo['tbl_name'])
+        f.write("#Columns:\n")
+        f.write("#name      \t type    \t notn    \t dflt    \t pk\n")
+        f.write("#----------\t --------\t --------\t --------\t ----\n")
+        for i in range(len(metainfo['col_info'])):
+            f.write("#%10s\t %8s\t %8s\t %8s\t %4s\n" % 
+                    (metainfo['col_info'][i]['name'], 
+                     metainfo['col_info'][i]['type'], 
+                     metainfo['col_info'][i]['notnull'], 
+                     metainfo['col_info'][i]['dflt_value'], 
+                     metainfo['col_info'][i]['pk']))
+        f.write("\n")
+
+    if lockdown:
+        f.write("PRSERV_LOCKDOWN = \"1\"\n\n")
+
+    if datainfo:
+        idx = {}
+        for i in range(len(datainfo)):
+            pkgarch = datainfo[i]['pkgarch']
+            value = datainfo[i]['value']
+            if not idx.has_key(pkgarch):
+                idx[pkgarch] = i
+            elif value > datainfo[idx[pkgarch]]['value']:
+                idx[pkgarch] = i
+            f.write("PRAUTO$%s$%s$%s = \"%s\"\n" % 
+                (str(datainfo[i]['version']), pkgarch, str(datainfo[i]['checksum']), str(value)))
+        if not nomax:
+            for i in idx:
+                f.write("PRAUTO_%s_%s = \"%s\"\n" % (str(datainfo[idx[i]]['version']),str(datainfo[idx[i]]['pkgarch']),str(datainfo[idx[i]]['value'])))
+    f.close()
+    bb.utils.unlockfile(lf)
diff --git a/scripts/bitbake-prserv-tool b/scripts/bitbake-prserv-tool
new file mode 100755
index 0000000..6c0584c
--- /dev/null
+++ b/scripts/bitbake-prserv-tool
@@ -0,0 +1,57 @@
+#!/usr/bin/env bash
+
+help ()
+{
+    base=`basename $0`
+    echo -e "Usage: $base command"
+    echo "Avaliable commands:"
+    echo -e "\texport <file>: export and lock down the AUTOPR values from the PR service into a file for release."
+    echo -e "\timport <file>: import the AUTOPR values from the exported file into the PR service."
+}
+
+export ()
+{
+    file=$1
+    [ "x${file}" == "x" ] && help && exit 1
+    rm -f ${file}
+
+    touch dummy.inc
+    bitbake -R conf/prexport.conf -R dummy.inc -p
+    s=`bitbake -R conf/prexport.conf -R dummy.inc -e | grep ^PRSERV_DUMPFILE= | cut -f2 -d\"`
+    rm -f dummy.inc
+    if [ "x${s}" != "x" ];
+    then
+       [ -e $s ] && mv -f $s $file && echo "Exporting to file $file succeeded!"
+       return 0
+    fi
+    echo "Exporting to file $file failed!"
+    return 1
+}
+
+import ()
+{
+    file=$1
+    [ "x${file}" == "x" ] && help && exit 1
+
+    touch dummy.inc
+    bitbake -R conf/primport.conf -R dummy.inc -R $file -p
+    ret=$?
+    rm -f dummy.inc
+    [ $ret -eq 0 ] && echo "Importing from file $file succeeded!" || echo "Importing from file $file failed!"
+    return $ret
+}
+
+[ $# -eq 0 ] && help  && exit 1
+
+case $1 in
+export)
+    export $2
+    ;;
+import)
+    import $2
+    ;;
+*)
+    help
+    exit 1
+    ;;
+esac
-- 
1.7.6.5



