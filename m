Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02F61E677ED
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 15:56:23 +0000 (UTC)
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.82728.1766418980405809411
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 07:56:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=KVty2pC0;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=BwvlvdCr;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.152, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 7541A14000E9;
	Mon, 22 Dec 2025 10:56:19 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 22 Dec 2025 10:56:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1766418979; x=1766505379; bh=Dn
	KZkP/eb2O20LQe3OIQCzqfYkoFvyov+5kveamBlns=; b=KVty2pC03RT8veCj+m
	gIBd8aTy7hD9KOwuyUD4AB2XhAG48UGHV+OoBYQNNkkLtgErGE/cfddVqCV39Z3Z
	oPC+pak7paVce6QyEZ1oK3DZHreP0NOQMFsfz4S9pPSjAteI6Ru3aD7Y18lXTz4L
	W4RYQVUNP+Xux/xNdZbNyz+2pZoIthEcIQUso1z5FTDQLYtDJywe8P/RbHDaOJj3
	/Z7eVwL5KinO1aJdx2/80BYbIEzP5CEo9Ra+30fPgcblmMNAaA8GtGyjXtjzcTZP
	1tIwgqeiD9NWUz7blSwbHoLdGcWffZJAQbxadYgYKQ/kBeLyVZd+MC+K8pqIhzjf
	q1HQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1766418979; x=1766505379; bh=DnKZkP/eb2O20LQe3OIQCzqfYkoF
	vyov+5kveamBlns=; b=BwvlvdCrfWYAYRYVMTl/Ij/FfMa3aIyfxaDNiUFQJ88s
	ZJ6pf8r2dqdR8CbSsfFmtM5BEnFhdtb3zRTX50/rLxTxOs6H6fwALvUdC4lLEu1l
	SfDcxEge56A3OlXuMNhhgWWgofBnVCh5TrW2wW5IeeNpebwLXipAFxebNE9sZuq3
	V3UOuZwbPgzop/b8/jXlTk8LnG9Ucb764AsTDvSkWT9OKFC7JvQx/Xp8PEBbBMEr
	dRNXD+8Pqq0oZrBUMroc/pW7Na49dwkDol0Cch4v/HTTXIY6e+WGKi86c226Xfhp
	uqXzGeWz2qMTwucTHzE2MwJodGLDVGBkRFFasPHUJg==
X-ME-Sender: <xms:I2pJaUwwlh9AyNALgdqzlb3-7sJClI8qmV7uAYTEpI2sJ_xZwIBWFQ>
    <xme:I2pJaeR3-qhGYfVyX8Tbwlf8d2fK_U1ojhEwLC7Xt_jyO2RIrcp1BfXKPbOOQ3Bg6
    RjbvhuwEAq23o02pcdBVPCBE2uQvfGQqmpCosxOtQ50UZL0CBrNnBM>
X-ME-Received: <xmr:I2pJaT_a1GxHF9-Y9zykpJhHY6sC4eRxrMBizRzAToSYshs2cU74TgJZOSviqw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdehjeefhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhephfffufggtgfgkffvvefosehtjeertdertd
    ejnecuhfhrohhmpefrrghulhcuuegrrhhkvghruceophgruhhlsehpsggrrhhkvghrrdgu
    vghvqeenucggtffrrghtthgvrhhnpeejleetfeelteekudeufeetffegledtgeeugfevte
    etkeevteeikedtffettdekhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehprghulhesphgsrghrkhgvrhdruggvvhdpnhgspghrtghpthhtoh
    epvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepphgruhhlsehpsggrrhhkvghr
    rdguvghvpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtsh
    drohhpvghnvghmsggvugguvggurdhorhhg
X-ME-Proxy: <xmx:I2pJadrPo45RJUlgYgXtS0CsEra5eACbjF2ymtz-ZGbzXnUBZnkCFw>
    <xmx:I2pJaYnZO3tyiRQIDW9QPRreC_1TJo1sruy24NHYMoEFmC4xRDWeJg>
    <xmx:I2pJacKg0DP2keVEoHmO17_kpiGo8TfA3HEHU5bXwK8onLy5UsLJjA>
    <xmx:I2pJaVxxr8r83RH8NDyea5E3rQEy0oqbcuDoTgR8KxR7ihYkQEQj3w>
    <xmx:I2pJaUoPWUqX9eE1MhLtjaH5nh-_P_nktiNgOS2lsCJLEnNbEOSsHI9b>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Dec 2025 10:56:18 -0500 (EST)
From: Paul Barker <paul@pbarker.dev>
Date: Mon, 22 Dec 2025 15:56:04 +0000
Subject: [PATCH] selftest: devtool: Set PATH when running pseudo
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-devtool-deploy-selftest-v1-1-2e656331dbec@pbarker.dev>
X-B4-Tracking: v=1; b=H4sIABNqSWkC/x2MQQqAIBQFrxJ/nZBWhF0lWkS+6oNk+CWK6O5Jq
 2EWMw8JIkOoLx6KOFk47Fl0WdC8TfsKxS47mcq02mirHM4Ugs88fLiVwC8JklTn6mpuGt1ZC8r
 1EbHw9Z+H8X0/w0YM4mkAAAA=
X-Change-ID: 20251219-devtool-deploy-selftest-7d30c441799e
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2054; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=sH1pM0ehorY4nVMcpYd1MwLj7MzlCfm2Rj1pb4mPqjI=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWR6Zin57Pt5fNnCqytTXj2UUPR49Xl7UMiV97etlr09v
 u6y6MOHLztKWRjEuBhkxRRZNvd8vf+015E3I+SWAswcViaQIQxcnAIwERcBRoaLPdMYPmVZ1avq
 HmQQTFns3sZU3+XtLsK75EnL1WDZ0ysYGd7Fsc+Qyp6x5dqEzlmiPxhXO68326I3V/pBVELZtI8
 SR5kB
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 15:56:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228310

When running pseudo outside of bitbake, we need to use the same PATH as
we would use if we were running inside bitbake instead of the host
environment's PATH.

This is particularly important on Ubuntu 25.10 where 'ls' on this host's
PATH is provided by uutils and we have setup links in HOSTTOOLS_DIR to
ensure that the gnu coreutils implementation is used instead.

Fixes [YOCTO #16099]

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 8d7e984753b3..c7bd1831a9cc 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1843,11 +1843,12 @@ class DevtoolDeployTargetTests(DevtoolBase):
                 result = runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, testcommand))
                 # Check if it deployed all of the files with the right ownership/perms
                 # First look on the host - need to do this under pseudo to get the correct ownership/perms
-                bb_vars = get_bb_vars(['D', 'FAKEROOTENV', 'FAKEROOTCMD'], testrecipe)
+                bb_vars = get_bb_vars(['D', 'FAKEROOTENV', 'FAKEROOTCMD', 'PATH'], testrecipe)
                 installdir = bb_vars['D']
                 fakerootenv = bb_vars['FAKEROOTENV']
                 fakerootcmd = bb_vars['FAKEROOTCMD']
-                result = runCmd('%s %s find . -type f -exec ls -l {} \\;' % (fakerootenv, fakerootcmd), cwd=installdir)
+                path = bb_vars['PATH']
+                result = runCmd('PATH="%s" %s %s find . -type f -exec ls -l {} \\;' % (path, fakerootenv, fakerootcmd), cwd=installdir)
                 filelist1 = self._process_ls_output(result.output)
 
                 # Now look on the target

---
base-commit: edb4bba8db32c69e8426af2f3f36537c33a6385f
change-id: 20251219-devtool-deploy-selftest-7d30c441799e

Best regards,
-- 
Paul Barker


