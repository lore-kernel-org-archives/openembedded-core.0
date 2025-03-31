Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70409C3600B
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 10:14:11 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.48385.1743416044755595007
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Mar 2025 03:14:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IRF0podh;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6e8f6970326so39341476d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 03:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743416044; x=1744020844; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TLRqZ6RMAM4TDjfp+ulyjwpgKkQDB1J/vjGDtsfSwmU=;
        b=IRF0podhk7owL+rAWbumhiN1GsRmN8razroowN1uIdDsGkERBH3I1zK5KcEiJSLyIx
         GSNcsM+GnwDLv/gSzhvyclTsOBs702+as613/vs/1xORkjuVPD50gTKCjVcDClOVEYYU
         G7AyixnOpxqtcTDofALkOzpPIoSyF9mHSsXmxg5TsTSgSR/XvlJyPtz2sX1N3BBYmoXN
         W8MYnSIvP5+UIJ0HyaCrs/lzn0MlC89XbXWhgl+k7fgiT31aHtS63KGGFeakZxkonw9C
         vXs1XD8KXn0tDLewi5ux+NcX8fcGrduVsWTcH/yWEGsph1B5yXx33UzyfM0rDgiq6EUx
         zkuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743416044; x=1744020844;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TLRqZ6RMAM4TDjfp+ulyjwpgKkQDB1J/vjGDtsfSwmU=;
        b=l+jnJ3BDxkcAP0DAbwztksnC1GnY8nCC/u0ccSe09VB9xBnqfu3OnoYi50lcj6g0fa
         6PSqtJfztjstDaRGGY24ixo+6ZyqtS6CDQe4CnkYgrY3pREm/Aafo4lYV+6TH35L6k9N
         dBPUZXppQjNrRxNGliloQXmpFMfR62FC8tfChISFY4dfPa4E5VPkIzRd/D7SJ4KHznSA
         ET4Wp5VkTVMbQAgBhEEi0dmkb2zLEpc7yb+fVBroN9Q8MhV7rRhfK2p3EzVPQrsAi07U
         DTBvcPd+NOUbxudp/QP6Y5TuwxGFiY0ShP2dE4sYmzY9SADFh5mB5HTwE158vppLc9sZ
         99sQ==
X-Gm-Message-State: AOJu0Yw+2RapAZRWONLX2M6szOfkylx0W62UM0h1bU+CAuJosoI+iqiE
	nu9BJsILSthR8bsk0LguHvN4DhvJ9tzp0PnTudsYgeybqcHs2h8ZeGr3AQbfTx0GkQ7VnI/wBSO
	k+4YfGLQUGi+nj42bPKbnYAzKBOQ=
X-Gm-Gg: ASbGncu0TkjLCFB91VY0MVyQHnI+BL+T/AmozJtRYWvtDhaKuWxmKVj3mDt8wc3RGA6
	mSz5/biXbPKqO4UpTA7rbNazwBKcfJrLHv4Qmf9/UJezSfbS0q3TR1rtkOEq73EcOzMR7wZOS6I
	tXNtjDvRhox97KK/URuUsnott46wjwg+dfDsayRFFDNYS77a+yue1Q4nx2XxCo
X-Google-Smtp-Source: AGHT+IGDWI98jyyVi77FyDtwSnEKVVNwmD0VelCh+jaJzBynpXtwB/WNdRGC1NmdV/x4UiuIG65LQYvH10mL0v0Qkp0=
X-Received: by 2002:a05:6214:4012:b0:6e4:2c6e:7cdc with SMTP id
 6a1803df08f44-6eed60c429bmr123212776d6.25.1743416043841; Mon, 31 Mar 2025
 03:14:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250329-mesa-25-v3-0-f4d0328eb867@oss.qualcomm.com> <20250329-mesa-25-v3-6-f4d0328eb867@oss.qualcomm.com>
In-Reply-To: <20250329-mesa-25-v3-6-f4d0328eb867@oss.qualcomm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 31 Mar 2025 12:13:52 +0200
X-Gm-Features: AQ5f1Jr-2rlrKC7zT3tZtU7b7G2KvgWC2TB7n8G5Ew1GlntLg8PXFLDUIDgAUWI
Message-ID: <CANNYZj_ARKe=acvg5WCquKCSuwsxBm4fmRLKDuQVt94gXbo3Vw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 6/9] llvm: add SPIRV-LLVM-Translator support
To: dmitry.baryshkov@oss.qualcomm.com
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 10:14:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213960

On Sat, 29 Mar 2025 at 21:07, Dmitry Baryshkov via
lists.openembedded.org
<dmitry.baryshkov=oss.qualcomm.com@lists.openembedded.org> wrote:
> @@ -23,9 +23,18 @@ MAJ_MIN_VERSION = "${@oe.utils.trim_version("${PV}", 2)}"
>
>  LLVM_RELEASE = "${PV}"
>
> +SRCREV_spirv = "68edc9d3d10ff6ec6353803a1bc60a5c25e7b715"
> +SPIRV_BRANCH = "llvm_release_200"

This can be similarly set from PV using oe.utils.trim_version. That
way there's no need to manually rewrite the value on version updates:

https://github.com/KhronosGroup/SPIRV-LLVM-Translator/branches/active

Alex

