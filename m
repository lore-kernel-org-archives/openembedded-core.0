Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18220.1794922828817174253
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 05:40:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=GcAHinCZ;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id AA93BC79A97;
	Tue, 17 Nov 2026 13:40:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 47C2F5FC81;
	Tue, 17 Nov 2026 13:40:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9268611BC0008;
	Tue, 17 Nov 2026 14:40:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794922825; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=aapiWQ9E76eHHZuUoPbbergGEfY7N364+lEhEfGwB48=;
	b=GcAHinCZIcmqszC5mTD7HnhAICQjWw0hZA4dHpEFUHFVNhcMumLW8m3n9atb81USKQmIHC
	v4aiH+UPATuxTq0z16KAXEHpdP9K3vxM8uqw/HE8y4HSM4OlEVUdYGZlq67R5GU9Fn74DE
	du512W10uwbm7+aiWlvgVM/0y82M8jlQxTnG9IQx0G54NwKfmNqfOR5EBRLJQzLlp8imZF
	Hu93MI3Pdr5xzT3PdFBYg0C7F0kQQxDb+OwedYCovvQ9MuxAfxsmidtPm5UCN33xHErTth
	EhasnEePT2NfX7e7KR4fVnf/lzAzVFInl/biZZdggpt89ugZ4ZKXSN5SECW1BA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Nov 2026 14:40:23 +0100
Message-Id: <DMXJ1DVWTK13.TBQ9AVC1R0J5@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ragaprasanth@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] libjitterentropy: upgrade 3.6.3 -> 3.7.0
Cc: <jaipaul.cheernam@est.tech>, <ross.burton@arm.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261002071557.74249-2-jaipaul.cheernam@est.tech>
 <20261117024644.2849146-1-ragaprasanth@gmail.com>
In-Reply-To: <20261117024644.2849146-1-ragaprasanth@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 13:40:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250453

On Tue Nov 17, 2026 at 3:46 AM CET, prasanth via openembedded-core wrote:
> 3.7.0 locks the collector memory with mlock(), changes the startup to
> meet NTG.1, replaces the SHA3-256 output with XDRBG-256 and adds
> jent_status(). LICENSE only changes the copyright year.
>
> Two fixes are needed:
>
> - 3.7.0 uses C11 threads on Linux and makes struct jent_notime_ctx
>   private, so rng-tools fails to build. Backport the Linux part of the
>   upstream fix.
> - The Makefile now uses -std=3Dc11, which hides clock_gettime() on arm,
>   mips and riscv. Build with -D_DEFAULT_SOURCE.
>
> This picks up Jaipaul Cheernam's earlier upgrade patch [1].
>
> [1] https://patchwork.yoctoproject.org/project/oe-core/patch/202610020715=
57.74249-2-jaipaul.cheernam@est.tech/
>
> AI-Generated: Uses Claude
> Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
> ---

Hi Prasanth,

Thanks for the update.

The backported patch is quite different from what we have upstream. I
can understand this is probably because master evolved and I believe the
result is fine, but choices could have been described a bit more in the
commit message.

> --- /dev/null
> +++ b/meta/recipes-support/libjitterentropy/libjitterentropy/0001-Use-pth=
reads-on-Linux-and-make-struct-jent_notime_ct.patch
> @@ -0,0 +1,75 @@
> +From 1bc2ca956d4c64b765c2f19751614949ebe3734d Mon Sep 17 00:00:00 2001
> +From: Prasanth R <ragaprasanth@gmail.com>
> +Date: Tue, 17 Nov 2026 10:12:23 +0900
> +Subject: [PATCH] Use pthreads on Linux and make struct jent_notime_ctx p=
ublic
> +
> +3.7.0 switched Linux to C11 <threads.h> and moved struct jent_notime_ctx
> +out of jitterentropy.h. This breaks callers that install their own
> +thread handler with jent_entropy_switch_notime_impl(), such as
> +rng-tools: the start callback no longer takes a pthread start routine,
> +and the context is an incomplete type.
> +
> +Use pthreads on Linux again and define the pthread context in the
> +public header, as upstream did in commit a038d0c ("threads: always use
> +pthreads on Linux, add a native Win32 backend"). Only the Linux part
> +of that commit is taken.
> +
> +Upstream-Status: Backport [https://github.com/smuellerDD/jitterentropy-l=
ibrary/commit/a038d0c372f83aba10f3850c5b122dc5ff8cdc8c]
> +Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
> +
> +---
> + jitterentropy.h           | 15 ++++++++++++++-
> + src/jitterentropy-timer.c |  8 +-------
> + 2 files changed, 15 insertions(+), 8 deletions(-)
> +
> +diff --git a/jitterentropy.h b/jitterentropy.h
> +index f935c09..3ab1ba3 100644
> +--- a/jitterentropy.h
> ++++ b/jitterentropy.h
> +@@ -154,10 +154,23 @@ extern "C" {
> + #endif
> + #endif
> +=20
> +-#if defined(__MINGW32__) || defined(__APPLE__) || defined(__OpenBSD__) =
|| defined(__FreeBSD__) || defined(__NetBSD__)
> ++#if defined(__MINGW32__) || defined(__APPLE__) || defined(__OpenBSD__) =
|| defined(__FreeBSD__) || defined(__NetBSD__) || defined(__linux__)
> + #define JENT_PTHREAD
> + #endif
> +=20
> ++#ifdef JENT_PTHREAD
> ++#include <pthread.h>
> ++/*
> ++ * Context handed to the jent_notime_thread handlers. It is part of the=
 API:
> ++ * a caller that installs its own handler with
> ++ * jent_entropy_switch_notime_impl() has to create and join the thread.
> ++ */

Where does this comment come from? I can't see that in the original
commit, nor anywhere in master commit?

> ++struct jent_notime_ctx {
> ++	pthread_attr_t notime_pthread_attr;	/* pthreads library */
> ++	pthread_t notime_thread_id;		/* pthreads thread ID */
> ++};
> ++#endif
> ++
> + /* Forward declaration of opaque value */
> + struct rand_data;
> +=20
> +diff --git a/src/jitterentropy-timer.c b/src/jitterentropy-timer.c
> +index 77f732e..2c974f5 100644

Again, I believe the overall result is fine: we are just moving a
structure here.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

