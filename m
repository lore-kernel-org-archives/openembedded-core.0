Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10CABCCF9F0
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 17:12:59 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web10.3245.1761844368871817557
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Oct 2025 10:12:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Fobmb1X+;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-88f2b29b651so139408585a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 10:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761844368; x=1762449168; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vSuJVmeBAVA4hHnQ1dIB1WHZ1iuEdvy7ZenoNe75gLI=;
        b=Fobmb1X+SEvFERtRnXOeLUVlv6lb3+j2BNGLREhrbravQxupsamyhw3eAizcXy+2F/
         L6QAFR/sUI1ZYQrOVSRPIo0blOYNuQ0dgJ6W2od0BlmEnn9y9Pt3dKxRbEeBck/76KLE
         JnkLda78yWt0QwsISKm4fB+bBLvD4IQ2VwRg8O7gguy9BO3EERbaeNnyCjL9SkiJuc8k
         5j2MAv8FGrJ22a4N9amoS46iIBuRYea6lEABT8ecexHO9nM8n4a46k5OIEsXTAXQsgDc
         77gxkDrA8Nrb+NKYWEtPktdbixK7ARE34YZJH5Ud5arwVE5Ky4atydR1968pcAeBNKnv
         Zb+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761844368; x=1762449168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vSuJVmeBAVA4hHnQ1dIB1WHZ1iuEdvy7ZenoNe75gLI=;
        b=oV7a/HCOWZkXZF+BHxxt5ZLVrMVZmoSmjMd51CL4x7XGFbTmvxdg/141KzquH0nCUm
         bH6G0Ct2uAoZenUtYXdmADWAB+xSdH0q7IIKEsUyHV0Pwm7o+acfL/UQxe2ZnR/LYifH
         YeVn9/yLAUz30gkhn3UhGzJBUh/GrWshDfXexZFmNf4o0ZoAIkyUQ+2/gDMs0PKPIcjZ
         ShPDNS12nYhPzePSn13RzheuKZd2x4EmiCJn6yb6pYAm/HL4VNBNjsbMFJCdflkdUzXm
         /67a46lRw9Mq9CsbC8ut633jFVM/gQJoQOfymNaCDJ6Iu4brW0HLv4Kt976/nPCOvgEe
         W09A==
X-Gm-Message-State: AOJu0Ywg3BvJZekplbPJMOnxgMrtwdsF9ruxSIRo7xCdbzguELrO3IPz
	pCrwC0h7wlE78Jfu6UWCvsqT3f1J+CKUC48pgu8Js+PhZtxeg7ag+EPIXHK5YGXNdgs=
X-Gm-Gg: ASbGncs7ng5QPHCgG1qvCOHYyc9rhJFGs8xtn10r5LqI/Jju3995OK8jBti8c/LmjZ1
	x7gm25zNvn/rqY9aCdVL+ZifwNJuqJPoQ2jeV0KsfGmdkbDVa5sjlZEHtHG/cWP6UKhM7GaeryV
	WMey6/osy8cpM8pS69a56d9z+k0vBpquAOStLD08xKzqONsPGP1PnICkRkOz3T+dd2ACBafDgKt
	vxloZyaN7jRdgL/yRs0hHBSnKJrDLm6AvAHQ66et78QlJbJfm2yugI/6ZBNevHDUNJhallKnVUX
	jyd9x0qMUGC+tGG//8/7YePeZJx/FVeb2vWJm9E4kPAI3ERLlXllpBMYDDx5iktLGOBvD23ElrA
	KoBiYcRED4EBIT74TOuErTshDosHqzwdc6WiflBJSpP0PQC4l+72iyC2YH3XnHNm1ME57tSC0Ky
	jp5AZAPgdI+HYB1qkTAS9PPe7SrKrV3VsIfC5BCk0D3PFXjbP3ir+WGnuDXs/+lWpjgP0FGt0qX
	mCj6/wjv1cFimE=
X-Google-Smtp-Source: AGHT+IFcBoiOwiZ2fK8S+QGQ7R93yUjdrUpV8NT84GBDApKnJEJdt+GA5c21pov8HS57LKn+23hGGQ==
X-Received: by 2002:a05:620a:1994:b0:891:4d1b:dd93 with SMTP id af79cd13be357-8ab9b59c43bmr21459185a.67.1761844367585;
        Thu, 30 Oct 2025 10:12:47 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89f254ab74fsm1279296385a.32.2025.10.30.10.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 10:12:47 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 14/14] yocto-bsp/6.17: introduce kernel bbappend
Date: Thu, 30 Oct 2025 13:12:27 -0400
Message-Id: <dae9a10e74e38d6ff64b8f335f3e65661ba3c7ee.1761844161.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1761844161.git.bruce.ashfield@gmail.com>
References: <cover.1761844161.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 17:12:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225516

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Adding a 6.17 kernel bbappend so the hardware reference BSPs
can be tested against the newer kernel (but it is not the
default)

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../recipes-kernel/linux/linux-yocto_6.17.bbappend    | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.17.bbappend

diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.17.bbappend b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.17.bbappend
new file mode 100644
index 0000000000..51b61b1552
--- /dev/null
+++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.17.bbappend
@@ -0,0 +1,11 @@
+COMPATIBLE_MACHINE:genericarm64 = "genericarm64"
+COMPATIBLE_MACHINE:beaglebone-yocto = "beaglebone-yocto"
+COMPATIBLE_MACHINE:genericx86 = "genericx86"
+COMPATIBLE_MACHINE:genericx86-64 = "genericx86-64"
+
+KMACHINE:beaglebone-yocto ?= "beaglebone"
+KMACHINE:genericx86 ?= "common-pc"
+KMACHINE:genericx86-64 ?= "common-pc-64"
+
+KBRANCH:genericarm64 ?= "v6.16/standard/genericarm64"
+SRCREV_machine:genericarm64 ?= "459fdea93914f4db040bd8ebf8bce134a4cd6388"
-- 
2.39.2


