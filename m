Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 22145601F5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Oct 2014 11:29:21 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id ex7so4300363wid.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Oct 2014 04:29:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=KWytMHRKdrhezkd9MZIxj8j/a+H6L45PxZmS11/QarI=;
	b=PDeDsmXUXOfDaCIf9Znw5FhUkh5yv4wN2zcofCeHthJV20M3hrRTSD0CHbPJeLYasR
	I9uvxD1wl3vP3X12jwY1AS2eTgx7WzzxEIociSTB7yLT1JEXt5ySt64r7o4pKYkJzIEf
	7reLUiOPqFUgjjPsM/5JXLi9MvO94mkg0VO5pGd3xsmPpa90Wh+2p159mBcY/MPyL8fB
	3gOOn2LB1BdSeLIfZ+cur9kZerpCFpGJZ4w4BVxV2MrVu5AZGM7pk6CflGmnwSBc1OwE
	T5FbsVj5vyk7BpB+Xj1h3Uc5LJbtLLsGC/sk9qfncmDrIBsMB2DS2tt/ViXlnOXUd7Dr
	XTGA==
X-Gm-Message-State: ALoCoQn9HHuTjndALZJ/9ka/71ASy/8wsV/q1kf4gNskV8IkbDCmj+lqXBTSx8GTwwWYqGeJCwQh
X-Received: by 10.194.110.104 with SMTP id hz8mr15858181wjb.62.1414322960950; 
	Sun, 26 Oct 2014 04:29:20 -0700 (PDT)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id td9sm8004796wic.15.2014.10.26.04.29.19
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 26 Oct 2014 04:29:20 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <201410222345.59522.marex@denx.de>
Date: Sun, 26 Oct 2014 12:29:18 +0100
Message-Id: <6D269671-AC3E-4044-8E86-2BB0BABF4B38@dominion.thruhere.net>
References: <1413746147-7120-1-git-send-email-marex@denx.de>
	<201410220128.44782.marex@denx.de>
	<DBEF9196-DDEF-4862-87CD-24DA0577C08F@dominion.thruhere.net>
	<201410222345.59522.marex@denx.de>
To: Marek Vasut <marex@denx.de>
X-Mailer: Apple Mail (2.1990.1)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/7] kernel: Pull uImage generation into separate class
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 26 Oct 2014 11:29:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 22 okt. 2014, om 23:45 heeft Marek Vasut <marex@denx.de> het =
volgende geschreven:
>=20
> On Wednesday, October 22, 2014 at 10:42:09 AM, Koen Kooi wrote:
>>> Op 22 okt. 2014, om 01:28 heeft Marek Vasut <marex@denx.de> het =
volgende
>>> geschreven:
>>>=20
>>> On Monday, October 20, 2014 at 12:26:04 PM, Koen Kooi wrote:
>>>>> Op 19 okt. 2014, om 21:15 heeft Marek Vasut <marex@denx.de> het
>>>>> volgende geschreven:
>>>>>=20
>>>>> Pull the uImage image format generation from kernel.bbclass into
>>>>> a separate kernel-uimage.bbclass. The recipes which now need to
>>>>> generate an uImage will have to inherit kernel-uimage instead of
>>>>> kernel class.
>>>>=20
>>>> To keep backward compatibility, could you rework this into =
something
>>>> like:
>>>>=20
>>>> kernel.bbclass:
>>>> 	inherit kernel-${KERNEL_IMAGETYPE}
>>>>=20
>>>> kernel-${KERNEL_IMAGETYPE}:
>>>> 	inherit kernel-base
>>>> 	imagetype stuff
>>>>=20
>>>> kernel-base:
>>>> 	old kernel.bbclass stuff
>>>>=20
>>>> That would keep existing BSPs working *and* split out the image =
types.
>>>=20
>>> Yes, this makes sense. Are there any traps inside kernel.bbclass I =
should
>>> be careful about? Like for example ${PN} or other possible variables
>>> which are set based on the name of the file?
>>=20
>> You should be safe, PN is supposed to be completely ignored since the
>> output packages will all be 'kernel-<foo>' instead of
>> 'linux-myfirstbsp-<foo>'
>=20
> The kernel_do_configure() and do_configure stuff in kernel.bbclass now =
bit me.
> I'm not even sure I can explain the problem well, so please bear with =
me.
>=20
> The build system now cannot find do_configure() when building kernel =
recipe,=20
> since by moving kernel.bbclass contents into kernel-base.bbclass, the=20=

> expectations of prefix of functions passed to 'addtask ... =
do_configure' and=20
> 'EXPORT_FUNCTIONS ... do_configure' are no longer met. Before, the =
functions
> in kernel.bbclass, namely kernel_do_configure() , kernel_do_compile() =
and=20
> kernel_do_install() had prefix matching the name of the bbclass =
(kernel_) and=20
> were used by the addtask...do_configure() and =
EXPORT_FUNCTIONS...do_configure()=20
> without the kernel_ prefix.
>=20
> Now that I moved the contents of kernel.bbclass into =
kernel-base.bbclass, the=20
> name of the kernel_do_*() functions no longer matches the bbclass name =
and so
> I presume the addtask... and EXPORT_FUNCTIONS... things are confused.=20=

> Furthermore, I presume we want to keep the name of those kernel_do_*() =
functions
> in case some recipes wanted to override those functions.
>=20
> Do you happen to have any suggestion please ?

Hmmm, it looks like there isn't a way to make this "just work" for 'old' =
BSPs :(=

