Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1CDAEE3695
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 16:42:05 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49938.1770914523419476250
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Feb 2026 08:42:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=yZYAJFcq;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cIsKNReNsM7PJeyyCc7RmvYARD24EV8M4gSHREc+rlo=; b=yZYAJFcqUfmwoq9P50O9ebmTSE
	rHEtrql9JCCUTUpS2/OdQsQOl8o1QvLwPO+TCSMLNgHLeG85VYBBVEvor5ZkgzB9EzxZ/rVfNF82x
	vMu4Dvli5WoVFEI/1AhW7v1Oy7fhHTGSnN1M1CuKiZZba+JROWLggV6kPo7c7cbu9xHvIiFwinrrt
	6SZuuxha9QN21LBbMZT6XRVQtd2ZHc+NjuHyqdngi655zNgWlvvVgcspymoHzdzIodYjqUFQXy1Uh
	DhKSSh8tlGfDwsvY+cnM0YvmX2R+Z65yaaFSHtrYj50RmDbQbWIZB2gpKlv8c8hYFc//9yIDyF+Bn
	dj7VWTOw==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:51888 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vqZlR-00000003yWW-3Thr
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Feb 2026 11:42:02 -0500
Date: Thu, 12 Feb 2026 11:43:44 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: error about "allarch packagegroup" for a NOT allarch packagegroup
Message-ID: <39c95a51-e40c-6d9c-a111-67fe556b11cd@crashcourse.ca>
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
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 16:42:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231040


  re-organizing an existing build into using packagegroups (walnascar
OE/YP release), and i defined the following packagegroup to collect
all the TPM/TSS stuff:

  SUMMARY = "TPM, TSS stuff"

  inherit packagegroup

  PACKAGE_ARCH = "${MACHINE_ARCH}"

  RDEPENDS:${PN} = " \
    tpm2-tools \
    tpm2-openssl \
    libtss2 \
    libtss2-tcti-device \
    libtss2-tcti-mssim \
    tpm2-abrmd \
    tpm2-totp \
    tpm2-tss \
    tpm2-tss-engine \
  "

during the build:

  ERROR: packagegroup-tpm-1.0-r0 do_package_write_deb: An allarch
  packagegroup shouldn't depend on packages which are dynamically
  renamed (libtss2-tcti-device to libtss2-tcti-device0)

  ERROR: packagegroup-tpm-1.0-r0 do_package_write_deb: An allarch
  packagegroup shouldn't depend on packages which are dynamically
  renamed (libtss2-tcti-mssim to libtss2-tcti-mssim0)

but as you can see, i don't define an "allarch" packagegroup and
explicitly set:

  PACKAGE_ARCH = "${MACHINE_ARCH}"

and yet, i get that error. nevertheless, the build finishes and
creates an image.

  i'm confused.

rday

