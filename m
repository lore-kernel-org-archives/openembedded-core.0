Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6F3C67DF85
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2019 10:01:18 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id f8so19533186wrt.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2019 03:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=Pz0LZaIWa3OUdu9eSIYwWARlYsee0pfgFQQlKK7cr3s=;
	b=cJNb/wUIV5lUwZjxpxtsklHQgt3zr+QxB72dAMu70fDG1eExyyKoVeFwhCFh1y5bh8
	dr2EagZB1lcZ1y/DiEwcaAf/RqeBNK6I9CxfuA7BT7ZLLdww51a4UuyqSpeeMwU6eJUX
	rd/YLS5fa8H0MAePZmkmkBbScob54txgP3cIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=Pz0LZaIWa3OUdu9eSIYwWARlYsee0pfgFQQlKK7cr3s=;
	b=FUTA73a58enaOLPzb7oicAYtTUqE+ut+OANQgiA5IEHT2ngLOOoBZZm+D9xgyeJbec
	0IQ9HiVdioBKnDPiCYxPa9lL6up3dvLHjMDNexZcTieQMnmc1bBQFQHjbjhrl20N6bZ0
	HQLvceoX7BVb/HcuOTGaXrC9F6BUQmiqwGxudd1/wiem84BgIxHs3Sc7uSNcD3iBnj8b
	43/coO8NAnqWR58KvPK/PvA1Bon/jhN6xz6yUX/GlNDUaYFeNpn2NgbPIF2LhBdRyeok
	2v8Hr/j3Yqucd9Ys2nnYCPOWlFDekQ2tuSSoQvkuOwRUUKRcfqmcfdtvPmKw9oUUw5dc
	MRmQ==
X-Gm-Message-State: APjAAAUeyKBQnUpdNS5aFWey084wJi87duieFXAPr83qsPj5Idjx8sdq
	9JGOcOrVL5Z30X6D5rfbU2W+Nw==
X-Google-Smtp-Source: APXvYqyLAVdp+AmIs/zUttV84xooo8mjjg2XcYUS+gts7SeWQS41gdV/IQ5bEfsilEBSqwQOBa216g==
X-Received: by 2002:a5d:6a90:: with SMTP id s16mr8480012wru.288.1559037679096; 
	Tue, 28 May 2019 03:01:19 -0700 (PDT)
Received: from hex.config (5751ab90.skybroadband.com. [87.81.171.144])
	by smtp.gmail.com with ESMTPSA id
	s11sm12687863wro.17.2019.05.28.03.01.17
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 28 May 2019 03:01:18 -0700 (PDT)
Message-ID: <5a62beea5ad46e24bc1e59c5cf9938799c0e3d12.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: mingli.yu@windriver.com, openembedded-core@lists.openembedded.org
Date: Tue, 28 May 2019 11:01:16 +0100
In-Reply-To: <1559036425-276422-1-git-send-email-mingli.yu@windriver.com>
References: <12580c58f5d64b60ca87f5077b43924af5d746d2.camel@linuxfoundation.org>
	<1559036425-276422-1-git-send-email-mingli.yu@windriver.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH v2] elfutils: fix ptest failures
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
X-List-Received-Date: Tue, 28 May 2019 10:01:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-05-28 at 17:40 +0800, mingli.yu@windriver.com wrote:
> From: Mingli Yu <Mingli.Yu@windriver.com>
> 
> * Add missing -ptest package dependencies (needs
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
> * Don't split the -debug package for elfutils as
>   most cases needs the binary to have .symtab.

Can you provide more details on what this last item means?

Do you mean elfutils is generally broken without the symtab section?
That seems unusual? Or do you mean the tests need it to be present?

Not striping the binary at all is likely to cause a significant size
increase for elfutils and we want to avoid that, particularly if its
only to fix tests. We will probably have to find a different solution
(e.g. second copy with the symtab section in the ptest package, added
to PATH in the runner?)

Cheers,

Richard




