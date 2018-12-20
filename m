Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id BC6DF79C81
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 10:14:04 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id f188so1438873wmf.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 02:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=Wh5XeeAiKbL+pJeKFSkcyrqB0C2d1mxhnVHLsE1fTsQ=;
	b=cjI9IgoAOuCHcleaR/rMWsyXyHqtJBsx9/F/7Q+SLkAO4XM0Wdnydb0QZyuVepNGCH
	gJNB23SXtlvUz7499PmxuxPeM0UyloCyHH1iy4CERayodQtbvruaqZ6FK4lo+bhemDQ5
	MGJhs1AhUA3/xd0m3mLKIB4+ysXsTjJK5NPxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=Wh5XeeAiKbL+pJeKFSkcyrqB0C2d1mxhnVHLsE1fTsQ=;
	b=Iruub1Hm8TSnAGUETJVZyrRxoreN1idY8JOCdFSTVgvfZpfP4obEb2v3vRMjp30uVB
	2KN9kPrUl7dnv9UnarFkqT3C2fIyWwIQ1vn56FkIYSVhFeNg93bNZtmEx62r4fijXWcD
	lAH2ziOVSczuueqPOQ9ARCph/j5rVggA5rqwnSIzsCX5cp1VYv5Ti67VAFlBzi0CK9PZ
	+dpMIAddEHk4gMxfZW7rAjWxsYkkn1zjeCszF8Qwa7pyY834+4+t7OxmtxLCj8IO3QZ0
	M9+rdACVcbVzchkHHvAcqxIFkCvRSh3cuP3vA6mRX9q8mGO2STL9eExNcpuV/qWRg5JA
	eJKw==
X-Gm-Message-State: AA+aEWYWvUPMZFSUBnW/yTRtUmDv+yQ/yMdspCJVCXG8DB9zg4g7y5Md
	sZLM2nV3i00uwG4fghg/HTtFzg==
X-Google-Smtp-Source: AFSGD/XeEcuph3pqrTwoWsTukg4ymGNCont70pE69xak3jKkVAo8EpuBKm9TdpvLje8rfoyse0IAAw==
X-Received: by 2002:a1c:8acf:: with SMTP id
	m198mr11344520wmd.143.1545300845154; 
	Thu, 20 Dec 2018 02:14:05 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id n9sm5450412wrx.80.2018.12.20.02.14.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 20 Dec 2018 02:14:04 -0800 (PST)
Message-ID: <53c222052c0da6a7db056bfa1318371c8b7db2dc.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 20 Dec 2018 10:14:03 +0000
In-Reply-To: <29e6785a8b38d49961aa7f1138d664336052dca8.1545291716.git.liezhi.yang@windriver.com>
References: <cover.1545291716.git.liezhi.yang@windriver.com>
	<29e6785a8b38d49961aa7f1138d664336052dca8.1545291716.git.liezhi.yang@windriver.com>
User-Agent: Evolution 3.30.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] oeqa/concurrencytest: fix for locating meta-selftest
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
X-List-Received-Date: Thu, 20 Dec 2018 10:14:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-12-19 at 23:43 -0800, Robert Yang wrote:
> The previous code assumed builddir and meta-selftest are in the same
> dir, but this isn't always true, builddir can be anywhere, use
> bitbake to locate meta-selftest can fix the problem.
> 
> The bb.fatal() doesn't work (no error message is print), so I use
> raise Exception to print error messages.
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/lib/oeqa/core/utils/concurrencytest.py | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oeqa/core/utils/concurrencytest.py
> b/meta/lib/oeqa/core/utils/concurrencytest.py
> index f050289..ef1698c 100644
> --- a/meta/lib/oeqa/core/utils/concurrencytest.py
> +++ b/meta/lib/oeqa/core/utils/concurrencytest.py
> @@ -139,6 +139,20 @@ def removebuilddir(d):
>          delay = delay - 1
>      bb.utils.prunedir(d)
>  
> +def get_selftestdir():
> +    """
> +    Use 'which bitbake' to locate meta-selftest dir
> +    """
> +    cmd = 'which bitbake'
> +    retval, bitbake_path = subprocess.getstatusoutput(cmd)
> +    if retval != 0:
> +        raise Exception('Failed to run %s' % cmd)
> +    topdir = os.path.realpath('%s/../../' %
> os.path.dirname(bitbake_path))
> +    selftestdir = os.path.join(topdir, 'meta-selftest')
> +    if not os.path.exists(selftestdir):
> +        raise Exception('Failed to run %s' % cmd)
> +    return selftestdir
> +
>  def fork_for_tests(concurrency_num, suite):
>      result = []
>      test_blocks = partition_tests(suite, concurrency_num)
> @@ -166,7 +180,7 @@ def fork_for_tests(concurrency_num, suite):
>                  if 'BUILDDIR' in os.environ:
>                      builddir = os.environ['BUILDDIR']
>                      newbuilddir = builddir + "-st-" + str(ourpid)
> -                    selftestdir = os.path.abspath(builddir +
> "/../meta-selftest")
> +                    selftestdir = get_selftestdir()
>                      newselftestdir = newbuilddir + "/meta-selftest"

Sorry, but this change just swaps one problem for another. meta-
selftest is part of OE-Core so its position relative to bitbake isn't
fixed.

How about we use 

from oeqa.utils.commands import get_test_layer

?

Cheers,

Richard


