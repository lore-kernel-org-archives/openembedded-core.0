Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SjYme-0005tp-M1
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jun 2012 18:38:32 +0200
Received: by eaal1 with SMTP id l1so57793eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2012 09:27:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=fAQg0hOvoelqE4BLrhn/xkJm9EnJ5bJGHEmBd8kd7Mo=;
	b=PZ7IFoeUscc/DKvPNYTlq1PlnGNUYgLO8kLNOgEzeo2plkzGf7xzuCZtUHg8RvCmYG
	6zRwYwsLRmCmEh5NJQ1aqtnSu/Kt6Qf3H3TFEGeZocJ9SbPiWOt1Fo15bYM6rXcRkcPB
	B/n76WnL07HEu9mm9BG2fHesQKBPssynQ/Ufh0bE4BHlW6ciWFE48O8iwpjb1dpq0aRZ
	gRvK5S6hCwE54BGbHNfYOoodKWcDdyAv4ObSQo+O9lO+lUNgpGZew7MVLc93CqpQA2wk
	CWQLKW/NARIp7tXy2yNdSjFvBItwCNFVHXVrle9nWLexirsEcxsspGkYwTyuc1bVJBfK
	l3eA==
Received: by 10.14.98.68 with SMTP id u44mr3313666eef.85.1340728060407;
	Tue, 26 Jun 2012 09:27:40 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235]) by mx.google.com with ESMTPS id
	o16sm150551637eeb.13.2012.06.26.09.27.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 26 Jun 2012 09:27:39 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4FE9DC0F.7010907@linux.intel.com>
Date: Tue, 26 Jun 2012 18:27:36 +0200
Message-Id: <B1BD7005-9688-4792-B3BD-74540DA26E1B@dominion.thruhere.net>
References: <4FE8F542.2070304@linux.intel.com>
	<CAMKF1spxr+RVQ85YoxdPdrPi+f4V6A_6Gt8QOWTeLCcF_DXEaA@mail.gmail.com>
	<4FE9DC0F.7010907@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQmkKwBRQK3jVNxZlfoaRWmIR5lYuYI72FWPCilhQ6LwZMZ6tzX1hVcAqARS4xI0p1zMBjdP
Subject: Re: kernel: building target-arch scripts/* to include in kernel-headers package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Jun 2012 16:38:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 26 jun. 2012, om 17:58 heeft Darren Hart het volgende geschreven:

>=20
>=20
> On 06/25/2012 10:19 PM, Khem Raj wrote:
>> On Mon, Jun 25, 2012 at 4:33 PM, Darren Hart <dvhart@linux.intel.com> =
wrote:
>>> I'm working on a patch series to provide a kernel-headers package =
which
>>> allows for the compilation of Linux kernel modules on the target. I
>>> currently have something working, but it requires that I first build =
the
>>> scripts/* binaries on the target, prior to trying to build a module.
>>>=20
>>>       # cd /usr/src/kernel-headers
>>>       # make scripts
>>>=20
>>> Then I can build modules:
>>>=20
>>>       # cd /home/root/hello-mod/files
>>>       # export KERNEL_SRC=3D/usr/src/kernel-headers
>>>       # make
>>>=20
>>> And test:
>>>=20
>>>       # insmod hello.ko
>>>       # rmmod hello.ko
>>>       # dmesg | tail -n2
>>>       Hello World!
>>>       Goodbye Cruel World!
>>>=20
>>> I would like to package the target-arch scripts binaries with the
>>> kernel-headers package, but I'm not sure how to go about building =
both
>>> the native and the target binaries as part of the kernel building
>>> process. Does it make sense to build these as part of the =
do_install()
>>> task after I've moved the files from the linux recipe's workdir and
>>> removed the host-arch binaries from scripts?
>>>=20
>>=20
>> the hostprogs there are a bit hairy. you could set HOSTCC to point to
>> cross compiler and build scripts dir in some O=3Dfoo after copying
>> .config into it but the problem would be that build system expects =
the
>> hosttools in build tree at exact same location
>> e.g. fixdep would be needed even to build other hosttools e.g.
>> recordmcount etc. and thats where you have to patch kbuild such that
>> it could reference another fixdep tool which then will be built for
>> the host you are compiling kernel on.
>>=20
>=20
> Ewe, what a mess.
>=20
> Another option would be to add:
>=20
>        # cd /usr/src/kernel-headers
>        # make scripts
>=20
> To the kernel-headers post-inst script. =3D

or you could document it and have people do it manually.

regards,

Koen=


