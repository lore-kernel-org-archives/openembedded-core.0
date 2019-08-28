Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9A2587ECB9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 07:55:49 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id y16so1265287vsc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 00:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xcElhZob33p5nCOd4MiKzgivXUsi/qLLQ2xooC+GwxQ=;
	b=VuKYiY60GrxDqA8jVY0Rb4N+Kncr9u8EMHbwT/0RK6cwVB0/TD8QH2/ck0rXn7ONi1
	xosiwKNeJxIGqWTJa/vBBBz7lcxwAYGssTariV83myk+l9azV0D8DEdEXYcze59n0UmF
	kzvwEwEtV1blD0ifvmZwOMhvxbkGhMSrNgdPVX/l8zdGS/utzhyP8xgt4ziPRmdKyq7q
	WnDd8li7bU1eY8R3/Q0XYC2F/SNeLcgBXoGcYiSkh2SteKqbJcPFVp3Ury6oeDJG7gfm
	CZsQFVB6HvwyNgChdS+4DXRoziTEii01hQ+R96BVI+H0tfc9N4aCNmoDHfeUGzsmxCmp
	yhEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xcElhZob33p5nCOd4MiKzgivXUsi/qLLQ2xooC+GwxQ=;
	b=NWd4QasNyzoBCQ/NwZ7GRhgwuQoKlj508ITOiiBZBFvYUOm/uxMCHHB/DGWf3qzpDq
	fQn77lIhthYvgX/r99O9G4hwMeZl9+c6AiDtZPNqzA+Q5d46MmcghL1yeWlwIspvcxYC
	XDgsnLWV5WQlfRnOWbntHIpr4yD3z6swylkVDedOd1QKoPnvRSJ+SiXlekLQY3fDJI3K
	g3xfcO/Ykr5ZTWhdoKoDdjMmJy7sjf3OLixd2QrztAPXhsqyo3zScu/jO5mmOqD4ESBO
	9gAHTATB7z6B1ME1uvNN7RwdVne4jbE1vtMh7AA6oRZZsKiqnPOjfGAfU53jfZhwM3BF
	2nTw==
X-Gm-Message-State: APjAAAVWDr3UB5/DMPZlUE+JypA45rDtD1ThYnPj0vrsw5V7cldqVpVL
	HSiKmX+zeISILKKsH1QjACeb3eLa6548qhufpUuBOg==
X-Google-Smtp-Source: APXvYqxEsJGzLnPu8ZzHL23epfG/zlGDtxMNHowP5Sqtdya6V8vxUXc0fWEx6ZCOtqdlBrqBiSxGVksD+8NcW2GCSLY=
X-Received: by 2002:a67:62c5:: with SMTP id w188mr1597112vsb.25.1566978950472; 
	Wed, 28 Aug 2019 00:55:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190828054629.6735-1-shohei.maruyama@cybertrust.co.jp>
	<20190828054629.6735-2-shohei.maruyama@cybertrust.co.jp>
In-Reply-To: <20190828054629.6735-2-shohei.maruyama@cybertrust.co.jp>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 28 Aug 2019 09:55:38 +0200
Message-ID: <CANNYZj_ceHF7bYCDpZE+FzG7fO6LXwQzfrWDBZ3s=2XOerxgVw@mail.gmail.com>
To: shohei.maruyama@cybertrust.co.jp
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/2] runqemu: Fix guest has not initialized error
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
X-List-Received-Date: Wed, 28 Aug 2019 07:55:49 -0000
Content-Type: multipart/alternative; boundary="000000000000b6a8d7059128b78a"

--000000000000b6a8d7059128b78a
Content-Type: text/plain; charset="UTF-8"

On Wed, 28 Aug 2019 at 07:46, <shohei.maruyama@cybertrust.co.jp> wrote:

> By default qemu use -device VGA,edid=on but in some case cannot use
> display because of it.
> +            elif arg == 'gtk':
> +                self.qemu_opt_script += ' -device virtio-gpu-pci'
>

This also needs:
a)  '-display gtk, gl=off' should be added explicitly - it is the default
now, but may not be in future qemu versions;
b) the option should be named 'gtk-virtio', as it is important which
emulated video card it is using;
c) the option should be documented at the beginning of runqemu script;
d) like in the previous patch, please first look into why '-vga virtio'
does not work for you;
e) also, if you can, please get to the reason why standard vga does not
work either. It should be working on all qemu variants.

Thanks,
Alex

--000000000000b6a8d7059128b78a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 28 Aug 2019 at 07:46, &lt;<a href=
=3D"mailto:shohei.maruyama@cybertrust.co.jp">shohei.maruyama@cybertrust.co.=
jp</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">By default qemu use -device VGA,edid=3Don but =
in some case cannot use<br>
display because of it.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif arg =3D=3D &#39;gtk&#39;:<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.qemu_opt_scri=
pt +=3D &#39; -device virtio-gpu-pci&#39;<br></blockquote><div><br></div>Th=
is also needs:</div><div class=3D"gmail_quote">a)=C2=A0 &#39;-display gtk, =
gl=3Doff&#39; should be added explicitly - it is the default now, but may n=
ot be in future qemu versions;</div><div class=3D"gmail_quote">b) the optio=
n should be named &#39;gtk-virtio&#39;, as it is important which emulated v=
ideo card it is using;</div><div class=3D"gmail_quote">c) the option should=
 be documented at the beginning of runqemu script;</div><div class=3D"gmail=
_quote">d) like in the previous patch, please first look into why &#39;-vga=
 virtio&#39; does not work for you;</div><div class=3D"gmail_quote">e) also=
, if you can, please get to the reason why standard vga does not work eithe=
r. It should be working on all qemu variants.<br></div><div class=3D"gmail_=
quote"><br></div><div class=3D"gmail_quote">Thanks,<br></div><div class=3D"=
gmail_quote">Alex<br></div></div>

--000000000000b6a8d7059128b78a--
