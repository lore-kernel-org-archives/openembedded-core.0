Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03F29CD1288
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 19:02:26 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.46329.1711998142251092175
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 12:02:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CACF140BE6;
	Mon,  1 Apr 2024 19:02:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aD24aFn25MJu; Mon,  1 Apr 2024 19:02:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 13B29400CF;
	Mon,  1 Apr 2024 19:02:11 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5EEA2163EF7; Mon,  1 Apr 2024 15:02:10 -0400 (EDT)
Date: Mon, 1 Apr 2024 15:02:10 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Martin Jansa <martin.jansa@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Mark Hatle <mark.hatle@kernel.crashing.org>,
	Marta Rybczynska <rybczynska@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	wangmy@fujitsu.com
Subject: Re: [OE-core] [PATCH 36/36] xz: upgrade 5.4.6 -> 5.6.1 _WARNING_
Message-ID: <20240401190210.GQ6072@denix.org>
References: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
 <1710313714-12541-36-git-send-email-wangmy@fujitsu.com>
 <2d88c7fc227e44acf14470103dadd92e026b62f9.camel@linuxfoundation.org>
 <36b1d7d1-c1ea-4d1a-b7a7-27ff550cdcc7@kernel.crashing.org>
 <CAApg2=Tq7i4u3+U9iNXQufH8kKwnfty2OG=OUeL23j9PT9gFJA@mail.gmail.com>
 <d21d06c112a43b8d29ab98a05a3088a16c5d4dac.camel@linuxfoundation.org>
 <CANNYZj8DCqKE9_ftZTKfj8UY5tnDUnPhETN++3SjeNDT_S4_iA@mail.gmail.com>
 <CA+chaQd5mQv5ciJWbXHG1OdsQ7AW_H8dfVJrNaTV-p7qiqHusw@mail.gmail.com>
 <13c0dc257dd36f6048561a1ce6b2f76e9a04700f.camel@linuxfoundation.org>
 <CAGNsrLBM7DptiF-7t_B5aK=v_uBcYD52Ksp2ebgS44Ny0NvxaA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGNsrLBM7DptiF-7t_B5aK=v_uBcYD52Ksp2ebgS44Ny0NvxaA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 19:02:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197849

On Mon, Apr 01, 2024 at 11:42:51AM +0200, Fathi Boudra wrote:
> On Sat, 30 Mar 2024 at 17:18, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Sat, 2024-03-30 at 14:06 +0100, Martin Jansa wrote:
> > > From what is publicly known it injected malicious code (through m4
> > > macro using payload hidden in obfuscated compressed test file) into
> > > built liblzma.so.5 which then hijacks RSA_public_decrypt call e.g. in
> > > sshd (when sshd is built with patch adding systemd notifications
> > > which brings liblzma dependency to sshd e.g. on debian and ubuntu
> > > based systems).
> > >
> > > The build systems which just built this xz version shouldn't be
> > > affected (as it won't be using the liblzma.so from the OE build on
> > > the host).
> > >
> > > This publicly known part should be OK for OE, but it's right to be
> > > worried about the other things which aren't known (not only from
> > > these guys or from xz project).
> >
> > I concur.
> >
> > It is worrying but I've kind of been expecting something like this for
> > a while unfortunately.
> >
> > We need to watch what is going on and act accordingly if/as anything
> > else becomes known.
> 
> https://nvd.nist.gov/vuln/detail/CVE-2024-3094
> 
> Distros have downgraded to older releases, still trying to figure out
> which version to use.

While 5.4.6 version we've upgraded to in February was not yet compromised, 
it was already being taken over by Jia Tan, moving releases to controlled 
subdomain of xz.tukaani.org hosted off of GitHub directly, preparing for the 
malicious release of 5.6.0 and 5.6.1. So, we've pointed to GitHub location 
accordingly:

https://git.openembedded.org/openembedded-core/commit/?id=9cc6c809c154019afe3bf6e6d617eab640faa4d0
https://git.openembedded.org/openembedded-core/commit/?id=5be69fc3ff6296411c736e5c7c9522d99c0be2c6

But GitHub has suspended the project and associated developer accounts. The 
original maintainer has posted some details on this matter here:

https://tukaani.org/xz-backdoor/

Again, 5.4.6 tarball wasn't compromised, but it is no longer accessible from 
GitHub - should we revert back to 5.4.5 that was hosted on the original site? 
Though it should be mirrored...

-- 
Denys

