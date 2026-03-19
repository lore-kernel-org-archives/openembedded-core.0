Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0E69109024A
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 16:05:02 +0000 (UTC)
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14881.1773936300406961043
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 09:05:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=YrfSJ2kv;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=FqSf3ARy;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.156, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B106C14000CF;
	Thu, 19 Mar 2026 12:04:59 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Thu, 19 Mar 2026 12:04:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773936299;
	 x=1774022699; bh=IUl7dyhpUcl0UUppDo7WfaVXzu4vdDZNMORl30G/RUQ=; b=
	YrfSJ2kv1NmEw8Tk/bPeni6gq9jxKWmy4f2muzmW9s9WkLBBmA/rGBtc81dCW+6e
	FsCKeW0NhjvYC17DJeEADEM2DPbvlsxkapQnVNQWv0nLKkUG58C97r1GyNOGxC6h
	gn3RjhfXdmkFUREKXi2xvlbrJ/TetIWWdF6GFKdwTPiJdOSW9ql+d8d+8VW/648b
	LPCOHxJ1ssLGV/PT1yBSMLF7CDJzSM+tstnFOZ9tet8zFEEPI63A1i9QqHW+5rKG
	1vuUpwR03Ftumcox7Ibyadz1a0JHtshInckTtobrxRimGuatOeJH/iuOY/qQimZ9
	R4s4U+DbKLdKa6/A5uNMiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773936299; x=
	1774022699; bh=IUl7dyhpUcl0UUppDo7WfaVXzu4vdDZNMORl30G/RUQ=; b=F
	qSf3ARyUJQCKnIMwCL8s7MwWkGsiV/0FJcitQvbrVTeSt68feslhZDXDt/WVAR4+
	3ylhVbkUREzpA4WFdgitBLWvXT1tuBQ25r53KQ1YiUCizWyKgV/BfAH3WDnrwg15
	VkI0nZDq8pqSeTvE0IxiiaVwUoRtpfx7Q6Yzf8skcx5ClltDCJo8JmwBYtIavUDg
	wAy+/ecMWIW2SmcFRNFzsUX6N5P4DbvnfrulaXJJsxZF2wH/WN3rYiP9O9lyf6hS
	gpGxu9QiS9v8IVEl2DFGHgdEdaxw2OIwA0NgCB0/61p8Seg4hMmMsJMenzTil2sw
	/lGcOeWiZ/13xg43ZNTkA==
X-ME-Sender: <xms:qx68adVte9HxyBAvHZFBaNBEKZFbRI0HXbLwBGF9vh4S2ovfV3OAzg>
    <xme:qx68aTnBKuWWsZUBnXZ0O66e-JpkRp39ddwoZleVdkPm1DVIQN6mte8LozKEdAWAq
    h5pucC3-MOxZyXE81_4flCiJBJzjcd7BrM2aBAuuAhmzkqJVr0khQ>
X-ME-Received: <xmr:qx68aXBxor-Ct_VHhNywtTWRmw9-shMoUuP1RmAiRfJdWUe8u-WQBcTk2VGGypiuC-V3v31nPbBc4ciTvFVWfGrqx9Xx-lQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdejgeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhfffugggtgffkfhgjvfevofesthejre
    dtredtjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgv
    rhdruggvvheqnecuggftrfgrthhtvghrnheptdffvdffjeevhfelieegudfgieefleefue
    efffelvdehfeeviedtieeukefhleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtph
    htthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehophgvnhgvmhgsvggu
    uggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtph
    htthhopehprghulhesphgsrghrkhgvrhdruggvvh
X-ME-Proxy: <xmx:qx68abc1L2WNJCNhdjhuHQGtvfhhsoRuNiv8uUgNknpPRN7cWubktA>
    <xmx:qx68aaLG1p-4Il_BRXJuuhROhrQklFVYpWO-kXKr9a2HsosR-GZaKw>
    <xmx:qx68aWcK2Du95i1z8lQYXXYDBYttcgQxI43Xfps6wpA_up5qrjkHYw>
    <xmx:qx68aZ2q3Vg6lrBOwMNAXQVs0QjcbMTujc7pofHKdTDm0lPgDDPZaQ>
    <xmx:qx68ae4Hzyu0xeHZ9LjxTNB78jVG3_FAjGi03hfXyP3dlHFT6sAR8jiS>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Mar 2026 12:04:59 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Thu, 19 Mar 2026 16:04:39 +0000
Subject: [PATCH v2 1/8] checklayer: Fix regex in get_signatures
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-fix-checklayer-2-v2-1-38ffe8df4c28@pbarker.dev>
References: <20260319-fix-checklayer-2-v2-0-38ffe8df4c28@pbarker.dev>
In-Reply-To: <20260319-fix-checklayer-2-v2-0-38ffe8df4c28@pbarker.dev>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2126; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=C92j8TpU7mqgs8z3BOV8dKyeHlNfFTOnPuqm65kxUWY=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWTukVtZ1pV/yO3250Nvlvw5Lrp/35Qz9X6SQldFtmvZ6
 zLwSD960VHKwiDGxSArpsiyuefr/ae9jrwZIbcUYOawMoEMYeDiFICJ7L7I8D9iZ8iZg0zXJv/y
 mXerLmLRreD00mcMtyeeefJRbVbg3VxDRobTr+OjeGrTAl05Qzirc+SM8gyZA58/ZzmxnnvbmnZ
 BWwYA
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 16:05:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233535

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


