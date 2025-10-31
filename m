Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E469ACCF9FE
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 12:44:49 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.14649.1761914684132774162
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Oct 2025 05:44:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=msgEFFge;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-77f67ba775aso2774562b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 05:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761914683; x=1762519483; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ObihnRkNYXzsTN6VqBPdiueadOsk07MdoWkwQrHJU6M=;
        b=msgEFFgezBALlnchvUW7y6GICFS97NO7VRkbCTVPwW92ThcImDuYhNOiFAxPa+EbMv
         JBWzcf0B8ozH+UQ9jvKcR8sx2Zolq0lv2t1cm+PxPkD/3ZBm+ui5KgoH4SNJysGN3nt1
         sUsoHdd8525Zp+wqExxBw+efgB8+W6u9GI1nHY/BMIvusmt2vgQ+lIYuJZOIVGgpHZA3
         Qcz5ByX1hSYnVYLIxGRpG962PvGtkAa3HEhNd0m05VzFo2bY98rVf5FncPkhC3pu1e4N
         ADQWbekCF5oUbKDMTtiKRPER5FXC5mUyj01Xh2QrXjvl5nmK+wjH3aZ6lHzAodOUb0ax
         +67g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761914683; x=1762519483;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ObihnRkNYXzsTN6VqBPdiueadOsk07MdoWkwQrHJU6M=;
        b=a2MRkpdlAI3R09JNaahupkpWyGnHzGMyBWccTBkTh2rek4eO9NS9e/q0xG52euuWIT
         6Q4k69XYe7WO8qDC4q3fTDZMWdbiYB2sUqUYoCRwg014e3t8i+xpu7PiipuT6LmpFsD6
         hGSsRHyUkJCEuQ6ldFEJ0B5S0coIBeLi9GI4kuq7vMM/10LrQwlHGPdVgyWQT+Uw5xfn
         QWylJjamB5yijP5j7vWyTFzNaILM1YMt0dKdnX2C5Pu6uGQFGgwqlVnxZCIapUyLJbGA
         kErZzgPyYuW23CZ8qw5WL2pQt41sOjqFfIPUF5zB8un4aRSCFcXLNXg3jK9MlI5gMFet
         1QWg==
X-Forwarded-Encrypted: i=1; AJvYcCWXvdp20JdEzibdtrRnSRWl+rYn6uOKr89bSTfMbzcTRx/YJHK4eJDruuGRm2Jp0yD+7ycjRXk5Bo6fS6yASQM+Ig==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwAROQeULOoPsrs8qzkhb5c7SpY5iQlY92SM+QlPyYpxdawHrWU
	8WkiaGBH35g5Qz08HDzR9pacgrKxm+hxYFcR3wWLTfqSLSphVEvQADFssX+nxogZ1ZvVm1LweVE
	RHO+1Ni2UmPvMvzyeZ/YSaHO/m5Ot2XE=
X-Gm-Gg: ASbGncsO2HepFt4IZs+IDygFFWFotUvjQmTvVlfBJqIDtnI5UIUDm7q8EYfGMWtbt1Q
	VYyZUMdsrSJx93URYBTQWM4sFihGuDHl/oSatei6ZPDMkAqKa0di82l3DZn2iTm6hDUWMfR45I/
	zoonItIaT5HIQJDT1Jmd7UNrEq12FiMOf3U6cSa9A7NUqbRubkzVznltM1uWllfXvO5FhGGKr2l
	CHeJQE504PX68QpVywx9ax7bH2DnUL0KJpnt3ErhwR0Tpy91Y2eym2A1wf2ORaOatuLdvYUgAi0
	41XAVlk=
X-Google-Smtp-Source: AGHT+IF/ochmKZoykUa86FQKAySQl0r8B5dgqD6sk/edu4BzFVU/uS90CdnjQab5gDTFb+fGibtwQqyKwZYip8X8AUk=
X-Received: by 2002:a17:903:3850:b0:269:91b2:e9d6 with SMTP id
 d9443c01a7336-2951a538f6fmr45805895ad.46.1761914683274; Fri, 31 Oct 2025
 05:44:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1761844161.git.bruce.ashfield@gmail.com>
 <af06dcbe41bf640a6b3d23301a26b801f0fcd31e.1761844161.git.bruce.ashfield@gmail.com>
 <aQRmiYoqQbjFd00F@nuoska>
In-Reply-To: <aQRmiYoqQbjFd00F@nuoska>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 31 Oct 2025 08:44:31 -0400
X-Gm-Features: AWmQ_blkdVbi9lqf4cfFcHQPvFWB13F_Q4y502OglaKq98Vj3h4ywiigGcvY7O8
Message-ID: <CADkTA4M3ZOK2KJVftt2noo0Ybmb3kv4Ks0LfuUF_MY7y8LuQtw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 12/14] poky: make linux-yocto 6.17 the preferred version
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d2374a064273ba0f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 12:44:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225538

--000000000000d2374a064273ba0f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2025 at 3:34=E2=80=AFAM Mikko Rapeli <mikko.rapeli@linaro.o=
rg>
wrote:

> Hi,
>
> This and the yocto-bsp patches should go to poky@lists.yoctoproject.org
> list.
>

Yes, I know where they go, but I've been sending them as a single series
for years now to save coordination of the lists and make things easier for
review.

Once things move fully to bitbake-setup, I'll return to separate sends.

Bruce



>
> Cheers,
>
> -Mikko
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000d2374a064273ba0f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 31, 2025 at 3:34=
=E2=80=AFAM Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@linaro.org">mik=
ko.rapeli@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Hi,<br>
<br>
This and the yocto-bsp patches should go to <a href=3D"mailto:poky@lists.yo=
ctoproject.org" target=3D"_blank">poky@lists.yoctoproject.org</a><br>
list.<br></blockquote><div><br></div><div><div class=3D"gmail_default" styl=
e=3D"font-size:small">Yes, I know where they go, but I&#39;ve been sending =
them as a single series</div><div class=3D"gmail_default" style=3D"font-siz=
e:small">for years now to save coordination of the lists and make things ea=
sier for</div><div class=3D"gmail_default" style=3D"font-size:small">review=
.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><di=
v class=3D"gmail_default" style=3D"font-size:small">Once things=C2=A0move f=
ully to bitbake-setup, I&#39;ll return to separate sends.</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
-Mikko<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000d2374a064273ba0f--

