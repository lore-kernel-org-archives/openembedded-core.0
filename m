Return-Path: <francesco@valla.it>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F29CC1098781
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 13:27:40 +0000 (UTC)
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.11])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12670.1774013252290073300
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 06:27:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@antispam.mailspamprotection.com header.s=default header.b=L7ajkTNi;
 dkim=pass header.i=@valla.it header.s=default header.b=kuro1yE1;
 spf=pass (domain: valla.it, ip: 185.56.87.11, mailfrom: francesco@valla.it)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-6gs4.prod.antispam.mailspamprotection.com; s=arckey; t=1774013252;
	 b=cph13mz+bDHOktrA/Gbl1hIl4lCN65UKGAl35Gz9ZFRG/U3PbedD/1daZ7MFmSkHT3ZeWQ2dOw
	  s6mTQgGgXG0+zNObr2Q1AD4o1Gj9CyE8oNUCoDG3gvhQ4FPv428rr/EASdvNHa2im1gPegfcMP
	  3Ksd9ATlNAeuxXJz/oqSJk3xuPDqGULkhYqXxkwmFEtHC1+ZchTmI1uxxxMVKoMNALBjG27lBl
	  X/GsvKwyqgOwMALQK9NfYvtZuqr8rhdUNiZOhp5KNDxory7EJlG2buw0XSSYJYusugHkZQx5rI
	  Clmmjbig2LzTmxIKGYSyR1xX36eOvnxROTHyh7VBBqz3dQ==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-6gs4.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-6gs4.prod.antispam.mailspamprotection.com; s=arckey; t=1774013252;
	bh=sFhojspRm+8YK055ttsdZ8N7vByTdFilhJEFIVnjeUU=;
	h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	  Message-ID:Subject:Cc:To:From:Date:DKIM-Signature:DKIM-Signature;
	b=XH5oC+tbGPFc/3B35xhjyJn1Q3ayzX+9p9X7Ydq6OmeIy7Ea3vpZoUvWAasq8kam2I+UdXCsyh
	  1aJ9a/eHgLQ7rqUh4Ok4g1xA4IQNOwoz4LTFUDAK7O0XIx5JH+jJk/HucSaLiO2ZwE7FUPQRjP
	  POcBdt8nBCrYg6VbY6yAvBf+Njri8Y9RKXjxbSoEsCR0R8LBqfW4L6EGgT8MIcIf4i9fcwU0oq
	  kmcrOZd/OBZyEP408eZDBDNjjtrJlexxytCzjFvcagOKmwgdOwHvw4HCT0J6S8mAn+1yaqh/lh
	  WLct+RUf719RDnj0Pyh8jK/1XRNrFIxBomQ2XK51RnBUuQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To
	:From:Date:Reply-To:List-Unsubscribe;
	bh=41mnGPBeTaC/3JwuklYtTuNNNSZLulmWKP+jRztmeKc=; b=L7ajkTNi3aG1/5VAClkJ2UptJQ
	KWsOkKJcSEUq3tqcxPW5Yhn4O/susAEvtmlym5qzguL0Jt87lJg1Tx5O75TzrVYz2Avtnuz8Qf7DZ
	y+FTExg119hjMbmta6GO5lX4lZmUbEdFBOe2REzORey/ryQnLJyGIrfpTfrwSR6pqIQc=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-6gs4.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1w3Zst-00000002DC1-1r3t
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Mar 2026 13:27:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=41mnGPBeTaC/3JwuklYtTuNNNSZLulmWKP+jRztmeKc=; b=kuro1yE1sRaGJVQV3LfZxk/hxa
	DZ5FNEjTWw7OcjG3ioCJHIcy+gBp+75Yq5jGSa6OEwIq1Alxcv3pVIGuOmEqOI36KDN8kEQ2h58hE
	tuyJfcfgvgj8+821wXi7mMssXWIJg0uFyu8fi9Z837WKMloo/twVpVHW4S9aPuY3VXB4=;
Received: from [82.57.88.19] (port=60950 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <francesco@valla.it>)
	id 1w3Zsm-00000000Bie-37F4;
	Fri, 20 Mar 2026 13:27:20 +0000
Date: Fri, 20 Mar 2026 14:27:19 +0100
From: Francesco Valla <francesco@valla.it>
To: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Francesco Castagnotto <fcastagnotto@linux.com>
Subject: Re: [PATCH RFC 1/4] bootconfig: add recipe
Message-ID: <ab1J5aEpSIGSTRw3@bywater>
References: <20260319-bootconfig-v1-0-a4d467c3f0ba@valla.it>
 <20260319-bootconfig-v1-1-a4d467c3f0ba@valla.it>
 <4ba9dee07620ce57643a005f6578fbd32efd9e8f.camel@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4ba9dee07620ce57643a005f6578fbd32efd9e8f.camel@siemens.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 52b388841d7d2f887c581379cbad1ff2
X-AntiAbuse: ID - 52b388841d7d2f887c581379cbad1ff2
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1w3Zst-00000002DC1-1r3t-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-6gs4.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 13:27:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233608

Hi Adrian,

On Thu, Mar 19, 2026 at 08:54:35AM +0000, Freihofer, Adrian wrote:
> Hi Franceso
> 
> Thank you for the patches.
> 
> On Thu, 2026-03-19 at 00:30 +0100, Francesco Valla wrote:
> > Add a new recipe for the bootconfig tool, with source coming directly
> > from the kernel shared workdir.
> > 
> > Signed-off-by: Francesco Valla <francesco@valla.it>
> > ---
> > �meta/recipes-kernel/bootconfig/bootconfig.bb | 44
> > ++++++++++++++++++++++++++++
> > �1 file changed, 44 insertions(+)
> > 
> > diff --git a/meta/recipes-kernel/bootconfig/bootconfig.bb
> > b/meta/recipes-kernel/bootconfig/bootconfig.bb
> > new file mode 100644
> > index
> > 0000000000000000000000000000000000000000..77ee70dd1839ef90a292cf829f4
> > f3a4353f85c28
> > --- /dev/null
> > +++ b/meta/recipes-kernel/bootconfig/bootconfig.bb
> > @@ -0,0 +1,44 @@
> > +SUMMARY = "Apply, delete or show boot config"
> > +DESCRIPTION = "bootconfig is a tool that can be used to add a boot
> > config block \
> > +at the end of a kernel initramfs, as well as remove it or show its
> > content."
> > +LICENSE = "GPL-2.0-only"
> > +
> > +inherit kernelsrc kernel-arch
> > +
> > +do_populate_lic[depends] += "virtual/kernel:do_shared_workdir"
> > +do_configure[depends] += "virtual/kernel:do_shared_workdir"
> > +
> > +EXTRA_OEMAKE = "\
> > +��� -C ${S}/tools/bootconfig \
> > +��� O=${B} \
> > +��� CROSS=${TARGET_PREFIX} \
> > +��� CC="${CC} ${DEBUG_PREFIX_MAP} -ffile-prefix-
> > map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} ${CFLAGS}" \
> > +��� HOSTCC="${BUILD_CC} ${BUILD_CFLAGS}" \
> > +��� LD="${LD}" \
> > +��� AR=${AR} \
> > +��� ARCH=${ARCH} \
> > +��� V=1 \
> > +��� 'DESTDIR=${D}' \
> > +��� 'prefix=${prefix}' \
> > +��� 'bindir=${bindir}' \
> > +"
> > +
> > +do_compile() {
> > +	oe_runmake ${B}/bootconfig
> > +}
> > +
> > +do_install() {
> > +	install -d ${D}${bindir}
> > +	oe_runmake install
> > +}
> > +
> > +
> > +PACKAGE_ARCH = "${MACHINE_ARCH}"
> 
> This is not understandable to me. From the description I would assume 
> this tool runs on the host machine.
> 

I probably overthought the usecases here, with bootconfig being used on
the target for on-the-fly bootconfig modification. But this wouldn't
work with a FIT image obviously.

> > +
> > +python do_package:prepend() {
> > +��� d.setVar('PKGV', d.getVar("KERNEL_VERSION").split("-")[0])
> > +}
> > +
> > +B = "${WORKDIR}/${BPN}-${PV}"
> > +
> > +BBCLASSEXTEND = "native nativesdk"
> 
> If the tool runs on the host machine, should this not be a pure -native
> recipe without this line e.g. named bootconfig-native.bb
> 
> Is bootconfig a good name for a recipe? Or should it be e.g. linux-
> bootconfig-native.bb?
> 

linux-bootconfig is a good name, I'll go with it in the next revision.

> 
> Side note: We need to be careful not to create a dependency of the
> initramfs on the kernel build directory. Such a dependency would
> essentially invalidate the sstate-cache for the kernel, which we want
> to avoid.

Agreed, one of the unpoken reasons for the RFC label is that the
reasoning about dependencies has not been completed yes. I'm still
facing challenges e.g. for FIT vs WIC cross-dependencies when a
dm-veriry rootfs is used and its parameters are inserted into the FIT
image that lives in the boot partition.
But I wanted to gather a first round of impressions with a (working)
first version while working on it.

> 
> Regards,
> Adrian

Thank you!

Reagrds,
Francesco


