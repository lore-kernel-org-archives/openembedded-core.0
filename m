Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5DCFCA0FFD
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 08:22:08 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.46539.1756714922287850732
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 01:22:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=BXoyBdll;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7C6FB4E40C0E;
	Mon,  1 Sep 2025 08:22:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 555F060699;
	Mon,  1 Sep 2025 08:22:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 019851C22D785;
	Mon,  1 Sep 2025 10:21:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756714919; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nZNXMWGG5ryZiNYlHgJqPik84LG1UFPPasviKbiMKk8=;
	b=BXoyBdllik2lp1EzqTbEhB1aHnwCMMAQbOaKzvHJGcVfHrzo519wfShpLGaeJe1XvHKzoS
	4TPYYpgcQTHs/7vRT3Z3pWh9c6kH3JvaqtDP8eUuK/z42Z+uVA+RA9W1oN93m8Ajro6L0U
	R+Z8nJKYQI5H/tMlaoOcedhzk1qWgDU2JrytX+03PaPiCHFJhTDNy7xHwJEm7zd7ZH2X3v
	Jz1fXGvQHhTmE+cp8txFQalVZc/robC4mSovKeFPR3fIfpn3+vWB5NbJyqn5wpQ0hxm5qo
	0Zw/bYabcgJyUqAC68dNxkmBKxtxb+bEVXn8n63/LIqu8s+JnNWdZjx8Abij2Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Sep 2025 10:21:54 +0200
Message-Id: <DCHBGQL11HQA.3CX7LVLO254VT@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <skandigraun@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [RFC] gettext, gettext-native-minimal: upgrade 0.23.1
 -> 0.26
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <1860A6DF185EFE18.24627@lists.openembedded.org>
 <2f5a2e0f-0b16-4990-a574-a3fad36fdc96@gmail.com>
In-Reply-To: <2f5a2e0f-0b16-4990-a574-a3fad36fdc96@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 08:22:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222649

On Sat Aug 30, 2025 at 10:58 PM CEST, Gyorgy Sarvari via lists.openembedded=
.org wrote:
> On 8/30/25 22:55, Gyorgy Sarvari via lists.openembedded.org wrote:
> In principle I think that it's about as I can make it on my own (sans AB
> failures[1]), but there would be a few question marks on my end:
>
> 1. If you have a better idea for relevant Makefile.in.in heurestics in
> autotools.bbclass, I'm listening
> 2. I *think* that the Makevars concatenation makes actual sense, and the
> build success is not only an accident - but I'm not 100% sure if that's
> the best way to handle this. If you know gettext, I'd like to hear your
> opinion. (This was inspired by gettextize's behavior. Upon running it,
> it copies the Makevars.template with default values in the po folder,
> and asks you to set up all the variables from it in your Makevars file)
>
> [1]: I did build recipes and multiple images successfully, but not
> "bitbake world" on multiple configs

Hi Gyorgy,

I took a bit of time to launch a build on the autobuilder. It looks like
this is breaking build of several components: glib, e2fsprogs, iso-codes
and so on. I saw two types of errors so far:
- undefined symbol: getfilecon
- missing files: t-ca.gmo, t-bg.gmo... I'm not sure where this comes
  from.

ERROR: glib-2.0-initial-1_2.84.4-r0 do_compile: Execution of '/srv/pokybuil=
d/yocto-worker/no-x11/build/build/tmp/work/x86-64-v3-poky-linux/glib-2.0-in=
itial/2.84.4/temp/run.do_compile.3022462' failed with exit code 127
...
| /srv/pokybuild/yocto-worker/no-x11/build/build/tmp/work/x86-64-v3-poky-li=
nux/glib-2.0-initial/2.84.4/recipe-sysroot-native/usr/bin/msgfmt: symbol lo=
okup error: /srv/pokybuild/yocto-worker/no-x11/build/build/tmp/work/x86-64-=
v3-poky-linux/glib-2.0-initial/2.84.4/recipe-sysroot-native/usr/bin/../lib/=
libgettextlib-0.26.so: undefined symbol: getfilecon

ERROR: e2fsprogs-1.47.3-r0 do_compile: Execution of '/srv/pokybuild/yocto-w=
orker/no-x11/build/build/tmp/work/x86-64-v3-poky-linux/e2fsprogs/1.47.3/tem=
p/run.do_compile.3185668' failed with exit code 1
...
| mv: cannot stat 't-ca.gmo': No such file or directory

ERROR: iso-codes-4.18.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-w=
orker/no-x11/build/build/tmp/work/all-poky-linux/iso-codes/4.18.0/temp/run.=
do_compile.3458421' failed with exit code 1
...
| /srv/pokybuild/yocto-worker/no-x11/build/build/tmp/work/all-poky-linux/is=
o-codes/4.18.0/recipe-sysroot-native/usr/bin/msgfmt: symbol lookup error: /=
srv/pokybuild/yocto-worker/no-x11/build/build/tmp/work/all-poky-linux/iso-c=
odes/4.18.0/recipe-sysroot-native/usr/bin/../lib/libgettextlib-0.26.so: und=
efined symbol: getfilecon

ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/no-x11/bui=
ld/build/tmp/work/x86-64-v3-poky-linux/psmisc/23.7/temp/log.do_compile.3498=
395
...
| mv: cannot stat 't-bg.gmo': No such file or directory

You can get all logs here:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/5/builds/2220
https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/2285
https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/2330
https://autobuilder.yoctoproject.org/valkyrie/#/builders/25/builds/2308

We can have more failure logs in all a-full subbuilders, but they all
look the same as far as I can see.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2299

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


