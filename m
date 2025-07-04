Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 566EDC83F03
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 08:49:46 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.8116.1751618975293143472
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jul 2025 01:49:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LD4laMZw;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6fd0a91ae98so5269236d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 01:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751618974; x=1752223774; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sVZ3dJ8pRT2c5mZWGrFYWpngEUAIZ3lkwfiY91FEj8w=;
        b=LD4laMZwhubmjrkKFnq2nYBfFdSQaAG4TQCVWy9ZkIaxdyYFJuUxffUArKfSqZcx4H
         UlGo0kGlfmzZTUffCEFTUeRNpnmcXOnCOUp8+IqStbp4WOHKh+nt7I1MF244tngFLOfL
         df2GvIrtorb8P20NgM+MH7XGmJLP2b4AXupZr/S/P/EfZxcVeWLbB1lpGn3L2+EPFFG1
         D+zvsqlC6cgA2Yo6lnd+gbfnhYo83xkmANeYtU7GaB1XCDUxYElZZX5pXP4+Fw4VvbGI
         6hVLgFwz2mYgjqKCYyO6qEdxw/gDNENesi4ZeZLObmgqruX6xPtV9WHnCwg2+1r7MmBL
         EfSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751618974; x=1752223774;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sVZ3dJ8pRT2c5mZWGrFYWpngEUAIZ3lkwfiY91FEj8w=;
        b=hFhlJL7STU2hvn10ZRuZ4l1mQR/hhyQ+TsM9GnJGralTcWPh4u9F3750D5suJOONKu
         zsSphS3VB3Dx0cbOhHLMVTJd5XFBOyQjWRuHzsLUZlWLDT6EHcGOUgMEn2SmZUj/eRBc
         mloGvtc5gQD/M017mXmDfAT3LJPn0s2L9n1lGO+ehvonNcWLKb4HP2XWFumLVVQipmBP
         ep8yiPYfF/+yi8NmL6XAnLGi7q4V1558fqKbX1iJPgHgB7bP/DVSj0W/KANowhgDAsph
         nw3GrMyXeRhLSFcXxjM/++rSohcX9ptWe+ubrzXYsQSbGDBzmfBr/+Ahk/YpdvwXqZl+
         s9Eg==
X-Gm-Message-State: AOJu0YxfLNiCZc/shUdKeZFi4qsjYYpIsWsgNXwz61pV/3/mKGm+jTxD
	WN0P7/aFKHsPNeJyqifxFYulTWKilecsm+j50KgUZmsSJpsh64WT6P6R+6z6Vp22h5Xiy+GKfS6
	xt/5vWkyqNfcd2ySLechKFEDf0aJ3xTU=
X-Gm-Gg: ASbGncvbvLRCusnnlCYJFRuuALUL+aTfqkzdsu9rjFAuwKRz0FBT+hbJoQsxMmHoZO6
	1xZAU+GG+UMWiAKUzfvULTtOi57l5eSK0RZbfBlic9WTS8Pymb4Yw6db6eyL/QKJEqdBK5VYhrH
	IXarTPmkLzYBwEHXmkIa3sNR6Rv+ZwU75kVoLhWsPGc7ivLuC94BUNLEEZ5r75ASZ4Bcukqv0oQ
	mSjNw==
X-Google-Smtp-Source: AGHT+IG2IrS/oZ8PFZJ4v9ci/2dPxbG8x4PHtGmi4/Y1ka4v3z13oU7DI27O0pWNaWwioDm8YX/vjYh5qbMH48BFowA=
X-Received: by 2002:a05:6214:5d90:b0:6fb:107:f618 with SMTP id
 6a1803df08f44-702c8ce6e7emr12489106d6.40.1751618974173; Fri, 04 Jul 2025
 01:49:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250704053856.2446627-1-yamane07ynct@gmail.com>
In-Reply-To: <20250704053856.2446627-1-yamane07ynct@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 4 Jul 2025 10:49:22 +0200
X-Gm-Features: Ac12FXxoIzOTLqr1NNCzp4u1vWZmcqMPPWe2pBqkM2Y5yembm07sxAcn8IAzFng
Message-ID: <CANNYZj80ZOUN4F6L6ypWRJFC0OX_6GYqkDEYyq3KV5nCXgaYag@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] icu: Add ptest support
To: yamane07ynct@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 08:49:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219904

On Fri, 4 Jul 2025 at 07:40, Daisuke Yamane via lists.openembedded.org
<yamane07ynct=gmail.com@lists.openembedded.org> wrote:

> Add icu-ptest to PTERSTS_SLOW because it takes more than 30s to complete
> on qemuarm64.

Was this on an arm64 host with kvm enabled in via runqemu option?
Otherwise the measurement isn't correct, as it goes through software
emulation and is a lot slower than the actual CI execution.

If your host is x86_64, then you need to build for qemux86_64, and run
that with kvm.

> +#!/bin/sh
> +
> +TESTS="intltest iotest cintltst"
> +TMP="$(mktemp -d)"
> +STATUS_R="${TMP}/status.$$"
> +TOPDIR=$(dirname "$(realpath $0)")
> +for t in ${TESTS}; do
> +       cd ${TOPDIR}/test/$t
> +       ./$t -E${STATUS_R}.$t || (echo "FAIL: $t"; touch ${STATUS_R}.$t; cp ${STATUS_R}.$t ${STATUS_R}.$t.FAIL)
> +       [ ! -f ${STATUS_R}.$t.FAIL ] && touch ${STATUS_R}.$t.PASS && echo "PASS: $t"
> +       echo "----------------------------------------"
> +       if [ -s "${STATUS_R}.$t.FAIL" ];then
> +               echo "-------------"
> +               echo "| ***     FAILING TEST SUMMARY FOR:              $t"
> +               cat ${STATUS_R}.$t.FAIL
> +               echo "| *** END FAILING TEST SUMMARY FOR:              $t"
> +       fi
> +done
> +
> +goods=""
> +bads=""
> +for t in ${TESTS}; do
> +       if [ -f "${STATUS_R}.$t.FAIL" ];then
> +               bads="${bads} $t"
> +       elif [ -f "${STATUS_R}.$t.PASS" ];then
> +               goods="${goods} $t"
> +       else
> +               echo "*** subtest did not complete - $t"
> +               bads="${bads} $t"
> +       fi
> +done
> +echo "ALL TESTS SUMMARY:"
> +if [ ! "x${bads}" = "x" ];then
> +       echo "ok: ${goods}"
> +       echo "===== ERRS: ${bads}"
> +       exit 1
> +else
> +       echo "All tests OK: ${goods}"
> +fi

This is a direct copy-paste of the icu Makefile:
https://github.com/unicode-org/icu/blob/main/icu4c/source/test/Makefile.in

I don't think it's necessary to make it this complicated (and
potentially have to keep it in sync with the Makefile), we can perhaps
just run the tests, and see what they print; if PASS/FAIL isn't there,
then the script can add that.

> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}/test
> +    install -d ${D}${PTEST_PATH}/data
> +    cp -r ${S}/test/testdata ${D}/${PTEST_PATH}/test
> +    cp -r ${S}/data/unidata ${D}/${PTEST_PATH}/data/
> +    cp -r ${S}/data/sprep ${D}/${PTEST_PATH}/data/
> +    cp -r ${S}/../testdata ${D}/${PTEST_PATH}/
> +    cp -r ${B}/test/testdata/out ${D}/${PTEST_PATH}/test/testdata
> +
> +    list="intltest iotest cintltst"
> +    for i in $list; do
> +        install -d ${D}${PTEST_PATH}/test/${i}/
> +        install -m 755 ${B}/test/${i}/${i} ${D}/${PTEST_PATH}/test/${i}/
> +    done
> +}

The same Makefile linked above has a rule for installing the tests.
Can that be used instead? Maybe it also installs some way to run them?

In any case, do not hardcode the particular test names; that changes
over time, and it's better to have some dynamic way of installing
(e.g. by file name pattern or executable bit).

Alex

