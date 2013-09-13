Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id 993AD6B6C3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 13:43:40 +0000 (UTC)
Received: by mail-lb0-f171.google.com with SMTP id u14so2068616lbd.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 06:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Bc5JcUo3CyA311pFhIv3v/t/1rKKUvoWSVCijMylf/s=;
	b=qXxdpwMnNd9xeyCeDW9oXpglqlOVeaoWvrgQOXY8KfoRmDNDvJWGrBCH3S6V3F5R4Y
	Ujf/EW0xMPA1zKTLi6S7KFQbiseRiM9LGmkcSUEpcQ+p6ZNKawT+SQMVfm34DSBz1q+W
	6+mbeuzsBh+Z1p/7+AcgOKYCQcfcKO1u1txJ/SOw8ktbYSgPWp9GJx/e2c/zfkCePjw9
	HeJd23t1wgYLp13glYJ2cEmVNpqrQPp6eipZFopQUl1jWb5A8svRdIYc53HcdOwMPCwq
	oW4Er+7/oeqI1uGNX9mHmaqwS0vUsxBg0IdfcpimMGlqL/FLyzMqNhdKlavDlbgdtEUs
	KE2A==
MIME-Version: 1.0
X-Received: by 10.152.37.103 with SMTP id x7mr1920704laj.28.1379079821650;
	Fri, 13 Sep 2013 06:43:41 -0700 (PDT)
Received: by 10.112.12.103 with HTTP; Fri, 13 Sep 2013 06:43:41 -0700 (PDT)
In-Reply-To: <76daa47ae32a04d0bc4bea8a04b7ef240ee6e599.1379054099.git.liezhi.yang@windriver.com>
References: <cover.1379054099.git.liezhi.yang@windriver.com>
	<76daa47ae32a04d0bc4bea8a04b7ef240ee6e599.1379054099.git.liezhi.yang@windriver.com>
Date: Fri, 13 Sep 2013 09:43:41 -0400
Message-ID: <CADkTA4Ovp7SzxCT85f_Skhqt2OGTF81nNbw+ihm5X7OR=dMsEA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] linux-libc-headers: do_install: fix "Argument list too long" error
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
X-List-Received-Date: Fri, 13 Sep 2013 13:43:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Sep 13, 2013 at 4:23 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
> There would be an "Argument list too long" error when the TMPDIR is in a deep
> dir, for example, when "len(readlink -f TMPDIR) >= 350 (our supported value is
> 410)". Use "$(foreach ,,$(shell echo))" to fix it.
>
> [YOCTO #5138]
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  ...cripts-Makefile.headersinst-args-too-long.patch |   36 ++++++++++++++++++++
>  .../linux-libc-headers/linux-libc-headers_3.10.bb  |    1 +
>  2 files changed, 37 insertions(+)
>  create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/scripts-Makefile.headersinst-args-too-long.patch
>
> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/scripts-Makefile.headersinst-args-too-long.patch b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/scripts-Makefile.headersinst-args-too-long.patch
> new file mode 100644
> index 0000000..c0e1a06
> --- /dev/null
> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/scripts-Makefile.headersinst-args-too-long.patch
> @@ -0,0 +1,36 @@
> +Makefile.headersinst: fix "Argument list too long" error
> +
> +There would be an "Argument list too long" error when the src is in a
> +deep dir, for example, when "len(readlink -f src_dir) >= 400", use
> +"$(foreach ,,$(shell echo))" to fix it.
> +
> +Upstream-Status: Pending

Put this as inappropriate. I've already tried to submit these
upstream, and they didn't
work. So just tag them as yocto specific, and I'll continue to work
upstream on the
issue.

> +
> +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> +---
> + scripts/Makefile.headersinst |    7 ++++++-
> + 1 file changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/scripts/Makefile.headersinst b/scripts/Makefile.headersinst
> +--- a/scripts/Makefile.headersinst
> ++++ b/scripts/Makefile.headersinst
> +@@ -98,10 +98,15 @@ __headersinst: $(subdirs) $(install-file)
> +       @:
> +
> + targets += $(install-file)
> ++# Use the $(foreach ,,$(shell echo)) to avoid the "Argument list too
> ++# long" error, and use the "$(shell echo)" rather than "echo" to keep
> ++# the order.
> + $(install-file): scripts/headers_install.sh $(input-files) FORCE
> +       $(if $(unwanted),$(call cmd,remove),)
> +       $(if $(wildcard $(dir $@)),,$(shell mkdir -p $(dir $@)))
> +-      @echo $(input-files) > $(INSTALL_HDR_PATH)/.input-files
> ++      $(shell echo -n > $(INSTALL_HDR_PATH)/.input-files)
> ++      $(foreach f,$(input-files),$(shell echo -n "$(f) " >> \
> ++                      $(INSTALL_HDR_PATH)/.input-files))
> +       $(call if_changed,install)
> +       @rm $(INSTALL_HDR_PATH)/.input-files
> +
> +--
> +1.7.10.4
> +
> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.10.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.10.bb
> index 65df230..d056e7c 100644
> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.10.bb
> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.10.bb
> @@ -2,6 +2,7 @@ require linux-libc-headers.inc
>
>  SRC_URI += "file://0001-ptrace.h-remove-ptrace_peeksiginfo_args.patch"
>  SRC_URI += "file://scripts-Makefile.headersinst-install-headers-from-sc.patch"
> +SRC_URI += "file://scripts-Makefile.headersinst-args-too-long.patch"

When you looked at this .. didn't it strike you as wrong ? We already
have a patch
that was attempting to fix the same problem.

Technically even the foreach can still become to large and blow out the shells
processing capabilities .. I know, since I wrote the same for loop at one point.

That being said, if you have reproduced the problem and can show that this does
fix at least the problem at hand, I'm ok with the change ..

BUT, it needs to be squashed into the previous patch and have both our Sign-offs
left in the single patch.

Cheers,

Bruce

>
>  SRC_URI[md5sum] = "72d0a9b3e60cd86fabcd3f24b1708944"
>  SRC_URI[sha256sum] = "46c9e55e1fddf40813b8d697d5645037a8e2af5c1a8dff52b3fe82b5021582b8"
> --
> 1.7.10.4
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

