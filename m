Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33F5ECF2573
	for <webhook@archiver.kernel.org>; Sat, 12 Oct 2024 18:33:31 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.16454.1728758008004573260
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Oct 2024 11:33:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j63NMpkH;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: ticotimo@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5399041167cso4429965e87.0
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Oct 2024 11:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728758006; x=1729362806; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0b4u2VDBuxQCh09sL8ABlM13icS6fAJAQwauT8FDRqk=;
        b=j63NMpkHAARx6APlWPRU3rHly/rDko5hMzrJDJTueUZ0uDqsb2/nBAyP/LaGVsi5te
         oh/tKtNlzPP64O+kuxMESS+Z5YbDDHy9H1gQx9Y7i2ZLMsXLf0KM13XBz3occHD9NOba
         4lpS9euvN8HmB6pqObBSZgVoDn4Z39vj52IIYU1sKZDdzgxEVAXQnqYfnUzJbJe8FD2B
         3WuLPyDCsnk9PZR+E6e9sJhLS3Xul7aPaxdY2ursnW0CRzJkl8xu1PlKhA97uC5ZvrKU
         J1VvcKWUy0i5+EY2KTcTazXeQbHrOByXs5JUQBcGA3QYvJtDYyOlB0UgUzD3hJyW7aPo
         GL9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728758006; x=1729362806;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0b4u2VDBuxQCh09sL8ABlM13icS6fAJAQwauT8FDRqk=;
        b=sWM7dyobqyimI3n1EkuDcWUxI9ZmUrvoE0QcdxolwnGt44fQLbW9ak1yJ8aeqX9Zie
         MNhsrvBQ9goQmVFSkrbaodEYrZQHWgaLyrPUif5xpzcaJpNNMTh0MLAxI30dgCuNsAEy
         XEIU87na5Rw5SLAj5CMHRb4Kl/27UWUUYO7bKqSHy9la50f4jIZQFac9ek12zCI1tBTr
         A/0tSkOt7JeLX+kkyzoQ8u0jdZYdSs5bB6gjttiyXI5jXM4Qj1o6vacY11R5c8RAi6B8
         A47ht1FeQMd9EyDxqkUYUg+VG3mtzGXp09jeiXR98hg+Qwlw11RWeoNNJoZsscSvNdJs
         0Cdw==
X-Forwarded-Encrypted: i=1; AJvYcCW5fXAoVHPhy3MUoBtMYD2Yu5hgl9WRNnNOresCVQwGD7VN/I3+FBZauXJFyU+kUsTaDhehNMc/oj9l3FkLSAnB7A==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx9RNOFxJa3G56P3eWY7cfNA9qwbkhrGF9IcqLnBLMAkzS7zZBL
	PVRDSNZ5xN005JNqHy7sEPW2fjWFrhGisTvTKIziYY7UN8llnenG5zMGDd9i2WAmt40TAOBJRqd
	K+ccl0j+JgDqOUmACp5rfdhjgirtmaw==
X-Google-Smtp-Source: AGHT+IH7Bc+ZOZLkMXfw5x0eoD5TxBwNh5o/QICVQzp4JWcd2ge0fRYxBS2CFZA+IXvLcFcTystndBA9pFkoCmig2Qo=
X-Received: by 2002:a05:6512:2398:b0:536:741a:6bc5 with SMTP id
 2adb3069b0e04-539e54d6122mr1774163e87.12.1728758005814; Sat, 12 Oct 2024
 11:33:25 -0700 (PDT)
MIME-Version: 1.0
References: <20241010205033.159589-2-t.f.g.geelen@gmail.com>
 <CANNYZj-NujKn-r+j_KgGs4PRCAxUY5Z1v=gU_hx8fg1hBa+KSw@mail.gmail.com>
 <CAJo0Az5a=-diCyNyAC14Ef6JTS4auzcSO2NQnaiYG1k3WpCw0g@mail.gmail.com>
 <CANNYZj_w+Ba7mhS4Jd=LaiVPZse0+pqGL3KSFN1uyHXTmuEkRg@mail.gmail.com>
 <CANx9H-CksfTYqbSbiirRT0cWeDy9sOPJgrA_s66Oj52d6Q44Yw@mail.gmail.com>
 <CAJo0Az5_R1agVfYbNhZMCKaKrjg1d8fXfe45Z8N8-9zUFzjupQ@mail.gmail.com> <CANNYZj-pX9kQ6RENEtSrDRZOQnRX2E21PvdsXYHxKbaw+zQ4YQ@mail.gmail.com>
In-Reply-To: <CANNYZj-pX9kQ6RENEtSrDRZOQnRX2E21PvdsXYHxKbaw+zQ4YQ@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Sat, 12 Oct 2024 11:33:14 -0700
Message-ID: <CANx9H-A6McnCtQSaK8VR5x941RwfeDWms5FdV1JYToUjnx-vDA@mail.gmail.com>
Subject: Re: [OE-core] [meta][PATCH v2] python3-cryptography: upgrade 42.0.8
 -> 43.0.1
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Tom Geelen <t.f.g.geelen@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d6dc8006244bd63a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Oct 2024 18:33:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205710

--000000000000d6dc8006244bd63a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 12, 2024 at 1:57=E2=80=AFAM Alexander Kanavin <alex.kanavin@gma=
il.com>
wrote:

> On Sat, 12 Oct 2024 at 00:05, Tom Geelen <t.f.g.geelen@gmail.com> wrote:
>
> > So if I understand correctly you say that the reproducible error is
> > not appearing anymore? That is good news.
>
> It's definitely still there.

Thanks for correcting my optimistic false test.

>
>
> Alex
>

--000000000000d6dc8006244bd63a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Oct 12, 2024 at 1:57=E2=80=AFAM Alexander Kanavin &=
lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bo=
rder-left-color:rgb(204,204,204)">On Sat, 12 Oct 2024 at 00:05, Tom Geelen =
&lt;<a href=3D"mailto:t.f.g.geelen@gmail.com" target=3D"_blank">t.f.g.geele=
n@gmail.com</a>&gt; wrote:<br>
<br>
&gt; So if I understand correctly you say that the reproducible error is<br=
>
&gt; not appearing anymore? That is good news.<br>
<br>
It&#39;s definitely still there.</blockquote><div dir=3D"auto">Thanks for c=
orrecting my optimistic false test.</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:s=
olid;padding-left:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
Alex<br>
</blockquote></div></div>

--000000000000d6dc8006244bd63a--

