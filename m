Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7AFA374FB9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Sep 2018 08:36:07 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id r1-v6so8539221wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Sep 2018 01:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=9RpDP5KHz0nUFkvb00uJRcj/RCW6zuN3xWaep0mxoTk=;
	b=CBf/jFCZCv/unsJyPrUQUEBTcdntsEMRni92TozR1DypQN2FqY/IFNR6OgNcvi7bEU
	LA0ISK7cIeC2XPd2YJh6bNT7oo8wk2TsHpNhRHZpnEVz5cHQKHsJoQTAMeWpsAFBEX1l
	eqOY97ib4DdvtJKdH3XKrDSYLDphMTIQzPC/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=9RpDP5KHz0nUFkvb00uJRcj/RCW6zuN3xWaep0mxoTk=;
	b=F2p7JqJmIgwOqULlEvcWvr/FyRwzhMUFa/JCcAMcOhaOc3T18EQsZVSCZG8w4gfL2z
	kRkAIwe+op66DoFVTAk6eLzAN7v5zOF56QBq5w3rGcjLZCLGoFhok3W4R2jQhMb14gcD
	ImoMeFJNSS81y6M5n8soBQE94mZvyZGEgBAKfKLyJ0KUVQGtlFOVlwpGOqJBEUjQj/Wl
	Ymo8zBC4XIfoWnUeMPu1kbPYQ0ByYUDMe+W0Eg/aOpv+wWUKxxbNhBUcAGVKHmJg1B5j
	CycQZ5DL/qdyGqY/pdeKF3ik571Ut2pFct/nLfSp0DQjFhlvtx2ej3Vfjs4ihTuHLs/9
	rQUw==
X-Gm-Message-State: APzg51DY+bI0JiDQY9ZPjz46plu6JwZAwY/nE2NMG/qaYhyAiJ33v92a
	fapxEltQJTJCllCPr3aIL5aYPw==
X-Google-Smtp-Source: ANB0Vdam5Tt3DhRBtmSrhmg9EP+e05PC8IOnO/GfMvGkDVXPTZljjCWoirIs2+kJClZ5PBofmHZPPw==
X-Received: by 2002:a1c:2dc8:: with SMTP id
	t191-v6mr7759791wmt.94.1536050168215; 
	Tue, 04 Sep 2018 01:36:08 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t70-v6sm15702078wmt.30.2018.09.04.01.36.06
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 04 Sep 2018 01:36:07 -0700 (PDT)
Message-ID: <98fc089f8be135c19a0210df09b5a755f03d5112.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Kai Kang <kai.kang@windriver.com>
Date: Tue, 04 Sep 2018 09:36:05 +0100
In-Reply-To: <00a09c8156afc325f1b30392b66caf08e0310b38.1535288685.git.kai.kang@windriver.com>
References: <cover.1535288685.git.kai.kang@windriver.com>
	<00a09c8156afc325f1b30392b66caf08e0310b38.1535288685.git.kai.kang@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/6] allarch: disable allarch when multilib is used
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
X-List-Received-Date: Tue, 04 Sep 2018 08:36:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

I think this is close and it passes the tests on the autobuilder
however I did spot a couple of potential issues after thinking about
this for a bit.

On Sun, 2018-08-26 at 06:06 -0700, Kai Kang wrote:
> Some allarch packages rdepends non-allarch packages. When multilib is
> used, it doesn't expand the dependency chain correctly, e.g.
> 
> core-image-sato -> ca-certificates(allarch) -> openssl
> 
> we expect dependency chain for lib32-core-image-sato:
> 
> lib32-core-image-sato -> ca-certificates(allarch) -> lib32-openssl
> 
> it should install lib32-openssl for ca-certificates but openssl is
> still wrongly required.
> 
> Copy allarch.bbclass to allarch-enabled.bbclass and only inherit
> allarch-enabled.bbclass when multilib is not used.
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/classes/allarch-enabled.bbclass | 52 ++++++++++++++++++++++++++++++++++++
>  meta/classes/allarch.bbclass         | 51 ++---------------------------------
>  meta/classes/icecc.bbclass           |  2 +-
>  meta/classes/multilib.bbclass        |  2 +-
>  meta/classes/multilib_global.bbclass |  2 +-
>  meta/classes/package.bbclass         |  6 ++---
>  6 files changed, 60 insertions(+), 55 deletions(-)
>  create mode 100644 meta/classes/allarch-enabled.bbclass
> 
> 
> diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
> index 1eebe0bf2e7..0eca076df0b 100644
> --- a/meta/classes/allarch.bbclass
> +++ b/meta/classes/allarch.bbclass
> @@ -1,52 +1,5 @@
>  #
> -# This class is used for architecture independent recipes/data files (usually scripts)
> +# This class enables allarch only when multilib is not used.
>  #
>  
> -PACKAGE_ARCH = "all"
> -
> -python () {
> -    # Allow this class to be included but overridden - only set
> -    # the values if we're still "all" package arch.
> -    if d.getVar("PACKAGE_ARCH") == "all":
> -        # No need for virtual/libc or a cross compiler
> -        d.setVar("INHIBIT_DEFAULT_DEPS","1")
> -
> -        # Set these to a common set of values, we shouldn't be using them other that for WORKDIR directory
> -        # naming anyway
> -        d.setVar("baselib", "lib")
> -        d.setVar("TARGET_ARCH", "allarch")
> -        d.setVar("TARGET_OS", "linux")
> -        d.setVar("TARGET_CC_ARCH", "none")
> -        d.setVar("TARGET_LD_ARCH", "none")
> -        d.setVar("TARGET_AS_ARCH", "none")
> -        d.setVar("TARGET_FPU", "")
> -        d.setVar("TARGET_PREFIX", "")
> -        # Expand PACKAGE_EXTRA_ARCHS since the staging code needs this
> -        # (this removes any dependencies from the hash perspective)
> -        d.setVar("PACKAGE_EXTRA_ARCHS", d.getVar("PACKAGE_EXTRA_ARCHS"))
> -        d.setVar("SDK_ARCH", "none")
> -        d.setVar("SDK_CC_ARCH", "none")
> -        d.setVar("TARGET_CPPFLAGS", "none")
> -        d.setVar("TARGET_CFLAGS", "none")
> -        d.setVar("TARGET_CXXFLAGS", "none")
> -        d.setVar("TARGET_LDFLAGS", "none")
> -        d.setVar("POPULATESYSROOTDEPS", "")
> -
> -        # Avoid this being unnecessarily different due to nuances of
> -        # the target machine that aren't important for "all" arch
> -        # packages.
> -        d.setVar("LDFLAGS", "")
> -
> -        # No need to do shared library processing or debug symbol handling
> -        d.setVar("EXCLUDE_FROM_SHLIBS", "1")
> -        d.setVar("INHIBIT_PACKAGE_DEBUG_SPLIT", "1")
> -        d.setVar("INHIBIT_PACKAGE_STRIP", "1")
> -
> -        # These multilib values shouldn't change allarch packages so exclude them
> -        d.appendVarFlag("emit_pkgdata", "vardepsexclude", " MULTILIB_VARIANTS")
> -        d.appendVarFlag("write_specfile", "vardepsexclude", " MULTILIBS")
> -        d.appendVarFlag("do_package", "vardepsexclude", " package_do_shlibs")
> -    elif bb.data.inherits_class('packagegroup', d) and not bb.data.inherits_class('nativesdk', d):
> -        bb.error("Please ensure recipe %s sets PACKAGE_ARCH before inherit packagegroup" % d.getVar("FILE"))
> -}
> -
> +inherit ${@oe.utils.ifelse(d.getVar('MULTILIB_VARIANTS'), '', 'allarch-enabled')}

Firstly, whilst I do understand why you've made this change like this,
I don't really like one line classes which clutter up the classes
directory. Using inherit like this does force the expansion of the
variable early and is very prone to "race" conditions. The above is
safe but see below. 

FWIW the original code tried to switch off the value of the
PACKAGE_ARCH variable. If we change the way we enable/disable the code,
we should consider whether we can consistently use one mechanism for
both.

Secondly, does this change affect the behaviour of nativesdk?

I think this will disable allarch for nativesdk in any multilib build
and we don't want to do that, we only have a problem with target
multilib allarch.

At a guess you probably need to check class-target is in overrides and
multilib_variants is set? The problem could be that class-target is set
comparatively late and then we're into ordering issues.

I do want to get the nativesdk issue fixed before we merge this though.

Cheers,

Richard

