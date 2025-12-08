Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD9A5D3B7E1
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 12:39:51 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7133.1765197587012255087
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Dec 2025 04:39:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=jb7syy0u;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dhlfxfgP5x050XV25moEZKFHsKrysrT+yvHEwLKZQZE=; b=jb7syy0uUyr4u+CKjcy3GmL1n8
	joQoSBnFOi+sLrmbbwAkKvRvW+fFucSCbgjIkraO78eZDHJJaNGAr8TgD1Ym4XILN7f5VIdwhZmsk
	JTEbeEhpeabMNC6jgm42f4HUEpo6mUEtjfxzadUaz05s7T0wQv6j2pbdINJy21dTBQlV5fm+pECaF
	IRSUK29w33p0GY36I6RVAaUH1IEQSwkep73yD+O86vK4/8gVuzTzz8LK2+THpjmpIM0gNII/bRQxY
	av+mvE8V2+fwc/YuNjyWFoUEFNSKbADvwdmH7Yh/SfI5eC3KcxJajQ9IgbPTY+KNap6pB1RgTxpai
	9XMORT1Q==;
Received: from [147.129.179.166] (port=32884 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vSaWn-0000000CNpD-0Uo4
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Dec 2025 07:39:45 -0500
Date: Mon, 8 Dec 2025 07:41:18 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: is there any reason for a ptest-enabled recipe to conditionally
 SRC_URI run-ptest?
Message-ID: <a83fbc50-c122-a60e-176d-9c492664fb2d@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Dec 2025 12:39:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227392


  working on a tutorial for ptest and i ran across an oddity under
meta-openembedded, not sure if it means something or is just leftover
cruft from days gone by. i found three recipes with the following
construct (reformatted slightly for visual aesthetics):

$ grep -r "PTEST_ENABLED.*run-ptest" *

meta-oe/recipes-dbs/mysql/mariadb_11.4.9.bb:SRC_URI +=
"${@bb.utils.contains('PTEST_ENABLED', '1', 'file://run-ptest', '', d)}"

meta-oe/recipes-devtools/lapack/lapack_3.12.1.bb:
${@bb.utils.contains('PTEST_ENABLED', '1', 'file://run-ptest', '', d)} \

meta-oe/recipes-support/re2/re2_2024.03.01.bb:
${@bb.utils.contains('PTEST_ENABLED', '1', 'file://run-ptest', '', d)} \

  all three recipes check whether PTEST_ENABLED = 1 before adding
file://run-ptest to SRC_URI.

  is there any reason for this? all three recipes inherit ptest, so it
seems that they *must* provide a run-ptest file. and even if one does
not enable that setting with DISTRO_FEATURES += "ptest", if a recipe
inherits ptest, does that not *require* that recipe to make sure a
run-ptest file is available if called upon? or am i misreading
something?

rday

p.s. i might ask a similar question about this snippet from
ptest.bbclass:

    do_install_ptest_base() {
        if [ -f ${UNPACKDIR}/run-ptest ]; then
            install -D ${UNPACKDIR}/run-ptest ${D}${PTEST_PATH}/run-ptest
        fi

if run-ptest does not come from UNPACKDIR, where would it come from?
might the recipe generate that file dynamically upon package creation?

