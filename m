Return-Path: <trini@konsulko.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 5D2B17317C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 15:23:43 +0000 (UTC)
Received: by mail-qg0-f49.google.com with SMTP id f74so27151232qge.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 08:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=BQ3QrPO/8Tpc6aD+ufHcgVjJ2SgUORNBYl0WPnLKLNE=;
	b=toBhE+Hjs6fG8wlgWLgYyC6HH7ngL0Mh8l64RZPvfaDZCmxz0UgFvQhA8lA0/fXFeS
	qJQuxB4BFjJzI3wGopDsDe2RgOfQ98smAAy0zSUFk8z7dgTUVfT3BuYfW+X2NIA5JDuw
	U4jGfJSJQLg90mcCMEXJHSw2i5/uLJy0llxCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=BQ3QrPO/8Tpc6aD+ufHcgVjJ2SgUORNBYl0WPnLKLNE=;
	b=faYcETx/NVY1GOO83CEHv1+E/SMS77SHmJcnNn8ASBRuqnONNqUdMetUWwW1NRfmL7
	GVeR/wWTVBJrh1YarWY1qe0ov+dove/RzHAifKRTn+f23GloKMD0tq05J4dvA6cXZsuU
	jTUGF3bGEKfrtMeHAcOH8i+DWNuGXH0aKF8cn3cp9tYpMNfhYJO4LDLzvJbxOQ0L4pUf
	W13OFPvbufXakVO0BhhsXaOcY/fwNiZ3aclt49IsUOVFECJUrHfC1DPfM8qv6fpKW8aQ
	bKKiVXNsfJe2B5tdUCXtdQvbExdXMNLKxVOFphVechGiPUm4nEusdMGx+qL2EV05TWCC
	q8Sg==
X-Gm-Message-State: AOPr4FVh9naNORJEIDBGnZAi6WHAYCcJOPP9NFMs7tyodUK+acGyaM59iDF1TvHsQaX/Uw==
X-Received: by 10.140.217.208 with SMTP id n199mr12312915qhb.83.1461165824683; 
	Wed, 20 Apr 2016 08:23:44 -0700 (PDT)
Received: from bill-the-cat ([2001:470:8:32a:225:22ff:fec3:d28d])
	by smtp.gmail.com with ESMTPSA id
	f13sm28106334qhe.7.2016.04.20.08.23.43
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Wed, 20 Apr 2016 08:23:44 -0700 (PDT)
Date: Wed, 20 Apr 2016 11:23:46 -0400
From: Tom Rini <trini@konsulko.com>
To: Yannick Gicquel <yannick.gicquel@iot.bzh>
Message-ID: <20160420152346.GF1924@bill-the-cat>
References: <1461160239-7799-1-git-send-email-yannick.gicquel@iot.bzh>
	<1461160239-7799-5-git-send-email-yannick.gicquel@iot.bzh>
MIME-Version: 1.0
In-Reply-To: <1461160239-7799-5-git-send-email-yannick.gicquel@iot.bzh>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH v2 4/4] kernel: fitimage: basic support for fitimage signature
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
X-List-Received-Date: Wed, 20 Apr 2016 15:23:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 20, 2016 at 03:50:39PM +0200, Yannick Gicquel wrote:

> This is an initial support of fitImage signature to enable U-Boot verified
> boot. This feature is implemented by adding a signature tag to the
> configuration section of the generated fit-image.its file.
> 
> When a UBOOT_SIGN_ENABLE variable is set to "1", the signature procedure is
> activated and performs a second call to mkimage to sign the fitImage file and
> to include the public key in the deployed U-Boot device tree blob. (This
> implementation depends on the use of CONFIG_OF_SEPARATE in U-Boot.)
> 
> As the U-Boot device tree blob is appended in the deploy dir, a dependency
> on 'u-boot:do_deploy' is added when the feature is activated.
> 
> Signed-off-by: Yannick Gicquel <yannick.gicquel@iot.bzh>

Reviewed-by: Tom Rini <trini@konsulko.com>

-- 
Tom

