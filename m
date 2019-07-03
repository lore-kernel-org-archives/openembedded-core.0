Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 77B747E68A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2019 16:12:43 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id w9so3276469wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jul 2019 09:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=pfKkbme7x1Inkq3PPNSn5FJHdbPPqNhXiMT26hA72zY=;
	b=YfTXRSEHfJJ+c3+MiRT2ZgMd8bA2x1eXEf81OhuV5sgODk279HNYGinO72ZgvfLqau
	OuI+tf78ZVS8ofA/FHhScqIpAX2wCP0QZcKTAFijvuzurseO4XdzMdBswP19++QH6hSz
	Dwzok9ofhLTm1wbjPYqplexYUhwXAskPkqTyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=pfKkbme7x1Inkq3PPNSn5FJHdbPPqNhXiMT26hA72zY=;
	b=VsIXXZpeu4JIR9p3nfEcwOVXnk+l3SvPv3d/370fGxcZ09AESgXb5AnUBe8BYaYM8F
	RStQGIyIAca80tKibLIRh4J/oomULVij01kAWLwdjnZe/aZg1/F0CjuRoWRhduoERQc3
	u2Sc0SzmTx0ejTV4ktmQTeuWJSjpoPRPLppKmzYJxZoUvI8xpWwAn8bXNiDpP9i9NIez
	XpZ37KPKLgPzUO8PflyN+Rum19u3pEpX2cMuoxXUksLVc5yZU4o2WEoeCU3c7ff/DlS8
	FChM8V69XSpRIn3ksthPVDG/HI+LyowR00hU+PIfPlWd7RdTcTtmZM3I6sRFkNz1gKWS
	S3Kw==
X-Gm-Message-State: APjAAAWlC9H8zrHBidNKFtTbRs/grPT3CR7oryclHxFoQYd86TtSQ2EM
	MUxDcNMR52iVKAZTBZeYli6IrDoZFGs=
X-Google-Smtp-Source: APXvYqwERteB2vmsXxBKyF7XSSVLAqxfJAcCNmQ7VOJGQrd+6sbaliHb+5OFvUBSA03p2nHHzHCLLg==
X-Received: by 2002:a1c:6c0a:: with SMTP id h10mr8390772wmc.40.1562170364109; 
	Wed, 03 Jul 2019 09:12:44 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id r4sm2580544wrv.34.2019.07.03.09.12.43
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 03 Jul 2019 09:12:43 -0700 (PDT)
Message-ID: <d091a39d8fa8cc562992b715d605634738f28097.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ricardo Ribalda Delgado <ricardo@ribalda.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 03 Jul 2019 17:12:42 +0100
In-Reply-To: <20190625071442.5228-1-ricardo@ribalda.com>
References: <20190625071442.5228-1-ricardo@ribalda.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] systemd-bootconf: Make is machine specific
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
X-List-Received-Date: Wed, 03 Jul 2019 16:12:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-06-25 at 09:14 +0200, Ricardo Ribalda Delgado wrote:
> APPEND is usually attached to a machine. This patch avoids
> multiconfig
> errors such as:
> 
> > NOTE: Direct dependencies are
> > ['multiconfig:qt5022:/workdir/repo/poky/meta/recipes-
> > core/glibc/glibc_2.29.bb:do_populate_sysroot',
> > 'multiconfig:qt5022:virtual:native:/workdir/repo/poky/meta/recipes-
> > devtools/pseudo/pseudo_git.bb:do_populate_sysroot',
> > 'multiconfig:qt5022:/workdir/repo/poky/meta/recipes-
> > devtools/quilt/quilt-native_0.65.bb:do_populate_sysroot',
> > 'multiconfig:qt5022:/workdir/repo/poky/meta/recipes-
> > devtools/gcc/gcc-cross_8.3.bb:do_populate_sysroot',
> > 'multiconfig:qt5022:/workdir/repo/poky/meta/recipes-
> > devtools/gcc/gcc-runtime_8.3.bb:do_populate_sysroot']
> > NOTE: Installed into sysroot: []
> > NOTE: Skipping as already exists in sysroot: ['glibc', 'pseudo-
> > native', 'quilt-native', 'gcc-cross-x86_64', 'gcc-runtime',
> > 'libgcc', 'linux-libc-headers', 'libtool-native', 'texinfo-dummy-
> > native', 'libmpc-native', 'flex-native', 'automake-native', 'zlib-
> > native', 'mpfr-native', 'gmp-native', 'binutils-cross-x86_64', 'xz-
> > native', 'autoconf-native', 'gnu-config-native', 'gettext-minimal-
> > native', 'm4-native']
> > DEBUG: Python function extend_recipe_sysroot finished
> > DEBUG: Executing shell function do_install
> > install: cannot stat 'loader.conf': No such file or directory
> > WARNING: exit code 1 from a shell command.
> > ERROR: Function failed: do_install (log file is located at
> > /workdir/build/tmp/work/bobcat-poky-linux/systemd-bootconf/1.00-
> > r0/temp/log.do_install.737)
> NOTE: recipe systemd-bootconf-1.00-r0: task do_install: Failed
> ERROR: Task (multiconfig:qt5022:/workdir/repo/poky/meta/recipes-
> core/systemd/systemd-bootconf_1.00.bb:do_install) failed with exit
> code '1'
> 
> Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> ---
>  meta/recipes-core/systemd/systemd-bootconf_1.00.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-core/systemd/systemd-bootconf_1.00.bb
> b/meta/recipes-core/systemd/systemd-bootconf_1.00.bb
> index e9c2466456..d13b8c518f 100644
> --- a/meta/recipes-core/systemd/systemd-bootconf_1.00.bb
> +++ b/meta/recipes-core/systemd/systemd-bootconf_1.00.bb
> @@ -3,6 +3,7 @@ LIC_FILES_CHKSUM =
> "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
>  SUMMARY = "Basic systemd-boot configuration files"
>  
>  RPROVIDES_${PN} += "virtual/systemd-bootconf"
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  inherit systemd-boot-cfg

Avoiding a multiconfig issue by making something machine specific
doesn't sound right.

Does this recipe generate machine specific content or not?

I think this patch needs more explanation that the error log above
provides.

Cheers,

Richard




