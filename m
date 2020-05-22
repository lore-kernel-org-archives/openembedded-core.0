Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web10.18468.1590170429974071132
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2020 11:00:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ieee.org header.s=google header.b=GeQpo16g;
 spf=pass (domain: ieee.org, ip: 209.85.208.194, mailfrom: michael.ho@ieee.org)
Received: by mail-lj1-f194.google.com with SMTP id m18so13703714ljo.5
        for <openembedded-core@lists.openembedded.org>; Fri, 22 May 2020 11:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PDx7BgijOmD4q+Ao0LnWa/xi3uQVYt1wOz8zsroas0E=;
        b=GeQpo16gNZ4qEmJOcmhhSI61TT8QrpGQhnpiBnrBVv5kCYKWDvRnjmztszcVBfVVnu
         oC/3gWQDMbrDN5A9Zve8ogQ/oFwfOm8Z0CfYZj6uH92Un0EF3+ScTGw2vfND9TZpI7ht
         cbXcCxcZpPKx7ttTSSrnMoqGVhE5HwXFS3JcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PDx7BgijOmD4q+Ao0LnWa/xi3uQVYt1wOz8zsroas0E=;
        b=j0SUSvMSnYWoA/qYMeBRqzWimMiIon34fymdRh4cxFWEpot+1ShTlsC02Rci3iK1TJ
         Bmi0xsQN22V8TVkWxepaY7gRsGmaLPoXnNSKoD0HEiXGXs38eeh9eQFQ5szPggGV3Xmj
         d9QC0txj4dyEtfwvEkglAI5IWvTQXQ+MqjkrQb6pBXRC0CAbF1ADbs+BX7Z5zlc3GDqG
         izzzcfAitvZF0YS83tHauDDafT2h4p08iVk/IwUka6nl8hn0oDFIa6BDhKtxfUbaRw85
         rIVbhcREuZ9k2UlHn4UrB/BCTRWuUglYm+v12xwrUeArBOvDxyhgeSZbbGCHwatURxPp
         CQDw==
X-Gm-Message-State: AOAM532KaMJTQUVML1M7fQGzk7byW8TMIQtVCgWXl7nXPmAWAKU2mZCu
	teQ7dgfipoiY329QQrMDL/Sa831GMeVRk+gn2T3u2w==
X-Google-Smtp-Source: ABdhPJwHMHs4G13FywjJ86nnyyXoRsHCkMtpO2HgYxd8qLSiQQInlELj02P/Pa3c6OshZh9JPvfyvSvUC7X+4SJ6cL8=
X-Received: by 2002:a2e:9205:: with SMTP id k5mr1674301ljg.241.1590170427936;
 Fri, 22 May 2020 11:00:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200522151335.7918-1-ptsneves@gmail.com> <20200522151335.7918-2-ptsneves@gmail.com>
 <CANNYZj9tpQRb95FX5ch47eH66f8xvr-EybMkmg1UsAxAHwqyfw@mail.gmail.com> <CAJO0J4gz9zz9iZ4EbrPvs7aVjT3Ro1WXhmwsb7izst2m=GLQSg@mail.gmail.com>
In-Reply-To: <CAJO0J4gz9zz9iZ4EbrPvs7aVjT3Ro1WXhmwsb7izst2m=GLQSg@mail.gmail.com>
From: "Michael Ho" <michael.ho@ieee.org>
Date: Fri, 22 May 2020 20:00:17 +0200
Message-ID: <CALpKvHoR5OvUqaDXa0OdxMgpoDKAQNG9NM9pYa=cW9cL1J86TA@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH] 2/2] package_{ipk, deb, rpm}.bbclass: support per package user-defined metadata.
To: Paulo Neve <ptsneves@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000007d7b0805a64067ad"

--0000000000007d7b0805a64067ad
Content-Type: text/plain; charset="UTF-8"

Hi Paulo,

I actually have some patches in my "to send upstream list" to address the
documentation and some sstate-caching bugs with these variables so it's
fresh to me at the moment.
Correct me if I'm wrong but I think this is already available in the code
(applying metadata specific to a certain package in a recipe, that is).

eg.
http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/package_ipk.bbclass
at line 72 sets the local overrides so if PACKAGE_ADD_METADATA_IPK_xxx is
set, it overrides PACKAGE_ADD_METADATA_IPK.

For rpm, see
http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/package_rpm.bbclass#n298
where the recipe wide variable is fetched
http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/package_rpm.bbclass#n338
where the local override is also set
http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/package_rpm.bbclass#n354
where the package specific variables are fetched
http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/package_rpm.bbclass#n436
where the package specific variables are applied to rpm packages

I tested the zip recipe by applying these two lines:
PACKAGE_ADD_METADATA_RPM = "Vendor: None"
PACKAGE_ADD_METADATA_RPM_zip-dbg = "Vendor: Not you!"
and could see differing results in the two rpm files produced.

I think this covers the use case you're showing in your patches already,
what do you think?

Kind regards,
Michael

(sorry if this shows up as a triple email, my mail client wasn't
cooperating).

On Fri, May 22, 2020 at 5:29 PM Paulo Neve <ptsneves@gmail.com> wrote:

> Is ./meta/lib/oeqa/selftest/cases/package.py the right place?
> If yes i can work on it. Note that this functionality is not used
> anywhere in poky and is not documented at all. It just happened to
> exist for a long time and be useful for my case.
>
> On Fri, May 22, 2020 at 5:22 PM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Should there be a test for this functionality? Somewhere in oe-selftest
> perhaps where various package manager features are tested?
> >
> > Alex
> >
> > On Fri, 22 May 2020 at 17:13, Paulo Neve <ptsneves@gmail.com> wrote:
> >>
> >> Up to now the user defined metadata was set recipe wide,
> >> meaning all the packages generated in a recipe where the
> >> variable was set would get the same metadata. That is not
> >> always ideal and is counter to the per package control that
> >> is usually available.
> >>
> >> Keep support for package agnostic metadata but also add option
> >> to add it to a specific option like:
> >> PACKAGE_ADD_METADATA_${PN}_IPK = "mymeta: myvalue"
> >>
> >> Signed-off-by: Paulo Neves <ptsneves@gmail.com>
> >> ---
> >>  meta/classes/package.bbclass     | 4 ++--
> >>  meta/classes/package_deb.bbclass | 2 +-
> >>  meta/classes/package_ipk.bbclass | 2 +-
> >>  meta/classes/package_rpm.bbclass | 5 +++--
> >>  4 files changed, 7 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> >> index 0b5cf47749..1678e0d794 100644
> >> --- a/meta/classes/package.bbclass
> >> +++ b/meta/classes/package.bbclass
> >> @@ -637,9 +637,9 @@ def get_package_mapping (pkg, basepkg, d,
> depversions=None):
> >>
> >>      return pkg
> >>
> >> -def get_package_additional_metadata (pkg_type, d):
> >> +def get_package_additional_metadata (pkg_type, pkg_name, d):
> >>      base_key = "PACKAGE_ADD_METADATA"
> >> -    for key in ("%s_%s" % (base_key, pkg_type.upper()), base_key):
> >> +    for key in ("%s_%s" % (base_key, pkg_type.upper()), "%s_%s_%s" %
> (base_key, pkg_name, pkg_type.upper()), base_key):
> >>          if d.getVar(key, False) is None:
> >>              continue
> >>          d.setVarFlag(key, "type", "list")
> >> diff --git a/meta/classes/package_deb.bbclass
> b/meta/classes/package_deb.bbclass
> >> index 790b26aef2..6ef9c8cb3a 100644
> >> --- a/meta/classes/package_deb.bbclass
> >> +++ b/meta/classes/package_deb.bbclass
> >> @@ -167,7 +167,7 @@ def deb_write_pkg(pkg, d):
> >>
> >>          # more fields
> >>
> >> -        custom_fields_chunk = get_package_additional_metadata("deb",
> localdata)
> >> +        custom_fields_chunk = get_package_additional_metadata("deb",
> pkgname, localdata)
> >>          if custom_fields_chunk:
> >>              ctrlfile.write(custom_fields_chunk)
> >>              ctrlfile.write("\n")
> >> diff --git a/meta/classes/package_ipk.bbclass
> b/meta/classes/package_ipk.bbclass
> >> index c008559e4a..f78cec7a70 100644
> >> --- a/meta/classes/package_ipk.bbclass
> >> +++ b/meta/classes/package_ipk.bbclass
> >> @@ -155,7 +155,7 @@ def ipk_write_pkg(pkg, d):
> >>              else:
> >>                  ctrlfile.write(c % tuple(pullData(fs, localdata)))
> >>
> >> -        custom_fields_chunk = get_package_additional_metadata("ipk",
> localdata)
> >> +        custom_fields_chunk = get_package_additional_metadata("ipk",
> pkgname, localdata)
> >>          if custom_fields_chunk is not None:
> >>              ctrlfile.write(custom_fields_chunk)
> >>              ctrlfile.write("\n")
> >> diff --git a/meta/classes/package_rpm.bbclass
> b/meta/classes/package_rpm.bbclass
> >> index 9145717f98..ab019192da 100644
> >> --- a/meta/classes/package_rpm.bbclass
> >> +++ b/meta/classes/package_rpm.bbclass
> >> @@ -295,7 +295,6 @@ python write_specfile () {
> >>      srcmaintainer  = d.getVar('MAINTAINER')
> >>      srchomepage    = d.getVar('HOMEPAGE')
> >>      srcdescription = d.getVar('DESCRIPTION') or "."
> >> -    srccustomtagschunk = get_package_additional_metadata("rpm", d)
> >>
> >>      srcdepends     = d.getVar('DEPENDS')
> >>      srcrdepends    = []
> >> @@ -333,6 +332,8 @@ python write_specfile () {
> >>          pkgname = localdata.getVar('PKG_%s' % pkg)
> >>          if not pkgname:
> >>              pkgname = pkg
> >> +
> >> +        srccustomtagschunk = get_package_additional_metadata("rpm",
> pkgname, d)
> >>          localdata.setVar('PKG', pkgname)
> >>
> >>          localdata.setVar('OVERRIDES', d.getVar("OVERRIDES", False) +
> ":" + pkg)
> >> @@ -351,7 +352,7 @@ python write_specfile () {
> >>          splitlicense = (localdata.getVar('LICENSE') or "")
> >>          splitsection = (localdata.getVar('SECTION') or "")
> >>          splitdescription = (localdata.getVar('DESCRIPTION') or ".")
> >> -        splitcustomtagschunk = get_package_additional_metadata("rpm",
> localdata)
> >> +        splitcustomtagschunk = get_package_additional_metadata("rpm",
> pkgname, localdata)
> >>
> >>          translate_vers('RDEPENDS', localdata)
> >>          translate_vers('RRECOMMENDS', localdata)
> >> --
> >> 2.20.1
> >>
> >>
> 
>

--0000000000007d7b0805a64067ad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span class=3D"gmail-im"><div>Hi Paulo,</div><div><br></di=
v><div>I actually have some patches in=20
my &quot;to send upstream list&quot; to address the documentation and some=
=
=20
sstate-caching bugs with these variables so it&#39;s fresh to me at the=20
moment.<br></div><div>Correct me if I&#39;m wrong but I think this is=20
already available in the code (applying metadata specific to a certain=20
package in a recipe, that is).</div><div><br></div><div>eg. <a href=3D"htt=
p://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/package_ipk.b=
bclass" target=3D"_blank">http://git.yoctoproject.org/cgit/cgit.cgi/poky/tr=
ee/meta/classes/package_ipk.bbclass</a> at line 72 sets the local overrides=
 so if PACKAGE_ADD_METADATA_IPK_xxx is set, it overrides PACKAGE_ADD_METADA=
TA_IPK.</div><div><br></div><div>For rpm, see <br></div><div><a href=3D"htt=
p://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/package_rpm.b=
bclass#n298" target=3D"_blank">http://git.yoctoproject.org/cgit/cgit.cgi/po=
ky/tree/meta/classes/package_rpm.bbclass#n298</a> where the recipe wide var=
iable is fetched<br></div><div><a href=3D"http://git.yoctoproject.org/cgit/=
cgit.cgi/poky/tree/meta/classes/package_rpm.bbclass#n338" target=3D"_blank"=
>http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/package_r=
pm.bbclass#n338</a> where the local override is also set</div><div><a href=
=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/packa=
ge_rpm.bbclass#n354" target=3D"_blank">http://git.yoctoproject.org/cgit/cgi=
t.cgi/poky/tree/meta/classes/package_rpm.bbclass#n354</a> where the package=
 specific variables are fetched</div><div><a href=3D"http://git.yoctoprojec=
t.org/cgit/cgit.cgi/poky/tree/meta/classes/package_rpm.bbclass#n436" target=
=
=3D"_blank">http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/class=
es/package_rpm.bbclass#n436</a> where the package specific variables are ap=
plied to rpm packages</div><div><br></div><div>I tested the zip recipe by a=
pplying these two lines:</div><div>PACKAGE_ADD_METADATA_RPM =3D &quot;Vendo=
r: None&quot;</div><div>PACKAGE_ADD_METADATA_RPM_zip-dbg =3D &quot;Vendor: =
Not you!&quot;</div><div>and could see differing results in the two rpm fil=
es produced.<br></div><div><br></div><div>I think this covers the use case =
you&#39;re showing in your patches already, what do you think?</div><div><b=
r></div><div>Kind regards,</div><div>Michael</div><div><br></div></span><di=
v>(sorry if this shows up as a triple email, my mail client wasn&#39;t coop=
erating).</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, May 22, 2020 at 5:29 PM Paulo Neve &lt;<a href=3D"=
mailto:ptsneves@gmail.com">ptsneves@gmail.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">Is ./meta/lib/oeqa/selftest/ca=
ses/package.py the right place?<br>
If yes i can work on it. Note that this functionality is not used<br>
anywhere in poky and is not documented at all. It just happened to<br>
exist for a long time and be useful for my case.<br>
<br>
On Fri, May 22, 2020 at 5:22 PM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanav=
in@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Should there be a test for this functionality? Somewhere in oe-selfte=
st perhaps where various package manager features are tested?<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt; On Fri, 22 May 2020 at 17:13, Paulo Neve &lt;<a href=3D"mailto:ptsnev=
es@gmail.com" target=3D"_blank">ptsneves@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Up to now the user defined metadata was set recipe wide,<br>
&gt;&gt; meaning all the packages generated in a recipe where the<br>
&gt;&gt; variable was set would get the same metadata. That is not<br>
&gt;&gt; always ideal and is counter to the per package control that<br>
&gt;&gt; is usually available.<br>
&gt;&gt;<br>
&gt;&gt; Keep support for package agnostic metadata but also add option<br=
>
&gt;&gt; to add it to a specific option like:<br>
&gt;&gt; PACKAGE_ADD_METADATA_${PN}_IPK =3D &quot;mymeta: myvalue&quot;<br=
>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Paulo Neves &lt;<a href=3D"mailto:ptsneves@gmail.c=
om" target=3D"_blank">ptsneves@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 meta/classes/package.bbclass=C2=A0 =C2=A0 =C2=A0| 4 ++--<br=
>
&gt;&gt;=C2=A0 meta/classes/package_deb.bbclass | 2 +-<br>
&gt;&gt;=C2=A0 meta/classes/package_ipk.bbclass | 2 +-<br>
&gt;&gt;=C2=A0 meta/classes/package_rpm.bbclass | 5 +++--<br>
&gt;&gt;=C2=A0 4 files changed, 7 insertions(+), 6 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/classes/package.bbclass b/meta/classes/package.=
bbclass<br>
&gt;&gt; index 0b5cf47749..1678e0d794 100644<br>
&gt;&gt; --- a/meta/classes/package.bbclass<br>
&gt;&gt; +++ b/meta/classes/package.bbclass<br>
&gt;&gt; @@ -637,9 +637,9 @@ def get_package_mapping (pkg, basepkg, d, dep=
versions=3DNone):<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 return pkg<br>
&gt;&gt;<br>
&gt;&gt; -def get_package_additional_metadata (pkg_type, d):<br>
&gt;&gt; +def get_package_additional_metadata (pkg_type, pkg_name, d):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 base_key =3D &quot;PACKAGE_ADD_METADATA&quot;=
<br>
&gt;&gt; -=C2=A0 =C2=A0 for key in (&quot;%s_%s&quot; % (base_key, pkg_typ=
e.upper()), base_key):<br>
&gt;&gt; +=C2=A0 =C2=A0 for key in (&quot;%s_%s&quot; % (base_key, pkg_typ=
e.upper()), &quot;%s_%s_%s&quot; % (base_key, pkg_name, pkg_type.upper()), =
base_key):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if d.getVar(key, False) is None=
:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVarFlag(key, &quot;type&qu=
ot;, &quot;list&quot;)<br>
&gt;&gt; diff --git a/meta/classes/package_deb.bbclass b/meta/classes/pack=
age_deb.bbclass<br>
&gt;&gt; index 790b26aef2..6ef9c8cb3a 100644<br>
&gt;&gt; --- a/meta/classes/package_deb.bbclass<br>
&gt;&gt; +++ b/meta/classes/package_deb.bbclass<br>
&gt;&gt; @@ -167,7 +167,7 @@ def deb_write_pkg(pkg, d):<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # more fields<br>
&gt;&gt;<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 custom_fields_chunk =3D get_package_=
additional_metadata(&quot;deb&quot;, localdata)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 custom_fields_chunk =3D get_package_=
additional_metadata(&quot;deb&quot;, pkgname, localdata)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if custom_fields_chunk:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctrlfile.write(cu=
stom_fields_chunk)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctrlfile.write(&q=
uot;\n&quot;)<br>
&gt;&gt; diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/pack=
age_ipk.bbclass<br>
&gt;&gt; index c008559e4a..f78cec7a70 100644<br>
&gt;&gt; --- a/meta/classes/package_ipk.bbclass<br>
&gt;&gt; +++ b/meta/classes/package_ipk.bbclass<br>
&gt;&gt; @@ -155,7 +155,7 @@ def ipk_write_pkg(pkg, d):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctr=
lfile.write(c % tuple(pullData(fs, localdata)))<br>
&gt;&gt;<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 custom_fields_chunk =3D get_package_=
additional_metadata(&quot;ipk&quot;, localdata)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 custom_fields_chunk =3D get_package_=
additional_metadata(&quot;ipk&quot;, pkgname, localdata)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if custom_fields_chunk is not N=
one:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctrlfile.write(cu=
stom_fields_chunk)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctrlfile.write(&q=
uot;\n&quot;)<br>
&gt;&gt; diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/pack=
age_rpm.bbclass<br>
&gt;&gt; index 9145717f98..ab019192da 100644<br>
&gt;&gt; --- a/meta/classes/package_rpm.bbclass<br>
&gt;&gt; +++ b/meta/classes/package_rpm.bbclass<br>
&gt;&gt; @@ -295,7 +295,6 @@ python write_specfile () {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 srcmaintainer=C2=A0 =3D d.getVar(&#39;MAINTAI=
NER&#39;)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 srchomepage=C2=A0 =C2=A0 =3D d.getVar(&#39;HO=
MEPAGE&#39;)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 srcdescription =3D d.getVar(&#39;DESCRIPTION&=
#39;) or &quot;.&quot;<br>
&gt;&gt; -=C2=A0 =C2=A0 srccustomtagschunk =3D get_package_additional_meta=
data(&quot;rpm&quot;, d)<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 srcdepends=C2=A0 =C2=A0 =C2=A0=3D d.getVar(&#=
39;DEPENDS&#39;)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 srcrdepends=C2=A0 =C2=A0 =3D []<br>
&gt;&gt; @@ -333,6 +332,8 @@ python write_specfile () {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pkgname =3D localdata.getVar(&#=
39;PKG_%s&#39; % pkg)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not pkgname:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pkgname =3D pkg<b=
r>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 srccustomtagschunk =3D get_package_a=
dditional_metadata(&quot;rpm&quot;, pkgname, d)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 localdata.setVar(&#39;PKG&#39;,=
 pkgname)<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 localdata.setVar(&#39;OVERRIDES=
&#39;, d.getVar(&quot;OVERRIDES&quot;, False) + &quot;:&quot; + pkg)<br>
&gt;&gt; @@ -351,7 +352,7 @@ python write_specfile () {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 splitlicense =3D (localdata.get=
Var(&#39;LICENSE&#39;) or &quot;&quot;)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 splitsection =3D (localdata.get=
Var(&#39;SECTION&#39;) or &quot;&quot;)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 splitdescription =3D (localdata=
.getVar(&#39;DESCRIPTION&#39;) or &quot;.&quot;)<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 splitcustomtagschunk =3D get_package=
_additional_metadata(&quot;rpm&quot;, localdata)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 splitcustomtagschunk =3D get_package=
_additional_metadata(&quot;rpm&quot;, pkgname, localdata)<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 translate_vers(&#39;RDEPENDS&#3=
9;, localdata)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 translate_vers(&#39;RRECOMMENDS=
&#39;, localdata)<br>
&gt;&gt; --<br>
&gt;&gt; 2.20.1<br>
&gt;&gt;<br>
&gt;&gt; <br>
<br>
</blockquote></div>

--0000000000007d7b0805a64067ad--
