Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 784BBC77B61
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 07:51:10 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.45691.1682322666193078667
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Apr 2023 00:51:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Rrwg4xuc;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2a8b3ecf59fso38177641fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Apr 2023 00:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682322664; x=1684914664;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FSenkgr6sYU7IN7LzQjwdtNjkRDQqGJfOg6Bd9R4BPk=;
        b=Rrwg4xucQCm6MRKT77rWxIcZzwGUVueRxtdMSdKwjOaGgzH8RnBDcjwlX80M9/vxzy
         DBBN7m+nguQsNjWKJPjQybtXOBAGUiRA6aNaMbgYzAA46c0sKq/AgQdcu5cTKT7d035A
         NXx8rEKHd8bhPw++rRM+2lXsREvooCmj5EP86voH6Fvtd4KvzIiYjDBfcF/DO4C/w/LC
         qQ1xhZhgeArGtwXMR4aNKY2Y0TsNol5L1SNgr59AlhZs6yRRC6g0cJJZTRiV32nYGXkZ
         QbpbWxIiC/jDwXIiGPkqedE6UPrOSUOLJAcLE2Yyq36Wl+Ct0DagaRvA3SjK8O9umF35
         0VdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682322664; x=1684914664;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FSenkgr6sYU7IN7LzQjwdtNjkRDQqGJfOg6Bd9R4BPk=;
        b=gv+y+BEFi3coeIPK5EU8/e2HPGRMib8JxFPWUfvcstca/U7UwcVXvU+U7a+EGaXVcr
         bAi4MO53Zqm8zoToLVpP9WyO8aYYBYSnVUBJ+PmgmJ+bmk2QrM+zIEfPrFbJzTHJUqLf
         nS6BHstMIw5bt/hbBGc4F9s7IEDyDDMEu3OI2D9GmYgoqrNY+w1lFH4MHD78G3lkPM6K
         jy0RMg+ib2Z+cApvjwP+lhJB5RGtfrmJlthybEcZB5u7HBMF4I4mQEP0R2T9WVCogxlv
         eIOEHlmwBNTPTqEbGWn+duw8oWTkm/B+Ej7n/sbdQZQ5xYxuMlgin4iPXSNXpGqaeL0r
         DgFg==
X-Gm-Message-State: AAQBX9dPOaA4Inq88ZRia8Nf17E5q78xj1O32jSHHQi3kOMmamS7A705
	1xsKYgKqPdO1dgXKgvNMZ0mAQrc60SYDq0VJCsom769rJyU=
X-Google-Smtp-Source: AKy350Yxp6QrkxqMwwPg1pX7TUjupgNvQ0amFQHcp8nHeFuJBl5xEtzpp7SUxFMc+78eC1EgLLlSKtJyVPboFLPuESE=
X-Received: by 2002:a2e:9f48:0:b0:2a8:d1a4:454b with SMTP id
 v8-20020a2e9f48000000b002a8d1a4454bmr1791223ljk.36.1682322663651; Mon, 24 Apr
 2023 00:51:03 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1682178812.git.frederic.martinsons@gmail.com>
In-Reply-To: <cover.1682178812.git.frederic.martinsons@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 24 Apr 2023 09:50:52 +0200
Message-ID: <CANNYZj-z_nV55eatamXDzGh5Y0TzPX3=yOJ1UnL9qtOHgtpKbA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/3] Create class for building rust unit test
To: Frederic Martinsons <frederic.martinsons@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Apr 2023 07:51:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180340

If you add ptests, please also add them to appropriate lists in
meta/conf/distro/include/ptest-packagelists.inc, so they will be
actually built and executed in yocto CI.

Can you include a sample output of the tests you added into commit messages?

Alex

On Sat, 22 Apr 2023 at 17:59, Frederic Martinsons
<frederic.martinsons@gmail.com> wrote:
>
> From: Frederic Martinsons <frederic.martinsons@gmail.com>
>
> This brings the possibility to use this class to build and ship
> unit tests of rust projects, the class also create (or modified)
> standard run-ptest script to run the generated rust test suite.
>
> It has been tested successfully with core-image-sato under qemu
> for zvariant-ptest and python3-bcrypt-ptest (though the last one
> didn't define any unit tests).
>
> Note that I tried to do the same with python3-cryptography but fail
> to build the test suite and I don't know how to do it with the rust
> extension module build by python setuptools. There must be some kind
> of way for doing that so maybe someone will put some work in it (
> because python3-cryptography rust extension do have unit tests).
>
> Moreover, in the class, I didn't manage to share data between
> do_compile_ptest_base and do_install_ptest_base cleanly (I tried
> to d.setVar in compile and d.getVar in install but it seems that
> the data store doens't recognize my new variable) so I used a file
> for that. I'm sure there is a clever way for doing that, so feel
> free to tell me.
>
> The following changes since commit 45a8bb6e4676899d40525e7d5ad1c1ddefee3185:
>
>   apt-util: Fix ptest on musl (2023-04-20 11:56:03 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/fmartinsons/openembedded-core cargo-add-ptest
>
> Frederic Martinsons (3):
>   ptest-cargo.bbclass: create class
>   python3-bcrypt: enable build of unit tests
>   zvariant: add ptest feature for zvariant test suite
>
>  .../zvariant/zvariant_3.12.0.bb               |  11 +-
>  meta/classes-recipe/ptest-cargo.bbclass       | 108 ++++++++++++++++++
>  .../python/python3-bcrypt_4.0.1.bb            |   4 +-
>  3 files changed, 121 insertions(+), 2 deletions(-)
>  create mode 100644 meta/classes-recipe/ptest-cargo.bbclass
>
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180319): https://lists.openembedded.org/g/openembedded-core/message/180319
> Mute This Topic: https://lists.openembedded.org/mt/98436057/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

