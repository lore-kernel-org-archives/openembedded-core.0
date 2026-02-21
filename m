Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78B9BC61DFB
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 16:51:07 +0000 (UTC)
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23126.1771692662642296660
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Feb 2026 08:51:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GCxPfkWM;
 spf=pass (domain: gmail.com, ip: 74.125.224.50, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-649b5f5570fso3666854d50.0
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 08:51:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771692662; cv=none;
        d=google.com; s=arc-20240605;
        b=CRHwuFgmxuUNg4dmGCsHJm093T3Wf6GxlYt+VJUOHKBkih6Z1t5Eor6u7PORd1qc2Z
         DcvG4mF8u4BMVgBqdKUtSgyWHAb/hWSvBdYOLyP1X3aFNK6X6AFrqitmflHq+Vcf8I8O
         tfpXNQmhhT9yH9CeiOtmQa2eOg+OwcFwSCdzY/Bq4zDkK26Z63xlpehXiy0o2XSBPbs4
         jv4Ct8ASN67WfZJc9yGrnrBhnhYjkLjHzrsXPMZHIG249d9CZQHN02j8iVfG7URbCCbx
         M19DwxQ24WdHUb6YIveWD5Tr/HATslGTO+W4gPqE59hKdfxoDpbZYcdzqSkprIK49bxh
         F4kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KbUHkUgNNJcHFewPPpf4LV3+hFbAxDe0Vr26U0qbuHo=;
        fh=bNoVUmK9O0vE3kX3q1TCx065x9AJf7wShrYaRToWCWk=;
        b=HvJa6OqhWQ/s9SWpDh5nP/VbC3LpoUtUFptGAZ7Oobf1jaxjN5wsMqjXdFUwsmfiRe
         SjSdLST437eLonnc1cdFF7NErLgJsTfnEEx31wN8v5eutmcadXp0jgyyLDlfjvO4kzCx
         ePifCwOHqu68d8cy637o8pLa75997394f4Zyqy1MX9LYAMEvnLMN60GF3RkGdsKKpvly
         LvxLK3XB5WUlbpoI2LYBNcyZHrolBaPgrxtGtWJLNnpkoJj193zxG+MbVQ3KgWc7NQW3
         w0R4jXD8yIvmtGOqsYqeeko2mya4Q30Wq7eDNGUcI/d3tLHjW3l9IO6yjq266wEiZFfn
         tFEw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771692662; x=1772297462; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KbUHkUgNNJcHFewPPpf4LV3+hFbAxDe0Vr26U0qbuHo=;
        b=GCxPfkWMpzYox0yICPaSKRl8flTvIkfU2kcGJKYo+NPamAuz1gmpwbzI3ZY3AKHTHt
         BAixmclDLonPvwoaz5f4lu+ZMo3JL5wyKZZvkYTTbvLQlTv90HHzkmUM4MYDPQYyLE/g
         /KbdySIp2h704ZyC+x4UBRg/9opwMGkRssLYegFyV565T7IB0biNA4K1lX2h9t357lUP
         F+RHjZP8PXOzNkwZgcLaA7GpLlAWUgxqrihu4Ny7IJPBiMH09Vo/Lr0A4qMuZgYBz11w
         sidrLY7g+SpFthupe+Y8Kp4OO71CSFtGhGMRnEnf3GNfLAgHFtq5B4NhpWqKCcPuD7N5
         Moug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771692662; x=1772297462;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KbUHkUgNNJcHFewPPpf4LV3+hFbAxDe0Vr26U0qbuHo=;
        b=bO5Y4nypfMKGMiqn6HLvaajn4K9x0Kd/fH45KDeQYGA0UzHCqcE/PYfvbpDHH6JSaH
         p4++cayz5gsOhxakuJHIl0KwLQgYmvY/ma4Fg2NsHZk17v91Num3UIaoMDNF/JoWPx3U
         ph+bsG0DALqGqjYLmiKV9pu4e+OLHQEk64xW1LLaiCkXCKVGfPv+AQ/ay2h9Nrq7zUpL
         TZ3CEXyStADdf73sB+f6vbfXGutZ+Up2WqmwSdatwgDCt7d/c+QOhhbjH8F4Z3x0etp4
         gQOtzb7UYI5g6VvmYv0EugXJitWD1M79KMWXceMnjgDxvq+p7oWwtt8f4pzsqI8HjCEU
         Geog==
X-Gm-Message-State: AOJu0Yy5Any2fISd4Rcv9buvIj5CKelf7cB2tVBUh+Zx1zCHR4nbjDv/
	iFFLjIoaEpmMkOSH0OmXifPSSqnovHuH51NYA8XfgR/3HHIVhM+YJh9me7vv0azlIdY7Dk6xKHo
	C4bNUWzafzpnFxixK7UM5+OJXhxDEmV0=
X-Gm-Gg: AZuq6aIKHT99pXJ/gUm/v72bT63sY5QlbzI6YMobbZF1BmDBHiX9zeNwwuDyo3Ukvq0
	+j7fQIXjZcolflC8cd/bQbj3rLJs4qES9NSHwJUKRzy0pGSvmM6M5lARYUsDbmAKWlcoNXSMTQW
	tIXIDUPcWcMdVlqYOcjkO5YMYNJmJyQU6FIrG5NCe/VCxeFSWwdmgKbmbeePp7N9peCwHm8vG4j
	4QOKyGCNDB2rXQtYidLLw90WZ8Za3JaOWfG+eIwDXqnXBoDpX3mMDm11L0aiTGJW9gqGE/BLg2+
	JUZylQ==
X-Received: by 2002:a05:690e:1916:b0:649:3875:9200 with SMTP id
 956f58d0204a3-64c78f6f90dmr2896545d50.1.1771692661621; Sat, 21 Feb 2026
 08:51:01 -0800 (PST)
MIME-Version: 1.0
References: <20260221042530.318125-1-stondo@gmail.com> <20260221042530.318125-3-stondo@gmail.com>
In-Reply-To: <20260221042530.318125-3-stondo@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Sat, 21 Feb 2026 09:50:51 -0700
X-Gm-Features: AaiRm52J3O75k9H1lvq4AxZKrRS9VsxZwtWe0NvCYMWv6kSq8VN_c6siqkh7wZI
Message-ID: <CAJdd5Gb0U1Z12fyEpkbfGQKk_NgGtQGXcJEtULU2KMmtEkCmDw@mail.gmail.com>
Subject: Re: [PATCH 2/2] spdx-common: Clarify documentation and make
 SPDX_LICENSES extensible
To: Stefano Tondo <stondo@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Stefano Tondo <stefano.tondo.ext@siemens.com>, 
	"Freihofer, Adrian" <adrian.freihofer@siemens.com>, "Marko, Peter" <Peter.Marko@siemens.com>, 
	Ross Burton <Ross.Burton@arm.com>
Content-Type: multipart/alternative; boundary="000000000000bf4720064b5857cb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 16:51:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231621

--000000000000bf4720064b5857cb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 20, 2026, 9:25=E2=80=AFPM Stefano Tondo <stondo@gmail.com> wrot=
e:

> From: Stefano Tondo <stefano.tondo.ext@siemens.com>
>
> This commit improves the SPDX variable documentation and enhances
> SPDX_LICENSES to support layer-based license extensions.
>

Sorry, you can't do this. The spdx license list is specified by spdx, not
us. If you have licenses that are not on the list, the LicenseRef code
should take care of adding their text, but you can't just invent new spdx
license IDs for your licenses


> 1. SPDX_NAMESPACE_PREFIX documentation clarification:
>    - Clarify that this should be organization-specific
>    - Explain the default is for compatibility only
>    - Provide example of production override
>    - Make it consistent with SPDX_UUID_NAMESPACE guidance
>
> 2. SPDX_LICENSES documentation enhancement:
>    - Clarify when this variable needs to be set
>    - Document the new list behavior
>    - Provide example usage with +=3D operator
>
> 3. SPDX_LICENSES implementation as extensible list:
>    - Change from single file to space-separated list of files
>    - Support layer-based license extensions without file copying
>    - Later files override earlier ones for duplicate license IDs
>    - Backward compatible (single file path still works)
>    - Add error handling for missing/invalid files
>
> This enhancement allows layers to add custom licenses without
> maintaining a copy of the base spdx-licenses.json file:
>
>   SPDX_LICENSES +=3D "${LAYERDIR}/files/custom-licenses.json"
>
> This is particularly useful for organizations with proprietary or
> custom licenses that need to be tracked in SBOMs.
>
> Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
> Cc: "Ross Burton" <Ross.Burton@arm.com>
> ---
>  meta/classes/spdx-common.bbclass | 13 +++++++++----
>  meta/lib/oe/spdx_common.py       | 31 +++++++++++++++++++++++++++----
>  2 files changed, 36 insertions(+), 8 deletions(-)
>
> diff --git a/meta/classes/spdx-common.bbclass
> b/meta/classes/spdx-common.bbclass
> index b8961262f9..024f24c837 100644
> --- a/meta/classes/spdx-common.bbclass
> +++ b/meta/classes/spdx-common.bbclass
> @@ -42,7 +42,10 @@ SPDX_UUID_NAMESPACE[doc] =3D "The namespace used for
> generating UUIDs in SPDX \
>
>  SPDX_NAMESPACE_PREFIX ??=3D "http://spdx.org/spdxdocs"
>  SPDX_NAMESPACE_PREFIX[doc] =3D "The URI prefix used for SPDX document
> namespaces. \
> -    Combined with other identifiers to create unique document URIs."
> +    This should be a domain name or URI prefix unique to your
> organization to ensure \
> +    globally unique document URIs. The default 'http://spdx.org/spdxdocs=
'
> is provided \
> +    for compatibility but should be overridden in production environment=
s
> (e.g., \
> +    'https://sbom.example.com')."
>
>  SPDX_PRETTY ??=3D "0"
>  SPDX_PRETTY[doc] =3D "If set to '1', generate human-readable formatted J=
SON
> output \
> @@ -50,9 +53,11 @@ SPDX_PRETTY[doc] =3D "If set to '1', generate
> human-readable formatted JSON output
>      Pretty formatting makes files larger but easier to read."
>
>  SPDX_LICENSES ??=3D "${COREBASE}/meta/files/spdx-licenses.json"
> -SPDX_LICENSES[doc] =3D "Path to the JSON file containing SPDX license
> identifier \
> -    mappings. This file maps common license names to official SPDX
> license \
> -    identifiers."
> +SPDX_LICENSES[doc] =3D "Space-separated list of JSON files containing SP=
DX
> license \
> +    identifier mappings. Files are processed in order, with later entrie=
s
> overriding \
> +    earlier ones. This allows layers to extend the base license set
> without copying \
> +    the entire file. Set this variable in your layer when using licenses
> not known \
> +    to oe-core (e.g., 'SPDX_LICENSES +=3D
> \"${LAYERDIR}/files/custom-licenses.json\"')."
>
>  SPDX_CUSTOM_ANNOTATION_VARS ??=3D ""
>  SPDX_CUSTOM_ANNOTATION_VARS[doc] =3D "Space-separated list of variable
> names whose \
> diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
> index 72c24180d5..8a6cf70fc1 100644
> --- a/meta/lib/oe/spdx_common.py
> +++ b/meta/lib/oe/spdx_common.py
> @@ -42,10 +42,33 @@ def is_work_shared_spdx(d):
>
>
>  def load_spdx_license_data(d):
> -    with open(d.getVar("SPDX_LICENSES"), "r") as f:
> -        data =3D json.load(f)
> -        # Transform the license array to a dictionary
> -        data["licenses"] =3D {l["licenseId"]: l for l in data["licenses"=
]}
> +    """
> +    Load SPDX license data from one or more JSON files.
> +    SPDX_LICENSES can be a space-separated list of files.
> +    Later files override earlier ones for duplicate license IDs.
> +    """
> +    license_files =3D d.getVar("SPDX_LICENSES").split()
> +
> +    # Initialize with empty structure
> +    data =3D {"licenses": {}}
> +
> +    # Load and merge each file
> +    for license_file in license_files:
> +        try:
> +            with open(license_file, "r") as f:
> +                file_data =3D json.load(f)
> +                # Transform the license array to a dictionary and merge
> +                if "licenses" in file_data:
> +                    for lic in file_data["licenses"]:
> +                        data["licenses"][lic["licenseId"]] =3D lic
> +                # Copy over other top-level keys from the last file
> +                for key in file_data:
> +                    if key !=3D "licenses":
> +                        data[key] =3D file_data[key]
> +        except FileNotFoundError:
> +            bb.warn(f"SPDX license file not found: {license_file}")
> +        except json.JSONDecodeError as e:
> +            bb.warn(f"Invalid JSON in SPDX license file {license_file}:
> {e}")
>
>      return data
>
> --
> 2.53.0
>
>

--000000000000bf4720064b5857cb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 20, 2026, 9:25=E2=80=
=AFPM Stefano Tondo &lt;<a href=3D"mailto:stondo@gmail.com">stondo@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Stefano Tond=
o &lt;<a href=3D"mailto:stefano.tondo.ext@siemens.com" target=3D"_blank" re=
l=3D"noreferrer">stefano.tondo.ext@siemens.com</a>&gt;<br>
<br>
This commit improves the SPDX variable documentation and enhances<br>
SPDX_LICENSES to support layer-based license extensions.<br></blockquote></=
div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Sorry, you can&#39;=
t do this. The spdx license list is specified by spdx, not us. If you have =
licenses that are not on the list, the LicenseRef code should take care of =
adding their text, but you can&#39;t just invent new spdx license IDs for y=
our licenses</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=
=3D"gmail_quote gmail_quote_container"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
1. SPDX_NAMESPACE_PREFIX documentation clarification:<br>
=C2=A0 =C2=A0- Clarify that this should be organization-specific<br>
=C2=A0 =C2=A0- Explain the default is for compatibility only<br>
=C2=A0 =C2=A0- Provide example of production override<br>
=C2=A0 =C2=A0- Make it consistent with SPDX_UUID_NAMESPACE guidance<br>
<br>
2. SPDX_LICENSES documentation enhancement:<br>
=C2=A0 =C2=A0- Clarify when this variable needs to be set<br>
=C2=A0 =C2=A0- Document the new list behavior<br>
=C2=A0 =C2=A0- Provide example usage with +=3D operator<br>
<br>
3. SPDX_LICENSES implementation as extensible list:<br>
=C2=A0 =C2=A0- Change from single file to space-separated list of files<br>
=C2=A0 =C2=A0- Support layer-based license extensions without file copying<=
br>
=C2=A0 =C2=A0- Later files override earlier ones for duplicate license IDs<=
br>
=C2=A0 =C2=A0- Backward compatible (single file path still works)<br>
=C2=A0 =C2=A0- Add error handling for missing/invalid files<br>
<br>
This enhancement allows layers to add custom licenses without<br>
maintaining a copy of the base spdx-licenses.json file:<br>
<br>
=C2=A0 SPDX_LICENSES +=3D &quot;${LAYERDIR}/files/custom-licenses.json&quot=
;<br>
<br>
This is particularly useful for organizations with proprietary or<br>
custom licenses that need to be tracked in SBOMs.<br>
<br>
Signed-off-by: Stefano Tondo &lt;<a href=3D"mailto:stefano.tondo.ext@siemen=
s.com" target=3D"_blank" rel=3D"noreferrer">stefano.tondo.ext@siemens.com</=
a>&gt;<br>
Cc: &quot;Ross Burton&quot; &lt;<a href=3D"mailto:Ross.Burton@arm.com" targ=
et=3D"_blank" rel=3D"noreferrer">Ross.Burton@arm.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/spdx-common.bbclass | 13 +++++++++----<br>
=C2=A0meta/lib/oe/spdx_common.py=C2=A0 =C2=A0 =C2=A0 =C2=A0| 31 +++++++++++=
++++++++++++++++----<br>
=C2=A02 files changed, 36 insertions(+), 8 deletions(-)<br>
<br>
diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bb=
class<br>
index b8961262f9..024f24c837 100644<br>
--- a/meta/classes/spdx-common.bbclass<br>
+++ b/meta/classes/spdx-common.bbclass<br>
@@ -42,7 +42,10 @@ SPDX_UUID_NAMESPACE[doc] =3D &quot;The namespace used fo=
r generating UUIDs in SPDX \<br>
<br>
=C2=A0SPDX_NAMESPACE_PREFIX ??=3D &quot;<a href=3D"http://spdx.org/spdxdocs=
" rel=3D"noreferrer noreferrer" target=3D"_blank">http://spdx.org/spdxdocs<=
/a>&quot;<br>
=C2=A0SPDX_NAMESPACE_PREFIX[doc] =3D &quot;The URI prefix used for SPDX doc=
ument namespaces. \<br>
-=C2=A0 =C2=A0 Combined with other identifiers to create unique document UR=
Is.&quot;<br>
+=C2=A0 =C2=A0 This should be a domain name or URI prefix unique to your or=
ganization to ensure \<br>
+=C2=A0 =C2=A0 globally unique document URIs. The default &#39;<a href=3D"h=
ttp://spdx.org/spdxdocs" rel=3D"noreferrer noreferrer" target=3D"_blank">ht=
tp://spdx.org/spdxdocs</a>&#39; is provided \<br>
+=C2=A0 =C2=A0 for compatibility but should be overridden in production env=
ironments (e.g., \<br>
+=C2=A0 =C2=A0 &#39;<a href=3D"https://sbom.example.com" rel=3D"noreferrer =
noreferrer" target=3D"_blank">https://sbom.example.com</a>&#39;).&quot;<br>
<br>
=C2=A0SPDX_PRETTY ??=3D &quot;0&quot;<br>
=C2=A0SPDX_PRETTY[doc] =3D &quot;If set to &#39;1&#39;, generate human-read=
able formatted JSON output \<br>
@@ -50,9 +53,11 @@ SPDX_PRETTY[doc] =3D &quot;If set to &#39;1&#39;, genera=
te human-readable formatted JSON output<br>
=C2=A0 =C2=A0 =C2=A0Pretty formatting makes files larger but easier to read=
.&quot;<br>
<br>
=C2=A0SPDX_LICENSES ??=3D &quot;${COREBASE}/meta/files/spdx-licenses.json&q=
uot;<br>
-SPDX_LICENSES[doc] =3D &quot;Path to the JSON file containing SPDX license=
 identifier \<br>
-=C2=A0 =C2=A0 mappings. This file maps common license names to official SP=
DX license \<br>
-=C2=A0 =C2=A0 identifiers.&quot;<br>
+SPDX_LICENSES[doc] =3D &quot;Space-separated list of JSON files containing=
 SPDX license \<br>
+=C2=A0 =C2=A0 identifier mappings. Files are processed in order, with late=
r entries overriding \<br>
+=C2=A0 =C2=A0 earlier ones. This allows layers to extend the base license =
set without copying \<br>
+=C2=A0 =C2=A0 the entire file. Set this variable in your layer when using =
licenses not known \<br>
+=C2=A0 =C2=A0 to oe-core (e.g., &#39;SPDX_LICENSES +=3D \&quot;${LAYERDIR}=
/files/custom-licenses.json\&quot;&#39;).&quot;<br>
<br>
=C2=A0SPDX_CUSTOM_ANNOTATION_VARS ??=3D &quot;&quot;<br>
=C2=A0SPDX_CUSTOM_ANNOTATION_VARS[doc] =3D &quot;Space-separated list of va=
riable names whose \<br>
diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py<br>
index 72c24180d5..8a6cf70fc1 100644<br>
--- a/meta/lib/oe/spdx_common.py<br>
+++ b/meta/lib/oe/spdx_common.py<br>
@@ -42,10 +42,33 @@ def is_work_shared_spdx(d):<br>
<br>
<br>
=C2=A0def load_spdx_license_data(d):<br>
-=C2=A0 =C2=A0 with open(d.getVar(&quot;SPDX_LICENSES&quot;), &quot;r&quot;=
) as f:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D json.load(f)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Transform the license array to a dictionary<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 data[&quot;licenses&quot;] =3D {l[&quot;licens=
eId&quot;]: l for l in data[&quot;licenses&quot;]}<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 Load SPDX license data from one or more JSON files.<br>
+=C2=A0 =C2=A0 SPDX_LICENSES can be a space-separated list of files.<br>
+=C2=A0 =C2=A0 Later files override earlier ones for duplicate license IDs.=
<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 license_files =3D d.getVar(&quot;SPDX_LICENSES&quot;).split(=
)<br>
+<br>
+=C2=A0 =C2=A0 # Initialize with empty structure<br>
+=C2=A0 =C2=A0 data =3D {&quot;licenses&quot;: {}}<br>
+<br>
+=C2=A0 =C2=A0 # Load and merge each file<br>
+=C2=A0 =C2=A0 for license_file in license_files:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(license_file, &quot;r&=
quot;) as f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file_data =3D json=
.load(f)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Transform the li=
cense array to a dictionary and merge<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if &quot;licenses&=
quot; in file_data:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for =
lic in file_data[&quot;licenses&quot;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 data[&quot;licenses&quot;][lic[&quot;licenseId&quot;]] =3D lic<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Copy over other =
top-level keys from the last file<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for key in file_da=
ta:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if k=
ey !=3D &quot;licenses&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 data[key] =3D file_data[key]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except FileNotFoundError:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(f&quot;SPDX license file=
 not found: {license_file}&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except json.JSONDecodeError as e:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(f&quot;Invalid JSON in S=
PDX license file {license_file}: {e}&quot;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0return data<br>
<br>
-- <br>
2.53.0<br>
<br>
</blockquote></div></div></div>

--000000000000bf4720064b5857cb--

