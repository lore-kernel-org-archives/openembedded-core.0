Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54C92C4451C
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 13:34:42 +0000 (UTC)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13731.1784295273008890063
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 06:34:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CxfSDfyE;
 spf=pass (domain: gmail.com, ip: 209.85.222.53, mailfrom: twoerner@gmail.com)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-97622cc1f40so3571177241.3
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 06:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784295272; x=1784900072; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bTXYp5YAiFNEVIhcVF0RPuZrSCAr89IdFG3s8yRr8Vs=;
        b=CxfSDfyEfMgWZtSoDd5uxRfZHPPcAss65zQNIcZImuExHJSxUOea8RNhVVoLFrBSw3
         Wdrg5Ne3VtpQ9dtt27kg99rwz5WSyrx40tuBL9sJEyRzaAyr7V8x7RNlsdlYT6BFNl0/
         YWr/H/fBMTIJzDZ/DiKkN10T8Mt39M9xvd/Ep2zR8uIohDvqsmTHJ+9nO3m/1A88csmd
         Lm0OgExUDDYUheLtBS/JJFzFvy1DPrXOF6+xZKr3F9YxqKf+o2NlWJifU/cArs0WIAUG
         7ZDym7aU72z7K7FMt0U9I/jWuzR854VZlQhcGbxPqKhFxh1kHsVGNLIVFMIUzyhWsHWZ
         2icw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784295272; x=1784900072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bTXYp5YAiFNEVIhcVF0RPuZrSCAr89IdFG3s8yRr8Vs=;
        b=QA3Ke5FNxG5UsXRIAxUrbA+66QAq0s4luqROF9Nk5FRJnaqfwyuc/3SG9da7s979tu
         aNBACZJN8onfN0h78VWXMx/AImNNjZiaWepKUmUIfQa2lPYYG+PbZLHRVD2AnEWhMGdU
         IDcLLoJJN5z3NGUSC/mqhGCIoxus5DKPp77yPnx6eMAT9mUETkX/Sv+ksPVIFCM1tkv2
         pg6pgijxykqlJv3ei068/CyH8rA6vQisM7rQ0+44sszZsHgY27+m0i2nXr00zj5rBN7o
         x2GSNMTXky2pINzgCyBoCci/NtMOGclnl90XSE/dfXfzA4FvdFhA2eAH3hXqxhlowovr
         ltQw==
X-Gm-Message-State: AOJu0YzLmBxixZze8YD72eKa3IfsopsmQlxPWQ4aUIwpIYKsVR+TYm0e
	H6woAHYMGZVQqhlH4zxydjJHe7WOzzg2KILxtbEsm6x+EnMDgxAy6DBgu+aiDg==
X-Gm-Gg: AfdE7ckKul8ppK+MAAvhwR7vVPNUL2oeO9redUaxy8I2hOpq7/75UHMfiy2x3ahUKzh
	B59OIfbJ37as6a+TEnagnnFDUDObBp3tgGUtN7ZLIPciYn2ZGq9zIaLJfYE0n78EE99Ni+ijjHa
	eNKbjF/EuG8fuIvHvZGUFV4eLQcl/4f4UvKgFtrMRn+/uXjtvBIOVIgRfS5CGfewKvoCmjRgEAQ
	nfKYufsqVLNnA42dNd+ALIHbRxw9CvO8+rbtex3m++kKUswx+iSl0RWfEdoemVvU/LBqfpoJvDd
	oNBtquQZ7ysOxnSvKPKd93adaA0qSiVOTKJcdrqpNcw2zFgm3yxJgWFKI7KahR84rIFjGbcWfH0
	h8Z4DubruW9i4orMuMbAmZSbhsnRwktqYHrDk3gNkArb/UCcMUjE29VoHPdVF3dQwH+mERt1OP1
	9rvzcAHvNyYS/xgcKKkFN+QCGyIsQWFmGg2W5CDDBbc3Pw
X-Received: by 2002:a05:6102:5694:b0:738:fd01:5b60 with SMTP id ada2fe7eead31-7475343a577mr579077137.3.1784295271756;
        Fri, 17 Jul 2026 06:34:31 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-976fc3688e1sm565059241.3.2026.07.17.06.34.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 06:34:30 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 1/6] wic: add runtime dependencies on the tools it invokes
Date: Fri, 17 Jul 2026 09:34:16 -0400
Message-ID: <20260717133421.3510970-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260717133421.3510970-1-twoerner@gmail.com>
References: <20260717133421.3510970-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 13:34:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241183

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
not behave as it needs. Declaring the tools as dependencies pins
known-good versions instead of trusting whatever the host provides.

Add the tools wic runs as RDEPENDS so they are installed alongside it.
resize2fs is listed on its own because e2fsprogs packages it separately
as e2fsprogs-resize2fs, which e2fsprogs does not pull in, and wic needs
it for the cp/write resize path.

syslinux (with its isohybrid helper) is only available on x86, so it is
gated to those hosts; cdrtools (mkisofs) is native-only with no
nativesdk variant and is only needed for ISO images, so it is not
listed here.

AI-Generated: codex/claude-opus 4.8 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v3:
- list the tools on all variants rather than only the nativesdk variant

changes in v2:
- merge the tool list from the v1 "wic-tools.inc: add" patch into this recipe as RDEPENDS; the separate .inc is dropped
- list the tools inline rather than via a shared WIC_TOOLS variable
- note in the commit log that a host tool may also be the wrong version, not merely absent
---
 meta/recipes-support/wic/wic_0.3.1.bb | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/meta/recipes-support/wic/wic_0.3.1.bb b/meta/recipes-support/wic/wic_0.3.1.bb
index d9b4cc05c4bd..0911a2ae35d7 100644
--- a/meta/recipes-support/wic/wic_0.3.1.bb
+++ b/meta/recipes-support/wic/wic_0.3.1.bb
@@ -17,4 +17,27 @@ RDEPENDS:${PN} += " \
     python3-misc \
     "
 
+# wic shells out to these host-side tools when it runs, so they must be
+# installed alongside it.
+RDEPENDS:${PN} += " \
+    parted \
+    gptfdisk \
+    dosfstools \
+    mtools \
+    bmaptool \
+    grub \
+    btrfs-tools \
+    squashfs-tools \
+    e2fsprogs \
+    e2fsprogs-resize2fs \
+    util-linux \
+    tar \
+    erofs-utils \
+"
+
+# syslinux (with its isohybrid helper) is only available on x86.
+RDEPENDS:${PN}:append:x86 = " syslinux syslinux-misc"
+RDEPENDS:${PN}:append:x86-64 = " syslinux syslinux-misc"
+RDEPENDS:${PN}:append:x86-x32 = " syslinux syslinux-misc"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.50.0.173.g8b6f19ccfc3a


