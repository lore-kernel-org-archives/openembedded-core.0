Return-Path: <logan.gallois@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14EABE94625
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 23:34:00 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8400.1770680030348804840
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 15:33:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U6pQBCom;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: logan.gallois@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47ee0291921so33882995e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 15:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770680029; x=1771284829; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bJ32NKYThMma1BTiISFvPk5Hep3z36PY9UVeF7zkh/E=;
        b=U6pQBCom4EyvXPtQg79CWkz/XIg+O50HNvb9LybBUchSQmdKkCyxme/uxz3RHme2sV
         8OnouB9I8CiJTSrFGFmBy0qJOc1cPSJ5f886l0wqgByLASBIT2hsY+zhFnTou/6eoQq2
         fQZfl50oY0zUDYMG+5dGCpxCBJCieVY+2X3D95xkZm55w4tyaz9HRNhzhXcO6tUZYxhS
         sYrNXIn1q8cT9Cv+JquYe7S2LzRhtmXjLqTZN4tEFosAH85mS8f9oYeVjHA5lJ0OFXFa
         +fEd9YN8H/8s+c/sOpy6C0PH3KQvmhTwXDZtBAAzbNVf+lJeT9Jrm9M0cdSrXvnoXFu4
         1Bnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770680029; x=1771284829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bJ32NKYThMma1BTiISFvPk5Hep3z36PY9UVeF7zkh/E=;
        b=GGS8j7oyCWLppczYY21/sN06J82D/t8HhMp9SodChoqu7yhWurqvTHKVQVyT9PyTGK
         4cH4kSTVGzo/iXlYg9znCt4rpnk5eBRRH9Z9QFDBtPMUXHia9430kNdxwLVyWiA4muAK
         bmXdCWieYgOAoRTj0E1ayNejFddSouVaRzjcgz6iZIt+9DeqUMARlwf5jbx40sZbZqUJ
         6Ff66aqcWvMhj/nCGnCvByRHhtIsx2RjuJK/+mGAuKjVK1Xf7j0yb9uLz2JeHdEkMAR9
         mM8bryG6FTNpNxd1AZe1W++o/gStNAb+2SHWahYHRbHEmafssicw2ZgTDpRsXezPMNCn
         57mg==
X-Forwarded-Encrypted: i=1; AJvYcCUB7Ski4XpArt5oWTNuj13HG/HN5VjdGpubPZRodlYgtMQiAlHwZ3AU0NuhdR1vcFWal18+eTE+Q8/u5Y03HhC8FQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyRyJRoDTFH5ntuTP/9XNiVUWXGEyP60vcUeyO5WQYqFO4xFlnk
	9rqeOLFiqO71uWOGOlR1UyKSX6Agwsi8BWPNs2aAZN4v2KPQX4Tz4v58
X-Gm-Gg: AZuq6aIwzPcDGyaq2ZSWkiEl2zvosMbuY101rIWuvL3bQXbvQxCBnMKHjgyqaJLMPyr
	PJtp/lmu2xXKJkRk72UGY1ehoAcNImSRiTVEp18P6S+zAE+AZQtB9jDsYrMJZ8GSuVDgJQgmlP5
	JmPNPgW7Q9IyyZZHwdjtjHeBt441sbB2TL6yzBSrutwIFKNrMUn3zQ0BXyFOFXYCIhfGAtxBO98
	c+A7KMTkR3TVibH2g7OcwFw9n1fU0F/QaQGkjiQiSZhTHdnxrLxO1n8FRv9th3SjticTuz9AUlQ
	guvkSAKsBYXWTe/pysTYqi5k4WxvzO2eVNSkGnzanUgebsoQ5Rj+/ExrtTHiMNc1nhkIa95iZ7H
	K6lYfKgORIs5nrOt1N+b2ZuNHVIxac1jj6tR9E06835ka4Z88KSSrn7guwbDkq9GK+8cxAOvLVY
	2jgI9UIENutJyDcbHp//vHAcntzwXl5jUlKS+nYXIxT0oon1sliNtCnvqNv+bAt33PZAxyA/gdn
	fxusQ==
X-Received: by 2002:a05:600c:154b:b0:47a:81b7:9a20 with SMTP id 5b1f17b1804b1-483201e17b5mr157940005e9.9.1770680028669;
        Mon, 09 Feb 2026 15:33:48 -0800 (PST)
Received: from Minicarpet.home (lfbn-orl-1-620-177.w86-196.abo.wanadoo.fr. [86.196.80.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d8334a8sm18909845e9.12.2026.02.09.15.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 15:33:47 -0800 (PST)
From: Logan Gallois <logan.gallois@gmail.com>
To: patchtest@automation.yoctoproject.org
Cc: logan.gallois@gmail.com,
	openembedded-core@lists.openembedded.org,
	Logan Gallois <logan.gallois@hexagon.com>
Subject: [OE-Core][whinlatter][PATCH v4] oe-setup-build: TEMPLATECONF were not applied correctly
Date: Tue, 10 Feb 2026 00:33:45 +0100
Message-ID: <20260209233345.3742-1-logan.gallois@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <0101019c44b0a444-60a801b4-857b-455a-921f-faeeb6b62eb3-000000@us-west-2.amazonses.com>
References: <0101019c44b0a444-60a801b4-857b-455a-921f-faeeb6b62eb3-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 23:34:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230827

When using the new bitbake-setup tool, an oe-template created in a
custom layer was ignored because the TEMPLATECONF variable was not passed to the source file.

Signed-off-by: Logan Gallois <logan.gallois@hexagon.com>
---
 scripts/oe-setup-build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-setup-build b/scripts/oe-setup-build
index edbcd48355a..7bcdeee4c32 100755
--- a/scripts/oe-setup-build
+++ b/scripts/oe-setup-build
@@ -98,7 +98,7 @@ def setup_build_env(args):
             f.write(cmd_base)
     print("\nRun '. {}' to initialize the build in a current shell session.\n".format(initbuild))
 
-    cmd = "TEMPLATECONF={} {}".format(template["templatepath"], cmd_base)
+    cmd = "TEMPLATECONF={}\n{}".format(template["templatepath"], cmd_base)
     if not no_shell:
         cmd = cmd + " && {}".format(os.environ.get('SHELL','bash'))
     print("Running:", cmd)
-- 
2.43.0


