Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 735EAC433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 07:36:07 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.6948.1646897766544624705
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 23:36:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KnkTfu5d;
 spf=pass (domain: gmail.com, ip: 209.85.222.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id b67so3762383qkc.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 23:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nbZ6XXw4dI7WGoVOvMk2qAEyOD4wijPnnqVOYh9c5WI=;
        b=KnkTfu5dYVi/2Xbrp0ITxrgo/uYBKnkEPerpvS8fu5i3Zn/rqOfv4ZUTP2GI9U3hXh
         y+/V40YlutYmWBbYU4xyl1BGznnGBaXc8to++WpJ9LG/TvPEBuGizdiAPkpEMillEOir
         fNHUooQgGybMiVr9Ha41ui+cRHUUDaUdAcLaEdT5xU1yQsqFVSr7lx78ztsHq2F6zk8Z
         7E0xqnYVObGMbs4U8cpcglfMEk/6nOB6z4ZI4yM67QfVWV8iXV4ftitF1/ARE8/l+/CC
         osQj9Dm2mr/vpuNtJmaD0ALO3LuGBIp9jDengQzAnxTlXQ0BSZ19KbwnO3TKzUzTDiTf
         gDwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nbZ6XXw4dI7WGoVOvMk2qAEyOD4wijPnnqVOYh9c5WI=;
        b=E5398cLyRCLP2SduBhfpkYYOwrC8FPVzQQw6+Zz/o2Hy1Ux9RHJK8O5KZni1ySGHEv
         KyUFjN6nZKEIPksRAxAexT3Sb7zDqdzt0/CRAXXDMBfY7t0ki5maDv6bd0C4tqJi0B6+
         RxxUPxu8+vI9BkRuYPb1MD6PwV8lhgD4QYOl9rRkJNDj8KQ9TpmQ2umkuNoBv5VYWjXb
         pCM1ECY/0KWBEJ8hq/m+nQ31ZsofqnXAJQCG7WCXEo4Mg3tG0m5SHh860CwDmGJ2bYj6
         saHBbXlxc02vP7C1U1kF7Zu/fLIfk1SYTj6A3NKhKG+Y1OqMP/TfQ3qlGNYiPEzN2eDE
         iiOQ==
X-Gm-Message-State: AOAM530g3yxFqnpwFESgVY5/I5MRS+siAUtycHZiey+oxb0c7+0uhUIf
	uDWRJlkD4cHfPJ7NifAdvLoh0bSfOdT1rmfRU+8=
X-Google-Smtp-Source: 
 ABdhPJyfShowoxzA4pLv4aJK0h9F9dXXh7sWGjOE4oPPn6JElfUFYKEebWMtZ/2G1K93TucIgzLdnAQKBSK7TspCfuc=
X-Received: by 2002:a05:620a:372c:b0:67a:de08:875e with SMTP id
 de44-20020a05620a372c00b0067ade08875emr2226407qkb.149.1646897765394; Wed, 09
 Mar 2022 23:36:05 -0800 (PST)
MIME-Version: 1.0
References: <20220310043116.476846-1-raj.khem@gmail.com>
 <CANNYZj9FP0yZnKHGQv6CTv4CqAFsh2GUqSP5ni=2hRzjWe3H8A@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9FP0yZnKHGQv6CTv4CqAFsh2GUqSP5ni=2hRzjWe3H8A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 Mar 2022 23:35:39 -0800
Message-ID: 
 <CAMKF1sptSfuJf0Uii==eSH-Yd+UH0_ZqUGvdj4Mhh5xEe+RFSw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] m4: Fix build on musl/ppc
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Mar 2022 07:36:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163002

On Wed, Mar 9, 2022 at 10:27 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Submit upstream first please :)
>

its already sent but it has not appeared on ml yet since I am not
subscribed to m4 ml I guess.

>
> Ale
>
> On Thu 10. Mar 2022 at 5.31, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/recipes-devtools/m4/m4-1.4.19.inc        |  1 +
>>  .../0001-sigsegv-Fix-build-on-ppc-musl.patch  | 37 +++++++++++++++++++
>>  2 files changed, 38 insertions(+)
>>  create mode 100644 meta/recipes-devtools/m4/m4/0001-sigsegv-Fix-build-o=
n-ppc-musl.patch
>>
>> diff --git a/meta/recipes-devtools/m4/m4-1.4.19.inc b/meta/recipes-devto=
ols/m4/m4-1.4.19.inc
>> index 2785a3d22cd..2adf4de6f2f 100644
>> --- a/meta/recipes-devtools/m4/m4-1.4.19.inc
>> +++ b/meta/recipes-devtools/m4/m4-1.4.19.inc
>> @@ -8,6 +8,7 @@ inherit autotools texinfo ptest gettext
>>
>>  SRC_URI =3D "${GNU_MIRROR}/m4/m4-${PV}.tar.gz \
>>             file://ac_config_links.patch \
>> +           file://0001-sigsegv-Fix-build-on-ppc-musl.patch \
>>             "
>>  SRC_URI:append:class-target =3D " file://run-ptest \
>>                                  file://serial-tests-config.patch \
>> diff --git a/meta/recipes-devtools/m4/m4/0001-sigsegv-Fix-build-on-ppc-m=
usl.patch b/meta/recipes-devtools/m4/m4/0001-sigsegv-Fix-build-on-ppc-musl.=
patch
>> new file mode 100644
>> index 00000000000..8f2ad81c0c5
>> --- /dev/null
>> +++ b/meta/recipes-devtools/m4/m4/0001-sigsegv-Fix-build-on-ppc-musl.pat=
ch
>> @@ -0,0 +1,37 @@
>> +From 36d5e26f606e070553eb0fff1f738e61970be5d7 Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Wed, 9 Mar 2022 20:22:20 -0800
>> +Subject: [PATCH] sigsegv: Fix build on ppc/musl
>> +
>> +mcontext is not a standard layout so glibc and musl differ sadly.
>> +
>> +Fixes
>> +../../m4-1.4.19/lib/sigsegv.c: In function 'sigsegv_handler':          =
                                                                           =
                                          ../../m4-1.4.19/lib/sigsegv.c:223=
:75: error: 'mcontext_t' has no member named 'uc_regs'; did you mean 'gregs=
'?                                                                         =
       223 | #    define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->=
uc_mcontext.uc_regs->gregs[1]                                              =
                                                 |                         =
                                                  ^~~~~~~
>> +
>> +Upstream-Status: Pending
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> + lib/sigsegv.c | 6 +++---
>> + 1 file changed, 3 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/lib/sigsegv.c b/lib/sigsegv.c
>> +index 696a152..fa0c465 100644
>> +--- a/lib/sigsegv.c
>> ++++ b/lib/sigsegv.c
>> +@@ -217,10 +217,10 @@ int libsigsegv_version =3D LIBSIGSEGV_VERSION;
>> + #   define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mconte=
xt.gp_regs[1]
>> + #  else /* 32-bit */
>> + /* both should be equivalent */
>> +-#   if 0
>> +-#    define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcont=
ext.regs->gpr[1]
>> ++#   if ! defined __GLIBC__
>> ++#      define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_reg=
s->gregs[1]
>> + #   else
>> +-#    define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcont=
ext.uc_regs->gregs[1]
>> ++#      define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mco=
ntext.uc_regs->gregs[1]
>> + #   endif
>> + #  endif
>> +
>> +--
>> +2.35.1
>> +
>> --
>> 2.35.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#163000): https://lists.openembedded.org/g/openembedd=
ed-core/message/163000
>> Mute This Topic: https://lists.openembedded.org/mt/89680211/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [a=
lex.kanavin@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

