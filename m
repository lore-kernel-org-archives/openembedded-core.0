Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46A87C77B75
	for <webhook@archiver.kernel.org>; Fri, 21 Apr 2023 10:10:11 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.8099.1682071800759134056
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Apr 2023 03:10:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=mWg0YYh7;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2a7af0cb2e6so13852401fa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Apr 2023 03:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682071799; x=1684663799;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c6sAthx7SbV8FaHzWcT7nxZq0cBvikL3bGZGVKMs/LU=;
        b=mWg0YYh7N1l0TN8TeeHUJEZoEqhfFGPWUqd1YaLkvBRxYTrfy7Hd9wcsat6RAKoQc7
         OviLeUgD5UCF7+Ud8mIp2vXpSQbuaftqva84VlXeEV0MUNeqIBPMKh2B3jDtaQOJ/sAm
         bwBxqGwjj0Hy9qqqL17wnGY06GOi0dZPuGnxLLMPsobz7NapUKKgaASv0ztjrjijVvvA
         ITH8dr5+Lr3S1ILWUTVVvX+Q6b378Unc8HmVx5rsG8xjfpO4KvwuHmZHKAl0ORJScJ0U
         +3dn4LRPhBiSGj1ZHoVSsn7Oo2vf8Ww0SzuuVdM+9bHWaXIgHGPj48/MuhmBKpO3XFdM
         CiWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682071799; x=1684663799;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c6sAthx7SbV8FaHzWcT7nxZq0cBvikL3bGZGVKMs/LU=;
        b=cPlBfyqsegI0wfqfepepy15Gy7TIEqTFsYdbEa2+h40rmdtskrXmM2ufqkND2kkNAO
         T4z60LTD4lDCEG/ZR5z/CCFO3yTkdg6vJlSCm2kGelyw8e9eBI8Kg6ozkpwMPxRaOJKA
         Cxk9Qhe0W9Fd6mSO+UPIvAQ6oHkYO259TwVjsmjAzL8q5FAXafID91szRIVIe8QVazFb
         k9JwMkStFOQLfGmhE1ULhXBUaZ8kZbd7+XzCmJP54Jn9nhB5r4ZhJlWGWfZ0X/Gd1Bmp
         UFP/nfJVtootRbWsKoBOwlrZ07vqHRzyJbz5MsC5AdE4b5mr+DM8B+jGB3DqUJab0Bve
         grBA==
X-Gm-Message-State: AAQBX9eYVAntegZoOJjUhjvv37k3EGiGBpixkPwQ5tjwnyAJplBfoYTf
	HBf6cNkz9vWX9MuY504Yjc9+zYqwkiL9osfYxSI=
X-Google-Smtp-Source: AKy350YPomCd3KvC1icxHhQUlJ7GV0YXpILddlaah6JlbHgKV8hEeTgBMzwLFwDAnLhAcEvE+jpVR8LBfIv3BRfhM6o=
X-Received: by 2002:a2e:9b0a:0:b0:298:aad9:e377 with SMTP id
 u10-20020a2e9b0a000000b00298aad9e377mr512366lji.14.1682071798458; Fri, 21 Apr
 2023 03:09:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230420052442.16443-1-yang.xu@mediatek.com> <CANNYZj-C8ujMnqkZqyU8rgAF+rJ9Bwqc2bOLkuGu0d0cJpXfpg@mail.gmail.com>
 <90b1e25cde406898154a05d03babc739120e643c.camel@mediatek.com>
 <CANNYZj-0u9XVkCVHT+WjtFkQ_nYg9i4OUj311wK5GgRhp7ZZfA@mail.gmail.com>
 <db555f3f6c09c4576358846cba9e64d055422e59.camel@linuxfoundation.org> <1757E0BF64FE2869.29498@lists.openembedded.org>
In-Reply-To: <1757E0BF64FE2869.29498@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 21 Apr 2023 12:09:47 +0200
Message-ID: <CANNYZj9n1BAfzUBo2KOiCwMMKA59b_Tj+7=z+A_V8w8B+MrT7w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssl: set package level PERL5LIB
To: alex.kanavin@gmail.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	=?UTF-8?B?WWFuZyBYdSAo5b6Q5omsKQ==?= <Yang.Xu@mediatek.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Apr 2023 10:10:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180282

On Fri, 21 Apr 2023 at 08:54, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
> > > Thank you, I understand this now. I'm fine with the fix, but can you
> > > add this additional information to the commit message? So that it's
> > > available in git history if anyone needs to understand it.
> >
> > I think there is something additional we need to do. If the path
> > compiled into perl breaks when it is installed from sstate, we should
> > make sure this path is *always* incorrect. That way things will work or
> > fail deterministicly.
>
> That's right. I'll take a look at what happens inside perl, finding
> the correct place to patch can be tricky.

I have a patch for this now, which I'll take into testing:

--- a/meta/recipes-devtools/perl/perl_5.36.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.36.0.bb
@@ -109,6 +109,10 @@ do_configure:class-native() {
     -Ui_xlocale \
     -Alddlflags=' ${LDFLAGS}' \
     ${PACKAGECONFIG_CONFARGS}
+
+    # This prevents leakage of build paths into perl-native binaries, which
+    # causes non-deterministic troubles when those paths no longer
exist or aren't accessible.
+    sed -i -e "s,${STAGING_LIBDIR},/completelyboguspath,g" config.h
 }

 do_configure:append() {

Alex

