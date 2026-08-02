Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F393C55184
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 10:29:07 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21180.1785666545211013341
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 03:29:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FWNCSzYE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4980dc26022so5706015e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 03:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785666543; x=1786271343; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vqnrJlw+XNLZWtCYjz19Ps/HDwMSUWNsbciWs14/N8g=;
        b=FWNCSzYE63AsuyQOGYwG6TeQoST+IqrjDDXQx+sG9mvfpltWhsrc1gqk/Cot7yXaGj
         qVzaSo5YbyEaWPI2YubCiuF55ErdQsqfD2JU0iz+dpusRoB4Hoq2/457vb0JEW4tbNm8
         OXM5j9VnG6+6Ucd9UwdLHjGnT/Zp2K7jqDFB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785666543; x=1786271343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vqnrJlw+XNLZWtCYjz19Ps/HDwMSUWNsbciWs14/N8g=;
        b=NxAYRLQQEHZJJF0dlreKnZwcfGcSVEfo3KlorFZmcV4EZcK1haCnuaZuh+KZqAmrqk
         hSPFICUVz53FOnxGd2Uz0SxHfXZVtmJmNH8x8gWqukfFdVvQjcoNc1MC3CoETpAgTGTr
         AaIMGFwNGGSP3fwy1lrBXln3iNr+TFF7Nj6Vz7srbq1094BVUBdHtqQBg3opyuk3d4lN
         8FI1GeZ0g0tub1/ypXo+rEnVDPvzs5JTfs3ri9pbSJlQQq/XggQdQpnCZ9ZhyrZpZyTP
         zzqv1pbHc1mRFRYP0sFcFRIDjK4Ox9g/O9v2LFmZK4thBLF2ScNnwbtirSmBp9onQ7JL
         Cz0A==
X-Gm-Message-State: AOJu0Yw6U8D+pyACQ6bKx+MuWq8V1UKZ9J6ODDd3dfaMfeseND1mY3nn
	Ug/6yy2UeJ9xkFIsEunOrd2hdVNwQJVi8aKiQz1cyi1Pg4X6wWPZwGqzT8bAJNebODbScaaSm59
	M5B7B3q8=
X-Gm-Gg: AR+sD13w+Y1MjK89oDg+NoUDJr0cuZhSo17+02jpzfE1D3zSo5Cg9ZD72W7+Zk/cGaI
	5f3mJvsdhpxb2TnDBepfHHVv3SG4QfbsCVcAwSo7Mlhe1ISyHxa1w4Vq+ZmNgAWXCJaRZC5rUcA
	pOmrk+4ZW/RAp4ccUpJ9pk/C68wl+VWlnmnznfzEPmEDHVQDdirSvVfrpzEU4I5+IRNa4RlCekV
	n8eiVLuAwC73/cXnKGhE6B/7SiTleyyY7Z7ugdPlX/eiYu80g6nJP5Wp4bDfZSwTr4N9wH95akw
	hItsyCoLg1IMk+pxrPbJuiS3+Nv350zVhn+64naZIc/DnojyUWLsbFkvyzB16KC37JcrF4fG0dZ
	m1t4Q9vZOHED3nDhPxmZ0ZJRDfPbZmL+QaYCMdGPSWT6vSLDmyq7iNmTJgH8vz7QneimOvOfBSW
	HZ0bReVGKY9KbOqz3azBBl3kBWau55QmQ/CIqwR3JJHqDJo13iuHDUb9O5ALqKb9nTNHXwmQ/sB
	Fs30YtE6H3p4HoLpw==
X-Received: by 2002:a05:600c:4e86:b0:493:e460:1f6 with SMTP id 5b1f17b1804b1-4980c5ec7a1mr104889265e9.0.1785666543510;
        Sun, 02 Aug 2026 03:29:03 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:11e3:e7fc:e526:8a64])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b8d04fsm167140375e9.3.2026.08.02.03.29.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 03:29:02 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/25] kernel-arch: Don't export UBOOT_ARCH
Date: Sun,  2 Aug 2026 11:28:36 +0100
Message-ID: <20260802102854.3952760-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260802102854.3952760-1-richard.purdie@linuxfoundation.org>
References: <20260802102854.3952760-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 10:29:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242532

I think only our code uses this variable. For that we don't need to export
to the environment, so stop doing it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/kernel-arch.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-arch.bbclass b/meta/classes-recipe/kernel-arch.bbclass
index fd6bce11460..bc90e2e840b 100644
--- a/meta/classes-recipe/kernel-arch.bbclass
+++ b/meta/classes-recipe/kernel-arch.bbclass
@@ -8,7 +8,7 @@
 # modules). return value must match one of the architecture directories
 # in the kernel source "arch" directory
 export ARCH = "${@oe.kernel.map_kernel_arch(d)}"
-export UBOOT_ARCH = "${@oe.kernel.map_uboot_arch(d)}"
+UBOOT_ARCH = "${@oe.kernel.map_uboot_arch(d)}"
 
 # Set TARGET_??_KERNEL_ARCH in the machine .conf to set architecture
 # specific options necessary for building the kernel and modules.

