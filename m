Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 17F916FFCD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Mar 2018 03:12:30 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id r26so7748035pgv.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 19:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=g9J6WJlpR8Cz/AovuDW6EcT/ZWyU0FlWhh1wKY/loN8=;
	b=BVn1Qfe6Qjf5NKXxuIrXuL7+h5ngkOe7A2CvhrAbKqBSebRzFlcZ1pP8OP6o+78rHp
	5AO4l8eqWYbDhNBm325Dts9hUZcSBBdvrQ0Im5VpIIiUoF5BkjtvUgjzsWOKv1uuX1BH
	Ntvk4hId5An0haGNyIqT2HskPaAOHu8JacmTwy5/Ea5zAmD2C3b7IrabHLMkzHThY+SK
	Xiyx5EcqLGQLmVBaSG5rM2lnEbqtXRekOlL+hw2kKBKO1NYQwGR+Jv2hZh5KR3je01YE
	OihcKBjOr0vi2bd1U86yqNPmqG3drixJzZf7uFvSyjfjekdazq5l+ys76AVeiaZQ3/vv
	lDPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=g9J6WJlpR8Cz/AovuDW6EcT/ZWyU0FlWhh1wKY/loN8=;
	b=B4cg4tliVFznrMfp+8sHsBo+GRYAtxnPtframCf5oUDKe+wTXLllUo466iRBu1r3nK
	zPtAiBAgXucgtjmGY1FXO6MvhFSpizP0QrzgIst7rnAyETrZmPCGVAJ8/9jnnLsNUWoR
	Bn0Nqpo2bAQkd2hOPJOmVxdgCqpJHpD62uKmOLHdK9KfwwPSgCDfzsxrcqGcRrLzPJu/
	xLxeIyT33qswnrSVlz9CY1xekYskj0JdHW1JCHegjAkIn96pT2r5xQyZxTNKp0LcEKic
	/bH5pWrfKUUtYr6GMTFhFA/GkUsJqPSSIBFRUkWeyOjV/DOgK9NLbv1R9dKiw/sP+2we
	RKhw==
X-Gm-Message-State: APf1xPD5YxN5ctKVH1V1qkIP/I3gdiKACl//4SNz1W2m6F5A65KhuUpP
	HnKDqtLV8P26HCRuylcIjcKHvZJjj29BFMmGGNc=
X-Google-Smtp-Source: AG47ELsEKPUWPHqQTYJm7z8Qu9OFKSw7RSIfIaabLhA/9FmRzwBa+G50XZNJO/eZT1gHWaenRQaJlYNLHS0vKepO8yA=
X-Received: by 10.99.170.73 with SMTP id x9mr13941717pgo.393.1520305951909;
	Mon, 05 Mar 2018 19:12:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.170.69 with HTTP; Mon, 5 Mar 2018 19:12:01 -0800 (PST)
In-Reply-To: <20180305082233.8493-1-quentin.schulz@bootlin.com>
References: <20180305082233.8493-1-quentin.schulz@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 5 Mar 2018 19:12:01 -0800
Message-ID: <CAMKF1spU6xb3WEjSjphUtrZu0Kq-gY9XymO_6taCq+RpF0jKbw@mail.gmail.com>
To: Quentin Schulz <quentin.schulz@bootlin.com>
Cc: thomas.petazzoni@bootlin.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox: mdev: make mdev auto load modules at boot
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
X-List-Received-Date: Tue, 06 Mar 2018 03:12:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 5, 2018 at 12:22 AM, Quentin Schulz
<quentin.schulz@bootlin.com> wrote:
> Thanks to the MODALIAS line at the beginning of mdev.conf, mdev supports
> module auto probing on hotplug.
>
> However, this does not work for cold plugged modules (i.e. modules for
> devices that were probed before mdev is added as hotplug handler).
> Running mdev -s to replay hotplug events does not work in that case.
>
> Let's manually modprobe all modules in the rootfs.
>
> Taken from:
>  - https://github.com/buildroot/buildroot/commit/07f46c2b6daec44a6176039c90be67e66c4c2e42
>  - https://github.com/buildroot/buildroot/commit/b4fc5a180c81689a982d5c595844331684c14f51
>
> We need xargs to support zero termination of args so let's enable this
> configuration in the fragment for mdev.
>
> Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>
> ---
>  meta/recipes-core/busybox/busybox/mdev.cfg | 2 ++
>  meta/recipes-core/busybox/files/mdev       | 1 +
>  2 files changed, 3 insertions(+)
>
> diff --git a/meta/recipes-core/busybox/busybox/mdev.cfg b/meta/recipes-core/busybox/busybox/mdev.cfg
> index 6aefe90e43..0d60fc9560 100644
> --- a/meta/recipes-core/busybox/busybox/mdev.cfg
> +++ b/meta/recipes-core/busybox/busybox/mdev.cfg
> @@ -9,3 +9,5 @@ CONFIG_SETSID=y
>  CONFIG_CTTYHACK=y
>
>  CONFIG_FEATURE_SHADOWPASSWDS=y
> +
> +CONFIG_FEATURE_XARGS_SUPPORT_ZERO_TERM=y
> diff --git a/meta/recipes-core/busybox/files/mdev b/meta/recipes-core/busybox/files/mdev
> index 8c9c06e96c..165b275256 100755
> --- a/meta/recipes-core/busybox/files/mdev
> +++ b/meta/recipes-core/busybox/files/mdev
> @@ -9,6 +9,7 @@ touch /dev/mdev.seq
>  #sysctl -w kernel.hotplug=/sbin/mdev
>  echo "/sbin/mdev" > /proc/sys/kernel/hotplug
>  mdev -s
> +find /sys/ -name modalias -print0 | xargs -0 sort -u -z | xargs -0 modprobe -abq
>

will this execute on every boot ?

