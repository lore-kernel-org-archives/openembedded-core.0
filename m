Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 8C9E675AE2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 06:56:27 +0000 (UTC)
Received: by paceq1 with SMTP id eq1so23039709pac.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 23:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=jHxp+C4BtJ1qLkdwvs2Z+OvwVkzmKAUQU6bu2wv4dt4=;
	b=SMm6h42/2Aytgng+4HsE8uHZe0n0hlLbva7JyyA4JH1inDYWp5UBc5dmmLo189EP06
	4QHj3gyUnfxZ+/V9UoHHNaRd6qMbmb50NaCNUZERl8JqnonFgXN5SRrv9rTwFGqnRpyk
	/UX328wN66JSR8lnyaEkQ/MiHF09vduHq00wceDAW1z2GkL7B5djahO9sY2l3OdCb2kw
	Ch/hAc7PfbtO6SO4TWkyXp1Ppf9PKGBodRPdfwLcI8EX2g6tWKewnknqabpDgQXF2R/T
	Hqrn46WXPkBKiCvg+Uplso+gu8s9pPqILckmQeiMTs6JmuTW5kOTJ5bzDwYxu4Sa/Np9
	t+Ig==
MIME-Version: 1.0
X-Received: by 10.68.65.6 with SMTP id t6mr7686446pbs.94.1435128989346; Tue,
	23 Jun 2015 23:56:29 -0700 (PDT)
Received: by 10.70.44.41 with HTTP; Tue, 23 Jun 2015 23:56:29 -0700 (PDT)
In-Reply-To: <1435096112.11489.100.camel@linuxfoundation.org>
References: <1434704980.14710.108.camel@linuxfoundation.org>
	<CALbNGRSi6wrQwNP21MoUQR=LdD7HW+EOd6ZF-9_jGbr4Uty+8g@mail.gmail.com>
	<1435077176.11489.92.camel@linuxfoundation.org>
	<CALbNGRTxYpHttoF1+vjcTwOnskYKho8X4R5Ug=+rWY8FGibEpw@mail.gmail.com>
	<1435096112.11489.100.camel@linuxfoundation.org>
Date: Wed, 24 Jun 2015 08:56:29 +0200
Message-ID: <CALbNGRT_M7Ccq9F6O7iFtFse90fRnrSpJYe55UMr5D2E+DNvhg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] staging: Strip files in sysroot
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
X-List-Received-Date: Wed, 24 Jun 2015 06:56:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2015 at 11:48 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2015-06-23 at 20:19 +0200, Andreas M=C3=BCller wrote:
>> On Tue, Jun 23, 2015 at 6:32 PM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> >> Do I understand this right: Stripping is disabled by default (because
>> >> it would cause trouble for remote debugging)?
>> >
>> > No, this is only stripping of the sysroot files, not target. Its due t=
o
>> > the way locale packaging happens for glibc. It does mean some files in
>> > the sysroot are not stripped when they could be but its no change from
>> > the existing behaviour before the patch.
>> >
>> > Cheers,
>> >
>> > Richard
>> >
>> Sorry for insisting - maybe I need more explanation:
>>
>> From my understanding staging sequence is:
>>
>> * do_install installs to recipe's image folder
>> * do_populate_sysroot -> sysroot_stage_all() creates hardlinks to
>> recipe's sysroot-destdir folder
>> * do_populate_sysroot -> sysroot_strip() strips files in recipe's
>> sysroot-destdir (=3Dfiles in recipe's image folder)
>
> When it strips files, the hardlink is broken and replaced with a
> stripped copy.
>
>> * through sstate_install the files are hard linked to MACHINE's
>> sysroot (STAGING_DIR_HOST)
>>
>> I see two issues activating stripping
>>
>> 1. If do_package starts after stripping only stripped packages are
>> packed also for dbg. I think nothing gaurantees that packaging occurs
>> before do_populate_sysroot.
>
> Nothing does but the copy in image remains unstripped as above.
>
>> 2. When remote debugging I tell debugger: set sysroot <content of
>> STAGING_DIR_HOST>. Where do I find a unstripped sysroot now?
>
> That is not really the way the sysroot has been intended to be used.
> Inhibiting the sysroot stripping for target files would seem to be the
> best thing to do if you do wish to use the sysroot that way:
>
> INHIBIT_SYSROOT_STRIP_class-target =3D "1"
>
> Cheers,
>
Breaking hardlinks by stripping explains why there is no trouble to
expect. Thanks for explanation. I'll set INHIBIT_SYSROOT_STRIP =3D "1"
in my local.conf and am fine with spontaneous remote debugging.

Off topic: I have a class in meta-qt5-extra aligning paths in cmake
files. Because I am interested in keeping packed cmake files
unaligned, alignment is done only in local sysroot. To avoid trouble I
also break hardlinks (line 173).

This class is used for a while for all this kde/hawaii/lxqt stuff but
at least meta-qt5 has recipes where this class could be useful.

I saw there is an update for cmake pending. After consolidating from
this update: Would cmake-lib.bbclass have a chance in oe-core?

Andreas

[1] https://github.com/schnitzeltony/meta-qt5-extra/blob/master/classes/cma=
ke-lib.bbclass

