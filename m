Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 2A0B4605BD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Oct 2014 06:59:45 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id x13so531372wgg.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Oct 2014 23:59:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=EEFrtGbsMqveE5xzO4ycPfS4CieHwMqxQQ6/KSeB1vg=;
	b=h6CFqHMCXy5mrfj3H9zNrA2MsDYW54dsm3/MjTY47NnETFrXKCYJ62+rnPFLnspllk
	wu0Tnoqkm/LP//mSfEm0o55caNG33NlyYcmK5+F26h3HNrH0O7YeAvx/FX/vrjTOLHSk
	WXLo/36j0pBQ1rWZk3nv4KOafrbMZrdh1ZFiNp+m7xaSiKab415iNwd150h92tQKFwwN
	qXwWPCbiDebp+6+k6LfdderGxcM02ZSM24WAwU2dtMm9LcMQGcsvgDqTBbVmE2LsOEwI
	/WhobLy3PTpz2igCfN38K/Vq2Nr4sYiFt/teY0DxTxUlFsh4b7mwQYb+IgFTt8TSEkqF
	nlqQ==
X-Gm-Message-State: ALoCoQkV8FcDOHNH33KxpgXghIe7kgBxagQrecEEuZg4q1wLRaffaZMwV6pcam/T2KZEHnjDazZK
X-Received: by 10.194.143.7 with SMTP id sa7mr488841wjb.110.1414393185392;
	Sun, 26 Oct 2014 23:59:45 -0700 (PDT)
Received: from ?IPv6:2001:610:612::a450:6148:7bd:4c3f?
	([2001:610:612:0:a450:6148:7bd:4c3f])
	by mx.google.com with ESMTPSA id mc4sm10808740wic.6.2014.10.26.23.59.43
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 26 Oct 2014 23:59:44 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <201410262352.34958.marex@denx.de>
Date: Mon, 27 Oct 2014 07:59:42 +0100
Message-Id: <E8543342-2D6B-4707-810A-E88564881F20@dominion.thruhere.net>
References: <1413746147-7120-1-git-send-email-marex@denx.de>
	<201410222345.59522.marex@denx.de>
	<6D269671-AC3E-4044-8E86-2BB0BABF4B38@dominion.thruhere.net>
	<201410262352.34958.marex@denx.de>
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
X-List-Received-Date: Mon, 27 Oct 2014 06:59:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 26 okt. 2014, om 23:52 heeft Marek Vasut <marex@denx.de> het =
volgende geschreven:
>=20
> On Sunday, October 26, 2014 at 12:29:18 PM, Koen Kooi wrote:
> [...]
>>>>>> To keep backward compatibility, could you rework this into =
something
>>>>>> like:
>>>>>>=20
>>>>>> kernel.bbclass:
>>>>>> 	inherit kernel-${KERNEL_IMAGETYPE}
>>>>>>=20
>>>>>> kernel-${KERNEL_IMAGETYPE}:
>>>>>> 	inherit kernel-base
>>>>>> 	imagetype stuff
>>>>>>=20
>>>>>> kernel-base:
>>>>>> 	old kernel.bbclass stuff
>>>>>>=20
>>>>>> That would keep existing BSPs working *and* split out the image =
types.
>>>>>=20
>>>>> Yes, this makes sense. Are there any traps inside kernel.bbclass I
>>>>> should be careful about? Like for example ${PN} or other possible
>>>>> variables which are set based on the name of the file?
>>>>=20
>>>> You should be safe, PN is supposed to be completely ignored since =
the
>>>> output packages will all be 'kernel-<foo>' instead of
>>>> 'linux-myfirstbsp-<foo>'
>>>=20
>>> The kernel_do_configure() and do_configure stuff in kernel.bbclass =
now
>>> bit me. I'm not even sure I can explain the problem well, so please =
bear
>>> with me.
>>>=20
>>> The build system now cannot find do_configure() when building kernel
>>> recipe, since by moving kernel.bbclass contents into
>>> kernel-base.bbclass, the expectations of prefix of functions passed =
to
>>> 'addtask ... do_configure' and 'EXPORT_FUNCTIONS ... do_configure' =
are
>>> no longer met. Before, the functions in kernel.bbclass, namely
>>> kernel_do_configure() , kernel_do_compile() and kernel_do_install() =
had
>>> prefix matching the name of the bbclass (kernel_) and were used by =
the
>>> addtask...do_configure() and EXPORT_FUNCTIONS...do_configure() =
without
>>> the kernel_ prefix.
>>>=20
>>> Now that I moved the contents of kernel.bbclass into =
kernel-base.bbclass,
>>> the name of the kernel_do_*() functions no longer matches the =
bbclass
>>> name and so I presume the addtask... and EXPORT_FUNCTIONS... things =
are
>>> confused. Furthermore, I presume we want to keep the name of those
>>> kernel_do_*() functions in case some recipes wanted to override =
those
>>> functions.
>>>=20
>>> Do you happen to have any suggestion please ?
>>=20
>> Hmmm, it looks like there isn't a way to make this "just work" for =
'old'
>> BSPs :(
>=20
> So uh, what exactly would you propose then? Ask the BSPs to cater for =
the
> change ? I don't quite like that option, since it's like breaking an =
API
> (or similar interface, I'm not sure what the local equivalent of that =
would
> be).

Personally, I'd try to keep the kernel_foo() methods the same since =
those are very popular, a lot of BSPs append the configure one. So maybe =
something like:

kernel.bbclass:
	do_configure
	do_install
	addtask
	etc
	inherit kernel-${KERNEL_IMAGETYPE.bbclass}

kernel-${KERNEL_IMAGETYPE.bbclass}
	do_install (overrides the one in kernel.bbclass)

Someone more familiar with bbclass method (re)naming and scoping should =
weigh in on the method override above, but I think it should work.

regards,

Koen
=09


