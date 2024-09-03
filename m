Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1F54CD13CF
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 10:56:59 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.20490.1725361013387809677
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 03:56:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=bl4RGA+n;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wpIX61udVv5H+BWHjytZ+i7JO5oU8X464YapxM9Xafw=; b=bl4RGA+n2vU0RxHmMMLFeteAcZ
	IqFsw1RZMwdjI6MON7+GkXfYZurZcLP8RBkNac9Z3IDtuICPGuwc8IJ/JgPEbkJps4KO8tBWtpXof
	ODQ9Ngn9DAYKyn/MYQcnI8KmI4Kgt0qLvSBrrzNS3I4SAkvUzZbF8YSPDLUGEuM+M3wkU6xaEW2sJ
	3UTrp8yvufUpXenk4X608AcXlQarVwHJYudpg0cngy4LnPVd+3FdNLtxj31uR3sGRiR0L/b2m6fDl
	wfkscL6rZ66U/da22atP5OTEMEBIMpPS1BnViwobV/9hNuD7WNzQtPpCcs3zMalCwf6aYJZiy+qF0
	hzlZeDSA==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:43418 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1slRDN-0000000BvsH-1uL9
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Sep 2024 06:56:52 -0400
Date: Tue, 3 Sep 2024 06:56:47 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: does do_install_ptest() need to check "PTEST_ENABLED"?
Message-ID: <f33c3781-fab7-dee3-79b9-9385584076d3@crashcourse.ca>
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
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 10:56:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204155


  another quirk in my travels through the ptest feature so i can write
a tutorial, i ran across precisely two OE recipes that check
PTEST_ENABLED in their definition of do_install_ptest():

https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/gettext/gettext_0.22.5.bb#n147
https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/elfutils/elfutils_0.191.bb#n68

that test *seems* unnecessary, or is there something particularly
subtle that might require that? i don't see any compelling reason to
have to check that variable.

rday

