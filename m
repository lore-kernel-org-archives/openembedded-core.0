Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1AB4C28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 09:58:05 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web10.7699.1743155879137072526
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 02:57:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lXZN86UN;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6e8fd49b85eso28746886d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 02:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743155878; x=1743760678; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0G4bumuh78TZlGcKLP/phAZ86Loh9Ddig3E6jVvg8nQ=;
        b=lXZN86UNun6pFM9shwVJkISbMIUeWq0UVtQjBDr7D32j3TYc1Rqo9rTPwvrwJrke/I
         RRlLFaH7C+bpVLjJCXZ5kca5xGdpxD9ot8V7ahiiGtOjyyN90e1piWrJC9f/PleJglZR
         VTevk5ly6mDHn1qh3nVrbuA2A/ronht0RiDJSuHAMbn5ijV01BnnS6mIA1jGqiu+RXi+
         sOMWTiYDoWzsTiqlFEMySrDRlcE96b0X3+9h8M2GGRnYH3NqqDdnrmKr1FPn1/U98JIC
         zLzkK60vGaOApCY9ZGWoPuGbdnJB7xV/DPxbNP1ifBejHPFBe2J/TV3hc1iOfOO6DSPu
         xm6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743155878; x=1743760678;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0G4bumuh78TZlGcKLP/phAZ86Loh9Ddig3E6jVvg8nQ=;
        b=qgU1syoaHPEIsIqegzZis61HHab0JEG/M/V398eslLpo37UsaHq7iZ5tRzegxcuzFl
         HQhiNF8enbWInJaSAXzXz8Hkxt8+yyan74p9uof99gIsgMGQE9QvVs6vTJSawfMKW/Tg
         pWVP/pKCQGkDbe+7y3sCMqjlDEehvF5R8hGv/xQDPkJy92kDJ59orcGjPrBg0YWvAVou
         6VKbMyRGflHg5Rw1f5MxrNUEaruw/7GRKcW8awXsrvPMObwxxQM9TQWNZoQwe+Sn5woQ
         T9Ert7i5K7e/7ARbcHB5BcWP53NBwdpTe7DMBL296cPEOGDRNzX0EtcKeBVTfVcfNDK8
         zqxQ==
X-Gm-Message-State: AOJu0YyZ868G/aSy7EapdkQdihw+HSYaQjO/P97WYVIXGvwqZTO9iYi6
	tFKuPyO2Ft6nVF1KYWFhrODzxrVKE+5Bw3a0U6dabefIBk10cm2vG4enkWqmPON+wuzPAUsYQI2
	3tuvHGOtuiq0GiTz3mPbXOPrjbTw=
X-Gm-Gg: ASbGnctxiy9BnDnaE11IAz4JuBfbTFznQ9YurTZjSOo07fFsvsfFgkZ0F2fSoJlNcII
	AxbniEJ/8w8ARtxMaQs4R6drl5x7YSl1wgKDCIoxjqrx+dn69lfpe1NxjvGIZkSLGYq0VPh0e0v
	IdkZRRTZpotod1j26nZ6AdxBj6LOcFtpzHmGh1L/OZ1T4Qm+W8wVptwruNtlK/
X-Google-Smtp-Source: AGHT+IHh2a0PB6Ra+zfxPTmNUUr7EjsV/x56kQotG/f88x9VKqu5JRATR2yx2/1UfTWIOWKhp+1NBNZ20b4OGxejjzM=
X-Received: by 2002:ad4:5bae:0:b0:6d4:1680:612d with SMTP id
 6a1803df08f44-6ed236edf31mr96347516d6.0.1743155878055; Fri, 28 Mar 2025
 02:57:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250327221807.2551544-1-dmitry.baryshkov@oss.qualcomm.com> <20250327221807.2551544-6-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250327221807.2551544-6-dmitry.baryshkov@oss.qualcomm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 28 Mar 2025 10:57:47 +0100
X-Gm-Features: AQ5f1Joi9lxFUvCxfcoiiasahbcEU9YR54pi1blS-Ki-5VuSdl5IQW1DWbOjwRE
Message-ID: <CANNYZj-mw2nqSA=Fu+Cev7Wi49v8OGtMNzvqMmVuE7z727kcQA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 5/7] mesa: upgrade 24.0.7 -> 25.0.2
To: dmitry.baryshkov@oss.qualcomm.com
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 09:58:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213821

On Thu, 27 Mar 2025 at 23:18, Dmitry Baryshkov via
lists.openembedded.org
<dmitry.baryshkov=oss.qualcomm.com@lists.openembedded.org> wrote:
> +Subject: [PATCH] meson: use target path for Clang libdir
> +
> +Instead of trying to detect the target libdir through llvm-config tool
> +(and ending up with the sysroot path), get libdir from the build
> +options. Clang is known to use the same libdir in OE build environment.

llvm-config should probably be tweaked to return the correct value
instead? Then this patch is unnecessary. Alternatively, we can perhaps
offer the patch upstream, explaining why dep_llvm.get_variable(cmake :
'LLVM_LIBRARY_DIR', configtool: 'libdir') won't work in cross-builds?

> -PACKAGECONFIG[glvnd] = "-Dglvnd=true, -Dglvnd=false, libglvnd"
> +PACKAGECONFIG[glvnd] = "-Dglvnd=true, -Dglvnd=disabled, libglvnd"

This change is somewhat puzzling - true and false match, but true and
disabled do not.

Alex

