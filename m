Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f173.google.com (mail-ve0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id 60FC46B25A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 10:04:41 +0000 (UTC)
Received: by mail-ve0-f173.google.com with SMTP id cy12so149261veb.32
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 03:04:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=iFZ/TlVok5KLTWTTewC8eyfxDAZ5ERErohwH/eptB1U=;
	b=FQoEHCwD81qXwzAR0+1e68Br4gTcvVEuOnF7IAmq/l7QsGjCqWywSYmjluHnPwbix4
	Pnq3NB94MXh+hChpb84bB61TOYsehiZWdmeqaQ4fR5Ib6OP/aTxY8JwfzHtv6TPobpWV
	0KFOr1mbsty5P4vDQcMIRnzM7sftNDJefACbSbZYCXR2CWNFsXF1go2E7L528ay0EmWX
	D6HVXsG4SAw1S074ZGUGsgctOQsxyZdhuSN86wg4ZRi4LfehLktv5hK5wsTsYwwUzLp3
	0SCgfpRjZaIWKT6vcbNRM3PDNrfCH7NwCcz5i++qSrgslsUWeoIr5TLXvGwTvF+9lWvd
	aKmQ==
X-Gm-Message-State: ALoCoQm+Ue3NfRJRBR9B7oWk2rRLKPBwL7/gKqe4rdwDe7oeMaejsPLCS4K3qRD0cvyKd2ENK18/
X-Received: by 10.220.164.70 with SMTP id d6mr5680818vcy.19.1377079480572;
	Wed, 21 Aug 2013 03:04:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Wed, 21 Aug 2013 03:04:20 -0700 (PDT)
In-Reply-To: <52147D02.10106@communistcode.co.uk>
References: <CAOMwXhNaMEvSfi-J=EPOXfSAfjWUJeq8pGAGE3_5Hix1Sw9mKg@mail.gmail.com>
	<520E17F6.4030500@communistcode.co.uk>
	<CAOMwXhMD5FE2jK-R+5SCYRCtpS0S_Nk-6HhbsiUJt9i63-kHUQ@mail.gmail.com>
	<52147D02.10106@communistcode.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 21 Aug 2013 11:04:20 +0100
Message-ID: <CAJTo0Lap8PHE-=d_S7M7gEOzaXud3EqWgkbzU+5VQH7vUeVw7g@mail.gmail.com>
To: Jack Mitchell <ml@communistcode.co.uk>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Why is "bitbake core-image-minimal" building gtk docs?
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
X-List-Received-Date: Wed, 21 Aug 2013 10:04:41 -0000
Content-Type: multipart/alternative; boundary=047d7b414aa4446ab304e4724d7d

--047d7b414aa4446ab304e4724d7d
Content-Type: text/plain; charset=UTF-8

On 21 August 2013 09:40, Jack Mitchell <ml@communistcode.co.uk> wrote:

> Here is the patch which kicks it all off:
>
>
> http://lists.linuxtogo.org/pipermail/openembedded-core/2012-July/026077.html
>
> So, make of this what you will. I've cc'd Ross in to see if he has a
> specific reason for re-enabling gkt-doc in some packages. Maybe we
> should turn it into an image feature...?
>

tl;dr: it's a stub package, you're not building any gtk-doc, and you can't
turn it on if you wanted to.

There's some confusion in this thread, so I'll try and clear it up.

We need to build gtk-doc (or compatible) because it provides m4 autoconf
fragments that are needed at configure time by any package that uses
gtk-doc for documentation.  Previously we were patching recipes one by one
to disable the rules, but that's prone to failure.  We integrated
gtk-doc-stub (also used by gnome-os) which has the same external interfaces
but is entirely stubs, for example:

https://git.gnome.org/browse/gtk-doc-stub/tree/gtk-doc.m4

This way we can actually configure everything that uses gtk-doc without
needing the full gtk-doc package.

There is a gtk-doc class which adds a dependency on gtk-doc-stub-native and
then adds --disable-gtk-doc to EXTRA_OECONF.  This is why the explicit
--disable was removed from connman: it was redundant.

The other advantage of using a central gtk-doc class is that if someone did
want to build gtk-doc, they would just need to package up the real gtk-doc
and change the class.

Ross

--047d7b414aa4446ab304e4724d7d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 21 August 2013 09:40, Jack Mitchell <span dir=3D"ltr">&=
lt;<a href=3D"mailto:ml@communistcode.co.uk" target=3D"_blank">ml@communist=
code.co.uk</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=
=3D"gmail_quote">

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div class=3D"im"><span style=3D"color:rgb(34,34,34)">Here=
 is the patch which kicks it all off:</span><br>

</div>
<br>
<a href=3D"http://lists.linuxtogo.org/pipermail/openembedded-core/2012-July=
/026077.html" target=3D"_blank">http://lists.linuxtogo.org/pipermail/openem=
bedded-core/2012-July/026077.html</a><br>
<br>
So, make of this what you will. I&#39;ve cc&#39;d Ross in to see if he has =
a<br>
specific reason for re-enabling gkt-doc in some packages. Maybe we<br>
should turn it into an image feature...?<br></blockquote><div><br></div><di=
v>tl;dr: it&#39;s a stub package, you&#39;re not building any gtk-doc, and =
you can&#39;t turn it on if you wanted to.<br></div><div><br></div><div>

There&#39;s some confusion in this thread, so I&#39;ll try and clear it up.=
</div><div><br></div><div>We need to build gtk-doc (or compatible) because =
it provides m4 autoconf fragments that are needed at configure time by any =
package that uses gtk-doc for documentation. =C2=A0Previously we were patch=
ing recipes one by one to disable the rules, but that&#39;s prone to failur=
e. =C2=A0We integrated gtk-doc-stub (also used by gnome-os) which has the s=
ame external interfaces but is entirely stubs, for example:</div>

<div><br></div><div><a href=3D"https://git.gnome.org/browse/gtk-doc-stub/tr=
ee/gtk-doc.m4">https://git.gnome.org/browse/gtk-doc-stub/tree/gtk-doc.m4</a=
><br></div><div><br></div><div>This way we can actually configure everythin=
g that uses gtk-doc without needing the full gtk-doc package.</div>

<div><br></div><div>There is a gtk-doc class which adds a dependency on gtk=
-doc-stub-native and then adds --disable-gtk-doc to EXTRA_OECONF. =C2=A0Thi=
s is why the explicit --disable was removed from connman: it was redundant.=
</div>

<div><br></div><div>The other advantage of using a central gtk-doc class is=
 that if someone did want to build gtk-doc, they would just need to package=
 up the real gtk-doc and change the class.</div><div><br></div><div>Ross</d=
iv>

</div></div></div>

--047d7b414aa4446ab304e4724d7d--
