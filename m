Return-Path: <pavel@loebl.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB8FCD3940E
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 10:22:41 +0000 (UTC)
Received: from mxb.seznam.cz (mxb.seznam.cz [77.75.78.89])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12494.1775125352706649608
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 03:22:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@emailprofi.seznam.cz header.s=szn1 header.b=brxhp+6W;
 spf=none, err=permanent DNS error (domain: loebl.cz, ip: 77.75.78.89, mailfrom: pavel@loebl.cz)
Received: from email.seznam.cz
	by smtpc-mxb-798b96f97c-6m97p
	(smtpc-mxb-798b96f97c-6m97p [2a02:598:64:8a00::1000:916])
	id 4e3e563755acdbe34adbefb5;
	Thu, 02 Apr 2026 12:22:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=emailprofi.seznam.cz; s=szn1; t=1775125348;
	bh=LTpWG6XrTtUSKJlGO1IzFeYDlFNl4SrKYa3V1vcP9YU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=brxhp+6WWjK/hWu30Jgq4Ag2UouuOW46wf25g1jELiN716Gj2O+Klj/s5lJJiyt+X
	 XfaEc4kM3kSSyJrg6AP+qdinFclVjpOuL/yQTsb9skTKtBuOd5MqAiOshS2AYHUhgu
	 ue/aMDvk5eYjkiahe29Q7hJ8mIlEgwVMud29w0kEHXmC5FKCw5iSDPsuW7K1nVTRPC
	 UVL+psIWV6RSZqQex5FwjWTJwIn8L912zyTObrrwMBiHs86nKvTxrOmhkleVihuNKq
	 Mpairkh6lF6RdJFWEG2F77uFWfEANeYXhbB6TqiVSiLEqyAsn+3IPKkLaJj357BPzU
	 RiV/IfQlex7hA==
Received: from localhost ([2a03:a900:1020:47::f71])
	by smtpd-relay-789d8dfb5c-gs6tr (szn-email-smtpd/2.0.71) with ESMTPA
	id 542f5ef8-7f2e-4fc3-b480-9073562d1b7a;
	Thu, 02 Apr 2026 12:22:24 +0200
Date: Thu, 2 Apr 2026 12:22:15 +0200
From: Pavel =?utf-8?B?TMO2Ymw=?= <pavel@loebl.cz>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org, 
	Michelle Lin <michelle.linto91@gmail.com>
Subject: Re: [PATCH] uki.bbclass: fix ukify arguments assembly
Message-ID: <ac4-MU8f_cm-3Hv9@alena.lan>
References: <20260402073331.2436504-1-pavel@loebl.cz>
 <ac4gK-MO4ZadNHHf@nuoska>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ac4gK-MO4ZadNHHf@nuoska>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 10:22:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234512

On Thu, Apr 02, 2026 at 10:52:11AM +0300, Mikko Rapeli wrote:
> Hi,
> 
> On Thu, Apr 02, 2026 at 09:33:15AM +0200, Pavel L�bl wrote:
> > Missing space before --uname ukify option mangles the command line
> > string when KERNEL_VERSION is set.
> 
> Thanks, this is a clear bug.
> 
> meta/lib/oeqa/selftest/cases/uki.py could be improved to cover this.
> I would be interested to know if the kernel version autodetection
> does not work since that is preferred by ukify.py and this KERNEL_VERSION
> handling in uki.bbclass could be removed.
It works for me now. I just ran into this bug while trying different class
variables. In the end I had build misconfigured in other places (missing efi
machine feature and possible some other stuff).

Regards,
Pavel

> 
> Reviewed-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> 
> Cheers,
> 
> -Mikko
> 
> > Signed-off-by: Pavel L�bl <pavel@loebl.cz>
> > ---
> >  meta/classes-recipe/uki.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uki.bbclass
> > index 326697a06660..a89e92b77869 100644
> > --- a/meta/classes-recipe/uki.bbclass
> > +++ b/meta/classes-recipe/uki.bbclass
> > @@ -140,7 +140,7 @@ python do_uki() {
> >          # not always needed, ukify can detect version from kernel binary
> >          kernel_version = d.getVar('KERNEL_VERSION')
> >          if kernel_version:
> > -            ukify_cmd += "--uname %s" % (kernel_version)
> > +            ukify_cmd += " --uname %s" % (kernel_version)
> >      else:
> >          bb.fatal("ERROR - UKI_KERNEL_FILENAME not set")
> >  
> > -- 
> > 2.53.0
> > 

