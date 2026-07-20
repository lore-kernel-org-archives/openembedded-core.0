Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A681C4452A
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 14:11:11 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9891.1784556662715154436
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 07:11:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=oPeL2TYS;
 spf=pass (domain: smile.fr, ip: 209.85.208.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-69e8ea2783aso2831476a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 07:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784556661; x=1785161461; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1d6Tepf3R3qxZIj3UjGS8vjolWqlZOXuVNbm0LZ/Sgg=;
        b=oPeL2TYSVbhsN9Mz1nGTHh4HxP1h5pWyrB4jpo3aqlikaU5ESvUnkk+niDJwdtj/SX
         qvZT1dHYgrjALduv8+PN9TO74ZTvWo/gHW+KhEfKrhWIz6XEkNnZADc+yZHefcZwH6hU
         sPVn2hMCK/YG2oxiJenBTLh22eUz5wvhpVwdc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784556661; x=1785161461;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1d6Tepf3R3qxZIj3UjGS8vjolWqlZOXuVNbm0LZ/Sgg=;
        b=JeJ3BTMG02Yr31j+V1Rfz98ZFPuIsIRq+c5rHURZYALoCQa7E16wr/V8K086EHmO+C
         3HfM0jgFEJVdZRFoyruwZEwlnnoo3zTrFKxCyKajIIeaCDZGFgh+TYAIDHMBpDySN8zT
         fSY2PC84U6U5SAY+wBd0UpKJ2pynwsi/hChPbuXksi1C79sFZ3L2xiWSjfEhwi9rkOXl
         VFEw2qwRk3qrVH7EAjjAhUB4DbxOnNbWeDKsuUEncN8GY8uV37vAfREIu2lZUka4GqxW
         aMDp04WeMSAn9evFy2ZgqwE7q+bK86lJBvkU9Ycxn0kvvwbBrDKLo5o7xF2dJGxoqSti
         bfLQ==
X-Forwarded-Encrypted: i=1; AHgh+RpeDeaBbe2U3gdxyfrCTLK8bGmNU+StYoAc+lbmMEQwuM1jCZPRRAEHNPUGuWpHZpBh2DLaYomrwD8WI6Pw3YMNcA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxHOMHGC+HZcXw3Xux7ktaIkV5B1YKiZHi5VstlS4W1tEbCoeRe
	+pPb30eBv1FNFexP2tkMGrnGRYTzWLFmUxxQ3h+NqWDnNVIIzEGd+b2VRlcGI3+XFzMkNDJKV5S
	MLn/CG5p8tg==
X-Gm-Gg: AfdE7ckaFLgVrRPvM38kUGZduuOZB2gfEGU7eA7d/VNg2GAka6maOPlb1Wp7JQa4K5X
	v9RVKVqIKGGBp36pCUdGM1dGXbu7zd8qVH4f/PZXp5+mL981w1PAxnRN9EpStaRQzSivDann3Ga
	SFoVhrRVzBL+O3iRRZ3nLlzts8MTgv0cI/IJnZe4nopB6b2nkYr26GDmWomJQQUWaP+TQi0kAht
	egAq4bR+kcdH+3bhodropWvM58Ru7GTP+FN036b8y8lnIo3iReLLgE0uApHLoqNOvELhACPmUG3
	MNXfgGGuhcCYC3DLfTsQhQfYx/EfK/oql1PDNMbRLKcgjkMTLPbq2fU0COyX+aMLmHgbQ0pSOfV
	SKLfaGLDVmdg6CGL4uyTNOChMEEh6I6Lb6Vf0lIM9TMg33EHv/fiXb34lGHJ1Xb3SStqeNFx02i
	bthZ9llhKnanz0y4zmb/hzzqAyCOUf2vM1kJf7W535WBCf0jk+jSXHHwpia0hvQw==
X-Received: by 2002:a17:907:ca84:b0:c16:12ff:dc93 with SMTP id a640c23a62f3a-c16b46d8f5bmr496909366b.18.1784556660717;
        Mon, 20 Jul 2026 07:11:00 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1724f50aabsm464996866b.44.2026.07.20.07.10.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 07:11:00 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Jul 2026 16:10:59 +0200
Message-Id: <DK3GJFTCQ7JU.3J1XZ185ILGS5@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)"
 <deeratho@cisco.com>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap] [PATCH 8/8] cups: Fix CVE-2026-41079
X-Mailer: aerc 0.20.0
References: <20260623113037.28968-1-adongare@cisco.com>
 <20260623113037.28968-8-adongare@cisco.com>
 <DJL0OIF53N7U.2AAPEB2LOEEDT@smile.fr>
 <CY5PR11MB6187FB6F4790AEC08A95E75CC4C32@CY5PR11MB6187.namprd11.prod.outlook.com>
In-Reply-To: <CY5PR11MB6187FB6F4790AEC08A95E75CC4C32@CY5PR11MB6187.namprd11.prod.outlook.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 14:11:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241404

On Mon Jul 20, 2026 at 2:39 PM CEST, Deepak Rathore -X (deeratho - E INFOCH=
IPS PRIVATE LIMITED at Cisco) wrote:
> Hi Yoann,
> Thank you for your review.
> Regarding your request below:
> "Can you send a v2 of the whole series with this cleaned up?
> Please split CVE-2026-41079 and CVE-2026-27447 into another series as tho=
se need a wrynose fix."
> The wrynose fixes for both CVE-2026-41079 and CVE-2026-27447 have since b=
een merged.
> Given that the required wrynose fixes are already in place, could you ple=
ase confirm whether you would still prefer the v2 submission to be split in=
to two separate series, or if we can resend the cleaned-up v2 as a single p=
atch series?
> Thanks for your guidance.
> Regards,
> Deepak Rathore

Indeed, in the meantime, those 2 merged on wrynose:
* 6aa0976fa62 - cups: fix CVE-2026-41079=20
* b36ab95b537 - cups: fix CVE-2026-27447

So you can send a single fixed v2 patch series.

Thanks!


> ________________________________
> From: Yoann Congal <yoann.congal@smile.fr>
> Sent: Monday, June 29, 2026 3:27 AM
> To: Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco) <ad=
ongare@cisco.com>; openembedded-core@lists.openembedded.org <openembedded-c=
ore@lists.openembedded.org>
> Cc: xe-linux-external (Internal Group) <xe-linux-external@cisco.com>; to@=
cisco.com <to@cisco.com>
> Subject: Re: [OE-core] [scarthgap] [PATCH 8/8] cups: Fix CVE-2026-41079
>
> On Tue Jun 23, 2026 at 1:30 PM CEST, Anil Dongare -X (adongare - E INFOCH=
IPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
>> From: Anil Dongare <adongare@cisco.com>
>>
>> Pick the upstream patch [1] as mentioned in [2].
>>
>> [1] https://github.com/OpenPrinting/cups/commit/b7c2525a885f528d243c3a92=
197ca99609b3f080
>> [2] https://security-tracker.debian.org/tracker/CVE-2026-41079
>>
>> Signed-off-by: Anil Dongare <adongare@cisco.com>
>
> As far as I know, this fix is also needed on wrynose:
> CVE-2026-41079 impacts "up to 2.4.17 excluding" per NVD and wrynose has 2=
.4.16.
>
> Can you send a fix for wrynose so I can take this one for scarthgap?
>
>> ---
>>  meta/recipes-extended/cups/cups.inc           |  1 +
>>  .../cups/cups/CVE-2026-27447.patch            |  4 +-
>>  .../cups/cups/CVE-2026-34978.patch            | 25 +++++--
>>  .../cups/CVE-2026-34980-regression_p2.patch   |  8 +--
>>  .../cups/cups/CVE-2026-34990.patch            | 19 ++---
>>  .../cups/cups/CVE-2026-41079.patch            | 72 +++++++++++++++++++
>
> This patch touches a lot of patches added previously in the series. I
> think this is a mistake and those changes should either be dropped or
> squashed in the proper commit.
>
> Can you send a v2 of the whole series with this cleaned up?
> Please split CVE-2026-41079 and CVE-2026-27447 into another series as
> those need a wrynose fix.
>
> Thanks!
>
>
>>  6 files changed, 106 insertions(+), 23 deletions(-)
>>  create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-41079.patch
>
>
>>
>> diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended=
/cups/cups.inc
>> index c2bf572bf5..64f71c9465 100644
>> --- a/meta/recipes-extended/cups/cups.inc
>> +++ b/meta/recipes-extended/cups/cups.inc
>> @@ -31,6 +31,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/cups-$=
{PV}-source.tar.gz \
>>             file://CVE-2026-34990.patch \
>>             file://CVE-2026-39314.patch \
>>             file://CVE-2026-39316.patch \
>> +           file://CVE-2026-41079.patch \
>>             "
>>
>>  GITHUB_BASE_URI =3D "https://github.com/OpenPrinting/cups/releases"
>> diff --git a/meta/recipes-extended/cups/cups/CVE-2026-27447.patch b/meta=
/recipes-extended/cups/cups/CVE-2026-27447.patch
>> index 77a26dae64..1884acfa9f 100644
>> --- a/meta/recipes-extended/cups/cups/CVE-2026-27447.patch
>> +++ b/meta/recipes-extended/cups/cups/CVE-2026-27447.patch
>> @@ -22,9 +22,9 @@ diff --git a/CHANGES.md b/CHANGES.md
>>  index 4a2e25d..0da2c55 100644
>>  --- a/CHANGES.md
>>  +++ b/CHANGES.md
>> -@@ -4,6 +4,8 @@ CHANGES - OpenPrinting CUPS 2.4.10 - (2024-06-18)
>> +@@ -21,6 +21,8 @@
>>   Changes in CUPS v2.4.10 (2024-06-18)
>> - -----------------------------
>> + ------------------------------------
>>
>>  +- CVE-2026-27447: The scheduler treated local user and group names as =
case-
>>  +  insensitive.
>> diff --git a/meta/recipes-extended/cups/cups/CVE-2026-34978.patch b/meta=
/recipes-extended/cups/cups/CVE-2026-34978.patch
>> index d05bc85588..b4b83a41d0 100644
>> --- a/meta/recipes-extended/cups/cups/CVE-2026-34978.patch
>> +++ b/meta/recipes-extended/cups/cups/CVE-2026-34978.patch
>> @@ -22,13 +22,10 @@ diff --git a/CHANGES.md b/CHANGES.md
>>  index 7a5e8813f..429ee874f 100644
>>  --- a/CHANGES.md
>>  +++ b/CHANGES.md
>> -@@ -21,9 +21,11 @@ Changes in CUPS v2.4.11 (2024-09-30)
>> - Changes in CUPS v2.4.10 (2024-06-18)
>> - ------------------------------------
>> -
>> +@@ -24,6 +24,8 @@
>>   - CVE-2026-27447: The scheduler treated local user and group names as =
case-
>>     insensitive.
>> -- Fixed cupsd crash if user does not exist (Issue #1555)
>> + - Fixed cupsd crash if user does not exist (Issue #1555)
>>  +- CVE-2026-34978: The RSS notifier could write outside the scheduler's=
 RSS
>>  +  directory.
>>   - Fixed error handling when reading a mixed `1setOf` attribute.
>> @@ -100,3 +97,21 @@ index 2d80a960e..2dc7376c1 100644
>>  +    {
>>  +      send_ipp_status(con, IPP_STATUS_ERROR_NOT_POSSIBLE, _("Bad notif=
y-recipient-uri URI \"%s\"."), recipient);
>>  +      ippAddInteger(con->response, IPP_TAG_SUBSCRIPTION, IPP_TAG_ENUM,=
 "notify-status-code", IPP_STATUS_ERROR_ATTRIBUTES_OR_VALUES);
>> ++      return;
>> ++    }
>> +       }
>> +       else if (!strcmp(attr->name, "notify-pull-method") &&
>> +                attr->value_tag =3D=3D IPP_TAG_KEYWORD)
>> +@@ -6010,6 +6016,12 @@ create_subscriptions(
>> +                      "notify-status-code", IPP_ATTRIBUTES);
>> +        return;
>> +      }
>> ++    else if (!strcmp(scheme, "rss") && strstr(resource, "../") !=3D NU=
LL)
>> ++    {
>> ++      send_ipp_status(con, IPP_STATUS_ERROR_NOT_POSSIBLE, _("Bad notif=
y-recipient-uri URI \"%s\"."), recipient);
>> ++      ippAddInteger(con->response, IPP_TAG_SUBSCRIPTION, IPP_TAG_ENUM,=
 "notify-status-code", IPP_STATUS_ERROR_ATTRIBUTES_OR_VALUES);
>> ++      return;
>> ++    }
>> +       }
>> +       else if (!strcmp(attr->name, "notify-pull-method") &&
>> +                attr->value_tag =3D=3D IPP_TAG_KEYWORD)
>> diff --git a/meta/recipes-extended/cups/cups/CVE-2026-34980-regression_p=
2.patch b/meta/recipes-extended/cups/cups/CVE-2026-34980-regression_p2.patc=
h
>> index 73846cb8a3..0cf63b10af 100644
>> --- a/meta/recipes-extended/cups/cups/CVE-2026-34980-regression_p2.patch
>> +++ b/meta/recipes-extended/cups/cups/CVE-2026-34980-regression_p2.patch
>> @@ -43,10 +43,10 @@ index 25e9d65..fe60890 100644
>>   #
>>   # Test the lp command.
>>   #
>> --# Copyright =C2=A9 2020-2024 by OpenPrinting.
>> -+# Copyright =C2=A9 2020-2026 by OpenPrinting.
>> - # Copyright =C2=A9 2007-2019 by Apple Inc.
>> - # Copyright =C2=A9 1997-2005 by Easy Software Products, all rights res=
erved.
>> +-# Copyright =C2=A9 2020-2024 by OpenPrinting.
>> ++# Copyright =C2=A9 2020-2026 by OpenPrinting.
>> + # Copyright =C2=A9 2007-2019 by Apple Inc.
>> + # Copyright =C2=A9 1997-2005 by Easy Software Products, all rights res=
erved.
>>   #
>>  @@ -72,8 +72,8 @@ echo ""
>>
>> diff --git a/meta/recipes-extended/cups/cups/CVE-2026-34990.patch b/meta=
/recipes-extended/cups/cups/CVE-2026-34990.patch
>> index e3d6e10a23..916cdc09a3 100644
>> --- a/meta/recipes-extended/cups/cups/CVE-2026-34990.patch
>> +++ b/meta/recipes-extended/cups/cups/CVE-2026-34990.patch
>> @@ -147,10 +147,10 @@ index 1dd520d..56855fc 100644
>>     {
>>       OSStatus                status;         /* Status */
>>       char            authdata[HTTP_MAX_VALUE];
>> -@@ -399,7 +399,8 @@ cupsdAuthorize(cupsd_client_t *con)      /* I - Cli=
ent connection */
>> +@@ -399,6 +399,7 @@ cupsdAuthorize(cupsd_client_t *con)      /* I - Cli=
ent connection */
>>   #endif /* HAVE_AUTHORIZATION_H */
>>   #if defined(SO_PEERCRED) && defined(AF_LOCAL)
>> --  else if (!strncmp(authorization, "PeerCred ", 9) &&
>> +-  else if (PeerCred !=3D CUPSD_PEERCRED_OFF && !strncmp(authorization,=
 "PeerCred ", 9) &&
>>  -           con->http->hostaddr->addr.sa_family =3D=3D AF_LOCAL && con-=
>best)
>>  +  else if (PeerCred !=3D CUPSD_PEERCRED_OFF &&
>>  +           !strncmp(authorization, "PeerCred ", 9) &&
>> @@ -202,24 +202,19 @@ index b0d1f5b..11dcd39 100644
>>     {
>>       send_ipp_status(con, IPP_STATUS_ERROR_FORBIDDEN, _("Only local use=
rs can create a local printer."));
>>       return;
>> -@@ -5621,9 +5621,15 @@ create_local_printer(
>> -
>> -   ptr =3D ippGetString(device_uri, 0, NULL);
>> -
>> --  if (!ptr || !ptr[0])
>> -+  if (!ptr || !ptr[0])
>> -  {
>> --    send_ipp_status(con, IPP_STATUS_ERROR_BAD_REQUEST, _("Attribute \"=
%s\" has empty value."), "device-uri");
>> -+    send_ipp_status(con, IPP_STATUS_ERROR_BAD_REQUEST, _("Attribute \"=
%s\" has empty value."), "device-uri");
>> +@@ -5634,6 +5634,12 @@ create_local_printer(
>>
>>       return;
>>     }
>>  +  else if (strncmp(ptr, "ipp://", 6) && strncmp(ptr, "ipps://", 7))
>>  +  {
>>  +    send_ipp_status(con, IPP_STATUS_ERROR_NOT_POSSIBLE, _("Bad device-=
uri \"%s\"."), ptr);
>> -+
>> ++
>>  +    return;
>>  +  }
>> +
>> +   printer_geo_location =3D ippFindAttribute(con->request, "printer-geo=
-location", IPP_TAG_URI);
>> +   printer_info         =3D ippFindAttribute(con->request, "printer-inf=
o", IPP_TAG_TEXT);
>>  diff --git a/scheduler/job.c b/scheduler/job.c
>>  index 880c25f..6c033de 100644
>>  --- a/scheduler/job.c
>> diff --git a/meta/recipes-extended/cups/cups/CVE-2026-41079.patch b/meta=
/recipes-extended/cups/cups/CVE-2026-41079.patch
>> new file mode 100644
>> index 0000000000..f216c84e30
>> --- /dev/null
>> +++ b/meta/recipes-extended/cups/cups/CVE-2026-41079.patch
>> @@ -0,0 +1,72 @@
>> +From b8730b3e18852d203f7fa86a05ed0a8aa3a791e5 Mon Sep 17 00:00:00 2001
>> +From: Michael R Sweet <msweet@msweet.org>
>> +Date: Mon, 13 Apr 2026 11:50:23 -0400
>> +Subject: [PATCH] Limit num_bytes for SNMP string values.
>> +
>> +CVE: CVE-2026-41079
>> +Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/=
b7c2525a885f528d243c3a92197ca99609b3f080]
>> +
>> +(cherry picked from commit b7c2525a885f528d243c3a92197ca99609b3f080)
>> +Signed-off-by: Anil Dongare <adongare@cisco.com>
>> +---
>> + cups/snmp-private.h | 6 +++---
>> + cups/snmp.c         | 8 ++++++--
>> + 2 files changed, 9 insertions(+), 5 deletions(-)
>> +
>> +diff --git a/cups/snmp-private.h b/cups/snmp-private.h
>> +index 52b8740..015f53e 100644
>> +--- a/cups/snmp-private.h
>> ++++ b/cups/snmp-private.h
>> +@@ -1,7 +1,7 @@
>> + /*
>> +  * Private SNMP definitions for CUPS.
>> +  *
>> +- * Copyright =C2=A9 2020-2024 by OpenPrinting.
>> ++ * Copyright =C2=A9 2020-2026 by OpenPrinting.
>> +  * Copyright =C2=A9 2007-2014 by Apple Inc.
>> +  * Copyright =C2=A9 2006-2007 by Easy Software Products, all rights re=
served.
>> +  *
>> +@@ -58,9 +58,9 @@ typedef enum cups_asn1_e cups_asn1_t;      /**** ASN1=
 request/object types ****/
>> +
>> + typedef struct cups_snmp_string_s   /**** String value ****/
>> + {
>> +-  unsigned char     bytes[CUPS_SNMP_MAX_STRING];
>> +-                                    /* Bytes in string */
>> +   unsigned  num_bytes;              /* Number of bytes */
>> ++  unsigned char     bytes[CUPS_SNMP_MAX_STRING + 1];
>> ++                                    /* Bytes in string */
>> + } cups_snmp_string_t;
>> +
>> + union cups_snmp_value_u                     /**** Object value ****/
>> +diff --git a/cups/snmp.c b/cups/snmp.c
>> +index 54e348f..3222ff3 100644
>> +--- a/cups/snmp.c
>> ++++ b/cups/snmp.c
>> +@@ -1,7 +1,7 @@
>> + /*
>> +  * SNMP functions for CUPS.
>> +  *
>> +- * Copyright =C2=A9 2020-2024 by OpenPrinting.
>> ++ * Copyright =C2=A9 2020-2026 by OpenPrinting.
>> +  * Copyright =C2=A9 2007-2019 by Apple Inc.
>> +  * Copyright =C2=A9 2006-2007 by Easy Software Products, all rights re=
served.
>> +  *
>> +@@ -1042,10 +1042,14 @@ asn1_decode_snmp(unsigned char *buffer,      /*=
 I - Buffer */
>> +              case CUPS_ASN1_OCTET_STRING :
>> +              case CUPS_ASN1_BIT_STRING :
>> +              case CUPS_ASN1_HEX_STRING :
>> +-                packet->object_value.string.num_bytes =3D length;
>> +                  asn1_get_string(&bufptr, bufend, length,
>> +                                  (char *)packet->object_value.string.b=
ytes,
>> +                                  sizeof(packet->object_value.string.by=
tes));
>> ++
>> ++                if (length >=3D sizeof(packet->object_value.string.byt=
es))
>> ++                  packet->object_value.string.num_bytes =3D sizeof(pac=
ket->object_value.string.bytes) - 1;
>> ++                else
>> ++                  packet->object_value.string.num_bytes =3D length;
>> +                  break;
>> +
>> +              case CUPS_ASN1_OID :
>> +--
>> +2.43.7
>> +
>
>
> --
> Yoann Congal
> Smile ECS


--=20
Yoann Congal
Smile ECS


