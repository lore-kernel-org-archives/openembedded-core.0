Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC827FF885C
	for <webhook@archiver.kernel.org>; Sun, 26 Apr 2026 07:28:46 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13498.1777188517144804906
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Apr 2026 00:28:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nYLA1K7D;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so106856965e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Apr 2026 00:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777188515; x=1777793315; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xdAn1/QXqPIpLe2vthLe/bqfkGoqDgxZshb/NhKaZg8=;
        b=nYLA1K7D2W9KYWaQMoaWsaKJ/sVtYaXhK77nyDYjDxFhdTLXAPHpIjt1NJ1qMrzkDs
         EzCL9EIJy2HaFURCdVRW6UeqkqEFCl4dl+AHmX3rjOU3oQF4k+mswT5bU//VsgRPY2Sq
         svH8cjV9bJJmad+O2djHF4/iT9f9UjKPxY/Hyq477Zbqr7WoLRzMoh3a9zx2kVygf6/x
         L2H3jJhbPvUjlvwgzJRp9nEGP+g8sQWlDBddkWEvfUxnkULuMh0G81N2DWSb7Bnxrrfu
         oEwRPIn4IlooWxtekpNAjNGl8L9NhQCKNkFF6CR3Z7KphOmRemea3yRBwc1V50+qbwPq
         2kiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777188515; x=1777793315;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xdAn1/QXqPIpLe2vthLe/bqfkGoqDgxZshb/NhKaZg8=;
        b=PDfyJmE6bDiRh/eBCZ94aj3Sb2pwC7SkHzyVdTDiZiNvonaEsYCGarPMlVm2sePFCf
         vwh2A7pOUspql9OnoLSUybIGT0FKkOUyD3/6bazlJPiGvm0RitaSdr6GQWoMIvEot1l+
         JxyGJPaGsJrF5FyiGSjup/RFebp7++yk6brfXX5Q1vLZcb47GNfn7rNXL/Z90zmbN4od
         ausyFWIYzMPzjL+/mS+oN4XDh+sbYzR3H7E790ox5djxLuqgdhfWXE6gX0RjmNO0rYxF
         /keQXRjsc8RszLsfYtSYqFtjbV7QtRyfVawbrjBQKl6sxnZnf4AFbNKf/7XwknjEBzfA
         gN0Q==
X-Forwarded-Encrypted: i=1; AFNElJ9qatt68bfkrdsJSplmU3Xg/9QEJ8QB3w87RUWGeIUrHiahf0LT81bWd0hdes2UQJcFaSn+b7qfK5VPqaPq24bRxw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw4IpZE637mdpSrC4KhjuEBDLmgorOVne9ZHVcBlZZ4vSeBNBfI
	tK7nVkm6kaIUnMrgGVGXehLdPD0DbtClp6vfhqeQ5W9HxA1xmQEFiuJ/
X-Gm-Gg: AeBDieuXz8yg/yZNqV87Xth2UUdkTwkqa+YAS8w0/ww/C5cp/eOs5Y8MMDMJ6rL5R+u
	YAKDorFcyzKQIQ4zpg4MBtzCPAYcv7XKqKf8MSNim4n7Jrax0s558l2YWH0NvTRBlBR5o6uH/qC
	J/UpQQIp1ddbjU0wsFXJQlLI0bgKqUxNdMatJ0YFENqQ3GEqvMp90cwV9sKrt9eNJHb3MSDJWeW
	xTVPP1PhlDNWhKhtOYUddmn6K3XPTq1KtQtqEfOuJdgv9p9YE+S8EXixuBaXNCFKe1gkAv4GETB
	WH/zAKbWvDrao7JabUPVdo5V0r6DLlwXFFjHdKQGlQUEs+nr/LmikSMu+tim8fT2beKPKo4/KpL
	Lsd3Zod4g+NnpO8T76VXtUVNmnFjUIKsJKSy48lfZTeRTS2uKWVCRdQvfInce6A+hCTfFvdP7kQ
	a02UYVT1iPHMg5y8I1rcCG53GTRIVpaDTkkC9knDSZEWIkR3DAEXJMa1UtCtER3Df0Sisa1BBTu
	sw=
X-Received: by 2002:a05:600c:34d3:b0:489:1cda:bbb7 with SMTP id 5b1f17b1804b1-4891cdabf13mr384112705e9.25.1777188515210;
        Sun, 26 Apr 2026 00:28:35 -0700 (PDT)
Received: from [192.168.2.123] (95C81E23.dsl.pool.telekom.hu. [149.200.30.35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a5aa3ae83sm621663695e9.12.2026.04.26.00.28.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Apr 2026 00:28:34 -0700 (PDT)
Message-ID: <822efc1b-68ff-4d95-adbf-15576b653a55@gmail.com>
Date: Sun, 26 Apr 2026 09:28:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/2] base/bitbake.conf: Rework DISTRO_FEATURES
 and MACHINE_FEATURES default handling
To: richard.purdie@linuxfoundation.org,
 openembedded-core@lists.openembedded.org
References: <20260423133340.1954703-1-richard.purdie@linuxfoundation.org>
 <20260423133340.1954703-2-richard.purdie@linuxfoundation.org>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <20260423133340.1954703-2-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Apr 2026 07:28:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235951

Hi,

I found via git bisect that this breaks my builds.

It breaks two things:

1.

With DISTRO_FEATURES containing seccomp (e.g. when using
meta-virtualization and/or meta-security), this libseccomp-native
is not found by gnutls-native anymore. Sure enough, the libseccomp
recipe does not have BBCLASSEXTEND = "native nativesdk" like
gnutls has. So this change has at least some good points to
point out pre-existing issues.

2.

A circular dependency occurs:

ERROR: Task 
virtual:native:/mnt2/zozo/yocto-6.0-arm/conf/../layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_create_recipe_spdx 
has circular dependency on 
/mnt2/zozo/yocto-6.0-arm/conf/../layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb:do_create_recipe_spdx
ERROR: Command execution failed: Exited with 1

Adding INHERIT += "nospdx" does not fix this and none of
the layers have any bbappend that would explain this.

Using the preceding commit fixes the build even without adding
the necessary BBCLASSEXTEND incantation to libseccomp.

2026. 04. 23. 15:33 keltezéssel, Richard Purdie via lists.openembedded.org írta:
> The existing code for handling defaults in distro/machine features
> triggers from anonymous python in base.bbclass.
>
> Anonymous python is executed after all inherits including deferred inherits
> are processed. This means conditional inherits can't use DISTRO_FEATURES
> or MACHINE_FEATURES which is contra to user expectations. This leads to
> a hard to understand failure mode.
>
> Whilst it isn't as performant, we can handle the features using inline
> python function calls. This patch switches to execute the code that way.
>
> These changes depend on a new function in bb.utils (filter_string).
> filter_default_features is changed to return a string rather than
> set it and the tests for it are updated to match.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/classes-global/base.bbclass            |  5 -----
>   meta/classes-recipe/crosssdk.bbclass        |  9 ++-------
>   meta/classes-recipe/native.bbclass          |  9 ++-------
>   meta/classes-recipe/nativesdk.bbclass       |  9 ++-------
>   meta/conf/bitbake.conf                      |  4 ++--
>   meta/lib/oe/utils.py                        |  7 ++++++-
>   meta/lib/oeqa/selftest/cases/oelib/utils.py | 16 ++++++++--------
>   7 files changed, 22 insertions(+), 37 deletions(-)
>
> diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
> index 76fd0ac046a..f2e8326e39a 100644
> --- a/meta/classes-global/base.bbclass
> +++ b/meta/classes-global/base.bbclass
> @@ -454,11 +454,6 @@ def set_packagetriplet(d):
>   python () {
>       import string, re
>   
> -    # Filter default features to allow users to opt out of features they don't
> -    # want.
> -    oe.utils.filter_default_features("DISTRO_FEATURES", d)
> -    oe.utils.filter_default_features("MACHINE_FEATURES", d)
> -
>       # To add a recipe to the skip list , set:
>       #   SKIP_RECIPE[pn] = "message"
>       pn = d.getVar('PN')
> diff --git a/meta/classes-recipe/crosssdk.bbclass b/meta/classes-recipe/crosssdk.bbclass
> index dac18b39edb..f7be3a23bf6 100644
> --- a/meta/classes-recipe/crosssdk.bbclass
> +++ b/meta/classes-recipe/crosssdk.bbclass
> @@ -16,13 +16,8 @@ PACKAGE_ARCH = "${SDK_ARCH}"
>   python () {
>       # set TUNE_PKGARCH to SDK_ARCH
>       d.setVar('TUNE_PKGARCH', d.getVar('SDK_ARCH'))
> -    # Set features here to prevent DISTRO_FEATURES modifications from affecting
> -    # crosssdk distro features
> -    features = set(d.getVar("DISTRO_FEATURES_NATIVESDK").split())
> -    oe.utils.filter_default_features("DISTRO_FEATURES", d)
> -    filtered = set(bb.utils.filter("DISTRO_FEATURES", d.getVar("DISTRO_FEATURES_FILTER_NATIVESDK"), d).split())
> -    d.setVar("DISTRO_FEATURES", " ".join(sorted(features | filtered)))
> -    d.setVar("DISTRO_FEATURES_DEFAULTS", "")
> +    defaults = d.getVar("DISTRO_FEATURES")
> +    d.setVar("DISTRO_FEATURES", '${@oe.utils.class_filter_features("' + defaults + '", "DISTRO_FEATURES_NATIVESDK", "DISTRO_FEATURES_FILTER_NATIVESDK", d)}')
>   }
>   
>   STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
> diff --git a/meta/classes-recipe/native.bbclass b/meta/classes-recipe/native.bbclass
> index 9f4ca170f76..89d862eb55a 100644
> --- a/meta/classes-recipe/native.bbclass
> +++ b/meta/classes-recipe/native.bbclass
> @@ -126,13 +126,8 @@ python native_virtclass_handler () {
>           return
>       bpn = d.getVar("BPN")
>   
> -    # Set features here to prevent DISTRO_FEATURES modifications from affecting
> -    # native distro features
> -    features = set(d.getVar("DISTRO_FEATURES_NATIVE").split())
> -    oe.utils.filter_default_features("DISTRO_FEATURES", d)
> -    filtered = set(bb.utils.filter("DISTRO_FEATURES", d.getVar("DISTRO_FEATURES_FILTER_NATIVE"), d).split())
> -    d.setVar("DISTRO_FEATURES", " ".join(sorted(features | filtered)))
> -    d.setVar("DISTRO_FEATURES_DEFAULTS", "")
> +    defaults = d.getVar("DISTRO_FEATURES")
> +    d.setVar("DISTRO_FEATURES", '${@oe.utils.class_filter_features("' + defaults + '", "DISTRO_FEATURES_NATIVE", "DISTRO_FEATURES_FILTER_NATIVE", d)}')
>   
>       classextend = d.getVar('BBCLASSEXTEND') or ""
>       if "native" not in classextend:
> diff --git a/meta/classes-recipe/nativesdk.bbclass b/meta/classes-recipe/nativesdk.bbclass
> index 80f716fc3c3..25fd463ac78 100644
> --- a/meta/classes-recipe/nativesdk.bbclass
> +++ b/meta/classes-recipe/nativesdk.bbclass
> @@ -77,13 +77,8 @@ python nativesdk_virtclass_handler () {
>       if not (pn.endswith("-nativesdk") or pn.startswith("nativesdk-")):
>           return
>   
> -    # Set features here to prevent DISTRO_FEATURES modifications from affecting
> -    # nativesdk distro features
> -    features = set(d.getVar("DISTRO_FEATURES_NATIVESDK").split())
> -    oe.utils.filter_default_features("DISTRO_FEATURES", d)
> -    filtered = set(bb.utils.filter("DISTRO_FEATURES", d.getVar("DISTRO_FEATURES_FILTER_NATIVESDK"), d).split())
> -    d.setVar("DISTRO_FEATURES", " ".join(sorted(features | filtered)))
> -    d.setVar("DISTRO_FEATURES_DEFAULTS", "")
> +    defaults = d.getVar("DISTRO_FEATURES")
> +    d.setVar("DISTRO_FEATURES", '${@oe.utils.class_filter_features("' + defaults + '", "DISTRO_FEATURES_NATIVESDK", "DISTRO_FEATURES_FILTER_NATIVESDK", d)}')
>   
>       e.data.setVar("MLPREFIX", "nativesdk-")
>       e.data.setVar("PN", "nativesdk-" + e.data.getVar("PN").replace("-nativesdk", "").replace("nativesdk-", ""))
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 9fcd16615db..24e095632e9 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -893,10 +893,10 @@ OES_BITBAKE_CONF = "1"
>   # Machine properties and packagegroup-base stuff
>   ##################################################################
>   
> -MACHINE_FEATURES ?= ""
> +MACHINE_FEATURES:append = " ${@oe.utils.filter_default_features('MACHINE_FEATURES', d)}"
>   SDK_MACHINE_FEATURES ?= ""
>   
> -DISTRO_FEATURES ?= ""
> +DISTRO_FEATURES:append = " ${@oe.utils.filter_default_features('DISTRO_FEATURES', d)}"
>   
>   DISTRO_EXTRA_RDEPENDS ?= ""
>   DISTRO_EXTRA_RRECOMMENDS ?= ""
> diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
> index ed5dd5f4504..23f4b639c69 100644
> --- a/meta/lib/oe/utils.py
> +++ b/meta/lib/oe/utils.py
> @@ -154,7 +154,12 @@ def filter_default_features(varname, d):
>       default_features = set_difference(varname + "_DEFAULTS",
>                                         varname + "_OPTED_OUT",
>                                         d)
> -    d.appendVar(varname, " " + default_features)
> +    return default_features
> +
> +def class_filter_features(defaults, features_var, filter_var, d):
> +    features = set(d.getVar(features_var).split())
> +    filtered = set(bb.utils.filter_string(defaults, d.getVar(filter_var)).split())
> +    return " ".join(sorted(features | filtered))
>   
>   def all_distro_features(d, features, truevalue="1", falsevalue=""):
>       """
> diff --git a/meta/lib/oeqa/selftest/cases/oelib/utils.py b/meta/lib/oeqa/selftest/cases/oelib/utils.py
> index a72a0f5983f..75c69789a5b 100644
> --- a/meta/lib/oeqa/selftest/cases/oelib/utils.py
> +++ b/meta/lib/oeqa/selftest/cases/oelib/utils.py
> @@ -115,26 +115,26 @@ class TestDefaultFeatures(TestCase):
>           # Test with nothing opted out
>           d.setVar("DISTRO_FEATURES", "")
>           d.setVar("DISTRO_FEATURES_DEFAULTS", "alpha beta gamma")
> -        filter_default_features("DISTRO_FEATURES", d)
> -        self.assertEqual(d.getVar("DISTRO_FEATURES").strip(), "alpha beta gamma")
> +        filtered = filter_default_features("DISTRO_FEATURES", d)
> +        self.assertEqual(filtered.strip(), "alpha beta gamma")
>   
>           # opt out of a single feature
>           d.setVar("DISTRO_FEATURES", "")
>           d.setVar("DISTRO_FEATURES_DEFAULTS", "alpha beta gamma")
>           d.setVar("DISTRO_FEATURES_OPTED_OUT", "beta")
> -        filter_default_features("DISTRO_FEATURES", d)
> -        self.assertEqual(d.getVar("DISTRO_FEATURES").strip(), "alpha gamma")
> +        filtered = filter_default_features("DISTRO_FEATURES", d)
> +        self.assertEqual(filtered.strip(), "alpha gamma")
>   
>           # opt out of everything
>           d.setVar("DISTRO_FEATURES", "")
>           d.setVar("DISTRO_FEATURES_DEFAULTS", "alpha beta gamma")
>           d.setVar("DISTRO_FEATURES_OPTED_OUT", "gamma alpha beta")
> -        filter_default_features("DISTRO_FEATURES", d)
> -        self.assertEqual(d.getVar("DISTRO_FEATURES").strip(), "")
> +        filtered = filter_default_features("DISTRO_FEATURES", d)
> +        self.assertEqual(filtered.strip(), "")
>   
>           # opt out of something that isn't in our defaults
>           d.setVar("DISTRO_FEATURES", "")
>           d.setVar("DISTRO_FEATURES_DEFAULTS", "alpha beta gamma")
>           d.setVar("DISTRO_FEATURES_OPTED_OUT", "omega")
> -        filter_default_features("DISTRO_FEATURES", d)
> -        self.assertEqual(d.getVar("DISTRO_FEATURES").strip(), "alpha beta gamma")
> +        filtered = filter_default_features("DISTRO_FEATURES", d)
> +        self.assertEqual(filtered.strip(), "alpha beta gamma")
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#235771): https://lists.openembedded.org/g/openembedded-core/message/235771
> Mute This Topic: https://lists.openembedded.org/mt/118971570/3617728
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [zboszor@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


