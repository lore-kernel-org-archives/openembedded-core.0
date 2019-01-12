Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id C601C7C17F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 15:40:13 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id d15so5017002wmb.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 07:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=JnoGMnU7mQkd0JU0lFqRWlA4r9l36ceRe7sfRp1CclQ=;
	b=Zs9cF5eO7avuAgO8vrWU1ITGj2HAocCpMfIF5Nw4X437btGghaMfH023VOAVCLJfgY
	491vkj3W3INwtHW2TWIvJRakVs/uPY3spePNV+ETpnvqS+OfNb1oRTornAbbMbwC5T6l
	cuD/uWNlOiNqqPsjDYiyRvH4VzOREbl8YhrGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=JnoGMnU7mQkd0JU0lFqRWlA4r9l36ceRe7sfRp1CclQ=;
	b=KclP/ArLcmHxCYQ92H4BeWC6oQhNSW5wHKvq/Nwu9ttzeQIXcZ7CIi1cEmrnWd2r3e
	zJmBQShWAv0Z6p4LupDyI+SwI4rmyJXOMZT0gk774CnwauplY35/K4EOpAr+d0rwis33
	f/rlML4HtHREYMGLdgRmCKMO+ZBI8GOjXg1gyAJIrWPySUug1SeoR2YD7ia4NFb/YLaU
	Kx257huHRSaLYpM+V61GicGSrpv9vgN3aJIpENi5m+zmi8KiHb+V00MyYI1gKIyeTIxf
	QOMc8j7y9bdGWyeWr/luQKTUBHBwKJTcIbWxxJQvMX+UoKUM19lnupjq2TrTjxobCKm1
	vb9w==
X-Gm-Message-State: AJcUukdQlJ4fDXn5CizjTG9g58jSXttWhqTu8AeYX1Zu2/1etCRpCrrl
	xwTwr6lZ1lLlp07C7S7PLuFIgQ==
X-Google-Smtp-Source: ALg8bN7b0AHaZNH7WVtKhJJYYx91D/aqmyR50gulQDapCyQhPlKuGmPQZ55GnoC1mOKJg8FcSFqFPw==
X-Received: by 2002:a1c:2c6:: with SMTP id 189mr5890386wmc.21.1547307614469;
	Sat, 12 Jan 2019 07:40:14 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	i192sm22413093wmg.7.2019.01.12.07.40.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 12 Jan 2019 07:40:13 -0800 (PST)
Message-ID: <beceefd10bc3ba906df62abee76ecd76c80c496d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Serhey Popovych <serhe.popovych@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 12 Jan 2019 15:40:12 +0000
In-Reply-To: <1547287913-25526-2-git-send-email-serhe.popovych@gmail.com>
References: <1547287913-25526-1-git-send-email-serhe.popovych@gmail.com>
	<1547287913-25526-2-git-send-email-serhe.popovych@gmail.com>
User-Agent: Evolution 3.30.3-1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/2] libgpg-error: Support build for native on ppc host
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
X-List-Received-Date: Sat, 12 Jan 2019 15:40:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2019-01-12 at 12:11 +0200, Serhey Popovych wrote:
> In Ubuntu 16.04 LTS userspace is build for PowerPC 32-bit while
> kernel
> selected by the installer depending on PowerPC machine type:
> 
>   * 32-bit for PowerMac G4 (ppc7400) and below
>   * 64-bit for PowerMac G5 and above
> 
> Thus uname(2) returns ppc64 for 64-bit kernels and 32-bit userspace
> making build impossible due to missing some of lib64 multilib
> equivalents in Ubuntu repository.
> 
> Using setarch(8) override to make whole host look as PowerPC 32-bit
> can actually help with build but requires mapping for ppc target to
> their libgpg-error equivalent to fix native build.
> 
> Build tested on Ubuntu 16.04 LTS host on PowerMac G5 with command:
> 
>   MACHINE=qemuppc setarch ppc bitbake core-image-full-cmdline
> 
> Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
> ---
>  meta/recipes-support/libgpg-error/libgpg-error_1.33.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.33.bb
> b/meta/recipes-support/libgpg-error/libgpg-error_1.33.bb
> index 325529d..4153954 100644
> --- a/meta/recipes-support/libgpg-error/libgpg-error_1.33.bb
> +++ b/meta/recipes-support/libgpg-error/libgpg-error_1.33.bb
> @@ -47,6 +47,7 @@ do_compile_prepend() {
>  	  mips*el)    TUPLE=mipsel-unknown-linux-gnu ;;
>  	  mips*)      TUPLE=mips-unknown-linux-gnu ;;
>  	  x86_64)     TUPLE=x86_64-unknown-linux-gnu ;;
> +	  ppc)        TUPLE=powerpc-unknown-linux-gnu ;;
>  	  ppc64)      TUPLE=powerpc64-unknown-linux-gnu ;;
>  	  ppc64le)    TUPLE=powerpc64le-unknown-linux-gnu ;;
>  	  *)          TUPLE=${TARGET_ARCH}-unknown-linux-gnu ;;

This doesn't feel correct. It only works if you're using the local
setarch workaround and I'm worried most users are never going to find
that.

I'm fine with adding in general fixes but this is getting very specific
to an very uncommon usecase :(

Cheers,

Richard


