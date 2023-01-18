Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D05AC32793
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 14:47:04 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.16890.1674053222293405359
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jan 2023 06:47:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=UcaQpJNV;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.49, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f49.google.com with SMTP id mp20so37200432ejc.7
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 06:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pXH9IASSMeAnhuoMAimEHwPs6Fbif81xg6Xw9qZX+5k=;
        b=UcaQpJNV8wtDiri5m+Z+ptOiMN6EIevhoz0Yg1xFbJiGmxq4g3yfO3lIrOxiKRQiDG
         e9aEQthUmeN3/wmxo608BuG/2qcgFNSmNmL1rrn4fvh13e0ddBcAfxw5WykGTXW+D1OG
         DOGqWmaGqaMqsiLF9IWJJsL0YUjhCRqI5Aslozz/SuVZWzvl8NC2ej63MOLpTSxhxcdW
         +S/k7s0w44fT5/wXvuZKkiLJX2sDedeRmo7djBhVLI4iXt3czWUA2V6AEy4lpTquSIDO
         IZCQpAxUufCyPiZUVk/hnAMHJchZ8pQh4HIhdolP/C6o7RooxUaykHhWACYEOygiG+rd
         G3mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pXH9IASSMeAnhuoMAimEHwPs6Fbif81xg6Xw9qZX+5k=;
        b=DLiNAt4Lq2SDMCTaup5ba9XzDU0/du5FCgUOfbmwML69PhkuWgOO7MXKYUyl/qfF71
         2NaWXG6lJAjamc2VL9JV02zT2/xrqZhrEq5FOF2LoXRWOjA4iYrwbhokK2fnBkQS6/J6
         lTr1umI6ppBF8Yohm8tQQdSpElz6I+trzx2tkBW5p5RTrEMtNm5EvbBc/Q9ATqj7eGIi
         HlL1cgPwRS9QlnXqmQuIK/e8PqTcN80TA9qGZsWcBuh7sPxe/iw+u8Ep5aeU0gGpm5IO
         DYj2kQKST7qWFduO0IcZtR1mquK3yA5CBDYl1+y1NcTWaC/EQH8ViasbohpscwWlTtHt
         Bzdg==
X-Gm-Message-State: AFqh2kpdfmc7c4uKU2dg9McsTAf20gZBbUSslWEBM0MRoWscOsplqxEa
	DA/6HuX1D+S6qxTrPpCmyJlwijwcPby1vOY8yjhuCA==
X-Google-Smtp-Source: AMrXdXvFsyQH1jyJ7OqDmP0X3c0oL3k3uy7KkcRFfeLu1ttKVjbIqG8xY6laVq/H2K1yBKkDolub8wyr91p1nxBWNm8=
X-Received: by 2002:a17:906:3a5b:b0:870:baa6:676c with SMTP id
 a27-20020a1709063a5b00b00870baa6676cmr721930ejf.132.1674053220370; Wed, 18
 Jan 2023 06:47:00 -0800 (PST)
MIME-Version: 1.0
References: <20230108172535.2366114-1-sandeep.gundlupet-raju@amd.com>
 <89dd40da-14b3-7535-0177-acce59fa087c@amd.com> <f8fc990a-fac9-3cab-95e8-19c62c05f907@amd.com>
 <49792f50-c378-bad8-0d68-9160166ef103@amd.com>
In-Reply-To: <49792f50-c378-bad8-0d68-9160166ef103@amd.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 18 Jan 2023 04:46:49 -1000
Message-ID: <CAOSpxdYrTx4HRbDcJ+G=-Zq6ffcCXyqh6DbUkfCQj=Y6HPjaXg@mail.gmail.com>
Subject: Re: [OE-Core][langdale][PATCH v2 1/2] kernel-fitimage: Adjust order
 of dtb/dtbo files
To: sandeep.gundlupet-raju@amd.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"michael.opdenacker@bootlin.com" <michael.opdenacker@bootlin.com>, 
	"bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>, richard.purdie@linuxfoundation.org, 
	"mark.hatle@kernel.crashing.org" <mark.hatle@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 14:47:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176102

On Tue, Jan 17, 2023 at 6:35 AM Sandeep Gundlupet Raju via
lists.openembedded.org
<sandeep.gundlupet-raju=amd.com@lists.openembedded.org> wrote:
>
> Hi All,
>
> Can someone merge these patches to langdale branch?

I already have them in my current test queue, which you can monitor at:

https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/langdale-nut

Steve

> On 1/13/2023 9:51 AM, Gundlupet Raju, Sandeep wrote:
> > Hi Richard, Alex,
> >
> > Thanks for merging the patches in master. Can you merge these patches
> > to langdale release as well?
> >
> > Thanks,
> >
> > Sandeep
> >
> > On 1/12/2023 7:19 PM, Gundlupet Raju, Sandeep wrote:
> >> Hi Michael,
> >>
> >> Any updates on patch merge?
> >>
> >> Thanks,
> >>
> >> Sandeep
> >>
> >> On 1/8/2023 10:25 AM, sandeep.gundlupet-raju@amd.com wrote:
> >>> From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
> >>>
> >>> The dtb files must be before the dtbo files, otherwise the overlays may
> >>> not be applied correctly.
> >>>
> >>>  From Bruce Ashfield:
> >>>
> >>>    We can split between dtbs and dtbos, they just need to be sorted
> >>>    for reproducibility reasons.
> >>>
> >>>    Of course, this was only working by luck previously (before the
> >>>    sort), since it has always been gathering dtbs and dtbo's with
> >>>    find, depending on filesystem ordering for the order in the
> >>>    fitimage).
> >>>
> >>> Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
> >>> ---
> >>>
> >>> Changes in v2:
> >>>   - Remove 2 loops and use single loop for dtb and dtbo with same
> >>> logic.
> >>>
> >>> ---
> >>>   meta/classes-recipe/kernel-fitimage.bbclass | 5 +++--
> >>>   1 file changed, 3 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/meta/classes-recipe/kernel-fitimage.bbclass
> >>> b/meta/classes-recipe/kernel-fitimage.bbclass
> >>> index 8ddebf8dd8..06cdc4f1ec 100644
> >>> --- a/meta/classes-recipe/kernel-fitimage.bbclass
> >>> +++ b/meta/classes-recipe/kernel-fitimage.bbclass
> >>> @@ -546,10 +546,11 @@ fitimage_assemble() {
> >>>         if [ -n "${EXTERNAL_KERNEL_DEVICETREE}" ]; then
> >>>           dtbcount=1
> >>> -        for DTB in $(find "${EXTERNAL_KERNEL_DEVICETREE}" \( -name
> >>> '*.dtb' -o -name '*.dtbo' \) -printf '%P\n' | sort); do
> >>> +        for DTB in $(find "${EXTERNAL_KERNEL_DEVICETREE}" -name
> >>> '*.dtb' -printf '%P\n' | sort) \
> >>> +        $(find "${EXTERNAL_KERNEL_DEVICETREE}" -name '*.dtbo'
> >>> -printf '%P\n' | sort); do
> >>>               DTB=$(echo "$DTB" | tr '/' '_')
> >>>   -            # Skip DTB if we've picked it up previously
> >>> +            # Skip DTB/DTBO if we've picked it up previously
> >>>               echo "$DTBS" | tr ' ' '\n' | grep -xq "$DTB" && continue
> >>>                 DTBS="$DTBS $DTB"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176053): https://lists.openembedded.org/g/openembedded-core/message/176053
> Mute This Topic: https://lists.openembedded.org/mt/96134986/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

