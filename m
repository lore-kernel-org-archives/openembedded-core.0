Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D5C1D29FF9
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 12:30:44 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8848.1768393837870487735
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 04:30:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IOehGmd4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso68820485e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 04:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1768393836; x=1768998636; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mWWDrhShsbQN6zqlWM+wlkqAgzL4Pf76VlgoWOs/nSg=;
        b=IOehGmd41LzlNlNelbhx54BlSL+uhA+r3CqMoce3CUIFGizPcbGutDkb4eZ1oWDCrE
         aAH6QSXoGIvGWUPhvg9KddYRqEjFoq4YCo3vWUOae44xMa8ErAmEZEh1t3Payhun2sLs
         N0svh9ONAS2ynyRj38zbnVvLL/U9gI7XFOMzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768393836; x=1768998636;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mWWDrhShsbQN6zqlWM+wlkqAgzL4Pf76VlgoWOs/nSg=;
        b=Fb3gvqvqNc5zDtI/xsnBK0dZykJe1idMe0tmh5NhfqUPg/NQIwTxpiBNi8Y79AS2hr
         YgfupDc9Qwfz1+4T5XPjp3eAOpzl9hmGDgmitLgTjT+gdVGOyzlCcgIy0e8gD9kuoNX5
         lI7Zqk/+MdiYh4gp/QY3Kx+AES1ROwfJ3s7sKav0o1mkwRVNPhIEUIwp86jvxx1oJ1xv
         x1E9mT7nF/P30Q62zQT+v0cIfhQCUBo+cbYLOETDNmRzpQGyk/uvn+HfPWO6xtrkpMbh
         ADC4tUdxfSsntfpDG7gPKpiZXx5rsiTs2vb1lsixMVRiQXURxe8BAvuvYtw5KrgoENEf
         GHNA==
X-Forwarded-Encrypted: i=1; AJvYcCXHPx6edHCn6UL4B56mAy/nF/2279r+2md0aQIL76X3akLlwpQOwWn+YfGLkTYw7pPP0uKVXglrew8pWiQaLpQC4Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwchU3vABfNPltzbG6E/jtubBu+7nJbHhH06dy4i5bluM5Rcvk2
	n3xLYiOzuyaidbBzL87Mc3btUKsNnjGhGQmNr6A6R2DlYN7TgB52yMcqoFxcGDZ0Ozs=
X-Gm-Gg: AY/fxX7DdJf8HBFZe2HPkVjLVD3XFJniVgjN5IKYjYw9ZhDY3ofvd1tp8rKZw99deI+
	a6OvifVLh28yh/38ld/XTXizZ1f2gngz3dOukSnGrNAJVGu1FXZIhOptmtgK5+WBzAnGffMH/M8
	Wj8HH76UrkL5Gg55seG/MZhCcQSeVKJt7ky4S/QbGtYoq91rulG/n1Y4u6Cade8mjzfONJV32kp
	7ol9rwFqY83gDo0TofAyQqfL1zhkseZVjsdJ4F7ynGBkG441Yc3zUf46fxCAFgapguPDqS8n3fB
	YMCh2kdytflrjfPnGcaOocTy5wLt3CqlYfDM+VqSNznSfYwOokFxH8R/fepFxCQemj2g9KCY8xl
	3rEdbfCPiZ+4WWO3wi9bBPeJ+SHi80KaDQNlLqF0VAxDpEW9u4gYXwl4Yy3RNhU7+FjFTCtPiFG
	uQuNnU1z5LRGVVWAh2Ghpt1I/Hp6p2Jo3OD+nZB+D4CJse+asoYqmtb6itMteLMeJhaz30c/Ohv
	dM=
X-Received: by 2002:a05:600c:6612:b0:477:af07:dd1c with SMTP id 5b1f17b1804b1-47ee484e6d3mr24206335e9.35.1768393836274;
        Wed, 14 Jan 2026 04:30:36 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:94c7:73b9:87a6:4747? ([2001:8b0:aba:5f3c:94c7:73b9:87a6:4747])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee117c35csm20475895e9.3.2026.01.14.04.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 04:30:34 -0800 (PST)
Message-ID: <05138af86479c4310bb28a8a4077c80a5607b0a9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 0/2] Move RISC-V recipe-specific
 configuration out of common includes
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: joaomarcos.costa@bootlin.com, openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com, Khem Raj <raj.khem@gmail.com>, Bruce
 Ashfield	 <bruce.ashfield@gmail.com>
Date: Wed, 14 Jan 2026 12:30:33 +0000
In-Reply-To: <a9021108-40b2-4620-8ca5-911fa99ab5ba@bootlin.com>
References: <20260107151436.964819-1-joaomarcos.costa@bootlin.com>
	 <a9021108-40b2-4620-8ca5-911fa99ab5ba@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 12:30:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229321

On Wed, 2026-01-14 at 11:01 +0100, Joao Marcos Costa via lists.openembedded=
.org wrote:
> Hello,
>=20
> Gentle ping!
>=20
> On 1/7/26 16:14, Jo=C3=A3o Marcos Costa wrote:
> > This series moves RISC-V specific configuration out of linux-
> > yocto.inc into a
> > new inc file: linux-yocto-features.inc.
> >=20
> > By relocating these RISC-V specific settings, the configuration
> > remains
> > available for oe-core builds while avoiding unintended side effects
> > for external
> > or custom recipes that require such include file.
> >=20
> > The first patch only changes u-boot, and u-boot contains only one
> > versioned
> > recipe, so I kept it as it was in v1.
> >=20
> > Changes in v2:
> > - As per the comments in v1, I created a new inc file that is now
> > included in
> > =C2=A0=C2=A0 the versioned recipes
> >=20
>=20
> Would you have any thoughts on this v2? Thanks.

See the weekly status reports. We are having huge problems merging
patches at the moment due to failures in our testing infrastructure.

Patches which fix some of those issues get priority, most other things
are delayed, sorry. Time we might have spent on patch review is also
needed elsewhere right now.

I wish I had something better to report :/.

Cheers,

Richard

