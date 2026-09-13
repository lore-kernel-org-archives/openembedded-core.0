Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F9D8C88E66
	for <webhook@archiver.kernel.org>; Sun, 13 Sep 2026 14:23:19 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25630.1789309392122211992
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2026 07:23:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=cE3d3Sz7;
 spf=pass (domain: smile.fr, ip: 74.125.225.76, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485933b2522so1072766f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2026 07:23:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789309390; cv=none;
        d=google.com; s=arc-20260327;
        b=GJ5/IE/B6CvV0mwtxpKCoRTXjYBKSkIntrfP+fy1ITio1vvsliMfjufrDNJdvShwMM
         yYJrPMmwvrfLgTRiXtiLx4ScJXBZhnCNgDt4IVS4YCqhSJc0EOcr1gF3Ahg9/MtF8TyZ
         XXFph6ghn/RfovX8Zw/xqM25tX4cT8KlOen/SregYIN91mgjrMAFwqz1Cq/fz6bRdDXB
         4k3G8gjg0cYbf+zrRQqugyEF4yoNySOwPob1jnS+5hkEkKArDB4hdXpSqofHVK0/bzEL
         nv4Kqle07moo1v3Q9xHH7673bohEqrC9j1h3evaO7wB4PQvi25YSWj12smQsC7xAmjA8
         i2Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+8kp2P1vhFHAWmWH0q+4Zkl2nnk9o4Fr7kBrVfcJtno=;
        fh=6yK+pdLSbMffDp9TkgbXbwHUjQylhLGvM2uEL0py9B4=;
        b=W7RTfxJT2iM9xpXOh6kstXIxqBFyU4mCDhR3Jp+iFxqcsdL47PrkYBdyo041XFTMgA
         ljdxrGGJ+EuyGKJHJDnguprE03DIZfqYp9W8Lc29VO2IoKHQeDZMv7CwYja2R2TKRhH/
         bd5/9BAId8pAHo3F9E8CednWTI9nm6a8d7pH59wy2EWnpn5vW06B/Bn+W2475uaVAbev
         DwLIEQvzbfaHa9AeICOjpSSkpT6zwkXnbY0yQZ1pVNLcNavirscr1ebLlF//gYIoXjYj
         Lh0GgTetTZAr5By7EdIH2n6MUI2TYSPlS4/6RysRg9SpyPHwj5+PaFAkbDt2T2oECqls
         doUw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789309390; x=1789914190; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+8kp2P1vhFHAWmWH0q+4Zkl2nnk9o4Fr7kBrVfcJtno=;
        b=cE3d3Sz7y2g0PuF5YBtGNq8am76nVYs/zvJFDbp+h/5sLSGzSch6HJFi7UryEhUMxg
         Wahx36Umpphus4ymU4pyeZ0ffJGYaNBCaIq2BMKetHUMchZpdnZ+kxg5+C080GeZJmrM
         Lwsy1rhvJX22SwwI1TnjQPLeHU37wUCMPM70c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789309390; x=1789914190;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+8kp2P1vhFHAWmWH0q+4Zkl2nnk9o4Fr7kBrVfcJtno=;
        b=reflGmuT12pV5RWVdGYzehDuyBiDksLhaGhZwhwBbTtxY1tPmXr76Fy+tD6SOGmN+J
         Mq1vjEVb7fwvXgdQWuaXFvpFyZACr4JXuHLbu2IJzbeUwTRwdcvMjB3VDYLtP9kMhL86
         Z1VTjnnh5drHIBqZQcB2bCQCtFFyaKUs9ZpIlEMIaxtqoSLaTApSPJ4geuCiJhJb3YfE
         d+Ma7Q0U794TTvAuI1vWzz+G3+ecdi0GjcUNwpPs+z9pTOukhL8FON1AXNxzsSY/BZG2
         XcL7yISV9UCZDuZxgtQ0J//qBU7J9L1vLrWqRw+ou+4Q0urfwHlJT/0sE2V3qixxA7t0
         ztIg==
X-Gm-Message-State: AFuF++lEhUxaMxn+lGwHByDvB12nP3RpdBWkFyLh0+Toe1qSyRCdSQM9
	6u+i5oc2p7kJ99DVv8Xv1JyYCiYebXoE8THRC3i3DBwjHOyh1pBIpdn/yxbwJLa1xxilQfAVgLT
	LPN0cfcy3YgXPg0dgDX8w50/PhZFqskYWx4aIep1trw==
X-Gm-Gg: AYBFou0L9rSbWTw19VxkScdwZsc/AqQwqXuaDXdcj8MYifykbgqtAsLOGsDRTz0l80n
	MuUPL9dkEWXP1nOakSk/vkTy9m/UX3JufgspHJpawi9vZbh63rCZUB31oS0JE2z75zLL/o8OhWu
	2Dix34+vr3t01gsYbNAfVtLVClSPPm5e+WQidqPbeuKw+5oGDOxr9XI5U3kO/lVF5pl+Rph8NAy
	Ojr+bOTH9wFylQrKRb5bhayPVVP58cHlQnRRvXRzeVSP38OilHqYMEVLKy/ZUMjC2de4KDdyWX2
	aqhw1GEv/V6XJOnhtdZOuA5T8QNl9VA+3PPGd2jZkWVwYay2u45HqQ7I
X-Received: by 2002:a05:6000:1885:b0:486:f770:9e87 with SMTP id
 ffacd0b85a97d-486f7709f02mr13142343f8f.5.1789309390117; Sun, 13 Sep 2026
 07:23:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1789163914.git.yoann.congal@smile.fr> <CADySD0GdXN1DPdYv0oy-rZ0r-EB7RoU8waJOAD4jrG-t1tEgmg@mail.gmail.com>
In-Reply-To: <CADySD0GdXN1DPdYv0oy-rZ0r-EB7RoU8waJOAD4jrG-t1tEgmg@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Sun, 13 Sep 2026 16:22:59 +0200
X-Gm-Features: AcwNN1XG89uV2IYRykJRHznDRSzduxvzAXEQeUh1II0wiqDamoVcwjcnzqPEv_8
Message-ID: <CAMSfU+4k9CX9QfCFWrRegM8Hn9GdFWyiMNSCw2AMnnUryts5Ow@mail.gmail.com>
Subject: Re: [OE-core][scarthgap 00/13] Patch review
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000009773f0065b5e0e3d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2026 14:23:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245714

--0000000000009773f0065b5e0e3d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le dim. 13 sept. 2026, 02:12, Ankur Tyagi <ankur.tyagi85@gmail.com> a
=C3=A9crit :

> Hello Yoann,
>
> Any reason why the following were not included?
>
> https://lists.openembedded.org/g/openembedded-core/message/245310
> https://lists.openembedded.org/g/openembedded-core/message/245311


Hello,

Yes, the reason being that I need to merge those to wrynose first.

These should go in the next review cycle (this week).

Thanks!

>

--0000000000009773f0065b5e0e3d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote gmail_quote_container"><di=
v dir=3D"ltr" class=3D"gmail_attr">Le dim. 13 sept. 2026, 02:12, Ankur Tyag=
i &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com">ankur.tyagi85@gmail.com</a=
>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Hello Yoann,<br>
<br>
Any reason why the following were not included?<br>
<br>
<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/24531=
0" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openembedd=
ed.org/g/openembedded-core/message/245310</a><br>
<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/24531=
1" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openembedd=
ed.org/g/openembedded-core/message/245311</a></blockquote></div></div><div =
dir=3D"auto"><br></div><div dir=3D"auto">Hello,</div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">Yes, the reason being that I need to merge those to=
 wrynose first.</div><div dir=3D"auto"><br></div><div dir=3D"auto">These sh=
ould go in the next review cycle (this week).</div><div dir=3D"auto"><br></=
div><div dir=3D"auto">Thanks!</div><div dir=3D"auto"><div class=3D"gmail_qu=
ote gmail_quote_container"><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
</blockquote></div></div></div>

--0000000000009773f0065b5e0e3d--

