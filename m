Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id B300077196
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 16:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 6B8FE180D9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 17:28:59 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id dani4NE8QGRz
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 17:28:58 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 815B5180CB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 17:28:58 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 6AA8213C2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 17:28:58 +0100 (CET)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 5F86D13C1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 17:28:58 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 5DF7834277
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 17:28:58 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u1TGSw4U006826
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 17:28:58 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u1TGSwge006825
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Feb 2016 17:28:58 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Feb 2016 17:28:56 +0100
Message-Id: <22d07ef4122265848d2da573f8a065dc295ceef8.1456763255.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1456763255.git.pkj@axis.com>
References: <cover.1456763255.git.pkj@axis.com>
In-Reply-To: <cover.1456763255.git.pkj@axis.com>
References: <cover.1456763255.git.pkj@axis.com>
Subject: [PATCH 1/1] sanity: Do not mistake meta-yocto-bsp for meta-yocto
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
X-List-Received-Date: Mon, 29 Feb 2016 16:29:00 -0000

The code in oecore_update_bblayers() handling the transition from
meta-yocto to meta-poky was not very resilient. It would, e.g.,
mistake meta-yocto-bsp for meta-yocto if the former occurred before
the latter in BBLAYERS.

The code also failed to update multiple existences of meta-yocto in
the bblayers.conf file, e.g., if it was present in
BBLAYERS_NON_REMOVABLE in addition to BBLAYERS (which it is by
default).

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/sanity.bbclass | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 52581f6..62a3809 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -77,7 +77,7 @@ python oecore_update_bblayers() {
     lconf_version = int(d.getVar('LAYER_CONF_VERSION', True))
 
     failmsg = """Your version of bblayers.conf has the wrong LCONF_VERSION (has %s, expecting %s).
-Please compare the your file against bblayers.conf.sample and merge any changes before continuing.
+Please compare your file against bblayers.conf.sample and merge any changes before continuing.
 "meld conf/bblayers.conf ${COREBASE}/meta*/conf/bblayers.conf.sample" 
 
 is a good way to visualise the changes.""" % (current_lconf, lconf_version)
@@ -132,12 +132,18 @@ is a good way to visualise the changes.""" % (current_lconf, lconf_version)
         # Handle rename of meta-yocto -> meta-poky
         # This marks the start of separate version numbers but code is needed in OE-Core
         # for the migration, one last time.
-        layers = d.getVar('BBLAYERS', True)
+        layers = d.getVar('BBLAYERS', True).split()
+	layers = [ os.path.basename(path) for path in layers ]
         if 'meta-yocto' in layers:
-            index, meta_yocto_line = sanity_conf_find_line('.*meta-yocto.*\n', lines)
-            if meta_yocto_line:
-                lines[index] = meta_yocto_line.replace('meta-yocto', 'meta-poky')
-            else:
+            found = False
+            while True:
+                index, meta_yocto_line = sanity_conf_find_line(r'.*meta-yocto[\'"\s\n]', lines)
+                if meta_yocto_line:
+                    lines[index] = meta_yocto_line.replace('meta-yocto', 'meta-poky')
+                    found = True
+                else:
+                    break
+            if not found:
                 raise NotImplementedError(failmsg)
             index, meta_yocto_line = sanity_conf_find_line('LCONF_VERSION.*\n', lines)
             if meta_yocto_line:
-- 
2.1.0


