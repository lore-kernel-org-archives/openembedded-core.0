Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C59BFC61DA3
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 06:33:37 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.12293.1677220416609682301
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Feb 2023 22:33:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=P2OP/bEp;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id f18so16691914lfa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 22:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677220414;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5xNwt0XkFLuWuFxC7x/87QFOiNgcdKw1J7w4NETrDU8=;
        b=P2OP/bEpr/kIYrrOB8tenbV55W6XFdCdOpWhgu37Z1FBAUlhA+xRz2b6sYm+olZCpY
         Iua5CsKDiuqOwp80pmecP0UC82COoRMbgbAiJ2EOS85v06awQzz3jW3GKYsPR7Nju578
         vJr+aa+ZYDDeZkwJ2uvzTxAMhoyIeAFFUqx+FFL8B2AmK0eDCFIoVvm0c/Km6obb+Go7
         /EW8GrvrTZ1IQUWfox6CgFph8TJ1X8pvvQqYPgntgBKH3Slzt9ao6I4gt8X8CHFPN22n
         wdUHIZjmxtqqydHNDy3EgH5xusao2ncqEipAnkGQqB1N9al73dm+HPxebgq1EMBvqMiA
         DRFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677220414;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5xNwt0XkFLuWuFxC7x/87QFOiNgcdKw1J7w4NETrDU8=;
        b=pSUWfpMLd1JtLk29oVKVgpM+ZJ56h9pIJxksa9kQSI54JlHghDmkps10479jV/T5i0
         2rHzhKAItnJDprUNgbPlvxTzUnOlBAQYgbgUhKDkBgvDbo6/pW1+wDe4ocklcy5dYKcL
         Y+ryTFD4RuOuPNDap0Dv8M8dJRG0bA8DI8qJ3nxafb18xgwF0ZV/JxppzeKdVpi1tl/n
         qtbpB4ls03/0CjixpKgSF1paRE8wRzUWRuUQaM8ZQa5W8UBu0cYRgRKXyLCDIPM9c7oU
         SiHIAUCvgcNQLdSDmf9CcygU0KKdBApmEZYN5G0oJ5ifrFV7Woj4e4e1viMkeDkiacmO
         Ur7w==
X-Gm-Message-State: AO0yUKU3v8PPwbUcKdPJXSb9pw3rVA4W3rYtSbUbGLxMfvGSr03PEBWP
	mmp9zSy9vnc4j2HvUPGBEUxT/r8nGt0VTdaUiFk=
X-Google-Smtp-Source: AK7set/1QC5Tg6RLnpI/YBBNiLKOmrN9fc1dIs64kwO0qHKPXX/YUNdJFVnUelxHKIN+6CK4JM1hDfEdOSKcOTK2D/o=
X-Received: by 2002:a05:6512:239b:b0:4dd:9eb6:444d with SMTP id
 c27-20020a056512239b00b004dd9eb6444dmr3348316lfv.4.1677220414349; Thu, 23 Feb
 2023 22:33:34 -0800 (PST)
MIME-Version: 1.0
References: <1676014485-3128-1-git-send-email-leimaohui@fujitsu.com>
 <b9adc480-1eab-3c45-151f-a60387882ca2@windriver.com> <OS0PR01MB6178114270DF9619E2FF60B1A0A89@OS0PR01MB6178.jpnprd01.prod.outlook.com>
 <efda9be1-9e59-d4ca-cff1-4d05c179d0a0@windriver.com>
In-Reply-To: <efda9be1-9e59-d4ca-cff1-4d05c179d0a0@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 24 Feb 2023 07:33:22 +0100
Message-ID: <CANNYZj-NbfG3YdKy=nZrzVZ4=Fgns_1oVKzjBjsAn1_Oq5TymA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] nghttp2: Fix do_rootfs error as following:
To: Chen Qi <Qi.Chen@windriver.com>
Cc: "leimaohui@fujitsu.com" <leimaohui@fujitsu.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 06:33:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177659

On Fri, 24 Feb 2023 at 04:27, Chen Qi <Qi.Chen@windriver.com> wrote:
> > This recipe is special. Libsoup has a hard dependency on nghttp2, so it can't be moved to meta-oe. But nghttp2-client and nghttp2-server depend on recipes of meta-oe.
>
> Hi Lei,
>
> Which ones? Do you have some local patch or some bbappend files? Also,
> if this is the case, I think Yocto's autobuilder will detect such issue
> by doing pure poky world build. I also just ran `bitbake -n nghttp2' and
> there's no error.

I have built this locally. The recipe unconditionally disables client
and server with -DENABLE_APP=OFF (no packageconfig entries to change
that), and at the same time defines packaging for items that would
otherwise be built. But there is nothing to put into those packages.

Lei, I'd suggest that you make a patch that simply deletes the entries
for -client and -server, and removes a dependency on them from the
main package. If someone later needs to enable them, it should be done
by creating a correct, working build configuration, and then re-adding
packaging rules is comparatively trivial.

Alex

