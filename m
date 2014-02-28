Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id E8E196EF8D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 21:34:16 +0000 (UTC)
Received: by mail-la0-f51.google.com with SMTP id pv20so2344719lab.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 13:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=GFSPaR2QWn8pyOJ9dEUAM7mLhZGGru5t09xMK5d129Y=;
	b=XueOxR8lJK/g+IsEBNgFap/X9H/V1ydxbyADh8OFad0YYflTJaMMFrlV73Fa+1Xm0W
	QlXY0AmEFycqTrYsNVCdBL/ZmOcvnPEYHKm3L4S/g6+EL/BvgSH4kUck1fpV/KaBwVhw
	ISL5oxfFgFIeva4dio9IKMEp67czrFbCvNMCF795Ruu6HzIV3HPD6GaMyDcCpw09FQrK
	XoVw3xkE7nnPPsO2kF+7zP6UKv93hsWxZLHwO4K8ZWnPdQo8ov4ZSwQBJ52MWFlQa35L
	okqUfHw+IbmyIrJ60aVGX3rMtP46L2C9dpxqdvVxi1eYYoS+mJBN+Upvf4lH8vtb+OUy
	vpDQ==
X-Received: by 10.112.139.232 with SMTP id rb8mr3327716lbb.53.1393623256252;
	Fri, 28 Feb 2014 13:34:16 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.35.200 with HTTP; Fri, 28 Feb 2014 13:33:56 -0800 (PST)
In-Reply-To: <CABcZANnN0QknvdHZBpWDwD1G_fpEByCFxNWZm+VSyRHpf11pgQ@mail.gmail.com>
References: <98dd26f3-a46a-451d-a445-93e8b1862377@VA3EHSMHS040.ehs.local>
	<CABcZANnN0QknvdHZBpWDwD1G_fpEByCFxNWZm+VSyRHpf11pgQ@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 28 Feb 2014 14:33:56 -0700
X-Google-Sender-Auth: S6x0mBjFWgxL8VPbp8pg_3nGHT4
Message-ID: <CABcZANmW-+t+C5qiToMpB92U6ABina=bsJMSNJi6pDB0ZGAY7Q@mail.gmail.com>
To: Nathan Rossi <nathan.rossi@xilinx.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-yocto.bbclass: Force do_diffconfig depends to ${PN}
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
X-List-Received-Date: Fri, 28 Feb 2014 21:34:20 -0000
Content-Type: multipart/alternative; boundary=001a11c3421a23c72e04f37e338c

--001a11c3421a23c72e04f37e338c
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 28, 2014 at 2:26 PM, Chris Larson <clarson@kergoth.com> wrote:

> I'm guessing that the idea was to add a dependency from diffconfig to
> kernel_configme whether or not diffconfig even exists, in order to be
> able to support a use case where kernel-yocto is inherited but cml1 is not,
> but I'd question the validity of such a use case, personally. I think
> either we should consider one of these options:
>
>     1) Programmatically add the dependency with bb.build.addtask based on
> the availability of do_diffconfig
>

https://gist.github.com/kergoth/9280305 shows what this one looks like,
which is the most versatile, but does add additional processing at the end
of parse time, though not much. I think this is probably our best bet as it
still supports the use cases implied by the way kernel-yocto.bbclass and
linux-yocto.inc are structured.


>     2) Use addtask to express the dependency in linux-yocto.inc, where
> do_kernel_configme gets added as a task. Having do_diffconfig depend on
> do_kernel_configme for a recipe that doesn't include linux-yocto.inc would
> result in breakage anyway unless they explicitly addtask do_kernel_configme
> in that recipe.
>

https://gist.github.com/kergoth/9280352 shows this version, which would
mean that anyone using kernel-yocto.bbclass and cml1.bbclass but not
linux-yocto.bbclass wouldn't get the diffconfig -> kernel_configme
dependency set
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c3421a23c72e04f37e338c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Feb 28, 2014 at 2:26 PM, Chris Larson <span dir=3D"ltr">&lt;<a href=
=3D"mailto:clarson@kergoth.com" target=3D"_blank">clarson@kergoth.com</a>&g=
t;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"gmail_extra=
">I&#39;m guessing that the idea was to add a dependency from <span class=
=3D"">diffconfig</span> to kernel_configme whether or not <span class=3D"">=
diffconfig</span> even exists, in order to be able to support a use case wh=
ere kernel-yocto is inherited but cml1 is not, but I&#39;d question the val=
idity of such a use case, personally. I think either we should consider one=
 of these options:<br>


<br>=C2=A0=C2=A0=C2=A0 1) Programmatically add the dependency with bb.build=
.addtask based on the availability of do_diffconfig<br></div></blockquote><=
div><br><a href=3D"https://gist.github.com/kergoth/9280305">https://gist.gi=
thub.com/kergoth/9280305</a> shows what this one looks like, which is the m=
ost versatile, but does add additional processing at the end of parse time,=
 though not much. I think this is probably our best bet as it still support=
s the use cases implied by the way kernel-yocto.bbclass and linux-yocto.inc=
 are structured.<br>

=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D=
"gmail_extra">=C2=A0=C2=A0=C2=A0 2) Use addtask to express the dependency i=
n linux-yocto.inc, where do_kernel_configme gets added as a task. Having do=
_diffconfig depend on do_kernel_configme for a recipe that doesn&#39;t incl=
ude linux-yocto.inc would result in breakage anyway unless they explicitly =
addtask do_kernel_configme in that recipe.</div>

</blockquote></div><br><a href=3D"https://gist.github.com/kergoth/9280352">=
https://gist.github.com/kergoth/9280352</a> shows this version, which would=
 mean that anyone using kernel-yocto.bbclass and cml1.bbclass but not linux=
-yocto.bbclass wouldn&#39;t get the diffconfig -&gt; kernel_configme depend=
ency set<br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics
</div></div>

--001a11c3421a23c72e04f37e338c--
