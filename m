Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12847CD13CF
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 10:06:08 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.35350.1725271562530205829
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 03:06:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=zzHNNE9+;
 spf=pass (domain: linaro.org, ip: 209.85.208.172, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f3f25a1713so47052451fa.2
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 03:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725271560; x=1725876360; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z6Ip5CoLx4UYkuBVgSr9aN89sfXNT3NdWkJuj289t5M=;
        b=zzHNNE9+aB/BHQjh+oSk60dpydWc9LkmU9dILP7uKLNI/hq5KaWgMSJ5jNQ17yGupK
         pX2UopBYiTsAh90I1Hpvx6UuHOBxbKgGqFci0EyMxYodZ1UKwtYvn5oVv9XshNoBPxC2
         SkiTDahCBcXaO1ZE5EJ9QWCxIaB0GAWMzfcD3FM1f9Ki7hqFDP9UVVHIgcyMDpG6m/LV
         jad0drIbuxUuXa7d8EGAexR4dRF7gnNU+sGhZkAlsp0bGlMCSedHLyGjMmMKR0G4ZmNO
         syv3JoUe3XufWJueQOFgeqShra2vw5a5J3eIEFwtL46wSv5IkaPc+0UTAWe5oMz49kEO
         XGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725271560; x=1725876360;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6Ip5CoLx4UYkuBVgSr9aN89sfXNT3NdWkJuj289t5M=;
        b=c5WBKnToyFemMD8UwvdqFzKsLpzmdkmnPk8eMJR05IohH4UWNGA+zzOlkkkWSL+Yan
         5zx6TVlBqIvazP5Tx67dwBUYDFH2Wg3xsxcXUtjXn7Mz6mRSmly4llhZd/yT34s6gMos
         xZWVYTA35JwfAn8GF97fIe3B79mftPdDPugEguQslKU8tqHgm3+tqAdRBQQ1ihziPOxY
         CMJfu9FlWxVsG6CrJyCoSbgXhm80s9gUaIBMl1ZQ/JZ2/GjYmM8a2MA/JxoOl0wJp/ND
         kCsmlkFmKZSP8o3DLdWx45dSNTKsn0+d2BkwSptSvzKEOI0wB/zawh0FqDFtT0hYgPKx
         9CvA==
X-Gm-Message-State: AOJu0YzHtU4qLNyV+5kLF1XMZ48CYs/7GRZCdMPYfQPlJ2pl2chEmWNs
	B+6ylwRWvUt6f6ZKt1ydZy+yDLep3zXn2QSjqS6PmLSNqTuL+zwV/kCP/IojaE4=
X-Google-Smtp-Source: AGHT+IHNr/n+vQDEHQ2FVFyVRUPhtK0W6S4xroZn4god12qeCzou7srVkwmgrYYk5WUYqyICXjXC7g==
X-Received: by 2002:a05:6512:e88:b0:530:ad8b:de0a with SMTP id 2adb3069b0e04-53546af3514mr6052201e87.9.1725271559871;
        Mon, 02 Sep 2024 03:05:59 -0700 (PDT)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5355e7b6408sm1882e87.27.2024.09.02.03.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 03:05:59 -0700 (PDT)
Date: Mon, 2 Sep 2024 13:05:57 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org,
	Erik Schilling <erik.schilling@linaro.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] systemd-tools: add recipe
Message-ID: <ZtWOBWtSoCnyZ2DF@nuoska>
References: <20240902094117.31156-1-mikko.rapeli@linaro.org>
 <20240902094117.31156-2-mikko.rapeli@linaro.org>
 <99e13a8ab6cea2424298d97466ad48540cee1209.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <99e13a8ab6cea2424298d97466ad48540cee1209.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 10:06:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204069

Hi,

On Mon, Sep 02, 2024 at 10:59:22AM +0100, Richard Purdie wrote:
> This will fail in CI as there is now maintainers file entry...

Chen, since you are systemd maintainer, would you mind if I add
systemd-tools for you too? It's only the ukify python script
currently for native use cases at build time.

--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -795,6 +795,7 @@ RECIPE_MAINTAINER:pn-systemd-compat-units = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-systemd-machine-units = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-systemd-serialgetty = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-systemd-systemctl-native = "Chen Qi <Qi.Chen@windriver.com>"
+RECIPE_MAINTAINER:pn-systemd-tools-native = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-systemtap = "Victor Kamensky <victor.kamensky7@gmail.com>"
 RECIPE_MAINTAINER:pn-systemtap-native = "Victor Kamensky <victor.kamensky7@gmail.com>"
 RECIPE_MAINTAINER:pn-sysvinit = "Ross Burton <ross.burton@arm.com>"

Cheers,

-Mikko

