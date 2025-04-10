Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADBCFC3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 06:42:18 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.28137.1744267330632566112
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Apr 2025 23:42:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=he5FKZFt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39ac9aea656so324035f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 23:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744267329; x=1744872129; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wt6sUhTfAaQJSbfLeW+oAsoi4YsdNjW/C7fHOsfLvds=;
        b=he5FKZFtaNgn6SE3TsiMkuzvDXype+BTmoOmTh//W/QRbmydby8HMuYabqewm16yxT
         U5HyZcFsF7LlroMHMPoqRo4pMdi0g0qRHf0iFcHtzjOu+pcEToeOsSpn6PDdWdyrMT5Y
         aXLyS2TbnB44qtMNPE7yToZvvoBQ5636WyK+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744267329; x=1744872129;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wt6sUhTfAaQJSbfLeW+oAsoi4YsdNjW/C7fHOsfLvds=;
        b=heGDsd9iYe/lPaj3NPObHyIEwGa6jGZh9wgOCEu0y6FrEcC/UJVAg66iLX4pqZAgfF
         BS88ANug7mp3X2Srf+HED3ZhbWki+MaupGmXD0xLPifVcXCpXfdpsHBuJwvNvo1kUzpI
         uO9LurOpwm0AApW98zK4m9vB1k47MLZnJmkA+AYhZh6/Xa5CjDxIKYXCJ9X7+yDIhgag
         IkypHnoIOwPP4lH8oX6SMxiVDVwFiAO4ieidGUzxFb/c7ELL6SIj6/kcoC5RVshy0q6W
         TXacERZKmYj3acvEarp70eP1/YsqTY7TUHOeHar/RCQLqzYAi1Ksi6PDal6Dk310pKx1
         mbTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwewIaN3NXbwVxy+3yBuZT/HSy6aGrWI1rNZRnb8d9KIQQOMuf5UPy25RmcYsK77+7eyMrXej9QBF9JUxp5ClLaA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx8Xenge2IEV6xFnrBWd58RrTnPWwBHb87vqMNp5WRFHnolBX7t
	4oBEhq6dVsRfWAYRbFKPYCM+d09exERXPzuJi3cRvyoiuhsvRhuqZ8wx0S/pvJE=
X-Gm-Gg: ASbGncsos+e7zbpHFXEpmQjRYqJWY6eWW157XrascdQq6Q/HeE3qLg7eBpXF/QI8I2N
	esBD7cD0mdUpFdEVLa5UylDPv6LJfvoLZgLynXtLUf3nD3F/LbGq0/v3hlKOuhcAaViVFDeF8eP
	D4/BXKEa6BRJVZvJCUaNp/+Se1L+/dvUbv6XKD+cokPmY/vZ387siy62Akm8Oiy9J52ScDYiSNo
	Vwv7/hg+6JZfwJ5oKpO3HPpW+VsfAkTwUOC+1Mm3CfGuodRE24fIOeU7jc4i/V1mrlvjOLTMGuv
	e8d9FWCejcAvve65ibJYeSp9CscZA8/5+JHFKFK7Q7wsmddra8mHMcRWJKLg5HOatE0WP3wkysM
	sUdDUqalODoTnSi4acFeUAEyIHONqw72hKpe8t6/O
X-Google-Smtp-Source: AGHT+IHhNU24ybtQdCAIW/LMsNTY6y6E8BdP0bilkqdYckOvGQLLrmDNgrhTqsbcnVQlMcQgLWhfLg==
X-Received: by 2002:a5d:5847:0:b0:39c:223f:2770 with SMTP id ffacd0b85a97d-39d8fd46736mr873216f8f.15.1744267328840;
        Wed, 09 Apr 2025 23:42:08 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:48b8:26f1:fe26:d411? ([2001:8b0:aba:5f3c:48b8:26f1:fe26:d411])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893f0d0asm3794064f8f.74.2025.04.09.23.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 23:42:08 -0700 (PDT)
Message-ID: <5e07f80db60ee353f2acd1ed0d8d7bdb00544337.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH 1/2] classes/recipes: remove unnecessary qemu
 inherit and qemu-native dependency
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Chen, Qi" <Qi.Chen@windriver.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 10 Apr 2025 07:42:07 +0100
In-Reply-To: <CO6PR11MB5602D636B4069B499A6EF4D1EDB72@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20250410040825.1283228-1-Qi.Chen@windriver.com>
	 <35ee8bfe577addc9e6ae978588b5a071be82b478.camel@linuxfoundation.org>
	 <CO6PR11MB5602D636B4069B499A6EF4D1EDB72@CO6PR11MB5602.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 06:42:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214622

On Thu, 2025-04-10 at 06:31 +0000, Chen, Qi wrote:
> The postinst uses qemuwrapper which in turns uses qemu-native. But
> the postinst runs at do_rootfs time. And this dependency is ensured
> by the following line:
> meta/classes-recipe/image.bbclass:DEPENDS +=3D "${@' '.join(["%s-
> qemuwrapper-cross" % m for m in
> d.getVar("MULTILIB_VARIANTS").split()])} qemuwrapper-cross
> depmodwrapper-cross cross-localedef-native"
>=20
> PACKAGE_WRITE_DEPS=C2=A0 is for do_package_write_rpm/deb/ipk. These tasks
> do not run postinst and thus not using qemu-native. So 'qemu-native'
> can be removed from PACKAGE_WRITE_DEPS safely.
>=20
> For the removal of qemu.bbclass inherit, these classes/recipes do not
> really use any function from this qemu.bbclass. So we can safely
> remove 'inherit qemu' for them.
>=20
> My test for this patch 1/2 is: qemux86-64 + systemd + bitbake core-
> image-sato. There's no error.

Something needs to trigger the system to have qemu-native available at
do_rootfs time since these recipes write a postinstall which can use
qemu. That is what PACKAGE_WRITE_DEPS is for. I suspect you're pulling
in qemu through other dependencies but that doesn't mean this one is
unneeded.

package.bbclass has a comment about this:

# If your postinstall can execute at rootfs creation time rather than on
# target but depends on a native/cross tool in order to execute, you need t=
o
# list that tool in PACKAGE_WRITE_DEPS. Target package dependencies belong
# in the package dependencies as normal, this is just for native/cross supp=
ort
# tools at rootfs build time.
PACKAGE_WRITE_DEPS ??=3D ""

As for the qemu class inherit, the code used to write the qemu binary
call into the postinst but it uses qemuwrapper now which comes from
qemuwrapper-cross. I suspect you're right that it means the qemu
inherit is no longer needed however we should probably change the
inherit qemu for a PACKAGE_WRITE_DEPS +=3D "qemuwrapper-cross"?

(and see if we could remove the dependency in image.bbclass?)

Cheers,

Richard



