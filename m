Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC09AC47DAF
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 10:08:39 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.70182.1705918115368070428
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 02:08:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OZsPPmPw;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-50eabfac2b7so3523069e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 02:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705918113; x=1706522913; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N7wndRfo2Q8ZtFprovt06DPLxkVUr0u6hyFTCAYdYDA=;
        b=OZsPPmPwRUMRrD2h9/XkzOoE+fwh1vL6mfMfgvphImyMdbQQ+O2L8/8OkOJ7iFwntE
         MmCTYLa6n8O+70yCFKgx5aLK7ocBd2oz5brWm522Pa50Joe/HZ/iu6s4pXy8HnpciIVg
         2ArEGZzw1nvTk6n58WhQmg1FsoS53tbxDAEn11kV2nZsFIWG8EIQDA6DP1pyNTRp+ZiM
         Sw8QeOaq/XiShjz6dSIOHjhxb61fHATGub0u6KQWN1469afGdyasmA1Oj+SWT+NrygET
         RI/LKSmvIYJMOY36LghjwF1LqYJ5x7AqQwOXZwb1RaWziCTjVWvRXaJo6pDdMcRfzcA/
         ONLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705918113; x=1706522913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N7wndRfo2Q8ZtFprovt06DPLxkVUr0u6hyFTCAYdYDA=;
        b=vuL9l9pE11rYinr8zaj0BWOe5oXMt2jtpRxLImDdmoOcqNR7iVO0aa+VnFxpA1lxgL
         OWzn1B0eaAKuo7VZCOtFyzrPBk/yCTN2KHU6xzLUW1D7osgnWT6pMhb7ZyE08ihdHPSK
         QIRhYF4/qvlFs5psDNfFkfB6kXNTP6SpY3SketWAnHPohY4QchQPDfnlIJRcEF6zxGli
         uK15bbncPkGg61hKoybNNPBerlmMke5dV8kYOLpRQ7iG2wrKzo90eju7COG0yFErQ3nL
         LngJ3DjNiHS6HqjvAD2Iwn+dq66G/Fh/us5vDitQ15snm4WxtjHfq1qSYvEYqft5wlQZ
         YoSQ==
X-Gm-Message-State: AOJu0Yw+5upqVfQlXiIhQEe1+sY7XmmvbcD/gFkWBEX3M/UmUqTcJBYx
	DN7wkBFB1tW+aJ1qwoHmu+ISxoXihVEoDGVktlaRUdg/Fqu4+behv9s7ZTJpWxycLgdMqucCfxm
	+oHzgLIzU0Nfj8PXZE0+BNx6lQX0=
X-Google-Smtp-Source: AGHT+IH/aTYMOpxGVuFrmmQZVACYb717MoiVqLXspwm66DHCCi8n2gT600UsHtuiH8fChF5M/cDFQzefiQko3Xgs58U=
X-Received: by 2002:a05:6512:388c:b0:50e:7e13:813a with SMTP id
 n12-20020a056512388c00b0050e7e13813amr1504391lft.61.1705918113004; Mon, 22
 Jan 2024 02:08:33 -0800 (PST)
MIME-Version: 1.0
References: <CANNYZj9pTPpz1Lr7y1gdjhAXuMvWtx+L9XWX7j3HZfqwO4-z-A@mail.gmail.com>
 <20902.1705687879872874504@lists.openembedded.org>
In-Reply-To: <20902.1705687879872874504@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 22 Jan 2024 11:08:21 +0100
Message-ID: <CANNYZj_hJW1Tsjm-prUaBNaSSt3+1BiHT0Lb=Eevp6aRokBsKg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] perl: Add option to prevent
 COMPLEMENTARY_GLOB from ignoring perl-modules
To: william.lyu@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 10:08:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194133

Thank you for doing this deep level investigation. I think this pretty
much shows that listing all modules in a way that can be maintained
isn't feasible (the idea was that maybe there's only a few of them
needed for ptest).

Which brings us back to the question: why is perl-modules using
RRECOMMENDS and not RDEPENDS? I went through git history, and perl
recipe had RRECOMMENDS from the very first mass-import commit in 2005,
so the answer is likely no one knows or remembers.

I also went and checked python: in there python3-modules is using RDEPENDS.

So I think the easiest way out is to simply replace RRECOMMENDS with
RDEPENDS in perl as well. Can you make a patch?

Alex

On Fri, 19 Jan 2024 at 19:11, Lyu, William via lists.openembedded.org
<william.lyu=3Dwindriver.com@lists.openembedded.org> wrote:
>
> Following your suggestions and iteratively adding packages based on error=
 message, I am finally able to come up with quite a long list of perl-modul=
e-* packages that fix the dependencies of openssl-ptest.
>
>
> However, I am worried about if the list I came up with is truly comprehen=
sive in the sense that this list covers all dependencies for other architec=
tures and other OSes. I see that a lot of openssl-ptest subtests are marked=
 as "skipped". I am not sure if these dependencies will be sufficient if th=
ese subtests are not skipped. Also, I am not sure if the packages I added a=
re arch or OS specific.
>
> The following is the list of perl-module-* I found.
>
> This first portion is identified by following your suggestion of using gr=
ep "^\s*use".
>     perl-module-extutils-makemaker \
>     perl-module-file-find \
>     perl-module-if \
>     perl-module-pod-checker \
>     perl-module-tap-harness \
>     perl-module-tap-parser-aggregator \
>     perl-module-tap-parser-source \
>     perl-module-tap-parser-sourcehandler-perl \
>     perl-module-text-parsewords \
>     perl-module-carp \
>     perl-module-cwd \
>     perl-module-data-dumper \
>     perl-module-digest-sha \
>     perl-module-encode \
>     perl-module-errno \
>     perl-module-exporter \
>     perl-module-fcntl \
>     perl-module-feature \
>     perl-module-file-basename \
>     perl-module-file-compare \
>     perl-module-file-copy \
>     perl-module-file-glob \
>     perl-module-filehandle \
>     perl-module-file-path \
>     perl-module-file-spec \
>     perl-module-file-spec-functions \
>     perl-module-file-temp \
>     perl-module-findbin \
>     perl-module-getopt-long \
>     perl-module-getopt-std \
>     perl-module-io-select \
>     perl-module-io-socket \
>     perl-module-ipc-cmd \
>     perl-module-ipc-open2 \
>     perl-module-lib \
>     perl-module-list-util \
>     perl-module-math-bigint \
>     perl-module-mime-base64 \
>     perl-module-pod-html \
>     perl-module-posix \
>     perl-module-scalar-util \
>     perl-module-storable \
>     perl-module-test-harness \
>     perl-module-test-more \
>     perl-module-time-local \
>     perl-module-utf8 \
>     perl-module-vars \
>     \
>
> The following are added iteratively based on error reports from actually =
running the test.
>     perl-module-pod-text \
>     perl-module-encode-encoding \
>     perl-module-metadata \
>     perl-module-locale \
>     \
>
> The following are added due to internal dependencies between different TA=
P modules. I added a few iteratively, and there are still some errors. So, =
I just grepped and added all tap modules.
>     perl-module-tap-base \
>     perl-module-tap-formatter-base \
>     perl-module-tap-formatter-color \
>     perl-module-tap-formatter-console \
>     perl-module-tap-formatter-console-parallelsession \
>     perl-module-tap-formatter-console-session \
>     perl-module-tap-formatter-file \
>     perl-module-tap-formatter-file-session \
>     perl-module-tap-formatter-session \
>     perl-module-tap-harness \
>     perl-module-tap-harness-env \
>     perl-module-tap-object \
>     perl-module-tap-parser \
>     perl-module-tap-parser-aggregator \
>     perl-module-tap-parser-grammar \
>     perl-module-tap-parser-iterator \
>     perl-module-tap-parser-iterator-array \
>     perl-module-tap-parser-iteratorfactory \
>     perl-module-tap-parser-iterator-process \
>     perl-module-tap-parser-iterator-stream \
>     perl-module-tap-parser-multiplexer \
>     perl-module-tap-parser-result \
>     perl-module-tap-parser-result-bailout \
>     perl-module-tap-parser-result-comment \
>     perl-module-tap-parser-resultfactory \
>     perl-module-tap-parser-result-plan \
>     perl-module-tap-parser-result-pragma \
>     perl-module-tap-parser-result-test \
>     perl-module-tap-parser-result-unknown \
>     perl-module-tap-parser-result-version \
>     perl-module-tap-parser-result-yaml \
>     perl-module-tap-parser-scheduler \
>     perl-module-tap-parser-scheduler-job \
>     perl-module-tap-parser-scheduler-spinner \
>     perl-module-tap-parser-source \
>     perl-module-tap-parser-sourcehandler \
>     perl-module-tap-parser-sourcehandler-executable \
>     perl-module-tap-parser-sourcehandler-file \
>     perl-module-tap-parser-sourcehandler-handle \
>     perl-module-tap-parser-sourcehandler-perl \
>     perl-module-tap-parser-sourcehandler-rawtap \
>     perl-module-tap-parser-yamlish-reader \
>     perl-module-tap-parser-yamlish-writer \
>     \
>
> Only perl-module-extutils-mm-unix was requested. However, I noticed that =
the suffix has "unix", so I assumed that this module is OS dependant. In ca=
se openssl-ptest needs to be built for other OSes, I added all perl-module-=
extutils-mm*.
>     perl-module-extutils-mm \
>     perl-module-extutils-mm-aix \
>     perl-module-extutils-mm-any \
>     perl-module-extutils-mm-beos \
>     perl-module-extutils-mm-cygwin \
>     perl-module-extutils-mm-darwin \
>     perl-module-extutils-mm-dos \
>     perl-module-extutils-mm-macos \
>     perl-module-extutils-mm-nw5 \
>     perl-module-extutils-mm-os2 \
>     perl-module-extutils-mm-os390 \
>     perl-module-extutils-mm-qnx \
>     perl-module-extutils-mm-unix \
>     perl-module-extutils-mm-uwin \
>     perl-module-extutils-mm-vms \
>     perl-module-extutils-mm-vos \
>     perl-module-extutils-mm-win32 \
>     perl-module-extutils-mm-win95 \
>
> =3D=3D=3D=3D=3D APPENDIX: Commands I Used to Identify the Potential List =
of Packages Needed =3D=3D=3D=3D=3D
> These are details and can be ignored.
>
> Under "{build directory}/tmp/work/qemux86_64-poky-linux/core-image-minima=
l/1.0/rootfs/usr/lib/openssl/ptest", I executed the following command to co=
nvert all imported modules using "use" statements into "perl-module-*":
> $ grep -r -n -I "^\s*use " | sed -E 's/.*:[0-9]+://' | sed -E 's/;/\n/g' =
| sed -E 's/^ *use *//' | sed -E 's/ /\n/g' | awk '!/^\s*$/' | tr '[:upper:=
]' '[:lower:]' | sed -E 's/::/-/g' | sed -E 's/^/perl-module-/' | sort | un=
iq
>
> I saved the above list into a file "PARSED_USE". Then, I listed all direc=
tories under "tmp/work/core2-64-poky-linux/perl/5.38.2/packages-split" and =
saved this list as a list of valid perl-module-* into a file "VALID_MODULE"=
.
>
> I used the following command to determine which line in file "PARSED_USE"=
 is a valid perl-module-* based on "VALID_MODULE" using the following comma=
nd:
> $ cat PARSED_USE VALID_MODULE | sort | uniq -c | sort -nk1,1 | grep -E '^=
 *2'
>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194062): https://lists.openembedded.org/g/openembedde=
d-core/message/194062
> Mute This Topic: https://lists.openembedded.org/mt/103766391/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

