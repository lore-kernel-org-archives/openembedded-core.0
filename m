Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id DEFF6747E7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 12:04:17 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id w2so2422862wrt.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 05:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=IUi/SXp9zWn7RDvV3HNwjcgFKD3/NvM2ME/i/PCI6pc=;
	b=Of40dk7hPo4fD5yyeHDFQGTs5Y6h1NOgGGCMTEY+KO7OpQJN8/ftEVma7nwa5xS3SX
	mpJWwazNGzk53+idxG4SqqN0nMef8uSM9ZgTq1f0DQAGKT5yxgK5X2Khy5ZVGYJ45D5b
	e22dmi7RhlPM7O1hiYzuDlt5y26h5yzgMnI+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=IUi/SXp9zWn7RDvV3HNwjcgFKD3/NvM2ME/i/PCI6pc=;
	b=kM88PyK64EQ/W717oHX6O4uw/Khk2hnMhOcIpck5et0lwhGhO7s6iV9jnTnJ1Uhbhd
	tVtiQlWHCKpGzgFCiSDtGAckJHMTnieCSTHJLPProgkJ4hel6Ild32SRTx4IT0P64exn
	qG6b7Qj1jGnYavdrvH58l1PaBZ4gX+d+oU2q9yZaY9o1iz6heKZcc5cE6jNDMh2L/ngS
	r5QfeR5g8I8v5w2svVBM+MTvFsJrI9Ed/CNauXPEBVYz+XqKC0eQpj7UsMbU7K3DVCC3
	QOV2hCljZ/ZN4kaVSCaFjrcTdXsgNx5936X9XjZZlawSm3LIwpFfUoRee1xwOkYdKHlQ
	bNww==
X-Gm-Message-State: APjAAAXCe5jmXszpk7WiaTs7U4KBtkQgAoSZXFq68hIwC7Jl/ZWcCy1J
	RGP5hJDHDSxdLUj4tOxpwwSoEg==
X-Google-Smtp-Source: APXvYqweZ88v2s19HND71U6X/yCfunw7223EF3yej67it9kpgGwhaFxfPvXroAw3JHAqZb807p/fyg==
X-Received: by 2002:adf:f111:: with SMTP id r17mr22328219wro.272.1553083458732;
	Wed, 20 Mar 2019 05:04:18 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	j184sm2688150wma.47.2019.03.20.05.04.17
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 20 Mar 2019 05:04:18 -0700 (PDT)
Message-ID: <861e1a12b82944f7a363d4f6f10b8f54340df1fb.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Alexey Brodkin <alexey.brodkin@synopsys.com>, Kai Kang
	<kai.kang@windriver.com>
Date: Wed, 20 Mar 2019 12:04:16 +0000
In-Reply-To: <4881796E12491D4BB15146FE0209CE6468224B73@de02wembxa.internal.synopsys.com>
References: <4881796E12491D4BB15146FE0209CE6468224B73@de02wembxa.internal.synopsys.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: qemu: backport patches to fix cves breaks qemu-system-native
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
X-List-Received-Date: Wed, 20 Mar 2019 12:04:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-03-20 at 07:42 +0000, Alexey Brodkin wrote:
> Hello Kai Kang,
> 
> You recent changes in QEMU [1] lead to build failure:
> -------------------------------------->8-----------------------------
> --------
> # bitbake qemu-system-native
> ...
> > .../build/tmp-glibc/work/x86_64-linux/qemu-system-native/3.1.0-
> > r0/qemu-3.1.0/hw/rdma/rdma_backend.c:316:42: error:
> > 'VENDOR_ERR_INV_NUM_SGE' undeclared (first use in this function)
> >          comp_handler(IBV_WC_GENERAL_ERR, VENDOR_ERR_INV_NUM_SGE,
> > ctx);
> >                                           ^
> -------------------------------------->8-----------------------------
> --------
> 
> That's obviously because of meta/recipes-devtools/qemu/qemu/0015-fix-
> CVE-2018-20124.patch.
> 
> I'm wondering if you tried to build QEMU yourself?

We're not seeing this on the autobuilder, is this gated by some non-
default config option?

Cheers,

Richard


