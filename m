Return-Path: <yamane07ynct@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF8BFC83030
	for <webhook@archiver.kernel.org>; Sat,  5 Jul 2025 18:50:55 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web10.23092.1751741451475881750
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Jul 2025 11:50:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SQfoZYnh;
 spf=pass (domain: gmail.com, ip: 209.85.219.177, mailfrom: yamane07ynct@gmail.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e812fc35985so1519048276.0
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Jul 2025 11:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751741450; x=1752346250; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DO7Uh7v2yPt85G6pGeJzm0XcgacKiXxTx1swiVTfj28=;
        b=SQfoZYnhd0lqljhkb/M4W/L56lplC/XqtSUd3FfGVIi0sPXVJL0I9Lyf4T/C3Htf55
         4QXF7jMFciJvoLIs10u+oV5013F1ycYyPJMlf4VEyKZ2E1j403av9BXoiIdFs+tav75+
         iFSiMpbh4U6z04clQZPPvB0ZlxGt+W+ISWnAJvjrF9ca0PtoaD6sgfdQzg+DWmTG+tyv
         uxAGUCbG5qsla5D/hjNWfycJlH9Q5n3FEWeYy2n4aiFtkV4GwaaQFJgPcQgzsiBG+1Zf
         gLxtxoDpdRWjGIHNVZjyrQjd5nto2F5L6W5a2oAPkd684E5rPRDHRys10fOIAk97rFZG
         sehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751741450; x=1752346250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DO7Uh7v2yPt85G6pGeJzm0XcgacKiXxTx1swiVTfj28=;
        b=rc6ATuSBbgCxdzIvAWFJN6N3dyQNP1ppsK02SmisMemljdYqCmUZvH+NfNXwqDh8dO
         tcx9vIR0N0J2ePFu54WnxCm+lFmUJnTlKAUKZHd4Ymbd/ezejSuB4NZzeyK4m6++Y8Aa
         dsxnkaRHvZWv+rqYYOpE9BmTwAph3j7lJL80vKvtpSubEAetfFOASbkKmtkiAWcZFFJ7
         43N+b1xjNQ5IF7Ztmc2vuXhNffJBf2yKfcARhYEVP6ingXJ8hj1l1mIduxS76UF78gc8
         hCaTdj6QBdeSM2iK+hB6vSG9tYWeGarXExpu/DkGwQdr41pVCCAEcYUTkyTpCzX46bp0
         gCdg==
X-Gm-Message-State: AOJu0YwcVWlQasZq5X97eg6WaGIUNKf7XFXlnlBwMgjVRPv8bcoJy08b
	xZzfKzQ7D/gmoe7HJBgqS063XbXeSYoqiwOkIMEqizRLjYOWuDAMppECAiYfp18ScajOCQ3t48D
	G4qNnM8hPu1TBIAk645ymeiHhuPNwkLA=
X-Gm-Gg: ASbGnct81gxIvK9y8+vpsoseTdq5Cpv3u2Fsj8bsKEWGaP8iQF1AmZ3FkG8CnCtRdGT
	Mg9/aleyj8dR0isoVf4YoOFeDaq1YjBhBvae3L4TcuC1ljeHVi9PspUSj/mvxIyaUXcHGWqc+aL
	Z15/KC64RrlcPvY/TBoYwe4nAy2LfX+QdwUui8SwQuzQ==
X-Google-Smtp-Source: AGHT+IFoDBVQdjKH+oGnJ3/9bZHtv9jS7zeon3xxyl6r6N7VzhG7P2rKcPeD0JKyaby8WVWEqHD1yxOO3ML6rKeX7Hw=
X-Received: by 2002:a05:690c:610d:b0:712:e22d:a235 with SMTP id
 00721157ae682-7176ccaaa35mr39828267b3.17.1751741450317; Sat, 05 Jul 2025
 11:50:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250704053856.2446627-1-yamane07ynct@gmail.com> <CANNYZj80ZOUN4F6L6ypWRJFC0OX_6GYqkDEYyq3KV5nCXgaYag@mail.gmail.com>
In-Reply-To: <CANNYZj80ZOUN4F6L6ypWRJFC0OX_6GYqkDEYyq3KV5nCXgaYag@mail.gmail.com>
From: Daisuke Yamane <yamane07ynct@gmail.com>
Date: Sun, 6 Jul 2025 03:50:14 +0900
X-Gm-Features: Ac12FXxoZZf5ISbwiJl7E7Bw_MdAwzIlNQ9YFWSBnkYLTZtdADIuv4Cu30YbbZ4
Message-ID: <CAHZ3=rrQfxdOo7sVz-P+-Fegi_i1VhvL=pVVrs7dHAi7K4cUdg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] icu: Add ptest support
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Jul 2025 18:50:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219958

2025=E5=B9=B47=E6=9C=884=E6=97=A5(=E9=87=91) 17:49 Alexander Kanavin <alex.=
kanavin@gmail.com>:
>
> On Fri, 4 Jul 2025 at 07:40, Daisuke Yamane via lists.openembedded.org
> <yamane07ynct=3Dgmail.com@lists.openembedded.org> wrote:
>
> > Add icu-ptest to PTERSTS_SLOW because it takes more than 30s to complet=
e
> > on qemuarm64.
>
> Was this on an arm64 host with kvm enabled in via runqemu option?
> Otherwise the measurement isn't correct, as it goes through software
> emulation and is a lot slower than the actual CI execution.
>
> If your host is x86_64, then you need to build for qemux86_64, and run
> that with kvm.

Enabling KVM on qemux86_64 and running ptest, the intltest test was
intrrupted due to oom-killer.
(I'm not sure why, but it seems that qemuarm64 didn't trigger the oom-kille=
r.)

|          TestBug22584 {
| [   30.217322] intltest invoked oom-killer:
| gfp_mask=3D0x140cca(GFP_HIGHUSER_MOVABLE|__GFP_COMP), order=3D0,
| oom_score_adj=3D0
| [   30.217717] CPU: 2 UID: 0 PID: 278 Comm: intltest Not tainted
| 6.12.31-yocto-standard #1
| [   30.217719] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009),
| BIOS rel-1.16.3-0-ga6ed6b701f0a-prebuilt.qemu.org 04/01/2014

Increasing the memory for qemux86_64 from 256MB to 512MB caused the
test to pass in 28 seconds.
In this case, should I add icu to PTESTS_PROBLEMS, or add a patch to
skip tests that fail and add icu to PTEST_FAST?

>
> > +#!/bin/sh
> > +
> > +TESTS=3D"intltest iotest cintltst"
> > +TMP=3D"$(mktemp -d)"
> > +STATUS_R=3D"${TMP}/status.$$"
> > +TOPDIR=3D$(dirname "$(realpath $0)")
> > +for t in ${TESTS}; do
> > +       cd ${TOPDIR}/test/$t
> > +       ./$t -E${STATUS_R}.$t || (echo "FAIL: $t"; touch ${STATUS_R}.$t=
; cp ${STATUS_R}.$t ${STATUS_R}.$t.FAIL)
> > +       [ ! -f ${STATUS_R}.$t.FAIL ] && touch ${STATUS_R}.$t.PASS && ec=
ho "PASS: $t"
> > +       echo "----------------------------------------"
> > +       if [ -s "${STATUS_R}.$t.FAIL" ];then
> > +               echo "-------------"
> > +               echo "| ***     FAILING TEST SUMMARY FOR:              =
$t"
> > +               cat ${STATUS_R}.$t.FAIL
> > +               echo "| *** END FAILING TEST SUMMARY FOR:              =
$t"
> > +       fi
> > +done
> > +
> > +goods=3D""
> > +bads=3D""
> > +for t in ${TESTS}; do
> > +       if [ -f "${STATUS_R}.$t.FAIL" ];then
> > +               bads=3D"${bads} $t"
> > +       elif [ -f "${STATUS_R}.$t.PASS" ];then
> > +               goods=3D"${goods} $t"
> > +       else
> > +               echo "*** subtest did not complete - $t"
> > +               bads=3D"${bads} $t"
> > +       fi
> > +done
> > +echo "ALL TESTS SUMMARY:"
> > +if [ ! "x${bads}" =3D "x" ];then
> > +       echo "ok: ${goods}"
> > +       echo "=3D=3D=3D=3D=3D ERRS: ${bads}"
> > +       exit 1
> > +else
> > +       echo "All tests OK: ${goods}"
> > +fi
>
> This is a direct copy-paste of the icu Makefile:
> https://github.com/unicode-org/icu/blob/main/icu4c/source/test/Makefile.i=
n
>
> I don't think it's necessary to make it this complicated (and
> potentially have to keep it in sync with the Makefile), we can perhaps
> just run the tests, and see what they print; if PASS/FAIL isn't there,
> then the script can add that.

Got it. In v2, I'll simplify the script so that it just confirms the result=
s.

>
> > +do_install_ptest() {
> > +    install -d ${D}${PTEST_PATH}/test
> > +    install -d ${D}${PTEST_PATH}/data
> > +    cp -r ${S}/test/testdata ${D}/${PTEST_PATH}/test
> > +    cp -r ${S}/data/unidata ${D}/${PTEST_PATH}/data/
> > +    cp -r ${S}/data/sprep ${D}/${PTEST_PATH}/data/
> > +    cp -r ${S}/../testdata ${D}/${PTEST_PATH}/
> > +    cp -r ${B}/test/testdata/out ${D}/${PTEST_PATH}/test/testdata
> > +
> > +    list=3D"intltest iotest cintltst"
> > +    for i in $list; do
> > +        install -d ${D}${PTEST_PATH}/test/${i}/
> > +        install -m 755 ${B}/test/${i}/${i} ${D}/${PTEST_PATH}/test/${i=
}/
> > +    done
> > +}
>
> The same Makefile linked above has a rule for installing the tests.
> Can that be used instead? Maybe it also installs some way to run them?
>
> In any case, do not hardcode the particular test names; that changes
> over time, and it's better to have some dynamic way of installing
> (e.g. by file name pattern or executable bit).

Indeed, there is an install rule in Makefile.in, but since no
installation process is actually implemented, it cannot be used.
In v2, I will detect executable binaries in the test directory and install =
them.

>
> Alex

