Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FCF3C4167D
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 14:15:50 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.13267.1668953742754071399
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 06:15:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=CXL6VNwz;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id g10so8405720plo.11
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 06:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CUpmWpWbGv9Fpg6JKxcleBdP8nlg1s+C7jsyM+BD6PE=;
        b=CXL6VNwzJePogM4gUywA2TgArF5zAmkPIEZTL3GNb8sLRxg0HajvbjINBAXhiX/coc
         uhj1wZTNuUVkh/X6+wwRfGKdxjjstYJ9NREEnegE0HSv2vxYMoZba4O6B5ysClNA9op6
         S97sUw3LUbw/n1dtQHwEy6Dpi3c56ZUe3Kkrz/xc9F1xfM9i51io0ZkS44nALCSnzU/P
         m63Lxgs5f6yKhRf70hqyUve8BOTw3E17ymcgN88WGstHHJ8b8+Z3yS2Hze6b64CasNGO
         HD6FIYd7ZJdQa2nusOPDex0lYkZSFhiNRM+eW3akQ7HwHxEVI/VU0rI+ImNEcRkH5y7s
         tzKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CUpmWpWbGv9Fpg6JKxcleBdP8nlg1s+C7jsyM+BD6PE=;
        b=Rk+lzaEhpVkQEelpxcM55RDvN403K+6OXcgco4icD7vxGayo7hFM7F2MM8ko8Udwac
         WO43qOp03X2nwuuipkr1eOqPZbPqtxG02lliubqVA7/UqLEJcUEN6HjCzAyxPqJ6Znif
         DPvWaOtZDg1xIJQwbEtPMEUYggMaOvZEt8+8E2nXmqrRYw5dioPjj+giticsjjdP/3G6
         B97uCgxyl3JMAJSkHOnjKn/noQor8lobvA6cmeCEWG2KDR0DQD2oKf+fzsqfoygWDVQU
         hd69QyZo9YRZL+ykmxrSXTqdzWZZglIZqa9y3ExxLX5FVeoHkUwrT/3na+FlfACVHSdW
         GrPw==
X-Gm-Message-State: ANoB5pmuplGunR+ID9p2iftTyaPED67i6fzVNOtLPTQ8dukYpbaY8g68
	bhujN3GNnPiVtXHtqIbIqUxNmlqJD9L36c1b1v8=
X-Google-Smtp-Source: AA0mqf7bVeiLPNxCiVoFBhdgISw2qg2QvhTAujyXC9IXgnRAfv5/NvZRHWy/f6r8FDGIH6o6ltmDdw==
X-Received: by 2002:a17:903:44e:b0:188:6fca:22b with SMTP id iw14-20020a170903044e00b001886fca022bmr7727148plb.4.1668953741631;
        Sun, 20 Nov 2022 06:15:41 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id x15-20020aa78f0f000000b0056be4dbd4besm6721379pfr.111.2022.11.20.06.15.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 06:15:41 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/35] dbus: fix CVE-2022-42012 dbus-marshal-byteswap: Byte-swap Unix fd indexes if needed
Date: Sun, 20 Nov 2022 04:14:52 -1000
Message-Id: <ad5c72d7f4c5ac2ad84eff8235d87f6c097af386.1668952942.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668952942.git.steve@sakoman.com>
References: <cover.1668952942.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 14:15:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173603

From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>

Backport a patch from upstream [1] to fix CVE-2022-42012
dbus-marshal-byteswap: Byte-swap Unix fd indexes if needed

[1] https://gitlab.freedesktop.org/dbus/dbus/-/commit/3fb065b0752db1e298e4ada52cf4adc414f5e946

Signed-off-by: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...eswap-Byte-swap-Unix-fd-indexes-if-n.patch | 76 +++++++++++++++++++
 meta/recipes-core/dbus/dbus_1.14.0.bb         |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-core/dbus/dbus/0001-dbus-marshal-byteswap-Byte-swap-Unix-fd-indexes-if-n.patch

diff --git a/meta/recipes-core/dbus/dbus/0001-dbus-marshal-byteswap-Byte-swap-Unix-fd-indexes-if-n.patch b/meta/recipes-core/dbus/dbus/0001-dbus-marshal-byteswap-Byte-swap-Unix-fd-indexes-if-n.patch
new file mode 100644
index 0000000000..47f4f1e0d3
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus/0001-dbus-marshal-byteswap-Byte-swap-Unix-fd-indexes-if-n.patch
@@ -0,0 +1,76 @@
+From 3fb065b0752db1e298e4ada52cf4adc414f5e946 Mon Sep 17 00:00:00 2001
+From: Simon McVittie <smcv@collabora.com>
+Date: Fri, 30 Sep 2022 13:46:31 +0100
+Subject: [PATCH] dbus-marshal-byteswap: Byte-swap Unix fd indexes if needed
+
+When a D-Bus message includes attached file descriptors, the body of the
+message contains unsigned 32-bit indexes pointing into an out-of-band
+array of file descriptors. Some D-Bus APIs like GLib's GDBus refer to
+these indexes as "handles" for the associated fds (not to be confused
+with a Windows HANDLE, which is a kernel object).
+
+The assertion message removed by this commit is arguably correct up to
+a point: fd-passing is only reasonable on a local machine, and no known
+operating system allows processes of differing endianness even on a
+multi-endian ARM or PowerPC CPU, so it makes little sense for the sender
+to specify a byte-order that differs from the byte-order of the recipient.
+
+However, this doesn't account for the fact that a malicious sender
+doesn't have to restrict itself to only doing things that make sense.
+On a system with untrusted local users, a message sender could crash
+the system dbus-daemon (a denial of service) by sending a message in
+the opposite endianness that contains handles to file descriptors.
+
+Before this commit, if assertions are enabled, attempting to byteswap
+a fd index would cleanly crash the message recipient with an assertion
+failure. If assertions are disabled, attempting to byteswap a fd index
+would silently do nothing without advancing the pointer p, causing the
+message's type and the pointer into its contents to go out of sync, which
+can result in a subsequent crash (the crash demonstrated by fuzzing was
+a use-after-free, but other failure modes might be possible).
+
+In principle we could resolve this by rejecting wrong-endianness messages
+from a local sender, but it's actually simpler and less code to treat
+wrong-endianness messages as valid and byteswap them.
+
+Thanks: Evgeny Vereshchagin
+Fixes: ba7daa60 "unix-fd: add basic marshalling code for unix fds"
+Resolves: https://gitlab.freedesktop.org/dbus/dbus/-/issues/417
+Resolves: CVE-2022-42012
+
+Upstream-Status: Backport from [https://gitlab.freedesktop.org/dbus/dbus/-/commit/3fb065b0752db1e298e4ada52cf4adc414f5e946]
+
+Signed-off-by: Simon McVittie <smcv@collabora.com>
+(cherry picked from commit 236f16e444e88a984cf12b09225e0f8efa6c5b44)
+Signed-off-by: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
+---
+ dbus/dbus-marshal-byteswap.c | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/dbus/dbus-marshal-byteswap.c b/dbus/dbus-marshal-byteswap.c
+index 27695aaf..7104e9c6 100644
+--- a/dbus/dbus-marshal-byteswap.c
++++ b/dbus/dbus-marshal-byteswap.c
+@@ -61,6 +61,7 @@ byteswap_body_helper (DBusTypeReader       *reader,
+         case DBUS_TYPE_BOOLEAN:
+         case DBUS_TYPE_INT32:
+         case DBUS_TYPE_UINT32:
++        case DBUS_TYPE_UNIX_FD:
+           {
+             p = _DBUS_ALIGN_ADDRESS (p, 4);
+             *((dbus_uint32_t*)p) = DBUS_UINT32_SWAP_LE_BE (*((dbus_uint32_t*)p));
+@@ -188,11 +189,6 @@ byteswap_body_helper (DBusTypeReader       *reader,
+           }
+           break;
+ 
+-        case DBUS_TYPE_UNIX_FD:
+-          /* fds can only be passed on a local machine, so byte order must always match */
+-          _dbus_assert_not_reached("attempted to byteswap unix fds which makes no sense");
+-          break;
+-
+         default:
+           _dbus_assert_not_reached ("invalid typecode in supposedly-validated signature");
+           break;
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/dbus/dbus_1.14.0.bb b/meta/recipes-core/dbus/dbus_1.14.0.bb
index e1efa9e058..484629e987 100644
--- a/meta/recipes-core/dbus/dbus_1.14.0.bb
+++ b/meta/recipes-core/dbus/dbus_1.14.0.bb
@@ -15,6 +15,7 @@ SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.xz \
            file://dbus-1.init \
            file://0001-dbus-marshal-validate-Check-brackets-in-signature-ne.patch \
            file://0001-dbus-marshal-validate-Validate-length-of-arrays-of-f.patch \
+           file://0001-dbus-marshal-byteswap-Byte-swap-Unix-fd-indexes-if-n.patch \
 "
 
 SRC_URI[sha256sum] = "ccd7cce37596e0a19558fd6648d1272ab43f011d80c8635aea8fd0bad58aebd4"
-- 
2.25.1


