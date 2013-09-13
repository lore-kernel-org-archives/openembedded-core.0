Return-Path: <hans.beckerus@gmail.com>
Received: from mail-oa0-f47.google.com (mail-oa0-f47.google.com
	[209.85.219.47])
	by mail.openembedded.org (Postfix) with ESMTP id 9BCC3615D9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 09:01:14 +0000 (UTC)
Received: by mail-oa0-f47.google.com with SMTP id g12so891218oah.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 02:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=XlzIq0l+HE419z8aE3Tw/u67tA19gGS0TqpIU+28dwY=;
	b=VI8Fs4D0ateoyGBTkXuupSKHEoTSuAtCGZ/VI+7Meyg6y5f2GpnW9/N84myAf6emyx
	v1LVnLNn3ubOk0b4tVDI5jM8v6jlvj2NICn5Ofn+LRYr6ixqB6NWT162hVpDkrIYuNiH
	3fp4u0AyWfxn0QLgpAnV/FbbLDIzrMvEFmTge4z6m7jDsayjXrN6XR+CMrMbCKOQ0/kN
	nwH46M+HtnPX9aBFBqTgNxdZyi6WXSmE0oRz3R6HtrszceOcG2wu1ioaU1b8OzIE6VFg
	vjyXsyw3tug4yYYJqhmylk2FrM7G7UnQB+FkRT9UFNlohDZyLAWXCKNvhgb97cM5cXh1
	yIxw==
MIME-Version: 1.0
X-Received: by 10.182.114.231 with SMTP id jj7mr11202628obb.33.1379062875834; 
	Fri, 13 Sep 2013 02:01:15 -0700 (PDT)
Received: by 10.182.44.8 with HTTP; Fri, 13 Sep 2013 02:01:15 -0700 (PDT)
In-Reply-To: <1379062359.3484.243.camel@ted>
References: <1378825041-20190-1-git-send-email-hans.beckerus@gmail.com>
	<522F9030.3020804@linux.intel.com>
	<CAFyqS9qRvPafVSt90BQe6F3Vaz8f0P2E2R4PLKh5Zz8JH8T6Vw@mail.gmail.com>
	<CAFyqS9rvPFr2F8+Tb1P0BLn84jJ0Q+cSCM-9pt8gOATquo4Gig@mail.gmail.com>
	<5231F548.6010801@linux.intel.com>
	<CAFyqS9r3WOEjfrPe5s=n1H9SzFsnJ4FAdo=AGprWUkufUe6QRQ@mail.gmail.com>
	<52322D8B.7080406@gmail.com> <52324915.6030708@gmail.com>
	<CAFyqS9omO7majs22+o-DPii9wpw15rrhxkgQAUD35GRWjRFqLw@mail.gmail.com>
	<1379062359.3484.243.camel@ted>
Date: Fri, 13 Sep 2013 11:01:15 +0200
Message-ID: <CAFyqS9qFA-gRZw_9XXtZfROmzc5vaWSyg6MRobhFiWkzekAnHA@mail.gmail.com>
From: =?ISO-8859-1?Q?Hans_Beck=E9rus?= <hans.beckerus@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] libtool: fix resolve of lt_sysroot
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
X-List-Received-Date: Fri, 13 Sep 2013 09:01:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2013 at 10:52 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2013-09-13 at 10:06 +0200, Hans Beck=E9rus wrote:
>> On Fri, Sep 13, 2013 at 1:07 AM, Hans Beckerus <hans.beckerus@gmail.com>=
 wrote:
>> > On 2013-09-12 11:09, Hans Beckerus wrote:
>> >>
>> >> On 2013-09-12 8:02, Hans Beck=E9rus wrote:
>> >>
>> > I now got a somewhat better picture of what is going on. I know what i=
s
>> > failing, and why. But currently I have no solution ready. Actually the=
re are
>> > some nasty traps to get caught in here :(. The problem is actually as =
simple
>> > as it is obvious. For all those native packages that do work (this is =
a
>> > unique problem for native packages using libtool), they all seem to sh=
are a
>> > common thing in their recipes:
>> >
>> > EXTRA_OECONF +=3D " --with-libtool-sysroot=3D${STAGING_DIR_NATIVE}"
>> >
>> > Great! This is the way to do it. But, what if someone forgets to do th=
is?
>> > Well the answer is; it will most likely *not* compile!
>> > Since libtool now has been fixed to correctly pick up the sysroot from=
 the
>> > compiler (using --print-sysroot) if --with-libtool-sysroot is not spec=
ified
>> > it will try to execute ${CC} --print-sysroot. Bummer! ${CC} is most li=
kely
>> > simply set to 'gcc' for native packages. That is, the local host compi=
ler is
>> > used.
>> > The sysroot for that is of course "/". And it should be. Otherwise it =
will
>> > bring in the wrong set of header files and libraries. But, there is an=
other
>> > problem here. We should not let libtool use "/"! Because even if we us=
e the
>> > local host compiler for native packages, we still use the oe-core upst=
ream
>> > version of libtool, and that does not like using "/" as sysroot.  If i=
t does
>> > everything becomes a mess. And that is exactly what seems to happen no=
w
>> > after the patch. Before the patch libtool rendered the SDK for libtool
>> > enabled packages more or less useless. But, it also saved us in the na=
tive
>> > case. Because if --with-libtool-sysroot was set, the path was used dir=
ectly,
>> > but if it was not set, lt_sysroot was also kept unset. And here is the
>> > spooky part again. Having lt_sysroot set to nothing seems to work just=
 as
>> > well as setting it, provided it points to a valid location!? This magi=
c
>> > however did not work for the SDK which requires the sysroot to be reso=
lved
>> > correctly when not specified. So one conclusion could be that, for nat=
ive
>> > packages, enforcement of --with-libtool-sysroot is a possible way forw=
ard.
>> > Would this be safe? I think so, but I might have overlooked something.=
  I
>> > can also see in config.log that "configure" is fed with a lot of argum=
ents,
>> > even if EXTRA_OECONF is not specified. How is this handled? How can I =
try to
>> > force this in for all native packages. I looked into native.bbclass bu=
t it
>> > was not obvious to me how anything in there actually ends up in argume=
nts to
>> > "configure". Any hints? There are still a lot of gaps in my analysis ;=
) If
>> > anyone feels like they can fill in the gaps, please do.
>> >
>> >
>> Now this is getting interesting. When I said before I could reproduce
>> the problem in a world build I did not know that it would actually
>> succeed later. On a different build server!! The previous analysis
>> made is mostly true. But there is something more. Why did it succeed
>> on one of my servers but not the other one? The way to find out was to
>> compare what lt_sysroot is resolved to in both cases. And there it
>> was. On the machine for which it works, lt_sysroot is now picked up
>> from $CC --print-sysroot (due to the patch), but the result is not
>> "/", it is unset! Which is the same behavior that can be observed
>> without the libtool patch. So this is getting even worse now. It is
>> gcc and host dependent. If gcc has been built with a sysroot of "/" is
>> does not work since that will be picked up by libtool, and is of
>> course wrong in our case. But if lt_sysroot is kept unset, libtool
>> seems to be able to resolve a working default using some other
>> (unknown) mechanism. That is why we have not seen this problem before,
>> even though libtool actually did the wrong thing before the patch. So
>> this leaves me with at least this question; is it actually correct
>> that gcc has "/" as a compiled in sysroot on some machines?
>>
>> I then saw two possible solutions:
>>
>> a) update the patch in libtool and if gcc reports a single "/", skip
>> it and leave lt_sysroot unset.
>> b) consistency is the key. Let all native packages force setting of a
>> proper lt_sysroot  using --with-libtool-sysroot.
>>
>> This is also when I found this in autotools.bbclass
>>
>> def append_libtool_sysroot(d):
>>     # Only supply libtool sysroot option for non-native packages
>>     if not bb.data.inherits_class('native', d):
>>         return '--with-libtool-sysroot=3D${STAGING_DIR_HOST}'
>>     return ""
>>
>> I can somewhat understand the rationale behind this. If building for
>> target you wish to point libtool to a proper sysroot, and leaving it
>> unset for native seems like a good idea. But I do not think that
>> really is the case. Even for native builds you wish to point it to the
>> sysroot for the libtool actually being used. Not to what the compiler
>> is pointing to, which is now the effect after applying the libtool
>> patch. But which is actually what you want when building from an
>> placement independent SDK toolchain for which $CC is updated with a
>> proper --sysroot argument to gcc automatically when the environment
>> script is sourced.
>>
>> So my propasal now is to update autotools.bbclass and for native
>> packages set -with-libtool-sysroot=3D${STAGING_DIR_NATIVE}. This should
>> cover all the corner cases and work in all different combinations.
>> Again, consistency is the key. But I still need to try it. Problem now
>> is that I need to wait until I have access to the machine for which it
>> currently does not work to verify it properly.
>>
>> Please advise. Does anyone object strongly to this idea?
>
> Sadly its not the right thing to do. The purpose of a sysroot option is
> to say "compile and link against things in this subdirectory, do not
> look outside it". Our native binaries need to use the system libc and
> headers. They are therefore expected to look outside STAGING_DIR_NATIVE
> if they don't find what they need in there. Native is really a special
> hybrid case.
Here I am not with you really. Yes, the sysroot purpose is exactly what you=
 say.
But, the sysroot for libtool *is* different. It has nothing to do
really with what gcc is using, it just happens to be the same on
standard systems. The purpose of the libtool sysroot is to point to
libtools own sysroot, and this might not actually be the same as the
compiler sysroot. As in our case. Since for native packages, gcc and
libtool are executed in different context, libtool *must* point to its
proper location for which it was built and that is STAGING_DIR_NATIVE.

>
> So things should be working if "/" is specified as the sysroot, or its
> not specified at all. I think there are deeper bugs in libtool we're
> uncovering :(
>
> When I first saw the patch, it looked like the correct thing to be doing
> but it now seems it may uncover further bugs which are going to need to
> get fixed before we can take this patch :(.
>
I am testing this second patch now in a world build and so far
everything looks good.

> Cheers,
>
> Richard
>
>
>

