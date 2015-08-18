Return-Path: <sona.sarmadi@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 9B68560043
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 08:46:03 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 18 Aug 2015 10:46:03 +0200
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Aug 2015 10:45:56 +0200
Message-ID: <1439887556-22305-1-git-send-email-sona.sarmadi@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: sona.sarmadi@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH][dizzy] qemu: CVE-2014-7840
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
X-List-Received-Date: Tue, 18 Aug 2015 08:46:05 -0000
Content-Type: text/plain

Fixes insufficient parameter validation during ram load

Reference
http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-7840

Upstream commit:
http://git.qemu.org/?p=qemu.git;a=commit;
h=0be839a2701369f669532ea5884c15bead1c6e08

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
---
 .../recipes-devtools/qemu/qemu/CVE-2014-7840.patch | 57 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.1.0.bb           |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2014-7840.patch

diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2014-7840.patch b/meta/recipes-devtools/qemu/qemu/CVE-2014-7840.patch
new file mode 100644
index 0000000..4f992ba
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2014-7840.patch
@@ -0,0 +1,57 @@
+From 0be839a2701369f669532ea5884c15bead1c6e08 Mon Sep 17 00:00:00 2001
+From: "Michael S. Tsirkin" <mst@redhat.com>
+Date: Wed, 12 Nov 2014 11:44:39 +0200
+Subject: [PATCH] migration: fix parameter validation on ram load
+
+During migration, the values read from migration stream during ram load
+are not validated. Especially offset in host_from_stream_offset() and
+also the length of the writes in the callers of said function.
+
+To fix this, we need to make sure that the [offset, offset + length]
+range fits into one of the allocated memory regions.
+
+Validating addr < len should be sufficient since data seems to always be
+managed in TARGET_PAGE_SIZE chunks.
+
+Fixes: CVE-2014-7840
+
+Upstream-Status: Backport
+
+Note: follow-up patches add extra checks on each block->host access.
+
+Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
+Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
+Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
+Signed-off-by: Amit Shah <amit.shah@redhat.com>
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+---
+ arch_init.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/arch_init.c b/arch_init.c
+index 88a5ba0..593a990 100644
+--- a/arch_init.c
++++ b/arch_init.c
+@@ -1006,7 +1006,7 @@ static inline void *host_from_stream_offset(QEMUFile *f,
+     uint8_t len;
+ 
+     if (flags & RAM_SAVE_FLAG_CONTINUE) {
+-        if (!block) {
++        if (!block || block->length <= offset) {
+             error_report("Ack, bad migration stream!");
+             return NULL;
+         }
+@@ -1019,8 +1019,9 @@ static inline void *host_from_stream_offset(QEMUFile *f,
+     id[len] = 0;
+ 
+     QTAILQ_FOREACH(block, &ram_list.blocks, next) {
+-        if (!strncmp(id, block->idstr, sizeof(id)))
++        if (!strncmp(id, block->idstr, sizeof(id)) && block->length > offset) {
+             return memory_region_get_ram_ptr(block->mr) + offset;
++        }
+     }
+ 
+     error_report("Can't find block %s!", id);
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/qemu/qemu_2.1.0.bb b/meta/recipes-devtools/qemu/qemu_2.1.0.bb
index d0ce744..5e5ecf0 100644
--- a/meta/recipes-devtools/qemu/qemu_2.1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.1.0.bb
@@ -8,6 +8,7 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch \
             file://0001-Back-porting-security-fix-CVE-2014-5388.patch \
             file://qemu-CVE-2015-3456.patch \
+            file://CVE-2014-7840.patch \
             "
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
 SRC_URI[md5sum] = "6726977292b448cbc7f89998fac6983b"
-- 
1.9.1


