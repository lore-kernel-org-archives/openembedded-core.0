Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id DE39670D4E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 05:05:54 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id eu11so20203462pac.32
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Aug 2014 22:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0EGLRqfoJ84b5dVdDuChaMvR0vJcxK+mIWU9YpvIwq8=;
	b=ub9DL6s0QRR60CWkqnzWwyIYawSA68f1zNmoAguaNr25HFUw8Y5pXQZT3jolk5YuVZ
	uGC6me76yPY4AtJ/DzcnsqPUbKiJ2ZY4oDGmp/rzTzGY+ffDjSmdGJTHOcw5B40v6WjO
	8o9jMMCqeTDngNrGj+irawTzUyADYyL5IqA3mfwlN4wwbDLhosAS7dQ2qK3QXWlv5KBt
	Qz1cP2+S4lsEuRSmEATQv+3/VLThCZkbEyJmdbkixGTmlIqc+1PGuVKQKM5nL9df401F
	FqDEBO19IS0h/huUpx+oBCk3uatsH3Xflf38tDOjVKzv8jpDr1iRLSkI55RFS7RXDsZ8
	DcnA==
X-Received: by 10.70.119.97 with SMTP id kt1mr25727184pdb.54.1408943155679;
	Sun, 24 Aug 2014 22:05:55 -0700 (PDT)
Received: from haswell ([2601:9:3580:7a5:baca:3aff:fe80:aa8f])
	by mx.google.com with ESMTPSA id
	ro7sm53258449pab.25.2014.08.24.22.05.54 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Aug 2014 22:05:55 -0700 (PDT)
Date: Sun, 24 Aug 2014 22:09:42 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Peter Seebach <peter.seebach@windriver.com>
Message-ID: <20140825050942.GB1014@haswell>
References: <cover.1408649791.git.peter.seebach@windriver.com>
	<789ff5fbb9555afb745b2380ed3877d25bd21668.1408649791.git.peter.seebach@windriver.com>
MIME-Version: 1.0
In-Reply-To: <789ff5fbb9555afb745b2380ed3877d25bd21668.1408649791.git.peter.seebach@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] tune-cortexa*.inc: use armv7at by default
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
X-List-Received-Date: Mon, 25 Aug 2014 05:05:55 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On 14-08-21 14:54:55, Peter Seebach wrote:
> Every cortexa* chip I've encountered so far has been capable of
> executing Thumb code, so it probably makes more sense to use
> armv7at-neon instead of armv7a-neon as the DEFAULTTUNE. Choice
> of code generation is controlled separately, by ARM_INSTRUCTION_SET.

So what do we get by making this change ?
you might be having a subset of boards that are out there
The reality is that there are boards out there which do not work well
with thumb2 therefore we cant turn it on as default instruction set.
in OE-Core we have to be conservative of support base.

> Most packages tend to perform at comparably with thumb because
> smaller code footprint means better cache efficiency.
> ---
>  meta/conf/machine/include/tune-cortexa15.inc |    2 +-
>  meta/conf/machine/include/tune-cortexa5.inc  |    2 +-
>  meta/conf/machine/include/tune-cortexa7.inc  |    2 +-
>  meta/conf/machine/include/tune-cortexa8.inc  |    2 +-
>  meta/conf/machine/include/tune-cortexa9.inc  |    2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/conf/machine/include/tune-cortexa15.inc b/meta/conf/machine/include/tune-cortexa15.inc
> index 5529777..e3cc89e 100644
> --- a/meta/conf/machine/include/tune-cortexa15.inc
> +++ b/meta/conf/machine/include/tune-cortexa15.inc
> @@ -1,4 +1,4 @@
> -DEFAULTTUNE ?= "armv7a-neon"
> +DEFAULTTUNE ?= "armv7at-neon"
>  
>  require conf/machine/include/arm/arch-armv7a.inc
>  
> diff --git a/meta/conf/machine/include/tune-cortexa5.inc b/meta/conf/machine/include/tune-cortexa5.inc
> index 139e65c..a49b6c7 100644
> --- a/meta/conf/machine/include/tune-cortexa5.inc
> +++ b/meta/conf/machine/include/tune-cortexa5.inc
> @@ -1,4 +1,4 @@
> -DEFAULTTUNE ?= "armv7a-neon"
> +DEFAULTTUNE ?= "armv7at-neon"
>  
>  require conf/machine/include/arm/arch-armv7a.inc
>  
> diff --git a/meta/conf/machine/include/tune-cortexa7.inc b/meta/conf/machine/include/tune-cortexa7.inc
> index 9d06910..1cdced8 100644
> --- a/meta/conf/machine/include/tune-cortexa7.inc
> +++ b/meta/conf/machine/include/tune-cortexa7.inc
> @@ -1,4 +1,4 @@
> -DEFAULTTUNE ?= "armv7a-neon"
> +DEFAULTTUNE ?= "armv7at-neon"
>  
>  require conf/machine/include/arm/arch-armv7a.inc
>  
> diff --git a/meta/conf/machine/include/tune-cortexa8.inc b/meta/conf/machine/include/tune-cortexa8.inc
> index 771537f..cd33468 100644
> --- a/meta/conf/machine/include/tune-cortexa8.inc
> +++ b/meta/conf/machine/include/tune-cortexa8.inc
> @@ -1,4 +1,4 @@
> -DEFAULTTUNE ?= "armv7a-neon"
> +DEFAULTTUNE ?= "armv7at-neon"
>  
>  require conf/machine/include/arm/arch-armv7a.inc
>  
> diff --git a/meta/conf/machine/include/tune-cortexa9.inc b/meta/conf/machine/include/tune-cortexa9.inc
> index 700394b..3f4f8f2 100644
> --- a/meta/conf/machine/include/tune-cortexa9.inc
> +++ b/meta/conf/machine/include/tune-cortexa9.inc
> @@ -1,4 +1,4 @@
> -DEFAULTTUNE ?= "armv7a-neon"
> +DEFAULTTUNE ?= "armv7at-neon"
>  
>  require conf/machine/include/arm/arch-armv7a.inc
>  
> -- 
> 1.7.1
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

