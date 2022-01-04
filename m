Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02704C433EF
	for <webhook@archiver.kernel.org>; Tue,  4 Jan 2022 09:31:55 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web12.4550.1641288713454824104
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jan 2022 01:31:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OvxRaRcd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id
 v10-20020a05600c214a00b00345e59928eeso15798423wml.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jan 2022 01:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=KtZSiVNEIr92USQggi9BEoQJTm9TMJxPzu0VqkqTbOU=;
        b=OvxRaRcdv21z9ck8L5d47VkzBCW/+ffjMJoyZgU2dK7v6N7vYZuolAQG15IYtH4I11
         y44jG/RD/CzPhfRaTGwi43Ccc1j4UmUDpw9kpWGFwBPDeC6xHOBc4Gkhyw2AtGTk1LeV
         mZ5uetB61aH3VTkxRvPIE3tax5t0pUSKYz9kk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=KtZSiVNEIr92USQggi9BEoQJTm9TMJxPzu0VqkqTbOU=;
        b=5Q9sZDl/g/NT1zqcACQyaR+Em4LSHWJEQmbrA9l9ruGvhWfOshVkxK8yQlfoUvia3k
         rD6vf6uP7bRTkSGVsGF3S7BcwFiTI6uk8yKXqFgGUaVxOW17SOOSiTqcB/StjsuHfuuo
         3aztqYKqxMG2n2ZlZhHjo5+EmYh7MHApwrFRfp65YUZaTqqD2fA5wQlfX8Jv2oV1IFbr
         h7UyKvxHeNH//TppyzYsujusyrSrCo0VkIbs3tsCfhjb1sUqIaKNGUiqjCw14YLjLj1D
         NBXTHINBXAEv5/eL07O0g3c7aHNKHo/xND2V9Nso1wnvxMmNRB45AbCAzb8aHDlpau/d
         iLcw==
X-Gm-Message-State: AOAM530Vr4HHGH+jMbGMtgFmhAexhtq37fahcDhdGLwFUKo3tPk1y0K6
	NWhCv9EDBxghcDD1jtTvncBljpwTL/X0Og==
X-Google-Smtp-Source: 
 ABdhPJwxM7Miawz9sKCcTxCAlSQLYrsp+CZl3DbLWocEgPlQDUTfdWjjejvYtEitHJjLs1u4hVvqHA==
X-Received: by 2002:a7b:c745:: with SMTP id w5mr40440860wmk.167.1641288712096;
        Tue, 04 Jan 2022 01:31:52 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:da22:f51:54c3:4a4f?
 ([2001:8b0:aba:5f3c:da22:f51:54c3:4a4f])
        by smtp.gmail.com with ESMTPSA id
 m35sm75105865wms.1.2022.01.04.01.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jan 2022 01:31:51 -0800 (PST)
Message-ID: 
 <1bf471a6cbf96644c183735e06f4594a5acadd71.camel@linuxfoundation.org>
Subject: Re: [OE-core] [V3][PATCH] rpm: fix CVE-2021-3521
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Changqing Li <changqing.li@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 04 Jan 2022 09:31:51 +0000
In-Reply-To: <5119f0f4-ccf3-60c6-8d35-b301a0f8a499@windriver.com>
References: <20211231022140.33421-1-changqing.li@windriver.com>
	 <6d4b04f6048055fe85d131679cbfcfda33a97035.camel@linuxfoundation.org>
	 <5119f0f4-ccf3-60c6-8d35-b301a0f8a499@windriver.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jan 2022 09:31:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160159

On Tue, 2022-01-04 at 09:48 +0800, Changqing Li wrote:
> On 12/31/21 11:38 PM, Richard Purdie wrote:
> > [Please note: This e-mail is from an EXTERNAL e-mail address]
> > 
> > On Fri, 2021-12-31 at 10:21 +0800, Changqing Li wrote:
> > > From: Changqing Li <changqing.li@windriver.com>
> > > 
> > > Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > > ---
> > >   .../rpm/files/0001-CVE-2021-3521.patch        |  57 +++
> > >   .../rpm/files/0002-CVE-2021-3521.patch        |  64 ++++
> > >   .../rpm/files/0003-CVE-2021-3521.patch        | 329 ++++++++++++++++++
> > >   meta/recipes-devtools/rpm/rpm_4.17.0.bb       |   3 +
> > >   4 files changed, 453 insertions(+)
> > >   create mode 100644 meta/recipes-devtools/rpm/files/0001-CVE-2021-3521.patch
> > >   create mode 100644 meta/recipes-devtools/rpm/files/0002-CVE-2021-3521.patch
> > >   create mode 100644 meta/recipes-devtools/rpm/files/0003-CVE-2021-3521.patch
> > > 
> > > diff --git a/meta/recipes-devtools/rpm/files/0001-CVE-2021-3521.patch b/meta/recipes-devtools/rpm/files/0001-CVE-2021-3521.patch
> > > new file mode 100644
> > > index 0000000000..b374583017
> > > --- /dev/null
> > > +++ b/meta/recipes-devtools/rpm/files/0001-CVE-2021-3521.patch
> > > @@ -0,0 +1,57 @@
> > > +From 9a6871126f472feea057d5f803505ec8cc78f083 Mon Sep 17 00:00:00 2001
> > > +From: Panu Matilainen <pmatilai@redhat.com>
> > > +Date: Thu, 30 Sep 2021 09:56:20 +0300
> > > +Subject: [PATCH 1/3] Refactor pgpDigParams construction to helper function
> > > +
> > > +No functional changes, just to reduce code duplication and needed by
> > > +the following commits.
> > > +
> > > +CVE: CVE-2021-3521
> > > +Upstream-Status: Backport[https://github.com/rpm-software-management/rpm/commit/9f03f42e2]
> > > +
> > > +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > > +---
> > > + rpmio/rpmpgp.c | 13 +++++++++----
> > > + 1 file changed, 9 insertions(+), 4 deletions(-)
> > > +
> > > +diff --git a/rpmio/rpmpgp.c b/rpmio/rpmpgp.c
> > > +index d0688ebe9a..e472b5320f 100644
> > > +--- a/rpmio/rpmpgp.c
> > > ++++ b/rpmio/rpmpgp.c
> > > +@@ -1041,6 +1041,13 @@ unsigned int pgpDigParamsAlgo(pgpDigParams digp, unsigned int algotype)
> > > +     return algo;
> > > + }
> > > +
> > > ++static pgpDigParams pgpDigParamsNew(uint8_t tag)
> > > ++{
> > > ++    pgpDigParams digp = xcalloc(1, sizeof(*digp));
> > > ++    digp->tag = tag;
> > > ++    return digp;
> > > ++}
> > > ++
> > > + int pgpPrtParams(const uint8_t * pkts, size_t pktlen, unsigned int pkttype,
> > > +              pgpDigParams * ret)
> > > + {
> > > +@@ -1058,8 +1065,7 @@ int pgpPrtParams(const uint8_t * pkts, size_t pktlen, unsigned int pkttype,
> > > +         if (pkttype && pkt.tag != pkttype) {
> > > +             break;
> > > +         } else {
> > > +-            digp = xcalloc(1, sizeof(*digp));
> > > +-            digp->tag = pkt.tag;
> > > ++            digp = pgpDigParamsNew(pkt.tag);
> > > +         }
> > > +     }
> > > +
> > > +@@ -1105,8 +1111,7 @@ int pgpPrtParamsSubkeys(const uint8_t *pkts, size_t pktlen,
> > > +             digps = xrealloc(digps, alloced * sizeof(*digps));
> > > +         }
> > > +
> > > +-        digps[count] = xcalloc(1, sizeof(**digps));
> > > +-        digps[count]->tag = PGPTAG_PUBLIC_SUBKEY;
> > > ++        digps[count] = pgpDigParamsNew(PGPTAG_PUBLIC_SUBKEY);
> > > +         /* Copy UID from main key to subkey */
> > > +         digps[count]->userid = xstrdup(mainkey->userid);
> > > +
> > > +--
> > > +2.17.1
> > > +
> > > diff --git a/meta/recipes-devtools/rpm/files/0002-CVE-2021-3521.patch b/meta/recipes-devtools/rpm/files/0002-CVE-2021-3521.patch
> > > new file mode 100644
> > > index 0000000000..b93a1d5404
> > > --- /dev/null
> > > +++ b/meta/recipes-devtools/rpm/files/0002-CVE-2021-3521.patch
> > > @@ -0,0 +1,64 @@
> > > +From c4b1bee51bbdd732b94b431a951481af99117703 Mon Sep 17 00:00:00 2001
> > > +From: Panu Matilainen <pmatilai@redhat.com>
> > > +Date: Thu, 30 Sep 2021 09:51:10 +0300
> > > +Subject: [PATCH 2/3] Process MPI's from all kinds of signatures
> > > +
> > > +No immediate effect but needed by the following commits.
> > > +
> > > +CVE: CVE-2021-3521
> > > +Upstream-Status: Backport[https://github.com/rpm-software-management/rpm/commit/b5e8bc74b]
> > > +
> > The new tests also trigger for the missing space above after Backport. It does
> > make me wonder why you don't see those test failures. I've tweaked the patches
> > in master-next to fix this.
> Thanks.
> 
> I don't receive mail about the failure, seems the patchwork is not working.

You should have seen the error when you tried building/testing the patch
locally...

Cheers,

Richard



