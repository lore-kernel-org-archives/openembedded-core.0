Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web12.148861.1598069636239094752
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2020 21:13:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=N5aYhND9;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: kergoth@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id k25so3232749edj.13
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2020 21:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+0u9anrvvV9ClfHTYXbxWx+zCnBRhN1xrvXtxufH+GU=;
        b=N5aYhND9YFj6xSQCQQsaPB72ooVfVwWNgaYbPxCBVi9KkDQEWaOhZuIK+rsCSL4/gY
         yiPlorlh7dKL66Ft2uz5uaYoj3RCoCgv+zKO7opaE9b3qj+84YfxiVOZ2yTD0vY2y+Fl
         kyWKgJUYnJMWln9UJB9AIlha21k734A3VkvT742AK7oipun6LwivasEnP/kmecUj+MxD
         VmWQQZ2t9lNMfc0fgIoB5UBK2vfofukoYVaYhdDx9i86b9FOStTnCVbo4JXYuAPFHAKw
         IVppFTlf8wp0ng7CRBxe1i9koQfvVm3mdd0u81USrd/Hg8rJFY7sBbXwKxlO7m02QRcO
         /lNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+0u9anrvvV9ClfHTYXbxWx+zCnBRhN1xrvXtxufH+GU=;
        b=eAydWaWbAVfbY4kLiSSatAG2+WQPRqQ1ST4mMPEYzSgsOwJ4ZWK8D8MbzzqxLpVcIe
         /njB+CMYP8yLkTCvwtSR4oAPhPbrdTYzT0zKWwSBEwN/9gLIs31J7z97xy1MYASisJMB
         ZCIexQBogNr/MGxuczqWEERP58MK44kmuGRfOue64q7oUeYVVXcfEYDQth2dtnfndFbv
         067YfQnmRYRon5GtiMkRWEOlEdLftWs7oiDlGfpc/arDuaXrgo9vzCNXfZVrxlQ5THNo
         drgC+S4r7kWED43eAujw9uyGsxSF/IMDqqFdpR1TaOTd4Asuq1yO5JPopgJcsa+1aDnA
         +a/A==
X-Gm-Message-State: AOAM531tLTVGZIAsaZxl+XbovYLC19Ho2OVLuudTbzamoUuTChdsJEvX
	F9XeLOWO9pBx4s/88wQPd7Ki70lNVUYyJ2oQ6ec=
X-Google-Smtp-Source: ABdhPJwOxq9RoM9b2mlPdvwMxm7aRttY2nLhwGHI8RyvkoHdx/UxMB8DNXttN7jqZl7KUQz+Lej8EPa4uz/9infJ0D8=
X-Received: by 2002:aa7:d9d0:: with SMTP id v16mr6016720eds.137.1598069634434;
 Fri, 21 Aug 2020 21:13:54 -0700 (PDT)
MIME-Version: 1.0
References: <20191211164820.26588-1-pkj@axis.com> <20200820223503.GM17660@denix.org>
In-Reply-To: <20200820223503.GM17660@denix.org>
From: "Christopher Larson" <kergoth@gmail.com>
Date: Fri, 21 Aug 2020 21:13:43 -0700
Message-ID: <CABcZAN=WmvJGmAG8fsJOOoSDB=+jjDFMJQ0Up7_Li_Nssd2UtA@mail.gmail.com>
Subject: Re: [OE-core] [PATCHv3 1/8] license.bbclass: Introduce AVAILABLE_LICENSES that lists all licenses
To: Denys Dmytriyenko <denis@denix.org>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, akuster808@gmail.com, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e30d3805ad6f94fe"

--000000000000e30d3805ad6f94fe
Content-Type: text/plain; charset="UTF-8"

This actually also results in checksums changing for recipes that inherit
license and call incompatible_license_contains() when adding/removing
layers that add to the license path, such as lvm2.

On Thu, Aug 20, 2020 at 3:35 PM Denys Dmytriyenko <denis@denix.org> wrote:

> This actually fails yocto-check-layer script for Yocto compliance
> checking, when a layer provides own licenses via LICENSE_PATH
> (in layer.conf - LICENSE_PATH += "${LAYERDIR}/licenses"):
>
> Variable AVAILABLE_LICENSES value changed:
> ...
>
> Is there a new way to provide additional licenses from a layer or
> should the yocto-check-layer script be modified to accomodate
> (i.e. ignore) this change?
>
> --
> Denys
>
>
> On Wed, Dec 11, 2019 at 05:48:13PM +0100, Peter Kjellerstedt wrote:
> > Previously, there was SRC_DISTRIBUTE_LICENSES, an undocumented
> > variable that contained a static list of licenses. It was used by
> > expand_wildcard_licenses() to expand any wildcards used in, e.g.,
> > INCOMPATIBLE_LICENSE. However, since this static list of licenses has
> > not been kept up-to-date, many licenses were missing, with the result
> > that if one tried to use any of those licenses with a wildcard, no
> > licenses would be found, effectively ignoring that they should be
> > marked as incompatible.
> >
> > This introduces a new (documented) variable, AVAILABLE_LICENSES, that
> > is automatically updated to contain all licenses found in any
> > directories specified by ${COMMON_LICENSE_DIR} and ${LICENSE_PATH},
> > and uses it instead of SRC_DISTRIBUTE_LICENSES when expanding
> > wildcards.
> >
> > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > ---
> >
> > PATCHv2: Correct spelling of 'available'.
> >
> >  meta/classes/license.bbclass                  | 27 ++++++++++++++++---
> >  meta/conf/documentation.conf                  |  1 +
> >  .../oeqa/selftest/cases/incompatible_lic.py   |  6 ++---
> >  3 files changed, 27 insertions(+), 7 deletions(-)
> >
> > diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> > index 648a4d7892..c388740003 100644
> > --- a/meta/classes/license.bbclass
> > +++ b/meta/classes/license.bbclass
> > @@ -252,7 +252,7 @@ def canonical_license(d, license):
> >      """
> >      Return the canonical (SPDX) form of the license if available (so
> GPLv3
> >      becomes GPL-3.0), for the license named 'X+', return canonical form
> of
> > -    'X' if availabel and the tailing '+' (so GPLv3+ becomes GPL-3.0+),
> > +    'X' if available and the tailing '+' (so GPLv3+ becomes GPL-3.0+),
> >      or the passed license if there is no canonical form.
> >      """
> >      lic = d.getVarFlag('SPDXLICENSEMAP', license) or ""
> > @@ -262,10 +262,29 @@ def canonical_license(d, license):
> >              lic += '+'
> >      return lic or license
> >
> > +def available_licenses(d):
> > +    """
> > +    Return the available licenses by searching the directories
> specified by
> > +    COMMON_LICENSE_DIR and LICENSE_PATH.
> > +    """
> > +    lic_dirs = ((d.getVar('COMMON_LICENSE_DIR') or '') + ' ' +
> > +                (d.getVar('LICENSE_PATH') or '')).split()
> > +
> > +    licenses = []
> > +    for lic_dir in lic_dirs:
> > +        licenses += os.listdir(lic_dir)
> > +
> > +    licenses = sorted(licenses)
> > +    return licenses
> > +
> > +# Only determine the list of all available licenses once. This assumes
> that any
> > +# additions to LICENSE_PATH have been done before this file is parsed.
> > +AVAILABLE_LICENSES := "${@' '.join(available_licenses(d))}"
> > +
> >  def expand_wildcard_licenses(d, wildcard_licenses):
> >      """
> > -    Return actual spdx format license names if wildcard used. We expand
> > -    wildcards from SPDXLICENSEMAP flags and SRC_DISTRIBUTE_LICENSES
> values.
> > +    Return actual spdx format license names if wildcards are used. We
> expand
> > +    wildcards from SPDXLICENSEMAP flags and AVAILABLE_LICENSES.
> >      """
> >      import fnmatch
> >      licenses = wildcard_licenses[:]
> > @@ -274,7 +293,7 @@ def expand_wildcard_licenses(d, wildcard_licenses):
> >          spdxflags = fnmatch.filter(spdxmapkeys, wld_lic)
> >          licenses += [d.getVarFlag('SPDXLICENSEMAP', flag) for flag in
> spdxflags]
> >
> > -    spdx_lics = (d.getVar('SRC_DISTRIBUTE_LICENSES', False) or
> '').split()
> > +    spdx_lics = d.getVar('AVAILABLE_LICENSES').split()
> >      for wld_lic in wildcard_licenses:
> >          licenses += fnmatch.filter(spdx_lics, wld_lic)
> >
> > diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
> > index fca36f3cf6..0b21d1f63e 100644
> > --- a/meta/conf/documentation.conf
> > +++ b/meta/conf/documentation.conf
> > @@ -69,6 +69,7 @@ ASSUME_SHLIBS[doc] = "List of shlib:package[_version]
> mappings. Useful for lib p
> >  AUTHOR[doc] = "Email address used to contact the original author(s) in
> order to send patches and forward bugs."
> >  AUTO_SYSLINUXMENU[doc] = "Enables creating an automatic menu for the
> syslinux bootloader."
> >  AUTOREV[doc] = "When SRCREV is set to the value of this variable, it
> specifies to use the latest source revision in the repository."
> > +AVAILABLE_LICENSES[doc] = "List of licenses found in the directories
> specified by COMMON_LICENSE_DIR and LICENSE_PATH."
> >
> >  #B
> >
> > diff --git a/meta/lib/oeqa/selftest/cases/incompatible_lic.py
> b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
> > index 904b5b4094..ad878571b5 100644
> > --- a/meta/lib/oeqa/selftest/cases/incompatible_lic.py
> > +++ b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
> > @@ -12,12 +12,12 @@ class IncompatibleLicenseTests(OESelftestTestCase):
> >          if error_msg not in result.output:
> >              raise AssertionError(result.output)
> >
> > -    # Verify that a package with an SPDX license (from
> SRC_DISTRIBUTE_LICENSES)
> > +    # Verify that a package with an SPDX license (from
> AVAILABLE_LICENSES)
> >      # cannot be built when INCOMPATIBLE_LICENSE contains this SPDX
> license
> >      def test_incompatible_spdx_license(self):
> >          self.lic_test('incompatible-license', 'GPL-3.0', 'GPL-3.0')
> >
> > -    # Verify that a package with an SPDX license (from
> SRC_DISTRIBUTE_LICENSES)
> > +    # Verify that a package with an SPDX license (from
> AVAILABLE_LICENSES)
> >      # cannot be built when INCOMPATIBLE_LICENSE contains an alias (in
> >      # SPDXLICENSEMAP) of this SPDX license
> >      def test_incompatible_alias_spdx_license(self):
> > @@ -35,7 +35,7 @@ class IncompatibleLicenseTests(OESelftestTestCase):
> >          self.lic_test('incompatible-license-alias', 'GPLv3', 'GPLv3')
> >
> >      # Verify that a package with a non-SPDX license (neither in
> > -    # SRC_DISTRIBUTE_LICENSES nor in SPDXLICENSEMAP) cannot be built
> when
> > +    # AVAILABLE_LICENSES nor in SPDXLICENSEMAP) cannot be built when
> >      # INCOMPATIBLE_LICENSE contains this license
> >      def test_incompatible_nonspdx_license(self):
> >          self.lic_test('incompatible-nonspdx-license', 'FooLicense',
> 'FooLicense')
> > --
> > 2.21.0
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
>


-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--000000000000e30d3805ad6f94fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This actually also results in checksums changing for recip=
es that inherit license and call incompatible_license_contains() when addin=
g/removing layers that add to the license path, such as lvm2.</div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 20=
, 2020 at 3:35 PM Denys Dmytriyenko &lt;<a href=3D"mailto:denis@denix.org">=
denis@denix.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:so=
lid;border-left-color:rgb(204,204,204);padding-left:1ex">This actually fail=
s yocto-check-layer script for Yocto compliance <br>
checking, when a layer provides own licenses via LICENSE_PATH <br>
(in layer.conf - LICENSE_PATH +=3D &quot;${LAYERDIR}/licenses&quot;):<br>
<br>
Variable AVAILABLE_LICENSES value changed:<br>
...<br>
<br>
Is there a new way to provide additional licenses from a layer or <br>
should the yocto-check-layer script be modified to accomodate <br>
(i.e. ignore) this change?<br>
<br>
-- <br>
Denys<br>
<br>
<br>
On Wed, Dec 11, 2019 at 05:48:13PM +0100, Peter Kjellerstedt wrote:<br>
&gt; Previously, there was SRC_DISTRIBUTE_LICENSES, an undocumented<br>
&gt; variable that contained a static list of licenses. It was used by<br>
&gt; expand_wildcard_licenses() to expand any wildcards used in, e.g.,<br>
&gt; INCOMPATIBLE_LICENSE. However, since this static list of licenses has=
<br>
&gt; not been kept up-to-date, many licenses were missing, with the result=
<br>
&gt; that if one tried to use any of those licenses with a wildcard, no<br=
>
&gt; licenses would be found, effectively ignoring that they should be<br>
&gt; marked as incompatible.<br>
&gt; <br>
&gt; This introduces a new (documented) variable, AVAILABLE_LICENSES, that=
<br>
&gt; is automatically updated to contain all licenses found in any<br>
&gt; directories specified by ${COMMON_LICENSE_DIR} and ${LICENSE_PATH},<b=
r>
&gt; and uses it instead of SRC_DISTRIBUTE_LICENSES when expanding<br>
&gt; wildcards.<br>
&gt; <br>
&gt; Signed-off-by: Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjeller=
stedt@axis.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;<br>
&gt; ---<br>
&gt; <br>
&gt; PATCHv2: Correct spelling of &#39;available&#39;.<br>
&gt; <br>
&gt;=C2=A0 meta/classes/license.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 27 ++++++++++++++++---<br>
&gt;=C2=A0 meta/conf/documentation.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 .../oeqa/selftest/cases/incompatible_lic.py=C2=A0 =C2=A0|=C2=A0=
 6 ++---<br>
&gt;=C2=A0 3 files changed, 27 insertions(+), 7 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbcl=
ass<br>
&gt; index 648a4d7892..c388740003 100644<br>
&gt; --- a/meta/classes/license.bbclass<br>
&gt; +++ b/meta/classes/license.bbclass<br>
&gt; @@ -252,7 +252,7 @@ def canonical_license(d, license):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Return the canonical (SPDX) form of the license i=
f available (so GPLv3<br>
&gt;=C2=A0 =C2=A0 =C2=A0 becomes GPL-3.0), for the license named &#39;X+&#=
39;, return canonical form of<br>
&gt; -=C2=A0 =C2=A0 &#39;X&#39; if availabel and the tailing &#39;+&#39; (=
so GPLv3+ becomes GPL-3.0+), <br>
&gt; +=C2=A0 =C2=A0 &#39;X&#39; if available and the tailing &#39;+&#39; (=
so GPLv3+ becomes GPL-3.0+),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 or the passed license if there is no canonical fo=
rm.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 lic =3D d.getVarFlag(&#39;SPDXLICENSEMAP&#39;, li=
cense) or &quot;&quot;<br>
&gt; @@ -262,10 +262,29 @@ def canonical_license(d, license):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lic +=3D &#39;+&#39;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 return lic or license<br>
&gt;=C2=A0 <br>
&gt; +def available_licenses(d):<br>
&gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 Return the available licenses by searching the directo=
ries specified by<br>
&gt; +=C2=A0 =C2=A0 COMMON_LICENSE_DIR and LICENSE_PATH.<br>
&gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 lic_dirs =3D ((d.getVar(&#39;COMMON_LICENSE_DIR&#39;) =
or &#39;&#39;) + &#39; &#39; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (d.getVar(&#=
39;LICENSE_PATH&#39;) or &#39;&#39;)).split()<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 licenses =3D []<br>
&gt; +=C2=A0 =C2=A0 for lic_dir in lic_dirs:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 licenses +=3D os.listdir(lic_dir)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 licenses =3D sorted(licenses)<br>
&gt; +=C2=A0 =C2=A0 return licenses<br>
&gt; +<br>
&gt; +# Only determine the list of all available licenses once. This assum=
es that any<br>
&gt; +# additions to LICENSE_PATH have been done before this file is parse=
d.<br>
&gt; +AVAILABLE_LICENSES :=3D &quot;${@&#39; &#39;.join(available_licenses=
(d))}&quot;<br>
&gt; +<br>
&gt;=C2=A0 def expand_wildcard_licenses(d, wildcard_licenses):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; -=C2=A0 =C2=A0 Return actual spdx format license names if wildcard us=
ed. We expand<br>
&gt; -=C2=A0 =C2=A0 wildcards from SPDXLICENSEMAP flags and SRC_DISTRIBUTE=
_LICENSES values.<br>
&gt; +=C2=A0 =C2=A0 Return actual spdx format license names if wildcards a=
re used. We expand<br>
&gt; +=C2=A0 =C2=A0 wildcards from SPDXLICENSEMAP flags and AVAILABLE_LICE=
NSES.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 import fnmatch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 licenses =3D wildcard_licenses[:]<br>
&gt; @@ -274,7 +293,7 @@ def expand_wildcard_licenses(d, wildcard_licenses=
):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spdxflags =3D fnmatch.filter(spdxma=
pkeys, wld_lic)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 licenses +=3D [d.getVarFlag(&#39;SP=
DXLICENSEMAP&#39;, flag) for flag in spdxflags]<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 spdx_lics =3D (d.getVar(&#39;SRC_DISTRIBUTE_LICENSES&#=
39;, False) or &#39;&#39;).split()<br>
&gt; +=C2=A0 =C2=A0 spdx_lics =3D d.getVar(&#39;AVAILABLE_LICENSES&#39;).s=
plit()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 for wld_lic in wildcard_licenses:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 licenses +=3D fnmatch.filter(spdx_l=
ics, wld_lic)<br>
&gt;=C2=A0 <br>
&gt; diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.c=
onf<br>
&gt; index fca36f3cf6..0b21d1f63e 100644<br>
&gt; --- a/meta/conf/documentation.conf<br>
&gt; +++ b/meta/conf/documentation.conf<br>
&gt; @@ -69,6 +69,7 @@ ASSUME_SHLIBS[doc] =3D &quot;List of shlib:package[=
_version] mappings. Useful for lib p<br>
&gt;=C2=A0 AUTHOR[doc] =3D &quot;Email address used to contact the origina=
l author(s) in order to send patches and forward bugs.&quot;<br>
&gt;=C2=A0 AUTO_SYSLINUXMENU[doc] =3D &quot;Enables creating an automatic =
menu for the syslinux bootloader.&quot;<br>
&gt;=C2=A0 AUTOREV[doc] =3D &quot;When SRCREV is set to the value of this =
variable, it specifies to use the latest source revision in the repository.=
&quot;<br>
&gt; +AVAILABLE_LICENSES[doc] =3D &quot;List of licenses found in the dire=
ctories specified by COMMON_LICENSE_DIR and LICENSE_PATH.&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #B<br>
&gt;=C2=A0 <br>
&gt; diff --git a/meta/lib/oeqa/selftest/cases/incompatible_lic.py b/meta/=
lib/oeqa/selftest/cases/incompatible_lic.py<br>
&gt; index 904b5b4094..ad878571b5 100644<br>
&gt; --- a/meta/lib/oeqa/selftest/cases/incompatible_lic.py<br>
&gt; +++ b/meta/lib/oeqa/selftest/cases/incompatible_lic.py<br>
&gt; @@ -12,12 +12,12 @@ class IncompatibleLicenseTests(OESelftestTestCase=
):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if error_msg not in result.output:<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise AssertionError(=
result.output)<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 # Verify that a package with an SPDX license (from SRC=
_DISTRIBUTE_LICENSES)<br>
&gt; +=C2=A0 =C2=A0 # Verify that a package with an SPDX license (from AVA=
ILABLE_LICENSES)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # cannot be built when INCOMPATIBLE_LICENSE conta=
ins this SPDX license<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def test_incompatible_spdx_license(self):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.lic_test(&#39;incompatible-lic=
ense&#39;, &#39;GPL-3.0&#39;, &#39;GPL-3.0&#39;)<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 # Verify that a package with an SPDX license (from SRC=
_DISTRIBUTE_LICENSES)<br>
&gt; +=C2=A0 =C2=A0 # Verify that a package with an SPDX license (from AVA=
ILABLE_LICENSES)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # cannot be built when INCOMPATIBLE_LICENSE conta=
ins an alias (in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # SPDXLICENSEMAP) of this SPDX license<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def test_incompatible_alias_spdx_license(self):<b=
r>
&gt; @@ -35,7 +35,7 @@ class IncompatibleLicenseTests(OESelftestTestCase):=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.lic_test(&#39;incompatible-lic=
ense-alias&#39;, &#39;GPLv3&#39;, &#39;GPLv3&#39;)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 # Verify that a package with a non-SPDX license (=
neither in<br>
&gt; -=C2=A0 =C2=A0 # SRC_DISTRIBUTE_LICENSES nor in SPDXLICENSEMAP) canno=
t be built when<br>
&gt; +=C2=A0 =C2=A0 # AVAILABLE_LICENSES nor in SPDXLICENSEMAP) cannot be =
built when<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # INCOMPATIBLE_LICENSE contains this license<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def test_incompatible_nonspdx_license(self):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.lic_test(&#39;incompatible-non=
spdx-license&#39;, &#39;FooLicense&#39;, &#39;FooLicense&#39;)<br>
&gt; -- <br>
&gt; 2.21.0<br>
&gt; <br>
&gt; -- <br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D=
"_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedde=
d-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/=
mailman/listinfo/openembedded-core</a><br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Christop=
her Larson<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded, =
OpenZaurus<br>Senior Software Engineer, Mentor Graphics</div></div></div></=
div>

--000000000000e30d3805ad6f94fe--
