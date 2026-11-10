Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15863.1794300114626864144
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2026 00:41:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=QfW0jmG6;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 63CE31A15F5;
	Tue, 10 Nov 2026 08:41:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3A4B860012;
	Tue, 10 Nov 2026 08:41:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 950AC103292D3;
	Tue, 10 Nov 2026 09:41:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794300111; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=T0BGbr0tVM4+xO3g0a2mCPaSYJPH6F06JirteF3MTIk=;
	b=QfW0jmG6EXu6ibzLWiYaUBrSwkbn1QRMRddZhIO3gPhma+hcvOwkCFV9iMJbpD1lKKsvjX
	kUMiol/WLRn60ZSC1dtJuWAd8Ja+22+j2S2a/NB4Ak/2ue9DG+NyvE1oTBv/NIPzrmEc/q
	h8HvZLqEfHdRl0tZ01RBzJYjY2NQw0G8//mAik4R5ajSWuvbZvmoaIgmtmaNLzYTmyloaF
	xIfEpT7PQzZ2g82g9Rgf+REeMwTMf+AxnsnQy780VtI4M087gx3k6eEG9Qcr2f/TrW6o1X
	MbsHdtJVysSfODKbJoWf5P54pWYGOwO7uMoX7IqAMc2k5bmipFFCz8sIGzVWlQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Nov 2026 09:41:48 +0100
Message-Id: <DMREAY8WD74X.ZLMF3SYFLCH3@bootlin.com>
Subject: Re: [OE-core] [PATCH 16/21] groff: Upgrade 1.24.2 -> 1.25.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261109134034.74458-1-jaipaul.cheernam@est.tech>
 <20261109134034.74458-17-jaipaul.cheernam@est.tech>
 <DMRCGZJ1946G.23GSWKZLKMZHI@bootlin.com>
In-Reply-To: <DMRCGZJ1946G.23GSWKZLKMZHI@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 08:41:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249910

On Tue Nov 10, 2026 at 8:15 AM CET, Mathieu Dubois-Briand wrote:
> On Mon Nov 9, 2026 at 2:40 PM CET, Jaipaul Cheernam wrote:
>> - Drop builddep.patch as fix is part of release
>> - Refresh exisitng patches
>>
>> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
>> ---
>
> Hi Jaipaul,
>
> Thanks for the upgrade. We can see this failure:
>
> ERROR: groff-1.25.0-r0 do_compile: oe_runmake failed
> ...
> utils/tfmtodit/tfmtodit.o libgroff.a -lm lib/libgnu.a
> | /bin/bash: line 2: /srv/pokybuild/yocto-worker/genericx86-64/build/buil=
d/tmp/work/core2-64-poky-linux/groff/1.25.0/sources/groff-1.25.0/soelim: ca=
nnot execute: required file not found
> | make[2]: *** [Makefile:21098: man/groff.7.man] Error 127
> | make[2]: *** Deleting file 'man/groff.7.man'
> | make[2]: *** Waiting for unfinished jobs....
> | make[2]: Leaving directory '/srv/pokybuild/yocto-worker/genericx86-64/b=
uild/build/tmp/work/core2-64-poky-linux/groff/1.25.0/sources/groff-1.25.0'
> | make[1]: Leaving directory '/srv/pokybuild/yocto-worker/genericx86-64/b=
uild/build/tmp/work/core2-64-poky-linux/groff/1.25.0/sources/groff-1.25.0'
> | make[1]: *** [Makefile:13422: all-recursive] Error 1
> | make: *** [Makefile:7743: all] Error 2
> | ERROR: oe_runmake failed
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/5006
>
> Can you have a look at the issue?
>
> Thanks,
> Mathieu

No, it's not this patch but something else. I will pick this one back a
bit later.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

