Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.5475.1591339217939434401
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2020 23:40:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dZa2QY/K;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id t18so8513951wru.6
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2020 23:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=6InTvw/kscHGF5nbsURDK8OLBQgpXcDLL8gReYIPrnU=;
        b=dZa2QY/KEC5fcNgsXcVtqNDyuFxpJH2SIi/yNhoQdiRy6esuimCKS5sQKjdw+OGojh
         mvFrYHwuRtdR2ISSv5TeUYe1SsW4OBrNYwqgJ3P8iIpjwfsoqnzCelkqmT9cZAXxWDHM
         c6yHksJrjhvCsYm9VS/QvwF5tKw7OKxZMLdRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=6InTvw/kscHGF5nbsURDK8OLBQgpXcDLL8gReYIPrnU=;
        b=VXmgFr/tUimgYX2mCutzTZY1hcaQ1YzQselWXfslij1O1zNWeCJsTrGqEf5D2/IgyW
         urLEI0sSIiDZ/P3lfeYzttkvzasOhvCXECMTb+cN03TUKh8x2ZgP0Dn2eHiUfudzI/ix
         fCpRdb9ZLn5zLyj4Diot993H6kaTQdW8vjk1YhmOCZXDOcoB+H011THd/Cao6SRK0yA5
         BjyJs6EMBLhAcUb5ixTrmrbbP3tDGerbqT4Tup7mNao6Y3iYnRsNr94GW/5P5HRjdKQT
         nXBcov9BCnjcUx8bR0XRIaDFs3YGYAyWZR6wOx+16tIR2WETF/9la2KAFH4jUQQ0QCXI
         3Izw==
X-Gm-Message-State: AOAM530qawGYbOTtgwlIVeU2a6ZmgoqRnWsL56q+nm4oNJpT56oZX10k
	7zeFdTlGmATYkIcMXSVU1Z7hDQ==
X-Google-Smtp-Source: ABdhPJzSR4oh6yCCNOef4esMe7yjQEibmYOgFoBopcdyC5DpExLqzk/pwuBdlK9HvC7K32bFGexIAA==
X-Received: by 2002:a5d:40d2:: with SMTP id b18mr7751369wrq.131.1591339216047;
        Thu, 04 Jun 2020 23:40:16 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id b14sm10091268wmj.47.2020.06.04.23.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 23:40:15 -0700 (PDT)
Message-ID: <b2edd74f0db71f891253828cfca64699a32a6622.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] Revert "vim: do not adjust script paths building for target"
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Fri, 05 Jun 2020 07:40:14 +0100
In-Reply-To: <20200605021331.20630-1-Qi.Chen@windriver.com>
References: <20200605021331.20630-1-Qi.Chen@windriver.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-06-05 at 10:13 +0800, Chen Qi wrote:
> This reverts commit 8972fe5581b9fe8ef14d539001758bb13bca6737.
> 
> The above commit causes regression when vim-tools is installed.
> The error is like below.
> 
> Error:
>  Problem: conflicting requests
>    - nothing provides /bin/csh needed by vim-tools-8.2-r0.corei7_64
>    - nothing provides /usr/bin/nawk needed by vim-tools-8.2-r0.corei7_64
>    - nothing provides /usr/bin/python needed by vim-tools-8.2-r0.corei7_64
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../vim/files/no-path-adjust.patch            | 27 -------------------
>  meta/recipes-support/vim/vim.inc              | 12 ++++-----
>  2 files changed, 6 insertions(+), 33 deletions(-)
>  delete mode 100644 meta/recipes-support/vim/files/no-path-adjust.patch
> 
> diff --git a/meta/recipes-support/vim/files/no-path-adjust.patch b/meta/recipes-support/vim/files/no-path-adjust.patch
> deleted file mode 100644
> index 05c2d803f6..0000000000
> --- a/meta/recipes-support/vim/files/no-path-adjust.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -vim: do not adjust script pathnames
> -
> -When cross-compiling, we do not want to reference the host versions of
> -things like perl and awk.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Joe Slater <joe.slater@windriver.com>
> -
> ---- a/src/Makefile
> -+++ b/src/Makefile
> -@@ -2507,11 +2507,14 @@ installtools: $(TOOLS) $(DESTDIR)$(exec_
> - 		 rm -rf $$cvs; \
> - 	      fi
> - 	-chmod $(FILEMOD) $(DEST_TOOLS)/*
> --# replace the path in some tools
> -+
> -+# replace the path in some tools, but not when cross-compiling
> -+ifneq ($(CROSS_COMPILING),1)
> - 	perlpath=`./which.sh perl` && sed -e "s+/usr/bin/perl+$$perlpath+" $(TOOLSSOURCE)/efm_perl.pl >$(DEST_TOOLS)/efm_perl.pl
> - 	awkpath=`./which.sh nawk` && sed -e "s+/usr/bin/nawk+$$awkpath+" $(TOOLSSOURCE)/mve.awk >$(DEST_TOOLS)/mve.awk; if test -z "$$awkpath"; then \
> - 		awkpath=`./which.sh gawk` && sed -e "s+/usr/bin/nawk+$$awkpath+" $(TOOLSSOURCE)/mve.awk >$(DEST_TOOLS)/mve.awk; if test -z "$$awkpath"; then \
> - 		awkpath=`./which.sh awk` && sed -e "s+/usr/bin/nawk+$$awkpath+" $(TOOLSSOURCE)/mve.awk >$(DEST_TOOLS)/mve.awk; fi; fi
> -+endif
> - 	-chmod $(SCRIPTMOD) `grep -l "^#!" $(DEST_TOOLS)/*`
> - 
> - # install the language specific files for tools, if they were unpacked


If we're going to install these files which you're still doing, we want
to use target paths, not host ones?

I suspect we therefore need this and your changes rather than removing
this patch?

Cheers,

Richard


> diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
> index 9f3dc08027..78e3f9528d 100644
> --- a/meta/recipes-support/vim/vim.inc
> +++ b/meta/recipes-support/vim/vim.inc
> @@ -11,7 +11,6 @@ SRC_URI = "git://github.com/vim/vim.git \
>             file://disable_acl_header_check.patch \
>             file://vim-add-knob-whether-elf.h-are-checked.patch \
>             file://0001-src-Makefile-improve-reproducibility.patch \
> -           file://no-path-adjust.patch \
>  "
>  SRCREV = "98056533b96b6b5d8849641de93185dd7bcadc44"
>  
> @@ -83,6 +82,12 @@ EXTRA_OECONF = " \
>  do_install() {
>      autotools_do_install
>  
> +    # Work around file-rdeps picking up csh, awk, perl or python as a dep
> +    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/vim132
> +    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/mve.awk
> +    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.pl
> +    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.py
> +
>      # Install example vimrc from runtime files
>      install -m 0644 runtime/vimrc_example.vim ${D}/${datadir}/${BPN}/vimrc
>  
> @@ -105,12 +110,7 @@ FILES_${PN}-help = "${datadir}/${BPN}/${VIMDIR}/doc"
>  FILES_${PN}-tutor = "${datadir}/${BPN}/${VIMDIR}/tutor ${bindir}/${BPN}tutor"
>  FILES_${PN}-vimrc = "${datadir}/${BPN}/vimrc"
>  FILES_${PN}-data = "${datadir}/${BPN}"
> -
> -# We do not want to complain if perl or gawk are not on the target.
> -#
>  FILES_${PN}-tools = "${datadir}/${BPN}/${VIMDIR}/tools"
> -INSANE_SKIP_${PN}-tools = "file-rdeps"
> -
>  FILES_${PN}-common = " \
>      ${datadir}/${BPN}/${VIMDIR}/*.vim \
>      ${datadir}/${BPN}/${VIMDIR}/autoload \
> 

