Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.1232.1623779920783523253
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jun 2021 10:58:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EDrcAww5;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id ei4so119593pjb.3
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jun 2021 10:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VfHeiJ9dnvBYHIQTqZSGhUMQLcQvJZ3OSb8MECytnqY=;
        b=EDrcAww5LCzzqNqGYHBlmDHradNlVE/ohWZbwFJPUFARp4tQJRPnuCvO95xd2vvIxx
         TmOVJUdXNabk8/5sGWvPmaz+Y5XVdTfcPWL2uR0EdlYD6oKKKZv5tyDYsUyHOxYBufGB
         uf7Hz5J+YZIok9fegX7nWMoFIMm70PtGkm0PJTOzSjmG1/I3HGsOTd6s0qwnLXdboCte
         +RclwFEGzuAwW7Bg/hKfXxMDV02pUZTTHyffGN9Vv8ZAa6zJs0M7uC6CebSoSZ4jZw/7
         kE/oBsItZUnRWxrpV0SwOHfuo7ucUdfrQGQRxxMYI8a7+A+AGmu2DTNut3TL3JbhqCKb
         57nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=VfHeiJ9dnvBYHIQTqZSGhUMQLcQvJZ3OSb8MECytnqY=;
        b=K9W6ts9dIMwUScQw5WFsaDFaLh75ooxsIx6J6Tk+tGRG5yEuSfOrKeZJSjvTocCgQ8
         Z8eICBdoCMor4P+MmFQI1AfbT5SnmfoioK/sTjYnv5/xiT0vfJoDIJBNTnjpOCHKdn7j
         q2jHlDdF4hpuw6AhKpf9jZkPaCP0OfXu8mSlBj5wWSnZ8ky897FW5HHbdUZEf7HOXK5U
         Pb7bRGF1Z5qxm1Rvi/m6AGttZu0O4yMSZ+v6tBjIqFux5M1hBEhmv0uNFWyEw3i9f4DA
         kXRsLe3Towrv9A/hq2FuqpyecbPiJ/312AfZDXTCdcARIwB/CAm4x4NrJsdhjEr1EYsp
         OVcA==
X-Gm-Message-State: AOAM532B2ibcQonCbz6Ug3fplWopBkncaMagczuqNK4oCcoeppGCGIZo
	2EyP7xo9BRIocGkQbLU4em+0jmKhtPLsNQ==
X-Google-Smtp-Source: ABdhPJzN9fg3nOM19zK+9e6YA1M+E+wZ+iXPA2Q+pgBroH+9LpWis4I3AL2P82kX1tPX11XqeG2FGA==
X-Received: by 2002:a17:90b:a0e:: with SMTP id gg14mr392743pjb.191.1623779920114;
        Tue, 15 Jun 2021 10:58:40 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:d088:fa89:ac40:a9cc? ([2601:646:9200:a0f0:d088:fa89:ac40:a9cc])
        by smtp.gmail.com with ESMTPSA id v15sm17201937pgf.26.2021.06.15.10.58.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jun 2021 10:58:39 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] gcc: replace gdb helper install revert with the upstream fix
To: Ross Burton <ross@burtonini.com>, openembedded-core@lists.openembedded.org
References: <20210615163354.282584-1-ross.burton@arm.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <400213e2-c85e-8beb-202e-5998e183596f@gmail.com>
Date: Tue, 15 Jun 2021 10:58:38 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210615163354.282584-1-ross.burton@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 6/15/21 9:33 AM, Ross Burton wrote:
> A change in the gcc-11 branch broke installation of the GDB helper on
> bare-metal targets without a shared libstdc++.so.  This now fixed
> upstream so replacce the revert with a backport of the patch.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>   meta/recipes-devtools/gcc/gcc-11.1.inc        |  2 +-
>   ...nstall-libstdc-gdb.py-more-robustly-.patch | 76 -------------------
>   ...nstallation-of-python-hooks-PR-99453.patch | 57 ++++++++++++++
>   3 files changed, 58 insertions(+), 77 deletions(-)
>   delete mode 100644 meta/recipes-devtools/gcc/gcc/0001-Revert-libstdc-Install-libstdc-gdb.py-more-robustly-.patch
>   create mode 100644 meta/recipes-devtools/gcc/gcc/0001-libstdc-Fix-installation-of-python-hooks-PR-99453.patch
> 

lgtm


> diff --git a/meta/recipes-devtools/gcc/gcc-11.1.inc b/meta/recipes-devtools/gcc/gcc-11.1.inc
> index 69e4c8bacc..c21242af58 100644
> --- a/meta/recipes-devtools/gcc/gcc-11.1.inc
> +++ b/meta/recipes-devtools/gcc/gcc-11.1.inc
> @@ -68,7 +68,7 @@ SRC_URI = "\
>              file://0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch \
>              file://0036-mingw32-Enable-operation_not_supported.patch \
>              file://0037-libatomic-Do-not-enforce-march-on-aarch64.patch \
> -           file://0001-Revert-libstdc-Install-libstdc-gdb.py-more-robustly-.patch \
> +           file://0001-libstdc-Fix-installation-of-python-hooks-PR-99453.patch \
>              file://0038-arc-Update-64bit-move-split-patterns.patch \
>              file://0039-arc-Fix-u-maddhisi-patterns.patch \
>              file://0040-arc-Update-doloop_end-patterns.patch \
> diff --git a/meta/recipes-devtools/gcc/gcc/0001-Revert-libstdc-Install-libstdc-gdb.py-more-robustly-.patch b/meta/recipes-devtools/gcc/gcc/0001-Revert-libstdc-Install-libstdc-gdb.py-more-robustly-.patch
> deleted file mode 100644
> index a3e31e4f9d..0000000000
> --- a/meta/recipes-devtools/gcc/gcc/0001-Revert-libstdc-Install-libstdc-gdb.py-more-robustly-.patch
> +++ /dev/null
> @@ -1,76 +0,0 @@
> -This change breaks installation on baremetal targets, so whilst the cause is
> -investigated revert the commit.
> -
> -Upstream-Status: Inappropriate
> -Signed-off-by: Ross Burton <ross.burton@arm.com>
> -
> -From 8ec52bd0ba2141ef0bcc6f93e26a23d662b40f78 Mon Sep 17 00:00:00 2001
> -From: Ross Burton <ross.burton@arm.com>
> -Date: Wed, 26 May 2021 19:54:29 +0100
> -Subject: [PATCH] Revert "libstdc++: Install libstdc++*-gdb.py more robustly
> - [PR 99453]"
> -
> -This reverts commit dbb87d6a9c37c8eca80d77782717a8144515c16d.
> ----
> - libstdc++-v3/python/Makefile.am | 20 ++++++++++++++++----
> - libstdc++-v3/python/Makefile.in | 14 ++++++++++++--
> - 2 files changed, 28 insertions(+), 6 deletions(-)
> -
> -diff --git a/libstdc++-v3/python/Makefile.am b/libstdc++-v3/python/Makefile.am
> -index 0c2b207b86e..01517a2a522 100644
> ---- a/libstdc++-v3/python/Makefile.am
> -+++ b/libstdc++-v3/python/Makefile.am
> -@@ -44,9 +44,21 @@ gdb.py: hook.in Makefile
> - install-data-local: gdb.py
> - 	@$(mkdir_p) $(DESTDIR)$(toolexeclibdir)
> - ## We want to install gdb.py as SOMETHING-gdb.py.  SOMETHING is the
> --## full name of the final library.  We use the libtool .la file to get
> --## the correct name.
> --	@libname=`sed -ne "/^library_names=/{s/.*='//;s/'$$//;s/ .*//;p;}" \
> --	          $(DESTDIR)$(toolexeclibdir)/libstdc++.la`; \
> -+## full name of the final library.  We want to ignore symlinks, the
> -+## .la file, and any previous -gdb.py file.  This is inherently
> -+## fragile, but there does not seem to be a better option, because
> -+## libtool hides the real names from us.
> -+	@here=`pwd`; cd $(DESTDIR)$(toolexeclibdir); \
> -+	  for file in libstdc++.*; do \
> -+	    case $$file in \
> -+	      *-gdb.py) ;; \
> -+	      *.la) ;; \
> -+	      *) if test -h $$file; then \
> -+	           continue; \
> -+	         fi; \
> -+	         libname=$$file;; \
> -+	    esac; \
> -+	  done; \
> -+	cd $$here; \
> - 	echo " $(INSTALL_DATA) gdb.py $(DESTDIR)$(toolexeclibdir)/$$libname-gdb.py"; \
> - 	$(INSTALL_DATA) gdb.py $(DESTDIR)$(toolexeclibdir)/$$libname-gdb.py
> -diff --git a/libstdc++-v3/python/Makefile.in b/libstdc++-v3/python/Makefile.in
> -index 2efe0b96a19..c35dbe55961 100644
> ---- a/libstdc++-v3/python/Makefile.in
> -+++ b/libstdc++-v3/python/Makefile.in
> -@@ -607,8 +607,18 @@ gdb.py: hook.in Makefile
> -
> - install-data-local: gdb.py
> - 	@$(mkdir_p) $(DESTDIR)$(toolexeclibdir)
> --	@libname=`sed -ne "/^library_names=/{s/.*='//;s/'$$//;s/ .*//;p;}" \
> --	          $(DESTDIR)$(toolexeclibdir)/libstdc++.la`; \
> -+	@here=`pwd`; cd $(DESTDIR)$(toolexeclibdir); \
> -+	  for file in libstdc++.*; do \
> -+	    case $$file in \
> -+	      *-gdb.py) ;; \
> -+	      *.la) ;; \
> -+	      *) if test -h $$file; then \
> -+	           continue; \
> -+	         fi; \
> -+	         libname=$$file;; \
> -+	    esac; \
> -+	  done; \
> -+	cd $$here; \
> - 	echo " $(INSTALL_DATA) gdb.py $(DESTDIR)$(toolexeclibdir)/$$libname-gdb.py"; \
> - 	$(INSTALL_DATA) gdb.py $(DESTDIR)$(toolexeclibdir)/$$libname-gdb.py
> -
> ---
> -2.25.1
> -
> diff --git a/meta/recipes-devtools/gcc/gcc/0001-libstdc-Fix-installation-of-python-hooks-PR-99453.patch b/meta/recipes-devtools/gcc/gcc/0001-libstdc-Fix-installation-of-python-hooks-PR-99453.patch
> new file mode 100644
> index 0000000000..d82f533cb4
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc/0001-libstdc-Fix-installation-of-python-hooks-PR-99453.patch
> @@ -0,0 +1,57 @@
> +Upstream-Status: Backport
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +
> +From ad4c21f0f59b52357019148ec94d767aa2acd8f2 Mon Sep 17 00:00:00 2001
> +From: Jonathan Wakely <jwakely@redhat.com>
> +Date: Tue, 1 Jun 2021 11:00:16 +0100
> +Subject: [PATCH] libstdc++: Fix installation of python hooks [PR 99453]
> +
> +When no shared library is installed, the new code to determine the name
> +of the -gdb.py file yields an empty string. Use the name of the static
> +library in that case.
> +
> +libstdc++-v3/ChangeLog:
> +
> +	PR libstdc++/99453
> +	* python/Makefile.am: Use archive name for printer hook if no
> +	dynamic library name is available.
> +	* python/Makefile.in: Regenerate.
> +
> +(cherry picked from commit 9f7bc160b4a0f27dce248d1226e3ae7104b0e67b)
> +---
> + libstdc++-v3/python/Makefile.am | 4 ++++
> + libstdc++-v3/python/Makefile.in | 4 ++++
> + 2 files changed, 8 insertions(+)
> +
> +diff --git a/libstdc++-v3/python/Makefile.am b/libstdc++-v3/python/Makefile.am
> +index 0c2b207b86e..8efefa5725c 100644
> +--- a/libstdc++-v3/python/Makefile.am
> ++++ b/libstdc++-v3/python/Makefile.am
> +@@ -48,5 +48,9 @@ install-data-local: gdb.py
> + ## the correct name.
> + 	@libname=`sed -ne "/^library_names=/{s/.*='//;s/'$$//;s/ .*//;p;}" \
> + 	          $(DESTDIR)$(toolexeclibdir)/libstdc++.la`; \
> ++	if [ -z "$$libname" ]; then \
> ++	  libname=`sed -ne "/^old_library=/{s/.*='//;s/'$$//;s/ .*//;p;}" \
> ++		  $(DESTDIR)$(toolexeclibdir)/libstdc++.la`; \
> ++	fi; \
> + 	echo " $(INSTALL_DATA) gdb.py $(DESTDIR)$(toolexeclibdir)/$$libname-gdb.py"; \
> + 	$(INSTALL_DATA) gdb.py $(DESTDIR)$(toolexeclibdir)/$$libname-gdb.py
> +diff --git a/libstdc++-v3/python/Makefile.in b/libstdc++-v3/python/Makefile.in
> +index 2efe0b96a19..9904a9197de 100644
> +--- a/libstdc++-v3/python/Makefile.in
> ++++ b/libstdc++-v3/python/Makefile.in
> +@@ -609,6 +609,10 @@ install-data-local: gdb.py
> + 	@$(mkdir_p) $(DESTDIR)$(toolexeclibdir)
> + 	@libname=`sed -ne "/^library_names=/{s/.*='//;s/'$$//;s/ .*//;p;}" \
> + 	          $(DESTDIR)$(toolexeclibdir)/libstdc++.la`; \
> ++	if [ -z "$$libname" ]; then \
> ++	  libname=`sed -ne "/^old_library=/{s/.*='//;s/'$$//;s/ .*//;p;}" \
> ++		  $(DESTDIR)$(toolexeclibdir)/libstdc++.la`; \
> ++	fi; \
> + 	echo " $(INSTALL_DATA) gdb.py $(DESTDIR)$(toolexeclibdir)/$$libname-gdb.py"; \
> + 	$(INSTALL_DATA) gdb.py $(DESTDIR)$(toolexeclibdir)/$$libname-gdb.py
> +
> +--
> +2.25.1
> +
> 
> 
> 
> 
> 
