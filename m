Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA0ACC88E77
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 18:46:31 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4068.1789497983424276576
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 11:46:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0/c4iXnw;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912df756so977665e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 11:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789497981; x=1790102781; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/J1NdtjBHjfVJaUbquCxFq8ZDpuTGDy06bWNjfidJko=;
        b=0/c4iXnwY2BW0KOZFo5gnt/YfR8xGVtHsEEcnM7Z5F02qbouXR7ftM3LuIMxcxpSLf
         D3o4dKGO0koxTHGBpW/asK7+I8s7oWa6ULQnCGqTehJLBBJ+4au6AMThwe8iUfJ44E92
         e5NgGj6VjH+oRyHMp6Bz728ZsKHousdh8vvck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789497981; x=1790102781;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/J1NdtjBHjfVJaUbquCxFq8ZDpuTGDy06bWNjfidJko=;
        b=aC7fx87mBStdKkmTHSQ+waos7X1cuWBvfeOW7Y/gx0/fxrR/JYFszVYy6OfmLJZOQq
         bdRiFSAUrDwlrgbrde9XHlCz3PGlCmuBNAnYZpoWNBUnLZFSEsoctlC6i7iYadGepg6j
         ecdRlV/tn3+rGY0KG0QI7ghY/OC/Nuxqc7ARgmo/B3J3fZ86APIMj4Ya1b8hxonjoJ1I
         Blmumx/SCKbWTHAfs8xjF8nFswq14D7OinsRAHHizSDCdJrKTqcJO2LrNk+taIxOU1OP
         vzWFqeRyqSE/RN8lLIhjLKU7Q0ryrcsVe5QHFBJq0hmd3658+R/p+fKnh/wOdXj0F/po
         h8GQ==
X-Forwarded-Encrypted: i=1; AKwUvBzeTu9J/lmL31zeWiCF5jyhss9U8ULnZAjTO9NHBAV+1rO9i948J9TUe2phdn2yzMWESFquw2rZeuFiJ3Jm5ZDhEw==@lists.openembedded.org
X-Gm-Message-State: AFuF++mG6MbWks2UpAkZWG3veeHuENalnh6d9ZMx47/Bz7BkOJ30UXMd
	QxQQuUIv70Oz630lmkYSyyrjPJ274/m07Nw+ruAglQr1okpvIXgWmSYeL5USwMDCSTk=
X-Gm-Gg: AYBFou3t61xqF27RfcA1FquzhKvESe1JK2JKCphq7eHtE5kjtKSIG6gWkNBEp494D65
	9azRgSLkQzRVDOFiD6zJUUMqpxBWc+yJVy8wzToPAzji1Qw2sv/y8HLNo0VQD3KH1JFvx8fZBcj
	8dRCmDDMMZhzal/EJ8u2c+qVh/W4yjGdfzwWA336pCq5MPP/lHr+B1k55bcP7Fmy3ZJIU3vYBs2
	f9BarFXvS3KJ1Pckfc8AikGXS8EnaoEyS9+csAWnGTXJnZ5zcEN7IIxy/E6Wcuc8o4byfqCoUKp
	Pdrqx5Z57t0Q7rFjKgfuugFTLjQgiHtjZYjbvDglJ/69YGv6R5EOF6Dk5oF19fi5rTsbNwrBBc0
	RDTpo9iHe3iiXjpP4eI/A5zEQUWHpVlSD4krBYSiX1RlSr7UsEUx84eGWitWyJSYPRNDcYOsmwr
	5kcfNCxZUYTeQCyLzMXcX0r/n1albeJeVKWscHxJOaHEqW2P2qufPrMRwPAlbUqcxXyw3nIxmaV
	w82vNbwCmFNGhQxgHkmpDxw3dnLsg2SpgtB6aibi5CB91XZ8Kxtd+RDQ75xJHLya6TZL/tk
X-Received: by 2002:a05:600c:4f44:b0:49e:79c5:ee93 with SMTP id 5b1f17b1804b1-49e82222704mr31799115e9.8.1789497981286;
        Tue, 15 Sep 2026 11:46:21 -0700 (PDT)
Received: from localhost (2a02-8440-b506-d593-6943-6b99-9f33-22fb.rev.sfr.net. [2a02:8440:b506:d593:6943:6b99:9f33:22fb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83a89258sm14454755e9.2.2026.09.15.11.46.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 11:46:20 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 15 Sep 2026 20:46:20 +0200
Message-Id: <DLG43B5NPVJA.TFRAC4C2EITZ@smile.fr>
Subject: Re: [wrynose][PATCH 1/5] gnutls: fix CVE-2026-42012
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Jakub Szczudlo (Nokia)" <jakub.szczudlo@nokia.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260909133510.3286-1-jakub.szczudlo@nokia.com>
In-Reply-To: <20260909133510.3286-1-jakub.szczudlo@nokia.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 18:46:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245864

Hello,

On Wed Sep 9, 2026 at 3:35 PM CEST, Jakub Szczudlo (Nokia) wrote:
> Backport patch to fix CVE-2026-42012.
>
> References:
>   https://nvd.nist.gov/vuln/detail/CVE-2026-42012
>
> Upstream fix:
>   https://gitlab.com/gnutls/gnutls/-/commit/8dcc6a1f48945997666ac9f108968=
19edd01a03b
   =20

>
> Tested with ptest
> Pre patches taken from upstream so CVE fix will land cleanly
>
> Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>
> ---
>  .../gnutls/gnutls/CVE-2026-42012-pre1.patch   |  70 ++++++++
>  .../gnutls/gnutls/CVE-2026-42012-pre2.patch   | 153 ++++++++++++++++++
>  .../gnutls/gnutls/CVE-2026-42012.patch        |  48 ++++++
>  meta/recipes-support/gnutls/gnutls_3.8.12.bb  |   3 +
>  4 files changed, 274 insertions(+)
>  create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42012-pre=
1.patch
>  create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42012-pre=
2.patch
>  create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42012.pat=
ch
>
> diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-42012-pre1.patch=
 b/meta/recipes-support/gnutls/gnutls/CVE-2026-42012-pre1.patch
> new file mode 100644
> index 0000000000..1149dafef2
> --- /dev/null
> +++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-42012-pre1.patch

Hello,

While this patch does apply, it has some surprizing format
(CVE-2026-42012.patch looks fine, though):

> @@ -0,0 +1,70 @@
> +Backport of:
> +
   ^ Why this "Backport of"?
> +From 6133fb459b74a9dcfa2d0ff010a4e03c56822d39 Mon Sep 17 00:00:00 2001
> +From: Alexander Sosedkin <asosedkin@redhat.com>
> +Date: Fri, 13 Mar 2026 17:00:03 +0100
> +Subject: [PATCH] x509/hostname-verify: refactor and simplify CN fallback=
 logic
> +
> +Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
> +CVE: CVE-2026-42012
> +Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/613=
3fb459b74a9dcfa2d0ff010a4e03c56822d39]
> +
> +Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>
> +---
> + lib/x509/hostname-verify.c | 15 ++++++---------
> + 1 file changed, 6 insertions(+), 9 deletions(-)
> +

Very minor thing but here we usualy have a "diff ..." line

> +--- a/lib/x509/hostname-verify.c
> ++++ b/lib/x509/hostname-verify.c
> +@@ -108,7 +108,7 @@ unsigned gnutls_x509_crt_check_ip(gnutls
> +  * that we do not fallback to CN-ID if we encounter a supported name
> +  * type.
> +  */
> +-#define IS_SAN_SUPPORTED(san) \
> ++#define PRECLUDES_CN_FALLBACK(san) \
> + 	(san =3D=3D GNUTLS_SAN_DNSNAME || san =3D=3D GNUTLS_SAN_IPADDRESS)
> +=20
> + /**
> +@@ -151,13 +151,12 @@ unsigned gnutls_x509_crt_check_hostname2
> + {
> + 	char dnsname[MAX_CN];
> + 	size_t dnsnamesize;
> +-	int found_dnsname =3D 0;
> + 	int ret =3D 0;
> + 	int i =3D 0;
> + 	struct in_addr ipv4;
> + 	char *p =3D NULL;
> + 	char *a_hostname;
> +-	unsigned have_other_addresses =3D 0;
> ++	bool cn_fallback_allowed =3D true;
> + 	gnutls_datum_t out;
> +=20
> + 	/* check whether @hostname is an ip address */
> +@@ -213,9 +212,10 @@ hostname_fallback:
> + 		ret =3D gnutls_x509_crt_get_subject_alt_name(cert, i, dnsname,
> + 							   &dnsnamesize, NULL);
> +=20
> +-		if (ret =3D=3D GNUTLS_SAN_DNSNAME) {
> +-			found_dnsname =3D 1;
> ++		if (PRECLUDES_CN_FALLBACK(ret))
> ++			cn_fallback_allowed =3D false;
> +=20
> ++		if (ret =3D=3D GNUTLS_SAN_DNSNAME) {
> + 			if (memchr(dnsname, '\0', dnsnamesize)) {
> + 				_gnutls_debug_log(
> + 					"certificate has %s with embedded null in name\n",
> +@@ -236,13 +236,10 @@ hostname_fallback:
> + 				ret =3D 1;
> + 				goto cleanup;
> + 			}
> +-		} else {
> +-			if (IS_SAN_SUPPORTED(ret))
> +-				have_other_addresses =3D 1;
> + 		}
> + 	}
> +=20
> +-	if (!have_other_addresses && !found_dnsname &&
> ++	if (cn_fallback_allowed &&
> + 	    _gnutls_check_key_purpose(cert, GNUTLS_KP_TLS_WWW_SERVER, 0) !=3D =
0) {
> + 		/* did not get the necessary extension, use CN instead, if the
> + 		 * certificate would have been acceptable for a TLS WWW server purpos=
e.
> diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-42012-pre2.patch=
 b/meta/recipes-support/gnutls/gnutls/CVE-2026-42012-pre2.patch
> new file mode 100644
> index 0000000000..c192a144c0
> --- /dev/null
> +++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-42012-pre2.patch
> @@ -0,0 +1,153 @@
> +Backport of:
> +
> +From 5cc003b9688378f6c7934b1df0aa147e80006be4 Mon Sep 17 00:00:00 2001
> +From: Alexander Sosedkin <asosedkin@redhat.com>
> +Date: Fri, 13 Mar 2026 17:41:33 +0100
> +Subject: [PATCH] x509: add bare-bones awareness of SRV virtual SAN
> +
> +There's no support for constraints, no certtool support, no nothing.
> +Just added what's easy to add because I needed a virtual SAN for them.
> +
> +Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
> +CVE: CVE-2026-42012
> +Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/5cc=
003b9688378f6c7934b1df0aa147e80006be4]
> +
> +Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>
> +---
> + lib/includes/gnutls/gnutls.h.in |  4 +++-
> + lib/x509/common.h               |  1 +
> + lib/x509/name_constraints.c     |  3 ++-
> + lib/x509/output.c               |  6 ++++++
> + lib/x509/virt-san.c             | 23 +++++++++++++++++++++++
> + lib/x509/x509.c                 |  3 ++-
> + 6 files changed, 37 insertions(+), 3 deletions(-)
> +
> +--- a/lib/includes/gnutls/gnutls.h.in
> ++++ b/lib/includes/gnutls/gnutls.h.in
> +@@ -2698,6 +2698,7 @@ void gnutls_psk_set_server_params_functi
> +  * @GNUTLS_SAN_OTHERNAME_XMPP: Virtual SAN, used by certain functions f=
or convenience.
> +  * @GNUTLS_SAN_OTHERNAME_KRB5PRINCIPAL: Virtual SAN, used by certain fu=
nctions for convenience.
> +  * @GNUTLS_SAN_OTHERNAME_MSUSERPRINCIPAL: Virtual SAN, used by certain =
functions for convenience.
> ++ * @GNUTLS_SAN_OTHERNAME_SRV: Virtual SAN, used by certain functions fo=
r convenience.
> +  *
> +  * Enumeration of different subject alternative names types.
> +  */
> +@@ -2715,7 +2716,8 @@ typedef enum gnutls_x509_subject_alt_nam
> + 	   Used by gnutls_x509_crt_get_subject_alt_othername_oid.  */
> + 	GNUTLS_SAN_OTHERNAME_XMPP =3D 1000,
> + 	GNUTLS_SAN_OTHERNAME_KRB5PRINCIPAL,
> +-	GNUTLS_SAN_OTHERNAME_MSUSERPRINCIPAL
> ++	GNUTLS_SAN_OTHERNAME_MSUSERPRINCIPAL,
> ++	GNUTLS_SAN_OTHERNAME_SRV
> + } gnutls_x509_subject_alt_name_t;
> +=20
> + struct gnutls_openpgp_crt_int;
> +--- a/lib/x509/common.h
> ++++ b/lib/x509/common.h
> +@@ -107,6 +107,7 @@
> + #define XMPP_OID "1.3.6.1.5.5.7.8.5"
> + #define KRB5_PRINCIPAL_OID "1.3.6.1.5.2.2"
> + #define MSUSER_PRINCIPAL_NAME_OID "1.3.6.1.4.1.311.20.2.3"
> ++#define SRV_OID "1.3.6.1.5.5.7.8.7"
> + #define PKIX1_RSA_PSS_MGF1_OID "1.2.840.113549.1.1.8"
> + #define PKIX1_RSA_OAEP_P_SPECIFIED_OID "1.9"
> +=20
> +--- a/lib/x509/name_constraints.c
> ++++ b/lib/x509/name_constraints.c
> +@@ -516,7 +516,8 @@ static int validate_name_constraints_nod
> + 	if (type !=3D GNUTLS_SAN_DNSNAME && type !=3D GNUTLS_SAN_RFC822NAME &&
> + 	    type !=3D GNUTLS_SAN_DN && type !=3D GNUTLS_SAN_URI &&
> + 	    type !=3D GNUTLS_SAN_IPADDRESS &&
> +-	    type !=3D GNUTLS_SAN_OTHERNAME_MSUSERPRINCIPAL) {
> ++	    type !=3D GNUTLS_SAN_OTHERNAME_MSUSERPRINCIPAL &&
> ++	    type !=3D GNUTLS_SAN_OTHERNAME_SRV) {
> + 		return gnutls_assert_val(GNUTLS_E_X509_UNKNOWN_SAN);
> + 	}
> +=20
> +--- a/lib/x509/output.c
> ++++ b/lib/x509/output.c
> +@@ -121,6 +121,7 @@ static void print_name(gnutls_buffer_st
> + 	if ((type =3D=3D GNUTLS_SAN_DNSNAME || type =3D=3D GNUTLS_SAN_OTHERNAM=
E_XMPP ||
> + 	     type =3D=3D GNUTLS_SAN_OTHERNAME_KRB5PRINCIPAL ||
> + 	     type =3D=3D GNUTLS_SAN_OTHERNAME_MSUSERPRINCIPAL ||
> ++	     type =3D=3D GNUTLS_SAN_OTHERNAME_SRV ||
> + 	     type =3D=3D GNUTLS_SAN_RFC822NAME || type =3D=3D GNUTLS_SAN_URI) =
&&
> + 	    sname !=3D NULL && strlen(sname) !=3D name->size) {
> + 		adds(str, _("warning: SAN contains an embedded NUL, "
> +@@ -180,6 +181,11 @@ static void print_name(gnutls_buffer_st
> + 		     name->size, NON_NULL(name->data));
> + 		break;
> +=20
> ++	case GNUTLS_SAN_OTHERNAME_SRV:
> ++		addf(str, _("%sSRVName: %.*s\n"), prefix, name->size,
> ++		     NON_NULL(name->data));
> ++		break;
> ++
> + 	default:
> + 		addf(str, _("%sUnknown name: "), prefix);
> + 		_gnutls_buffer_hexprint(str, name->data, name->size);
> +--- a/lib/x509/virt-san.c
> ++++ b/lib/x509/virt-san.c
> +@@ -45,6 +45,9 @@ static int san_othername_to_virtual(cons
> + 			 memcmp(oid, MSUSER_PRINCIPAL_NAME_OID,
> + 				sizeof(MSUSER_PRINCIPAL_NAME_OID) - 1) =3D=3D 0)
> + 			return GNUTLS_SAN_OTHERNAME_MSUSERPRINCIPAL;
> ++		else if ((unsigned)size =3D=3D (sizeof(SRV_OID) - 1) &&
> ++			 memcmp(oid, SRV_OID, sizeof(SRV_OID) - 1) =3D=3D 0)
> ++			return GNUTLS_SAN_OTHERNAME_SRV;
> + 	}
> +=20
> + 	return GNUTLS_SAN_OTHERNAME;
> +@@ -59,6 +62,8 @@ static const char *virtual_to_othername_
> + 		return KRB5_PRINCIPAL_OID;
> + 	case GNUTLS_SAN_OTHERNAME_MSUSERPRINCIPAL:
> + 		return MSUSER_PRINCIPAL_NAME_OID;
> ++	case GNUTLS_SAN_OTHERNAME_SRV:
> ++		return SRV_OID;
> + 	default:
> + 		return NULL;
> + 	}
> +@@ -126,6 +131,15 @@ int _gnutls_alt_name_assign_virt_type(st
> + 			name->type =3D GNUTLS_SAN_OTHERNAME;
> + 			break;
> +=20
> ++		case GNUTLS_SAN_OTHERNAME_SRV:
> ++			ret =3D _gnutls_x509_encode_string(ASN1_ETYPE_IA5_STRING,
> ++							 san->data, san->size,
> ++							 &encoded);
> ++			if (ret < 0)
> ++				return gnutls_assert_val(ret);
> ++			name->san =3D _gnutls_steal_datum(&encoded);
                                    ^ This function call is not the same as=
 upstream's patch.
Please document any non-trivial change in the patch file (just after
your signed-off-by).

Can you please send a v2 with the above fixed.

The format "issues" are minor and mainly an issue for me : I compare
upstream patches with the sent one and any format change creates noise.

Thanks!
--=20
Yoann Congal
Smile ECS


