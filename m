Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CF53EB64D9
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 10:20:29 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.9217.1688725224298995052
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jul 2023 03:20:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=TCgMNz23;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2b6f97c7115so25280531fa.2
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Jul 2023 03:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688725222; x=1691317222;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6jBGWJWnjyIha18xlARnVYhMQIFwtf3PfxcH/MToQUk=;
        b=TCgMNz23NyBcK08g5hO2LIC8Uhm/1Qh99NR7orVg0FoM9yj13Q/5Jp4UnEmKAZokYs
         8ar1Kr2Rxw7DK/9Ko/mBuD1kIMgXsXUIKJ2dz4UwN4vC3j8oX8/1A9hJvzrCuG28aba8
         9hsMhkgPwovh6BMvviCxfI7iop97OKSIiUxElA9Vm3Eu8DmkvTqc2XVyEpo52/O5V4Lv
         csZYYns+7gY798XpHb+Jnt33o1DRxKofGIPm0WKG8Wwc/AITgPj8hUiLrmqwj6962xLW
         Ko4iX+L4v78B8I+0B0xfRQ4DIlq9D8HLXzi+brlhtiUs+Ym4UOWRkhgGazo+LhnGuN5y
         Yx5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688725222; x=1691317222;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6jBGWJWnjyIha18xlARnVYhMQIFwtf3PfxcH/MToQUk=;
        b=TZcrfr5kZ5O5qBVTQ7UxJ/QOt40a4QWUe2UmgNx48XrQqI9YrNHV9xMeTM2DIckh7p
         X0iJ2E8fs/SZMuLRhrJ/26ehe+P+2zXt6H2Sj4A3pCvdubkjfvOdrdsDltlnWffi/3zX
         8yfYBA0k2D3Wo+sjTVbeS8BaKpjNESa8crRfd9NWlZaFmmybxPEwm0c+YRyVbfgm4PC2
         YBUtIAW+SlexK3OwSLvnGPFqaF+UL3kJwa5VHoDOAtc4uCk/8fQAs4O8XVPg/rSgRQGQ
         jN5hECz7jid6aTu016jrzy8o9MbtBB5tyyQ2EwwirHAf2HeYOa6C1Js9OnzDvp661xwo
         cBWg==
X-Gm-Message-State: ABy/qLZKMi0eXRhmxtZtnaRNAYzO/hPnnSverMVI9UTmGR/Mo/01iBcO
	52Bmnxeu/sOLJMgU1T0bvNOYP8rrED3GVSPFGwY=
X-Google-Smtp-Source: APBJJlHlN2rdW5NoSyIErQ6aM/0rhPRMfrarssPP2K1d3042uVAtPwAxmLsTiimSZWfgHZxy+8mng6qSaAq6+pXRmUQ=
X-Received: by 2002:a2e:9289:0:b0:2b5:81bc:43a8 with SMTP id
 d9-20020a2e9289000000b002b581bc43a8mr3170202ljh.0.1688725222040; Fri, 07 Jul
 2023 03:20:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230706134556.2824413-1-tgamblin@baylibre.com>
 <CANNYZj974iNy5tcgmReWXqHBFE8ySEQ9FTBfMCJmUxkk1=X_nA@mail.gmail.com>
 <5633c982-9553-5ee8-167c-04c56577d5e5@baylibre.com> <CANNYZj8PW4efL+U1b6HJwyD+24AT3eaYQRxKz5Ai98x1pVbh5g@mail.gmail.com>
 <5efb8cd4-46ee-50dc-40bf-6d5bf61a7c04@baylibre.com>
In-Reply-To: <5efb8cd4-46ee-50dc-40bf-6d5bf61a7c04@baylibre.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 7 Jul 2023 12:20:10 +0200
Message-ID: <CANNYZj8=A9rX55KuA2wB4jPOM_DWApAds2OaLgE+Cjy=Kva0WQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] python3: disable test_cppext ptest
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org, 
	Ross Burton <ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jul 2023 10:20:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184005

On Thu, 6 Jul 2023 at 19:22, Trevor Gamblin <tgamblin@baylibre.com> wrote:
> Until recently yes, but it seems that a different issue has crept in
> that is preventing me from seeing the logs in the same way. I'm looking
> into it. Interestingly, running ptest-runner manually used to break on a
> broken pipe for me before, but now it's not happening...

I took a look. The culprit is what run-ptest does:

SETUPTOOLS_USE_DISTUTILS=nonlocal python3 -m test -v | sed -u -e
'/\.\.\. ok/ s/^/PASS: /g' -r -e '/\.\.\. (ERROR|FAIL)/ s/^/FAIL: /g'
-e '/\.\.\. skipped/ s/^/SKIP: /g' -e 's/ \.\.\. ok//g' -e 's/ \.\.\.
ERROR//g' -e 's/ \.\.\. FAIL//g' -e 's/ \.\.\. skipped//g'

This has two problems:

1. Processing output with sed tends to quietly regress (not to mention
it's difficult to read), and we should discourage use of sed across
yocto stronger than we currently do. Particularly here the tests fail
in a way that the sed expression isn't catching (ERROR without leading
dots I think).

2. This would've been okay if the overall command would exit with a
non-zero, but alas it doesn't - shell pipes obscure any problems in
the pipe except in the very last command.

I think we need to eliminate the use of sed first, but I'm not yet
sure how. I'll try to look into whether -m test can be convinced to
output the results in a compatible way, or write them into a
structured file that can be processed to report failures.

Alex

