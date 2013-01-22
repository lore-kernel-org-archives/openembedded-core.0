Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1TxaYW-00035o-PQ
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Jan 2013 10:55:14 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 22 Jan 2013 01:38:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,513,1355126400"; d="scan'208";a="193852409"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by AZSMGA002.ch.intel.com with ESMTP; 22 Jan 2013 01:38:40 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Jan 2013 11:39:30 +0200
Message-Id: <1358847570-7398-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH 3/3] prs: add LOCALCOUNT to AUTOINCs migration feature
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Jan 2013 09:55:16 -0000

- use migrate_localcount.bbclass to generate AUTOINC entries
which are exported to LOCALCOUNT_DUMPFILE
- import the generated AUTOINC entries
- one can migrate LOCALCOUNT to AUTOINC by executing:
    bitbake-prserv-tool migrate_localcount

[YOCTO #3071]

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/classes/migrate_localcount.bbclass | 47 +++++++++++++++++++++++++++++++++
 meta/conf/migrate_localcount.conf       |  1 +
 scripts/bitbake-prserv-tool             | 32 ++++++++++++++++++++++
 3 files changed, 80 insertions(+)
 create mode 100644 meta/classes/migrate_localcount.bbclass
 create mode 100644 meta/conf/migrate_localcount.conf

diff --git a/meta/classes/migrate_localcount.bbclass b/meta/classes/migrate_localcount.bbclass
new file mode 100644
index 0000000..59f14e8
--- /dev/null
+++ b/meta/classes/migrate_localcount.bbclass
@@ -0,0 +1,47 @@
+PRSERV_DUMPDIR ??= "${LOG_DIR}/db"
+LOCALCOUNT_DUMPFILE ??= "${PRSERV_DUMPDIR}/prserv-localcount-exports.inc"
+
+python migrate_localcount_handler () {
+    import bb.event
+    if not e.data:
+        return
+
+    if isinstance(e, bb.event.RecipeParsed):
+        pv = e.data.getVar('PV', True)
+        if not 'AUTOINC' in pv:
+            return
+
+        localcounts = bb.persist_data.persist('BB_URI_LOCALCOUNT', e.data)
+        pn = e.data.getVar('PN', True)
+        revs = localcounts.get_by_pattern('%%-%s_rev' % pn)
+        counts = localcounts.get_by_pattern('%%-%s_count' % pn)
+        if not revs or not counts:
+            return
+
+        srcrev = bb.fetch2.get_srcrev(e.data)
+        bpv = pv[:pv.find(srcrev)]
+
+        if len(revs) != len(counts):
+            bb.warn("The number of revs and localcounts don't match in %s" % pn)
+            return
+
+        version = 'AUTOINC-%s-%s' % (pn, bpv)
+        pkgarch = e.data.getVar('PACKAGE_ARCH', True)
+        value = max(int(count) for count in counts)
+
+        if len(revs) == 1:
+            if srcrev != ('AUTOINC+%s' % revs[0]):
+                value += 1
+        else:
+            value += 1
+
+        bb.utils.mkdirhier(e.data.getVar('PRSERV_DUMPDIR', True))
+        df = e.data.getVar('LOCALCOUNT_DUMPFILE', True)
+        flock = bb.utils.lockfile("%s.lock" % df)
+        with open(df, 'a') as fd:
+            fd.write('PRAUTO$%s$%s$%s = "%s"\n' %
+                    (version, pkgarch, srcrev, str(value)))
+        bb.utils.unlockfile(flock)
+}
+
+addhandler migrate_localcount_handler
diff --git a/meta/conf/migrate_localcount.conf b/meta/conf/migrate_localcount.conf
new file mode 100644
index 0000000..e486e03
--- /dev/null
+++ b/meta/conf/migrate_localcount.conf
@@ -0,0 +1 @@
+INHERIT += "migrate_localcount"
diff --git a/scripts/bitbake-prserv-tool b/scripts/bitbake-prserv-tool
index f3855df..4654e6d 100755
--- a/scripts/bitbake-prserv-tool
+++ b/scripts/bitbake-prserv-tool
@@ -47,6 +47,35 @@ do_import ()
     return $ret
 }
 
+do_migrate_localcount ()
+{
+    df=`bitbake -R conf/migrate_localcount.conf -e | \
+                grep ^LOCALCOUNT_DUMPFILE= | cut -f2 -d\"`
+    if [ "x${df}" == "x" ];
+    then
+        echo "LOCALCOUNT_DUMPFILE is not defined!"
+        return 1
+    fi
+
+    rm -rf $df
+    clean_cache
+    echo "Exporting LOCALCOUNT to AUTOINCs..."
+    bitbake -R conf/migrate_localcount.conf -p
+    [ ! $? -eq 0 ] && echo "Exporting failed!" && exit 1
+
+    echo "Importing generated AUTOINC entries..."
+    [ -e $df ] && do_import $df
+
+    if [ ! $? -eq 0 ]
+    then
+        echo "Migration from LOCALCOUNT to AUTOINCs failed!"
+        return 1
+    fi
+
+    echo "Migration from LOCALCOUNT to AUTOINCs succeeded!"
+    return 0
+}
+
 [ $# -eq 0 ] && help  && exit 1
 
 case $1 in
@@ -56,6 +85,9 @@ export)
 import)
     do_import $2
     ;;
+migrate_localcount)
+    do_migrate_localcount
+    ;;
 *)
     help
     exit 1
-- 
1.7.11.7



