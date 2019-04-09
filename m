Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id D6FBA7D6C5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Apr 2019 15:37:59 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id k64so5611530itb.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2019 08:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=BHsB05HycljoGSwJA8qAktKNhzu2us2EpVGiwhR5hWo=;
	b=PwtVdTBLp8DfRV8ijO5IH+JPhd1zOg0gCGoMngoYX4Y1r8No2p8HvSGohmAVqlxsjx
	y86FcfEXyLTQC+ga5FrPGMoFMmTBu5HQP3E4IH7a6wv+SDHkaoLrvV3lCITE7OEo5ps4
	X/l5zFohQeg235eH7Nck3YIwNE8cKipCN+DWPidiCCqOCK0ljccUzLlTrjau1PMI+qin
	eeL7GG3jENMxOV/Qn+BxYjTvCdqyvjbaGlmntokpqD9Y+TeL0DBX5z6D1QLTkaim3IX5
	ZsCuwMq3dEJX2xLHhM72sM2mTAGF3HI6zVLk3z3dQQMYoOTSE8WDdCHlKdRqhBSRQrPm
	GVvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=BHsB05HycljoGSwJA8qAktKNhzu2us2EpVGiwhR5hWo=;
	b=JRoEXvOD9ce8V7bV7rYXNTvdOgIsbBfTBec677TQdtmv8K+CjqfjYLAtP0tx0E+nfK
	D7fZ7KdXZwd4CmWfkr5bFhcWxgBv8u9Eo9t7ByaNj8LQRaIu7pKEtDTo2MlA1Qlr1Nkd
	rcKeP5QSDOo0E6M98vNHaDkjlRD+rD2/9coS4o3qTFyb9jDVjakVnKGLomiZPwBYq+QW
	WnTwz3jan469Ar84Z/Y1si77peGvPGYJoQKjWWa80Q+ytpBTKkFrf9BJPviLSm4ypEg5
	jgcLrFQxI8oi3MNg8mIstIdUZsoJZYD3FpLGx7PJKoFgB9V/RiGdXWtr3Dov5bby3Zwg
	aSNQ==
X-Gm-Message-State: APjAAAUzq8K/gxiQdSj0csEDAnfNPBtADTcuoDzgssu4Cf1eDljnEC+E
	dOY3PT8mIHiLcFb922PWtD8=
X-Google-Smtp-Source: APXvYqwjTR0iEW+XAecIFzXGklh5tNAcowC23dFNzI/5xPYuQHq2l5UQEP0Gbqc5dP0m9UsrpYI3yw==
X-Received: by 2002:a24:334c:: with SMTP id k73mr25074194itk.60.1554824280740; 
	Tue, 09 Apr 2019 08:38:00 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	y24sm12376510iol.8.2019.04.09.08.37.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Apr 2019 08:38:00 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Tue,  9 Apr 2019 11:37:51 -0400
Message-Id: <a8dbaa661656b6f064a0df8925f75a474210f0a8.1554824014.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1554824014.git.bruce.ashfield@gmail.com>
References: <cover.1554824014.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/7] linux-yocto-rt/4.19: fix duplicate TIF_NEED_RESCHED_LAZY
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Apr 2019 15:38:00 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating Kevin's patch that cleans up a build warning:

    x86: Drop the duplicate define of TIF_NEED_RESCHED_LAZY

    The two merge commits 107b161b1cbaf ("Merge branch 'v4.19/standard/base'
    into v4.19/standard/preempt-rt/base") and dc37b7080cd55 ("Merge tag
    'v4.19.8' into linux-4.19.y-rt") almost have the same content, but
    introduce two define of TIF_NEED_RESCHED_LAZY for x86 arch. Drop one of
    them to fix the build warning.

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
index 7f1640d43f..26c11def0d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "2c6e44e476bd297d65d5cb1b5f5538d303fc05a0"
+SRCREV_machine ?= "eac4b8fe170fc8745377cb37c5433db69356d6d8"
 SRCREV_meta ?= "d85f07e03c980eca5ffd5ba058985d6ed3a83801"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-- 
2.19.1


