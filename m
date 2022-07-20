Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 161C4C433EF
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 18:26:54 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.778.1658341604944432353
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 11:26:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BRsUJwOu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id
 b21-20020a05600c4e1500b003a32bc8612fso1299309wmq.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 11:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=NCptICCQPOqCAKzoNlfL438pKmHNw8W1wMtFPH9C3LY=;
        b=BRsUJwOusP/xXUh8xNuVLBgL+PI5dbvhpsosDiAWeVuia06TRrV+aqCkqXl7PKcV5B
         ZbT+EGNBUYPnMAiLTfEjjjoULk1vej7tVDnKf/Oz0166BiPYzW6b02/X4VkrTJLVdutW
         L9NgZzd5uCe3qKGX2IHoRSlYSJeMxx2+uXcSk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=NCptICCQPOqCAKzoNlfL438pKmHNw8W1wMtFPH9C3LY=;
        b=fgObFBGo/k6Itn8hCCOyorp3az+Ominpc8J0tu10nG2jUXAiXCb1lGDSy9x9Pnseyi
         q1fQvdGwU7ES2OqQhCOdUYmucwYp6i6q6AcPh/EgblGbNizpOiJGgkdRxjsjhxKETTZW
         FlLVFFUeW8UOPI68LQjT7YDidOElxsUtSOD9DrPxXyQp42aTkJXReFTn0m02RcwyvGfc
         mMKJyfZvI780OhvQElNtSncSPltJBDCzZXQLUR/aYv6lJkMxyYSnVOym2WHk6HHb7fKp
         XoMv1COFBteEOdeVUy/DD8RMCRxTFNg0LPY0ciFOVRSdA9HGTUqJJcl6dpuVQ1F99NeE
         eSiQ==
X-Gm-Message-State: AJIora8nuWcpXlpQNyG41t7hHn3SEvovlLqG5UWHCL56MB4BJ5wQMW4t
	CBfeLLwUWAG2eNaaVJKHdbUvWA==
X-Google-Smtp-Source: 
 AGRyM1umluwtZx93+a2kfPyOT4N3lCdhnXSxgI5Z0PnpQEhvIqECcbfEAlV8/6mhb12fUVQIk0STJw==
X-Received: by 2002:a7b:ce0a:0:b0:3a3:1adf:af34 with SMTP id
 m10-20020a7bce0a000000b003a31adfaf34mr4924800wmc.127.1658341602924;
        Wed, 20 Jul 2022 11:26:42 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:feec:14a3:c5ce:5d56?
 ([2001:8b0:aba:5f3c:feec:14a3:c5ce:5d56])
        by smtp.gmail.com with ESMTPSA id
 j17-20020adfd211000000b002185631adf0sm16000267wrh.23.2022.07.20.11.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 11:26:42 -0700 (PDT)
Message-ID: 
 <25c967efe6c74aa9c0a3bcc71a90f59bfd1ac59a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 2/2] cargo-cross-canadian: Use SDK's flags
 during target linking
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Khem Raj <raj.khem@gmail.com>, Otavio Salvador
 <otavio@ossystems.com.br>,  Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Jul 2022 19:26:41 +0100
In-Reply-To: 
 <CAP9ODKpcXKzG_kw4OgdPnZx51eBDKqq45XuCQFXKfD839qpruw@mail.gmail.com>
References: <20220710164300.953098-1-otavio@ossystems.com.br>
	 <20220710164300.953098-2-otavio@ossystems.com.br>
	 <e642480e892b0b411acb509c0de11aa7e52d4412.camel@linuxfoundation.org>
	 <CAP9ODKooHNY8GyNuY8hDHyscEAJJfCfTXdThVMQW5TOGnjOZxw@mail.gmail.com>
	 <8e065ede6abdb6065c862bd8b25cdccf2b6828a8.camel@linuxfoundation.org>
	 <CAP9ODKp1_CV4N-RB+NR4nTdvVgSR=pu6V7q2T2sQ8Pu8w=Ew2g@mail.gmail.com>
	 <bba9495ce38c56f914c391f054ce2bd77f2bef55.camel@linuxfoundation.org>
	 <CAP9ODKrTbdjMOK5scpWEeh2Fdk0gt4XTdsVR0MLTb7GKEfpKJw@mail.gmail.com>
	 <06a78e1a344f8ee4dbf696b56756781a65463f1f.camel@linuxfoundation.org>
	 <CAP9ODKp+WkU-+41q39_R6S8UsraOPn-0KbTuQjaHToqumwn-0g@mail.gmail.com>
	 <5937fc9b1b2507727cc838a6ba3ad13a9bd47fe2.camel@linuxfoundation.org>
	 <CAP9ODKpcXKzG_kw4OgdPnZx51eBDKqq45XuCQFXKfD839qpruw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 18:26:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168372

On Wed, 2022-07-20 at 15:11 -0300, Otavio Salvador wrote:
>=20
>=20
> Em qua., 20 de jul. de 2022 =C3=A0s 14:21, Richard Purdie
> <richard.purdie@linuxfoundation.org> escreveu:
> > I've done a bit more work on this and the more I dig, the more I
> > think
> > we have some issues we need to sort with taking a step back and
> > checking some assumptions.
> >=20
> > What I'm lacking is a good way to test the resulting rust
> > toolchain.
> > Would someone with some rust knowledge be able to add something to
> > meta/lib/oeqa/sdk/cases/ which tested rust in the SDK?
> >=20
> > If someone can add some rust tests in the SDK, I think I might have
> > an
> > idea of what the patches look like to properly fix the rust
> > toolchain
> > there.
> >=20
>=20
>=20
> Ok, I will send you a test case shortly.=C2=A0

Thanks.

Just to share what I'm thinking, I think we need to add a nativesdk to
llvm-rust like this:

diff --git a/meta/recipes-devtools/rust/rust-llvm.inc b/meta/recipes-devtoo=
ls/rust/rust-llvm.inc
index 9baad12dc8e..625eb570416 100644
--- a/meta/recipes-devtools/rust/rust-llvm.inc
+++ b/meta/recipes-devtools/rust/rust-llvm.inc
@@ -47,6 +47,13 @@ EXTRA_OECMAKE:append:class-target =3D "\
     -DLLVM_CONFIG_PATH=3D${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-confi=
g \
 "
=20
+EXTRA_OECMAKE:append:class-nativesdk =3D "\
+    -DCMAKE_CROSSCOMPILING:BOOL=3DON \
+    -DLLVM_BUILD_TOOLS=3DOFF \
+    -DLLVM_TABLEGEN=3D${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-tblgen \
+    -DLLVM_CONFIG_PATH=3D${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-confi=
g \
+"
+
 # The debug symbols are huge here (>2GB) so suppress them since they
 # provide almost no value. If you really need them then override this
 INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
@@ -68,4 +75,4 @@ FILES:${PN}-staticdev =3D+ "${libdir}/llvm-rust/*/*.a"
 FILES:${PN} +=3D "${libdir}/libLLVM*.so.* ${libdir}/llvm-rust/lib/*.so.* $=
{libdir}/llvm-rust/bin"
 FILES:${PN}-dev +=3D "${datadir}/llvm ${libdir}/llvm-rust/lib/*.so ${libdi=
r}/llvm-rust/include ${libdir}/llvm-rust/share ${libdir}/llvm-rust/lib/cmak=
e"
=20
-BBCLASSEXTEND =3D "native"
+BBCLASSEXTEND =3D "native nativesdk"

and then I think rust-cross-canadian can either copy in or create a
json file just like rust-cross does. Unlike gcc there is no target
specific cross compiler for rust as far as I can tell.

The crosssdk recipe also looks a bit suspect and I'm not sure that
entirely makes sense now or is needed. I guess it might be if we had
rust applications we needed to compile for the sdk itself but we don't
have any of those yet?

Cheers,

Richard



