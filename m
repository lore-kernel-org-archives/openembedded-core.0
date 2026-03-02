Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AC28E9B365
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 10:57:44 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.157977.1772449063265834175
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 02:57:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TomON+TE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso36107895e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 02:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1772449062; x=1773053862; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1x9auy0/ZwS//Ygm/Cgv40OnwxF+dJ6YheluqBo1bVc=;
        b=TomON+TEZ4501MQtqKHx74JSvvX0BVnmE9nHxU1wecOT3lLPlBkUYAWwWMKF+KfSZN
         MySB6cYpAEIWG5GKP0EZQNgkoobw1cVTvw2jX3H1ED2md+mdQkVShoIxWxa4GYeGBM/e
         3r6ula+ZqGy8v8Czd1DOnK7TIdc+V5MZR9TqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772449062; x=1773053862;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1x9auy0/ZwS//Ygm/Cgv40OnwxF+dJ6YheluqBo1bVc=;
        b=m8+nPjg/AYWyf8zVOKQ1DM//afNgvbJJzf9rOLkZY2JDV/ceoZDbNO1k4IGttKON56
         1VfTAHrZ4R39HCqKI3MNjI36Seg4HKFwcCUR0CFq3xhErlXriwlvg89nlQwmG6i/uEAD
         RIyA+BSPFTBRN9nUE5B38SzlM085AA5UT4SnqwrBU7XfIZQPGqaXdZSvuOXJ95uuzw/F
         7cCeoytKMz3//qNdM7pp4rLCAHvhgbdbGyNA+IuugDaGrRMjexzkpneM5HB3KgVCSwz5
         +RVUgJd1SLB9yRw2D7w+ACrSYlOVb/D/wWDIytqdZsgIkwMtVw9Ur1JI10XY8nSvNS3J
         KyrA==
X-Forwarded-Encrypted: i=1; AJvYcCXKmgOiJIElkm+qgX3SF0SFZj6c/wWpiEjdpAQNfJPYkhQDoAwz6DKYc/EKi5Ac1wLuXFvGUDMmBW7C6ozw+w73tA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxrVer1nXhDeQ2yIfxXhPBrEz99hsDjLp2WwlIqoWafEdFkpwbi
	UPMw07I4iOe0tOzboYadV/uJK1oHT5bq3PoC8k877pRR/ZJ2KGzNSUnHS0Bz5FDClns=
X-Gm-Gg: ATEYQzx9p77rfAz+s/nksUiLEp4rh3cAQfYeOsMH18F8Cwa8RiSEj3uqdn57aPaz/rP
	G/nlxIu+m1OMcYbXYV+moRU82MK4tqMJR7c5+SoKQnen1aUCmiqDgYO//TG0PRXPe/PIBYoFK2z
	c26yDsXMWnH866jtJ9p8YbBzVvzLcV91NnSXtZRR4XdISxm4johGH3qnxAlX2WQ3Z3Wnb0orBrq
	Mv2LQLpbN+MJ3idYH0OKmQDVo//Y0qS5Dy+85OIV6rlrB3OvtjHkLRxLhJqSGsIpCW9lpJc/JNb
	baKdh1Ygvk+ZiOsSL4bda8ZGrIpQ3cgAZO85m2yxgV3LrQ/ZKBrp9lceNkfFEXL+4vIJY0eRUqm
	bL++oS4HhDpgpa40JeIZPIRbnuxbc32JYX7BdsGstPlutdy137Ty3Zj6ZaTmfPiVE/TqanVVxXW
	i05TQZg8sJisKD7RzPoz/24LZVcedDfHUi5utuAGqQ5xtmC4e8WlJU7L/xflW0dbnK2JYWrRHf+
	JT+FadUD7jbfBY=
X-Received: by 2002:a05:600c:8b12:b0:483:3380:ca11 with SMTP id 5b1f17b1804b1-483c9c0de46mr205447355e9.33.1772449061643;
        Mon, 02 Mar 2026 02:57:41 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:42f5:ee0f:6e5e:ba39? ([2001:8b0:aba:5f3c:42f5:ee0f:6e5e:ba39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b3471asm295631155e9.3.2026.03.02.02.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 02:57:41 -0800 (PST)
Message-ID: <2bbd3ebdc7f525fc5fdb5848ec6d80c70dbb9e22.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v7 1/7] package_rpm.bbclass: Drop external
 dependency generator to support rpm 6
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: liezhi.yang@windriver.com, openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com
Date: Mon, 02 Mar 2026 10:57:40 +0000
In-Reply-To: <8e2bf6e0befe331a0f834687317a3dcd2d735b92.1772367692.git.liezhi.yang@windriver.com>
References: <cover.1772367692.git.liezhi.yang@windriver.com>
	 <8e2bf6e0befe331a0f834687317a3dcd2d735b92.1772367692.git.liezhi.yang@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 10:57:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232196

On Sun, 2026-03-01 at 04:25 -0800, Robert Yang via lists.openembedded.org w=
rote:
> From: Robert Yang <liezhi.yang@windriver.com>
>=20
> The rpm 6 doesn't support external dependency generator. Oe-core used it =
for
> per file dependency which was saved into pn.requires and pn.provides, but=
 that
> hasn't been used any more since 2012 (rev:
> be40f6d0bb80274366af00461112af65687a4de8), and there were no complains or
> updates in the past 13 years, so just drop it to support rpm 6.

This commit message is confusing. I think we need to be clear about the
following:

Is this file dependency information written into the existing rpms with
rpm 5?

After the changes, do we still have the file dependency information or
is this being removed?

I think you're saying there were no external users after 2012 but I'm
not even 100% sure about that.

Cheers,

Richard

