Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id D32C96C731
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 14:54:03 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id a1so1966242wgh.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 06:54:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=5d/RZGemYiPxbQV4RW5j+oi/xlw12Y8QGbssZutHsqs=;
	b=HZFIgfcWAJSgjv8K4waOrOH4yIc7f078KSNHtbTB6jZP9MMm3OXA3sn43U0Psu5iPV
	bHivrUrR63eDJnMDF4Rr5QnV/Fe6V+PZO4+aMVB3s9cVAVzCtzeAKRk7DjAF8zoqvg4J
	uVO1CDWVlfoIPDYfhk5JjHKCjE+gR+alf1UG//MN4mp3adYEzo1foM7i4Fi7mY5QRteF
	sXm2t5j6HFrsZVSMd8sB/MQPaEM1sFPbqJdpJgsaTArHVnVpFbl4rvMRJNSSgrYW8qzn
	IaAFwwzYKJAiI71veHWFyX1nodHSh3MISXkQmJswYIO0ewzWi6Mnou/XUq2U5H7pj22k
	GGEA==
X-Gm-Message-State: ALoCoQlQclNJYUmUzn2M2Wxx1CpWji3/agokVKmbnew7YyHZW/xNoidQDGuAoP/uzf8qoml9BO89
X-Received: by 10.180.77.74 with SMTP id q10mr7143494wiw.65.1385736841795;
	Fri, 29 Nov 2013 06:54:01 -0800 (PST)
Received: from ?IPv6:2001:610:612::b9df:fc03:e058:63e8?
	([2001:610:612:0:b9df:fc03:e058:63e8])
	by mx.google.com with ESMTPSA id
	qc10sm93086361wic.9.2013.11.29.06.53.59 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 29 Nov 2013 06:53:59 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.0 \(1822\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1385736045.11222.64.camel@ted>
Date: Fri, 29 Nov 2013 15:54:45 +0100
Message-Id: <5DC1800B-E91E-4C27-A7F8-11618D54C69B@dominion.thruhere.net>
References: <F8B3526C-4727-4090-A092-1827AAE52F71@dominion.thruhere.net>
	<ADD31F3B-8E62-411A-AE0C-8F3A616BB0FC@dominion.thruhere.net>
	<1385736045.11222.64.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1822)
Cc: Elias Bakken <elias.bakken@gmail.com>, Tim Orling <ticotimo@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Perl CPAN module install path bug in cpan_build.bbclass?
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
X-List-Received-Date: Fri, 29 Nov 2013 14:54:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 29 nov. 2013, om 15:40 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:

> On Fri, 2013-11-29 at 14:47 +0100, Koen Kooi wrote:
>> Op 29 nov. 2013, om 09:45 heeft Koen Kooi =
<koen@dominion.thruhere.net> het volgende geschreven:
>>=20
>>> Hi,
>>>=20
>>> I've been working on perl modules and I noticed some of them don't =
work properly and nearly all of the non-working ones are Build.PL based =
and use cpan_build.bbclass.=20
>>>=20
>>> A working module looks like this:
>>> 	[koen@rrmbp v2013.06]$ dpkg-deb -c =
deploy/eglibc/ipk/armv7ahf-vfp-neon/perl-module-test-differences_0.61-r0.1=
_armv7ahf-vfp-neon.ipk
>>> 	-r--r--r-- root/root     19567 2013-11-28 15:20 =
./usr/lib/perl/vendor_perl/5.14.3/Test/Differences.pm
>>>=20
>>> A non-working one looks like this:
>>> 	[koen@rrmbp v2013.06]$ dpkg-deb -c =
deploy/eglibc/ipk/armv7ahf-vfp-neon/perl-module-build-withxspp_0.14-r0.0_a=
rmv7ahf-vfp-neon.ipk
>>> 	-rw-r--r-- root/root       361 2013-11-28 16:50 =
./usr/lib/perl/auto/Module/Build/WithXSpp/.packlist
>>> 	-r--r--r-- root/root     22557 2013-11-28 16:50 =
./usr/share/perl/Module/Build/WithXSpp.pm
>>>=20
>>> Looking through the git logs it looks like Nitin tried to fix it, =
but stopped halfway and only did cpan.bbclass properly:
>>>=20
>>> 	=
https://github.com/openembedded/oe-core/commit/83796edd29561f02b6f7b036351=
711f8def77a4f
>>>=20
>>> Since I don't know anything about perl, should cpan_build.bbclass be =
changes to install into /usr/lib/perl/vendor_perl/5.14.3 as well or are =
Build.PL based modules 'special' and need a lot more work? This is what =
I had in mind:
>>>=20
>>> -        --install_path lib=3D"${datadir}/perl" \
>>> +        --install_path =
lib=3D"${libdir}/perl/vendor_perl/${@get_perl_version(d)}" \
>>=20
>> Thinking "less is more", this seems to work:
>>=20
>> diff --git a/meta/classes/cpan_build.bbclass =
b/meta/classes/cpan_build.bbclass
>> index eaba40a..5b0ad61 100644
>> --- a/meta/classes/cpan_build.bbclass
>> +++ b/meta/classes/cpan_build.bbclass
>> @@ -32,7 +32,6 @@ cpan_build_do_configure () {
>>=20
>>        perl Build.PL --installdirs vendor \
>>                                --destdir ${D} \
>> -                               --install_path lib=3D"${datadir}/perl" =
\
>>                                --install_path arch=3D"${libdir}/perl" =
\
>>                                --install_path script=3D${bindir} \
>>                                --install_path bin=3D${bindir} \
>>=20
>> [koen@rrmbp v2013.06]$ dpkg-deb -c =
deploy/eglibc/ipk/armv7ahf-vfp-neon/perl-module-build-withxspp_0.14-r*.ipk=

>> -rw-r--r-- root/root       378 2013-11-29 14:44 =
./usr/lib/perl/auto/Module/Build/WithXSpp/.packlist
>> -r--r--r-- root/root     22557 2013-11-28 17:22 =
./usr/lib/perl/vendor_perl/5.14.3/Module/Build/WithXSpp.pm
>>=20
>> opinions, flames, etc?
>=20
> What does buildhistory say to that change on a larger set of perl
> modules?

No changes, nothing in oe-core or meta-oe/meta-perl is using =
cpan_build.bbclass (no Build.PL style packages present), only =
cpan.bbclass (Makefile.PL style packages) is being used. Tim and I seem =
to be the first ones publicly using it in recipes.

> I have to admit I'm out of touch with perl packaging but this
> would seem ok, if the default setting is sane. Does it affect native =
and
> target or just target?

Looking at the class it will affect both. I'll add some more modules and =
runtime test things to see if it works as intended and if we need even =
more fixes to make Build.PL modules and CPAN on target work.

regards,

Koen=

