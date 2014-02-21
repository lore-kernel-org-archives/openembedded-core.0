Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-la0-f41.google.com (mail-la0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id 8CFF860B9B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2014 21:59:27 +0000 (UTC)
Received: by mail-la0-f41.google.com with SMTP id mc6so2894465lab.28
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2014 13:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=K0PBCmjKuOlFOCuzTGkJP7J2S/onzT3MO3EF951tRrM=;
	b=RCfQH9zR3kJvbAJFBIGwKyB+2vb63Xq9XiaMHX8B0a2MY1u/y3nsbtpywGuuMsKRAE
	Mjsmw7csNJ8iAYuC83uz1j7Ng4ujcH7nRFzg1Bc5DWjKVV06Sihzi91I72vUw2MeOpwo
	KzK3tpmgxzZLkS6kjXmI9Q2ggxr8fN1deM2lJ1RiNK5uHUTZ/PwM+JCF/U8Qmj7hpCXm
	HyWM1vVv07NYvEUWEGZsA3PUEn1fGsuqWxKnQRNBU1UlCKsPzGcKFZ5hIH1Dp7fv1dIk
	Xps88DigX+yylsQHLUsNCrDOAU0dqq5k2uqt28duVP1H73uNeH54xhEDKQgAYSv1JsZX
	t/TQ==
X-Received: by 10.113.5.167 with SMTP id cn7mr5133783lbd.1.1393019968331;
	Fri, 21 Feb 2014 13:59:28 -0800 (PST)
Received: from localhost (c-5eeaaa31-74736162.cust.telenor.se. [94.234.170.49])
	by mx.google.com with ESMTPSA id jt7sm4208941lbc.15.2014.02.21.13.59.26
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 21 Feb 2014 13:59:26 -0800 (PST)
Received: by localhost (Postfix, from userid 1000)
	id 803F1B437FC; Fri, 21 Feb 2014 22:59:24 +0100 (CET)
From: =?UTF-8?q?David=20Nystr=C3=B6m?= <david.c.nystrom@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Feb 2014 22:59:23 +0100
Message-Id: <1393019963-15170-1-git-send-email-david.c.nystrom@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1392991017-3524-1-git-send-email-david.c.nystrom@gmail.com>
References: <1392991017-3524-1-git-send-email-david.c.nystrom@gmail.com>
MIME-Version: 1.0
Subject: [PATCHv2] x246: Disable Altivec asm when SPE is enabled.
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
X-List-Received-Date: Fri, 21 Feb 2014 21:59:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

asm code is written for Altivec, and should be disabled
for powerpc SPE enabled targets.

Signed-off-by: David Nyström <david.c.nystrom@gmail.com>
---
 meta/recipes-multimedia/x264/x264_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
index 5ebf885..0e305ea 100644
--- a/meta/recipes-multimedia/x264/x264_git.bb
+++ b/meta/recipes-multimedia/x264/x264_git.bb
@@ -23,6 +23,7 @@ inherit lib_package pkgconfig
 X264_DISABLE_ASM = ""
 X264_DISABLE_ASM_armv4 = "--disable-asm"
 X264_DISABLE_ASM_armv5 = "--disable-asm"
+X264_DISABLE_ASM_powerpc = "${@bb.utils.contains("TUNE_FEATURES", "spe", "--disable-asm", "", d)}"
 
 EXTRA_OECONF = '--prefix=${prefix} \
                 --host=${HOST_SYS} \
-- 
1.8.3.2


