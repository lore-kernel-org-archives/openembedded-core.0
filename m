Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A84FECAC59A
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 16:51:36 +0000 (UTC)
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
 by mx.groups.io with SMTP id smtpd.web10.1062.1757955090433517415
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 09:51:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=uq3T+8ee;
 spf=softfail (domain: sakoman.com, ip: 74.125.224.49, mailfrom: steve@sakoman.com)
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-6296f6ce5ddso1211499d50.3
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 09:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1757955089; x=1758559889; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3N8kkFqAqDiV+2xLMvCzMiTmCmj+26sh2AMjtWeeRzU=;
        b=uq3T+8eeyljKxpbizSvxFo3a+244iH+B16IBVlRvfnB2zz6PaT/SYw73/CmAqTw5At
         gwIl6+59H8NZtR64XnK83SxOI5aHzxdWWR04r4wxhWmBySkfXaGKScOyuzqokMiWkATC
         x5vgINEI5KY3WBDnqUQ5JdQbv4VbUr3++3rNDAAQPqOreBFfYTEMp5lM1cpUvDNWOL/H
         +QcuwPIPtuXBVjzoX1ks4jHtaNoiDvk/vT8uB7+6wg+es6UEczrk+QwCfCtEjXdaOqN2
         8e8tytMI1g0cOEhWtEpdZ79YrrtrkaW3O6Zhe0G8xfzxJJMzL2qanKn4KW5lYGvDd1lB
         D9bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757955089; x=1758559889;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3N8kkFqAqDiV+2xLMvCzMiTmCmj+26sh2AMjtWeeRzU=;
        b=EFvKsLhjWuhxebL3osM85FChdQu9NA5U8XvPQjLmV4T+hXMF1IlH9pG7w3oIu3nFb/
         BiVqPTI34CLMS6s2UeoDp5d2XpmyuPAS4ioOJU1V2Lhvl1+vvhnuCFGd4IdMNVWbD8OO
         lGqB+1Od+JiGXybZU+gjcuKabSVhfNErCVC80HKlSe0kRuwVIfAoTE4LPcXeV97NSpB8
         IzE9Kwe3g5DZysQ2ShT31SPi8XXQpOso0jj2QmZFBUS7Enz5QtHohW9WbQzs6HrRIad0
         QPKZ9oOldAxz8ZGMXgYQAoUgwXGPZ185z7B/bGH36v4nyTOvP2HLa2remy82uiITHe+l
         cTQA==
X-Gm-Message-State: AOJu0YxoqPuqbvV3rFQtnFCjrzWMGIDMEN50V1GnVOm6VsWzBDG+yadu
	D4fg3kmZRV2/5xpvU6FKEkNwFPPeZ774loB4FQQrGgFNEJeHIqz46NK/0o/8Qt3t79+hOH4xEpr
	jV4MngfRvOWPwUDPad3UfKmur/VgpWhD4SpmmRnhQniiDDje8bctV
X-Gm-Gg: ASbGncuYrVNPoaEORcL2LrWd7BtR5CDFIErY/xL0KiLsfq7yHRL22MGI9ZxzQpUHvvz
	SeZ9VM+ZPjOQYnNV79NFhpEL5lRzT+IncMz9fpjgXOb3Npi8A2YQyCVU15xBRtsdj5F0IHG7Ujc
	LJIRIhQcjdw2ow5rbpbWm4LEfVCV7J/d/RQjCP/aNs7uEq2bazu5Uep6OZ4rXtl2Vozjn5o69P9
	bUjLUs/uxo4Z/MZdtuwHYdraU3S1ZluL45IDl1vA+2+KkMW/g==
X-Google-Smtp-Source: AGHT+IEm12HWZmxccRZQntVlEtHytVM2WFuQA1tG3TdYPMj/NYozBvPYbarIMpdesviu5JIITx/stTXo6b+UWv5iFH4=
X-Received: by 2002:a05:6902:330a:b0:e97:2d2:1366 with SMTP id
 3f1490d57ef6-ea3d9a4402fmr11482144276.21.1757955089268; Mon, 15 Sep 2025
 09:51:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250915140909.3609216-1-vanusuri@mvista.com>
In-Reply-To: <20250915140909.3609216-1-vanusuri@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 15 Sep 2025 09:51:18 -0700
X-Gm-Features: AS18NWDuIDrjmYNHNgYxPOlkA6moP68kvpqvHkVipvt3PlECNAemafEzuLOaIu8
Message-ID: <CAOSpxdbnH99uH6b1uJCAQZ=AQuOjUcVrwY4LV=RX0qFXA5dD3w@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCH] cups: upgrade 2.4.10 -> 2.4.14
To: vanusuri@mvista.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 16:51:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223495

Vijay,

Unfortunately v2.4.12 and v2.12.13 both add new features, so aren't
suitable for the LTS release.

I can take a patch to upgrade to v2.4.11 since it is a bugfix only
release.  I can also take patches to add the fixes for the referenced
CVEs

Thanks!

Steve

On Mon, Sep 15, 2025 at 7:09=E2=80=AFAM Vijay Anusuri via
lists.openembedded.org <vanusuri=3Dmvista.com@lists.openembedded.org>
wrote:
>
> From: Vijay Anusuri <vanusuri@mvista.com>
>
> Refreshed patches for 2.4.14
> Removed CVE-2024-47175 patches, which is already fixed by upgrade
>
> Includes CVE fixes for CVE-2025-58060 and CVE-2025-58364
>
> Ref: https://github.com/openprinting/cups/releases
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  meta/recipes-extended/cups/cups.inc           |   7 +-
>  .../cups/0001-use-echo-only-in-init.patch     |   2 +-
>  ...-don-t-try-to-run-generated-binaries.patch |   2 +-
>  ...-fix-multilib-install-file-conflicts.patch |   6 +-
>  .../cups/cups/CVE-2024-47175-1.patch          |  73 -----
>  .../cups/cups/CVE-2024-47175-2.patch          | 151 -----------
>  .../cups/cups/CVE-2024-47175-3.patch          | 119 ---------
>  .../cups/cups/CVE-2024-47175-4.patch          | 249 ------------------
>  .../cups/cups/CVE-2024-47175-5.patch          |  40 ---
>  .../cups/cups/libexecdir.patch                |   5 +-
>  .../cups/{cups_2.4.10.bb =3D> cups_2.4.14.bb}   |   2 +-
>  11 files changed, 9 insertions(+), 647 deletions(-)
>  delete mode 100644 meta/recipes-extended/cups/cups/CVE-2024-47175-1.patc=
h
>  delete mode 100644 meta/recipes-extended/cups/cups/CVE-2024-47175-2.patc=
h
>  delete mode 100644 meta/recipes-extended/cups/cups/CVE-2024-47175-3.patc=
h
>  delete mode 100644 meta/recipes-extended/cups/cups/CVE-2024-47175-4.patc=
h
>  delete mode 100644 meta/recipes-extended/cups/cups/CVE-2024-47175-5.patc=
h
>  rename meta/recipes-extended/cups/{cups_2.4.10.bb =3D> cups_2.4.14.bb} (=
51%)
>
> diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/=
cups/cups.inc
> index 5590eb0fa0..50db18d42a 100644
> --- a/meta/recipes-extended/cups/cups.inc
> +++ b/meta/recipes-extended/cups/cups.inc
> @@ -15,11 +15,6 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/cups-$=
{PV}-source.tar.gz \
>             file://0004-cups-fix-multilib-install-file-conflicts.patch \
>             file://volatiles.99_cups \
>             file://cups-volatiles.conf \
> -           file://CVE-2024-47175-1.patch \
> -           file://CVE-2024-47175-2.patch \
> -           file://CVE-2024-47175-3.patch \
> -           file://CVE-2024-47175-4.patch \
> -           file://CVE-2024-47175-5.patch \
>             "
>
>  GITHUB_BASE_URI =3D "https://github.com/OpenPrinting/cups/releases"
> @@ -101,7 +96,7 @@ do_install () {
>  PACKAGES =3D+ "${PN}-lib ${PN}-libimage ${PN}-webif"
>
>  RDEPENDS:${PN} +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit',=
 'procps', '', d)}"
> -FILES:${PN} +=3D "${libexecdir}/cups/"
> +FILES:${PN} +=3D "${libexecdir}/cups/ ${systemd_system_unitdir}/system-c=
ups.slice"
>
>  FILES:${PN}-lib =3D "${libdir}/libcups.so.*"
>
> diff --git a/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.p=
atch b/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
> index e6bd400779..c0cb7df581 100644
> --- a/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
> +++ b/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
> @@ -1,4 +1,4 @@
> -From ddfe6ed6a89226985e8c9f0751c026aabc0927a0 Mon Sep 17 00:00:00 2001
> +From c5f943b1ac6e1c86ae64686e29e178fedf933e96 Mon Sep 17 00:00:00 2001
>  From: Saul Wold <sgw@linux.intel.com>
>  Date: Thu, 13 Dec 2012 19:03:52 -0800
>  Subject: [PATCH] use echo only in init
> diff --git a/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-genera=
ted-binaries.patch b/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-=
generated-binaries.patch
> index 75270cb0cb..cf2f1a6747 100644
> --- a/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-bin=
aries.patch
> +++ b/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-bin=
aries.patch
> @@ -1,4 +1,4 @@
> -From ff6c7168c3f26094b3a18298208a28831d1c1fd5 Mon Sep 17 00:00:00 2001
> +From da9a313ae5a2d1da683dd58572df0d7a660eb922 Mon Sep 17 00:00:00 2001
>  From: Koen Kooi <koen@dominion.thruhere.net>
>  Date: Sun, 30 Jan 2011 16:37:27 +0100
>  Subject: [PATCH] don't try to run generated binaries
> diff --git a/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-insta=
ll-file-conflicts.patch b/meta/recipes-extended/cups/cups/0004-cups-fix-mul=
tilib-install-file-conflicts.patch
> index d49fb8f2c2..31338822e6 100644
> --- a/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file=
-conflicts.patch
> +++ b/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file=
-conflicts.patch
> @@ -1,4 +1,4 @@
> -From 6e286b582571ffca3f7874076d70eec6fd5713f6 Mon Sep 17 00:00:00 2001
> +From 880bad2c6b08afd2e2e303bc3ceea559edbe76d2 Mon Sep 17 00:00:00 2001
>  From: Kai Kang <kai.kang@windriver.com>
>  Date: Wed, 3 Oct 2018 00:27:11 +0800
>  Subject: [PATCH] cups: fix multilib install file conflicts
> @@ -15,10 +15,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/conf/cups-files.conf.in b/conf/cups-files.conf.in
> -index 93584a1..65b7052 100644
> +index f96f745..27d8be9 100644
>  --- a/conf/cups-files.conf.in
>  +++ b/conf/cups-files.conf.in
> -@@ -67,7 +67,7 @@ PageLog @CUPS_LOGDIR@/page_log
> +@@ -70,7 +70,7 @@ PageLog @CUPS_LOGDIR@/page_log
>   #RequestRoot @CUPS_REQUESTS@
>
>   # Location of helper programs...
> diff --git a/meta/recipes-extended/cups/cups/CVE-2024-47175-1.patch b/met=
a/recipes-extended/cups/cups/CVE-2024-47175-1.patch
> deleted file mode 100644
> index 8ec720ea0d..0000000000
> --- a/meta/recipes-extended/cups/cups/CVE-2024-47175-1.patch
> +++ /dev/null
> @@ -1,73 +0,0 @@
> -From 9939a70b750edd9d05270060cc5cf62ca98cfbe5 Mon Sep 17 00:00:00 2001
> -From: Michael R Sweet <msweet@msweet.org>
> -Date: Mon, 9 Sep 2024 10:03:10 -0400
> -Subject: [PATCH] Mirror IPP Everywhere printer changes from master.
> -
> -Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/9=
939a70b750edd9d05270060cc5cf62ca98cfbe5]
> -CVE: CVE-2024-47175
> -Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ----
> - cups/ppd-cache.c | 10 +++++-----
> - scheduler/ipp.c  |  7 +++++++
> - 2 files changed, 12 insertions(+), 5 deletions(-)
> -
> -diff --git a/cups/ppd-cache.c b/cups/ppd-cache.c
> -index e750fcc..cd2d6cb 100644
> ---- a/cups/ppd-cache.c
> -+++ b/cups/ppd-cache.c
> -@@ -3317,10 +3317,10 @@ _ppdCreateFromIPP2(
> -   }
> -   cupsFilePuts(fp, "\"\n");
> -
> --  if ((attr =3D ippFindAttribute(supported, "printer-more-info", IPP_TA=
G_URI)) !=3D NULL)
> -+  if ((attr =3D ippFindAttribute(supported, "printer-more-info", IPP_TA=
G_URI)) !=3D NULL && ippValidateAttribute(attr))
> -     cupsFilePrintf(fp, "*APSupplies: \"%s\"\n", ippGetString(attr, 0, N=
ULL));
> -
> --  if ((attr =3D ippFindAttribute(supported, "printer-charge-info-uri", =
IPP_TAG_URI)) !=3D NULL)
> -+  if ((attr =3D ippFindAttribute(supported, "printer-charge-info-uri", =
IPP_TAG_URI)) !=3D NULL && ippValidateAttribute(attr))
> -     cupsFilePrintf(fp, "*cupsChargeInfoURI: \"%s\"\n", ippGetString(att=
r, 0, NULL));
> -
> -   if ((attr =3D ippFindAttribute(supported, "printer-strings-uri", IPP_=
TAG_URI)) !=3D NULL)
> -@@ -3389,10 +3389,10 @@ _ppdCreateFromIPP2(
> -   if (ippGetBoolean(ippFindAttribute(supported, "job-accounting-user-id=
-supported", IPP_TAG_BOOLEAN), 0))
> -     cupsFilePuts(fp, "*cupsJobAccountingUserId: True\n");
> -
> --  if ((attr =3D ippFindAttribute(supported, "printer-privacy-policy-uri=
", IPP_TAG_URI)) !=3D NULL)
> -+  if ((attr =3D ippFindAttribute(supported, "printer-privacy-policy-uri=
", IPP_TAG_URI)) !=3D NULL && ippValidateAttribute(attr))
> -     cupsFilePrintf(fp, "*cupsPrivacyURI: \"%s\"\n", ippGetString(attr, =
0, NULL));
> -
> --  if ((attr =3D ippFindAttribute(supported, "printer-mandatory-job-attr=
ibutes", IPP_TAG_KEYWORD)) !=3D NULL)
> -+  if ((attr =3D ippFindAttribute(supported, "printer-mandatory-job-attr=
ibutes", IPP_TAG_KEYWORD)) !=3D NULL && ippValidateAttribute(attr))
> -   {
> -     char      prefix =3D '\"';          // Prefix for string
> -
> -@@ -3410,7 +3410,7 @@ _ppdCreateFromIPP2(
> -     cupsFilePuts(fp, "\"\n");
> -   }
> -
> --  if ((attr =3D ippFindAttribute(supported, "printer-requested-job-attr=
ibutes", IPP_TAG_KEYWORD)) !=3D NULL)
> -+  if ((attr =3D ippFindAttribute(supported, "printer-requested-job-attr=
ibutes", IPP_TAG_KEYWORD)) !=3D NULL && ippValidateAttribute(attr))
> -   {
> -     char      prefix =3D '\"';          // Prefix for string
> -
> -diff --git a/scheduler/ipp.c b/scheduler/ipp.c
> -index 37623c5..836e41d 100644
> ---- a/scheduler/ipp.c
> -+++ b/scheduler/ipp.c
> -@@ -5417,6 +5417,13 @@ create_local_bg_thread(
> -     }
> -   }
> -
> -+  // Validate response from printer...
> -+  if (!ippValidateAttributes(response))
> -+  {
> -+    cupsdLogMessage(CUPSD_LOG_ERROR, "%s: Printer returned invalid data=
: %s", printer->name, cupsLastErrorString());
> -+    return (NULL);
> -+  }
> -+
> -   // TODO: Grab printer icon file...
> -   httpClose(http);
> -
> ---
> -2.25.1
> -
> diff --git a/meta/recipes-extended/cups/cups/CVE-2024-47175-2.patch b/met=
a/recipes-extended/cups/cups/CVE-2024-47175-2.patch
> deleted file mode 100644
> index 11e8209626..0000000000
> --- a/meta/recipes-extended/cups/cups/CVE-2024-47175-2.patch
> +++ /dev/null
> @@ -1,151 +0,0 @@
> -From 04bb2af4521b56c1699a2c2431c56c05a7102e69 Mon Sep 17 00:00:00 2001
> -From: Michael R Sweet <msweet@msweet.org>
> -Date: Mon, 9 Sep 2024 14:05:42 -0400
> -Subject: [PATCH] Refactor make-and-model code.
> -
> -Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/0=
4bb2af4521b56c1699a2c2431c56c05a7102e69]
> -CVE: CVE-2024-47175
> -Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ----
> - cups/ppd-cache.c | 103 +++++++++++++++++++++++++++++++++++++++--------
> - 1 file changed, 87 insertions(+), 16 deletions(-)
> -
> -diff --git a/cups/ppd-cache.c b/cups/ppd-cache.c
> -index cd2d6cb..a4d7403 100644
> ---- a/cups/ppd-cache.c
> -+++ b/cups/ppd-cache.c
> -@@ -3197,9 +3197,10 @@ _ppdCreateFromIPP2(
> -   ipp_t                       *media_col,     /* Media collection */
> -                       *media_size;    /* Media size collection */
> -   char                        make[256],      /* Make and model */
> --                      *model,         /* Model name */
> -+                      *mptr,          /* Pointer into make and model */
> -                       ppdname[PPD_MAX_NAME];
> -                                       /* PPD keyword */
> -+  const char          *model;         /* Model name */
> -   int                 i, j,           /* Looping vars */
> -                       count,          /* Number of values */
> -                       bottom,         /* Largest bottom margin */
> -@@ -3260,34 +3261,104 @@ _ppdCreateFromIPP2(
> -   }
> -
> -  /*
> --  * Standard stuff for PPD file...
> -+  * Get a sanitized make and model...
> -   */
> -
> --  cupsFilePuts(fp, "*PPD-Adobe: \"4.3\"\n");
> --  cupsFilePuts(fp, "*FormatVersion: \"4.3\"\n");
> --  cupsFilePrintf(fp, "*FileVersion: \"%d.%d\"\n", CUPS_VERSION_MAJOR, C=
UPS_VERSION_MINOR);
> --  cupsFilePuts(fp, "*LanguageVersion: English\n");
> --  cupsFilePuts(fp, "*LanguageEncoding: ISOLatin1\n");
> --  cupsFilePuts(fp, "*PSVersion: \"(3010.000) 0\"\n");
> --  cupsFilePuts(fp, "*LanguageLevel: \"3\"\n");
> --  cupsFilePuts(fp, "*FileSystem: False\n");
> --  cupsFilePuts(fp, "*PCFileName: \"ippeve.ppd\"\n");
> -+  if ((attr =3D ippFindAttribute(supported, "printer-make-and-model", I=
PP_TAG_TEXT)) !=3D NULL && ippValidateAttribute(attr))
> -+  {
> -+   /*
> -+    * Sanitize the model name to only contain PPD-safe characters.
> -+    */
> -
> --  if ((attr =3D ippFindAttribute(supported, "printer-make-and-model", I=
PP_TAG_TEXT)) !=3D NULL)
> -     strlcpy(make, ippGetString(attr, 0, NULL), sizeof(make));
> -+
> -+    for (mptr =3D make; *mptr; mptr ++)
> -+    {
> -+      if (*mptr < ' ' || *mptr >=3D 127 || *mptr =3D=3D '\"')
> -+      {
> -+       /*
> -+      * Truncate the make and model on the first bad character...
> -+      */
> -+
> -+      *mptr =3D '\0';
> -+      break;
> -+      }
> -+    }
> -+
> -+    while (mptr > make)
> -+    {
> -+     /*
> -+      * Strip trailing whitespace...
> -+      */
> -+
> -+      mptr --;
> -+      if (*mptr =3D=3D ' ')
> -+      *mptr =3D '\0';
> -+    }
> -+
> -+    if (!make[0])
> -+    {
> -+     /*
> -+      * Use a default make and model if nothing remains...
> -+      */
> -+
> -+      strlcpy(make, "Unknown", sizeof(make));
> -+    }
> -+  }
> -   else
> --    strlcpy(make, "Unknown Printer", sizeof(make));
> -+  {
> -+   /*
> -+    * Use a default make and model...
> -+    */
> -+
> -+    strlcpy(make, "Unknown", sizeof(make));
> -+  }
> -
> -   if (!_cups_strncasecmp(make, "Hewlett Packard ", 16) || !_cups_strnca=
secmp(make, "Hewlett-Packard ", 16))
> -   {
> -+   /*
> -+    * Normalize HP printer make and model...
> -+    */
> -+
> -     model =3D make + 16;
> -     strlcpy(make, "HP", sizeof(make));
> -+
> -+    if (!_cups_strncasecmp(model, "HP ", 3))
> -+      model +=3D 3;
> -+  }
> -+  else if ((mptr =3D strchr(make, ' ')) !=3D NULL)
> -+  {
> -+   /*
> -+    * Separate "MAKE MODEL"...
> -+    */
> -+
> -+    while (*mptr && *mptr =3D=3D ' ')
> -+      *mptr++ =3D '\0';
> -+
> -+    model =3D mptr;
> -   }
> --  else if ((model =3D strchr(make, ' ')) !=3D NULL)
> --    *model++ =3D '\0';
> -   else
> --    model =3D make;
> -+  {
> -+   /*
> -+    * No separate model name...
> -+    */
> -
> -+    model =3D "Printer";
> -+  }
> -+
> -+ /*
> -+  * Standard stuff for PPD file...
> -+  */
> -+
> -+  cupsFilePuts(fp, "*PPD-Adobe: \"4.3\"\n");
> -+  cupsFilePuts(fp, "*FormatVersion: \"4.3\"\n");
> -+  cupsFilePrintf(fp, "*FileVersion: \"%d.%d\"\n", CUPS_VERSION_MAJOR, C=
UPS_VERSION_MINOR);
> -+  cupsFilePuts(fp, "*LanguageVersion: English\n");
> -+  cupsFilePuts(fp, "*LanguageEncoding: ISOLatin1\n");
> -+  cupsFilePuts(fp, "*PSVersion: \"(3010.000) 0\"\n");
> -+  cupsFilePuts(fp, "*LanguageLevel: \"3\"\n");
> -+  cupsFilePuts(fp, "*FileSystem: False\n");
> -+  cupsFilePuts(fp, "*PCFileName: \"ippeve.ppd\"\n");
> -   cupsFilePrintf(fp, "*Manufacturer: \"%s\"\n", make);
> -   cupsFilePrintf(fp, "*ModelName: \"%s\"\n", model);
> -   cupsFilePrintf(fp, "*Product: \"(%s)\"\n", model);
> ---
> -2.25.1
> -
> diff --git a/meta/recipes-extended/cups/cups/CVE-2024-47175-3.patch b/met=
a/recipes-extended/cups/cups/CVE-2024-47175-3.patch
> deleted file mode 100644
> index e7d012fb8a..0000000000
> --- a/meta/recipes-extended/cups/cups/CVE-2024-47175-3.patch
> +++ /dev/null
> @@ -1,119 +0,0 @@
> -From e0630cd18f76340d302000f2bf6516e99602b844 Mon Sep 17 00:00:00 2001
> -From: Michael R Sweet <msweet@msweet.org>
> -Date: Mon, 9 Sep 2024 15:59:57 -0400
> -Subject: [PATCH] PPDize preset and template names.
> -
> -Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/e=
0630cd18f76340d302000f2bf6516e99602b844]
> -CVE: CVE-2024-47175
> -Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ----
> - cups/ppd-cache.c | 33 ++++++++++++++++++++++++---------
> - 1 file changed, 24 insertions(+), 9 deletions(-)
> -
> -diff --git a/cups/ppd-cache.c b/cups/ppd-cache.c
> -index a4d7403..53c22be 100644
> ---- a/cups/ppd-cache.c
> -+++ b/cups/ppd-cache.c
> -@@ -4976,12 +4976,14 @@ _ppdCreateFromIPP2(
> -
> -       cupsArrayAdd(templates, (void *)keyword);
> -
> -+      pwg_ppdize_name(keyword, ppdname, sizeof(ppdname));
> -+
> -       snprintf(msgid, sizeof(msgid), "finishing-template.%s", keyword);
> -       if ((msgstr =3D _cupsLangString(lang, msgid)) =3D=3D msgid || !st=
rcmp(msgid, msgstr))
> -       if ((msgstr =3D _cupsMessageLookup(strings, msgid)) =3D=3D msgid)
> -         msgstr =3D keyword;
> -
> --      cupsFilePrintf(fp, "*cupsFinishingTemplate %s: \"\n", keyword);
> -+      cupsFilePrintf(fp, "*cupsFinishingTemplate %s: \"\n", ppdname);
> -       for (finishing_attr =3D ippFirstAttribute(finishing_col); finishi=
ng_attr; finishing_attr =3D ippNextAttribute(finishing_col))
> -       {
> -         if (ippGetValueTag(finishing_attr) =3D=3D IPP_TAG_BEGIN_COLLECT=
ION)
> -@@ -4994,7 +4996,7 @@ _ppdCreateFromIPP2(
> -       }
> -       }
> -       cupsFilePuts(fp, "\"\n");
> --      cupsFilePrintf(fp, "*%s.cupsFinishingTemplate %s/%s: \"\"\n", lan=
g->language, keyword, msgstr);
> -+      cupsFilePrintf(fp, "*%s.cupsFinishingTemplate %s/%s: \"\"\n", lan=
g->language, ppdname, msgstr);
> -       cupsFilePuts(fp, "*End\n");
> -     }
> -
> -@@ -5040,7 +5042,8 @@ _ppdCreateFromIPP2(
> -       if (!preset || !preset_name)
> -         continue;
> -
> --      cupsFilePrintf(fp, "*APPrinterPreset %s: \"\n", preset_name);
> -+      pwg_ppdize_name(preset_name, ppdname, sizeof(ppdname));
> -+      cupsFilePrintf(fp, "*APPrinterPreset %s: \"\n", ppdname);
> -       for (member =3D ippFirstAttribute(preset); member; member =3D ipp=
NextAttribute(preset))
> -       {
> -         member_name =3D ippGetName(member);
> -@@ -5081,7 +5084,10 @@ _ppdCreateFromIPP2(
> -             fin_col =3D ippGetCollection(member, i);
> -
> -             if ((keyword =3D ippGetString(ippFindAttribute(fin_col, "fi=
nishing-template", IPP_TAG_ZERO), 0, NULL)) !=3D NULL)
> --              cupsFilePrintf(fp, "*cupsFinishingTemplate %s\n", keyword=
);
> -+            {
> -+              pwg_ppdize_name(keyword, ppdname, sizeof(ppdname));
> -+              cupsFilePrintf(fp, "*cupsFinishingTemplate %s\n", ppdname=
);
> -+            }
> -           }
> -         }
> -         else if (!strcmp(member_name, "media"))
> -@@ -5108,13 +5114,13 @@ _ppdCreateFromIPP2(
> -           if ((keyword =3D ippGetString(ippFindAttribute(media_col, "me=
dia-source", IPP_TAG_ZERO), 0, NULL)) !=3D NULL)
> -           {
> -             pwg_ppdize_name(keyword, ppdname, sizeof(ppdname));
> --            cupsFilePrintf(fp, "*InputSlot %s\n", keyword);
> -+            cupsFilePrintf(fp, "*InputSlot %s\n", ppdname);
> -         }
> -
> -           if ((keyword =3D ippGetString(ippFindAttribute(media_col, "me=
dia-type", IPP_TAG_ZERO), 0, NULL)) !=3D NULL)
> -           {
> -             pwg_ppdize_name(keyword, ppdname, sizeof(ppdname));
> --            cupsFilePrintf(fp, "*MediaType %s\n", keyword);
> -+            cupsFilePrintf(fp, "*MediaType %s\n", ppdname);
> -         }
> -         }
> -         else if (!strcmp(member_name, "print-quality"))
> -@@ -5160,7 +5166,10 @@ _ppdCreateFromIPP2(
> -       cupsFilePuts(fp, "\"\n*End\n");
> -
> -       if ((localized_name =3D _cupsMessageLookup(strings, preset_name))=
 !=3D preset_name)
> --        cupsFilePrintf(fp, "*%s.APPrinterPreset %s/%s: \"\"\n", lang->l=
anguage, preset_name, localized_name);
> -+      {
> -+        pwg_ppdize_name(preset_name, ppdname, sizeof(ppdname));
> -+        cupsFilePrintf(fp, "*%s.APPrinterPreset %s/%s: \"\"\n", lang->l=
anguage, ppdname, localized_name);
> -+      }
> -     }
> -   }
> -
> -@@ -5544,7 +5553,7 @@ pwg_ppdize_name(const char *ipp, /* I - IPP keywor=
d */
> -       *end;                           /* End of name buffer */
> -
> -
> --  if (!ipp)
> -+  if (!ipp || !_cups_isalnum(*ipp))
> -   {
> -     *name =3D '\0';
> -     return;
> -@@ -5559,8 +5568,14 @@ pwg_ppdize_name(const char *ipp,        /* I - IP=
P keyword */
> -       ipp ++;
> -       *ptr++ =3D (char)toupper(*ipp++ & 255);
> -     }
> --    else
> -+    else if (*ipp =3D=3D '_' || *ipp =3D=3D '.' || *ipp =3D=3D '-' || _=
cups_isalnum(*ipp))
> -+    {
> -       *ptr++ =3D *ipp++;
> -+    }
> -+    else
> -+    {
> -+      ipp ++;
> -+    }
> -   }
> -
> -   *ptr =3D '\0';
> ---
> -2.25.1
> -
> diff --git a/meta/recipes-extended/cups/cups/CVE-2024-47175-4.patch b/met=
a/recipes-extended/cups/cups/CVE-2024-47175-4.patch
> deleted file mode 100644
> index 7665513485..0000000000
> --- a/meta/recipes-extended/cups/cups/CVE-2024-47175-4.patch
> +++ /dev/null
> @@ -1,249 +0,0 @@
> -From 1e6ca5913eceee906038bc04cc7ccfbe2923bdfd Mon Sep 17 00:00:00 2001
> -From: Michael R Sweet <msweet@msweet.org>
> -Date: Mon, 23 Sep 2024 09:36:39 -0400
> -Subject: [PATCH] Quote PPD localized strings.
> -
> -Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/1=
e6ca5913eceee906038bc04cc7ccfbe2923bdfd]
> -CVE: CVE-2024-47175
> -Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ----
> - cups/ppd-cache.c | 93 +++++++++++++++++++++++++++---------------------
> - 1 file changed, 53 insertions(+), 40 deletions(-)
> -
> -diff --git a/cups/ppd-cache.c b/cups/ppd-cache.c
> -index 53c22be..f425ac0 100644
> ---- a/cups/ppd-cache.c
> -+++ b/cups/ppd-cache.c
> -@@ -32,6 +32,7 @@
> - static int    cups_connect(http_t **http, const char *url, char *resour=
ce, size_t ressize);
> - static int    cups_get_url(http_t **http, const char *url, char *name, =
size_t namesize);
> - static const char *ppd_inputslot_for_keyword(_ppd_cache_t *pc, const ch=
ar *keyword);
> -+static void   ppd_put_string(cups_file_t *fp, cups_lang_t *lang, cups_a=
rray_t *strings, const char *ppd_option, const char *ppd_choice, const char=
 *pwg_msgid);
> - static void   pwg_add_finishing(cups_array_t *finishings, ipp_finishing=
s_t template, const char *name, const char *value);
> - static void   pwg_add_message(cups_array_t *a, const char *msg, const c=
har *str);
> - static int    pwg_compare_finishings(_pwg_finishings_t *a, _pwg_finishi=
ngs_t *b);
> -@@ -3394,7 +3395,7 @@ _ppdCreateFromIPP2(
> -   if ((attr =3D ippFindAttribute(supported, "printer-charge-info-uri", =
IPP_TAG_URI)) !=3D NULL && ippValidateAttribute(attr))
> -     cupsFilePrintf(fp, "*cupsChargeInfoURI: \"%s\"\n", ippGetString(att=
r, 0, NULL));
> -
> --  if ((attr =3D ippFindAttribute(supported, "printer-strings-uri", IPP_=
TAG_URI)) !=3D NULL)
> -+  if ((attr =3D ippFindAttribute(supported, "printer-strings-uri", IPP_=
TAG_URI)) !=3D NULL && ippValidateAttribute(attr))
> -   {
> -     http_t    *http =3D NULL;           /* Connection to printer */
> -     char      stringsfile[1024];      /* Temporary strings file */
> -@@ -3438,7 +3439,7 @@ _ppdCreateFromIPP2(
> -
> -         response =3D cupsDoRequest(http, request, resource);
> -
> --        if ((attr =3D ippFindAttribute(response, "printer-strings-uri",=
 IPP_TAG_URI)) !=3D NULL)
> -+        if ((attr =3D ippFindAttribute(response, "printer-strings-uri",=
 IPP_TAG_URI)) !=3D NULL && ippValidateAttribute(attr))
> -           cupsFilePrintf(fp, "*cupsStringsURI %s: \"%s\"\n", keyword, i=
ppGetString(attr, 0, NULL));
> -
> -         ippDelete(response);
> -@@ -4044,18 +4045,16 @@ _ppdCreateFromIPP2(
> -       cupsFilePrintf(fp, "*DefaultInputSlot: %s\n", ppdname);
> -
> -       for (j =3D 0; j < (int)(sizeof(sources) / sizeof(sources[0])); j =
++)
> -+      {
> -         if (!strcmp(sources[j], keyword))
> -       {
> -         snprintf(msgid, sizeof(msgid), "media-source.%s", keyword);
> -
> --        if ((msgstr =3D _cupsLangString(lang, msgid)) =3D=3D msgid || !=
strcmp(msgid, msgstr))
> --          if ((msgstr =3D _cupsMessageLookup(strings, msgid)) =3D=3D ms=
gid)
> --            msgstr =3D keyword;
> --
> -         cupsFilePrintf(fp, "*InputSlot %s: \"<</MediaPosition %d>>setpa=
gedevice\"\n", ppdname, j);
> --        cupsFilePrintf(fp, "*%s.InputSlot %s/%s: \"\"\n", lang->languag=
e, ppdname, msgstr);
> -+        ppd_put_string(fp, lang, strings, "InputSlot", ppdname, msgid);
> -         break;
> -       }
> -+      }
> -     }
> -     cupsFilePuts(fp, "*CloseUI: *InputSlot\n");
> -   }
> -@@ -4081,12 +4080,9 @@ _ppdCreateFromIPP2(
> -       pwg_ppdize_name(keyword, ppdname, sizeof(ppdname));
> -
> -       snprintf(msgid, sizeof(msgid), "media-type.%s", keyword);
> --      if ((msgstr =3D _cupsLangString(lang, msgid)) =3D=3D msgid || !st=
rcmp(msgid, msgstr))
> --      if ((msgstr =3D _cupsMessageLookup(strings, msgid)) =3D=3D msgid)
> --        msgstr =3D keyword;
> -
> -       cupsFilePrintf(fp, "*MediaType %s: \"<</MediaType(%s)>>setpagedev=
ice\"\n", ppdname, ppdname);
> --      cupsFilePrintf(fp, "*%s.MediaType %s/%s: \"\"\n", lang->language,=
 ppdname, msgstr);
> -+      ppd_put_string(fp, lang, strings, "MediaType", ppdname, msgid);
> -     }
> -     cupsFilePuts(fp, "*CloseUI: *MediaType\n");
> -   }
> -@@ -4547,12 +4543,9 @@ _ppdCreateFromIPP2(
> -       pwg_ppdize_name(keyword, ppdname, sizeof(ppdname));
> -
> -       snprintf(msgid, sizeof(msgid), "output-bin.%s", keyword);
> --      if ((msgstr =3D _cupsLangString(lang, msgid)) =3D=3D msgid || !st=
rcmp(msgid, msgstr))
> --      if ((msgstr =3D _cupsMessageLookup(strings, msgid)) =3D=3D msgid)
> --        msgstr =3D keyword;
> -
> -       cupsFilePrintf(fp, "*OutputBin %s: \"\"\n", ppdname);
> --      cupsFilePrintf(fp, "*%s.OutputBin %s/%s: \"\"\n", lang->language,=
 ppdname, msgstr);
> -+      ppd_put_string(fp, lang, strings, "OutputBin", ppdname, msgid);
> -
> -       if ((tray_ptr =3D ippGetOctetString(trays, i, &tray_len)) !=3D NU=
LL)
> -       {
> -@@ -4671,9 +4664,6 @@ _ppdCreateFromIPP2(
> -         cupsArrayAdd(names, (char *)keyword);
> -
> -       snprintf(msgid, sizeof(msgid), "finishings.%d", value);
> --      if ((msgstr =3D _cupsLangString(lang, msgid)) =3D=3D msgid || !st=
rcmp(msgid, msgstr))
> --        if ((msgstr =3D _cupsMessageLookup(strings, msgid)) =3D=3D msgi=
d)
> --          msgstr =3D keyword;
> -
> -         if (value >=3D IPP_FINISHINGS_NONE && value <=3D IPP_FINISHINGS=
_LAMINATE)
> -           ppd_keyword =3D base_keywords[value - IPP_FINISHINGS_NONE];
> -@@ -4688,7 +4678,7 @@ _ppdCreateFromIPP2(
> -           continue;
> -
> -       cupsFilePrintf(fp, "*StapleLocation %s: \"\"\n", ppd_keyword);
> --      cupsFilePrintf(fp, "*%s.StapleLocation %s/%s: \"\"\n", lang->lang=
uage, ppd_keyword, msgstr);
> -+      ppd_put_string(fp, lang, strings, "StapleLocation", ppd_keyword, =
msgid);
> -       cupsFilePrintf(fp, "*cupsIPPFinishings %d/%s: \"*StapleLocation %=
s\"\n", value, keyword, ppd_keyword);
> -       }
> -
> -@@ -4751,9 +4741,6 @@ _ppdCreateFromIPP2(
> -         cupsArrayAdd(names, (char *)keyword);
> -
> -       snprintf(msgid, sizeof(msgid), "finishings.%d", value);
> --      if ((msgstr =3D _cupsLangString(lang, msgid)) =3D=3D msgid || !st=
rcmp(msgid, msgstr))
> --        if ((msgstr =3D _cupsMessageLookup(strings, msgid)) =3D=3D msgi=
d)
> --          msgstr =3D keyword;
> -
> -         if (value >=3D IPP_FINISHINGS_NONE && value <=3D IPP_FINISHINGS=
_LAMINATE)
> -           ppd_keyword =3D base_keywords[value - IPP_FINISHINGS_NONE];
> -@@ -4768,7 +4755,7 @@ _ppdCreateFromIPP2(
> -           continue;
> -
> -       cupsFilePrintf(fp, "*FoldType %s: \"\"\n", ppd_keyword);
> --      cupsFilePrintf(fp, "*%s.FoldType %s/%s: \"\"\n", lang->language, =
ppd_keyword, msgstr);
> -+      ppd_put_string(fp, lang, strings, "FoldType", ppd_keyword, msgid)=
;
> -       cupsFilePrintf(fp, "*cupsIPPFinishings %d/%s: \"*FoldType %s\"\n"=
, value, keyword, ppd_keyword);
> -       }
> -
> -@@ -4839,9 +4826,6 @@ _ppdCreateFromIPP2(
> -         cupsArrayAdd(names, (char *)keyword);
> -
> -       snprintf(msgid, sizeof(msgid), "finishings.%d", value);
> --      if ((msgstr =3D _cupsLangString(lang, msgid)) =3D=3D msgid || !st=
rcmp(msgid, msgstr))
> --        if ((msgstr =3D _cupsMessageLookup(strings, msgid)) =3D=3D msgi=
d)
> --          msgstr =3D keyword;
> -
> -         if (value >=3D IPP_FINISHINGS_NONE && value <=3D IPP_FINISHINGS=
_LAMINATE)
> -           ppd_keyword =3D base_keywords[value - IPP_FINISHINGS_NONE];
> -@@ -4856,7 +4840,7 @@ _ppdCreateFromIPP2(
> -           continue;
> -
> -       cupsFilePrintf(fp, "*PunchMedia %s: \"\"\n", ppd_keyword);
> --      cupsFilePrintf(fp, "*%s.PunchMedia %s/%s: \"\"\n", lang->language=
, ppd_keyword, msgstr);
> -+      ppd_put_string(fp, lang, strings, "PunchMedia", ppd_keyword, msgi=
d);
> -       cupsFilePrintf(fp, "*cupsIPPFinishings %d/%s: \"*PunchMedia %s\"\=
n", value, keyword, ppd_keyword);
> -       }
> -
> -@@ -4927,9 +4911,6 @@ _ppdCreateFromIPP2(
> -         cupsArrayAdd(names, (char *)keyword);
> -
> -       snprintf(msgid, sizeof(msgid), "finishings.%d", value);
> --      if ((msgstr =3D _cupsLangString(lang, msgid)) =3D=3D msgid || !st=
rcmp(msgid, msgstr))
> --        if ((msgstr =3D _cupsMessageLookup(strings, msgid)) =3D=3D msgi=
d)
> --          msgstr =3D keyword;
> -
> -         if (value =3D=3D IPP_FINISHINGS_TRIM)
> -           ppd_keyword =3D "Auto";
> -@@ -4937,7 +4918,7 @@ _ppdCreateFromIPP2(
> -         ppd_keyword =3D trim_keywords[value - IPP_FINISHINGS_TRIM_AFTER=
_PAGES];
> -
> -       cupsFilePrintf(fp, "*CutMedia %s: \"\"\n", ppd_keyword);
> --      cupsFilePrintf(fp, "*%s.CutMedia %s/%s: \"\"\n", lang->language, =
ppd_keyword, msgstr);
> -+      ppd_put_string(fp, lang, strings, "CutMedia", ppd_keyword, msgid)=
;
> -       cupsFilePrintf(fp, "*cupsIPPFinishings %d/%s: \"*CutMedia %s\"\n"=
, value, keyword, ppd_keyword);
> -       }
> -
> -@@ -4979,9 +4960,6 @@ _ppdCreateFromIPP2(
> -       pwg_ppdize_name(keyword, ppdname, sizeof(ppdname));
> -
> -       snprintf(msgid, sizeof(msgid), "finishing-template.%s", keyword);
> --      if ((msgstr =3D _cupsLangString(lang, msgid)) =3D=3D msgid || !st=
rcmp(msgid, msgstr))
> --      if ((msgstr =3D _cupsMessageLookup(strings, msgid)) =3D=3D msgid)
> --        msgstr =3D keyword;
> -
> -       cupsFilePrintf(fp, "*cupsFinishingTemplate %s: \"\n", ppdname);
> -       for (finishing_attr =3D ippFirstAttribute(finishing_col); finishi=
ng_attr; finishing_attr =3D ippNextAttribute(finishing_col))
> -@@ -4996,7 +4974,7 @@ _ppdCreateFromIPP2(
> -       }
> -       }
> -       cupsFilePuts(fp, "\"\n");
> --      cupsFilePrintf(fp, "*%s.cupsFinishingTemplate %s/%s: \"\"\n", lan=
g->language, ppdname, msgstr);
> -+      ppd_put_string(fp, lang, strings, "cupsFinishingTemplate", ppdnam=
e, msgid);
> -       cupsFilePuts(fp, "*End\n");
> -     }
> -
> -@@ -5165,11 +5143,9 @@ _ppdCreateFromIPP2(
> -
> -       cupsFilePuts(fp, "\"\n*End\n");
> -
> --      if ((localized_name =3D _cupsMessageLookup(strings, preset_name))=
 !=3D preset_name)
> --      {
> --        pwg_ppdize_name(preset_name, ppdname, sizeof(ppdname));
> --        cupsFilePrintf(fp, "*%s.APPrinterPreset %s/%s: \"\"\n", lang->l=
anguage, ppdname, localized_name);
> --      }
> -+      snprintf(msgid, sizeof(msgid), "preset-name.%s", preset_name);
> -+      pwg_ppdize_name(preset_name, ppdname, sizeof(ppdname));
> -+      ppd_put_string(fp, lang, strings, "APPrinterPreset", ppdname, msg=
id);
> -     }
> -   }
> -
> -@@ -5440,6 +5416,43 @@ cups_get_url(http_t     **http,         /* IO - C=
urrent HTTP connection */
> - }
> -
> -
> -+/*
> -+ * 'ppd_put_strings()' - Write localization attributes to a PPD file.
> -+ */
> -+
> -+static void
> -+ppd_put_string(cups_file_t  *fp,      /* I - PPD file */
> -+               cups_lang_t  *lang,    /* I - Language */
> -+               cups_array_t *strings, /* I - Strings */
> -+             const char   *ppd_option,/* I - PPD option */
> -+             const char   *ppd_choice,/* I - PPD choice */
> -+             const char   *pwg_msgid) /* I - PWG message ID */
> -+{
> -+  const char  *text;                  /* Localized text */
> -+
> -+
> -+  if ((text =3D _cupsLangString(lang, pwg_msgid)) =3D=3D pwg_msgid || !=
strcmp(pwg_msgid, text))
> -+  {
> -+    if ((text =3D _cupsMessageLookup(strings, pwg_msgid)) =3D=3D pwg_ms=
gid)
> -+      return;
> -+  }
> -+
> -+  // Add the first line of localized text...
> -+  cupsFilePrintf(fp, "*%s.%s %s/", lang->language, ppd_option, ppd_choi=
ce);
> -+  while (*text && *text !=3D '\n')
> -+  {
> -+    // Escape ":" and "<"...
> -+    if (*text =3D=3D ':' || *text =3D=3D '<')
> -+      cupsFilePrintf(fp, "<%02X>", *text);
> -+    else
> -+      cupsFilePutChar(fp, *text);
> -+
> -+    text ++;
> -+  }
> -+  cupsFilePuts(fp, ": \"\"\n");
> -+}
> -+
> -+
> - /*
> -  * 'pwg_add_finishing()' - Add a finishings value.
> -  */
> ---
> -2.25.1
> -
> diff --git a/meta/recipes-extended/cups/cups/CVE-2024-47175-5.patch b/met=
a/recipes-extended/cups/cups/CVE-2024-47175-5.patch
> deleted file mode 100644
> index 77a30857e2..0000000000
> --- a/meta/recipes-extended/cups/cups/CVE-2024-47175-5.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -From 2abe1ba8a66864aa82cd9836b37e57103b8e1a3b Mon Sep 17 00:00:00 2001
> -From: Michael R Sweet <msweet@msweet.org>
> -Date: Mon, 23 Sep 2024 10:11:31 -0400
> -Subject: [PATCH] Fix warnings for unused vars.
> -
> -Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/2=
abe1ba8a66864aa82cd9836b37e57103b8e1a3b]
> -CVE: CVE-2024-47175
> -Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ----
> - cups/ppd-cache.c | 6 ++----
> - 1 file changed, 2 insertions(+), 4 deletions(-)
> -
> -diff --git a/cups/ppd-cache.c b/cups/ppd-cache.c
> -index f425ac0..d2533b7 100644
> ---- a/cups/ppd-cache.c
> -+++ b/cups/ppd-cache.c
> -@@ -3223,8 +3223,7 @@ _ppdCreateFromIPP2(
> -   int                 have_qdraft =3D 0,/* Have draft quality? */
> -                       have_qhigh =3D 0; /* Have high quality? */
> -   char                        msgid[256];     /* Message identifier (at=
tr.value) */
> --  const char          *keyword,       /* Keyword value */
> --                      *msgstr;        /* Localized string */
> -+  const char          *keyword;       /* Keyword value */
> -   cups_array_t                *strings =3D NULL;/* Printer strings file=
 */
> -   struct lconv                *loc =3D localeconv();
> -                                       /* Locale data */
> -@@ -5010,9 +5009,8 @@ _ppdCreateFromIPP2(
> -     {
> -       ipp_t   *preset =3D ippGetCollection(attr, i);
> -                                       /* Preset collection */
> --      const char *preset_name =3D ippGetString(ippFindAttribute(preset,=
 "preset-name", IPP_TAG_ZERO), 0, NULL),
> -+      const char *preset_name =3D ippGetString(ippFindAttribute(preset,=
 "preset-name", IPP_TAG_ZERO), 0, NULL);
> -                                       /* Preset name */
> --              *localized_name;        /* Localized preset name */
> -       ipp_attribute_t *member;                /* Member attribute in pr=
eset */
> -       const char *member_name;                /* Member attribute name =
*/
> -       char            member_value[256];      /* Member attribute value=
 */
> ---
> -2.25.1
> -
> diff --git a/meta/recipes-extended/cups/cups/libexecdir.patch b/meta/reci=
pes-extended/cups/cups/libexecdir.patch
> index 7ccad94f0f..493c7970ea 100644
> --- a/meta/recipes-extended/cups/cups/libexecdir.patch
> +++ b/meta/recipes-extended/cups/cups/libexecdir.patch
> @@ -1,4 +1,4 @@
> -From 1724f7bcdbcfdb445778f8a2e530c5c094c18c10 Mon Sep 17 00:00:00 2001
> +From 4ae7ad87aa022f5128be222dffbf0c50ec6e846e Mon Sep 17 00:00:00 2001
>  From: Ross Burton <ross.burton@arm.com>
>  Date: Tue, 13 Jul 2021 12:56:30 +0100
>  Subject: [PATCH] Use $libexecdir instead of hardcoding $prefix/lib as th=
is
> @@ -6,13 +6,12 @@ Subject: [PATCH] Use $libexecdir instead of hardcoding =
$prefix/lib as this
>
>  Upstream-Status: Pending
>  Signed-off-by: Ross Burton <ross.burton@arm.com>
> -
>  ---
>   config-scripts/cups-directories.m4 | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/config-scripts/cups-directories.m4 b/config-scripts/cups-di=
rectories.m4
> -index 2033d47..230166e 100644
> +index 069ee7b..2f67e5b 100644
>  --- a/config-scripts/cups-directories.m4
>  +++ b/config-scripts/cups-directories.m4
>  @@ -239,7 +239,7 @@ AC_SUBST([CUPS_REQUESTS])
> diff --git a/meta/recipes-extended/cups/cups_2.4.10.bb b/meta/recipes-ext=
ended/cups/cups_2.4.14.bb
> similarity index 51%
> rename from meta/recipes-extended/cups/cups_2.4.10.bb
> rename to meta/recipes-extended/cups/cups_2.4.14.bb
> index e16ad47cf5..5d5a1dc97f 100644
> --- a/meta/recipes-extended/cups/cups_2.4.10.bb
> +++ b/meta/recipes-extended/cups/cups_2.4.14.bb
> @@ -2,4 +2,4 @@ require cups.inc
>
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6b=
d57"
>
> -SRC_URI[sha256sum] =3D "d75757c2bc0f7a28b02ee4d52ca9e4b1aa1ba2affe16b985=
854f5336940e5ad7"
> +SRC_URI[sha256sum] =3D "660288020dd6f79caf799811c4c1a3207a48689899ac2093=
959d70a3bdcb7699"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223490): https://lists.openembedded.org/g/openembedde=
d-core/message/223490
> Mute This Topic: https://lists.openembedded.org/mt/115254371/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

