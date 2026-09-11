Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56E20C88E45
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 14:29:56 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40833.1789136995537923377
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 07:29:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=x0z4AmKI;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47de0093c42so959978f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 07:29:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789136994; cv=none;
        d=google.com; s=arc-20260327;
        b=npG943XFpbPiM3LQeGGR8u0WL3zTRVxuJo8iW7qasz5VN6PqhDNxExniqEmxGmvh8T
         2x24HvYLLS0YTNDEdQv+qFJCoo8dfpCTA4c0uVUGnQe9vn4Rx43pPpnm0ELCgaFzd4dT
         XwrxOV/DMyUZKddVLPotx/gMdIeKoMAx6HZxwntC6qD6krNO91ZyfjMbMR91JEh4qIC0
         6moZDqki7uUIVhxhckXO0IB6T8rduYTj3oH6tnUN/dIH0dUhUbnbHSHSHhWNYjXuzgKr
         5UZGkMnupNu/klygRwM6nLMWoDm5oH/pynilKQufsr6v7LN3aX+20gM4a+Mvpzd5Krzt
         Llig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eNWqjk2x3J/g77mIHnSG41oLZFIxyeAX8N8Rfi7L680=;
        fh=2GiB8L8Ds2LL5OFLTByqVAPQa5/VoBBTxS6+WZX38Qg=;
        b=jT3DFN/uRweKxT1xmKYjTo2/gEcQWp8w8ua+U7ZKYZhxXRu16ERT0RzpXIk0HOH1ud
         DFO7drsnNTij+Dq8Qd0QC+44rgNS6FFRYOfHm1zzbcgiQ6j5K73mY6oqv3wl83TTY9j3
         fPR9cavemDo084Vvp6P36vefqm4Cb1l+lMmGc5fDxHDif9gjuFvGBi0y/LkOSo81OwqH
         XS4GDZrh92oNz4q7h2iayreUyWEMaiyjsAHGMIOmRM6UE2KxSpQPLW+0TJmsnNANcB1D
         A7900LVYj3ySPi7ooXfGNffgiqv7shfpdSqb0bf+T6/M39i82IUQeuTOlExJr5Yxdo6Z
         QOTQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789136994; x=1789741794; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eNWqjk2x3J/g77mIHnSG41oLZFIxyeAX8N8Rfi7L680=;
        b=x0z4AmKI6+n1dL2D1hFi3SC0MLjidtV9QVPR/mZil49toh5gVbjs8BWIo/Tfvnd3uy
         wC0r5VRvpcgRsq9CesoLVmOi5Ys0UENLtvRNXpiI95+8qDgI9/ERWu3eTWZ2XZ/5NHjo
         eEINeQWargX3blPyll9a2ZaVggbBYU5BRB3SA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789136994; x=1789741794;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eNWqjk2x3J/g77mIHnSG41oLZFIxyeAX8N8Rfi7L680=;
        b=TUvQH5UtCUHV2nY3yqz/8CYMW1Mc8sEXcWO64Jz/6LLVkanSN8eoosjNKD4lwFjOrE
         x+2DeUnmgOFD6J/U1DMyHt1kKS3Mmj5sPHwAk3trQIuIW5njS2C67cbj0jAhTPARfZaQ
         XStOnm5ZmobXkmlKyJzlysX1xrb1k1M2mEOL0x1aWUzA89EEFJrjF6ANMsWTlYQSMdgS
         /lPhTdKzlGULBhhAevkaQYY8S9adQMrdJr8oLnQIJK4B8UMmrinHbYMRuzBuVhnJEMDZ
         Z3tTdEGNmX8jJiVtagU/ou4eC98EZpk6eotPbhFXw7zYvWdK2Kax2A/4zzAf6pL94c5i
         Aefg==
X-Gm-Message-State: AFuF++lfj7KfWvnEZh+uUZVPE29AYWooUhhmAlRMrnKFgqrubxASwnr9
	Mj1EMfHIU3NPrEqL9oezlT9rm1WaF1RuiLe5dnzeE02Ls0/8xs8iT3aaDI64bH/BDO98Tewh8Sk
	oCdl0jawgGDnUO5+vrSbNz3fa8riPL4f+LhhGxpzmGoTP8WDYE/ww
X-Gm-Gg: AYBFou0TzSMuIe9i0jsfC/CpVRR5I4hoCla6rSCC2gYfH6+UQCRCBBk3YY1pOqoDLGq
	Eh5mVufnCOOKqdTziY7UTa5VzRQlRrcVb5nntDs9KyMBgeAPVqmYr2AIMOUEAavYQw74nUgOOkF
	KOTvxEQBak4uGaqwNTOo9O344X+Lou4jD1lkpMLrbloCHt5gbilfDAqX4p4P2slATLSJ9Tqa/Qy
	rxBJyxXOsF8wNMskBPqp1xBK77N1B0QgRZDUoqrm9NaPi2fawTWsz2W4yRQ66430p9ik7Jc63pS
	080EF6slCMgPdhCpzLqOmwZ+FYkEm6UgDz9/jZrxyazo9hHwUdDNkNgXpdxVhU/deb9YIjczcqH
	fcg==
X-Received: by 2002:a05:6000:2005:b0:486:f4dc:7ffc with SMTP id
 ffacd0b85a97d-486f4dc80c9mr20146f8f.17.1789136993394; Fri, 11 Sep 2026
 07:29:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260910200329.842463-1-sdoshi@mvista.com> <DLCIC1493YTD.2KR894JSU7SKE@smile.fr>
 <308852.1789133041123096150@lists.openembedded.org>
In-Reply-To: <308852.1789133041123096150@lists.openembedded.org>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 11 Sep 2026 16:29:40 +0200
X-Gm-Features: AcwNN1XeCwpZ6EWRHRB1nSHbCtjLf-yeaIxiIV51-owXTuUVPGdrHOL83X7FrCE
Message-ID: <CAMSfU+7VRnqq7Tkjb1U0emGyND2vNEc6MEO5d4ObVyHDu7B-zg@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH 1/6] libxml2: Security Fix for CVE-2026-86137
To: Siddharth Doshi <sdoshi@mvista.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f237e5065b35ea32"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 14:29:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245656

--000000000000f237e5065b35ea32
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 11 sept. 2026, 15:24, Siddharth Doshi via lists.openembedded.org
<sdoshi=3Dmvista.com@lists.openembedded.org> a =C3=A9crit :

> Hello Yoann,
>
> Richard sent a patch to master for libxml2--> libxml2: upgrade 2.15.3 ->
> 2.15.4 which fixes these CVE's
> (ref: https://lists.openembedded.org/g/openembedded-core/message/245203)
>
> The same patch sent by Richard is applicable to wrynose too and
> considering that i didn't send a patch to version upgrade libxml2 for
> wrynose.
> However, if you still feel i should send the same thing for wrynose, i
> would do it.
>
> Could you let me know i should proceed for it according to you ?
>


In general, I'd like a backport, please (it's way easier to track & manage)

In this particular case, have you checked that the upgrade is ok for stable
inclusion? I also seem to remember a recent libxml2 upgrade breaking
systemd. Is it this one?

Regards,
--=20
Yoann Congal

--000000000000f237e5065b35ea32
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto"><br></div><br><div class=3D"gmail_quote=
 gmail_quote_container" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">=
Le ven. 11 sept. 2026, 15:24, Siddharth Doshi via <a href=3D"http://lists.o=
penembedded.org">lists.openembedded.org</a> &lt;sdoshi=3D<a href=3D"mailto:=
mvista.com@lists.openembedded.org">mvista.com@lists.openembedded.org</a>&gt=
; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><div>Hello Yoann,<br><br>Richard sent a patch to master for libxml2--=
&gt; libxml2: upgrade 2.15.3 -&gt; 2.15.4 which fixes these CVE&#39;s<br>(r=
ef: <a href=3D"https://lists.openembedded.org/g/openembedded-core/message/2=
45203" rel=3D"noopener noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/g/openembedded-core/message/245203</a>)<br><br>The same patch sent=
 by Richard is applicable to wrynose too and considering that i didn&#39;t =
send a patch to version upgrade libxml2 for wrynose.<br>However, if you sti=
ll feel i should send the same thing for wrynose, i would do it.<br><br>Cou=
ld you let me know i should proceed for it according to you ?<br></div></bl=
ockquote></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">In general, I&#39;d like a backport, please (it&#39;s way eas=
ier to track &amp; manage)</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">In this particular case, have you checked that the upgrade is ok for sta=
ble inclusion? I also seem to remember a recent libxml2 upgrade breaking sy=
stemd. Is it this one?</div><div dir=3D"auto"><br></div><div dir=3D"auto">R=
egards,</div><div dir=3D"auto">--=C2=A0</div><div dir=3D"auto">Yoann Congal=
</div></div>

--000000000000f237e5065b35ea32--

