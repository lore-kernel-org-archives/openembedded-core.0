Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B170FCCD183
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 19:11:38 +0000 (UTC)
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
 by mx.groups.io with SMTP id smtpd.web11.2071.1760641891501422089
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Oct 2025 12:11:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=EpOZlW+u;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=woUNWVLF;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.154, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id BD92614000D5;
	Thu, 16 Oct 2025 15:11:30 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Thu, 16 Oct 2025 15:11:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1760641890; x=1760728290; bh=Y5
	pN7a4mIOp52WdyZBfDsPeAKY//mPrsT3SQ3k79fSw=; b=EpOZlW+uM2G+IvTRpq
	8BJMDZbfUW8akJdlkZsC6n/4GUuN3Rg5SjyvGXRIADqwPHNofBQe++UG4F5du0j7
	iGA2fqan2ndicx+x3Tq+uPLCsJhfpv9LBzaSpF4kCrAuKzPg7SqaHZoCB3DlsDu6
	J7mneZigAH80BycIVDXqIKaY5GNbnRLSvfAkmAFRaSYFGSIT3OnHbAcu7+BhrLYV
	M0bIh0S7KQeR3138e6wyuiEJPjJ16sMedJv0dHq2epD/Rf7Mw7bzUv0MpcGEDvMy
	imuorFentSHvDbgdbkFudOHIPm9z/pfZ60B14UPdw+ez/MxGNvRKwooMMCacvCu4
	NOYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1760641890; x=1760728290; bh=Y5pN7a4mIOp52WdyZBfDsPeAKY//
	mPrsT3SQ3k79fSw=; b=woUNWVLFb480OJduF6y+SIu9G4+eul6cbzpnuJp9MD3T
	LXqy+gEUMg9nlFWITl9KHD10MgEZi0KSjMhsdRSS1bYC4BCelxNJssck4OygiOFS
	PHaeHv64ds7i78Lofpk7Yl7QKfpTCxqQk/SdzlF5JwPbh4OiC37DKe7mh0WYdP8e
	kRnDKzYjuAyPWZUTtCKgGa6X+l3rpwU2YSxYcizVRP6eJayp8ANM/P7KzfLJAoEd
	nydSwCR308+LqRVYf9TlAjvOWkiPuH42vHcHJ+IryZRlMOTGopUZ9OWEVdYDEKWK
	g4ofm13smXDQYfxMspkHab2O1n5+FRzVOZK8IFjcGg==
X-ME-Sender: <xms:YkPxaPMptJos2RpZ9ag63h8r-EBk0uXtW4BmE81D_4b7NNaUWAO8yw>
    <xme:YkPxaBYmPNRhhly7AvmjKbqKuIvaxX3T4TKDcTRhmIwIJ9WlkYcDf9In7yuyYNH5e
    JBp-k7gxO_PF9H4INpFSqV6ZZvNid40JpFHjh33aYOyXW4hQeX5XLLS>
X-ME-Received: <xmr:YkPxaLoDmsxtEW980p5eUqzxS9hbT09ulkLv5yMaSHJ9G0GS8ZLjq9AUewYvCpWPSsHbbfL2tv_cPAtBxBlZrPE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduvdejtdelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkffvvefosehtjeertdertdejnecuhfhrohhmpefrrghulhcuuegr
    rhhkvghruceophgruhhlsehpsggrrhhkvghrrdguvghvqeenucggtffrrghtthgvrhhnpe
    ejleetfeelteekudeufeetffegledtgeeugfevteetkeevteeikedtffettdekhfenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhesph
    gsrghrkhgvrhdruggvvhdpnhgspghrtghpthhtohepfedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvg
    hnvghmsggvugguvggurdhorhhgpdhrtghpthhtohepphgruhhlsehpsggrrhhkvghrrdgu
    vghvpdhrtghpthhtoheprghlvgigrdhkrghnrghvihhnsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:YkPxaNY1LyEatrE47v0uUMkTyiPKoccIKAacaeTo5L1iRVTI3Z_plw>
    <xmx:YkPxaLSrIStbJp29GfvYAignEMqwaHNafXQ0nZ8FEKm6ISZYm6z5jA>
    <xmx:YkPxaM5UGwqhG0RKfTfL6T5V5ojiItX8YJ7Ok6uWp1jy_yjj3MS_Pw>
    <xmx:YkPxaIw5jxtAl3SEaIBya_6ZPQPCp-BK1pInEIdnRhVtUCVkNLRLZA>
    <xmx:YkPxaA6d2K_oUi7-Ul1JvlT7lhShQp_jQcGI1bNHPVYlcEjdgHp6MQI->
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Oct 2025 15:11:29 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Thu, 16 Oct 2025 20:11:08 +0100
Subject: [PATCH] pseudo: Add hard sstate dependencies for pseudo-native
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-fix-pseudo-native-v1-1-7c42af094122@pbarker.dev>
X-B4-Tracking: v=1; b=H4sIAEtD8WgC/x2MTQqAIBQGryJv3YO0n0VXiRain/U2FloRhHdPW
 g7MzEsZSZBpUi8l3JJljxV0o8htNq5g8ZXJtGbQrR45yMNHxuV3jvaUG2yMDuiCA2xPtTsSqvQ
 /56WUD+mRdSxjAAAA
X-Change-ID: 20251016-fix-pseudo-native-221fe3fceea4
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
 Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1767; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=Z6ukMIcb581vI4o7pa1qlqcr+C88xk+zXBFPqt3oWcQ=;
 b=kA0DAAoWq2NU7J269G4ByyZiAGjxQ2Ghw5EJr0rozVSiaoVoL88nFkTxP+WN5CFCLxJ+q1CQs
 Yh1BAAWCgAdFiEEs4z13+WNQQ1oVNogq2NU7J269G4FAmjxQ2EACgkQq2NU7J269G6FPQEA6lmJ
 tNtP3ykFLFqbB9HGbWVI+F4t2bf+/CUhlGBfxicA/Rnc8iFRjjq4Sj1CPrzgtUtbiJ1FDidbD32
 IUCOvMPAK
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 19:11:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224980

Where a task (such as do_package) runs under fakeroot, the corresponding
setscene task (do_package_setscene) will also run under fakeroot when
restoring from sstate. Assuming pseudo is used as the fakeroot
implementation, we need pseudo-native and all its runtime dependencies
to be available in the sysroot before running any setscene tasks under
fakeroot.

We already add a hard dependency from all do_package_setscene tasks to
virtual/fakeroot-native:do_populate_sysroot in base.bbclass, but this
does not cover transitive dependencies. So, extend the dependencies of
pseudo-native:do_populate_sysroot_setscene to ensure that the sqlite3
library and attr binaries are also available in the sysroot before
running fakeroot setscene tasks.

[YOCTO #15963]

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 meta/recipes-devtools/pseudo/pseudo.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
index 22c934977d9b..82499cdd74da 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -155,3 +155,10 @@ do_install:append:class-nativesdk () {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+# Setscene tasks which run under fakeroot must not be executed before
+# pseudo-native and *all* its runtime dependencies are available in the
+# sysroot.
+PSEUDO_SETSCENE_DEPS = ""
+PSEUDO_SETSCENE_DEPS:class-native = "sqlite3-native:do_populate_sysroot attr-native:do_populate_sysroot"
+do_populate_sysroot_setscene[depends] += "${PSEUDO_SETSCENE_DEPS}"

---
base-commit: 58558b97c157469f060bb2ad59a40254fb6181e4
change-id: 20251016-fix-pseudo-native-221fe3fceea4

Best regards,
-- 
Paul Barker


