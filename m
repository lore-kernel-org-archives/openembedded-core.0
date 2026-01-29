Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D133D358EE
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 09:39:56 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11695.1769679592912696210
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 01:39:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=HBkSLAH/;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-432d28870ddso478159f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 01:39:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769679591; cv=none;
        d=google.com; s=arc-20240605;
        b=ZXQ4JCjB5S3dEymJF+9Pwp0dmbMsYkAnQ7CXJyHPBvtRwNUUDN72Ss20EwdULcTJJs
         pT2ptIj2U6r4DY4V5gROYn+uD2x+/mfILWnQFna8v4D1TYLgHscm4aJ/+38xlPjylVvV
         x3CTN38CoWoT4d9Cp71E5uVP2LDD8zTarazZrpikwuli5qLlWxzhe/tcu6gA7DXtdmmK
         rcf1nPyEQXQZkkiLtgRwvsjLn3LL9BB3mu5DPGrMWEQdCZZ55Jk0fQj42nNrrARwDu9d
         Bs/k7JFSS9BQ1Am9Un4inkfLwSUGkWzD0zQsSiJAtGFm7TNRWYCuxkZG3oVd4qviIvfO
         LQbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VfsSFzTDa0vVY4jnjuZaF8nN065QhQM8dWuu4mZSSuQ=;
        fh=dI4eGhhXRYQf7RsXLxEGaKg0Olh6BsHtf/nuVeEubBo=;
        b=F8sKGAu48ovhplOWEKY7o88zP8o3/5Tbz0TGZHgcTy+ddHWsHvV85Qe2AyxSPBLpQ6
         kl0VQnkQHQVKKQmsq9OykiYjECN+ug5VmarQHrlBi8tT+a8m0mokMqEdpIiOfd1+Z1DJ
         G4I0ORw2C/WyTaxJBtOfcRggbVBpoR35+puoFQsuy8k6zWH2eft9tANgtCrP6eT9zjuD
         j+8aqxdYIYdVB3jq5A4PA9J/ie6OC91BcG8p/WENGMtPdM0MCACh0wlwkzGNC9rHTAj6
         +UlTelX9Q89d3BMnPGDLqZwc5nPEXMYtIqpFfgmyq++b+lyCzbpzVtb08h5CrDPcIFMy
         bfMg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1769679591; x=1770284391; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VfsSFzTDa0vVY4jnjuZaF8nN065QhQM8dWuu4mZSSuQ=;
        b=HBkSLAH/dETQpXy5wC/kMMoZ2qUtfH8S26smZOE9JQXgrbXWQdD1maRTTEr1mzSdCL
         zDjuIti30etTpXmrQpE2yO3DZOQ+WczoTy3hfsyLkua03NemOqVSYS4icgv6NlRCsJhF
         sOKCq8I53VtO0enzOjV0eGdiE75FU2mCCgZHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769679591; x=1770284391;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VfsSFzTDa0vVY4jnjuZaF8nN065QhQM8dWuu4mZSSuQ=;
        b=nwZexzgewnkbjZpYmsJ2eEdPwTLpHjF2P6NDb/tNRxOA3K4rxfBWKdaMv7mA0wpJiq
         ZpKxTUAZGup5lODEs+BD2bk3Fg46YSQvZKkGCMFp6QW0DCHybSuvlnoAUTlDgPYCnJvP
         6pCL4ae8D0tBKJ93D7JrLF5snrMLMxWmptc8MQNTnEQGeMSSLo+KppUjBvTVGinBRARS
         DJIDAdx0/HoustWsWC5SFvok3SxG1d2OTkTRjsPKx2PFoqkL4svf745+3snSpIJnhvH7
         AQlvwtZxyr1ugg9gAsHD5ZTrvlEFWu7p7zrTKzV9Z61zysA3DFdgzgde9QyleB9pFPHO
         PZQA==
X-Gm-Message-State: AOJu0Yw9t4OICQSgpPUmcaf11yZLTIiS5uMEBUYNBtgQjX0mEdlNgCNq
	dvqXZW7sXNR6lqaXUJXQOaiQiajCdQaehuVx5/Gep3Ebzog9flfHOzYIA1zN9xnfYvXuLo2UU+4
	JoU92e0csApRkvt0wkzGxtoSq8wxR1TbTaJxPJFK1AC5jmKcfGcYSsUM=
X-Gm-Gg: AZuq6aLVIJugy+NyvF/maDF8VsKVj13ir0AxnDli834lpXWezeVrfMnzwagvNlrM2po
	P/+4Wxikzg+LzCa6V0nqZe2uHvPqzfFjPeIFCNylEjq/YsFD3X32XLZlNaYOsR5ThzKiShIlwPT
	3xFpPWhvxG1jsPfQBPR+EIzUepBdPYDOKoidipgk0NSSpWQECoCfRNSswLpTSJNmuTQCqAckLdM
	w/5PiSOnd3dL8aPZq07KktoKPh7jl9ViDkDSeYlmkGvCpQGGjsQFEo45OXF4piU5y2lX3kzpNDr
	0NFw4Hy3hmh3CQ3f8//QH/rHCjfi
X-Received: by 2002:a05:6000:2481:b0:435:aecf:9674 with SMTP id
 ffacd0b85a97d-435dd1bcdd2mr10445182f8f.55.1769679590753; Thu, 29 Jan 2026
 01:39:50 -0800 (PST)
MIME-Version: 1.0
References: <20260125183438.1579158-1-peter.marko@siemens.com> <20260125183438.1579158-3-peter.marko@siemens.com>
In-Reply-To: <20260125183438.1579158-3-peter.marko@siemens.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 29 Jan 2026 10:39:24 +0100
X-Gm-Features: AZwV_QhSB7EDdI63snRgGjASVEO3GEUWIujscECihDM2fbpUoaEZ9xmWAVHuTEg
Message-ID: <CAMSfU+5=9iLmbvM=1R=AHOvQhCjTOR0ovbqGShzV1s7p8YWVrw@mail.gmail.com>
Subject: Re: [OE-core][whinlatter][PATCH 3/3] libxml2: patch CVE-2026-0992
To: peter.marko@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005fa209064983a384"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 09:39:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230126

--0000000000005fa209064983a384
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le dim. 25 janv. 2026 =C3=A0 19:41, Peter Marko via lists.openembedded.org
<peter.marko=3Dsiemens.com@lists.openembedded.org> a =C3=A9crit :

> From: Peter Marko <peter.marko@siemens.com>
>
> Pick patch which closed [1].
>
> [1] https://gitlab.gnome.org/GNOME/libxml2/-/issues/1019


Hello,

Did you see
Fix for CVE-2026-0992 is incomplete (#1040) =C2=B7 Issue =C2=B7 GNOME/libxm=
l2
https://gitlab.gnome.org/GNOME/libxml2/-/issues/1040
... and the fixing commit:
catalog: Do not check value for duplication nextCatalog (deed3b78) =C2=B7
Commits =C2=B7 GNOME / libxml2 =C2=B7 GitLab
https://gitlab.gnome.org/GNOME/libxml2/-/commit/deed3b7873dff30b7f87f7f3315=
4c9932a772522
?

Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  .../libxml/libxml2/CVE-2026-0992.patch        | 49 +++++++++++++++++++
>  meta/recipes-core/libxml/libxml2_2.14.6.bb    |  1 +
>  2 files changed, 50 insertions(+)
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0992.patch
>
> diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-0992.patch
> b/meta/recipes-core/libxml/libxml2/CVE-2026-0992.patch
> new file mode 100644
> index 0000000000..ad23498a4c
> --- /dev/null
> +++ b/meta/recipes-core/libxml/libxml2/CVE-2026-0992.patch
> @@ -0,0 +1,49 @@
> +From f75abfcaa419a740a3191e56c60400f3ff18988d Mon Sep 17 00:00:00 2001
> +From: Daniel Garcia Moreno <daniel.garcia@suse.com>
> +Date: Fri, 19 Dec 2025 11:02:18 +0100
> +Subject: [PATCH] catalog: Ignore repeated nextCatalog entries
> +
> +This patch makes the catalog parsing to ignore repeated entries of
> +nextCatalog with the same value.
> +
> +Fix https://gitlab.gnome.org/GNOME/libxml2/-/issues/1019
> +
> +CVE: CVE-2026-0992
> +Upstream-Status: Backport [
> https://gitlab.gnome.org/GNOME/libxml2/-/commit/f75abfcaa419a740a3191e56c=
60400f3ff18988d
> ]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + catalog.c | 18 ++++++++++++++++++
> + 1 file changed, 18 insertions(+)
> +
> +diff --git a/catalog.c b/catalog.c
> +index 46b877e6..fa6d77ca 100644
> +--- a/catalog.c
> ++++ b/catalog.c
> +@@ -1227,9 +1227,27 @@ xmlParseXMLCatalogNode(xmlNodePtr cur,
> xmlCatalogPrefer prefer,
> +               BAD_CAST "delegateURI", BAD_CAST "uriStartString",
> +               BAD_CAST "catalog", prefer, cgroup);
> +     } else if (xmlStrEqual(cur->name, BAD_CAST "nextCatalog")) {
> ++      xmlCatalogEntryPtr prev =3D parent->children;
> ++
> +       entry =3D xmlParseXMLCatalogOneNode(cur, XML_CATA_NEXT_CATALOG,
> +               BAD_CAST "nextCatalog", NULL,
> +               BAD_CAST "catalog", prefer, cgroup);
> ++      /* Avoid duplication of nextCatalog */
> ++      while (prev !=3D NULL) {
> ++          if ((prev->type =3D=3D XML_CATA_NEXT_CATALOG) &&
> ++              (xmlStrEqual (prev->URL, entry->URL)) &&
> ++              (xmlStrEqual (prev->value, entry->value)) &&
> ++              (prev->prefer =3D=3D entry->prefer) &&
> ++              (prev->group =3D=3D entry->group)) {
> ++                  if (xmlDebugCatalogs)
> ++                      xmlCatalogPrintDebug(
> ++                          "Ignoring repeated nextCatalog %s\n",
> entry->URL);
> ++                  xmlFreeCatalogEntry(entry, NULL);
> ++                  entry =3D NULL;
> ++                  break;
> ++          }
> ++          prev =3D prev->next;
> ++      }
> +     }
> +     if (entry !=3D NULL) {
> +         if (parent !=3D NULL) {
> diff --git a/meta/recipes-core/libxml/libxml2_2.14.6.bb
> b/meta/recipes-core/libxml/libxml2_2.14.6.bb
> index 7b47f823f9..b881a89a5f 100644
> --- a/meta/recipes-core/libxml/libxml2_2.14.6.bb
> +++ b/meta/recipes-core/libxml/libxml2_2.14.6.bb
> @@ -21,6 +21,7 @@ SRC_URI +=3D "
> http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=3D${BP};name=3Dtestt
>             file://CVE-2025-6021.patch \
>             file://CVE-2026-0989.patch \
>             file://CVE-2026-0990.patch \
> +           file://CVE-2026-0992.patch \
>             "
>
>  SRC_URI[archive.sha256sum] =3D
> "7ce458a0affeb83f0b55f1f4f9e0e55735dbfc1a9de124ee86fb4a66b597203a"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#229943):
> https://lists.openembedded.org/g/openembedded-core/message/229943
> Mute This Topic: https://lists.openembedded.org/mt/117455086/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--0000000000005fa209064983a384
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0dim. 25=
 janv. 2026 =C3=A0=C2=A019:41, Peter Marko via <a href=3D"http://lists.open=
embedded.org">lists.openembedded.org</a> &lt;peter.marko=3D<a href=3D"mailt=
o:siemens.com@lists.openembedded.org">siemens.com@lists.openembedded.org</a=
>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">From: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com"=
 target=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
<br>
Pick patch which closed [1].<br>
<br>
[1] <a href=3D"https://gitlab.gnome.org/GNOME/libxml2/-/issues/1019" rel=3D=
"noreferrer" target=3D"_blank">https://gitlab.gnome.org/GNOME/libxml2/-/iss=
ues/1019</a></blockquote><div><br></div><div>Hello,</div><div><br></div><di=
v>Did you see</div><div>Fix for CVE-2026-0992 is incomplete (#1040) =C2=B7 =
Issue =C2=B7 GNOME/libxml2<br><a href=3D"https://gitlab.gnome.org/GNOME/lib=
xml2/-/issues/1040">https://gitlab.gnome.org/GNOME/libxml2/-/issues/1040</a=
><br></div><div>... and the fixing commit:</div><div>catalog: Do not check =
value for duplication nextCatalog (deed3b78) =C2=B7 Commits =C2=B7 GNOME / =
libxml2 =C2=B7 GitLab<br><a href=3D"https://gitlab.gnome.org/GNOME/libxml2/=
-/commit/deed3b7873dff30b7f87f7f33154c9932a772522">https://gitlab.gnome.org=
/GNOME/libxml2/-/commit/deed3b7873dff30b7f87f7f33154c9932a772522</a></div><=
div>?</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" t=
arget=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
---<br>
=C2=A0.../libxml/libxml2/CVE-2026-0992.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4=
9 +++++++++++++++++++<br>
=C2=A0meta/recipes-core/libxml/<a href=3D"http://libxml2_2.14.6.bb" rel=3D"=
noreferrer" target=3D"_blank">libxml2_2.14.6.bb</a>=C2=A0 =C2=A0 |=C2=A0 1 =
+<br>
=C2=A02 files changed, 50 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0992.pat=
ch<br>
<br>
diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-0992.patch b/meta/re=
cipes-core/libxml/libxml2/CVE-2026-0992.patch<br>
new file mode 100644<br>
index 0000000000..ad23498a4c<br>
--- /dev/null<br>
+++ b/meta/recipes-core/libxml/libxml2/CVE-2026-0992.patch<br>
@@ -0,0 +1,49 @@<br>
+From f75abfcaa419a740a3191e56c60400f3ff18988d Mon Sep 17 00:00:00 2001<br>
+From: Daniel Garcia Moreno &lt;<a href=3D"mailto:daniel.garcia@suse.com" t=
arget=3D"_blank">daniel.garcia@suse.com</a>&gt;<br>
+Date: Fri, 19 Dec 2025 11:02:18 +0100<br>
+Subject: [PATCH] catalog: Ignore repeated nextCatalog entries<br>
+<br>
+This patch makes the catalog parsing to ignore repeated entries of<br>
+nextCatalog with the same value.<br>
+<br>
+Fix <a href=3D"https://gitlab.gnome.org/GNOME/libxml2/-/issues/1019" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.gnome.org/GNOME/libxml2/-/=
issues/1019</a><br>
+<br>
+CVE: CVE-2026-0992<br>
+Upstream-Status: Backport [<a href=3D"https://gitlab.gnome.org/GNOME/libxm=
l2/-/commit/f75abfcaa419a740a3191e56c60400f3ff18988d" rel=3D"noreferrer" ta=
rget=3D"_blank">https://gitlab.gnome.org/GNOME/libxml2/-/commit/f75abfcaa41=
9a740a3191e56c60400f3ff18988d</a>]<br>
+Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" =
target=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
+---<br>
+ catalog.c | 18 ++++++++++++++++++<br>
+ 1 file changed, 18 insertions(+)<br>
+<br>
+diff --git a/catalog.c b/catalog.c<br>
+index 46b877e6..fa6d77ca 100644<br>
+--- a/catalog.c<br>
++++ b/catalog.c<br>
+@@ -1227,9 +1227,27 @@ xmlParseXMLCatalogNode(xmlNodePtr cur, xmlCatalogPr=
efer prefer,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BAD_CAST &quot;dele=
gateURI&quot;, BAD_CAST &quot;uriStartString&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BAD_CAST &quot;cata=
log&quot;, prefer, cgroup);<br>
+=C2=A0 =C2=A0 =C2=A0} else if (xmlStrEqual(cur-&gt;name, BAD_CAST &quot;ne=
xtCatalog&quot;)) {<br>
++=C2=A0 =C2=A0 =C2=A0 xmlCatalogEntryPtr prev =3D parent-&gt;children;<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0entry =3D xmlParseXMLCatalogOneNode(cur, XML_CA=
TA_NEXT_CATALOG,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BAD_CAST &quot;next=
Catalog&quot;, NULL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BAD_CAST &quot;cata=
log&quot;, prefer, cgroup);<br>
++=C2=A0 =C2=A0 =C2=A0 /* Avoid duplication of nextCatalog */<br>
++=C2=A0 =C2=A0 =C2=A0 while (prev !=3D NULL) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((prev-&gt;type =3D=3D XML_CATA_NEX=
T_CATALOG) &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (xmlStrEqual (prev-&gt;U=
RL, entry-&gt;URL)) &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (xmlStrEqual (prev-&gt;v=
alue, entry-&gt;value)) &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (prev-&gt;prefer =3D=3D =
entry-&gt;prefer) &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (prev-&gt;group =3D=3D e=
ntry-&gt;group)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (xmlDeb=
ugCatalogs)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 xmlCatalogPrintDebug(<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;Ignoring repeated nextCatalog %s\n&quot;, entry-&gt=
;URL);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xmlFreeCat=
alogEntry(entry, NULL);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 entry =3D =
NULL;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prev =3D prev-&gt;next;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0if (entry !=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (parent !=3D NULL) {<br>
diff --git a/meta/recipes-core/libxml/<a href=3D"http://libxml2_2.14.6.bb" =
rel=3D"noreferrer" target=3D"_blank">libxml2_2.14.6.bb</a> b/meta/recipes-c=
ore/libxml/<a href=3D"http://libxml2_2.14.6.bb" rel=3D"noreferrer" target=
=3D"_blank">libxml2_2.14.6.bb</a><br>
index 7b47f823f9..b881a89a5f 100644<br>
--- a/meta/recipes-core/libxml/<a href=3D"http://libxml2_2.14.6.bb" rel=3D"=
noreferrer" target=3D"_blank">libxml2_2.14.6.bb</a><br>
+++ b/meta/recipes-core/libxml/<a href=3D"http://libxml2_2.14.6.bb" rel=3D"=
noreferrer" target=3D"_blank">libxml2_2.14.6.bb</a><br>
@@ -21,6 +21,7 @@ SRC_URI +=3D &quot;<a href=3D"http://www.w3.org/XML/Test/=
xmlts20130923.tar;subdir=3D$%7BBP%7D;name=3Dtestt" rel=3D"noreferrer" targe=
t=3D"_blank">http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=3D${BP};na=
me=3Dtestt</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2025-6021.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2026-0989.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2026-0990.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2026-0992.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI[archive.sha256sum] =3D &quot;7ce458a0affeb83f0b55f1f4f9e0e557=
35dbfc1a9de124ee86fb4a66b597203a&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#229943): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/229943" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/229943</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117455086/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117455086/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" tar=
get=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--0000000000005fa209064983a384--

