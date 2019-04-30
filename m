Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7EBDE6BE2A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 10:26:55 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id p21so3190121wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 03:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=FiOCz4R0dJNT9VBNm0qAb2U5MaoCHegNF5Jtd2XAmak=;
	b=Mb9N829fxpXg+HbuCFzymFQqE5e4UuzrLmuaaIxvrgVecUZv/EXmt3LKM5C90MKNCa
	2HLoKsAme/wCBtJitx5+bA6Kk1rabfcDm7sqMyDyUrOBR/acVqFosC8ciaHqDGIKrBI2
	JUX6pukHFsmxtNalvFOIFGAs55WteuVuB/28g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=FiOCz4R0dJNT9VBNm0qAb2U5MaoCHegNF5Jtd2XAmak=;
	b=ZyIOFcjlM1d4PmUXdFd7pfnDoifCqIyEMTtaNY+EU2KhB9dlKaRYdlGkOha4cLsr7V
	v/z4Cx9L6L6A2Eweb+Kta3/X6AtDD4uhbRWu3mBPcXHUJUeoemeVlT5WLcTfMk3w3l55
	a7l5lQYl7iwJuREyBb3PkBaZR5CXJGyBXjxQuZ1ALSOxFjVm2H5q5zc82aOkue4AayfL
	rV9e2IbNiHRN58MM6R//hcG4IKIrJsrKul0YCsL/KcM7OsVFlLTThpwuSFaSJAQwW2zx
	7PnHZXvqymowYISBATFh9t/DocIwDhnXjc7w8QtDqPz2M8njHoajbRch949wUW3C1V2Y
	FvVA==
X-Gm-Message-State: APjAAAXO+CAwahnUY9hxUYiVmMjn9eTolqyQaiT0i9OlHkCJy9K1O/lX
	vPk4O4iD9CDYIFz5JNCqA2F0MQ==
X-Google-Smtp-Source: APXvYqwR7JrFGqf+7s+RJKhyGnTLR1w4IEK8O+NXUB0le/rK6xihrdr/cmcj0Us9NNNBjFG+EFJpRQ==
X-Received: by 2002:a1c:b189:: with SMTP id a131mr2572549wmf.107.1556620016206;
	Tue, 30 Apr 2019 03:26:56 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id o5sm1873710wmc.16.2019.04.30.03.26.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 30 Apr 2019 03:26:55 -0700 (PDT)
Message-ID: <36c9eed229ab8b2bedc6e6903a5be396abc7d1de.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrej Valek <andrej.valek@siemens.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 30 Apr 2019 11:26:54 +0100
In-Reply-To: <20190430095917.3680-1-andrej.valek@siemens.com>
References: <20190430095917.3680-1-andrej.valek@siemens.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 0/1] insane.bbclass: Add QA package check for mixed bins and libs
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
X-List-Received-Date: Tue, 30 Apr 2019 10:26:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-04-30 at 11:59 +0200, Andrej Valek wrote:
> In multi-lib cases some packages with mixed binaries and libraries
> could have a problem. Explanations with GDB and bmap-tools.
> 
> GDB requires python binary (RDEPENDS) and bmap-tools too.
> GDB is installed as 32bit variant and bmap-tools as 64bit.
> In the current state both type (32+64) of required libraries
> will be installed on the target. (I think' this is the right case.)
> 
> At the end a 32bit variant of binaries wins and overrides the 64bit.
> Finally GDB is working without any problems and bmap-tools not.
> Bacuse 64-bit python binary was overriden with 32-bit.
> 
> All-arch variant has been disabled for multilib. Is there any special
> reson why?

Yes, this had long discussion and was done very reluctantly.

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=d9ba0219b2f6643ffc825d4b8d3494d07237dd0b

was the commit but there was a lot of discussion on the list before it
merged.

> How we can proceed with this kind of problem? There are many others
> tools like python, perl, ... . 
> 
> Just for info, I have run this check locally with current
> `bitbake world`, >100 packages have this problem.

Merging a QA test which causes hundreds of warnings isn't really going
to help unless we have a strategy for fixing it.

As I understand it, if you install python 32bit and 64 bit, you should
get the libraries from both but only the binaries from the one that
wins. That should mean anything linking to the lib should work?

What am I missing? Is something not working like that? Is this with the
rpm or opkg implementation? (they're very different)

Cheers,

Richard




