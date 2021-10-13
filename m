Return-Path: <mac@mcrowe.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 152EDC433EF
	for <webhook@archiver.kernel.org>; Wed, 13 Oct 2021 14:06:27 +0000 (UTC)
Received: from avasout03.plus.net (avasout03.plus.net [84.93.230.244])
 by mx.groups.io with SMTP id smtpd.web08.8646.1634133983875457505
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Oct 2021 07:06:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=BpRK0zrq;
 spf=pass (domain: mcrowe.com, ip: 84.93.230.244, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id aetbmJBpTYDhbaetcmEBVR; Wed, 13 Oct 2021 15:06:21 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=O+WiQC1W c=1 sm=1 tr=0
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=kj9zAlcOel0A:10 a=8gfv0ekSlNoA:10 a=MRUtFG32IXUBEquj2lkA:9
 a=CjuIK1q_8ugA:10
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20191005; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:
	Sender:Reply-To:CC:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=yZ5YrTDUZtP9HjL06NpDSmOB9hhsqUehHVhdI+4lJfg=; b=Bp
	RK0zrqcql7Bt4ni8ij/wWO+z+yGeXsG2wRGhVh0YG2CdFCFlSfOPSTW9a3JRxEOMK7uKu88iQ6q2/
	CCO8oINDkkvdsXlHZd8lTzLvn7iXgACKE0T5MVJgkysmphyc1G30e+3DTamMeMosDNsH+SV1yPQgZ
	mR+8QVgAyOlZPIZpvQMoC432EusJVO+ZO54rIK492fmMAgwME/Uk0QP2Jo88Tw3UhaX9A3R5aEA3s
	Y+e+HD3zlFhP/UQTxIbP+SoOTeTgk94dZO4jmoW5N2/50nQVCkVXejBkErOgY6Y0OsbUz1lSNobiu
	Lu7fMhUQj0dLqNYWRAnb2lP3H7g5lyPQ==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.94.2)
	(envelope-from <mac@mcrowe.com>)
	id 1maetb-001bf8-Bv
	for openembedded-core@lists.openembedded.org; Wed, 13 Oct 2021 15:06:15 +0100
Date: Wed, 13 Oct 2021 15:06:15 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Subject: Installing licence files for static/header-only libraries into images
Message-ID: <YWbn1yCqxTGskn+s@mcrowe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CMAE-Envelope: 
 MS4wfAL1HJ0Ky3sVd6aJD8WNRsl1kJ5InYAkdnK2OOJeXVF7U3lIhzVmJMM7Fy5YeUaNDFBwAWY/1poVFrdJ+vEAhBXHanSDjLPu49GI1sHyKISqnt8gJuiD
 yymxJGurAHG1iYKqgSmhQU2JSSN3sVGaLSs2CHLrMbtm37JPAXjdqLwSlyBfb2kVC2RzSlmtZrGAAw==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Oct 2021 14:06:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156909

We're using:

 EXTRA_IMAGE_FEATURES += "lic-pkgs"

to install the corresponding licence packages for all the packages
installed in our image. This works very well for binaries and dynamic
libraries. However, I've recently noticed that it doesn't install licence
files for any static or header-only libraries used during the build.

The corresponding -lic packages are built for such packages, but nothing
causes them to be installed since they are not runtime dependencies of
anything that is installed.

I thought that I could solve this problem by something like:

def lic_deps(d):
    deps = []
    for f in d.getVar('DEPENDS').split():
        if not f.endswith("-native") and not f.startswith("virtual/"):
            deps.append(f + "-lic")
    return ' '.join(deps)

RDEPENDS_${PN}-lic += "${@lic_deps(d)}"

but this fails for recipes that use PROVIDES or other shenanigans which
means that just appending -lic to whatever is in DEPENDS is insufficient.

For the time being I can add the required packages by hand, but this is
brittle in the longer term.

Is there a better way to solve this problem?

Thanks.

Mike.

