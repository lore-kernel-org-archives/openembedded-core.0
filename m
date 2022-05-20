Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A864C433F5
	for <webhook@archiver.kernel.org>; Fri, 20 May 2022 22:02:20 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web09.3399.1653084137387381151
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 May 2022 15:02:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QNk8j12D;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id
 p5-20020a1c2905000000b003970dd5404dso5045994wmp.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 20 May 2022 15:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=kyEDMCiYfoqqg4LmRYTPFj6Gf5iKDPlFDutvrnLUt+Y=;
        b=QNk8j12DjqX6rCgz/2K0D9DT0qRX/guCjc4WufwA0b/tVPSN3GnfYvNGCYnqJAMldU
         Mx5W+CHnZcGtApdFu8YDfdUDOhXF6+oivsIKNWUwNOr2NFdns/M0qaeBb2lIhhcPIKwt
         +ITC+NOQI6aO+P1HQIaadWtUI6OtFxbQKtxfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=kyEDMCiYfoqqg4LmRYTPFj6Gf5iKDPlFDutvrnLUt+Y=;
        b=2/bL85D7kKSZsrGLXAK18rQ6gRjLFB0TiklOv/J7nzAJyaknp6AKgk8ftfwj3mTWgT
         4UKMpWJOIGK+43WV+xahuFfpeqtkSmOxFuDV4dawZ9jll6POFZY/sJphsHDwJXkP/yrE
         wxKVik8+dwGEdKCMvYeLsg85OnAMoEGL1WG5ImJan3SeKNXiYAVEz3Z+XlDuMvHOqu0H
         WuHG9mEPMTZrysq8+JRv4Pv28iwtSMycI1eWB3reZNJ74y19r+rMz3rrp71Gb4xtJlQ3
         x5BgtH79DgyH/fZ6X0p+cKEmY98zBE9T2WYKL6t+mHtGCkqJerzDOLGY5IsrHIL5pd/w
         vK0Q==
X-Gm-Message-State: AOAM532UfIkaPt20sL1FfeMg9VDAv5hhOnOEIGm7IDX3yjE2kebTsx9X
	/yl7+bxMF6wrD7+PCYVeLLYbFg==
X-Google-Smtp-Source: 
 ABdhPJwkMHKyfLHasv4Hq0rfqdyI/beDWOwqVPp4AjQFSWMkuUJVHPbXkjpCGPe1n11n4zJsPzcxXw==
X-Received: by 2002:a05:600c:2b89:b0:397:330f:a5e8 with SMTP id
 j9-20020a05600c2b8900b00397330fa5e8mr7985717wmc.150.1653084135956;
        Fri, 20 May 2022 15:02:15 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d812:46de:9e00:ca1c?
 ([2001:8b0:aba:5f3c:d812:46de:9e00:ca1c])
        by smtp.gmail.com with ESMTPSA id
 g10-20020adfa58a000000b0020e60baffd1sm150835wrc.52.2022.05.20.15.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 May 2022 15:02:15 -0700 (PDT)
Message-ID: 
 <b7357d18166022d50cb688d03bf076bd39d79fb6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH V4] meta: rust - Bug fix for target
 definitions returning 'NoneType' for arm
From: richard.purdie@linuxfoundation.org
To: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>,
	openembedded-core@lists.openembedded.org, alex.kanavin@gmail.com
Cc: rwmacleod@gmail.com, umesh.kalappa0@gmail.com, pgowda.cve@gmail.com,
	shivams@gmail.com
Date: Fri, 20 May 2022 23:02:14 +0100
In-Reply-To: <16F0CB5E9328617C.25584@lists.openembedded.org>
References: <20220513055923.170822-1-sundeep.kokkonda@gmail.com>
	 <8c7e147c519b05f1983605f5c9ce522fcd12a2a4.camel@linuxfoundation.org>
	 <3d452ba4-529a-26d4-443c-dbfcb84d85b2@gmail.com>
	 <16F0C7AB36B6A2B7.30875@lists.openembedded.org>
	 <16F0CB5E9328617C.25584@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 May 2022 22:02:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165954

On Fri, 2022-05-20 at 12:04 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Fri, 2022-05-20 at 10:56 +0100, Richard Purdie via
> lists.openembedded.org wrote:
> > Let me jump in and explain a bit about what I think we need to do here
> > to move forward.
> >=20
> > With the patch in this series applied, "oe-selftest -r
> > sstatetests.SStateTests.test_sstate_allarch_samesigs" fails. Looking at
> > the test, it sets two different MACHINE values, "qemuarm" and "qemux86-
> > 64". Lets see if we can get more information about what is going on.
> >=20
> > With MACHINE =3D "qemux86-64", I run:
> >=20
> > bitbake adwaita-icon-theme rust-native cargo-native -S none
> >=20
> > (since adwaita-icon-theme is what is changing when it shouldn't and we
> > suspect a problem with rust-native and cargo-native).
> >=20
> > This generates a locked-sigs.inc, lets move that to a different
> > location:
> >=20
> > mv locked-sigs.inc locked-sigs2.inc
> >=20
> > Now with MACHINE =3D "qemuarm", I run:
> >=20
> > bitbake adwaita-icon-theme rust-native cargo-native -S none
> >=20
> > and we get another locked-sigs.inc.
> >=20
> > Comparing locked-sigs.inc with locked-sigs2.inc is revealing. I like:
> >=20
> > meld locked-sigs.inc locked-sigs2.inc
> >=20
> > but you could use diff too or whatever way you prefer to view
> > differences.
> >=20
> > adwaita-icon-theme is changing, there are a load of changes from
> > SIGGEN_LOCKEDSIGS_t-core2-64 to SIGGEN_LOCKEDSIGS_t-cortexa15t2hf-neon
> > which isn't surprising. You can see binutils-cross-arm becoming
> > binutils-cross-x86_64 which again, isn't surprising. cargo-native
> > changes which is a worry. rust-native also changes and is the likely
> > cause of our issues, it is furthest down the dependency stack. The
> > tasks which change are:
> >=20
> >     rust-native:do_build
> >     rust-native:do_compile
> >     rust-native:do_install
> >     rust-native:do_populate_sysroot
> >     rust-native:do_rust_gen_targets
> >=20
> > and since the patch is changing do_rust_gen_targets, that is likely our
> > problem.
> >=20
> > Now we've proven that the signature of that task changes between these
> > two different configs, we need to investigate what the issue is there
> > and bitbake-diffsigs can likely help with that. The idea is that the
> > native recipes should be independent of the target machine choice so
> > that is the issue which now needs to be fixed.
> >=20
> > I did notice that if you compare qemux86-64 with qemuarm64, you don't
> > see this issue, it only happens with qemuarm. This probably means that
> > some 32 vs 64 bit issue is happening in rust-native.
> >=20
> > Note I did all of this without actually building anything, just some
> > recipe parses to dump the signatures.
> >=20
> > Does that help move things forward with the issue?
>=20
> Since I now had the environment, I help but complete this (taking the
> hashes from the difference between the locked-sigs diff):
>=20
> $ bitbake-diffsigs tmp/stamps/x86_64-linux/rust-native/1.60.0-r0.do_rust_=
gen_targets.sigdata.63* tmp/stamps/x86_64-linux/rust-native/1.60.0-r0.do_ru=
st_gen_targets.sigdata.34*
> NOTE: Starting bitbake server...
> basehash changed from 860b8f11b10182dc5b2737f62cdb697477f714adb63eeb4d4b9=
32d67cac8eec2 to 9379e8b9df9696e8056fec7d1534661f34dda073f6d816e241b09a2dff=
76ae2d
> Variable rust_base_triple value changed:
> @@ -36,4 +36,4 @@
> =20
> =20
>  # In some cases uname and the toolchain differ on their idea of the arch=
 name
> -TUNE_FEATURES{callconvention-hard} =3D Set
> +TUNE_FEATURES{callconvention-hard} =3D Unset
>=20
> The question now becomes how to fix that since I doubt rust-native
> really does depend on that.

The fix is probably this:

diff --git a/meta/classes/rust-common.bbclass b/meta/classes/rust-common.bb=
class
index 02a538258af..cb811ac5da7 100644
--- a/meta/classes/rust-common.bbclass
+++ b/meta/classes/rust-common.bbclass
@@ -117,8 +117,11 @@ RUST_BUILD_ARCH =3D "${@oe.rust.arch_to_rust_arch(d.ge=
tVar('BUILD_ARCH'))}"
 # its likely best to not use the triple suffix due to potential confusion.
=20
 RUST_BUILD_SYS =3D "${@rust_base_triple(d, 'BUILD')}"
+RUST_BUILD_SYS[vardepvalue] =3D "${RUST_BUILD_SYS}"
 RUST_HOST_SYS =3D "${@rust_base_triple(d, 'HOST')}"
+RUST_HOST_SYS[vardepvalue] =3D "${RUST_HOST_SYS}"
 RUST_TARGET_SYS =3D "${@rust_base_triple(d, 'TARGET')}"
+RUST_TARGET_SYS[vardepvalue] =3D "${RUST_TARGET_SYS}"
=20
 # wrappers to get around the fact that Rust needs a single
 # binary but Yocto's compiler and linker commands have


which makes the sstate signatures depend on the determined values
rather than the ingredients in them (which is usually what we want but
not here).

Cheers,

Richard

