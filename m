Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 177A8FA3740
	for <webhook@archiver.kernel.org>; Tue, 25 Oct 2022 15:35:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.8639.1666712094114451770
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Oct 2022 08:34:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CCC00D6E;
	Tue, 25 Oct 2022 08:34:59 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1F86C3F71A;
	Tue, 25 Oct 2022 08:34:53 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] qemu: backport the fix for CVE-2022-3165
Date: Tue, 25 Oct 2022 16:34:49 +0100
Message-Id: <20221025153449.3755800-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Oct 2022 15:35:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172135

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2022-3165.patch             | 59 +++++++++++++++++++
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-3165.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index 711982ba8d7..55aced9f9a8 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -29,6 +29,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar=
.xz \
            file://0010-hw-pvrdma-Protect-against-buggy-or-malicious-gues=
t-d.patch \
            file://0001-net-tulip-Restrict-DMA-engine-to-memories.patch \
            file://arm-cpreg-fix.patch \
+           file://CVE-2022-3165.patch \
            "
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
=20
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2022-3165.patch b/meta/r=
ecipes-devtools/qemu/qemu/CVE-2022-3165.patch
new file mode 100644
index 00000000000..3b4a6694c26
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2022-3165.patch
@@ -0,0 +1,59 @@
+CVE: CVE-2022-3165
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From d307040b18bfcb1393b910f1bae753d5c12a4dc7 Mon Sep 17 00:00:00 2001
+From: Mauro Matteo Cascella <mcascell@redhat.com>
+Date: Sun, 25 Sep 2022 22:45:11 +0200
+Subject: [PATCH] ui/vnc-clipboard: fix integer underflow in
+ vnc_client_cut_text_ext
+
+Extended ClientCutText messages start with a 4-byte header. If len < 4,
+an integer underflow occurs in vnc_client_cut_text_ext. The result is
+used to decompress data in a while loop in inflate_buffer, leading to
+CPU consumption and denial of service. Prevent this by checking dlen in
+protocol_client_msg.
+
+Fixes: CVE-2022-3165
+Fixes: 0bf41cab93e5 ("ui/vnc: clipboard support")
+Reported-by: TangPeng <tangpeng@qianxin.com>
+Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
+Message-Id: <20220925204511.1103214-1-mcascell@redhat.com>
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+---
+ ui/vnc.c | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/ui/vnc.c b/ui/vnc.c
+index 6a05d06147..acb3629cd8 100644
+--- a/ui/vnc.c
++++ b/ui/vnc.c
+@@ -2442,8 +2442,8 @@ static int protocol_client_msg(VncState *vs, uint8=
_t *data, size_t len)
+         if (len =3D=3D 1) {
+             return 8;
+         }
++        uint32_t dlen =3D abs(read_s32(data, 4));
+         if (len =3D=3D 8) {
+-            uint32_t dlen =3D abs(read_s32(data, 4));
+             if (dlen > (1 << 20)) {
+                 error_report("vnc: client_cut_text msg payload has %u b=
ytes"
+                              " which exceeds our limit of 1MB.", dlen);
+@@ -2456,8 +2456,13 @@ static int protocol_client_msg(VncState *vs, uint=
8_t *data, size_t len)
+         }
+=20
+         if (read_s32(data, 4) < 0) {
+-            vnc_client_cut_text_ext(vs, abs(read_s32(data, 4)),
+-                                    read_u32(data, 8), data + 12);
++            if (dlen < 4) {
++                error_report("vnc: malformed payload (header less than =
4 bytes)"
++                             " in extended clipboard pseudo-encoding.")=
;
++                vnc_client_error(vs);
++                break;
++            }
++            vnc_client_cut_text_ext(vs, dlen, read_u32(data, 8), data +=
 12);
+             break;
+         }
+         vnc_client_cut_text(vs, read_u32(data, 4), data + 8);
+--=20
+GitLab
+
--=20
2.34.1


