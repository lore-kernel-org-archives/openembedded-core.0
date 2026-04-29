Return-Path: <marek.vasut@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52F48FF887E
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 23:32:42 +0000 (UTC)
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9087.1777505552711722352
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 16:32:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@mailbox.org header.s=mail20150812 header.b=qgIb9Jlm;
 dkim=fail reason="dkim: body hash did not verify" header.i=@mailbox.org header.s=mail20150812 header.b=DpXjKDWx;
 spf=pass (domain: mailbox.org, ip: 80.241.56.151, mailfrom: marek.vasut@mailbox.org)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4g5YW20cnjz9tjb;
	Thu, 30 Apr 2026 01:32:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777505550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7bHO37trfa0YC2zUvmxmhj5TEJ+nmzsDVMhOHiKPEE8=;
	b=qgIb9JlmRorUtXtXzcz00C4oDOCEapcZpHDWp27cYRYbRggmu3icbSc7f7D5TG3lZQcnsm
	aRVe1UwEeygshqSDpiouQbwl6o3Su0hDm5GqpCOOPqICSB5DFDUg8A7C9iBYwsDLmYxwgB
	RPmqxmq9ZQD60grnuRbbfleNVAm7Q7DrlcsCPLPovdzOsUH0mde8arOaiOW9pGHBRWLove
	8ag3QcJBaf9twGNI93S1wBUImeClZ9RCqlFpRV46ZCUOHdRs/iAqtKkc06L3wQGmmfJJjJ
	Pxf25ALlzW7+WAN+w52hH/42VWXuyOMuMtcbmGvLjKmGxuzQSwFYdAxL4n2jWg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=DpXjKDWx;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777505548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7bHO37trfa0YC2zUvmxmhj5TEJ+nmzsDVMhOHiKPEE8=;
	b=DpXjKDWx/wX9BLSbn5mnxpSOoOrNVT+3nVDxBv4VM2D+/hTNCIW+S0dMoE6+ZxBAcPVDPX
	MWhJuuxIK22XY7VAcwfZCzWO8pR+veUX3+MdI6YZqZM23yHsWkyGlqQyRrEYxC8+WaYoHa
	hgOQXhA+lg4mCUqoFTSTSWn524KaJRiqnjtiC+7DqZRC5IMzi2++EvIAMJBGz7A9wJkJgH
	8KAIW42DzikEBvZDE1kmlSTilK2mMvivI+K1vht41q7gB8v0pxb2M4YdJtidh1CHyIOsG6
	QSkugb3AIFVMZVCsrBTShaLuzvNLi2SF9Q9XwcDp6Xfn3FlLl2V2imW6qdXwAw==
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Adam Nilsson <Adam.X.Nilsson@axis.com>,
	Alexander Kanavin <alex@linutronix.de>,
	Khem Raj <raj.khem@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Patrick Ohly <patrick.ohly@intel.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Philip Lorenz <philip.lorenz@bmw.de>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH] populate_sdk: Execute populate_sdk before rm_work if rm_work.bbclass active
Date: Thu, 30 Apr 2026 01:31:59 +0200
Message-ID: <20260429233224.562584-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-ID: 4982362bbab1ebe47ee
X-MBO-RS-META: 6usem8rpjt97m5xynrbxsrgd7kymh18x
X-Rspamd-Queue-Id: 4g5YW20cnjz9tjb
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 23:32:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236138

In case the rm_work.bbclass is inherited via INHERIT +=3D "rm_work" into
a build, it is currently possible for an image build to execute both
rm_work and populate_sdk tasks in parallel, which usually leads to an
unusual failure of the populate_sdk task.

This can be reproduced with oe-core and bitbake as follows:
$ . oe-init-build-env /path/to/build
$ bitbake core-image-base core-image-base:do_populate_sdk

Fix this in a manner similar to 00b1911c65fa ("populate_sdk_ext.bbclass:
enhance compatibility with rm_work.bbclass"). Make sure do_populate_sdk
is executed before rm_work for both image and SDK only recipes. Use the
RM_WORK_BUILD_WITHOUT variable provided by rm_work bbclass to determine
whether rm_work is inherited or not. This way, in case rm_work is not
inherited, the dependencies remain unchanged, otherwise populate_sdk is
surely executed before the rm_work task.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Adam Nilsson <Adam.X.Nilsson@axis.com>
Cc: Alexander Kanavin <alex@linutronix.de>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: Patrick Ohly <patrick.ohly@intel.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Philip Lorenz <philip.lorenz@bmw.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/populate_sdk.bbclass      | 9 ++++++++-
 meta/classes-recipe/populate_sdk_base.bbclass | 7 +++++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/populate_sdk.bbclass b/meta/classes-reci=
pe/populate_sdk.bbclass
index caeef5d2b2a..3b89ff997f5 100644
--- a/meta/classes-recipe/populate_sdk.bbclass
+++ b/meta/classes-recipe/populate_sdk.bbclass
@@ -10,4 +10,11 @@
 inherit populate_sdk_base
=20
 addtask populate_sdk after do_install before do_build
-
+addhandler inject_sdk_rm_work
+inject_sdk_rm_work[eventmask] =3D "bb.event.RecipeTaskPreProcess"
+python inject_sdk_rm_work() {
+    if d.getVar('RM_WORK_BUILD_WITHOUT'):
+        bb.build.addtask('do_populate_sdk', 'do_rm_work do_build', ' ', =
d)
+    else:
+        bb.build.addtask('do_populate_sdk', 'do_build', ' ', d)
+}
diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes=
-recipe/populate_sdk_base.bbclass
index b427ff27616..073949ebcde 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -435,3 +435,10 @@ do_populate_sdk[rdepends] =3D "${@' '.join([x + ':do=
_package_write_${IMAGE_PKGTYPE
 do_populate_sdk[recrdeptask] +=3D "do_packagedata do_package_write_rpm d=
o_package_write_ipk do_package_write_deb do_package_qa"
 do_populate_sdk[file-checksums] +=3D "${POSTINST_INTERCEPT_CHECKSUMS}"
 addtask populate_sdk
+
+addhandler inject_sdk_rm_work
+inject_sdk_rm_work[eventmask] =3D "bb.event.RecipeTaskPreProcess"
+python inject_sdk_rm_work() {
+    if d.getVar('RM_WORK_BUILD_WITHOUT'):
+        bb.build.addtask('do_populate_sdk', 'do_rm_work', ' ', d)
+}
--=20
2.53.0


