Return-Path: <martin@geanix.com>
Received: from first.geanix.com (first.geanix.com [116.203.34.67])
	by mail.openembedded.org (Postfix) with ESMTP id 264D67EEA1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2019 14:15:11 +0000 (UTC)
Received: from [192.168.8.20] (unknown [85.184.140.241])
	by first.geanix.com (Postfix) with ESMTPSA id 620B2170D;
	Wed, 10 Jul 2019 14:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1562768110; bh=Hi5AvkCvlxPk8tMTVVoX8qqNBhdBqZjCUBtL4R98Ig8=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=NIeLr2mcEPLCe720NzR0rUbp5lg7BJr9kVTqCftotuIXiRDhMQUhxSUzx5W/fTcCu
	TrbcpIdxEiA9iJcnV1sm2YkdOVB567KTBs/WmpdOU/0vPyPZU4B1DuJ7fgBzAGTX1j
	Mc0gXeSAaGppJdX7fCm7gh4q1kKui3io+GwfAgGtbi9lqJjZaGFlWs9cj/x0Q4hhux
	1VPJIa0glLqZF413D6PBxrKviB/+NMLQ3+NUlPne6x/xVjJxNEKVZ0pbNMQasnEHcy
	G5LGZtfSblyM5z7oBlUQ2wG0FnyXkWEnvi4rtej6wM9EFGlkLuYfWgYsZaRTnMXZTN
	7DEJXsFzhmz6Q==
To: bruce.ashfield@gmail.com, richard.purdie@linuxfoundation.org
References: <cover.1559220004.git.bruce.ashfield@gmail.com>
	<895d9d6d6e611652f3e144561811868b1df15cf6.1559220004.git.bruce.ashfield@gmail.com>
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <martin@geanix.com>
Message-ID: <df9ca430-ee2a-5428-2528-28604e1b5bce@geanix.com>
Date: Wed, 10 Jul 2019 16:14:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <895d9d6d6e611652f3e144561811868b1df15cf6.1559220004.git.bruce.ashfield@gmail.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=ALL_TRUSTED,BAYES_00,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,URIBL_BLOCKED
	autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on 8945dcc0271d
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/9] linux-yocto-dev: bump to v5.2-rc
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
X-List-Received-Date: Wed, 10 Jul 2019 14:15:12 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit

Hi Bruce,

On 30/05/2019 14.44, bruce.ashfield@gmail.com wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>   meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> index ae8c343008..3a055c12ad 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> @@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
>   SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
>   SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
>   
> -LINUX_VERSION ?= "5.0-rc+"
> +LINUX_VERSION ?= "5.2-rc+"
>   LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
>   PV = "${LINUX_VERSION}+git${SRCPV}"

My own kernel recipe (more or less mainline) failed to build when I 
bumped to v5.2. It fails to generate the out-of-tree Makefile due to a 
missing dependency on `realpath`[1].

The quick-fix is to add coreutils-native to DEPENDS, but I am not sure 
if this is what we want.

Have you seen the same?

// Martin

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=48b5ffd1268788afb01525e71e864e901e9aa070

