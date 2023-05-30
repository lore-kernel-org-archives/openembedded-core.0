Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B0BBC77B7A
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 13:59:22 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.10657.1685455158829355787
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 06:59:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=fKlTpyXb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-30ae95c4e75so2550605f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 06:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685455157; x=1688047157;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AAsEUSVcp7C+C/8qAyLkPgPRjRtjDbBQMjCwUwl7d0c=;
        b=fKlTpyXbwaZQVTC1udLhxF8VdhdbB7JftyOchTBSFaxCvbtXn5geKtyDjMRFoh340D
         Ij1gVbRI+5mkOAZvzUBQh2UinycYZ/4DM86GTAPM5hGxKQvLM5rjLVc669INoaNrZOb1
         Zu6cE5xctQD1ruPg54HL0d4SOedamEEORrSQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685455157; x=1688047157;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AAsEUSVcp7C+C/8qAyLkPgPRjRtjDbBQMjCwUwl7d0c=;
        b=fdeoc0MKARprrQsIbClE+1iV5t1DAJIuMcSu81StHl3z+oAf1Yd0gBmuYZqiS425F2
         WOUJlEn79y0cy1tsUs384oxHHIUhSqS5t/jQZacWEeewW5+Fcm6801dkeigbzWxmWD6s
         oS0rxA+UvpIeMU+QFCZsg5PhjyIP/8xOC1dGOww+Q4MXGvUYRkYGbDuzjyjNYNSbOEBN
         QJeJ+YG5s7ZwqPpMwwBXzPBe5qEcEIVc1CXaYHHbyzCVANdXkTNcEjBs8ABpEA7h3LAo
         MHzxpHVOYQCpQ7fPBkYDM6zGnZV5Ky1FGkTgHVYEb1I2MRx71BHZLAELSIxgtmV7t/jw
         zzBw==
X-Gm-Message-State: AC+VfDwvA4rTDlIsCQbRd8l4Cwm4JXITUXrI2SL3qna+cH+/7tyBVO6E
	kshpvg+dZvAtpNvFQz+KML9foA==
X-Google-Smtp-Source: ACHHUZ6DfqVnaIW26NgEIZ3+2oBhadN9OJnn3WjWIG3riv9s0yEIH8XDGBoU6pwMqAhppWOMJRYZQA==
X-Received: by 2002:a5d:4902:0:b0:30a:d517:2359 with SMTP id x2-20020a5d4902000000b0030ad5172359mr1699973wrq.64.1685455157203;
        Tue, 30 May 2023 06:59:17 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f1a1:bff7:58e4:eab3? ([2001:8b0:aba:5f3c:f1a1:bff7:58e4:eab3])
        by smtp.gmail.com with ESMTPSA id x15-20020a1c7c0f000000b003f4266965fbsm21065263wmc.5.2023.05.30.06.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 06:59:16 -0700 (PDT)
Message-ID: <7c9a0a78204958d84c4a3779da7c0f1b0e66dda8.camel@linuxfoundation.org>
Subject: Re: [PATCH v14] Rust Oe-Selftest implementation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yash Shinde <yashinde145@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com, 
	Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com, 
	Shivaprasad.Moodalappa@windriver.com, Yash.Shinde@windriver.com
Date: Tue, 30 May 2023 14:59:16 +0100
In-Reply-To: <20230530105125.445622-1-yashinde145@gmail.com>
References: <20230530105125.445622-1-yashinde145@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 13:59:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181925

On Tue, 2023-05-30 at 16:21 +0530, Yash Shinde wrote:
> The patch implements Rust testing framework similar to other selftest,
> specifically the gcc selftest in OE. It uses the client and server
> based method to test the binaries for cross-target on the image.
> The test framework is a wrapper around the Rust build system as ./x.py
> test. It tests many functionalities of Rust distribution like tools,
> documentation, libraries, packages, tools, Cargo, Crater etc.
> Please refer the following link for detailed description of Rust
> testing:-
> https://rustc-dev-guide.rust-lang.org/tests/intro.html#tool-tests
>=20
> To support the rust tests in oe-core, the following functions were
> added:-
> setup_cargo_environment(): Build bootstrap and some early stage tools.
> do_rust_setup_snapshot(): Install the snapshot version of rust binaries.
> do_configure(): To generate config.toml
> do_compile(): To build "remote-test-server" for qemu target image.
>=20
> Approximate Number of Tests Run in the Rust Testsuite :- 18000
> Approximate Number of Tests that FAIL in bitbake environment :- 100-150
> Normally majority of the testcases are present in major folder "test/"
> It contributes to more than 80% of the testcases present in Rust test
> framework. These tests pass as expected on any Rust versions without
> much fuss. The tests that fail are of less important and contribute to
> less than 2% of the total testcases. These minor tests are observed to
> work on some versions and fail on others. They have to be added, ignored
> or excluded for different versions as per the behavior.
> These tests have been ignored or excluded in the Rust selftest
> environment to generate success of completing the testsuite.
>=20
> These tests work in parallel mode even in the skipped test mode as
> expected. Although the patch to disable tests is large, it is very simple
> in that it only disables tests. When updating to a newer version of Rust,
> the patch can usually be ported in a day.
>=20
> Tested for X86, X86-64, ARM, ARM64 and MIPS64 on CentOS release 6.10
>=20
> Signed-off-by: pgowda <pgowda.cve@gmail.com>
> Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> Signed-off-by: Yash Shinde <yashinde145@gmail.com>
> ---
>  meta/lib/oeqa/selftest/cases/rust.py          |   86 +
>  .../rust/files/rust-oe-selftest.patch         | 2120 +++++++++++++++++
>  meta/recipes-devtools/rust/rust-source.inc    |    1 +
>  meta/recipes-devtools/rust/rust_1.69.0.bb     |    7 +
>  4 files changed, 2214 insertions(+)
>  create mode 100644 meta/lib/oeqa/selftest/cases/rust.py
>  create mode 100644 meta/recipes-devtools/rust/files/rust-oe-selftest.pat=
ch

I did put this into a build for testing on the autobuilder. It hasn't
been running long and I can already see build failures such as:

https://autobuilder.yoctoproject.org/typhoon/#/builders/103/builds/6077
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/7200
https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/7190
https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/2923
https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/7200
https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/7217
https://autobuilder.yoctoproject.org/typhoon/#/builders/104/builds/6080
https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/7146
https://autobuilder.yoctoproject.org/typhoon/#/builders/61/builds/7184

and there will likely be more.

I'm finding this rather frustrating and am not sure how this was
tested.

Cheers,

Richard

