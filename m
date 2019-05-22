Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id BCEDD7CECB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 15:48:19 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id l25so4468555eda.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 08:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+dWL/5FZy9bhL6zdobkf/hH/ZU9fdD4e+7d3zF7leYY=;
	b=AX9hQSrqDmQ+V46Eq0f0ZWSuIbpti/X/hOs+LrNOnaH68J22Y/V8juU3heOMMW+wOa
	qtoKkJCOKAYqizlriugHl353PZlsJhGFxku6W2YjL/ga7Kuhh8CBjD4JWbt8vQ2bDMIS
	bLJE2NJB+hHNanaQGcuc5dw3P8R+nUFxVEU5VIRkvbnjEbI1qk3RMmmWIRDAwvEqbIhY
	MiSpSPH46dSWhkdc1wxn+5GeCaPUCu4QaxjY1LJVd0TQocN2WEVKEvKiowKJaaOg9W9y
	chl6GdAYoeWE/vR4sRRI1zSE+pvR1ti9xwna4s/xN8mFBXrN6ZaasNkpkZQOoJb5QUSn
	6akA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+dWL/5FZy9bhL6zdobkf/hH/ZU9fdD4e+7d3zF7leYY=;
	b=dWTYdfSNz9CRgyGHjQzbN3jg4NZpW85VqUJUXSM7FiZ7LTteTWn0ruDO0ab905Mx+7
	19tyauVHPI4Hwu3qWXYHpLdyp8QfH+5hY0vFmVBB6A1Aa1kBM80MYqdnDCO06wJICB/6
	pKVM2xlPUC9UyBWGHOGafGpSzYFYs+Il9+7FsKTlNs9Phgnq6uDIwbV6iE/2sgB0RJO5
	P1pm0dv5h/v/hX30t6YOFEnj0v6khD/ptjy/CS6/JfOy/dnDUQmpM4hofr4jAU9ZGs7v
	R/D/hfHHSuheeU+jsb1GHOUJ1ijvzRGrEgA03ms2HRwlDI7MtqNUskbvoOfSRcLYpEBy
	nqLA==
X-Gm-Message-State: APjAAAVRinlpthF8npunU+d1dyvHugJFZke5/+m9WxDYslGBDkpRG/hi
	5/R8fFhaPInQCmDe8xuoVadkFHKwtgysINhV+p4A5Q==
X-Google-Smtp-Source: APXvYqy3c/+TO3BFcpo1h6cb9xlF/EdLcuNZSakQh+aEej3IiNNd7harCqq4pTkGShCBAiCK8IalBYmN16tBS8R6nuc=
X-Received: by 2002:a50:c983:: with SMTP id w3mr89129807edh.49.1558540100492; 
	Wed, 22 May 2019 08:48:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190517233743.9646-1-ross.burton@intel.com>
In-Reply-To: <20190517233743.9646-1-ross.burton@intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 22 May 2019 17:48:19 +0200
Message-ID: <CA+chaQdQSk_WCyJC+beE7i+Y8fuqSZxA_-tR4yGXYfDVsRKQaA@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] insane: add sanity checks to SRC_URI
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 May 2019 15:48:20 -0000
Content-Type: multipart/alternative; boundary="0000000000000ee2b205897be5ec"

--0000000000000ee2b205897be5ec
Content-Type: text/plain; charset="UTF-8"

Can we add an option to skip this with INSANE_SKIP?

It looks like QARECIPETEST doesn't use INSANE_SKIP or I don't see how.

Removing src-uri-bad from ERROR_QA/WARN_QA for some recipes works as well,
is it worth adding INSANE_SKIP for consistency with other checks or not?


On Sat, May 18, 2019 at 1:37 AM Ross Burton <ross.burton@intel.com> wrote:

> The SRC_URI almost definitely shouldn't be using ${PN}, and GitHub
> */archive/*
> tarballs are dynamically generated so the checksums will change over time.
>
> Detect both of these, and emit a QA warning if found.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/insane.bbclass | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 9ca5aefe544..59bb8be5470 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -25,7 +25,7 @@ QA_SANE = "True"
>  WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir
> xorg-driver-abi \
>              textrel already-stripped incompatible-license files-invalid \
>              installed-vs-shipped compile-host-path install-host-path \
> -            pn-overrides infodir build-deps \
> +            pn-overrides infodir build-deps src-uri-bad \
>              unknown-configure-option symlink-to-sysroot multilib \
>              invalid-packageconfig host-user-contaminated uppercase-pn
> patch-fuzz \
>              "
> @@ -898,6 +898,17 @@ def package_qa_check_host_user(path, name, d, elf,
> messages):
>              return False
>      return True
>
> +QARECIPETEST[src-uri-bad] = "package_qa_check_src_uri"
> +def package_qa_check_src_uri(pn, d, messages):
> +    import re
> +
> +    if "${PN}" in d.getVar("SRC_URI", False):
> +        package_qa_handle_error("src-uri-bad", "%s: SRC_URI uses PN not
> BPN" % pn, d)
> +
> +    pn = d.getVar("SRC_URI")
> +    if re.search(r"github\.com/.+/.+/archive/.+", pn):
> +        package_qa_handle_error("src-uri-bad", "%s: SRC_URI uses unstable
> GitHub archives" % pn, d)
> +
>
>  # The PACKAGE FUNC to scan each package
>  python do_package_qa () {
> --
> 2.20.1 (Apple Git-117)
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000000ee2b205897be5ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Can we add an option to skip this with INSANE_SKIP?<div><b=
r></div><div>It looks like=C2=A0QARECIPETEST doesn&#39;t use INSANE_SKIP or=
 I don&#39;t see how.</div><div><br></div><div>Removing src-uri-bad from ER=
ROR_QA/WARN_QA for some recipes works as well, is it worth adding INSANE_SK=
IP for consistency with other checks or not?</div><div><br></div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Ma=
y 18, 2019 at 1:37 AM Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.c=
om" target=3D"_blank">ross.burton@intel.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">The SRC_URI almost definitely sh=
ouldn&#39;t be using ${PN}, and GitHub */archive/*<br>
tarballs are dynamically generated so the checksums will change over time.<=
br>
<br>
Detect both of these, and emit a QA warning if found.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" tar=
get=3D"_blank">ross.burton@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/insane.bbclass | 13 ++++++++++++-<br>
=C2=A01 file changed, 12 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass<br>
index 9ca5aefe544..59bb8be5470 100644<br>
--- a/meta/classes/insane.bbclass<br>
+++ b/meta/classes/insane.bbclass<br>
@@ -25,7 +25,7 @@ QA_SANE =3D &quot;True&quot;<br>
=C2=A0WARN_QA ?=3D &quot;ldflags useless-rpaths rpaths staticdev libdir xor=
g-driver-abi \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0textrel already-stripped in=
compatible-license files-invalid \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0installed-vs-shipped compil=
e-host-path install-host-path \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pn-overrides infodir build-deps =
\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pn-overrides infodir build-deps =
src-uri-bad \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unknown-configure-option sy=
mlink-to-sysroot multilib \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0invalid-packageconfig host-=
user-contaminated uppercase-pn patch-fuzz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
@@ -898,6 +898,17 @@ def package_qa_check_host_user(path, name, d, elf, mes=
sages):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return False<br>
=C2=A0 =C2=A0 =C2=A0return True<br>
<br>
+QARECIPETEST[src-uri-bad] =3D &quot;package_qa_check_src_uri&quot;<br>
+def package_qa_check_src_uri(pn, d, messages):<br>
+=C2=A0 =C2=A0 import re<br>
+<br>
+=C2=A0 =C2=A0 if &quot;${PN}&quot; in d.getVar(&quot;SRC_URI&quot;, False)=
:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 package_qa_handle_error(&quot;src-uri-bad&quot=
;, &quot;%s: SRC_URI uses PN not BPN&quot; % pn, d)<br>
+<br>
+=C2=A0 =C2=A0 pn =3D d.getVar(&quot;SRC_URI&quot;)<br>
+=C2=A0 =C2=A0 if re.search(r&quot;github\.com/.+/.+/archive/.+&quot;, pn):=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 package_qa_handle_error(&quot;src-uri-bad&quot=
;, &quot;%s: SRC_URI uses unstable GitHub archives&quot; % pn, d)<br>
+<br>
<br>
=C2=A0# The PACKAGE FUNC to scan each package<br>
=C2=A0python do_package_qa () {<br>
-- <br>
2.20.1 (Apple Git-117)<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000000ee2b205897be5ec--
