Received: from avasout06.plus.net (avasout06.plus.net [212.159.14.18])
 by mx.groups.io with SMTP id smtpd.web11.24575.1630946210705004880
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Sep 2021 09:37:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=Yy4N3y0t;
 spf=pass (domain: mcrowe.com, ip: 212.159.14.18, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id NHcRmRG4BzwAFNHcSmAFb2; Mon, 06 Sep 2021 17:37:16 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=FKGAO9gs c=1 sm=1 tr=0
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=kj9zAlcOel0A:10 a=7QKq2e-ADPsA:10 a=Q4-j1AaZAAAA:8 a=-An2I_7KAAAA:8
 a=M-MkGaxb3aqYuCHlqhUA:9 a=CjuIK1q_8ugA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=Sq34B_EcNBM9_nrAYB9S:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20191005; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Sender:Reply-To:CC:Content-Transfer-Encoding:Content-ID:
	Content-Description; bh=5+DKzHMSzENtaMZ+vSUJ0HsyE8FxVjsKakJF9Gae++s=; b=Yy4N3
	y0tjwFKJEX7iJHdud0Yq144MQxJ9KyOQgKegKqu9kMXz56PpCf7eC3RK1Jy++KlIT6YYIJx8AudmG
	RZlmabSjskbUfK+tmH2lQMdB7xVvprZ70o+w/m+/kA+RrZ5sqLAgDk1+DLE7WaPD6H7IlKFI28jYx
	ciUeRz00V4K9YXpqWDx2seNvndjm+VPq1rOoEUTRgPUavftaAbXPQVoE7J9oX+5e3AsbuoiOmHmSy
	t5r4PkOspd/3S55IWCsUogOhbM0hwYV9D30b5tL3DVSLHXj0o6VujDAUfumSTVmqm28oMnGAxgKWE
	Ha4yohX9NnxIbecm8SU4NB304hpkw==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.94.2)
	(envelope-from <mac@mcrowe.com>)
	id 1mNHcQ-00GSIs-S5
	for openembedded-core@lists.openembedded.org; Mon, 06 Sep 2021 17:37:14 +0100
Date: Mon, 6 Sep 2021 17:37:14 +0100
From: "Mike Crowe" <yocto@mac.mcrowe.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [pseudo][PATCH v2] fcntl: Add support for fcntl F_GETPIPE_SZ and F_SETPIPE_SZ
Message-ID: <YTZDuuDXNVI2arzz@mcrowe.com>
References: <169AD8EBF1055369.13770@lists.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <169AD8EBF1055369.13770@lists.openembedded.org>
X-CMAE-Envelope: MS4wfAtco05XsPDI1hQ6h4nOyVBef86Gp7IUqTxsoV2eo2Ez6fTTb8fYiUoTeyPRmcMSbkHRQCE0kFDLDT/N+6Plj3eQu/JbfB2naurHvHXiVtBTYaceeAgy
 vI2qtO2u3yHWnOd9Uz1F3QPm4L8jFsCw+4fXQnxzEIKfoMgu1rYKw3a4S2U2+gJdq5w4c9zJfJedbg==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Friday 13 August 2021 at 12:05:09 +0100, Mike Crowe via lists.openembedded.org wrote:
> When running the test suite on my Debian 11 box I see many occurrences
> of:
> 
>  unknown fcntl argument 1032, assuming long argument.
> 
> (for example from test-execl.sh.)
> 
> It appears that this is F_GETPIPE_SZ and it takes no arguments. Let's
> add it and the corresponding F_SETPIPE_SZ too to avoid the warning
> messages.
> 
> F_SETPIPE_SZ accepts an int argument, which strictly speaking isn't the
> same as the long that the wrapper expects. However, this is also true
> for F_DUPFD which seems to be working correctly on all the targets that
> people care about.
> 
> We need to define the command constants if the system headers don't
> provide them to ensure that a binary built on an old system works
> without the new commands works correctly only a newer one that tries to
> use them. If the system values differ from the expected ones then such a
> binary would also be incompatible, so fail the build in that case too.
> 
> Signed-off-by: Mike Crowe <mac@mcrowe.com>
> ---
>  Makefile.in              |  1 +
>  ports/linux/guts/fcntl.c | 21 +++++++++++++++
>  test/test-fcntl.c        | 58 ++++++++++++++++++++++++++++++++++++++++
>  test/test-fcntl.sh       |  5 ++++
>  4 files changed, 85 insertions(+)
>  create mode 100644 test/test-fcntl.c
>  create mode 100755 test/test-fcntl.sh
> 
> diff --git a/Makefile.in b/Makefile.in
> index 10441ef..4ebe5da 100644
> --- a/Makefile.in
> +++ b/Makefile.in
> @@ -79,6 +79,7 @@ test: all | $(BIN) $(LIB) $(LOCALSTATE)
>  	$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -o test/test-openat test/test-openat.c
>  	$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -o test/test-statx test/test-statx.c
>  	$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -o test/test-fstat test/test-fstat.c
> +	$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -o test/test-fcntl test/test-fcntl.c
>  	@./run_tests.sh -v
>  
>  install-lib: $(LIBPSEUDO)
> diff --git a/ports/linux/guts/fcntl.c b/ports/linux/guts/fcntl.c
> index 434c7f3..ffb50be 100644
> --- a/ports/linux/guts/fcntl.c
> +++ b/ports/linux/guts/fcntl.c
> @@ -8,6 +8,22 @@
>   * wrap_fcntl(int fd, int cmd, ...struct flock *lock) {
>   *	int rc = -1;
>   */
> +#if !defined(F_GETPIPE_SZ)
> +#define F_GETPIPE_SZ (1032)
> +#endif
> +
> +#if F_GETPIPE_SZ != 1032
> +#error System F_GETPIPE_SZ has unexpected value
> +#endif
> +
> +#if !defined(F_SETPIPE_SZ)
> +#define F_SETPIPE_SZ (1031)
> +#endif
> +
> +#if F_SETPIPE_SZ != 1031
> +#error System F_SETPIPE_SZ has unexpected value
> +#endif
> +
>   	long arg;
>  	int save_errno;
>  
> @@ -31,12 +47,17 @@
>  		}
>  		errno = save_errno;
>  		break;
> +	case F_SETPIPE_SZ:
> +		/* actually do something */
> +		rc = real_fcntl(fd, cmd, arg);
> +		break;
>  	/* no argument: */
>  	case F_GETFD:
>  	case F_GETFL:
>  	case F_GETOWN:
>  	case F_GETSIG:
>  	case F_GETLEASE:
> +	case F_GETPIPE_SZ:
>  		rc = real_fcntl(fd, cmd);
>  		break;
>  	/* long argument */
> diff --git a/test/test-fcntl.c b/test/test-fcntl.c
> new file mode 100644
> index 0000000..b593d50
> --- /dev/null
> +++ b/test/test-fcntl.c
> @@ -0,0 +1,58 @@
> +/* fcntl-linux.h doesn't define F_GETPIPE_SZ and F_SETPIPE_SZ without
> + * this */
> +#define _GNU_SOURCE
> +
> +#include <sys/types.h>
> +#include <sys/stat.h>
> +#include <fcntl.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <limits.h>
> +#include <unistd.h>
> +#include <string.h>
> +
> +int test_pipe_sz()
> +{
> +#if defined(F_GETPIPE_SZ) && defined(F_SETPIPE_SZ)
> +	int pipefd[2];
> +
> +	if (pipe(pipefd) < 0) {
> +		perror("pipe");
> +		return 1;
> +	}
> +
> +	const int orig_size = fcntl(pipefd[0], F_GETPIPE_SZ);
> +	if (orig_size < 0) {
> +		perror("F_GETPIPE_SZ");
> +		return 1;
> +	}
> +
> +	const int new_size = orig_size * 2;
> +
> +	if (fcntl(pipefd[0], F_SETPIPE_SZ, new_size) < 0) {
> +		perror("F_SETPIPE_SZ");
> +		return 1;
> +	}
> +
> +	const int final_size = fcntl(pipefd[0], F_GETPIPE_SZ);
> +	if (final_size < 0) {
> +		perror("Second F_GETPIPE_SZ");
> +		return 1;
> +	}
> +
> +	if (final_size < new_size) {
> +		fprintf(stderr, "Unexpected final pipe size: %d\n", final_size);
> +		return 1;
> +	}
> +#else
> +	printf("Host too old for F_GETPIPE_SZ and F_SETPIPE_SZ tests\n");
> +#endif
> +	return 0;
> +}
> +
> +int main()
> +{
> +	int result = 0;
> +	result += test_pipe_sz();
> +	return result;
> +}
> diff --git a/test/test-fcntl.sh b/test/test-fcntl.sh
> new file mode 100755
> index 0000000..7112620
> --- /dev/null
> +++ b/test/test-fcntl.sh
> @@ -0,0 +1,5 @@
> +#!/bin/bash
> +#
> +# SPDX-License-Identifier: LGPL-2.1-only
> +#
> +./test/test-fcntl
> -- 
> 2.30.2
> 

Ping.

Mike.
