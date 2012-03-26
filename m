Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SC0oC-0005eB-6O
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 05:41:28 +0200
Received: by lbbgi4 with SMTP id gi4so3513809lbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Mar 2012 20:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=ukeBtox6IXJ49O+AuKm9WsqRbCx9jUYCogyjNGsca+0=;
	b=d4ukc/WQtrJkf34dDzr1C1aDW31aQQMU3UdZQNGr/AnaFnFZwdN38gfXSVKbKKeXIS
	FjE+yngy2KOKG3sFabhN4AedYL8smY2xiHhwyc0KksYXoVGGYwIHZnqD4NdZYp1sqx3D
	4XLpiLbswh1Trjy1I/0wn3zkCHGPrhYBcBveOPc3AjY1ac5JfMKCRssc6o12uSrdw2QN
	7nvOm9WxAJZSrla5pafVgG/r4czYs+uprrLDfnvVg0h5fIQhQAaca0y90fts0PqxCSpy
	jGgvkz6G9ndPngw74sut1PLnR89In7uSwqQB7Iagt2C8J9uph/+Y/MC9xRETWPAtmv8o
	5C2A==
Received: by 10.152.146.163 with SMTP id td3mr14831034lab.31.1332732748928;
	Sun, 25 Mar 2012 20:32:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.3.161 with HTTP; Sun, 25 Mar 2012 20:31:58 -0700 (PDT)
In-Reply-To: <CAEsOVNc1KY0UW=dfDpsFRy_uiR83h=ar-jqd3y5+ktg8OZTmqQ@mail.gmail.com>
References: <4DCCC4C4-51F4-43CF-ACF2-BF3D2BAD7BDC@dominion.thruhere.net>
	<1332506475.9740.409.camel@ted>
	<CAEsOVNfaP_NzdnigOOfgOcdhkHgQfEYVoS-K0pPn1dH4PdZpEQ@mail.gmail.com>
	<20120323171347.GF9551@bill-the-cat>
	<CAEsOVNc1KY0UW=dfDpsFRy_uiR83h=ar-jqd3y5+ktg8OZTmqQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 25 Mar 2012 20:31:58 -0700
Message-ID: <CAMKF1sqqHhtZ-Cd6KRoxnF5_yQ0JYjQBB4F3G_EiMryk2y-=EQ@mail.gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: sstate reuse for -native, -cross across different host glibc version, how to make it work?
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
X-List-Received-Date: Mon, 26 Mar 2012 03:41:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 24, 2012 at 11:23 AM, McClintock Matthew-B29882
<B29882@freescale.com> wrote:
> On Fri, Mar 23, 2012 at 12:13 PM, Tom Rini <tom.rini@gmail.com> wrote:
>> On Fri, Mar 23, 2012 at 04:35:12PM +0000, McClintock Matthew-B29882 wrot=
e:
>>> On Fri, Mar 23, 2012 at 7:41 AM, Richard Purdie
>>> <richard.purdie@linuxfoundation.org> wrote:
>>> > On Fri, 2012-03-23 at 13:22 +0100, Koen Kooi wrote:
>>> >> I turned on sstate mirroring for angstrom recently and I'm getting
>>> >> reports of build failures due to missing GLIBC_2.14 symbols:
>>> >>
>>> >> arm-angstrom-linux-gnueabi-gcc: /lib/x86_64-linux-gnu/libc.so.6:
>>> >> version `GLIBC_2.14' not found (required by
>>> >> arm-angstrom-linux-gnueabi-gcc)
>>> >>
>>> >> The sstate tarballs are built on a Fedora16 VM and the breakage occu=
rs
>>> >> when it being used on systems with an older c library (e.g. debian).
>>> >> To get rid of this problem there are multiple options, but I think t=
he
>>> >> 2 most obvious are:
>>> >>
>>> >> 1) inject host distroname and distroversion into the checksums
>>> >> 2) build everything against a native libc
>>> >>
>>> > 3) Use an older version on the VM which is the oldest distro you plan=
 to
>>> > build against.
>>> >
>>> >> Would it be appropriate to get 1) into oe-core before the branchpoin=
t?
>>> >
>>> > We've talked about this and its been on the "to fix" list but nobody =
has
>>> > got around to it. Its hard as we need to come up with something that
>>> > isn't going to kill performance of the checksum calculations. A cat
>>> > operation on a few files for each checksum for example isn't
>>> > appropriate. We may need to do something at the bitbake level as ther=
e
>>> > is also the issue of checksuming local files such as those in file://
>>> > urls and including that in the sstate checksums.
>>> >
>>> > So whilst I'd love to see fixes for these and they are bugfixes, they=
're
>>> > going to have to be well written patches and its late in cycle for
>>> > invasive changes :(.
>>>
>>> Can't you just inject a variable into native.bbclass:
>>>
>>> LIBC_DEP =3D `ldd /bin/sh | grep libc`
>>
>> That just catches one of the many variables. =C2=A0If you want sstate re=
use
>> of the "runs on host" side of things, you need to capture either all of
>> the libraries we may use, build the published feed linking vs these
>> libraries (VM or chroot or sysroot games) and the include some way to
>> say "yes, X is usbale here". =C2=A0lsb_release and a little bit of mappi=
ng
>> (which can/should be done at the distro level) gets you this easier.
>
> Fair enough, but is the only solution to have native cache work per
> distro? Maybe we can have compatible distros? These sstate-cache
> starts to take up a lot of space if we want to share this via ISOs
> etc. I've been testing quite successfully with native cache that is
> used on several distros. (We are just building it on an old distro).

thats the key. You can build it on older distros and chances of those
binaries running
on newer distros are far more than building on fairly new distro and
then trying to get the
sstate working on newer distro

> Maybe I'm getting completely lucky as well which would not surprise me
> either.
>
> Another though is improving the initial user experience by pointing
> the SSTATE_MIRROR to the autobuilder

and what if user has older distro than autobuilder. ?

so the first builds go so much
> faster (experienced users could turn it off). We would need some
> policy of keeping around sstate-cache for releases and maybe keeping
> the last month of sstate cache from the current builds.
>
> -M
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


