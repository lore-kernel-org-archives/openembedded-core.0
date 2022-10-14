Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70159C433FE
	for <webhook@archiver.kernel.org>; Fri, 14 Oct 2022 08:34:27 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web10.4911.1665736463352809712
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Oct 2022 01:34:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=L6awj1tw;
 spf=pass (domain: gmail.com, ip: 209.85.166.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-io1-f50.google.com with SMTP id i65so3370037ioa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Oct 2022 01:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h/u/1Od4jTQueMtxUgtBCMzuHHLVA79wg4/RrWyeKjU=;
        b=L6awj1twshJ4xOeNfHMtPbedCWpUl4Fkmz7oZUb+Lcv5JbonP/wXEq7rb5LyxiOp69
         foKu0kmcu6g6M912GVeCsW6Ukz5WRkiJu6DRRJKasOhEr1/aFtRnQfja6EF/QElnGvt/
         4Q9KvUDt/0JhwrP632TzDTD3MH8OPtzBGpSwEWVPBdrjfz+2SN1/XXiQcPRTOAMHxeMN
         8V+TWl3ZqteDey6yDw4bhUWXX457f62/wHtz8QU/2+FbZS4wMPT4C0D4svik8BWMj3Wa
         xo42CSWO+Gfr4vd06GRUcjdYm0V7EhPweN5cWpbCyQVnbrAFN7H9IyuvWm1FCfBxTnCV
         dP5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h/u/1Od4jTQueMtxUgtBCMzuHHLVA79wg4/RrWyeKjU=;
        b=InqdMBIEZnrCn0+xvUKOiRfGEZfwRIcphk9xZC4bsDS/5pnNSiMa/eW7UrRRnrnHaZ
         9zFb8eO/aCXq2PZmjM+dEgQ5DqAhEpBogm0VqU9gQP74VEfaGaZyHYVc5X5vgRpsMyxp
         Hn4BJYBnMbxiq5PE+PqscBvf1Ts4i/tNN0DKseRgLElCx1/B/644GC2HGmUB3Qqf4VxJ
         oPWuAOvRqVDfVo02aZoszB/wggMhshDQIbcX9uu3OM0F3JW49UAZLKh23g1kx5tph2oi
         +VAwsp2MJCX6yFV4FGVD4RJtzG0h0EVgpuIEk6adhrP1F7CzlPI8Tnb1SMSypR6THDSg
         PzPg==
X-Gm-Message-State: ACrzQf2aQyPiPTGIRY/yb9X0oliytwnLtAuQct6GW7JgKtwZAKtUxDvZ
	aWkmsIdXOIIcjzphjy3tuOcJ0fo7UHI8nKc53Jw=
X-Google-Smtp-Source: AMsMyM74VzXsIbXC9jq1iFtt4sqRVxSNr2kqt9j9/PRf/s2rPxhs3j0R+5opMQbni1+RNgLvwaBPvaZfkbywCEBtAjo=
X-Received: by 2002:a05:6638:14c3:b0:363:b026:9989 with SMTP id
 l3-20020a05663814c300b00363b0269989mr2226209jak.254.1665736462720; Fri, 14
 Oct 2022 01:34:22 -0700 (PDT)
MIME-Version: 1.0
References: <20221014065247.1825762-1-adrian.freihofer@siemens.com> <CANPvuR=UZv6E6rwrBH3J=gv3TLDB==UArMMg5uTGemXT_Cob6g@mail.gmail.com>
In-Reply-To: <CANPvuR=UZv6E6rwrBH3J=gv3TLDB==UArMMg5uTGemXT_Cob6g@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 14 Oct 2022 10:34:11 +0200
Message-ID: <CANNYZj9YzJXiAcVH92TYLi6q7_PH5woMt96vmMiabKVDWA+zmQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] buildconf: compare abspath
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Adrian Freihofer <adrian.freihofer@gmail.com>, openembedded-core@lists.openembedded.org, 
	Adrian Freihofer <adrian.freihofer@siemens.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Oct 2022 08:34:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171729

On Fri, 14 Oct 2022 at 09:59, Jose Quaresma <quaresma.jose@gmail.com> wrote:
>>          for l in layers:
>> -            if l[0] == os.path.abspath(args.layerpath):
>> +            if os.path.abspath(l[0]) == os.path.abspath(args.layerpath):
>>                  targetlayer = l[0]
>
>
> Maybe can be better to have the abspath of layerpath in targetlayer
>
> layerpath = os.path.abspath(args.layerpath)
> if os.path.abspath(l[0]) == layerpath:
>     targetlayer = layerpath

I prefer Adrian's version. 'layerpath' is not a good name, and
targetlayer does not need to be absolute. If you'd like to refactor
this, doing this with a boolean variable 'has_targetlayer' would be
better.

Alex

