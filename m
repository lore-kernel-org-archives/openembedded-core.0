Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5974171BEE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 21:39:15 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id s198so1660996pgs.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 13:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=7EHDCwp9hvp11D4FcHFWqxi4ZjybJTnQ2ShQ17w5QcY=;
	b=icQRfvwSloN00gUYoa5lA0sHDDbW5PLv83mb/O6MlbIae671BS8JZR0iNqMiIp+Zxl
	tCpwM97gdkK5XyOv9UBp+feTDFGu2NPjWdTG2kYCd2eyUCRMbpn1UmLT1IdllE5oEZQO
	d1l1DYlErKURS8faLz5PNoXoenV5624WNxLyDJCZMN6QIzo4k+HjYhFvM30RKDcT/wtZ
	LMCbzPalQ9+/Cnd7fytzcFrWZUlB3N4EJk56y6uqcuyYG+Z/yrJ8ZRX5ASoc8dlRGPK+
	aoYI8PjBOnQKOgMemt3rV8TS7OjKwp9YLzcKuWW7lksoiPCHT5XWubJnTDF4EQkWZ6v7
	+Aug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=7EHDCwp9hvp11D4FcHFWqxi4ZjybJTnQ2ShQ17w5QcY=;
	b=KGowNFDh3tPk8bmv1b34c4lZlszY73Q+wrrrQiuaxybLkmAqXWdltcEpYt6aCrmFg6
	7w/w2Oo1sR7Z0Zv3ADruRLmUYXCJMFDJXy2l30BrNA6rNZtnMCQsQOQ3JRMgKTtHVEzQ
	r01M3lEOUN8YvSB1tXIgO8jUFS8lOqQEiVSuNXvfx8Xm/9MLLsanfWPnd76Azqey16gg
	uvkv5FlFvMFFsg3R52RCOuhzSVFxb9GGUFRvSt05OZmeii39zUHDTIDwuiQX6UMsKGSC
	aRhJ60bugDkhuao0Yzv6KtzLvN73oY4a1vtH5gZo9hBHhq46Q5OtZUki5Gsz2eWOkSDp
	eUtQ==
X-Gm-Message-State: AA+aEWbVmKt9YlW11kGhJ8A1cc2UhvdKIIoLwVL5V78hBPVsByL9MmU5
	+OV95zSu7jpvamdmpspAXX0gxTzS
X-Google-Smtp-Source: AFSGD/W2pR9mNF5D8LVR127uhlQlaGcHDErLAqCTGiWuLe5y30bry/JkE/uCKF3f3L2LFzTRZ12trg==
X-Received: by 2002:a63:a112:: with SMTP id b18mr408554pgf.440.1544737156241; 
	Thu, 13 Dec 2018 13:39:16 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:79af:1f36:1822:3801])
	by smtp.gmail.com with ESMTPSA id
	b9sm3288912pfi.118.2018.12.13.13.39.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Dec 2018 13:39:15 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Thu, 13 Dec 2018 13:38:21 -0800
Message-Id: <f93254c594512204d643ee20a967ce2a4f552637.1544735897.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1544735897.git.akuster808@gmail.com>
References: <cover.1544735897.git.akuster808@gmail.com>
Subject: [PATCH 13/45] oeqa/selftest/buildoptions: Improve ccache test
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
X-List-Received-Date: Thu, 13 Dec 2018 21:39:15 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This test occisionally fails as m4 doesn't recompile, meaning the logfile test
then doesn't find mention of ccache.

To ensure m4 does recompile, clean m4 before force compiling it.

(Reading the test is confusing due to the test cleanup also involving a clean)

(From OE-Core rev: 6e0b9214a0d57ed45a5df0ba5c9887a9045b89b1)

(From OE-Core rev: b729a46820cce38b3d500271df19bdaf31973140)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/buildoptions.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa/selftest/cases/buildoptions.py
index 406b7e8..c406e95 100644
--- a/meta/lib/oeqa/selftest/cases/buildoptions.py
+++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
@@ -38,6 +38,7 @@ class ImageOptionsTests(OESelftestTestCase):
         self.assertTrue(os.path.isfile(p), msg = "No ccache found (%s)" % p)
         self.write_config('INHERIT += "ccache"')
         self.add_command_to_tearDown('bitbake -c clean m4')
+        bitbake("m4 -c clean")
         bitbake("m4 -f -c compile")
         log_compile = os.path.join(get_bb_var("WORKDIR","m4"), "temp/log.do_compile")
         with open(log_compile, "r") as f:
-- 
2.7.4


