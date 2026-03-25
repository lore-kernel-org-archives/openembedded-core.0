Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B181106B52B
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 12:52:15 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21448.1774443131312034992
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 05:52:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AptaonP8;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-506251815a3so54053041cf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 05:52:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774443130; cv=none;
        d=google.com; s=arc-20240605;
        b=Hll3SJdz14SiAOm5IgiCYHBBl8uT8B2/lkoz12V1f6gOA1ezkHeQXageJjgJhbrUbY
         1LjJd7NLHLUL/gHLXFvJxuD3MztfY2EjSCeyAxOeC1YgmoFD6OFXHfbw+mpdKjb+oWYZ
         jslmZgo1A8b3d529FCf+s52QlSRRLUSZMSxnPCcdfYiC6BtXZiR7oi0AHYH1D/IyC964
         NA9iVLhfnVtbHipXy+9lV2L7LTsOqsp4sSy4H0e3u+1ty4q3qJM9M0frf7dfdcUruI+W
         mGhVhPHKG1prFnK4f+6BMGz7d1/QT3q8vG+ciIe/QuCGi7r1xB2gPqnL5c/owGwI6YHM
         ZhUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zcRt8IfM0DX15Mm3S8o/l97k1N1XvE2KVBar8azAYVo=;
        fh=9D+wO4L/BcfMC+L48XUyAJ7uB3WQ1nDhmbVYuLtgJJ8=;
        b=Bu8C4oiBsawPTf5SjrFjcveos9NTwl+n4lnXPghaOdojPUPEEdH9Mglj3RGEo82bsH
         kfBsWqsQYMmrpkRI/qKJC/Mzk9/JRJdcPxBEwlzdQbmaSIB3VlMYOyPhqK9IkX37ppVv
         kOwxqk0p7HRB72h6O8USiC+GVNcw6VESnngNynOkJIFf2s7i3RiPj6wqQnfwupkOVrDj
         PCOsdaVoPUx7n61mcI4ZY5JPSB22do7x5Y6HzvEBl9X5gYwVDtfCZV4Iqmzam7Yb2/OR
         I2kMpMNJxiFPhwaPSux5PocCuKyEOikFuB3rY3Gg4Dkf5+W4QrlZ0yrAbq+RMvTn2RrZ
         LEPA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774443130; x=1775047930; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zcRt8IfM0DX15Mm3S8o/l97k1N1XvE2KVBar8azAYVo=;
        b=AptaonP8tRm92nfCl2kIue1xR1dQUjbR1tQGBXCIkH46eG0elBHv0wUhurtxxz7nRA
         AY8JNDp7uqSfi5KgCbLE/VFugaaGzmp3nTgZrbERnOREkgd9pq2iLQxUHplqU0klyIlm
         4s7FyJaM0uHFrAgqpYgtXNyB5rFdmRuUuJJ1v/3eAZtug8GUiBCmjbWoIc6nW+6ZSeoD
         lUZpoO8MkqGezK3DT4WzO5MJ+sNXMnXdUW4Pk7BWR004RcaV3xk+VDeddk0nzBkO+iaK
         jM405kYEJmvnjhyXqD7mDkW15GyMcyLFd5pjpS1++shZQmY2yTISr6keItCXZwOPrA0H
         v/rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774443130; x=1775047930;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zcRt8IfM0DX15Mm3S8o/l97k1N1XvE2KVBar8azAYVo=;
        b=BSKk51C07iB5rkUotgSsCqnvO4tZluWhsSKDti6eh1ZbbP/FbtJLz98QS8HVqYdULb
         oRH3SWrg0+fzeb5dOJWHPPFwH9v0W3KNlCIZfr52QhPwQXr/P5LF/AKVjwvPNd+GMMqa
         9vPi8dOtAOLeqMZ5+ELgq0PoBY0dLul6MrCbBP1/Pwu9qNh9wJlt/z8btsyxCbPALP42
         IfQQpPkaFBG3Ku2BGMyXapotaW8Ih4BSW5CIfXERdCD/K2fdWYANboCUCy2lSgTOx/Kf
         GOhiJrZs9iTmCQjpUZ4zGvj4YMnKw3X7HQEM9L0LDqSNrAwOz3yVSjXDZw3fGwlVsj1B
         1ABA==
X-Gm-Message-State: AOJu0YwjoDvC0klc54uyHdFV1ni9iZwiJPOonAqGsYXvL6/7/rXV8rtd
	3Tqq7sCI/R0jfGQu8rjByk1MslUVFuN5kWpsVg1wwzS5A64cJko+JxC0GlbU8lGSf4l3hzaiW7I
	VBmRxPJlI26hZlewL8u+29UoL0YZc4sfekujO
X-Gm-Gg: ATEYQzzV7x+g+2LIKRTlS+N6Wpup45g0ZzrppLZB+uUAhasbgDvsUshKzfTUq/8DW8N
	tZtKCv+dVv3ShGw168H/9v6HZ8rEQj7GoQKxiKm38KzD1IxIJ0KpX4hSq2PsUIMI38zkNc+4zXP
	ZwsUVc8QIppelLeLMlOM+EkJKttue119v6FaEYz7no0a5H/95qHYhlwDcHwverSBilPss8+J9r7
	d/EQ286Ae2SWfCJAMbJlCQCcXqlIiAeP7rAol2o3LRaVkk8Vk5obiI+vHZDP2NQr5OiDDO59ple
	eCCFfURvXoeegXH1SdeypZZITYX+WiqNPwsNCpzVg1BJQ1csNh9r
X-Received: by 2002:a05:622a:6016:b0:50b:49e5:989b with SMTP id
 d75a77b69052e-50b80d190a8mr33594331cf.22.1774443130142; Wed, 25 Mar 2026
 05:52:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260325073954.1176537-1-khem.raj@oss.qualcomm.com>
In-Reply-To: <20260325073954.1176537-1-khem.raj@oss.qualcomm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 25 Mar 2026 13:51:59 +0100
X-Gm-Features: AQROBzDwRv6BVy2TKxm5q_JTr_-zxM2VR1pnGiVTjRNFu-ntQyVuRPvg6J5-QBQ
Message-ID: <CANNYZj9AkosvmmNePiALvwVkR2rsthvsGy3ARLTmWxKh=t7OaQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa-tools-native: fix do_compile failure
To: raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Changqing Li <changqing.li@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 12:52:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233902

On Wed, 25 Mar 2026 at 08:40, Khem Raj via lists.openembedded.org
<raj.khem=gmail.com@lists.openembedded.org> wrote:
> Fix do_compile failure:
> ../sources/mesa-26.0.1/src/panfrost/lib/kmod/pan_kmod.c:7:10: fatal error: xf86drm.h: No such file or directory

> -DEPENDS += "libclc-native spirv-tools-native spirv-llvm-translator-native"
> +DEPENDS += "libclc-native spirv-tools-native spirv-llvm-translator-native libdrm-native"

Should this be in PACKAGECONFIG for panfrost?

Alex

