Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EF3AC19F2B
	for <webhook@archiver.kernel.org>; Wed,  3 Aug 2022 21:14:31 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.365.1659561263418729282
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Aug 2022 14:14:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e7v6pUVC;
 spf=pass (domain: gmail.com, ip: 209.85.167.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id m22so16324181lfl.9;
        Wed, 03 Aug 2022 14:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=arDDSGxJVeWF4hOEFLb9ELWj7Zygp0lzMiPlpmZicGQ=;
        b=e7v6pUVCJHT7Dl1XBMFZTfuMxbzFK5h9nGYIWhRgPdY0hyOEMKHyWwJW7qIEIBz6/T
         FZJ0aRI3E55vf8ncwSaJ/EaEN9pWIvHL7a7v6VlxAbyBM7Vlbnpv9XxkdV0xA/AGqxnJ
         JN2vLMuVCG1GvxQ9fN3PmqQAhiBCQyZs2nI+Ax+z6ZHx91Wq45Pu3NJyYLjwTHCZUrbX
         icJEVbZQobcTPTkMYVQyAIixJt60HaBwwgW0g6sBuD/nSphQT6qPMcvVtk5MKH8VMwgq
         ysAGmR4QC9FyFJqlCXh41rL648UzgKEGIiIyitRRw701iaweIkXY5AzNgrHDVwsGjaaN
         XtZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=arDDSGxJVeWF4hOEFLb9ELWj7Zygp0lzMiPlpmZicGQ=;
        b=XseF9rSCuVYysoaVWZPjtviigaXTiZxHRNvo7Ce3QI5flP/IavvVtB3N/WD1FTymQW
         xVUUICfJANyoPPMBokoFc1K2iaiX0JpmE6qG3Nr7jwsJuxd7D9EhcSGRAQ2VTLGqVNRw
         lZi/bUAhXjtyUKLIsJxMO9E616DOhEjKlBQsrK0HDVph5U8ldGcr8jKfeKR8eKyJv52q
         YKjHeD3y41TQHpF6/mMW43OZ70TJdlPUOwhBpiFe4vKLLq1gg5rbXQCPBG6qkPR7Tcp+
         Nyd/gMMmxQfyw6AoPk1oEX0Dm5z9dFRoh0c+3qeQwxTIDsOuiBaUveuWQnfg12wPKODZ
         4PhA==
X-Gm-Message-State: ACgBeo1NPwluOhaWbi9OwyPoYVI9mCiUGcf/ztZpCcXK2DfbeE7adMp8
	12EWUcj7zQo+/T5MUw2XTkHQ8xhFj+qJkvRtmIg=
X-Google-Smtp-Source: 
 AGRyM1tkP/gAViZTSWXqigqRouDnGLyDkylhYEDoQ14eOYyWt4BfX+kkakNhFzIUnohzh1eRCTaVrAGpUoiSON9sE8w=
X-Received: by 2002:a05:6512:1050:b0:48a:2319:59bc with SMTP id
 c16-20020a056512105000b0048a231959bcmr9221550lfb.665.1659561261514; Wed, 03
 Aug 2022 14:14:21 -0700 (PDT)
MIME-Version: 1.0
References: 
 <DM8PR12MB54305682E3F7A0E3C8D480DB8B9C9@DM8PR12MB5430.namprd12.prod.outlook.com>
 <CANNYZj_z_sBEfsHWkNeBwbY5M+rMPowB4wX-ArSzjnM5rkea9A@mail.gmail.com>
 <DM8PR12MB54301DF4A7AADD3F59F00B668B9C9@DM8PR12MB5430.namprd12.prod.outlook.com>
In-Reply-To: 
 <DM8PR12MB54301DF4A7AADD3F59F00B668B9C9@DM8PR12MB5430.namprd12.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 3 Aug 2022 23:14:09 +0200
Message-ID: 
 <CANNYZj8udmf43H7baFWXKJQTxV+GjMm+BtoFz_OKepM8vOuUdg@mail.gmail.com>
Subject: Re: [oe] [OE-core] Introducing yb - a new tool for Yocto environment
 setup/management
To: Chris Laplante <chris.laplante@agilent.com>
Cc: "Openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Aug 2022 21:14:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168828

On Wed, 3 Aug 2022 at 23:02, Chris Laplante via lists.openembedded.org
<chris.laplante=3Dagilent.com@lists.openembedded.org> wrote:
> But IMHO bundling the layer setup tool inside bitbake itself feels a bit =
like the chicken-and-egg problem. I'd like my spec file (or JSON file, kas =
configuration file, whatever) to be a complete manifest of things to downlo=
ad. But with bitbake-layers, first I need to > know the right version of po=
ky and where to get it. Also, I think it would be hard to implement 'yb syn=
c'-like functionality there, specifically if we wanted to be able to change=
 between poky branches.
>
> Overall the thing I like about yb is that it is independent of Yocto/BitB=
ake and easier to setup. Like an IDE, I can install it once and use it acro=
ss multiple projects.

The bitbake-layers command is needed only to generate the layer config
file (in json format) out of an already existing yocto setup. It does
not perform the actual layer fetch/setup from the json. That's the
feature I like the most in my proposal: none of the other tools
bootstrap the config file in this way, you need to always write it by
hand.

The actual layer setup (using the json) is performed by an
independent, self-contained python script (copied from a template in
oe-core), which you can place anywhere you want (e.g. in a product
layer repo, or in a 'config stream repo'), and which does not require
an active yocto environment or a poky checkout. The equivalant of 'yb
sync' would be to pull that repo to get latest revisions of the script
and the json, then run the script pointing to an existing checkout -
it will sync everything to the revisions in json.

Alex

