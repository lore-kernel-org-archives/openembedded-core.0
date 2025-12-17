Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C07D2D6555E
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 12:22:06 +0000 (UTC)
Received: from bee.birch.relay.mailchannels.net (bee.birch.relay.mailchannels.net [23.83.209.14])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13363.1765974124158933617
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 04:22:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=lwTaL0ax;
 spf=pass (domain: rootcommit.com, ip: 23.83.209.14, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 9DCA8161C09;
	Wed, 17 Dec 2025 12:22:03 +0000 (UTC)
Received: from fr-int-smtpout17.hostinger.io (trex-green-7.trex.outbound.svc.cluster.local [100.103.182.69])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id C867F161AF8;
	Wed, 17 Dec 2025 12:22:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1765974123;
	b=iq7Wd1GXDC1rNO5wxiOdwSoWkXCYsSGfMnEhzIB2ERxLaN9b6Ljnn91Z2sO89jZvkAk0fr
	rcudEwK17w6mK5lFL2z6d77HNyGyEns/F32nb/ezZkAc2mdgMftJ3W//e0tZWtpTo+nRyP
	DGPwW2ar+ZeNWtEXoIPCICNBwqg6KmOva98dAzVehhKM3D79scL2vzFtwbUeqw9w3DYtrY
	iaMEuCIYQpev6ojOPVPLDy6pAK0KjSk+XyzJpN7G7QIoIM2dMG/NyVWjr3l5nzpzDY0HL1
	DUaOsAxbDz9dJoye07d2nHOfUmW6qpBZS2vKWyYURnVRNAwmffgqn87HQVdULg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1765974123;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=FPMHjNgT2j0gjKbkm59V1pynWxMnZpmg44OGB7fXbpU=;
	b=2mFJB5l0Txlk6tzzdltLKvaBYSzD/s5vwfFTt3opbTLTHcNLVuSIWehVpwr09e7AOsT08o
	Qs2Bjn8oITDXyFL/YRr/uLlflWMwTFkZ3QgJPT6eC/p8FD5xMKt3gPNL/De4IBiLRBXt3o
	dWEUN3meZpsrTs0L8Bp+UBY4EJaoisKyikxcreLmLKsoAKiQvjp343I8gdMkgpG/g2suoZ
	LCkT30L/o6QyELm/+132uoMWpden3L9D/9jo0VCQjG5+VgyLzkjupGE3T1Dk0Zcksg4Uvv
	tJ3qxeLFCz0Y0hg6cEXU/gItA07LYaVOyPJwDYpGGOdvzQJXg13l1fIE8Ys5Ow==
ARC-Authentication-Results: i=1;
	rspamd-659888d77d-26z54;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Spicy-Trade: 0bb46159742096e1_1765974123522_1013800631
X-MC-Loop-Signature: 1765974123522:2100750080
X-MC-Ingress-Time: 1765974123522
Received: from fr-int-smtpout17.hostinger.io (fr-int-smtpout17.hostinger.io
 [148.222.54.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.103.182.69 (trex/7.1.3);
	Wed, 17 Dec 2025 12:22:03 +0000
Received: from [IPV6:2001:861:4450:d360:8e2b:fce5:ec42:f176] (unknown [IPv6:2001:861:4450:d360:8e2b:fce5:ec42:f176])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4dWXwm3pBZz1xny;
	Wed, 17 Dec 2025 12:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1765974121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FPMHjNgT2j0gjKbkm59V1pynWxMnZpmg44OGB7fXbpU=;
	b=lwTaL0axfrHGDAxxLAZ+X6bcILJYhy0HgP517y6niTTX4C/468UVWAhphB+azFaAXmqSd9
	hZSSOs0efZR1USAdnpglPLbWGNtOfsqVzcJdqiUNgXzXJElDAc3sfpO7EhV7zpXnSfF5W5
	netZueltSf3WZPQ6a6HZ6wsYO4eGD7zdUe7mijV/ghAglETRRsYBr2/F/yQtLq/evK4Mnl
	4/PCrkkf7MBP2N88nOGtYfJXjiuu1+NcbAGPE6Ghp2CDGrawp8bOSwtJgMBTBhF5aIl5XV
	LhjF31OwK0MNAsFkd8YxKBt6K3J2iavNG0U21n1vcWPa4kBerYA8eZUJ9KFdAg==
Message-ID: <2a314131-0dc4-4a21-9963-03063761b8f1@rootcommit.com>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com,
 openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [AUH] alsa-lib: upgrading to 1.2.15 FAILED
To: auh@yoctoproject.org
References: <0101019b262ede8c-49d9befe-c250-4b00-a166-8ac8b9a5461e-000000@us-west-2.amazonses.com>
Content-Language: en-US, fr
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <0101019b262ede8c-49d9befe-c250-4b00-a166-8ac8b9a5461e-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Date: Wed, 17 Dec 2025 12:22:00 +0000 (UTC)
X-CM-Envelope: MS4xfN/hueD98KDjx7gqkjFKRDExPUVz7ZIfaqwxQIqwq1THILqXIEMU/Zk486scEqkinfBtg8vkKs1jbK2VmInEYd3fS35GnIlxGtFLGfG8aQWtK04R0nBN wjJfc5C6XXv0UR7NpaqfHnW0L692H/soC7Pen69spd0v4PNjc8UWxjxDirh9JRx+0BRG1Za6y6p0NDeuH4w2eSEHD0O6fLjqwswFx4ENINSARGb64wVKY6eM C2Ua8fbms7OfKkV8XREPzVHMwdQJBaMJYaL58z4HFth8ichMX//oBpd++zhugxoQpGKe4X7+aDRe1KSWhSX5okKGpuYsI1B9T9kCjHZTPqTVgA31QyOq0c4V piSQeDpAY5LOvbFrmk0ffl7+LpmuP4RPMlJDFtHBuWLknYw7yLDa5Gu+tDsvCuRkNRItdyJm
X-CM-Analysis: v=2.4 cv=B9fr0/tM c=1 sm=1 tr=0 ts=6942a069 a=JY/OoRUBqPoXaiLUhbiEKg==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=iGHA9ds3AAAA:8 a=foHCeV_ZAAAA:8 a=d70CFdQeAAAA:8 a=Q4-j1AaZAAAA:8 a=LnUeuIvW_ExTdokLb0MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=h8a9FgHX5U4dIE3jaWyr:22 a=NcxpMcIZDGm-g932nG_k:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 12:22:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228033

Greetings,

On 12/16/25 09:02, Auto Upgrade Helper via lists.openembedded.org wrote:
> Hello,
>
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe(s) *alsa-lib* to *1.2.=
15* has Failed(do_compile).
>
> Detailed error information:
>
> do_compile failed
>
>
>
> Next steps:
>      - apply the patch: git am 0001-alsa-lib-upgrade-1.2.14-1.2.15.patc=
h
>      - check the changes to upstream patches and summarize them in the =
commit message,
>      - compile an image that contains the package
>      - perform some basic sanity tests
>      - amend the patch and sign it off: git commit -s --reset-author --=
amend
>      - send it to the appropriate mailing list
>
> Alternatively, if you believe the recipe should not be upgraded at this=
 time,
> you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
> automatic upgrades would no longer be attempted.
>
> Please review the attached files for further information and build/upda=
te failures.
> Any problem please file a bug at https://bugzilla.yoctoproject.org/ente=
r_bug.cgi?product=3DAutomated%20Update%20Handler
>
> Regards,
> The Upgrade Helper
>
> -- >8 --
>  From c24c6047d5ba62e911395a7c7a85fbe6b6b5c748 Mon Sep 17 00:00:00 2001
> From: Upgrade Helper <auh@yoctoproject.org>
> Date: Tue, 16 Dec 2025 05:45:11 +0000
> Subject: [PATCH] alsa-lib: upgrade 1.2.14 -> 1.2.15
>
> ---
>   .../alsa/{alsa-lib_1.2.14.bb =3D> alsa-lib_1.2.15.bb}             | 2=
 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta/recipes-multimedia/alsa/{alsa-lib_1.2.14.bb =3D> alsa-lib=
_1.2.15.bb} (94%)
>
> diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb b/meta/rec=
ipes-multimedia/alsa/alsa-lib_1.2.15.bb
> similarity index 94%
> rename from meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb
> rename to meta/recipes-multimedia/alsa/alsa-lib_1.2.15.bb
> index 41a42f9ecc..bf20e1a1ad 100644
> --- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb
> +++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.bb
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da916467b91=
076e631dd8edb7424769c7 \
>                       "
>  =20
>   SRC_URI =3D "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2=
"
> -SRC_URI[sha256sum] =3D "be9c88a0b3604367dd74167a2b754a35e142f670292ae4=
7a2fdef27a2ee97a32"
> +SRC_URI[sha256sum] =3D "83770841585e766a60c99fd23f8c574c22643ae0cb1f2d=
20b793c3d84eb95a8d"
>  =20
>   inherit autotools pkgconfig


I probably won't have time to investigate this, but there turned out to=20
be no issue here.
I upgraded the recipe with devtool (as AUH does too, I guess), and the=20
changes built fine.

So apparently a false positive here (meaning "failed" instead of=20
"succeeded=C2=A8).
Cheers
Michael.

--=20
Michael Opdenacker
Root Commit
Yocto Project and OpenEmbedded Training course - Learn by doing:
https://rootcommit.com/training/yocto/


