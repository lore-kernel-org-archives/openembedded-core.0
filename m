Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.716.1610748759295792371
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 14:12:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Qg+YLyXu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id c5so10740748wrp.6
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 14:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=E77tFEeY4HwI8UrQ1DqLpM4FNfDY/iCXwEIPzR+S4dA=;
        b=Qg+YLyXub2bxJ+aAKLEZkZXNjICizV26xIXpuYMWFZ7NJ49VpWnzloeOVxjUGpE50D
         CcJuYJx5Dvm+SIaxlBb7hLWoJ3+XzknwkCex0W/FZiQdj51a1RYhv7hQwaR0o1JNx8RH
         qzBlmC37+IdeWsHe86UGoNq0FRxH20WyEj2dM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=E77tFEeY4HwI8UrQ1DqLpM4FNfDY/iCXwEIPzR+S4dA=;
        b=ZdeQBR8sUWHi/TUlIqKmJrqZ+kRN8tNDHpqVo8U3focbtVNtebnv+GMewXBS7GfOwR
         Evu2DXsbEXyxeM0Ft8xOsuoLdW3Sul2NfAjRr8U4Jwto4+KyBdlde24M78DPwVZRUKhi
         ucX3Pu1FcBULQAI6crdKXvCQ5nFDuShHbLkxhEdu+t6nZ/LVS6yQxlBdR9TJnHllLtIf
         x+fHvEgIbJkiZ4aJMzLhEWjCDbtwigHcPn8qQQbiWD7PG/xx7ZxtG24bIE4ozrO04LW1
         LbfpQtW/Em/vZ+xNEYnwDIVouyGE7ptKiLc5belYoITyJ3gWl6RAGq3sEVFAuDRcJK2l
         BpPw==
X-Gm-Message-State: AOAM531IwqIHgJqeXz9Cb62SwVFuCjcXn4FsctKhSOm6MVLHmmR2i2j+
	Q79RT/1vd/HkO+8oAjA+3//Xtg==
X-Google-Smtp-Source: ABdhPJwzZTT4oC/eSGNkb3N8VR2jz/DZrpMopb5rsCILYJBjVBTUj3mDDHxQuFsRTVNq9/8ficbGJg==
X-Received: by 2002:adf:e941:: with SMTP id m1mr9936481wrn.240.1610748757449;
        Fri, 15 Jan 2021 14:12:37 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:b202:f78f:5317:247f? ([2001:8b0:aba:5f3c:b202:f78f:5317:247f])
        by smtp.gmail.com with ESMTPSA id d2sm15957508wre.39.2021.01.15.14.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 14:12:36 -0800 (PST)
Message-ID: <c045063783cf4d1abf831aed2845cc651446062d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] appliance: Add vhd & vhdx support
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Anatol Belski <anbelski@linux.microsoft.com>, 
	openembedded-core@lists.openembedded.org
Cc: Sinan Kaya <okaya@kernel.org>
Date: Fri, 15 Jan 2021 22:12:36 +0000
In-Reply-To: <20210114130123.20507-1-anbelski@linux.microsoft.com>
References: <20210114130123.20507-1-anbelski@linux.microsoft.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-01-14 at 13:01 +0000, Anatol Belski wrote:
> From: Sinan Kaya <okaya@kernel.org>
> 
> This patch brings support for generating VHD/VHDX from WIC. It touches
> different areas but it needs to be applied at once for all the parts to
> concert. The patch could be split, if needed, otherwise considering
> OE-Core as target.
> 
> Signed-off-by: Sinan Kaya <okaya@kernel.org>
> Signed-off-by: Anatol Belski <anbelski@linux.microsoft.com>
> ---
>  bitbake/lib/toaster/orm/models.py                  |  4 ++--
>  meta/classes/image-live.bbclass                    |  2 +-
>  meta/classes/image_types.bbclass                   | 14 ++++++++++++--
>  .../images/build-appliance-image_15.0.0.bb         |  4 +++-
>  scripts/runqemu                                    |  8 +++++---
>  5 files changed, 23 insertions(+), 9 deletions(-)

I had to split the patch into two pieces, one for bitbake and one for
oe-core. In testing we see:

https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/3166

which looks like there may be a missing qemuXXX-native dependency?

(not quite sure which native recipe provides qemu-img)

Cheers,

Richard

