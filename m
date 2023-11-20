Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FACAC197A0
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 16:39:53 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web11.649.1700498389589328181
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 08:39:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ZXwAU1N5;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.174, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3b2df2fb611so3333896b6e.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 08:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700498388; x=1701103188; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BstJjODz7uGY3FQlmtrGKH232/qPeLK8Bjexm+xDA1g=;
        b=ZXwAU1N5K8DhDe75An3l5c4u2y3lM0N1AFegTARZWad+zLFYDOJIzB4ZvUuq0bbrc6
         zndXzTZn2+6wq29RrXc26hnjPPbQPg023efCCGZzwHLXLdo07wGEMeVfuxDH36xsX0E6
         0nRW2icWiqLkouYbu5tvussD7jABE4mNXgHa3XWcLPmBf1O+owVkaarW2LtURNUJg4+o
         z2oHOuLZYSgz/6ijcIjC0IIUBOL+0ziasObmiaUkrd2TKfEsosleveQOFrP+0jZGrr4C
         I+Kb28k6bB4ddlNj7THZsQFov+QyzT+juj8jqTi82ifJ7LPC6ytIWtEb6q6UwsBc414B
         Hxbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700498388; x=1701103188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BstJjODz7uGY3FQlmtrGKH232/qPeLK8Bjexm+xDA1g=;
        b=jbpkIhHJpKojt3TKRI2Jtu/+Azwtkmvv1Ra+8g7Okdu+FH4zABb3nzeNN/tvLlXGLv
         d4zpExcldLzHJtDyKIKMr3Qx6pQP8diTTnTvAb3Y4bYYDp64y+mF+rQUjcY+5OKhtJ4Z
         2r98/0P/Todom3ciFOOGOV8C+9M2J5yBl0qDYgBcxhGndofsuVAdw1T1l4CS8pIXuq42
         fphstaWr07h4WgWT6st+IpdcHZQ2H9EJgxjYkUFtGlX2SY6TXRs6bd2r2zotpuKs+50O
         tbEA3Fe1khUcPPLztJrhRHtvQnh+GwKlh3lR6rW+zlJ3XzhVjp2i+a1hcgvaw40wP8rK
         Hq4g==
X-Gm-Message-State: AOJu0Yyifhikhs1/AcHBqsBFG1P7/TJLb0mn3lq057I3khtoEqJc6Dm/
	fox5JcLb85Ed0obdSD8HCLyQJtYQg6yy7l2H5nm+BQ==
X-Google-Smtp-Source: AGHT+IHAey5GecYD/5+zpuR4c53WGsP0TEDvDYNgkaRnJDWE3eH9UHQUzzjRlLbFhKUBOWSTSHwYSQ==
X-Received: by 2002:a05:6808:10c7:b0:3b6:4e53:e7ac with SMTP id s7-20020a05680810c700b003b64e53e7acmr11774415ois.56.1700498387948;
        Mon, 20 Nov 2023 08:39:47 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id o23-20020a634e57000000b005c215baacc1sm4899279pgl.70.2023.11.20.08.39.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 08:39:47 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 27/33] patchtest: shorten test result outputs
Date: Mon, 20 Nov 2023 06:38:41 -1000
Message-Id: <0d518057b8e4d8b68fb542115a18ec180897693f.1700496737.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700496737.git.steve@sakoman.com>
References: <cover.1700496737.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 16:39:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190916

From: Trevor Gamblin <tgamblin@baylibre.com>

Some test result lines in TestMbox and TestPatch are still too long to
avoid being flagged by the mailer script. Clean them up by removing
redundant information, so that they are all under the length limit of
220 characters.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c10d0bb542b23fbdc14d76dfa8e5885aa4d33083)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/patchtest/tests/test_mbox.py  | 14 +++++++-------
 meta/lib/patchtest/tests/test_patch.py |  4 ++--
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/lib/patchtest/tests/test_mbox.py b/meta/lib/patchtest/tests/test_mbox.py
index 95002c9e2a..2449564d0f 100644
--- a/meta/lib/patchtest/tests/test_mbox.py
+++ b/meta/lib/patchtest/tests/test_mbox.py
@@ -100,7 +100,7 @@ class TestMbox(base.Base):
             self.skip("Skipping merge test since patch is not intended for master branch. Target detected is %s" % PatchTestInput.repo.branch)
         if not PatchTestInput.repo.ismerged:
             commithash, author, date, shortlog = headlog()
-            self.fail('Series does not apply on top of target branch. Rebase your series and ensure the target is correct',
+            self.fail('Series does not apply on top of target branch %s' % PatchTestInput.repo.branch,
                       data=[('Targeted branch', '%s (currently at %s)' % (PatchTestInput.repo.branch, commithash))])
 
     def test_target_mailing_list(self):
@@ -114,7 +114,7 @@ class TestMbox(base.Base):
         for commit in TestMbox.commits:
             match = project_regex.search_string(commit.subject)
             if match:
-                self.fail('Series sent to the wrong mailing list. Check the project\'s README (%s) and send the patch to the indicated list' % match.group('project'),
+                self.fail('Series sent to the wrong mailing list or some patches from the series correspond to different mailing lists',
                           commit=commit)
 
         for patch in self.patchset:
@@ -122,7 +122,7 @@ class TestMbox(base.Base):
             base_path = folders[0]
             for project in [self.bitbake, self.doc, self.oe, self.poky]:
                 if base_path in  project.paths:
-                    self.fail('Series sent to the wrong mailing list or some patches from the series correspond to different mailing lists. Send the series again to the correct mailing list (ML)',
+                    self.fail('Series sent to the wrong mailing list or some patches from the series correspond to different mailing lists',
                               data=[('Suggested ML', '%s [%s]' % (project.listemail, project.gitrepo)),
                                     ('Patch\'s path:', patch.path)])
 
@@ -130,18 +130,18 @@ class TestMbox(base.Base):
             if base_path.startswith('scripts'):
                 for poky_file in self.poky_scripts:
                     if patch.path.startswith(poky_file):
-                        self.fail('Series sent to the wrong mailing list or some patches from the series correspond to different mailing lists. Send the series again to the correct mailing list (ML)',
+                        self.fail('Series sent to the wrong mailing list or some patches from the series correspond to different mailing lists',
                                   data=[('Suggested ML', '%s [%s]' % (self.poky.listemail, self.poky.gitrepo)),('Patch\'s path:', patch.path)])
 
     def test_mbox_format(self):
         if self.unidiff_parse_error:
-            self.fail('Series cannot be parsed correctly due to malformed diff lines. Create the series again using git-format-patch and ensure it can be applied using git am',
+            self.fail('Series has malformed diff lines. Create the series again using git-format-patch and ensure it applies using git am',
                       data=[('Diff line',self.unidiff_parse_error)])
 
     def test_commit_message_presence(self):
         for commit in TestMbox.commits:
             if not commit.commit_message.strip():
-                self.fail('Mbox is missing a descriptive commit message. Please include a commit message on your patch explaining the change', commit=commit)
+                self.fail('Please include a commit message on your patch explaining the change', commit=commit)
 
     def test_cve_presence_in_commit_message(self):
         if self.unidiff_parse_error:
@@ -161,7 +161,7 @@ class TestMbox(base.Base):
             if not self.patch_prog.search_string(commit.payload):
                 self.skip("No CVE tag in added patch, so not needed in mbox")
             elif not self.prog.search_string(commit.payload):
-                self.fail('Missing or incorrectly formatted CVE tag in mbox. Correct or include the CVE tag in the mbox with format: "CVE: CVE-YYYY-XXXX"',
+                self.fail('A CVE tag should be provided in the commit message with format: "CVE: CVE-YYYY-XXXX"',
                           commit=commit)
 
     def test_bugzilla_entry_format(self):
diff --git a/meta/lib/patchtest/tests/test_patch.py b/meta/lib/patchtest/tests/test_patch.py
index b6904b185f..65d0f930b0 100644
--- a/meta/lib/patchtest/tests/test_patch.py
+++ b/meta/lib/patchtest/tests/test_patch.py
@@ -50,7 +50,7 @@ class TestPatch(base.Base):
         for newpatch in TestPatch.newpatches:
             payload = newpatch.__str__()
             if not self.upstream_status_regex.search_string(payload):
-                self.fail('Added patch file is missing Upstream-Status in the header. Add Upstream-Status: <Valid status> to the header',
+                self.fail('Added patch file is missing Upstream-Status: <Valid status> in the commit message',
                           data=[('Standard format', self.standard_format), ('Valid status', self.valid_status)])
             for line in payload.splitlines():
                 if self.patchmetadata_regex.match(line):
@@ -87,7 +87,7 @@ class TestPatch(base.Base):
                 if TestPatch.prog.search_string(payload):
                     break
             else:
-                self.fail('A patch file has been added, but does not have a Signed-off-by tag. Sign off the added patch file (%s)' % newpatch.path)
+                self.fail('A patch file has been added without a Signed-off-by tag. Sign off the added patch file (%s)' % newpatch.path)
 
     def test_cve_tag_format(self):
         for commit in TestPatch.commits:
-- 
2.34.1


