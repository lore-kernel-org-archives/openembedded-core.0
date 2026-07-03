Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3735AC43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 21:44:44 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.101551.1783115074909080633
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2026 14:44:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BRovvP7X;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8ea93125ad1so6346446d6.2
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 14:44:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783115073; cv=none;
        d=google.com; s=arc-20260327;
        b=eHsucK9WhAnlsOZgFM5Asz/AI4zxNjjm93kuywVdfJ9/XLjtEaauqu/tAW6nqx9qAW
         lJIPJQ4ZAybyVGWlpzdJXe/NK1gIM17dpAUpSHpVbGt9/TjUX7nbUSOsv6x1LxWcsleU
         bfsceg3wOa6eeGh/6FZZkALODEuGuOxMXsPUyi8t/DnI6i+3QFRBwVlKPHgvKrUG82Ly
         CugbKj3qpJ1qwNcazH6d0XO4tDJDmV2ggaYn99k1BpxB3d3CCOLTnXSGoxgbl8VDEjGi
         oXh/e6HIcLH5vLfC/PRz48VeIWyVHhhasIvmeQQx35XFsP4RDuNNsXGZzuabyYVB0Xmf
         i8sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CYGlKYk9M8R9xsq2OIX1UqkZBi4uxYtyzBiuRuIdW8w=;
        fh=+JbhA00V651+6EHQa2mrt0oEvrbacg3qAmnuwPwLuZM=;
        b=f+0fWpyvjSA+z2Rayqil1UQdbQnx+oCObd3KKYXKJYs4nMYqFHK6JwUOSk7929upEs
         p5nbiYjIXKCLZndZzwfuvtQ++oHEhB7r7pj4Q25Lo86DpwKJRH9PdW8Q3x6qsh31Rvvv
         rAvXV8E0Zz8vn4V2Bp1+RchJxUsQan5v/15QM5uTR9pVBNte7SGNat6xfxdCfaa1DXwR
         Mjf5XoGlsKMGST8aXNDyShnPQM26SCz6s8zleW+SCyvo7SQWIxe/SCftIO5FWUdsXhjG
         ExcmBLrX8HN/Kbi1FcDYxKvxZpEhkrjOHIrBa0GGMVO61OmE0E5RnPdol86I3xNcPnMk
         m32A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783115073; x=1783719873; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CYGlKYk9M8R9xsq2OIX1UqkZBi4uxYtyzBiuRuIdW8w=;
        b=BRovvP7Xj6EKx35NBqjjhnV/tLdFgsTTZFtsW1HNptZQqA1KeoS9TA6qLWW7U1EPnO
         9RjTVfscG5wQoQi9Sq1NhIfW8u2/9wSELp3YwBBmW2MYZFSe+FRRhHwKdjfFjcuDRz/y
         OhiE6UUeyxWojeQwiE3TVAAUc0y96+3CLOA5qod1CtW3fhw25hRp5u1Eq1YddFB32u3y
         W4eBafUiuA6lORR3QkkRvgCBomqV4Ymvw1/x8K/JJJs7Ee80v/cI8UO3CV8KXT225IPv
         +JKtrzt2xiZ4IH1I0249P8SdpygqcU06iZQUtN5Gfv34umeJdZRvgbT/EbLg1cmQKQPl
         /5Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783115073; x=1783719873;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYGlKYk9M8R9xsq2OIX1UqkZBi4uxYtyzBiuRuIdW8w=;
        b=I5yx9kuslLSolO6kP0GgdvJjZ6tRwlcS6rrvV7m8uhjVvfat/tef1XyMlMtMnrtzZA
         wkb8qtUU3SKFGB0X0kw7Jy0ffuSnWXn97sTl6U2pyxbBKWE5ulKVvZZVH6rRLnaq+JoZ
         aTp7aOrjHKCItytZ/oPMzNxeLA6Lh12imHEOZxqhxEoD8YDa1sbpqF4AvZLnMzVshFSd
         vq+O1sN/CnCd+qGg5s+mGPdaTs1q4tELEGV2W++X+BAn1rLyDVIPx4ckEoj5oC1WeB+J
         zIW1MFUHGSkCmzKv9qAQDXCrG3tRZiFRipVn8iMDv9XehsosQY/zTbx23VfEPvwJhp3m
         sjoQ==
X-Gm-Message-State: AOJu0YwmDrJjI0mVUjIb9nHG0DQSKHbHmcvu5p75eEelRZzWmwujpqnp
	fQM+AcyNkzgNMhILKRVav2e8Xg6RYxLMBWde2pO+8Qsw5SaOSKE+QegDZhlqtdfNXvoAVdn0vYV
	/BAUtv64uBOMGDMm1/V87Mx2n1cgscxRCKBVN
X-Gm-Gg: AfdE7cmCC6F7xWjAsKk0/qPzWz9bXMt36qdjp2ZWXgtmVQ8VQ/RIQUl77VjDc6myqJN
	Dqn/RBVH6Q1ziOct3XSt6GOQTRUS5shTkeneQoZB92BW9jlyxKI0r8e4WyAK3TkgFuwm3ii+vem
	HFnF7wkWfH1CT0PXVMbxO2HzqTeRQLx8WauYDBDYPj2Mv0skZx80INLOjfuF5tT3zB9Ln1sHbTs
	qUFMqfHWx6oOmQRPAJBZrqYtUfOpW529QUJURH7f1wTI6yXvSrmSbiE+rqB87lF5E/AaX93DPeo
	QDBSDJZrUz07rOq22Pt58owCyXst
X-Received: by 2002:ad4:5d46:0:b0:8cc:d29:9f73 with SMTP id
 6a1803df08f44-8f74a41f6bbmr15177736d6.21.1783115073564; Fri, 03 Jul 2026
 14:44:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260703095925.265641-1-sivakumar.bs@gmail.com>
In-Reply-To: <20260703095925.265641-1-sivakumar.bs@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 3 Jul 2026 23:44:22 +0200
X-Gm-Features: AVVi8CeThh1al6jPfOVS2WLdVinedh19foDZ1sLH7O0kQMv58uUqxkazC2AeQBE
Message-ID: <CANNYZj-6j431giUDRENTiGZHjNCJqtCi=7_3h_rZOnN0OYjsFA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] boost: install CMake config for header-only
 system library
To: sivakumar.bs@gmail.com
Cc: openembedded-core@lists.openembedded.org, alex@linutronix.de, 
	mathieu.dubois-briand@bootlin.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 21:44:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240126

On Fri, 3 Jul 2026 at 11:59, Siva Balasubramanian via
lists.openembedded.org <sivakumar.bs=gmail.com@lists.openembedded.org>
wrote:
> +       # In 1.91 boost-system became a header-only "modular" library and is no
> +       # longer selectable through --with-system, so it is not part of BOOST_LIBS
> +       # and the top-level install target no longer ships its CMake package
> +       # config. Install that modular target explicitly so downstream
> +       # find_package(Boost COMPONENTS system) keeps working.
> +       b2 ${BJAM_OPTS} \
> +               --libdir=${D}${libdir} \
> +               --includedir=${D}${includedir} \
> +               libs/system//install

Apologies, but I do not think this is correct. If system is a
header-only library, then the software that requests a cmake module
for it needs to be fixed, rather than boost or its recipe. If b2 is
not installing something by default, than that something is not meant
to be installed, and isn't guaranteed to work or even exist.

Alex

