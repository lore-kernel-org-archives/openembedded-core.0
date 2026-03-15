Return-Path: <francesco@valla.it>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD774D58B17
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 10:00:20 +0000 (UTC)
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26249.1773568802958880828
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 03:00:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@antispam.mailspamprotection.com header.s=default header.b=ZZzQRtyV;
 dkim=pass header.i=@valla.it header.s=default header.b=QpXoj1E2;
 spf=pass (domain: valla.it, ip: 185.56.87.13, mailfrom: francesco@valla.it)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-fd5n.prod.antispam.mailspamprotection.com; s=arckey; t=1773568803;
	 b=prNSF3gBdBXfqo8sHPjWswSV0kw7824GpPkd1nbbEil9YuWMkq5uX79DdNR04N33MwSk6Y+c9R
	  kKNHUr7WbQ5EtnN3mbi2OFD4I9WwibM1vXjOwqq/vOsGgrSdGoJntN2nyhQ1uDUnKIFb7386Zo
	  mynxlRcfTPSzKcXHhu87VLPVN4sm1MOaZBNjs5CWXeLq1w74bQOsDPpVlPD7cRADfMbQs5adRb
	  gnyJs6uaID7LoEG+SnXBbxp/DM+uw9qd5teHruQYBn9r6HF9tFLollteO131IynS1/mnJMOWZl
	  Tfvp/qjhXDzWbUcseI34QVy/n8yGx4MtB32FOR7DR8n9Sg==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-fd5n.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-fd5n.prod.antispam.mailspamprotection.com; s=arckey; t=1773568803;
	bh=jwSe9Z1vLNkqMkvJVrGjV3JcPy6jWF73O7VHc0dWZms=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=fUiLyyKuV7DNI7NmbJnMHgMg9XLWGPCo87VGTM8I+H602MP2Gu4BmvoQuKVA/EOr140Vrit9em
	  ITRf4v9KQx24EsKKInexc+VQQuyfQ6tM4Ae5GEbAwEkNeMD0DWQowGuTgjJW/oU19BV1slavKY
	  Ey7LFsC14dZghRCRUo+jTUTve2Qooyyz7Uch5hYI2TBisfmkWr+8XKwyQncWhXFUNdf5V/ieXt
	  7S1zdTkbH1zKtdnskTF92YZUR7PsMw4nf89cFFffpeGLwj0VTY3sCjcXrGpStmVmoMTp/td08B
	  h0P/Clj7JlrhkbyceLTL5fC5rZOBpvQX+b6d53myHDPmkg==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=cNgMS7KXK8S/mjdsnqi3vLFs5n7w26UDtJBQU5U3X5w=; b=ZZzQRtyVOftpcc0jj0jBAWfcFW
	wV3ec1keycRHnwlsw/VQtB3NxO3T6xFbhN0wzOoT+ZoF1R+Fg5WPvaQKDaNeAa1D1E86zU6cO3oB0
	203A+3t1SonLiE3NQnw9qyMdQHjTAuFYnG81ACfSWCLoEdC6VrMh6kKQP5rMpZRTlB+U=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-fd5n.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1w1iGM-00000002Xay-0xgw
	for openembedded-core@lists.openembedded.org;
	Sun, 15 Mar 2026 10:00:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=cNgMS7KXK8S/mjdsnqi3vLFs5n7w26UDtJBQU5U3X5w=; b=QpXoj1E2c0LAw5wvImppVXiwTF
	ai8Gj3sSwaqrkjRZ6EIKjVPXeYzu2E5xq6DwEwa9ddDpEf+ugUzDHE3QL1uo1cLr8ukJRzMGs55uX
	BUcc5ruOBHR5QImlgBfeTFf2CVzCPTi0zo7gwARSKjAJzjigPbczynzGBaVtvg2nGxbM=;
Received: from [82.57.88.19] (port=60470 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <francesco@valla.it>)
	id 1w1iGE-00000000E8P-1LQF;
	Sun, 15 Mar 2026 09:59:50 +0000
Date: Sun, 15 Mar 2026 10:59:48 +0100
From: Francesco Valla <francesco@valla.it>
To: Ryan Eatmon <reatmon@ti.com>
Cc: openembedded-core@lists.openembedded.org, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH] uboot-config: fix KCONFIG_CONFIG_ROOTDIR path
Message-ID: <abaCTNC03wDBeEMQ@bywater>
References: <20260305-uboot_devtool_fix-v1-1-4eeba4bbe4c4@valla.it>
 <444c3784-b4d5-4882-a71f-78351dff0a80@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <444c3784-b4d5-4882-a71f-78351dff0a80@ti.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 7b60951729864771ec861eb9d3e644b3
X-AntiAbuse: ID - 7b60951729864771ec861eb9d3e644b3
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1w1iGM-00000002Xay-0xgw-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-fd5n.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 10:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233106

Hello Ryan,

On Thu, Mar 12, 2026 at 03:56:51PM -0500, Ryan Eatmon wrote:
> 
> 
> On 3/4/2026 5:04 PM, Francesco Valla wrote:
> > Commit 22e96b3 ("u-boot: Make sure the build dir is unique for each
> > UBOOT_CONFIG") changed the u-boot build directory name to include the
> > UBOOT_CONFIG value the build is performed for. Align to the new pattern
> > also the KCONFIG_CONFIG_ROOTDIR variable, which is used by devtool to
> > create a config baseline in case the menuconfig task is enabled.
> > 
> > This fixes the following error, which can be seen when building u-boot
> > under devtool and UBOOT_CONFIG contains a single configuration:
> > 
> >    cp: cannot stat '<u-boot-builddir>/<u-boot-defconfig>/.config': No such file or directory
> > 
> > Signed-off-by: Francesco Valla <francesco@valla.it>
> > ---
> >   meta/classes-recipe/uboot-config.bbclass | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta/classes-recipe/uboot-config.bbclass b/meta/classes-recipe/uboot-config.bbclass
> > index 112fea2de44cd716fbe65598b275410a4fb90056..f7848396c17fdf4835053b9f5a45480ef8ce9f1f 100644
> > --- a/meta/classes-recipe/uboot-config.bbclass
> > +++ b/meta/classes-recipe/uboot-config.bbclass
> > @@ -251,7 +251,8 @@ python () {
> >               # Ensure the uboot specific menuconfig settings do not leak into other recipes
> >               if 'u-boot' in recipename:
> >                   if len(ubootconfig) == 1:
> > -                    d.setVar('KCONFIG_CONFIG_ROOTDIR', os.path.join("${B}", d.getVar("UBOOT_MACHINE").strip()))
> > +                    builddir = "%s-%s" % (d.getVar("UBOOT_MACHINE").strip(), config)
> > +                    d.setVar('KCONFIG_CONFIG_ROOTDIR', os.path.join("${B}", builddir))
> >                   else:
> >                       # Disable menuconfig for multiple configs
> >                       d.setVar('KCONFIG_CONFIG_ENABLE_MENUCONFIG', "false")
> > 
> > ---
> > base-commit: d3e757f21403554e7064c5fa2b353080d14d2ce7
> > change-id: 20260304-uboot_devtool_fix-170221fd17bc
> > 
> > Best regards,
> 
> 
> I'm working on adding a test for this change to make sure we don't break it
> again in the future and I noticed two things.
> 
> 1) This whole if block for the check is indented one for level too deep for
> what is required.  I'll include moving this when I send in the test.
>

Right, I did not notice it.

> 2) Do we really want to disable this if you have multiple configs.  The
> logic of UBOOT_CONFIG is that the last entry in the list acts like the
> "default" set of uboot files.  In other words, there is a symlink created
> with the proper UBOOT_BINARYNAME that points to the final version generated
> by the final config.  So we could point KCONFIG_CONFIG_ROOTDIR to that final
> build directory and not disable this feature 100%.
> 

This might help quick config change testing, but I'd at least leave a
warning in that case, as it might mislead users, especially when
approaching third-party layers with ton of configurations.

> 
> -- 
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS


Regards,

Francesco


