Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CC53E77188
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 09:09:40 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.148434.1734685773856897851
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Dec 2024 01:09:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=nUeZlpPI;
 spf=pass (domain: linaro.org, ip: 209.85.167.54, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53e389d8dc7so1715478e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Dec 2024 01:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734685772; x=1735290572; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nZ8YSvtumWoihN5LdFhVZAvIFXefy2ROpKTfxd12J9c=;
        b=nUeZlpPIcetx7/ke6f0ZRP7Z/NJewB+OJO/rScF3WTMgqmHDHzhmRylIUJm6cwYb7Z
         VMj0IIwjXLGqywJ1wBnWhm6iojqLzkZnxewHWWNnil0zWiZjyqX6Gy2RcioNRmvvHfmB
         +Be+FMlTRrNdzy7v5PEOvXKMBeRLg2WQ8QmwYkgR5O4SV4K1oJxRvsKcGHvtZSjwQs8i
         TuX4KX7UXBOJZjIuZmpSekchyz3M2iD7yOBWAKa58Lz3gPBxKsEz6Z09vNpBgi1fr0H3
         ptQ4VrsLFmZ4ADGNvyzm3z3OLup/fLAviSROjkxneM1BAk3kSKShe/AAXHbPPq+sTWhM
         1wCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734685772; x=1735290572;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZ8YSvtumWoihN5LdFhVZAvIFXefy2ROpKTfxd12J9c=;
        b=DN1sixouSbQ3BypYSw54iadQH4I0P9ZNcqx/Vyizs1Zs7EtUOtutud/hZFToMRQEL2
         2vWe3l+QhL+09J5Z8EQ9aBJYT5+Tzszio51/SGkLXE3jnN3s1dLz2cDX7c+AtIySBKvV
         o0QWFKGIeGaSYwI3uJEDhkHDYUIVahd9GRZZ8xPxC4RAwFcTwpMIYC3F8RKInnbxcBfo
         mJ7Wc/hyhCpYSatrLdZKD2wgTJYhEAnlDZ63ExjOjbT9Sjm2PASQLMtpw9djUTMMdCtW
         MQ7Y8kS3VuNiQ/rIocKMKzVVHr/eEUu3bFXk5Io6vsUsJGrjFSdkwVErvfcuWZhKDkLH
         0Y5w==
X-Gm-Message-State: AOJu0YwdMWN7/otYrF49JXOealwkPJEBAAXH/9PO0b2CKhg2/vwfyrVO
	m0euBOrAXYM0mazG4p8hEasVmryeJQmLVgRuqXUvktkh4/3e+HULMdwnNGRk1fcIAkOaJCeXPaT
	xMrA=
X-Gm-Gg: ASbGnct3srakH5zZOQe1Nqkb84ZNLg+0XkYUi27xzic7L4PRiXbC+GPFUOslqiYGUIQ
	Q03dMKHln4+O6Zcro0xQ4bFLfACSlex3vrFXNH1rRDGaPagbFgGD/fdX2yGg9dhzU5lHW158q6p
	FD02JYaAfV6P0/46fmQxxeOtiQZtwbvngTsIbmt+BrAEJ77NxVXrR7l0LZpZThA8HE+B7+fR+YH
	94T2Ogxf0O9e89HNUFfa3KFW/8znDsV+Bme0ewy5M1zCaU6bk2ZQJdKjLPgAV0O55cveRs45NNu
	oASI1g==
X-Google-Smtp-Source: AGHT+IHviT6/XzcGR5qqegDMSIYJivwgd/JbbpHnS53nueMN3Dtf5znSnIWJ6vE4ti8UigOOItVHfA==
X-Received: by 2002:a05:6512:3b90:b0:53e:3a73:d05a with SMTP id 2adb3069b0e04-5422957ae58mr564172e87.55.1734685771489;
        Fri, 20 Dec 2024 01:09:31 -0800 (PST)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f63a3sm426656e87.6.2024.12.20.01.09.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 01:09:29 -0800 (PST)
Date: Fri, 20 Dec 2024 11:09:26 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] systemd: add fido to PACKAGECONFIG option
Message-ID: <Z2U0RugJ_3dk_fEW@nuoska>
References: <20241220085700.228006-1-mikko.rapeli@linaro.org>
 <20241220085700.228006-2-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220085700.228006-2-mikko.rapeli@linaro.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Dec 2024 09:09:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208971

Hi,

On Fri, Dec 20, 2024 at 10:57:00AM +0200, Mikko Rapeli wrote:
> To enable FIDO support.
> 
> meta-security can provide libfido2 but it depends on udev

Typos here: meta-oe has libfido2, not meta-security. Also in subject.

Will send a v2.

Cheers,

-Mikko

