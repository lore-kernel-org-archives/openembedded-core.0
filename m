Return-Path: <christoph.lauer@email.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66C8BC43334
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 21:12:47 +0000 (UTC)
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by mx.groups.io with SMTP id smtpd.web10.30.1657746760836222551
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 14:12:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=O3wev59F;
 spf=pass (domain: email.de, ip: 217.72.192.78,
 mailfrom: christoph.lauer@email.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
	s=dbaedf251592; t=1657746758;
	bh=EtTQUp078Ln61iNd8sgRVMGfW+EERyTQ0XnzQ27MBww=;
	h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
	b=O3wev59FJl5kJRRC7zGGnyoVv352MVViBnQyJXoEnDtVpz6zdb9/Zw2sMqQpNZUDp
	 C/ETWrX3juPY2jSgH3sqGv2tz52nFRMNJ1rRXA20hpGPwbxLKcNjKqqFxTY0GlakmN
	 NFZ4bRfTWasdWCVMsuCluPNHtSYlskiAM9DA57Vs=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [172.18.0.166] ([178.251.90.190]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MCol0-1oKV6M2GWm-00967n for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Jul 2022 23:12:38 +0200
Message-ID: <0f90c770-b535-a433-d5ea-9593b4ada2e7@email.de>
Date: Wed, 13 Jul 2022 23:12:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [OE-core] [PATCH v3] package.bbclass: Avoid stripping signed
 kernel modules in splitdebuginfo
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <17017FA173577DB7.30522@lists.openembedded.org>
From: Christoph Lauer <Christoph.Lauer@email.de>
In-Reply-To: <17017FA173577DB7.30522@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OugMchVal1RejPlWsgsrwUKbmVVztAInUY++oPrP7s2CdmdqCB0
 Uof3cl6J843lYF6pFVvIjvAjn7eJlDHcOHfhzL59VQjoM7fhOnapQ6TEiSTZSz6ppUT/YOu
 hYiNEdMy3giSEJMiWVmkN8LodDp3fnyiWWzMpe/6IjIIlPGGq30RCG8HUw6osYTftGH11Tu
 HFaHJYZLyU/clDHx81YXQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:aYdfM36p6G0=:XAPmrBOaDVucSYx2RvTukc
 kCd/6mkpNaXE59ABLxX1iSAC33ACw+exBSurCxPrZ6aZ/mOgtt0AMyF5hV9+0xLl2jbv3YHmA
 Oo39hCqdm/e5SXEtSoJNAo8Pzsidm+bcwA9coCf7l0LYfMB8R0aSbqvQK4uvrqx4baOjCO+Te
 CoBAVi1sCidU2YMkX+jWrEHJMSJhbukJhTo+uw/3e1oxzNgKSxY2DXmaACed6cUOM3D/PWK8k
 CXTNAS/3lMjTtK7pqmDhbbhUrIFPlfLlBE2cuYzHL2hrJVAjFFqvPFmVOZZgx7BezWIlUlKB1
 w7A85I+maW4qpL0elJnUGDdf8dg1nRfNU5T/A2UtO3DsEm2uba+XnA0Dyc9171rzmwSHw11BC
 /U3opfTJ7MECdcHQiBUzWMeI2zF4A3+KqyNK/8LQbe+8YtLH98b76yE9Y9r1SsbX1RXiUBTJC
 VW3wJj6jCfsvUkB9RFRj6251p+SB3p7kya9bQVeU/bQqJMjHDoA9Uaxt/p5mgJkMzQwx/9oXM
 cSAGlHxQWvqS+zfKItVgB2zmzGIPERhHaO4iqdVmccg+c1hLeSab+mPkrp9hNy3qaoQ6EE5LW
 cY7bKghq4eZ7dz9LVxVPpa6O7aDieJa6uUOQX0GilzhCHLboWUrf0CV1QFz5QsTAEVrC74aDW
 SM9nS5fAyIfDSk5XmQ33cQVQ0duMLionOlKpyPlW5W0X3Tzs6HXP/Ty3uSBZARlh6OqVtBd+0
 15yoeMb/UeRdJMhKODepaX/yc4BGRSr8Ce8mfiQ1N0xhvCvPLEDXNFoBlk+TzQafDli9T6ImL
 nNeor4BnraSs76PxHitJ3o0fJ1HRM5C7DFIHXTSRng1ooHLhis7U4+qzvxKrD/cPtXWxBwCVF
 wsIYVTClqOucujw7MMDUYMl2JWHgs/GGcnbsa9s2aB1B0CuEBwnP/f44ew32BvAG8x0NH44/v
 mpmYC55B9IeVQiB2z+PEY+dEY6wtMvJu+0xAN6Uqa5bOF+joNKOM9Jo08b3gdxqy8t5tFnGx0
 8Gvq6Pr4E4d1AqXbwZKi5MmypxYwR+X/Jxgq610InVGnm1fNu8VdMLb0pEERVsgd5NXMD6M4W
 6YKUvtiqbBluHf6+O0ilPKZatJp/SOTXDmlG9J2ccwknfucOuPMbNbVNg==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Jul 2022 21:12:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167991

Am 13.07.22 um 23:07 schrieb Christoph Lauer:
> From: Christoph Lauer <christoph.lauer@xtronic.de>
>
> Since commit d756b346f248df47b0540644adb1d0f17bcc4b6e kernel modules are=
 stripped by the functions 'runstrip' and 'splitdebuginfo'. Signed modules=
 must not be stripped. Function 'runstrip' avoids this by running is_kerne=
l_module_signed. Apply the same check to splitdebuginfo.
>
> Signed-off-by: Christoph Lauer <christoph.lauer@xtronic.de>
> ---
>   meta/classes/package.bbclass | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 4850134022..63887b34f8 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -382,6 +382,11 @@ def splitdebuginfo(file, dvar, dv, d):
>       debugfile =3D dvar + dest
>       sources =3D []
>
> +    if file.endswith(".ko") and file.find("/lib/modules/") !=3D -1:
> +        if oe.package.is_kernel_module_signed(file):
> +            bb.debug(1, "Skip strip on signed module %s" % file)
> +            return (file, sources)
> +
>       # Split the file...
>       bb.utils.mkdirhier(os.path.dirname(debugfile))
>       #bb.note("Split %s -> %s" % (file, debugfile))
> --
> 2.17.1
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167990): https://lists.openembedded.org/g/openembedd=
ed-core/message/167990
> Mute This Topic: https://lists.openembedded.org/mt/92366982/7029217
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [c=
hristoph.lauer@email.de]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
You're correct that oe.package.is_elf already ran on the file before
splitdebuginfo is called, but the result is currently not available to
splitdebuginfo AFAIS. It could be by extending the parameters and what
not, but I'm too lazy to do that for what was meant to be a rather small
change. Instead I'll follow your first suggestion to check on file
extension and file location (as is_elf does too). That should cover all
kernel modules and is specific enough to avoid false positives.

