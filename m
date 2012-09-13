Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TCE2z-0003pt-Dm
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Sep 2012 20:21:53 +0200
Received: by eaad12 with SMTP id d12so1205006eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2012 11:09:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=paYwUVAR4geV+aTUxcRr3USCpKRGBVBGyowbY06yAtA=;
	b=ISyn+yiaeHNX1cwLw/u/+WRvkqRWc7Y6bGPakDuTotZ3A2FkDKpZq4uMQcTLwqSckQ
	nCAAmUsfwDcvD+I//M0MblZhU2dxJJg+u09gwnrw5EOqIkxk4SXFGKdsooSKCqup++o0
	nxJda2eRaAY9fWExgN0lfWVS91ahb5hDGE3gfSSYsMIR2Il9pnGYrpH2/qagrApbdDAr
	Hse+qn/FA6dH001mGIOh9+mtfFZS3MglQnCtsRHXrz2GEBGELPwOaRCxnYPErouwolGI
	UmAyacRmOhzD/prWO2Z6MrwzZaDKeMR4U1AGtYu8+rF7Xnl9Rb4DvRd3uep1FdMDz0jy
	U2zw==
Received: by 10.14.213.137 with SMTP id a9mr56603eep.38.1347559346761;
	Thu, 13 Sep 2012 11:02:26 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id v3sm67142728eep.10.2012.09.13.11.02.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Sep 2012 11:02:25 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAMKF1srBJoHJiARTyvDFuY9OQiFXg3j6ODVayuHUuXmHhCaEcw@mail.gmail.com>
Date: Thu, 13 Sep 2012 20:02:27 +0200
Message-Id: <914D5AC8-FD7D-4BDB-965E-C7D20FEC4DCF@dominion.thruhere.net>
References: <1347429555-32159-1-git-send-email-raj.khem@gmail.com>
	<1347431522.29443.92.camel@x121e.pbcl.net>
	<CAMKF1srBJoHJiARTyvDFuY9OQiFXg3j6ODVayuHUuXmHhCaEcw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQnLcPiu+CJh4uVTBevgZS8+o0em56Jp0cREpcrqOdph1u3UDchVPZ27SA93uCiJeuwaCr+k
Cc: Phil Blundell <philb@gnu.org>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 1/3] kernel.bbclass, module-base.bbclass: Use CC to form KERNEL_CC
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Sep 2012 18:21:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 12 sep. 2012, om 09:49 heeft Khem Raj <raj.khem@gmail.com> het =
volgende geschreven:

> On Tue, Sep 11, 2012 at 11:32 PM, Phil Blundell <philb@gnu.org> wrote:
>> On Tue, 2012-09-11 at 22:59 -0700, Khem Raj wrote:
>>> kernel compiler is not special and we currently have it so
>>> we want to pass -march and -mtune options as CFLAGS to kernel
>>> build so that compiler picks the right subarch flags when
>>> compiling assembly files in particular.
>>=20
>> Historically, the kernel compiler has indeed been special: there have
>> been some machines where, due to bugs in the kernel or the compiler =
or
>> both, we need to use a different version of the compiler for the =
kernel
>> than we use for userspace.  The most famous example of this were the =
old
>> ARM kernels back in the day which needed gcc-2.95 long after everyone
>> else had stopped using it, but I think there might be a few cases =
where
>> the same situation obtains even today.
>=20
> I agree with history but we have moved away from 2.9x for long.
> moreover v1 of this patch has been posted for weeks no one raised a
> concern which I take that such cases are not there anymore with
> OE-Core
>=20
>>=20
>> If you remove ${KERNEL_CCSUFFIX} then we will lose the ability to do
>> that (easily).  I'm not necessarily opposed to such a change but I =
think
>> it does need to be justified with clear benefits.
>>=20
>=20
> again if there is a usecase with OE-Core of such a kind. I will be
> happy to deal with it no one has shown me one.

The archos vendor kernels only work when built with CSL 2007, a common =
problem with TI kernels from that era=


