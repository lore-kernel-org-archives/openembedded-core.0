Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D63ABC3A5A7
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 01:30:26 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.4093.1670376621883588584
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Dec 2022 17:30:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=2m48Hr/1;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.41, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f41.google.com with SMTP id s5so22806467edc.12
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Dec 2022 17:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ja3zFpZNzcOv1U/zcHV8ISJcwpQc9ZXVR/hfpSiK48w=;
        b=2m48Hr/1gBFKnQc42h9hUcxJmM6rQf3UeXUecWzUGd0icmwfktKwvJEs/dvU2XNG2t
         EWKhi9BvrIgWhXZ/6E8MKClpKeAMXc/GmHPtu5PkJ+cG2qOQ4JhF0o0d6IHZ1f3Rd7+m
         9uCCHapsHws0pDaRsh4ecQwqBACkQhF4EVFkyOsS6HbgR729kKu7ejVw2EAcxbwGcSB2
         iJz6rxxrr4NPUwh7AGzbjjwGIG+gPUArMd62Ftq1/+ITYXFHfwMShDU2yfPlY496PAlb
         WxJv2/iO2XTp9IroJtmkOR51LGPTFW3GTnx0D4CXjeh1yPuYgyiAALIKyoR9uMD59UKI
         wZrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ja3zFpZNzcOv1U/zcHV8ISJcwpQc9ZXVR/hfpSiK48w=;
        b=6uShxSm33U6/eFr0wNOE9dclSnl+8GsZLllUB0edBkqEkJ+Vyq8tBEHwOIvKI+NF0U
         2Bnj/39TcMona9lHQvGY4FI0FvZbPRnOZanAvvf27fZxa7ZLYQcsahdj3ummyt7eL5ms
         Uh7w++x3kRwXghh6x6mmiZVygcn+kFnNAm+Wymfsu9zA+S+mio3cTZHFGSRUujboN0xR
         20Rmpr2MxaMSje1qGD5YCkwGVmibfNqECGvAmdIXPgT/mnkx7znNKCT7GQBl/cSB/POK
         FKPKUgetGrWMC/XVuYnko8FmipI3n6kU7jmzIQ0KXMdToyY45UdZ+sSjmfyJItmsxODV
         2YtQ==
X-Gm-Message-State: ANoB5plVrt++tfi0ZG55LE4O1FZt/eI04KOP0zkGPVBzffn2qtHa1eKf
	Dwzs+GGZKW/kd+UILqhUtkjRV98rbkP4m74XHnSf+A==
X-Google-Smtp-Source: AA0mqf6ih8jQi61U226nrII+xUXAwgRU1RhD/mitZm44FnmjuB/gBzSWiEMnTzlLREMFp6XWHRAQgQutbmSa4tMFr+4=
X-Received: by 2002:aa7:dbca:0:b0:458:3f65:4e42 with SMTP id
 v10-20020aa7dbca000000b004583f654e42mr79973315edt.39.1670376619991; Tue, 06
 Dec 2022 17:30:19 -0800 (PST)
MIME-Version: 1.0
References: <1728EE7C5FA3921A.29986@lists.openembedded.org> <27c5bd08-7160-0ce6-fdaf-38f73d7086fa@windriver.com>
In-Reply-To: <27c5bd08-7160-0ce6-fdaf-38f73d7086fa@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 6 Dec 2022 15:30:08 -1000
Message-ID: <CAOSpxdZPy33xVg8udXa3P_K-KvL9773Aj7+_bwDH+cb3agT9mA@mail.gmail.com>
Subject: Re: [OE-Core][Kirkstone][PATCH] sysstat: fix CVE-2022-39377
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Dec 2022 01:30:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174340

On Tue, Dec 6, 2022 at 3:02 PM Xiangyu Chen
<xiangyu.chen@eng.windriver.com> wrote:
>
> Friendly ping.

Not sure how I missed this!  I've got it now.

Thanks,

Steve

> On 11/19/22 16:17, Xiangyu Chen wrote:
> > Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> > ---
> >   .../sysstat/sysstat/CVE-2022-39377.patch      | 93 +++++++++++++++++++
> >   .../sysstat/sysstat_12.4.5.bb                 |  3 +-
> >   2 files changed, 95 insertions(+), 1 deletion(-)
> >   create mode 100644 meta/recipes-extended/sysstat/sysstat/CVE-2022-39377.patch
> >
> > diff --git a/meta/recipes-extended/sysstat/sysstat/CVE-2022-39377.patch b/meta/recipes-extended/sysstat/sysstat/CVE-2022-39377.patch
> > new file mode 100644
> > index 0000000000..dce7b0d61f
> > --- /dev/null
> > +++ b/meta/recipes-extended/sysstat/sysstat/CVE-2022-39377.patch
> > @@ -0,0 +1,93 @@
> > +From 9c4eaf150662ad40607923389d4519bc83b93540 Mon Sep 17 00:00:00 2001
> > +From: Sebastien <seb@fedora-2.home>
> > +Date: Sat, 15 Oct 2022 14:24:22 +0200
> > +Subject: [PATCH] Fix size_t overflow in sa_common.c (GHSL-2022-074)
> > +
> > +allocate_structures function located in sa_common.c insufficiently
> > +checks bounds before arithmetic multiplication allowing for an
> > +overflow in the size allocated for the buffer representing system
> > +activities.
> > +
> > +This patch checks that the post-multiplied value is not greater than
> > +UINT_MAX.
> > +
> > +Signed-off-by: Sebastien <seb@fedora-2.home>
> > +
> > +Upstream-Status: Backport from
> > +[https://github.com/sysstat/sysstat/commit/a953ee3307d51255cc96e1f211882e97f795eed9]
> > +
> > +Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> > +---
> > + common.c    | 25 +++++++++++++++++++++++++
> > + common.h    |  2 ++
> > + sa_common.c |  6 ++++++
> > + 3 files changed, 33 insertions(+)
> > +
> > +diff --git a/common.c b/common.c
> > +index 81c7762..1a84b05 100644
> > +--- a/common.c
> > ++++ b/common.c
> > +@@ -1655,4 +1655,29 @@ int parse_values(char *strargv, unsigned char bitmap[], int max_val, const char
> > +
> > +     return 0;
> > + }
> > ++
> > ++/*
> > ++ ***************************************************************************
> > ++ * Check if the multiplication of the 3 values may be greater than UINT_MAX.
> > ++ *
> > ++ * IN:
> > ++ * @val1    First value.
> > ++ * @val2    Second value.
> > ++ * @val3    Third value.
> > ++ ***************************************************************************
> > ++ */
> > ++void check_overflow(size_t val1, size_t val2, size_t val3)
> > ++{
> > ++    if ((unsigned long long) val1 *
> > ++        (unsigned long long) val2 *
> > ++        (unsigned long long) val3 > UINT_MAX) {
> > ++#ifdef DEBUG
> > ++            fprintf(stderr, "%s: Overflow detected (%llu). Aborting...\n",
> > ++                    __FUNCTION__,
> > ++                    (unsigned long long) val1 * (unsigned long long) val2 * (unsigned long long) val3);
> > ++#endif
> > ++    exit(4);
> > ++    }
> > ++}
> > ++
> > + #endif /* SOURCE_SADC undefined */
> > +diff --git a/common.h b/common.h
> > +index 55b6657..e8ab98a 100644
> > +--- a/common.h
> > ++++ b/common.h
> > +@@ -260,6 +260,8 @@ int check_dir
> > +     (char *);
> > +
> > + #ifndef SOURCE_SADC
> > ++void check_overflow
> > ++    (size_t, size_t, size_t);
> > + int count_bits
> > +     (void *, int);
> > + int count_csvalues
> > +diff --git a/sa_common.c b/sa_common.c
> > +index 3699a84..b2cec4a 100644
> > +--- a/sa_common.c
> > ++++ b/sa_common.c
> > +@@ -459,7 +459,13 @@ void allocate_structures(struct activity *act[])
> > +     int i, j;
> > +
> > +     for (i = 0; i < NR_ACT; i++) {
> > ++
> > +             if (act[i]->nr_ini > 0) {
> > ++
> > ++                    /* Look for a possible overflow */
> > ++                    check_overflow((size_t) act[i]->msize, (size_t) act[i]->nr_ini,
> > ++                                   (size_t) act[i]->nr2);
> > ++
> > +                     for (j = 0; j < 3; j++) {
> > +                             SREALLOC(act[i]->buf[j], void,
> > +                                             (size_t) act[i]->msize * (size_t) act[i]->nr_ini * (size_t) act[i]->nr2);
> > +--
> > +2.34.1
> > +
> > diff --git a/meta/recipes-extended/sysstat/sysstat_12.4.5.bb b/meta/recipes-extended/sysstat/sysstat_12.4.5.bb
> > index fe3db4d8a5..3a3d1fb6ba 100644
> > --- a/meta/recipes-extended/sysstat/sysstat_12.4.5.bb
> > +++ b/meta/recipes-extended/sysstat/sysstat_12.4.5.bb
> > @@ -2,6 +2,7 @@ require sysstat.inc
> >
> >   LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
> >
> > -SRC_URI += "file://0001-configure.in-remove-check-for-chkconfig.patch"
> > +SRC_URI += "file://0001-configure.in-remove-check-for-chkconfig.patch \
> > +           file://CVE-2022-39377.patch"
> >
> >   SRC_URI[sha256sum] = "ef445acea301bbb996e410842f6290a8d049e884d4868cfef7e85dc04b7eee5b"
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#173512): https://lists.openembedded.org/g/openembedded-core/message/173512
> > Mute This Topic: https://lists.openembedded.org/mt/95129830/7175143
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [xiangyu.chen@eng.windriver.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

