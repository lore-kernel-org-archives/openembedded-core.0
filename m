Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 25A526D548
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 18:45:50 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id i3so2346486wml.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 11:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=AKGtb+rZFuk1hkL3I7Ng+NtE1bbw67hx5cRXvxPUbGQ=;
	b=KW6lWVAAcz5eM5pTtJvyxv6fMHK1pOVayZudPO98mJjBBTqf0rWAji/5Jre/V2ey5I
	HbvONF9Yr/whO3hswj9ChZ4Lsi3+qE9ZO0eGz6ZgJpY5pZC7fXtKAp2mYcyBjRvsD8fT
	8UN1kRSqrQajdoHSLqYQ88Zg9nnEmt9b9cQ6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=AKGtb+rZFuk1hkL3I7Ng+NtE1bbw67hx5cRXvxPUbGQ=;
	b=oyXB+rn7IN0INkAsIgSmtMTc6YPAGwNTio3JCtCzG8e8NEq5/FFH0IM2dF9STdskTs
	c4NM7Ctm5D6CFhfPycFQcw9ItjIiTL9jBH9u019ITrGNucpXC/ccxVNGPzXolnFx4U3T
	rFmUZHj8c1JU+2UgxStaUoks06aefLhL0zeJiSQnSOrRpnQTbGstuWXCMJ1J+5pDZ3X/
	BVQRbK6lrapXYjRSp4Pim8yy9d7ur4jcXESGwKMHlZ8PBCvMBqcm+sUdc1EgzeYzdjKw
	aOezPhelQ2xSFxW38ByZpczO1iV0FqYphUdcIok0VR4PLldV8gN6rA8QoKRArIpkkVi1
	08wg==
X-Gm-Message-State: APjAAAVp7Uqlw62yVl7W878pleRAqefDBMB5CWKb4lBSNAdOrBhA9qEL
	9BgiGW1buY1TKc4cC57nqa4QZpv/6mo=
X-Google-Smtp-Source: APXvYqyL3tlfc/C3KV8+n0CV637lMJk+T2GNGQbEj8plF1Z9jRdhZ5u0kg0Th97CX6iEpfrVDYHa5A==
X-Received: by 2002:a1c:7e10:: with SMTP id z16mr7923436wmc.98.1559155551763; 
	Wed, 29 May 2019 11:45:51 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id l18sm657916wrh.54.2019.05.29.11.45.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 29 May 2019 11:45:51 -0700 (PDT)
Message-ID: <43b12f6cf16d43e788827f48a935ff6bdc3c777d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrei Gherzan <andrei@gherzan.ro>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 29 May 2019 19:45:49 +0100
In-Reply-To: <20190529144130.21278-1-andrei@gherzan.ro>
References: <20190529144130.21278-1-andrei@gherzan.ro>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH V2] ca-certificates: Fix openssl runtime dependency
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
X-List-Received-Date: Wed, 29 May 2019 18:45:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-05-29 at 15:41 +0100, Andrei Gherzan wrote:
> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> ---
>  .../ca-certificates/ca-certificates_20190110.bb               | 4
> +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-support/ca-certificates/ca-
> certificates_20190110.bb b/meta/recipes-support/ca-certificates/ca-
> certificates_20190110.bb
> index 4c0425302f..7c06573db2 100644
> --- a/meta/recipes-support/ca-certificates/ca-
> certificates_20190110.bb
> +++ b/meta/recipes-support/ca-certificates/ca-
> certificates_20190110.bb
> @@ -82,6 +82,8 @@ do_install_append_class-native () {
>      SYSROOT="${D}${base_prefix}" ${D}${sbindir}/update-ca-
> certificates
>  }
>  
> -RDEPENDS_${PN} += "openssl"
> +RDEPENDS_${PN}_class-target = "openssl-bin"
> +RDEPENDS_${PN}_class-native = "openssl"
> +RDEPENDS_${PN}_class-nativesdk = "openssl"

Wouldn't the nativesdk version be openssl-bin too?

or really these would end up being openssl-native and 
nativesdk-openssl-bin?

Cheers,

Richard


