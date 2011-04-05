Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q79ht-0005qZ-Sj
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Apr 2011 19:06:21 +0200
Received: by fxm19 with SMTP id 19so468148fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Apr 2011 10:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=BgZVsWKoVX062juUH5HN/PBIW4Inv3qTa3mltPatNpQ=;
	b=slstMDq5JY/0Qd35zYFJk4fvva5UWqunJVUw2pms86tFu6pDFtIufCsVUmMkXsrJ9d
	wQUTgsUi2+xohmAmrFipgqqMhAr+4rYyx1vtW3t3BmUjCWclJVBDuNsQPgou1ph9jPPV
	+8lEuhNAvQe5D9fiaGhg+oH15kWk/CvKzapYI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=mPDMMZJ2Em1//U/KEsLqoiCdkODr6DD4EicsEi5Sz8fRPxAuf1kCKI3uUkvnYEEWjM
	4BvFQW7topFZh/1MfdAxldYhL/HeTZso5Yd4dZN5MKsFRNw1lhYgsrP9u9N1ru8/JyZ+
	pyQVli9dOjYPRNAEEM2dcZXtVKdGsI42GTgK8=
Received: by 10.223.127.210 with SMTP id h18mr1699117fas.46.1302023056223;
	Tue, 05 Apr 2011 10:04:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.23.136 with HTTP; Tue, 5 Apr 2011 10:03:46 -0700 (PDT)
In-Reply-To: <1302021985.2511.16.camel@scimitar>
References: <cover.1301665368.git.josh@linux.intel.com>
	<43e615baf63929e99aacd8d2a0927c9d3f342fb6.1301665368.git.josh@linux.intel.com>
	<4D9A772C.4070409@gmail.com> <1302021985.2511.16.camel@scimitar>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 5 Apr 2011 10:03:46 -0700
Message-ID: <BANLkTikmDJ8H_eedCDDUf04WHpEuMQyWCQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/7] elfutils: fix builds with gcc 4.6
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
X-List-Received-Date: Tue, 05 Apr 2011 17:06:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 5, 2011 at 9:46 AM, Joshua Lock <josh@linux.intel.com> wrote:
> On Mon, 2011-04-04 at 18:58 -0700, Khem Raj wrote:
>> On 4/1/2011 6:51 AM, Joshua Lock wrote:
>> > From: Joshua Lock<josh@linux.intel.com>
>> >
>> > gcc 4.6 (as used in Fedora 15) adds some extra warnings which are
>> > included with Werror. The new unused-but-set variable warning causes
>> > an error in libasm of elfutils. Work around this by removing
>> > unused-but-set from Werror.
>> >
>> > Signed-off-by: Joshua Lock<josh@linux.intel.com>
>> > ---
>> > =C2=A0 meta/recipes-devtools/elfutils/elfutils_0.148.bb | =C2=A0 =C2=
=A04 ++++
>> > =C2=A0 1 files changed, 4 insertions(+), 0 deletions(-)
>> >
>> > diff --git a/meta/recipes-devtools/elfutils/elfutils_0.148.bb b/meta/r=
ecipes-devtools/elfutils/elfutils_0.148.bb
>> > index b2f700e..c395be8 100644
>> > --- a/meta/recipes-devtools/elfutils/elfutils_0.148.bb
>> > +++ b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
>> > @@ -40,6 +40,10 @@ SRC_URI +=3D "\
>> >
>> > =C2=A0 inherit autotools
>> >
>> > +# GCC 4.6.0 raises an unused-but-set warning in libasm, for now remov=
e
>> > +# this warning from Werror
>> > +CFLAGS_virtclass-native +=3D "-Wno-error=3Dunused-but-set-variable"
>> > +
>>
>> unused-but-set-variable is a new option in gcc 4.6 which means this will
>> cause problems with older gcc's as they wont recognize this option and
>> not all distros have gcc 4.6
>> as base compiler. Have you tried compiling this patchset on a build
>> machine which has older gcc ? say 4.5
>
> I had not but thanks for pointing this out. I'll work up a new patch and
> make sure to test it on a machine with an older GCC.
>

IMO either disabling Werror completely or fixing the problem are only
two alternatives

> Cheers,
> Joshua
> --
> Joshua Lock
> =C2=A0 =C2=A0 =C2=A0 =C2=A0Yocto Build System Monkey
> =C2=A0 =C2=A0 =C2=A0 =C2=A0Intel Open Source Technology Centre
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


