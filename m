Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F419EC54E67
	for <webhook@archiver.kernel.org>; Sat, 23 Mar 2024 17:27:59 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.13495.1711214873854261735
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Mar 2024 10:27:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YHbPgvlr;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2d4515ec3aaso24707101fa.1
        for <openembedded-core@lists.openembedded.org>; Sat, 23 Mar 2024 10:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711214872; x=1711819672; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+oNs0boi7xTB5t0dhFo5MIcitFruK8RQFzjCV5HZFjw=;
        b=YHbPgvlrY2LYDlqAVUnMFpQztoiref+jejXDXIkpIO871L1vYB2xdvA9ze9bLncSsv
         lZ8Yq32NxnJySiMioEgZ4FdqOYe4hyei8/ooipkKGvzhCZRvJbThCOt2EUEHKG1JJ8g8
         g9x0KVCS1iEVMYWfIvdqbab7T2sNfWuowTCTcROvnozrl2GdTXN815q6Owe44FHw4PWT
         HRQDt36qEeAo4OnrzXceLr1PiVO/Z3CKtRMgV9Anp1CYGwsc5LWt0JjFPEt0Qc9UZSWu
         gJmyIZyLVI2N0hboSRiJk60U2lbWkjKmpXSOgs1wkpBEwZkYsoXzpX9nRuS3ywjkiohl
         JFzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711214872; x=1711819672;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+oNs0boi7xTB5t0dhFo5MIcitFruK8RQFzjCV5HZFjw=;
        b=dEKS83A3T0l/hLuprAbPId3eozZYZZd/m8AgCIW3xTkDYyjzrHis2OMityyxt4chI9
         BJ4URxV9MyOytNFIFHHh4ayEwn62eAphIb9neoZNVEWmWvZNoH1AE3JTzyv5my5NOOds
         bqoGgeBBVmYSqQ0HCxBU5zzkhsbQiFG34I0gAO+5Cb/E4cp9crNIMiVJY3/xbH4FB5KY
         9Y2YIp0nt/1j9WnoBWD8MotjaTxrjh/jxVpKCH58F5PK96t5UcDon3ADy6JOr/ksqpJa
         MA6EB32BOtUDJaJFl9gw6EMDp2E2dP4fXcvSqp5tFQ03BQsNk/bIfw/O46qfh+pb35Gm
         KVvQ==
X-Gm-Message-State: AOJu0YwlM6DzcSSXumQfDGyytj/9F9w87EoRw2/jCUmbwO9oDKjQ2me1
	hEZS3LGXvWH9BTRkRwWbdI45J7gOA5GS7+lX47A5MjG+Fj4euTH0B6q/3dVGOnbkamkP6h25S6M
	aRYs7ux1WoCOe6sxRtjdFLF5+ek8=
X-Google-Smtp-Source: AGHT+IFiC/ui4Md/z3DXdt4Q1h8bXYszpX77mzg4m7pGiTOLXUxFGpP82pE0BpfnIRG8fSu8rkTjrJEYznrbQSPzGVQ=
X-Received: by 2002:a2e:a789:0:b0:2d6:cb9e:1843 with SMTP id
 c9-20020a2ea789000000b002d6cb9e1843mr253064ljf.20.1711214871262; Sat, 23 Mar
 2024 10:27:51 -0700 (PDT)
MIME-Version: 1.0
References: <28d65e80-cba-d930-736a-c55c3b9dc8d@crashcourse.ca>
In-Reply-To: <28d65e80-cba-d930-736a-c55c3b9dc8d@crashcourse.ca>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 23 Mar 2024 18:27:40 +0100
Message-ID: <CANNYZj_U7AXtWd88nqvzr9ABvw2qZWZ5sL1ypXkCA+2faG1RQg@mail.gmail.com>
Subject: Re: [OE-core] is there any reason to use .ipk packaging if devs are
 using ubuntu?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000008940560614574259"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Mar 2024 17:27:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197460

--0000000000008940560614574259
Content-Type: text/plain; charset="UTF-8"

Packaging format of the host distribution and packaging format used by
yocto have no relation even if there is package management on real targets.
Why is there an assumption that matching them is going to help something?

If anything, making them match might prompt misguided attempts to install
Ubuntu packages in yocto systems and frustration at not being able to make
it work.

Alex

On Sat 23. Mar 2024 at 18.04, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>
>   yet another sophomoric question but i have inherited (and am
> babysitting) a fairly extensive OE/YP build system that, for the most
> part, works but i noticed early on that it selects ipk for the package
> format.
>
>   now, given that there is no package management installed in the
> images, i guess it really makes no difference what the package format
> is, but it just seems unnatural to use ipk given that the
> corp-approved linux development system is ubuntu.
>
>   is there any compelling argument for this? i suspect i could change
> the packaging format and the developers would not even notice.
>
> rday
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197458):
> https://lists.openembedded.org/g/openembedded-core/message/197458
> Mute This Topic: https://lists.openembedded.org/mt/105106419/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000008940560614574259
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Packaging format of the host distribution and packaging f=
ormat used by yocto have no relation even if there is package management on=
 real targets. Why is there an assumption that matching them is going to he=
lp something?</div><div dir=3D"auto"><br></div><div dir=3D"auto">If anythin=
g, making them match might prompt misguided attempts to install Ubuntu pack=
ages in yocto systems and frustration at not being able to make it work.</d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat 23. Mar 20=
24 at 18.04, Robert P. J. Day &lt;<a href=3D"mailto:rpjday@crashcourse.ca">=
rpjday@crashcourse.ca</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-st=
yle:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"><br>
=C2=A0 yet another sophomoric question but i have inherited (and am<br>
babysitting) a fairly extensive OE/YP build system that, for the most<br>
part, works but i noticed early on that it selects ipk for the package<br>
format.<br>
<br>
=C2=A0 now, given that there is no package management installed in the<br>
images, i guess it really makes no difference what the package format<br>
is, but it just seems unnatural to use ipk given that the<br>
corp-approved linux development system is ubuntu.<br>
<br>
=C2=A0 is there any compelling argument for this? i suspect i could change<=
br>
the packaging format and the developers would not even notice.<br>
<br>
rday<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#197458): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/197458" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/197458</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105106419/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/105106419/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000008940560614574259--

