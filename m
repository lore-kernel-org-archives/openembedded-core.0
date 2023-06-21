Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AECDDEB64DD
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 17:05:03 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web10.4102.1687367094364034687
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jun 2023 10:04:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=c/loEAoo;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-55e41318185so2869213eaf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 10:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687367093; x=1689959093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3zOwskyZ8HH6VXY56aMeQca/nTtEnoSvgjgc60D1ZI=;
        b=c/loEAooANptgJNZzTdC+X+/8reb0QmtxaMfD0+l6DrGinKJYwwVkhvTa/vQcyUzkw
         jx8F9hiQuTzHH1V9GXuECujhCHb4LNncEkGYtAVfOx7/A8cyAQf3lYmOe6IF7/mr4bcU
         wCgGqx95bn8+nDbjfUx+zb04zlceWUcXTRRuHw5qZ/HBTl715B/jKuETsODysFTL8krQ
         4TjbpSLfe7sGvhgihlyJpF5UDuGhxar5N7jK9AZEWlb3Ruti2TIgHBOX5NfIZ1psuCh1
         KHLveH6F2lfKELomuMAKfggQik+b0GivCI55DamaaSNNZ6aS7/M5CFZ79NZllZnCZ9wa
         SnWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687367093; x=1689959093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P3zOwskyZ8HH6VXY56aMeQca/nTtEnoSvgjgc60D1ZI=;
        b=FPw3aTiYJ6VU61NJ8/gLxF4oSpn+hL5fO//V4XiOXU7QIddC+gg2eq2S2tU5vZ2Bb4
         NcYb1PZCNEzB/ezUDLQuC2BFGyybgH5Rjx127Yg+vAoiFLNNtDRmiBlaqD1ZbKK/ZyM4
         Zj9Fx96nkO9pOz/aGIMTJ9cjF/wNg33FgzZFw/3HKupqv+dD9m30gbd40j/XzlFgjluc
         UOxTWk+wsnXr2Q3weXYMmIqk5UPIzCUWlbr2mgGQTsAYI1mI7XMFNERhpYLR5/TYl2Qu
         +EPpKVeS6mzGaex0ASVDF7lzj02KnRSuCl5N7lzd+Q9yio7ejP9jhLdnvRA2xGfW9lPT
         q38w==
X-Gm-Message-State: AC+VfDxvmjxb0+veIQTb3KVwCuYOLLzmMt+Gpul+Rg0dQCJ8dvtj1s35
	9YJJzqCKm3/ZNlPMeSdSak0QufMX4OTYQS5utvrtGuBm
X-Google-Smtp-Source: ACHHUZ5MQLFLjeDLb5AeS1JpLYZwfNWlNgTl6Arb0Ml2kDxyTp7NlS/+0DAjY4Y6ZOZ20ZcjkDuSzvRUvwndlkDIBLA=
X-Received: by 2002:a4a:de82:0:b0:55c:6812:27c5 with SMTP id
 v2-20020a4ade82000000b0055c681227c5mr12016702oou.9.1687367093343; Wed, 21 Jun
 2023 10:04:53 -0700 (PDT)
MIME-Version: 1.0
References: <ec700d47-482a-2b83-9bae-8d0eed55da88@ni.com> <CAMKF1srpvsvaQGZrnUhNi-=1R5SLtWxVq5cxirCjPJCOaxmZjQ@mail.gmail.com>
 <7f54a675-add4-54a8-1b22-227841244e17@ni.com>
In-Reply-To: <7f54a675-add4-54a8-1b22-227841244e17@ni.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 21 Jun 2023 10:04:27 -0700
Message-ID: <CAMKF1sr6hzNfFPd1trrx6kAeRf+Eqh2BTjCd-itCcXo++W30zA@mail.gmail.com>
Subject: Re: [OE-core] Building SDK from Feeds
To: Charlie Johnston <charlie.johnston@ni.com>
Cc: openembedded-core@lists.openembedded.org, alex.stewart@ni.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 17:05:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183195

On Wed, Jun 21, 2023 at 9:58=E2=80=AFAM Charlie Johnston
<charlie.johnston@ni.com> wrote:
>
> On 6/21/23 11:52, Khem Raj wrote:
> > On Wed, Jun 21, 2023 at 9:47=E2=80=AFAM Charlie Johnston
> > <charlie.johnston@ni.com> wrote:
> >>
> >> Hello,
> >>
> >> I'm trying to build an SDK (or even just meta-toolchain) from feeds. F=
or context, there are some dev packages in our feeds that aren't in our Ope=
nEmbedded build that I'd like to include in the SDK. The normal process I u=
se for building an image from feeds is to build the packages from OE locall=
y, build a package index, and then build the image using those feeds and ou=
r internal feed server.
> >
> > How do you do that? do you have a customized image builder ?
>
> We use BUILD_IMAGES_FROM_FEEDS and IPK_FEED_URIS.

Do you have some documentation on how you do it ?

I see. I think you need nativesdk packages in feeds as well to start
with. It will also need
dev and staticdev packages

>
> >
> >  I'm having trouble figuring out all the architectures and packages
> > that need built to do the same for the SDK.
> >>
> >> Trial and error got me to a few of the dummysdk architectures and pack=
ages, but is there any documentation on the required packages to build the =
SDK that I would need to include in a feed? Has anyone tried to do this bef=
ore?
> >>
> >> Thanks,
> >> Charlie Johnston
> >> e. charlie.johnston@ni.com
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#183189): https://urldefense.com/v3/__https://lists=
.openembedded.org/g/openembedded-core/message/183189__;!!FbZ0ZwI3Qg!qa6SDHs=
sPBrq2FqBFAP20IFtUc_1ZwFNBZ2Eb2GwiHfbMH_EXNtRBhK_4PcthoywMYetFi01E63xO929zE=
0$
> >> Mute This Topic: https://urldefense.com/v3/__https://lists.openembedde=
d.org/mt/99680369/1997914__;!!FbZ0ZwI3Qg!qa6SDHssPBrq2FqBFAP20IFtUc_1ZwFNBZ=
2Eb2GwiHfbMH_EXNtRBhK_4PcthoywMYetFi01E63xeX1JCHE$
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://urldefense.com/v3/__https://lists.openembedded.or=
g/g/openembedded-core/unsub__;!!FbZ0ZwI3Qg!qa6SDHssPBrq2FqBFAP20IFtUc_1ZwFN=
BZ2Eb2GwiHfbMH_EXNtRBhK_4PcthoywMYetFi01E63x2Ls-m1k$  [raj.khem@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>

