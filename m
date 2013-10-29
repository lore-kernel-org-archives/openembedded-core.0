Return-Path: <cjp256@gmail.com>
Received: from mail-la0-f45.google.com (mail-la0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 197A46D312
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 20:20:24 +0000 (UTC)
Received: by mail-la0-f45.google.com with SMTP id hp15so328669lab.32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 13:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=B8nF2GbH0sNts3H+A046g0MMCJ6ZV3IFFHGeRzUFIbE=;
	b=dMAudjzbUhJ9f2QkQX+D80vX8stVXtWG5T6W0JsGy9PrJnNT44STROTaBmrbvokPLa
	k882IDKt5h/eA2pviHZQX7cKKnbb4R9li7JuDnMzrd7EDiCsb4Zd4i6kgMtxGDRXj8kE
	bRiVI+em9+t9EPRpvpgcsR7IZ4zNoihEEJVesCdg7FffVZ/RRdOK7BTpQXTXMFkxWBAx
	WbqnMihnWGiurE+iYr4r6pkOE1PB07EZbCdVLwoj7CKf9HwOqv/I63UVeG74AFB9Y2yM
	Wh++0sJyiAS/1HsH74em50SmGkJKPSBPJNHcxujTRomUEX1vG9kEbN+zVKibqQJo6XWQ
	OoZA==
MIME-Version: 1.0
X-Received: by 10.112.128.166 with SMTP id np6mr1131589lbb.7.1383078025929;
	Tue, 29 Oct 2013 13:20:25 -0700 (PDT)
Received: by 10.114.181.41 with HTTP; Tue, 29 Oct 2013 13:20:25 -0700 (PDT)
In-Reply-To: <20131029072729.GB6291@lpalcu-linux>
References: <1381882516-29599-1-git-send-email-cjp256@gmail.com>
	<5268DEE0.7000506@linux.intel.com>
	<CABZSBQepb=+J-OSGkD7Kt-u9sZU0eLJ+-NSqZS-np9tp6xc2RQ@mail.gmail.com>
	<20131029072729.GB6291@lpalcu-linux>
Date: Tue, 29 Oct 2013 16:20:25 -0400
Message-ID: <CABZSBQfM7hwgF7ZtmypBzJQoTGPObow59zADZdbnaEK-+YO-Jw@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: upgrade to 1.6.1
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
X-List-Received-Date: Tue, 29 Oct 2013 20:20:25 -0000
Content-Type: multipart/alternative; boundary=047d7b343ef26eaa3004e9e6f2d9

--047d7b343ef26eaa3004e9e6f2d9
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Oct 29, 2013 at 3:27 AM, Laurentiu Palcu
<laurentiu.palcu@intel.com>wrote:

> Hi Chris,
>
> On Mon, Oct 28, 2013 at 07:54:51PM -0400, Chris Patterson wrote:
> >
> > I'm not terribly familiar with the nativesdk, and (foolishly) neglected
> to test
> > that.  However, I looked into it, and it looks like the
> relocatable_sdk.patch
> > affects a linker script that is no longer available.  I dropped the
> patch and
> > tested installing an oe-core sdk sysroot (via bitbake -c populate_sdk
> > core-image-minimal) and qemu appears to work fine from within the sdk
> > environment.
> >
> > I'm open to suggestions for further testing this upgrade (particularly a
> case
> > to cover what relocatable_sdk.patch was originally intended to resolve).
> I'm
> > certainly not the expert here, but am willing to help out.
> >
> To test this particular case, build meta-toolchain and install it in a
> different location than the default one. Then, just do a 'readelf -s"
> on any qemu binary and make sure the .interp section has a size of 0x1000
> bytes.
>
> If it does, then it's ok to drop the patch. That patch was needed
> because qemu happened to use their own linker scripts and, in order to
> have the SDK relocatable, we needed to reseve space in the .interp
> section to squeeze the new path.


Thanks Laurentiu - I did validate that the interp section looks to be
0x1000 bytes for the qemu-* binaries:

$
/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/bin/qemu-system-arm
--version
QEMU emulator version 1.6.1, Copyright (c) 2003-2008 Fabrice Bellard

$ readelf -S
/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/bin/qemu-system-arm

There are 29 section headers, starting at offset 0x5a14b8:

Section Headers:
  [Nr] Name              Type             Address           Offset
       Size              EntSize          Flags  Link  Info  Align
  [ 0]                   NULL             0000000000000000  00000000
       0000000000000000  0000000000000000           0     0     0
  [ 1] .interp           PROGBITS         0000000000000270  00000270
       0000000000001000  0000000000000000   A       0     0     1
  [ 2] .note.ABI-tag     NOTE             0000000000001270  00001270
       0000000000000020  0000000000000000   A       0     0     4
  [ 3] .note.gnu.build-i NOTE             0000000000001290  00001290
...

If anyone has any other suggestions to test, I will gladly attempt them
before posting a v2.

Cheers!
-Chris

--047d7b343ef26eaa3004e9e6f2d9
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Tue, Oct 29, 2013 at 3:27 AM, Laurentiu Palcu <span dir=3D"ltr">=
&lt;<a href=3D"mailto:laurentiu.palcu@intel.com" target=3D"_blank">laurenti=
u.palcu@intel.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">Hi Chris,<br>
<div class=3D"im"><br>
On Mon, Oct 28, 2013 at 07:54:51PM -0400, Chris Patterson wrote:<br>
&gt;<br>
&gt; I&#39;m not terribly familiar with the nativesdk, and (foolishly) negl=
ected to test<br>
&gt; that. =A0However, I looked into it, and it looks like the relocatable_=
sdk.patch<br>
&gt; affects a linker script that is no longer available. =A0I dropped the =
patch and<br>
&gt; tested installing an oe-core sdk sysroot (via bitbake -c populate_sdk<=
br>
&gt; core-image-minimal) and qemu appears to work fine from within the sdk<=
br>
&gt; environment.<br>
&gt;<br>
&gt; I&#39;m open to suggestions for further testing this upgrade (particul=
arly a case<br>
&gt; to cover what relocatable_sdk.patch was originally intended to resolve=
). I&#39;m<br>
&gt; certainly not the expert here, but am willing to help out.<br>
&gt;<br>
</div>To test this particular case, build meta-toolchain and install it in =
a<br>
different location than the default one. Then, just do a &#39;readelf -s&qu=
ot;<br>
on any qemu binary and make sure the .interp section has a size of 0x1000 b=
ytes.<br>
<br>
If it does, then it&#39;s ok to drop the patch. That patch was needed<br>
because qemu happened to use their own linker scripts and, in order to<br>
have the SDK relocatable, we needed to reseve space in the .interp<br>
section to squeeze the new path.</blockquote><div><br></div><div>Thanks Lau=
rentiu - I did validate that the interp section looks to be 0x1000 bytes fo=
r the qemu-* binaries:</div><div><br></div><div>$ /usr/local/oecore-x86_64/=
sysroots/x86_64-oesdk-linux/usr/bin/qemu-system-arm --version</div>
<div>QEMU emulator version 1.6.1, Copyright (c) 2003-2008 Fabrice Bellard</=
div><div><br></div><div>$ readelf -S /usr/local/oecore-x86_64/sysroots/x86_=
64-oesdk-linux/usr/bin/qemu-system-arm =A0</div><div>There are 29 section h=
eaders, starting at offset 0x5a14b8:</div>
<div><br></div><div>Section Headers:</div><div>=A0 [Nr] Name =A0 =A0 =A0 =
=A0 =A0 =A0 =A0Type =A0 =A0 =A0 =A0 =A0 =A0 Address =A0 =A0 =A0 =A0 =A0 Off=
set</div><div>=A0 =A0 =A0 =A0Size =A0 =A0 =A0 =A0 =A0 =A0 =A0EntSize =A0 =
=A0 =A0 =A0 =A0Flags =A0Link =A0Info =A0Align</div><div>=A0 [ 0] =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 NULL =A0 =A0 =A0 =A0 =A0 =A0 0000000000000000 =
=A000000000</div>
<div>=A0 =A0 =A0 =A00000000000000000 =A00000000000000000 =A0 =A0 =A0 =A0 =
=A0 0 =A0 =A0 0 =A0 =A0 0</div><div>=A0 [ 1] .interp =A0 =A0 =A0 =A0 =A0 PR=
OGBITS =A0 =A0 =A0 =A0 0000000000000270 =A000000270</div><div>=A0 =A0 =A0 =
=A00000000000001000 =A00000000000000000 =A0 A =A0 =A0 =A0 0 =A0 =A0 0 =A0 =
=A0 1</div>
<div>=A0 [ 2] .note.ABI-tag =A0 =A0 NOTE =A0 =A0 =A0 =A0 =A0 =A0 0000000000=
001270 =A000001270</div><div>=A0 =A0 =A0 =A00000000000000020 =A000000000000=
00000 =A0 A =A0 =A0 =A0 0 =A0 =A0 0 =A0 =A0 4</div><div>=A0 [ 3] .note.gnu.=
build-i NOTE =A0 =A0 =A0 =A0 =A0 =A0 0000000000001290 =A000001290</div>
<div>...</div><div><br></div><div>If anyone has any other suggestions to te=
st, I will gladly attempt them before posting a v2.</div><div><br></div><di=
v>Cheers!</div><div>-Chris</div></div></div></div>

--047d7b343ef26eaa3004e9e6f2d9--
