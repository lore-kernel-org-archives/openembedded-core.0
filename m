Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D00ECC433EF
	for <webhook@archiver.kernel.org>; Sat,  7 May 2022 07:36:44 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web12.7698.1651908995100586238
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 May 2022 00:36:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=a8Uh4zfz;
 spf=pass (domain: gmail.com, ip: 209.85.167.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id i10so15912723lfg.13
        for <openembedded-core@lists.openembedded.org>;
 Sat, 07 May 2022 00:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CTgk8hft3qDm1d3zJGi+8pqjLat0BBf/hiPuahT2ygc=;
        b=a8Uh4zfz5eo2rPt9TTr+LTTNaA41bdvyilL8Js8dQmzaCEGux2xkvnUFg02HsN2nCC
         ZS6xfNK/44ZG+kyfoPcrS8fS2cEaCCm4+0qd8Bnk6dL6r2leoZO4EYZ1dA4A2YB9KwJv
         7sYTjvXdNKw0OMFKfu3JwX1uzI+xWHdiRFhXowE6EdIUlmksyctXdS4zsjZZOPVM4FQJ
         wmzBisNlolb84UUV6whSVBNwNtkDfKfb07qN3Hdq0o+WxPiUPmopIfHnv0ZID3PUGAJ4
         AyOfJ356xv37m8JCQOXqFgrpgSNd8fQ+8gZvqndgUw6h5nRvrCWl5Kb9nDHInHhveUDz
         +yfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CTgk8hft3qDm1d3zJGi+8pqjLat0BBf/hiPuahT2ygc=;
        b=y/Kr4McBDJGlutiKUGMehAh7r/ZL7TVZM6Gxr2eKNA1byDQyAqwx+9tKDQ2tzamswO
         O3YikEDcakGptjzRO4Wm85SLhR4BVgb80v3lWZmrdynkxqO1QJITrUlke0eAGWUpayLV
         OMdHZ5GrZdd+wROEJ6jiIphmohEjR2QVWjn9GDGKOmvApdmBAR1xrdZVPzJ//pB93bad
         I8/HO5CGVA6muXpx2dohoW0mHvdIlTnmz8Fd1IsNwieyYSqFvNj9Au+h3vfEyWx3esA2
         bniJFLgx0ffD7wP4kIE0pFQRQ6bdktuhpSOJ2YSOYNN5RQK4uXdrHkNG+lGgAuQKTIMt
         g26A==
X-Gm-Message-State: AOAM532IPV7LwmB8N+eD26caLTiaYEmhbk6usd3UEhLKRbahcKHnPRxl
	Ng7bBR2v452ZwxTkjtXePUTVM0E0CVb44fguC+bD5D2IvWrZNQ==
X-Google-Smtp-Source: 
 ABdhPJyBNnifE3W+zFhsxDZdZtZspGL8cUtKxbOx5utcHwYVKaTtBeHVu/7m5vFuqno28qgKyFtaO4Rpq0gKqMaJmiY=
X-Received: by 2002:a05:6512:5cb:b0:472:f7e:a5f5 with SMTP id
 o11-20020a05651205cb00b004720f7ea5f5mr5074442lfo.358.1651908993348; Sat, 07
 May 2022 00:36:33 -0700 (PDT)
MIME-Version: 1.0
References: <1651808269-3775-1-git-send-email-leimaohui@fujitsu.com>
 <CANNYZj96-SMiUCmTMhZ3uoLSHN8mH0js6e2k2JJQOW3Tp3MV5w@mail.gmail.com>
 <OS0PR01MB6178F9B577423A035BD3CCDDA0C49@OS0PR01MB6178.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <OS0PR01MB6178F9B577423A035BD3CCDDA0C49@OS0PR01MB6178.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 7 May 2022 09:36:21 +0200
Message-ID: 
 <CANNYZj_wg3r2smGwNVoN34L0ai-pPjPEfjg0P7LoQEirfL8rhQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] gnutls: Added fips support option.
To: "leimaohui@fujitsu.com" <leimaohui@fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 May 2022 07:36:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165359

On Sat, 7 May 2022 at 04:31, leimaohui@fujitsu.com
<leimaohui@fujitsu.com> wrote:
> > I think the unconditional DEPENDS lines can be avoided if you use:
> But because gnutls-native also need to enable fips, circular dependency error will occur in this way.
> ---------------------------------------------
> ERROR: 288 unbuildable tasks were found.################################                                                               | ETA:  0:00:00
> These are usually caused by circular dependencies and any circular dependency chains found will be printed below. Increase the debug level to see a list of unbuildable tasks.
>
> Identifying dependency loops (this may take a short while)...

Perhaps there could be
PACKAGECONFIG[fips] = "--enable-fips140-mode
--with-libdl-prefix=${STAGING_BASELIBDIR},--disable-fips140-mode,gnutls-native"
PACKAGECONFIG[fips-native] = "--enable-fips140-mode
--with-libdl-prefix=${STAGING_BASELIBDIR},--disable-fips140-mode"

You can have different sets of packageconfig options for -native and target.

Alex

