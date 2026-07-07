Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3ED9C43458
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 14:44:28 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.174921.1783435465570005351
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 07:44:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=jC2U+F9R;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493c486f012so18326805e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 07:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783435464; x=1784040264; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1TgkhlxDUoQOyqYI703W4DTllnG3pg1OGd4YWvsTJR4=;
        b=jC2U+F9RX9ZfQYqB67KDw3R4QaY+JKukYJJ4o1UGYclzyfietnMW1T6gHOabeu0a86
         aCNqARFPMlgfwsspNNeMzKdTuJxNO3+yuVo7eWwnvQdAEBOn7fIre90qggVx0WBwflGO
         hhlvyORYImVHF/IYmRH5CTIMEyN2XR4YshC3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435464; x=1784040264;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1TgkhlxDUoQOyqYI703W4DTllnG3pg1OGd4YWvsTJR4=;
        b=VnFdYh/UPkbK/ywQ66Nm56RrzcW+7QsIeLjuVoyDfymiafFmBp9ppJCDGnuoJLEL15
         fTASoPow3DuiBOxP2SuF9iXHJfIlTRC8bDZEuU4my4iypxNeeHKJ9wdcoAnpW52hh+GF
         bbTJzcdQdYlqK+hc7gEorVmA3iOnqzK7AQkPUh7gxIO+32lMXmsuqxWGNupgegYnEjP2
         bOi5xltqOyClBvESSIZMiOCH8lth649/uTqqeB6GRXTSF/DTZOV5vHoDnFxK9TywLday
         +wYl5NNW/o/sNAAsu7o5Ri/gE1i4GKXd1sIf0YT1p/kOjknAZ1qZafr7eXoFVNfyTJ22
         K95w==
X-Forwarded-Encrypted: i=1; AHgh+RoopcGUoe8Snk7LYruBZr4gk+BBYHpP5lQixZOWhTZT1CMctWVzkYtYP9mynSLIwdbx9FVTW4YW/qYVrdza64M/3w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxvcBr/xi/6Hp4K0NPfDFe5L0BcccWOWgCeb7PkSrXrgEJYIwyk
	tzAre+TRd4paaXLS26DHyqUYqfL61tz05hMUhN22bqaiAeLbA/xg1OZaRYGB/yKV910=
X-Gm-Gg: AfdE7cnkC2qMiFtrDRY1Wr4yTYw3RJHc3HbluFTIZspKA5dOtFwr1CK4cMC4k9MfJiw
	JAaIXRVSdTvM6bJNdXJ9nc1pk86OyOSBl9FNVuA72uBRvo1cZPMnlgSif/0zO2k+aPd+4x4PFXC
	g8WKO7l/Jw5E/1uNXHrbPPj6T0/4FhjzaLd9oszx7cNay+Ol0E/uKlnX1scAFCpRzOZS5oci/Z0
	bTfCsK8ThKbVxe75RX+yb+E3kih3rpeuW8WftySoLoSZ3kCR8j/G8Cq7w3+AOHUV5QJxvu3sIPP
	1ThRXwUBA5jZtgdu4PWebiKRO3Ej8LuOVg70jPM4ZR7VUrCJ4I+prNaT2PfGVfHarA3BWaCQglG
	A7nqHIY0QNBMMHh+Ft0d4e+ulR+ON9o1RiGoI/TH+Tahdwn0tTqWEUPiF6LleCQmOVJRj52fGq6
	tBrRFYnc8F2iknbUgS9fKd10Q/UZNWfJCB7UdyCW/dd3IZpUEQUaye+tP1pqsxS1K0DlfB4QY3
X-Received: by 2002:a05:600c:6995:b0:493:bcef:5646 with SMTP id 5b1f17b1804b1-493df06ec87mr60861065e9.12.1783435463271;
        Tue, 07 Jul 2026 07:44:23 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493df7079easm48859705e9.0.2026.07.07.07.44.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 07:44:22 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Jul 2026 16:44:22 +0200
Message-Id: <DJSF3WZIJUES.2JA0ACEULJYDN@smile.fr>
Subject: Re: [OE-core] [meta-oe][scarthgap][PATCH 1/2] samba: Fix
 CVE-2026-3012
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <xe-linux-external@cisco.com>
To: <asparmar@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260707054105.2419361-1-asparmar@cisco.com>
In-Reply-To: <20260707054105.2419361-1-asparmar@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 14:44:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240400

On Tue Jul 7, 2026 at 7:41 AM CEST, Ashishkumar Parmar X (asparmar - E INFO=
CHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Ashishkumar Parmar <asparmar@cisco.com>
>
> This patch applies the upstream Samba security backport for
> CVE-2026-3012. The upstream security bundle is referenced in [1],
> and the public CVE advisory is referenced in [2]. The individual
> backported commit links are recorded in the embedded patch headers.
>
> [1] https://www.samba.org/samba/ftp/patches/security/samba-4.22.9-securit=
y-2026-05-25.patch
> [2] https://www.samba.org/samba/security/CVE-2026-3012.html
>
> Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>

Hello,

Wrong list, you want to send this to openembedded-devel@lists.openembedded.=
org.

Regards,

> ---
>  .../samba/samba/CVE-2026-3012_p1.patch        | 131 ++++++++++++++++++
>  .../samba/samba/CVE-2026-3012_p2.patch        |  51 +++++++
>  .../samba/samba_4.19.9.bb                     |   2 +
>  3 files changed, 184 insertions(+)
>  create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-=
2026-3012_p1.patch
>  create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-=
2026-3012_p2.patch
>
> diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2026-30=
12_p1.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2026-301=
2_p1.patch
> new file mode 100644
> index 0000000000..ce54b2916f
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2026-3012_p1.p=
atch
> @@ -0,0 +1,131 @@
> +From f21f87e0f64dc4aea8c9537f182282077ae6a37b Mon Sep 17 00:00:00 2001
> +From: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
> +Date: Mon, 23 Feb 2026 11:01:57 +1300
> +Subject: [PATCH] CVE-2026-3012: do not fetch certificate over http
> +
> +In the case where a certificate was found via HTTP, it was trusted
> +without verification and put in the global CA store.
> +
> +There is no means to check the certificate other than by comparing it
> +to certificates we may have gathered via LDAP, but in that case there
> +is no advantage over just using the LDAP-derived certificates.
> +
> +Using the LDAP certificates was already the fallback case if HTTP
> +failed, so we just make it the default.
> +
> +The HTTP fetch depends on the NDES service, which is a variant of
> +Simple Certificate Enrolment Protocol (SCEP, RFC8894), but in fact
> +Samba implements none of that protocol other than the HTTP fetch. SCEP
> +is for clients that are not true domain members. Domain members can
> +access to certificates over LDAP. This patch is not reducing SCEP
> +client support because Samba never had it.
> +
> +BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D16003
> +
> +Reported-by: Arad Inbar, DREAM Security Research Team
> +Reported-by: Nir Somech, DREAM Security Research Team
> +Reported-by: Ben Grinberg, DREAM Security Research Team
> +
> +CVE: CVE-2026-3012
> +Upstream-Status: Backport [https://gitlab.com/samba-team/samba/-/commit/=
f21f87e0f64dc4aea8c9537f182282077ae6a37b]
> +
> +Backport Changes:
> +- Adapted python/samba/gp/gp_cert_auto_enroll_ext.py hunks to
> +  Samba 4.19.9 context.
> +- Omitted selftest/knownfail.d/gpo-auto-enrol because the Yocto
> +  recipe does not run upstream Samba selftest.
> +
> +Signed-off-by: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
> +Reviewed-by: Jennifer Sutton <jennifersutton@catalyst.net.nz>
> +(cherry picked from commit f21f87e0f64dc4aea8c9537f182282077ae6a37b)
> +Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
> +---
> +diff --git a/python/samba/gp/gp_cert_auto_enroll_ext.py b/python/samba/g=
p/gp_cert_auto_enroll_ext.py
> +index df3b472..31de4b1 100644
> +--- a/python/samba/gp/gp_cert_auto_enroll_ext.py
> ++++ b/python/samba/gp/gp_cert_auto_enroll_ext.py
> +@@ -16,7 +16,6 @@
> +
> + import os
> + import operator
> +-import requests
> + from samba.gp.gpclass import gp_pol_ext, gp_applier, GPOSTATE
> + from samba import Ldb
> + from ldb import SCOPE_SUBTREE, SCOPE_BASE
> +@@ -200,56 +199,24 @@ def get_supported_templates(server):
> +     return out.strip().split()
> +
> +
> +-def getca(ca, url, trust_dir):
> +-    """Fetch Certificate Chain from the CA."""
> ++def getca(ca, trust_dir):
> ++    """Fetch a certificate from LDAP."""
> +     root_cert =3D os.path.join(trust_dir, '%s.crt' % ca['name'])
> +     root_certs =3D []
> +
> +-    try:
> +-        r =3D requests.get(url=3Durl, params=3D{'operation': 'GetCACert=
',
> +-                                          'message': 'CAIdentifier'})
> +-    except requests.exceptions.ConnectionError:
> +-        log.warn('Failed to establish a new connection')
> +-        r =3D None
> +-    if r is None or r.content =3D=3D b'' or r.headers['Content-Type'] =
=3D=3D 'text/html':
> +-        log.warn('Failed to fetch the root certificate chain.')
> +-        log.warn('The Network Device Enrollment Service is either not' =
+
> +-                 ' installed or not configured.')
> +-        if 'cACertificate' in ca:
> +-            log.warn('Installing the server certificate only.')
> +-            der_certificate =3D base64.b64decode(ca['cACertificate'])
> +-            try:
> +-                cert =3D load_der_x509_certificate(der_certificate)
> +-            except TypeError:
> +-                cert =3D load_der_x509_certificate(der_certificate,
> +-                                                 default_backend())
> +-            cert_data =3D cert.public_bytes(Encoding.PEM)
> +-            with open(root_cert, 'wb') as w:
> +-                w.write(cert_data)
> +-            root_certs.append(root_cert)
> +-        return root_certs
> +-
> +-    if r.headers['Content-Type'] =3D=3D 'application/x-x509-ca-cert':
> ++    if 'cACertificate' in ca:
> ++        log.warn('Installing the server certificate only.')
> ++        der_certificate =3D base64.b64decode(ca['cACertificate'])
> +         # Older versions of load_der_x509_certificate require a backend=
 param
> +         try:
> +-            cert =3D load_der_x509_certificate(r.content)
> ++            cert =3D load_der_x509_certificate(der_certificate)
> +         except TypeError:
> +-            cert =3D load_der_x509_certificate(r.content, default_backe=
nd())
> ++            cert =3D load_der_x509_certificate(der_certificate,
> ++                                             default_backend())
> +         cert_data =3D cert.public_bytes(Encoding.PEM)
> +         with open(root_cert, 'wb') as w:
> +             w.write(cert_data)
> +         root_certs.append(root_cert)
> +-    elif r.headers['Content-Type'] =3D=3D 'application/x-x509-ca-ra-cer=
t':
> +-        certs =3D load_der_pkcs7_certificates(r.content)
> +-        for i in range(0, len(certs)):
> +-            cert =3D certs[i].public_bytes(Encoding.PEM)
> +-            filename, extension =3D root_cert.rsplit('.', 1)
> +-            dest =3D '%s.%d.%s' % (filename, i, extension)
> +-            with open(dest, 'wb') as w:
> +-                w.write(cert)
> +-            root_certs.append(dest)
> +-    else:
> +-        log.warn('getca: Wrong (or missing) MIME content type')
> +
> +     return root_certs
> +
> +@@ -273,8 +240,7 @@ def changed(new_data, old_data):
> + def cert_enroll(ca, ldb, trust_dir, private_dir, auth=3D'Kerberos'):
> +     """Install the root certificate chain."""
> +     data =3D dict({'files': [], 'templates': []}, **ca)
> +-    url =3D 'http://%s/CertSrv/mscep/mscep.dll/pkiclient.exe?' % ca['ho=
stname']
> +-    root_certs =3D getca(ca, url, trust_dir)
> ++    root_certs =3D getca(ca, trust_dir)
> +     data['files'].extend(root_certs)
> +     global_trust_dir =3D find_global_trust_dir()
> +     for src in root_certs:
> +--
> +2.43.0
> diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2026-30=
12_p2.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2026-301=
2_p2.patch
> new file mode 100644
> index 0000000000..e2989dc075
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2026-3012_p2.p=
atch
> @@ -0,0 +1,51 @@
> +From 7337d99ed55c01cd5837029485cd971a48f761c2 Mon Sep 17 00:00:00 2001
> +From: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
> +Date: Thu, 26 Feb 2026 14:21:01 +1300
> +Subject: [PATCH] CVE-2026-3012: gp_auto_enrol: skip CAs not found in
> + LDAP
> +
> +If a certificate is mentioned in a GPO but is not present as a
> +cACertificate attribute on a pKIEnrollmentService object, we have no way
> +of obtaining it, so we might as well forget it.
> +
> +BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D16003
> +
> +CVE: CVE-2026-3012
> +Upstream-Status: Backport [https://gitlab.com/samba-team/samba/-/commit/=
7337d99ed55c01cd5837029485cd971a48f761c2]
> +
> +Signed-off-by: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
> +Reviewed-by: Jennifer Sutton <jennifersutton@catalyst.net.nz>
> +(cherry picked from commit 7337d99ed55c01cd5837029485cd971a48f761c2)
> +Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
> +---
> + python/samba/gp/gp_cert_auto_enroll_ext.py | 10 ++++++++++
> + 1 file changed, 10 insertions(+)
> +
> +diff --git a/python/samba/gp/gp_cert_auto_enroll_ext.py b/python/samba/g=
p/gp_cert_auto_enroll_ext.py
> +index 815436e11e9c..de8b310afd95 100644
> +--- a/python/samba/gp/gp_cert_auto_enroll_ext.py
> ++++ b/python/samba/gp/gp_cert_auto_enroll_ext.py
> +@@ -452,11 +452,21 @@ class gp_cert_auto_enroll_ext(gp_pol_ext, gp_appli=
er):
> +                     # This is a basic configuration.
> +                     cas =3D fetch_certification_authorities(ldb)
> +                     for _ca in cas:
> ++                        if 'cACertificate' not in _ca:
> ++                            log.warning(f"ignoring CA '{_ca['name']}' w=
ith no "
> ++                                        "cACertificate in LDAP.")
> ++                            continue
> ++
> +                         self.apply(guid, _ca, cert_enroll, _ca, ldb, tr=
ust_dir,
> +                                    private_dir)
> +                         ca_names.append(_ca['name'])
> +                 # If EndPoint.URI starts with "HTTPS//":
> +                 elif ca['URL'].lower().startswith('https://'):
> ++                    if 'cACertificate' not in ca:
> ++                        log.warning(f"ignoring CA '{ca['name']}' "
> ++                                    f"({ca['URL']}) with no "
> ++                                    "cACertificate in LDAP.")
> ++                        continue
> +                     self.apply(guid, ca, cert_enroll, ca, ldb, trust_di=
r,
> +                                private_dir, auth=3Dca['auth'])
> +                     ca_names.append(ca['name'])
> +--
> +2.43.0
> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.19.9.bb b=
/meta-networking/recipes-connectivity/samba/samba_4.19.9.bb
> index d50d9f5155..055e404bb9 100644
> --- a/meta-networking/recipes-connectivity/samba/samba_4.19.9.bb
> +++ b/meta-networking/recipes-connectivity/samba/samba_4.19.9.bb
> @@ -24,6 +24,8 @@ SRC_URI =3D "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz =
\
>             file://0005-Fix-pyext_PATTERN-for-cross-compilation.patch \
>             file://0006-smbtorture-skip-test-case-tfork_cmd_send.patch \
>             file://0007-Deleted-settiong-of-python-to-fix-the-install-con=
fli.patch \
> +           file://CVE-2026-3012_p1.patch \
> +           file://CVE-2026-3012_p2.patch \
>             "
> =20
>  SRC_URI:append:libc-musl =3D " \


--=20
Yoann Congal
Smile ECS


