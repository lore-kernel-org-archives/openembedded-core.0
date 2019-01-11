Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id CE8937C147
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jan 2019 15:32:06 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id p17so19214733qtl.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jan 2019 07:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lSbtiSlN6eN0wWfFM1miabnhzQn87+CCaCdUrZQsWLM=;
	b=jXZXj/1C0+CInKEh/I7VtGz7s9d1lTWQbBlkDKlLbn6dB8QKpYp6N57F0UxoXhIHV6
	JB9GIwvZqcUYkcGDNlIQle37d8yvbra78mPR4UKJNembAYcEiC/L3Vv98eDxmp4VqxJs
	0LjBh61tJM0miaWYf3zqnjA/b2YP3Cq7ElnlIduGpwwxP05KhG7omN2XuRKpb5xIG9+a
	Cxe9fQR4QyWDiLe8ayajGqYJgm3Y99nKSRpdPv2LEs2YGiKM/Pxy92u/ULOpIUQfzIrX
	L7uz0MEISvk4TcJvpYy++rXX4Gmu/0oWsWia43w8SYRsE6rxAqPEiqz5zxiAwWIMyGl/
	vIBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lSbtiSlN6eN0wWfFM1miabnhzQn87+CCaCdUrZQsWLM=;
	b=Vflnh1HezkvMmei0kBe6Abf7vnQvwfHP7Gr7+umjHnY53LFEDZlRG/dPVBd4xZa+ls
	jjLwWFvYROZ8+Lj4BXTbbHnMGIMz5YMn3nZ2oCrrJjBFOSZ4wWuH2QKBntzATG0xWcFH
	TARme4A3f9/Q8d+kMOfRqjqO+BCtL3zYJj1J1cQEBAaxwkuuJ6ExNHwvg33n+cHxF6Fl
	DeQf2WeIc2pzwcdBjrnss65lRipWJCwfV/e00v1vHEaFWjp21qELet57ocf+AY1csPEC
	UtqGQ/NzpWmO4NQaHqIV7tSUJOtqDYCGM5n21+0CQv/ppVCHZwtKqQwQiwdqEDi3ODck
	QZyw==
X-Gm-Message-State: AJcUukecndeppp9Lmt1ujBeSeVr4YZEH7vrXMZIuK2ndHSAzARkTME+Z
	FiRIpPmWjz+eYqt3jt/eOCZSzH6xzlCuBUsKyRY=
X-Google-Smtp-Source: ALg8bN7jcq3tlY24ZICO9FJWVK6SgwFVbLVlvmQQMuUBcLm3jLPFERRcBBLYsqaGDzFH2gVRguOGYmC2qb82ZpHYeAs=
X-Received: by 2002:aed:3eac:: with SMTP id n41mr14037481qtf.196.1547220727429;
	Fri, 11 Jan 2019 07:32:07 -0800 (PST)
MIME-Version: 1.0
References: <20190111125014.34593-1-abrodkin@synopsys.com>
In-Reply-To: <20190111125014.34593-1-abrodkin@synopsys.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 11 Jan 2019 07:31:48 -0800
Message-ID: <CAMKF1soxmbmcHx4ZQkyx4aqoNYSApjU0wGTEntfsTm08Rg4Y8A@mail.gmail.com>
To: Alexey Brodkin <alexey.brodkin@synopsys.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	linux-snps-arc@lists.infradead.org
Subject: Re: [PATCH] webkitgtk: Enable building for ARC architecture
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
X-List-Received-Date: Fri, 11 Jan 2019 15:32:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 11, 2019 at 4:50 AM Alexey Brodkin
<alexey.brodkin@synopsys.com> wrote:
>
> For that we need 2 things:
>  1. Disable JIT in JS as it's not supported for ARC.
>
>  2. Compile with "-mlong-calls" so relocations with
>     offsets larger than 25 bits are used, otherwise
>     linker fails to link final binaries.
>
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Alexander Kanavin <alex.kanavin@gmail.com>
> Cc: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/recipes-sato/webkit/webkitgtk_2.22.5.bb | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.22.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.22.5.bb
> index fc56822f7a..56f69c7a30 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.22.5.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.22.5.bb
> @@ -69,6 +69,13 @@ EXTRA_OECMAKE = " \
>  EXTRA_OECMAKE_append_x86 = " -DUSE_GSTREAMER_GL=OFF "
>  EXTRA_OECMAKE_append_x86-x32 = " -DUSE_GSTREAMER_GL=OFF "
>
> +# Javascript JIT is not supported on ARC
> +EXTRA_OECMAKE_append_arc = " -DENABLE_JIT=OFF "
> +# By default 25-bit "medium" calls are used on ARC
> +# which is not enough for binaries larger than 32 MiB
> +CFLAGS_append_arc = " -mlong-calls"
> +CXXFLAGS_append_arc = " -mlong-calls"

perhaps adding to CPPFLAGS is going to be enough for both c/c++ cases

> +
>  # Javascript JIT is not supported on powerpc
>  EXTRA_OECMAKE_append_powerpc = " -DENABLE_JIT=OFF "
>  EXTRA_OECMAKE_append_powerpc64 = " -DENABLE_JIT=OFF "
> --
> 2.16.2
>

