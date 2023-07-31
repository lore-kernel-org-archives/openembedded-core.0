Return-Path: <rpurdie@rpsys.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CA8CC001DC
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 10:57:06 +0000 (UTC)
Received: from dan.rpsys.net (dan.rpsys.net [217.169.23.60])
 by mx.groups.io with SMTP id smtpd.web10.4655.1690801016487680004
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 03:56:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@rpsys.net header.s=default header.b=1ihVmgpS;
 spf=pass (domain: rpsys.net, ip: 217.169.23.60, mailfrom: rpurdie@rpsys.net)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=rpsys.net; s=default;
	t=1690801001; bh=iv35PHoL9x5eMAmSKotT+xr5fAchVv+0sSSMtDUas2w=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=1ihVmgpSvOLuFj2pNLmqXGqI/u5p5ytl9empSSCsMv7dtb4QtG649CENBqNRgMsgq
	 5s7oDHdEaYyD51sdYA31PK4aL4KzQa7LlsqN5H/efeR7WVWAgKCOPik3rr7MX7UQLe
	 TS/jhgSPYVweUd/MS5Iw3ls4NB5/FacplCtKl3Xnx8Fc71vtE2eqoADGWT+ZSyJdbi
	 8f+H52N7d3x9o1me2KmuRncAgPoPhMeghb/D7p9OqX2IY8AXcacGSmhKQUjA8xRHAV
	 XQdYGCy261VYYXNdRm1S2I9CfEmeg4WaD1y2IRE2mzCtnRm3x3e/bFP8hmudqGPevB
	 ly5DGYGHBFMgw==
Received: from [192.168.1.7] ([192.168.1.7])
	(authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTPSA id 36VAudV5629445
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 31 Jul 2023 11:56:41 +0100
Message-ID: <ea898c7901735eee11dd07ee5ad3ab976cd44b95.camel@rpsys.net>
Subject: Re: [OE-core] [PATCH 2/2] oe-setup-build: add a tool for
 discovering config templates and setting up builds
From: Richard Purdie <rpurdie@rpsys.net>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Mon, 31 Jul 2023 11:56:39 +0100
In-Reply-To: <20230510095726.4090311-2-alex@linutronix.de>
References: <20230510095726.4090311-1-alex@linutronix.de>
	 <20230510095726.4090311-2-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at dan
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 10:57:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185134

On Wed, 2023-05-10 at 11:57 +0200, Alexander Kanavin wrote:
> This is the last (I believe) piece of the puzzle in setting up builds fro=
m nothing
> without having to write custom scripts or use external tools.
>=20
> After layers have been fetched and placed into their respective locations=
 by
> oe-setup-layers, one would surely want to proceed to the actual build, an=
d here's how:
>=20
> 1. Without arguments or with 'list-config-templates', the tool reads avai=
lable layers
> from .oe-layers.json file (written out by oe-setup-layers) and prints wha=
t
> templates it has found, as seen below. If the following is not enough inf=
ormation,
> adding '-v' will also print conf-notes.txt for each of the templates:
>=20
> $ oe-setup-build
> Available build configuration templates (re-run with -v to see their desc=
riptions):
>=20
> /srv/work/alex/poky/scripts/oe-setup-build setup-build-env -c /srv/work/a=
lex/poky/meta-poky/conf/templates/default
> will create a build configuration in /srv/work/alex/build-meta-poky-defau=
lt
>=20
> /srv/work/alex/poky/scripts/oe-setup-build setup-build-env -c /srv/work/a=
lex/meta-alex/conf/templates/configuration-gizmo
> will create a build configuration in /srv/work/alex/build-meta-alex-confi=
guration-gizmo
>=20
> /srv/work/alex/poky/scripts/oe-setup-build setup-build-env -c /srv/work/a=
lex/meta-alex/conf/templates/configuration-gadget
> will create a build configuration in /srv/work/alex/build-meta-alex-confi=
guration-gadget

I've just been looking at this again and I'm still not convinced this
is right. In particular, the above output worries me a lot, partly as I
barely understand it and I suspect if I struggle, I won't be the only
one.

With this kind of core tool, the "interface" to the user needs to be
really clear and the problem here is that it isn't.

Being more specific, from the above it is listing some commands I could
run, but the user is being left to work out what the difference is for
themselves. If I print a list like:

a) poky default
b) gizmo config
c) gadget config

then ask the user to select one, it is clear as the user is drawn to
the key information. In the above text output, you have to know where
to look in the commands to guess the pieces.

The "/srv/work/alex" string is confusing the output and in many ways
even filtering that out would help reduce the "superfluous" text but
the issue does run deeper than that.

As another example, perhaps I shouldn't need the -v to get at least
some summary of what each one does?

Cheers,

Richard


