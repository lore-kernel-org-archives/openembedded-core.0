Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB2ACC3DA4A
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 11:46:04 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.38810.1738842361765086612
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 03:46:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ScrFnBTO;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4364a37a1d7so7822455e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 03:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738842359; x=1739447159; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o22mLFF8SWm+DMx5EKMnMfIHDngILKUVZecNoG69GG8=;
        b=ScrFnBTOm/yVWVxkrF0JylniwY3e7VKahkxmktX/oneIsO1d2KrOnfGf1kqY4oGDVn
         HxxfGkKUt3eBPWCMh9mN5+n03JWSyaLXwdUzewAfo1Ejbtxa0mv/JnI7if17YAme5ojw
         Z//FTW0RAwguPrYjLH/2UbCav4kvPI6ycFVKIM7+s3X5Lu14OGZgHZLtPVfe1upjVBky
         ZOw7shcMGpxrYWg6DRHwykNP+p+mu/69v57dANx+jJ6b+xwx6tug3AVSuckrME2jT7vH
         r5V1tY1S4xhzKfNEYeLLN/ivgrHJMNpzpq3Qi2Jzm5KTPRjINv01YuFslpbIfnc5z1Al
         2Wzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738842359; x=1739447159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o22mLFF8SWm+DMx5EKMnMfIHDngILKUVZecNoG69GG8=;
        b=eGQYYgtwvhFX44mWLiz0+R6lqjCoI7sMytG/3COvNdd0UmrTIbvlioglgDq3dZykuq
         rjH2Tw5N+OLexcfa5jO/HHhHI6JaU9RB3e4+yIQDbuyqnlpKfVVOnMytGiiI9BtkHjoa
         OgG4PJUO5P5rrMK/Ulo+rCsol1dNWXUo4LhbPbjyinF0AZCJZyWi2NikzHIwSG32wL0S
         6esWeVhR7LMkbXi5HW6YJvjQGIJoZ4ZU9fn/3YDmIaAI2ccftH9xmPXk0QGJxLjDetoz
         2EGgFGnBkZ00qgLuaG9FyPmxbg8whNV4Bca/X6aqwi5ypfAkW60cBF8peB5ulDKgiC36
         v2dA==
X-Gm-Message-State: AOJu0Yyac2i1/L1/xwQW78s9ghHyqxVPSs3B5LH3U+pSbldETrA9Hcs1
	tw8Y5GkcqUFJWhCIbJ/vINnKg8tr01xntcs8FsbEi6c6ptTsN5sg+lbhmQ==
X-Gm-Gg: ASbGncvmnAHVV2kJ6CobH/wQx6FaXTueDLY9FyClnVNm1SE5ucqZB12cG6Dp25ZCJxO
	/7l9VEX2v4Qkg7U+P4zZvAX3cmt/WZsEp4gMzJsL/rKVR5GSFWOSQCJ8O6W8uTrkoi9bYbhKeFT
	5YI2E8n1mw85XTvxT8JiP1OguZDHbxS6A/i45lCqAIf+RxBZrG/zc8uZ6KZb6hgBKAeILE+VwE5
	Luirsuc7S386nd0XHTiM2MEGSSzI4SFeQvKWPoIuXHc2vyTSpwirLOvzJvdBTvvU6vvxYdA7igS
	l00KovYfeeFO4dIU82d5wVaELEHq1BgTJqj9VGMlqn/tfQ==
X-Google-Smtp-Source: AGHT+IF5ONFds55q0YP4gbo7on3LbLMdTwnFu6GWvnODVr2RBNcFNXrojDQj0lWoK8csjNg1htSFdw==
X-Received: by 2002:a05:600c:1c1a:b0:438:d9ae:337b with SMTP id 5b1f17b1804b1-4390d43de60mr49630985e9.17.1738842359513;
        Thu, 06 Feb 2025 03:45:59 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dfd802csm16158235e9.34.2025.02.06.03.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 03:45:58 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [OE-core][PATCH v9 5/5] oeqa/selftest/cases/signing.py: Re-enable self-test
Date: Thu,  6 Feb 2025 12:45:47 +0100
Message-ID: <20250206114547.3441965-5-zboszor@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250206114547.3441965-1-zboszor@gmail.com>
References: <20250206114547.3441965-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 11:46:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210923

With all the pieces in place, the self test can be re-enabled.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/lib/oeqa/selftest/cases/signing.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/signing.py b/meta/lib/oeqa/selftest/cases/signing.py
index 51d1c3fa64..4df45ba032 100644
--- a/meta/lib/oeqa/selftest/cases/signing.py
+++ b/meta/lib/oeqa/selftest/cases/signing.py
@@ -71,7 +71,6 @@ class Signing(OESelftestTestCase):
         """
         import oe.packagedata
 
-        self.skipTest('This test requires rpm-sequoia support in rpm')
         self.setup_gpg()
 
         package_classes = get_bb_var('PACKAGE_CLASSES')
@@ -84,6 +83,8 @@ class Signing(OESelftestTestCase):
         feature += 'RPM_GPG_PASSPHRASE = "test123"\n'
         feature += 'RPM_GPG_NAME = "testuser"\n'
         feature += 'GPG_PATH = "%s"\n' % self.gpg_dir
+        feature += 'PACKAGECONFIG:append:pn-rpm-native = " sequoia"\n'
+        feature += 'PACKAGECONFIG:append:pn-rpm = " sequoia"\n'
 
         self.write_config(feature)
 
-- 
2.48.1


