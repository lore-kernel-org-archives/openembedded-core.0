Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id E29727E422
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2019 15:46:00 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id g17so77662692wrr.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Aug 2019 08:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=3+63MOP4UBwswrdv/LgM+Fx26wWghw/6201vHAetvdE=;
	b=PuqP5GBIZMqjnKIN9IQLgvjRZ2lqVlW5lEwKK3WqGTxQHFw432REIvCDw36sU5KT3U
	dz0b2aoja1pc4v2Qx23+G4XGSO0l1ZLkZ9YnYUomx8RIwNUmcpqQbQS7El6be6WXNHSE
	TuJiQ+IM6rot4fHqqI4Rn1+LCffDnVyQx73ao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=3+63MOP4UBwswrdv/LgM+Fx26wWghw/6201vHAetvdE=;
	b=hmQIGss2CFjWc2e2fiK7rKzA7AU93SVK9pe/jfdhjHns4zHzI82mz0/SbZ984CwDzA
	Sk4YC8vFB3bsThHMapCbJ9OsQ7kAWUuv6V1i2CIFXSQtRAqcXrH1ZITYafHvCicW2b0U
	0EJYC+9C5UljmC8CZxNzfvPSVapWNKHBNYbw14N6+owU8JDp0mpFe+djQjIi7ovC8+hl
	NnxPYHoSQypbx80z9T+7Jwy34kN3DFfPoV7KZnrZWwIfcn6fXVBtNYF2KHw9FV6vIbBX
	N5634Nhd9Zl0P6GRLJPu2WmMKxJqt+sXn7/MthwFP9lYxSjiWFZzgnhA4r4rPrIqVJtt
	C6fQ==
X-Gm-Message-State: APjAAAWRyMuXUOW/tR6Lkkn8ByMNehJFwBKD33l1M+WVvQBG6EU83It2
	Jj0AfXZzCP8zgjA7B4kX2X/mcQ==
X-Google-Smtp-Source: APXvYqwdgCNedQ36pIevQAtMT17nAohgNDpJdKf2yivVvIVs5Y1aqrSP68PZgo0aamgm5WZ3LA/v+A==
X-Received: by 2002:adf:df8b:: with SMTP id z11mr90345320wrl.62.1564760761687; 
	Fri, 02 Aug 2019 08:46:01 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u1sm71704868wml.14.2019.08.02.08.46.00
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 02 Aug 2019 08:46:01 -0700 (PDT)
Message-ID: <e46e1d0f5ff44a4fe3ddbbfd301c72061962cdb7.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: chee.yang.lee@intel.com, openembedded-core@lists.openembedded.org
Date: Fri, 02 Aug 2019 16:46:00 +0100
In-Reply-To: <1564749183-3162-1-git-send-email-chee.yang.lee@intel.com>
References: <1564749183-3162-1-git-send-email-chee.yang.lee@intel.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH v2] systemd-boot:grub-efi:wic: add variable APPENDS for multiple boot configuration
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Aug 2019 15:46:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-08-02 at 20:33 +0800, chee.yang.lee@intel.com wrote:
> From: Chee Yang Lee <chee.yang.lee@intel.com>
> 
> introduce new variable APPENDS to define multiple
> boot configuration for systemd-boot and grub-efi.
> 
> APPENDS set the different in kernel option for each .conf
> file(for systemd-boot) or menuentry(for grub-efi).
> Include the differences in the title.
> Separate each configuration with ";".
> 
> e.g.:
> APPEND = "console=tty0 rootwait"
> APPENDS = " i915.enable_guc=0; i915.enable_guc=2"
> 
> for systemd-boot, above setting will produce 2 .conf,
> boot-1.conf and boot-2.conf which set with below title and option:
> 
> boot-1.conf -
> 	title boot-1 i915.enable_guc=0
> 	option console=tty0 rootwait i915.enable_guc=0
> 
> boot-2.conf -
> 	title boot-2 i915.enable_guc=2
> 	option console=tty0 rootwait i915.enable_guc=2
> 
> 
> also update oeqa/selftest/wic testcase to fit the new variable.

APPEND was a horrible choice of variable name. Lets not compound the
problem by adding new versions of it!

Cheers,

Richard


