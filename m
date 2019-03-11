Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id BA7D47C274
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 03:49:23 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id v16so2709027ljg.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Mar 2019 20:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2KMDlzIFlIPtHhWCHOryVyWNEV5eF7LFD9zDm62Dw8c=;
	b=asvsq9AfDwKGo1txtSWgumq/h4JY98Qn47oGeB/1ZgkePintChykbDa/g0kNoMATpL
	QQLFkWFZjSsur5MSjt60xkVuBq/Tabuei9xYa3QoUtdzUClnZkrsRXC85gCjIbQ41QtY
	3vueGBoK6gbiGlOr+mfqgW7e2ghBNCaoAiA1InDpifje1la/Qnq8aXOZQJPKjgc5Rw1U
	mbaGAwbm0HaAg86BEAktZcTwD2f9Ldwa1Wuf2e6i0y6v3ZbgLTvlTbLLfpqriCbjo7F9
	J3tlB9QGg+7kqjKsukTu91pClYXu2xZnbjC9/+OxUwj5+gc7QaNTokOsfBvPvEN6Dm0Q
	yn/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2KMDlzIFlIPtHhWCHOryVyWNEV5eF7LFD9zDm62Dw8c=;
	b=X8GbFMDzr+RTu0naKX7O2Qp98XL1ghv7OcU/8yuNMhxwAa/WkmG8fKXUWX10MFJ/Td
	jC88hq9hrGugQsfHxpJPfyor6VYwAjCEc/l/5fESkRKLaDMcNOeoJJ7gK+mAUwdIeHeR
	XNOOc7VFhwQC0vD8Ulbr420w/dRCjdxdC2A51+HPFnaMAz0xlowKa7p8Etk3cK/2qn5D
	uC32tsD6HJwA/pUGO91r3Oie4y5KuyWqE+50Yf0eSX2Inow1k5hRcgX4vi9g0eKaNuAV
	CVe2VKgdqQFvBPJPS4p+7iiouX3+u+tTaQMNu7YmALMjB+p7Wj8xIDW8NWu8Uw+1mQDZ
	dMig==
X-Gm-Message-State: APjAAAXOJTNoRMzn+SqnlC4os2eBrLsfyobzjGqb1gVdGyQSvkQn9Xgv
	YysduM6wKPvOCrS4ZmSHX41V+2XAfCWtwScWLZs=
X-Google-Smtp-Source: APXvYqxvnyWD4SbRNlwRxx3PdQBvJoQDRVwZDayR9P3qOuPGCvC5BZcZIHeG/1VhYbpqHIybzA+cbruroRqv7rCaS04=
X-Received: by 2002:a2e:408:: with SMTP id 8mr15341050lje.15.1552276164154;
	Sun, 10 Mar 2019 20:49:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190311034537.7190-1-bruce.ashfield@gmail.com>
	<20190311034537.7190-2-bruce.ashfield@gmail.com>
In-Reply-To: <20190311034537.7190-2-bruce.ashfield@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 10 Mar 2019 23:49:13 -0400
Message-ID: <CADkTA4OaP9SFZSZ3rYp10PCBojM0uku=uVjg+=51YmcmsWwKxg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-yocto/5.0: fix systemtap for arm
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
X-List-Received-Date: Mon, 11 Mar 2019 03:49:24 -0000
Content-Type: text/plain; charset="UTF-8"

Sorry if this came through twice, there was some lag when I was generating
the patch and it looks like it fired multiple times.

Bruce


On Sun, Mar 10, 2019 at 11:45 PM <bruce.ashfield@gmail.com> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> We need to enable the arm unwinder for systemtap to work out of the
> box:
>
>   root@qemuarm:~# stap --disable-cache -DSTP_NO_VERREL_CHECK ./hello.stp
>   [ 1600.955262] stap_2097: loading out-of-tree module taints kernel.
>   hello world
>
> This option is useful for much more than systemtap, so it is a good
> idea to have on in the base configs. It make the image slightly larger,
> but has no performance impacts.
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb   | 2 +-
>  meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb | 2 +-
>  meta/recipes-kernel/linux/linux-yocto_5.0.bb      | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
> index a757945f8d..2350973fef 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
> @@ -12,7 +12,7 @@ python () {
>  }
>
>  SRCREV_machine ?= "1a0da7e50b77c82841efb501c648dbaca699eac2"
> -SRCREV_meta ?= "be627e4e38626c5e949de04c814ebd2487d5dd98"
> +SRCREV_meta ?= "4faa4419884d2bbe65f637befd71a1e95629eaae"
>
>  SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
>             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=${KMETA}"
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
> index 57aada3f62..e0a6801446 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
> @@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
>
>  SRCREV_machine_qemuarm ?= "6da91ac9afd3b8c144760e3ceacc6a812ddfa3f6"
>  SRCREV_machine ?= "1a0da7e50b77c82841efb501c648dbaca699eac2"
> -SRCREV_meta ?= "be627e4e38626c5e949de04c814ebd2487d5dd98"
> +SRCREV_meta ?= "4faa4419884d2bbe65f637befd71a1e95629eaae"
>
>  PV = "${LINUX_VERSION}+git${SRCPV}"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
> index a56e9a19d8..f2c066a150 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
> @@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "1a0da7e50b77c82841efb501c648dbaca699eac2"
>  SRCREV_machine_qemux86-64 ?= "1a0da7e50b77c82841efb501c648dbaca699eac2"
>  SRCREV_machine_qemumips64 ?= "5f072445126e6a9e44f9435a552f4fcf6fc15499"
>  SRCREV_machine ?= "1a0da7e50b77c82841efb501c648dbaca699eac2"
> -SRCREV_meta ?= "be627e4e38626c5e949de04c814ebd2487d5dd98"
> +SRCREV_meta ?= "4faa4419884d2bbe65f637befd71a1e95629eaae"
>
>  # remap qemuarm to qemuarma15 for the 5.0 kernel
>  # KMACHINE_qemuarm ?= "qemuarma15"
> --
> 2.19.1
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

