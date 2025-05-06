Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03281C3ABAC
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 15:19:36 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.78937.1746544774391614201
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 May 2025 08:19:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N30ZGXBY;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac34257295dso254580066b.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 08:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746544773; x=1747149573; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PWTAZoSaedRNoqXl6Ghglm/wyC4VrHk7F213gp3ZPqw=;
        b=N30ZGXBYcBs8LDOMzcP5+qvLmMp8DkIAg2X24U4RhwST9fBDqP4jbZzGe4vJ05oJSM
         4xU08ZSVoAlJbWHh+7Syv681JLGXtMWAzix9JBvW4VhBI7p3/U1+wLsfenIAteUmwjco
         2xnyyv7B2zYdbtlF0oXcZ0zmFPDf6p17ejKoxEXUfmq2kP6zvv0MAfW8rGCoj0XzlXuv
         lyc9l75aI6wGWF493TMB0pu8bSYkDnAZponbhxBLzC0bEKENX4xCVUq9NkY9VFWvCLp0
         AE5g8ceFNjyHIEjiZwXQFDFcMxRlop2CS5ByIDA6NYzlvpQYLc7V8EW4809Asr3V6CjC
         flHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746544773; x=1747149573;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PWTAZoSaedRNoqXl6Ghglm/wyC4VrHk7F213gp3ZPqw=;
        b=Ad3nezEmIRL4+nnz8qYovDzn+dlLBS/jNWQtg0kdv13kBoMoJY5trJ8uNoAhz1RLZq
         ji591EYQiEAuUUsmz+CwJKICPbHOLCg9jKKZuphWYP60UuXBmvw5Df3YR+1tRD2k2Wd7
         qkftnA3LkmGlHgK7GDWHAIYu4xhl2Z340nJ96y97sZqQMxOdCVLHngU66upqp1ChzWBD
         xdsveWVZmt8PUbknchLjsftyUZYplW6bmmDNlE0OIBIs1ed7JDDfyiHXNu6LIl3waeK5
         l5jn3z91JhxSL+97w7o6Jk212tk1USMiPyURlb4tDXM5G2eSoRM48KaY3+LPQAfpqzuw
         O/KQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBw/4E5y2rhhWMR4LjgphxNg7GBdp8j2hr+AbTofZ6H6tgDmO9lV7fktUgCdTIRRmqNR7YpMmrWFo37U/AxbEyBw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzvDmrmo7v29M8L6yZ6ZzHbpUrYeVsMwsgV7y1W9gmxLQNqzOV9
	HojB7PwxSIfNKMHZYChYJankmTvogmVXFjX7bq71hH1uUi1R1o06
X-Gm-Gg: ASbGncty10SsG0QMbd7tG17tEUmFP5CMBiF7UkL//FMJeaY0f8OT0qnjgpXSeuYbEwc
	faKzVrF+sAhHQcVFSlIQIhO4AzqzgoGunpNyNMbdIXluCOVRHU8d2UE2CZpzigCK43Sx52FybRm
	S2ko8JLMNh8jxS/jcYlG/9y7IT/Xo+KNY0eDBpyCpm6lrgftzga2PTQGCiSTp1Nj+WWh/xtXiko
	n3WFTkLk617Av55fTAKGXmZbTGlr0bu8vTrz9shadPcpLtTcrZVLtq4K9Fd+DGOeJqlHZcWWPCU
	FyaSVwePr6NbCix/iTEvQTC4A3mN5tpbE4wCx/D7zYRBZ45U
X-Google-Smtp-Source: AGHT+IFohYRc5dzpagA4RsrlVUXVMtydWCUV8MeMGI3ToTOwqkTk3L8tCGpQ3EKJyNzPes8HuUoMZg==
X-Received: by 2002:a17:907:971f:b0:acb:107c:7aed with SMTP id a640c23a62f3a-ad1a4b0d716mr1153154866b.55.1746544772548;
        Tue, 06 May 2025 08:19:32 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad18954108bsm715519966b.180.2025.05.06.08.19.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 08:19:32 -0700 (PDT)
Message-ID: <504da031-4162-4d70-a210-c0f1073d46ef@gmail.com>
Date: Tue, 6 May 2025 17:19:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][scarthgap 6/7] bluez5: make media control a
 PACKAGECONFIG option
To: steve@sakoman.com, openembedded-core@lists.openembedded.org
References: <cover.1746544207.git.steve@sakoman.com>
 <a51c54793c32cdb433230db4aa6842e41e32c214.1746544207.git.steve@sakoman.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <a51c54793c32cdb433230db4aa6842e41e32c214.1746544207.git.steve@sakoman.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 15:19:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216065

On 5/6/25 17:13, Steve Sakoman via lists.openembedded.org wrote:
> From: Jeroen Hofstee <jhofstee@victronenergy.com>
>
> When not building with the default PACKAGECONFIG options, the build can fail
> with:
>
> undefined reference to `media_player_controller_create'
> undefined reference to `media_player_set_status'
>
> Otherwise. So disable it when not set and enable it by default.
>
> The packageconfig option is the same as in Styhead.
> https://github.com/openembedded/openembedded-core/commit/ebbdb7cf5c0a3f0e6773704d4c4cc570358ec611#diff-9d9284f6f27a81c75dffffd6d601b40c8266ae12e678d0a49c46bdb8356a0e91R52
>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
Technicality nitpick, depending on how important it is deemed: this
patch is missing the original submitter's sign-off.
> ---
>  meta/recipes-connectivity/bluez5/bluez5.inc | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
> index 39e1bf389c..731bfa0e40 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> @@ -18,6 +18,7 @@ PACKAGECONFIG ??= "obex-profiles \
>      ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
>      a2dp-profiles \
>      avrcp-profiles \
> +    mcp-profiles \
>      network-profiles \
>      hid-profiles \
>      hog-profiles \
> @@ -35,6 +36,7 @@ PACKAGECONFIG[nfc] = "--enable-nfc,--disable-nfc"
>  PACKAGECONFIG[sap-profiles] = "--enable-sap,--disable-sap"
>  PACKAGECONFIG[a2dp-profiles] = "--enable-a2dp,--disable-a2dp"
>  PACKAGECONFIG[avrcp-profiles] = "--enable-avrcp,--disable-avrcp"
> +PACKAGECONFIG[mcp-profiles] = "--enable-mcp,--disable-mcp"
>  PACKAGECONFIG[network-profiles] = "--enable-network,--disable-network"
>  PACKAGECONFIG[hid-profiles] = "--enable-hid,--disable-hid"
>  PACKAGECONFIG[hog-profiles] = "--enable-hog,--disable-hog"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#216063): https://lists.openembedded.org/g/openembedded-core/message/216063
> Mute This Topic: https://lists.openembedded.org/mt/112650828/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


