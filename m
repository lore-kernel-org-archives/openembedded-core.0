Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D2ACEB64DD
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 14:04:28 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.15688.1691071467528043062
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Aug 2023 07:04:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=RA9vMuag;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-68706b39c4cso672013b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 07:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691071466; x=1691676266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yF1zr5sa5N0F036k4zZOVyE+upJae4T5LkRs704LQxo=;
        b=RA9vMuagyNBH0Xd2uSxGxmTXi40Bhv6BRb+aSjly3QXBANIk139mF+42hpMrqT3VBe
         HhhEbV8cjsabCNcogoJWsd3dS91DqB0Ut4Yft1I/MpkL9TYPSTrIkr5vxkMEk1vOB6xr
         9zPgnkTnNEikLNmvhPPf0JHXPLowEOM5ocAmiwhfNDhAJgyR2GBaUDs1/GEIVYoaV6vD
         k4AS2BXD7yyObxYgr/O+JxfJ0ifAb2n8Y573/bZi4arOk9A8dI/D2trjfwdqoOvZ9IZw
         NsEdyf9ePL3KxolfADrFB3KlTvTUtrU7NIf67lCLKIpjc04FfAF/pjSBeYKKCpcV/ZDk
         QITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691071466; x=1691676266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yF1zr5sa5N0F036k4zZOVyE+upJae4T5LkRs704LQxo=;
        b=gxu8/OReOMF2VmIJgZDLgDxAPJad3ybw92Nbd30W3xNSTpEKsqiAmB1h4vdT7V2Yrh
         y9eqNbMl1trRXZYJ+rCq5ePoSxcedNEH+BqN1b2ilIPxaAk+faifkf5Z+Dkg9hU0IgNU
         q2SU3ifFzZUJyNOsX+xeMj0JM+2kikIIzhxDiGVod3EUJOk4xyFxKyJx9VARuOjOGqlR
         OHWsAiUG7Y5+PXlRWhReloByHGZ55LSCIusryxqLof+/qf2kCrzcW+ou6ClA7zn7KQI8
         LRWJUHtzVAjZUv+Ol3SoSUl/6wdOC9TB2+gHrr2tboNK2VwY+LSvaAeBfogs1MAG1yDa
         3kJA==
X-Gm-Message-State: ABy/qLZMgcyOprLwvzhfmROZeMJ6okjEa3dB9b7lVE5METABnq052E2m
	6EGTNf2mv65Sv0PPAScTTuBMX3UPoumFF47EyQY=
X-Google-Smtp-Source: APBJJlEJlIP8RAadcj1psGFqJNj2jcW0xvTptVQ59l10FMXlygCRhFg/ytJgxOUz4ZZFAnTX7hRFdA==
X-Received: by 2002:a05:6a00:1253:b0:687:4fcf:8fcd with SMTP id u19-20020a056a00125300b006874fcf8fcdmr8214034pfi.18.1691071466382;
        Thu, 03 Aug 2023 07:04:26 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j8-20020aa78d08000000b006828e49c04csm12866242pfe.75.2023.08.03.07.04.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 07:04:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/10] qemu: fix CVE-2023-3301
Date: Thu,  3 Aug 2023 04:04:07 -1000
Message-Id: <f549ff6db018f66a80fc65987675e8bb6afcd002.1691071255.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691071255.git.steve@sakoman.com>
References: <cover.1691071255.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 14:04:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185482

From: Archana Polampalli <archana.polampalli@windriver.com>

qemu: hotplug/hotunplug mlx vdpa device to the occupied addr port,
then qemu core dump occurs after shutdown guest

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-3301

Upstream patches:
https://gitlab.com/qemu-project/qemu/-/commit/a0d7215e339b61c7d7a7b3fcf754954d80d93eb8

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2023-3301.patch             | 60 +++++++++++++++++++
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-3301.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index c6c6e49ebf..d5d210194b 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -94,6 +94,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0001-hw-display-qxl-Have-qxl_log_command-Return-early-if-.patch \
            file://0001-hw-display-qxl-Pass-requested-buffer-size-to-qxl_phy.patch \
            file://CVE-2023-0330.patch \
+           file://CVE-2023-3301.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-3301.patch b/meta/recipes-devtools/qemu/qemu/CVE-2023-3301.patch
new file mode 100644
index 0000000000..ffb5cd3861
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2023-3301.patch
@@ -0,0 +1,60 @@
+From a0d7215e339b61c7d7a7b3fcf754954d80d93eb8 Mon Sep 17 00:00:00 2001
+From: Ani Sinha <anisinha@redhat.com>
+Date: Mon, 19 Jun 2023 12:22:09 +0530
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
+Upstream-Status: Backport [https://github.com/qemu/qemu/commit/a0d7215e339b61c7d7a7b3fcf754954d80d93eb8]
+CVE: CVE-2023-3301
+
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ net/vhost-vdpa.c |    8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+--- a/net/vhost-vdpa.c
++++ b/net/vhost-vdpa.c
+@@ -140,6 +140,14 @@ static void vhost_vdpa_cleanup(NetClient
+ {
+     VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
+
++    /*
++     * If a peer NIC is attached, do not cleanup anything.
++     * Cleanup will happen as a part of qemu_cleanup() -> net_cleanup()
++     * when the guest is shutting down.
++     */
++    if (nc->peer && nc->peer->info->type == NET_CLIENT_DRIVER_NIC) {
++        return;
++    }
+     if (s->vhost_net) {
+         vhost_net_cleanup(s->vhost_net);
+         g_free(s->vhost_net);
-- 
2.34.1


