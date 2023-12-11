Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF25BC4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 16:54:05 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by mx.groups.io with SMTP id smtpd.web10.536.1702313163432655280
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Dec 2023 08:46:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=QMVQA/Bu;
 spf=pass (domain: posteo.com, ip: 185.67.36.65, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id D903B240027
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 17:46:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1702313161; bh=Y5khD6DuKzx0CO/9W8HoA1synkCvEoJSAUeDVe6JO5g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=QMVQA/BuqGRC9Jxn2Xh5+ozPrT9a2uP7sTZgqHMsIC6AMQHCyuJhbnyJku/sw/AC0
	 oRGR1kGkkEFwBigoYK19ASRZZ/KICRB3U8h8WF1ub+Ka+5N5/4hsQp8NYrdlEabtwW
	 CsyRszqxQRQWkOpD6oPFEtmpOnuJxiWPydTR02Gd4yKysi/ONIY5t8a87ea+r0/4Gv
	 q3LGVY5pytVCY4NSTQrd59cSKShwgsN0HvCzuTvZxqqc7xmFq4aHpmoyjWJCkK8lPn
	 xeEBpTGtzMbl5xhSaypmdaZ/YtSo7t8N3aVpwB5d0GevKaA8Wtfupb9skyM5NoPLhE
	 baPAyccE3vLEg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4SpngY3Y5Pz9rxF;
	Mon, 11 Dec 2023 17:46:01 +0100 (CET)
From: simone.p.weiss@posteo.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH] patchtest: Add test for deprecated CVE_CHECK_IGNORE
Date: Mon, 11 Dec 2023 16:45:53 +0000
Message-Id: <20231211164553.12425-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 16:54:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192181

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

If a recipes was modified recommand the use of `CVE_STATUS` instead if
`CVE_CHECK_IGNORE` is used. This is a depreacted variable and will
result in a warning from the cve-check.class and should hence not be
used anymore. [YOCTO #15311]

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
 meta/lib/patchtest/tests/test_metadata.py | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/lib/patchtest/tests/test_metadata.py b/meta/lib/patchte=
st/tests/test_metadata.py
index b6f4456ad2..174dfc31c6 100644
--- a/meta/lib/patchtest/tests/test_metadata.py
+++ b/meta/lib/patchtest/tests/test_metadata.py
@@ -25,6 +25,8 @@ class TestMetadata(base.Metadata):
     sha256sum =3D 'sha256sum'
     git_regex =3D pyparsing.Regex('^git\:\/\/.*')
     metadata_summary =3D 'SUMMARY'
+    cve_check_ignore_var =3D 'CVE_CHECK_IGNORE'
+    cve_status_var =3D 'CVE_STATUS'
=20
     def test_license_presence(self):
         if not self.added:
@@ -178,3 +180,16 @@ class TestMetadata(base.Metadata):
             # "${PN} version ${PN}-${PR}" is the default, so fail if def=
ault
             if summary.startswith('%s version' % pn):
                 self.fail('%s is missing in newly added recipe' % self.m=
etadata_summary)
+
+    def test_cve_check_ignore(self):
+        if not self.modified:
+            self.skip('No modified recipes, skipping test')
+        for pn in self.modified:
+            # we are not interested in images
+            if 'core-image' in pn:
+                continue
+            rd =3D self.tinfoil.parse_recipe(pn)
+            cve_check_ignore =3D rd.getVar(self.cve_check_ignore_var)
+
+            if cve_check_ignore is not None:
+                self.fail('%s is deprecated and should be replaced by %s=
' % (self.cve_check_ignore_var, self.cve_status_var))
--=20
2.39.2


