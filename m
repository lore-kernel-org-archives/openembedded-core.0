Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f173.google.com (mail-it1-f173.google.com
	[209.85.166.173])
	by mail.openembedded.org (Postfix) with ESMTP id 958857CBA3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 15:44:24 +0000 (UTC)
Received: by mail-it1-f173.google.com with SMTP id h6so23509205itl.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 07:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=RB395Ncqrrb4FgmXvHMCGmuz1xvsKQhCIwuFpEUb/I4=;
	b=F7wWm9/QA/1qe0+x2pS1B6apCSq+ayQbgwD/zwk23mRQ6PFHtkgGywtXqL+xvrSm+L
	ayXb9qwZcUCshARZElCefTQQM3wE34go1f7XsZWemV3NlRw6gjfbl+3WVxGYler9RpeW
	1asiMMl2tavvxJlZ8vMw2pLqeDP9r9maWLdFz+afhpWUYunOWnxCA//Ai9merqcTPd9i
	8J7vVHjFhSyyoaevIA7yw010fsEbwQHDD1IbqCWRyBCdHFPKNavN/b4JahdHGJF1pbDv
	NLlVuhJvU2R7rf57QM6OtdBwAWapxpqE3eWSY8ULBQK8DHEM+w7rr+AbXLODB/fOpVxw
	VeBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=RB395Ncqrrb4FgmXvHMCGmuz1xvsKQhCIwuFpEUb/I4=;
	b=lQHoSN7u02MuCRS4BlwgYhk1EtMlq2dtBLFQ0iIAJMzAn6Hs/+ur9Em5Q7tVAxN6dP
	9L8VP+rw5iibiXGsGbhsyb7nmeUkNWqbgSyWuJd91bC17AXltD6rvJ4tKsigIIhNht5t
	Qcj19n0zE0ezvMWY9IEtQN3ys1NF+M4lNaOXu2EzB1vOOMnDQ9cHLF0xvhjGeV+6yid+
	6W7VOHhsq3LeKTBQtHZ1qDBYnyuME7fCwLr6sfH7nUZiAYxNYZxDnzhV8sk0OA3kf37T
	CQWAdBVBBefSW/R/WeOzlFTosqVChPWNk/25ZaHQXFnTXaaMJUVGtGPoSRxkhgaN2l9p
	2WXw==
X-Gm-Message-State: AHQUAuY7kJsn1rT5u2NBa4WHVQpmnNpj6PJWl1D+GP7sLjEDCo67sFD+
	+p6njxWsghvjcfr3O+xtwshYfbRuQG8f8D1P+dmmgywwxtc=
X-Google-Smtp-Source: AHgI3IZp15HopSZbJkOewsIFS/e5iGih/+qHpIMpgdsl1cmXLJcjQcAO2ljDuZfSrtZGEjTlsC/cJvopP0ndkuVOA3g=
X-Received: by 2002:a02:240d:: with SMTP id f13mr23080202jaa.105.1550763865307;
	Thu, 21 Feb 2019 07:44:25 -0800 (PST)
MIME-Version: 1.0
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 21 Feb 2019 15:44:13 +0000
Message-ID: <CAJTo0Lb9Aspc0Nu+H3eRzbQcOLDevn40hJ5Jnib1DKo8k4R2cA@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>
Subject: Incorporating deploy artefacts from one multiconfig in another multiconfig
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Feb 2019 15:44:24 -0000
Content-Type: text/plain; charset="UTF-8"

So I'd like to use multiconfig for a fairly typical host/container use
case.  I've a class which can be used to build packages from images in
a fairly simple manner, essential just taking files from DEPLOY_DIR
when creating a package:

core-image-minimal-package.bb:
do_install[depends] += "core-image-minimal:do_image_complete
virtual/kernel:do_deploy"
do_install () {
    install -d ${D}/var/lib/machines/
    install ${DEPLOY_DIR_IMAGE}/core-image-minimal-${MACHINE}.ext4
${D}/var/lib/machines/core-image-minimal.ext4
    install ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}
${D}/var/lib/machines/${IMAGE_NAME}.${KERNEL_IMAGETYPE}
}

This part works fine, but the problem is straddling multiconfig boundaries...

I can't just add "core-image-minimal-package" to IMAGE_INSTALL because
it will build that for the current configuration.  I can't just add
"multiconfig:uos:core-image-minimal-package" because that will look
for a recipe with that name.  I've a rather ugly hack to call opkg
directly in a post-rootfs hook which sort of works.  Linking in bits
of the other configuration's deploy directory in a pre-rootfs hook and
extending IMAGE_INSTALL there almost works, apart from the rootfs code
then looks at the task dependencies to generate a pruned deploy dir,
which is missing the pieces I linked in.

I suspect this is now breaking new ground: the multiconfiguration
support lets you do builds but so far the artefact sharing hasn't
really been explored.  Has anyone dug further into this?

Ross

