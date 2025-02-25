Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81688C021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 06:50:59 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.2870.1740466251636517702
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Feb 2025 22:50:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UR2rd/sr;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: rybczynska@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-220bfdfb3f4so3848305ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Feb 2025 22:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740466251; x=1741071051; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=P8k2qP5UCrwSg1FfYvi/05YgpW6cfudFwjLeE/6PUvA=;
        b=UR2rd/srggF+NmhWzy58LOrNWcqOFMCm08Sc6N54m2vMcTF3/hE1W2bfnMIKomuLVU
         IpslKC8rdJ4pNFYOKG7rtCjyWu3t/go7rfvA+n5Lo6dZHtr6xrGUPtAbOe+DgzlkvgNB
         LxJtWCMKCrDIoZtnQIXEERELKajw9EQK4CxE7buoGKgztDV2terVY3ToJd5uainU8gSz
         vb2YDIH8L4S3HjMtwQQvcbuRr2w1LXJnZEg1s+TuCxTeS8qkcoJ7r37MJmsI46zL5jyk
         J3srdL2+Gdb9pl2g2i9XOpVqeNRz0OrkGwAn1gdIO2W/kTqZp0k6wC4So29grIcJ6dXU
         44pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740466251; x=1741071051;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P8k2qP5UCrwSg1FfYvi/05YgpW6cfudFwjLeE/6PUvA=;
        b=ucd8rd8IuzvTsfqHiPtQYm60WhrPBBLP5DsQyd1zWD2lI6KlXyRJWK7E+vnlcXquAc
         OWvAFCMawzKS9poECqE+JgoZUHl3Vu7G+3OXCyzFbFY6NnUvUf+8oAQFr820LkY16NDk
         9ZXFXssQLVBYYLog9rwz5o7r0xkIjZjOaNP2kt5ellxHYHhMpVM3XIxyIVhPP1TMBlsa
         g5IWR/g25n4FMAsxtbLuB8RbSAWBiLjMFAoYNiaK/ANmLISNeG9RXyWYALBZ6wl+Ob6U
         6NOiKtmsHv0/6mIrhwZetlw12FZDhFBIwiw2IX3ZHGg772C/t9IGs5K96yW+L4zhD5yX
         mO0A==
X-Gm-Message-State: AOJu0YxoCDRAuVV/FpCNeCQrMLpcsWbQjZrPBq09dcMYPyUomjT5gXvl
	wlAbHl/HeVKlrzA48YObzXNcQhtUoyeNp54Z2jbaKpVpM80S7V4XFDVAItAStDo3b7DxhRdlfX2
	OOBcaxM8bx8qyiqqistxmuR9s6Mz9wA69
X-Gm-Gg: ASbGncvG9SuOG28/tMU3r8txTBShd9YjemuYznczFBnRj88B44biagKLrQtCzhiHp3I
	+mHK/xBf9T+LY0LitkE+BwYos5lM+s4pXUeYyRuA35LqhQTh+FfjyG2sNabOnB2GGZX/DePX4zv
	mKlY0SsoRbioMy/rR3GcCMuHr9lGslxejje5OCj9TC
X-Google-Smtp-Source: AGHT+IGb1YK5dnbonUlC4HMpwtXY5T+OenKWeitfMQoy5CPu50zQ5jiNDM88WuFusTY3e1aViDLEGyeS184xUAET1hY=
X-Received: by 2002:a17:902:ced0:b0:220:e792:8456 with SMTP id
 d9443c01a7336-2219ff311c3mr280006155ad.11.1740466250629; Mon, 24 Feb 2025
 22:50:50 -0800 (PST)
MIME-Version: 1.0
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 25 Feb 2025 07:50:39 +0100
X-Gm-Features: AWEUYZkl2eLDayp0D5nCUhx7smBbKisfp3akwsCuGmZjSuEO62pWcYpv0U5LgfA
Message-ID: <CAApg2=T3C2AaHh8STQedqLDoGB0TG-jOM0GATHeFwe8AgZvAeg@mail.gmail.com>
Subject: External tool for vulnerability checking (i.e. Yocto-vex-check)
To: OE-core <openembedded-core@lists.openembedded.org>, 
	yocto-security@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000009ccc3e062ef1e001"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 06:50:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211864

--0000000000009ccc3e062ef1e001
Content-Type: text/plain; charset="UTF-8"

Hell all,
There have been questions and discussions recently about the external
tooling for CVE-checking in the context of the NVD issues.

Last year, we posted an RFC of the yocto-vex-check and the vex.bbclass.
vex.bbclass has been integrated into the Yocto Project. There has been no
much discussion about yocto-vex-check on the mailing list, but there are
some people who are already using it...

Short version: you can download it from
https://gitlab.com/syslinbit/public/yocto-vex-check

Longer version:
============

There are a few missing features we're working on before the integration in
the YP and the next patchset (limiting the number of false positives is
one). They are in private branches but will be merging soon.

You can use it still (we have a daily bot) and a typical command for an
external run (when you have done an YP build) is like

./wrap-yocto-vex-check.py \
-i ../openembedded-core/build/tmp/log/cve/cve-summary.json \
-o out-check-test \
-t temp-out-check \
-db ../cvelistV5-overrides/ -db-type CVE

For the complete instructions, see the blog post that I plan to update with
the progress of changes coming: https://ygreky.com/2025/02/yocto-vex-check/

We have also presented the tool at FOSDEM 2025 and you can accces it from
the talk page:
https://fosdem.org/2025/schedule/event/fosdem-2025-5519-vulnerability-management-at-a-scale-for-the-yocto-project/

If you have any questions, ask them here. We'll be happy to see your
remarks/test results!

Kind regards,
Marta

--0000000000009ccc3e062ef1e001
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hell all,</div><div>There have been questions and dis=
cussions recently about the external tooling for CVE-checking in the contex=
t of the NVD issues.</div><div><br></div><div>Last year, we posted an RFC o=
f the yocto-vex-check and the vex.bbclass. vex.bbclass has been integrated =
into the Yocto Project. There has been no much discussion about yocto-vex-c=
heck on the mailing list, but there are some people who are already using i=
t...</div><div><br></div><div>Short version: you can download it from <a hr=
ef=3D"https://gitlab.com/syslinbit/public/yocto-vex-check">https://gitlab.c=
om/syslinbit/public/yocto-vex-check</a></div><div><br></div><div>Longer ver=
sion:</div><div>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br></div><div><br></di=
v><div>There are a few missing features we&#39;re working on before the int=
egration in the YP and the next patchset (limiting the number of false posi=
tives is one). They are in private branches but will be merging soon.<br></=
div><div><br></div><div>You can use it still (we have a daily bot) and a ty=
pical command for an external run (when you have done an YP build) is like<=
/div><div><br></div><div><pre class=3D"gmail-wp-block-code"><code>./wrap-yo=
cto-vex-check.py \
-i ../openembedded-core/build/tmp/log/cve/cve-summary.json \
-o out-check-test \
-t temp-out-check \
-db ../cvelistV5-overrides/ -db-type CVE</code></pre></div><div>For the com=
plete instructions, see the blog post that I plan to=20
update with the progress of changes coming:=20
<a href=3D"https://ygreky.com/2025/02/yocto-vex-check/">https://ygreky.com/=
2025/02/yocto-vex-check/</a></div><div><br></div><div>We have also presente=
d the tool at FOSDEM 2025 and you can accces it from the talk page: <a href=
=3D"https://fosdem.org/2025/schedule/event/fosdem-2025-5519-vulnerability-m=
anagement-at-a-scale-for-the-yocto-project/">https://fosdem.org/2025/schedu=
le/event/fosdem-2025-5519-vulnerability-management-at-a-scale-for-the-yocto=
-project/</a></div><div><br></div><div>If you have any questions, ask them =
here. We&#39;ll be happy to see your remarks/test results!</div><div><br></=
div><div>Kind regards,</div><div>Marta<br></div></div>

--0000000000009ccc3e062ef1e001--

