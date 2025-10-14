Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C626CCD184
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 15:28:51 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.19651.1760455727731506691
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 08:28:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NoPcPaa5;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-78f15d5846dso90404696d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 08:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760455727; x=1761060527; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WrEE6MZ0QkIpoFc8DzoqUmt8CTHxV8caQ+3FphslQaU=;
        b=NoPcPaa5X+5QVNL7Xg+Wz7PeLuAs8wFxxCGRTprmP5JcB3z3mkigOUN7XgWu6zgWpN
         sbUw3+RJji624ikEc5zSAszXn7xx6wj7uJizcp7Utz6PI4hfLm0PpwMXPe4L7SAh7x3b
         XvCrSH2paEbfi9bkPF1smA/m3O9Np19K8MyOm6bLQK8uwCE9m/L3X+HcaONgf8QnGWA4
         3l8HJSedR93bwkT3VXtBqcHcGzuoIs+1l6Wcjr7IkfpLkwNThq1PZIJtNL73HTvEV2i6
         zUEiV3HqWE43xrPbPy4EI9E3C5nar3rET5wLExQ7hR8D0RLABX3B/Lq7S94z7ExW/rlX
         NwyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760455727; x=1761060527;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WrEE6MZ0QkIpoFc8DzoqUmt8CTHxV8caQ+3FphslQaU=;
        b=WlblKIpdoFV+CNres5QkCZm8Yn+SsDBVZjInE7YtrDlLyHd1V/HtXJLuWpG0j6qLlh
         Nk83woe2bQbakpBCAGi2qtR6Ai+CAPU9pFLuN2Pc7qznNla+U5FKmFWo811czpm1SJk+
         CdqD/pOgeQTVHzgG6elfyrSNTfn1WHYF6fFbDXrDOa/HQYAO6xlhlU7eG4OcsaAvI/aS
         LOHaFuff49e7YQvZm5sYkblpVGaQxyk84bpsje0NlK6lj/RUcKnAUdSkywhMCV2/TCaX
         M+gsmGkl1pIKAPj9wWsnix5mAicEbkEowy2MH9rB6mVS5Ig+hvp+KCj/s9tKkKGNlAzV
         7UVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGVD115Z1qcI57ZVUsaqWXurCoBBOWf2vLSkY+kkL2j62AjCTdxnxzPOOZgwWiQePer25+zosbGHagI8LGO1R2wA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxqcwNGR+eaLNE4+kPwBZ5xqWuKsIZISl7u/J56b417xVqM6yCN
	7MYnz4HxL7p7kXCVILuzdJhDDX1nsPiVd38bVmRxY7s4gnaVKkvMeYH32pNeg8K/0MyT2/rgv/K
	sE9jbfkf1mJ2UZ1glIBjliTUqFwTV2jg=
X-Gm-Gg: ASbGncsuqGRwOlCKHVn58uKWr9EZgYuWfLKp2DKeBbHcJewvhNhNtTt/z17ZYThyUSF
	qHuoKEFTuvGdZQn+6MAuSwc8sPwRTFxRS7AMH6r7EU1c3td3JPwR9hnfHJf7eI3sf2TztksVz0e
	Mk9tJMoiDIw+vm4kpJvZbtoDjKSBfk93MxAGYQ61cAeOzFvcKYmKld9w1YfnB32yqvAwevMLtYH
	+TPom7U06paqk2fZKEA7Xf8/oQcNhZ20uRU0EhQfy7uavvtxt3I8RvWTM/RcviV4uCqWoAP5iGM
	GIC1rc+mXHV12Yz45Nq1RBPqZZ+buPj93e2N
X-Google-Smtp-Source: AGHT+IE+vOzBSpOSxDXt/vvGHruhoAnBq60RWijdJmyeZXFohZ1xbDsnNWCE9qsOYPA/FQPPxNlzJ0LqPdBSnLW9aHs=
X-Received: by 2002:a05:6214:5002:b0:81f:3abf:dc1a with SMTP id
 6a1803df08f44-87b2ef373c3mr374136836d6.49.1760455726654; Tue, 14 Oct 2025
 08:28:46 -0700 (PDT)
MIME-Version: 1.0
References: <20251010120125.2868011-1-dmitry.baryshkov@oss.qualcomm.com>
 <20251010120125.2868011-5-dmitry.baryshkov@oss.qualcomm.com>
 <0E1D022C-354A-4064-9537-8835AB5B5332@arm.com> <CAO9ioeVxazVkNT9Wk5YcuHGAaLUbi9S+XPhPM3tZbZDDdK-3_g@mail.gmail.com>
In-Reply-To: <CAO9ioeVxazVkNT9Wk5YcuHGAaLUbi9S+XPhPM3tZbZDDdK-3_g@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 14 Oct 2025 17:28:37 +0200
X-Gm-Features: AS18NWD1CRyA0hK4ys_PLpKdDoWuBleVQpn9RZCk6ON42TQPqqIhH7YyzZ2SRBs
Message-ID: <CANNYZj-P=sCLCkjvpCibgMh4fsmu0J9W9bL2_gtFStPwamFfHg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 5/5] mesa: drop useless freedreno-fdperf PACKAGECONFIG
To: dmitry.baryshkov@oss.qualcomm.com
Cc: Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 15:28:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224836

On Tue, 14 Oct 2025 at 17:23, Dmitry Baryshkov via
lists.openembedded.org
<dmitry.baryshkov=oss.qualcomm.com@lists.openembedded.org> wrote:
> Well... It also requires freedreno to be enabled in the PACKAGECONFIG
> (which is done only by meta-qcom, which already has meta-oe as
> LAYERRECOMMENDS).
> I added freedreno-fdperf two years ago, but I don't think it serves
> its purpose: there is no link between it and meta-oe, there are no
> config options being toggled by it, it simply pulls in a dependency in
> order to enable one of the tools. If libconfig was a part of OE-Core,
> it would not have existed from the beginning. No other drivers have
> such "split out" tools, etc. Thus, I think, it's a lesser evil to
> merge it into the freedreno tools handling rather than having a
> separate PACKAGECONFIG entry.

The mesa build items that require the libconfig dependency should be
enabled through an explicit meson option rather than something
floating that checks for presence of libconfig, and the necessary
patch should be offered upstream first.

Alex

