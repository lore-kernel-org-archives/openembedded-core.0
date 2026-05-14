Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC25FCD4F3D
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 19:42:27 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19895.1778787745495958963
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2026 12:42:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20251104.gappssmtp.com header.s=20251104 header.b=QOrUE41d;
 spf=pass (domain: baylibre.com, ip: 209.85.160.170, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-51306c9f2a8so84503541cf.1
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 12:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778787744; x=1779392544; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0g8pRkFjT+ycbumVbGtRWk9XgYLZIZDAXILTzHJKB7o=;
        b=QOrUE41dop/9JMzrrfNT++3fa4QxrxUlLQeWV1AO01IP58VbFWxdNn/rTCeqDYutrZ
         ADYbP8udtNUsZqysRTzx+cxYtVtanpPSFdHbCS6tIQmFUNZ4CbEpgoP2aoEDQ6BwWBvW
         Si/NNBuDCWWnFR+d9MBlelffOS7r1cfuRrkiZQXZaJnlZdcNXGgXklKeUuex8SG9x+jm
         gGhyYdOjY1BGjneMw6FUOfY2J5WlQ3I4Z3ygSqB6XXinxFIfbD5dMNLfdivtDZ6c1nZC
         jx9xckXT503VdxKgY08pZ1t9HHVa0RbX5WPEw/kjUG59vAcP55F3x2mjMS2ccFfZLLo6
         Nr9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778787744; x=1779392544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0g8pRkFjT+ycbumVbGtRWk9XgYLZIZDAXILTzHJKB7o=;
        b=eexwp/p2ThX3+N9ICgYFQ9jHlOdxq0Stv1QGTwrOddygX9X1AVaiTxqHLfCxwCm5BE
         qUwmSQOTczPt4GipAUa+agU0siIDb9mF5Fwhinw7bCoNZTnabFH/KtuYumsLBgn7gQm1
         hLt960rWGRQ8vV7kDWQVydChRNuLutYieiuHmWhX8JQhVciDh4nt4Qe1wXRi7x/3KJr1
         U5+0RR4hfZjAqhZ4Q9BlkZoQu0q5ewxzIIuDTxf5c09lboFMCdHLbPdTjFmP68tHuA1g
         F4F4BUn0zgCvnEsTPiZkTmeHKPTHpNOX7Sddlrl6KpljzIVTixOnYUfsjtMu3zh597eE
         sQtQ==
X-Gm-Message-State: AOJu0Yzs/4Fj5UYUORWiOPoAuhRIULiv6DT6YpDbDNI4QvzILdoaE8hR
	ulNnPh+C4BxwvJ1Nq/2jJNDcDlhEcm0+LdA0lOvXUms19amWldQwqrZbeE7+gckrxHBHCKdi97n
	PhSe7z78=
X-Gm-Gg: Acq92OFzPNG7x78qY5QgcIbgGFwFjXp7p+KQ3mudjPGmG6nhp7aEGTr0Ic6VUMVWiO2
	J7d+0XrjRTO5O5wnDGy7G7b6154yFXImmG86jd2A5eP9cfLstP2KZUEQiOWmWJM+9BvDEpQo+kY
	z/7a/dYFqUVU5uM+pGLtRrSAj+gl8qsrs2wPXfGj5dUhDfCQNOgO5wMA+i5H33r05E44SMvKuq5
	A9Zv1UAme5iNWU+M3iKiFASVJBZ2xmw5LlyeH4/1UvLWiD8/JEWqmqPMPd0aL+y9FXQQoUU2LyH
	7D+fEC+M18NsleIr6+LF2npsdpuegyhCK6Yiq+eLYyjkJ1cLGI4waovILp/f3Uxo6GuknokUabx
	bAJ42q9Rd+ehr2ioe6qOC7vr9b/HSfXrcsPeESfxRq9EFL6LUNyHTX6IdDLxRYUok8ivahdXUOF
	GFc7Ju8Q4dehg3PkZLLVnq2diqygP+Xe+19Haw
X-Received: by 2002:a05:622a:144e:b0:50d:8792:b6d1 with SMTP id d75a77b69052e-5165a0df5famr10478391cf.38.1778787743920;
        Thu, 14 May 2026 12:42:23 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:537:a9f7:1a84:f246])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-516456df09csm24864991cf.13.2026.05.14.12.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 12:42:23 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr
Subject: [OE-core][PATCH 07/11] patchtest: test_mbox: skip cover letters
Date: Thu, 14 May 2026 15:42:03 -0400
Message-ID: <20260514194207.1958325-8-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260514194207.1958325-1-tgamblin@baylibre.com>
References: <20260514194207.1958325-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 19:42:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237054

When testing directories containing multiple patches, it's possible that
cover letters are present. The user should ideally account for this and
remove them as required, but we can also add some capability to test
whether a given file is actually a cover letter and act appropriately.
Start by adding a new regex pattern in patchtest_patterns.py to detect
this case, then adjust the test_mbox suite to make use of it.

AI-Generated: Uses Claude Code

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/patchtest/patchtest_patterns.py | 1 +
 meta/lib/patchtest/tests/test_mbox.py    | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/meta/lib/patchtest/patchtest_patterns.py b/meta/lib/patchtest/patchtest_patterns.py
index 1a8db92aa5..b3478d2f0f 100644
--- a/meta/lib/patchtest/patchtest_patterns.py
+++ b/meta/lib/patchtest/patchtest_patterns.py
@@ -57,6 +57,7 @@ invalid_submitters = [pyparsing.Regex("^Upgrade Helper.+"),
 mbox_bugzilla = pyparsing.Regex(r'\[\s?YOCTO.*\]')
 mbox_bugzilla_validation = pyparsing.Regex(r'\[(\s?YOCTO\s?#\s?(\d+)\s?,?)+\]')
 mbox_revert_shortlog_regex = pyparsing.Regex(r'Revert\s+".*"')
+mbox_cover_letter_regex = pyparsing.Regex(r'\[\S+\s+0+/\d+\]')
 mbox_shortlog_maxlength = 90
 # based on https://stackoverflow.com/questions/30281026/regex-parsing-github-usernames-javascript
 mbox_github_username = pyparsing.Regex(r'\B(?<!\${)@([a-z0-9](?:-(?=[a-z0-9])|[a-z0-9]){0,38}(?<=[a-z0-9]))')
diff --git a/meta/lib/patchtest/tests/test_mbox.py b/meta/lib/patchtest/tests/test_mbox.py
index a216028250..d465b58ba6 100644
--- a/meta/lib/patchtest/tests/test_mbox.py
+++ b/meta/lib/patchtest/tests/test_mbox.py
@@ -38,6 +38,9 @@ class TestMbox(base.Base):
             # skip those patches that revert older commits, these do not required the tag presence
             if patchtest_patterns.mbox_revert_shortlog_regex.search_string(commit.shortlog):
                 continue
+            # cover letters (00/N) are not commits and do not need Signed-off-by
+            if patchtest_patterns.mbox_cover_letter_regex.search_string(commit.subject):
+                continue
             if not patchtest_patterns.signed_off_by.search_string(commit.payload):
                 self.fail(
                     'Mbox is missing Signed-off-by. Add it manually or with "git commit --amend -s"',
@@ -53,6 +56,9 @@ class TestMbox(base.Base):
                 # no reason to re-check on revert shortlogs
                 if shortlog.startswith('Revert "'):
                     continue
+                # cover letters (00/N) have series titles, not target: summary format
+                if patchtest_patterns.mbox_cover_letter_regex.search_string(commit.subject):
+                    continue
                 try:
                     patchtest_patterns.shortlog.parseString(shortlog)
                 except pyparsing.ParseException as pe:
-- 
2.54.0


