Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 78F5C7725C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Feb 2016 10:53:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1SArOs7032553 for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Feb 2016 10:53:24 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id VQsvIEEqirc8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Feb 2016 10:53:24 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1SArLdu032548
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Feb 2016 10:53:22 GMT
Message-ID: <1456656801.11498.158.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 28 Feb 2016 10:53:21 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] sanity: Improve configuration upgrade capabilities (support meta-yocto -> poky transition)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 28 Feb 2016 10:53:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Right now, only one configuration file can be processed (conf/bblayers.conf)
and it can only have one version number. This is a cause of immense friction
between OE-Core and Poky since if one needs a version change, it shouldn't 
be forced on the other.

We'd like to rename the meta-yocto layer (within the meta-yocto repository)
to meta-poky. To do this, we need to correct the bblayers.conf file and that
means changing the sanity version. After the pain this caused the last time,
Paul made me promise never to have them out of sync between OE-Core and Poky,
equally, having every distro changing config update OE-Core isn't scalable
either.

This patch changes the sanity upgrade method to list a more generic format:

<config file>:<current version variable name>:<required version variable name>:<upgrade function>

This in theory allows us to support upgrades to any of the core
configuration files, and allow layers to extend them as needed. Files
with the same name can be handled in different layers by setting a unique
version name variable in the file itself. The upgrade code is only called
if the version variable is set.

To allow us to make the poky name change and use a new configuration file
name, one last version bump is included for poky to handle the transition.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 49693e7..a0553ee 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -25,21 +25,70 @@ def sanity_conf_update(fn, lines, version_var_name, new_version):
     with open(fn, "w") as f:
         f.write(''.join(lines))
 
-# Functions added to this variable MUST throw an exception (or sys.exit()) unless they
-# successfully changed LCONF_VERSION in bblayers.conf
-BBLAYERS_CONF_UPDATE_FUNCS += "oecore_update_bblayers"
+# Functions added to this variable MUST throw a NotImplementedError exception unless 
+# they successfully changed the config version in the config file. Exceptions
+# are used since exec_func doesn't handle return values.
+BBLAYERS_CONF_UPDATE_FUNCS += " \
+    conf/bblayers.conf:LCONF_VERSION:LAYER_CONF_VERSION:oecore_update_bblayers \
+    conf/local.conf:CONF_VERSION:LOCALCONF_VERSION:oecore_update_localconf \
+    conf/site.conf:SCONF_VERSION:SITE_CONF_VERSION:oecore_update_siteconf \
+"
+
+python oecore_update_localconf() {
+    # Check we are using a valid local.conf
+    current_conf  = d.getVar('CONF_VERSION', True)
+    conf_version =  d.getVar('LOCALCONF_VERSION', True)
+
+    failmsg = "Your version of local.conf was generated from an older/newer version of 
+local.conf.sample and there have been updates made to this file. Please compare the two 
+files and merge any changes before continuing.
+
+Matching the version numbers will remove this message.
+
+\"meld conf/local.conf ${COREBASE}/meta*/conf/local.conf.sample\" 
+
+is a good way to visualise the changes."
+
+    raise NotImplementedError(failmsg)
+}
+
+python oecore_update_siteconf() {
+    # If we have a site.conf, check it's valid
+    current_sconf = d.getVar('SCONF_VERSION', True)
+    sconf_version = d.getVar('SITE_CONF_VERSION', True)
+
+    failmsg = "Your version of site.conf was generated from an older version of 
+site.conf.sample and there have been updates made to this file. Please compare the two 
+files and merge any changes before continuing.
+
+Matching the version numbers will remove this message.
+
+\"meld conf/site.conf ${COREBASE}/meta*/conf/site.conf.sample\" 
+
+is a good way to visualise the changes."
+
+    raise NotImplementedError(failmsg)
+}
 
 python oecore_update_bblayers() {
     # bblayers.conf is out of date, so see if we can resolve that
 
     current_lconf = int(d.getVar('LCONF_VERSION', True))
-    if not current_lconf:
-        sys.exit()
     lconf_version = int(d.getVar('LAYER_CONF_VERSION', True))
+
+    failmsg = """Your version of bblayers.conf has the wrong LCONF_VERSION (has %s, expecting %s).
+Please compare the your file against bblayers.conf.sample and merge any changes before continuing.
+"meld conf/bblayers.conf ${COREBASE}/meta*/conf/bblayers.conf.sample" 
+
+is a good way to visualise the changes.""" % (current_lconf, lconf_version)
+
+    if not current_lconf:
+        raise NotImplementedError(failmsg)
+
     lines = []
 
     if current_lconf < 4:
-        sys.exit()
+        raise NotImplementedError(failmsg)
 
     bblayers_fn = bblayers_conf_file(d)
     lines = sanity_conf_read(bblayers_fn)
@@ -58,13 +107,13 @@ python oecore_update_bblayers() {
                         lines[index] = (bbpath_line[:start + 1] +
                                     topdir_var + ':' + bbpath_line[start + 1:])
             else:
-                sys.exit()
+                raise NotImplementedError(failmsg)
         else:
             index, bbfiles_line = sanity_conf_find_line('BBFILES', lines)
             if bbfiles_line:
                 lines.insert(index, 'BBPATH = "' + topdir_var + '"\n')
             else:
-                sys.exit()
+                raise NotImplementedError(failmsg)
 
         current_lconf += 1
         sanity_conf_update(bblayers_fn, lines, 'LCONF_VERSION', current_lconf)
@@ -76,7 +125,33 @@ python oecore_update_bblayers() {
         sanity_conf_update(bblayers_fn, lines, 'LCONF_VERSION', current_lconf)
         return
 
-    sys.exit()
+        if not status.reparse:
+            status.addresult()
+
+    elif current_lconf == 6 and lconf_version > 6:
+        # Handle rename of meta-yocto -> meta-poky
+        # This marks the start of separate version numbers but code is needed in OE-Core
+        # for the migration, one last time.
+        layers = d.getVar('BBLAYERS', True)
+        if 'meta-yocto' in layers:
+            index, meta_yocto_line = sanity_conf_find_line('.*meta-yocto.*\n', lines)
+            if meta_yocto_line:
+                lines[index] = meta_yocto_line.replace('meta-yocto', 'meta-poky')
+            else:
+                raise NotImplementedError(failmsg)
+            index, meta_yocto_line = sanity_conf_find_line('LCONF_VERSION.*\n', lines)
+            if meta_yocto_line:
+                lines[index] = 'POKY_BBLAYERS_CONF_VERSION = "1"\n'
+            else:
+                raise NotImplementedError(failmsg)
+            with open(bblayers_fn, "w") as f:
+                f.write(''.join(lines))
+            return
+
+        sanity_conf_update(bblayers_fn, lines, 'LCONF_VERSION', "7")
+        return
+
+    raise NotImplementedError(failmsg)
 }
 
 def raise_sanity_error(msg, d, network_error=False):
@@ -463,37 +538,20 @@ def check_perl_modules(sanity_data):
     return None
 
 def sanity_check_conffiles(status, d):
-    # Check we are using a valid local.conf
-    current_conf  = d.getVar('CONF_VERSION', True)
-    conf_version =  d.getVar('LOCALCONF_VERSION', True)
-
-    if current_conf != conf_version:
-        status.addresult("Your version of local.conf was generated from an older/newer version of local.conf.sample and there have been updates made to this file. Please compare the two files and merge any changes before continuing.\nMatching the version numbers will remove this message.\n\"meld conf/local.conf ${COREBASE}/meta*/conf/local.conf.sample\" is a good way to visualise the changes.\n")
-
-    # Check bblayers.conf is valid
-    current_lconf = d.getVar('LCONF_VERSION', True)
-    lconf_version = d.getVar('LAYER_CONF_VERSION', True)
-    if current_lconf != lconf_version:
-        funcs = d.getVar('BBLAYERS_CONF_UPDATE_FUNCS', True).split()
-        for func in funcs:
+    funcs = d.getVar('BBLAYERS_CONF_UPDATE_FUNCS', True).split()
+    for func in funcs:
+        conffile, current_version, required_version, func = func.split(":")
+        if check_conf_exists(conffile, d) and d.getVar(current_version, True) is not None and \
+                d.getVar(current_version, True) != d.getVar(required_version, True):
             success = True
             try:
                 bb.build.exec_func(func, d)
-            except Exception:
+            except NotImplementedError as e:
                 success = False
+                status.addresult(e.msg)
             if success:
                 bb.note("Your conf/bblayers.conf has been automatically updated.")
                 status.reparse = True
-        if not status.reparse:
-            status.addresult("Your version of bblayers.conf has the wrong LCONF_VERSION (has %s, expecting %s).\nPlease compare the your file against bblayers.conf.sample and merge any changes before continuing.\n\"meld conf/bblayers.conf ${COREBASE}/meta*/conf/bblayers.conf.sample\" is a good way to visualise the changes.\n" % (current_lconf, lconf_version))
-
-    # If we have a site.conf, check it's valid
-    if check_conf_exists("conf/site.conf", d):
-        current_sconf = d.getVar('SCONF_VERSION', True)
-        sconf_version = d.getVar('SITE_CONF_VERSION', True)
-        if current_sconf != sconf_version:
-            status.addresult("Your version of site.conf was generated from an older version of site.conf.sample and there have been updates made to this file. Please compare the two files and merge any changes before continuing.\nMatching the version numbers will remove this message.\n\"meld conf/site.conf ${COREBASE}/meta*/conf/site.conf.sample\" is a good way to visualise the changes.\n")
-
 
 def sanity_handle_abichanges(status, d):
     #
diff --git a/meta/conf/sanity.conf b/meta/conf/sanity.conf
index 0f852d1..0d20c99 100644
--- a/meta/conf/sanity.conf
+++ b/meta/conf/sanity.conf
@@ -9,7 +9,7 @@ SANITY_ABIFILE = "${TMPDIR}/abi_version"
 
 SANITY_VERSION ?= "1"
 LOCALCONF_VERSION  ?= "1"
-LAYER_CONF_VERSION ?= "6"
+LAYER_CONF_VERSION ?= "7"
 SITE_CONF_VERSION  ?= "1"
 
 INHERIT += "sanity"



