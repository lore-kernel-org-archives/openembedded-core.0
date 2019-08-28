Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com
	[209.85.221.169])
	by mail.openembedded.org (Postfix) with ESMTP id 690627ED5C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 06:59:41 +0000 (UTC)
Received: by mail-vk1-f169.google.com with SMTP id b11so391338vkk.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 23:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=IWC27cPpAzaeDxI/2YvLQahw1c2trag5sq8FPjgSL0c=;
	b=CwgULaQIUKlJNSAf4C0dOeeNtYTFNNQkKnbYBmDWmmNgv5wQl5bqBiC1x1yTo/bT82
	Hrvd56c5Xkgdab5a82vfODNl/5uk/n2tG916IJ+euTsBv/Ja3d1gwS3cT1ifQLJlOiEq
	+029W/epbk4nGMIrfBpomqY7IorXWWLp66PV+ofCYq5DtN5ZbsFBv/GVtawRzZi1FM2i
	1oVrPj3xrI7F2ZmyNrk57P5cr7kEhwimY9L5kfeX+lffu2rZGNBkSxcMj1/2dvZ/535W
	a3YHt+B1/Ac4cFmPr5OQ9emXLsmkB/ucGBC8TbfeObkVN3QKVNdBf/eZFYpxzMtA3BWb
	8RQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IWC27cPpAzaeDxI/2YvLQahw1c2trag5sq8FPjgSL0c=;
	b=XuNcoqyYofISr8UjFpoLuQgpPhjltoWk+a0Z1ldhFcF9Mt3NyGScfIr7GwZuHL4p4o
	jaDGYn6A8d0EKvQpgNjoviXQ1xbv2yOgmAwg/DoDqyjFalSdT86PX4WxTGRdzQ6OUqju
	gErkT228Vboa0ClGEE5jo/i0vDQmEvsl9v/LzulPkDvG4HwY5CoQfr7XW+2G1BcOqjTv
	2uRic9Dd8qVa2ffAFwAz7ybsIW1zklLjOMLtENG7X9h66M+/odRf8864Y6gpfwvvAg4G
	k86Ul0AoMBcyxtMGB3iUEyDWb8Dw5innJYKwA2JqTlC39zOf0imif4/0uQLKKeW1qtoR
	rGqA==
X-Gm-Message-State: APjAAAVTNaz+kQoG+9rT83eUCjCft9Se42ebb2XDVCP6cuY6req1BnFP
	k6e7EUtg46DjM9yCJnnHJjeqPI+SXdZPrt1Mkn8=
X-Google-Smtp-Source: APXvYqzgl797+kTuAbzHimngvjGgvEda+kemXr75Nghftti1xDa03P6L2uOvQxxDcUQ7myALmghGzhgxZYI7ouHwgbQ=
X-Received: by 2002:a1f:a5d8:: with SMTP id o207mr1447475vke.12.1566975582344; 
	Tue, 27 Aug 2019 23:59:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190828054629.6735-1-shohei.maruyama@cybertrust.co.jp>
	<20190828054629.6735-2-shohei.maruyama@cybertrust.co.jp>
In-Reply-To: <20190828054629.6735-2-shohei.maruyama@cybertrust.co.jp>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 28 Aug 2019 08:59:31 +0200
Message-ID: <CANNYZj9Cp8M2_WYs6_GS+hN=spQ_TQFzAHTJA1c_+54kcdodqQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 28 Aug 2019 06:59:41 -0000
Content-Type: multipart/alternative; boundary="000000000000f519e0059127ee28"

--000000000000f519e0059127ee28
Content-Type: text/plain; charset="UTF-8"

On Wed, 28 Aug 2019 at 07:46, <shohei.maruyama@cybertrust.co.jp> wrote:

> By default qemu use -device VGA,edid=on but in some case cannot use
> display because of it.
> +            elif arg == 'gtk':
> +                self.qemu_opt_script += ' -device virtio-gpu-pci'
>

We would prefer to use standard vga, and enable virtio only for virgl
usage. Can you please look into what the issue is here?

Alex

--000000000000f519e0059127ee28
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
pt +=3D &#39; -device virtio-gpu-pci&#39;<br></blockquote><div><br></div><d=
iv>We would prefer to use standard vga, and enable virtio only for virgl us=
age. Can you please look into what the issue is here?</div><div><br></div><=
div>Alex<br></div></div></div>

--000000000000f519e0059127ee28--
