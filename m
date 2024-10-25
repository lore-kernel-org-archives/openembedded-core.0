Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E50CD149C6
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 16:26:49 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.16104.1729873601740329314
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Oct 2024 09:26:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FPDHkvve;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2fb3da341c9so23842461fa.2
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 09:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729873600; x=1730478400; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xrE4FpSqwfCp9AInpX8zzeQ17B4xDjSGA3Of0dvhUng=;
        b=FPDHkvveQpU2SOgCdHP6HqdSSqBOTWso8efBfd4hfj7M5FeYEKxnVYMjr1P/VztZzb
         XQ3qZDdnGYMl2ruJ/Fdi2OQY0EiOY96aETBnmN9XIojJ/KzSQ0kHntG0xzG07HiwkGQL
         c7JiVP0r7td1RSSAJ6i0At+2YgukcqihFVumzATIzDHstSBzmCTa4AlADLBZkLOW25oQ
         LEYbxuvPgIE0SJcA7TNqhiCgwRY6aMDs6yLuZxOYiKBjVvmjfIUUp7JlaycWgCR3DLFz
         R0dy+NGaGWXeX26a+eeE6Aq+lO8rTFU4ZtJXP1AJ2lXj9PuTModVoMTSiO88rYsE8jY0
         4UDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729873600; x=1730478400;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xrE4FpSqwfCp9AInpX8zzeQ17B4xDjSGA3Of0dvhUng=;
        b=qcMwg1iliirP8Q6019hwa4iBcRN1LI34meYgdYs6j0q44nUoDxxfqd4hByjospPGpS
         9v/2AgnmW46ffUkQ3e099LktGTlqNrDwKfVj0GKXfbJ74ixu8VLejVbyFRkIGl0H/w4l
         2tzrlKqc0R0CShN1uZ4FtRCjvmR0SpauKak1p8ZHWCuGjo62k/mYB6ShRgAqvqSKoqMB
         saaLwkh4kPfOGHUz7zYYSBCV765gZMubAEwBEiVeDfTQtbC5yrq42wfzBLoCjXZHMLH1
         uD9hutOvnI7qkAN5qvHdzBl30It96QH/MuxlDUE2NaTxDKeyulRHXxQHIXAVtGra3vdu
         IDqA==
X-Gm-Message-State: AOJu0YxmIzazofGRbpqBatukp7nHrR6ZifVHncbHLPHUqYdK265sJwgu
	GMWMX+/jEsuO2RKv56q1sX1Sy4jP+RZitVi9U/GLmXz4RWl7a5RaxW4FN0Ka7e6rjI9u6e3Tfwi
	v4Bupdyc+DIVuZ9l7Bs479Y8Jkic=
X-Google-Smtp-Source: AGHT+IHab+lXIikaib3/T0sxZFqKGI52i8FVg/kkhsMh5d/U6Dl3a0oPnScEUybvP/fT/FtDzNV+bMGcAkB8xVZmMr8=
X-Received: by 2002:a2e:5152:0:b0:2fa:d84a:bd8f with SMTP id
 38308e7fff4ca-2fc9d376e24mr40251591fa.30.1729873599625; Fri, 25 Oct 2024
 09:26:39 -0700 (PDT)
MIME-Version: 1.0
References: <20241025161627.3352-1-sreejith.ravi087@gmail.com>
In-Reply-To: <20241025161627.3352-1-sreejith.ravi087@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 25 Oct 2024 18:26:28 +0200
Message-ID: <CANNYZj8+5LwPXrQ4eda4muAdOmpfvkg5oo0GXzCG+HJJh65vDQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] package_manager : Add configuration option to
 select filterbydependencies
To: sreejith.ravi087@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 16:26:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206355

On Fri, 25 Oct 2024 at 18:17, Sreejith Ravi via lists.openembedded.org
<sreejith.ravi087=gmail.com@lists.openembedded.org> wrote:
> Currently, filterbydependencies is always set with True, which results in
> the creation of `oe-rootfs-repo`. If filterbydependencies is not set,
> it creates `oe-rootfs-repo` as a symlink to the "DEPLOY_DIR_<IPK/RPM/DEB>"
> directory. With this patch, users can configure this behavior according
> to their use cases using the variable `DISABLE_FILTER_BY_DEPENDENCY`.

You do need to explain why. We've had this before image-specific
rootfs repositories were implemented, and it was causing issues when
building images from deploy directories that have unrelated packages
and/or other bitbake tasks writing into them.

Alex

