Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F407C44502
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 14:40:28 +0000 (UTC)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.174834.1783435221219175468
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 07:40:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=COMroxfC;
 spf=pass (domain: gmail.com, ip: 209.85.222.42, mailfrom: twoerner@gmail.com)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-9666739d3bcso1283422241.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 07:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783435220; x=1784040020; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y1423Q4uem8lybGYxedJlQHZ60+bsaHr7xCaLtDk4AQ=;
        b=COMroxfCsfGEfJeXvy1/ohiN5tuCCH1QuxT+ryrYpDSHKc6l2JkUnKYE5Rnw2b3qDb
         2wAhkYznZJueK/fx5jmDYtP0itvann55vJZiTTTPlFBlBRSgKzlTrcVXi5m1cmYmrWaH
         GzeNiQGbS8YLafbFMqIvlQKLoSeEIGv5gNsZus1mzKTmZgJxZTgzKRiTogLZ9V5IJFl6
         HJon655Hbta/EdSmejMwm2hBviLLDwZCsx3BpA1s2r6FsV9veu/nxv3xn9lWRrvTgObI
         6JlkA7pT2jAQiE34w3fC3ADaMYpollbMf0EKHRZXtjfo+PXL0zZohWWzs/XMDG5a1QTO
         7NWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435220; x=1784040020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y1423Q4uem8lybGYxedJlQHZ60+bsaHr7xCaLtDk4AQ=;
        b=DCZReZ3wj0BcjAcC9z+R49JsKgCoQnYFOYBdWp++VhniMif1HGgVpFFpH5vMjeC760
         jw9orKkEiiZ7/aAHLRtR3zILDu5O7rH0fyf1t8zScU5p0aJ5Gm+CAHWUwwJOnmcflDg/
         FfJ5ewjTfHovKhCkGeuZeIwVBUSsi7yZMXLHvw8SPx00+j+hlKTQaLOLQd2HESZK8tyz
         rjrc4QUk3M9lxKMTScaYoaR3JuWt+MaHHq5veVBLxYZvxbc0vLOyFpuU+yvcTrYiG0hx
         GymaIiSYuBltCplzSBtjftUyXSKzPsPiDL3epoEKnT4nWLHIJU0UIaxwF6vbmcXrIVRc
         psPA==
X-Gm-Message-State: AOJu0Yx/Qe9ZfWPwhJnVPb2EzObNebSxqM3Q3VW4OExmcLq/LJizLuqW
	rL7PH0A7YWIbZrBX0N7Vy15O1pp68JgV0BD8kRA2qfioiy6BOJhGrWetLqVwl9rC
X-Gm-Gg: AfdE7ck0k2aFt1XYAJyKJpdv07oPPXvmeno+zKy8B1+RdlrrgV73mm2A3vJ4jXQ5U6p
	UCV/4lvVeEiS/ceDc+VT/hahWFVSDj0u/YP3sgoNS6q5ni83bNwKRDbw/WjOF5Iro4la4xXWPNL
	Tn+a/YMQLFZ12eGfTDTZlK9EaDxEAGG3mTIRP64JtOBauw1wu58VIh4taLWU46ZwdRM64v2hG6A
	NYyERPh7sen1yhj5KjoRioiUtuqb/mgcUCt4FHjIuD0CLLr04Z9mMBlH7mwuC/E7VvwPS0fZT8h
	Cw0pDw9aaUxy7TpCGT+Qb+F/SzJqa5ZudGB8QPsWSWDjQUR6EVvldaytTkTCaBj+/WG8HX1tFJK
	kNQwl9yWfcBeINFw50F1BsK9E4nlQ+B3OPwO/mk10j7IfoWltCpScJfagA7HGzNJWDqfbssqQ14
	MyEv2kBaaJqQJg6VEVrkMbVEmlSVAB/ZM69bsBziyyrgfq6ZQKgY/f6fY=
X-Received: by 2002:a05:6122:e44a:b0:5bd:c27a:dafd with SMTP id 71dfb90a1353d-5be89e1543amr2823101e0c.3.1783435219919;
        Tue, 07 Jul 2026 07:40:19 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5be02934c13sm7107780e0c.3.2026.07.07.07.40.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:40:19 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/3] wic: add runtime dependencies on the tools it invokes
Date: Tue,  7 Jul 2026 10:40:07 -0400
Message-ID: <20260707144009.708407-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260707144009.708407-1-twoerner@gmail.com>
References: <20260707144009.708407-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 14:40:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240397

wic shells out to a number of host-side tools to do its work: parted,
mkdosfs, mcopy, the mkfs.* family, sfdisk, e2fsck, resize2fs, debugfs,
blkid and more, depending on the operation and on the partition types
in the image.

None of these are declared as dependencies of wic. For the bitbake
do_image_wic task this is handled by the wic-tools recipe, which builds
the tools into a native sysroot. Wherever else wic is installed as a
package it gets none of them, and its offline lookup (wic ls/cp/write)
resolves each tool over a search path that falls back to the host PATH,
so on a machine that happens to have the tool installed system-wide wic
succeeds while on a machine without it wic fails:

  wic.WicError: Can't find executable 'mcopy'

Falling back to the host is unreliable even when the tool is found: wic
depends on specific minimum versions of some of these tools, and an
arbitrary host copy may be too old, so wic can pick up a tool that does
not behave as it needs. Providing the tools as proper dependencies pins
known-good versions rather than leaving it to whatever the host has.

Add the tools as RDEPENDS so they are installed alongside wic and found
regardless of the host. They are added to the nativesdk variant only,
which is where wic is packaged for use outside a bitbake build; the
native and target variants are unaffected (and wic is not expected on a
target).

resize2fs is named explicitly: e2fsprogs splits it into its own
e2fsprogs-resize2fs package, so nativesdk-e2fsprogs alone does not
provide it, and it is needed by the wic cp/write resize path.

syslinux (with its isohybrid helper) is gated to x86 hosts; cdrtools
(mkisofs) is native-only with no nativesdk variant and is only needed
for ISO images, so it cannot be included here.

AI-Generated: codex/claude-opus 4.8 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-support/wic/wic_0.3.0.bb | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/meta/recipes-support/wic/wic_0.3.0.bb b/meta/recipes-support/wic/wic_0.3.0.bb
index 7dbf84b039a6..2d4d32a6b15d 100644
--- a/meta/recipes-support/wic/wic_0.3.0.bb
+++ b/meta/recipes-support/wic/wic_0.3.0.bb
@@ -17,4 +17,27 @@ RDEPENDS:${PN} += " \
     python3-misc \
     "
 
+# Pull in the tools wic invokes for the nativesdk variant, where wic is
+# packaged for use outside a bitbake build; native and target are
+# unaffected. resize2fs is named explicitly as e2fsprogs splits it into
+# its own package.
+RDEPENDS:${PN}:append:class-nativesdk = " \
+    nativesdk-parted \
+    nativesdk-gptfdisk \
+    nativesdk-dosfstools \
+    nativesdk-mtools \
+    nativesdk-bmaptool \
+    nativesdk-grub \
+    nativesdk-btrfs-tools \
+    nativesdk-squashfs-tools \
+    nativesdk-e2fsprogs \
+    nativesdk-e2fsprogs-resize2fs \
+    nativesdk-util-linux \
+    nativesdk-tar \
+    nativesdk-erofs-utils \
+"
+
+# syslinux (with its isohybrid helper) only builds for x86 hosts.
+RDEPENDS:${PN}:append:class-nativesdk = "${@' nativesdk-syslinux nativesdk-syslinux-misc' if d.getVar('SDK_ARCH') in ['x86_64', 'i686'] else ''}"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.50.0.173.g8b6f19ccfc3a


