Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 446D8CAC59A
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 14:28:04 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.15640.1758205674233990586
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 07:27:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GHzntwbg;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so152700066b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 07:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758205672; x=1758810472; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YoxCDGzB9wVyFp9s8Kkp8ZS5Np5BZ6Ux5nKPnEduYMA=;
        b=GHzntwbgKcAVnivYZVlOfoKdaiL16+z1WfHHJKoq+Ys7eFycQVFq3BwTHPAi9hXVcr
         AMlQOI2aWChpNstsCX84uB3ZES3+n+ipUcROnDRS+HCFM54X3qIrrbpHLOB/L4nWAGfC
         lVcoDJPSdm6P9ANnhR9b38baH6qZhsBFleflCFrNZT2HjDTgVOE2aTweE2wrsfc/zL27
         dcPSzzeW2drgl9kuRYaWQedrGcg9eaHXXw4tsef5Hdbrspf+XTYRApMREvFzwz1paNV1
         rkoFn9GpIgrkMPtCXytrg/+zcIjsseJZNAWbhiejOfTIvubLrB3si0ktbe3fpEd30zfk
         CBMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758205672; x=1758810472;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YoxCDGzB9wVyFp9s8Kkp8ZS5Np5BZ6Ux5nKPnEduYMA=;
        b=J2i8nAYIv4Q+2LnRIsYgdqmtDfKRZcYLSbenfx3elG5tkFtRQxjGDUGofT4SzWXwjd
         RGPi/ua8O9ewg4QZnH3cwRsif4GZQtB7PP4m1tbC97G5JM0JbfI71n9GQnteysvhdZp3
         Yd+ZIV39ure9AE/+qpoT65S8GjZuuNlzDtTqkLkeXSg2Ai2mGAv3ieECJ48PH5rbeSNx
         HkeVlYV08uDped5s64keoesuruIiuZCI05AR9QHXzv75ojrTkNdHaPwkj3EbfhpRd+jI
         mti/OsdhIylTL102K6eJBbfI+vaYWMqGffJqwIPxTNu+4Gy2ygGN4zt7SukWqQagZ605
         H7Tw==
X-Forwarded-Encrypted: i=1; AJvYcCWz/DaNp4Qz5+FbPr1L4hAtzoEgdQL9jClDBVcNLukDTOazNlxzXjU8rEOedrBZKd3YGFQxhCVox7LTTonPV/ZqmQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz2Hi23IZ1Q3tygeueS7DMyXRpTCEJfM76E0IV0/WSC2vAjVXij
	jEM4tCmU7a6B5nbzVRwAQliyGwrwNNm1nOkjZ0ZFnzytSJLtiJcU68d0
X-Gm-Gg: ASbGnctQJrnLLf5Lcojht4/vHsRaVvJHTFbPmLxPBUK8Z+2SsFs3espZ2m5RkS5cGfN
	9F6cS0cYsdtPoWJ9s/5oaANGZ9Oa+3ICWIjNUqbOpo+jdfyzuiyTYFh6PWOioQkwqhjjBy5c2Ys
	xiWHjJNBSPHzOF4YrbLRd9cwH7aSLjALmqLakbCv5VFK2wCQNfEiLiPEydZHsIP7sm/bNxQpek7
	QKCxPm75t7ZgrVQax1s60k0jbDB9VtMWx7EZqVtqhZcDzwi1FoftNwWupD0CQREpuW0Rs7fwvtr
	NKSWEW59p2cCOOR1FE/mVVvKc9XXQDZnHUJTP8vk5KRp96LiuU9CyU5sMpqb6Cr8A5hcZw4EAit
	IIc87fZQmtwvGdVGZMShYCT6Jt5e++F5yOiPJrwJAyqF2U5Hkmw==
X-Google-Smtp-Source: AGHT+IHsuKSL4ZuHkFMOMjZBIOhq3GL0tCNzJvKZRQYjrre4SRXt63l/oZQrrnbYkprtvZazOWnWhg==
X-Received: by 2002:a17:907:3ccb:b0:b04:3dc7:7d80 with SMTP id a640c23a62f3a-b1bb2261b1cmr676125766b.18.1758205672339;
        Thu, 18 Sep 2025 07:27:52 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fd271eaf7sm196922566b.100.2025.09.18.07.27.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 07:27:51 -0700 (PDT)
Message-ID: <ea2af4ec-e7f9-45e2-b6b4-20aaa658c593@gmail.com>
Date: Thu, 18 Sep 2025 16:27:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [yocto] [PATCH] systemd: backport fix for handle USE_NLS from
 master
To: emailaddress.ashish@gmail.com, openembedded-core@lists.openembedded.org
Cc: Qi.Chen@windriver.com, Philip Lorenz <philip.lorenz@bmw.de>,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20250918134710.1170816-1-emailaddress.ashish@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250918134710.1170816-1-emailaddress.ashish@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 14:28:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223642

This backport looks useful, but could you please resend it with the
correct subject? If it doesn't contain the target branch name, possibly
the maintainer is going to miss it. You can find into about this in the
docs[1], just at the bottom of section 4.7.

Also, please keep the patch on the openembedded-core@ mailing list, the
patch will find the target audience here.

[1]:
https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.html#submitting-changes-to-stable-release-branches

On 9/18/25 15:47, Ashish Mishra via lists.yoctoproject.org wrote:
> From: AshishKumar Mishra <emailaddress.ashish@gmail.com>
>
> Do not build translations when NLS is disabled.
> (From OE-Core rev: 83795ef6c3fa12a863cd20b7ec1a2607606987b6)
>
> This change corresponds to upstream d848b454e64ffbd642590b4bbc378619e1547ad3
> from master .
> Since the systemd version are different between master & scarthgap
> applied the patch manually
>
> Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: AshishKumar Mishra <emailaddress.ashish@gmail.com>
> ---
>  meta/recipes-core/systemd/systemd_255.21.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/systemd/systemd_255.21.bb b/meta/recipes-core/systemd/systemd_255.21.bb
> index e866f9921b..87e186bbfa 100644
> --- a/meta/recipes-core/systemd/systemd_255.21.bb
> +++ b/meta/recipes-core/systemd/systemd_255.21.bb
> @@ -247,6 +247,7 @@ EXTRA_OEMESON += "-Dnobody-user=nobody \
>                    -Dmode=release \
>                    -Dsystem-alloc-uid-min=101 \
>                    -Dsystem-uid-max=999 \
> +                  -Dtranslations=${@'false' if d.getVar('USE_NLS') == 'no' else 'true'} \
>                    -Dsystem-alloc-gid-min=101 \
>                    -Dsystem-gid-max=999 \
>                    ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', '-Ddefault-mdns=no -Ddefault-llmnr=no', '', d)} \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#65858): https://lists.yoctoproject.org/g/yocto/message/65858
> Mute This Topic: https://lists.yoctoproject.org/mt/115310188/6084445
> Group Owner: yocto+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/yocto/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


