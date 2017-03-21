Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 0D0E0778FF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 14:14:05 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id p64so135710508qke.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 07:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=z3ps9jlLruiaoYuyPikk6eHQd9kgKBroDBDyFjD4Gjc=;
	b=P97XyHvil3LLtmMK6WeB7q38t2Ud6rbRQFaXsMX7ereKpS6mFDmrwG1SAqEEtcdvV0
	80ipAQco5dpX7gsW37Yy5XYGK2lFr4Buci9J/dOL5UTRz/es/cHuwiJ4ckVgPHFQm2vh
	WRqvtywS7P4eFzqdmsqjNw2ICydab//ycqglderirfAVXHn39hh4djSoagjrL1ygxnnr
	U9PYo5gGQ8ctsgvZoGSbDKtEofaQgl/0yVLB+Qer+LbpGoxXhdXOeWHItJy3Hr96P6dJ
	zsl04CuWLpyjaKrT/8p8bVkfEQT8yCx1v8U6gvKa0J/mGf1PJDhFD5zFFMw//+H+2+cm
	UrVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=z3ps9jlLruiaoYuyPikk6eHQd9kgKBroDBDyFjD4Gjc=;
	b=pz5fpMEcSDh6mai2nemolaGK4Cu9cm6li8xZpwXzLoG+Z+KPrl3DS3c5QMBR9Pki03
	B8/qnx5kRFq5/0zpOiaYd4RLFQ8maBKQZtAb/kyAzQgjk5G5V+CSyV9Tj48fkAtx4mJJ
	N5Ns8vAkciZ80L14JRbf48Uiiw90qDLskOTA72t2KNQNzLdCjLEQF7VDa88ZIte4a6Gg
	JWzQdyABHr7vL4nPSmYJE+CJBu+4G/MvL1Ki3CIcv7igxlV6qdAuGXypf+Fi9CZYaujL
	7rSX/UzwIbZh3Ah3TFROcPcHf4sv5sfQSrKp58SzKHx+wHhSDKaDlj2iTygs06ImrO/i
	bTSQ==
X-Gm-Message-State: AFeK/H10pXtvuAUuBucIUgPnUj8wBuSzH5B/3suzdPRvedjyQgnTIlQyGHzT+jnrQOM7VGn6aECtnqQ18dLXG+lI
X-Received: by 10.55.175.195 with SMTP id y186mr30248488qke.26.1490105646801; 
	Tue, 21 Mar 2017 07:14:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Tue, 21 Mar 2017 07:13:46 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1703210915080.29107@uk63952.mitel.com>
References: <alpine.LFD.2.20.1703210915080.29107@uk63952.mitel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 21 Mar 2017 14:13:46 +0000
Message-ID: <CAJTo0LZnBF2=aYmRUXmf2TuAXOJJcJwqeHo9FvV8T-201k=OUw@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: how to hack cross-compilation into a single "plugins" directory?
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
X-List-Received-Date: Tue, 21 Mar 2017 14:14:06 -0000
Content-Type: multipart/alternative; boundary=94eb2c06093cc17703054b3e4138

--94eb2c06093cc17703054b3e4138
Content-Type: text/plain; charset=UTF-8

On 21 March 2017 at 13:23, Robert P. J. Day <rpjday@crashcourse.ca> wrote:

>   i'm sure i could tease out how to hack that Makefile, but is there
> another recipe with a similar structure i could just steal a Makefile
> from?
>

This used to work because we used to pass -e to every make:

       -e, --environment-overrides
            Give variables taken from the environment precedence over
variables from makefiles.

So the exported CC=my-cross-gcc in bitbake.conf overrode the CC assignment
in the Makefile.

This is a vile hack though so we don't do itnow.  You'll just need to set
CC etc when calling make, trivially done with EXTRA_OEMAKE.

In fact this is even in the documentation:
http://www.yoctoproject.org/docs/2.2.1/dev-manual/dev-manual.html#new-recipe-makefile-based-package

Ross

--94eb2c06093cc17703054b3e4138
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 March 2017 at 13:23, Robert P. J. Day <span dir=3D"ltr">&lt;<a href=
=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.ca</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);b=
order-left-style:solid;padding-left:1ex"><div id=3D"gmail-:3r" class=3D"gma=
il-a3s gmail-aXjCH gmail-m15af10a91f4bfc24">=C2=A0 i&#39;m sure i could tea=
se out how to hack that Makefile, but is there<br>
another recipe with a similar structure i could just steal a Makefile<br>
from?</div></blockquote></div><br>This used to work because we used to pass=
 -e to every make:</div><div class=3D"gmail_extra"><br></div><div class=3D"=
gmail_extra"><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0-e, --en=
vironment-overrides</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 Give variables taken from the environment precedence o=
ver variables from makefiles.</div><div class=3D"gmail_extra"><br></div><di=
v class=3D"gmail_extra">So the exported CC=3Dmy-cross-gcc in bitbake.conf o=
verrode the CC assignment in the Makefile.</div><div class=3D"gmail_extra">=
<br></div><div class=3D"gmail_extra">This is a vile hack though so we don&#=
39;t do itnow.=C2=A0 You&#39;ll just need to set CC etc when calling make, =
trivially done with EXTRA_OEMAKE.</div><div class=3D"gmail_extra"><br></div=
><div class=3D"gmail_extra">In fact this is even in the documentation:=C2=
=A0<a href=3D"http://www.yoctoproject.org/docs/2.2.1/dev-manual/dev-manual.=
html#new-recipe-makefile-based-package">http://www.yoctoproject.org/docs/2.=
2.1/dev-manual/dev-manual.html#new-recipe-makefile-based-package</a></div><=
div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></=
div></div>

--94eb2c06093cc17703054b3e4138--
