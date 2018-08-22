Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 176BF7929B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 12:45:04 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id n2-v6so1494706wrw.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 05:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=CaBfPX3ahTJiKJ40n4r4G/VI7xCFKG1eTBevq4wPhUc=;
	b=N2H+3jHGA72kUx6Dwr8y5kPK8Cca0JAJPMWCCuoqlVE/bwhdn1BORtxsfAd3GjeLRl
	PwREFTP+A8cuP1PUWbbyVz+dvP3y56kmygG/WpLhFy9I65OLC0cJV1zQBmegs+uYRWjc
	hX+yz77pla8a0KD0jDYZXIL7mu1NWKGgr94kQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=CaBfPX3ahTJiKJ40n4r4G/VI7xCFKG1eTBevq4wPhUc=;
	b=ECupH2FzGfv6GKlMr9XeDjfURSolYFOiYkLuENIO7862ZA7jl4z3LR0neBHUukt7gP
	kuKh6TfuNs4NmCm2dCsA+xs/Prejr6+IzUEAlb069Yu9HaHb7Sp61l3Lh3gm4isS+X6x
	sW/UszT2I8InDlvyMd/jejOHayuSEFuIYrdeV5wiUIIJZ5OGrXUU91++ddaUyeKeDN6I
	uE7kcjpN1gRyGoTnfR6Ds54iqIWFQgPv7kID7rfo7sSP5XdER1p3flMtCoNignZ8pCt4
	OK7oF/XsDo6v7X/5SJ/CxZ33B1qLHHJw6/k6/1h+EyMZIo7Q2j5zdsTPyLkNEkOfKyfE
	wtPw==
X-Gm-Message-State: APzg51AcVuNGPhbmkkP2+9WEXcY2/J73Ciye+vg8v/92GgyLhabyp66+
	0NJfnQqjejHlWy75vXCruH0dyg==
X-Google-Smtp-Source: ANB0VdbnaSzIEkcQU2FDixzHBP7cpJJjWZRVUIQnJdf3U2rPhHHIFveYpSpTOejgT9DHwVXBlRiSEw==
X-Received: by 2002:adf:e711:: with SMTP id
	c17-v6mr4200295wrm.143.1534941905578; 
	Wed, 22 Aug 2018 05:45:05 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	w8-v6sm3414775wra.22.2018.08.22.05.45.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 Aug 2018 05:45:04 -0700 (PDT)
Message-ID: <10e5ea973727e06604a83299fdd5a8d4cfa2633a.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, 
	openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 Aug 2018 13:45:02 +0100
In-Reply-To: <20180821145858.18459-1-ricardo.ribalda@gmail.com>
References: <20180821145858.18459-1-ricardo.ribalda@gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Subject: Re: [PATCH] glibc: Fix ldd bug: not a dynamic executable error
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
X-List-Received-Date: Wed, 22 Aug 2018 12:45:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-08-21 at 16:58 +0200, Ricardo Ribalda Delgado wrote:
> RTLDLIST table does not include /lib/ld-linux-x86-64.so.2, resulting
> on the following error:
> 
> root@qt5122:~# ldd ./qtec_webcam
> not a dynamic executable
> 
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>  .../glibc/glibc/0031-ldd-rewrite.patch        | 22
> +++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.28.bb         |  1 +
>  2 files changed, 23 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/0031-ldd-
> rewrite.patch

I'm a bit confused as with MACHINE=qemux86-64, building core-image-sato 
with ldd added to IMAGE_INSTALL, ldd works correctly even though it has
/lib/ld-linux-x86-64.so.2 (which is listed in RTLDLIST).

We have an automated QA test checking this too:

http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/lib/oeqa/runtime/cases/ldd.py

Which version of the project are you using? How would we reproduce the
issue?

Regards,

Richard

