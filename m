Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id E2E0D605FF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Dec 2016 18:23:47 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id w194so16616623vkw.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Dec 2016 10:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XXjcIsmfS5UGhVd9ah4sAPGKhUsnQWwMapT7WNI07XI=;
	b=wndFxMbEXEQe1yYTQOt2W0YWSi3rTMv0YvHHA0qdwsGEDiEocV92oL31ujEFfPEn7V
	kFE+iR8aEJ5QjZ1w/shNyY1PeV/IwvVEZDX7+8+44voyDRH1L+vYAk7AjMkI4Rl4g1Rj
	cdmfVYjbKGE5HfXeCII/0cWWLhHiYFW6MJl4d5QnSCbnlwGV9+MBlB+ocams0iU2Ct+Z
	KEknmMZCXv5bgx62YscJPptCPYcflIKnTIly/gklVOWZn798xmdCmDTPR0kOuT5KmZwS
	KXV/OcOmnq+GtSdSQ7T9kCc5jbknWnnyS0iTMbNa6/M1STgpGDO89m1DZX26DMCJs7pl
	0DwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XXjcIsmfS5UGhVd9ah4sAPGKhUsnQWwMapT7WNI07XI=;
	b=ASFqROPDzNLFbDcsyR8jwcYfSPG+n+JztCAGw45slKvgb+SFwpJtd8YZYEp32VUiUg
	YokB5W4tA5IKnsOMmdcw6Z/NvLyu3MYJPvMVC8AIwZ8qwfGdxvPm79cZxiBtd8SpWdaH
	0DU+1be/TAkIMWJLa04AaV1tznUg6U+y22B51EWD6SXIwLcbilgII8IEP68fCJhGJUtR
	geDzT4wm0Q0ixQmD59zkyGb4APAUBjg7PMmGNPCEbZDqcGL/ON0aOE0jflVb4yviykRI
	JHh5Ll324SVLzlFPhrpC6TBH5r6wY00Lt2F4w0NqdEPrDDDO+S1sOOmDGB9MvGZQ5TNC
	UejA==
X-Gm-Message-State: AKaTC02MuIYsYeDeqrBSkA5eqIL3bWuuGXmqQ3k3g+gmF+W4WGexQ6GVUq2CD2WE0dOFdlGRnViGTgcJc8Pmig==
X-Received: by 10.31.234.199 with SMTP id i190mr21739047vkh.31.1480962228985; 
	Mon, 05 Dec 2016 10:23:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Mon, 5 Dec 2016 10:23:18 -0800 (PST)
In-Reply-To: <981a3fcb8a50c6277be726177a5895c64296d2ac.1480949616.git.liezhi.yang@windriver.com>
References: <cover.1480949616.git.liezhi.yang@windriver.com>
	<981a3fcb8a50c6277be726177a5895c64296d2ac.1480949616.git.liezhi.yang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 5 Dec 2016 10:23:18 -0800
Message-ID: <CAMKF1so3kwUrinR7HWarC+CPd+1d1mby2_-H-5XE3XQb3PzZaw@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] diffutils: do_configure: fix "Argument list too long"
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
X-List-Received-Date: Mon, 05 Dec 2016 18:23:48 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 5, 2016 at 6:54 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
> Fixed when len(TMPDIR) =  410:
> aclocal: error: cannot open echo [snip]: Argument list too long
>
> This is becuase it has a lot of m4 files, use relative path for them
> can fix the problem.
>
> It doesn't happen when MACHINE="qemux86", I think it is because
> intel-x86-64 is longer than qemux86.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-extended/diffutils/diffutils_3.4.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-extended/diffutils/diffutils_3.4.bb b/meta/recipes-extended/diffutils/diffutils_3.4.bb
> index cb7092b..be280ec 100644
> --- a/meta/recipes-extended/diffutils/diffutils_3.4.bb
> +++ b/meta/recipes-extended/diffutils/diffutils_3.4.bb
> @@ -10,6 +10,9 @@ SRC_URI = "${GNU_MIRROR}/diffutils/diffutils-${PV}.tar.xz \
>
>  EXTRA_OECONF += "--without-libsigsegv-prefix"
>
> +# Fix "Argument list too long" error when len(TMPDIR) = 410
> +acpaths = "-I ./m4"

it looks ok if this work ok with externalsrc

> +
>  do_configure_prepend () {
>         # Need to remove gettext macros with weird mix of versions
>         for i in codeset.m4 gettext_gl.m4 intlmacosx.m4 inttypes-pri.m4 lib-ld_gl.m4 lib-prefix_gl.m4 po_gl.m4 ssize_t.m4 wchar_t.m4 wint_t.m4; do
> --
> 2.9.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

