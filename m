Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8C7EB78432
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Feb 2018 19:41:55 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id w17so4265854pgv.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Feb 2018 11:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NQ9lFIzC54tWPEeHrjTrqSmQRe6wyipzBlhGAgLWLPU=;
	b=SnjflbL83mwVipQvwGKn0K6u5mkoii3W28Xp/PYjp522M9lkLmX4J6kiN4tXa1uqVr
	y0TcBANTdjsKh49118/Q8bPaUgp7Nm2kEAJvAAKxLwLADkjAmD6VHjy8WBzwuGdokOL1
	hhW8hHgZGCp6V6OGeOR+P8fyEBjK2Es0i3hGfCpzrAHGOgse0f5dVBD6Wg1oyofaxlau
	CVNRWBYR+bBQ8J78VSrXMu0atEG50WjYx/dWdL9ZL/BItNE6Wn8WIyS0C2NQ+vYcGKkR
	ool/ZKScuCd8UeSgkkRgFs4AuRQa8fe41+AJj87PDftJZ0SzaJEHiARClcvbaDVFhNaP
	l3Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NQ9lFIzC54tWPEeHrjTrqSmQRe6wyipzBlhGAgLWLPU=;
	b=TkUtKk1Iiv3aR9IYwLVGPQ9JHH1l7W2t4CnZU+4TJ4jddclrYUZwpwYpRBW90Y9YDB
	xrdCZmhWi5ytctKTdLQFyoHJKuZVvsp3pfaHwUmdiu+2zy/faoYHwfDHx7Zul77QcKrm
	a9xrHVA+rGGu1Bf8l9XLEnXxv3tw2qBZ5uFK+YjPqYCxNLnTuSjhLCq7mbXdF7KB7W6B
	w0Syc+UZ5u+py9KaIVzYqBvywqHu+BUZNjggP0SM+G+SzqCuXlc/QFyiPgCwWAQpfVIj
	aRNzifsAcTLkS2hKrm7AIUQLVcOC3Yot77vVC1bVgev5o8JwAJoQhBKLDDcZ/Ee000zj
	O91g==
X-Gm-Message-State: APf1xPBBVvo1muc3WyHMj7/oKBBKBGZMgamNxatq0jWxVbigkBESk2XP
	6jPgR0rtOl3vnsDFzDVck9qO6NFVhxidmJCTGDE=
X-Google-Smtp-Source: AH8x225c52mBZvr9Z/eM3rgPoX+8Hou3alLe16T14DPH9Ylr4bQSqyMH4avfLaSWoHvTS9C4cBUrhcHXO+pRI3VaMiw=
X-Received: by 10.101.92.77 with SMTP id v13mr3240242pgr.341.1518205316389;
	Fri, 09 Feb 2018 11:41:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.161.170 with HTTP; Fri, 9 Feb 2018 11:41:26 -0800 (PST)
In-Reply-To: <20180209193443.100512-1-mark.hatle@windriver.com>
References: <20180209193443.100512-1-mark.hatle@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 9 Feb 2018 11:41:26 -0800
Message-ID: <CAMKF1sptCC0=Ru49k6AO6MSYyukac6K9fSLXye6b70-6dVEbFw@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc: backport patch to fix ICE in MIPS64 target in G++
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
X-List-Received-Date: Fri, 09 Feb 2018 19:41:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 9, 2018 at 11:34 AM, Mark Hatle <mark.hatle@windriver.com> wrote:
> Backport a patch to fix an ICE when compiling for MIPS64.
>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/recipes-devtools/gcc/gcc-7.3.inc              |   1 +
>  .../gcc-7.3/0001-PR-rtl-optimization-83030.patch   | 272 +++++++++++++++++++++
>  2 files changed, 273 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0001-PR-rtl-optimization-83030.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-7.3.inc b/meta/recipes-devtools/gcc/gcc-7.3.inc
> index 724f9c32a0..9872d81203 100644
> --- a/meta/recipes-devtools/gcc/gcc-7.3.inc
> +++ b/meta/recipes-devtools/gcc/gcc-7.3.inc
> @@ -77,6 +77,7 @@ SRC_URI = "\
>             ${BACKPORTS} \
>  "
>  BACKPORTS = "\
> +           file://0001-PR-rtl-optimization-83030.patch \
>  "
>
>  SRC_URI[md5sum] = "be2da21680f27624f3a87055c4ba5af2"
> diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0001-PR-rtl-optimization-83030.patch b/meta/recipes-devtools/gcc/gcc-7.3/0001-PR-rtl-optimization-83030.patch
> new file mode 100644
> index 0000000000..71f7988eaa
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-7.3/0001-PR-rtl-optimization-83030.patch
> @@ -0,0 +1,272 @@
> +From f5c4a9440f15ccf6775659910a2014a5494ee86e Mon Sep 17 00:00:00 2001
> +From: ebotcazou <ebotcazou@138bc75d-0d04-0410-961f-82ee72b054a4>
> +Date: Wed, 22 Nov 2017 21:43:22 +0000
> +Subject: [PATCH]       PR rtl-optimization/83030       * doc/rtl.texi (Flags
> + in an RTL Expression): Alphabetize, add entry         for CROSSING_JUMP_P and
> + mention usage of 'jump' for JUMP_INSNs.       (Insns): Delete entry for
> + REG_CROSSING_JUMP in register notes.  * bb-reorder.c
> + (update_crossing_jump_flags): Do not test whether the         CROSSING_JUMP_P flag
> + is already set before setting it.     * cfgrtl.c (fixup_partition_crossing):
> + Likewise.     * reorg.c (relax_delay_slots): Do not consider a
> + CROSSING_JUMP_P insn  as useless.
> +
> +git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@255083 138bc75d-0d04-0410-961f-82ee72b054a4
> +
> +Upstream-Status: Backport
> +
> +This patch removes changes to Changelog from the original upstream patch.
> +This will help us avoid conflicts.
> +
> +Original backport to GCC 7.x by Amruta Pawar <Amruta.Pawar@kpit.com>
> +
> +Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> +


LGTM

