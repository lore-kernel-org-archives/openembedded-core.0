Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id CEBAB7399F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 08:40:38 +0000 (UTC)
Received: by paceu11 with SMTP id eu11so18815467pac.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 01:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=GGCScB0sQSSh6EoK7HJysWqvNrKcQi8aoMdBQbsaAUE=;
	b=kMOa4j3RF2ViaNP0g3HhxqMVVbKWDPwTMLA8FZrWR0U2ybC+putXBW3F/35lg8xHB9
	kJImOgiqvV+nl+KCvs7+AwU3UwVx23nuTM34hlY7jZmh+a0a2BL04xeBQvRNBiSW+BMj
	rLGktRuUtiK7ahHCA9BOt7wYso26awEs9ivE9JBoUrSwRDsQRPT6OAcJf+8bq03BfNZm
	WdEVET53heGho3P3EFVdi1Ize9vRVCpL7ZKFUBAaL8C/erKfRbR6mlP5khevCAVQ3C9d
	PQBqyTAQ6y4ZibQdynX/YppyFKIU6jHD35gtZc/DJ3F5Jt5gcIA5JeGAKaowiBLACMYR
	c9Ew==
X-Received: by 10.66.140.69 with SMTP id re5mr54610624pab.105.1426149638721;
	Thu, 12 Mar 2015 01:40:38 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:24c5:b426:3d6b:ff44?
	([2601:9:3580:84c:24c5:b426:3d6b:ff44])
	by mx.google.com with ESMTPSA id qm6sm9812080pac.14.2015.03.12.01.40.37
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 12 Mar 2015 01:40:37 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1426147451.9114.82.camel@linuxfoundation.org>
Date: Thu, 12 Mar 2015 01:40:36 -0700
Message-Id: <A7D2229A-D67A-4AEB-97D0-4FE730C6F6D7@gmail.com>
References: <1426109339-12975-1-git-send-email-randy.e.witt@linux.intel.com>
	<13FDACD4-FC30-49CD-AC52-9D614F407C5D@gmail.com>
	<CAP9ODKqBs7sqNMrTESE_fiNfnRO3jLYTDoUkE4twwgczSU=L2g@mail.gmail.com>
	<1426147451.9114.82.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.2070.6)
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: Instruct the journal to always be volatile
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
X-List-Received-Date: Thu, 12 Mar 2015 08:40:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Mar 12, 2015, at 1:04 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> On Thu, 2015-03-12 at 04:18 -0300, Otavio Salvador wrote:
>> On Thu, Mar 12, 2015 at 12:09 AM, Khem Raj <raj.khem@gmail.com> =
wrote:
>>>=20
>>>> On Mar 11, 2015, at 2:28 PM, Randy Witt =
<randy.e.witt@linux.intel.com> wrote:
>>>>=20
>>>> When the storage mode for the journal is "auto" if /var/log/journal
>>>> exists then the journal will flush to /var/log/journal assuming =
that
>>>> /var/log/journal is persistent.
>>>>=20
>>>> However /var/log -> /var/volatile/log in poky, so even though
>>>> /var/log/journal exists, it is still volatile.
>>>>=20
>>>> Since this can cause ordering issues due to /var/volatile needing =
to be mounted before the journal actually writes to it, just specify =
that the journal
>>>> should always be volatile and never try to write to "persistent"
>>>> storage. The journal will exist in /run/log/journal only.
>>>>=20
>>>> This also disables the "After" of the journal on var-volatile.mount
>>>> since the ordering is no longer necessary when the journal is only
>>>> stored in /run/log/journal.
>>>>=20
>>>> [Yocto #7388]
>>>=20
>>>=20
>>> This is not right. What if I want persistent logs.? the options is =
just gone. Both cases should work. /var/volatile should only be used
>>> when doing ro-rfs its not FHS specified anyway. Lets not go with =
this patch.
>>=20
>> Agreed.
>=20
> This isn't quite so simple as "agreed". Are we saying that we want to
> rework volatiles handling after feature freeze?
>=20

> My view on this is that yes, we do need to do something about it, but
> right now during stabilisation is not the right time. Particularly =
when
> the patches proposed aren't even tested with sysvinit.

I usually send out patches early to take advantage of some community =
testing especially Yocto auto builders, Since not everyone has hefty =
machines
to do all kind of builds for such changes. Meanwhile, keep doing it in =
serial order.

>=20
> So I'm interested in patches which make things work better without
> making fundamental changes now. We can look at changing volatiles with =
a
> properly thought out plan in the next development cycle.

Whatever is decided I have already said thats fine, so lets just stop =
this thread here.


