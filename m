Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CF10C5CFC1
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 11:19:36 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10676.1786706369074605946
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2026 04:19:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aoZBZkcJ;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8f1a8e914a9so5218236d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 04:19:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786706368; cv=none;
        d=google.com; s=arc-20260327;
        b=ssuSe1CGeb29P5S4sfdk82IOPWeZ0lvD2CH47AaG4PSEVDeihKSOlndBQPReapmPPz
         OTAu7r3o09Qg81/I8ajWJxhBamKDvjhmx/bSgOFIaSK38TJVPszv4osVCwcwNVHzRNSH
         43+P+kjFEA+8SdziHNXMLzY0hsPXVqilWtVFXPCaiuQzwZHyhzwmyHuq0Tood1w2Jwyx
         0q8JMVHqoI7oMGIhynThMMXuixJrIP+E0hljU37rbfrrh7P60iWOX0fOhVIVTSGOEDSO
         s5bqAFXe9P4+DLx0PVEkbrjV91kFhKg2wgQi+QeVQ5bMgwnACYcxO3iKFcHKFiVX9kzU
         /NkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aJPgw6tl5MIKv8isD4iDASiez6kwglOUzn5ivKx0ozA=;
        fh=d1o4Rmg6R3TuMHb6AmBGGt2UIRF9p6WtNjccVS3Q7lM=;
        b=FeUmVogvpZHSWE0odKq3VyKwEJT7ePrv76C4kvbc99IP0Pf/rEVQa44DKoZqFBK+0Y
         E+TH/ux4Ke15ys9sAAAbN7SlMOjGYbt7vMoCYujOHPd54KQAOYU/r0OhOpMq2XuLepva
         OhFY/LL9V6+PVxePDlAno8b+wqNSDG32RlbTauIfPTBOLGV7inDaWCaCNnHQWkckQYPM
         1/peb0DfNfKSKmNQjOeQpzYnan5nlA9loCcatC4eBE4lJruSNAJ4nj1D92EX7WNmqVQf
         TqlTooPu/IvvX1jVRNDgaR3KIfGEpWUDaWtRAg1Z342dcu/h9Yufhu/VoaOd6rCIWxzJ
         0Kaw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786706368; x=1787311168; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aJPgw6tl5MIKv8isD4iDASiez6kwglOUzn5ivKx0ozA=;
        b=aoZBZkcJN8m/yXMBRRVug8YRGOLXtulFhxNUgMUwneI669oMOvJbryL50RSyial3VB
         H9ngAM/vUaEwCku78dSoZw4cW7lrKABNFDdO7zTNn//7R+EafcnW6B1OIOHk6kTue3Bm
         dWY46PuX//QFp8J7k0JbfKnJwz7wqZmsFpetmL8U0BwlSeqYA99O0mq2BQPNo5FHtW8n
         lpfRGo7KUXSkl6shq6PVYIRGIkr+ZcCfWQd5XhFob/saCTcaGAxZxcP3wG58ZDWEE6EW
         Km5jCZ+61JlAJLBOIBxrGdS0HAHIPKAgDm9ouCKkeEbDZ2ccVyCRk4AZFNdVObGlyRaB
         VpLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786706368; x=1787311168;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aJPgw6tl5MIKv8isD4iDASiez6kwglOUzn5ivKx0ozA=;
        b=haiDnUFhd9/HGIVizser1ym5YQNk6OIeUPKmxvXkM+R8EBwCZ4AkFKdZaM9wAYiUlg
         9RXt6ym6DbnPDXLO1Y9+OzEBe+kxzuPdU7zjatbiK+6oXDEMWr3CFO0t7nkcn+khSZE9
         7MJKCt/rPNHLX+QZKeuP8hrsVwbbxniTb2y9maGxCtrcoA99cX3jyASQzDvlEm1+4gfL
         t7QU2NPhHd0//FCITcbHln+/1RmNwylifRdDgB0V3AxfBmEX4ZXkNR4LK3NmSOhLTfcv
         aJIpRZInkZJvca6y1R5XchUj0TPitAT9foMVT0vhfSHAqKSVyBm1XoSN+wecAQNfWS7L
         cvUQ==
X-Gm-Message-State: AOJu0Yxy1hwfkj46VMvPn0pqDU0YKh67G92zKVwDj0fKGqPPeKD8+8JC
	K8aO4GxgIX60ORB6UsE4AWEVcXclMd1Ut4wVIfuXFbdZs2Uzf+RgtceDZam4ZegYRN3kQXc6Qpp
	4pAcqZo4ZiUOFtw74+Js0TL5wxn5zQ0s=
X-Gm-Gg: AR+sD13tfPz0WwV4kgNHs30tjFLvWuic94bepH+uTeZ90R6yZ8mhlqVK+CEhwqH4yP2
	HCNQel0riNdoNfuRP5O1zhASovQqtIbxrlnrP9amxwnU0Jzz/kq/lyKPysygBNciPovg9tkmm4h
	ZLBkZQ27p3GmIAejUL3xAUjfKZ9COpK+NFC98+Y549j8OEq3LZKU7PEPyJ8eXqND8Yp9YPs49yf
	OmNDw+qzrBus4arGybEkNgDuEb851BV3mIS24ACYcQgmdvtHALenQnQyxlfTMY5afAdnRBftF58
	aaq6AAL07X7NUExf/yJSuDu4AndkgpfM678LteaFGerDYYx8tUZSmVDmfQfyyvUsYmcpEiMFoFY
	K++21f3Z+87VKtg==
X-Received: by 2002:a05:6214:48f:b0:8a0:d08c:a720 with SMTP id
 6a1803df08f44-90a91d63d6bmr51246426d6.17.1786706367713; Fri, 14 Aug 2026
 04:19:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260814073851.3797172-1-jaeyoon.jung@lge.com>
In-Reply-To: <20260814073851.3797172-1-jaeyoon.jung@lge.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 14 Aug 2026 13:19:16 +0200
X-Gm-Features: AUfX_myXDfAv8psEYI51SMeK3dX7JyrLfyAXyUVy2qyq8vulo9I__eO-SnM19Dk
Message-ID: <CANNYZj_4x7HQHqDbqtSHVvxEfFLEjFz3dwFo-5cSPsxBCPY5Dw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssl: use nonarch_libdir for openssldir
To: jaeyoon.jung@lge.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 11:19:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243445

I'm not sure. They are not binaries, but that does not mean they are
architecture independent, as they may contain settings for the
particular build of openssl, and in multilib setup those do need to go
to a architecture-specific directory to avoid installation conflicts.
Can you set up multilib and confirm that both lib32 and lib64 files
are identical?

Alex

On Fri, 14 Aug 2026 at 09:39, Jaeyoon Jung (LGE) via
lists.openembedded.org <jaeyoon.jung=lge.com@lists.openembedded.org>
wrote:
>
> From: Jaeyoon Jung <jaeyoon.jung@lge.com>
>
> Set openssldir to ${nonarch_libdir}/ssl-3 instead of ${libdir}/ssl-3
> since files in this directory are architecture-independent.
>
> Signed-off-by: Jaeyoon Jung <jaeyoon.jung@lge.com>
> ---
>  .../openssl/openssl_3.5.7.bb                  | 28 +++++++++----------
>  1 file changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.7.bb b/meta/recipes-connectivity/openssl/openssl_3.5.7.bb
> index b95c734f1d..2dd23c9da0 100644
> --- a/meta/recipes-connectivity/openssl/openssl_3.5.7.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_3.5.7.bb
> @@ -153,7 +153,7 @@ do_configure () {
>         PERLEXTERNAL="$(realpath ${S}/external/perl/Text-Template-*/lib)"
>         test -d "$PERLEXTERNAL" || bberror "PERLEXTERNAL '$PERLEXTERNAL' not found!"
>         HASHBANGPERL="/usr/bin/env perl" PERL=perl PERL5LIB="$PERLEXTERNAL" \
> -       perl ${S}/Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} ${DEPRECATED_CRYPTO_FLAGS} --prefix=${prefix} --openssldir=${libdir}/ssl-3 --libdir=${baselib} $target
> +       perl ${S}/Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} ${DEPRECATED_CRYPTO_FLAGS} --prefix=${prefix} --openssldir=${nonarch_libdir}/ssl-3 --libdir=${baselib} $target
>         perl ${B}/configdata.pm --dump
>  }
>
> @@ -175,20 +175,20 @@ do_install () {
>         # Create SSL structure for packages such as ca-certificates which
>         # contain hard-coded paths to /etc/ssl. Debian does the same.
>         install -d ${D}${sysconfdir}/ssl
> -       mv ${D}${libdir}/ssl-3/certs \
> -          ${D}${libdir}/ssl-3/private \
> -          ${D}${libdir}/ssl-3/openssl.cnf \
> +       mv ${D}${nonarch_libdir}/ssl-3/certs \
> +          ${D}${nonarch_libdir}/ssl-3/private \
> +          ${D}${nonarch_libdir}/ssl-3/openssl.cnf \
>            ${D}${sysconfdir}/ssl/
>
>         # Although absolute symlinks would be OK for the target, they become
>         # invalid if native or nativesdk are relocated from sstate.
> -       ln -sf ${@oe.path.relative('${libdir}/ssl-3', '${sysconfdir}/ssl/certs')} ${D}${libdir}/ssl-3/certs
> -       ln -sf ${@oe.path.relative('${libdir}/ssl-3', '${sysconfdir}/ssl/private')} ${D}${libdir}/ssl-3/private
> -       ln -sf ${@oe.path.relative('${libdir}/ssl-3', '${sysconfdir}/ssl/openssl.cnf')} ${D}${libdir}/ssl-3/openssl.cnf
> +       ln -sf ${@oe.path.relative('${nonarch_libdir}/ssl-3', '${sysconfdir}/ssl/certs')} ${D}${nonarch_libdir}/ssl-3/certs
> +       ln -sf ${@oe.path.relative('${nonarch_libdir}/ssl-3', '${sysconfdir}/ssl/private')} ${D}${nonarch_libdir}/ssl-3/private
> +       ln -sf ${@oe.path.relative('${nonarch_libdir}/ssl-3', '${sysconfdir}/ssl/openssl.cnf')} ${D}${nonarch_libdir}/ssl-3/openssl.cnf
>
>         # Generate fipsmodule.cnf in pkg_postinst_ontarget
>         if ${@bb.utils.contains('PACKAGECONFIG', 'fips', 'true', 'false', d)}; then
> -               rm -f ${D}${libdir}/ssl-3/fipsmodule.cnf
> +               rm -f ${D}${nonarch_libdir}/ssl-3/fipsmodule.cnf
>         fi
>  }
>
> @@ -201,9 +201,9 @@ do_install:append:class-target () {
>
>  do_install:append:class-native () {
>         create_wrapper ${D}${bindir}/openssl \
> -           OPENSSL_CONF=\${OPENSSL_CONF:-${libdir}/ssl-3/openssl.cnf} \
> -           SSL_CERT_DIR=\${SSL_CERT_DIR:-${libdir}/ssl-3/certs} \
> -           SSL_CERT_FILE=\${SSL_CERT_FILE:-${libdir}/ssl-3/cert.pem} \
> +           OPENSSL_CONF=\${OPENSSL_CONF:-${nonarch_libdir}/ssl-3/openssl.cnf} \
> +           SSL_CERT_DIR=\${SSL_CERT_DIR:-${nonarch_libdir}/ssl-3/certs} \
> +           SSL_CERT_FILE=\${SSL_CERT_FILE:-${nonarch_libdir}/ssl-3/cert.pem} \
>             OPENSSL_ENGINES=\${OPENSSL_ENGINES:-${libdir}/engines-3} \
>             OPENSSL_MODULES=\${OPENSSL_MODULES:-${libdir}/ossl-modules}
>
> @@ -275,15 +275,15 @@ PACKAGES =+ "libcrypto libssl openssl-conf ${PN}-engines ${PN}-misc ${PN}-ossl-m
>  FILES:libcrypto = "${libdir}/libcrypto${SOLIBS}"
>  FILES:libssl = "${libdir}/libssl${SOLIBS}"
>  FILES:openssl-conf = "${sysconfdir}/ssl/openssl.cnf* \
> -                      ${libdir}/ssl-3/openssl.cnf* \
> +                      ${nonarch_libdir}/ssl-3/openssl.cnf* \
>                        "
>  FILES:${PN}-engines = "${libdir}/engines-3"
>  # ${prefix} comes from what we pass into --prefix at configure time (which is used for INSTALLTOP)
>  FILES:${PN}-engines:append:mingw32:class-nativesdk = " ${prefix}${libdir}/engines-3"
> -FILES:${PN}-misc = "${libdir}/ssl-3/misc ${bindir}/c_rehash"
> +FILES:${PN}-misc = "${nonarch_libdir}/ssl-3/misc ${bindir}/c_rehash"
>  FILES:${PN}-ossl-module-legacy = "${libdir}/ossl-modules/legacy.so"
>  FILES:${PN}-ossl-module-fips = "${libdir}/ossl-modules/fips.so"
> -FILES:${PN} =+ "${libdir}/ssl-3/* ${libdir}/ossl-modules/"
> +FILES:${PN} =+ "${nonarch_libdir}/ssl-3/* ${libdir}/ossl-modules/"
>  FILES:${PN}:append:class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/openssl.sh"
>
>  CONFFILES:openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#243426): https://lists.openembedded.org/g/openembedded-core/message/243426
> Mute This Topic: https://lists.openembedded.org/mt/120745838/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

