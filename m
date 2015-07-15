Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	by mail.openembedded.org (Postfix) with ESMTP id AC774607A5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 08:25:08 +0000 (UTC)
Received: by oiab3 with SMTP id b3so23507624oia.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 01:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=vMWX+c0zDdzlzkyj7XFSU8x3kt2ZHPps/yZeFkdYb+c=;
	b=wHpglJ/bcbUF/HTIB1SE3YTNFlX71vWTdr4eXelXazc0gTErglB+3MAh2HGCy+77Vr
	FqU1MeRtm3G9BkabqegANa0N5k0jeG2foYpB4Zb5/iL0WPvuTVsDq9H3Ivd2GW2s9Uv9
	OW0lgOfKT/JH5yRcBhUfUW6VkYdof7UbkCtk7r30n2WFpchq6QBXvKb1SfH8DUKeqQYH
	GePD8HYTUlkyiyDP+Qtyl4qKJg+ps08BXxRC3ug1AYSQ7ZxYMEsmNExbJvf/MqKZvZua
	l9QP4O+0XfYieb1Syjku+9ir3e0arFdL7Z6hveS+5O/qFzGgbxXR4XTHaXGrCmxiDDB0
	Vy3A==
MIME-Version: 1.0
X-Received: by 10.202.81.3 with SMTP id f3mr2490988oib.29.1436948708325; Wed,
	15 Jul 2015 01:25:08 -0700 (PDT)
Received: by 10.202.64.130 with HTTP; Wed, 15 Jul 2015 01:25:08 -0700 (PDT)
In-Reply-To: <1436946021.3310.95.camel@linuxfoundation.org>
References: <cover.1436195315.git.tanu.kaskinen@linux.intel.com>
	<1436428717.9778.33.camel@linuxfoundation.org>
	<1436429491.23019.21.camel@tkkaskin-mobl3.ger.corp.intel.com>
	<1436438943.23019.26.camel@tkkaskin-mobl3.ger.corp.intel.com>
	<1436946021.3310.95.camel@linuxfoundation.org>
Date: Wed, 15 Jul 2015 01:25:08 -0700
Message-ID: <CAJ86T=XursrAyvaRLypQ8Ov07u7+-Om6RUtCA2MeordxM7WU7w@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] speex, speexdsp: 1.2rc1 -> 1.2rc2/1.2rc3
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
X-List-Received-Date: Wed, 15 Jul 2015 08:25:11 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 15, 2015 at 12:40 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2015-07-09 at 13:49 +0300, Tanu Kaskinen wrote:
>> On Thu, 2015-07-09 at 11:11 +0300, Tanu Kaskinen wrote:
>> > On Thu, 2015-07-09 at 08:58 +0100, Richard Purdie wrote:
>> > > I included these patches on the autobuilder in master-next and saw:
>> > >
>> > > https://autobuilder.yoctoproject.org/main/builders/nightly-x86-lsb/builds/385/steps/BuildImages_1/logs/stdio
>> > >
>>
>> The libspeexdsp-dev problem is more difficult, and I don't really know
>> how to debug it further. The error message was:
>>
>> error: Can't install pulseaudio-dev-6.0-r0@core2_32: no package provides libspeexdsp-dev
>>
>> However, "bitbake speexdsp" seems to generate the libspeexdsp-dev
>> package just fine (libspeexdsp-dev_1.2rc3-r0_core2-64.ipk appears in the
>> deploy directory).
>
> This one is a little crazy to debug. What you need to do is build
> something i586 (like qemux86), then build something core2_32 (like
> genericx86), then "bitbake core-image-lsb core-image-lsb-sdk -c rootfs"
> and hope the -lsb image builds before -lsb-sdk (I hacked runqueue to
> ensure that). Then you see this error.
>
> genericx86 is seeing two copies of libspeexdsp-dev, one from the i586
> feed and one from the core2_32 feed and somehow they confuse it, perhaps
> due to the RCONFLICTS or something.
>
> Obviously this isn't really a bug in the libspeexdsp recipe, its a bug
> in smart combined with a second bug where genericx86 shouldn't be seeing
> the i586 packages.

Not sure if it's related, but tune-core2.inc deliberately includes
PACKAGE_EXTRA_ARCHS_tune-i586 when defining
PACKAGE_EXTRA_ARCHS_tune-core2-32, which seems to be correct according
to conf/machine/include/README:

  "PACKAGE_EXTRA_ARCHS_tune-<tune> - List all of the package architectures
  that are compatible with this specific tune.  The package arch of this
  tune must be in the list."


> I'll continue to try and narrow it down and produce a test case which is
> more easily replicable. I'll not block your upgrades on this though,
> this needs fixing elsewhere.
>
> Cheers,
>
> Richard
> (going quietly insane with the number of AB 'random' failures)
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

