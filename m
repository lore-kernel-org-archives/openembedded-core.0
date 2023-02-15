Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D6E8C636CC
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 21:06:43 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web10.5101.1676495202176387492
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 13:06:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=T0YQviWV;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id r28so17029892oiw.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 13:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IY6jAEOZaWVkj/20UD6nRMIuSniOXjuFgELkMQcmwSM=;
        b=T0YQviWVPimw8rJQmkv8FLv9uACSRhtfs7B1fZUQaahAj83s6dfo42tMTIz58gKOJ1
         NIfwGM+juLSd25WEBJiQALIFkHHjzXYXC+8l5BNq4Bur1QHllXF+PYZmWzUCrIXBBh2b
         84qSpXem3tL2i18fqKsGrY2eMsuNsS63LhBwT4VIwer4k4GVqHa4tlbZs4m/A3KeMM7X
         w7K6w9gTkUz2T48Dmz6u4eo2l/Q0w0QQfvbPmwPLsBS/Y5HEq0GzY+oGfhnddciXuIZB
         UQ7pT6lU/VT5R9v/pt73OtsGP3rfRW9LRHffwzVoPo7yP747E7FT9gerP/pdjIAKZkyZ
         0D9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IY6jAEOZaWVkj/20UD6nRMIuSniOXjuFgELkMQcmwSM=;
        b=jLYIRugM+4KdQmpW3WW7v3aJlMx0Jty9AkwlAi2nQA/5SdNHyjbH+7vWmJ4O1jJyP8
         dVKXWE1ZX8ltYHAfBjMPCLYY0g7OiP4cKsqADNX02Eff5aQKRvIXks+isV59uHWTodze
         ynaJN8ZU4x2DcWLh3LSbuAZUNUXgYNdr+aEuEUxQly8cRweXZWZNE8lUVzfZZWUdyyKo
         UOO+2FjgLtjIMVVQNuziXJzg4JA/09xrMp4c7WjE3hMDZUSggZ1zoK7FVEN6q7ePJbL4
         6SVs9n5KlfYwz4UOqP36V2Kjrr5YcG2qa2ZPLbdxBXMUfCtMG4KkHEO0QmnTZlR8e3TL
         fqaQ==
X-Gm-Message-State: AO0yUKUQ2OK8U6nq3FdyZTtqNnEck9R1eZVk7FXGB7odVIj7+d2cWLf/
	F0Oj5/vqvddauObvgr+OGu6l+09dA/DSgp2iNgYWxAit
X-Google-Smtp-Source: AK7set+FLUJG7bsydRGRfVnDEIpj+92XiNNMTx5jfkzehOLEjk7/YLJ75QyxeljemeSlNsN2vD6ScMgc5ow8tGiBcmY=
X-Received: by 2002:a05:6808:19a8:b0:37b:592b:ec39 with SMTP id
 bj40-20020a05680819a800b0037b592bec39mr345533oib.262.1676495201265; Wed, 15
 Feb 2023 13:06:41 -0800 (PST)
MIME-Version: 1.0
References: <20230215171832.635085-1-Martin.Jansa@gmail.com>
 <CAMKF1spS64yaiNdALD5hGKWqH=aOLPrfa1JzCYPoDOpRHpecdQ@mail.gmail.com>
 <CAMKF1sp6qoGq3tqgs7V8qthxv7cW2iVav8w21za3OrKTxjvEjA@mail.gmail.com> <CA+chaQdfJsKcc5aXp44QF1Uu+6YDRBnuTVfUQ0Tm2v7=WxFhJg@mail.gmail.com>
In-Reply-To: <CA+chaQdfJsKcc5aXp44QF1Uu+6YDRBnuTVfUQ0Tm2v7=WxFhJg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 15 Feb 2023 13:06:15 -0800
Message-ID: <CAMKF1sroOJ3F1_Ye1EiMwTJr38hjV4HYF61yVk_t1k+vQBFyzg@mail.gmail.com>
Subject: Re: [OE-core] [RFC][PATCH] libssh2: Update patch to apply and fix
 malformed Upstream-Status
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com, 
	changqing.li@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 21:06:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177216

On Wed, Feb 15, 2023 at 12:46 PM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> patchreview.py will care about the space (like insane.bbclass does) if https://lists.openembedded.org/g/openembedded-core/message/177207 is merged
>

I see. thanks. I think this should be something every developer should
then be able to run on the patchset they are about to post for review.
Otherwise, it just
add on to upstreaming friction that developer experiences and it won't scale.

> On Wed, Feb 15, 2023 at 9:35 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Wed, Feb 15, 2023 at 11:26 AM Khem Raj <raj.khem@gmail.com> wrote:
>> >
>> > On Wed, Feb 15, 2023 at 9:18 AM Martin Jansa <Martin.Jansa@gmail.com> wrote:
>> > >
>> > > * I've noticed this, because patchreview.py reports Malformed
>> > >   Upstream-Status in this one now, but the QA check in insane.bbclass
>> > >   wasn't reporting it before
>> > >
>> > > * the reason why insane.bbclass doesn't report it is because:
>> > >   SRC_URI:append:ptest = " file://0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch"
>> > >   doesn't work and probably never did as "ptest" is not an override
>> > >   and patch-status-core checks only the .patch files which are really
>> > >   in SRC_URI.
>> > >
>> > > * I've added it directly to SRC_URI and it also didn't apply:
>> > >   http://errors.yoctoproject.org/Errors/Details/689955/
>> > >   as the "endif" at the end was removed in 1.10.0 version:
>> > >   https://github.com/libssh2/libssh2/commit/ecd6a74e44562797a1e92186ad4a402c5641720e#diff-32103f666ff2fb42b025a47ccf1b959bbcc6db89f217e5943b1de73c81a4f9db
>> > >
>> > >   after updating the patch to apply I got expected patch-status-core failure:
>> > >   http://errors.yoctoproject.org/Errors/Details/689956/
>> > >   ERROR: QA Issue: Malformed Upstream-Status in patch
>> > >   TOPDIR/openembedded-core/meta/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch
>> > >   Please correct according to https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations:_Upstream-Status :
>> > >   Upstream-Status: Inappropriate[oe specific] [patch-status-core]
>> > >
>> > > * so the mystery is solved, but what should be do with this never-used
>> > >   patch, I think we should just delete it together with
>> > >   SRC_URI:append:ptest, but please Changqing Li confirm it's not needed
>> > >
>> > > * it was originally added by Changqing Li in meta-oe with:
>> > >   https://git.openembedded.org/meta-openembedded/commit/?id=d7aa7173405c3b36235af736cd31dbe110708787
>> > >   then imported to oe-core by Randy MacLeod with:
>> > >   https://git.openembedded.org/openembedded-core/commit/?id=57df134b1be56a688f41851e5ff014dd859c0bc3
>> > >
>> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> > > ---
>> > >  ...nviroment-to-decide-if-a-test-is-bui.patch | 22 ++++++-------------
>> > >  1 file changed, 7 insertions(+), 15 deletions(-)
>> > >
>> > > diff --git a/meta/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch b/meta/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch
>> > > index b1204e49eb..e0000b2658 100644
>> > > --- a/meta/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch
>> > > +++ b/meta/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch
>> > > @@ -1,24 +1,23 @@
>> > > -From f6abce5ba41a412a247250dcd80e387e53474466 Mon Sep 17 00:00:00 2001
>> > > -From: Your Name <you@example.com>
>> > > +From 7ffa1773be8d262bed0f5c8bdcb4dd8f906de095 Mon Sep 17 00:00:00 2001
>> > > +From: Changqing Li <changqing.li@windriver.com>
>> > >  Date: Mon, 28 Dec 2020 02:08:03 +0000
>> > >  Subject: [PATCH] Don't let host enviroment to decide if a test is build
>> > >
>> > >  test ssh2.sh need sshd, for cross compile, we need it on target, so
>> > >  don't use SSHD on host to decide weither to build a test
>> > >
>> > > -Upstream-Status: Inappropriate[oe specific]
>> > > +Upstream-Status: Inappropriate [oe specific]
>> >
>> > Since we are already using a special token '[' to separate reason from
>> > status, I always wondered if having this space before '[' is something
>> > that could be ignored.
>> >
>>
>> I see that scripts/contrib/patchreview.py does not care for space,
>> that answers my question. Maybe it would be
>> good to tabulate reason as well perhaps.
>>
>> > >
>> > >  Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> > > -
>> > >  ---
>> > > - tests/Makefile.am | 6 +-----
>> > > - 1 file changed, 1 insertion(+), 5 deletions(-)
>> > > + tests/Makefile.am | 4 ----
>> > > + 1 file changed, 4 deletions(-)
>> > >
>> > >  diff --git a/tests/Makefile.am b/tests/Makefile.am
>> > > -index dc0922f..6cbc35d 100644
>> > > +index 27ddc2d..13de8ab 100644
>> > >  --- a/tests/Makefile.am
>> > >  +++ b/tests/Makefile.am
>> > > -@@ -1,16 +1,12 @@
>> > > +@@ -3,16 +3,12 @@ SUBDIRS = ossfuzz
>> > >   AM_CPPFLAGS = -I$(top_srcdir)/src -I$(top_srcdir)/include -I$(top_builddir)/src
>> > >   LDADD = ../src/libssh2.la
>> > >
>> > > @@ -35,10 +34,3 @@ index dc0922f..6cbc35d 100644
>> > >   check_PROGRAMS = $(ctests)
>> > >
>> > >   TESTS_ENVIRONMENT = SSHD=$(SSHD) EXEEXT=$(EXEEXT)
>> > > -@@ -38,4 +34,4 @@ if OPENSSL
>> > > - # EXTRA_DIST += test_public_key_auth_succeeds_with_correct_encrypted_ed25519_key.c
>> > > - # EXTRA_DIST += test_public_key_auth_succeeds_with_correct_ed25519_key_from_mem.c
>> > > - EXTRA_DIST += test_public_key_auth_succeeds_with_correct_rsa_openssh_key.c
>> > > --endif
>> > > -\ No newline at end of file
>> > > -+endif
>> > > --
>> > > 2.39.2
>> > >
>> > >
>> > > -=-=-=-=-=-=-=-=-=-=-=-
>> > > Links: You receive all messages sent to this group.
>> > > View/Reply Online (#177204): https://lists.openembedded.org/g/openembedded-core/message/177204
>> > > Mute This Topic: https://lists.openembedded.org/mt/96987532/1997914
>> > > Group Owner: openembedded-core+owner@lists.openembedded.org
>> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
>> > > -=-=-=-=-=-=-=-=-=-=-=-
>> > >

