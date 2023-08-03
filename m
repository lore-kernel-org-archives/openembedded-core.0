Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99FA5C00528
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 18:58:12 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.2507.1691089083102035334
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Aug 2023 11:58:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=e1B35FF+;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.51, mailfrom: steve@sakoman.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3fe426b8583so6466315e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 11:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691089081; x=1691693881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Btist8n18oKUADILaV60M0Gw6M5Ao+z9xut4Ku2KWz8=;
        b=e1B35FF+SUOkQFyxPEO2lHpV0jCJJnAymzK7qdrRc0onSingSgmn6mzDZDTsnEdqQo
         BSz3/ek1mMwowUpY7zUcf5CapRriw8wFQiOzeN4wWVby7ANZ3twRzjv6ckWtreFP31xW
         8qS8cAWfL+HDsclDyPprWtk/y4i47gOuWC2YyJY5JinW5VOdvLepVbAq51Jn/sh+QSVT
         j2BiLU/+7lH+hmqA//MT7sPknwrBisPUwiPB2ppaeuAp8MbqMEdkAJ61VPFpKYEHqKQP
         GncLDyK6Lh9bK2+CmiHuVhKQBi6wQQJgbusYup1Px8ylWAp6qXBMALY5e5K1lbygD/NQ
         5wEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691089081; x=1691693881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Btist8n18oKUADILaV60M0Gw6M5Ao+z9xut4Ku2KWz8=;
        b=GM/uNCBeugaTkvLtooS+6FKIZA2tpQMNNYrdo5omFELH4JIetkQ/RcsspHQKLSjg03
         t7dTR7YFVdmsA0mcKzl2VyyqAZBHoXbTM7n/Lt0Xr6oT5Xwu1UvVTJgbfoFxDU1NBdg2
         x4Co2bgW1GPkgbCBATiH6y1qCRuTvl/SGW9vHeoO4eW1n1YiPzLJ2I+Y2vGBcWl38LAm
         Fqo36E8Qm/UIJ/+Ygoijk/+ouW5vSUtnyD/T/sSbEzSXakBm87k1ubNWJHNRS5wrlmbF
         itVUxWot4ogvmco7pBlFDO2AO6r0o6VDTfhCGCTUSGKLSslO5p2Gdj+LzGuSt9X0w3Kn
         Ia0Q==
X-Gm-Message-State: ABy/qLYjLVoSw0TVU1K3hkHAjnOezaDsrLjmgmL4N5Y1A0PKbrpK9LnA
	jvhgbdp/t3VBtxpgyb6yyIe1zn1dtzmxPQXZDUfQLA==
X-Google-Smtp-Source: APBJJlFcHPekSeAshdsDLJpbRy9FVK1H7n95gmlT7HdqJbip/lYN65+7jfC1bdrf8a2clxUU3gI8/G5gy58AdlZkcJw=
X-Received: by 2002:a7b:c855:0:b0:3fc:616:b0db with SMTP id
 c21-20020a7bc855000000b003fc0616b0dbmr7934075wml.9.1691089081132; Thu, 03 Aug
 2023 11:58:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230627063200.12025-1-sdoshi@mvista.com> <26e6db4b-10d5-0db1-c442-ca318c58852f@windriver.com>
In-Reply-To: <26e6db4b-10d5-0db1-c442-ca318c58852f@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 3 Aug 2023 08:57:50 -1000
Message-ID: <CAOSpxdbmRt7B-uKaKpfeCJHgfgTMGodSuACgbE5--oJ-TF+noQ@mail.gmail.com>
Subject: Re: [OE-core][master][PATCH] bind: Upgrade 9.18.15 -> 9.18.16
To: Yi Zhao <yi.zhao@windriver.com>
Cc: Siddharth <sdoshi@mvista.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 18:58:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185496

On Wed, Aug 2, 2023 at 4:24=E2=80=AFPM Yi Zhao <yi.zhao@windriver.com> wrot=
e:
>
>
> Hi Steve,
>
>
> On 6/27/23 14:32, Siddharth wrote:
> > From: Siddharth Doshi <sdoshi@mvista.com>
> >
> > - Remove configure options no longer supported online.
> >
> > Changelog:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D
> > [security]    A query that prioritizes stale data over lookup
> >               triggers a fetch to refresh the stale data in cache.
> >               If the fetch is aborted for exceeding the recursion
> >               quota, it was possible for 'named' to enter an infinite
> >               callback loop and crash due to stack overflow. This has
> >               been fixed. (CVE-2023-2911) [GL #4089]
> >
> > [security]    Improve the overmem cleaning process to prevent the
> >               cache going over the configured limit. (CVE-2023-2828)
> >               [GL #4055]
>
>
> There are some CVE fixes in this minor update. Is there any plan to
> backport it to mickledore ?

I saw a couple of commits with function changes in this update, so I
didn't take it.

If you feel that these aren't an issue please send a mickledore patch
to the list for review, preferably with a comment on why the function
changes aren't an issue.

Steve

> > [performance] Reduce memory consumption by allocating properly
> >               sized send buffers for stream-based transports.
> >               [GL #4038]
> >
> > [bug]         Fix a 'clients-per-query' miscalculation bug. When the
> >               'stale-answer-enable' options was enabled and the
> >               'stale-answer-client-timeout' option was enabled and
> >               larger than 0, named was taking two places from the
> >               'clients-per-query' limit for each client and was
> >               failing to gradually auto-tune its value, as configured.
> >               [GL #4074]
> >
> > [func]                Add "ClientQuota" statistics channel counter, whi=
ch
> >               indicates the number of the resolver's spilled queries
> >               due to reaching the clients per query quota. [GL !7978]
> >
> > [bug]         Fix a serve-stale bug where a delegation from cache
> >               could be returned to the client. [GL #3950]
> >
> > [cleanup]     Remove configure checks for epoll, kqueue and
> >               /dev/poll. [GL #4098]
> >
> > [func]                The "tkey-dhkey" option has been deprecated; a
> >               warning will be logged when it is used. In a future
> >               release, Diffie-Hellman TKEY mode will be removed.
> >               [GL #3905]
> >
> > [bug]         The session key object could be incorrectly added
> >               to multiple different views' keyrings. [GL #4079]
> >
> > [bug]         Fix an interfacemgr use-after-free error in
> >               zoneconf.c:isself(). [GL #3765]
> >
> > [test]                Add support for using pytest & pytest-xdist to
> >               execute the system test suite. [GL #3978]
> >
> > [bug]         BIND could get stuck on reconfiguration when a
> >               'listen' statement for HTTP is removed from the
> >               configuration. That has been fixed. [GL #4071]
> >
> > [bug]         Properly process extra "nameserver" lines in
> >               resolv.conf otherwise the next line is not properly
> >               processed. [GL #4066]
> >
> > [bug]         named could crash when deleting inline-signing zones
> >               with "rndc delzone". [GL #4054]
> >
> > [bug]         Fix a logic error in dighost.c which could call the
> >               dighost_shutdown() callback twice and cause problems
> >               if the callback function was not idempotent. [GL #4039]
> >
> > Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
> > ---
> >   .../0001-avoid-start-failure-with-bind-user.patch             | 0
> >   ...0001-named-lwresd-V-and-start-log-hide-build-options.patch | 0
> >   ...bind-ensure-searching-for-json-headers-searches-sysr.patch | 0
> >   .../bind/{bind-9.18.15 =3D> bind-9.18.16}/bind9                 | 0
> >   .../bind/{bind-9.18.15 =3D> bind-9.18.16}/conf.patch            | 0
> >   .../bind/{bind-9.18.15 =3D> bind-9.18.16}/generate-rndc-key.sh  | 0
> >   .../init.d-add-support-for-read-only-rootfs.patch             | 0
> >   .../make-etc-initd-bind-stop-work.patch                       | 0
> >   .../bind/{bind-9.18.15 =3D> bind-9.18.16}/named.service         | 0
> >   .../bind/{bind_9.18.15.bb =3D> bind_9.18.16.bb}                 | 4 +=
+--
> >   10 files changed, 2 insertions(+), 2 deletions(-)
> >   rename meta/recipes-connectivity/bind/{bind-9.18.15 =3D> bind-9.18.16=
}/0001-avoid-start-failure-with-bind-user.patch (100%)
> >   rename meta/recipes-connectivity/bind/{bind-9.18.15 =3D> bind-9.18.16=
}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
> >   rename meta/recipes-connectivity/bind/{bind-9.18.15 =3D> bind-9.18.16=
}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
> >   rename meta/recipes-connectivity/bind/{bind-9.18.15 =3D> bind-9.18.16=
}/bind9 (100%)
> >   rename meta/recipes-connectivity/bind/{bind-9.18.15 =3D> bind-9.18.16=
}/conf.patch (100%)
> >   rename meta/recipes-connectivity/bind/{bind-9.18.15 =3D> bind-9.18.16=
}/generate-rndc-key.sh (100%)
> >   rename meta/recipes-connectivity/bind/{bind-9.18.15 =3D> bind-9.18.16=
}/init.d-add-support-for-read-only-rootfs.patch (100%)
> >   rename meta/recipes-connectivity/bind/{bind-9.18.15 =3D> bind-9.18.16=
}/make-etc-initd-bind-stop-work.patch (100%)
> >   rename meta/recipes-connectivity/bind/{bind-9.18.15 =3D> bind-9.18.16=
}/named.service (100%)
> >   rename meta/recipes-connectivity/bind/{bind_9.18.15.bb =3D> bind_9.18=
.16.bb} (96%)
> >
> > diff --git a/meta/recipes-connectivity/bind/bind-9.18.15/0001-avoid-sta=
rt-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.18.=
16/0001-avoid-start-failure-with-bind-user.patch
> > similarity index 100%
> > rename from meta/recipes-connectivity/bind/bind-9.18.15/0001-avoid-star=
t-failure-with-bind-user.patch
> > rename to meta/recipes-connectivity/bind/bind-9.18.16/0001-avoid-start-=
failure-with-bind-user.patch
> > diff --git a/meta/recipes-connectivity/bind/bind-9.18.15/0001-named-lwr=
esd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bi=
nd/bind-9.18.16/0001-named-lwresd-V-and-start-log-hide-build-options.patch
> > similarity index 100%
> > rename from meta/recipes-connectivity/bind/bind-9.18.15/0001-named-lwre=
sd-V-and-start-log-hide-build-options.patch
> > rename to meta/recipes-connectivity/bind/bind-9.18.16/0001-named-lwresd=
-V-and-start-log-hide-build-options.patch
> > diff --git a/meta/recipes-connectivity/bind/bind-9.18.15/bind-ensure-se=
arching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bi=
nd/bind-9.18.16/bind-ensure-searching-for-json-headers-searches-sysr.patch
> > similarity index 100%
> > rename from meta/recipes-connectivity/bind/bind-9.18.15/bind-ensure-sea=
rching-for-json-headers-searches-sysr.patch
> > rename to meta/recipes-connectivity/bind/bind-9.18.16/bind-ensure-searc=
hing-for-json-headers-searches-sysr.patch
> > diff --git a/meta/recipes-connectivity/bind/bind-9.18.15/bind9 b/meta/r=
ecipes-connectivity/bind/bind-9.18.16/bind9
> > similarity index 100%
> > rename from meta/recipes-connectivity/bind/bind-9.18.15/bind9
> > rename to meta/recipes-connectivity/bind/bind-9.18.16/bind9
> > diff --git a/meta/recipes-connectivity/bind/bind-9.18.15/conf.patch b/m=
eta/recipes-connectivity/bind/bind-9.18.16/conf.patch
> > similarity index 100%
> > rename from meta/recipes-connectivity/bind/bind-9.18.15/conf.patch
> > rename to meta/recipes-connectivity/bind/bind-9.18.16/conf.patch
> > diff --git a/meta/recipes-connectivity/bind/bind-9.18.15/generate-rndc-=
key.sh b/meta/recipes-connectivity/bind/bind-9.18.16/generate-rndc-key.sh
> > similarity index 100%
> > rename from meta/recipes-connectivity/bind/bind-9.18.15/generate-rndc-k=
ey.sh
> > rename to meta/recipes-connectivity/bind/bind-9.18.16/generate-rndc-key=
.sh
> > diff --git a/meta/recipes-connectivity/bind/bind-9.18.15/init.d-add-sup=
port-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.18.=
16/init.d-add-support-for-read-only-rootfs.patch
> > similarity index 100%
> > rename from meta/recipes-connectivity/bind/bind-9.18.15/init.d-add-supp=
ort-for-read-only-rootfs.patch
> > rename to meta/recipes-connectivity/bind/bind-9.18.16/init.d-add-suppor=
t-for-read-only-rootfs.patch
> > diff --git a/meta/recipes-connectivity/bind/bind-9.18.15/make-etc-initd=
-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.18.16/make-et=
c-initd-bind-stop-work.patch
> > similarity index 100%
> > rename from meta/recipes-connectivity/bind/bind-9.18.15/make-etc-initd-=
bind-stop-work.patch
> > rename to meta/recipes-connectivity/bind/bind-9.18.16/make-etc-initd-bi=
nd-stop-work.patch
> > diff --git a/meta/recipes-connectivity/bind/bind-9.18.15/named.service =
b/meta/recipes-connectivity/bind/bind-9.18.16/named.service
> > similarity index 100%
> > rename from meta/recipes-connectivity/bind/bind-9.18.15/named.service
> > rename to meta/recipes-connectivity/bind/bind-9.18.16/named.service
> > diff --git a/meta/recipes-connectivity/bind/bind_9.18.15.bb b/meta/reci=
pes-connectivity/bind/bind_9.18.16.bb
> > similarity index 96%
> > rename from meta/recipes-connectivity/bind/bind_9.18.15.bb
> > rename to meta/recipes-connectivity/bind/bind_9.18.16.bb
> > index 80164aad87..1b1649566a 100644
> > --- a/meta/recipes-connectivity/bind/bind_9.18.15.bb
> > +++ b/meta/recipes-connectivity/bind/bind_9.18.16.bb
> > @@ -20,7 +20,7 @@ SRC_URI =3D "https://ftp.isc.org/isc/bind9/${PV}/${BP=
N}-${PV}.tar.xz \
> >              file://0001-avoid-start-failure-with-bind-user.patch \
> >              "
> >
> > -SRC_URI[sha256sum] =3D "28ae8db14862801bc2bd4fd820db00667d3f1ff9ae9cc2=
d06a0ef7810fed7a4e"
> > +SRC_URI[sha256sum] =3D "c88234fe07ee75c3c8a9e59152fee64b714643de8e22cf=
98da3db4d0b57e0775"
> >
> >   UPSTREAM_CHECK_URI =3D "https://ftp.isc.org/isc/bind9/"
> >   # follow the ESV versions divisible by 2
> > @@ -39,7 +39,7 @@ PACKAGECONFIG[readline] =3D "--with-readline=3Dreadli=
ne,,readline"
> >   PACKAGECONFIG[libedit] =3D "--with-readline=3Dlibedit,,libedit"
> >   PACKAGECONFIG[dns-over-http] =3D "--enable-doh,--disable-doh,nghttp2"
> >
> > -EXTRA_OECONF =3D " --disable-devpoll --disable-auto-validation --enabl=
e-epoll \
> > +EXTRA_OECONF =3D " --disable-auto-validation \
> >                    --with-gssapi=3Dno --with-lmdb=3Dno --with-zlib \
> >                    --sysconfdir=3D${sysconfdir}/bind \
> >                    --with-openssl=3D${STAGING_DIR_HOST}${prefix} \
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#183438): https://lists.openembedded.org/g/openembed=
ded-core/message/183438
> > Mute This Topic: https://lists.openembedded.org/mt/99804753/7283133
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
yi.zhao@eng.windriver.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

