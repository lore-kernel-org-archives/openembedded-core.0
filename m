Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id DD8C17D787
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 23:12:56 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id n25so4319341wmk.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 16:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SNnhmq4X0Drzi7DmKKmRI8qghcxieh8VWjAcK9RuTEQ=;
	b=AyYn7K1szRbOyEQcfeom8qcLtUp04UQaLiKHVGRsN+nui8Qr58nC9Vf8lIIfjzNQJH
	rF/V8TAhQ9AsMTYTSMa+UCUusZ4DdcAQgJPwwMcLvtGipPwvXjvOVKHN7zC6EO0aTEu2
	EoU/oC+7lcLUnZRDfTl3XD/ZhyelwsIxzJO0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SNnhmq4X0Drzi7DmKKmRI8qghcxieh8VWjAcK9RuTEQ=;
	b=pjsZuAU/dCZbGkZxQxUKcptmGKZbX3EveumhwjPUBi3n7+qnY6L35plIdZhYf7Ucx6
	EVCo29Mn7ff8FZvkHvnx9urWmR1Q1P1Oe9Zj8MGb0Zm4gkscz0p4Pg9ikkBCRUOvlnpY
	6d053LrqYTMCTo8HxbRRNBMj75a1T0MIxb40HMso491v2lCWKHGql2P5XLDf4+zi152I
	Y1deMwv1Vw0F95nfBaZRBejSt3e/WiU1tya7XLiBMkX3WlB3rG3Oimcj5kL2coX+QR6r
	YfCIJTXHvAGE5OwvWuKrTR0vk7AYA9caOM7J7EabuBBpQiT74gPfP6hA+yTsvsU3FU8R
	/QRg==
X-Gm-Message-State: APjAAAW4FMGMBFrDbyQYVeDvDvCDA81A+dCtgjHgy/2Jfqq1YyPdMGa7
	v8IGKwDCF3suLOSmSw8tfIcYeQ1LPsE=
X-Google-Smtp-Source: APXvYqylrRPvov92UMwOBVKx2+CwsqLHFTIJfZ1IKwSPRGoQOx/30bxodIOwPfZwNHcLMmBdJoykeA==
X-Received: by 2002:a1c:9d8f:: with SMTP id g137mr4598956wme.26.1554937977279; 
	Wed, 10 Apr 2019 16:12:57 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a17sm2614031wmg.40.2019.04.10.16.12.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Apr 2019 16:12:56 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Apr 2019 00:12:54 +0100
Message-Id: <20190410231254.25763-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] pseudo: Update to gain key bugfixes
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
X-List-Received-Date: Wed, 10 Apr 2019 23:12:57 -0000
Content-Transfer-Encoding: 8bit

Newer distros are using new versions of glibc and coreutils which use the new glibc
renameat2 function. We need to intercept this for correct functioning of pseudo. This
is essential to ensure new distros continue to work with the project.

Also, this version has a fix for path/inode cross corruption problems which
may explain our mysterious locale permissions issues.

Many thanks to Otavio and Peter Seebach for the help in figuring this out and
fixing it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 79e0b6bd21a..64b3832ca4d 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo \
            file://toomanyfiles.patch \
            "
 
-SRCREV = "6294b344e5140f5467e6860f45a174440015304e"
+SRCREV = "6ebc7d6bc8ab973d0ba949eeb363821811ce8dc5"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.20.1


