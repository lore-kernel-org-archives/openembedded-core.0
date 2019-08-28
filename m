Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
	[209.85.217.67])
	by mail.openembedded.org (Postfix) with ESMTP id EC57B7D58A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 06:54:42 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id 62so1163557vsl.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 23:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=FYZ0R4riObt7o64tNJjhurnxvx5aScr0JPKDEumwk2M=;
	b=qwnEx5JFi7xkOZMDXSBaNyOjDMn47ZFbwnNRfNMOcXOoSx05AjPTnjbPj5pjzFa7fY
	sd9ao/I6jZ73D5QdBunHDmS8QaKXE0ga2EWVnI50sl5FhdH5q+d6i1k3yYfKXr+AFO4Y
	lg5K8/YrUzAay4DFKWiyQBTUd0NorU0n9RXR14/ddW8gnpoBvJtAVaMemLLQQuKJftGM
	eRaKmGPPXgyRk36YOj5C6IOZLuxFlU93cRFJ1CBRDEQovfJ8tOygWbm09Zxrk7NQSxm1
	PQ0GrYkVqw4x+9VSAnfyhspzz5JPJShVpsDYzIdP6NzVC67Awuq6bcbrE35jVuPGVXkg
	aX2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FYZ0R4riObt7o64tNJjhurnxvx5aScr0JPKDEumwk2M=;
	b=Pk6/qVYf9Rmfbq/laKXq35L+kTc6kG9GOR8nDR/3RgdhUzrVxlG1CRtDnadDijS51N
	Z5UYDXalNkkkYKV2SkdWpisxISpgU3pqJe6UAWilaksqdoKCekXr70p0YGZnYq2y/yRW
	ucCxn7/221jEnvQSbUroDBmhHFrJYy1YmxUGJLzb3iH593gzEdcUxhWOCk9FLh+aCYph
	/XaxNktK4xXdawDz1gYb422vb6qyB6DbFyQ7ajcPNC2cLjpBZrVdThVKA1CSFYjZDsKA
	QE+20cdEEmG7Xqmg5baGwOBw1wGgHhsIpaA0dlRPGwnwKdvrdVLQYnZLrCeEBDd82udO
	CGcA==
X-Gm-Message-State: APjAAAVPe8ewe/0476TtqVCK7S0dpOZ5migCaHDxkU+gDOTqoM+Zj3CH
	opSj263nK+b++9LzfAfRyvEhathGNdXQmhASoQOUBg==
X-Google-Smtp-Source: APXvYqx0pODdGv1D3CW7vAssnDbbzw8yXy71uCYDSoXxLRsYZF2mZQPlguhpcPREcKi3Tliza5BQgfzfaNa1fudXo/Y=
X-Received: by 2002:a67:62c5:: with SMTP id w188mr1497590vsb.25.1566975283865; 
	Tue, 27 Aug 2019 23:54:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190828043639.9942-1-shohei.maruyama@cybertrust.co.jp>
In-Reply-To: <20190828043639.9942-1-shohei.maruyama@cybertrust.co.jp>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 28 Aug 2019 08:54:32 +0200
Message-ID: <CANNYZj80wCXerLr-L0zDuG3sShD52snqmG83ySN8cZXXUzT9PQ@mail.gmail.com>
To: shohei.maruyama@cybertrust.co.jp
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] runqemu: Change to use -device virtio-gpu-pci instead of -vga virtio
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
X-List-Received-Date: Wed, 28 Aug 2019 06:54:43 -0000
Content-Type: multipart/alternative; boundary="0000000000002aabee059127dd9b"

--0000000000002aabee059127dd9b
Content-Type: text/plain; charset="UTF-8"

On Wed, 28 Aug 2019 at 06:36, <shohei.maruyama@cybertrust.co.jp> wrote:

> If using qemu-system-aarch64 or qemu-system-arm with the options, an error
> occured as follows:
>
>   qemu-system-aarch64: Virtio VGA not available
>
> this commit fixes the error to use -device virtio-gpu-pci instead of
> -vga virtio.
>

Can you please look into why that error happens on arm, but not on x86?
-vga virtio is the officially documented option, so I would rather use that
everywhere.

Alex

--0000000000002aabee059127dd9b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 28 Aug 2019 at 06:36, &lt;<a href=
=3D"mailto:shohei.maruyama@cybertrust.co.jp">shohei.maruyama@cybertrust.co.=
jp</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">If using qemu-system-aarch64 or qemu-system-ar=
m with the options, an error<br>
occured as follows:<br>
<br>
=C2=A0 qemu-system-aarch64: Virtio VGA not available<br>
<br>
this commit fixes the error to use -device virtio-gpu-pci instead of<br>
-vga virtio.<br></blockquote><div><br></div><div>Can you please look into w=
hy that error happens on arm, but not on x86? -vga virtio is the officially=
 documented option, so I would rather use that everywhere.</div><div><br></=
div><div>Alex<br></div></div></div>

--0000000000002aabee059127dd9b--
