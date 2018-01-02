Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8A2F4600EA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jan 2018 07:59:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Jan 2018 23:59:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,495,1508828400"; d="scan'208";a="191692681"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga006.fm.intel.com with ESMTP; 01 Jan 2018 23:59:08 -0800
From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue,  2 Jan 2018 15:53:42 +0800
Message-Id: <7be6b80b88787b971ce9d5031dbe79b5e085e238.1514344225.git.rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1514344225.git.rebecca.swee.fun.chang@intel.com>
References: <cover.1514344225.git.rebecca.swee.fun.chang@intel.com>
Subject: [PATCH 1/1] sanity.bbclass: remove obsolete bblayers.conf updater code
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
X-List-Received-Date: Tue, 02 Jan 2018 07:59:08 -0000

The code in sanity.bbclass was executed for all distros, regardsless
whether they use the same numbering of bblayers.conf.sample as
OE-core.

The is problematic for distros which tracks their own LCONF_VERSION,
once they reach the 5 to 7 (inclusive) number range, the code from
sanity.bbclass kicks in and automatically updates the version to that
number without actually changing anything else in bblayers.conf, which
leaves the developer out-of-sync with bblayers.conf.sample.

We removed the automatic updater code blob and that will resolves the
issue of out-of-sync bblayers.conf. It will now notify users when
bblayers.conf is not valid and he needs to perform a manual update.

[YOCTO #11683]

Suggested-by: Patrick Ohly <patrick.ohly@intel.com>
Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
---
 meta/classes/sanity.bbclass | 100 +-------------------------------------------
 1 file changed, 1 insertion(+), 99 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index d0f507e0..70d652f 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -5,26 +5,6 @@
 SANITY_REQUIRED_UTILITIES ?= "patch diffstat makeinfo git bzip2 tar \
     gzip gawk chrpath wget cpio perl file which"
 
-def bblayers_conf_file(d):
-    return os.path.join(d.getVar('TOPDIR'), 'conf/bblayers.conf')
-
-def sanity_conf_read(fn):
-    with open(fn, 'r') as f:
-        lines = f.readlines()
-    return lines
-
-def sanity_conf_find_line(pattern, lines):
-    import re
-    return next(((index, line)
-        for index, line in enumerate(lines)
-        if re.search(pattern, line)), (None, None))
-
-def sanity_conf_update(fn, lines, version_var_name, new_version):
-    index, line = sanity_conf_find_line(r"^%s" % version_var_name, lines)
-    lines[index] = '%s = "%d"\n' % (version_var_name, new_version)
-    with open(fn, "w") as f:
-        f.write(''.join(lines))
-
 # Functions added to this variable MUST throw a NotImplementedError exception unless 
 # they successfully changed the config version in the config file. Exceptions
 # are used since exec_func doesn't handle return values.
@@ -78,7 +58,7 @@ is a good way to visualise the changes."""
 
 SANITY_BBLAYERCONF_SAMPLE ?= "${COREBASE}/meta*/conf/bblayers.conf.sample"
 python oecore_update_bblayers() {
-    # bblayers.conf is out of date, so see if we can resolve that
+    # Check if we are using a valid bblayers.conf
 
     current_lconf = int(d.getVar('LCONF_VERSION'))
     lconf_version = int(d.getVar('LAYER_CONF_VERSION'))
@@ -90,84 +70,6 @@ Please compare your file against bblayers.conf.sample and merge any changes befo
 is a good way to visualise the changes."""
     failmsg = d.expand(failmsg)
 
-    if not current_lconf:
-        raise NotImplementedError(failmsg)
-
-    lines = []
-
-    if current_lconf < 4:
-        raise NotImplementedError(failmsg)
-
-    bblayers_fn = bblayers_conf_file(d)
-    lines = sanity_conf_read(bblayers_fn)
-
-    if current_lconf == 4 and lconf_version > 4:
-        topdir_var = '$' + '{TOPDIR}'
-        index, bbpath_line = sanity_conf_find_line('BBPATH', lines)
-        if bbpath_line:
-            start = bbpath_line.find('"')
-            if start != -1 and (len(bbpath_line) != (start + 1)):
-                if bbpath_line[start + 1] == '"':
-                    lines[index] = (bbpath_line[:start + 1] +
-                                    topdir_var + bbpath_line[start + 1:])
-                else:
-                    if not topdir_var in bbpath_line:
-                        lines[index] = (bbpath_line[:start + 1] +
-                                    topdir_var + ':' + bbpath_line[start + 1:])
-            else:
-                raise NotImplementedError(failmsg)
-        else:
-            index, bbfiles_line = sanity_conf_find_line('BBFILES', lines)
-            if bbfiles_line:
-                lines.insert(index, 'BBPATH = "' + topdir_var + '"\n')
-            else:
-                raise NotImplementedError(failmsg)
-
-        current_lconf += 1
-        sanity_conf_update(bblayers_fn, lines, 'LCONF_VERSION', current_lconf)
-        bb.note("Your conf/bblayers.conf has been automatically updated.")
-        return
-
-    elif current_lconf == 5 and lconf_version > 5:
-        # Null update, to avoid issues with people switching between poky and other distros
-        current_lconf = 6
-        sanity_conf_update(bblayers_fn, lines, 'LCONF_VERSION', current_lconf)
-        bb.note("Your conf/bblayers.conf has been automatically updated.")
-        return
-
-        status.addresult()
-
-    elif current_lconf == 6 and lconf_version > 6:
-        # Handle rename of meta-yocto -> meta-poky
-        # This marks the start of separate version numbers but code is needed in OE-Core
-        # for the migration, one last time.
-        layers = d.getVar('BBLAYERS').split()
-        layers = [ os.path.basename(path) for path in layers ]
-        if 'meta-yocto' in layers:
-            found = False
-            while True:
-                index, meta_yocto_line = sanity_conf_find_line(r'.*meta-yocto[\'"\s\n]', lines)
-                if meta_yocto_line:
-                    lines[index] = meta_yocto_line.replace('meta-yocto', 'meta-poky')
-                    found = True
-                else:
-                    break
-            if not found:
-                raise NotImplementedError(failmsg)
-            index, meta_yocto_line = sanity_conf_find_line('LCONF_VERSION.*\n', lines)
-            if meta_yocto_line:
-                lines[index] = 'POKY_BBLAYERS_CONF_VERSION = "1"\n'
-            else:
-                raise NotImplementedError(failmsg)
-            with open(bblayers_fn, "w") as f:
-                f.write(''.join(lines))
-            bb.note("Your conf/bblayers.conf has been automatically updated.")
-            return
-        current_lconf += 1
-        sanity_conf_update(bblayers_fn, lines, 'LCONF_VERSION', current_lconf)
-        bb.note("Your conf/bblayers.conf has been automatically updated.")
-        return
-
     raise NotImplementedError(failmsg)
 }
 
-- 
2.7.4


