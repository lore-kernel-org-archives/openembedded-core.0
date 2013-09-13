Return-Path: <fgretief@gmail.com>
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id 1AD0E60CE6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 07:04:04 +0000 (UTC)
Received: by mail-lb0-f182.google.com with SMTP id c11so1740158lbj.41
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 00:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=R4edaeQqVLGXFZreRjSD5TkKpZ+36eAa+QnHLikWoaA=;
	b=p1/vDYQyKn6+1n7HWGpvvxgUWI44uz7FHJUiEupY4twq9T6irzuKTAghIMzUYZi/OX
	+k9/ra8VHWeOZVhvIMbaVEvoKGVDmG1UARlMJFZCszppbOL/vGfUc4OmdFxE6h0JjBBu
	yQTGCjsq2tANWqWDKImX8qRGQ+fGHxWE5PmGcucMQVEjR0GU6pfZJ6BW93pQKTe9CKnm
	Eu/EapdyP3jG5UIIARovtmZthLorDTvpBn8+ZLyxDxyaLTybHG4fM6QwFJMKlps4VqfU
	NlfbrIS1C0s51zQg18X6UnvsAWDMEMAaBSB/+bfwibSLlMiUbX1lDMLuxlhrFCArOU7w
	KxTg==
MIME-Version: 1.0
X-Received: by 10.112.60.104 with SMTP id g8mr545485lbr.32.1379055845258; Fri,
	13 Sep 2013 00:04:05 -0700 (PDT)
Received: by 10.152.37.102 with HTTP; Fri, 13 Sep 2013 00:04:05 -0700 (PDT)
In-Reply-To: <F267F9B9-8FB3-4DD8-938B-054B84882287@gmail.com>
References: <CAFpw0gLn_s_SYaj9mMtYJvBfc1dqYEzYcXFn04J9+Xm1UroLeA@mail.gmail.com>
	<522690CF.6030707@windriver.com>
	<F267F9B9-8FB3-4DD8-938B-054B84882287@gmail.com>
Date: Fri, 13 Sep 2013 09:04:05 +0200
Message-ID: <CAFpw0gKScD7rz-PQDOCWK=W5S8XO2C4TM7mw+++U4oNZW8pGGg@mail.gmail.com>
From: Francois Retief <fgretief@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: GCC search paths in MinGW SDK
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
X-List-Received-Date: Fri, 13 Sep 2013 07:04:06 -0000
Content-Type: multipart/alternative; boundary=e89a8f923ab0c83ad404e63e755a

--e89a8f923ab0c83ad404e63e755a
Content-Type: text/plain; charset=ISO-8859-1

Hi Khem,


On 13 September 2013 07:54, Khem Raj <raj.khem@gmail.com> wrote:

>
> On Sep 3, 2013, at 6:45 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>
> > On 9/3/13 4:13 PM, Francois Retief wrote:
> >> Hi all,
> >>
> >> Thanks to Richard's recent improvements in the oe-core tree, I finally
> got my
> >> first MinGW build to compile through and generate a SDK tarball.
> >>
> >> Next issue is that on windows GCC is unable to find the crt1.o, crti.o
> and
> >> crtbegin.o files. when compiling a small hello world app (see gist
> >> <
> https://gist.github.com/fgretief/6429416#file-mingw-gcc-verbose-output-2013-09-03
> >
> >> [1] for gcc verbose output). I verified that the files are indeed in
> the SDK
> >> folders and was correctly unpacked.
> >>
> >> Next, I checked the search path (-L) options and they point to the
> respective
> >> directories where the files reside.
> >>
> >> Is it hard coded somewhere GCC should look for these files?  Can anyone
> give me
> >> some pointers where to start looking?
>
> are you passing correct --sysroot option to gcc ?
>

I solved the compile issue on Windows by firstly adding a symbolic link to
the target's sysroot directory and secondly passing a --sysroot argument to
the linker.

Under Windows one can create a symlink with the mklink utility, So I did
the following:

  cd f:/oesdk/sysroots/x86_64-oesdk-mingw32/usr
  mklink /D arm-oe-linux-gnueabi ..\..\armv5te-oe-linux-gnueabi

For GCC linker, I passed in

  --sysroot=f:/oesdk/sysroots/armv5te-oe-linux-gnueabi


>
> >
> > Usually GCC can learn the location where it was executed from, and then
> use a relative path from that to the location where the libc and other
> components are located.
>
>
> are you talking about GCC_EXEC_PREFIX ?
>

I overwrite the sysroot in the MinGW gcc-cross-canadian_4.8.bbappend recipe
by changing the --with-sysroot argument in EXTRA_OECONF_PATHS variable from
  ${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}
to
  ${exec_prefix}/../../${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}

 The ${exec_prefix} path will be replaced by GCC with its executing path to
make the sysroot relative to the install path, thus eliminating the need to
pass in the sysroot to the linker.

But in another email Richard mentioned that this might have unintended
consequences when we start using multiple SDKs for machines.

Personally, I would prefer not to have to pass in a sysroot, because my
MinGW SDK compiler will be used by users that knows nothing about bitbake
or OpenEmbedded. My end users want to just create a new Eclipse C project
and point the project to the GCC compiler and it should build out of the
box. But that is another story.


> >
> >> Cheers,
> >>   Francois
> >>
> >> ps. I have noticed that there is a relocate_sdk.py file in the root of
> the SDK
> >> folder. What is it's purpose and can it have anything to do with the
> GCC search
> >> paths?
> >
> > On linux we play with the RPATH and other components to ensure that the
> executables can file the libraries for execution.  I don't believe that is
> a problem on windows as the DLLs are searched automatically.
> >
> > --Mark
> >
> >> [1]
> >>
> https://gist.github.com/fgretief/6429416#file-mingw-gcc-verbose-output-2013-09-03
> >> [2] https://github.com/fgretief/meta-mingw
>

--e89a8f923ab0c83ad404e63e755a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Khem,<br><br></div><div><div><div><div class=3D"gm=
ail_extra"><br><div class=3D"gmail_quote">On 13 September 2013 07:54, Khem =
Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_=
blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"im"><br>
On Sep 3, 2013, at 6:45 PM, Mark Hatle &lt;<a href=3D"mailto:mark.hatle@win=
driver.com">mark.hatle@windriver.com</a>&gt; wrote:<br>
<br>
&gt; On 9/3/13 4:13 PM, Francois Retief wrote:<br>
&gt;&gt; Hi all,<br>
&gt;&gt;<br>
&gt;&gt; Thanks to Richard&#39;s recent improvements in the oe-core tree, I=
 finally got my<br>
&gt;&gt; first MinGW build to compile through and generate a SDK tarball.<b=
r>
&gt;&gt;<br>
&gt;&gt; Next issue is that on windows GCC is unable to find the crt1.o, cr=
ti.o and<br>
&gt;&gt; crtbegin.o files. when compiling a small hello world app (see gist=
<br>
&gt;&gt; &lt;<a href=3D"https://gist.github.com/fgretief/6429416#file-mingw=
-gcc-verbose-output-2013-09-03" target=3D"_blank">https://gist.github.com/f=
gretief/6429416#file-mingw-gcc-verbose-output-2013-09-03</a>&gt;<br>
&gt;&gt; [1] for gcc verbose output). I verified that the files are indeed =
in the SDK<br>
&gt;&gt; folders and was correctly unpacked.<br>
&gt;&gt;<br>
&gt;&gt; Next, I checked the search path (-L) options and they point to the=
 respective<br>
&gt;&gt; directories where the files reside.<br>
&gt;&gt;<br>
&gt;&gt; Is it hard coded somewhere GCC should look for these files? =A0Can=
 anyone give me<br>
&gt;&gt; some pointers where to start looking?<br>
<br>
</div>are you passing correct --sysroot option to gcc ?<br></blockquote><di=
v><br></div><div>I solved the compile issue on Windows by firstly adding a =
symbolic link to the target&#39;s sysroot directory and secondly passing a =
--sysroot argument to the linker.<br>
<br></div><div>Under Windows one can create a symlink with the mklink utili=
ty, So I did the following:<br><br></div><div>=A0 cd f:/oesdk/sysroots/x86_=
64-oesdk-mingw32/usr<br>=A0 mklink /D arm-oe-linux-gnueabi ..\..\armv5te-oe=
-linux-gnueabi<br>
<br></div><div>For GCC linker, I passed in <br><br>=A0 --sysroot=3Df:/oesdk=
/sysroots/armv5te-oe-linux-gnueabi<br></div><div>=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br><div class=3D"im">
&gt;<br>
&gt; Usually GCC can learn the location where it was executed from, and the=
n use a relative path from that to the location where the libc and other co=
mponents are located.<br>
<br>
<br>
</div>are you talking about GCC_EXEC_PREFIX ?<br></blockquote><div><br></di=
v><div></div><div><p>I overwrite the sysroot in the MinGW gcc-cross-canadia=
n_4.8.bbappend=20
recipe by changing the --with-sysroot argument in EXTRA_OECONF_PATHS=20
variable from</p>=A0 ${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_VENDOR}-${=
TARGET_OS}<br>to <br>=A0 ${exec_prefix}/../../${TUNE_PKGARCH}${TARGET_VENDO=
R}-${TARGET_OS}<blockquote>
</blockquote>

The ${exec_prefix} path will be replaced by GCC with its executing path to =
make the sysroot relative to the install path, thus eliminating the need to=
 pass in the sysroot to the linker.<br><br></div><div>But in another email =
Richard mentioned that this might have unintended consequences when we star=
t using multiple SDKs for machines.<br>
<br></div><div>Personally, I would prefer not to have to pass in a sysroot,=
 because my MinGW SDK compiler will be used by users that knows nothing abo=
ut bitbake or OpenEmbedded. My end users want to just create a new Eclipse =
C project and point the project to the GCC compiler and it should build out=
 of the box. But that is another story.<br>
</div><div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<div class=3D""><div class=3D"h5">&gt;<br>
&gt;&gt; Cheers,<br>
&gt;&gt; =A0 Francois<br>
&gt;&gt;<br>
&gt;&gt; ps. I have noticed that there is a relocate_sdk.py file in the roo=
t of the SDK<br>
&gt;&gt; folder. What is it&#39;s purpose and can it have anything to do wi=
th the GCC search<br>
&gt;&gt; paths?<br>
&gt;<br>
&gt; On linux we play with the RPATH and other components to ensure that th=
e executables can file the libraries for execution. =A0I don&#39;t believe =
that is a problem on windows as the DLLs are searched automatically.<br>

&gt;<br>
&gt; --Mark<br>
&gt;<br>
&gt;&gt; [1]<br>
&gt;&gt; <a href=3D"https://gist.github.com/fgretief/6429416#file-mingw-gcc=
-verbose-output-2013-09-03" target=3D"_blank">https://gist.github.com/fgret=
ief/6429416#file-mingw-gcc-verbose-output-2013-09-03</a><br>
&gt;&gt; [2] <a href=3D"https://github.com/fgretief/meta-mingw" target=3D"_=
blank">https://github.com/fgretief/meta-mingw</a><br></div></div></blockquo=
te></div><br></div></div></div></div></div>

--e89a8f923ab0c83ad404e63e755a--
