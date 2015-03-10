Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 69F5F739D9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 16:54:26 +0000 (UTC)
Received: by iecsl2 with SMTP id sl2so22007747iec.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 09:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=GkmYz0Y6W5LLLXd0Q+LXUNBfAZALdFvYE97LdzNn6TE=;
	b=CDrNVtdnWTvQEQn2i8cbqSZrZMwSIoiM69M7+lYgWihBRojeQbG9oRnPHv+EPazmL1
	PNOopIFnBR0Fg4JYlp24cp/zIcEpGqyRjx5i5ZC4GhAWwqMd4kx16plkYVz4iu6JEdcs
	bkILItfsPhLq1m5SdMvVhFfjE5GZkHoqRql+AswTsW/1y1/mGis17JQg9rbQl/dQsxyN
	ob0nJ/nOHmmuKSMm36fMu6+Ei0uzUoJU0nlvBM28dCsw0GRHYuxVO46QA8nZiW5N4fZG
	cZEHvpatJPI4xk4bG9wuwGlMaNi4t8PTLPrQWqtU/ixF9bbDkIBemAJuCni+WeECJWDJ
	7vnw==
X-Received: by 10.50.43.198 with SMTP id y6mr84935840igl.16.1426004916829;
	Tue, 10 Mar 2015 09:28:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.117.7 with HTTP; Tue, 10 Mar 2015 09:28:06 -0700 (PDT)
In-Reply-To: <30f590c7e3d62ff1adb5d6b14fe0dca71f555f5f.1425979509.git.liezhi.yang@windriver.com>
References: <cover.1425979509.git.liezhi.yang@windriver.com>
	<30f590c7e3d62ff1adb5d6b14fe0dca71f555f5f.1425979509.git.liezhi.yang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 Mar 2015 09:28:06 -0700
Message-ID: <CAMKF1sqgaHnXqynr2rEihsJ62QPnUyTw8q07-YihWA=3kUyZ=Q@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] btrfs-tools: workaround DEBUG_BUILD for arm
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
X-List-Received-Date: Tue, 10 Mar 2015 16:54:29 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 10, 2015 at 2:25 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
> Workaround when:
> MACHINE = "qemuarm"
> DEBUG_BUILD = "1"
>
> Errors:
> {standard input}: Assembler messages:
> {standard input}:3383: Error: invalid operands (.text and *UND* sections) for `-'
> {standard input}:3389: Error: invalid operands (.text and *UND* sections) for `-'
> make: *** [cmds-fi-disk_usage.o] Error 1
>

can you post full compiler command ?

> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  .../btrfs-tools/btrfs-tools_git.bb                 |    7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
> index d86075c..382ee7c 100644
> --- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
> +++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
> @@ -28,3 +28,10 @@ do_install () {
>  }
>
>  BBCLASSEXTEND = "native"
> +
> +# Workaround when DEBUG_BUILD:
> +# {standard input}: Assembler messages:
> +# {standard input}:3383: Error: invalid operands (.text and *UND* sections) for `-'
> +# {standard input}:3389: Error: invalid operands (.text and *UND* sections) for `-'
> +# make: *** [cmds-fi-disk_usage.o] Error 1
> +CFLAGS_append_arm = " -O2"
> --
> 1.7.9.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

