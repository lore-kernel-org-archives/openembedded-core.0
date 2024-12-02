Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A2AAE69E9C
	for <webhook@archiver.kernel.org>; Mon,  2 Dec 2024 23:39:39 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web11.7443.1733182777034584244
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Dec 2024 15:39:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=BJm5trDp;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20241202233934ed11ba3290eb30fd01-0qwmx_@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20241202233934ed11ba3290eb30fd01
        for <openembedded-core@lists.openembedded.org>;
        Tue, 03 Dec 2024 00:39:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=BgQXLA69WCpbdfIuLM4Ptwa0ab8nqszX7fUkFFbFQHk=;
 b=BJm5trDp+GXrJz0A1V9Fs+VaHibRbVXY4ST9bl9Bomgg73iaB6kQy/qNSfXfpYparHTDRJ
 xuIai3qM/06pYMyWUtA0CIMhrrgjiLIMFo4VM1Wf3C3WA90OzBt9tD2L8AhFKqIzOP7/Wd6X
 Z6nJOl9nGiH1G/1tJ6PH8hQV6MCjh6IVNKnmvfge+MXku44NQWF4KoIubwDO0MzZdL89wCNb
 ji+ngy+ujlYrEvhtAwLVog4GiqLAUn7zP5UVEBwCw+E6bqobIEus4JYZhfAa5qZLclF+Kt4Z
 2j133gC1wbcSCzbTwgEw+JxkZd15Ux2tzw3Sbl4/gfZ7CS1vr5c6HIHA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] qemu: patch CVE-2024-6505
Date: Tue,  3 Dec 2024 00:38:44 +0100
Message-Id: <20241202233844.2808663-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 23:39:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208164

From: Peter Marko <peter.marko@siemens.com>

Backport patch [3] as linked from [1] via [2].

[1] https://nvd.nist.gov/vuln/detail/CVE-2024-6505
[2] https://bugzilla.redhat.com/show_bug.cgi?id=2295760
[3] https://gitlab.com/qemu-project/qemu/-/commit/f1595ceb

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2024-6505.patch             | 40 +++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-6505.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index e9f63b9eaf..f07869cc4d 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -52,6 +52,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0001-target-riscv-kvm-change-KVM_REG_RISCV_FP_F-to-u32.patch \
            file://0002-target-riscv-kvm-change-KVM_REG_RISCV_FP_D-to-u64.patch \
            file://0003-target-riscv-kvm-change-timer-regs-size-to-u64.patch \
+           file://CVE-2024-6505.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-6505.patch b/meta/recipes-devtools/qemu/qemu/CVE-2024-6505.patch
new file mode 100644
index 0000000000..fbb7ad31b2
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2024-6505.patch
@@ -0,0 +1,40 @@
+From f1595ceb9aad36a6c1da95bcb77ab9509b38822d Mon Sep 17 00:00:00 2001
+From: Akihiko Odaki <akihiko.odaki@daynix.com>
+Date: Mon, 1 Jul 2024 20:58:04 +0900
+Subject: [PATCH] virtio-net: Ensure queue index fits with RSS
+
+Ensure the queue index points to a valid queue when software RSS
+enabled. The new calculation matches with the behavior of Linux's TAP
+device with the RSS eBPF program.
+
+Fixes: 4474e37a5b3a ("virtio-net: implement RX RSS processing")
+Reported-by: Zhibin Hu <huzhibin5@huawei.com>
+Cc: qemu-stable@nongnu.org
+Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
+Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+
+CVE: CVE-2024-6505
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/f1595ceb9aad36a6c1da95bcb77ab9509b38822d]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ hw/net/virtio-net.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
+index 8f30972708..5635620a31 100644
+--- a/hw/net/virtio-net.c
++++ b/hw/net/virtio-net.c
+@@ -1909,7 +1909,8 @@ static ssize_t virtio_net_receive_rcu(NetClientState *nc, const uint8_t *buf,
+     if (!no_rss && n->rss_data.enabled && n->rss_data.enabled_software_rss) {
+         int index = virtio_net_process_rss(nc, buf, size);
+         if (index >= 0) {
+-            NetClientState *nc2 = qemu_get_subqueue(n->nic, index);
++            NetClientState *nc2 =
++                qemu_get_subqueue(n->nic, index % n->curr_queue_pairs);
+             return virtio_net_receive_rcu(nc2, buf, size, true);
+         }
+     }
+-- 
+2.30.2
+
-- 
2.30.2


