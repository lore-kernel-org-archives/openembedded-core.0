Received: from avasout06.plus.net (avasout06.plus.net [212.159.14.18])
 by mx.groups.io with SMTP id smtpd.web08.9853.1628699125758004143
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Aug 2021 09:25:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=Wnhqi4K1;
 spf=pass (domain: mcrowe.com, ip: 212.159.14.18, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id Dr2gmLQgQHBkXDr2im3fQa; Wed, 11 Aug 2021 17:25:24 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=fI+iIaSe c=1 sm=1 tr=0
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=kj9zAlcOel0A:10 a=MhDmnRu9jo8A:10 a=mDV3o1hIAAAA:8 a=lfmcuOSuc41UBbPs3uQA:9
 a=CjuIK1q_8ugA:10 a=_FVE-zBwftR9WsbkzFJk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	 s=20191005; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description; bh=JUlZvolBV+rCMpK/VjLeRFurd4Xpzs0CXDoaX/4P46A=; b=Wnhqi
	4K1AH5p5P/5uj5agZd9kTdXW5fez/2BAW4Ae2eDBEzr9/EjNq3JQ+rz3WnHb9i+yX63s5XqtS/78t
	50toN4NWvS+9Ulz4mgdn2EkH1lvVCYlE5+s92BCxtQfFdMYqvocE3TecF0nWZZpQiVigoA50f/09e
	rhVmvDLQGGs/rk94avKxUWgjTgo0GC03NzFKtwKs/+DFUErIjP9T+O1f2PqgEJvyJ1v3TUXHgavHY
	TQD3loB112ufocu7BYCkX6jjl8gloS/CksJ3d2FmUmqOmNL0FxtjGpxl3G15TPigDuBFqRRV6Ub8K
	s/xiJ0Tx+JiEXmwG27LOYxFMmJVfQ==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.92)
	(envelope-from <mac@mcrowe.com>)
	id 1mDr2g-0002Wr-RQ; Wed, 11 Aug 2021 17:25:22 +0100
Date: Wed, 11 Aug 2021 17:25:22 +0100
From: "Mike Crowe" <yocto@mac.mcrowe.com>
To: Philip Lorenz <philip@bithub.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [pseudo][PATCH] makewrappers: Handle parameters marked as nonnull
Message-ID: <20210811162522.GA9259@mcrowe.com>
References: <20210517192506.48088-1-philip@bithub.de>
MIME-Version: 1.0
In-Reply-To: <20210517192506.48088-1-philip@bithub.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Envelope: MS4wfBhNkPsMpEQHJFGv3qZVgGNeM0rXvlGTx+gDrIT1nmaRdU6AdfK8VeCaquVIBDRwgUt2/wQr2on4UgsY/hRmx7dJS67DnNRcIw1pC95rbTFa5F/sP6vD
 eaPlv1INOjmNgc9buO+KZRaSz8zT43sAr60wr7cHDjWVNRyqX4yk1jfEk8fOI+zu3d/9oMgCtE4etw==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Monday 17 May 2021 at 21:25:06 +0200, Philip Lorenz wrote:
> Commit 60e25a36558f1f07dcce1a044fe976b475bec42b started dereferencing
> the "path" parameter which for some functions is annotated with the
> "nonnull" attribute. While the commit explicitly checks for NULL
> pointers before dereferencing it, GCC (at optimization level 1 and
> above) removes the check due to the "nonnull" attribute being set for
> some parameters in the glibc headers (e.g. statx()).
> 
> However, the statx() man page explicitly allows calling with NULL
> pointers (in which case the EFAULT is returned) and this behaviour is
> used in the wild (e.g. in Rust) to determine whether the statx() system
> call is supported.
> 
> Disabling the optimization is not possible ([1]) so prevent the compiler
> optimization by referencing the parameter in a noop inline assembly
> instruction instead.
> 
> [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=100404
> 
> Signed-off-by: Philip Lorenz <philip@bithub.de>
> ---
>  Makefile.in        |  2 ++
>  makewrappers       |  6 +++++-
>  test/test-fstat.c  | 29 +++++++++++++++++++++++++++++
>  test/test-fstat.sh |  8 ++++++++
>  4 files changed, 44 insertions(+), 1 deletion(-)
>  create mode 100644 test/test-fstat.c
>  create mode 100755 test/test-fstat.sh
> 
> diff --git a/Makefile.in b/Makefile.in
> index cf13010..10441ef 100644
> --- a/Makefile.in
> +++ b/Makefile.in
> @@ -77,6 +77,8 @@ all: $(LIBPSEUDO) $(PSEUDO) $(PSEUDODB) $(PSEUDOLOG) $(PSEUDO_PROFILE)
>  test: all | $(BIN) $(LIB) $(LOCALSTATE)
>  	$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -o test/test-rename-fstat test/test-rename-fstat.c
>  	$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -o test/test-openat test/test-openat.c
> +	$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -o test/test-statx test/test-statx.c

The test/test-stax.c file wasn't included in the patch, which means that
"make test" no longer works on the current pseudo oe-core branch. :(
Perhaps this went unnoticed since it's necessary to run configure again for
the Makefile to be regenerated to see the problem.

Do you still have the file, or should I just submit a change to remove this
line?

Thanks.

Mike.
