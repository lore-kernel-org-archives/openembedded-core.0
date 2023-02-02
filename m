Return-Path: <florian.bezdeka@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FA79C61DA4
	for <webhook@archiver.kernel.org>; Thu,  2 Feb 2023 08:16:04 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.10006.1675325757080503745
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Feb 2023 00:15:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=florian.bezdeka@siemens.com header.s=fm1 header.b=pLAg6ush;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-68982-20230202081552bc9694b470c94f84d7-x4bgl4@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20230202081552bc9694b470c94f84d7
        for <openembedded-core@lists.openembedded.org>;
        Thu, 02 Feb 2023 09:15:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=florian.bezdeka@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=ybCgzmueQg7AFnxCWSob2Vr8Q5jLQGy510Xih+ZRS9g=;
 b=pLAg6ushOfh6CwJOhrnqriXGr3QqQcshwZhiGFSkDPd72fXoL5kbS9lkoUigrui8IJN2Pl
 KsDW9mPW334s+fzwEOEaHTS4NP8CyQoSZ1z4A3L3duVqz6H1N5nI3QvK+EMmCfovUICOAEnc
 f6tcB9bcr4EuUg/Gf6j+H47bqNGns=;
Message-ID: <4b2e3ab321871e87c72bf389b764987a1ba18a42.camel@siemens.com>
Subject: Re: [OE-core][PATCH] oe-git-proxy: Enable oe-git-proxy for git >=
 2.32
From: Florian Bezdeka <florian.bezdeka@siemens.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 02 Feb 2023 09:15:51 +0100
In-Reply-To: <173FB852EC318283.30239@lists.openembedded.org>
References: <173FB852EC318283.30239@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-68982:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Feb 2023 08:16:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176683

Hi Richard,

please hold this one back. Will send a v2 hopefully soon. One more side
effect discovered that needs investigations first. Sorry.

Best regards,
Florian

On Wed, 2023-02-01 at 15:04 +0100, Florian Bezdeka via
lists.openembedded.org wrote:
> Modern git versions (>=3D 2.32) have a optimization enabled where the
> socket communication is moved into half-duplex mode once the client has
> sent all necessary data and is waiting for RX. git is simply closing the
> TX part of the socket.
>=20
> There are proxy implementations out there that will shutdown the
> complete communication once the partial shutdown was received - breaking
> the git:// protocol.
>=20
> Using socat with the ignoreeof option fixes this issue. Closing one of
> stdin/stdout will not trigger a partial shutdown of the underlying
> socket.
>=20
> ignoreeof is a stone old feature. It will not break in combination with
> older git versions - where the partial shutdown will not be triggerend
> anyhow.
>=20
> Link: https://lore.kernel.org/git/4831bbeb0ec29ec84f92e0badfc0d628ecc6921=
d.camel@siemens.com/=20
>=20
> Signed-off-by: Florian Bezdeka <florian.bezdeka@siemens.com>
> ---
>  scripts/oe-git-proxy | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/scripts/oe-git-proxy b/scripts/oe-git-proxy
> index aa9b9dc9a9..80a7a030a7 100755
> --- a/scripts/oe-git-proxy
> +++ b/scripts/oe-git-proxy
> @@ -184,4 +184,4 @@ else
>  	METHOD=3D"PROXY:$PROXY:$1:$2,proxyport=3D${PORT}${PROXYAUTH}"
>  fi
> =20
> -exec $SOCAT STDIO "$METHOD"
> +exec $SOCAT STDIO,ignoreeof "$METHOD"
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176533): https://lists.openembedded.org/g/openembedde=
d-core/message/176533
> Mute This Topic: https://lists.openembedded.org/mt/96676758/5792637
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [fl=
orian.bezdeka@siemens.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


