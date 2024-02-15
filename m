Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14011C4829E
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 21:39:55 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by mx.groups.io with SMTP id smtpd.web11.4016.1708033188988482586
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 13:39:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=XCOige1b;
 spf=pass (domain: posteo.com, ip: 185.67.36.65, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 223BF240027
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 22:39:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1708033187; bh=Y6QCBSx5qoX6bk64vrIt34oBo5w5FWkky4gnrrBqOkc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=XCOige1bi6UyqbDA/nLY1P8mjcIjgHNSoYAKlR5jqVaLJ/FcnlF6ciJdlm9+UorSG
	 x58YRlEQ3Old1hsEaqKCZ2BuDSW5kmmfSbChMs/04w40Qbyxntf+5H+nITcd/M2DNL
	 lvGjUqQ5phmqISKo3D+F0m7cHIgOq5IX645EqYnHmryWYHte8VmrJzi+LLsiCgfnQJ
	 6LoZeqGxfo2VFMwvPqM/afuNVUyrs1OlbPyW9dpx0zl40WVEWFJ11AiE9+mL9kO2VJ
	 Ec4BvVLhH/FSrW3Z6xa8w+914iVrYjBXmDuf+JF+mHfqYS+sTkpzJQVcpBLESablbd
	 wXxnITBR+CtYA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4TbT421dD3z9rxB;
	Thu, 15 Feb 2024 22:39:45 +0100 (CET)
From: simone.p.weiss@posteo.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH] patchtest: Add further information for failed testcases
Date: Thu, 15 Feb 2024 21:39:32 +0000
Message-Id: <20240215213932.245929-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 21:39:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195706

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

Add more information to log messages when a test case fails.
Still keep it short and mostly reference the documentation. Reasson is th=
at
documentation should already contain the needed information, do not dupli=
cate
it here, so we also do not need to update here should the doc/policy chan=
ge.

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
 meta/lib/patchtest/tests/test_mbox.py     | 23 ++++++++++++++---------
 meta/lib/patchtest/tests/test_metadata.py | 11 ++++++-----
 meta/lib/patchtest/tests/test_patch.py    | 10 ++++++----
 3 files changed, 26 insertions(+), 18 deletions(-)

diff --git a/meta/lib/patchtest/tests/test_mbox.py b/meta/lib/patchtest/t=
ests/test_mbox.py
index 0b623b7d17..32e60bf0f5 100644
--- a/meta/lib/patchtest/tests/test_mbox.py
+++ b/meta/lib/patchtest/tests/test_mbox.py
@@ -55,6 +55,8 @@ class TestMbox(base.Base):
     poky    =3D Project(name=3D'Poky', listemail=3D'poky@yoctoproject.or=
g', gitrepo=3D'http://git.yoctoproject.org/cgit/cgit.cgi/poky/', paths=3D=
paths['poky'])
     oe      =3D Project(name=3D'oe', listemail=3D'openembedded-devel@lis=
ts.openembedded.org', gitrepo=3D'http://git.openembedded.org/meta-openemb=
edded/', paths=3Dpaths['oe'])
=20
+    commit_guide =3D 'https://docs.yoctoproject.org/dev/contributor-guid=
e/submit-changes.html#implement-and-commit-changes'
+    contrib_guide =3D 'https://docs.yoctoproject.org/dev/contributor-gui=
de/submit-changes.html#finding-a-suitable-mailing-list'
=20
     def test_signed_off_by_presence(self):
         for commit in TestMbox.commits:
@@ -88,7 +90,7 @@ class TestMbox(base.Base):
                 continue
             l =3D len(shortlog)
             if l > self.maxlength:
-                self.fail('Edit shortlog so that it is %d characters or =
less (currently %d characters)' % (self.maxlength, l),
+                self.fail('Edit shortlog (first line of commit message) =
so that it is %d characters or less (currently %d characters)' % (self.ma=
xlength, l),
                           commit=3Dcommit)
=20
     def test_series_merge_on_head(self):
@@ -97,7 +99,7 @@ class TestMbox(base.Base):
             self.skip("Skipping merge test since patch is not intended f=
or master branch. Target detected is %s" % PatchTestInput.repo.branch)
         if not PatchTestInput.repo.ismerged:
             commithash, author, date, shortlog =3D headlog()
-            self.fail('Series does not apply on top of target branch %s'=
 % PatchTestInput.repo.branch,
+            self.fail('Series does not apply on top of target branch %s.=
' % PatchTestInput.repo.branch,
                       data=3D[('Targeted branch', '%s (currently at %s)'=
 % (PatchTestInput.repo.branch, commithash))])
=20
     def test_target_mailing_list(self):
@@ -111,7 +113,7 @@ class TestMbox(base.Base):
         for commit in TestMbox.commits:
             match =3D project_regex.search_string(commit.subject)
             if match:
-                self.fail('Series sent to the wrong mailing list or some=
 patches from the series correspond to different mailing lists',
+                self.fail('Series sent to the wrong mailing list or some=
 patches from the series correspond to different mailing lists. See also =
the contributor guide: %s' % contrib_guide,=20
                           commit=3Dcommit)
=20
         for patch in self.patchset:
@@ -119,7 +121,7 @@ class TestMbox(base.Base):
             base_path =3D folders[0]
             for project in [self.bitbake, self.doc, self.oe, self.poky]:
                 if base_path in  project.paths:
-                    self.fail('Series sent to the wrong mailing list or =
some patches from the series correspond to different mailing lists',
+                    self.fail('Series sent to the wrong mailing list or =
some patches from the series correspond to different mailing lists. See a=
lso the contributor guide: %s' % contrib_guide,=20
                               data=3D[('Suggested ML', '%s [%s]' % (proj=
ect.listemail, project.gitrepo)),
                                     ('Patch\'s path:', patch.path)])
=20
@@ -127,7 +129,7 @@ class TestMbox(base.Base):
             if base_path.startswith('scripts'):
                 for poky_file in self.poky_scripts:
                     if patch.path.startswith(poky_file):
-                        self.fail('Series sent to the wrong mailing list=
 or some patches from the series correspond to different mailing lists',
+                        self.fail('Series sent to the wrong mailing list=
 or some patches from the series correspond to different mailing lists. S=
ee also the contributor guide: %s' % contrib_guide,=20
                                   data=3D[('Suggested ML', '%s [%s]' % (=
self.poky.listemail, self.poky.gitrepo)),('Patch\'s path:', patch.path)])
=20
     def test_mbox_format(self):
@@ -138,22 +140,25 @@ class TestMbox(base.Base):
     def test_commit_message_presence(self):
         for commit in TestMbox.commits:
             if not commit.commit_message.strip():
-                self.fail('Please include a commit message on your patch=
 explaining the change', commit=3Dcommit)
+                self.fail('Please include a commit message on your patch=
 explaining the change See also the guidelines under ', commit=3Dcommit)
=20
     def test_bugzilla_entry_format(self):
         for commit in TestMbox.commits:
             if not self.rexp_detect.search_string(commit.commit_message)=
:
                 self.skip("No bug ID found")
             elif not self.rexp_validation.search_string(commit.commit_me=
ssage):
-                self.fail('Bugzilla issue ID is not correctly formatted =
- specify it with format: "[YOCTO #<bugzilla ID>]"', commit=3Dcommit)
+                self.fail('Bugzilla issue ID is not correctly formatted =
- specify it with format: "[YOCTO #<bugzilla ID>]. For more information, =
see %s:'
+						   % commit_guide, commit=3Dcommit)
=20
     def test_author_valid(self):
         for commit in self.commits:
             for invalid in self.invalids:
                 if invalid.search_string(commit.author):
-                    self.fail('Invalid author %s. Resend the series with=
 a valid patch author' % commit.author, commit=3Dcommit)
+                    self.fail('Invalid author %s. Resend the series with=
 a valid patch author. You can update the author of a commit e.g., with g=
it commit --amend.'
+                              % commit.author, commit=3Dcommit)
=20
     def test_non_auh_upgrade(self):
         for commit in self.commits:
             if self.auh_email in commit.payload:
-                self.fail('Invalid author %s. Resend the series with a v=
alid patch author' % self.auh_email, commit=3Dcommit)
+                self.fail('Invalid author %s. Resend the series with a v=
alid patch author. You can update the author of a commit e.g., with git c=
ommit --amend.'
+                           % self.auh_email, commit=3Dcommit)
diff --git a/meta/lib/patchtest/tests/test_metadata.py b/meta/lib/patchte=
st/tests/test_metadata.py
index 174dfc31c6..3792f9e3bc 100644
--- a/meta/lib/patchtest/tests/test_metadata.py
+++ b/meta/lib/patchtest/tests/test_metadata.py
@@ -62,7 +62,7 @@ class TestMetadata(base.Metadata):
                 fd.write(''.join(lines[:-1]))
=20
         if no_license:
-            self.fail('Recipe does not have the LICENSE field set.')
+            self.fail('Recipe does not have the LICENSE field set. For m=
ore information, see https://docs.yoctoproject.org/dev/ref-manual/variabl=
es.html#term-LICENSE.')
=20
     def test_lic_files_chksum_presence(self):
         if not self.added:
@@ -78,7 +78,7 @@ class TestMetadata(base.Metadata):
             if rd.getVar(self.license_var) =3D=3D self.closed:
                 continue
             if not lic_files_chksum:
-                self.fail('%s is missing in newly added recipe' % self.m=
etadata_chksum)
+                self.fail('%s is missing in newly added recipe. For more=
 information, see https://docs.yoctoproject.org/dev/ref-manual/variables.=
html#term-LIC_FILES_CHKSUM.' % self.metadata_chksum)
=20
     def test_lic_files_chksum_modified_not_mentioned(self):
         if not self.modified:
@@ -163,7 +163,7 @@ class TestMetadata(base.Metadata):
                 # TODO: we are not taking into account  renames, so test=
 may raise false positives
                 not_removed =3D filesremoved_from_usr_uri - filesremoved=
_from_patchset
                 if not_removed:
-                    self.fail('Patches not removed from tree. Remove the=
m and amend the submitted mbox',
+                    self.fail('Patches that are removed from SRC_URI are=
 not removed from tree. Remove them and amend the submitted mbox',
                               data=3D[('Patch', f) for f in not_removed]=
)
=20
     def test_summary_presence(self):
@@ -179,7 +179,7 @@ class TestMetadata(base.Metadata):
=20
             # "${PN} version ${PN}-${PR}" is the default, so fail if def=
ault
             if summary.startswith('%s version' % pn):
-                self.fail('%s is missing in newly added recipe' % self.m=
etadata_summary)
+                self.fail('%s is missing in newly added recipe. For more=
 information, see https://docs.yoctoproject.org/dev/ref-manual/variables.=
html#term-SUMMARY' % self.metadata_summary)
=20
     def test_cve_check_ignore(self):
         if not self.modified:
@@ -192,4 +192,5 @@ class TestMetadata(base.Metadata):
             cve_check_ignore =3D rd.getVar(self.cve_check_ignore_var)
=20
             if cve_check_ignore is not None:
-                self.fail('%s is deprecated and should be replaced by %s=
' % (self.cve_check_ignore_var, self.cve_status_var))
+                self.fail('%s is deprecated and should be replaced by %s=
. For more information, see https://docs.yoctoproject.org/dev/ref-manual/=
variables.html#term-CVE_STATUS'
+						   % (self.cve_check_ignore_var, self.cve_status_var))
diff --git a/meta/lib/patchtest/tests/test_patch.py b/meta/lib/patchtest/=
tests/test_patch.py
index d7187a0cb1..5032e913c3 100644
--- a/meta/lib/patchtest/tests/test_patch.py
+++ b/meta/lib/patchtest/tests/test_patch.py
@@ -17,6 +17,8 @@ class TestPatch(base.Base):
     re_cve_payload_tag =3D pyparsing.Regex("\+CVE:(\s+CVE\-\d{4}\-\d+)+"=
)
     upstream_status_regex =3D pyparsing.AtLineStart("+" + "Upstream-Stat=
us")
=20
+    upstream_guide =3D 'https://docs.yoctoproject.org/dev/contributor-gu=
ide/recipe-style-guide.html?highlight=3Dupstream+status#patch-upstream-st=
atus'
+ =20
     @classmethod
     def setUpClassLocal(cls):
         cls.newpatches =3D []
@@ -51,7 +53,7 @@ class TestPatch(base.Base):
         for newpatch in TestPatch.newpatches:
             payload =3D newpatch.__str__()
             if not self.upstream_status_regex.search_string(payload):
-                self.fail('Added patch file is missing Upstream-Status: =
<Valid status> in the commit message',
+                self.fail('Added patch file is missing Upstream-Status: =
<Valid status> in the commit message. For more information, see %s' % ups=
tream_guide,
                           data=3D[('Standard format', self.standard_form=
at), ('Valid status', self.valid_status)])
             for line in payload.splitlines():
                 if self.patchmetadata_regex.match(line):
@@ -61,19 +63,19 @@ class TestPatch(base.Base):
                             try:
                                 parse_upstream_status.upstream_status_in=
appropriate_info.parseString(line.lstrip('+'))
                             except pyparsing.ParseException as pe:
-                                self.fail('Upstream-Status is Inappropri=
ate, but no reason was provided',
+                                self.fail('Upstream-Status is Inappropri=
ate, but no reason was provided. For more information, see %s' % upstream=
_guide,
                                           data=3D[('Current', pe.pstr), =
('Standard format', 'Upstream-Status: Inappropriate [reason]')])
                         elif parse_upstream_status.submitted_status_mark=
.searchString(line):
                             try:
                                 parse_upstream_status.upstream_status_su=
bmitted_info.parseString(line.lstrip('+'))
                             except pyparsing.ParseException as pe:
-                                self.fail('Upstream-Status is Submitted,=
 but it is not mentioned where',
+                                self.fail('Upstream-Status is Submitted,=
 but it is not mentioned where. For more information, see %s' % upstream_=
guide,
                                           data=3D[('Current', pe.pstr), =
('Standard format', 'Upstream-Status: Submitted [where]')])
                         else:
                             try:
                                 parse_upstream_status.upstream_status.pa=
rseString(line.lstrip('+'))
                             except pyparsing.ParseException as pe:
-                                self.fail('Upstream-Status is in incorre=
ct format',
+                                self.fail('Upstream-Status is in incorre=
ct format. For more information, see %s' % upstream_guide,
                                           data=3D[('Current', pe.pstr), =
('Standard format', self.standard_format), ('Valid status', self.valid_st=
atus)])
=20
     def test_signed_off_by_presence(self):
--=20
2.39.2


