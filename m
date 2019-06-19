Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 983B67E513
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 10:51:00 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id r16so2819542wrl.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 03:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=t86p4ukO56QSdlALQg3kGfNjL1zrklV30Pre3N1beqw=;
	b=cym+zCdXj7HxdTczJTevN83AevcU94CF62CWz0fWg1OKyPL8s+wU6D0lIblAE5TN/+
	42FS+rtF3utiAxuGyDasueRjq/ZSvnu+SC2M5OU5w/M4bWV35DMCtxuwFaM1Z47HCIET
	u/cDgNkC0yNuLGGIKEsRfAE5cR8mXZH2nEddI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=t86p4ukO56QSdlALQg3kGfNjL1zrklV30Pre3N1beqw=;
	b=mqnBUEKXdxHcBY7gZD+AoCFHT8D53G79PrMuBO5VZ/0veHswAFw4HaTyo+tmO6jKEL
	55OLv270sx+y9yaW2eVsDPL9yClWcl9Huo6bClZvqYIK1RoFhIX4f29hVEY7n37NGgjI
	k+TwFBG2pNTJ3xBuu07yrwjdS3X21Kt7x8tCyP4HdyuS/5v4rXK8LB0RYW2TdodCn/CN
	RdxSzdaQcvGvZ4Gnj49+tZKNwSuV59jJpJoJ1R7A/qubJUKUdfxu97l8Yr66O5all4BD
	RooSQMoOuUp72G5oY+3CpGDt0MhmAZy6piPV2pnzLaSOHIAgNlEG9evKo2Qoyx/685ux
	6mjQ==
X-Gm-Message-State: APjAAAVno8htX6VjHgTbfeXEPxPM4ZovGuygZ1wTtr4b9yxAXToYk2Eq
	jQCYOXG4TC6Ij1pvuIxXvyvFhw==
X-Google-Smtp-Source: APXvYqzYTBqw/Nm5Lp3GUzR7zp6HstnAyelcFpDjtwflUCDYt9mJyetHZMNU/9uDv6YKIXQej23H9Q==
X-Received: by 2002:adf:ee03:: with SMTP id y3mr7761029wrn.128.1560941461023; 
	Wed, 19 Jun 2019 03:51:01 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x17sm19318114wrq.64.2019.06.19.03.51.00
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 19 Jun 2019 03:51:00 -0700 (PDT)
Message-ID: <5511748e8ce0af06eacccb81a90ee4563c307248.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mariano =?ISO-8859-1?Q?L=F3pez?= <just.another.mariano@gmail.com>, 
	openembedded-core@lists.openembedded.org, Bruce Ashfield
	<bruce.ashfield@gmail.com>
Date: Wed, 19 Jun 2019 11:50:59 +0100
In-Reply-To: <f0d52edc0d79dca6ed77b0ae587ca594ccb6ee39.1560888312.git.just.another.mariano@gmail.com>
References: <cover.1560888312.git.just.another.mariano@gmail.com>
	<f0d52edc0d79dca6ed77b0ae587ca594ccb6ee39.1560888312.git.just.another.mariano@gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] linux-yocto: Add SCSI support when ptest is in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 19 Jun 2019 10:51:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2019-06-18 at 15:10 -0500, Mariano López wrote:
> The scsi_debug module can't be built in some architectures as they
> have
> SCSI support disabled by default. This patch will enable SCSI support
> as
> well as the scsi_debug module when ptest is in DISTRO_FEATURES.
> 
> Signed-off-by: Mariano López <just.another.mariano@gmail.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb | 5 ++++-
>  meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb  | 5 ++++-
>  meta/recipes-kernel/linux/linux-yocto_4.19.bb    | 5 ++++-
>  meta/recipes-kernel/linux/linux-yocto_5.0.bb     | 5 ++++-
>  4 files changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> index 0836dc7ea0..e6c8ee320c 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> @@ -41,4 +41,7 @@ KERNEL_FEATURES_append = "
> ${KERNEL_EXTRA_FEATURES}"
>  KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
>  KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
>  KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc
> cfg/paravirt_kvm.scc"
> -KERNEL_FEATURES_append = "${@bb.utils.contains("DISTRO_FEATURES",
> "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
> +KERNEL_FEATURES_append = "${@bb.utils.contains("DISTRO_FEATURES",
> "ptest", "\
> +                            features/scsi/scsi.scc \
> +                            features/scsi/scsi-debug.scc \
> +                         ","" ,d)}"

Question to Bruce - can we mark scsi-debug.scc as having a dependency
on scsi.scc?

Cheers,

Richard


