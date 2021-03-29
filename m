Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web08.1121.1617058845371131232
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Mar 2021 16:00:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kd7B2G9H;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: armccurdy@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id o126so20917555lfa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Mar 2021 16:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ztLS7CVdPdBYS8IL4CbrlYIm08rErkzUJjS3+I48qzQ=;
        b=kd7B2G9H8Mw8EQbCroKoaWWw30Qd7Ejzs+83vGWQvwn0LXrtjP0gEWSaOydtTPDg1B
         qIL5Dm9IaQe0y888TSr56RDzNmZLcwIf5pIjzZiUpVazfY9Y6WEo5HxrcIjLZR+s9aRE
         41PJzWH/thJ7aNgLQp0TkJflix1C87RnVxOqKUvmqqgKrbc+8/MJFfxhVKcZUVCqQVzu
         wy4gionTeJVeR7B9Q8yUVQcdZYVTHT5/GtK61D62GYJ0dgrByReLeiXhnu4yR4pnn3fp
         FqyBooDJBAh9owhcGJg/wmpYRRdb91FU+llZ65OIUYuLcF55/JbVfjXikPLbINqLsUeQ
         Y8NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ztLS7CVdPdBYS8IL4CbrlYIm08rErkzUJjS3+I48qzQ=;
        b=TsHXpYiJegUCL+igWUT+RUUf4jkpmabFi8i57Ceat1A18HLIR5l8rWJ0w5u5thGk60
         oCmGXkptw5xT1wEpTsCgXgtTYPuJBLvGyP+aEXPHTq4gj5Vuh8D6MMcDKkzEW4JFP9fO
         IOhTCtr/fzeBQjOO4VsPRgaW2049BqTuatun3TuQK2qpjbMbzrZ8o2Y4H5mO6VCnA7qu
         4Jbf4jEpzjx6ep7rLY2o3fznBgZScO1IrMw8Rkv9mmnqFXLqn8FNW2F2qsW2tpOgf9Lq
         hmhQijr+DTUt2SNnH/FvMoi12zDiBSYArFhnx2PN9tcpuYJFT9Gk6Ubf8baVo/SwrVjA
         YExA==
X-Gm-Message-State: AOAM533Ais7EAyw7DsMj7uutWjSG08W1eNDT4aXYR/oslgfOMnPiHOfQ
	NhJEhfFpBDxeftuRVkSfWJzoflfCmqn9TsrrjJw=
X-Google-Smtp-Source: ABdhPJzkvUIPJM91es5tNTAmLVbs/ysZICVMDlIUf+gktBHXwxBbQ9sacTuFJZ3HRlOLwJ9d+j52GyJm+zta0aR5MUY=
X-Received: by 2002:a19:6910:: with SMTP id e16mr17675857lfc.482.1617058843288;
 Mon, 29 Mar 2021 16:00:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210329151442.86306-1-devendra.tewari@gmail.com>
 <9e81b71466b771c55d8859e7d156b662e1c3d4f7.camel@linuxfoundation.org> <CBEFAFBB-3A73-41E2-A177-BBE047E615D1@gmail.com>
In-Reply-To: <CBEFAFBB-3A73-41E2-A177-BBE047E615D1@gmail.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Mon, 29 Mar 2021 16:00:31 -0700
Message-ID: <CAJ86T=Xn9tLHWrqqr1ZV9rAwZD7sG6x0QsyVRkUSKLwiGQKL8g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Use shutil.move when os.rename fails
To: Devendra Tewari <devendra.tewari@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 29, 2021 at 3:45 PM Devendra Tewari
<devendra.tewari@gmail.com> wrote:
>
> Thanks! My bad. The example I looked up in Python docs had a break and I =
just realized it was a looping example.
>
> Here=E2=80=99s the updated patch (or should I submit it again via git sen=
d-email?)

It would be better to use shutil.move unconditionally in all cases,
rather than have a separate shutil.move code path which only gets
tested by people doing incremental builds in docker.
