Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EF38C54791
	for <webhook@archiver.kernel.org>; Sun, 10 Mar 2024 09:05:01 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.30591.1710061491413693630
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Mar 2024 01:04:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=LNdfTOxU;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+FsoJv5VPRBY0eNDsHnsNUjDOk52ZBXRor/iQb1npaI=; b=LNdfTOxUhN7u0f8aSG5aA/UsTC
	xXf+XCAiaJt1Mudz0yXpPVD/tDwEzs517v31s8e9fvyeMjkNKYgtpTdXoOgV0+AdBp9Reeb6/9Eew
	Dg5+szNUtzFbP/Pydpupz60qchGqN9TYsSeU2TEkDp/Wryl/+BiAFneS8cfyyhbXE7+jxj2vaxEA6
	w4k8c0J+fMzwYUhhPmnBckDwywefpEGHQnRrhUUI8gAJRaZCRYu/NKZxxVgXRlotjz9gO70muVC2l
	ZRwhx6KbA6RAm/6wFF1qGILYRc5shd4cQ36uKdexYLfp/sOkkRoTDS45TYbU3KR+JiEle+Y+BBKIv
	zLznib5A==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:49240 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1rjF6v-00C8FV-1A;
	Sun, 10 Mar 2024 05:04:50 -0400
Date: Sun, 10 Mar 2024 05:04:33 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <foss+yocto@0leil.net>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>, 
    OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] more pedantry: observation on PACKAGES ordering and
 bash-completion.bbclass
In-Reply-To: <6E887B41-7933-45E5-ADB5-4C6FD33CD1CA@0leil.net>
Message-ID: <2c7f3cd6-3366-7cd1-53c-4ca7e2657993@crashcourse.ca>
References: <8d17a5b5-4cea-34f0-d0bf-a1e0ff1c9db1@crashcourse.ca> <6E887B41-7933-45E5-ADB5-4C6FD33CD1CA@0leil.net>
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
 <openembedded-core@lists.openembedded.org>; Sun, 10 Mar 2024 09:05:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196877

On Sat, 9 Mar 2024, Quentin Schulz wrote:

> Hi,
>
> On March 9, 2024 10:38:18 AM GMT+01:00, "Robert P. J. Day" <rpjday@crashcourse.ca> wrote:
> >
> >  currently perusing countless recipes to choose really good
> >pedagogical examples of "ptest" usage, and i began running across a
> >number of recipes that (unrelated to ptest) included snippets toward
> >the end of their recipe files that added content to FILES:${PN}.
> >here's an example from fwupd:
> >
> >https://github.com/openembedded/meta-openembedded/blob/master/meta-oe/recipes-bsp/fwupd/fwupd_1.8.9.bb#L130
> >
> >    FILES:${PN} += "${libdir}/fwupd-plugins-* \
> >                ${libdir}/fwupd-${PV} \
> >                ${systemd_unitdir} \
> >                ${datadir}/fish \
> >                ${datadir}/metainfo \
> >                ${datadir}/icons \
> >                ${datadir}/dbus-1 \
> >                ${datadir}/polkit-1 \
> >                ${nonarch_libdir}/modules-load.d"
> >
> >  since i knew(?) that the default PACKAGES list is processed left to
> >right, and that the PN package is left until the end to gather what
> >remains, i couldn't understand why so many recipes insisted on adding
>
> "to gather what remains," is not entirely correct. FILES:${PN} is not a grab-all variable, it still only takes files matching the globs inside the variable, which defaults to:
>
> """
> FILES:${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*${SOLIBS} \ ${sysconfdir} ${sharedstatedir} ${localstatedir} \ ${base_bindir}/* ${base_sbindir}/* \ ${base_libdir}/*${SOLIBS} \ ${base_prefix}/lib/udev ${prefix}/lib/udev \ ${base_libdir}/udev ${libdir}/udev \ ${datadir}/${BPN} ${libdir}/${BPN}/* \ ${datadir}/pixmaps ${datadir}/applications \ ${datadir}/idl ${datadir}/omf ${datadir}/sounds \ ${libdir}/bonobo/servers"
> """
>
> And you can see that the paths added to fwupd aren't matched by those default globs, hence why they are added.
>
> >extra content to FILES:${PN} when the default processing would have
> >collected it anyway, unless ... there was something that had been
> >appended to PACKAGES that required that.
> >
> >  sure enough, bash-completion.bbclass:
> >
> >    PACKAGES += "${PN}-bash-completion"
> >    FILES:${PN}-bash-completion = "${datadir}/bash-completion ${sysconfdir}/bash_completion.d"
> >
> >  my understanding is that the "proper" ordering of PACKAGES is to
> >start with the most focused and specific packages, define their
> >content, then move on until, at the end, whatever remains goes into
> >PN. which makes that definition of bash-completion.bbclass a bit
> >puzzling -- why was it not *prepended* to the PACKAGES list given its
> >specificity? and making all that subsequent addition to FILES:${PN}
> >unnecessary?
> >
>
> If a file is matched only by one glob, then it doesn't matter much
> in which order the packages are listed, which is very likely the
> case here.
>
> One reason could simply be that += is more natural than =+ and
> seeing that += worked, the contributor didn't think twice about it.
>
> FWIW, one can also do PACKAGE_BEFORE_PN += "${PN}-bash-completion"
> to have bash-completion done right before PN instead of first if
> using =+.
>
> Moving bash-completion package somewhere else in the PACKAGES list
> likely wouldn't change anything of the globs in FILES:${PN} though.

  you're right, i just thought the structure looked awkward.

rday

