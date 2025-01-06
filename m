Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCE0AE77198
	for <webhook@archiver.kernel.org>; Mon,  6 Jan 2025 14:27:32 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.60268.1736173651381623785
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jan 2025 06:27:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eoFB9i81;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43624b2d453so149337355e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jan 2025 06:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1736173649; x=1736778449; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=beeoRDuGqY7bPdj3GXyNS4ijnwNTOxs1eDuZatMJQs0=;
        b=eoFB9i81cuEgjh6l405KFIgS9J0QIgSfuesqDRqUhX1oFyzlgHAOeOFe1Q5ZH7KnKV
         1jUAIYdh4XqaUQG0S+sl2EJxzZYgo8dzyGKoGvS9j/BUAMXtPSKo2UhFAOBT9eznchUw
         12r2WO185FFWt4NDWtPjDLXr+iTIY3AhMV1bM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736173649; x=1736778449;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=beeoRDuGqY7bPdj3GXyNS4ijnwNTOxs1eDuZatMJQs0=;
        b=qgOpAd/ePpinXnZWS0GE3AKtClfb02Nu5XRtpuIa/yZHlrTjKN2y0hSlcxKbnLnEyZ
         0+WYZ57UcUTLPoAo+35uXOakIV2/ygSDKrhoRu6qN8mRDkept2i+BQeIjlVKw6Z/Ghx6
         MGyw2KHzjDybWRBFcEn18Z2Md7FWey1NqgalnPaYbiximiwgloRx3VKDNi6tEl+jvSPR
         0x4yM1gEgKVXsEfFJKtWYxUPOS+ULJDo4UwZM2sP+9TUWqdFnDNBGeIoheAAOjwM81+e
         sh6kR35QsiXRHFa5rnTvfWOuA42wkyEYJYiOowiYn1o+u+xKrz3cDAY10/mhrSH7EgVM
         ILUA==
X-Forwarded-Encrypted: i=1; AJvYcCVZsjVAi0IaBb08NK6rXoi9cUaW9Cqom+fOV1pHABdWRRiFe64YkYvymgR2nCFrsvdfxNQJsTDQXBMd4hP8WYSXCw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzXi5VYx9D0R7+fAz4z3bFCT69/CXFOWLtKUilPctFbGzWDL5dy
	9j70Z4rGzqZgn3aRuUjedhqERgYZTYXvTrIHX0+kT3R1S4SGhHxicNqKdgWY3Bg=
X-Gm-Gg: ASbGncvg6OM1yeT5YL+UnRh/mQiA8rH0bf4daWVQXDquffc6YMFV488FfSz3Dcr/Rlb
	Bx+8NCGcJtu8wM1AzFTACgBlquKAj27G6lfaX+T2V+s5s8h4WN2fse7N4ZA/lj54swxbBrt1CnV
	RcXYMwhhCfkH/bFYL133hhgKJOOdWKsDKtDn2WEYXyAtXB+Mb/2baLpvzpUxlHXLbfjbf9lqtI7
	xh/+QL8N424lOi3EUZ22O0Om+GNqIKKGS/fMt7XBIIGNVrbOAfZ71yzipyt8UGBO3rKi0ZOFV+F
	pbMFC8rHOm6e/K84tPfuBWnHAjzkU4T2Z6yQv7SYpO8XAA==
X-Google-Smtp-Source: AGHT+IF3PZMVd5QOcBQO74jzJfPeOcrW4IW3rK5xcVOckrpFb9LJrLdS6qtcGFaoeJTGiWsclS6LSw==
X-Received: by 2002:a05:6000:1846:b0:385:e88a:7037 with SMTP id ffacd0b85a97d-38a221e27afmr49786011f8f.6.1736173649549;
        Mon, 06 Jan 2025 06:27:29 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:3607:7267:e27a:36e4? ([2001:8b0:aba:5f3c:3607:7267:e27a:36e4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8acafesm47870476f8f.98.2025.01.06.06.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 06:27:29 -0800 (PST)
Message-ID: <c3f0988d36890bbb8d03460f66d1153c6e23e518.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] vim: fix xxd-native RPROVIDES
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: denis@denix.org, openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Date: Mon, 06 Jan 2025 14:27:28 +0000
In-Reply-To: <20241204230907.43936-1-denis@denix.org>
References: <20241204230907.43936-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jan 2025 14:27:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209426

On Wed, 2024-12-04 at 18:09 -0500, Denys Dmytriyenko via lists.openembedded=
.org wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
>=20
> BBCLASSEXTEND doesn't handle overrides with suffixed ${PN} for
> native class, e.g.:
>=20
> RPROVIDES:${PN}-xxd =3D "xxd"
>=20
> becomes:
>=20
> RPROVIDES:vim-native-xxd =3D "xxd-native"
>=20
> instead of:
>=20
> RPROVIDES:vim-xxd-native =3D "xxd-native"
>=20
> This results in "Nothing RPROVIDES xxd-native" error when
> something RDEPENDS on xxd-native because there's no such
> package as vim-native-xxd.
>=20
> Use ${BPN} and explicitly handle RPROVIDES.
>=20
> Since native class does not produce packages, other variables
> using :${PN}-xxd override don't matter. And nativesdk class
> is not affected, as it uses a prefix, not suffix.
>=20
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
> =C2=A0meta/recipes-support/vim/vim_9.1.bb | 4 +++-
> =C2=A01 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-support/vim/vim_9.1.bb b/meta/recipes-support/v=
im/vim_9.1.bb
> index fee9f055e9..8968b8cb07 100644
> --- a/meta/recipes-support/vim/vim_9.1.bb
> +++ b/meta/recipes-support/vim/vim_9.1.bb
> @@ -11,7 +11,9 @@ BBCLASSEXTEND =3D "native nativesdk"
> =C2=A0
> =C2=A0PACKAGES =3D+ "${PN}-xxd"
> =C2=A0FILES:${PN}-xxd =3D "${bindir}/xxd"
> -RPROVIDES:${PN}-xxd =3D "xxd"
> +RPROVIDES:${BPN}-xxd =3D "xxd"
> +RPROVIDES:${BPN}-xxd-native =3D "xxd-native"
> +RPROVIDES:nativesdk-${BPN}-xxd =3D "nativesdk-xxd"
> =C2=A0
> =C2=A0ALTERNATIVE:${PN}-xxd =3D "xxd"
> =C2=A0ALTERNATIVE_TARGET[xxd] =3D "${bindir}/xxd"

I've included a different patch for this below. The downside is that as
usual, by improving the native class extend, we expose issues in other
recipes. There are various fixes to allow "bitbake world -g" with core
to at least not fail parsing or throw warnings. There may be other more
subtle changes.

Cheers,

Richard

diff --git a/meta/classes-recipe/native.bbclass b/meta/classes-recipe/nativ=
e.bbclass
index d9651a7f22..0fad42a5a4 100644
--- a/meta/classes-recipe/native.bbclass
+++ b/meta/classes-recipe/native.bbclass
@@ -158,7 +158,12 @@ python native_virtclass_handler () {
                 newdeps.append(dep.replace(pn, bpn) + "-native")
             else:
                 newdeps.append(dep)
-        d.setVar(varname, " ".join(newdeps))
+        output_varname =3D varname
+        # Handle ${PN}-xxx -> ${BPN}-xxx-native
+        if suffix !=3D "${PN}" and "${PN}" in suffix:
+            output_varname =3D varname.replace("${PN}", "${BPN}") + "-nati=
ve"
+            d.renameVar(varname, output_varname)
+        d.setVar(output_varname, " ".join(newdeps))
=20
     map_dependencies("DEPENDS", e.data, selfref=3DFalse)
     for pkg in e.data.getVar("PACKAGES", False).split():
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 620521e7da..340aa13b5d 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -205,6 +205,7 @@ DATETIME =3D "${DATE}${TIME}"
 # its own in staging
 ASSUME_PROVIDED =3D "\
     bash-native \
+    bash-completion-native \
     bzip2-native \
     chrpath-native \
     diffstat-native \
diff --git a/meta/recipes-core/coreutils/coreutils_9.5.bb b/meta/recipes-co=
re/coreutils/coreutils_9.5.bb
index af0fcdcc4c..ae07cba164 100644
--- a/meta/recipes-core/coreutils/coreutils_9.5.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.5.bb
@@ -182,7 +182,9 @@ RDEPENDS:${PN}-ptest +=3D "bash findutils gawk make per=
l perl-modules python3-core
 # may need tweaking if DEPENDS changes
 # Can't use ${PN}-dev here since flags with overrides and key expansion no=
t supported
 RRECOMMENDS:coreutils-dev[nodeprrecs] =3D "1"
-RRECOMMENDS:${PN}-dev +=3D "acl-dev attr-dev gmp-dev libcap-dev bash-dev f=
indutils-dev gawk-dev shadow-dev"
+DEVDEPS =3D "acl-dev attr-dev gmp-dev libcap-dev bash-dev findutils-dev ga=
wk-dev shadow-dev"
+DEVDEPS:class-native =3D ""
+RRECOMMENDS:${PN}-dev +=3D "${DEVDEPS}"
=20
 do_install_ptest () {
     install -d ${D}${PTEST_PATH}/tests
diff --git a/meta/recipes-core/util-linux/util-linux_2.40.2.bb b/meta/recip=
es-core/util-linux/util-linux_2.40.2.bb
index 2c7dd154e1..5be35eabf8 100644
--- a/meta/recipes-core/util-linux/util-linux_2.40.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.40.2.bb
@@ -59,7 +59,8 @@ python util_linux_libpackages() {
=20
 PACKAGESPLITFUNCS =3D+ "util_linux_libpackages"
=20
-PACKAGES_DYNAMIC =3D "^${PN}-.*"
+PACKAGES_DYNAMIC =3D "^${MLPREFIX}${BPN}-.*"
+PACKAGES_DYNAMIC:class-native =3D "^${PN}-.*-native"
=20
 UTIL_LINUX_LIBDIR =3D "${libdir}"
 UTIL_LINUX_LIBDIR:class-target =3D "${base_libdir}"




