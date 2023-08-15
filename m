Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 652B3C04A6A
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 16:24:43 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.138746.1692116676649156544
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 09:24:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=l/6h6j7M;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-565ea1088fbso288904a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 09:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692116676; x=1692721476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kd5/4Gii4fKggO40vUUcpzB2IO/ooxDe5ueWG+FKb9Q=;
        b=l/6h6j7MTX4P3ewTU6lpSyFTUJB5NaSxD/SoQa6DWnfSJlQlV1kBUFvs4UjJeKeOPs
         agnj/7CPADLkZ/yT75b76o9zIMGQynr6eJfGu58GetY3D9hM8/EwFqjKHH2HLJetUrWN
         FKeVBaWMiL5zf6DDCVNm8VNeJqrnqjDqfaqWyeWe4fBNlZNzqMVeuGwI04LMYBrk2ZB3
         W2x5EFGhtS3fXszw8g5FTUTfzkh0zJuXXp1uRlP+wcDnuaIUNmT1YTTp0a5tac1rhKVf
         gQt0kXWWpIq/ncBvSUNPisIcy8nRh1mype2gdoSm7GAkL+KVwGsNcs2BWYOlJ1OPLKWv
         ybQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692116676; x=1692721476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kd5/4Gii4fKggO40vUUcpzB2IO/ooxDe5ueWG+FKb9Q=;
        b=VBaM4IoYAlCLlkPL8F2S99PNgYnrTrpvy9+ufM51njW8hhu1n8NkSfs6mEhKGOrBF/
         31rw5JKzgrYufGpxZZk5hQbeWmhN4YG3/Xd408LQZOFvljsPlHZJ9Zarb/QbviojR3XT
         cRgbiqHdeFTmmEExerqFUrvsw/XSdiUWOpsBD8JdFuAQF0dMeyy0LXBat0xEVl3A2YxE
         gvGxg+A3AECaea9mLFaaBq2H6/RS0Rp6BPemKz2mp6RMeILf+Zq0OT5C2Gv8+Wv1RbjQ
         DhbMzfQvH0zgi6PMU8Z8+T2tL7ByYkBcDbhWvkYe0qRBFqGb6Lwh6ZJQi4WN4qmckl4a
         7Wwg==
X-Gm-Message-State: AOJu0YxxCkV7Dr/2ODanKtsN+MLpuXNG/pUpiiYTWzhp2ZT/3BM+gHEy
	4QpP6JPJ4StnusXYFy7B6O0sgHvbU0D2G/I49DA=
X-Google-Smtp-Source: AGHT+IGMI+GOx01CPBwIDFiKerpIKfm/8P2y0CxL96axrNXwYMEi2yFJqtGx8AX3cO2JJnO+jcAfsw==
X-Received: by 2002:a17:90a:e38f:b0:262:d6cb:3567 with SMTP id b15-20020a17090ae38f00b00262d6cb3567mr11447801pjz.26.1692116675629;
        Tue, 15 Aug 2023 09:24:35 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id ij13-20020a170902ab4d00b001b02bd00c61sm11414623plb.237.2023.08.15.09.24.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 09:24:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 01/18] qemu: fix CVE-2023-3301
Date: Tue, 15 Aug 2023 06:24:10 -1000
Message-Id: <82bf6c4cba88dc9f25caf14d60e79ce0c366919c.1692116535.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692116535.git.steve@sakoman.com>
References: <cover.1692116535.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 16:24:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186080

From: Yogita Urade <yogita.urade@windriver.com>

qemu: hotplug/hotunplug mlx vdpa device to the occupied addr port,
then qemu core dump occurs after shutdown guest

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2023-3301

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2023-3301.patch             | 65 +++++++++++++++++++
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-3301.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 15eba6163f..c1ac245f9f 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -37,6 +37,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://qemu-guest-agent.udev \
            file://ppc.patch \
 	   file://CVE-2023-0330.patch \
+	   file://CVE-2023-3301.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-3301.patch b/meta/recipes-devtools/qemu/qemu/CVE-2023-3301.patch
new file mode 100644
index 0000000000..977f017ed2
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2023-3301.patch
@@ -0,0 +1,65 @@
+From a0d7215e339b61c7d7a7b3fcf754954d80d93eb8 Sep 17 00:00:00 2001
+From: Ani Sinha <anisinha@redhat.com>
+Date: Wed, 2 Aug 2023 09:25:27 +0000
+Subject: [PATCH] vhost-vdpa: do not cleanup the vdpa/vhost-net structures if
+ peer nic is present
+
+When a peer nic is still attached to the vdpa backend, it is too early to free
+up the vhost-net and vdpa structures. If these structures are freed here, then
+QEMU crashes when the guest is being shut down. The following call chain
+would result in an assertion failure since the pointer returned from
+vhost_vdpa_get_vhost_net() would be NULL:
+
+do_vm_stop() -> vm_state_notify() -> virtio_set_status() ->
+virtio_net_vhost_status() -> get_vhost_net().
+
+Therefore, we defer freeing up the structures until at guest shutdown
+time when qemu_cleanup() calls net_cleanup() which then calls
+qemu_del_net_client() which would eventually call vhost_vdpa_cleanup()
+again to free up the structures. This time, the loop in net_cleanup()
+ensures that vhost_vdpa_cleanup() will be called one last time when
+all the peer nics are detached and freed.
+
+All unit tests pass with this change.
+
+CC: imammedo@redhat.com
+CC: jusual@redhat.com
+CC: mst@redhat.com
+Fixes: CVE-2023-3301
+Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=2128929
+Signed-off-by: Ani Sinha <anisinha@redhat.com>
+Message-Id: <20230619065209.442185-1-anisinha@redhat.com>
+Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
+
+CVE: CVE-2023-3301
+
+Upstream-Status: Backport [https://github.com/qemu/qemu/commit/a0d7215e339b61c7d7a7b3fcf754954d80d93eb8]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ net/vhost-vdpa.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
+index 2b4b85d8f..8dbe929c1 100644
+--- a/net/vhost-vdpa.c
++++ b/net/vhost-vdpa.c
+@@ -158,6 +158,15 @@ err_init:
+ static void vhost_vdpa_cleanup(NetClientState *nc)
+ {
+     VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
++
++    /*
++     * If a peer NIC is attached, do not cleanup anything.
++     * Cleanup will happen as a part of qemu_cleanup() -> net_cleanup()
++     * when the guest is shutting down.
++     */
++    if (nc->peer && nc->peer->info->type == NET_CLIENT_DRIVER_NIC) {
++	return;
++    }
+     struct vhost_dev *dev = &s->vhost_net->dev;
+
+     qemu_vfree(s->cvq_cmd_out_buffer);
+--
+2.40.0
-- 
2.34.1


