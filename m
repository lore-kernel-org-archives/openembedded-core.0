Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13EA5C433FE
	for <webhook@archiver.kernel.org>; Fri, 20 May 2022 11:04:32 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.7306.1653044669732321181
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 May 2022 04:04:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ER11rF4/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id h14so11031093wrc.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 20 May 2022 04:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=QSy+dQ8qMYMwhUuehKGvW2ZXCxl1OibispYyLYqTGDw=;
        b=ER11rF4/Bxyk9a6iVxCDnP6gZwUtC1R54nLiKMAaK69JL1TjeK8egofCfyNYrF4TgN
         gi4gykBIVTqNcSoJ9vx+GUXdHvttdRG/8YMD0gFrrhHMGukJAlfSCihZLshSRSXZK88V
         yHxUwe17xupJz4IjBRTjQbRoup/HjnK6SBt1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=QSy+dQ8qMYMwhUuehKGvW2ZXCxl1OibispYyLYqTGDw=;
        b=g3GsvxTew0aEiEwyytgFpxPIid00u2eWgHCa1knHF+mvFauWPdaKLw9H6wUeGPRg1W
         fYvyFtuaN1wzurqTh8yXDTNj9AEWUHhF6kv8UgFyLhkkbnoFJMTGc3N/B2uJqV25ZAVO
         3jj1ipuiSkGAOc03cDlUOETgdwgDQ/s6HwJRUNJR64nLhWmZPYZuLF3MG0A4zuXkYDQc
         9f2iE5/JFYQSxH9IF+RWTQoUsPpT3lDq+l5TqMQWzYemZorkTCElBtPcyg6nGNO9NyFq
         gVQW8saem/h0g4mBOMxvSIp9fOCsTYUsBuJ//NE10Om98Ck1vbP4+kjRDMwd4GNXATht
         G7kw==
X-Gm-Message-State: AOAM533s0Y6k+R7uKtEnKZz7Ujf10SYocRJYgo0NjfRxvsf+ODMHHP0J
	OftQGX4+5Aep41ZoPCEZ9NbNBA==
X-Google-Smtp-Source: 
 ABdhPJweesKCha3yGpgw7IFhlhc6ECfoctVh/8g/KX7Fg2Y6DKN2WV3q3Rs0DVlIAVMa3k/zto6nsQ==
X-Received: by 2002:a5d:4e05:0:b0:20d:1f0:1f31 with SMTP id
 p5-20020a5d4e05000000b0020d01f01f31mr7933718wrt.492.1653044667895;
        Fri, 20 May 2022 04:04:27 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3966:e4e8:2da7:ee66?
 ([2001:8b0:aba:5f3c:3966:e4e8:2da7:ee66])
        by smtp.gmail.com with ESMTPSA id
 i30-20020adfaade000000b0020d0b60000csm2082442wrc.20.2022.05.20.04.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 May 2022 04:04:27 -0700 (PDT)
Message-ID: 
 <ed96b0a0dcc72e7982ee47c872cbab11a7e5a890.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH V4] meta: rust - Bug fix for target
 definitions returning 'NoneType' for arm
From: richard.purdie@linuxfoundation.org
To: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>,
	openembedded-core@lists.openembedded.org, alex.kanavin@gmail.com
Cc: rwmacleod@gmail.com, umesh.kalappa0@gmail.com, pgowda.cve@gmail.com,
	shivams@gmail.com
Date: Fri, 20 May 2022 12:04:24 +0100
In-Reply-To: <16F0C7AB36B6A2B7.30875@lists.openembedded.org>
References: <20220513055923.170822-1-sundeep.kokkonda@gmail.com>
	 <8c7e147c519b05f1983605f5c9ce522fcd12a2a4.camel@linuxfoundation.org>
	 <3d452ba4-529a-26d4-443c-dbfcb84d85b2@gmail.com>
	 <16F0C7AB36B6A2B7.30875@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 May 2022 11:04:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165924

On Fri, 2022-05-20 at 10:56 +0100, Richard Purdie via
lists.openembedded.org wrote:
> Let me jump in and explain a bit about what I think we need to do here
> to move forward.
>=20
> With the patch in this series applied, "oe-selftest -r
> sstatetests.SStateTests.test_sstate_allarch_samesigs" fails. Looking at
> the test, it sets two different MACHINE values, "qemuarm" and "qemux86-
> 64". Lets see if we can get more information about what is going on.
>=20
> With MACHINE =3D "qemux86-64", I run:
>=20
> bitbake adwaita-icon-theme rust-native cargo-native -S none
>=20
> (since adwaita-icon-theme is what is changing when it shouldn't and we
> suspect a problem with rust-native and cargo-native).
>=20
> This generates a locked-sigs.inc, lets move that to a different
> location:
>=20
> mv locked-sigs.inc locked-sigs2.inc
>=20
> Now with MACHINE =3D "qemuarm", I run:
>=20
> bitbake adwaita-icon-theme rust-native cargo-native -S none
>=20
> and we get another locked-sigs.inc.
>=20
> Comparing locked-sigs.inc with locked-sigs2.inc is revealing. I like:
>=20
> meld locked-sigs.inc locked-sigs2.inc
>=20
> but you could use diff too or whatever way you prefer to view
> differences.
>=20
> adwaita-icon-theme is changing, there are a load of changes from
> SIGGEN_LOCKEDSIGS_t-core2-64 to SIGGEN_LOCKEDSIGS_t-cortexa15t2hf-neon
> which isn't surprising. You can see binutils-cross-arm becoming
> binutils-cross-x86_64 which again, isn't surprising. cargo-native
> changes which is a worry. rust-native also changes and is the likely
> cause of our issues, it is furthest down the dependency stack. The
> tasks which change are:
>=20
>     rust-native:do_build
>     rust-native:do_compile
>     rust-native:do_install
>     rust-native:do_populate_sysroot
>     rust-native:do_rust_gen_targets
>=20
> and since the patch is changing do_rust_gen_targets, that is likely our
> problem.
>=20
> Now we've proven that the signature of that task changes between these
> two different configs, we need to investigate what the issue is there
> and bitbake-diffsigs can likely help with that. The idea is that the
> native recipes should be independent of the target machine choice so
> that is the issue which now needs to be fixed.
>=20
> I did notice that if you compare qemux86-64 with qemuarm64, you don't
> see this issue, it only happens with qemuarm. This probably means that
> some 32 vs 64 bit issue is happening in rust-native.
>=20
> Note I did all of this without actually building anything, just some
> recipe parses to dump the signatures.
>=20
> Does that help move things forward with the issue?

Since I now had the environment, I help but complete this (taking the
hashes from the difference between the locked-sigs diff):

$ bitbake-diffsigs tmp/stamps/x86_64-linux/rust-native/1.60.0-r0.do_rust_ge=
n_targets.sigdata.63* tmp/stamps/x86_64-linux/rust-native/1.60.0-r0.do_rust=
_gen_targets.sigdata.34*
NOTE: Starting bitbake server...
basehash changed from 860b8f11b10182dc5b2737f62cdb697477f714adb63eeb4d4b932=
d67cac8eec2 to 9379e8b9df9696e8056fec7d1534661f34dda073f6d816e241b09a2dff76=
ae2d
Variable rust_base_triple value changed:
@@ -36,4 +36,4 @@
=20
=20
 # In some cases uname and the toolchain differ on their idea of the arch n=
ame
-TUNE_FEATURES{callconvention-hard} =3D Set
+TUNE_FEATURES{callconvention-hard} =3D Unset

The question now becomes how to fix that since I doubt rust-native
really does depend on that.

Cheers,

Richard

