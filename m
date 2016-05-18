Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6138A77060
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 04:40:34 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id y7so3864513pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 21:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=DLFB28OtTG8Sr0yURmRTP664BMJ0hIVUSMyNTInY9zU=;
	b=F6BBsLC1uq+2QhzjZEL53Y2Ws/dzt5ROH1V7hDhCUiBJ/v1lWer6SNzIQt9lQNaTbn
	rJ94D10PL/fGLeBw1tS3emlRwWuHVf1TGFdekdCCc9LUwlSjzr3YdIXbEDuoWw7rO1iF
	RwelQVR8NMe453nZFKfdqLCxgLdyZcnmv4Yv6/8QsyzQ8yQ4oK0rDBtlrmNNaMepd6A1
	EzKpRs3JDpJ0vag0EWm3X4WESZxM027Ms94IAhGXBPYjJRNVZsw0ZFrQSOBWwjd7iHbA
	sI9X4K3ppq6VxZ6CmgrZGYkVhnPMBil2gN4ZO3hKzKRyyrMijCnjX1/r3EjtGxHVzAxk
	kiQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=DLFB28OtTG8Sr0yURmRTP664BMJ0hIVUSMyNTInY9zU=;
	b=hl0t6aAwuYx9sf1V0zsaqIFMD+yJM52bPkYZWp0r1nbRXte1TZWJGxTYTXzlxY/YGJ
	L5uOIZX8aSKp9Y/xSDpmUep0rLla1svsgfI9Jf5xilVRR2tIBLNF4ETCmn8FzNeZpkRR
	t9+nPalv7XY2Aq93z1FiwHUJB0f0uIQ7VUXWDqUwQAn/x4Yty6s1x4Ua5O1U+q26Fmcx
	L5/c1msnMNn/8ECJwYUxRj0M+UquRwj9Ch1i/gjE9NNk1fk3THjZIP00hHT4/Esv3VqH
	Yyolv8f7lCu4Xb+e5Ae/KdfrO/7o4FvGcCjjJrCt7W6ovuXCKz4lDjMOmPfQbGEUTYeS
	iK/A==
X-Gm-Message-State: AOPr4FU/BkM5+CQfQUOLQKh7bZ+A0nuZ2vmhGNupjfzOuynfaeEO1U1EtoyfFjfcfdKh5A==
X-Received: by 10.98.0.203 with SMTP id 194mr7691286pfa.126.1463546435966;
	Tue, 17 May 2016 21:40:35 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id e2sm8324447pfd.20.2016.05.17.21.40.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 17 May 2016 21:40:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 May 2016 21:40:23 -0700
Message-Id: <530933a86e6e563c282052b0d6231087afb659b3.1463546289.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <c41bdd4ac5371d7c08318f7c7fc760b44ce59ba9.1463546289.git.raj.khem@gmail.com>
References: <c41bdd4ac5371d7c08318f7c7fc760b44ce59ba9.1463546289.git.raj.khem@gmail.com>
In-Reply-To: <cover.1463546289.git.raj.khem@gmail.com>
References: <cover.1463546289.git.raj.khem@gmail.com>
Cc: Marek Vasut <marex@denx.de>
Subject: [PATCH 4/5] kernel: fitimage: Repair misuse of shell test command
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
X-List-Received-Date: Wed, 18 May 2016 04:40:35 -0000

From: Marek Vasut <marex@denx.de>

The kernel fitImage must be amended with signature if and only if
UBOOT_SIGN_ENABLE = 1 . In the current case, the UBOOT_SIGN_ENABLE
could be either 0 (default) or 1 , which test -n always correctly
interprets as non-empty string, thus always true. This does not
match the logic above though, so replace the test with check which
passed only for UBOOT_SIGN_ENABLE = 1 .

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Yannick Gicquel <yannick.gicquel@iot.bzh>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/kernel-fitimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 809bd4d..298eda2 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -250,7 +250,7 @@ do_assemble_fitimage() {
 		#
 		# Step 5: Sign the image and add public key to U-Boot dtb
 		#
-		if test -n "${UBOOT_SIGN_ENABLE}"; then
+		if [ "x${UBOOT_SIGN_ENABLE}" = "x1" ] ; then
 			uboot-mkimage \
 				${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
 				-F -k "${UBOOT_SIGN_KEYDIR}" \
-- 
2.8.2


