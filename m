Return-Path: <sona.sarmadi@enea.com>
Received: from smtp-out11.electric.net (smtp-out11.electric.net
	[185.38.181.34])
	by mail.openembedded.org (Postfix) with ESMTP id E46D177685
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 11:51:45 +0000 (UTC)
Received: from 1cjlkQ-0006G6-T5 by out11c.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>) id 1cjlkQ-0006Gv-Th
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Mar 2017 03:51:46 -0800
Received: by emcmailer; Fri, 03 Mar 2017 03:51:46 -0800
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out11c.electric.net with esmtps (TLSv1:ECDHE-RSA-AES256-SHA:256)
	(Exim 4.87) (envelope-from <sona.sarmadi@enea.com>)
	id 1cjlkQ-0006G6-T5 for openembedded-core@lists.openembedded.org;
	Fri, 03 Mar 2017 03:51:46 -0800
Received: from sestofb11.enea.se (172.21.3.152) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.319.2; Fri, 3 Mar 2017
	12:51:45 +0100
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 3 Mar 2017 12:51:41 +0100
Message-ID: <1488541902-43423-1-git-send-email-sona.sarmadi@enea.com>
X-Mailer: git-send-email 2.7.4
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
Subject: [PATCH 1/2] Qemu: display: CVE-2016-9908
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

virtio-gpu: information leakage in virgl_cmd_get_capset

References:
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2016-9908

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
---
 .../recipes-devtools/qemu/qemu/CVE-2016-9908.patch | 44 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.8.0.bb           |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-9908.patch

diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2016-9908.patch b/meta/recipes-devtools/qemu/qemu/CVE-2016-9908.patch
new file mode 100644
index 0000000..e0f7a1a
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2016-9908.patch
@@ -0,0 +1,44 @@
+From 7139ccbc907441337b4b59cde2c5b5a54cb5b2cc Mon Sep 17 00:00:00 2001
+From: Sona Sarmadi <sona.sarmadi@enea.com>
+
+virtio-gpu: fix information leak in capset get dispatch
+
+In virgl_cmd_get_capset function, it uses g_malloc to allocate
+a response struct to the guest. As the 'resp'struct hasn't been full
+initialized it will lead the 'resp->padding' field to the guest.
+Use g_malloc0 to avoid this.
+
+Signed-off-by: Li Qiang <liqiang6-s@360.cn>
+Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
+Message-id: 58188cae.4a6ec20a.3d2d1.aff2@mx.google.com
+
+[Sona: backported from master to v2.8.0 and resolved conflict]
+
+Reference to upstream patch:
+http://git.qemu-project.org/?p=qemu.git;a=commit;h=85d9d044471f93c48c5c396f7e217b4ef12f69f8
+
+CVE: CVE-2016-9908
+Upstream-Status: Backport
+
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+---
+ hw/display/virtio-gpu-3d.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/hw/display/virtio-gpu-3d.c b/hw/display/virtio-gpu-3d.c
+index 23f39de..d98b140 100644
+--- a/hw/display/virtio-gpu-3d.c
++++ b/hw/display/virtio-gpu-3d.c
+@@ -371,7 +371,7 @@ static void virgl_cmd_get_capset(VirtIOGPU *g,
+ 
+     virgl_renderer_get_cap_set(gc.capset_id, &max_ver,
+                                &max_size);
+-    resp = g_malloc(sizeof(*resp) + max_size);
++    resp = g_malloc0(sizeof(*resp) + max_size);
+ 
+     resp->hdr.type = VIRTIO_GPU_RESP_OK_CAPSET;
+     virgl_renderer_fill_caps(gc.capset_id,
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/qemu/qemu_2.8.0.bb b/meta/recipes-devtools/qemu/qemu_2.8.0.bb
index ce475e0..75928c6 100644
--- a/meta/recipes-devtools/qemu/qemu_2.8.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.8.0.bb
@@ -17,6 +17,7 @@ SRC_URI += " \
             file://0002-Introduce-condition-to-notify-waiters-of-completed-c.patch \
             file://0003-Introduce-condition-in-TPM-backend-for-notification.patch \
             file://0004-Add-support-for-VM-suspend-resume-for-TPM-TIS.patch \
+            file://CVE-2016-9908.patch \
 "
 
 SRC_URI =+ "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
-- 
2.7.4


