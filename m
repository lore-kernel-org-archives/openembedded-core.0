Return-Path: <patrick@stwcx.xyz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A6FDC6FD1D
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 00:39:05 +0000 (UTC)
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
 by mx.groups.io with SMTP id smtpd.web10.119182.1680655137783925524
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Apr 2023 17:38:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@stwcx.xyz header.s=fm2 header.b=GTYCXtgp;
 spf=pass (domain: stwcx.xyz, ip: 64.147.123.20, mailfrom: patrick@stwcx.xyz)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id E8F0E3200955;
	Tue,  4 Apr 2023 20:38:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 04 Apr 2023 20:38:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1680655134; x=1680741534; bh=yKOjdzHGQU
	5B+6//BeG7dbj6Hn0D+0ItyiCw1vJU2Qc=; b=GTYCXtgp7/DWrqadI+HxzBflqg
	mHGAz5p5ZK472hjvTgGSIM/Q3xcOzGJm12ggNmORbTQuSA6kcuLY3NXcS7ZFkpdI
	LU6slMa4AslbrPMYI4iEAiLh6ohBGaGyL7jWHFC28q+Z2Oi4lHBCNlMdSN0PpjsS
	MaG1eLloYlAYOxOJXdMYDoZecwkFmUK5l2iZqo9ZH7KwLDqzWJinNd0yC6GEln5z
	Vxt5t3Nd5sebe8iSRdoNbUDViHz+HX6/W0eL8AsEmfo1pt2jZSvgWBwlv6DYfCwC
	3+EDILzWci505v3WWvKB3LhtRuvt+xHy5Sw0VaXhAQhXKUsLnXeM+8MUmxAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1680655134; x=1680741534; bh=yKOjdzHGQU5B+
	6//BeG7dbj6Hn0D+0ItyiCw1vJU2Qc=; b=EmjEFjM0U3wARF4w3tRd4LYSX+IKL
	yUGjP8gHVKDQW5IcQyIo+eOG4YmUGYMGyvA0DjSQ8nKWbcMrz36wK7MvGn4ysZ7R
	s9E/7OghcFslxFl32dfVyEFo83RuLls8qSlbemYOV39z1x+fvsMqb1t3EgHWn/0u
	Xkp6Xm3wMtaa66fBvILBch7Moz0qhKR/ZLHHnKZbULIR7uHVjkXHF/lRd3eUooiK
	AEf8HmrgeABpKJZP0ORMusCLZuOff7UUiqT8dhBLegyOP9U8fSn5ZZYTpks8x0OT
	c3WpzJdkmrnlRljFAHTir+vC6Aiqm+D7kjNngpvP0BXSSQ9IBHxmxMT0Q==
X-ME-Sender: <xms:HsMsZAbNMVgE-kZKJ9OiTkHCQo0XqJA8H37dUQ5mCpk84zgl658snA>
    <xme:HsMsZLbL5cj4pFYlXfjrN8MVdQeXcSNkBIdYaVH8eL2T5oFfTNYGsKa69PH3EHgpr
    Kv76AcLwQ9iKpfAucQ>
X-ME-Received: <xmr:HsMsZK-YBZa8FGAN5WSfptPBSq6NDxxvbuCjaMm81pOQSDON9nnsOBfI0cau2bhiKbzCiSGca6OYwVYrtAFAcEUDWXB0Eufc_3k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejtddgfeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdljedtmdenucfjughrpefhvf
    evufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefrrghtrhhitghkucghihhllhhi
    rghmshcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpe
    evtdevgfdthfefveejudelheeghefhhfdtteetheehudeiueefhfetkeejleefteenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitg
    hksehsthiftgigrdighiii
X-ME-Proxy: <xmx:HsMsZKqoxq_tMWXY3JGC4KBclLoKw7qyZ0vW8s-bzAawl0VqGiqYoA>
    <xmx:HsMsZLpQGnhlX_Gcv1_phju66tY1RuLBjnolHXtdPgPQfOE-8rHbkw>
    <xmx:HsMsZIQXGgBGmuplvlcMgp_EYYaV4aUXPSYh6mH7ztYPBwceSaFMsw>
    <xmx:HsMsZKR8Jbunfn45YD-lgqhT5IDW23jZmdr3tjN72QaBjb25Q_pUFA>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 20:38:54 -0400 (EDT)
From: Patrick Williams <patrick@stwcx.xyz>
To: openembedded-core@lists.openembedded.org
Cc: Patrick Williams <patrick@stwcx.xyz>
Subject: [PATCH] perl-version: make PERL* assignments non-immediate
Date: Tue,  4 Apr 2023 19:38:50 -0500
Message-Id: <20230405003850.384813-1-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 00:39:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179712

The perl-version.bbclass executes functions which can depend on
variables potentially populated by native, such as `libdir`.  The
sanity `native-last` suggests that recipes should `inherit native`
last, but when that is done the variables like PERLVERSION end up
as `None`, since `${STAGING_LIBDIR}` needs `${libdir}` which is not
yet populated (by native).

Switch these variables to be non-immediate, which then allows the
`${libdir}` to be properly populated.

It appears that meta-openembedded/meta-perl does not use either
PERLVERSION or PERLARCH, nor is it used anywhere in `poky`.
meta-security/meta-perl uses PERLVERSION in one recipe's `do_install`
step.  OpenBMC's meta-phosphor similarly uses PERLVERSION in a
`do_install` step.  Therefore, it should be safe to make this
non-immediate.

Fixes: openbmc/openbmc#3770
Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 meta/classes-recipe/perl-version.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/perl-version.bbclass b/meta/classes-recipe/perl-version.bbclass
index 269ac9eb31..e4913dd502 100644
--- a/meta/classes-recipe/perl-version.bbclass
+++ b/meta/classes-recipe/perl-version.bbclass
@@ -26,7 +26,7 @@ def get_perl_version(d):
             return m.group(1)
     return None
 
-PERLVERSION := "${@get_perl_version(d)}"
+PERLVERSION = "${@get_perl_version(d)}"
 PERLVERSION[vardepvalue] = ""
 
 
@@ -49,7 +49,7 @@ def get_perl_arch(d):
             return m.group(1)
     return None
 
-PERLARCH := "${@get_perl_arch(d)}"
+PERLARCH = "${@get_perl_arch(d)}"
 PERLARCH[vardepvalue] = ""
 
 # Determine the staged arch of perl-native from the perl configuration file
-- 
2.39.2


