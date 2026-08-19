Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C54ACC5DF8D
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 15:58:02 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10419.1787155077556251588
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 08:57:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=hznhUBMj;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4799b3f7c83so775705f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 08:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787155076; x=1787759876; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FQBSjT3UfPZYzd9GSETT8WOCf9LYB8xINzjQypcO3z0=;
        b=hznhUBMjfLqayPcwJrR60jIDl3azU6YnkpVS9GyE/MhP7TF491Gd5W4thpI8u849yB
         kueaTNW1Nn/LTGHO5D8G9uN/HLV5NASf3A8yPTTMDYwhVEhHlXeU2OvAsJT9PNlmlviZ
         NbX1Sn6Y1aN8zdKikn+Eg6roOXqECQ3dVuuiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787155076; x=1787759876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FQBSjT3UfPZYzd9GSETT8WOCf9LYB8xINzjQypcO3z0=;
        b=K18YRQmN/plO540xXWzx/vt22woNClCuLvpqwPuBO2PGry0yPipjvUM4TFsnFCYwoM
         A12bbV0oZByuSkH5Qe3FvRt+laQRlFUIYjophGrXiApdpS6ORAYhZ6OZBAlItvcvLCyf
         4DoZXZJ+2RngAqdWihxqKtYD4wXOax6l8OqzzPbgkWzI0ti5EJCdTLgDuCxQ5WRjOUrT
         ddHlDlQLNOpWNrKNDsMr3CHzMG9H2e2r/TvPVp38JQtow/f3wrnB4CbCCf800EXMEROS
         YnUO8CpKcnNsHbVGpDFpp40GfO9DGLb3jbbChRkfvdj8jqonbg/ljWt+aoTE1IeJimye
         QTLA==
X-Gm-Message-State: AFuF++nKA9Z3/SqKj0vG6DxAjSKpyCFAhV0LicPdb0uYbeqch/PHdgyb
	glqYyzYoef5ShLSLY6fgXHifdq41GVyn9xz6bh0EUGpgmBwZlrAU1ihCgS7hh3hdqceOpAIcnuh
	fy/A+VIE=
X-Gm-Gg: AR+sD12b62z0gs8Kb4GvnJZ58Q1yKxHlRIrw7UhKCJlUQns/uUuV9be21/x4c1Phfb+
	liNfBSePAH16KthmHdGmJuGQmgCcaQXUtsmqK6n9DSoAYAlGJc3xosL4nSzFb5OWQTUKnrBYoLo
	ZrhbtI+znCLdguP/WV85gisxeBsXOG7nHnDeVUFUCuNE1MfVAFFRyw6OYwTeY2rVXjZ3etQk8ca
	wOOR0NYQeZ+BgePYFBss1Ft0yT2uh1+R1lKWMpPXHpScP5PuME+Zz6xI9XPDvIb1YmHsmitOHSD
	LzKFKDzSPuozOw1p820K7D6P4nkrBxZFMjwcO51Qil46bnQtm5zsAKqOKxlht3exnCCldPYXrJD
	bFDs0wEsUr7ZNmnG47ehs2a4laBIn8kMT7vXSE6BsVCTe/AOs20judxByDd/CsDsi+N7nwmOpZu
	SBmD5f/Do9NrskPSnD5FAYM9/xUCPaZDtzjslC3cctXE5SZoUUX4b8vLsC4ZlMUWM15ZP+geOKr
	COY/O6lHkebHEkk8Xjx8cbc9GD4raNsCalnxUHKFUseVbOubGUWqs3td3P5PWu0Ek29MNJRmMjo
	6uIXVx2JgMe5FX2A8SZmvdnnUULjP+0g7wFUS97W
X-Received: by 2002:adf:e19c:0:b0:47f:eb4b:75f4 with SMTP id ffacd0b85a97d-482b1fed35amr10588722f8f.21.1787155075639;
        Wed, 19 Aug 2026 08:57:55 -0700 (PDT)
Received: from FRSMI25-GIGUE (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm7215698f8f.35.2026.08.19.08.57.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:57:55 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 29/37] perf: drop newt from tui build requirements
Date: Wed, 19 Aug 2026 17:57:00 +0200
Message-ID: <f8b756a847ea20ff29306385cae78b4dda03c9ce.1787154074.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787154074.git.fabien.thomas@smile.fr>
References: <cover.1787154074.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 15:58:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243765

From: Alexander Kanavin <alex@linutronix.de>

As the comment says this was used by very old kernels
(pre 3.10), and slang has been the only option for a
long time. Also, correct the option to disable slang TUI.

(From OE-Core rev: 9a9d894ddcb619a86d63b25cf7d3f4cb2cf3a5a8)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a36a84490b943e6f0638c0430ad1eac7740e9be3)
Signed-off-by: Shinu Chandran <shinucha@cisco.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 meta/recipes-kernel/perf/perf.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 2d432f3f40f..a4bc3c1319f 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -14,10 +14,7 @@ PACKAGECONFIG ??= "python tui libunwind libtraceevent"
 PACKAGECONFIG[dwarf] = ",NO_DWARF=1"
 PACKAGECONFIG[perl] = ",NO_LIBPERL=1,perl"
 PACKAGECONFIG[python] = ",NO_LIBPYTHON=1,python3 python3-setuptools-native"
-# gui support was added with kernel 3.6.35
-# since 3.10 libnewt was replaced by slang
-# to cover a wide range of kernel we add both dependencies
-PACKAGECONFIG[tui] = ",NO_NEWT=1,libnewt slang"
+PACKAGECONFIG[tui] = ",NO_SLANG=1,slang"
 PACKAGECONFIG[libunwind] = ",NO_LIBUNWIND=1 NO_LIBDW_DWARF_UNWIND=1,libunwind"
 PACKAGECONFIG[libnuma] = ",NO_LIBNUMA=1"
 PACKAGECONFIG[bfd] = ",NO_LIBBFD=1"

