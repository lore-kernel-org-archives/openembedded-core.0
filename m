Received: from mail-lb0-f178.google.com ([209.85.217.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1UWCkg-0002L7-Ju
	for openembedded-core@lists.openembedded.org;
	Sat, 27 Apr 2013 23:34:02 +0200
Received: by mail-lb0-f178.google.com with SMTP id w10so4699156lbi.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Apr 2013 14:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=TygOtLbtPWs4/aJwFbJWCLMRGB5HqbXgQN7loNqIyrI=;
	b=tLhe++fe27FUQD5nUvHhPGtq0b+KrY5fldTmpnxbcSRZC7U7IgMvPnJ4bRb2ryCnF0
	jFJUfADbz8yjeZl9gsQk1W+HKzwkG6wYWnq8K9dtlhB2gH0lOZ23jlNNokYVYeHnXUQE
	+jRMaYLqIRMZ+uThC3vdvhXxqDoK9NEO+iyJW9aXUxxif9KYwKTCK1f0TVZ5TqiabZSU
	7R65xj4VNo7TAqJ1oz7Nxc6BqVjoOTIX4CQ1wuU+iL5UpL8SwsKTTEJMfIW7FlZ9CdDb
	ZF4EC4RTassQGJrOBwhO+Nm3hSHcTsJ8bFMJJGs2qic9e6RP2k9WKgxNnsxpvbDfckM/
	NBBw==
X-Received: by 10.152.88.115 with SMTP id bf19mr8782385lab.56.1367097363564;
	Sat, 27 Apr 2013 14:16:03 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.43.161 with HTTP; Sat, 27 Apr 2013 14:15:42 -0700 (PDT)
In-Reply-To: <1366888374.14512.78.camel@phil-desktop.brightsign>
References: <1349169606.32611.73.camel@phil-desktop>
	<1349176346.15753.139.camel@ted>
	<1349176541.32611.80.camel@phil-desktop>
	<1349177925.15753.140.camel@ted>
	<1366888374.14512.78.camel@phil-desktop.brightsign>
From: Chris Larson <clarson@kergoth.com>
Date: Sat, 27 Apr 2013 17:15:42 -0400
X-Google-Sender-Auth: h6J1MTg3zk-OeGX06UO0B3tHp3o
Message-ID: <CABcZAN=jXZYpA4bt=RjvtK+ihusFe8birGaTC7z8FiRu+np2aQ@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rootfs_ipk, image: Add debug capture support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 27 Apr 2013 21:34:29 -0000
Content-Type: multipart/alternative; boundary=001a11c36702ba8e0804db5e2806

--001a11c36702ba8e0804db5e2806
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 25, 2013 at 7:12 AM, Phil Blundell <pb@pbcl.net> wrote:

> > Something like IMAGE_FEATURES += "dbg-pkgs" should trigger the addition
> > of dbg packages.
>
> I've somewhat belatedly gotten around to using this and encountered a
> couple of issuettes:
>
> 1. There was a spurious-looking RRECOMMENDS_${PN}-dbg in bitbake.conf
> which was causing ${PN} to be dragged into the image whenever ${PN}-dbg
> was installed.  This is undesirable because it means that, for example,
> any image which includes sysvinit-pidof will end up installing sysvinit
> and this might cause quite drastic changes to the behaviour of the
> resulting image.
>
> 2. Having fixed the above I'm now left with a couple of file conflicts
> in the -dbg packages.  For example, sysvinit and util-linux both
> ship /sbin/sulogin and so sysvinit-dbg and util-linux-dbg both want to
> install /sbin/.debug/sulogin.  This is unfortunate if you have an image
> which uses, say, sysvinit-pidof and util-linux-blkid.
>
> I'm not quite sure what the right way to fix (2) is.  I suppose in an
> ideal world the -dbg packages would be separated in the same way the
> parent binary packages are, but that doesn't look entirely
> straightforward to arrange.


I had implemented something along these lines back in oe classic, when I
was at MontaVista.  See
http://git.openembedded.org/openembedded/tree/classes/package_dbg.bbclass for
that implementation. I haven't touched it or tried using it in some time,
however.
-- 
Christopher Larson
clarson at kergoth dot com
Senior Software Engineer, Mentor Graphics

--001a11c36702ba8e0804db5e2806
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Apr 25, 2013 at 7:12 AM, Phil Blundell <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:pb@pbcl.net" target=3D"_blank">pb@pbcl.net</a>&gt;</span> wrote=
:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:so=
lid;padding-left:1ex">

<div class=3D"im">&gt; Something like IMAGE_FEATURES +=3D &quot;dbg-pkgs&qu=
ot; should trigger the addition<br>
&gt; of dbg packages.<br>
<br>
</div>I&#39;ve somewhat belatedly gotten around to using this and encounter=
ed a<br>
couple of issuettes:<br>
<br>
1. There was a spurious-looking RRECOMMENDS_${PN}-dbg in bitbake.conf<br>
which was causing ${PN} to be dragged into the image whenever ${PN}-dbg<br>
was installed. =C2=A0This is undesirable because it means that, for example=
,<br>
any image which includes sysvinit-pidof will end up installing sysvinit<br>
and this might cause quite drastic changes to the behaviour of the<br>
resulting image.<br>
<br>
2. Having fixed the above I&#39;m now left with a couple of file conflicts<=
br>
in the -dbg packages. =C2=A0For example, sysvinit and util-linux both<br>
ship /sbin/sulogin and so sysvinit-dbg and util-linux-dbg both want to<br>
install /sbin/.debug/sulogin. =C2=A0This is unfortunate if you have an imag=
e<br>
which uses, say, sysvinit-pidof and util-linux-blkid.<br>
<br>
I&#39;m not quite sure what the right way to fix (2) is. =C2=A0I suppose in=
 an<br>
ideal world the -dbg packages would be separated in the same way the<br>
parent binary packages are, but that doesn&#39;t look entirely<br>
straightforward to arrange.</blockquote></div><br>I had implemented somethi=
ng along these lines back in oe classic, when I was at MontaVista. =C2=A0Se=
e=C2=A0<a href=3D"http://git.openembedded.org/openembedded/tree/classes/pac=
kage_dbg.bbclass">http://git.openembedded.org/openembedded/tree/classes/pac=
kage_dbg.bbclass</a>=C2=A0for that implementation. I haven&#39;t touched it=
 or tried using it in some time, however.<br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Senior Software =
Engineer, Mentor Graphics
</div></div>

--001a11c36702ba8e0804db5e2806--
