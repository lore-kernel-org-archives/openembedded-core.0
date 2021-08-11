Received: from avasout06.plus.net (avasout06.plus.net [212.159.14.18])
 by mx.groups.io with SMTP id smtpd.web08.10620.1628702368654738204
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Aug 2021 10:19:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=XW+2U18r;
 spf=pass (domain: mcrowe.com, ip: 212.159.14.18, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id DrszmLUxAHBkXDrt0m3iVK; Wed, 11 Aug 2021 18:19:27 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=fI+iIaSe c=1 sm=1 tr=0
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=kj9zAlcOel0A:10 a=MhDmnRu9jo8A:10 a=Q4-j1AaZAAAA:8 a=-An2I_7KAAAA:8
 a=bP2RIwKDkekpPqqFy4cA:9 a=CjuIK1q_8ugA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=Sq34B_EcNBM9_nrAYB9S:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	 s=20191005; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description; bh=YQ+4wf1dnGCVYG0KQbzUdMTEqLQ9Y9qWQzbjuE08Qmo=; b=XW+2U
	18rUUW/kPGMKEc+RFfG7oRzgciFiKo/1DJrZU0Gv8vXhHFXE9mM/6Tl0b0ATLa8wySXhp0jiLWUPt
	4A+Hiig45/w0tVhRLL+UxwfVvUieN8BVqZTe7sI9+Xlbf89l7tNnOQrtI/UJgHO0ZBhunt4ML888F
	w4UZqh2Upmb9zTLdVXsQRDEcigYQL2b7bn8ShnJpAhXmnJr4y7oo5bxTJFIREx2jkJtE64zpTqsnR
	Mja4aQxyljXVVPxF0cXGlA8KifomPc3/YFNVg2M3nDHydcJoYMhMZwPbtpoNf7wbTAGpyXm87t/9R
	/+eI3bdgIR1zfDB66skMgh+dUoB2w==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.92)
	(envelope-from <mac@mcrowe.com>)
	id 1mDrsz-0004pv-Hi; Wed, 11 Aug 2021 18:19:25 +0100
Date: Wed, 11 Aug 2021 18:19:25 +0100
From: "Mike Crowe" <yocto@mac.mcrowe.com>
To: Philip Lorenz <philip@bithub.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [pseudo][PATCH] test: Add missing test-statx test case
Message-ID: <20210811171925.GA15765@mcrowe.com>
References: <20210811164132.74849-1-philip@bithub.de>
MIME-Version: 1.0
In-Reply-To: <20210811164132.74849-1-philip@bithub.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Envelope: MS4wfEtln/a7WXq+6qqQg+dP3do9BVYY4Lqpa59l9n/joSEnzPxssNgZ7LSJbN8R8WjtdJFsd5SxtJ1g6hzg2tZynak8fT8aIEaYFdSkNJqQdQSS7oh21L2H
 EyQQh75aGvxOvdTEV1dB2g/3RqtulNzFTxtbfqunIx4E3WCu9AGQ0lBFkIrUxc6Xo8EOqSdaZnzsLg==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wednesday 11 August 2021 at 18:41:32 +0200, Philip Lorenz wrote:
> Adding this test case was erroneously omitted in
> 7c722296879906fe093e1e7c4b7537e150d492cd.
> 
> Signed-off-by: Philip Lorenz <philip@bithub.de>
> ---
>  test/test-statx.c  | 20 ++++++++++++++++++++
>  test/test-statx.sh |  6 ++++++
>  2 files changed, 26 insertions(+)
>  create mode 100644 test/test-statx.c
>  create mode 100755 test/test-statx.sh
> 
> diff --git a/test/test-statx.c b/test/test-statx.c
> new file mode 100644
> index 0000000..06d86af
> --- /dev/null
> +++ b/test/test-statx.c
> @@ -0,0 +1,20 @@
> +/*
> + * Test that passing NULL to a parameter marked as nonnull works correctly
> + * SPDX-License-Identifier: LGPL-2.1-only
> + *
> + */
> +#define _GNU_SOURCE
> +
> +#include <sys/stat.h>
> +#include <unistd.h>
> +#include <fcntl.h>
> +
> +// Passing a null pointer is the test scenario
> +#pragma GCC diagnostic ignored "-Wnonnull"
> +
> +int main(void) {
> +    if (statx(0, NULL, 0, 0, NULL) != -1) {
> +        return 1;
> +    }
> +    return 0;
> +}
> diff --git a/test/test-statx.sh b/test/test-statx.sh
> new file mode 100755
> index 0000000..77d0302
> --- /dev/null
> +++ b/test/test-statx.sh
> @@ -0,0 +1,6 @@
> +#!/bin/bash
> +#
> +# SPDX-License-Identifier: LGPL-2.1-only
> +#
> +
> +exec ./test/test-statx
> -- 
> 2.32.0
> 

> 
> 
> 

Applying this patch (along with <169A4FE272BB166C.28384@lists.openembedded.org>)
makes all the tests pass for me. However, the run of test-statx.sh causes:

 couldn't allocate absolute path for '(null)'.

to be printed.

Thanks.

Mike.
