Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3316AC0218D
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 08:35:10 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web10.15414.1738312504143335434
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jan 2025 00:35:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=maS/rRcY;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6e1b11859a7so8737486d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Jan 2025 00:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738312503; x=1738917303; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gpgdPnG1/bz0SEu07+fDzjobTs/h9R+P6MA9K1FbHAw=;
        b=maS/rRcYN0NH4ydgY/gwMNeFhZvZhagwGOtqsgLPJE/X44kFLP2SkfxbI1NZ8zVL46
         DJD7JF2UYx1Fb/z0+wmeI5pV3D9E4k+JIaR2zbSuD6I/iOYwJ2slzUEg99qRTj8cYYY7
         Hzb4ngDsWFJpuZQdSvXrnboxoHuge71tiy1AbCUkkO/z4ziv4DhNHs95714bc955X6NF
         b5+9X6wWZap6dU3lVQ3YuS7myVxFDx7X2zaBTyzWzLF/qbvPxgmGfvcDUY2eUU8EBqSU
         Ut4xsVNPetF2diHX9+RULoX6a4jBodhj+LRutoRGxGw0NC6Iicu2wk5Ul6SIF1WPe764
         lNUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738312503; x=1738917303;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gpgdPnG1/bz0SEu07+fDzjobTs/h9R+P6MA9K1FbHAw=;
        b=xQUDwNtnnZCB1z/OBiHvqQGbq7b+w+WekjFzyhNaneiOjXHuv+/5PRGWHXWGatruOv
         SIsAD4rZ2tZsLiKxpH6srXSbpTud3sdVAWibIyURkHShemF3LtSLS+NZMWcr2QSf0gQA
         mr9QKuIWuexM6FiaHI+hm5Wm8WMvryDpF1EkWJqW3WI/SKqVCV57yF6y/Fj5c9aNSVYY
         FepF1M5KX/CY/NB0YXifz3+dJfEy2K/KIuHL8PCfdQBm27TG5k9HSm5hbBS0MzJAuHVH
         VcTiNZcsFkGuK70E+5wXM3aPVNH7GHYBJGIvwORlI84JC4cIXMV/h/8C265lx+/Y2z2g
         pknA==
X-Forwarded-Encrypted: i=1; AJvYcCWr1QI6O6S15EBnY8uilaRPvd2Vf89+tYZbSVk7ETbHJjeyyat86qwaX4o2ij0frb5p4Fc8+1sOvvhZAcUVwqRbpw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy3jasBxekZqEJi2BFEo4JvwxmMLRdIS4xPbYJB8hoq5MIX0KMY
	IcqfI1susqrP9RC8Z99lezoqfmKcShx3j+MTFM3aPYa30ghdoyH6/sDX6H7h1KwQDoeFEJpPVhI
	aZWvWCo9eLKJ+xpAR32Nvtus0Zyc=
X-Gm-Gg: ASbGncvhJ0KZQiH25IJ9klN4CnrfHfopxDwnLPx6/4dcRN0knxG+TooyFZ5pnP9u9s5
	zU1lM+8hIfdv0A5knH6HHuY0/DkA93i4O7vAEXIKrBp87yWsKFrLP76slYE+Arsdtq5CfX83b7w
	9As0fBIvmnOSD4Zfn3EY+DJI0hr4FV994=
X-Google-Smtp-Source: AGHT+IF/V060N1wLi7KV/SYVmPRAPTVcMZJTsPtgcxrypve2WR5zQH1adR1oQCmwkqqSEggoKIBX5VLdWHkEmb2JD7M=
X-Received: by 2002:ad4:5f08:0:b0:6e1:5076:c400 with SMTP id
 6a1803df08f44-6e243c7e239mr126469966d6.39.1738312503055; Fri, 31 Jan 2025
 00:35:03 -0800 (PST)
MIME-Version: 1.0
References: <20250129124741.4115324-1-zboszor@gmail.com> <D7FH5IEPPGUA.CNZMYM7LM2F4@bootlin.com>
 <181FB46B3FA62DDF.15786@lists.openembedded.org>
In-Reply-To: <181FB46B3FA62DDF.15786@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 31 Jan 2025 09:34:52 +0100
X-Gm-Features: AWEUYZl71PVm8qP6fYzpu98GNpZSWra6nn6HgbD9fZqUHRVaMOsXxs8StYB2Ja0
Message-ID: <CANNYZj_auk6QcEzW0NHJpqoYaB0rCD+qiNWDJZOyikM5h_zsug@mail.gmail.com>
Subject: Re: [OE-core][PATCH v3 1/2] rpm-sequoia: New recipe for version 1.7.0
To: alex.kanavin@gmail.com
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, zboszor@gmail.com, 
	openembedded-core@lists.openembedded.org, 
	Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jan 2025 08:35:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210474

On Fri, 31 Jan 2025 at 07:52, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
> > AssertionError:
> > The following recipes do not have a maintainer assigned to them. Please add an entry to meta/conf/distro/include/maintainers.inc file.
> > rpm-sequoia (/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.7.0.bb)
>
> This should've been caught in do_recipe_qa task, right when Zoltan was
> making and building the recipe. We probably have a regression there.

Actually we don't:
WARNING: rpm-sequoia-1.7.0-r0 do_recipe_qa: QA Issue: Recipe
rpm-sequoia in /srv/work/alex/poky/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.7.0.bb
does not have an assigned maintainer. Please add an entry into
meta/conf/distro/include/maintainers.inc. [missing-maintainer]

Not sure why Zoltan wasn't able to see and address it.

Alex

