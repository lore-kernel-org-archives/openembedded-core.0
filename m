Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74F9CD65C5A
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 14:49:07 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16257.1765982938770788300
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 06:48:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BowzksMD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42fbc3056afso2770925f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 06:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1765982937; x=1766587737; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=p3fS6g1TDxSRy1L7RwvIinWcgUqHgsaok8jujy1ytKA=;
        b=BowzksMDqY/W0UV2p5yXI/88EYbgRKcA2d/1Ml3eQrSNgwzPa9TWrsIjbyM1lX6BIO
         BF8B4zAwFQw0gSsAP7sWt42u9dTuYBcbgEfO0qj890bPhtaPmOftNQ/ibrf8RRXKe6XF
         PGKXLvrJMZ11tn4nWbf9uZAoCmbJdeiHQx3/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765982937; x=1766587737;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p3fS6g1TDxSRy1L7RwvIinWcgUqHgsaok8jujy1ytKA=;
        b=CO5q0JY60Pt36CXttF4o/FT2715yRJA5m6Y78yft4Z3A5xnbSnDk4sfVrnhAJsPLB5
         I/BEY4mMOeVy3Ig0aSWtllysHX8seoxGENYZvAh8FAp9X+9kz4htj94srnAW78c1sSLA
         VSY/+iSDcd3u4HcavrzQDR69zp1lqfrw+HScktJsgUH1y7wIR7P02Xh45zF28Ikornl3
         T2pMLNIm8XLQo10zxP0wWyiN8sgG/5sq0LgXAeo9Ye+S94ipCYRmwrgKpLrfvbCyYecD
         AnnPEqEktnj3/aeDK7YV3MbjxhLmQF1qNDCmGALRTTpycnNY6QwAHK2XM8oVhKutqn+T
         Unvw==
X-Gm-Message-State: AOJu0Yx/krHM7D8MOoqPrDoYNm1PwjqWgOom1FWO5dOspEBhYbbkCH9u
	X9BKvh/ZkIKDcrXP0MU53zdXic21kFgwmdQ66tJoISOb0TFJigX2WJC5A+VyjpiXq18=
X-Gm-Gg: AY/fxX5Z6kvDp2CujnOPa2wFZisccCwo5AopO2qYfIKmteHdfX/zbSCawEMMJs7gkah
	pfaWvnBfL8yVU75ToY4yGBlZIq4k2tyoQKSRsn7PIo0lp4zXk4v+OV+8FeveL1bmY1orHkXi6AM
	JngFypZWWYnyVWGiSMR5d2198EFseXnsuF4njonvRfN4J4ivM/e4T7RyqIMnBGdp+9gfDhC/sm0
	GhxAGFmbTMRZaTeo3HcVriSIHTSOFJgmw8jKbOejeRe+ApSf9rxfOyyyDd1PTDcYXDoxUUe63gn
	zaH3PmsawH5PaGLdNqgEDn/0j9FOzOg0om1OsS2n3hEFNuNIHyNcPlpRBVBsmLb3p2hV68rBq90
	tZBC9aVcLK5UpmtaO5l/DoveKEiUVjKH8mOttd+a9+Vo6sML0N1TJAAZtqiE1CLJMsmWBg83f6M
	JCokpMA+M+TpoOJFRgDB0RNCEdmmTkGk4rdvFIiZS4q+ZgLLtE0rdN1LKAgmz/0miiTFxbKzLr
X-Google-Smtp-Source: AGHT+IGxsO9qYsWtHgpJkEqeLd8KdVSV3XqdvGKdayrYupA/b9heN+U5+gklJ4qrXNbWhHlFUzjbqQ==
X-Received: by 2002:a05:6000:288d:b0:431:26b:5e3f with SMTP id ffacd0b85a97d-431026b60f9mr8768948f8f.63.1765982937068;
        Wed, 17 Dec 2025 06:48:57 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:611:b75c:117e:10fd? ([2001:8b0:aba:5f3c:611:b75c:117e:10fd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4310ada8426sm5156622f8f.5.2025.12.17.06.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 06:48:56 -0800 (PST)
Message-ID: <e990192752a02adad2bfdfa13caeb9cc91ba4130.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] wic/engine: fix copying directories into wic
 image with ext* partition
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: daniel.dragomir@windriver.com, Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, Kexin.Hao@windriver.com, 
	mathieu.dubois-briand@bootlin.com
Date: Wed, 17 Dec 2025 14:48:55 +0000
In-Reply-To: <4067abbf-57bf-43de-ab80-df09e509f39b@windriver.com>
References: <20251003203130.23843-1-daniel.dragomir@windriver.com>
	 <D8277C29-A859-491A-85B8-C518E37EB988@arm.com>
	 <4067abbf-57bf-43de-ab80-df09e509f39b@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 14:49:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228047

On Wed, 2025-12-17 at 15:15 +0200, Dragomir, Daniel via lists.openembedded.=
org wrote:
> =C2=A0How should we handle this exception? This was fixed in newer debugf=
s version, but should we add a debugfs=C2=A0version warning when broken ver=
sion of debugfs is used on host?
> =C2=A0
>=20

Thanks for the selftest, that helps a lot.

For the wic issue, I think a version check inside wic would be fine.
Please just make it clear in the commit message this is for standalone
use and we don't see this in OE since our version is new enough.

Cheers,

Richard

