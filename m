Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 957447D302
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jun 2019 16:27:07 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id w13so16474646wru.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Jun 2019 09:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=mrDKk8C6dnoPGkrxUHsuYvLl8euYBQxM0VBDJ/gt7jQ=;
	b=f/adQWwcznLVDRVlOC4DmLGKrkTP+3/qm+7gWnOR2YglNL5UMi30gU9rJ64dzAOK5V
	9+CEsFGxL4YwEmAZ1O36DjRMQKpnVhqsOrvLLUicXCUOoFnh54tzjUIsPdUkfB0FcP/O
	qcYzITVTYF7sGiKf798y4GHP2vLX9ZLN5EjB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=mrDKk8C6dnoPGkrxUHsuYvLl8euYBQxM0VBDJ/gt7jQ=;
	b=X6o8U1QDg/w8G78PUptgMc9UKE4CObyTbKS/7lRIzw/4lfSV7pj0B8YQNQFCC08YKE
	durIfXyIcM+rh3DJfdRhs2NL8ZdRH8XyDFfqwGQksnISJYxTByNSJn+Qe38nsNASq0ks
	lnVX5AxPyoZ6yghfK5x1P1Cd2F+UxKHOYZkDCQWZzBUn25he/o08zIxxluAKNnyz8qW8
	70g2hnEUToAdVS+tfTXePVC0iDFcRRiWuH3VZxZsbCVNmJ4mbhYKFHKbt7RhmzRI81vY
	bDmcUz3flBVRPBACq5xwTjwF5hy9dAuF3yS8kl/EBxRCdvD/8r5EaemAwPHeUjnzbwD7
	cvjw==
X-Gm-Message-State: APjAAAXM0j/4PWle2iXsOof1K5ziLET17ALYS1f0V5FhMk6dJ3OdFAuB
	0d3S1hVssKlMmMfqDl5x9qcANg==
X-Google-Smtp-Source: APXvYqxKcHQA/L1D59DudtFbpdTJH2zQP9ygBKhbXhwNM24ZPpJ8GRqmE8T0lrPrM3yi8VSC6lcnsg==
X-Received: by 2002:adf:c7d0:: with SMTP id y16mr21282122wrg.39.1559665628278; 
	Tue, 04 Jun 2019 09:27:08 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	v2sm14002481wrn.30.2019.06.04.09.27.07
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 04 Jun 2019 09:27:07 -0700 (PDT)
Message-ID: <4996a2364b056cded0e75eefd40dd6d79a7e234a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Aditya Tayade <Aditya.Tayade@kpit.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Tue, 04 Jun 2019 17:27:06 +0100
In-Reply-To: <1559580099-29530-1-git-send-email-Aditya.Tayade@kpit.com>
References: <1559580099-29530-1-git-send-email-Aditya.Tayade@kpit.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Nisha Parrakat <Nisha.Parrakat@kpit.com>, Michael Ho <Michael.Ho@bmw.de>
Subject: Re: [poky][meta][PATCH] package_manager.py: handle renamed packages for PACKAGE_EXCLUDE with opkg
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
X-List-Received-Date: Tue, 04 Jun 2019 16:27:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-06-03 at 16:42 +0000, Aditya Tayade wrote:
> From: Michael Ho <Michael.Ho@bmw.de>
> 
> The PACKAGE_EXCLUDE variable is used to pass a list of packages to be
> forbidden from installation with opkg. This list however does not
> account
> normally for the renaming of packages which can occur (for example
> when the
> debian bbclass is enabled, packages with libs are renamed from xxx to
> libxxx)
> and so expected excluded packages are not blocked.
> 
> Rather than tediously maintaining the PACKAGE_EXCLUDE variable to
> handle
> renamed packages that can dynamically change, move the expansion of
> the
> variable from parsing time to run time so it can use the pkgdata
> dictionaries
> to add automatically any renamed packages.
> 
> Upstream-Status: Pending
> 
> Signed-off-by: Michael Ho <Michael.Ho@bmw.de>
> Signed-off-by: Aditya.Tayade <Aditya.Tayade@kpit.com>

This seems to cause test failures:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/197

(see the selftest failures).

Cheers,

Richard


