Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2AA0B6D523
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 21:39:30 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id b85so1741443pfc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 13:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=NpIxNzsyQhw6+7fcQD2ku1BP+AgtopYTwI1BkLeKtIQ=;
	b=geS3k96JDdfBRX13CN7Y0UknHBSAyNBHtm4NI9e+dboNdBsxJXgvVEwmkhoWzhzNHs
	G6vIpv/TFrvk2ReRYDlX2jbEfyTmCJuhK6zDIobnHjoN8rfUloo6MbuWZUaEqElBrQRZ
	yOSKnk6SDiL/IePW7WQg7HoJkOtAdvXJvPVy0gz2eo5F+2yHStqktojsJ2LlM00YYNB1
	SKm6wVfBAko2IVTP820EDlllvKk9nI/vU0eNgYqhAm2vpPZTxnbsiWEJuDIdjUqWZStl
	fH8phqWEovoH/7+nZcwzqX5TVStfpyAth64dOTrx0GlumnibSq0fabenabLOL/9WBgCU
	gecA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=NpIxNzsyQhw6+7fcQD2ku1BP+AgtopYTwI1BkLeKtIQ=;
	b=IlRETfCdNXqZLZctBmiik//ztu6Vlc6ExgH0LWDfIfFXSynxyvOr6GARrN/l5Yj8/P
	niUcTJIB0r5km203y1aRPB8b66qauVakW9wbkcQKW+CP/hw32nK+74x5fb46C2zTQCli
	43k8yonY6WtiHyXSHkAbIx3VW73y14nbw+p85Wx1KbYM0jiID8RccOO/8pjkjtlzefu5
	Gf36eVVPu4VR/cZ+ZDJF7E2901scCmH2qxMoiIz28gdCUxt5UzDWnIpmuFaQ7qw/uoT1
	eBQARtvW417F6ny6d18V7IFuaLNucGpWzNePkjk4K1TSFieVmC6/uSnsyBw+OiH2HyzW
	ecmg==
X-Gm-Message-State: AA+aEWalnvjY6BXz5Gf1OjPntUVjLk9b2eqvYRYTrr2fQiNXR6EXuTzD
	Dg6QZ3korE+jXooRQPOft0Hn1edz
X-Google-Smtp-Source: AFSGD/WOmCaAhwAMJGuePV8oXER5x4sk7/+wYRjCXwfsIzVij5psYE35GjHZlqNzIEnPtcHj3V1anw==
X-Received: by 2002:a62:e044:: with SMTP id f65mr408256pfh.208.1544737171054; 
	Thu, 13 Dec 2018 13:39:31 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:79af:1f36:1822:3801])
	by smtp.gmail.com with ESMTPSA id
	b9sm3288912pfi.118.2018.12.13.13.39.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Dec 2018 13:39:30 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Thu, 13 Dec 2018 13:38:33 -0800
Message-Id: <39c995ad29ceb729a4c351e737d5585527cf574f.1544735897.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1544735897.git.akuster808@gmail.com>
References: <cover.1544735897.git.akuster808@gmail.com>
Subject: [PATCH 25/45] oeqa/core/runner: Improve test case comparision
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
X-List-Received-Date: Thu, 13 Dec 2018 21:39:30 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We can directly compare the test case IDs rather than representations,
then if we're using subunit to split the tests, the comparisions still
work as intended.

(From OE-Core rev: 72e5f46f75454ba4c445c65c1cbc616a9e72fc6e)

(From OE-Core rev: 4c53aac5315f9d0a0ed95cbeb48b7704e274e3a9)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/runner.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index 13cdf5b..16345fa 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -88,10 +88,10 @@ class OETestResult(_TestResult):
                     break
                 scase_str = scase.test_id
             else:
-                if case == scase:
+                if case.id() == scase.id():
                     found = True
                     break
-                scase_str = str(scase)
+                scase_str = str(scase.id())
 
             # When fails at module or class level the class name is passed as string
             # so figure out to see if match
-- 
2.7.4


