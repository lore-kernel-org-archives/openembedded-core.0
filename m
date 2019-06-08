Return-Path: <ticotimo@gmail.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2E8697E550
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Jun 2019 00:49:00 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id j204so5462595ite.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Jun 2019 17:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dszb2zOjpGgCWvGdw2PagoqZmF3twd6KaZ3UV7otNUI=;
	b=W00gBcfQwTd6W1yLwHHyutmRFRYvZLUHWPiW284f3HNrl/mgvTuR6koL6n+L00Gqtz
	ggL71Z86+zhXqd3o+RrkkKefhaFm1FYG+41roF4J74Jd3sQxBIlf2BZPR7S3S6Inm/TK
	/Wke9118nbk2pg3i6+n2ae8u9IOg4spIBPM96XNFDFmsS5OC97kxTb+hucu+kKM8z9fo
	AUsywmzqcJN/7g4TmhxwetzuUZBxUEhehx5Sd1DoqhxQ2k+u7574X5lNgGfojFNu6btq
	6ngxrSbmJDsM2nP9aUyq3p0x2gtz6wlFJprOlRWgbuEj1r/APbh1r7dLV+rf2jswTvWW
	YvKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dszb2zOjpGgCWvGdw2PagoqZmF3twd6KaZ3UV7otNUI=;
	b=m7PRAZu2iwiT2H4fRNNKC0QTrU8TM9Fy2jB+B2bker3ctuFzQ2vMw87CoXisZVTh3D
	Knowii1o6+pIfjZmr/P806zKUXV7So3FHtwXXTaVWzyu7r1Fp/lDaK43yZWsFJa/U9Xl
	W6ggT9l2HbtGppkBDZuIEcW9YfWTcVK3CmoYMzDnjeP7WPQ06ZArPiGS9A39lazGfNW0
	cngyOLk9OJCPgh8aXSRvfbGrVyCXc/9XhSMk1r1rBBKaU0ZEPmPVh/JhuquHXd09HCVS
	uJLdeBwFfRYz/D/SSujKXUZS2BcQ4GE7FjwX5TT81PkvgtfPrOlzgZPRjDOGyy/hZFrC
	O3OQ==
X-Gm-Message-State: APjAAAV/yipLWKCSRSkYqpHIHKcsHeJCFStFWO1PHuRGu9YZz4wq9p3f
	nomDNWiVkv3Aj/GebjLzUSSodxpGSmliATgQBwB41Q==
X-Google-Smtp-Source: APXvYqxQ44ubIZ24bnLH+geD4+xwQkxkIJOMiH/K1cyb54AUbLClOAmppLASb1beJvHbZnpRKgfNdCjnUymyA2absAk=
X-Received: by 2002:a02:1146:: with SMTP id 67mr37937998jaf.10.1559954942065; 
	Fri, 07 Jun 2019 17:49:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190607110502.31175-1-ross.burton@intel.com>
	<20190607144922.GN10942@bill-the-cat>
In-Reply-To: <20190607144922.GN10942@bill-the-cat>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 7 Jun 2019 17:48:51 -0700
Message-ID: <CANx9H-AJrzHnLPtzP173Tu-eNUMinej_TPC+2XSRGhEyLR3-0g@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wic/filemap: handle FIGETBSZ failing
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
X-List-Received-Date: Sat, 08 Jun 2019 00:49:01 -0000
Content-Type: multipart/alternative; boundary="0000000000002ffeac058ac550a9"

--0000000000002ffeac058ac550a9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 7, 2019 at 7:49 AM Tom Rini <trini@konsulko.com> wrote:

> On Fri, Jun 07, 2019 at 12:05:02PM +0100, Ross Burton wrote:
>
> > Some file systems don't support fetching the block size (notably the
> file system
> > Docker uses for containers), so handle the iotctl() failing and raise t=
he
> > expected error.
> >
> > Signed-off-by: Ross Burton <ross.burton@intel.com>
>
> Reviewed-by: Tom Rini <trini@konsulko.com>
>

Thank you for finding the fix!

Reviewed-by: Tim Orling <timothy.t.orling@linux.intel.com>

=E2=80=94Tim

>
> --
> Tom
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000002ffeac058ac550a9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Jun 7, 2019 at 7:49 AM Tom Rini &lt;<a href=3D"mail=
to:trini@konsulko.com">trini@konsulko.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">On Fri, Jun 07, 2019 at 12:05:02PM +0100, Ross Burton=
 wrote:<br>
<br>
&gt; Some file systems don&#39;t support fetching the block size (notably t=
he file system<br>
&gt; Docker uses for containers), so handle the iotctl() failing and raise =
the<br>
&gt; expected error.<br>
&gt; <br>
&gt; Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com=
" target=3D"_blank">ross.burton@intel.com</a>&gt;<br>
<br>
Reviewed-by: Tom Rini &lt;<a href=3D"mailto:trini@konsulko.com" target=3D"_=
blank">trini@konsulko.com</a>&gt;<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Thank you for fi=
nding the fix!</div><div dir=3D"auto"><br></div><div dir=3D"auto">Reviewed-=
by: Tim Orling &lt;<a href=3D"mailto:timothy.t.orling@linux.intel.com">timo=
thy.t.orling@linux.intel.com</a>&gt;</div><div dir=3D"auto"><br></div><div =
dir=3D"auto">=E2=80=94Tim</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
-- <br>
Tom<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--0000000000002ffeac058ac550a9--
