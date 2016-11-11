Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 3AD7E601A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2016 12:22:44 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id n204so16994532qke.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2016 04:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rPLzX8qjBxD+5IXt+PGhyMIO0n6tjAUwe+0UwZ61SuA=;
	b=FTM+ihpz1MWxNNxk5uVv2Tc6T6l7onsYsHaXK5cT8m+fJ1Xzdy8hH3CyMeC6PjzTYA
	kk9WZ7Ohrqqk/uHmYRw/+oFNnswhiUVxfLKAaftwu6sG3nD06BgcN/NAkUcYi8Cr8R9K
	0QauQEyKieidZ+XGKKYbdkRvMXlyiDgv72jp0oKuPV/TAICbRsNeEBCNBCa5bQsrV53a
	OdhoG9q2Q9ntYyBwYKiAUH6cAeVtuhdV3jWZ7fNSHEEa0+i7AteLyjNkLuA+Ag4iungt
	USIXVdz/4dq5pDcvjOc/pmpknpZhLQNRoyVJ1kpmxAxZHJQxjRy4ku6KYM9fTbTM6GW1
	75AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rPLzX8qjBxD+5IXt+PGhyMIO0n6tjAUwe+0UwZ61SuA=;
	b=R5ID/NDCJ4tzIiYcb38aWNGmSKSKckAuZxvwE//ESiCjyhr5tjjFG7DAWayrRDC2Xu
	Stxpej0U5fCoFVtol/K+VkheGZRdUUbtGDbevN3zAtwXRRELERG8ziSkDSOHX+/AoYrr
	9bicgis8lv3405wz2QvbbNF6IbJcFSR0I7hMZAzzTT8kTjEgcCCCpAs3qqYeJZzd5qIX
	JW9Vx7zaTKy5R3gnjV5Xl4bnwLdOT1FOHmVee/w75yYJsF1VEw9efmvgHTFTAucx9Kk6
	0hICbJU9frK5frS1K3Bvc4As966O3JkjNmRvrO7E7+6XObzanXYP/ogrQmAowqGzzcfV
	pv8A==
X-Gm-Message-State: ABUngveMkxBLJk04RQBp/0VkvgQgaXJM9c/2iBlNKnELnanejvsZv1PoeeY4ZTLt1AmCaHK3NhF1Tv9ayv/s7qS2
X-Received: by 10.55.75.17 with SMTP id y17mr2907320qka.26.1478866966277; Fri,
	11 Nov 2016 04:22:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Fri, 11 Nov 2016 04:22:25 -0800 (PST)
In-Reply-To: <1478844138-13407-1-git-send-email-jiajie.hu@intel.com>
References: <1478844138-13407-1-git-send-email-jiajie.hu@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 11 Nov 2016 12:22:25 +0000
Message-ID: <CAJTo0LaUcWr-=YvHBj=u+_yz0HtTS7HYWTAy6ggZjVi435La+Q@mail.gmail.com>
To: Jiajie Hu <jiajie.hu@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] devtool: fix handling of unicode characters from subprocess stdout
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
X-List-Received-Date: Fri, 11 Nov 2016 12:22:45 -0000
Content-Type: multipart/alternative; boundary=001a114a88c832095f0541058c13

--001a114a88c832095f0541058c13
Content-Type: text/plain; charset=UTF-8

On 11 November 2016 at 06:02, Jiajie Hu <jiajie.hu@intel.com> wrote:

> +    reader = codecs.getreader('utf-8')(process.stdout)
>      buf = ''
>      while True:
> -        out = process.stdout.read(1)
> -        out = out.decode('utf-8')
> +        out = reader.read(1, 1)
>

A reader is definitely the right thing here, but I'm wondering why this
needs to loop on single characters.  As I understand it doing a read() on a
reader wrapping stdout will read until it blocks (because the process
hasn't got anything to output) so result in less pointless iterating.

Ross

--001a114a88c832095f0541058c13
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 November 2016 at 06:02, Jiajie Hu <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:jiajie.hu@intel.com" target=3D"_blank">jiajie.hu@intel.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div id=3D":71x" class=3D"a3s =
aXjCH m15852146079dbf74">+=C2=A0 =C2=A0 reader =3D codecs.getreader(&#39;ut=
f-8&#39;)(<wbr>process.stdout)<br>
=C2=A0 =C2=A0 =C2=A0buf =3D &#39;&#39;<br>
=C2=A0 =C2=A0 =C2=A0while True:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 out =3D process.stdout.read(1)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 out =3D out.decode(&#39;utf-8&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 out =3D reader.read(1, 1)</div></blockquote></=
div><br>A reader is definitely the right thing here, but I&#39;m wondering =
why this needs to loop on single characters.=C2=A0 As I understand it doing=
 a read() on a reader wrapping stdout will read until it blocks (because th=
e process hasn&#39;t got anything to output) so result in less pointless it=
erating.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extr=
a">Ross</div></div>

--001a114a88c832095f0541058c13--
