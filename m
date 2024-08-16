Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D7D0C3DA4A
	for <webhook@archiver.kernel.org>; Fri, 16 Aug 2024 14:24:55 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.149206.1723818293755746228
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Aug 2024 07:24:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iucl7H1U;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52f01613acbso3657613e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Aug 2024 07:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723818292; x=1724423092; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4Vrdf81Wqu1y+yvRjshHEMogCQr9kk5hhH1yqZ7hX3A=;
        b=iucl7H1UOApR8qnec04VivhKcemIiE6SmXypi839fC25iVNcjMKe4weA7m15BPjnIW
         2ZWQzCGgpweS/dCOZ2RA6zpA9mi7tjjvR6Ne1jZO70g78ybRiKYvgD+BQlh0asg6PBgx
         +GxUWSn4vwBES1q4ZKAdtBjpI2OumY26Kb/dAixbqZdRgkzez0EerhkPJiuEcMmCEGoM
         C5canTIVY4iMTLUxTHeyXQMTgQsatOIWCQLmaHQGlT7wPa4HEBx0atrlvbJnI5KZ8lI2
         jWG0DGTDtlftDAq0GO6e8x0Z1shjn+U7E/iOKPbOb3+EdRacy9p9qPKSbo+e+4eu+e8n
         Y9Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723818292; x=1724423092;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Vrdf81Wqu1y+yvRjshHEMogCQr9kk5hhH1yqZ7hX3A=;
        b=EEej4AyIe0IF819RGxc8ivClVC7ozM/5zeM1fqU587jyIx9aqa9Nc+anrZ6EeHU5vo
         34dMj2SV/n0644OvWOKHYNd1p0QrmsDkcXSLzdhUb0DFV7sIicxm33voi+PZopy0nmSc
         F/DXAYRFla1EM6FRL4PAlLrJ6y4JF+ooAPMJHIIyxE+tQtPGC3k57gmizI8M2jt7X4/+
         i6ScWfqe5ESZxrcJzoPKFUNT7nzgF0EC5mXkJh4dnhsfaEniEILPwhnN597WAi/H1C2r
         V8IjkppEbwwJIjtHifcJboTq2mfzCTSEOqXzXj33Mzqthopd3FR4btsbe10tKvJOvxRY
         uGBA==
X-Gm-Message-State: AOJu0YxpAXZTHS2jlgGiymPM0WAc3TBJ3/gijVeUhrg/vs0/CaaM20Wq
	82bLuYWXvDkJJe9abdDuWKWnQPS2Qzbxq5Jn0A9NR6GxA1pk2dpYMg+5YGpZyJiolDGI8HUUGFB
	0jlK6yX1muPsJAcgH+I+yzpvq2ts=
X-Google-Smtp-Source: AGHT+IGutggTRWcrCnXj2g7qPBVEPXVMIhGd3GfRfs/O5Kg1VHyI57dP9nGq1eW48ga7V/TFa/ANpcMVXFbfL/xnDCc=
X-Received: by 2002:a05:6512:acc:b0:52e:fa78:63c0 with SMTP id
 2adb3069b0e04-53307f90a54mr1900830e87.13.1723818291247; Fri, 16 Aug 2024
 07:24:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240816140422.1665537-1-niko.mauno@vaisala.com>
In-Reply-To: <20240816140422.1665537-1-niko.mauno@vaisala.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 16 Aug 2024 16:24:39 +0200
Message-ID: <CANNYZj8v_jOZ73FkfyL9kaE7RcfT6wOqO4Vz1jDNeeie3mZLwg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] util-linux: Add 'no-libmount-mountfd'
 PACKAGECONFIG option
To: niko.mauno@vaisala.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Aug 2024 14:24:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203467

On Fri, 16 Aug 2024 at 16:04, Niko Mauno via lists.openembedded.org
<niko.mauno=vaisala.com@lists.openembedded.org> wrote:

> Taking the above findings into consideration, add a new PACKAGECONFIG
> option which allows to conveniently opt-out from prematurely using a
> feature which can cause issues with a bit older kernels.
> +PACKAGECONFIG[no-libmount-mountfd] = "--disable-libmount-mountfd-support"

The option's definition should include both enabling and disabling
options so that the resulting component configuration is deterministic
(e.g. not left to autodetection by upstream) both when it's enabled
and when it is not. It also helps to add a comment just above
explaining that only the newer kernels have the required API, and
ideally also mention which is the minimum required kernel version.

Alex

