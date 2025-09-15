Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA1D9CAC597
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 17:00:04 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.105.1757955596111592395
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 09:59:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=hpInkVPu;
 spf=pass (domain: mvista.com, ip: 209.85.208.44, mailfrom: vanusuri@mvista.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6228de280ccso9054727a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 09:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1757955594; x=1758560394; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yObzxgFhaUl3sRZRUStDyG0mwNNbwILNHF8XxHF+izY=;
        b=hpInkVPuLD+UwSvmzSjOO5aFCoFnWtWdITQZjWvQz03eKGddx3MaeyAFLP1xeg7u//
         0TawJX3eKXbJjhRAb06RSykNykDL14PIqz6zEHZvpuhFkfhdKIpNHCviO4v3oDM/ujNf
         vOCmK3FDVvNwqdNDptBb9Eacq3u/Ysw1cvgFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757955594; x=1758560394;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yObzxgFhaUl3sRZRUStDyG0mwNNbwILNHF8XxHF+izY=;
        b=dwsduyhafEtPiS2/98XxiAis1pjr6QYWE0wtGTWMv+dh4VrpYnqfxG2m8h2sEXF727
         KRI6bzQ8VxiAG8wbd2S9ONmphaGn6KDuk5uShHrMo6OlFLF8shJNFyx1/5wl/GaPziNX
         mzuNJ8lJ63ZchMXvtvn12ik9Gt6ZCtzbZqdobdFguw/sODzoDXse4Y7ThbOV1z0pa+Ei
         rf41o05ucBSsGhySfOlomSAD/82UXOSy6ubQhIUqEN9MNLHVp1xb2vl81RmXavJQa4+W
         bqQjUdXH9v/jund9j4nA7Hrx+fB/w0P774M86cCDf4MaURlQyXVnHpA//iYa13twzGVr
         njfA==
X-Gm-Message-State: AOJu0YzVdjvCegiAW3KhG4N92DiC8+NlM+36PXGeyP1HTu4zkH/jIwsu
	TrQvnc/dNY6Tks0DQF4+CXH/4SYhH+aBL3GfJU50tccpziN5XhBdqXUSyk9QlsPJhR3x/H1wYXN
	Aba/V+2XWnL4VN8RFItZlVnSPLndNB0vuH+ovyBXuRPLxXzXkUWF9BlI=
X-Gm-Gg: ASbGncuTgSbm3yLRMwXBdht9Q0TEDtVXX4eSjBIvQZzGkP1mWJUVvid8pB7l12rLN0B
	/jq2X5gz4GoKYtL0e8No50lLMcrh6tRY8lIdRrNTSOtK5U7WxszXC5YPneVevb/ywyoDUI/lTlg
	jYos9l053S1nFrmI0no+PwkwIxzb6IY/QplSdGa6D+EHIAkStwn4yS3eTGbLSnPhhEhe4KBGY1H
	WGI8Zs=
X-Google-Smtp-Source: AGHT+IESFy14QLvJ6xYbGzc6SdNeUl1XNIGCP5J5217/sMd43/tcT7hTJ3SDvVHQPiaBGbq9NYnXWlPT29Mx+4RrC88=
X-Received: by 2002:a05:6402:40c8:b0:61c:d330:77e7 with SMTP id
 4fb4d7f45d1cf-62ed82598b3mr13468370a12.6.1757955593912; Mon, 15 Sep 2025
 09:59:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250915140909.3609216-1-vanusuri@mvista.com> <CAOSpxdbnH99uH6b1uJCAQZ=AQuOjUcVrwY4LV=RX0qFXA5dD3w@mail.gmail.com>
In-Reply-To: <CAOSpxdbnH99uH6b1uJCAQZ=AQuOjUcVrwY4LV=RX0qFXA5dD3w@mail.gmail.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Mon, 15 Sep 2025 22:29:40 +0530
X-Gm-Features: AS18NWDpwgg1c_SVQKgaiUPhzFs9ZmmN5rwCz2kbMoMBXztmmFbQJ9gDMPAQ-g4
Message-ID: <CANQUz18sBt8VDeULHxaJDx+OA8vm=M9-+OiLoNGBJ3kFMykp+g@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCH] cups: upgrade 2.4.10 -> 2.4.14
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b4d9e6063ed9ee83"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 17:00:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223496

--000000000000b4d9e6063ed9ee83
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Steve,

Thank you for the clarification.

I understand that `v2.4.12` and `v2.4.13` are not suitable for the LTS
release due to new features.

I will proceed with preparing a new patch to upgrade to `v2.4.11`, as it is
a bugfix-only release. Additionally, I will include patches to address the
referenced CVEs.

Thanks & Regards,
Vijay

On Mon, 15 Sept, 2025, 10:21=E2=80=AFpm Steve Sakoman, <steve@sakoman.com> =
wrote:

> Vijay,
>
> Unfortunately v2.4.12 and v2.12.13 both add new features, so aren't
> suitable for the LTS release.
>
> I can take a patch to upgrade to v2.4.11 since it is a bugfix only
> release.  I can also take patches to add the fixes for the referenced
> CVEs
>
> Thanks!
>
> Steve
>
> On Mon, Sep 15, 2025 at 7:09=E2=80=AFAM Vijay Anusuri via
> lists.openembedded.org <vanusuri=3Dmvista.com@lists.openembedded.org>
> wrote:
> >
> > From: Vijay Anusuri <vanusuri@mvista.com>
> >
> > Refreshed patches for 2.4.14
> > Removed CVE-2024-47175 patches, which is already fixed by upgrade
> >
> > Includes CVE fixes for CVE-2025-58060 and CVE-2025-58364
> >
> > Ref: https://github.com/openprinting/cups/releases
> >
> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > ---
> >  meta/recipes-extended/cups/cups.inc           |   7 +-
> >  .../cups/0001-use-echo-only-in-init.patch     |   2 +-
> >  ...-don-t-try-to-run-generated-binaries.patch |   2 +-
> >  ...-fix-multilib-install-file-conflicts.patch |   6 +-
> >  .../cups/cups/CVE-2024-47175-1.patch          |  73 -----
> >  .../cups/cups/CVE-2024-47175-2.patch          | 151 -----------
> >  .../cups/cups/CVE-2024-47175-3.patch          | 119 ---------
> >  .../cups/cups/CVE-2024-47175-4.patch          | 249 ------------------
> >  .../cups/cups/CVE-2024-47175-5.patch          |  40 ---
> >  .../cups/cups/libexecdir.patch                |   5 +-
> >  .../cups/{cups_2.4.10.bb =3D> cups_2.4.14.bb}   |   2 +-
> >  11 files changed, 9 insertions(+), 647 deletions(-)
> >  delete mode 100644
> meta/recipes-extended/cups/cups/CVE-2024-47175-1.patch
> >  delete mode 100644
> meta/recipes-extended/cups/cups/CVE-2024-47175-2.patch
> >  delete mode 100644
> meta/recipes-extended/cups/cups/CVE-2024-47175-3.patch
> >  delete mode 100644
> meta/recipes-extended/cups/cups/CVE-2024-47175-4.patch
> >  delete mode 100644
> meta/recipes-extended/cups/cups/CVE-2024-47175-5.patch
> >  rename meta/recipes-extended/cups/{cups_2.4.10.bb =3D> cups_2.4.14.bb}
> (51%)
> >
> > diff --git a/meta/recipes-extended/cups/cups.inc
> b/meta/recipes-extended/cups/cups.inc
> > index 5590eb0fa0..50db18d42a 100644
> > --- a/meta/recipes-extended/cups/cups.inc
> > +++ b/meta/recipes-extended/cups/cups.inc
> > @@ -15,11 +15,6 @@ SRC_URI =3D
> "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
> >             file://0004-cups-fix-multilib-install-file-conflicts.patch =
\
> >             file://volatiles.99_cups \
> >             file://cups-volatiles.conf \
> > -           file://CVE-2024-47175-1.patch \
> > -           file://CVE-2024-47175-2.patch \
> > -           file://CVE-2024-47175-3.patch \
> > -           file://CVE-2024-47175-4.patch \
> > -           file://CVE-2024-47175-5.patch \
> >             "
> >
> >  GITHUB_BASE_URI =3D "https://github.com/OpenPrinting/cups/releases"
> > @@ -101,7 +96,7 @@ do_install () {
> >  PACKAGES =3D+ "${PN}-lib ${PN}-libimage ${PN}-webif"
> >
> >  RDEPENDS:${PN} +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit=
',
> 'procps', '', d)}"
> > -FILES:${PN} +=3D "${libexecdir}/cups/"
> > +FILES:${PN} +=3D "${libexecdir}/cups/
> ${systemd_system_unitdir}/system-cups.slice"
> >
> >  FILES:${PN}-lib =3D "${libdir}/libcups.so.*"
> >
> > diff --git
> a/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
> b/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
> > index e6bd400779..c0cb7df581 100644
> > --- a/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
> > +++ b/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
> > @@ -1,4 +1,4 @@
> > -From ddfe6ed6a89226985e8c9f0751c026aabc0927a0 Mon Sep 17 00:00:00 2001
> > +From c5f943b1ac6e1c86ae64686e29e178fedf933e96 Mon Sep 17 00:00:00 2001
> >  From: Saul Wold <sgw@linux.intel.com>
> >  Date: Thu, 13 Dec 2012 19:03:52 -0800
> >  Subject: [PATCH] use echo only in init
> > diff --git
> a/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binarie=
s.patch
> b/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binarie=
s.patch
> > index 75270cb0cb..cf2f1a6747 100644
> > ---
> a/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binarie=
s.patch
> > +++
> b/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binarie=
s.patch
> > @@ -1,4 +1,4 @@
> > -From ff6c7168c3f26094b3a18298208a28831d1c1fd5 Mon Sep 17 00:00:00 2001
> > +From da9a313ae5a2d1da683dd58572df0d7a660eb922 Mon Sep 17 00:00:00 2001
> >  From: Koen Kooi <koen@dominion.thruhere.net>
> >  Date: Sun, 30 Jan 2011 16:37:27 +0100
> >  Subject: [PATCH] don't try to run generated binaries
> > diff --git
> a/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-con=
flicts.patch
> b/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-con=
flicts.patch
> > index d49fb8f2c2..31338822e6 100644
> > ---
> a/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-con=
flicts.patch
> > +++
> b/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-con=
flicts.patch
> > @@ -1,4 +1,4 @@
> > -From 6e286b582571ffca3f7874076d70eec6fd5713f6 Mon Sep 17 00:00:00 2001
> > +From 880bad2c6b08afd2e2e303bc3ceea559edbe76d2 Mon Sep 17 00:00:00 2001
> >  From: Kai Kang <kai.kang@windriver.com>
> >  Date: Wed, 3 Oct 2018 00:27:11 +0800
> >  Subject: [PATCH] cups: fix multilib install file conflicts
> > @@ -15,10 +15,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >  diff --git a/conf/cups-files.conf.in b/conf/cups-files.conf.in
> > -index 93584a1..65b7052 100644
> > +index f96f745..27d8be9 100644
> >  --- a/conf/cups-files.conf.in
> >  +++ b/conf/cups-files.conf.in
> > -@@ -67,7 +67,7 @@ PageLog @CUPS_LOGDIR@/page_log
> > +@@ -70,7 +70,7 @@ PageLog @CUPS_LOGDIR@/page_log
> >   #RequestRoot @CUPS_REQUESTS@
> >
> >   # Location of helper programs...
> > diff --git a/meta/recipes-extended/cups/cups/CVE-2024-47175-1.patch
> b/meta/recipes-extended/cups/cups/CVE-2024-47175-1.patch
> > deleted file mode 100644
> > index 8ec720ea0d..0000000000
> > --- a/meta/recipes-extended/cups/cups/CVE-2024-47175-1.patch
> > +++ /dev/null
> > @@ -1,73 +0,0 @@
> > -From 9939a70b750edd9d05270060cc5cf62ca98cfbe5 Mon Sep 17 00:00:00 2001
> > -From: Michael R Sweet <msweet@msweet.org>
> > -Date: Mon, 9 Sep 2024 10:03:10 -0400
> > -Subject: [PATCH] Mirror IPP Everywhere printer changes from master.
> > -
> > -Upstream-Status: Backport [
> https://github.com/OpenPrinting/cups/commit/9939a70b750edd9d05270060cc5cf=
62ca98cfbe5
> ]
> > -CVE: CVE-2024-47175
> > -Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> > ----
> > - cups/ppd-cache.c | 10 +++++-----
> > - scheduler/ipp.c  |  7 +++++++
> > - 2 files changed, 12 insertions(+), 5 deletions(-)
> > -
> > -diff --git a/cups/ppd-cache.c b/cups/ppd-cache.c
> > -index e750fcc..cd2d6cb 100644
> > ---- a/cups/ppd-cache.c
> > -+++ b/cups/ppd-cache.c
> > -@@ -3317,10 +3317,10 @@ _ppdCreateFromIPP2(
> > -   }
> > -   cupsFilePuts(fp, "\"\n");
> > -
> > --  if ((attr =3D ippFindAttribute(supported, "printer-more-info",
> IPP_TAG_URI)) !=3D NULL)
> > -+  if ((attr =3D ippFindAttribute(supported, "printer-more-info",
> IPP_TAG_URI)) !=3D NULL && ippValidateAttribute(attr))
> > -     cupsFilePrintf(fp, "*APSupplies: \"%s\"\n", ippGetString(attr, 0,
> NULL));
> > -
> > --  if ((attr =3D ippFindAttribute(supported, "printer-charge-info-uri"=
,
> IPP_TAG_URI)) !=3D NULL)
> > -+  if ((attr =3D ippFindAttribute(supported, "printer-charge-info-uri"=
,
> IPP_TAG_URI)) !=3D NULL && ippValidateAttribute(attr))
> > -     cupsFilePrintf(fp, "*cupsChargeInfoURI: \"%s\"\n",
> ippGetString(attr, 0, NULL));
> > -
> > -   if ((attr =3D ippFindAttribute(supported, "printer-strings-uri",
> IPP_TAG_URI)) !=3D NULL)
> > -@@ -3389,10 +3389,10 @@ _ppdCreateFromIPP2(
> > -   if (ippGetBoolean(ippFindAttribute(supported,
> "job-accounting-user-id-supported", IPP_TAG_BOOLEAN), 0))
> > -     cupsFilePuts(fp, "*cupsJobAccountingUserId: True\n");
> > -
> > --  if ((attr =3D ippFindAttribute(supported,
> "printer-privacy-policy-uri", IPP_TAG_URI)) !=3D NULL)
> > -+  if ((attr =3D ippFindAttribute(supported,
> "printer-privacy-policy-uri", IPP_TAG_URI)) !=3D NULL &&
> ippValidateAttribute(attr))
> > -     cupsFilePrintf(fp, "*cupsPrivacyURI: \"%s\"\n", ippGetString(attr=
,
> 0, NULL));
> > -
> > --  if ((attr =3D ippFindAttribute(supported,
> "printer-mandatory-job-attributes", IPP_TAG_KEYWORD)) !=3D NULL)
> > -+  if ((attr =3D ippFindAttribute(supported,
> "printer-mandatory-job-attributes", IPP_TAG_KEYWORD)) !=3D NULL &&
> ippValidateAttribute(attr))
> > -   {
> > -     char      prefix =3D '\"';          // Prefix for string
> > -
> > -@@ -3410,7 +3410,7 @@ _ppdCreateFromIPP2(
> > -     cupsFilePuts(fp, "\"\n");
> > -   }
> > -
> > --  if ((attr =3D ippFindAttribute(supported,
> "printer-requested-job-attributes", IPP_TAG_KEYWORD)) !=3D NULL)
> > -+  if ((attr =3D ippFindAttribute(supported,
> "printer-requested-job-attributes", IPP_TAG_KEYWORD)) !=3D NULL &&
> ippValidateAttribute(attr))
> > -   {
> > -     char      prefix =3D '\"';          // Prefix for string
> > -
> > -diff --git a/scheduler/ipp.c b/scheduler/ipp.c
> > -index 37623c5..836e41d 100644
> > ---- a/scheduler/ipp.c
> > -+++ b/scheduler/ipp.c
> > -@@ -5417,6 +5417,13 @@ create_local_bg_thread(
> > -     }
> > -   }
> > -
> > -+  // Validate response from printer...
> > -+  if (!ippValidateAttributes(response))
> > -+  {
> > -+    cupsdLogMessage(CUPSD_LOG_ERROR, "%s: Printer returned invalid
> data: %s", printer->name, cupsLastErrorString());
> > -+    return (NULL);
> > -+  }
> > -+
> > -   // TODO: Grab printer icon file...
> > -   httpClose(http);
> > -
> > ---
> > -2.25.1
> > -
> > diff --git a/meta/recipes-extended/cups/cups/CVE-2024-47175-2.patch
> b/meta/recipes-extended/cups/cups/CVE-2024-47175-2.patch
> > deleted file mode 100644
> > index 11e8209626..0000000000
> > --- a/meta/recipes-extended/cups/cups/CVE-2024-47175-2.patch
> > +++ /dev/null
> > @@ -1,151 +0,0 @@
> > -From 04bb2af4521b56c1699a2c2431c56c05a7102e69 Mon Sep 17 00:00:00 2001
> > -From: Michael R Sweet <msweet@msweet.org>
> > -Date: Mon, 9 Sep 2024 14:05:42 -0400
> > -Subject: [PATCH] Refactor make-and-model code.
> > -
> > -Upstream-Status: Backport [
> https://github.com/OpenPrinting/cups/commit/04bb2af4521b56c1699a2c2431c56=
c05a7102e69
> ]
> > -CVE: CVE-2024-47175
> > -Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> > ----
> > - cups/ppd-cache.c | 103 +++++++++++++++++++++++++++++++++++++++-------=
-
> > - 1 file changed, 87 insertions(+), 16 deletions(-)
> > -
> > -diff --git a/cups/ppd-cache.c b/cups/ppd-cache.c
> > -index cd2d6cb..a4d7403 100644
> > ---- a/cups/ppd-cache.c
> > -+++ b/cups/ppd-cache.c
> > -@@ -3197,9 +3197,10 @@ _ppdCreateFromIPP2(
> > -   ipp_t                       *media_col,     /* Media collection */
> > -                       *media_size;    /* Media size collection */
> > -   char                        make[256],      /* Make and model */
> > --                      *model,         /* Model name */
> > -+                      *mptr,          /* Pointer into make and model =
*/
> > -                       ppdname[PPD_MAX_NAME];
> > -                                       /* PPD keyword */
> > -+  const char          *model;         /* Model name */
> > -   int                 i, j,           /* Looping vars */
> > -                       count,          /* Number of values */
> > -                       bottom,         /* Largest bottom margin */
> > -@@ -3260,34 +3261,104 @@ _ppdCreateFromIPP2(
> > -   }
> > -
> > -  /*
> > --  * Standard stuff for PPD file...
> > -+  * Get a sanitized make and model...
> > -   */
> > -
> > --  cupsFilePuts(fp, "*PPD-Adobe: \"4.3\"\n");
> > --  cupsFilePuts(fp, "*FormatVersion: \"4.3\"\n");
> > --  cupsFilePrintf(fp, "*FileVersion: \"%d.%d\"\n", CUPS_VERSION_MAJOR,
> CUPS_VERSION_MINOR);
> > --  cupsFilePuts(fp, "*LanguageVersion: English\n");
> > --  cupsFilePuts(fp, "*LanguageEncoding: ISOLatin1\n");
> > --  cupsFilePuts(fp, "*PSVersion: \"(3010.000) 0\"\n");
> > --  cupsFilePuts(fp, "*LanguageLevel: \"3\"\n");
> > --  cupsFilePuts(fp, "*FileSystem: False\n");
> > --  cupsFilePuts(fp, "*PCFileName: \"ippeve.ppd\"\n");
> > -+  if ((attr =3D ippFindAttribute(supported, "printer-make-and-model",
> IPP_TAG_TEXT)) !=3D NULL && ippValidateAttribute(attr))
> > -+  {
> > -+   /*
> > -+    * Sanitize the model name to only contain PPD-safe characters.
> > -+    */
> > -
> > --  if ((attr =3D ippFindAttribute(supported, "printer-make-and-model",
> IPP_TAG_TEXT)) !=3D NULL)
> > -     strlcpy(make, ippGetString(attr, 0, NULL), sizeof(make));
> > -+
> > -+    for (mptr =3D make; *mptr; mptr ++)
> > -+    {
> > -+      if (*mptr < ' ' || *mptr >=3D 127 || *mptr =3D=3D '\"')
> > -+      {
> > -+       /*
> > -+      * Truncate the make and model on the first bad character...
> > -+      */
> > -+
> > -+      *mptr =3D '\0';
> > -+      break;
> > -+      }
> > -+    }
> > -+
> > -+    while (mptr > make)
> > -+    {
> > -+     /*
> > -+      * Strip trailing whitespace...
> > -+      */
> > -+
> > -+      mptr --;
> > -+      if (*mptr =3D=3D ' ')
> > -+      *mptr =3D '\0';
> > -+    }
> > -+
> > -+    if (!make[0])
> > -+    {
> > -+     /*
> > -+      * Use a default make and model if nothing remains...
> > -+      */
> > -+
> > -+      strlcpy(make, "Unknown", sizeof(make));
> > -+    }
> > -+  }
> > -   else
> > --    strlcpy(make, "Unknown Printer", sizeof(make));
> > -+  {
> > -+   /*
> > -+    * Use a default make and model...
> > -+    */
> > -+
> > -+    strlcpy(make, "Unknown", sizeof(make));
> > -+  }
> > -
> > -   if (!_cups_strncasecmp(make, "Hewlett Packard ", 16) ||
> !_cups_strncasecmp(make, "Hewlett-Packard ", 16))
> > -   {
> > -+   /*
> > -+    * Normalize HP printer make and model...
> > -+    */
> > -+
> > -     model =3D make + 16;
> > -     strlcpy(make, "HP", sizeof(make));
> > -+
> > -+    if (!_cups_strncasecmp(model, "HP ", 3))
> > -+      model +=3D 3;
> > -+  }
> > -+  else if ((mptr =3D strchr(make, ' ')) !=3D NULL)
> > -+  {
> > -+   /*
> > -+    * Separate "MAKE MODEL"...
> > -+    */
> > -+
> > -+    while (*mptr && *mptr =3D=3D ' ')
> > -+      *mptr++ =3D '\0';
> > -+
> > -+    model =3D mptr;
> > -   }
> > --  else if ((model =3D strchr(make, ' ')) !=3D NULL)
> > --    *model++ =3D '\0';
> > -   else
> > --    model =3D make;
> > -+  {
> > -+   /*
> > -+    * No separate model name...
> > -+    */
> > -
> > -+    model =3D "Printer";
> > -+  }
> > -+
> > -+ /*
> > -+  * Standard stuff for PPD file...
> > -+  */
> > -+
> > -+  cupsFilePuts(fp, "*PPD-Adobe: \"4.3\"\n");
> > -+  cupsFilePuts(fp, "*FormatVersion: \"4.3\"\n");
> > -+  cupsFilePrintf(fp, "*FileVersion: \"%d.%d\"\n", CUPS_VERSION_MAJOR,
> CUPS_VERSION_MINOR);
> > -+  cupsFilePuts(fp, "*LanguageVersion: English\n");
> > -+  cupsFilePuts(fp, "*LanguageEncoding: ISOLatin1\n");
> > -+  cupsFilePuts(fp, "*PSVersion: \"(3010.000) 0\"\n");
> > -+  cupsFilePuts(fp, "*LanguageLevel: \"3\"\n");
> > -+  cupsFilePuts(fp, "*FileSystem: False\n");
> > -+  cupsFilePuts(fp, "*PCFileName: \"ippeve.ppd\"\n");
> > -   cupsFilePrintf(fp, "*Manufacturer: \"%s\"\n", make);
> > -   cupsFilePrintf(fp, "*ModelName: \"%s\"\n", model);
> > -   cupsFilePrintf(fp, "*Product: \"(%s)\"\n", model);
> > ---
> > -2.25.1
> > -
> > diff --git a/meta/recipes-extended/cups/cups/CVE-2024-47175-3.patch
> b/meta/recipes-extended/cups/cups/CVE-2024-47175-3.patch
> > deleted file mode 100644
> > index e7d012fb8a..0000000000
> > --- a/meta/recipes-extended/cups/cups/CVE-2024-47175-3.patch
> > +++ /dev/null
> > @@ -1,119 +0,0 @@
> > -From e0630cd18f76340d302000f2bf6516e99602b844 Mon Sep 17 00:00:00 2001
> > -From: Michael R Sweet <msweet@msweet.org>
> > -Date: Mon, 9 Sep 2024 15:59:57 -0400
> > -Subject: [PATCH] PPDize preset and template names.
> > -
> > -Upstream-Status: Backport [
> https://github.com/OpenPrinting/cups/commit/e0630cd18f76340d302000f2bf651=
6e99602b844
> ]
> > -CVE: CVE-2024-47175
> > -Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> > ----
> > - cups/ppd-cache.c | 33 ++++++++++++++++++++++++---------
> > - 1 file changed, 24 insertions(+), 9 deletions(-)
> > -
> > -diff --git a/cups/ppd-cache.c b/cups/ppd-cache.c
> > -index a4d7403..53c22be 100644
> > ---- a/cups/ppd-cache.c
> > -+++ b/cups/ppd-cache.c
> > -@@ -4976,12 +4976,14 @@ _ppdCreateFromIPP2(
> > -
> > -       cupsArrayAdd(templates, (void *)keyword);
> > -
> > -+      pwg_ppdize_name(keyword, ppdname, sizeof(ppdname));
> > -+
> > -       snprintf(msgid, sizeof(msgid), "finishing-template.%s", keyword=
);
> > -       if ((msgstr =3D _cupsLangString(lang, msgid)) =3D=3D msgid ||
> !strcmp(msgid, msgstr))
> > -       if ((msgstr =3D _cupsMessageLookup(strings, msgid)) =3D=3D msgi=
d)
> > -         msgstr =3D keyword;
> > -
> > --      cupsFilePrintf(fp, "*cupsFinishingTemplate %s: \"\n", keyword);
> > -+      cupsFilePrintf(fp, "*cupsFinishingTemplate %s: \"\n", ppdname);
> > -       for (finishing_attr =3D ippFirstAttribute(finishing_col);
> finishing_attr; finishing_attr =3D ippNextAttribute(finishing_col))
> > -       {
> > -         if (ippGetValueTag(finishing_attr) =3D=3D IPP_TAG_BEGIN_COLLE=
CTION)
> > -@@ -4994,7 +4996,7 @@ _ppdCreateFromIPP2(
> > -       }
> > -       }
> > -       cupsFilePuts(fp, "\"\n");
> > --      cupsFilePrintf(fp, "*%s.cupsFinishingTemplate %s/%s: \"\"\n",
> lang->language, keyword, msgstr);
> > -+      cupsFilePrintf(fp, "*%s.cupsFinishingTemplate %s/%s: \"\"\n",
> lang->language, ppdname, msgstr);
> > -       cupsFilePuts(fp, "*End\n");
> > -     }
> > -
> > -@@ -5040,7 +5042,8 @@ _ppdCreateFromIPP2(
> > -       if (!preset || !preset_name)
> > -         continue;
> > -
> > --      cupsFilePrintf(fp, "*APPrinterPreset %s: \"\n", preset_name);
> > -+      pwg_ppdize_name(preset_name, ppdname, sizeof(ppdname));
> > -+      cupsFilePrintf(fp, "*APPrinterPreset %s: \"\n", ppdname);
> > -       for (member =3D ippFirstAttribute(preset); member; member =3D
> ippNextAttribute(preset))
> > -       {
> > -         member_name =3D ippGetName(member);
> > -@@ -5081,7 +5084,10 @@ _ppdCreateFromIPP2(
> > -             fin_col =3D ippGetCollection(member, i);
> > -
> > -             if ((keyword =3D ippGetString(ippFindAttribute(fin_col,
> "finishing-template", IPP_TAG_ZERO), 0, NULL)) !=3D NULL)
> > --              cupsFilePrintf(fp, "*cupsFinishingTemplate %s\n",
> keyword);
> > -+            {
> > -+              pwg_ppdize_name(keyword, ppdname, sizeof(ppdname));
> > -+              cupsFilePrintf(fp, "*cupsFinishingTemplate %s\n",
> ppdname);
> > -+            }
> > -           }
> > -         }
> > -         else if (!strcmp(member_name, "media"))
> > -@@ -5108,13 +5114,13 @@ _ppdCreateFromIPP2(
> > -           if ((keyword =3D ippGetString(ippFindAttribute(media_col,
> "media-source", IPP_TAG_ZERO), 0, NULL)) !=3D NULL)
> > -           {
> > -             pwg_ppdize_name(keyword, ppdname, sizeof(ppdname));
> > --            cupsFilePrintf(fp, "*InputSlot %s\n", keyword);
> > -+            cupsFilePrintf(fp, "*InputSlot %s\n", ppdname);
> > -         }
> > -
> > -           if ((keyword =3D ippGetString(ippFindAttribute(media_col,
> "media-type", IPP_TAG_ZERO), 0, NULL)) !=3D NULL)
> > -           {
> > -             pwg_ppdize_name(keyword, ppdname, sizeof(ppdname));
> > --            cupsFilePrintf(fp, "*MediaType %s\n", keyword);
> > -+            cupsFilePrintf(fp, "*MediaType %s\n", ppdname);
> > -         }
> > -         }
> > -         else if (!strcmp(member_name, "print-quality"))
> > -@@ -5160,7 +5166,10 @@ _ppdCreateFromIPP2(
> > -       cupsFilePuts(fp, "\"\n*End\n");
> > -
> > -       if ((localized_name =3D _cupsMessageLookup(strings, preset_name=
))
> !=3D preset_name)
> > --        cupsFilePrintf(fp, "*%s.APPrinterPreset %s/%s: \"\"\n",
> lang->language, preset_name, localized_name);
> > -+      {
> > -+        pwg_ppdize_name(preset_name, ppdname, sizeof(ppdname));
> > -+        cupsFilePrintf(fp, "*%s.APPrinterPreset %s/%s: \"\"\n",
> lang->language, ppdname, localized_name);
> > -+      }
> > -     }
> > -   }
> > -
> > -@@ -5544,7 +5553,7 @@ pwg_ppdize_name(const char *ipp, /* I - IPP
> keyword */
> > -       *end;                           /* End of name buffer */
> > -
> > -
> > --  if (!ipp)
> > -+  if (!ipp || !_cups_isalnum(*ipp))
> > -   {
> > -     *name =3D '\0';
> > -     return;
> > -@@ -5559,8 +5568,14 @@ pwg_ppdize_name(const char *ipp,        /* I -
> IPP keyword */
> > -       ipp ++;
> > -       *ptr++ =3D (char)toupper(*ipp++ & 255);
> > -     }
> > --    else
> > -+    else if (*ipp =3D=3D '_' || *ipp =3D=3D '.' || *ipp =3D=3D '-' ||
> _cups_isalnum(*ipp))
> > -+    {
> > -       *ptr++ =3D *ipp++;
> > -+    }
> > -+    else
> > -+    {
> > -+      ipp ++;
> > -+    }
> > -   }
> > -
> > -   *ptr =3D '\0';
> > ---
> > -2.25.1
> > -
> > diff --git a/meta/recipes-extended/cups/cups/CVE-2024-47175-4.patch
> b/meta/recipes-extended/cups/cups/CVE-2024-47175-4.patch
> > deleted file mode 100644
> > index 7665513485..0000000000
> > --- a/meta/recipes-extended/cups/cups/CVE-2024-47175-4.patch
> > +++ /dev/null
> > @@ -1,249 +0,0 @@
> > -From 1e6ca5913eceee906038bc04cc7ccfbe2923bdfd Mon Sep 17 00:00:00 2001
> > -From: Michael R Sweet <msweet@msweet.org>
> > -Date: Mon, 23 Sep 2024 09:36:39 -0400
> > -Subject: [PATCH] Quote PPD localized strings.
> > -
> > -Upstream-Status: Backport [
> https://github.com/OpenPrinting/cups/commit/1e6ca5913eceee906038bc04cc7cc=
fbe2923bdfd
> ]
> > -CVE: CVE-2024-47175
> > -Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> > ----
> > - cups/ppd-cache.c | 93 +++++++++++++++++++++++++++--------------------=
-
> > - 1 file changed, 53 insertions(+), 40 deletions(-)
> > -
> > -diff --git a/cups/ppd-cache.c b/cups/ppd-cache.c
> > -index 53c22be..f425ac0 100644
> > ---- a/cups/ppd-cache.c
> > -+++ b/cups/ppd-cache.c
> > -@@ -32,6 +32,7 @@
> > - static int    cups_connect(http_t **http, const char *url, char
> *resource, size_t ressize);
> > - static int    cups_get_url(http_t **http, const char *url, char *name=
,
> size_t namesize);
> > - static const char *ppd_inputslot_for_keyword(_ppd_cache_t *pc, const
> char *keyword);
> > -+static void   ppd_put_string(cups_file_t *fp, cups_lang_t *lang,
> cups_array_t *strings, const char *ppd_option, const char *ppd_choice,
> const char *pwg_msgid);
> > - static void   pwg_add_finishing(cups_array_t *finishings,
> ipp_finishings_t template, const char *name, const char *value);
> > - static void   pwg_add_message(cups_array_t *a, const char *msg, const
> char *str);
> > - static int    pwg_compare_finishings(_pwg_finishings_t *a,
> _pwg_finishings_t *b);
> > -@@ -3394,7 +3395,7 @@ _ppdCreateFromIPP2(
> > -   if ((attr =3D ippFindAttribute(supported, "printer-charge-info-uri"=
,
> IPP_TAG_URI)) !=3D NULL && ippValidateAttribute(attr))
> > -     cupsFilePrintf(fp, "*cupsChargeInfoURI: \"%s\"\n",
> ippGetString(attr, 0, NULL));
> > -
> > --  if ((attr =3D ippFindAttribute(supported, "printer-strings-uri",
> IPP_TAG_URI)) !=3D NULL)
> > -+  if ((attr =3D ippFindAttribute(supported, "printer-strings-uri",
> IPP_TAG_URI)) !=3D NULL && ippValidateAttribute(attr))
> > -   {
> > -     http_t    *http =3D NULL;           /* Connection to printer */
> > -     char      stringsfile[1024];      /* Temporary strings file */
> > -@@ -3438,7 +3439,7 @@ _ppdCreateFromIPP2(
> > -
> > -         response =3D cupsDoRequest(http, request, resource);
> > -
> > --        if ((attr =3D ippFindAttribute(response, "printer-strings-uri=
",
> IPP_TAG_URI)) !=3D NULL)
> > -+        if ((attr =3D ippFindAttribute(response, "printer-strings-uri=
",
> IPP_TAG_URI)) !=3D NULL && ippValidateAttribute(attr))
> > -           cupsFilePrintf(fp, "*cupsStringsURI %s: \"%s\"\n", keyword,
> ippGetString(attr, 0, NULL));
> > -
> > -         ippDelete(response);
> > -@@ -4044,18 +4045,16 @@ _ppdCreateFromIPP2(
> > -       cupsFilePrintf(fp, "*DefaultInputSlot: %s\n", ppdname);
> > -
> > -       for (j =3D 0; j < (int)(sizeof(sources) / sizeof(sources[0])); =
j
> ++)
> > -+      {
> > -         if (!strcmp(sources[j], keyword))
> > -       {
> > -         snprintf(msgid, sizeof(msgid), "media-source.%s", keyword);
> > -
> > --        if ((msgstr =3D _cupsLangString(lang, msgid)) =3D=3D msgid ||
> !strcmp(msgid, msgstr))
> > --          if ((msgstr =3D _cupsMessageLookup(strings, msgid)) =3D=3D =
msgid)
> > --            msgstr =3D keyword;
> > --
> > -         cupsFilePrintf(fp, "*InputSlot %s: \"<</MediaPosition
> %d>>setpagedevice\"\n", ppdname, j);
> > --        cupsFilePrintf(fp, "*%s.InputSlot %s/%s: \"\"\n",
> lang->language, ppdname, msgstr);
> > -+        ppd_put_string(fp, lang, strings, "InputSlot", ppdname, msgid=
);
> > -         break;
> > -       }
> > -+      }
> > -     }
> > -     cupsFilePuts(fp, "*CloseUI: *InputSlot\n");
> > -   }
> > -@@ -4081,12 +4080,9 @@ _ppdCreateFromIPP2(
> > -       pwg_ppdize_name(keyword, ppdname, sizeof(ppdname));
> > -
> > -       snprintf(msgid, sizeof(msgid), "media-type.%s", keyword);
> > --      if ((msgstr =3D _cupsLangString(lang, msgid)) =3D=3D msgid ||
> !strcmp(msgid, msgstr))
> > --      if ((msgstr =3D _cupsMessageLookup(strings, msgid)) =3D=3D msgi=
d)
> > --        msgstr =3D keyword;
> > -
> > -       cupsFilePrintf(fp, "*MediaType %s:
> \"<</MediaType(%s)>>setpagedevice\"\n", ppdname, ppdname);
> > --      cupsFilePrintf(fp, "*%s.MediaType %s/%s: \"\"\n",
> lang->language, ppdname, msgstr);
> > -+      ppd_put_string(fp, lang, strings, "MediaType", ppdname, msgid);
> > -     }
> > -     cupsFilePuts(fp, "*CloseUI: *MediaType\n");
> > -   }
> > -@@ -4547,12 +4543,9 @@ _ppdCreateFromIPP2(
> > -       pwg_ppdize_name(keyword, ppdname, sizeof(ppdname));
> > -
> > -       snprintf(msgid, sizeof(msgid), "output-bin.%s", keyword);
> > --      if ((msgstr =3D _cupsLangString(lang, msgid)) =3D=3D msgid ||
> !strcmp(msgid, msgstr))
> > --      if ((msgstr =3D _cupsMessageLookup(strings, msgid)) =3D=3D msgi=
d)
> > --        msgstr =3D keyword;
> > -
> > -       cupsFilePrintf(fp, "*OutputBin %s: \"\"\n", ppdname);
> > --      cupsFilePrintf(fp, "*%s.OutputBin %s/%s: \"\"\n",
> lang->language, ppdname, msgstr);
> > -+      ppd_put_string(fp, lang, strings, "OutputBin", ppdname, msgid);
> > -
> > -       if ((tray_ptr =3D ippGetOctetString(trays, i, &tray_len)) !=3D =
NULL)
> > -       {
> > -@@ -4671,9 +4664,6 @@ _ppdCreateFromIPP2(
> > -         cupsArrayAdd(names, (char *)keyword);
> > -
> > -       snprintf(msgid, sizeof(msgid), "finishings.%d", value);
> > --      if ((msgstr =3D _cupsLangString(lang, msgid)) =3D=3D msgid ||
> !strcmp(msgid, msgstr))
> > --        if ((msgstr =3D _cupsMessageLookup(strings, msgid)) =3D=3D ms=
gid)
> > --          msgstr =3D keyword;
> > -
> > -         if (value >=3D IPP_FINISHINGS_NONE && value <=3D
> IPP_FINISHINGS_LAMINATE)
> > -           ppd_keyword =3D base_keywords[value - IPP_FINISHINGS_NONE];
> > -@@ -4688,7 +4678,7 @@ _ppdCreateFromIPP2(
> > -           continue;
> > -
> > -       cupsFilePrintf(fp, "*StapleLocation %s: \"\"\n", ppd_keyword);
> > --      cupsFilePrintf(fp, "*%s.StapleLocation %s/%s: \"\"\n",
> lang->language, ppd_keyword, msgstr);
> > -+      ppd_put_string(fp, lang, strings, "StapleLocation", ppd_keyword=
,
> msgid);
> > -       cupsFilePrintf(fp, "*cupsIPPFinishings %d/%s: \"*StapleLocation
> %s\"\n", value, keyword, ppd_keyword);
> > -       }
> > -
> > -@@ -4751,9 +4741,6 @@ _ppdCreateFromIPP2(
> > -         cupsArrayAdd(names, (char *)keyword);
> > -
> > -       snprintf(msgid, sizeof(msgid), "finishings.%d", value);
> > --      if ((msgstr =3D _cupsLangString(lang, msgid)) =3D=3D msgid ||
> !strcmp(msgid, msgstr))
> > --        if ((msgstr =3D _cupsMessageLookup(strings, msgid)) =3D=3D ms=
gid)
> > --          msgstr =3D keyword;
> > -
> > -         if (value >=3D IPP_FINISHINGS_NONE && value <=3D
> IPP_FINISHINGS_LAMINATE)
> > -           ppd_keyword =3D base_keywords[value - IPP_FINISHINGS_NONE];
> > -@@ -4768,7 +4755,7 @@ _ppdCreateFromIPP2(
> > -           continue;
> > -
> > -       cupsFilePrintf(fp, "*FoldType %s: \"\"\n", ppd_keyword);
> > --      cupsFilePrintf(fp, "*%s.FoldType %s/%s: \"\"\n", lang->language=
,
> ppd_keyword, msgstr);
> > -+      ppd_put_string(fp, lang, strings, "FoldType", ppd_keyword,
> msgid);
> > -       cupsFilePrintf(fp, "*cupsIPPFinishings %d/%s: \"*FoldType
> %s\"\n", value, keyword, ppd_keyword);
> > -       }
> > -
> > -@@ -4839,9 +4826,6 @@ _ppdCreateFromIPP2(
> > -         cupsArrayAdd(names, (char *)keyword);
> > -
> > -       snprintf(msgid, sizeof(msgid), "finishings.%d", value);
> > --      if ((msgstr =3D _cupsLangString(lang, msgid)) =3D=3D msgid ||
> !strcmp(msgid, msgstr))
> > --        if ((msgstr =3D _cupsMessageLookup(strings, msgid)) =3D=3D ms=
gid)
> > --          msgstr =3D keyword;
> > -
> > -         if (value >=3D IPP_FINISHINGS_NONE && value <=3D
> IPP_FINISHINGS_LAMINATE)
> > -           ppd_keyword =3D base_keywords[value - IPP_FINISHINGS_NONE];
> > -@@ -4856,7 +4840,7 @@ _ppdCreateFromIPP2(
> > -           continue;
> > -
> > -       cupsFilePrintf(fp, "*PunchMedia %s: \"\"\n", ppd_keyword);
> > --      cupsFilePrintf(fp, "*%s.PunchMedia %s/%s: \"\"\n",
> lang->language, ppd_keyword, msgstr);
> > -+      ppd_put_string(fp, lang, strings, "PunchMedia", ppd_keyword,
> msgid);
> > -       cupsFilePrintf(fp, "*cupsIPPFinishings %d/%s: \"*PunchMedia
> %s\"\n", value, keyword, ppd_keyword);
> > -       }
> > -
> > -@@ -4927,9 +4911,6 @@ _ppdCreateFromIPP2(
> > -         cupsArrayAdd(names, (char *)keyword);
> > -
> > -       snprintf(msgid, sizeof(msgid), "finishings.%d", value);
> > --      if ((msgstr =3D _cupsLangString(lang, msgid)) =3D=3D msgid ||
> !strcmp(msgid, msgstr))
> > --        if ((msgstr =3D _cupsMessageLookup(strings, msgid)) =3D=3D ms=
gid)
> > --          msgstr =3D keyword;
> > -
> > -         if (value =3D=3D IPP_FINISHINGS_TRIM)
> > -           ppd_keyword =3D "Auto";
> > -@@ -4937,7 +4918,7 @@ _ppdCreateFromIPP2(
> > -         ppd_keyword =3D trim_keywords[value -
> IPP_FINISHINGS_TRIM_AFTER_PAGES];
> > -
> > -       cupsFilePrintf(fp, "*CutMedia %s: \"\"\n", ppd_keyword);
> > --      cupsFilePrintf(fp, "*%s.CutMedia %s/%s: \"\"\n", lang->language=
,
> ppd_keyword, msgstr);
> > -+      ppd_put_string(fp, lang, strings, "CutMedia", ppd_keyword,
> msgid);
> > -       cupsFilePrintf(fp, "*cupsIPPFinishings %d/%s: \"*CutMedia
> %s\"\n", value, keyword, ppd_keyword);
> > -       }
> > -
> > -@@ -4979,9 +4960,6 @@ _ppdCreateFromIPP2(
> > -       pwg_ppdize_name(keyword, ppdname, sizeof(ppdname));
> > -
> > -       snprintf(msgid, sizeof(msgid), "finishing-template.%s", keyword=
);
> > --      if ((msgstr =3D _cupsLangString(lang, msgid)) =3D=3D msgid ||
> !strcmp(msgid, msgstr))
> > --      if ((msgstr =3D _cupsMessageLookup(strings, msgid)) =3D=3D msgi=
d)
> > --        msgstr =3D keyword;
> > -
> > -       cupsFilePrintf(fp, "*cupsFinishingTemplate %s: \"\n", ppdname);
> > -       for (finishing_attr =3D ippFirstAttribute(finishing_col);
> finishing_attr; finishing_attr =3D ippNextAttribute(finishing_col))
> > -@@ -4996,7 +4974,7 @@ _ppdCreateFromIPP2(
> > -       }
> > -       }
> > -       cupsFilePuts(fp, "\"\n");
> > --      cupsFilePrintf(fp, "*%s.cupsFinishingTemplate %s/%s: \"\"\n",
> lang->language, ppdname, msgstr);
> > -+      ppd_put_string(fp, lang, strings, "cupsFinishingTemplate",
> ppdname, msgid);
> > -       cupsFilePuts(fp, "*End\n");
> > -     }
> > -
> > -@@ -5165,11 +5143,9 @@ _ppdCreateFromIPP2(
> > -
> > -       cupsFilePuts(fp, "\"\n*End\n");
> > -
> > --      if ((localized_name =3D _cupsMessageLookup(strings, preset_name=
))
> !=3D preset_name)
> > --      {
> > --        pwg_ppdize_name(preset_name, ppdname, sizeof(ppdname));
> > --        cupsFilePrintf(fp, "*%s.APPrinterPreset %s/%s: \"\"\n",
> lang->language, ppdname, localized_name);
> > --      }
> > -+      snprintf(msgid, sizeof(msgid), "preset-name.%s", preset_name);
> > -+      pwg_ppdize_name(preset_name, ppdname, sizeof(ppdname));
> > -+      ppd_put_string(fp, lang, strings, "APPrinterPreset", ppdname,
> msgid);
> > -     }
> > -   }
> > -
> > -@@ -5440,6 +5416,43 @@ cups_get_url(http_t     **http,         /* IO -
> Current HTTP connection */
> > - }
> > -
> > -
> > -+/*
> > -+ * 'ppd_put_strings()' - Write localization attributes to a PPD file.
> > -+ */
> > -+
> > -+static void
> > -+ppd_put_string(cups_file_t  *fp,      /* I - PPD file */
> > -+               cups_lang_t  *lang,    /* I - Language */
> > -+               cups_array_t *strings, /* I - Strings */
> > -+             const char   *ppd_option,/* I - PPD option */
> > -+             const char   *ppd_choice,/* I - PPD choice */
> > -+             const char   *pwg_msgid) /* I - PWG message ID */
> > -+{
> > -+  const char  *text;                  /* Localized text */
> > -+
> > -+
> > -+  if ((text =3D _cupsLangString(lang, pwg_msgid)) =3D=3D pwg_msgid ||
> !strcmp(pwg_msgid, text))
> > -+  {
> > -+    if ((text =3D _cupsMessageLookup(strings, pwg_msgid)) =3D=3D pwg_=
msgid)
> > -+      return;
> > -+  }
> > -+
> > -+  // Add the first line of localized text...
> > -+  cupsFilePrintf(fp, "*%s.%s %s/", lang->language, ppd_option,
> ppd_choice);
> > -+  while (*text && *text !=3D '\n')
> > -+  {
> > -+    // Escape ":" and "<"...
> > -+    if (*text =3D=3D ':' || *text =3D=3D '<')
> > -+      cupsFilePrintf(fp, "<%02X>", *text);
> > -+    else
> > -+      cupsFilePutChar(fp, *text);
> > -+
> > -+    text ++;
> > -+  }
> > -+  cupsFilePuts(fp, ": \"\"\n");
> > -+}
> > -+
> > -+
> > - /*
> > -  * 'pwg_add_finishing()' - Add a finishings value.
> > -  */
> > ---
> > -2.25.1
> > -
> > diff --git a/meta/recipes-extended/cups/cups/CVE-2024-47175-5.patch
> b/meta/recipes-extended/cups/cups/CVE-2024-47175-5.patch
> > deleted file mode 100644
> > index 77a30857e2..0000000000
> > --- a/meta/recipes-extended/cups/cups/CVE-2024-47175-5.patch
> > +++ /dev/null
> > @@ -1,40 +0,0 @@
> > -From 2abe1ba8a66864aa82cd9836b37e57103b8e1a3b Mon Sep 17 00:00:00 2001
> > -From: Michael R Sweet <msweet@msweet.org>
> > -Date: Mon, 23 Sep 2024 10:11:31 -0400
> > -Subject: [PATCH] Fix warnings for unused vars.
> > -
> > -Upstream-Status: Backport [
> https://github.com/OpenPrinting/cups/commit/2abe1ba8a66864aa82cd9836b37e5=
7103b8e1a3b
> ]
> > -CVE: CVE-2024-47175
> > -Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> > ----
> > - cups/ppd-cache.c | 6 ++----
> > - 1 file changed, 2 insertions(+), 4 deletions(-)
> > -
> > -diff --git a/cups/ppd-cache.c b/cups/ppd-cache.c
> > -index f425ac0..d2533b7 100644
> > ---- a/cups/ppd-cache.c
> > -+++ b/cups/ppd-cache.c
> > -@@ -3223,8 +3223,7 @@ _ppdCreateFromIPP2(
> > -   int                 have_qdraft =3D 0,/* Have draft quality? */
> > -                       have_qhigh =3D 0; /* Have high quality? */
> > -   char                        msgid[256];     /* Message identifier
> (attr.value) */
> > --  const char          *keyword,       /* Keyword value */
> > --                      *msgstr;        /* Localized string */
> > -+  const char          *keyword;       /* Keyword value */
> > -   cups_array_t                *strings =3D NULL;/* Printer strings fi=
le
> */
> > -   struct lconv                *loc =3D localeconv();
> > -                                       /* Locale data */
> > -@@ -5010,9 +5009,8 @@ _ppdCreateFromIPP2(
> > -     {
> > -       ipp_t   *preset =3D ippGetCollection(attr, i);
> > -                                       /* Preset collection */
> > --      const char *preset_name =3D ippGetString(ippFindAttribute(prese=
t,
> "preset-name", IPP_TAG_ZERO), 0, NULL),
> > -+      const char *preset_name =3D ippGetString(ippFindAttribute(prese=
t,
> "preset-name", IPP_TAG_ZERO), 0, NULL);
> > -                                       /* Preset name */
> > --              *localized_name;        /* Localized preset name */
> > -       ipp_attribute_t *member;                /* Member attribute in
> preset */
> > -       const char *member_name;                /* Member attribute nam=
e
> */
> > -       char            member_value[256];      /* Member attribute
> value */
> > ---
> > -2.25.1
> > -
> > diff --git a/meta/recipes-extended/cups/cups/libexecdir.patch
> b/meta/recipes-extended/cups/cups/libexecdir.patch
> > index 7ccad94f0f..493c7970ea 100644
> > --- a/meta/recipes-extended/cups/cups/libexecdir.patch
> > +++ b/meta/recipes-extended/cups/cups/libexecdir.patch
> > @@ -1,4 +1,4 @@
> > -From 1724f7bcdbcfdb445778f8a2e530c5c094c18c10 Mon Sep 17 00:00:00 2001
> > +From 4ae7ad87aa022f5128be222dffbf0c50ec6e846e Mon Sep 17 00:00:00 2001
> >  From: Ross Burton <ross.burton@arm.com>
> >  Date: Tue, 13 Jul 2021 12:56:30 +0100
> >  Subject: [PATCH] Use $libexecdir instead of hardcoding $prefix/lib as
> this
> > @@ -6,13 +6,12 @@ Subject: [PATCH] Use $libexecdir instead of hardcodin=
g
> $prefix/lib as this
> >
> >  Upstream-Status: Pending
> >  Signed-off-by: Ross Burton <ross.burton@arm.com>
> > -
> >  ---
> >   config-scripts/cups-directories.m4 | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> >  diff --git a/config-scripts/cups-directories.m4
> b/config-scripts/cups-directories.m4
> > -index 2033d47..230166e 100644
> > +index 069ee7b..2f67e5b 100644
> >  --- a/config-scripts/cups-directories.m4
> >  +++ b/config-scripts/cups-directories.m4
> >  @@ -239,7 +239,7 @@ AC_SUBST([CUPS_REQUESTS])
> > diff --git a/meta/recipes-extended/cups/cups_2.4.10.bb
> b/meta/recipes-extended/cups/cups_2.4.14.bb
> > similarity index 51%
> > rename from meta/recipes-extended/cups/cups_2.4.10.bb
> > rename to meta/recipes-extended/cups/cups_2.4.14.bb
> > index e16ad47cf5..5d5a1dc97f 100644
> > --- a/meta/recipes-extended/cups/cups_2.4.10.bb
> > +++ b/meta/recipes-extended/cups/cups_2.4.14.bb
> > @@ -2,4 +2,4 @@ require cups.inc
> >
> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c=
6bd57"
> >
> > -SRC_URI[sha256sum] =3D
> "d75757c2bc0f7a28b02ee4d52ca9e4b1aa1ba2affe16b985854f5336940e5ad7"
> > +SRC_URI[sha256sum] =3D
> "660288020dd6f79caf799811c4c1a3207a48689899ac2093959d70a3bdcb7699"
> > --
> > 2.25.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#223490):
> https://lists.openembedded.org/g/openembedded-core/message/223490
> > Mute This Topic: https://lists.openembedded.org/mt/115254371/3620601
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> steve@sakoman.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000b4d9e6063ed9ee83
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Steve,<br><br>Thank you for the clarification.<br><br>=
I understand that `v2.4.12` and `v2.4.13` are not suitable for the LTS rele=
ase due to new features.<br><br>I will proceed with preparing a new patch t=
o upgrade to `v2.4.11`, as it is a bugfix-only release. Additionally, I wil=
l include patches to address the referenced CVEs.<br><br>Thanks &amp; Regar=
ds,<br>Vijay<div><br></div><div class=3D"gmail_quote gmail_quote_container"=
><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 15 Sept, 2025, 10:21=E2=80=
=AFpm Steve Sakoman, &lt;<a href=3D"mailto:steve@sakoman.com">steve@sakoman=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Vijay,<br>
<br>
Unfortunately v2.4.12 and v2.12.13 both add new features, so aren&#39;t<br>
suitable for the LTS release.<br>
<br>
I can take a patch to upgrade to v2.4.11 since it is a bugfix only<br>
release.=C2=A0 I can also take patches to add the fixes for the referenced<=
br>
CVEs<br>
<br>
Thanks!<br>
<br>
Steve<br>
<br>
On Mon, Sep 15, 2025 at 7:09=E2=80=AFAM Vijay Anusuri via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">lists.openembedded.org</a> &lt;vanusuri=3D<a href=3D"mailto:=
mvista.com@lists.openembedded.org" target=3D"_blank" rel=3D"noreferrer">mvi=
sta.com@lists.openembedded.org</a>&gt;<br>
wrote:<br>
&gt;<br>
&gt; From: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" target=
=3D"_blank" rel=3D"noreferrer">vanusuri@mvista.com</a>&gt;<br>
&gt;<br>
&gt; Refreshed patches for 2.4.14<br>
&gt; Removed CVE-2024-47175 patches, which is already fixed by upgrade<br>
&gt;<br>
&gt; Includes CVE fixes for CVE-2025-58060 and CVE-2025-58364<br>
&gt;<br>
&gt; Ref: <a href=3D"https://github.com/openprinting/cups/releases" rel=3D"=
noreferrer noreferrer" target=3D"_blank">https://github.com/openprinting/cu=
ps/releases</a><br>
&gt;<br>
&gt; Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com=
" target=3D"_blank" rel=3D"noreferrer">vanusuri@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-extended/cups/cups.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A07 +-<br>
&gt;=C2=A0 .../cups/0001-use-echo-only-in-init.patch=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 ...-don-t-try-to-run-generated-binaries.patch |=C2=A0 =C2=A02 +-=
<br>
&gt;=C2=A0 ...-fix-multilib-install-file-conflicts.patch |=C2=A0 =C2=A06 +-=
<br>
&gt;=C2=A0 .../cups/cups/CVE-2024-47175-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 73 -----<br>
&gt;=C2=A0 .../cups/cups/CVE-2024-47175-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 151 -----------<br>
&gt;=C2=A0 .../cups/cups/CVE-2024-47175-3.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 119 ---------<br>
&gt;=C2=A0 .../cups/cups/CVE-2024-47175-4.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 249 ------------------<br>
&gt;=C2=A0 .../cups/cups/CVE-2024-47175-5.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 40 ---<br>
&gt;=C2=A0 .../cups/cups/libexecdir.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A05 +-<br>
&gt;=C2=A0 .../cups/{<a href=3D"http://cups_2.4.10.bb" rel=3D"noreferrer no=
referrer" target=3D"_blank">cups_2.4.10.bb</a> =3D&gt; <a href=3D"http://cu=
ps_2.4.14.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">cups_2.4.14.b=
b</a>}=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 11 files changed, 9 insertions(+), 647 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-extended/cups/cups/CVE-2024-4717=
5-1.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-extended/cups/cups/CVE-2024-4717=
5-2.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-extended/cups/cups/CVE-2024-4717=
5-3.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-extended/cups/cups/CVE-2024-4717=
5-4.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-extended/cups/cups/CVE-2024-4717=
5-5.patch<br>
&gt;=C2=A0 rename meta/recipes-extended/cups/{<a href=3D"http://cups_2.4.10=
.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">cups_2.4.10.bb</a> =3D=
&gt; <a href=3D"http://cups_2.4.14.bb" rel=3D"noreferrer noreferrer" target=
=3D"_blank">cups_2.4.14.bb</a>} (51%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extend=
ed/cups/cups.inc<br>
&gt; index 5590eb0fa0..50db18d42a 100644<br>
&gt; --- a/meta/recipes-extended/cups/cups.inc<br>
&gt; +++ b/meta/recipes-extended/cups/cups.inc<br>
&gt; @@ -15,11 +15,6 @@ SRC_URI =3D &quot;${GITHUB_BASE_URI}/download/v${PV=
}/cups-${PV}-source.tar.gz \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-cups-fix-mu=
ltilib-install-file-conflicts.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://volatiles.99_cup=
s \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://cups-volatiles.c=
onf \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2024-47175-1.patc=
h \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2024-47175-2.patc=
h \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2024-47175-3.patc=
h \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2024-47175-4.patc=
h \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2024-47175-5.patc=
h \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt;=C2=A0 GITHUB_BASE_URI =3D &quot;<a href=3D"https://github.com/OpenPrin=
ting/cups/releases" rel=3D"noreferrer noreferrer" target=3D"_blank">https:/=
/github.com/OpenPrinting/cups/releases</a>&quot;<br>
&gt; @@ -101,7 +96,7 @@ do_install () {<br>
&gt;=C2=A0 PACKAGES =3D+ &quot;${PN}-lib ${PN}-libimage ${PN}-webif&quot;<b=
r>
&gt;<br>
&gt;=C2=A0 RDEPENDS:${PN} +=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATU=
RES&#39;, &#39;sysvinit&#39;, &#39;procps&#39;, &#39;&#39;, d)}&quot;<br>
&gt; -FILES:${PN} +=3D &quot;${libexecdir}/cups/&quot;<br>
&gt; +FILES:${PN} +=3D &quot;${libexecdir}/cups/ ${systemd_system_unitdir}/=
system-cups.slice&quot;<br>
&gt;<br>
&gt;=C2=A0 FILES:${PN}-lib =3D &quot;${libdir}/libcups.so.*&quot;<br>
&gt;<br>
&gt; diff --git a/meta/recipes-extended/cups/cups/0001-use-echo-only-in-ini=
t.patch b/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch<=
br>
&gt; index e6bd400779..c0cb7df581 100644<br>
&gt; --- a/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch=
<br>
&gt; +++ b/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch=
<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From ddfe6ed6a89226985e8c9f0751c026aabc0927a0 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From c5f943b1ac6e1c86ae64686e29e178fedf933e96 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Saul Wold &lt;<a href=3D"mailto:sgw@linux.intel.com" targe=
t=3D"_blank" rel=3D"noreferrer">sgw@linux.intel.com</a>&gt;<br>
&gt;=C2=A0 Date: Thu, 13 Dec 2012 19:03:52 -0800<br>
&gt;=C2=A0 Subject: [PATCH] use echo only in init<br>
&gt; diff --git a/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-gen=
erated-binaries.patch b/meta/recipes-extended/cups/cups/0002-don-t-try-to-r=
un-generated-binaries.patch<br>
&gt; index 75270cb0cb..cf2f1a6747 100644<br>
&gt; --- a/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-=
binaries.patch<br>
&gt; +++ b/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-=
binaries.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From ff6c7168c3f26094b3a18298208a28831d1c1fd5 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From da9a313ae5a2d1da683dd58572df0d7a660eb922 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Koen Kooi &lt;<a href=3D"mailto:koen@dominion.thruhere.net=
" target=3D"_blank" rel=3D"noreferrer">koen@dominion.thruhere.net</a>&gt;<b=
r>
&gt;=C2=A0 Date: Sun, 30 Jan 2011 16:37:27 +0100<br>
&gt;=C2=A0 Subject: [PATCH] don&#39;t try to run generated binaries<br>
&gt; diff --git a/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-in=
stall-file-conflicts.patch b/meta/recipes-extended/cups/cups/0004-cups-fix-=
multilib-install-file-conflicts.patch<br>
&gt; index d49fb8f2c2..31338822e6 100644<br>
&gt; --- a/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-f=
ile-conflicts.patch<br>
&gt; +++ b/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-f=
ile-conflicts.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 6e286b582571ffca3f7874076d70eec6fd5713f6 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 880bad2c6b08afd2e2e303bc3ceea559edbe76d2 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" tar=
get=3D"_blank" rel=3D"noreferrer">kai.kang@windriver.com</a>&gt;<br>
&gt;=C2=A0 Date: Wed, 3 Oct 2018 00:27:11 +0800<br>
&gt;=C2=A0 Subject: [PATCH] cups: fix multilib install file conflicts<br>
&gt; @@ -15,10 +15,10 @@ Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.=
kang@windriver.com" target=3D"_blank" rel=3D"noreferrer">kai.kang@windriver=
.com</a>&gt;<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/conf/<a href=3D"http://cups-files.conf.in" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">cups-files.conf.in</a> b/conf/<a hr=
ef=3D"http://cups-files.conf.in" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">cups-files.conf.in</a><br>
&gt; -index 93584a1..65b7052 100644<br>
&gt; +index f96f745..27d8be9 100644<br>
&gt;=C2=A0 --- a/conf/<a href=3D"http://cups-files.conf.in" rel=3D"noreferr=
er noreferrer" target=3D"_blank">cups-files.conf.in</a><br>
&gt;=C2=A0 +++ b/conf/<a href=3D"http://cups-files.conf.in" rel=3D"noreferr=
er noreferrer" target=3D"_blank">cups-files.conf.in</a><br>
&gt; -@@ -67,7 +67,7 @@ PageLog @CUPS_LOGDIR@/page_log<br>
&gt; +@@ -70,7 +70,7 @@ PageLog @CUPS_LOGDIR@/page_log<br>
&gt;=C2=A0 =C2=A0#RequestRoot @CUPS_REQUESTS@<br>
&gt;<br>
&gt;=C2=A0 =C2=A0# Location of helper programs...<br>
&gt; diff --git a/meta/recipes-extended/cups/cups/CVE-2024-47175-1.patch b/=
meta/recipes-extended/cups/cups/CVE-2024-47175-1.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 8ec720ea0d..0000000000<br>
&gt; --- a/meta/recipes-extended/cups/cups/CVE-2024-47175-1.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,73 +0,0 @@<br>
&gt; -From 9939a70b750edd9d05270060cc5cf62ca98cfbe5 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Michael R Sweet &lt;<a href=3D"mailto:msweet@msweet.org" target=
=3D"_blank" rel=3D"noreferrer">msweet@msweet.org</a>&gt;<br>
&gt; -Date: Mon, 9 Sep 2024 10:03:10 -0400<br>
&gt; -Subject: [PATCH] Mirror IPP Everywhere printer changes from master.<b=
r>
&gt; -<br>
&gt; -Upstream-Status: Backport [<a href=3D"https://github.com/OpenPrinting=
/cups/commit/9939a70b750edd9d05270060cc5cf62ca98cfbe5" rel=3D"noreferrer no=
referrer" target=3D"_blank">https://github.com/OpenPrinting/cups/commit/993=
9a70b750edd9d05270060cc5cf62ca98cfbe5</a>]<br>
&gt; -CVE: CVE-2024-47175<br>
&gt; -Signed-off-by: Hitendra Prajapati &lt;<a href=3D"mailto:hprajapati@mv=
ista.com" target=3D"_blank" rel=3D"noreferrer">hprajapati@mvista.com</a>&gt=
;<br>
&gt; ----<br>
&gt; - cups/ppd-cache.c | 10 +++++-----<br>
&gt; - scheduler/ipp.c=C2=A0 |=C2=A0 7 +++++++<br>
&gt; - 2 files changed, 12 insertions(+), 5 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/cups/ppd-cache.c b/cups/ppd-cache.c<br>
&gt; -index e750fcc..cd2d6cb 100644<br>
&gt; ---- a/cups/ppd-cache.c<br>
&gt; -+++ b/cups/ppd-cache.c<br>
&gt; -@@ -3317,10 +3317,10 @@ _ppdCreateFromIPP2(<br>
&gt; -=C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0cupsFilePuts(fp, &quot;\&quot;\n&quot;);<br>
&gt; -<br>
&gt; --=C2=A0 if ((attr =3D ippFindAttribute(supported, &quot;printer-more-=
info&quot;, IPP_TAG_URI)) !=3D NULL)<br>
&gt; -+=C2=A0 if ((attr =3D ippFindAttribute(supported, &quot;printer-more-=
info&quot;, IPP_TAG_URI)) !=3D NULL &amp;&amp; ippValidateAttribute(attr))<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0cupsFilePrintf(fp, &quot;*APSupplies: \&quot;%s\&=
quot;\n&quot;, ippGetString(attr, 0, NULL));<br>
&gt; -<br>
&gt; --=C2=A0 if ((attr =3D ippFindAttribute(supported, &quot;printer-charg=
e-info-uri&quot;, IPP_TAG_URI)) !=3D NULL)<br>
&gt; -+=C2=A0 if ((attr =3D ippFindAttribute(supported, &quot;printer-charg=
e-info-uri&quot;, IPP_TAG_URI)) !=3D NULL &amp;&amp; ippValidateAttribute(a=
ttr))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0cupsFilePrintf(fp, &quot;*cupsChargeInfoURI: \&qu=
ot;%s\&quot;\n&quot;, ippGetString(attr, 0, NULL));<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0if ((attr =3D ippFindAttribute(supported, &quot;printer-=
strings-uri&quot;, IPP_TAG_URI)) !=3D NULL)<br>
&gt; -@@ -3389,10 +3389,10 @@ _ppdCreateFromIPP2(<br>
&gt; -=C2=A0 =C2=A0if (ippGetBoolean(ippFindAttribute(supported, &quot;job-=
accounting-user-id-supported&quot;, IPP_TAG_BOOLEAN), 0))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0cupsFilePuts(fp, &quot;*cupsJobAccountingUserId: =
True\n&quot;);<br>
&gt; -<br>
&gt; --=C2=A0 if ((attr =3D ippFindAttribute(supported, &quot;printer-priva=
cy-policy-uri&quot;, IPP_TAG_URI)) !=3D NULL)<br>
&gt; -+=C2=A0 if ((attr =3D ippFindAttribute(supported, &quot;printer-priva=
cy-policy-uri&quot;, IPP_TAG_URI)) !=3D NULL &amp;&amp; ippValidateAttribut=
e(attr))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0cupsFilePrintf(fp, &quot;*cupsPrivacyURI: \&quot;=
%s\&quot;\n&quot;, ippGetString(attr, 0, NULL));<br>
&gt; -<br>
&gt; --=C2=A0 if ((attr =3D ippFindAttribute(supported, &quot;printer-manda=
tory-job-attributes&quot;, IPP_TAG_KEYWORD)) !=3D NULL)<br>
&gt; -+=C2=A0 if ((attr =3D ippFindAttribute(supported, &quot;printer-manda=
tory-job-attributes&quot;, IPP_TAG_KEYWORD)) !=3D NULL &amp;&amp; ippValida=
teAttribute(attr))<br>
&gt; -=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0char=C2=A0 =C2=A0 =C2=A0 prefix =3D &#39;\&quot;&=
#39;;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Prefix for string<br>
&gt; -<br>
&gt; -@@ -3410,7 +3410,7 @@ _ppdCreateFromIPP2(<br>
&gt; -=C2=A0 =C2=A0 =C2=A0cupsFilePuts(fp, &quot;\&quot;\n&quot;);<br>
&gt; -=C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; --=C2=A0 if ((attr =3D ippFindAttribute(supported, &quot;printer-reque=
sted-job-attributes&quot;, IPP_TAG_KEYWORD)) !=3D NULL)<br>
&gt; -+=C2=A0 if ((attr =3D ippFindAttribute(supported, &quot;printer-reque=
sted-job-attributes&quot;, IPP_TAG_KEYWORD)) !=3D NULL &amp;&amp; ippValida=
teAttribute(attr))<br>
&gt; -=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0char=C2=A0 =C2=A0 =C2=A0 prefix =3D &#39;\&quot;&=
#39;;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Prefix for string<br>
&gt; -<br>
&gt; -diff --git a/scheduler/ipp.c b/scheduler/ipp.c<br>
&gt; -index 37623c5..836e41d 100644<br>
&gt; ---- a/scheduler/ipp.c<br>
&gt; -+++ b/scheduler/ipp.c<br>
&gt; -@@ -5417,6 +5417,13 @@ create_local_bg_thread(<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; -+=C2=A0 // Validate response from printer...<br>
&gt; -+=C2=A0 if (!ippValidateAttributes(response))<br>
&gt; -+=C2=A0 {<br>
&gt; -+=C2=A0 =C2=A0 cupsdLogMessage(CUPSD_LOG_ERROR, &quot;%s: Printer ret=
urned invalid data: %s&quot;, printer-&gt;name, cupsLastErrorString());<br>
&gt; -+=C2=A0 =C2=A0 return (NULL);<br>
&gt; -+=C2=A0 }<br>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0// TODO: Grab printer icon file...<br>
&gt; -=C2=A0 =C2=A0httpClose(http);<br>
&gt; -<br>
&gt; ---<br>
&gt; -2.25.1<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-extended/cups/cups/CVE-2024-47175-2.patch b/=
meta/recipes-extended/cups/cups/CVE-2024-47175-2.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 11e8209626..0000000000<br>
&gt; --- a/meta/recipes-extended/cups/cups/CVE-2024-47175-2.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,151 +0,0 @@<br>
&gt; -From 04bb2af4521b56c1699a2c2431c56c05a7102e69 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Michael R Sweet &lt;<a href=3D"mailto:msweet@msweet.org" target=
=3D"_blank" rel=3D"noreferrer">msweet@msweet.org</a>&gt;<br>
&gt; -Date: Mon, 9 Sep 2024 14:05:42 -0400<br>
&gt; -Subject: [PATCH] Refactor make-and-model code.<br>
&gt; -<br>
&gt; -Upstream-Status: Backport [<a href=3D"https://github.com/OpenPrinting=
/cups/commit/04bb2af4521b56c1699a2c2431c56c05a7102e69" rel=3D"noreferrer no=
referrer" target=3D"_blank">https://github.com/OpenPrinting/cups/commit/04b=
b2af4521b56c1699a2c2431c56c05a7102e69</a>]<br>
&gt; -CVE: CVE-2024-47175<br>
&gt; -Signed-off-by: Hitendra Prajapati &lt;<a href=3D"mailto:hprajapati@mv=
ista.com" target=3D"_blank" rel=3D"noreferrer">hprajapati@mvista.com</a>&gt=
;<br>
&gt; ----<br>
&gt; - cups/ppd-cache.c | 103 +++++++++++++++++++++++++++++++++++++++------=
--<br>
&gt; - 1 file changed, 87 insertions(+), 16 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/cups/ppd-cache.c b/cups/ppd-cache.c<br>
&gt; -index cd2d6cb..a4d7403 100644<br>
&gt; ---- a/cups/ppd-cache.c<br>
&gt; -+++ b/cups/ppd-cache.c<br>
&gt; -@@ -3197,9 +3197,10 @@ _ppdCreateFromIPP2(<br>
&gt; -=C2=A0 =C2=A0ipp_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*media_col,=C2=A0 =C2=A0 =C2=A0/* Media c=
ollection */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0*media_size;=C2=A0 =C2=A0 /* Media size collection */<br>
&gt; -=C2=A0 =C2=A0char=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 make[256],=C2=A0 =C2=A0 =C2=A0 /* Make and =
model */<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 *model,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Model name */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 *mptr,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Pointer into make an=
d model */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0ppdname[PPD_MAX_NAME];<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* PP=
D keyword */<br>
&gt; -+=C2=A0 const char=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *model;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Model name */<br>
&gt; -=C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0i, j,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Looping vars */<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0count,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Number of values =
*/<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0bottom,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Largest bottom ma=
rgin */<br>
&gt; -@@ -3260,34 +3261,104 @@ _ppdCreateFromIPP2(<br>
&gt; -=C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; -=C2=A0 /*<br>
&gt; --=C2=A0 * Standard stuff for PPD file...<br>
&gt; -+=C2=A0 * Get a sanitized make and model...<br>
&gt; -=C2=A0 =C2=A0*/<br>
&gt; -<br>
&gt; --=C2=A0 cupsFilePuts(fp, &quot;*PPD-Adobe: \&quot;4.3\&quot;\n&quot;)=
;<br>
&gt; --=C2=A0 cupsFilePuts(fp, &quot;*FormatVersion: \&quot;4.3\&quot;\n&qu=
ot;);<br>
&gt; --=C2=A0 cupsFilePrintf(fp, &quot;*FileVersion: \&quot;%d.%d\&quot;\n&=
quot;, CUPS_VERSION_MAJOR, CUPS_VERSION_MINOR);<br>
&gt; --=C2=A0 cupsFilePuts(fp, &quot;*LanguageVersion: English\n&quot;);<br=
>
&gt; --=C2=A0 cupsFilePuts(fp, &quot;*LanguageEncoding: ISOLatin1\n&quot;);=
<br>
&gt; --=C2=A0 cupsFilePuts(fp, &quot;*PSVersion: \&quot;(3010.000) 0\&quot;=
\n&quot;);<br>
&gt; --=C2=A0 cupsFilePuts(fp, &quot;*LanguageLevel: \&quot;3\&quot;\n&quot=
;);<br>
&gt; --=C2=A0 cupsFilePuts(fp, &quot;*FileSystem: False\n&quot;);<br>
&gt; --=C2=A0 cupsFilePuts(fp, &quot;*PCFileName: \&quot;ippeve.ppd\&quot;\=
n&quot;);<br>
&gt; -+=C2=A0 if ((attr =3D ippFindAttribute(supported, &quot;printer-make-=
and-model&quot;, IPP_TAG_TEXT)) !=3D NULL &amp;&amp; ippValidateAttribute(a=
ttr))<br>
&gt; -+=C2=A0 {<br>
&gt; -+=C2=A0 =C2=A0/*<br>
&gt; -+=C2=A0 =C2=A0 * Sanitize the model name to only contain PPD-safe cha=
racters.<br>
&gt; -+=C2=A0 =C2=A0 */<br>
&gt; -<br>
&gt; --=C2=A0 if ((attr =3D ippFindAttribute(supported, &quot;printer-make-=
and-model&quot;, IPP_TAG_TEXT)) !=3D NULL)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0strlcpy(make, ippGetString(attr, 0, NULL), sizeof=
(make));<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 for (mptr =3D make; *mptr; mptr ++)<br>
&gt; -+=C2=A0 =C2=A0 {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 if (*mptr &lt; &#39; &#39; || *mptr &gt;=3D 127=
 || *mptr =3D=3D &#39;\&quot;&#39;)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 * Truncate the make and model on the first bad =
character...<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 *mptr =3D &#39;\0&#39;;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -+=C2=A0 =C2=A0 }<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 while (mptr &gt; make)<br>
&gt; -+=C2=A0 =C2=A0 {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 * Strip trailing whitespace...<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 mptr --;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 if (*mptr =3D=3D &#39; &#39;)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 *mptr =3D &#39;\0&#39;;<br>
&gt; -+=C2=A0 =C2=A0 }<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 if (!make[0])<br>
&gt; -+=C2=A0 =C2=A0 {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 * Use a default make and model if nothing remai=
ns...<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 strlcpy(make, &quot;Unknown&quot;, sizeof(make)=
);<br>
&gt; -+=C2=A0 =C2=A0 }<br>
&gt; -+=C2=A0 }<br>
&gt; -=C2=A0 =C2=A0else<br>
&gt; --=C2=A0 =C2=A0 strlcpy(make, &quot;Unknown Printer&quot;, sizeof(make=
));<br>
&gt; -+=C2=A0 {<br>
&gt; -+=C2=A0 =C2=A0/*<br>
&gt; -+=C2=A0 =C2=A0 * Use a default make and model...<br>
&gt; -+=C2=A0 =C2=A0 */<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 strlcpy(make, &quot;Unknown&quot;, sizeof(make));<br>
&gt; -+=C2=A0 }<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0if (!_cups_strncasecmp(make, &quot;Hewlett Packard &quot=
;, 16) || !_cups_strncasecmp(make, &quot;Hewlett-Packard &quot;, 16))<br>
&gt; -=C2=A0 =C2=A0{<br>
&gt; -+=C2=A0 =C2=A0/*<br>
&gt; -+=C2=A0 =C2=A0 * Normalize HP printer make and model...<br>
&gt; -+=C2=A0 =C2=A0 */<br>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0 =C2=A0model =3D make + 16;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0strlcpy(make, &quot;HP&quot;, sizeof(make));<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 if (!_cups_strncasecmp(model, &quot;HP &quot;, 3))<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 model +=3D 3;<br>
&gt; -+=C2=A0 }<br>
&gt; -+=C2=A0 else if ((mptr =3D strchr(make, &#39; &#39;)) !=3D NULL)<br>
&gt; -+=C2=A0 {<br>
&gt; -+=C2=A0 =C2=A0/*<br>
&gt; -+=C2=A0 =C2=A0 * Separate &quot;MAKE MODEL&quot;...<br>
&gt; -+=C2=A0 =C2=A0 */<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 while (*mptr &amp;&amp; *mptr =3D=3D &#39; &#39;)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 *mptr++ =3D &#39;\0&#39;;<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 model =3D mptr;<br>
&gt; -=C2=A0 =C2=A0}<br>
&gt; --=C2=A0 else if ((model =3D strchr(make, &#39; &#39;)) !=3D NULL)<br>
&gt; --=C2=A0 =C2=A0 *model++ =3D &#39;\0&#39;;<br>
&gt; -=C2=A0 =C2=A0else<br>
&gt; --=C2=A0 =C2=A0 model =3D make;<br>
&gt; -+=C2=A0 {<br>
&gt; -+=C2=A0 =C2=A0/*<br>
&gt; -+=C2=A0 =C2=A0 * No separate model name...<br>
&gt; -+=C2=A0 =C2=A0 */<br>
&gt; -<br>
&gt; -+=C2=A0 =C2=A0 model =3D &quot;Printer&quot;;<br>
&gt; -+=C2=A0 }<br>
&gt; -+<br>
&gt; -+ /*<br>
&gt; -+=C2=A0 * Standard stuff for PPD file...<br>
&gt; -+=C2=A0 */<br>
&gt; -+<br>
&gt; -+=C2=A0 cupsFilePuts(fp, &quot;*PPD-Adobe: \&quot;4.3\&quot;\n&quot;)=
;<br>
&gt; -+=C2=A0 cupsFilePuts(fp, &quot;*FormatVersion: \&quot;4.3\&quot;\n&qu=
ot;);<br>
&gt; -+=C2=A0 cupsFilePrintf(fp, &quot;*FileVersion: \&quot;%d.%d\&quot;\n&=
quot;, CUPS_VERSION_MAJOR, CUPS_VERSION_MINOR);<br>
&gt; -+=C2=A0 cupsFilePuts(fp, &quot;*LanguageVersion: English\n&quot;);<br=
>
&gt; -+=C2=A0 cupsFilePuts(fp, &quot;*LanguageEncoding: ISOLatin1\n&quot;);=
<br>
&gt; -+=C2=A0 cupsFilePuts(fp, &quot;*PSVersion: \&quot;(3010.000) 0\&quot;=
\n&quot;);<br>
&gt; -+=C2=A0 cupsFilePuts(fp, &quot;*LanguageLevel: \&quot;3\&quot;\n&quot=
;);<br>
&gt; -+=C2=A0 cupsFilePuts(fp, &quot;*FileSystem: False\n&quot;);<br>
&gt; -+=C2=A0 cupsFilePuts(fp, &quot;*PCFileName: \&quot;ippeve.ppd\&quot;\=
n&quot;);<br>
&gt; -=C2=A0 =C2=A0cupsFilePrintf(fp, &quot;*Manufacturer: \&quot;%s\&quot;=
\n&quot;, make);<br>
&gt; -=C2=A0 =C2=A0cupsFilePrintf(fp, &quot;*ModelName: \&quot;%s\&quot;\n&=
quot;, model);<br>
&gt; -=C2=A0 =C2=A0cupsFilePrintf(fp, &quot;*Product: \&quot;(%s)\&quot;\n&=
quot;, model);<br>
&gt; ---<br>
&gt; -2.25.1<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-extended/cups/cups/CVE-2024-47175-3.patch b/=
meta/recipes-extended/cups/cups/CVE-2024-47175-3.patch<br>
&gt; deleted file mode 100644<br>
&gt; index e7d012fb8a..0000000000<br>
&gt; --- a/meta/recipes-extended/cups/cups/CVE-2024-47175-3.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,119 +0,0 @@<br>
&gt; -From e0630cd18f76340d302000f2bf6516e99602b844 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Michael R Sweet &lt;<a href=3D"mailto:msweet@msweet.org" target=
=3D"_blank" rel=3D"noreferrer">msweet@msweet.org</a>&gt;<br>
&gt; -Date: Mon, 9 Sep 2024 15:59:57 -0400<br>
&gt; -Subject: [PATCH] PPDize preset and template names.<br>
&gt; -<br>
&gt; -Upstream-Status: Backport [<a href=3D"https://github.com/OpenPrinting=
/cups/commit/e0630cd18f76340d302000f2bf6516e99602b844" rel=3D"noreferrer no=
referrer" target=3D"_blank">https://github.com/OpenPrinting/cups/commit/e06=
30cd18f76340d302000f2bf6516e99602b844</a>]<br>
&gt; -CVE: CVE-2024-47175<br>
&gt; -Signed-off-by: Hitendra Prajapati &lt;<a href=3D"mailto:hprajapati@mv=
ista.com" target=3D"_blank" rel=3D"noreferrer">hprajapati@mvista.com</a>&gt=
;<br>
&gt; ----<br>
&gt; - cups/ppd-cache.c | 33 ++++++++++++++++++++++++---------<br>
&gt; - 1 file changed, 24 insertions(+), 9 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/cups/ppd-cache.c b/cups/ppd-cache.c<br>
&gt; -index a4d7403..53c22be 100644<br>
&gt; ---- a/cups/ppd-cache.c<br>
&gt; -+++ b/cups/ppd-cache.c<br>
&gt; -@@ -4976,12 +4976,14 @@ _ppdCreateFromIPP2(<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0cupsArrayAdd(templates, (void *)keyword);<=
br>
&gt; -<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 pwg_ppdize_name(keyword, ppdname, sizeof(ppdnam=
e));<br>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(msgid, sizeof(msgid), &quot;finis=
hing-template.%s&quot;, keyword);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((msgstr =3D _cupsLangString(lang, msgi=
d)) =3D=3D msgid || !strcmp(msgid, msgstr))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((msgstr =3D _cupsMessageLookup(strings=
, msgid)) =3D=3D msgid)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msgstr =3D keyword;<br>
&gt; -<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 cupsFilePrintf(fp, &quot;*cupsFinishingTemplate=
 %s: \&quot;\n&quot;, keyword);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 cupsFilePrintf(fp, &quot;*cupsFinishingTemplate=
 %s: \&quot;\n&quot;, ppdname);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0for (finishing_attr =3D ippFirstAttribute(=
finishing_col); finishing_attr; finishing_attr =3D ippNextAttribute(finishi=
ng_col))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ippGetValueTag(finishing_attr) =
=3D=3D IPP_TAG_BEGIN_COLLECTION)<br>
&gt; -@@ -4994,7 +4996,7 @@ _ppdCreateFromIPP2(<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0cupsFilePuts(fp, &quot;\&quot;\n&quot;);<b=
r>
&gt; --=C2=A0 =C2=A0 =C2=A0 cupsFilePrintf(fp, &quot;*%s.cupsFinishingTempl=
ate %s/%s: \&quot;\&quot;\n&quot;, lang-&gt;language, keyword, msgstr);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 cupsFilePrintf(fp, &quot;*%s.cupsFinishingTempl=
ate %s/%s: \&quot;\&quot;\n&quot;, lang-&gt;language, ppdname, msgstr);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0cupsFilePuts(fp, &quot;*End\n&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; -@@ -5040,7 +5042,8 @@ _ppdCreateFromIPP2(<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!preset || !preset_name)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
&gt; -<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 cupsFilePrintf(fp, &quot;*APPrinterPreset %s: \=
&quot;\n&quot;, preset_name);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 pwg_ppdize_name(preset_name, ppdname, sizeof(pp=
dname));<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 cupsFilePrintf(fp, &quot;*APPrinterPreset %s: \=
&quot;\n&quot;, ppdname);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0for (member =3D ippFirstAttribute(preset);=
 member; member =3D ippNextAttribute(preset))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0member_name =3D ippGetName(member);=
<br>
&gt; -@@ -5081,7 +5084,10 @@ _ppdCreateFromIPP2(<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fin_col =3D ippGetCol=
lection(member, i);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((keyword =3D ippG=
etString(ippFindAttribute(fin_col, &quot;finishing-template&quot;, IPP_TAG_=
ZERO), 0, NULL)) !=3D NULL)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cupsFilePrintf(fp, =
&quot;*cupsFinishingTemplate %s\n&quot;, keyword);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pwg_ppdize_name(key=
word, ppdname, sizeof(ppdname));<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cupsFilePrintf(fp, =
&quot;*cupsFinishingTemplate %s\n&quot;, ppdname);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else if (!strcmp(member_name, &quot=
;media&quot;))<br>
&gt; -@@ -5108,13 +5114,13 @@ _ppdCreateFromIPP2(<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((keyword =3D ippGetStrin=
g(ippFindAttribute(media_col, &quot;media-source&quot;, IPP_TAG_ZERO), 0, N=
ULL)) !=3D NULL)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pwg_ppdize_name(keywo=
rd, ppdname, sizeof(ppdname));<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cupsFilePrintf(fp, &quot;*=
InputSlot %s\n&quot;, keyword);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cupsFilePrintf(fp, &quot;*=
InputSlot %s\n&quot;, ppdname);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((keyword =3D ippGetStrin=
g(ippFindAttribute(media_col, &quot;media-type&quot;, IPP_TAG_ZERO), 0, NUL=
L)) !=3D NULL)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pwg_ppdize_name(keywo=
rd, ppdname, sizeof(ppdname));<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cupsFilePrintf(fp, &quot;*=
MediaType %s\n&quot;, keyword);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cupsFilePrintf(fp, &quot;*=
MediaType %s\n&quot;, ppdname);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else if (!strcmp(member_name, &quot=
;print-quality&quot;))<br>
&gt; -@@ -5160,7 +5166,10 @@ _ppdCreateFromIPP2(<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0cupsFilePuts(fp, &quot;\&quot;\n*End\n&quo=
t;);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((localized_name =3D _cupsMessageLookup=
(strings, preset_name)) !=3D preset_name)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 cupsFilePrintf(fp, &quot;*%s.APPrinterPr=
eset %s/%s: \&quot;\&quot;\n&quot;, lang-&gt;language, preset_name, localiz=
ed_name);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pwg_ppdize_name(preset_name, ppdname, si=
zeof(ppdname));<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cupsFilePrintf(fp, &quot;*%s.APPrinterPr=
eset %s/%s: \&quot;\&quot;\n&quot;, lang-&gt;language, ppdname, localized_n=
ame);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; -@@ -5544,7 +5553,7 @@ pwg_ppdize_name(const char *ipp, /* I - IPP key=
word */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0*end;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* End of nam=
e buffer */<br>
&gt; -<br>
&gt; -<br>
&gt; --=C2=A0 if (!ipp)<br>
&gt; -+=C2=A0 if (!ipp || !_cups_isalnum(*ipp))<br>
&gt; -=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0*name =3D &#39;\0&#39;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0return;<br>
&gt; -@@ -5559,8 +5568,14 @@ pwg_ppdize_name(const char *ipp,=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /* I - IPP keyword */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ipp ++;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0*ptr++ =3D (char)toupper(*ipp++ &amp; 255)=
;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; --=C2=A0 =C2=A0 else<br>
&gt; -+=C2=A0 =C2=A0 else if (*ipp =3D=3D &#39;_&#39; || *ipp =3D=3D &#39;.=
&#39; || *ipp =3D=3D &#39;-&#39; || _cups_isalnum(*ipp))<br>
&gt; -+=C2=A0 =C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0*ptr++ =3D *ipp++;<br>
&gt; -+=C2=A0 =C2=A0 }<br>
&gt; -+=C2=A0 =C2=A0 else<br>
&gt; -+=C2=A0 =C2=A0 {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 ipp ++;<br>
&gt; -+=C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0*ptr =3D &#39;\0&#39;;<br>
&gt; ---<br>
&gt; -2.25.1<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-extended/cups/cups/CVE-2024-47175-4.patch b/=
meta/recipes-extended/cups/cups/CVE-2024-47175-4.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 7665513485..0000000000<br>
&gt; --- a/meta/recipes-extended/cups/cups/CVE-2024-47175-4.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,249 +0,0 @@<br>
&gt; -From 1e6ca5913eceee906038bc04cc7ccfbe2923bdfd Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Michael R Sweet &lt;<a href=3D"mailto:msweet@msweet.org" target=
=3D"_blank" rel=3D"noreferrer">msweet@msweet.org</a>&gt;<br>
&gt; -Date: Mon, 23 Sep 2024 09:36:39 -0400<br>
&gt; -Subject: [PATCH] Quote PPD localized strings.<br>
&gt; -<br>
&gt; -Upstream-Status: Backport [<a href=3D"https://github.com/OpenPrinting=
/cups/commit/1e6ca5913eceee906038bc04cc7ccfbe2923bdfd" rel=3D"noreferrer no=
referrer" target=3D"_blank">https://github.com/OpenPrinting/cups/commit/1e6=
ca5913eceee906038bc04cc7ccfbe2923bdfd</a>]<br>
&gt; -CVE: CVE-2024-47175<br>
&gt; -Signed-off-by: Hitendra Prajapati &lt;<a href=3D"mailto:hprajapati@mv=
ista.com" target=3D"_blank" rel=3D"noreferrer">hprajapati@mvista.com</a>&gt=
;<br>
&gt; ----<br>
&gt; - cups/ppd-cache.c | 93 +++++++++++++++++++++++++++-------------------=
--<br>
&gt; - 1 file changed, 53 insertions(+), 40 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/cups/ppd-cache.c b/cups/ppd-cache.c<br>
&gt; -index 53c22be..f425ac0 100644<br>
&gt; ---- a/cups/ppd-cache.c<br>
&gt; -+++ b/cups/ppd-cache.c<br>
&gt; -@@ -32,6 +32,7 @@<br>
&gt; - static int=C2=A0 =C2=A0 cups_connect(http_t **http, const char *url,=
 char *resource, size_t ressize);<br>
&gt; - static int=C2=A0 =C2=A0 cups_get_url(http_t **http, const char *url,=
 char *name, size_t namesize);<br>
&gt; - static const char *ppd_inputslot_for_keyword(_ppd_cache_t *pc, const=
 char *keyword);<br>
&gt; -+static void=C2=A0 =C2=A0ppd_put_string(cups_file_t *fp, cups_lang_t =
*lang, cups_array_t *strings, const char *ppd_option, const char *ppd_choic=
e, const char *pwg_msgid);<br>
&gt; - static void=C2=A0 =C2=A0pwg_add_finishing(cups_array_t *finishings, =
ipp_finishings_t template, const char *name, const char *value);<br>
&gt; - static void=C2=A0 =C2=A0pwg_add_message(cups_array_t *a, const char =
*msg, const char *str);<br>
&gt; - static int=C2=A0 =C2=A0 pwg_compare_finishings(_pwg_finishings_t *a,=
 _pwg_finishings_t *b);<br>
&gt; -@@ -3394,7 +3395,7 @@ _ppdCreateFromIPP2(<br>
&gt; -=C2=A0 =C2=A0if ((attr =3D ippFindAttribute(supported, &quot;printer-=
charge-info-uri&quot;, IPP_TAG_URI)) !=3D NULL &amp;&amp; ippValidateAttrib=
ute(attr))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0cupsFilePrintf(fp, &quot;*cupsChargeInfoURI: \&qu=
ot;%s\&quot;\n&quot;, ippGetString(attr, 0, NULL));<br>
&gt; -<br>
&gt; --=C2=A0 if ((attr =3D ippFindAttribute(supported, &quot;printer-strin=
gs-uri&quot;, IPP_TAG_URI)) !=3D NULL)<br>
&gt; -+=C2=A0 if ((attr =3D ippFindAttribute(supported, &quot;printer-strin=
gs-uri&quot;, IPP_TAG_URI)) !=3D NULL &amp;&amp; ippValidateAttribute(attr)=
)<br>
&gt; -=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0http_t=C2=A0 =C2=A0 *http =3D NULL;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Connection to printer */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0char=C2=A0 =C2=A0 =C2=A0 stringsfile[1024];=C2=A0=
 =C2=A0 =C2=A0 /* Temporary strings file */<br>
&gt; -@@ -3438,7 +3439,7 @@ _ppdCreateFromIPP2(<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0response =3D cupsDoRequest(http, re=
quest, resource);<br>
&gt; -<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((attr =3D ippFindAttribute(response,=
 &quot;printer-strings-uri&quot;, IPP_TAG_URI)) !=3D NULL)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((attr =3D ippFindAttribute(response,=
 &quot;printer-strings-uri&quot;, IPP_TAG_URI)) !=3D NULL &amp;&amp; ippVal=
idateAttribute(attr))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cupsFilePrintf(fp, &quot;*cu=
psStringsURI %s: \&quot;%s\&quot;\n&quot;, keyword, ippGetString(attr, 0, N=
ULL));<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ippDelete(response);<br>
&gt; -@@ -4044,18 +4045,16 @@ _ppdCreateFromIPP2(<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0cupsFilePrintf(fp, &quot;*DefaultInputSlot=
: %s\n&quot;, ppdname);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0for (j =3D 0; j &lt; (int)(sizeof(sources)=
 / sizeof(sources[0])); j ++)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!strcmp(sources[j], keyword))<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(msgid, sizeof(msgid), &quo=
t;media-source.%s&quot;, keyword);<br>
&gt; -<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((msgstr =3D _cupsLangString(lang, ms=
gid)) =3D=3D msgid || !strcmp(msgid, msgstr))<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((msgstr =3D _cupsMessageLooku=
p(strings, msgid)) =3D=3D msgid)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msgstr =3D keyword;<br>
&gt; --<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cupsFilePrintf(fp, &quot;*InputSlot=
 %s: \&quot;&lt;&lt;/MediaPosition %d&gt;&gt;setpagedevice\&quot;\n&quot;, =
ppdname, j);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 cupsFilePrintf(fp, &quot;*%s.InputSlot %=
s/%s: \&quot;\&quot;\n&quot;, lang-&gt;language, ppdname, msgstr);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ppd_put_string(fp, lang, strings, &quot;=
InputSlot&quot;, ppdname, msgid);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0cupsFilePuts(fp, &quot;*CloseUI: *InputSlot\n&quo=
t;);<br>
&gt; -=C2=A0 =C2=A0}<br>
&gt; -@@ -4081,12 +4080,9 @@ _ppdCreateFromIPP2(<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0pwg_ppdize_name(keyword, ppdname, sizeof(p=
pdname));<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(msgid, sizeof(msgid), &quot;media=
-type.%s&quot;, keyword);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 if ((msgstr =3D _cupsLangString(lang, msgid)) =
=3D=3D msgid || !strcmp(msgid, msgstr))<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 if ((msgstr =3D _cupsMessageLookup(strings, msg=
id)) =3D=3D msgid)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 msgstr =3D keyword;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0cupsFilePrintf(fp, &quot;*MediaType %s: \&=
quot;&lt;&lt;/MediaType(%s)&gt;&gt;setpagedevice\&quot;\n&quot;, ppdname, p=
pdname);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 cupsFilePrintf(fp, &quot;*%s.MediaType %s/%s: \=
&quot;\&quot;\n&quot;, lang-&gt;language, ppdname, msgstr);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 ppd_put_string(fp, lang, strings, &quot;MediaTy=
pe&quot;, ppdname, msgid);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0cupsFilePuts(fp, &quot;*CloseUI: *MediaType\n&quo=
t;);<br>
&gt; -=C2=A0 =C2=A0}<br>
&gt; -@@ -4547,12 +4543,9 @@ _ppdCreateFromIPP2(<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0pwg_ppdize_name(keyword, ppdname, sizeof(p=
pdname));<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(msgid, sizeof(msgid), &quot;outpu=
t-bin.%s&quot;, keyword);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 if ((msgstr =3D _cupsLangString(lang, msgid)) =
=3D=3D msgid || !strcmp(msgid, msgstr))<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 if ((msgstr =3D _cupsMessageLookup(strings, msg=
id)) =3D=3D msgid)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 msgstr =3D keyword;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0cupsFilePrintf(fp, &quot;*OutputBin %s: \&=
quot;\&quot;\n&quot;, ppdname);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 cupsFilePrintf(fp, &quot;*%s.OutputBin %s/%s: \=
&quot;\&quot;\n&quot;, lang-&gt;language, ppdname, msgstr);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 ppd_put_string(fp, lang, strings, &quot;OutputB=
in&quot;, ppdname, msgid);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((tray_ptr =3D ippGetOctetString(trays,=
 i, &amp;tray_len)) !=3D NULL)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; -@@ -4671,9 +4664,6 @@ _ppdCreateFromIPP2(<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cupsArrayAdd(names, (char *)keyword=
);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(msgid, sizeof(msgid), &quot;finis=
hings.%d&quot;, value);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 if ((msgstr =3D _cupsLangString(lang, msgid)) =
=3D=3D msgid || !strcmp(msgid, msgstr))<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((msgstr =3D _cupsMessageLookup(strin=
gs, msgid)) =3D=3D msgid)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msgstr =3D keyword;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (value &gt;=3D IPP_FINISHINGS_NO=
NE &amp;&amp; value &lt;=3D IPP_FINISHINGS_LAMINATE)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ppd_keyword =3D base_keyword=
s[value - IPP_FINISHINGS_NONE];<br>
&gt; -@@ -4688,7 +4678,7 @@ _ppdCreateFromIPP2(<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0cupsFilePrintf(fp, &quot;*StapleLocation %=
s: \&quot;\&quot;\n&quot;, ppd_keyword);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 cupsFilePrintf(fp, &quot;*%s.StapleLocation %s/=
%s: \&quot;\&quot;\n&quot;, lang-&gt;language, ppd_keyword, msgstr);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 ppd_put_string(fp, lang, strings, &quot;StapleL=
ocation&quot;, ppd_keyword, msgid);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0cupsFilePrintf(fp, &quot;*cupsIPPFinishing=
s %d/%s: \&quot;*StapleLocation %s\&quot;\n&quot;, value, keyword, ppd_keyw=
ord);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; -@@ -4751,9 +4741,6 @@ _ppdCreateFromIPP2(<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cupsArrayAdd(names, (char *)keyword=
);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(msgid, sizeof(msgid), &quot;finis=
hings.%d&quot;, value);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 if ((msgstr =3D _cupsLangString(lang, msgid)) =
=3D=3D msgid || !strcmp(msgid, msgstr))<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((msgstr =3D _cupsMessageLookup(strin=
gs, msgid)) =3D=3D msgid)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msgstr =3D keyword;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (value &gt;=3D IPP_FINISHINGS_NO=
NE &amp;&amp; value &lt;=3D IPP_FINISHINGS_LAMINATE)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ppd_keyword =3D base_keyword=
s[value - IPP_FINISHINGS_NONE];<br>
&gt; -@@ -4768,7 +4755,7 @@ _ppdCreateFromIPP2(<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0cupsFilePrintf(fp, &quot;*FoldType %s: \&q=
uot;\&quot;\n&quot;, ppd_keyword);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 cupsFilePrintf(fp, &quot;*%s.FoldType %s/%s: \&=
quot;\&quot;\n&quot;, lang-&gt;language, ppd_keyword, msgstr);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 ppd_put_string(fp, lang, strings, &quot;FoldTyp=
e&quot;, ppd_keyword, msgid);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0cupsFilePrintf(fp, &quot;*cupsIPPFinishing=
s %d/%s: \&quot;*FoldType %s\&quot;\n&quot;, value, keyword, ppd_keyword);<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; -@@ -4839,9 +4826,6 @@ _ppdCreateFromIPP2(<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cupsArrayAdd(names, (char *)keyword=
);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(msgid, sizeof(msgid), &quot;finis=
hings.%d&quot;, value);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 if ((msgstr =3D _cupsLangString(lang, msgid)) =
=3D=3D msgid || !strcmp(msgid, msgstr))<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((msgstr =3D _cupsMessageLookup(strin=
gs, msgid)) =3D=3D msgid)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msgstr =3D keyword;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (value &gt;=3D IPP_FINISHINGS_NO=
NE &amp;&amp; value &lt;=3D IPP_FINISHINGS_LAMINATE)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ppd_keyword =3D base_keyword=
s[value - IPP_FINISHINGS_NONE];<br>
&gt; -@@ -4856,7 +4840,7 @@ _ppdCreateFromIPP2(<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0cupsFilePrintf(fp, &quot;*PunchMedia %s: \=
&quot;\&quot;\n&quot;, ppd_keyword);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 cupsFilePrintf(fp, &quot;*%s.PunchMedia %s/%s: =
\&quot;\&quot;\n&quot;, lang-&gt;language, ppd_keyword, msgstr);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 ppd_put_string(fp, lang, strings, &quot;PunchMe=
dia&quot;, ppd_keyword, msgid);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0cupsFilePrintf(fp, &quot;*cupsIPPFinishing=
s %d/%s: \&quot;*PunchMedia %s\&quot;\n&quot;, value, keyword, ppd_keyword)=
;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; -@@ -4927,9 +4911,6 @@ _ppdCreateFromIPP2(<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cupsArrayAdd(names, (char *)keyword=
);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(msgid, sizeof(msgid), &quot;finis=
hings.%d&quot;, value);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 if ((msgstr =3D _cupsLangString(lang, msgid)) =
=3D=3D msgid || !strcmp(msgid, msgstr))<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((msgstr =3D _cupsMessageLookup(strin=
gs, msgid)) =3D=3D msgid)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msgstr =3D keyword;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (value =3D=3D IPP_FINISHINGS_TRI=
M)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ppd_keyword =3D &quot;Auto&q=
uot;;<br>
&gt; -@@ -4937,7 +4918,7 @@ _ppdCreateFromIPP2(<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ppd_keyword =3D trim_keywords[value=
 - IPP_FINISHINGS_TRIM_AFTER_PAGES];<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0cupsFilePrintf(fp, &quot;*CutMedia %s: \&q=
uot;\&quot;\n&quot;, ppd_keyword);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 cupsFilePrintf(fp, &quot;*%s.CutMedia %s/%s: \&=
quot;\&quot;\n&quot;, lang-&gt;language, ppd_keyword, msgstr);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 ppd_put_string(fp, lang, strings, &quot;CutMedi=
a&quot;, ppd_keyword, msgid);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0cupsFilePrintf(fp, &quot;*cupsIPPFinishing=
s %d/%s: \&quot;*CutMedia %s\&quot;\n&quot;, value, keyword, ppd_keyword);<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; -@@ -4979,9 +4960,6 @@ _ppdCreateFromIPP2(<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0pwg_ppdize_name(keyword, ppdname, sizeof(p=
pdname));<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(msgid, sizeof(msgid), &quot;finis=
hing-template.%s&quot;, keyword);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 if ((msgstr =3D _cupsLangString(lang, msgid)) =
=3D=3D msgid || !strcmp(msgid, msgstr))<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 if ((msgstr =3D _cupsMessageLookup(strings, msg=
id)) =3D=3D msgid)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 msgstr =3D keyword;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0cupsFilePrintf(fp, &quot;*cupsFinishingTem=
plate %s: \&quot;\n&quot;, ppdname);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0for (finishing_attr =3D ippFirstAttribute(=
finishing_col); finishing_attr; finishing_attr =3D ippNextAttribute(finishi=
ng_col))<br>
&gt; -@@ -4996,7 +4974,7 @@ _ppdCreateFromIPP2(<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0cupsFilePuts(fp, &quot;\&quot;\n&quot;);<b=
r>
&gt; --=C2=A0 =C2=A0 =C2=A0 cupsFilePrintf(fp, &quot;*%s.cupsFinishingTempl=
ate %s/%s: \&quot;\&quot;\n&quot;, lang-&gt;language, ppdname, msgstr);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 ppd_put_string(fp, lang, strings, &quot;cupsFin=
ishingTemplate&quot;, ppdname, msgid);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0cupsFilePuts(fp, &quot;*End\n&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; -@@ -5165,11 +5143,9 @@ _ppdCreateFromIPP2(<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0cupsFilePuts(fp, &quot;\&quot;\n*End\n&quo=
t;);<br>
&gt; -<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 if ((localized_name =3D _cupsMessageLookup(stri=
ngs, preset_name)) !=3D preset_name)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 pwg_ppdize_name(preset_name, ppdname, si=
zeof(ppdname));<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 cupsFilePrintf(fp, &quot;*%s.APPrinterPr=
eset %s/%s: \&quot;\&quot;\n&quot;, lang-&gt;language, ppdname, localized_n=
ame);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 snprintf(msgid, sizeof(msgid), &quot;preset-nam=
e.%s&quot;, preset_name);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 pwg_ppdize_name(preset_name, ppdname, sizeof(pp=
dname));<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 ppd_put_string(fp, lang, strings, &quot;APPrint=
erPreset&quot;, ppdname, msgid);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; -@@ -5440,6 +5416,43 @@ cups_get_url(http_t=C2=A0 =C2=A0 =C2=A0**http,=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* IO - Current HTTP connection */<br>
&gt; - }<br>
&gt; -<br>
&gt; -<br>
&gt; -+/*<br>
&gt; -+ * &#39;ppd_put_strings()&#39; - Write localization attributes to a =
PPD file.<br>
&gt; -+ */<br>
&gt; -+<br>
&gt; -+static void<br>
&gt; -+ppd_put_string(cups_file_t=C2=A0 *fp,=C2=A0 =C2=A0 =C2=A0 /* I - PPD=
 file */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cups_lang_t=
=C2=A0 *lang,=C2=A0 =C2=A0 /* I - Language */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cups_array_t =
*strings, /* I - Strings */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char=C2=A0 =C2=
=A0*ppd_option,/* I - PPD option */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char=C2=A0 =C2=
=A0*ppd_choice,/* I - PPD choice */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char=C2=A0 =C2=
=A0*pwg_msgid) /* I - PWG message ID */<br>
&gt; -+{<br>
&gt; -+=C2=A0 const char=C2=A0 *text;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 /* Localized text */<br>
&gt; -+<br>
&gt; -+<br>
&gt; -+=C2=A0 if ((text =3D _cupsLangString(lang, pwg_msgid)) =3D=3D pwg_ms=
gid || !strcmp(pwg_msgid, text))<br>
&gt; -+=C2=A0 {<br>
&gt; -+=C2=A0 =C2=A0 if ((text =3D _cupsMessageLookup(strings, pwg_msgid)) =
=3D=3D pwg_msgid)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; -+=C2=A0 }<br>
&gt; -+<br>
&gt; -+=C2=A0 // Add the first line of localized text...<br>
&gt; -+=C2=A0 cupsFilePrintf(fp, &quot;*%s.%s %s/&quot;, lang-&gt;language,=
 ppd_option, ppd_choice);<br>
&gt; -+=C2=A0 while (*text &amp;&amp; *text !=3D &#39;\n&#39;)<br>
&gt; -+=C2=A0 {<br>
&gt; -+=C2=A0 =C2=A0 // Escape &quot;:&quot; and &quot;&lt;&quot;...<br>
&gt; -+=C2=A0 =C2=A0 if (*text =3D=3D &#39;:&#39; || *text =3D=3D &#39;&lt;=
&#39;)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 cupsFilePrintf(fp, &quot;&lt;%02X&gt;&quot;, *t=
ext);<br>
&gt; -+=C2=A0 =C2=A0 else<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 cupsFilePutChar(fp, *text);<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 text ++;<br>
&gt; -+=C2=A0 }<br>
&gt; -+=C2=A0 cupsFilePuts(fp, &quot;: \&quot;\&quot;\n&quot;);<br>
&gt; -+}<br>
&gt; -+<br>
&gt; -+<br>
&gt; - /*<br>
&gt; -=C2=A0 * &#39;pwg_add_finishing()&#39; - Add a finishings value.<br>
&gt; -=C2=A0 */<br>
&gt; ---<br>
&gt; -2.25.1<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-extended/cups/cups/CVE-2024-47175-5.patch b/=
meta/recipes-extended/cups/cups/CVE-2024-47175-5.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 77a30857e2..0000000000<br>
&gt; --- a/meta/recipes-extended/cups/cups/CVE-2024-47175-5.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,40 +0,0 @@<br>
&gt; -From 2abe1ba8a66864aa82cd9836b37e57103b8e1a3b Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Michael R Sweet &lt;<a href=3D"mailto:msweet@msweet.org" target=
=3D"_blank" rel=3D"noreferrer">msweet@msweet.org</a>&gt;<br>
&gt; -Date: Mon, 23 Sep 2024 10:11:31 -0400<br>
&gt; -Subject: [PATCH] Fix warnings for unused vars.<br>
&gt; -<br>
&gt; -Upstream-Status: Backport [<a href=3D"https://github.com/OpenPrinting=
/cups/commit/2abe1ba8a66864aa82cd9836b37e57103b8e1a3b" rel=3D"noreferrer no=
referrer" target=3D"_blank">https://github.com/OpenPrinting/cups/commit/2ab=
e1ba8a66864aa82cd9836b37e57103b8e1a3b</a>]<br>
&gt; -CVE: CVE-2024-47175<br>
&gt; -Signed-off-by: Hitendra Prajapati &lt;<a href=3D"mailto:hprajapati@mv=
ista.com" target=3D"_blank" rel=3D"noreferrer">hprajapati@mvista.com</a>&gt=
;<br>
&gt; ----<br>
&gt; - cups/ppd-cache.c | 6 ++----<br>
&gt; - 1 file changed, 2 insertions(+), 4 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/cups/ppd-cache.c b/cups/ppd-cache.c<br>
&gt; -index f425ac0..d2533b7 100644<br>
&gt; ---- a/cups/ppd-cache.c<br>
&gt; -+++ b/cups/ppd-cache.c<br>
&gt; -@@ -3223,8 +3223,7 @@ _ppdCreateFromIPP2(<br>
&gt; -=C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0have_qdraft =3D 0,/* Have draft quality? */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0have_qhigh =3D 0; /* Have high quality? */<br>
&gt; -=C2=A0 =C2=A0char=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msgid[256];=C2=A0 =C2=A0 =C2=A0/* Message i=
dentifier (attr.value) */<br>
&gt; --=C2=A0 const char=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *keyword,=C2=A0 =
=C2=A0 =C2=A0 =C2=A0/* Keyword value */<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 *msgstr;=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Localized string */<br>
&gt; -+=C2=A0 const char=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *keyword;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0/* Keyword value */<br>
&gt; -=C2=A0 =C2=A0cups_array_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 *strings =3D NULL;/* Printer strings file */<br>
&gt; -=C2=A0 =C2=A0struct lconv=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 *loc =3D localeconv();<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Lo=
cale data */<br>
&gt; -@@ -5010,9 +5009,8 @@ _ppdCreateFromIPP2(<br>
&gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ipp_t=C2=A0 =C2=A0*preset =3D ippGetCollec=
tion(attr, i);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Pr=
eset collection */<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 const char *preset_name =3D ippGetString(ippFin=
dAttribute(preset, &quot;preset-name&quot;, IPP_TAG_ZERO), 0, NULL),<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 const char *preset_name =3D ippGetString(ippFin=
dAttribute(preset, &quot;preset-name&quot;, IPP_TAG_ZERO), 0, NULL);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Pr=
eset name */<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *localized_name;=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 /* Localized preset name */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ipp_attribute_t *member;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Member attribute in preset */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *member_name;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Member attribute name */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0char=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 member_value[256];=C2=A0 =C2=A0 =C2=A0 /* Member attribute value */<br>
&gt; ---<br>
&gt; -2.25.1<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-extended/cups/cups/libexecdir.patch b/meta/r=
ecipes-extended/cups/cups/libexecdir.patch<br>
&gt; index 7ccad94f0f..493c7970ea 100644<br>
&gt; --- a/meta/recipes-extended/cups/cups/libexecdir.patch<br>
&gt; +++ b/meta/recipes-extended/cups/cups/libexecdir.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 1724f7bcdbcfdb445778f8a2e530c5c094c18c10 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 4ae7ad87aa022f5128be222dffbf0c50ec6e846e Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" tar=
get=3D"_blank" rel=3D"noreferrer">ross.burton@arm.com</a>&gt;<br>
&gt;=C2=A0 Date: Tue, 13 Jul 2021 12:56:30 +0100<br>
&gt;=C2=A0 Subject: [PATCH] Use $libexecdir instead of hardcoding $prefix/l=
ib as this<br>
&gt; @@ -6,13 +6,12 @@ Subject: [PATCH] Use $libexecdir instead of hardcodi=
ng $prefix/lib as this<br>
&gt;<br>
&gt;=C2=A0 Upstream-Status: Pending<br>
&gt;=C2=A0 Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm=
.com" target=3D"_blank" rel=3D"noreferrer">ross.burton@arm.com</a>&gt;<br>
&gt; -<br>
&gt;=C2=A0 ---<br>
&gt;=C2=A0 =C2=A0config-scripts/cups-directories.m4 | 4 ++--<br>
&gt;=C2=A0 =C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/config-scripts/cups-directories.m4 b/config-scripts=
/cups-directories.m4<br>
&gt; -index 2033d47..230166e 100644<br>
&gt; +index 069ee7b..2f67e5b 100644<br>
&gt;=C2=A0 --- a/config-scripts/cups-directories.m4<br>
&gt;=C2=A0 +++ b/config-scripts/cups-directories.m4<br>
&gt;=C2=A0 @@ -239,7 +239,7 @@ AC_SUBST([CUPS_REQUESTS])<br>
&gt; diff --git a/meta/recipes-extended/cups/<a href=3D"http://cups_2.4.10.=
bb" rel=3D"noreferrer noreferrer" target=3D"_blank">cups_2.4.10.bb</a> b/me=
ta/recipes-extended/cups/<a href=3D"http://cups_2.4.14.bb" rel=3D"noreferre=
r noreferrer" target=3D"_blank">cups_2.4.14.bb</a><br>
&gt; similarity index 51%<br>
&gt; rename from meta/recipes-extended/cups/<a href=3D"http://cups_2.4.10.b=
b" rel=3D"noreferrer noreferrer" target=3D"_blank">cups_2.4.10.bb</a><br>
&gt; rename to meta/recipes-extended/cups/<a href=3D"http://cups_2.4.14.bb"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">cups_2.4.14.bb</a><br>
&gt; index e16ad47cf5..5d5a1dc97f 100644<br>
&gt; --- a/meta/recipes-extended/cups/<a href=3D"http://cups_2.4.10.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">cups_2.4.10.bb</a><br>
&gt; +++ b/meta/recipes-extended/cups/<a href=3D"http://cups_2.4.14.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">cups_2.4.14.bb</a><br>
&gt; @@ -2,4 +2,4 @@ require cups.inc<br>
&gt;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D3b83ef96387f1465=
5fc854ddc3c6bd57&quot;<br>
&gt;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;d75757c2bc0f7a28b02ee4d52ca9e4b1aa1ba2af=
fe16b985854f5336940e5ad7&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;660288020dd6f79caf799811c4c1a3207a486898=
99ac2093959d70a3bdcb7699&quot;<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#223490): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/223490" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-core/message/2234=
90</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11525437=
1/3620601" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.op=
enembedded.org/mt/115254371/3620601</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lis=
ts.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.o=
penembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:steve@sako=
man.com" target=3D"_blank" rel=3D"noreferrer">steve@sakoman.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--000000000000b4d9e6063ed9ee83--

