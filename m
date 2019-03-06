Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 49F876069C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Mar 2019 05:34:53 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id v10so11569295qtp.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Mar 2019 21:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=C3gdP/aNMC6S6MQPI6ryliy7hjoaHfd/WAg3rgSOnRE=;
	b=MWfvR8vFz+DYyvMEjtgTqGKRZJ8LTWahadWoZeUY1Brx7b+7Mil6hKHWfwDXOiu5AO
	7E4XBqgmErKAQ3CcIMYEjfX9ypOJzBxIXx9gFupI5xRddumpy8xfGoHdmUsrjuPh4mvy
	y63zhczqpECNJDOrpRCS+Mu+dnnvOCA10gVPulVmrGbO0Eg0TwFW8jdAbx5E0oKf3ukz
	AMQXT4Gy7FSHQR1T18wY/MjMG+M48AVxNMwxbeZEoMdzQU10XcoTtHE96MDfi7+PJhZc
	3RM6bQHxthFskG6BINZR8X+8s3zPxnK09rV6+Ksr08tszJ6pHnT2EXRlPWalCsMC40H7
	lVRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=C3gdP/aNMC6S6MQPI6ryliy7hjoaHfd/WAg3rgSOnRE=;
	b=I2Kt5kEx2XtCmM0J6j45l4F+m+HY5UIbhGRO3NabN0hLpht5AZeNjic9uvD7d4aW8C
	93kNR4RxMaUkxsVXoWDq2cAuQF87p4+KU8wEOQ6+2jKtcu2S014Mcz1DU9VklGorzZ1F
	o/wkp0A2sDp8lTV1oKJoewgVwxjgMfegLc6TLCXhjqGc/VeAiHuIhysWLRY400nKx0Sb
	NOu6JiEGN7N7valrjIu8/ntj7S2ZV+Fy+BXu7uiC6q11qKZS224cApp6dQDFbS5VCKnS
	POnT0DEv1eMs9kxTTKOyF9C5p0aXVfcbtXtbII4cUHhZ9GP7ZZKVwTPsxWtum8xhcU6N
	JOuA==
X-Gm-Message-State: APjAAAWWpiBShYoPFcSE/8U5KRDWWfXfsgXZmPdvsGFEF/NxQfO7298y
	0BYh50Ecf6H/b2s9n0uTTFiZ7cb+WPQU4ZdCcWl6MQ==
X-Google-Smtp-Source: APXvYqze2DdYW0USWcZOnzhKApX9l12UamWenoP0vIxAo+QY/h04y151kXzson8HHzR1/JFPpREecfYjxf0XhiMKzrw=
X-Received: by 2002:a0c:b660:: with SMTP id q32mr5021416qvf.50.1551850493949; 
	Tue, 05 Mar 2019 21:34:53 -0800 (PST)
MIME-Version: 1.0
References: <1551846256-166265-1-git-send-email-mingli.yu@windriver.com>
In-Reply-To: <1551846256-166265-1-git-send-email-mingli.yu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 5 Mar 2019 21:34:28 -0800
Message-ID: <CAMKF1sp6DERNjdQnGWYKqJddH67Rm=PUThyy=qkpeU_rKp1itw@mail.gmail.com>
To: Mingli Yu <mingli.yu@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-sanitizers: fix the build with -fno-omit-frame-pointer
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
X-List-Received-Date: Wed, 06 Mar 2019 05:34:53 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 5, 2019 at 8:24 PM <mingli.yu@windriver.com> wrote:
>
> From: Mingli Yu <Mingli.Yu@windriver.com>
>
> Fix the below build issue for gcc-sanitizers when
> both -mthumb and -fno-omit-frame-pointer configured
> for arm.
> | ../../../../libsanitizer/sanitizer_common/sanitizer_linux.cc: In function 'sanitizer::uptr sanitizer::internal_clone(int (*)(void*), void*, int, void*, int*, void*, int*)':
> | ../../../../libsanitizer/sanitizer_common/sanitizer_linux.cc:1540:1: error: r7 cannot be used in asm here
> }
>
> Reference: https://reviews.llvm.org/D50180
>
> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> ---
>  meta/recipes-devtools/gcc/gcc-sanitizers_8.2.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_8.2.bb b/meta/recipes-devtools/gcc/gcc-sanitizers_8.2.bb
> index f3c7058..2f89c86 100644
> --- a/meta/recipes-devtools/gcc/gcc-sanitizers_8.2.bb
> +++ b/meta/recipes-devtools/gcc/gcc-sanitizers_8.2.bb
> @@ -5,3 +5,4 @@ require gcc-sanitizers.inc
>  # sanitizer_linux.s:5749: Error: lo register required -- `ldr ip,[sp],#8'
>  ARM_INSTRUCTION_SET_armv4 = "arm"
>  ARM_INSTRUCTION_SET_armv5 = "arm"
> +TARGET_CFLAGS_remove_arm = "${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fno-omit-frame-pointer', '', d)}"

what target does it happen with ? since we set arm ISA for armv5 and
v4 it must be something else

