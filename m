Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59348C433F5
	for <webhook@archiver.kernel.org>; Thu,  7 Oct 2021 08:56:49 +0000 (UTC)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com
 [209.85.217.51])
 by mx.groups.io with SMTP id smtpd.web08.9100.1633597008468988972
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Oct 2021 01:56:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=S1cdU01Z;
 spf=pass (domain: gmail.com, ip: 209.85.217.51,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-vs1-f51.google.com with SMTP id o124so5979385vsc.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Oct 2021 01:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oAltNd+LDDqUAuq54q2Y88/QdksRq5T4LLUesE4XqI0=;
        b=S1cdU01ZfDqRitZ2rBDIsj4ItyYBSP1n8ygczjggqAaLQ5xrr8jSncwQF7DeIik0s9
         AI40YhIZw0IPWNERW0jXsPqYa92K6/zlzzLfeM8b9qvUsy/C3Zjw0XEdKA0GERuFJBda
         m6CcHuiH/1xccoBFAar1NGfBBIhR1eElYRWDSGKlvTWbLXvBxw8ZT9XWrxMmnzezt0Zd
         PqDrPOlP3PfRC1kGbW8jK8DKu74CU7Z5kMtAipYg7XeBF7xfQ0bkD3dSc5HIBCR7YCJH
         bby42vhjvZS5+hgnCAsxpK+pSwyBuzOCBqYEPuL0JNmZv3flC8HiVH1Z8kOKFHc/gisP
         4uBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oAltNd+LDDqUAuq54q2Y88/QdksRq5T4LLUesE4XqI0=;
        b=G5qFIZnbbFOTq2k0NnxhHh+Sm0W02aSmlRq/Q4Rjjy5r1WbWAukfxWaoJujnIFOaCu
         TmihekbhrphGS6VEXGcpF63f2t3nlgtqRlRLUaONWj0FIYwAoogXZn/zAEV9N/LyNLDo
         J05CoQa4eBZu5OWGziqezxW7s9J33yGt6oTgWzvJvggt16C493AD69N6fL1oX8R0O86O
         4owDVONrUFXfYCwhKxvUhe6Og51jN2uN+S8ResaBGqbIsrt9X2Ng+lZnUeipUAhgWUpe
         hwPRa6ARpfY4zaavzMceRij+1lafIVnQmAWP/nj6IO66IPpSatzbQHrzx57wJIfSZYCk
         1EIA==
X-Gm-Message-State: AOAM532bivSP1aa+4qbsnmvQZGlBORLzNMUbh/cEmx6W5Y2AnwXfZBse
	XFuyqiqWynqIIkEU7PkIcOE6v+TY3DLKM3BOWig=
X-Google-Smtp-Source: 
 ABdhPJwScWg8ntVweR5MFsACiAbaVQpkhyxnWkN6MvaVu4084q08U0uLPHUf+vn7E3wDpqYjdnpW/gR6QV4zqg+ipPY=
X-Received: by 2002:a67:c390:: with SMTP id s16mr2835581vsj.49.1633597007601;
 Thu, 07 Oct 2021 01:56:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210929132054.117151-1-pgowda.cve@gmail.com>
 <582c9e8b-0b34-dba4-4a6f-1d6ff27f9204@windriver.com>
In-Reply-To: <582c9e8b-0b34-dba4-4a6f-1d6ff27f9204@windriver.com>
From: pgowda cve <pgowda.cve@gmail.com>
Date: Thu, 7 Oct 2021 14:26:36 +0530
Message-ID: 
 <CALY4986EeF05NRTUM7mGAaCpsc1sWXM=KTP+08wRSXDOCumH1g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Fix rust-native build issue when debug is
 enabled
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
 Randy MacLeod <rwmacleod@gmail.com>,
	alex.kanavin@gmail.com, umesh.kalappa0@gmail.com,
	Vinay Kumar <vinay.m.engg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Oct 2021 08:56:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156707

Hi Randy,

>> check this problem still happens with Alex's 1.55 upgrade:

I checked the issue with latest version upgrade branch from Alexander:-
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=akanavin/package-version-updates

It builds as expected without any errors for rust-native with
DEBUG_BUILD = "1"

Thanks,
pgowda

