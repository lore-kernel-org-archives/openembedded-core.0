Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E0D0E88D8C
	for <webhook@archiver.kernel.org>; Sat,  4 Apr 2026 08:07:42 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12566.1775290051688884269
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Apr 2026 01:07:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Os1Z4K5z;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-486fc4725f0so24820165e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Apr 2026 01:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775290050; x=1775894850; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KOQN6/F/dm44PmLvipyBD05J8v3Uyp04NHzUWhsJc5s=;
        b=Os1Z4K5z9qTnugIxTRcHx3WdtYypox23wm7w0QHHhPts4fRG2+c4JH9yX5g8VSc8aG
         dcpbJsTHnuBJdCEqeJh07QjdwEo/+xx5tbOrHvAGs8BG9k61YXVV+MCtLEV5e/D0r0aq
         tREhwsTjFJRP1xQ96D3n170tDf/IdPzRxCWcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775290050; x=1775894850;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KOQN6/F/dm44PmLvipyBD05J8v3Uyp04NHzUWhsJc5s=;
        b=ReNdrGML4t4hs2+fI7UxXnosxGEO0g/Om++kKK91TEKBmOzbT/cKnMft9m4KN2j8lH
         kDTLNTrBfAqTzsG9S5+tT3fWDyx2oZPYjdwJF+Bb0pRpEcwNUtGEa2WbBy/kEBe0lwG4
         EuGKiRA6Zyhj/ALD8WXCqj0JD3HzKvzdeYFktdfSECKcYV7yj5pdzY6kumy0nkX8GOHH
         xScD0NQ+RbWHWStGq6OogYs0nQLwV/d2f1RILbkCgKMDOb6K2GLP4103wfYDO6zY4xmd
         +a7EwYwoQ1H7FNevtJtHK4UUu2av9bfIJkzMev8Rv2+vrFArxXb4A6vgxulbwC3WULHH
         yzHg==
X-Gm-Message-State: AOJu0YwEmrpjIMsVWID6w9AtDggyk8kTDCF4otCKnCrp/e5dKgDukCxA
	4xkQNcfWTA61u0Anvej7jtCiu2GgKZDTC3Ysm3UmNeSLVxuAx92l4yV59sfGhuYx/kk=
X-Gm-Gg: AeBDiesDc3+ZFL6fppw7/Kiotz5db9m22TvfFH0qck5wNxOPmPK+jZe2BRhZgJR41oN
	PqO43wmBabmhScmON5f7fkx3Hxioy+z/3spyWEdMPpyM71S1q3YQuvOTLCHXqtYqaF8Ah+B28bA
	ILcL2CyP5yRKmBfnlN0/sOOOzC6YvYd8hgnFL7oFDhXTJZ7QBL4vZKiR2PoKyzXi/7DOqv46J80
	V+GmME1Y2/hSH4M7wNMlR03cizqnYe7IOFTanqFz+5PInl3ap3OsMKsGscrm4eC7zMfkn8wgu6S
	eQK2AC/d+pGu7FkFNGGG+iK33QQXAopXTF4RrFaIG2SdtwbGsY6puookWXTiajBm5V4039dswfw
	5f772Z4vJ7pZu3VWk6V8EV4+a5wFRoVmsjpTo8jKxp3SyIErV6/SD0PN8W/lTnRoAfM6V0qAyqt
	yrn0tgrluAX5VW11ENqXNIuso0vIAOrHEflWqWjc5t8O0adbJTFik/Uy9aE8XAJ5SA6T80OhTk+
	0U4CbZHQfoZZRw=
X-Received: by 2002:a05:600c:45cf:b0:477:9890:9ab8 with SMTP id 5b1f17b1804b1-4889945f8c3mr78243805e9.3.1775290049838;
        Sat, 04 Apr 2026 01:07:29 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e822227sm363185425e9.4.2026.04.04.01.07.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Apr 2026 01:07:29 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 04 Apr 2026 10:07:29 +0200
Message-Id: <DHK7STMY8355.1F4WMJQ94QI3C@smile.fr>
Cc: <openembedded-core@lists.openembedded.org>
To: "Vijay Anusuri" <vanusuri@mvista.com>
Subject: Re: [OE-core][kirkstone][PATCH] sqlite3: Fix CVE-2025-70873
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260402071559.292708-1-vanusuri@mvista.com>
 <DHJW0NQHT38D.XY6Q9OTN12FY@smile.fr>
 <CANQUz183e_N3p7n1pSr4sXUP0QAHpytUZ=-akObn1HV3PXttqQ@mail.gmail.com>
In-Reply-To: <CANQUz183e_N3p7n1pSr4sXUP0QAHpytUZ=-akObn1HV3PXttqQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Apr 2026 08:07:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234610

On Sat Apr 4, 2026 at 9:41 AM CEST, Vijay Anusuri wrote:
> Hi Yoann,
>
> The fixes for this CVE are already included in SQLite version 3.51.3 on t=
he
> master branch.

Can you tell me what commit does fix this CVE on the 3.51.3 tag? I don't se=
e it.

Regards,

> I=E2=80=99ve already submitted backport patches for the whinlatter and sc=
arthgap
> branches. Please let me know if anything further is needed.
>
> Thanks & Regards,
>
> Vijay
>
>
> On Sat, Apr 4, 2026 at 4:23=E2=80=AFAM Yoann Congal <yoann.congal@smile.f=
r> wrote:
>
>> On Thu Apr 2, 2026 at 9:15 AM CEST, Vijay Anusuri via
>> lists.openembedded.org wrote:
>> > From: Vijay Anusuri <vanusuri@mvista.com>
>> >
>> > Pick patch as per [1]
>> >
>> > [1] https://sqlite.org/src/info/3d459f1fb1bd1b5e
>> > [2] https://sqlite.org/forum/forumpost/761eac3c82
>> > [3] https://gist.github.com/cnwangjihe/f496393f30f5ecec5b18c8f5ab07205=
4
>> >
>> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> > ---
>>
>> Hello,
>>
>> As far as I can tell, this CVE applies to master. Since this is the end
>> of kirkstone soon, I'll take it into the reviews series but can only
>> merge it if there is a patch sent for this CVE in those branches.
>>
>> Regards,
>>
>> >  .../sqlite/files/CVE-2025-70873.patch         | 33 ++++++++++++++++++=
+
>> >  meta/recipes-support/sqlite/sqlite3_3.38.5.bb |  1 +
>> >  2 files changed, 34 insertions(+)
>> >  create mode 100644
>> meta/recipes-support/sqlite/files/CVE-2025-70873.patch
>> >
>> > diff --git a/meta/recipes-support/sqlite/files/CVE-2025-70873.patch
>> b/meta/recipes-support/sqlite/files/CVE-2025-70873.patch
>> > new file mode 100644
>> > index 0000000000..86004c0b74
>> > --- /dev/null
>> > +++ b/meta/recipes-support/sqlite/files/CVE-2025-70873.patch
>> > @@ -0,0 +1,33 @@
>> > +From 5a05c59d4d75c03f23d5fb70feac9f789954bf8a Mon Sep 17 00:00:00 200=
1
>> > +From: drh <>
>> > +Date: Sat, 6 Dec 2025 20:41:24 +0000
>> > +Subject: [PATCH] In the zipfile extension, only return as many bytes =
as
>> > + Inflate actually generated.  [forum:/forumpost/761eac3c82|Forum post
>> > + 761eac3c82]. Adjust ./configure so that it builds zipfile into
>> testfixture if
>> > + ZLIB is available, so that tests get run on unix platforms.
>> > +
>> > +FossilOrigin-Name:
>> 3d459f1fb1bd1b5e723629c463ab392af7b206ece3388bda216c6a4c26160909
>> > +
>> > +Upstream-Status: Backport [
>> https://github.com/sqlite/sqlite/commit/5a05c59d4d75c03f23d5fb70feac9f78=
9954bf8a
>> ]
>> > +CVE: CVE-2025-70873
>> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> > +---
>> > + shell.c | 2 +-
>> > + 1 file changed, 1 insertion(+), 1 deletion(-)
>> > +
>> > +diff --git a/shell.c b/shell.c
>> > +index fa45d40..3c4902c 100644
>> > +--- a/shell.c
>> > ++++ b/shell.c
>> > +@@ -7668,7 +7668,7 @@ static void zipfileInflate(
>> > +       if( err!=3DZ_STREAM_END ){
>> > +         zipfileCtxErrorMsg(pCtx, "inflate() failed (%d)", err);
>> > +       }else{
>> > +-        sqlite3_result_blob(pCtx, aRes, nOut, zipfileFree);
>> > ++        sqlite3_result_blob(pCtx, aRes, (int)str.total_out,
>> zipfileFree);
>> > +         aRes =3D 0;
>> > +       }
>> > +     }
>> > +--
>> > +2.25.1
>> > +
>> > diff --git a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
>> b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
>> > index acdd80022e..9e10caa399 100644
>> > --- a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
>> > +++ b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
>> > @@ -10,6 +10,7 @@ SRC_URI =3D "
>> http://www.sqlite.org/2022/sqlite-autoconf-${SQLITE_PV}.tar.gz \
>> >             file://CVE-2023-7104.patch \
>> >             file://CVE-2025-29088.patch \
>> >             file://CVE-2025-6965.patch \
>> > +           file://CVE-2025-70873.patch \
>> >             "
>> >  SRC_URI[sha256sum] =3D
>> "5af07de982ba658fd91a03170c945f99c971f6955bc79df3266544373e39869c"
>> >
>>
>>
>> --
>> Yoann Congal
>> Smile ECS
>>
>>


--=20
Yoann Congal
Smile ECS


