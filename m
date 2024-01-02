Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CB08C46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 13:01:17 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by mx.groups.io with SMTP id smtpd.web11.28236.1704200468694567809
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jan 2024 05:01:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@posteo.com header.s=2017 header.b=Bf6uW7er;
 spf=pass (domain: posteo.com, ip: 185.67.36.65, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 7DC59240027
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Jan 2024 14:01:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1704200466; bh=99HFE33fcCg0ZC+vimtfJe5isZY0Cp7h1KkxM2UXQUs=;
	h=Message-ID:Subject:From:To:Date:Content-Transfer-Encoding:
	 MIME-Version:From;
	b=Bf6uW7ere7GWsOVfaG9fgM2ji3oRkXLf2EOULhNCggR3xN1XRJaQDlsuiAUyyGkOJ
	 f+Np8M4Tyk6X3qO+bwGUtvcXBgdzXAC60xZcZ2gdAHkYt6OyqYCooIAIbCLEFRj2t9
	 0j8nwAlHtBH/gMsExWWNgFrspShISmsqzHsdUv1U/sTr9j9BBulFLrPFhBdvtDp/R7
	 WB6xSv19zKhDY15bjDqB6970/ckfIZSFEeXx3UNkDO7MhdIbDGSmZ8rufLWMaBSuc8
	 fMWpYEHF6CFLdizzl+8Wgst6sLvzU7g3/H5YxjFyFFu5cRgF7wf6ZDOIPT++YEIAEC
	 RLGCqMIXH6k3w==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4T4Cds0KLHz6ty7;
	Tue,  2 Jan 2024 14:01:05 +0100 (CET)
Message-ID: <0d02d2b75606238c8355a6a19e23c70ab0bb8d31.camel@posteo.net>
Subject: Re: [OE-core] [PATCH] patchtest: Add test for deprecated
 CVE_CHECK_IGNORE
From: Simone =?ISO-8859-1?Q?Wei=DF?= <simone.p.weiss@posteo.com>
To: simone.p.weiss@posteo.com, openembedded-core@lists.openembedded.org
Date: Tue, 02 Jan 2024 13:01:04 +0000
In-Reply-To: <4872.1702932173537517107@lists.openembedded.org>
References: <878d9666-9b33-4058-853e-081181f46c74@baylibre.com>
	 <4872.1702932173537517107@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 13:01:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193231

On Mon, 2023-12-18 at 12:42 -0800, simone.p.weiss@posteo.com wrote:
> > I agree,=C2=A0 this would be a good change to make for long-term
> > maintainability. LGTM otherwise.
> I have tried to implement such a check as well, and while this check
> is fine
> and works, the test of a patch with patchtest containing a variable
> from
> BB_RENAMED_VARIABLES that is not a pretest, i.e. the patch is already
> merged,
> the tinfoil setup and the subsequent parsing of the recipes while
> raise an issue for this test.
>=20
> e.g.=20
>=20
> ERROR: Variable SDK_LOCAL_CONF_BLACKLIST has been renamed to=20
> ESDK_LOCALCONF_REMOVE
> ...
>=20
> So on the one hand the issues is already cached by other parts of the
> buildsystem and on the other hand this will cause tests not related
> to
> renamed variables to fail.
>=20
> It was suggested on bugzilla by Trevor to merge this original test
> and open
> an issue in bugzilla to address the question of
> BB_RENAMED_VARIABLES separately. See [1]
>=20
> If you do agree, please tell me if a rebased version of the patch
> would be
> needed or not.
>=20
> - Cheers,
> Simone
>=20
> [1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15311#c5
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192677):
> https://lists.openembedded.org/g/openembedded-core/message/192677
> Mute This Topic: https://lists.openembedded.org/mt/103112424/8052774
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-
> core/unsub=C2=A0[simone.p.weiss@posteo.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20
Hi,

any thoughts on this?

Cheers,
Simone


