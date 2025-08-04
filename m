Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACC55C87FCB
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 11:16:14 +0000 (UTC)
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [217.70.178.236])
 by mx.groups.io with SMTP id smtpd.web10.15435.1754306174059395279
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Aug 2025 04:16:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=CqbSMMYk;
 spf=pass (domain: bootlin.com, ip: 217.70.178.236, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6243544969;
	Mon,  4 Aug 2025 11:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754306172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fFnNc2kMcMt/pjpXxV2trZNt/HGy2hdEi9a2j4Ru5bg=;
	b=CqbSMMYknaZBLYjWN0ZW9GRYxzw3/gvWvhIroWASDDfX08otd40I9S1/sKu6U/ac9Co5mg
	9IVWgRJKaqhTJj4pTalY3eRiLCI7nwharyGfGvctRvcZKt0EJmDPUY5krtBbFMJ91limvi
	36JjQB7KsQCX5TIkeYuw3YQbx5N1RprFD4/UnyY7yM04UyOF4lJ2B8N2lqZeS8ieWk3HcY
	ZV1pP1B409kOWAnaBepH8QrDLFXsthUIMZinK+g9sOFM9YJwMJ08qUP3NigrTVI2Vd4MSN
	q6VP7ILYcAgU0+/jJ1CNsf2kX30cXsc8xvrKYVtCMX+h08JFmySZbwggGhZC4w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 Aug 2025 13:16:08 +0200
Message-Id: <DBTLMW67VA4J.1SLQL19874U9U@bootlin.com>
Cc: <mingli.yu@eng.windriver.com>,
 <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Mikko Rapeli" <mikko.rapeli@linaro.org>
Subject: Re: [OE-core] [PATCH] ovmf: Don't define bool type if building in
 C23 mode
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250801102912.3219302-1-mingli.yu@eng.windriver.com>
 <DBTI0WV2IOR5.3A1LDH28GH3BS@bootlin.com> <aJB56yIIFrSvRX0e@nuoska>
In-Reply-To: <aJB56yIIFrSvRX0e@nuoska>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduuddvudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvefhvffuofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehheduuedvtdegfefgjeeklefggffhgfffhfejtdejudffleegleetgeffjeelteenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdhgihhthhhusgdrtghomhdphihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehmi
 hhkkhhordhrrghpvghliheslhhinhgrrhhordhorhhgpdhrtghpthhtohepmhhinhhglhhirdihuhesvghnghdrfihinhgurhhivhgvrhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Aug 2025 11:16:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221426

On Mon Aug 4, 2025 at 11:14 AM CEST, Mikko Rapeli wrote:
> Hi,
>
> On Mon, Aug 04, 2025 at 10:26:23AM +0200, Mathieu Dubois-Briand via lists=
.openembedded.org wrote:
>> On Fri Aug 1, 2025 at 12:29 PM CEST, Mingli via lists.openembedded.org Y=
u wrote:
>> > From: Mingli Yu <mingli.yu@windriver.com>
>> >
>> > Backport a patch [1] to fix the below build failure:
>> >  /buildarea/tmp/work/corei7-64-wrs-linux/ovmf/edk2-stable202502/source=
s/ovmf-edk2-stable202502/SecurityPkg/DeviceSecurity/SpdmLib/Include/hal/Lib=
spdmStdBoolAlt.h:13:17: error: two or more data types in declaration specif=
iers
>> >  13 | typedef BOOLEAN bool;
>> >  | ^~~~
>> >   /buildarea/tmp/work/corei7-64-wrs-linux/ovmf/edk2-stable202502/sourc=
es/ovmf-edk2-stable202502/SecurityPkg/DeviceSecurity/SpdmLib/Include/hal/Li=
bspdmStdBoolAlt.h:13:1: error: useless type name in empty declaration [-Wer=
ror]
>> >   13 | typedef BOOLEAN bool;
>> >
>> > [1] https://github.com/tianocore/edk2/commit/772fa11ac82579a8f6fa171e6=
b835f68af3f64be
>> >
>> > Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> > ---
>>=20
>> Hi,
>>=20
>> Thanks for the patch, but it looks like the embedded patch does not
>> apply cleanly:
>>=20
>> ERROR: ovmf-native-edk2-stable202502-r0 do_patch: Applying patch '0001-S=
ecurityPkg-Don-t-define-bool-type-if-building-in-C2.patch' on target direct=
ory '/srv/pokybuild/yocto-worker/qemux86-world-alt/build/build/tmp/work/x86=
_64-linux/ovmf-native/edk2-stable202502/sources/ovmf-edk2-stable202502'
>> CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/qemux86-world-alt/=
build/build/tmp/work/x86_64-linux/ovmf-native/edk2-stable202502/recipe-sysr=
oot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0001-SecurityPkg-D=
on-t-define-bool-type-if-building-in-C2.patch
>> patching file SecurityPkg/DeviceSecurity/SpdmLib/Include/hal/LibspdmStdB=
oolAlt.h
>> Hunk #1 FAILED at 10 (different line endings).
>> 1 out of 1 hunk FAILED -- rejects in file SecurityPkg/DeviceSecurity/Spd=
mLib/Include/hal/LibspdmStdBoolAlt.h
>> Patch 0001-SecurityPkg-Don-t-define-bool-type-if-building-in-C2.patch do=
es not apply (enforce with -f)
>>=20
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/1998
>>=20
>> Can you have a look at this issue please?
>
> ovmf and edk2 are notorious for using Windows newlines so patches over
> mailing lists may break when applying. I suggest using git to pull the
> changes or manually applying simple changes.
>
> Cheers,
>
> -Mikko

Makes sense. I believe I managed to fix the new line issues, so the
patch is back in testing queue.

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


