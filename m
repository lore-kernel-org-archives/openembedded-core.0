Return-Path: <patrick@stwcx.xyz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7F55C77B61
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 16:08:09 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
 by mx.groups.io with SMTP id smtpd.web10.24172.1682698084807563721
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Apr 2023 09:08:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@stwcx.xyz header.s=fm3 header.b=QZaeVZB6;
 spf=pass (domain: stwcx.xyz, ip: 66.111.4.26, mailfrom: patrick@stwcx.xyz)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id F0E9B5C0165;
	Fri, 28 Apr 2023 12:08:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 28 Apr 2023 12:08:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1682698083; x=
	1682784483; bh=sQzH6jZKT/4jhyOBCouTQDCjWW7oc6EBmJDOiCd8eZ4=; b=Q
	ZaeVZB6rCdF/OyIy+1W+vd0wR3MlCz59SyLPRWQHpdPRG7KvKZFzRS0ARIIaF8zN
	uKkXRmm/zB+P36Jf9l7H+GNL7Np3d4EGTJASJRxjeIMTLRMEc66UtyCUMF5iLDmP
	kGQRG9TqTMSdkVOL6aFPZm1ytqwP1v1czCl5HXxaHCCWo/b+C0T50M4Tqs5fvZ5S
	Veq3BbcZr3a7TfskZwvBSQjci+kNCC7CsNQXm2du82urEPMZ4KOTlhxe4OmkdSlS
	X9hnLqla/PUCdyntp+468oqYCezE8zU3ha/yrOJCRYgbJSaxjsiy8kFyWn9VDfD/
	MzfEUKdA2ifulDiNL5YCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1682698083; x=
	1682784483; bh=sQzH6jZKT/4jhyOBCouTQDCjWW7oc6EBmJDOiCd8eZ4=; b=U
	uX0f2hQukQiKUpTlpht0APvh291wQjW88fmlsUaEEO79/AnWSbGvyLyYgziZ1cCh
	kug9goYZ079pwjRctcv9Q1bC7c67S0QsaiGIkYG1vqQoXOlbGE+WCsoQ0XOXZMxW
	2GhGsW4sGGcWX/gdfIYZrYRIHhEF5roO2Tm3m8MDL47E3uu5/L/WMprvOtncegPn
	JzTbprO7mXwuXk5VzmlLb3NOekWEqI5ePBA/sf+wSTb/sVrIDTacZ01fRlzDge/S
	OVVvMSx8xSK3r0OTnMV7bH7B9qFR4uD9zmm9aEL2QQhNXhJPHjPsAx5zn8L/eUUp
	jVJ8L6w6AoxFEBcj8bDbA==
X-ME-Sender: <xms:Y-9LZM9Clb8tY_wUM4GzXcEcODDhUNy88tIXqw3g17sV8nhLLO36Hg>
    <xme:Y-9LZEuIXQ39q4LbuNSR51508GFIOgV79lng07XqqrY7hugBu-iZYjwcnDhx66zbl
    907CtfG6KPCrWJrHPI>
X-ME-Received: <xmr:Y-9LZCDCyl8fkokZlozKvOy52Pl0sWDmyrZI-1hb2Ub2Oneeb3VFPfr-VYVeZ-tNQlslXM9O4GjFcA1TIrCqeUPKPHSyeJ5WfnU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedukedgleejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdljedtmdenucfjughrpefhvf
    evufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefrrghtrhhitghkucghihhl
    lhhirghmshcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrh
    hnpeefveeihfdvgeeguddtveeuudeuvdelgeetleefhfeukeehteekieeujeehtddtjeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrh
    hitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:Y-9LZMfTIO5okTGsjL0EDZKCqJdB_6XRQtPqvu49JlncfhTIRGweOA>
    <xmx:Y-9LZBO69utgJwH2broeFHYAA9HFUqBggrNKjK9FPpFPCwTpyPFK8Q>
    <xmx:Y-9LZGnopKeQzDULkOPY8Rkrz9sW7C71zpzuwaJif9wzPh--m4BoKA>
    <xmx:Y-9LZDUDol4EqdswnP6R5lDnXkDkz5B7PTZhkXMsmTEFEE2SMJfAYw>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 28 Apr 2023 12:08:03 -0400 (EDT)
From: Patrick Williams <patrick@stwcx.xyz>
To: openembedded-core@lists.openembedded.org
Cc: Patrick Williams <patrick@stwcx.xyz>
Subject: [PATCH] perl-version: remove PERL* assignments
Date: Fri, 28 Apr 2023 11:07:57 -0500
Message-Id: <20230428160757.192046-1-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230405003850.384813-1-patrick@stwcx.xyz>
References: <20230405003850.384813-1-patrick@stwcx.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 16:08:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180532

The perl-version.bbclass executes functions which can depend on
variables potentially populated by native, such as `libdir`.  The
sanity `native-last` suggests that recipes should `inherit native`
last, but when that is done the variables like PERLVERSION end up
as `None`, since `${STAGING_LIBDIR}` needs `${libdir}` which is not
yet populated (by native).

All recipes in poky and widely used meta-layers have already been
updated to use the functions directly instead of relying on these
problematic variables.  Delete the variables so that future recipes
do not make the mistake of using them.

Related: openbmc/openbmc#3770
Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 meta/classes-recipe/perl-version.bbclass | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/classes-recipe/perl-version.bbclass b/meta/classes-recipe/perl-version.bbclass
index 269ac9eb31..74e33175d9 100644
--- a/meta/classes-recipe/perl-version.bbclass
+++ b/meta/classes-recipe/perl-version.bbclass
@@ -26,9 +26,6 @@ def get_perl_version(d):
             return m.group(1)
     return None
 
-PERLVERSION := "${@get_perl_version(d)}"
-PERLVERSION[vardepvalue] = ""
-
 
 # Determine the staged arch of perl from the perl configuration file
 # Assign vardepvalue, because otherwise signature is changed before and after
@@ -49,9 +46,6 @@ def get_perl_arch(d):
             return m.group(1)
     return None
 
-PERLARCH := "${@get_perl_arch(d)}"
-PERLARCH[vardepvalue] = ""
-
 # Determine the staged arch of perl-native from the perl configuration file
 # Assign vardepvalue, because otherwise signature is changed before and after
 # perl is built (from None to real version in config.sh).
-- 
2.39.2


