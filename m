Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id D5A746C0F1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 11:19:32 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id x10so6013849wrs.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 03:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=rV/YwVnPyILes61siBbmyww4KVLfyMcATyRj7jUqnRc=;
	b=XkuH/6earBoEn3dXXxUkYfyWXh9vk7YTo6+tMSEpE8jVRT2efw5yMswwLvRyShvtpO
	0DRdcoMEhPTF9gzagF4w6zQjBgcMNBBLKIqe9gjOSYIioa+hGqL1H2XBMAk2lY6hx4t6
	B2rePU6zhI4OBqi5gyF/Qj7bUlg9QrG1Zyoek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=rV/YwVnPyILes61siBbmyww4KVLfyMcATyRj7jUqnRc=;
	b=Zqggg/OHiI578ZkceRXdBU/NuVNWKJrBADma5UzU35jMjEOAswQN/WB74XGBofamzh
	/4HtuWGe1Q8KmBg3Mshtj8dAKdW/N6F3LoD5n6eDjH6Vyutni5RDa5Na/scp6fVlE/V2
	S4B5lNSoqc5o36MFFZSzepF7VW84JN8e1CdxI7LBs5+cuTWvLtOzZbCfJO0ozF8rjZS8
	DOd7f8K/tdQInCmJolMeJPVutBfoh5nLg0Sz5eqNd/7Dfevvg69mGHZvPpJuhwsBc/AH
	doO9rpLx2Xu90PZzKAXpO9yzFZqAXhP4M2QZiJd/iCMVs+2YuGcIs0UevkEMj1oDqkkr
	VU8A==
X-Gm-Message-State: AHQUAubAGiR0w5zEz2raSxnU3ciuXaY0dxHbtoNKEoK0UWjjDEzcbp6U
	bdO0dgiVoCnYgx8f0tpR7W1vscabDH0=
X-Google-Smtp-Source: AHgI3IbXmsFj0a5aWrEa0lqPVOQIigsXThdYaYn31NWO7zElxzb+/+51dQ4Sd0PO4Rn28T14cDR4Kg==
X-Received: by 2002:a5d:540f:: with SMTP id g15mr2599073wrv.126.1550143173203; 
	Thu, 14 Feb 2019 03:19:33 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	p16sm2900204wro.25.2019.02.14.03.19.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 14 Feb 2019 03:19:32 -0800 (PST)
Message-ID: <efe358c26f3e3e9e83853e72256f54d1b9bd4a7f.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: changqing.li@windriver.com, openembedded-core@lists.openembedded.org
Date: Thu, 14 Feb 2019 11:19:30 +0000
In-Reply-To: <1549948241-309157-1-git-send-email-changqing.li@windriver.com>
References: <608ce7362098bbc8c96431fd8c56441a46e1a56b.camel@linuxfoundation.org>
	<1549948241-309157-1-git-send-email-changqing.li@windriver.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH V2] gcc-runtime: fix C++ header mapping for n32/x32 tune
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
X-List-Received-Date: Thu, 14 Feb 2019 11:19:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-02-12 at 13:10 +0800, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
>     The SDK was unable to find the C++ header pieces correctly since
> it's
>     using a generic compiler, not one specifically targeting the
> multilib
>     vendor prefix and default tune.  This adds the right mapping to
> ensure
>     SDKs work as expected. And fix problem in below configurations:
> 
>     multilib configuration 1:
>     MACHINE="qemumips64"
>     MULTILIBS ?= "multilib:lib32 multilib:libn32"
>     DEFAULTTUNE_virtclass-multilib-lib32 ?= "mips"
>     DEFAULTTUNE_virtclass-multilib-libn32 ?= "mips64-n32"
>     MULTILIB_GLOBAL_VARIANTS_append = " libn32"
>     require conf/multilib.conf
> 
>     ignoring nonexistent directory "<path>/sysroots/mips64-poky-
> linux/usr/include/c++/8.2.0/mips64-poky-linux/32
> 
>     multilib configuration 2:
>     MACHINE="qemumips64"
>     MULTILIBS = 'multilib:lib64 multilib:lib32'
>     DEFAULTTUNE = 'mips64-n32'
>     DEFAULTTUNE_virtclass-multilib-lib64 = 'mips64'
>     DEFAULTTUNE_virtclass-multilib-lib32 = 'mips32r2'
>     require conf/multilib.conf
> 
>     For this configuration:
>     for target gcc-runtime, need to create symlink like mips64-poly-
> linux --> mips64-poky-linux-gnu32
>     for target lib64-gcc-runtime, need to create symlink like mips64-
> poly-linux/32 --> mips64-pokymllib64-linux
>     in order to avoid conflict during populate_sdk, create symlink
> for subfoler bits/ext for target gcc-runtime,
>     this is ugly, but seems no better way to cover all kinds of
> configuration.
> 
>     single lib configuration:
>     MACHINE="qemumips64"
>     DEFAULTTUNE = "mips64-n32"
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/recipes-devtools/gcc/gcc-runtime.inc | 29 +++++++++++++++++--
> ----------
>  1 file changed, 17 insertions(+), 12 deletions(-)

I haven't looked into why and it took a bit of narrowing down to find
the commit responsible but this is still causing a failure on the
autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/285

Cheers,

Richard


