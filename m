Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB974E77171
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 20:36:46 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.25148.1733344597381839791
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 12:36:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=uTVfccFJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7fc2dbee20fso195605a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 12:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733344597; x=1733949397; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jkupBoN0is5h1NYhnz37MzEkL32H6dWUXiqWScCLk9M=;
        b=uTVfccFJVTv2lvlzfr0xapWcaN/NHuFDUH8p7vi8gRvL8jR8ZApn0JRFCGPHQ4xBdJ
         8OdCIWPgQRufEoWBZjwxgrGoHU+Y267MeLDlNxj3MjJzoN1GQ9Z5zrE6iWN0uGJRGuT9
         VVd438km+WdQvo1wG748GmzDK/nzbUTehzbWgQpQFirHPTQbrzB9irFDXIB0LGwY5bpn
         Cr99qJAWKee4Eo9kq8esrtFI31YgSAih/sRrc0gR47Kf45xRu/RqWABQbUhRKQfR52hI
         3XKA+uahhAm9HSCwsHYCHYSjii29dciX0UJ+z5GoDLKiFyheUzII00t7eOMwLUf3SfhA
         35Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733344597; x=1733949397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jkupBoN0is5h1NYhnz37MzEkL32H6dWUXiqWScCLk9M=;
        b=gV579czXAvJeoEt/pB39PnfugWLW2Gmmo+5IfEI3Dqlz3RPqP7cq/pWS0H+fhOFnNN
         Ww0LRlxKu/N9vVKHQ+pDN7oZqYcdkUzmqoPXO7vIrteAx+vGynnxj1JRgrhDLNtbED1i
         e3ggCkxy9uUl6rQadD79vVgCMJ8BdCYnF7StJmPRhxNrYAywt1r+d0T35ODxrH4oV+dG
         3QcrD7imeLXgD7iFdoRmDLHsfh9QX3bf+SHeDEp7C7raevkhmpdUlTu6p/26xm7APoPc
         qi3vwWmVZOQWD4emJbXFykTYOt6SyU1uga8uayLFOebPd90ehCaGCM7IdBtoyL9why7E
         MTQQ==
X-Gm-Message-State: AOJu0YytTbOPBkCx8tqLgNr8IoYB7Z2xO0LOFKQ6WiC7uT6OQ9ll9GfH
	F2/EcRZ9j9uHCHepFYlmOZuQkdq/+bzlvMDQZYRyYk1XdnHFtKh0/0ST7u69bK5dgKnioXrVtXg
	6
X-Gm-Gg: ASbGncv1n/skIymyh179nJr6AivjKYw+9bGZFaBl5MauGyLKushFUeM7SJzQq+pd8dw
	4G/aiWIM5G1HHtwxHMwORr7CTkiDDtXYIBdKncUIT7fC/DbmYqfPJeD+cfTkBmX4lKSbjhyRGnG
	YGVKm3npJMRP7ND5l0mYTaKtI5LXyecQptXLDU+fADMs4Qg/Y+ltd1uyBWkHT8dmvlWYMg4z2nE
	H9LPZWbq7rbJAZb1/i89pgyhWU5rsL2aTJA8jM=
X-Google-Smtp-Source: AGHT+IEmOS6Sg5fhimaXKj0DmUUkzMCOE0rNaj7gv+de9/FGhWgKcFl4vyZyrsZtNbx8KsMEHJmdGQ==
X-Received: by 2002:a05:6a20:9185:b0:1e0:c92a:c838 with SMTP id adf61e73a8af0-1e1653f23efmr11360186637.35.1733344596589;
        Wed, 04 Dec 2024 12:36:36 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7254176f3d7sm12827805b3a.55.2024.12.04.12.36.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 12:36:36 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/15] selftest/reproducible: Drop rawlogs
Date: Wed,  4 Dec 2024 12:36:12 -0800
Message-Id: <296f64cbf83c40759b368526335502a6b130aa14.1733344462.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733344462.git.steve@sakoman.com>
References: <cover.1733344462.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 20:36:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208333

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The "rawlogs" data consists of a long string of results data which is
already in a structured data format. I can't see this is adding much
value in duplciating the data but it does create a huge string with a
lot of long problematic pathnames and inflates the results data size.

I suggest we drop this data as obsolete and not necessary.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5b2c70fab2ffa409b861d83f048b65d458d03a90)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 021e894012..139c43c7e0 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -177,12 +177,8 @@ class ReproducibleTests(OESelftestTestCase):
             self.sstate_targets = bb_vars['OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS'].split()
 
         self.extraresults = {}
-        self.extraresults.setdefault('reproducible.rawlogs', {})['log'] = ''
         self.extraresults.setdefault('reproducible', {}).setdefault('files', {})
 
-    def append_to_log(self, msg):
-        self.extraresults['reproducible.rawlogs']['log'] += msg
-
     def compare_packages(self, reference_dir, test_dir, diffutils_sysroot):
         result = PackageCompareResults(self.oeqa_reproducible_excluded_packages)
 
@@ -295,8 +291,6 @@ class ReproducibleTests(OESelftestTestCase):
 
                 self.logger.info('Reproducibility summary for %s: %s' % (c, result))
 
-                self.append_to_log('\n'.join("%s: %s" % (r.status, r.test) for r in result.total))
-
                 self.write_package_list(package_class, 'missing', result.missing)
                 self.write_package_list(package_class, 'different', result.different)
                 self.write_package_list(package_class, 'different_excluded', result.different_excluded)
-- 
2.34.1


