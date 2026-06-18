Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 091AFCD98ED
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 08:51:44 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14947.1781772699822542984
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 01:51:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VeSq231e;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490afc47455so2110305e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 01:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781772698; x=1782377498; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZIPimf3cir6O082W/SjckgZm5du6WEN/7MdC+/pd6lI=;
        b=VeSq231e/52xqwAtOcVTTwR1P98BVeUGaSadTsatdsex+LbA/CYWFpUb82Jrc5ynu3
         Cy1VusaXRUw8C4GbAw4lX6e6klWlPighKL9d8r1cOPtYHtQtjIlwtGM+xRZRxmBbWRf2
         SzgkA+cjv3z57OBwJS0DRxUQr+B2iRkYbYIgc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781772698; x=1782377498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZIPimf3cir6O082W/SjckgZm5du6WEN/7MdC+/pd6lI=;
        b=Yjj//ejG28zPlRdUEkpoE3LsHS2HdbNOObzz5Et/mDrPojdgXAyY4gRrzQupENK6/d
         LKG9RinAkxtAPpQX/SRJL48PI67pWisXaYht6LneyvCINEF5vf3WEmULfgEhITvFEu7N
         Qur4UgShKAVUhAaz8bUGh4gWgJSUmVPC0rO9Yh+RdWVbruiaPqU2dxt7Rq4e2rp+UiFS
         +bts3lpvzU915a+/MzFW6CFbRJ6LyL2GESFp/pAZl5BblHfbjNrDzpPtNU1KY6URzi9Z
         z8wRlzIDshZ1mTxkebnrxaFEA8DflQ2vocqUgNjKfZlMTRVFDJ/Tg0mWBCiTM80NYFxN
         xdiA==
X-Gm-Message-State: AOJu0YztpBGz5soCp1STJTPU1fhyOgOhuu9yvTs0ZAnAtzGXxA8EUcjM
	cPA53CPdr/8Q9PQsfKr/PQJnQm/g/Shsvye8DKWIQTGL7LVvy5ti7bas7RUK92qE5KdLxdBq368
	lX5D/
X-Gm-Gg: AfdE7cnTwNf8voK0EMWCXkC4rvefBwfPs9hvntiihXn6Y85ah+1mCi6lAkVQbh/dG3K
	c0UMJZ8UOYD42uSFdRvD/m1RPtkglZUF+qHG6k+Lm+NeqiVpJeBKzvJeOsdRDyz0EmtHpJ0x55M
	om46pBoARowHnAav2QRsaAWIori5aAi4EZOQmLt4VlnGA4XRhd8IBN71/BTYO10CxLmArPqLrwD
	3aOFvyFirnXNlENwuQw+MgBLIhPvElPGgiJRmchhzo0B9VIokAIljFHO9uDXIXGEVR43q2tzjYx
	LH+N3/eECW89zHIFwML+dH3GZAdI6XyOT7heDXWe3isRKQqE2dbFvGGEqodOP7IGD2JWn6g8XX8
	PJNMXbfuzd5ggejgBymOzAtSKxI9l73q+PF9k1GfXp88M7WSuZXL7ziMoGimzROI2ShLM8w/Yvo
	ro26k9GxYBN7qwzCHAGosYUeBcpCMhqx0F4Lbe4u0Rpw==
X-Received: by 2002:a05:600c:1554:b0:490:688b:f9f8 with SMTP id 5b1f17b1804b1-4923a9dda73mr16798805e9.27.1781772697948;
        Thu, 18 Jun 2026 01:51:37 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:70bd:e97f:6372:90f9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa8b423sm227634535e9.11.2026.06.18.01.51.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 01:51:36 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] README: Merge OE-Core and QEMU READMEs into one
Date: Thu, 18 Jun 2026 09:51:33 +0100
Message-ID: <20260618085133.3756278-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260618085133.3756278-1-richard.purdie@linuxfoundation.org>
References: <20260618085133.3756278-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 08:51:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239069

OE-Core originally had separate READMEs due to the layout with Poky. This
reason no longer exists and we can merge things into one README now which
should make the contribution information easier to find for users.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 README.OE-Core.md | 36 ------------------------------
 README.md         | 57 ++++++++++++++++++++++++++++++++++++++++++++++-
 README.qemu.md    | 19 ----------------
 3 files changed, 56 insertions(+), 56 deletions(-)
 delete mode 100644 README.OE-Core.md
 mode change 120000 => 100644 README.md
 delete mode 100644 README.qemu.md

diff --git a/README.OE-Core.md b/README.OE-Core.md
deleted file mode 100644
index 4804e436322..00000000000
--- a/README.OE-Core.md
+++ /dev/null
@@ -1,36 +0,0 @@
-OpenEmbedded-Core
-=================
-
-OpenEmbedded-Core is a layer containing the core metadata for current versions
-of OpenEmbedded. It is distro-less (can build a functional image with
-DISTRO = "nodistro") and contains only emulated machine support.
-
-For information about OpenEmbedded, see the OpenEmbedded website:
-<https://www.openembedded.org/>
-
-The Yocto Project has extensive documentation about OE including a reference manual
-which can be found at:
-<https://docs.yoctoproject.org/>
-
-Contributing
-------------
-
-Please refer to our contributor guide here: <https://docs.yoctoproject.org/dev/contributor-guide/>
-for full details on how to submit changes.
-
-For any files containing sorted lists (such as recipe maintainers), please ensure
-alphabetical order is maintained using the C locale. For example, use:
-`LC_ALL=C sort` to sort the list.
-
-As a quick guide, patches should be sent to openembedded-core@lists.openembedded.org
-The git command to do that would be:
-
-```
-git send-email -M -1 --to openembedded-core@lists.openembedded.org
-```
-
-Mailing list:
-<https://lists.openembedded.org/g/openembedded-core>
-
-Source code:
-<https://git.openembedded.org/openembedded-core/>
diff --git a/README.md b/README.md
deleted file mode 120000
index 4d7e9e8b429..00000000000
--- a/README.md
+++ /dev/null
@@ -1 +0,0 @@
-README.OE-Core.md
\ No newline at end of file
diff --git a/README.md b/README.md
new file mode 100644
index 00000000000..92373e4a047
--- /dev/null
+++ b/README.md
@@ -0,0 +1,56 @@
+OpenEmbedded-Core
+=================
+
+OpenEmbedded-Core is a layer containing the core metadata for current versions
+of OpenEmbedded. It is distro-less (can build a functional image with
+DISTRO = "nodistro") and contains only emulated machine support.
+
+For information about OpenEmbedded, see the OpenEmbedded website:
+<https://www.openembedded.org/>
+
+The Yocto Project has extensive documentation about OE including a reference manual
+which can be found at:
+<https://docs.yoctoproject.org/>
+
+Contributing
+------------
+
+Please refer to our contributor guide here: <https://docs.yoctoproject.org/dev/contributor-guide/>
+for full details on how to submit changes.
+
+For any files containing sorted lists (such as recipe maintainers), please ensure
+alphabetical order is maintained using the C locale. For example, use:
+`LC_ALL=C sort` to sort the list.
+
+As a quick guide, patches should be sent to openembedded-core@lists.openembedded.org
+The git command to do that would be:
+
+```
+git send-email -M -1 --to openembedded-core@lists.openembedded.org
+```
+
+Mailing list:
+<https://lists.openembedded.org/g/openembedded-core>
+
+Source code:
+<https://git.openembedded.org/openembedded-core/>
+
+QEMU Emulation Targets
+======================
+
+To simplify development, the build system supports building images to
+work with the QEMU emulator in system emulation mode and these machines are
+the ones included in OE-Core. Our support and testing is currently focused
+around the following primary architectures and machine targets:
+
+* ARM (qemuarm + qemuarm64)
+* x86 (qemux86 + qemux86-64)
+* RISC-V (qemuriscv64)
+
+Use of the QEMU images is covered in the Yocto Project Reference Manual.
+The appropriate MACHINE variable value corresponding to the target is given
+in brackets.
+
+OpenEmbedded does also have support for PowerPC (qemuppc/qemuppc64), MIPS
+(qemumips + qemumips64), qemuriscv32 and other less common targets but these
+are not as widely tested.
diff --git a/README.qemu.md b/README.qemu.md
deleted file mode 100644
index bdd44082882..00000000000
--- a/README.qemu.md
+++ /dev/null
@@ -1,19 +0,0 @@
-QEMU Emulation Targets
-======================
-
-To simplify development, the build system supports building images to
-work with the QEMU emulator in system emulation mode. Our support and testing
-is currently focused around the following primary architectures and machine
-targets:
-
-* ARM (qemuarm + qemuarm64)
-* x86 (qemux86 + qemux86-64)
-* RISC-V (qemuriscv64)
-
-Use of the QEMU images is covered in the Yocto Project Reference Manual.
-The appropriate MACHINE variable value corresponding to the target is given
-in brackets.
-
-OpenEmbedded does also have support for PowerPC (qemuppc/qemuppc64), MIPS
-(qemumips + qemumips64), qemuriscv32 and other less common targets but these
-are not as widely tested.

