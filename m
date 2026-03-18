Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7E5110775ED
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 17:14:55 +0000 (UTC)
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19680.1773854092948382194
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 10:14:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=FrMc5L3r;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=4Yc6HsAb;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.151, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 1F1EDEC0143;
	Wed, 18 Mar 2026 13:14:52 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 18 Mar 2026 13:14:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773854092;
	 x=1773940492; bh=IUl7dyhpUcl0UUppDo7WfaVXzu4vdDZNMORl30G/RUQ=; b=
	FrMc5L3rUqfaal1Vh0mB0R95gw/v8rxdvgOYntKE9t7lv0E8VoS1RwNB3v0gA9FH
	su/+m0Ed2eWs70P+sp6JeQ4jvFn15J/gy0JbPgFlLpzFyPwkjizF3jjGOJAmnEQK
	MtEDRaYskoB9b5ZIsjWfi+uWDP5kHkM7D+swFlgKjNQzDaqYwkAc0OzQo7V2JPSJ
	pSCWUL9qhExahGeZyWI6jrOfbGhHyhsCqbWgycAovEkdZLMnD/varu/zazN3BfkR
	kndjW96iXa/6ImuYPt+G5NHYGnaMsFlJkUud7Sco18fku3RYSP6+7Bgproh/0i2q
	bEUoxLoh5AiAqMSh6eAM2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773854092; x=
	1773940492; bh=IUl7dyhpUcl0UUppDo7WfaVXzu4vdDZNMORl30G/RUQ=; b=4
	Yc6HsAbuMDVuixUCFk3Bm28zeVBHskZw2LP9+ha5PR2oKEHWGl1mn/skkl026n3L
	8u7esC+LrSZP/7fW7sb3qd6rVWLatBXfHrcsiUKOREirUBQXUknYhVwsBW9+HTX4
	NREsf4lgP4UJA+Z2btlygY6dYnYBTX6+y1tVTWJpPbiOCNKH6kHHLcrMbFUHZOkX
	qRIH5e5kIOAs+/WVhkUy51TLphKGlguObPaNlfpedRBtXD9CgFLtUfqPCtSDMsTv
	Kw/1P8/beFHy5erLDf9Mp2hg1gKc7PbHFQ5zacTJKHflZXilCqBfPs7qHr4ONUIT
	qxqZaYlHf0IBX1A+pG60g==
X-ME-Sender: <xms:jN26aZArISkJZj3IuyPM2sczZGR5u9wa9RzwYmQ7D-Iq43EJkW_W6Q>
    <xme:jN26adiLljHb7vs7xC6qb-kZwj2oKqXwbm1d4HVmsi4BEMOnt7yiQ_yr8TBTJlOwR
    56W1FO-h-Paz39YnKfMinb7KIFMcFPkvNUPxoeQKHbDDM9cKCn9UCs>
X-ME-Received: <xmr:jN26aSORJs74eVd-RXWFz6If0p0_UqVxQnl6fLWLiCVn9pl8b0OdZ0_4n3quyRIpSh7hHiNFay1VB7EXO92BX3gQI-yHHiU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdegjedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhfffugggtgffkfhgjvfevofesthejre
    dtredtjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgv
    rhdruggvvheqnecuggftrfgrthhtvghrnheptdffvdffjeevhfelieegudfgieefleefue
    efffelvdehfeeviedtieeukefhleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtph
    htthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehprghulhesphgsrghr
    khgvrhdruggvvhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlih
    hsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-ME-Proxy: <xmx:jN26ae6G77pTEwOWzIE2mvyLWBf1LebO1FHMgbrPTwNT38K4jK1Z6Q>
    <xmx:jN26aQ3FZHz3MkNSF_h6ZzEPqaELA61FZfldFDR0_54zPdp_P5d7FA>
    <xmx:jN26afZ_hQt8JV3DKveaWEsX5fAeaGoFazzbFijCBEXAqL_Ejhd0Mw>
    <xmx:jN26aYAyK_9PKN19DrCnu2NzoAZgsvJDsQmacFr2QI2iJCbWzjdK4A>
    <xmx:jN26admXS14OHyIZHnjF-9d6zvl3tTi_X6QapXd7wLgZ5qD67rqAzr_1>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Mar 2026 13:14:51 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Wed, 18 Mar 2026 17:14:44 +0000
Subject: [PATCH 01/12] checklayer: Fix regex in get_signatures
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-fix-checklayer-2-v1-1-388ba6ce47cd@pbarker.dev>
References: <20260318-fix-checklayer-2-v1-0-388ba6ce47cd@pbarker.dev>
In-Reply-To: <20260318-fix-checklayer-2-v1-0-388ba6ce47cd@pbarker.dev>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2126; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=C92j8TpU7mqgs8z3BOV8dKyeHlNfFTOnPuqm65kxUWY=;
 b=kA0DAAoWq2NU7J269G4ByyZiAGm63YjIq2aX3J/4ms0TIhKrxcT3RX7MFsAGyCzTKTeE5uFzl
 Ih1BAAWCgAdFiEEs4z13+WNQQ1oVNogq2NU7J269G4FAmm63YgACgkQq2NU7J269G48mQEAsCKF
 J3FaPJTqPIo+zNPL9NVHXtXcUw0I4Hi0LlfByMwBAIRYQ1v5eRRENP2FjsFyXDj7IXOq4ynNLC/
 G25DyZ8UK
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 17:14:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233418

After commit 11373def3171 ("sstatesig/populate_sdk_ext: Improve unihash
cache handling") in openembedded-core, the locked-sigs.inc file may
contain unihash map entries as well as a list of locked sigs. The
unihash map entries consist of four fields separated by `:` - pn, task,
task hash and unihash. The current regex in get_signatures cannot parse
these correctly, it grabs the first 3 elements into <task> when there
should only be two elements, leading to an error:

    Traceback (most recent call last):
      File "/srv/pokybuild/yocto-worker/check-layer/build/layers/openembedded-core/scripts/yocto-check-layer", line 252, in <module>
        ret =  main()
      File "/srv/pokybuild/yocto-worker/check-layer/build/layers/openembedded-core/scripts/yocto-check-layer", line 215, in main
        td['sigs'], td['tunetasks'] = get_signatures(td['builddir'])
                                      ~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^
      File "/srv/pokybuild/yocto-worker/check-layer/build/layers/openembedded-core/scripts/lib/checklayer/__init__.py", line 340, in get_signatures
        (recipe, task) = s.group('task').split(':')
        ^^^^^^^^^^^^^^
    ValueError: too many values to unpack (expected 2)

Modify the regex so that it doesn't accidentally pick up the third field
of the unihash map entries.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 scripts/lib/checklayer/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/checklayer/__init__.py b/scripts/lib/checklayer/__init__.py
index b70cef1b1441..15459b6e0486 100644
--- a/scripts/lib/checklayer/__init__.py
+++ b/scripts/lib/checklayer/__init__.py
@@ -324,7 +324,7 @@ def get_signatures(builddir, failsafe=False, machine=None, extravars=None):
         else:
             raise
 
-    sig_regex = re.compile(r"^(?P<task>.*:.*):(?P<hash>.*) .$")
+    sig_regex = re.compile(r"^(?P<task>[^:]*:[^:]*):(?P<hash>.*) .$")
     tune_regex = re.compile(r"(^|\s)SIGGEN_LOCKEDSIGS_t-(?P<tune>\S*)\s*=\s*")
     current_tune = None
     with open(sigs_file, 'r') as f:

-- 
2.43.0


