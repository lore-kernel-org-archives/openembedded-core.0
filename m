Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AEB2C61DA4
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 07:50:43 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.14642.1678693838642071684
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 00:50:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dOUxSgCk;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id z42so11584104ljq.13
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 00:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678693837;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CAc2hdLhbMxeLo1hXBxTYnyVYl04ovv1DNKBjLCCHog=;
        b=dOUxSgCkjj2RduEvcadb32i364NUBag82ZR6kuFKCgfAozlrpXcAlJQJZFYLWwGdC2
         r2UNl1gwCr8scQZO/G1Gi/XQw0sfigKcqom7tOm+f9XvBSaGVizzquBFATSZjQ384StI
         tbHBcGS4QawyZs4WuM7NclYsdtjn8RXtu8TiEmMw5AQ+BMv+M3RzYmoW9Wl34SbLa6xT
         3i/0Nn3SHJ4xJzTLABNmrCPR7nS+ZNZWxDO6DCowdktzVHzO93lXEuZDVndpxR/ion8N
         ojOLy0xLmi1Bh7Jgist+N4tI6thZdw+ORJo+RGli3IlhNEJj/stTGCefZ7UUM5YOMZH1
         WzHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678693837;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CAc2hdLhbMxeLo1hXBxTYnyVYl04ovv1DNKBjLCCHog=;
        b=EC/zwzldHRctJO9m2XjrrnbVojEbc5O0n/1jbaePO6ah2TmbV2f/tdMte/1vKgs9c3
         //etW7ngEWihelWoghHSKoA8q0iiFz2rWoiFO9GQPkMxLjTrwPwzxTiEpkpyR7cSrV1K
         Fl8RUd5d5NwvYpZ14xIEXnrLDBcJGKv1Xz7JZQMmTOQQUzFUUUE5vQ0dF441FfA2wAZd
         Gv2lCc+iZBhl/RJfjCCy+0YrdJ8+iyrat13KGboVwheSiVaWPY2inY+BlELgi0pT881y
         63se/G2JU7jpHAvWoc25RES/akwOhisVJQjS0/2/aEA/YaelfhNIpPEFWs5siDA2T8en
         PH7Q==
X-Gm-Message-State: AO0yUKV1X2tN/T/lPwQDlfimwCud/yiWMmXXJUfBC/lSqFq/qk8anyUl
	GjslIZQbVj6kO10jJsH2H9zmI0fS0sptxB25qaw=
X-Google-Smtp-Source: AK7set8Wgye/wE74lsZ9Wjd6jvdjqV5fev1vU1vpJ18Y4zHYL2g4TK9MFbXkGMA4h/0fT2KV/IiEidJxVGIjjNrzYVA=
X-Received: by 2002:a05:651c:336:b0:293:2f6e:91bf with SMTP id
 b22-20020a05651c033600b002932f6e91bfmr10219722ljp.7.1678693836666; Mon, 13
 Mar 2023 00:50:36 -0700 (PDT)
MIME-Version: 1.0
References: <1678239619-21210-1-git-send-email-wangmy@fujitsu.com>
 <1678239619-21210-4-git-send-email-wangmy@fujitsu.com> <a217c248c8fc840689997f43e61ae076e5420b0a.camel@linuxfoundation.org>
 <OSBPR01MB18456733D9BEA9717A0DFE45DCB99@OSBPR01MB1845.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB18456733D9BEA9717A0DFE45DCB99@OSBPR01MB1845.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 13 Mar 2023 08:50:25 +0100
Message-ID: <CANNYZj8LM7xWvqVJeZBqcOO=YTjx6008mTpoEp-gHxZnNm28Kg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V2 4/5] xcb-proto: Fix install conflict when
 enable multilib.
To: wangmy <wangmy@fujitsu.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 07:50:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178410

On Mon, 13 Mar 2023 at 08:29, wangmy <wangmy@fujitsu.com> wrote:
> When libxcb is compiled, it will read libdir from xcb-proto.pc to find the library.
> If delete this line, libxcb will report an error because it cannot find the directory of the library.

Which library in particular? Can you show the error, and the point in
libxcb's code where it happens?
xcb-proto does not install any libraries, and so there is no reason
for xcb-proto.pc to tell where the libraries are.

Alex

