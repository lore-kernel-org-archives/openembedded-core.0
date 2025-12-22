Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9D59E69198
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:15 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87678.1766434095222100389
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TAPNP53Z;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b7a6e56193cso725610266b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434094; x=1767038894; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ESHo2IaGXG02y8onGbvJEJAc3DCuWqrbxUfaeOaj26w=;
        b=TAPNP53ZheIkCIWu2/v/J9/u6A9DHy65WelqsMWxcLsl4jLrM86xv8NQZqgJfeRVbn
         GixZdVmWlIYq4R1tPjeY1sryGVixRRn8KZThiyUTad375rtKavfmJHLag26L5nmc+LJt
         6sO/00hv8Em3j9sMb3rQlLWqcEJZG3A88jrY6/KlUm6lOejISX7VVkdU4FXs9rpm+62x
         KQ/tR3kvamtLiGfpY82QMewvOaLqybc48t4grHlboErQYbS1jXeTKbhsShW+xGRtxDl5
         +uGZFVISS6vA3HyfgFpL5Y4/IoTpbaruE3ZoOlWnA9na549BqciPcY5fd104h8JxdfAm
         WvOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434094; x=1767038894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ESHo2IaGXG02y8onGbvJEJAc3DCuWqrbxUfaeOaj26w=;
        b=eaL6VW1Cbfv6yJklY0oW56/ETSN9982pV0ZWivL5oSeeV4O4aJ64Ow+FhQgXXI+IIH
         FS5G6qjFbWTEInLzQZKMn1jDQV568bDT8disx9x5JXeWaN/J90ahWyFkiyqu4eSBTsLy
         fo34dyLb4iPIGRFZOUo5TIUty7NbsnSaxFmDL115cW3EVbjoyTBct9UJSHkEk96WrHc8
         mcd2yeAGGHJGyEhyr3R8dtqRkHWRg/uVVRJsBups0uJKRpFt+yqom8kggWhz1k5Nbf6P
         NNru0D2RWZIHzgQabA+/IvjRcYvL/pI1gt0F533l01303Nnvy/BIy/X1soC4+k6P55Vh
         8wDQ==
X-Gm-Message-State: AOJu0YxbplSdEg8OGhzkzzixqZzb7HSc1wl/J6WVweH+Ch0ArSUxH4+m
	kBs5e9TCER6Bm0Gpgs07mMs4znjfXwp5gVfaMgUJ/NCB/SpHDbvr4cWgmRn2fg==
X-Gm-Gg: AY/fxX4VaLkRy5C0XB18pw16OymLJ5Ww1S2JC0vk6LTBDpoOe221roVzL/bF822nR8F
	nJhc53xcGHMi2VhqL75yk2egoDXj5bL1/1MMq1Qejp4Uk2UH7TEaCNDq1Lv72j6WqqNY3D3LkiR
	oEaX7vAAmTiWOxF8hoCd9qsqPii6fb1Dt+LZKeVVNoEDC21LGaahUSudjQyV2PWsGZgjmTxOoXr
	X7Wo+X4HjiXdRzm2wVd2cR/eLXP11dnDciSu6fqnkTcBqlElSMqiKlIw6mFJV1BWlP5YLUzDD5o
	LDPi5lvDJHfjZ4E8bF42qKOoClon2rsRFSFCCxnDS9CyxApc1//u+TJihIv4fp2s0I8lItzmbnt
	b+sYkfl6iC+h9rUe3vD5GBNAmB6BcZ5EpWu+D9h7AwMckiyqYhIGMEnf0g6Her9dFLGfBv8RuMF
	Htq0xN97htf4q6sQjK17a9Dp816nGY+g+eQg0wb2///xpMeuDqjPXlZQQUDg==
X-Google-Smtp-Source: AGHT+IE2/xCzGJNHYXfKe299bzhmmQBppH2Dec5CPBGbagCBKhRMtLLXpY5CLITfcIe2cox2bQGOZQ==
X-Received: by 2002:a17:907:9811:b0:b70:c190:62e1 with SMTP id a640c23a62f3a-b80371d6c41mr1197904566b.35.1766434093411;
        Mon, 22 Dec 2025 12:08:13 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:13 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 039/114] libtest-fatal-perl: upgrade 0.017 -> 0.018
Date: Mon, 22 Dec 2025 21:06:21 +0100
Message-ID: <20251222200739.2278706-39-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228363

From: Alexander Kanavin <alex@linutronix.de>

License-Update: basic artistic license changed to the perl variant
Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...test-fatal-perl_0.017.bb => libtest-fatal-perl_0.018.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/perl/{libtest-fatal-perl_0.017.bb => libtest-fatal-perl_0.018.bb} (81%)

diff --git a/meta/recipes-devtools/perl/libtest-fatal-perl_0.017.bb b/meta/recipes-devtools/perl/libtest-fatal-perl_0.018.bb
similarity index 81%
rename from meta/recipes-devtools/perl/libtest-fatal-perl_0.017.bb
rename to meta/recipes-devtools/perl/libtest-fatal-perl_0.018.bb
index eae128b0cc..a128567ec7 100644
--- a/meta/recipes-devtools/perl/libtest-fatal-perl_0.017.bb
+++ b/meta/recipes-devtools/perl/libtest-fatal-perl_0.018.bb
@@ -5,13 +5,13 @@ exception-throwing code with about the same amount of typing."
 HOMEPAGE = "https://github.com/rjbs/Test-Fatal"
 BUGTRACKER = "https://github.com/rjbs/Test-Fatal/issues"
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0-Perl | GPL-1.0-or-later"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b5c851290cab1dda12fcfb0e9ec43639"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f7fc7d4b26ddae0843b09ba56109e65a"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/R/RJ/RJBS/Test-Fatal-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "37dfffdafb84b762efe96b02fb2aa41f37026c73e6b83590db76229697f3c4a6"
+SRC_URI[sha256sum] = "b8d2cccf9ee467271bc478f9cf7eba49545452be9302ae359bc538b8bf687cd6"
 
 S = "${UNPACKDIR}/Test-Fatal-${PV}"
 
-- 
2.47.3


