Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B258EDA686
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 15:37:49 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21407.1772552260567578748
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 07:37:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=U/ev5u0E;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-483770e0b25so49727505e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 07:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772552259; x=1773157059; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SUKRHSppPuEteJYO0pBZVfZW3D4vvzwgSWd+ss68kj4=;
        b=U/ev5u0EBo9ltYp8E9yRdYyVze7UziiEkksPht7V0L8hb9LAkhGj2Ap89v5LqNoAIu
         bpBhs+oHsUGyAkzQrtnjVL/tQxeUYSmXtk2qLDN3K5nZt342nmyj4T36XaWr4C//Xk+Y
         nDTQZBUTCce114spM1AEkjWDFz5cNWrsQkXm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772552259; x=1773157059;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SUKRHSppPuEteJYO0pBZVfZW3D4vvzwgSWd+ss68kj4=;
        b=DsW2ovqd4LY4Fvb0NhwioxVDnFb9Kbp23m4VoSurkSxorXyHq3vFb89gUNMts14k8o
         cWEonabMpEk+P2ThLPOEX6qC343e2CuGUpqhUreW8SBXk0ZllLpPx2+okwv1VRbVqwpJ
         vIAC65PCyomXxZmeGE3B4aUKUVtiUGXMWexmOeuUTDr805YwVazzdrBJ/5Ctaynb/1i3
         fLH8TNNbsf7W6yUX8px3ZiksoM2K179mNj3XvxM+4CaGP2jnKmwVcVniUrL6NRPFe6HI
         MjpIgPOqNkRbT6QgfOYJnd+vgEQn/4c/YUj7NjpySXwS/L0BEHWwVPgn2XXV5jhRfuOq
         5zaw==
X-Forwarded-Encrypted: i=1; AJvYcCWXvkkrGKQfEEsvUV08CjmeoyDS0rOJEmOlOajXGHvgYHdUp5eocDaT2DxMAMyr05ShYFBxmKhC3IC57TlFYci3tA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywh5IDlz4PBKQkwd07rJqOGFfSBvhUtAsvt72m4ghP688nosj3A
	219z/zb8wuO06daAO+ue/4InDGdGOxHq7Eu7TygcE7kIu9ia6ipyO3mTnrULXZ1jlvk=
X-Gm-Gg: ATEYQzwx1og07MeTQU06Er2Fyrhb8/19RpoQANPHap9KiQs+62PSLZl7yNuVO98mH2i
	qRwP7yJpsW0WwqYmjX8ytJP6wcpLiI5r911xcEkVYp+T1Gcz+VokvAVxfxCCn/ULGtMq6cs1lXw
	aV/eHncs085fKtlMgQuoNXJS+8oY9fKN7nT6pAbwjlFAXNwQbWc7n/H3sYm2U3h1n05gQd8MpXt
	tJDsuclt0eHOFi2mA2SgXjRzzxjSbFVRXIlBMIkm2/XzQE7OO7x+IQCmSBt0/RFE5fPJKwSUxaU
	p2/qsRuBCd9rG/upAHNYtZUXEjJHqOPGUmEXzVzzz5bx5zcNUG/xevv4R8oLwleU8FmNN/bthVf
	fYbXGJznF5AEhRbbJuqNpu3FHNhRGQedFHI0EfebG0+94+uyAbFNGLTPHcOQnsQRfUzxKhUJjjR
	mNzo/DFpmt05XDLou2yjHNUxpa6mfQr6s1PuqMkByUG9ioGHB88bn1oDtJbTQTj5Z/XncdtOVP7
	SGfNbZOToY=
X-Received: by 2002:a05:600c:3111:b0:483:78c5:d743 with SMTP id 5b1f17b1804b1-483c9c2baa9mr296427775e9.28.1772552258619;
        Tue, 03 Mar 2026 07:37:38 -0800 (PST)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851263e2e8sm36216275e9.2.2026.03.03.07.37.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 07:37:38 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 16:37:37 +0100
Message-Id: <DGT9C1GPMA9L.1Y99AUJX7G6YG@smile.fr>
To: <peter.marko@siemens.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][RFC PATCH 1/1] openssl: upgrade 3.2.6 ->
 3.5.4
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260123123336.41126-1-peter.marko@siemens.com>
 <20260123123336.41126-2-peter.marko@siemens.com>
In-Reply-To: <20260123123336.41126-2-peter.marko@siemens.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 15:37:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232322

On Fri Jan 23, 2026 at 1:33 PM CET, Peter Marko via lists.openembedded.org =
wrote:
> From: Peter Marko <peter.marko@siemens.com>
>
> Openssl 3.2 has reached EOL.
> Some projects would like to use LTS version due to criticality and
> exposure of this component, so upgrade to 3.5 branch.
>
> Copy recipe from current master and add UNPACKDIR definition at end of
> it as this variable does not exist in scarthgap yet.
>
> Dislaimers:
> * this is a testing branch not intended to be merged in current form
> * running builds implementing following Yocto AB testsuites showed only
>   intermittent failures of python ptest, otherwise the builds were ok:
>   * qemuarm64
>   * qemuarm64-alt
>   * qemuarm64-ptest
>   * qemuarm64-ptest-fast
>   * qemuppc
>   * qemuppc-tc
>   * qemux64-world
>   * qemux64-world-alt
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  .../openssl/files/environment.d-openssl.sh    |  9 ++-
>  ...ke-history-reporting-when-test-fails.patch | 19 +++--
>  ...1-Configure-do-not-tweak-mips-cflags.patch |  4 +-
>  ...sysroot-and-debug-prefix-map-from-co.patch | 26 ++++---
>  .../0001-extend-check_cwm-test-timeout.patch  | 32 ++++++++
>  .../openssl/openssl/CVE-2024-41996.patch      | 44 -----------
>  .../{openssl_3.2.6.bb =3D> openssl_3.5.4.bb}    | 76 +++++++++++++------
>  7 files changed, 116 insertions(+), 94 deletions(-)
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-extend=
-check_cwm-test-timeout.patch
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-41=
996.patch
>  rename meta/recipes-connectivity/openssl/{openssl_3.2.6.bb =3D> openssl_=
3.5.4.bb} (75%)

The TSC has approved merging this 3.5 Openssl upgrade to scarthgap :)

Can you send an updated non-RFC patch?

Thanks!

> diff --git a/meta/recipes-connectivity/openssl/files/environment.d-openss=
l.sh b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
> index d72edcb5ed..77747c1fda 100644
> --- a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
> +++ b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
> @@ -1,14 +1,15 @@
> -export OPENSSL_CONF=3D"$OECORE_NATIVE_SYSROOT/usr/lib/ssl/openssl.cnf"
> +export OPENSSL_CONF=3D"$OECORE_NATIVE_SYSROOT/usr/lib/ssl-3/openssl.cnf"
>  export OPENSSL_MODULES=3D"$OECORE_NATIVE_SYSROOT/usr/lib/ossl-modules/"
>  export OPENSSL_ENGINES=3D"$OECORE_NATIVE_SYSROOT/usr/lib/engines-3"
> +export BB_ENV_PASSTHROUGH_ADDITIONS=3D"${BB_ENV_PASSTHROUGH_ADDITIONS:-}=
 OPENSSL_CONF OPENSSL_MODULES OPENSSL_ENGINES"
> =20
>  # Respect host env SSL_CERT_FILE/SSL_CERT_DIR first, then auto-detected =
host cert, then cert in buildtools
> -# CAFILE/CAPATH is auto-deteced when source buildtools
> +# CAFILE/CAPATH is auto-detected when source buildtools
>  if [ -z "${SSL_CERT_FILE:-}" ]; then
>  	if [ -n "${CAFILE:-}" ];then
>  		export SSL_CERT_FILE=3D"$CAFILE"
>  	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" =
];then
> -		export SSL_CERT_FILE=3D"$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs/ca-ce=
rtificates.crt"
> +		export SSL_CERT_FILE=3D"$OECORE_NATIVE_SYSROOT/usr/lib/ssl-3/certs/ca-=
certificates.crt"
>  	fi
>  fi
> =20
> @@ -16,7 +17,7 @@ if [ -z "${SSL_CERT_DIR:-}" ]; then
>  	if [ -n "${CAPATH:-}" ];then
>  		export SSL_CERT_DIR=3D"$CAPATH"
>  	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" =
];then
> -		export SSL_CERT_DIR=3D"$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs"
> +		export SSL_CERT_DIR=3D"$OECORE_NATIVE_SYSROOT/usr/lib/ssl-3/certs"
>  	fi
>  fi
> =20
> diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Added-handsha=
ke-history-reporting-when-test-fails.patch b/meta/recipes-connectivity/open=
ssl/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch
> index b05d7abf7c..5b7365a353 100644
> --- a/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-hist=
ory-reporting-when-test-fails.patch
> +++ b/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-hist=
ory-reporting-when-test-fails.patch
> @@ -6,7 +6,6 @@ Subject: [PATCH] Added handshake history reporting when t=
est fails
>  Upstream-Status: Submitted [https://github.com/openssl/openssl/pull/2248=
1]
> =20
>  Signed-off-by: William Lyu <William.Lyu@windriver.com>
> -Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
>  ---
>   test/helpers/handshake.c | 137 +++++++++++++++++++++++++++++----------
>   test/helpers/handshake.h |  70 +++++++++++++++++++-
> @@ -14,10 +13,10 @@ Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
>   3 files changed, 217 insertions(+), 34 deletions(-)
> =20
>  diff --git a/test/helpers/handshake.c b/test/helpers/handshake.c
> -index e0422469e4..ae2ad59dd4 100644
> +index f611b3a..5703b48 100644
>  --- a/test/helpers/handshake.c
>  +++ b/test/helpers/handshake.c
> -@@ -24,6 +24,102 @@
> +@@ -25,6 +25,102 @@
>   #include <netinet/sctp.h>
>   #endif
>  =20
> @@ -120,7 +119,7 @@ index e0422469e4..ae2ad59dd4 100644
>   HANDSHAKE_RESULT *HANDSHAKE_RESULT_new(void)
>   {
>       HANDSHAKE_RESULT *ret;
> -@@ -725,15 +821,6 @@ static void configure_handshake_ssl(SSL *server, SS=
L *client,
> +@@ -726,15 +822,6 @@ static void configure_handshake_ssl(SSL *server, SS=
L *client,
>           SSL_set_post_handshake_auth(client, 1);
>   }
>  =20
> @@ -136,7 +135,7 @@ index e0422469e4..ae2ad59dd4 100644
>   /* An SSL object and associated read-write buffers. */
>   typedef struct peer_st {
>       SSL *ssl;
> -@@ -1080,17 +1167,6 @@ static void do_shutdown_step(PEER *peer)
> +@@ -1081,17 +1168,6 @@ static void do_shutdown_step(PEER *peer)
>       }
>   }
>  =20
> @@ -154,7 +153,7 @@ index e0422469e4..ae2ad59dd4 100644
>   static int renegotiate_op(const SSL_TEST_CTX *test_ctx)
>   {
>       switch (test_ctx->handshake_mode) {
> -@@ -1168,19 +1244,6 @@ static void do_connect_step(const SSL_TEST_CTX *t=
est_ctx, PEER *peer,
> +@@ -1169,19 +1245,6 @@ static void do_connect_step(const SSL_TEST_CTX *t=
est_ctx, PEER *peer,
>       }
>   }
>  =20
> @@ -174,7 +173,7 @@ index e0422469e4..ae2ad59dd4 100644
>   /*
>    * Determine the handshake outcome.
>    * last_status: the status of the peer to have acted last.
> -@@ -1545,6 +1608,10 @@ static HANDSHAKE_RESULT *do_handshake_internal(
> +@@ -1546,6 +1609,10 @@ static HANDSHAKE_RESULT *do_handshake_internal(
>  =20
>       start =3D time(NULL);
>  =20
> @@ -185,7 +184,7 @@ index e0422469e4..ae2ad59dd4 100644
>       /*
>        * Half-duplex handshake loop.
>        * Client and server speak to each other synchronously in the same =
process.
> -@@ -1566,6 +1633,10 @@ static HANDSHAKE_RESULT *do_handshake_internal(
> +@@ -1567,6 +1634,10 @@ static HANDSHAKE_RESULT *do_handshake_internal(
>                                         0 /* server went last */);
>           }
>  =20
> @@ -197,7 +196,7 @@ index e0422469e4..ae2ad59dd4 100644
>           case HANDSHAKE_SUCCESS:
>               client_turn_count =3D 0;
>  diff --git a/test/helpers/handshake.h b/test/helpers/handshake.h
> -index 78b03f9f4b..b9967c2623 100644
> +index 78b03f9..b9967c2 100644
>  --- a/test/helpers/handshake.h
>  +++ b/test/helpers/handshake.h
>  @@ -1,5 +1,5 @@
> @@ -302,7 +301,7 @@ index 78b03f9f4b..b9967c2623 100644
>  +
>   #endif  /* OSSL_TEST_HANDSHAKE_HELPER_H */
>  diff --git a/test/ssl_test.c b/test/ssl_test.c
> -index ea608518f9..9d6b093c81 100644
> +index ea60851..9d6b093 100644
>  --- a/test/ssl_test.c
>  +++ b/test/ssl_test.c
>  @@ -26,6 +26,44 @@ static OSSL_LIB_CTX *libctx =3D NULL;
> diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-=
not-tweak-mips-cflags.patch b/meta/recipes-connectivity/openssl/openssl/000=
1-Configure-do-not-tweak-mips-cflags.patch
> index 3f6ab97795..cf5ff356ee 100644
> --- a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-twe=
ak-mips-cflags.patch
> +++ b/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-twe=
ak-mips-cflags.patch
> @@ -17,10 +17,10 @@ Signed-off-by: Tim Orling <tim.orling@konsulko.com>
>   1 file changed, 10 deletions(-)
> =20
>  diff --git a/Configure b/Configure
> -index 4569952..adf019b 100755
> +index fff97bd..5ee54c1 100755
>  --- a/Configure
>  +++ b/Configure
> -@@ -1485,16 +1485,6 @@ if ($target =3D~ /^mingw/ && `$config{CC} --targe=
t-help 2>&1` =3D~ m/-mno-cygwin/m)
> +@@ -1552,16 +1552,6 @@ if ($target =3D~ /^mingw/ && `$config{CC} --targe=
t-help 2>&1` =3D~ m/-mno-cygwin/m)
>           push @{$config{shared_ldflag}}, "-mno-cygwin";
>           }
>  =20
> diff --git a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-str=
ip-sysroot-and-debug-prefix-map-from-co.patch b/meta/recipes-connectivity/o=
penssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.pa=
tch
> index ce2acb2462..dadc034c91 100644
> --- a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysr=
oot-and-debug-prefix-map-from-co.patch
> +++ b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysr=
oot-and-debug-prefix-map-from-co.patch
> @@ -30,23 +30,26 @@ Update to fix buildpaths qa issue for '-ffile-prefix-=
map'.
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> =20
>  ---
> - Configurations/unix-Makefile.tmpl | 12 +++++++++++-
> + Configurations/unix-Makefile.tmpl | 16 +++++++++++++++-
>   crypto/build.info                 |  2 +-
> - 2 files changed, 12 insertions(+), 2 deletions(-)
> + 2 files changed, 16 insertions(+), 2 deletions(-)
> =20
> -Index: openssl-3.0.4/Configurations/unix-Makefile.tmpl
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- openssl-3.0.4.orig/Configurations/unix-Makefile.tmpl
> -+++ openssl-3.0.4/Configurations/unix-Makefile.tmpl
> -@@ -481,13 +481,23 @@ BIN_LDFLAGS=3D{- join(' ', $target{bin_lflags} || =
(),
> +diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Mak=
efile.tmpl
> +index 09303c4..011bda1 100644
> +--- a/Configurations/unix-Makefile.tmpl
> ++++ b/Configurations/unix-Makefile.tmpl
> +@@ -513,13 +513,27 @@ BIN_LDFLAGS=3D{- join(' ', $target{bin_lflags} || =
(),
>                            '$(CNF_LDFLAGS)', '$(LDFLAGS)') -}
>   BIN_EX_LIBS=3D$(CNF_EX_LIBS) $(EX_LIBS)
>  =20
>  -# CPPFLAGS_Q is used for one thing only: to build up buildinf.h
>  +# *_Q variables are used for one thing only: to build up buildinf.h
>   CPPFLAGS_Q=3D{- $cppflags1 =3D~ s|([\\"])|\\$1|g;
> ++              $cppflags1 =3D~ s|-isystem/[^ ]+/usr/include||g;
>                 $cppflags2 =3D~ s|([\\"])|\\$1|g;
> ++              $cppflags2 =3D~ s|-isystem/[^ ]+/usr/include||g;
>                 $lib_cppflags =3D~ s|([\\"])|\\$1|g;
> ++              $lib_cppflags =3D~ s|-isystem/[^ ]+/usr/include||g;
>                 join(' ', $lib_cppflags || (), $cppflags2 || (),
>                           $cppflags1 || ()) -}
>  =20
> @@ -54,6 +57,7 @@ Index: openssl-3.0.4/Configurations/unix-Makefile.tmpl
>  +              s|-fdebug-prefix-map=3D[^ ]+|-fdebug-prefix-map=3D|g;
>  +              s|-fmacro-prefix-map=3D[^ ]+|-fmacro-prefix-map=3D|g;
>  +              s|-ffile-prefix-map=3D[^ ]+|-ffile-prefix-map=3D|g;
> ++              s|-isystem/[^ ]+/usr/include ||g;
>  +            }
>  +            join(' ', @{$config{CFLAGS}}) -}
>  +
> @@ -63,10 +67,10 @@ Index: openssl-3.0.4/Configurations/unix-Makefile.tmp=
l
>   PERLASM_SCHEME=3D {- $target{perlasm_scheme} -}
>  =20
>   # For x86 assembler: Set PROCESSOR to 386 if you want to support
> -Index: openssl-3.0.4/crypto/build.info
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- openssl-3.0.4.orig/crypto/build.info
> -+++ openssl-3.0.4/crypto/build.info
> +diff --git a/crypto/build.info b/crypto/build.info
> +index aee5c46..95c9577 100644
> +--- a/crypto/build.info
> ++++ b/crypto/build.info
>  @@ -115,7 +115,7 @@ DEFINE[../libcrypto]=3D$UPLINKDEF
>  =20
>   DEPEND[info.o]=3Dbuildinf.h
> diff --git a/meta/recipes-connectivity/openssl/openssl/0001-extend-check_=
cwm-test-timeout.patch b/meta/recipes-connectivity/openssl/openssl/0001-ext=
end-check_cwm-test-timeout.patch
> new file mode 100644
> index 0000000000..d02d42f1b5
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-tes=
t-timeout.patch
> @@ -0,0 +1,32 @@
> +From c7000672296f4c367341aa3415f26c4d9f5e4749 Mon Sep 17 00:00:00 2001
> +From: Gyorgy Sarvari <skandigraun@gmail.com>
> +Date: Thu, 23 Oct 2025 11:24:36 +0200
> +Subject: [PATCH] extend check_cwm test timeout
> +
> +The default, 3s long test timeout isn't always enough for this
> +particular test in case there is a high load on the host machine
> +(assuming it is running in qemu). Extend the default timeout to 6s
> +for the check_cwm test to avoid timeouts.
> +
> +Upstream-Status: Inappropriate [upstream issue: https://github.com/opens=
sl/openssl/issues/28983]
> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> +---
> + test/radix/main.c | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/test/radix/main.c b/test/radix/main.c
> +index 4a1e886a71..39f8c61ef9 100644
> +--- a/test/radix/main.c
> ++++ b/test/radix/main.c
> +@@ -25,6 +25,11 @@ static int test_script(int idx)
> +     int testresult;
> +     TERP_CONFIG cfg =3D {0};
> +=20
> ++    // check_cwm test sometimes times out, the default 3000ms is
> ++    // not enough if the test execution starves for CPU
> ++    if (!strncmp("check_cwm", script_info->name, strlen("check_cwm")))
> ++        cfg.max_execution_time =3D ossl_ms2time(6000);
> ++
> +     if (!TEST_true(bindings_process_init(0, 0)))
> +         return 0;
> +=20
> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2024-41996.pat=
ch b/meta/recipes-connectivity/openssl/openssl/CVE-2024-41996.patch
> deleted file mode 100644
> index dc18e0bef1..0000000000
> --- a/meta/recipes-connectivity/openssl/openssl/CVE-2024-41996.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -From e70e34d857d4003199bcb5d3b52ca8102ccc1b98 Mon Sep 17 00:00:00 2001
> -From: Tomas Mraz <tomas@openssl.org>
> -Date: Mon, 5 Aug 2024 17:54:14 +0200
> -Subject: [PATCH] dh_kmgmt.c: Avoid expensive public key validation for k=
nown
> - safe-prime groups
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -The partial validation is fully sufficient to check the key validity.
> -
> -Thanks to Szil=C3=A1rd Pfeiffer for reporting the issue.
> -
> -Reviewed-by: Neil Horman <nhorman@openssl.org>
> -Reviewed-by: Matt Caswell <matt@openssl.org>
> -Reviewed-by: Paul Dale <ppzgs1@gmail.com>
> -(Merged from https://github.com/openssl/openssl/pull/25088)
> -
> -CVE: CVE-2024-41996
> -Upstream-Status: Backport [https://github.com/openssl/openssl/commit/e70=
e34d857d4003199bcb5d3b52ca8102ccc1b98]
> -Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ----
> - providers/implementations/keymgmt/dh_kmgmt.c | 8 +++++---
> - 1 file changed, 5 insertions(+), 3 deletions(-)
> -
> -diff --git a/providers/implementations/keymgmt/dh_kmgmt.c b/providers/im=
plementations/keymgmt/dh_kmgmt.c
> -index 82c3093b12..ebdce76710 100644
> ---- a/providers/implementations/keymgmt/dh_kmgmt.c
> -+++ b/providers/implementations/keymgmt/dh_kmgmt.c
> -@@ -387,9 +387,11 @@ static int dh_validate_public(const DH *dh, int che=
cktype)
> -     if (pub_key =3D=3D NULL)
> -         return 0;
> -=20
> --    /* The partial test is only valid for named group's with q =3D (p -=
 1) / 2 */
> --    if (checktype =3D=3D OSSL_KEYMGMT_VALIDATE_QUICK_CHECK
> --        && ossl_dh_is_named_safe_prime_group(dh))
> -+    /*
> -+     * The partial test is only valid for named group's with q =3D (p -=
 1) / 2
> -+     * but for that case it is also fully sufficient to check the key v=
alidity.
> -+     */
> -+    if (ossl_dh_is_named_safe_prime_group(dh))
> -         return ossl_dh_check_pub_key_partial(dh, pub_key, &res);
> -=20
> -     return DH_check_pub_key_ex(dh, pub_key);
> diff --git a/meta/recipes-connectivity/openssl/openssl_3.2.6.bb b/meta/re=
cipes-connectivity/openssl/openssl_3.5.4.bb
> similarity index 75%
> rename from meta/recipes-connectivity/openssl/openssl_3.2.6.bb
> rename to meta/recipes-connectivity/openssl/openssl_3.5.4.bb
> index 4756f5aaa6..377d307203 100644
> --- a/meta/recipes-connectivity/openssl/openssl_3.2.6.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_3.5.4.bb
> @@ -7,19 +7,19 @@ SECTION =3D "libs/network"
>  LICENSE =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dc75985e733726beaba57bc525=
3e96d04"
> =20
> -SRC_URI =3D "https://github.com/openssl/openssl/releases/download/openss=
l-${PV}/openssl-${PV}.tar.gz \
> +SRC_URI =3D "http://www.openssl.org/source/openssl-${PV}.tar.gz \
>             file://run-ptest \
>             file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from=
-co.patch \
>             file://0001-Configure-do-not-tweak-mips-cflags.patch \
>             file://0001-Added-handshake-history-reporting-when-test-fails=
.patch \
> -           file://CVE-2024-41996.patch \
> +           file://0001-extend-check_cwm-test-timeout.patch \
>             "
> =20
>  SRC_URI:append:class-nativesdk =3D " \
>             file://environment.d-openssl.sh \
>             "
> =20
> -SRC_URI[sha256sum] =3D "89681a9ddaa9ed7cf25ea8ef61338db805200bae47d00510=
490623547380c148"
> +SRC_URI[sha256sum] =3D "967311f84955316969bdb1d8d4b983718ef42338639c621e=
c4c34fddef355e99"
> =20
>  inherit lib_package multilib_header multilib_script ptest perlnative man=
pages
>  MULTILIB_SCRIPTS =3D "${PN}-bin:${bindir}/c_rehash"
> @@ -32,10 +32,13 @@ PACKAGECONFIG[cryptodev-linux] =3D "enable-devcryptoe=
ng,disable-devcryptoeng,crypt
>  PACKAGECONFIG[no-tls1] =3D "no-tls1"
>  PACKAGECONFIG[no-tls1_1] =3D "no-tls1_1"
>  PACKAGECONFIG[manpages] =3D ""
> +PACKAGECONFIG[fips] =3D "enable-fips"
> =20
>  B =3D "${WORKDIR}/build"
>  do_configure[cleandirs] =3D "${B}"
> =20
> +EXTRA_OECONF =3D "${@bb.utils.contains('PTEST_ENABLED', '1', '', 'no-tes=
ts', d)}"
> +
>  #| ./libcrypto.so: undefined reference to `getcontext'
>  #| ./libcrypto.so: undefined reference to `setcontext'
>  #| ./libcrypto.so: undefined reference to `makecontext'
> @@ -44,12 +47,15 @@ EXTRA_OECONF:append:libc-musl:powerpc64 =3D " no-asm"
> =20
>  # adding devrandom prevents openssl from using getrandom() which is not =
available on older glibc versions
>  # (native versions can be built with newer glibc, but then relocated ont=
o a system with older glibc)
> -EXTRA_OECONF:class-native =3D "--with-rand-seed=3Dos,devrandom"
> -EXTRA_OECONF:class-nativesdk =3D "--with-rand-seed=3Dos,devrandom"
> +EXTRA_OECONF:append:class-native =3D " --with-rand-seed=3Dos,devrandom"
> +EXTRA_OECONF:append:class-nativesdk =3D " --with-rand-seed=3Dos,devrando=
m"
> =20
>  # Relying on hardcoded built-in paths causes openssl-native to not be re=
locateable from sstate.
> -CFLAGS:append:class-native =3D " -DOPENSSLDIR=3D/not/builtin -DENGINESDI=
R=3D/not/builtin"
> -CFLAGS:append:class-nativesdk =3D " -DOPENSSLDIR=3D/not/builtin -DENGINE=
SDIR=3D/not/builtin"
> +EXTRA_OEMAKE:append:task-compile:class-native =3D ' OPENSSLDIR=3D"/not/b=
uiltin" ENGINESDIR=3D"/not/builtin" MODULESDIR=3D"/not/builtin"'
> +EXTRA_OEMAKE:append:task-compile:class-nativesdk =3D ' OPENSSLDIR=3D"/no=
t/builtin" ENGINESDIR=3D"/not/builtin" MODULESDIR=3D"/not/builtin"'
> +
> +#| threads_pthread.c:(.text+0x372): undefined reference to `__atomic_is_=
lock_free'
> +EXTRA_OECONF:append:toolchain-clang:x86 =3D " -latomic"
> =20
>  # This allows disabling deprecated or undesirable crypto algorithms.
>  # The default is to trust upstream choices.
> @@ -136,21 +142,26 @@ do_configure () {
>  		;;
>  	esac
> =20
> -	useprefix=3D${prefix}
> -	if [ "x$useprefix" =3D "x" ]; then
> -		useprefix=3D/
> -	fi
>  	# WARNING: do not set compiler/linker flags (-I/-D etc.) in EXTRA_OECON=
F, as they will fully replace the
>  	# environment variables set by bitbake. Adjust the environment variable=
s instead.
>  	PERLEXTERNAL=3D"$(realpath ${S}/external/perl/Text-Template-*/lib)"
>  	test -d "$PERLEXTERNAL" || bberror "PERLEXTERNAL '$PERLEXTERNAL' not fo=
und!"
>  	HASHBANGPERL=3D"/usr/bin/env perl" PERL=3Dperl PERL5LIB=3D"$PERLEXTERNA=
L" \
> -	perl ${S}/Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} ${DEPRECA=
TED_CRYPTO_FLAGS} --prefix=3D$useprefix --openssldir=3D${libdir}/ssl-3 --li=
bdir=3D${libdir} $target
> +	perl ${S}/Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} ${DEPRECA=
TED_CRYPTO_FLAGS} --prefix=3D${prefix} --openssldir=3D${libdir}/ssl-3 --lib=
dir=3D${baselib} $target
>  	perl ${B}/configdata.pm --dump
>  }
> =20
> +do_compile:append () {
> +	# The test suite binaries are large and we don't need the debugging in =
them
> +	if test -d ${B}/test; then
> +		find ${B}/test -type f -executable -exec ${STRIP} {} \;
> +	fi
> +}
> +
>  do_install () {
> -	oe_runmake DESTDIR=3D"${D}" MANDIR=3D"${mandir}" MANSUFFIX=3Dssl instal=
l_sw install_ssldirs ${@bb.utils.contains('PACKAGECONFIG', 'manpages', 'ins=
tall_docs', '', d)}
> +	oe_runmake DESTDIR=3D"${D}" MANDIR=3D"${mandir}" MANSUFFIX=3Dssl instal=
l_sw install_ssldirs \
> +	    ${@bb.utils.contains('PACKAGECONFIG', 'manpages', 'install_docs', '=
', d)} \
> +	    ${@bb.utils.contains('PACKAGECONFIG', 'fips', 'install_fips', '', d=
)}
> =20
>  	oe_multilib_header openssl/opensslconf.h
>  	oe_multilib_header openssl/configuration.h
> @@ -168,21 +179,30 @@ do_install () {
>  	ln -sf ${@oe.path.relative('${libdir}/ssl-3', '${sysconfdir}/ssl/certs'=
)} ${D}${libdir}/ssl-3/certs
>  	ln -sf ${@oe.path.relative('${libdir}/ssl-3', '${sysconfdir}/ssl/privat=
e')} ${D}${libdir}/ssl-3/private
>  	ln -sf ${@oe.path.relative('${libdir}/ssl-3', '${sysconfdir}/ssl/openss=
l.cnf')} ${D}${libdir}/ssl-3/openssl.cnf
> +
> +	# Generate fipsmodule.cnf in pkg_postinst_ontarget
> +	if ${@bb.utils.contains('PACKAGECONFIG', 'fips', 'true', 'false', d)}; =
then
> +		rm -f ${D}${libdir}/ssl-3/fipsmodule.cnf
> +	fi
>  }
> =20
>  do_install:append:class-native () {
>  	create_wrapper ${D}${bindir}/openssl \
> -	    OPENSSL_CONF=3D${libdir}/ssl-3/openssl.cnf \
> -	    SSL_CERT_DIR=3D${libdir}/ssl-3/certs \
> -	    SSL_CERT_FILE=3D${libdir}/ssl-3/cert.pem \
> -	    OPENSSL_ENGINES=3D${libdir}/engines-3 \
> -	    OPENSSL_MODULES=3D${libdir}/ossl-modules
> +	    OPENSSL_CONF=3D\${OPENSSL_CONF:-${libdir}/ssl-3/openssl.cnf} \
> +	    SSL_CERT_DIR=3D\${SSL_CERT_DIR:-${libdir}/ssl-3/certs} \
> +	    SSL_CERT_FILE=3D\${SSL_CERT_FILE:-${libdir}/ssl-3/cert.pem} \
> +	    OPENSSL_ENGINES=3D\${OPENSSL_ENGINES:-${libdir}/engines-3} \
> +	    OPENSSL_MODULES=3D\${OPENSSL_MODULES:-${libdir}/ossl-modules}
> +
> +	# Setting ENGINESDIR and MODULESDIR to invalid paths prevents host cont=
amination,
> +	# but also breaks the generated libcrypto.pc file. Post-Fix it manually=
 here.
> +	sed -i 's|^enginesdir=3D\($.libdir.\)/.*|enginesdir=3D\1/engines-3|' ${=
D}${libdir}/pkgconfig/libcrypto.pc
> +	sed -i 's|^modulesdir=3D\($.libdir.\)/.*|modulesdir=3D\1/ossl-modules|'=
 ${D}${libdir}/pkgconfig/libcrypto.pc
>  }
> =20
>  do_install:append:class-nativesdk () {
>  	mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
> -	install -m 644 ${WORKDIR}/environment.d-openssl.sh ${D}${SDKPATHNATIVE}=
/environment-setup.d/openssl.sh
> -	sed 's|/usr/lib/ssl/|/usr/lib/ssl-3/|g' -i ${D}${SDKPATHNATIVE}/environ=
ment-setup.d/openssl.sh
> +	install -m 644 ${UNPACKDIR}/environment.d-openssl.sh ${D}${SDKPATHNATIV=
E}/environment-setup.d/openssl.sh
>  }
> =20
>  PTEST_BUILD_HOST_FILES +=3D "configdata.pm"
> @@ -226,12 +246,18 @@ do_install_ptest() {
>  	ln -s ${libdir}/ossl-modules/ ${D}${PTEST_PATH}/providers
>  }
> =20
> +pkg_postinst_ontarget:${PN}-ossl-module-fips () {
> +	if test -f ${libdir}/ossl-modules/fips.so; then
> +		${bindir}/openssl fipsinstall -out ${libdir}/ssl-3/fipsmodule.cnf -mod=
ule ${libdir}/ossl-modules/fips.so
> +	fi
> +}
> +
>  # Add the openssl.cnf file to the openssl-conf package. Make the libcryp=
to
>  # package RRECOMMENDS on this package. This will enable the configuratio=
n
>  # file to be installed for both the openssl-bin package and the libcrypt=
o
>  # package since the openssl-bin package depends on the libcrypto package=
.
> =20
> -PACKAGES =3D+ "libcrypto libssl openssl-conf ${PN}-engines ${PN}-misc ${=
PN}-ossl-module-legacy"
> +PACKAGES =3D+ "libcrypto libssl openssl-conf ${PN}-engines ${PN}-misc ${=
PN}-ossl-module-legacy ${PN}-ossl-module-fips"
> =20
>  FILES:libcrypto =3D "${libdir}/libcrypto${SOLIBS}"
>  FILES:libssl =3D "${libdir}/libssl${SOLIBS}"
> @@ -243,6 +269,7 @@ FILES:${PN}-engines =3D "${libdir}/engines-3"
>  FILES:${PN}-engines:append:mingw32:class-nativesdk =3D " ${prefix}${libd=
ir}/engines-3"
>  FILES:${PN}-misc =3D "${libdir}/ssl-3/misc ${bindir}/c_rehash"
>  FILES:${PN}-ossl-module-legacy =3D "${libdir}/ossl-modules/legacy.so"
> +FILES:${PN}-ossl-module-fips =3D "${libdir}/ossl-modules/fips.so"
>  FILES:${PN} =3D+ "${libdir}/ssl-3/* ${libdir}/ossl-modules/"
>  FILES:${PN}:append:class-nativesdk =3D " ${SDKPATHNATIVE}/environment-se=
tup.d/openssl.sh"
> =20
> @@ -254,9 +281,12 @@ RDEPENDS:${PN}-ptest +=3D "openssl-bin perl perl-mod=
ules bash sed openssl-engines
> =20
>  RDEPENDS:${PN}-bin +=3D "openssl-conf"
> =20
> +# The test suite is installed stripped
> +INSANE_SKIP:${PN} =3D "already-stripped"
> +
>  BBCLASSEXTEND =3D "native nativesdk"
> =20
>  CVE_PRODUCT =3D "openssl:openssl"
> =20
> -CVE_VERSION_SUFFIX =3D "alphabetical"
> -
> +# this does not exist in scarthgap yet
> +UNPACKDIR =3D "${WORKDIR}"


--=20
Yoann Congal
Smile ECS


