Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 82A6A7D720
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 21:57:55 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id k11so13740450wro.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 14:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=/nlmeEqmr5WvsUpaIUtbhyDo7IZHBA5IYCnCzplZ+Rs=;
	b=gSV60gCUhy6N05gkTV/jUq4YtdmZqS+ZowPJfXUBHsWwfyEmS3Xf/WVylFbtkTPqt/
	pk9ZMJ2YjxQMUeoAEgokiIriT5wpZ26zIF1TUhPG7sp7YQte5nWFCkS8YeowWuaCByfg
	qQyBKm/CJCEmozp2rDqBssj/+Ea7cCzF8G2FA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=/nlmeEqmr5WvsUpaIUtbhyDo7IZHBA5IYCnCzplZ+Rs=;
	b=IaX1KZYuKQE5N4iIXziDwSrudGNMincoYmvK3W2yEsfKYiZ2y7LLzfP4oaKqtkoN4G
	3gKhlCUMJGc4U2P4+ZJ+n0bneB1rZyvXh5m0bUTBYb3XogUkeALZuAEGuN1mqRHKr29f
	84iyevrovPDqW9jScyvOt8fvqPkKECujB1rI2+KH+UxbTbGYrDA7sR9C1mbpCjh4TLKe
	1M4/pP0ESq7HKcLf67gCPCruJWEIyaBwIfTSfBp7xuGIZCgG4Rx/Y5Tat0nzzeicafAX
	hN4flMNKhzUAO5/tG675cihWPsb2ISHzxYnHsI8dgeuUk63yuJh/yVjFrNc0ydmCuBl3
	lZkw==
X-Gm-Message-State: APjAAAUElXSnem6a+zVoHfdxmcoOl0yt76pe0nzPcBteLp7jkFP3Q3uU
	ehaoSs9/y6mDDdWHQiBAmj2TdA==
X-Google-Smtp-Source: APXvYqz40z4kFbOtWpj5fsZF0lbwBE3CobmF7Ycweak7HNWFgzcswyoLHWDzjkO89aE6XNWVQaY32w==
X-Received: by 2002:adf:ef8e:: with SMTP id d14mr35065095wro.81.1555106276045; 
	Fri, 12 Apr 2019 14:57:56 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	i17sm43945394wrs.44.2019.04.12.14.57.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 12 Apr 2019 14:57:55 -0700 (PDT)
Message-ID: <23562ca03db97ef41bbb2e6365ecde4bd715438d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mingli.yu@windriver.com, openembedded-core@lists.openembedded.org
Date: Fri, 12 Apr 2019 22:57:53 +0100
In-Reply-To: <1555039677-16701-1-git-send-email-mingli.yu@windriver.com>
References: <1555039677-16701-1-git-send-email-mingli.yu@windriver.com>
User-Agent: Evolution 3.32.0-1 
MIME-Version: 1.0
Subject: Re: [PATCH] nettle: fix ptest failure
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
X-List-Received-Date: Fri, 12 Apr 2019 21:57:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-04-12 at 11:27 +0800, mingli.yu@windriver.com wrote:
> From: Mingli Yu <Mingli.Yu@windriver.com>
> 
> Remove dlopen-test.patch which originally used
> to fix the test dlopen-test, but autually the
> patch didn't resolve the issue as dlopen-test.patch
> supposes the file /usr/lib/libnettle.so exists.
> Instead deploy ${D}${PTEST_PATH}/libnettle.so to
> fix the dlopen-test failure.
> 
> Update the initialization for the salt to fix
> below Segmentation fault and also nettle-pbkdf2-test
> failure.
>  # echo -n passwd| nettle-pbkdf2 -i 1 -l 16 salt
>  [65534.886509] nettle-pbkdf2[708]: segfault at 1f594260 ip
> 00007f3332256998 sp 00007fff60d44410 error 4 in
> libnettle.so.6.5[7f3332244000+1d00]
>  [65534.887525] Code: e8 6d db fe ff 44 01 6d 68 48 83 c4 08 5b 5d 41
> 5c 41 5d 41 5e 41 5f c3 66 2e 0f 1f 84 00 00 00 00 00 49 89 dc e9 68
> ff f
>  Segmentation fault
> 
> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> ---
>  ...kdf2.c-change-the-initialization-for-salt.patch | 39
> ++++++++++++++++++++++
>  .../nettle/nettle-3.4.1/dlopen-test.patch          | 20 -----------
>  meta/recipes-support/nettle/nettle_3.4.1.bb        |  9 ++---
>  3 files changed, 44 insertions(+), 24 deletions(-)
>  create mode 100644 meta/recipes-support/nettle/nettle-3.4.1/0001-
> nettle-pbkdf2.c-change-the-initialization-for-salt.patch
>  delete mode 100644 meta/recipes-support/nettle/nettle-3.4.1/dlopen-
> test.patch
> 
> diff --git a/meta/recipes-support/nettle/nettle-3.4.1/0001-nettle-
> pbkdf2.c-change-the-initialization-for-salt.patch b/meta/recipes-
> support/nettle/nettle-3.4.1/0001-nettle-pbkdf2.c-change-the-
> initialization-for-salt.patch
> new file mode 100644
> index 0000000..713823e
> --- /dev/null
> +++ b/meta/recipes-support/nettle/nettle-3.4.1/0001-nettle-pbkdf2.c-
> change-the-initialization-for-salt.patch
> @@ -0,0 +1,39 @@
> +From 7510ee2877368464ecce7de515ce056e08c75245 Mon Sep 17 00:00:00
> 2001
> +From: Mingli Yu <Mingli.Yu@windriver.com>
> +Date: Fri, 12 Apr 2019 10:30:14 +0800
> +Subject: [PATCH] nettle-pbkdf2.c: change the initialization for salt
> +
> +use malloc and strncpy altogether to replace
> +strdup for salt initialization to fix below
> +Segmentation fault:
> + # echo -n passwd| nettle-pbkdf2 -i 1 -l 16 salt
> + [65534.886509] nettle-pbkdf2[708]: segfault at 1f594260 ip
> 00007f3332256998 sp 00007fff60d44410 error 4 in
> libnettle.so.6.5[7f3332244000+1d00]
> + [65534.887525] Code: e8 6d db fe ff 44 01 6d 68 48 83 c4 08 5b 5d
> 41 5c 41 5d 41 5e 41 5f c3 66 2e 0f 1f 84 00 00 00 00 00 49 89 dc e9
> 68 ff f
> + Segmentation fault
> +
> +Upstream-Status: Submitted[
> http://lists.lysator.liu.se/pipermail/nettle-bugs/2019/007467.html]
> +
> +Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> +---
> + tools/nettle-pbkdf2.c | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/tools/nettle-pbkdf2.c b/tools/nettle-pbkdf2.c
> +index 1f0a301..000acd3 100644
> +--- a/tools/nettle-pbkdf2.c
> ++++ b/tools/nettle-pbkdf2.c
> +@@ -141,7 +141,10 @@ main (int argc, char **argv)
> +       return EXIT_FAILURE;
> +     }
> + 
> +-  salt = strdup (argv[0]);
> ++  salt = malloc (strlen(argv[0]) + 1);
> ++  if (! salt)
> ++     die ("Failed to allocate memory for salt\n");
> ++  strncpy(salt, argv[0], sizeof(salt) - 1);
> +   salt_length = strlen(argv[0]);
> +   
> +   if (hex_salt)
> +-- 
> +2.7.4
> +
> diff --git a/meta/recipes-support/nettle/nettle-3.4.1/dlopen-
> test.patch b/meta/recipes-support/nettle/nettle-3.4.1/dlopen-
> test.patch
> deleted file mode 100644
> index c4f0b7e..0000000
> --- a/meta/recipes-support/nettle/nettle-3.4.1/dlopen-test.patch
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -Replace relative path of libnettle.so with absolute path so the test
> -program can find it.
> -Relative paths are not suitable, as the folder strucure for ptest
> -is different from the one expected by the nettle testsuite.
> -
> -Upstream-Status: Inappropriate [embedded specific]
> -
> -Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> -
> ---- a/testsuite/dlopen-test.c	2016-10-01 00:28:38.000000000
> -0700
> -+++ b/testsuite/dlopen-test.c	2017-10-13 11:08:57.227572860
> -0700
> -@@ -9,7 +9,7 @@
> - main (int argc UNUSED, char **argv UNUSED)
> - {
> - #if HAVE_LIBDL
> --  void *handle = dlopen ("../libnettle.so", RTLD_NOW);
> -+  void *handle = dlopen ("/usr/lib/libnettle.so", RTLD_NOW);
> -   int (*get_version)(void);
> -   if (!handle)
> -     {
> diff --git a/meta/recipes-support/nettle/nettle_3.4.1.bb
> b/meta/recipes-support/nettle/nettle_3.4.1.bb
> index dd49c30..612e058 100644
> --- a/meta/recipes-support/nettle/nettle_3.4.1.bb
> +++ b/meta/recipes-support/nettle/nettle_3.4.1.bb
> @@ -14,12 +14,9 @@ SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
>             file://Add-target-to-only-build-tests-not-run-them.patch
> \
>             file://run-ptest \
>             file://check-header-files-of-openssl-only-if-
> enable_.patch \
> +           file://0001-nettle-pbkdf2.c-change-the-initialization-
> for-salt.patch \
>             "
>  
> -SRC_URI_append_class-target = "\
> -            file://dlopen-test.patch \
> -            "
> -
>  SRC_URI[md5sum] = "9bdebb0e2f638d3b9d91f7fc264b70c1"
>  SRC_URI[sha256sum] =
> "f941cf1535cd5d1819be5ccae5babef01f6db611f9b5a777bae9c7604b8a92ad"
>  
> @@ -47,6 +44,10 @@ do_install_ptest() {
>          # tools can be found in PATH, not in ../tools/
>          sed -i -e 's|../tools/||' ${D}${PTEST_PATH}/testsuite/*-test
>          install ${B}/testsuite/*-test ${D}${PTEST_PATH}/testsuite/
> +        # libnettle.so is needed for dlopen-test
> +        if [ -f ${D}${libdir}/libnettle.so.6.* ]; then
> +            cp ${D}${libdir}/libnettle.so.6.*
> ${D}${PTEST_PATH}/libnettle.so
> +        fi
>  }
>  
>  BBCLASSEXTEND = "native nativesdk"

This commit has multiple issues. Firstly upstream rejected the patch.
Secondly adding in this library like this has caused nettle-ptest to
provide the SONAME which then led to nettle-ptest being included in
various images, e.g.:

http://git.yoctoproject.org/cgit.cgi/poky-buildhistory/tree/images/qemux86/glibc/core-image-sato/installed-package-names.txt?h=poky/warrior/qemux86#n604

which then led to nettle being spread all over the 2.7 rc1 QA report:

https://autobuilder.yocto.io/pub/releases/yocto-2.7.rc1/testresults/testresult-report.txt

I'm going to revert this.

Cheers,

Richard


