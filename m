Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42C4DC54798
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 21:08:18 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by mx.groups.io with SMTP id smtpd.web10.6127.1708722491955277463
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Feb 2024 13:08:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=qZc8Nu8/;
 spf=pass (domain: posteo.com, ip: 185.67.36.65, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 97CE9240027
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 22:08:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1708722489; bh=Y7s9RGNer3hkWb+WH92xuAPylFfU2kZtEjwgZHLTCaA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=qZc8Nu8/fm7wxXk0gfXx6mFtekhp/HR5rWC0wYJOybHsUNI4i9jkW1fPebQnohSij
	 i9KvvxfAFKYIntuduTo6a00R6ogxSmcC0H/sk/9IzLoMgNI1zoGF4H32gT+ztE5IB/
	 uezFXeSfImHfhIj/e8UGEor/i0+QZisleKQRxBUtnjmLglSdDkLFGDY+mHiWitTMw3
	 oZpI+/NlssFZKat8kyy06rS6h7y24/uy7aW+lHv1KwDqgkRWyCRHsXCFFZG237amMp
	 XzGQ1CMlzbqeiPJeksCkWmiZ288pa5wq38/k3wxinfxDTHCcf89QRfBgWAuhjNs9dU
	 k3bWCGXssgx/g==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4ThMzr6Dv7z6tvJ;
	Fri, 23 Feb 2024 22:08:08 +0100 (CET)
From: simone.p.weiss@posteo.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH] patchtest: Skip test for CVE_CHECK_IGNORE for older branches
Date: Fri, 23 Feb 2024 21:07:40 +0000
Message-Id: <20240223210740.21071-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 21:08:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196112

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

Skip the test for checking if CVE_CHECK_IGNORE is not used.
It is deprecated now, but was not deprecated for kirkstone and dunfell.
Skip it therefore if a patch is intended for those branches.

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
 meta/lib/patchtest/tests/test_metadata.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/lib/patchtest/tests/test_metadata.py b/meta/lib/patchte=
st/tests/test_metadata.py
index 174dfc31c6..be609dbd04 100644
--- a/meta/lib/patchtest/tests/test_metadata.py
+++ b/meta/lib/patchtest/tests/test_metadata.py
@@ -182,8 +182,10 @@ class TestMetadata(base.Metadata):
                 self.fail('%s is missing in newly added recipe' % self.m=
etadata_summary)
=20
     def test_cve_check_ignore(self):
-        if not self.modified:
-            self.skip('No modified recipes, skipping test')
+        # Skip if we neither modified a recipe or target branches are no=
t
+        # Nanbield and newer. CVE_CHECK_IGNORE was first deprecated in N=
anbield.
+        if not self.modified or PatchTestInput.repo.branch =3D=3D "kirks=
tone" or PatchTestInput.repo.branch =3D=3D "dunfell":
+            self.skip('No modified recipes or older target branch, skipp=
ing test')
         for pn in self.modified:
             # we are not interested in images
             if 'core-image' in pn:
--=20
2.39.2


