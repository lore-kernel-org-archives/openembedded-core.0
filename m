Return-Path: <rsangam@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49865CA5FA5
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 06:34:03 +0000 (UTC)
Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5341.1790836442310255293
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 23:34:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=HBB1Oe+t;
 spf=pass (domain: mvista.com, ip: 74.125.229.170, mailfrom: rsangam@mvista.com)
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144f47a9b57so5748871c88.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 23:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1790836442; x=1791441242; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lxs+tGvyXBL+anJ9wW+N0x1PnQwwK885CujAt7UNqhc=;
        b=HBB1Oe+tzs5fLhFWquTHlW0ZA9aia4GBdMHpoxHIq+f9FS9s4gKw39wC6LzZuTMO6j
         hYBWF3sZCsWyRBjRwe2+U7/cz+xh8/B1Opg5YAQ8aeUOCaumPj/8pVe/upr06jIpfvaw
         PptakgLiLcBRDQvOFpyf+zv9u9nEh+xJFSfrE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790836442; x=1791441242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lxs+tGvyXBL+anJ9wW+N0x1PnQwwK885CujAt7UNqhc=;
        b=It8O+BI5KFnQXB8cLfuiwerYHmmHCtCmJS//sWgGtkXo2mE5KfCtZNuWxgUKUOm1Oy
         /9j275qWSgl59l+AbI0QEM5yWZECSAYTrOVM1Hs2j5/v4y4tV/f6P84Tdfln6eWDVLLf
         RyG6jfxOYvdwHVjIdnfAWbQ/dKLy52vCbx7IuWzgWwdLaveOn6z9S5hkFg+FkHoJyO2P
         hiCgjfIDE4EUxuEWNIkElPsGsrWMJ2PW2M8/K0LYn9E/vxOqz3XRkPYzZJ+tn+2m0GdT
         pEXx8le8UYUEx2ML/Oy8cW9HGbc47sXy1enb5vF1AZTgJWMhsMp3/ZNgxdoxlx212Xbb
         VEbQ==
X-Gm-Message-State: AFuF++mpGip+3pPMDPtNXXYFWh6X7XvUQuqWkn5IrZTm25H/H0B3Uvwp
	3Xi+jvXd5Du5Pokd3V6suZ036XrdcHxTeYNRg4oBuG3lFxS5KX+unWekKJ1STuI5y+GMW2P6Ln+
	egfxsGIY=
X-Gm-Gg: AYBFou1lSsX8RYuJ9iNLX0D6Qn1YPdUa2MUscOxCAX633YPEv7Tsy0VCzOvpSaUAq00
	JHmz5T2CiNUEX8CB+9ljYNPK8WvXjIaw+pR33KGwqXIAiL4j8HjC6mXTL3c2hz2m6uQxPXD+RNt
	xITnw3hDqnDZMD0W6rtTUU2BguRpurZKy+goDRBM+GIyoKYh6pDpPVwL6VmhbmZWwSGK6eLy4e0
	TicqbwZ17Z3a0v5Sfx9YtKRIM0I8qj8O5PHXAzATClBF+q8sHlwhd3tjmiGnIphoC9H/Zmxo+sV
	cETe/5EJoJ9VeapC3RlRfa+/fB3rOLX1WAV8+Z5E/OPVPGq0pgXcZRcsLz1KhIWW6+D0eEe2g7y
	UQVq/ScNTh8slGAXYzGLbTQjIWwhvoMGRvvOWr4L1IlJh5Ln7jvygGDQJkzNBPRk5wnLjQt22Jw
	tm8rS/irI3XBIXHIumssge3L9+tuXAaX0nFnhFtcn/cnp8EJERuB+eePrjHxPllB+NJKDheU6of
	S4nUkDizg==
X-Received: by 2002:a05:701b:4346:b0:14b:2ef:9821 with SMTP id a92af1059eb24-14d2f7e7562mr3081027c88.3.1790836441451;
        Wed, 30 Sep 2026 23:34:01 -0700 (PDT)
Received: from MVIN00040.mvista.com ([2405:201:d00d:4190:5808:c9ae:f27d:522])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14df48c45cdsm3385816c88.16.2026.09.30.23.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 23:34:00 -0700 (PDT)
From: Rohini Sangam <rsangam@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Rohini Sangam <rsangam@mvista.com>
Subject: [OE-core][scarthgap][PATCH] gstreamer1.0-plugins-bad: Security fix for CVE-2026-3082
Date: Thu,  1 Oct 2026 12:03:53 +0530
Message-Id: <20261001063353.102615-1-rsangam@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 06:34:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247013

Pick patch from [1] also mentioned at Debian tracker in [2]

[1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/83e9225bb9e89948e7b1c9f37ef9218d2dcde354
[2] https://security-tracker.debian.org/tracker/CVE-2026-3082

Signed-off-by: Rohini Sangam <rsangam@mvista.com>
---
 .../CVE-2026-3082.patch                       | 46 +++++++++++++++++++
 .../gstreamer1.0-plugins-bad_1.22.12.bb       |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2026-3082.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2026-3082.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2026-3082.patch
new file mode 100644
index 0000000000..26e27ee5f5
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2026-3082.patch
@@ -0,0 +1,46 @@
+From 83e9225bb9e89948e7b1c9f37ef9218d2dcde354 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?V=C3=ADctor=20Manuel=20J=C3=A1quez=20Leal?=
+ <vjaquez@igalia.com>
+Date: Wed, 11 Feb 2026 22:07:49 +0100
+Subject: [PATCH] libs: jpegparser: boundary checks before copying it
+
+READ_BYTES macro reads data from a byte reader and then copy it to a storage
+variable. This patch adds a validation that the length to read cannot be bigger
+than the storage size.
+
+This macro right now is used only for storage variables of guint8 arrays.
+
+We have validated in the specification (sections F.1.2.1.2 and F.1.2.2.1 in ITU
+T.81) that Huffman tables (both AC and DC) aren't bigger than 256.
+
+Fixes SA-2026-0003, CVE-2026-3082, ZDI-CAN-28840.
+
+Fixes: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4899>
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/10946>
+
+CVE: CVE-2026-3082
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/83e9225bb9e89948e7b1c9f37ef9218d2dcde354]
+
+Signed-off-by: Rohini Sangam <rsangam@mvista.com>
+---
+ gst-libs/gst/codecparsers/gstjpegparser.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/gst-libs/gst/codecparsers/gstjpegparser.c b/gst-libs/gst/codecparsers/gstjpegparser.c
+index 6411076..86125b3 100644
+--- a/gst-libs/gst/codecparsers/gstjpegparser.c
++++ b/gst-libs/gst/codecparsers/gstjpegparser.c
+@@ -79,6 +79,10 @@ ensure_debug_category (void)
+ 
+ #define READ_BYTES(reader, buf, length) G_STMT_START {          \
+     const guint8 *vals;                                         \
++    if (length > sizeof (buf)) {                                \
++      GST_WARNING ("data size is bigger than its storage");     \
++      goto failed;                                              \
++    }                                                           \
+     if (!gst_byte_reader_get_data (reader, length, &vals)) {    \
+       GST_WARNING ("failed to read bytes, size:%d", length);    \
+       goto failed;                                              \
+-- 
+2.44.4
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.12.bb
index f6d0711bd8..64e0aa6dcb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.12.bb
@@ -12,6 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0005-v4l2codecs-Always-chain-up-to-parent-decide_allocati.patch \
            file://CVE-2025-3887-1.patch \
            file://CVE-2025-3887-2.patch \
+           file://CVE-2026-3082.patch \
            "
 SRC_URI[sha256sum] = "388b4c4412f42e36a38b17cc34119bc11879bd4d9fbd4ff6d03b2c7fc6b4d494"
 
-- 
2.34.1


