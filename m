Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB4F9C54FB3
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 19:24:59 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.33874.1748805893542449074
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 12:24:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=eHPtvdgV;
 spf=pass (domain: konsulko.com, ip: 209.85.218.42, mailfrom: tim.orling@konsulko.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ad89ee255easo678513866b.3
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 12:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1748805891; x=1749410691; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A44Sy5wjQyb+cTQt9jLybYe2mmJgI+0WQl/epc4yjkc=;
        b=eHPtvdgVS40gSF6dNULR663J8DbqLaKfEj56eTnaAPi63OgdXJcn15G3oTAulDRCB8
         7eLQAu+MzoCQUGIn3H1CxRelYY9FkNpr9cky0tiUIf30jhne+jJcl/qaCSk0sgs8X1ic
         7P9fP4Xi3hGBBYJohdlLoqR7MUDVBBNxeFa1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748805891; x=1749410691;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A44Sy5wjQyb+cTQt9jLybYe2mmJgI+0WQl/epc4yjkc=;
        b=thF9d4G40WSfqOIqwFLDTb3PsDA+uoDNDDGOAtFOwj8HF7qkL/8Gib4wBo3HcBHeWj
         8Ex+DmgMCP6+RMmE9HqUbDqo0Q3yXsApwA5DZiVUv4modTkGJQkFTSP6ZYY0x6LK04Bu
         VR2YvkwpT3e5mffzxiUVvCSYQd14ghLvxpPJe5tuBQRT9RKu4gVWZtT86nUQ9AmDbecy
         jFPE6z81w30q2DkoBE+bR2B5iVejR/L1G9LOwEvauQLzVucDZgE2T5BT7w/n0xXbFNby
         TJ0cYSlzuwphr3nSe9NoxIMovmqtEhqV4jd9spV6J7+fO/l3budqB71qF5j5c5xped2g
         3s6Q==
X-Gm-Message-State: AOJu0YyJrgBP6KuSKJctHJGjrKMtGnr3IzLDOMmt4oay8dHZCAg79yBQ
	UiALxQdLxYssmEBkf1MFogcc7vDMHJ/6Bw3t7c9vgaFSly5EFyDfWUV8JAl+mzQuT4RH6cDdFIJ
	O8Jzf3EYvEIY8G3I9T6lAqzfeU92yI/1SoopRfj6/J7UjzHZ5fR3zndQ5ng==
X-Gm-Gg: ASbGncto1vrJ9TM6HcpHEITn+jajo3UEuDmAGD/V1ixT7DyeCTPIVthGs3aCuhFiFCN
	aZpgLWxzi6p1DXZPtq/MRthlMgSQoFuyfkH7NpLU8XGh9R9lONnp1pvOUWumIBhfZjpXlD7foRG
	Ck3H0xDtkvSnM2054KTLyDoXwKSsEKGbjS
X-Google-Smtp-Source: AGHT+IH3omCAPnPqMSlE/w4NfKsURztlLqDcpu0KEUWrA8L4wqQkzXWKro8N8xI6JdXJ5F5E/NbzZSTIRbnWhqz4Opg=
X-Received: by 2002:a17:906:c105:b0:ad2:2d75:d7fb with SMTP id
 a640c23a62f3a-adb36c1863emr981747766b.55.1748805890498; Sun, 01 Jun 2025
 12:24:50 -0700 (PDT)
MIME-Version: 1.0
References: <010101972bc6d2ab-e0d63232-7a41-4ecf-8be0-0aa2b6c01778-000000@us-west-2.amazonses.com>
In-Reply-To: <010101972bc6d2ab-e0d63232-7a41-4ecf-8be0-0aa2b6c01778-000000@us-west-2.amazonses.com>
From: Tim Orling <tim.orling@konsulko.com>
Date: Sun, 1 Jun 2025 12:24:39 -0700
X-Gm-Features: AX0GCFs_6LTDalfEl4aPp7mR_5t-NsmbEzeKXNnqIycOGZ7bXHSuD8d5LO91gk0
Message-ID: <CAOyo-855DeYgf4PHGAHCjTOs=oNvm-Xfu8p2hYLCcw4YzKQECw@mail.gmail.com>
Subject: Re: [AUH] python3-zipp: upgrading to 3.22.0 FAILED
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e277eb06368799ce"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 19:24:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217676

--000000000000e277eb06368799ce
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This upgrade now requires 'coherent.licensed' [1] (which sounds like it
compares to licenses at "build time", but might be trying to pull licenses
if they aren't already downloaded [2]) and that in turn requires
'coherent.build' [3] yet another PEP-517 backend,

[1] https://github.com/coherent-oss/coherent.licensed
[2] https://github.com/pypa/setuptools/issues/5002
[3] https://github.com/coherent-oss/coherent.build

On Sun, Jun 1, 2025 at 6:55=E2=80=AFAM <auh@yoctoproject.org> wrote:

> Hello,
>
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe(s) *python3-zipp* to
> *3.22.0* has Failed(do_compile).
>
> Detailed error information:
>
> do_compile failed
>
>
>
> Next steps:
>     - apply the patch: git am 0001-python3-zipp-upgrade-3.21.0-3.22.0.pat=
ch
>     - check the changes to upstream patches and summarize them in the
> commit message,
>     - compile an image that contains the package
>     - perform some basic sanity tests
>     - amend the patch and sign it off: git commit -s --reset-author --ame=
nd
>     - send it to the appropriate mailing list
>
> Alternatively, if you believe the recipe should not be upgraded at this
> time,
> you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
> automatic upgrades would no longer be attempted.
>
> Please review the attached files for further information and build/update
> failures.
> Any problem please file a bug at
> https://bugzilla.yoctoproject.org/enter_bug.cgi?product=3DAutomated%20Upd=
ate%20Handler
>
> Regards,
> The Upgrade Helper
>
> -- >8 --
> From 8b743d1761cfed54e01e67964ddaaa863278789f Mon Sep 17 00:00:00 2001
> From: Upgrade Helper <auh@yoctoproject.org>
> Date: Sun, 1 Jun 2025 10:13:48 +0000
> Subject: [PATCH] python3-zipp: upgrade 3.21.0 -> 3.22.0
>
> ---
>  ...-zipp_3.21.0.bb =3D> python3-zipp_3.22.0.bb} | 51 ++++++++++++++++++-
>  1 file changed, 49 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/python/{python3-zipp_3.21.0.bb =3D>
> python3-zipp_3.22.0.bb} (10%)
>
> diff --git a/meta/recipes-devtools/python/python3-zipp_3.21.0.bb
> b/meta/recipes-devtools/python/python3-zipp_3.22.0.bb
> similarity index 10%
> rename from meta/recipes-devtools/python/python3-zipp_3.21.0.bb
> rename to meta/recipes-devtools/python/python3-zipp_3.22.0.bb
> index 135a1ae533..da96a041da 100644
> --- a/meta/recipes-devtools/python/python3-zipp_3.21.0.bb
> +++ b/meta/recipes-devtools/python/python3-zipp_3.22.0.bb
> @@ -1,9 +1,56 @@
> +# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool
> upgrade'.
> +# The following is the difference between the old and the new license
> text.
> +# Please update the LICENSE value if needed, and summarize the changes i=
n
> +# the commit message via 'License-Update:' tag.
> +# (example: 'License-Update: copyright years updated.')
> +#
> +# The changes:
> +#
> +# --- LICENSE
> +# +++ LICENSE
> +# @@ -1,17 +1,18 @@
> +# -Permission is hereby granted, free of charge, to any person obtaining
> a copy
> +# -of this software and associated documentation files (the "Software"),
> to
> +# -deal in the Software without restriction, including without limitatio=
n
> the
> +# -rights to use, copy, modify, merge, publish, distribute, sublicense,
> and/or
> +# -sell copies of the Software, and to permit persons to whom the
> Software is
> +# -furnished to do so, subject to the following conditions:
> +# +MIT License
> +#
> +# -The above copyright notice and this permission notice shall be
> included in
> +# -all copies or substantial portions of the Software.
> +# +Copyright (c) 2025 <copyright holders>
> +#
> +# -THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR
> +# -IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> +# -FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
> SHALL THE
> +# -AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHE=
R
> +# -LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG
> +# -FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> DEALINGS
> +# -IN THE SOFTWARE.
> +# +Permission is hereby granted, free of charge, to any person obtaining
> a copy of this software and
> +# +associated documentation files (the "Software"), to deal in the
> Software without restriction, including
> +# +without limitation the rights to use, copy, modify, merge, publish,
> distribute, sublicense, and/or sell
> +# +copies of the Software, and to permit persons to whom the Software is
> furnished to do so, subject to the
> +# +following conditions:
> +# +
> +# +The above copyright notice and this permission notice shall be
> included in all copies or substantial
> +# +portions of the Software.
> +# +
> +# +THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR IMPLIED, INCLUDING BUT NOT
> +# +LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULA=
R
> PURPOSE AND NONINFRINGEMENT. IN NO
> +# +EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
> DAMAGES OR OTHER LIABILITY, WHETHER
> +# +IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR
> IN CONNECTION WITH THE SOFTWARE OR THE
> +# +USE OR OTHER DEALINGS IN THE SOFTWARE.
> +#
> +#
> +
>  SUMMARY =3D "Backport of pathlib-compatible object wrapper for zip files=
"
>  HOMEPAGE =3D "https://github.com/jaraco/zipp"
>  LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D141643e11c48898150daa83802dbc=
65f"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1aeae65f25a15b1e46d4381f2f094=
e0a"
>
> -SRC_URI[sha256sum] =3D
> "2c9958f6430a2040341a52eb608ed6dd93ef4392e02ffe219417c1b28b5dd1f4"
> +SRC_URI[sha256sum] =3D
> "dd2f28c3ce4bc67507bfd3781d21b7bb2be31103b51a4553ad7d90b84e57ace5"
>
>  DEPENDS +=3D "python3-setuptools-scm-native"
>
> --
> 2.47.1
>
>

--000000000000e277eb06368799ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This upgrade now requires &#39;coherent.licensed&#39; [1] =
(which sounds like it compares to licenses at &quot;build time&quot;, but m=
ight be trying to pull licenses if they aren&#39;t already downloaded [2]) =
and that in turn requires &#39;coherent.build&#39; [3] yet another PEP-517 =
backend,<div><br></div><div>[1]=C2=A0<a href=3D"https://github.com/coherent=
-oss/coherent.licensed">https://github.com/coherent-oss/coherent.licensed</=
a></div><div>[2]=C2=A0<a href=3D"https://github.com/pypa/setuptools/issues/=
5002">https://github.com/pypa/setuptools/issues/5002</a></div><div>[3]=C2=
=A0<a href=3D"https://github.com/coherent-oss/coherent.build">https://githu=
b.com/coherent-oss/coherent.build</a></div></div><br><div class=3D"gmail_qu=
ote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Ju=
n 1, 2025 at 6:55=E2=80=AFAM &lt;<a href=3D"mailto:auh@yoctoproject.org">au=
h@yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Hello,<br>
<br>
this email is a notification from the Auto Upgrade Helper<br>
that the automatic attempt to upgrade the recipe(s) *python3-zipp* to *3.22=
.0* has Failed(do_compile).<br>
<br>
Detailed error information:<br>
<br>
do_compile failed<br>
<br>
<br>
<br>
Next steps:<br>
=C2=A0 =C2=A0 - apply the patch: git am 0001-python3-zipp-upgrade-3.21.0-3.=
22.0.patch<br>
=C2=A0 =C2=A0 - check the changes to upstream patches and summarize them in=
 the commit message,<br>
=C2=A0 =C2=A0 - compile an image that contains the package<br>
=C2=A0 =C2=A0 - perform some basic sanity tests<br>
=C2=A0 =C2=A0 - amend the patch and sign it off: git commit -s --reset-auth=
or --amend<br>
=C2=A0 =C2=A0 - send it to the appropriate mailing list<br>
<br>
Alternatively, if you believe the recipe should not be upgraded at this tim=
e,<br>
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that<br>
automatic upgrades would no longer be attempted.<br>
<br>
Please review the attached files for further information and build/update f=
ailures.<br>
Any problem please file a bug at <a href=3D"https://bugzilla.yoctoproject.o=
rg/enter_bug.cgi?product=3DAutomated%20Update%20Handler" rel=3D"noreferrer"=
 target=3D"_blank">https://bugzilla.yoctoproject.org/enter_bug.cgi?product=
=3DAutomated%20Update%20Handler</a><br>
<br>
Regards,<br>
The Upgrade Helper<br>
<br>
-- &gt;8 --<br>
From 8b743d1761cfed54e01e67964ddaaa863278789f Mon Sep 17 00:00:00 2001<br>
From: Upgrade Helper &lt;<a href=3D"mailto:auh@yoctoproject.org" target=3D"=
_blank">auh@yoctoproject.org</a>&gt;<br>
Date: Sun, 1 Jun 2025 10:13:48 +0000<br>
Subject: [PATCH] python3-zipp: upgrade 3.21.0 -&gt; 3.22.0<br>
<br>
---<br>
=C2=A0...-<a href=3D"http://zipp_3.21.0.bb" rel=3D"noreferrer" target=3D"_b=
lank">zipp_3.21.0.bb</a> =3D&gt; <a href=3D"http://python3-zipp_3.22.0.bb" =
rel=3D"noreferrer" target=3D"_blank">python3-zipp_3.22.0.bb</a>} | 51 +++++=
+++++++++++++-<br>
=C2=A01 file changed, 49 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/python/{<a href=3D"http://python3-zipp_3=
.21.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-zipp_3.21.0.bb</a> =
=3D&gt; <a href=3D"http://python3-zipp_3.22.0.bb" rel=3D"noreferrer" target=
=3D"_blank">python3-zipp_3.22.0.bb</a>} (10%)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-zipp_3.=
21.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-zipp_3.21.0.bb</a> b/=
meta/recipes-devtools/python/<a href=3D"http://python3-zipp_3.22.0.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-zipp_3.22.0.bb</a><br>
similarity index 10%<br>
rename from meta/recipes-devtools/python/<a href=3D"http://python3-zipp_3.2=
1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-zipp_3.21.0.bb</a><br>
rename to meta/recipes-devtools/python/<a href=3D"http://python3-zipp_3.22.=
0.bb" rel=3D"noreferrer" target=3D"_blank">python3-zipp_3.22.0.bb</a><br>
index 135a1ae533..da96a041da 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-zipp_3.21.0.bb=
" rel=3D"noreferrer" target=3D"_blank">python3-zipp_3.21.0.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-zipp_3.22.0.bb=
" rel=3D"noreferrer" target=3D"_blank">python3-zipp_3.22.0.bb</a><br>
@@ -1,9 +1,56 @@<br>
+# FIXME: the LIC_FILES_CHKSUM values have been updated by &#39;devtool upg=
rade&#39;.<br>
+# The following is the difference between the old and the new license text=
.<br>
+# Please update the LICENSE value if needed, and summarize the changes in<=
br>
+# the commit message via &#39;License-Update:&#39; tag.<br>
+# (example: &#39;License-Update: copyright years updated.&#39;)<br>
+#<br>
+# The changes:<br>
+#<br>
+# --- LICENSE<br>
+# +++ LICENSE<br>
+# @@ -1,17 +1,18 @@<br>
+# -Permission is hereby granted, free of charge, to any person obtaining a=
 copy<br>
+# -of this software and associated documentation files (the &quot;Software=
&quot;), to<br>
+# -deal in the Software without restriction, including without limitation =
the<br>
+# -rights to use, copy, modify, merge, publish, distribute, sublicense, an=
d/or<br>
+# -sell copies of the Software, and to permit persons to whom the Software=
 is<br>
+# -furnished to do so, subject to the following conditions:<br>
+# +MIT License<br>
+#=C2=A0 <br>
+# -The above copyright notice and this permission notice shall be included=
 in<br>
+# -all copies or substantial portions of the Software.<br>
+# +Copyright (c) 2025 &lt;copyright holders&gt;<br>
+#=C2=A0 <br>
+# -THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY KIN=
D, EXPRESS OR<br>
+# -IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY=
,<br>
+# -FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL=
 THE<br>
+# -AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER<=
br>
+# -LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING=
<br>
+# -FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEA=
LINGS<br>
+# -IN THE SOFTWARE.<br>
+# +Permission is hereby granted, free of charge, to any person obtaining a=
 copy of this software and<br>
+# +associated documentation files (the &quot;Software&quot;), to deal in t=
he Software without restriction, including<br>
+# +without limitation the rights to use, copy, modify, merge, publish, dis=
tribute, sublicense, and/or sell<br>
+# +copies of the Software, and to permit persons to whom the Software is f=
urnished to do so, subject to the<br>
+# +following conditions:<br>
+# +<br>
+# +The above copyright notice and this permission notice shall be included=
 in all copies or substantial<br>
+# +portions of the Software.<br>
+# +<br>
+# +THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY KIN=
D, EXPRESS OR IMPLIED, INCLUDING BUT NOT<br>
+# +LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR =
PURPOSE AND NONINFRINGEMENT. IN NO<br>
+# +EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, D=
AMAGES OR OTHER LIABILITY, WHETHER<br>
+# +IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN=
 CONNECTION WITH THE SOFTWARE OR THE<br>
+# +USE OR OTHER DEALINGS IN THE SOFTWARE.<br>
+# <br>
+#<br>
+<br>
=C2=A0SUMMARY =3D &quot;Backport of pathlib-compatible object wrapper for z=
ip files&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://github.com/jaraco/zipp" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/jaraco/zipp</a>&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D141643e11c48898150daa83802=
dbc65f&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D1aeae65f25a15b1e46d4381f2f=
094e0a&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;2c9958f6430a2040341a52eb608ed6dd93ef4392e02ff=
e219417c1b28b5dd1f4&quot;<br>
+SRC_URI[sha256sum] =3D &quot;dd2f28c3ce4bc67507bfd3781d21b7bb2be31103b51a4=
553ad7d90b84e57ace5&quot;<br>
<br>
=C2=A0DEPENDS +=3D &quot;python3-setuptools-scm-native&quot;<br>
<br>
-- <br>
2.47.1<br>
<br>
</blockquote></div>

--000000000000e277eb06368799ce--

