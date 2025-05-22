Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22331C54E90
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 10:57:39 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.21353.1747911448666646722
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 03:57:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=yVfGtDkH;
 spf=pass (domain: linaro.org, ip: 209.85.167.54, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54acc0cd458so10343711e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 03:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747911446; x=1748516246; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cZr2K18X9ch1ZKIPz/PfSUupQqoDBBksCcnexZ9mFkc=;
        b=yVfGtDkHbNVGjQ+eMd+WV0lGgbIf2bwUA/XUo/CaFcKsVHxwY7LKVqpXPLCpVFLqul
         3PiYnBjKjp0RAc8jQUzoUvBa/8Y6hXR+bfNnqp/KxdmiAZstSlZi5x7q7cO5Bit1Ql8Y
         rB3KUnDltNpWYeCqqEhNTHe6ZhO1MkSjR/0OEQ8SZ4wmmRn2ULEglarFKpRw5SMcRToG
         Cyju85Ue6AwvxKaCIyLZYqOGV/5wEZBasAViJ141swDmvevOQ398qssxtei45DaQxYE0
         HII/KT9epQjmYyfROYKWsvPBQqtOc7FZq1JDaSIfpoSNfcLiKgdWAVsKILCLXVITOYRu
         +9EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747911446; x=1748516246;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cZr2K18X9ch1ZKIPz/PfSUupQqoDBBksCcnexZ9mFkc=;
        b=Qd1J5NeYonDEqHh7MkgYh4V/k2pHMkV3xeNHpfNsyFr6fISzXd2ghDbPOGgaq1FjBn
         5JDLm0tAqQ7l9bdq2pe1jb0AZcaipI60oXqlMWou8nX+nlHpzxc1NDVKyQ9JcFuEnKoQ
         YF47L8Atogtf8h+J76WM0bjgoKKQ7N7uoif1Dtto1XREBqFPIVV/YvixzIEriH8WUHNW
         itYmtoHenIDGDRcOP/PfR3XwhMc6wZABCyzIAP+JmFdt+Y+IOIdhvYmJK93doWNPBTB2
         IVj0EhIfAgPbufmK+202wMqaxY3kxXdVaaaXd0hmLTZwu5/myCnUQKRnVhGhOq1rSXux
         30RQ==
X-Gm-Message-State: AOJu0YyZc9R2WfpnyN8tLmLxKPsvI01qaXqh4aIs9k1BPhY32ImJN8Kb
	+bfcL8w5vlpUi1VVP904xgbgibULz//lDBpi7OaJoAhws8h/syN34IZhl/4lYewFun8=
X-Gm-Gg: ASbGnctmGUc9iZTPF6SddGhITA6V9eBclJZlJ7AmXactdG3nIUIyzZhoOTtX8fv/bQn
	T1r5regGIlWmRQtfYqIEb5Qq2Mx1gN+sXn2YlTpPMvvobgyIA/NxhQ5w1Zw6Yxwa4VKBI6LLL/6
	E4tpj4JX1r+QzVycl5r2D+RHKI22ZvbeFVY1L6ZRuYz9vkxxSVnKt5YUBVlRNz2LvRxNzWHxtTW
	4V+IniUwfG44udnkrNDBuzjsnXxM3ahOpiFKEniqNcd9nKZFOfh5gDM7u4B4HW35s1yiAOj+pQo
	H2fw+z5j7P4iZoAtdJDSEhOUdVFzo9lL3bVM9HL1CzTxnyz7sdxGQ2j/CNuhOwz2B+A1Nwfkubv
	Pvh+k5p/m
X-Google-Smtp-Source: AGHT+IH/TUINdxAktTTULrrKy6jBXeR9jyMWPtbaLWiISUHiFV9e9Kc/7vYx7wHorBlfS3K1Sz+8fw==
X-Received: by 2002:a05:6512:2616:b0:54f:c35a:3754 with SMTP id 2adb3069b0e04-550e71cef3amr6354162e87.27.1747911446497;
        Thu, 22 May 2025 03:57:26 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e704046csm3339696e87.239.2025.05.22.03.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 03:57:26 -0700 (PDT)
Date: Thu, 22 May 2025 13:57:24 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: Re: [OE-core] [PATCH v2] u-boot: disable CONFIG_BLOBLIST on
 genericarm64 and qemuarm64
Message-ID: <aC8DFDTWfC_xGQ8s@nuoska>
References: <20250521184906.181219-1-mikko.rapeli@linaro.org>
 <CANNYZj-8WFy0CWocfy911Gqc4nKYOfyZt4cPKx8PizOZxPNc+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj-8WFy0CWocfy911Gqc4nKYOfyZt4cPKx8PizOZxPNc+Q@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 10:57:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217085

Hi,

On Thu, May 22, 2025 at 12:51:25PM +0200, Alexander Kanavin wrote:
> On Wed, 21 May 2025 at 20:49, Mikko Rapeli via lists.openembedded.org
> <mikko.rapeli=linaro.org@lists.openembedded.org> wrote:
> > +# workaround for aarch64 kvm qemu boot regression
> > +SRC_URI:append:qemuarm64 = " file://disable-CONFIG_BLOBLIST.cfg"
> > +SRC_URI:append:genericarm64 = " file://disable-CONFIG_BLOBLIST.cfg"
> 
> What steps are going to be taken to get to the root cause of this?
> Does this workaround have to be kept forever?

We're following this up with u-boot upstream maintainers.

Then I'd like to add a selftest to oe-core for this usecase of
booting qemuarm64 and genericarm64 target images and u-boot
with qemu under kvm on native aarch64 build machine.

Sorting out some qemuarm64 runqemu details currently.

Cheers,

-Mikko

