Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 13C737EC40
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 15:10:49 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id t9so424865wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 08:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=279kLPBSFg6PHTezZQkPq//TCfEH/CcFuQyX/C7LAzk=;
	b=RisE+msK1nHIMZYe0LOkbg5MmJrRUxHeQ6B066B8byqyG80FfxpSMUfo/ijN2oZ5Qn
	M5j2fwW4o1v2djb4Xe/yPVfF4Zw2f3DBv2rO/mLrc02Fr6/aXT2AMQwdIwzwzm+6uCYB
	G3lyoymE4N1IkZzOiLJICr/iCpBz7F/HQEnXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=279kLPBSFg6PHTezZQkPq//TCfEH/CcFuQyX/C7LAzk=;
	b=UERefW1IiCFH8f1jx91O77tqxJc2m5dYxMnZ/D2wbuzLb+cVJmg54bAHaWafwJBUSK
	AMkB18wBMInCW4KT7Bz7jmohLOSodlyHTCnchNWbIOxp6L4ocYAphfk55VyDljDyAxRj
	ktzCwI/yxC+Gu3IbnW6C/DT20G8TeOiYR6QrkejxGDY8dwjt9VaHhA54H7Hr/bj8kcFf
	MPy1BcQImYAlVk2GLPUGhbRh1gwoLOVkkLK/efbcCANSPzd5Af9q9DGBt8TU4cBGmr4A
	CyD1kUVo9On+D29H7yU6mOQB7a+T/MidaXZ/oMrGotMsRR34r592gn+JjkXHCFYdPc7w
	Kbcg==
X-Gm-Message-State: APjAAAU1/ckeUVR4f4dFxrXdBnej2FEFHWuzvKqDxmgfG446un7+mNYV
	0kWYgSFfOYSLLnRaubEekDFuAQ==
X-Google-Smtp-Source: APXvYqy9FPGgd0TymOHcEYfqilz/5pRHNcTMFbCFnJC6QUOXrRYFUU0onuvO8ovkmuEJp/ED65C+vQ==
X-Received: by 2002:a05:600c:22c6:: with SMTP id 6mr5502296wmg.5.1567005050651;
	Wed, 28 Aug 2019 08:10:50 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id p7sm3221091wmh.38.2019.08.28.08.10.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 28 Aug 2019 08:10:50 -0700 (PDT)
Message-ID: <f32703c17e6bba01a1584f056c85f1530f32238e.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Nathan Rossi <nathan@nathanrossi.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 28 Aug 2019 16:10:48 +0100
In-Reply-To: <20190828050629.6392-1-nathan@nathanrossi.com>
References: <20190828050629.6392-0-nathan@nathanrossi.com>
	<20190828050629.6392-1-nathan@nathanrossi.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 1/11] binutils: Add do_check task for executing binutils test suite
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
X-List-Received-Date: Wed, 28 Aug 2019 15:10:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-08-28 at 05:06 +0000, Nathan Rossi wrote:
> Create the do_check task to the binutils-cross include. This task can
> be
> used to execute the binutils test suite for the cross target
> binutils.
> By default this executes all the check targets of the binutils
> Makefile,
> this can however be changed by setting MAKE_CHECK_TARGETS to the
> desired
> test suite target (e.g. check-gas).
> 
> The binutils test suites do not require any target execution, as such
> the check target can be run without QEMU or a target device. However
> since the binutils tests do rely on a C compiler there is dependence
> on
> both gcc and libc in order to run the tests.
> 
> Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>

Looking at this a bit further we have a problem with gcc-cross and
binutils-cross.

The trouble is we extracted all "target" dependencies away from the
cross recipes. This means we build *-cross once per target arch but the
runtime pieces are build once per target tune.

The tests are very much target tune specific so shouldn't be in the
cross recipes.

This is going to cause worlds of pain when we switch between machines
that use the same arch but different tunes and the sysroot has files
from a previous different tune.

I suspect this will manifest itself should we run the signature checks
but there real underlying problem here people will run into that we'll
have to solve before this can merge.

There is a secondary issue later in the series with adding the test
results to "selftest".

On the autobuilder we run "selftest" once and assume its machine
independent. These results clearly aren't. This gives problems for both
running the tests and processing the results.

Equally, "cross" toolchain tests aren't really "runtime" but are
machine/target specific. FWIW, injecting the test results the way you
are doing is good and the right thing to do but I think we may need a
different class of test, or we inject them as a special case of runtime
test, or runtime ptest (a cross runtime ptest result?).

I'm happy to try and help figure out how to address some of this if I
can help somehow. I am conscious the release deadlines are pressing too
:(.

Cheers,

Richard










