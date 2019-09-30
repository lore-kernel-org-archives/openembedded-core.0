Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id DA85E7F314
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 04:48:46 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id z12so6656841pgp.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 21:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=lCBKbWUFJIOrnu+WKYCKahEqjudh4oxB2UPMI5TBMTE=;
	b=Yryk4AZDmG/rFegNjkjAByBHh5gWMQsiFk64eP5uBK+YG/hBkn50Mj70x+wPu/OXJj
	cQqOnHl6MTeD47/Uae3JLAt0rfHr+nz90j02PrWkYDCxZ1pmj9qkd6wTVeo7VjcHfT4c
	z+p7tE1/8rByueYhze/xKRFdnAy1jJI5ztkfaNVHe+VA4DL7I1b/pkhhKiJx5/Dq9pl3
	oFR+1syHHpaXRELF3v+Tqkvoqf0vMEE9xnwYkA698VoMGjyMTmfDtMeXaEgSxXYoxhNT
	tfpBb+5GpMKOjRW7XE8QbLIP8VhfHbSfRSXoaKlWvTHZQUutD3LOreggpB7TCt8+YSda
	CCAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=lCBKbWUFJIOrnu+WKYCKahEqjudh4oxB2UPMI5TBMTE=;
	b=HHMR4eonNKkW3sqAHYXht4rucM9X0CWeqp32nENgYm9nbaj0sJwFmv+OeA/ZkvmN/0
	mZfGYCTVwFoiLSxLMuhEkC0J7BqCjnWSszWaqei6kpJ6SDt4a3UP3ZuqHD3jYyBe1IWo
	+eOJpO+3Y8jof0IF3fJ3iX+PBcJWf6tNF5M9GEMy631SzHRKzTyUc8TIBQa64xSRpSR2
	Vs8fcfqxA51cnH8PtmJu9LeyS6p5y7Tx6CQNRVzpWPBGWFBfUPZ5KGBR6fGkcvawWyG7
	uHoP8XnRJdjgQNiVUqFPgf9MzKWsmrg2AEGohQe8KJveU90DlQ+VcI//uooYKqsLyJdJ
	J/pw==
X-Gm-Message-State: APjAAAUixy3KjZjWHFJnDwYWyDX7FtWZXTx2cFyErGnFINRtt9SCt2Jz
	CdqDOjhmyhF5GHe8qDK3im2EuKCfdq4=
X-Google-Smtp-Source: APXvYqzcRvTZ0gN4TJdLQkhTbWyUYmW6KXpeZaTB4MLKWxG/bkTD3AqvaPjKZrGvePaHDlpAlOXeug==
X-Received: by 2002:a63:e5c:: with SMTP id 28mr22217100pgo.133.1569818927780; 
	Sun, 29 Sep 2019 21:48:47 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:edf9:811d:ad92:85c2])
	by smtp.gmail.com with ESMTPSA id
	h15sm18888493pgn.76.2019.09.29.21.48.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Sep 2019 21:48:47 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Sep 2019 21:47:48 -0700
Message-Id: <91c42f92cd978a922fff87cb1d0f358c7d9747ea.1569818533.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569818533.git.akuster808@gmail.com>
References: <cover.1569818533.git.akuster808@gmail.com>
Subject: [warrior-next 53/54] kernel-uboot: compress arm64 kernels
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
X-List-Received-Date: Mon, 30 Sep 2019 04:48:47 -0000

From: "Bedel, Alban" <alban.bedel@aerq.com>

AArch64 images are not self-decompressing, thus usually much larger.
Boot times can be reduced by compressing them in FIT and uImages.

This commit is a backport of commit a725d188b5 (kernel-uboot: compress
arm64 kernels) and commit 60bc7e180e (kernel-uboot: remove useless
special casing of arm64 Image) from master. Both commit were melted
into one to avoid some useless churn.

Signed-off-by: Alban Bedel <alban.bedel@aerq.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/kernel-uboot.bbclass | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/classes/kernel-uboot.bbclass b/meta/classes/kernel-uboot.bbclass
index 2364053..87f0265 100644
--- a/meta/classes/kernel-uboot.bbclass
+++ b/meta/classes/kernel-uboot.bbclass
@@ -3,10 +3,6 @@ uboot_prep_kimage() {
 		vmlinux_path="arch/${ARCH}/boot/compressed/vmlinux"
 		linux_suffix=""
 		linux_comp="none"
-	elif [ -e arch/${ARCH}/boot/Image ] ; then
-		vmlinux_path="vmlinux"
-		linux_suffix=""
-		linux_comp="none"
 	elif [ -e arch/${ARCH}/boot/vmlinuz.bin ]; then
 		rm -f linux.bin
 		cp -l arch/${ARCH}/boot/vmlinuz.bin linux.bin
-- 
2.7.4


