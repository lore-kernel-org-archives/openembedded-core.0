Return-Path: <sona.sarmadi@enea.com>
Received: from smtp-out10.electric.net (smtp-out10.electric.net
	[185.38.180.46])
	by mail.openembedded.org (Postfix) with ESMTP id 22EC37768B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 11:51:46 +0000 (UTC)
Received: from 1cjlkQ-0000q7-Tq by out10c.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>) id 1cjlkQ-0000qO-V1
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Mar 2017 03:51:46 -0800
Received: by emcmailer; Fri, 03 Mar 2017 03:51:46 -0800
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out10c.electric.net with esmtps (TLSv1:ECDHE-RSA-AES256-SHA:256)
	(Exim 4.87) (envelope-from <sona.sarmadi@enea.com>)
	id 1cjlkQ-0000q7-Tq for openembedded-core@lists.openembedded.org;
	Fri, 03 Mar 2017 03:51:46 -0800
Received: from sestofb11.enea.se (172.21.3.152) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.319.2; Fri, 3 Mar 2017
	12:51:46 +0100
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 3 Mar 2017 12:51:42 +0100
Message-ID: <1488541902-43423-2-git-send-email-sona.sarmadi@enea.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1488541902-43423-1-git-send-email-sona.sarmadi@enea.com>
References: <1488541902-43423-1-git-send-email-sona.sarmadi@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: sona.sarmadi@enea.com does not
	designate permitted sender hosts)
X-Outbound-IP: 192.36.1.72
X-Env-From: sona.sarmadi@enea.com
X-Proto: esmtps
X-Revdns: mx-3.enea.com
X-HELO: mx-3.enea.com
X-TLS: TLSv1:ECDHE-RSA-AES256-SHA:256
X-Authenticated_ID: 
X-PolicySMART: 6551647
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (s)
Subject: [PATCH 2/2] Qemu: display: CVE-2016-9912
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
X-List-Received-Date: Fri, 03 Mar 2017 11:51:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

virtio-gpu: memory leakage when destroying gpu resource

Reference:
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2016-9912

Reference to upstream patch:
http://git.qemu-project.org/?p=qemu.git;a=patch;h=b8e23926c568f2e963af39028b71c472e3023793

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
---
 .../recipes-devtools/qemu/qemu/CVE-2016-9912.patch | 45 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.8.0.bb           |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-9912.patch

diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2016-9912.patch b/meta/recipes-devtools/qemu/qemu/CVE-2016-9912.patch
new file mode 100644
index 0000000..c009ffd
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2016-9912.patch
@@ -0,0 +1,45 @@
+From b8e23926c568f2e963af39028b71c472e3023793 Mon Sep 17 00:00:00 2001
+From: Li Qiang <liq3ea@gmail.com>
+Date: Mon, 28 Nov 2016 21:29:25 -0500
+Subject: [PATCH] virtio-gpu: call cleanup mapping function in resource destroy
+
+If the guest destroy the resource before detach banking, the 'iov'
+and 'addrs' field in resource is not freed thus leading memory
+leak issue. This patch avoid this.
+
+CVE: CVE-2016-9912
+Upstream-Status: Backport
+
+Signed-off-by: Li Qiang <liq3ea@gmail.com>
+Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
+Message-id: 1480386565-10077-1-git-send-email-liq3ea@gmail.com
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+---
+ hw/display/virtio-gpu.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
+index ed2b6d3..6a26258 100644
+--- a/hw/display/virtio-gpu.c
++++ b/hw/display/virtio-gpu.c
+@@ -28,6 +28,8 @@
+ static struct virtio_gpu_simple_resource*
+ virtio_gpu_find_resource(VirtIOGPU *g, uint32_t resource_id);
+ 
++static void virtio_gpu_cleanup_mapping(struct virtio_gpu_simple_resource *res);
++
+ #ifdef CONFIG_VIRGL
+ #include <virglrenderer.h>
+ #define VIRGL(_g, _virgl, _simple, ...)                     \
+@@ -364,6 +366,7 @@ static void virtio_gpu_resource_destroy(VirtIOGPU *g,
+                                         struct virtio_gpu_simple_resource *res)
+ {
+     pixman_image_unref(res->image);
++    virtio_gpu_cleanup_mapping(res);
+     QTAILQ_REMOVE(&g->reslist, res, next);
+     g->hostmem -= res->hostmem;
+     g_free(res);
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/qemu/qemu_2.8.0.bb b/meta/recipes-devtools/qemu/qemu_2.8.0.bb
index 75928c6..d0f9fab 100644
--- a/meta/recipes-devtools/qemu/qemu_2.8.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.8.0.bb
@@ -18,6 +18,7 @@ SRC_URI += " \
             file://0003-Introduce-condition-in-TPM-backend-for-notification.patch \
             file://0004-Add-support-for-VM-suspend-resume-for-TPM-TIS.patch \
             file://CVE-2016-9908.patch \
+            file://CVE-2016-9912.patch \
 "
 
 SRC_URI =+ "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
-- 
2.7.4


