Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6F66961855
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 18:39:17 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id a2so311019vso.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 10:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=LTQKgyRVc+EQU8vq4Eg+tOZjQzHSc0IKGvw5YJBIiH8=;
	b=IBugSnMtrDzMpL1G8T9eI19tj8lWXdEHZiRu8r0pZl9bLmbYwiMXHqW72vZ9OsLule
	p+GE68soG4MMdbvejfHoLCZBGKvprql+fv41D2AmHf8wppzpYBfkteeYJluROzNslZ84
	AOtakJaAq38wH1CgG3mQmkWQ0iDe0jZZVHNjIUT/MimwLOEJ0tAAyZ4nDKs78Z/HPMGQ
	A5ERDwdE1udsCEXZSANh5V18msczXctkwUKToZAL4dtcBgjHv3Vo35MP+0RdEmzGZLoZ
	4Afe56QrTxQ60hFwLca6PI1n0/7OjLSp+Qu/t+5VCrXikH2dEF+U+5yD86nvezFDIDFp
	svig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=LTQKgyRVc+EQU8vq4Eg+tOZjQzHSc0IKGvw5YJBIiH8=;
	b=BXYFucy35AoB5WJGASwossTCkPXkxp3G2i3DHlWN5gefjqAZLzLRTDaR9v+BzTL6PB
	iy0XCSAIc4ph5COEl1H2unMVd6WsPPGiknD+QLlh5zIbn7B9g6g3r2vQ9+pk1rHRzhk9
	DiV6w2/3gKUIXcunT5q9CBHNVXy17UcAsP6TVBHtnoiM8dv00y9Om6qjv+LIDO5UursM
	JfBLWn/UPi0HDUY/R3IYDSLUys9u5S+sgmmOuPmCqann4jFQ/eiqiej1DcMvKz5QZcer
	fW+6rChsr44YdrT4aHt7GD9FhVE9ISMzAK0FYbng+ELh5Ad05SFpTB0sPrPedSoYtkMK
	QCdw==
X-Gm-Message-State: ANhLgQ0H0a0b8py1WCquT7rLE+iBN4O23PtH2+JD2BXBpprCP7wpxXMw
	CbGB0qz8U9cqoH/w/bRmDmA5e/pjw3AEjZw3uTc=
X-Google-Smtp-Source: ADFU+vsuPjm1GeVzDqV4cpjM2n5QKRCc9m8qxH720+LXB4GqSzP3EO2f3wy8rOw9mvC07ydoCG01a1x2TSMahse8xss=
X-Received: by 2002:a67:f41a:: with SMTP id p26mr413730vsn.222.1582828758086; 
	Thu, 27 Feb 2020 10:39:18 -0800 (PST)
MIME-Version: 1.0
References: <20200225141733.54584-1-eugenyshcheglov@gmail.com>
	<CAJ86T=VH+nVRgdWr4hyX0WZVnGwu=4MOsSs7a_8QcqAYHt1nfA@mail.gmail.com>
	<CALepYk+MjGAN_XO9abU9pd6Zq+7FYezboCTSEqBUneGphjTu8g@mail.gmail.com>
In-Reply-To: <CALepYk+MjGAN_XO9abU9pd6Zq+7FYezboCTSEqBUneGphjTu8g@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 27 Feb 2020 10:39:04 -0800
Message-ID: <CAJ86T=UTQBtCi=rM0YPLqCVi9bgD+pt9FZr4rXWXxUNPJWTyAA@mail.gmail.com>
To: Eugeny Shcheglov <eugenyshcheglov@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] utils.bbclass: Avoid recursive symlink in oe_soinstall
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
X-List-Received-Date: Thu, 27 Feb 2020 18:39:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 27, 2020 at 3:42 AM Eugeny Shcheglov
<eugenyshcheglov@gmail.com> wrote:
>
> >This patch look OK but it might be nice to also clean up this error
> message (and the Example comment a few lines above it) to drop the 3
> levels of version number. There should only be 2, ie the fully
> versioned filename would be libfoo.so.1.2 instead of libfoo.so.1.2.3
>
> Yeah, sound reasonable. According to the tLDP (http://tldp.org/HOWTO/Program-Library-HOWTO/shared-libraries.html)
> there can be be 3 levels, but last one is optional. Quote from tLDP: "The real name adds to the soname a period, a minor
> number, another period, and the release number. The last period and release number are optional".

In terms of creating symlinks there are only two levels to the version
number: .so is a symlink to .so.<major> and .so.<major> is a symlink
to a file called .so.<major>.<everythingelse> (and soname matches
.so.<major>). You can define the structure of <everythingelse> to be
just a minor number, a minor number and a release number, or something
else it still works fine from the point of view of this function. The
common case is for <everythingelse> to just be the minor release
number and I think it's clearer if the the comments and error messages
for this function reflect that.

> So yes, correct fully versioned name should contain at least two numbers
>
> >"oe_soinstall: $libname soname is equal to fully versioned real (file) name. The soname should include the major version only (e.g.libfoo.so.1 instead of libfoo.so.1.2)"
>
> Good point. But what if library real name is libfoo.so.1 and soname is libfoo.so.1 too? In my opinion there is two ways:

That's a case where you only need one symlink (ie .so is a symlink to
a file called .so.<major> and soname matches .so.<major>) and it
doesn't seem to have been considered when this function was originally
written. I agree it's a valid use case though (and I guess trying to
fix that is the original motivation behind sending this patch?).

Ideally the function should be able to distinguish between needing to
create a single symlink and needing to create two symlinks but the
soname is incorrect... and give a meaningful error in the second case.

> 1) Add one more check: parse $sonamelink and throw bbwarn if soname is incorrect. "Incorrect" in this case means that
> soname contain more than one version (libfoo.so.1.2)
>
> 2) Mention both possible problems in bbwarn. Like: " $libname soname is equal to fully versioned real (file)
> name. The soname should include the major version only (e.g. libfoo.so.1 instead of libfoo.so.1.2) or minor version
> should be added to library real name (e.g. libfoo.so.1.2 instead of libfoo.so.1) ; "
>
> First one is definitely clearer. So I'm going to implement it and send version 2 of patch
>
> On Wed, Feb 26, 2020 at 10:08 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> On Tue, Feb 25, 2020 at 6:17 AM Yevhenii Shchehlov
>> <eugenyshcheglov@gmail.com> wrote:
>> >
>> > This patch fixes an issue when oe_soinstall function creates
>> > non-functional recursive symlinks in case library soname is equal
>> > to library real (file) name.
>> >
>> > Signed-off-by: Yevhenii Shchehlov <eugenyshcheglov@gmail.com>
>> > ---
>> >  meta/classes/utils.bbclass | 8 ++++++--
>> >  1 file changed, 6 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
>> > index cd3d05709e..dea824f54f 100644
>> > --- a/meta/classes/utils.bbclass
>> > +++ b/meta/classes/utils.bbclass
>> > @@ -25,7 +25,7 @@ oe_soinstall() {
>> >         libname=`basename $1`
>> >         case "$libname" in
>> >             *.so)
>> > -               bbfatal "oe_soinstall: Shared library must haved versioned filename (e.g. libfoo.so.1.2.3)"
>> > +               bbfatal "oe_soinstall: Shared library must haved versioned filename (e.g. libfoo.so.1.2.3 instead of libfoo.so)"
>>
>> This patch look OK but it might be nice to also clean up this error
>> message (and the Example comment a few lines above it) to drop the 3
>> levels of version number. There should only be 2, ie the fully
>> versioned filename would be libfoo.so.1.2 instead of libfoo.so.1.2.3
>>
>> >                 ;;
>> >         esac
>> >         install -m 755 $1 $2/$libname
>> > @@ -33,8 +33,12 @@ oe_soinstall() {
>> >         if [ -z $sonamelink ]; then
>> >                 bbfatal "oe_soinstall: $libname is missing ELF tag 'SONAME'."
>> >         fi
>> > +       if [ "$sonamelink" == "$libname" ]; then
>> > +               bbwarn "oe_soinstall: $libname soname is equal to real (file) name. Minor version should be added to a real name (e.g. libfoo.so.1.2 instead of libfoo.so.1)"
>>
>> It might be clearer to say:
>>
>> "oe_soinstall: $libname soname is equal to fully versioned real (file)
>> name. The soname should include the major version only (e.g.
>> libfoo.so.1 instead of libfoo.so.1.2)"
>>
>> > +       else
>> > +               ln -sf $libname $2/$sonamelink
>> > +       fi
>> >         solink=`echo $libname | sed -e 's/\.so\..*/.so/'`
>> > -       ln -sf $libname $2/$sonamelink
>> >         ln -sf $libname $2/$solink
>> >  }
>> >
>> > --
>> > 2.25.1
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

