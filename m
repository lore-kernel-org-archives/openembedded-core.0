Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71CADE77188
	for <webhook@archiver.kernel.org>; Fri,  3 Jan 2025 10:24:25 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.27914.1735899861183533745
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jan 2025 02:24:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S70bpamZ;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6d896be3992so69638626d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 02:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735899860; x=1736504660; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HMkxv45veBOvlTG9GMUtHS1meXs0fpv4J4QjHUEKh20=;
        b=S70bpamZgUd60TFy3R4vFUGaXGYK5g1Vb7w5J5zH0v7aAb0u08W1FiwR5IKo2/nU+I
         Aptp2BeYg6qmScxDrCLhBqeE5nrPwosg1V9GYbyBW4bT+W2WK1v6+QhKY3CexsA9xECH
         2WYP/uc/pJqNW46xqYbllvkH2hSHnKPGr2xQhwaApHcFC5tN82iDYItd/FFmUND3kc+6
         oVGnMZdo8cOHXKEliv1iEkyzbcwEkCwigY0KKVyU38Nph2iJsL/wqhhYCDt8eJ/U8zW1
         ZogqljuhXMUWX78hA2hQKHQpWkWA8t/3PxkIZqyzcKUks/OHJXMQQ+hiTK12ieqBk2y7
         Bazw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735899860; x=1736504660;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HMkxv45veBOvlTG9GMUtHS1meXs0fpv4J4QjHUEKh20=;
        b=fGbnHOIw8BAZUKeyz0rp0S7LsPuMlqxdxN4peUvTDdxSTiV23C/qbuiML+m0ZIIaJT
         LrzQctCBFe/BoykzqCQxsrDALM567MDaOs3xLBqXo198wT2duMG0JjMPrrtlT4be2vTU
         JjwPH2zDjhJyg2RiqPqdb83WG6eLx8psK7Hj3SIejEv1beTWbVklYLcUaSH+kOixJ4fu
         bE8iaxTxVieHNqKpUth2KEVHGWNFchnepT++LbSQEQEfUi3iPy6Qy35LsbeJin/TQQTm
         jwgWTx2WUnXNUPTgWYjSqFJ3s7CV9Kfb2OMr7ft1KUOs91HGdR9T8yfqeun+daNKHNf3
         Vg4w==
X-Gm-Message-State: AOJu0YzV/bzlIPHVrme1w8flB/vJ//+dDro+nbJjDJ037noKRSRjh2w4
	AkqUn9xywlA+KxCZdey8ADIGAJt+EWNy0b+Y49egymbNDySZ7SQRoL9QxKJpcmlp+VC4XQRBwet
	PXRrQ0+dO+/YqkEF1rVKD8KSLPRDoIw==
X-Gm-Gg: ASbGncuprWhKffsXRJ4PL/EIACY30dY/SMCfP5uBPqytZ60J3Qj2OLA5LLdmMTpixNH
	yps5/3ENx2/VLGjppaTkMEPPJndxwiC4o/m9Pvpk5MF4ET1UYhNUYtx1sw4uiOUxZdEtZU+yF
X-Google-Smtp-Source: AGHT+IEUH4J9HkgoM/qp75xVHuvAig5BJrqm6xQ1vKfN39rVh5sjmOSAqUuGEDGU4vHuJKHN2hx9SWEcdOUS172hbXM=
X-Received: by 2002:a05:6214:496:b0:6d3:fa98:cf4a with SMTP id
 6a1803df08f44-6dd233972ecmr765902966d6.34.1735899860001; Fri, 03 Jan 2025
 02:24:20 -0800 (PST)
MIME-Version: 1.0
References: <20250103063224.1988264-1-bin.lan.cn@windriver.com>
In-Reply-To: <20250103063224.1988264-1-bin.lan.cn@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 3 Jan 2025 11:24:09 +0100
Message-ID: <CANNYZj_bxNTU005eqgKb9HmCEchW-MdjwaODdRdA5HkSbY6v1g@mail.gmail.com>
Subject: Re: [OE-core][PATCH] package_rpm: set clamp_mtime_to_source_date_epoch
 to 0
To: bin.lan.cn@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 10:24:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209330

On Fri, 3 Jan 2025 at 07:32, Bin Lan via lists.openembedded.org
<bin.lan.cn=windriver.com@lists.openembedded.org> wrote:
>   warning: %clamp_mtime_to_source_date_epoch is deprecated, please use %build_mtime_policy
>
> This change sets clamp_mtime_to_source_date_epoch to 0 in do_package_rpm() to remove the warning.

But does this change introduce issues? This was originally set for a
reason, what was the reason? Should it be replaced with
built_mtime_policy as suggested?

> -    cmd = cmd + " --define 'clamp_mtime_to_source_date_epoch 1'"
> +    cmd = cmd + " --define 'clamp_mtime_to_source_date_epoch 0'"

Alex

