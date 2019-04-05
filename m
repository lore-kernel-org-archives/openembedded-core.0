Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id DA57E6C4DA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2019 22:01:30 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id o129so4760754qke.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Apr 2019 15:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=eY/b1ZtdxiPLU8U0R/6TL/75oTVt5islZf4eObpalWo=;
	b=H/VcWoE2gXlIQowbTBfYv5ZkM/B+EpbTknBXqMfrWMohobY8d9pkJfMK26L3TR6GNq
	BHDyKC6uZnyqLRgbGlK7TpMb37TSWJglfRgRF3p4LvIsj/RwLtfkBXI9Xm0jkB3XnmhM
	k0/8FALRAfIBma4cNoJ+t0wN9wFPIMl8aJFsmdvFswLFBKbHd68Oud3sMeuIHDHFI0pr
	1D6uZAMCdlTMnvx75dMyU9KTznlSVug2blf2pOU79d3wTToToPhz3E6vpzhea6N2j6dt
	kn07LCFspdg4WRnUfakzydjPynlFhr8ZxWJHhHrZ5aFTQF40pb9568Djw6GQYrfFBbAs
	ZuLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eY/b1ZtdxiPLU8U0R/6TL/75oTVt5islZf4eObpalWo=;
	b=brs/O/WxCJ7A5qom/OQ05/pXnQVvu4XpMvIoBIdoVGbn9JXsrEiKsFB0FRQ7An4PhY
	UxhXggZ0nXrmZdRtomOxg1brJmvsNNnff1PFkTcFhlJGFsv7uni5l355+bovHLG6uiTk
	CU+cbtjsFP68BG3Vjauyu6iO/CHooqSXWtPCbI+W5F1mEgVtXD58zXbBvIRHP7MDvqv5
	EBIHhIN1zIRrK5gmbhDvXOEBJIaGWRsKl/B/n3IYNnI0uDwjE9auMEO2Icv+wQnRTXKW
	3EZzZ44Y5Q7H+vVLtcICGCW3E1ALsfDsGDR+p4srxSJ7Zfr4/M/Nu59dpopSOIft9O7E
	bJCQ==
X-Gm-Message-State: APjAAAURvLm2eD+30Nxb4iTNw+/3D0U7UnbksnAYi67xQIqmfYBNZCkz
	GzrxcRFTvD9sSfccW8NGFbWdcyNLC6M+1CNHLt0FhECjgOw=
X-Google-Smtp-Source: APXvYqwyQqFs1CgImtDaNWcpzaK5+M4SWQWY4GKhDdK1cvvWJ0/tWMQfXS90tNR3jJtIXTDolioWVl9PVrYjEwAWgwo=
X-Received: by 2002:a37:9fc4:: with SMTP id
	i187mr12114547qke.141.1554501691567; 
	Fri, 05 Apr 2019 15:01:31 -0700 (PDT)
MIME-Version: 1.0
References: <1552985080-65398-1-git-send-email-mingli.yu@windriver.com>
In-Reply-To: <1552985080-65398-1-git-send-email-mingli.yu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 5 Apr 2019 15:01:05 -0700
Message-ID: <CAMKF1soKYZj6fKjFdNzAjhgtwaFKcw7iwyCU_kPq_QxmgCivng@mail.gmail.com>
To: Mingli Yu <mingli.yu@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-sanitizers: fix -Werror=maybe-uninitialized issue
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
X-List-Received-Date: Fri, 05 Apr 2019 22:01:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 19, 2019 at 1:45 AM <mingli.yu@windriver.com> wrote:
>
> From: Mingli Yu <Mingli.Yu@windriver.com>
>
> When DEBUG_BUILD = "1" added in local.conf, there
> comes below build error when "bitbake gcc-sanitizers":
> | ./../../../../../../../../work-shared/gcc-8.3.0-r0/gcc-8.3.0/libsanitizer/libbacktrace/../../libbacktrace/elf.c: In function 'elf_is_symlink':
> | ../../../../../../../../../work-shared/gcc-8.3.0-r0/gcc-8.3.0/libsanitizer/libbacktrace/../../libbacktrace/elf.c:772:21: error: 'st.st_mode' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> |   return S_ISLNK (st.st_mode);
>
> Initialize st_mode member to fix the above issue.
>
> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> ---
>  meta/recipes-devtools/gcc/gcc-8.3.inc              |  1 +
>  .../0041-elf.c-initialize-st_mode-member.patch     | 33 ++++++++++++++++++++++
>  2 files changed, 34 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc-8.3/0041-elf.c-initialize-st_mode-member.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-8.3.inc b/meta/recipes-devtools/gcc/gcc-8.3.inc
> index f7bf257..3501325 100644
> --- a/meta/recipes-devtools/gcc/gcc-8.3.inc
> +++ b/meta/recipes-devtools/gcc/gcc-8.3.inc
> @@ -71,6 +71,7 @@ SRC_URI = "\
>             file://0038-Re-introduce-spe-commandline-options.patch \
>             file://0039-riscv-Disable-multilib-for-OE.patch \
>             file://0040-powerpc-powerpc64-Add-support-for-musl-ldso.patch \
> +           file://0041-elf.c-initialize-st_mode-member.patch \
>  "
>  SRC_URI[md5sum] = "65b210b4bfe7e060051f799e0f994896"
>  SRC_URI[sha256sum] = "64baadfe6cc0f4947a84cb12d7f0dfaf45bb58b7e92461639596c21e02d97d2c"
> diff --git a/meta/recipes-devtools/gcc/gcc-8.3/0041-elf.c-initialize-st_mode-member.patch b/meta/recipes-devtools/gcc/gcc-8.3/0041-elf.c-initialize-st_mode-member.patch
> new file mode 100644
> index 0000000..8e80c4e
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-8.3/0041-elf.c-initialize-st_mode-member.patch
> @@ -0,0 +1,33 @@
> +From 960f3e1f104192ceb80a97e665fadffda5285aab Mon Sep 17 00:00:00 2001
> +From: Mingli Yu <Mingli.Yu@windriver.com>
> +Date: Tue, 19 Mar 2019 16:23:04 +0800
> +Subject: [PATCH] elf.c: initialize st_mode member
> +
> +Initialize st_mode member to fix the below
> +build failure when -Og included in compiler flag.
> +| ./../../../../../../../../work-shared/gcc-8.3.0-r0/gcc-8.3.0/libsanitizer/libbacktrace/../../libbacktrace/elf.c: In function 'elf_is_symlink':
> +| ../../../../../../../../../work-shared/gcc-8.3.0-r0/gcc-8.3.0/libsanitizer/libbacktrace/../../libbacktrace/elf.c:772:21: error: 'st.st_mode' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> +   return S_ISLNK (st.st_mode);
> +
> +Upstream-Status: Submitted[https://gcc.gnu.org/ml/gcc-patches/2019-03/msg00900.html]
> +
> +Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> +---
> + libbacktrace/elf.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/libbacktrace/elf.c b/libbacktrace/elf.c
> +index f4863f0..561bdc2 100644
> +--- a/libbacktrace/elf.c
> ++++ b/libbacktrace/elf.c
> +@@ -766,6 +766,7 @@ static int
> + elf_is_symlink (const char *filename)
> + {
> +   struct stat st;
> ++  st.st_mode = 0;

perhaps its safer to initialize whole struct to 0

 struct stat st = {0};

> +
> +   if (lstat (filename, &st) < 0)
> +     return 0;
> +--
> +2.7.4
> +
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

