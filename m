Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id D9E6E7E241
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Jun 2019 06:47:21 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id c2so7844093wrm.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 23:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=aFdLFl6FiqQfg3SjezNFoc256AmApe8f1wqwU8+GeOU=;
	b=NORRZXOvpWFiPCmWtwVQev2QW7xXdJI+wFRBWi2IECW7wvlP+CiDoZiX1ZPAFLFNgY
	onYTjJX91ZtP1eIJU0yGMkt8v+eSdOaxaxWk0Irt57o5WhBUV0rxfnZr0n/gwiaWPVWg
	5MD98AllhUrGFTx+7jtv9Sl3hIIx6GD2vwemU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=aFdLFl6FiqQfg3SjezNFoc256AmApe8f1wqwU8+GeOU=;
	b=Fdhoa6xxhunUJfqy4gljJLwb5Qaxg7xMwhwKtyBj8nGIjkeR/1weuCM+ZwFvwcG+pF
	6KsWooNVSGIC3Iq5rWW6F9XeKHromxhAD6k5+NsdamokiWsahZVGYVSfP7mxz76WreJR
	rDCdINIySU30AqGREOC1rgFYap3wqnNIk6BAgo+luMl2wY4cg0678B1/bKlekkQE51oB
	RyhvucJ4xj/effNOtU8grJK13kj5TBc5vWwAALKx+J4yoUf1CJ2o2VprLPd7A83OYNhH
	yRLIK4QPfDH8pMriwz2J6tLi+69QK8Kq12xv8XxK0bw9G33ktHwrhgeHewLxsdTkHhXm
	Wcvw==
X-Gm-Message-State: APjAAAUFH7XDY1EFgW3ZTogt21usanAtRWl2agsMVHdGb6vcmy5KUB9x
	xxu6sdyJv+L3BU4q0NVWdLeExw==
X-Google-Smtp-Source: APXvYqxMHwyDa1LSjHGxUOt4LK2fbwgOwAhc3R/DHWV58rBy6OgwaioVS0mJqCO4GdoJ4fnqD07qzQ==
X-Received: by 2002:adf:e909:: with SMTP id f9mr9375034wrm.231.1559371642523; 
	Fri, 31 May 2019 23:47:22 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y132sm13669501wmd.35.2019.05.31.23.47.21
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 31 May 2019 23:47:21 -0700 (PDT)
Message-ID: <5ec644af8672d726bae30da958c0b69120ca19b8.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 01 Jun 2019 07:47:20 +0100
In-Reply-To: <20190531165734.14435-1-JPEWhacker@gmail.com>
References: <20190531165734.14435-1-JPEWhacker@gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] bash: Replace uninative loader path in ptest
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
X-List-Received-Date: Sat, 01 Jun 2019 06:47:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-05-31 at 11:57 -0500, Joshua Watt wrote:
> The Makefile used for bash-ptest can pick up the path to the uninative
> loader through BUILD_LDFLAGS. This includes the full path to the
> uninative loader, which is not reproducible. Replace it with the target
> loader in the event that these programs need to be compiled for bash
> tests.
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/recipes-extended/bash/bash.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
> index 4b3692c6139..55f2b7704e6 100644
> --- a/meta/recipes-extended/bash/bash.inc
> +++ b/meta/recipes-extended/bash/bash.inc
> @@ -4,7 +4,7 @@ SECTION = "base/shell"
>  
>  DEPENDS = "ncurses bison-native virtual/libiconv"
>  
> -inherit autotools gettext texinfo update-alternatives ptest
> +inherit autotools gettext texinfo update-alternatives ptest linuxloader
>  
>  EXTRA_AUTORECONF += "--exclude=autoheader --exclude=aclocal"
>  EXTRA_OECONF = "--enable-job-control --without-bash-malloc bash_cv_wexitstatus_offset=8"
> @@ -70,6 +70,7 @@ do_install_ptest () {
>  	    -e 's|${DEBUG_PREFIX_MAP}||g' \
>  	    -e "s,${S},,g" -e "s,${B},,g" -e "s,${STAGING_DIR_NATIVE},,g" \
>  	    -e 's:${HOSTTOOLS_DIR}/::g' \
> +	    -e 's:${UNINATIVE_LOADER}:${@get_linuxloader(d)}:g' \
>  	     ${D}${PTEST_PATH}/Makefile
>  }

This change causes:

https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/490

which you can reproduce with:

oe-selftest -r sstatetests.SStateTests.test_sstate_32_64_same_hash

which with some digging you can come to:

$ bitbake-diffsigs tmp-sstatesamehash*/stamps/*-poky-linux/bash/*.do_install_ptest_base.sigdata.*
NOTE: Starting bitbake server...
basehash changed from d92c4da62ccda424103c7615dffc5f747da83bf64a46be63acc11633480a6bf6 to a26822f4999a6bdbe8e8e60db91c1400e2b4011b66d98a9ec57a53d6fc70dc88
Variable UNINATIVE_LOADER value changed:
@@ -1,4 +1,4 @@
 ${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux/lib/${@bb.utils.contains('BUILD_ARCH', 'x86_64', 'ld-linux-x86-64.so.2', '', d)}${@bb.utils.contains('BUILD_ARCH', 'i686', 'ld-linux.so.2', '', d)}${@bb.utils.contains('BUILD_ARCH', 'aarch64', 'ld-linux-aarch64.so.1', '', d)}
 BUILD_ARCH{aarch64} = Unset
-BUILD_ARCH{i686} = Set
-BUILD_ARCH{x86_64} = Unset
+BUILD_ARCH{i686} = Unset
+BUILD_ARCH{x86_64} = Set

which makes the problem fairly obvious when you see it put that way...

Cheers,

Richard




