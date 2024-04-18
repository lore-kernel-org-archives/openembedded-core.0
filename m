Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E752C05023
	for <webhook@archiver.kernel.org>; Thu, 18 Apr 2024 05:33:11 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.5990.1713418376121586185
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Apr 2024 22:32:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PLaZXGrR;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-518bad5f598so497442e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 22:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713418374; x=1714023174; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DSb65W3VZDMx7hcFH93NZiiBY+/3sSNMheiYAODsLtM=;
        b=PLaZXGrRdQ9IKQurmq2LHDYW/8xWO5EgyCySKM8QiaRq/n3i4K33T9y2lg9OwI0p/L
         hhrxcM4gCyaYP9x8wuVQt2huCcjcc9Ac7q00MkleeolOHtA+Sg61UF/fy1gE0aJ1Fd1a
         TU2v5zM91cObq9OXgMC5qWj0bqZ/Zv8sPJzPuBe48ylCTn1g5zoVKpv4vJxbvMfxm1CS
         csB1jJ7VXoDE0Ear3FHlNvicxK2bJo0Gxarpxlmkn+xFLjAgsyroV8cnBAohShxcDHQK
         c6xaNKQfX4dTN2IQB/mV2mVmrXULWwFjIknfRPb9NQsR46Xz/rZsiJTtdCr+AUbsh64i
         rwRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713418374; x=1714023174;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DSb65W3VZDMx7hcFH93NZiiBY+/3sSNMheiYAODsLtM=;
        b=pOvc150da+mLsqlt+tJEOlC15aTlrHVWoiu2VnB7R1qw7U1QBV4PZh4pwrDfwqq5bE
         +gOlO06R7w5ospHT0gWgDDqcT2g3tHvkAo/KA31j5SPuQuAU/yQqwMu/I8pzpziHh+nH
         RadwcpRlzqeyNH8p310/HkTtpFvdeveR/7JXAmP8ZmEKZujbIH5ADcyxrfv891XojKVx
         BRgxY5vIQ0oPi1tAzAZFpkugdXykoTSgfkpPoHmeTTohQMiIQL1p/EEafcLDiSo1g0nc
         hKwGIoZyz2wDMx78AiXRgzRpnGKUA1MfcF4T1zgJrIK3QfDPEEIAoeF5f3buJk8gwjaY
         +V4A==
X-Gm-Message-State: AOJu0Yw3g6U/y0ZFtGFKwBE9xM456QIu2YbU2Dxyr6TbxVPUeNi0riu9
	8d9Cp/wF4Lnyy7vFP57kospSHke259p0Z6xZlu2z3m3hTVXjqNQcIQj1D6VbPcib1fu6ITKnrWJ
	CigkMrjNw7N6IMFATgAZlSUI0tgc=
X-Google-Smtp-Source: AGHT+IEQlOvBxWnf92nkNhm8XXl4Tg4QJ2UfOAnbxwNd+e9r76TYnMioTnctZbZ9ZWbFAk+7pWXFnooSpNxd+FgWOnc=
X-Received: by 2002:ac2:5229:0:b0:517:5dab:1ce9 with SMTP id
 i9-20020ac25229000000b005175dab1ce9mr708765lfl.45.1713418373615; Wed, 17 Apr
 2024 22:32:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240418012247.490545-1-leimaohui@fujitsu.com>
In-Reply-To: <20240418012247.490545-1-leimaohui@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 18 Apr 2024 07:32:41 +0200
Message-ID: <CANNYZj9cNeBkM11JteV_Cg51Ogti9Y0rr0kuMum3kOZuCKHw0g@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] libbsd: Fix conflict error when enable multilib.
To: leimaohui@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Apr 2024 05:33:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198497

On Thu, 18 Apr 2024 at 03:23, leimaohui via lists.openembedded.org
<leimaohui=fujitsu.com@lists.openembedded.org> wrote:
> - The path of cdefs-64.h and cdefs-32.h in cdefs.h is not correct for libbsd after enable oe_multilib_header on cdefs.h. It is necessary to fix the path.
> +do_install:append () {
> +       oe_multilib_header bsd/sys/cdefs.h
> +       sed -i 's:#include <bsd/sys/cdefs:#include <sys/cdefs:g' ${D}${includedir}/bsd/sys/cdefs.h

Can you explain a bit more? Why and how is it not correct? Why isn't a
similar fix needed in other uses of oe_multilib_header?

Alex

