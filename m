Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF52C43458
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 21:57:28 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.80473.1782683842897374337
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jun 2026 14:57:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=JgG3e6ds;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47231f1f8f3so1500273f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Jun 2026 14:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782683841; x=1783288641; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DZB02swzFbzE8Dr+71cY/aOkHNIflZo/e7CXXes7OJc=;
        b=JgG3e6dsJaiuJnQ2KP5ln0FbFUZ0rav2j3vnfG0HmfS5i3rN+PmIqSY+MYghJ8V1+F
         gf7R/VbkhPCuawUiSmCtYI7ArEZPF1iNy6/Ben7dGT0sFpyxdPGgEjf1BMqpeNUPi77u
         wj36sDhWNRQcR2+ditMTHQXeJG3mBK3DPC4jE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782683841; x=1783288641;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DZB02swzFbzE8Dr+71cY/aOkHNIflZo/e7CXXes7OJc=;
        b=MEJF92vwfcMaRf08f6A8R5pMvoPozM+rt5d9GE2+aL/0VaczxFouANf9NH5kp27Dtz
         V/LV2R7tqjrEYfcgkL+xrV2V8rZpBO4Gz+DsSWYs7UJiL+dNk/Gmb8/EKYvzuk0lSSvS
         9k2bo2llaOCfO7d6m77ERw8HULFHUhfEJg+UYz+Z9b62MxlNRHvchGMKLZVZAABICVzW
         U6YNd9FjUKfQvM2hBbqwj3uNxE/5D4UhnIQGRubhESru8+4bH7+/uP3YB0mFQuKJ7Nk5
         rYUtSNLDG64lXRNqfsZF4h3y5kRiE30GjBRWNu+7BP1ro/6D9661+Xef0bZljJBIXE2y
         vsHg==
X-Forwarded-Encrypted: i=1; AHgh+RpT4Nx8qNVCBuZ2KGEiB5g/jJvSVatLcrQ9pC5lS2WbFCa++q7CJNrlM2+RSZk00jU/BKg7ojVGt9ew2UNsQGpjoQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyWrEGA2efAnTUqYxQ4DWyyX77tLzfjNsh/suk46Lr3q+W9GNLJ
	h0hLPphVsJX40eYHH0h5pfH1nThYoiN/NKLnrBE5tl/zApzF8MILlfJ4ZQgOfiNwSrk=
X-Gm-Gg: AfdE7cme2jRHgDGdHcBwaY5BbIjPIiJsPN1G4u8xTm31qBNxFJbKXNXvXdzYG0sktZ2
	T3CAgddsJAirUVO90LF/OW0lr6XANs0qddsB5YWX3CGcuoJ0fylIKzNM5SIL4aQl7LORfa2qIBd
	sDQqxMcIIk+QbMdVrZEzcW9QXoQqwkArhqv9Rk/nOKm+0KTsqV39PPkrn5jfT7EPgEYvCYgdXMd
	JVHohY3w2q63ACAZ8U65P10ztP3CYflEUBisF1g0+Zml5T43nWn5xatQaMpIXEp6rfn/ls7BUEB
	/DS2lUJLs2MUD5fP9K5000Nj5znxOLLLNjEBhl+CGoMAFLSOyItqkDCB6/WZiJYP7pRshXR7tga
	k/VJQrbrDuglLjpJ9pVHj9Q/FnDUfaWKnp7o8Wlpnngm6rLgHNJi/qvZecFf8d6L0P6K35gK99s
	zVMjZBG+AiHYiErZsft6dL6pytgMXTU2r2ie+sazfWkmrEWrjJ2FLOouv7duz+D0YH6Lo18y32E
	grA7A==
X-Received: by 2002:a05:6000:250d:b0:460:6a13:9131 with SMTP id ffacd0b85a97d-46dbfab5605mr24337417f8f.19.1782683841031;
        Sun, 28 Jun 2026 14:57:21 -0700 (PDT)
Received: from localhost (2a01cb001331aa004db220001799fd29.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:4db2:2000:1799:fd29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47290ed4377sm10291912f8f.37.2026.06.28.14.57.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 14:57:20 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 28 Jun 2026 23:57:20 +0200
Message-Id: <DJL0OIF53N7U.2AAPEB2LOEEDT@smile.fr>
Subject: Re: [OE-core] [scarthgap] [PATCH 8/8] cups: Fix CVE-2026-41079
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <xe-linux-external@cisco.com>, <to@cisco.com>
To: <adongare@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260623113037.28968-1-adongare@cisco.com>
 <20260623113037.28968-8-adongare@cisco.com>
In-Reply-To: <20260623113037.28968-8-adongare@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Jun 2026 21:57:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239717

On Tue Jun 23, 2026 at 1:30 PM CEST, Anil Dongare -X (adongare - E INFOCHIP=
S PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Anil Dongare <adongare@cisco.com>
>
> Pick the upstream patch [1] as mentioned in [2].
>
> [1] https://github.com/OpenPrinting/cups/commit/b7c2525a885f528d243c3a921=
97ca99609b3f080
> [2] https://security-tracker.debian.org/tracker/CVE-2026-41079
>
> Signed-off-by: Anil Dongare <adongare@cisco.com>

As far as I know, this fix is also needed on wrynose:
CVE-2026-41079 impacts "up to 2.4.17 excluding" per NVD and wrynose has 2.4=
.16.

Can you send a fix for wrynose so I can take this one for scarthgap?

> ---
>  meta/recipes-extended/cups/cups.inc           |  1 +
>  .../cups/cups/CVE-2026-27447.patch            |  4 +-
>  .../cups/cups/CVE-2026-34978.patch            | 25 +++++--
>  .../cups/CVE-2026-34980-regression_p2.patch   |  8 +--
>  .../cups/cups/CVE-2026-34990.patch            | 19 ++---
>  .../cups/cups/CVE-2026-41079.patch            | 72 +++++++++++++++++++

This patch touches a lot of patches added previously in the series. I
think this is a mistake and those changes should either be dropped or
squashed in the proper commit.

Can you send a v2 of the whole series with this cleaned up?
Please split CVE-2026-41079 and CVE-2026-27447 into another series as
those need a wrynose fix.

Thanks!


>  6 files changed, 106 insertions(+), 23 deletions(-)
>  create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-41079.patch


>
> diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/=
cups/cups.inc
> index c2bf572bf5..64f71c9465 100644
> --- a/meta/recipes-extended/cups/cups.inc
> +++ b/meta/recipes-extended/cups/cups.inc
> @@ -31,6 +31,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/cups-${=
PV}-source.tar.gz \
>             file://CVE-2026-34990.patch \
>             file://CVE-2026-39314.patch \
>             file://CVE-2026-39316.patch \
> +           file://CVE-2026-41079.patch \
>             "
> =20
>  GITHUB_BASE_URI =3D "https://github.com/OpenPrinting/cups/releases"
> diff --git a/meta/recipes-extended/cups/cups/CVE-2026-27447.patch b/meta/=
recipes-extended/cups/cups/CVE-2026-27447.patch
> index 77a26dae64..1884acfa9f 100644
> --- a/meta/recipes-extended/cups/cups/CVE-2026-27447.patch
> +++ b/meta/recipes-extended/cups/cups/CVE-2026-27447.patch
> @@ -22,9 +22,9 @@ diff --git a/CHANGES.md b/CHANGES.md
>  index 4a2e25d..0da2c55 100644
>  --- a/CHANGES.md
>  +++ b/CHANGES.md
> -@@ -4,6 +4,8 @@ CHANGES - OpenPrinting CUPS 2.4.10 - (2024-06-18)
> +@@ -21,6 +21,8 @@
>   Changes in CUPS v2.4.10 (2024-06-18)
> - -----------------------------
> + ------------------------------------
>  =20
>  +- CVE-2026-27447: The scheduler treated local user and group names as c=
ase-
>  +  insensitive.
> diff --git a/meta/recipes-extended/cups/cups/CVE-2026-34978.patch b/meta/=
recipes-extended/cups/cups/CVE-2026-34978.patch
> index d05bc85588..b4b83a41d0 100644
> --- a/meta/recipes-extended/cups/cups/CVE-2026-34978.patch
> +++ b/meta/recipes-extended/cups/cups/CVE-2026-34978.patch
> @@ -22,13 +22,10 @@ diff --git a/CHANGES.md b/CHANGES.md
>  index 7a5e8813f..429ee874f 100644
>  --- a/CHANGES.md
>  +++ b/CHANGES.md
> -@@ -21,9 +21,11 @@ Changes in CUPS v2.4.11 (2024-09-30)
> - Changes in CUPS v2.4.10 (2024-06-18)
> - ------------------------------------
> -=20
> +@@ -24,6 +24,8 @@
>   - CVE-2026-27447: The scheduler treated local user and group names as c=
ase-
>     insensitive.
> -- Fixed cupsd crash if user does not exist (Issue #1555)
> + - Fixed cupsd crash if user does not exist (Issue #1555)
>  +- CVE-2026-34978: The RSS notifier could write outside the scheduler's =
RSS
>  +  directory.
>   - Fixed error handling when reading a mixed `1setOf` attribute.
> @@ -100,3 +97,21 @@ index 2d80a960e..2dc7376c1 100644
>  +	{
>  +	  send_ipp_status(con, IPP_STATUS_ERROR_NOT_POSSIBLE, _("Bad notify-re=
cipient-uri URI \"%s\"."), recipient);
>  +	  ippAddInteger(con->response, IPP_TAG_SUBSCRIPTION, IPP_TAG_ENUM, "no=
tify-status-code", IPP_STATUS_ERROR_ATTRIBUTES_OR_VALUES);
> ++	  return;
> ++	}
> +       }
> +       else if (!strcmp(attr->name, "notify-pull-method") &&
> +                attr->value_tag =3D=3D IPP_TAG_KEYWORD)
> +@@ -6010,6 +6016,12 @@ create_subscriptions(
> + 	                "notify-status-code", IPP_ATTRIBUTES);
> + 	  return;
> + 	}
> ++	else if (!strcmp(scheme, "rss") && strstr(resource, "../") !=3D NULL)
> ++	{
> ++	  send_ipp_status(con, IPP_STATUS_ERROR_NOT_POSSIBLE, _("Bad notify-re=
cipient-uri URI \"%s\"."), recipient);
> ++	  ippAddInteger(con->response, IPP_TAG_SUBSCRIPTION, IPP_TAG_ENUM, "no=
tify-status-code", IPP_STATUS_ERROR_ATTRIBUTES_OR_VALUES);
> ++	  return;
> ++	}
> +       }
> +       else if (!strcmp(attr->name, "notify-pull-method") &&
> +                attr->value_tag =3D=3D IPP_TAG_KEYWORD)
> diff --git a/meta/recipes-extended/cups/cups/CVE-2026-34980-regression_p2=
.patch b/meta/recipes-extended/cups/cups/CVE-2026-34980-regression_p2.patch
> index 73846cb8a3..0cf63b10af 100644
> --- a/meta/recipes-extended/cups/cups/CVE-2026-34980-regression_p2.patch
> +++ b/meta/recipes-extended/cups/cups/CVE-2026-34980-regression_p2.patch
> @@ -43,10 +43,10 @@ index 25e9d65..fe60890 100644
>   #
>   # Test the lp command.
>   #
> --# Copyright =C2=A9 2020-2024 by OpenPrinting.
> -+# Copyright =C2=A9 2020-2026 by OpenPrinting.
> - # Copyright =C2=A9 2007-2019 by Apple Inc.
> - # Copyright =C2=A9 1997-2005 by Easy Software Products, all rights rese=
rved.
> +-# Copyright =C2=A9=C2=A02020-2024 by OpenPrinting.
> ++# Copyright =C2=A9=C2=A02020-2026 by OpenPrinting.
> + # Copyright =C2=A9=C2=A02007-2019 by Apple Inc.
> + # Copyright =C2=A9=C2=A01997-2005 by Easy Software Products, all rights=
 reserved.
>   #
>  @@ -72,8 +72,8 @@ echo ""
>  =20
> diff --git a/meta/recipes-extended/cups/cups/CVE-2026-34990.patch b/meta/=
recipes-extended/cups/cups/CVE-2026-34990.patch
> index e3d6e10a23..916cdc09a3 100644
> --- a/meta/recipes-extended/cups/cups/CVE-2026-34990.patch
> +++ b/meta/recipes-extended/cups/cups/CVE-2026-34990.patch
> @@ -147,10 +147,10 @@ index 1dd520d..56855fc 100644
>     {
>       OSStatus		status;		/* Status */
>       char		authdata[HTTP_MAX_VALUE];
> -@@ -399,7 +399,8 @@ cupsdAuthorize(cupsd_client_t *con)	/* I - Client co=
nnection */
> +@@ -399,6 +399,7 @@ cupsdAuthorize(cupsd_client_t *con)	/* I - Client co=
nnection */
>   #endif /* HAVE_AUTHORIZATION_H */
>   #if defined(SO_PEERCRED) && defined(AF_LOCAL)
> --  else if (!strncmp(authorization, "PeerCred ", 9) &&
> +-  else if (PeerCred !=3D CUPSD_PEERCRED_OFF && !strncmp(authorization, =
"PeerCred ", 9) &&
>  -           con->http->hostaddr->addr.sa_family =3D=3D AF_LOCAL && con->=
best)
>  +  else if (PeerCred !=3D CUPSD_PEERCRED_OFF &&
>  +           !strncmp(authorization, "PeerCred ", 9) &&
> @@ -202,24 +202,19 @@ index b0d1f5b..11dcd39 100644
>     {
>       send_ipp_status(con, IPP_STATUS_ERROR_FORBIDDEN, _("Only local user=
s can create a local printer."));
>       return;
> -@@ -5621,9 +5621,15 @@ create_local_printer(
> -=20
> -   ptr =3D ippGetString(device_uri, 0, NULL);
> -=20
> --  if (!ptr || !ptr[0])
> -+  if (!ptr || !ptr[0])
> -  {
> --    send_ipp_status(con, IPP_STATUS_ERROR_BAD_REQUEST, _("Attribute \"%=
s\" has empty value."), "device-uri");
> -+    send_ipp_status(con, IPP_STATUS_ERROR_BAD_REQUEST, _("Attribute \"%=
s\" has empty value."), "device-uri");
> +@@ -5634,6 +5634,12 @@ create_local_printer(
>  =20
>       return;
>     }
>  +  else if (strncmp(ptr, "ipp://", 6) && strncmp(ptr, "ipps://", 7))
>  +  {
>  +    send_ipp_status(con, IPP_STATUS_ERROR_NOT_POSSIBLE, _("Bad device-u=
ri \"%s\"."), ptr);
> -+=20
> ++
>  +    return;
>  +  }
> +=20
> +   printer_geo_location =3D ippFindAttribute(con->request, "printer-geo-=
location", IPP_TAG_URI);
> +   printer_info         =3D ippFindAttribute(con->request, "printer-info=
", IPP_TAG_TEXT);
>  diff --git a/scheduler/job.c b/scheduler/job.c
>  index 880c25f..6c033de 100644
>  --- a/scheduler/job.c
> diff --git a/meta/recipes-extended/cups/cups/CVE-2026-41079.patch b/meta/=
recipes-extended/cups/cups/CVE-2026-41079.patch
> new file mode 100644
> index 0000000000..f216c84e30
> --- /dev/null
> +++ b/meta/recipes-extended/cups/cups/CVE-2026-41079.patch
> @@ -0,0 +1,72 @@
> +From b8730b3e18852d203f7fa86a05ed0a8aa3a791e5 Mon Sep 17 00:00:00 2001
> +From: Michael R Sweet <msweet@msweet.org>
> +Date: Mon, 13 Apr 2026 11:50:23 -0400
> +Subject: [PATCH] Limit num_bytes for SNMP string values.
> +
> +CVE: CVE-2026-41079
> +Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/b=
7c2525a885f528d243c3a92197ca99609b3f080]
> +
> +(cherry picked from commit b7c2525a885f528d243c3a92197ca99609b3f080)
> +Signed-off-by: Anil Dongare <adongare@cisco.com>
> +---
> + cups/snmp-private.h | 6 +++---
> + cups/snmp.c         | 8 ++++++--
> + 2 files changed, 9 insertions(+), 5 deletions(-)
> +
> +diff --git a/cups/snmp-private.h b/cups/snmp-private.h
> +index 52b8740..015f53e 100644
> +--- a/cups/snmp-private.h
> ++++ b/cups/snmp-private.h
> +@@ -1,7 +1,7 @@
> + /*
> +  * Private SNMP definitions for CUPS.
> +  *
> +- * Copyright =C2=A9=C2=A02020-2024 by OpenPrinting.
> ++ * Copyright =C2=A9=C2=A02020-2026 by OpenPrinting.
> +  * Copyright =C2=A9=C2=A02007-2014 by Apple Inc.
> +  * Copyright =C2=A9=C2=A02006-2007 by Easy Software Products, all right=
s reserved.
> +  *
> +@@ -58,9 +58,9 @@ typedef enum cups_asn1_e cups_asn1_t;	/**** ASN1 reque=
st/object types ****/
> +=20
> + typedef struct cups_snmp_string_s	/**** String value ****/
> + {
> +-  unsigned char	bytes[CUPS_SNMP_MAX_STRING];
> +-					/* Bytes in string */
> +   unsigned	num_bytes;		/* Number of bytes */
> ++  unsigned char	bytes[CUPS_SNMP_MAX_STRING + 1];
> ++					/* Bytes in string */
> + } cups_snmp_string_t;
> +=20
> + union cups_snmp_value_u			/**** Object value ****/
> +diff --git a/cups/snmp.c b/cups/snmp.c
> +index 54e348f..3222ff3 100644
> +--- a/cups/snmp.c
> ++++ b/cups/snmp.c
> +@@ -1,7 +1,7 @@
> + /*
> +  * SNMP functions for CUPS.
> +  *
> +- * Copyright =C2=A9 2020-2024 by OpenPrinting.
> ++ * Copyright =C2=A9 2020-2026 by OpenPrinting.
> +  * Copyright =C2=A9=C2=A02007-2019 by Apple Inc.
> +  * Copyright =C2=A9=C2=A02006-2007 by Easy Software Products, all right=
s reserved.
> +  *
> +@@ -1042,10 +1042,14 @@ asn1_decode_snmp(unsigned char *buffer,	/* I - B=
uffer */
> + 	        case CUPS_ASN1_OCTET_STRING :
> + 	        case CUPS_ASN1_BIT_STRING :
> + 	        case CUPS_ASN1_HEX_STRING :
> +-		    packet->object_value.string.num_bytes =3D length;
> + 		    asn1_get_string(&bufptr, bufend, length,
> + 		                    (char *)packet->object_value.string.bytes,
> + 				    sizeof(packet->object_value.string.bytes));
> ++
> ++		    if (length >=3D sizeof(packet->object_value.string.bytes))
> ++		      packet->object_value.string.num_bytes =3D sizeof(packet->object=
_value.string.bytes) - 1;
> ++		    else
> ++		      packet->object_value.string.num_bytes =3D length;
> + 	            break;
> +=20
> + 	        case CUPS_ASN1_OID :
> +--=20
> +2.43.7
> +


--=20
Yoann Congal
Smile ECS


