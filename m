Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AD76CDB47E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 13:25:12 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web10.11059.1697117102996550640
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Oct 2023 06:25:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=spMyI6rO;
 spf=pass (domain: baylibre.com, ip: 209.85.222.173, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7757523362fso61409385a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 06:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697117101; x=1697721901; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=m1mjeTZI8eCLWRrzz6YKEiGzpf9KXnIxYM/IXe9pm6k=;
        b=spMyI6rOZjjugsh6/jZUqIMWzSCCgrNR2j7u5qqvXDNvzTDZ3sr4y84xFmx3SV2exH
         vhLUVB67f18f9vEclv99VWLF7nprirJUIf2/DJrh53aVKGeeBiiDk5v1LYiBH+cOkoAX
         gjZhIWr0yCnDzULLgE9/uP/9B/T5cLvtrMvp5U77MZex+HMjNDOS8oLaAsspSKUB5S7p
         GrB7BSoMIO0uTWk4v0397+wdwqjbib3GhGWH1pdBn20zUJ4EPisd/YLGECODnsp+c2hn
         vRPs25q6/JTITdj+iP8AFkUEYPPv/dOQ5FcSBbEmEKKpU6ucyeBcEPw01R/3eRB3oo45
         nGfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697117101; x=1697721901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m1mjeTZI8eCLWRrzz6YKEiGzpf9KXnIxYM/IXe9pm6k=;
        b=wbu2dw56C2Lg0gYOJ9OZKMvdo2W/AC3+sHUXcWsZzI1VFk+d/TRKRhEwtGqJdvNk6L
         NOvie9fFpsHTO79E7Y2G6yoSlCkwb/JbGVA2goLa1BhOL2sLkSroBVxHdh+F9dMSqtIn
         SjA+iwssay4A9J0s3J6iCvTT3yQzVIEx536YQ7IDgmWIMmQHYBTXXIZcUZ2vzzbY6Caw
         WcT9z9mtSTj+xzOQe2nkDYk1HGKmefK/1oxX+W1BLVvIx3nPYZWVuJbZxIp5sJEHNt/w
         aK4B3NOCyemxx27Ye5UOaZZ1bFgu4ZqYVHA3JTOzHK8pMraMoTGGAJ5fS6qFzEuy8aFs
         93Ng==
X-Gm-Message-State: AOJu0YyjpbRUmDM6tE62WJ3rP5MygmE7vPDui2l0hmqgCbcfddQZDnBj
	qFUPFMZh+zXbCYe9VnY4UkZAoc9vNW7ecsPo85Aw7Q==
X-Google-Smtp-Source: AGHT+IFiTrnwF/5xN3rtnV5zmmwo5fcyZyFQJq5Z3dNDlwY/B+fbe9rd5bmv+mpiwt7K6cTNDiXdcA==
X-Received: by 2002:a05:6214:1fd4:b0:658:7f94:3978 with SMTP id jh20-20020a0562141fd400b006587f943978mr23520738qvb.13.1697117101086;
        Thu, 12 Oct 2023 06:25:01 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id jy20-20020a0562142b5400b0065d05c8bb5dsm424094qvb.64.2023.10.12.06.25.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 06:25:00 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/2] patchtest: improve test issue messages
Date: Thu, 12 Oct 2023 09:24:58 -0400
Message-ID: <20231012132459.2469304-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 13:25:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188996

The patchtest tests provide vague feedback to the user, and many of them
also provide redundant 'fix' strings that could easily be incorporated
into the issue messages themselves. Simplify them so that it is more
clear what the errors are and how they can be addressed. No
recommendation is given when the issue string adequately conveys the
issue, e.g. with a missing "LICENSE" entry in a newly-created recipe.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/patchtest/tests/test_mbox_author.py           |  4 ++--
 meta/lib/patchtest/tests/test_mbox_bugzilla.py         |  4 +---
 meta/lib/patchtest/tests/test_mbox_cve.py              |  5 ++---
 meta/lib/patchtest/tests/test_mbox_description.py      |  4 +---
 meta/lib/patchtest/tests/test_mbox_format.py           |  3 +--
 meta/lib/patchtest/tests/test_mbox_mailinglist.py      |  9 ++++-----
 meta/lib/patchtest/tests/test_mbox_merge.py            |  3 +--
 meta/lib/patchtest/tests/test_mbox_shortlog.py         | 10 ++++------
 meta/lib/patchtest/tests/test_mbox_signed_off_by.py    |  5 ++---
 .../patchtest/tests/test_metadata_lic_files_chksum.py  |  6 ++----
 meta/lib/patchtest/tests/test_metadata_license.py      |  2 +-
 meta/lib/patchtest/tests/test_metadata_max_length.py   |  3 +--
 meta/lib/patchtest/tests/test_metadata_src_uri.py      |  3 +--
 meta/lib/patchtest/tests/test_metadata_summary.py      |  3 +--
 meta/lib/patchtest/tests/test_patch_cve.py             |  5 ++---
 meta/lib/patchtest/tests/test_patch_signed_off_by.py   |  3 +--
 meta/lib/patchtest/tests/test_patch_upstream_status.py |  6 +-----
 meta/lib/patchtest/tests/test_python_pylint.py         |  3 +--
 18 files changed, 29 insertions(+), 52 deletions(-)

diff --git a/meta/lib/patchtest/tests/test_mbox_author.py b/meta/lib/patchtest/tests/test_mbox_author.py
index 6c79f164d48..fb8f10e1fd6 100644
--- a/meta/lib/patchtest/tests/test_mbox_author.py
+++ b/meta/lib/patchtest/tests/test_mbox_author.py
@@ -21,9 +21,9 @@ class Author(base.Base):
         for commit in self.commits:
             for invalid in self.invalids:
                 if invalid.search(commit.author):
-                    self.fail('Invalid author %s' % commit.author, 'Resend the series with a valid patch\'s author', commit)
+                    self.fail('Invalid author %s. Resend the series with a valid patch author' % commit.author, commit=commit)
 
     def test_non_auh_upgrade(self):
         for commit in self.commits:
             if self.auh_email in commit.payload:
-                self.fail('Invalid author %s in commit message' % self.auh_email, 'Resend the series with a valid patch\'s author', commit)
+                self.fail('Invalid author %s. Resend the series with a valid patch author' % self.auh_email, commit=commit)
diff --git a/meta/lib/patchtest/tests/test_mbox_bugzilla.py b/meta/lib/patchtest/tests/test_mbox_bugzilla.py
index e8de48bb8da..aa53b77f87c 100644
--- a/meta/lib/patchtest/tests/test_mbox_bugzilla.py
+++ b/meta/lib/patchtest/tests/test_mbox_bugzilla.py
@@ -16,7 +16,5 @@ class Bugzilla(base.Base):
             for line in commit.commit_message.splitlines():
                 if self.rexp_detect.match(line):
                     if not self.rexp_validation.match(line):
-                        self.fail('Yocto Project bugzilla tag is not correctly formatted',
-                                  'Specify bugzilla ID in commit description with format: "[YOCTO #<bugzilla ID>]"',
-                                  commit)
+                        self.fail('Bugzilla issue ID is not correctly formatted - specify it with format: "[YOCTO #<bugzilla ID>]"', commit=commit)
 
diff --git a/meta/lib/patchtest/tests/test_mbox_cve.py b/meta/lib/patchtest/tests/test_mbox_cve.py
index f99194c094c..36548aa10c4 100644
--- a/meta/lib/patchtest/tests/test_mbox_cve.py
+++ b/meta/lib/patchtest/tests/test_mbox_cve.py
@@ -44,6 +44,5 @@ class CVE(base.Base):
             if self.revert_shortlog_regex.match(commit.shortlog):
                 continue
             if not self.prog.search_string(commit.payload):
-                self.fail('Missing or incorrectly formatted CVE tag in mbox',
-                          'Correct or include the CVE tag in the mbox with format: "CVE: CVE-YYYY-XXXX"',
-                          commit)
+                self.fail('Missing or incorrectly formatted CVE tag in mbox. Correct or include the CVE tag in the mbox with format: "CVE: CVE-YYYY-XXXX"',
+                          commit=commit)
diff --git a/meta/lib/patchtest/tests/test_mbox_description.py b/meta/lib/patchtest/tests/test_mbox_description.py
index 7addc6b5f77..46bedd46ce5 100644
--- a/meta/lib/patchtest/tests/test_mbox_description.py
+++ b/meta/lib/patchtest/tests/test_mbox_description.py
@@ -11,7 +11,5 @@ class CommitMessage(base.Base):
     def test_commit_message_presence(self):
         for commit in CommitMessage.commits:
             if not commit.commit_message.strip():
-                self.fail('Patch is missing a descriptive commit message',
-                          'Please include a commit message on your patch explaining the change (most importantly why the change is being made)',
-                          commit)
+                self.fail('Mbox is missing a descriptive commit message. Please include a commit message on your patch explaining the change', commit=commit)
 
diff --git a/meta/lib/patchtest/tests/test_mbox_format.py b/meta/lib/patchtest/tests/test_mbox_format.py
index 85c452ca0d9..42a8491a098 100644
--- a/meta/lib/patchtest/tests/test_mbox_format.py
+++ b/meta/lib/patchtest/tests/test_mbox_format.py
@@ -11,6 +11,5 @@ class MboxFormat(base.Base):
 
     def test_mbox_format(self):
         if self.unidiff_parse_error:
-            self.fail('Series cannot be parsed correctly due to malformed diff lines',
-                      'Create the series again using git-format-patch and ensure it can be applied using git am',
+            self.fail('Series cannot be parsed correctly due to malformed diff lines. Create the series again using git-format-patch and ensure it can be applied using git am',
                       data=[('Diff line', re.sub('^.+:\s(?<!$)','',self.unidiff_parse_error))])
diff --git a/meta/lib/patchtest/tests/test_mbox_mailinglist.py b/meta/lib/patchtest/tests/test_mbox_mailinglist.py
index de38e205b1e..1f9e0be07f8 100644
--- a/meta/lib/patchtest/tests/test_mbox_mailinglist.py
+++ b/meta/lib/patchtest/tests/test_mbox_mailinglist.py
@@ -43,16 +43,15 @@ class MailingList(base.Base):
         for commit in MailingList.commits:
             match = project_regex.match(commit.subject)
             if match:
-                self.fail('Series sent to the wrong mailing list',
-                          'Check the project\'s README (%s) and send the patch to the indicated list' % match.group('project'),
-                          commit)
+                self.fail('Series sent to the wrong mailing list. Check the project\'s README (%s) and send the patch to the indicated list' % match.group('project'),
+                          commit=commit)
 
         for patch in self.patchset:
             folders = patch.path.split('/')
             base_path = folders[0]
             for project in [self.bitbake, self.doc, self.oe, self.poky]:
                 if base_path in  project.paths:
-                    self.fail('Series sent to the wrong mailing list or some patches from the series correspond to different mailing lists', 'Send the series again to the correct mailing list (ML)',
+                    self.fail('Series sent to the wrong mailing list or some patches from the series correspond to different mailing lists. Send the series again to the correct mailing list (ML)',
                               data=[('Suggested ML', '%s [%s]' % (project.listemail, project.gitrepo)),
                                     ('Patch\'s path:', patch.path)])
 
@@ -60,5 +59,5 @@ class MailingList(base.Base):
             if base_path.startswith('scripts'):
                 for poky_file in self.poky_scripts:
                     if patch.path.startswith(poky_file):
-                        self.fail('Series sent to the wrong mailing list or some patches from the series correspond to different mailing lists', 'Send the series again to the correct mailing list (ML)',
+                        self.fail('Series sent to the wrong mailing list or some patches from the series correspond to different mailing lists. Send the series again to the correct mailing list (ML)',
                                   data=[('Suggested ML', '%s [%s]' % (self.poky.listemail, self.poky.gitrepo)),('Patch\'s path:', patch.path)])
diff --git a/meta/lib/patchtest/tests/test_mbox_merge.py b/meta/lib/patchtest/tests/test_mbox_merge.py
index c8b6718d152..a7e0821e726 100644
--- a/meta/lib/patchtest/tests/test_mbox_merge.py
+++ b/meta/lib/patchtest/tests/test_mbox_merge.py
@@ -20,6 +20,5 @@ class Merge(base.Base):
     def test_series_merge_on_head(self):
         if not PatchTestInput.repo.ismerged:
             commithash, author, date, shortlog = headlog()
-            self.fail('Series does not apply on top of target branch',
-                      'Rebase your series on top of targeted branch',
+            self.fail('Series does not apply on top of target branch. Rebase your series and ensure the target is correct',
                       data=[('Targeted branch', '%s (currently at %s)' % (PatchTestInput.repo.branch, commithash))])
diff --git a/meta/lib/patchtest/tests/test_mbox_shortlog.py b/meta/lib/patchtest/tests/test_mbox_shortlog.py
index b6c2a209ff6..7cc71562f6b 100644
--- a/meta/lib/patchtest/tests/test_mbox_shortlog.py
+++ b/meta/lib/patchtest/tests/test_mbox_shortlog.py
@@ -24,9 +24,8 @@ class Shortlog(base.Base):
                 try:
                     parse_shortlog.shortlog.parseString(shortlog)
                 except pyparsing.ParseException as pe:
-                    self.fail('Shortlog does not follow expected format',
-                              'Commit shortlog (first line of commit message) should follow the format "<target>: <summary>"',
-                              commit)
+                    self.fail('Commit shortlog (first line of commit message) should follow the format "<target>: <summary>"',
+                              commit=commit)
 
     def test_shortlog_length(self):
         for commit in Shortlog.commits:
@@ -36,6 +35,5 @@ class Shortlog(base.Base):
                 continue
             l = len(shortlog)
             if l > maxlength:
-                self.fail('Commit shortlog is too long',
-                          'Edit shortlog so that it is %d characters or less (currently %d characters)' % (maxlength, l),
-                          commit)
+                self.fail('Edit shortlog so that it is %d characters or less (currently %d characters)' % (maxlength, l),
+                          commit=commit)
diff --git a/meta/lib/patchtest/tests/test_mbox_signed_off_by.py b/meta/lib/patchtest/tests/test_mbox_signed_off_by.py
index 6458951f1c8..8fd705a2efe 100644
--- a/meta/lib/patchtest/tests/test_mbox_signed_off_by.py
+++ b/meta/lib/patchtest/tests/test_mbox_signed_off_by.py
@@ -23,6 +23,5 @@ class SignedOffBy(base.Base):
             if self.revert_shortlog_regex.match(commit.shortlog):
                 continue
             if not SignedOffBy.prog.search_string(commit.payload):
-                self.fail('Patch is missing Signed-off-by',
-                          'Sign off the patch (either manually or with "git commit --amend -s")',
-                          commit)
+                self.fail('Mbox is missing Signed-off-by. Add it manually or with "git commit --amend -s"',
+                          commit=commit)
diff --git a/meta/lib/patchtest/tests/test_metadata_lic_files_chksum.py b/meta/lib/patchtest/tests/test_metadata_lic_files_chksum.py
index e9a5b6bb4eb..a25a65c6db2 100644
--- a/meta/lib/patchtest/tests/test_metadata_lic_files_chksum.py
+++ b/meta/lib/patchtest/tests/test_metadata_lic_files_chksum.py
@@ -34,8 +34,7 @@ class LicFilesChkSum(base.Metadata):
             if rd.getVar(self.license) == self.closed:
                 continue
             if not lic_files_chksum:
-                self.fail('%s is missing in newly added recipe' % self.metadata,
-                          'Specify the variable %s in %s' % (self.metadata, pn))
+                self.fail('%s is missing in newly added recipe' % self.metadata)
 
     def pretest_lic_files_chksum_modified_not_mentioned(self):
         if not self.modified:
@@ -77,6 +76,5 @@ class LicFilesChkSum(base.Metadata):
                     if self.lictag_re.search(commit.commit_message):
                        break
                 else:
-                    self.fail('LIC_FILES_CHKSUM changed on target %s but there is no "%s" tag in commit message' % (pn, self.lictag),
-                              'Include "%s: <description>" into the commit message with a brief description' % self.lictag,
+                    self.fail('LIC_FILES_CHKSUM changed on target %s but there is no "%s" tag in commit message. Include it with a brief description' % (pn, self.lictag),
                               data=[('Current checksum', pretest), ('New checksum', test)])
diff --git a/meta/lib/patchtest/tests/test_metadata_license.py b/meta/lib/patchtest/tests/test_metadata_license.py
index 16604dbfb1a..e49331603ce 100644
--- a/meta/lib/patchtest/tests/test_metadata_license.py
+++ b/meta/lib/patchtest/tests/test_metadata_license.py
@@ -51,5 +51,5 @@ class License(base.Metadata):
                 fd.write(''.join(lines[:-1]))
 
         if no_license:
-            self.fail('Recipe does not have the LICENSE field set', 'Include a LICENSE into the new recipe')
+            self.fail('Recipe does not have the LICENSE field set.')
 
diff --git a/meta/lib/patchtest/tests/test_metadata_max_length.py b/meta/lib/patchtest/tests/test_metadata_max_length.py
index 04a5e234694..b3a5dc9b791 100644
--- a/meta/lib/patchtest/tests/test_metadata_max_length.py
+++ b/meta/lib/patchtest/tests/test_metadata_max_length.py
@@ -21,6 +21,5 @@ class MaxLength(base.Base):
                 if self.add_mark.match(line):
                     current_line_length = len(line[1:])
                     if current_line_length > self.max_length:
-                        self.fail('Patch line too long (current length %s)' % current_line_length,
-                                  'Shorten the corresponding patch line (max length supported %s)' % self.max_length,
+                        self.fail('Patch line too long (current length %s, maximum is %s)' % (current_line_length, self.max_length),
                                   data=[('Patch', patch.path), ('Line', '%s ...' % line[0:80])])
diff --git a/meta/lib/patchtest/tests/test_metadata_src_uri.py b/meta/lib/patchtest/tests/test_metadata_src_uri.py
index 718229d7ade..ce2ace17bb9 100644
--- a/meta/lib/patchtest/tests/test_metadata_src_uri.py
+++ b/meta/lib/patchtest/tests/test_metadata_src_uri.py
@@ -69,7 +69,6 @@ class SrcUri(base.Metadata):
                 # TODO: we are not taking into account  renames, so test may raise false positives
                 not_removed = filesremoved_from_usr_uri - filesremoved_from_patchset
                 if not_removed:
-                    self.fail('Patches not removed from tree',
-                              'Amend the patch containing the software patch file removal',
+                    self.fail('Patches not removed from tree. Remove them and amend the submitted mbox',
                               data=[('Patch', f) for f in not_removed])
 
diff --git a/meta/lib/patchtest/tests/test_metadata_summary.py b/meta/lib/patchtest/tests/test_metadata_summary.py
index 931b26768e4..8bcea453c25 100644
--- a/meta/lib/patchtest/tests/test_metadata_summary.py
+++ b/meta/lib/patchtest/tests/test_metadata_summary.py
@@ -28,5 +28,4 @@ class Summary(base.Metadata):
 
             # "${PN} version ${PN}-${PR}" is the default, so fail if default
             if summary.startswith('%s version' % pn):
-                self.fail('%s is missing in newly added recipe' % self.metadata,
-                          'Specify the variable %s in %s' % (self.metadata, pn))
+                self.fail('%s is missing in newly added recipe' % self.metadata)
diff --git a/meta/lib/patchtest/tests/test_patch_cve.py b/meta/lib/patchtest/tests/test_patch_cve.py
index 46ed9ef7912..144e130707d 100644
--- a/meta/lib/patchtest/tests/test_patch_cve.py
+++ b/meta/lib/patchtest/tests/test_patch_cve.py
@@ -46,6 +46,5 @@ class CVE(base.Base):
                         tag_found = True
                         break
                 if not tag_found:
-                    self.fail('Missing or incorrectly formatted CVE tag in included patch file',
-                              'Correct or include the CVE tag on cve patch with format: "CVE: CVE-YYYY-XXXX"',
-                              commit)
+                    self.fail('Missing or incorrectly formatted CVE tag in patch file. Correct or include the CVE tag in the patch with format: "CVE: CVE-YYYY-XXXX"',
+                              commit=commit)
diff --git a/meta/lib/patchtest/tests/test_patch_signed_off_by.py b/meta/lib/patchtest/tests/test_patch_signed_off_by.py
index 4855d6daf76..5892033af08 100644
--- a/meta/lib/patchtest/tests/test_patch_signed_off_by.py
+++ b/meta/lib/patchtest/tests/test_patch_signed_off_by.py
@@ -39,5 +39,4 @@ class PatchSignedOffBy(base.Base):
                 if PatchSignedOffBy.prog.search_string(payload):
                     break
             else:
-                self.fail('A patch file has been added, but does not have a Signed-off-by tag',
-                          'Sign off the added patch file (%s)' % newpatch.path)
+                self.fail('A patch file has been added, but does not have a Signed-off-by tag. Sign off the added patch file (%s)' % newpatch.path)
diff --git a/meta/lib/patchtest/tests/test_patch_upstream_status.py b/meta/lib/patchtest/tests/test_patch_upstream_status.py
index eda5353c669..c21aeaf28fd 100644
--- a/meta/lib/patchtest/tests/test_patch_upstream_status.py
+++ b/meta/lib/patchtest/tests/test_patch_upstream_status.py
@@ -34,8 +34,7 @@ class PatchUpstreamStatus(base.Base):
         for newpatch in PatchUpstreamStatus.newpatches:
             payload = newpatch.__str__()
             if not self.upstream_status_regex.search_string(payload):
-                self.fail('Added patch file is missing Upstream-Status in the header',
-                          'Add Upstream-Status: <Valid status> to the header of %s' % newpatch.path,
+                self.fail('Added patch file is missing Upstream-Status in the header. Add Upstream-Status: <Valid status> to the header',
                           data=[('Standard format', self.standard_format), ('Valid status', self.valid_status)])
             for line in payload.splitlines():
                 if self.patchmetadata_regex.match(line):
@@ -46,19 +45,16 @@ class PatchUpstreamStatus(base.Base):
                                 parse_upstream_status.upstream_status_inappropriate_info.parseString(line.lstrip('+'))
                             except pyparsing.ParseException as pe:
                                 self.fail('Upstream-Status is Inappropriate, but no reason was provided',
-                                          'Include a brief reason why %s is inappropriate' % os.path.basename(newpatch.path),
                                           data=[('Current', pe.pstr), ('Standard format', 'Upstream-Status: Inappropriate [reason]')])
                         elif parse_upstream_status.submitted_status_mark.searchString(line):
                             try:
                                 parse_upstream_status.upstream_status_submitted_info.parseString(line.lstrip('+'))
                             except pyparsing.ParseException as pe:
                                 self.fail('Upstream-Status is Submitted, but it is not mentioned where',
-                                          'Include where %s was submitted' % os.path.basename(newpatch.path),
                                           data=[('Current', pe.pstr), ('Standard format', 'Upstream-Status: Submitted [where]')])
                         else:
                             try:
                                 parse_upstream_status.upstream_status.parseString(line.lstrip('+'))
                             except pyparsing.ParseException as pe:
                                 self.fail('Upstream-Status is in incorrect format',
-                                          'Fix Upstream-Status format in %s' % os.path.basename(newpatch.path),
                                           data=[('Current', pe.pstr), ('Standard format', self.standard_format), ('Valid status', self.valid_status)])
diff --git a/meta/lib/patchtest/tests/test_python_pylint.py b/meta/lib/patchtest/tests/test_python_pylint.py
index ea8efb7c2ac..907bd9eef4a 100644
--- a/meta/lib/patchtest/tests/test_python_pylint.py
+++ b/meta/lib/patchtest/tests/test_python_pylint.py
@@ -56,6 +56,5 @@ class PyLint(base.Base):
 
         for issue in self.pylint_test:
              if self.pylint_test[issue] not in self.pylint_pretest.values():
-                 self.fail('Errors in your Python code were encountered',
-                           'Correct the lines introduced by your patch',
+                 self.fail('Errors in your Python code were encountered. Please check your code with a linter and resubmit',
                            data=[('Output', 'Please, fix the listed issues:'), ('', issue + ' ' + self.pylint_test[issue])])
-- 
2.41.0


