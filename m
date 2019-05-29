Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5BB926D548
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 18:40:18 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id w9so2271467wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 11:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=a/fvQya6VFVTrdNgpuvl/4hxJZHhaMKQ8Ur9zv1Qw9k=;
	b=bVhPBV58r6PyBV4PcNJPMrvYxUwnqoWZ/xpuPR8o3gFhoC0bDu1lsRGTjTjK/mQOmd
	1mqJdkwxyrg/+rQPW1q5EG2YBrDBTDXVuTkXzdu0jEW++6ZoGbAX/8ZxRSzYbOfgEeyh
	hhaP+qjWVqO44EEwL0+Ewu0XGO+g46y61VQCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=a/fvQya6VFVTrdNgpuvl/4hxJZHhaMKQ8Ur9zv1Qw9k=;
	b=stGb9kL2WLGn2YZwah59AaCjLoSmKAIUy154K5oo0abtLx0lTMZDcvSx2kbIZYtn5S
	Z7t6muvQ85DaFCbK6Ec9gxUc/4ZlxFGl36eF+Ngzv7iOm9D41XGEJ1+RmZJ24pk+suO5
	sTK8z0JMP2lfH8gMe0XaAE3br2tGFdKsH2gtmn7eJUxGF9t+ZNy7BdtEGMrwMyb/NGQa
	kyVGmEZP5xLd8wum7F5j1CjwC8idlOBIL+pOTkj5x8mGi3Jc2X9ydCpGjGlPRuQl9vO3
	qBdAzNWlmMm2csNkjg2wpVdjInVHR7lg4VLG6kBjBpbGaCpIXNjmc78PgXRlz7O0aY95
	ZyKA==
X-Gm-Message-State: APjAAAW3sVw4RNnVVJu2bYf5Nt1uai5x/2ATyg7PVDhDTNvFHVmp8lX3
	Ac1Kd9V2PYwLi5PftPs5WwQtVw==
X-Google-Smtp-Source: APXvYqyQ+ixpqF+hnjBgujsF53MpPJSVn0RPNfOEtHbWvnw+Ndce8hyqMXI7nXaf8YZBaOAdPejCWw==
X-Received: by 2002:a1c:6c1a:: with SMTP id h26mr8130927wmc.89.1559155218991; 
	Wed, 29 May 2019 11:40:18 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id o20sm585193wro.2.2019.05.29.11.40.17
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 29 May 2019 11:40:18 -0700 (PDT)
Message-ID: <db641393dee9ad005cc693a8dc623afa6bdcd19f.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: mingli.yu@windriver.com, openembedded-core@lists.openembedded.org
Date: Wed, 29 May 2019 19:40:15 +0100
In-Reply-To: <1559120138-3450-1-git-send-email-mingli.yu@windriver.com>
References: <5a62beea5ad46e24bc1e59c5cf9938799c0e3d12.camel@linuxfoundation.org>
	<1559120138-3450-1-git-send-email-mingli.yu@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH v3] elfutils: fix ptest failures
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
X-List-Received-Date: Wed, 29 May 2019 18:40:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-05-29 at 16:55 +0800, mingli.yu@windriver.com wrote:
> From: Mingli Yu <Mingli.Yu@windriver.com>
> 
> * Add missing -ptest package dependency (needs
>   ${PN}-dev)
> 
> * Add missing files which needed by ptest test
>   to fix the ptest failures such as:
>   | sh: ../src/elflint: No such file or directory
>   | FAIL: asm-tst4
> 
> * Rework 0001-skip-the-test-when-gcc-not-deployed.patch
>   to skip the tests which depend on gcc
> 
> * Define INHIBIT_PACKAGE_STRIP_FILES for elfutils to
>   avoid stripping some generated binaries otherwise
>   some of the tests such as test-nlist, run-strip-reloc.sh,
>   run-strip-strmerge.sh and so on will fail
> 
> Before:
> --------------------------------------------
> Recipe   | Passed    | Failed   | Skipped
> --------------------------------------------
> elfutils | 176       | 23       | 4
> --------------------------------------------
> 
> After:
> --------------------------------------------
> Recipe   | Passed    | Failed   | Skipped
> --------------------------------------------
> elfutils | 199       | 0       | 4
> --------------------------------------------
> 
> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>

I tested this without the libdir strip lines and it fails on musl:

https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/645

Cheers,

Richard


