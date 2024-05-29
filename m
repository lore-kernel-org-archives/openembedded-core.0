Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08699C25B75
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 16:49:01 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web11.20326.1717001335600463937
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 May 2024 09:48:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A0qOeJVS;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5b97648b38eso1248517eaf.3
        for <openembedded-core@lists.openembedded.org>; Wed, 29 May 2024 09:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717001335; x=1717606135; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AyiOLyRtRemlWWAH8f9LV2uyuw1ppTnBnfjR2HKJOKU=;
        b=A0qOeJVSqF69BD56ejljgpMYCPUETmD34J2qaj0YOepTWqjXQU21zdCera3QqUWjTv
         HEi2UKKxCslYulW569hHYjAh9iDEhhuBkGzHrG9+7moPcgdrKimMB+wDq34JLys4wE58
         HetTact84TbzcueOD+pTA1On6+NQEHrHp6/PCtXIWAzyBrYVWITghXinEJvF7F4d5nOB
         ZbTqVXm5qdSiodgOPlFRrFQnwLNXvGUZR1L3JPuTGY/XTqq78PQJBSS+sqDOs/jjjRLa
         +jA8W3Ny7532dCd56WAjW1+5moxn3uifRgjCF3ErzgxF7w+PD4KnHhw9GNY7XaCoJrTI
         2mPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717001335; x=1717606135;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AyiOLyRtRemlWWAH8f9LV2uyuw1ppTnBnfjR2HKJOKU=;
        b=UNpKclcBM0fT5IabyNc8M1IvKtmxwfQlSbu19iQoTwh+GoZc+fp8zXtChEDN1JGSYd
         4uA9sP1yrWYknfUxMukN+X35X9KEQVT8C28fcyqtyow5iKobNzamQ7rr+0okyqRNJ8lS
         afy9kirm6RnsS07Agg0mtptQB5wGStEC79mLIHCuZFA/F2kjGXQ5tRpEyFepNcjtmNsK
         PXnQBaNoDGOy97jaoTkqSrXTLcg10ch8ELZvpBHJ9pEVSI5JwJuOjA4cUS/kTCmCJKRj
         sIuYhNAyjXy/4JIgHQPUf5lX3T2JKKOWuNFOPO8PpkbDNk5sv9p1qbiYbJuZzxbDoyBq
         KeKg==
X-Forwarded-Encrypted: i=1; AJvYcCVwdUZZIc3YbpJRe7yu2v9s2UutNgKhNOWNXM8LvXGiD0zGYY6JHeuWu5zUNB1MuqaOrx31kvhQtNJptD8VyaivQhoHkbPxyIlNjXVMs1czP6pQ9hhhbmUw
X-Gm-Message-State: AOJu0Yy276gFchOZism0ThTjiXYIk4fkMMes/+XmqOGiFOmuN+Ek8sL2
	+R4lsNWgNyyeihOdXxZzebEvLA6k+yeYU0LsqWSPZY74TQ8EbYRdvBYyWFRY2UiPWdvWJfNVi93
	s/XTbQjzxl6srnyb7h9UWsIpwImQ=
X-Google-Smtp-Source: AGHT+IEIK8gw0vJhRsztEpWGwpluCsjveN1AiFIPNCtNPSApDgl8GaEyaht5bX/WC2NGnayI5aYEuPvEEg405kArPGc=
X-Received: by 2002:a05:6870:63a5:b0:24f:cb66:3ec0 with SMTP id
 586e51a60fabf-24fcb66d02dmr13286961fac.4.1717001334525; Wed, 29 May 2024
 09:48:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240524072345.921885-1-bin.lan.cn@eng.windriver.com> <CAOSpxdbrjRQdnr11SqnNxUjb_1gHTOUpP9qD1ke2sN-feSug5A@mail.gmail.com>
In-Reply-To: <CAOSpxdbrjRQdnr11SqnNxUjb_1gHTOUpP9qD1ke2sN-feSug5A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 May 2024 09:48:27 -0700
Message-ID: <CAMKF1srxb_VX1P_-=1tSS53kNT+tSHRHp4Eofb1QiNJ+WwKUVQ@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCH 1/2] iputils: splitting the ping6 as a package
To: steve@sakoman.com
Cc: bin.lan.cn@eng.windriver.com, openembedded-core@lists.openembedded.org, 
	xiangyu.chen@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 May 2024 16:49:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200010

Hi Steve

On Wed, May 29, 2024 at 7:26=E2=80=AFAM Steve Sakoman via
lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
wrote:
>
> I'm hesitant to take a packaging change in a stable branch.  If others
> would like to weigh in on this please speak up!
>

I look at this change as a bug fix for iputils to reflect the UI
change they have made and since its packaged into its own utility
that piece I am not sure but this also makes it override inetutils so
it has value.

> Steve
>
> On Fri, May 24, 2024 at 12:24=E2=80=AFAM Bin Lan via lists.openembedded.o=
rg
> <bin.lan.cn=3Deng.windriver.com@lists.openembedded.org> wrote:
> >
> > From: Xiangyu Chen <xiangyu.chen@windriver.com>
> >
> > The iputils merged the ping4 and ping6 command into the ping since the
> > commit ebad35fe[1], currently, iputils ping support being called using
> > "ping -6" or "ping6" symlinks.
> >
> > In oe-core, there are two packages provide ipv6 ping, inetutils and ipu=
tils,
> > the inetutils-ping6 doesn't support "-I" option to bind the interface, =
that
> > cause some of scripts(e.g. LTP test[2]) which was based on iputils-ping=
6 fails.
> >
> > If someone or a package needs iputils-ping6, they can enable it in loca=
l.conf
> > or add it into rdepends directly.
> >
> > Ref:
> > [1] https://github.com/iputils/iputils/commit/e3de851b809c7b72ccc654a72=
b6af61d
> > [2] https://github.com/linux-test-project/ltp/blob/master/testcases/ker=
nel/ \
> >     containers/netns/netns_comm.sh#L25
> >
> > Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> > Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > (cherry picked from commit 0b89bc2041f670af625829d061ce79e0840ac116)
> > Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
> > ---
> >  meta/recipes-extended/iputils/iputils_20240117.bb | 13 ++++++++++++-
> >  1 file changed, 12 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-extended/iputils/iputils_20240117.bb b/meta/r=
ecipes-extended/iputils/iputils_20240117.bb
> > index 5a5e15528e..3880689742 100644
> > --- a/meta/recipes-extended/iputils/iputils_20240117.bb
> > +++ b/meta/recipes-extended/iputils/iputils_20240117.bb
> > @@ -35,7 +35,11 @@ ALTERNATIVE_PRIORITY =3D "100"
> >  ALTERNATIVE:${PN}-ping =3D "ping"
> >  ALTERNATIVE_LINK_NAME[ping] =3D "${base_bindir}/ping"
> >
> > -SPLITPKGS =3D "${PN}-ping ${PN}-arping ${PN}-tracepath ${PN}-clockdiff=
"
> > +ALTERNATIVE:${PN}-ping6 =3D "ping6"
> > +ALTERNATIVE_LINK_NAME[ping6] =3D "${base_bindir}/ping6"
> > +
> > +SPLITPKGS =3D "${PN}-ping ${PN}-arping ${PN}-tracepath ${PN}-clockdiff=
 \
> > +             ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '${PN}-pi=
ng6', '', d)}"
> >  PACKAGES +=3D "${SPLITPKGS}"
> >
> >  ALLOW_EMPTY:${PN} =3D "1"
> > @@ -43,6 +47,13 @@ RDEPENDS:${PN} +=3D "${SPLITPKGS}"
> >
> >  FILES:${PN} =3D ""
> >  FILES:${PN}-ping =3D "${base_bindir}/ping.${BPN}"
> > +FILES:${PN}-ping6 =3D "${base_bindir}/ping6.${BPN}"
> >  FILES:${PN}-arping =3D "${base_bindir}/arping"
> >  FILES:${PN}-tracepath =3D "${base_bindir}/tracepath"
> >  FILES:${PN}-clockdiff =3D "${base_bindir}/clockdiff"
> > +
> > +do_install:append() {
> > +       if ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'true', 'fal=
se', d)}; then
> > +               ln -sf ping ${D}/${base_bindir}/ping6
> > +       fi
> > +}
> > --
> > 2.34.1
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200005): https://lists.openembedded.org/g/openembedde=
d-core/message/200005
> Mute This Topic: https://lists.openembedded.org/mt/106277573/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

