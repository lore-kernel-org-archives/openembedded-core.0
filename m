Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E7A2E77182
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 07:42:29 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.14992.1733989342757038497
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Dec 2024 23:42:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=uEKpDQOe;
 spf=pass (domain: linaro.org, ip: 209.85.167.49, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54021daa6cbso304199e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 23:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733989341; x=1734594141; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W/hPh4OMx8HXuAGKnD54H7BZyDvQL5VY/DytRkWhExc=;
        b=uEKpDQOe3i6tER74JaJNr0abNPeI4pY+y48gNorAnFnb807FEePXjeoLqtbZhwqsq0
         0u1kPXKrdQcB4n9g2ClJvqANQeqoGztV6MnIKDsTjJfKgS/WFnDDalH7aehHLLpRDZUA
         xUWwT8vgwMRvfAOq/JNiwK8dlm6CRvdeW9fLyHj1wg1Et9MlN/9e6iVRcTOwQlCzyNO6
         7Lg/iglgnOj4ReDUaBD+UTUnLT7HTKlDQfaslokD0oCpHryh0wF7Vv9DXZF5HrOyI+7N
         fKJCOuKZJP/cYXt3P3eZc2YkDxJPxMpHeqyFQkaYIJ0d+GfE6oZNHJAtBf+i71bzcvS7
         8DbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733989341; x=1734594141;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W/hPh4OMx8HXuAGKnD54H7BZyDvQL5VY/DytRkWhExc=;
        b=PG4gl1c8T/8Wy6z8jDLuCSVpiDJj4iodZcltuMyXQSxuN5Vc8fIArRR6t9kMVwbZlz
         FsDPOT5x34vJ3JG3my5p0hXYDWABJlDi3+aMVVwROwNubdhiDynwOgjvxE+ZDaw42lRA
         qxkRypXlovCthL5vqgQ2QWvUAwE1phDlbO19E9/fOtCrfuUCje3jmSkqbV4IqG8YQVCP
         V5a9BazKNzHvxsMMjI4Ngmlfg7JSogkoFl4KOK0fyM38v/p938gz/pe65NZUyp7YKQWl
         h6zoYDF+PsLRVlUTMMgIgSt0usgKnv8J7kkGhzeG8fqgjPMegJrUhaQEAQJkxwuqkwTo
         N4ug==
X-Gm-Message-State: AOJu0YyUkOoplIioSNLEsoF2NpTgNL5XS7A8qWX6yYPJc2yCRI+ywudZ
	7P5KXxqOCuafV85gkC4RMKflll1c0UJ56r6BXf3eaqurm1d4Mw52N+mJzYwA3Nk=
X-Gm-Gg: ASbGnctulJ3bJOwA/GIoEOTa0ILR07V4fK9xvFv8Uta2uTW0xWvKuEaqXSuH/qbBzxz
	5t98H6v23bNTtyzUJV4RnUua/ivv2GKiczvCVzcSFfuHY7BmyYuc6qgLCAjTwcpWdDT4/BZW+/q
	t71Br5Baw42lEnkHnWoqIECu+IWpBW6IqytMFtWZLtnGm+Q1Uty7CNGOjtNiez4zUaqfpBK8vZg
	meWMTcZWaFV1W3HfBXjRwMDgVbp9Gc8PBTUs/WojGj6oPOozRd+7Qu2sQRHl73ffqbL4QTNejny
	xXHdBA==
X-Google-Smtp-Source: AGHT+IFAY1hdKLNYCPXgalsKuNVjOWGEC+zStYkNxDbiywCN7RQ8wGUl6yrW6hBY6n8mSULaM4RdAw==
X-Received: by 2002:a05:6512:3c9e:b0:540:2549:b5ad with SMTP id 2adb3069b0e04-54032d34779mr118735e87.22.1733989340773;
        Wed, 11 Dec 2024 23:42:20 -0800 (PST)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5401c344ce5sm1397430e87.224.2024.12.11.23.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 23:42:18 -0800 (PST)
Date: Thu, 12 Dec 2024 09:42:16 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: Re: [OE-core] [PATCH v2] systemd-boot: upgrade 256.8 -> 256.9
Message-ID: <Z1qT2DQ_jGIstNcY@nuoska>
References: <1733964540-5537-1-git-send-email-wangmy@fujitsu.com>
 <1733964540-5537-2-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1733964540-5537-2-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 07:42:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208626

Hi,

On Thu, Dec 12, 2024 at 08:49:00AM +0800, wangmy via lists.openembedded.org wrote:
> From: Wang Mingyu <wangmy@cn.fujitsu.com>
> 
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  ...ystemd-boot-native_256.8.bb => systemd-boot-native_256.9.bb} | 0
>  .../systemd/{systemd-boot_256.8.bb => systemd-boot_256.9.bb}    | 0
>  meta/recipes-core/systemd/systemd.inc                           | 2 +-
>  .../recipes-core/systemd/{systemd_256.8.bb => systemd_256.9.bb} | 0
>  4 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-core/systemd/{systemd-boot-native_256.8.bb => systemd-boot-native_256.9.bb} (100%)
>  rename meta/recipes-core/systemd/{systemd-boot_256.8.bb => systemd-boot_256.9.bb} (100%)
>  rename meta/recipes-core/systemd/{systemd_256.8.bb => systemd_256.9.bb} (100%)
> 
> diff --git a/meta/recipes-core/systemd/systemd-boot-native_256.8.bb b/meta/recipes-core/systemd/systemd-boot-native_256.9.bb
> similarity index 100%
> rename from meta/recipes-core/systemd/systemd-boot-native_256.8.bb
> rename to meta/recipes-core/systemd/systemd-boot-native_256.9.bb
> diff --git a/meta/recipes-core/systemd/systemd-boot_256.8.bb b/meta/recipes-core/systemd/systemd-boot_256.9.bb
> similarity index 100%
> rename from meta/recipes-core/systemd/systemd-boot_256.8.bb
> rename to meta/recipes-core/systemd/systemd-boot_256.9.bb
> diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
> index 989ca667b7..b85d5b187d 100644
> --- a/meta/recipes-core/systemd/systemd.inc
> +++ b/meta/recipes-core/systemd/systemd.inc
> @@ -15,7 +15,7 @@ LICENSE:libsystemd = "LGPL-2.1-or-later"
>  LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
>                      file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
>  
> -SRCREV = "a2240d1cf9f3515728186c2c98a6f4b64a40e4da"
> +SRCREV = "f15fd96efd5ebdfb18746acb0cbb35a4331b4d8b"
>  SRCBRANCH = "v256-stable"
>  SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANCH}"

NACK: must also update systemd and systemd-boot-native recipe versions since
systemd, systemd-boot and systemd-boot-native all use systemd.inc.

If this update is automated, then that automation needs to be fixed to update all
affected recipes. This same issue has been in a lot of update patches.

Cheers,

-Mikko

