Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web10.20208.1590175876049280539
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2020 12:31:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ieee.org header.s=google header.b=MU2V9k3R;
 spf=pass (domain: ieee.org, ip: 209.85.208.193, mailfrom: michael.ho@ieee.org)
Received: by mail-lj1-f193.google.com with SMTP id w10so14088252ljo.0
        for <openembedded-core@lists.openembedded.org>; Fri, 22 May 2020 12:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cJX6Ccx83uhSkrwegLsTtqfCEbqlEXdsk1zpVkJqUTA=;
        b=MU2V9k3RjFmLT+Z6MVMR0aro07IaA5kmFa6Vl+7cVgufCicxNnatojWFrIiQwmDjep
         cHPCPtR3aTm1A+NgJXyzFLQ6ygnOsSsP0Vatq892M4E93rEGCuHvW3f1grCI1N/X8r2D
         00HJD7tVe/jiXCOcZLNTYW8iPN8ScGemZv6sw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cJX6Ccx83uhSkrwegLsTtqfCEbqlEXdsk1zpVkJqUTA=;
        b=oS8ZybqQNoy5OLJ9u/ilBvkjO47wJE1xM2Z/SXIxlQB0Qrl44iCA07jZIGcXXxlhJV
         IXINg5KMkTcPNgwJ3NTeObNXEtJ+OQrGfYN9dHu9eZanndXX0ZnOoMuWlFKGFlCiGgL7
         VahFABWNJ06uACP4RI6B1ZyIF3P48p8ougMcDEAr+rZBZE6O/3EhkUiejwvMaKnmpB4t
         0rkkNlJZUDDWkC3YnY3KLzlGJnC2k5qjRm94iNUG0+SnK34PtKSbUMioSYdpQW2HFEG2
         eFySOg4kCnT6YO0480U47WEVOkD9LNSSf92WQvr3yt9zcMBeDdhaX7MMLdk7LT8f3C7R
         IdYw==
X-Gm-Message-State: AOAM531EF5YyItKyS85NteMWYCThctO4PS466QbOLSlQCKBr+dgPOg/V
	Qjs16pOMiBnd2liGFbSjnYq26BX84herHoF0qmQhRw==
X-Google-Smtp-Source: ABdhPJyxDohwVrI4UWNnuw8TqeMEt5fZIApWLldRdPgj5wrzTORYY+rc6a8j5b7+3Bsd19xYlfh82aCUWGNc+xWlbJE=
X-Received: by 2002:a2e:9205:: with SMTP id k5mr1847559ljg.241.1590175874014;
 Fri, 22 May 2020 12:31:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200522151335.7918-1-ptsneves@gmail.com> <20200522151335.7918-2-ptsneves@gmail.com>
 <CANNYZj9tpQRb95FX5ch47eH66f8xvr-EybMkmg1UsAxAHwqyfw@mail.gmail.com>
 <CAJO0J4gz9zz9iZ4EbrPvs7aVjT3Ro1WXhmwsb7izst2m=GLQSg@mail.gmail.com>
 <CALpKvHoR5OvUqaDXa0OdxMgpoDKAQNG9NM9pYa=cW9cL1J86TA@mail.gmail.com> <CAJO0J4hP71_27HDY7yoVR267TtppDp0jnYqQ1z61g5dBaTZX7Q@mail.gmail.com>
In-Reply-To: <CAJO0J4hP71_27HDY7yoVR267TtppDp0jnYqQ1z61g5dBaTZX7Q@mail.gmail.com>
From: "Michael Ho" <michael.ho@ieee.org>
Date: Fri, 22 May 2020 21:31:02 +0200
Message-ID: <CALpKvHopa4WVbvJcm6ahnrn64_SZHi=dKZtZ6V05uaXq1eMMyA@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH] 2/2] package_{ipk, deb, rpm}.bbclass: support per package user-defined metadata.
To: Paulo Neves <ptsneves@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001a248705a641acf0"

--0000000000001a248705a641acf0
Content-Type: text/plain; charset="UTF-8"

Hi Paulo,

Yes, this is handled by the bitbake data handlers automatically. You can
check this by trying the following:

python do_test() {
    d.setVar("HELLO", "world!")
    d.setVar("HELLO_space", "space!")
    bb.warn("HELLO: %s" % d.getVar("HELLO", True))
    d.setVar("OVERRIDES", "space")
    bb.warn("HELLO: %s" % d.getVar("HELLO", True))
}
addtask test

Then calling this task with bitbake:

$ bitbake zip -c test | tee
...
WARNING: zip-3.0-r2 do_test: HELLO: world!
WARNING: zip-3.0-r2 do_test: HELLO: space!

I don't know the code or tests in oe that implement this functionality off
the top of my head so I can't point you to the oe.selftest coverage.

Kind regards,
Michael

On Fri, May 22, 2020 at 8:09 PM Paulo Neves <ptsneves@gmail.com> wrote:

> Hello Michael,
>
> The behavior you describe is indeed what i wanted. If you say this is
> already working then my patches are redundant. Even so i am surprised
> it is working. Is it done automatically by the getVar function?
>
> def get_package_additional_metadata (pkg_type, d):
>     base_key = "PACKAGE_ADD_METADATA"
>     for key in ("%s_%s" % (base_key, pkg_type.upper()), base_key):
>         if d.getVar(key, False) is None:
>             continue
>         d.setVarFlag(key, "type", "list")
>         if d.getVarFlag(key, "separator") is None:
>             d.setVarFlag(key, "separator", "\\n")
>         metadata_fields = [field.strip() for field in
> oe.data.typed_value(key, d)]
>         return "\n".join(metadata_fields).strip()
>
> From my understanding, i do not see how the per package override
> happens. Do you have the test for this functionality in oe-selftest?
>
> Grateful for the feedback
> Paulo Neves
>
> On Fri, May 22, 2020 at 8:00 PM Michael Ho <michael.ho@ieee.org> wrote:
> >
> > Hi Paulo,
> >
> > I actually have some patches in my "to send upstream list" to address
> the documentation and some sstate-caching bugs with these variables so it's
> fresh to me at the moment.
> > Correct me if I'm wrong but I think this is already available in the
> code (applying metadata specific to a certain package in a recipe, that is).
> >
> > eg.
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/package_ipk.bbclass
> at line 72 sets the local overrides so if PACKAGE_ADD_METADATA_IPK_xxx is
> set, it overrides PACKAGE_ADD_METADATA_IPK.
> >
> > For rpm, see
> >
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/package_rpm.bbclass#n298
> where the recipe wide variable is fetched
> >
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/package_rpm.bbclass#n338
> where the local override is also set
> >
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/package_rpm.bbclass#n354
> where the package specific variables are fetched
> >
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/package_rpm.bbclass#n436
> where the package specific variables are applied to rpm packages
> >
> > I tested the zip recipe by applying these two lines:
> > PACKAGE_ADD_METADATA_RPM = "Vendor: None"
> > PACKAGE_ADD_METADATA_RPM_zip-dbg = "Vendor: Not you!"
> > and could see differing results in the two rpm files produced.
> >
> > I think this covers the use case you're showing in your patches already,
> what do you think?
> >
> > Kind regards,
> > Michael
> >
> > (sorry if this shows up as a triple email, my mail client wasn't
> cooperating).
> >
> > On Fri, May 22, 2020 at 5:29 PM Paulo Neve <ptsneves@gmail.com> wrote:
> >>
> >> Is ./meta/lib/oeqa/selftest/cases/package.py the right place?
> >> If yes i can work on it. Note that this functionality is not used
> >> anywhere in poky and is not documented at all. It just happened to
> >> exist for a long time and be useful for my case.
> >>
> >> On Fri, May 22, 2020 at 5:22 PM Alexander Kanavin
> >> <alex.kanavin@gmail.com> wrote:
> >> >
> >> > Should there be a test for this functionality? Somewhere in
> oe-selftest perhaps where various package manager features are tested?
> >> >
> >> > Alex
> >> >
> >> > On Fri, 22 May 2020 at 17:13, Paulo Neve <ptsneves@gmail.com> wrote:
> >> >>
> >> >> Up to now the user defined metadata was set recipe wide,
> >> >> meaning all the packages generated in a recipe where the
> >> >> variable was set would get the same metadata. That is not
> >> >> always ideal and is counter to the per package control that
> >> >> is usually available.
> >> >>
> >> >> Keep support for package agnostic metadata but also add option
> >> >> to add it to a specific option like:
> >> >> PACKAGE_ADD_METADATA_${PN}_IPK = "mymeta: myvalue"
> >> >>
> >> >> Signed-off-by: Paulo Neves <ptsneves@gmail.com>
> >> >> ---
> >> >>  meta/classes/package.bbclass     | 4 ++--
> >> >>  meta/classes/package_deb.bbclass | 2 +-
> >> >>  meta/classes/package_ipk.bbclass | 2 +-
> >> >>  meta/classes/package_rpm.bbclass | 5 +++--
> >> >>  4 files changed, 7 insertions(+), 6 deletions(-)
> >> >>
> >> >> diff --git a/meta/classes/package.bbclass
> b/meta/classes/package.bbclass
> >> >> index 0b5cf47749..1678e0d794 100644
> >> >> --- a/meta/classes/package.bbclass
> >> >> +++ b/meta/classes/package.bbclass
> >> >> @@ -637,9 +637,9 @@ def get_package_mapping (pkg, basepkg, d,
> depversions=None):
> >> >>
> >> >>      return pkg
> >> >>
> >> >> -def get_package_additional_metadata (pkg_type, d):
> >> >> +def get_package_additional_metadata (pkg_type, pkg_name, d):
> >> >>      base_key = "PACKAGE_ADD_METADATA"
> >> >> -    for key in ("%s_%s" % (base_key, pkg_type.upper()), base_key):
> >> >> +    for key in ("%s_%s" % (base_key, pkg_type.upper()), "%s_%s_%s"
> % (base_key, pkg_name, pkg_type.upper()), base_key):
> >> >>          if d.getVar(key, False) is None:
> >> >>              continue
> >> >>          d.setVarFlag(key, "type", "list")
> >> >> diff --git a/meta/classes/package_deb.bbclass
> b/meta/classes/package_deb.bbclass
> >> >> index 790b26aef2..6ef9c8cb3a 100644
> >> >> --- a/meta/classes/package_deb.bbclass
> >> >> +++ b/meta/classes/package_deb.bbclass
> >> >> @@ -167,7 +167,7 @@ def deb_write_pkg(pkg, d):
> >> >>
> >> >>          # more fields
> >> >>
> >> >> -        custom_fields_chunk =
> get_package_additional_metadata("deb", localdata)
> >> >> +        custom_fields_chunk =
> get_package_additional_metadata("deb", pkgname, localdata)
> >> >>          if custom_fields_chunk:
> >> >>              ctrlfile.write(custom_fields_chunk)
> >> >>              ctrlfile.write("\n")
> >> >> diff --git a/meta/classes/package_ipk.bbclass
> b/meta/classes/package_ipk.bbclass
> >> >> index c008559e4a..f78cec7a70 100644
> >> >> --- a/meta/classes/package_ipk.bbclass
> >> >> +++ b/meta/classes/package_ipk.bbclass
> >> >> @@ -155,7 +155,7 @@ def ipk_write_pkg(pkg, d):
> >> >>              else:
> >> >>                  ctrlfile.write(c % tuple(pullData(fs, localdata)))
> >> >>
> >> >> -        custom_fields_chunk =
> get_package_additional_metadata("ipk", localdata)
> >> >> +        custom_fields_chunk =
> get_package_additional_metadata("ipk", pkgname, localdata)
> >> >>          if custom_fields_chunk is not None:
> >> >>              ctrlfile.write(custom_fields_chunk)
> >> >>              ctrlfile.write("\n")
> >> >> diff --git a/meta/classes/package_rpm.bbclass
> b/meta/classes/package_rpm.bbclass
> >> >> index 9145717f98..ab019192da 100644
> >> >> --- a/meta/classes/package_rpm.bbclass
> >> >> +++ b/meta/classes/package_rpm.bbclass
> >> >> @@ -295,7 +295,6 @@ python write_specfile () {
> >> >>      srcmaintainer  = d.getVar('MAINTAINER')
> >> >>      srchomepage    = d.getVar('HOMEPAGE')
> >> >>      srcdescription = d.getVar('DESCRIPTION') or "."
> >> >> -    srccustomtagschunk = get_package_additional_metadata("rpm", d)
> >> >>
> >> >>      srcdepends     = d.getVar('DEPENDS')
> >> >>      srcrdepends    = []
> >> >> @@ -333,6 +332,8 @@ python write_specfile () {
> >> >>          pkgname = localdata.getVar('PKG_%s' % pkg)
> >> >>          if not pkgname:
> >> >>              pkgname = pkg
> >> >> +
> >> >> +        srccustomtagschunk = get_package_additional_metadata("rpm",
> pkgname, d)
> >> >>          localdata.setVar('PKG', pkgname)
> >> >>
> >> >>          localdata.setVar('OVERRIDES', d.getVar("OVERRIDES", False)
> + ":" + pkg)
> >> >> @@ -351,7 +352,7 @@ python write_specfile () {
> >> >>          splitlicense = (localdata.getVar('LICENSE') or "")
> >> >>          splitsection = (localdata.getVar('SECTION') or "")
> >> >>          splitdescription = (localdata.getVar('DESCRIPTION') or ".")
> >> >> -        splitcustomtagschunk =
> get_package_additional_metadata("rpm", localdata)
> >> >> +        splitcustomtagschunk =
> get_package_additional_metadata("rpm", pkgname, localdata)
> >> >>
> >> >>          translate_vers('RDEPENDS', localdata)
> >> >>          translate_vers('RRECOMMENDS', localdata)
> >> >> --
> >> >> 2.20.1
> >> >>
> >> >>
> >> 
>

--0000000000001a248705a641acf0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Paulo,</div><div><br></div><div>Yes, this is handl=
ed by the bitbake data handlers automatically. You can check this by trying=
 the following:</div><div><br></div><div>python do_test() {</div><div>=C2=
=A0=C2=A0=C2=A0 d.setVar(&quot;HELLO&quot;, &quot;world!&quot;)</div><div>=
=
=C2=A0=C2=A0=C2=A0 d.setVar(&quot;HELLO_space&quot;, &quot;space!&quot;)</=
div><div>=C2=A0=C2=A0=C2=A0 bb.warn(&quot;HELLO: %s&quot; % d.getVar(&quot;=
HELLO&quot;, True))</div><div>=C2=A0=C2=A0=C2=A0 d.setVar(&quot;OVERRIDES&q=
uot;, &quot;space&quot;)</div><div>=C2=A0=C2=A0=C2=A0 bb.warn(&quot;HELLO: =
%s&quot; % d.getVar(&quot;HELLO&quot;, True))</div><div>}</div><div>addtask=
 test</div><div><br></div><div>Then calling this task with bitbake:<br></di=
v><div><br></div><div>$ bitbake zip -c test | tee</div><div>...<br></div><d=
iv>WARNING: zip-3.0-r2 do_test: HELLO: world!<br><div>WARNING: zip-3.0-r2 d=
o_test: HELLO: space!</div><div><br></div><div>I don&#39;t know the code or=
 tests in oe that implement this functionality off the top of my head so I =
can&#39;t point you to the oe.selftest coverage.</div><div><br></div><div>K=
ind regards,</div><div>Michael<br></div></div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 22, 2020 at 8:09 =
PM Paulo Neves &lt;<a href=3D"mailto:ptsneves@gmail.com">ptsneves@gmail.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Hello Michael,<br>
<br>
The behavior you describe is indeed what i wanted. If you say this is<br>
already working then my patches are redundant. Even so i am surprised<br>
it is working. Is it done automatically by the getVar function?<br>
<br>
def get_package_additional_metadata (pkg_type, d):<br>
=C2=A0 =C2=A0 base_key =3D &quot;PACKAGE_ADD_METADATA&quot;<br>
=C2=A0 =C2=A0 for key in (&quot;%s_%s&quot; % (base_key, pkg_type.upper())=
, base_key):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if d.getVar(key, False) is None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVarFlag(key, &quot;type&quot;, &quot;list=
&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if d.getVarFlag(key, &quot;separator&quot;) is=
 None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVarFlag(key, &quot;separato=
r&quot;, &quot;\\n&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 metadata_fields =3D [field.strip() for field i=
n<br>
oe.data.typed_value(key, d)]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;\n&quot;.join(metadata_fields).st=
rip()<br>
<br>
From my understanding, i do not see how the per package override<br>
happens. Do you have the test for this functionality in oe-selftest?<br>
<br>
Grateful for the feedback<br>
Paulo Neves<br>
<br>
On Fri, May 22, 2020 at 8:00 PM Michael Ho &lt;<a href=3D"mailto:michael.h=
o@ieee.org" target=3D"_blank">michael.ho@ieee.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Paulo,<br>
&gt;<br>
&gt; I actually have some patches in my &quot;to send upstream list&quot; =
to address the documentation and some sstate-caching bugs with these variab=
les so it&#39;s fresh to me at the moment.<br>
&gt; Correct me if I&#39;m wrong but I think this is already available in =
the code (applying metadata specific to a certain package in a recipe, that=
 is).<br>
&gt;<br>
&gt; eg. <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/me=
ta/classes/package_ipk.bbclass" rel=3D"noreferrer" target=3D"_blank">http:/=
/git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/package_ipk.bbcl=
ass</a> at line 72 sets the local overrides so if PACKAGE_ADD_METADATA_IPK_=
xxx is set, it overrides PACKAGE_ADD_METADATA_IPK.<br>
&gt;<br>
&gt; For rpm, see<br>
&gt; <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/c=
lasses/package_rpm.bbclass#n298" rel=3D"noreferrer" target=3D"_blank">http:=
//git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/package_rpm.bbc=
lass#n298</a> where the recipe wide variable is fetched<br>
&gt; <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/c=
lasses/package_rpm.bbclass#n338" rel=3D"noreferrer" target=3D"_blank">http:=
//git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/package_rpm.bbc=
lass#n338</a> where the local override is also set<br>
&gt; <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/c=
lasses/package_rpm.bbclass#n354" rel=3D"noreferrer" target=3D"_blank">http:=
//git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/package_rpm.bbc=
lass#n354</a> where the package specific variables are fetched<br>
&gt; <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/c=
lasses/package_rpm.bbclass#n436" rel=3D"noreferrer" target=3D"_blank">http:=
//git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/package_rpm.bbc=
lass#n436</a> where the package specific variables are applied to rpm packa=
ges<br>
&gt;<br>
&gt; I tested the zip recipe by applying these two lines:<br>
&gt; PACKAGE_ADD_METADATA_RPM =3D &quot;Vendor: None&quot;<br>
&gt; PACKAGE_ADD_METADATA_RPM_zip-dbg =3D &quot;Vendor: Not you!&quot;<br>
&gt; and could see differing results in the two rpm files produced.<br>
&gt;<br>
&gt; I think this covers the use case you&#39;re showing in your patches a=
lready, what do you think?<br>
&gt;<br>
&gt; Kind regards,<br>
&gt; Michael<br>
&gt;<br>
&gt; (sorry if this shows up as a triple email, my mail client wasn&#39;t =
cooperating).<br>
&gt;<br>
&gt; On Fri, May 22, 2020 at 5:29 PM Paulo Neve &lt;<a href=3D"mailto:ptsn=
eves@gmail.com" target=3D"_blank">ptsneves@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Is ./meta/lib/oeqa/selftest/cases/package.py the right place?<br>
&gt;&gt; If yes i can work on it. Note that this functionality is not used=
<br>
&gt;&gt; anywhere in poky and is not documented at all. It just happened t=
o<br>
&gt;&gt; exist for a long time and be useful for my case.<br>
&gt;&gt;<br>
&gt;&gt; On Fri, May 22, 2020 at 5:22 PM Alexander Kanavin<br>
&gt;&gt; &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">a=
lex.kanavin@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Should there be a test for this functionality? Somewhere in =
oe-selftest perhaps where various package manager features are tested?<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Alex<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Fri, 22 May 2020 at 17:13, Paulo Neve &lt;<a href=3D"mail=
to:ptsneves@gmail.com" target=3D"_blank">ptsneves@gmail.com</a>&gt; wrote:<=
br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Up to now the user defined metadata was set recipe wide,=
<br>
&gt;&gt; &gt;&gt; meaning all the packages generated in a recipe where the=
<br>
&gt;&gt; &gt;&gt; variable was set would get the same metadata. That is no=
t<br>
&gt;&gt; &gt;&gt; always ideal and is counter to the per package control t=
hat<br>
&gt;&gt; &gt;&gt; is usually available.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Keep support for package agnostic metadata but also add =
option<br>
&gt;&gt; &gt;&gt; to add it to a specific option like:<br>
&gt;&gt; &gt;&gt; PACKAGE_ADD_METADATA_${PN}_IPK =3D &quot;mymeta: myvalue=
&quot;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Signed-off-by: Paulo Neves &lt;<a href=3D"mailto:ptsneve=
s@gmail.com" target=3D"_blank">ptsneves@gmail.com</a>&gt;<br>
&gt;&gt; &gt;&gt; ---<br>
&gt;&gt; &gt;&gt;=C2=A0 meta/classes/package.bbclass=C2=A0 =C2=A0 =C2=A0| =
4 ++--<br>
&gt;&gt; &gt;&gt;=C2=A0 meta/classes/package_deb.bbclass | 2 +-<br>
&gt;&gt; &gt;&gt;=C2=A0 meta/classes/package_ipk.bbclass | 2 +-<br>
&gt;&gt; &gt;&gt;=C2=A0 meta/classes/package_rpm.bbclass | 5 +++--<br>
&gt;&gt; &gt;&gt;=C2=A0 4 files changed, 7 insertions(+), 6 deletions(-)<b=
r>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; diff --git a/meta/classes/package.bbclass b/meta/classes=
/package.bbclass<br>
&gt;&gt; &gt;&gt; index 0b5cf47749..1678e0d794 100644<br>
&gt;&gt; &gt;&gt; --- a/meta/classes/package.bbclass<br>
&gt;&gt; &gt;&gt; +++ b/meta/classes/package.bbclass<br>
&gt;&gt; &gt;&gt; @@ -637,9 +637,9 @@ def get_package_mapping (pkg, basepk=
g, d, depversions=3DNone):<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 return pkg<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; -def get_package_additional_metadata (pkg_type, d):<br>
&gt;&gt; &gt;&gt; +def get_package_additional_metadata (pkg_type, pkg_name=
, d):<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 base_key =3D &quot;PACKAGE_ADD_METAD=
ATA&quot;<br>
&gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 for key in (&quot;%s_%s&quot; % (base_key=
, pkg_type.upper()), base_key):<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 for key in (&quot;%s_%s&quot; % (base_key=
, pkg_type.upper()), &quot;%s_%s_%s&quot; % (base_key, pkg_name, pkg_type.u=
pper()), base_key):<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if d.getVar(key, False=
) is None:<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue=
<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVarFlag(key, &quo=
t;type&quot;, &quot;list&quot;)<br>
&gt;&gt; &gt;&gt; diff --git a/meta/classes/package_deb.bbclass b/meta/cla=
sses/package_deb.bbclass<br>
&gt;&gt; &gt;&gt; index 790b26aef2..6ef9c8cb3a 100644<br>
&gt;&gt; &gt;&gt; --- a/meta/classes/package_deb.bbclass<br>
&gt;&gt; &gt;&gt; +++ b/meta/classes/package_deb.bbclass<br>
&gt;&gt; &gt;&gt; @@ -167,7 +167,7 @@ def deb_write_pkg(pkg, d):<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # more fields<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 custom_fields_chunk =3D get=
_package_additional_metadata(&quot;deb&quot;, localdata)<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 custom_fields_chunk =3D get=
_package_additional_metadata(&quot;deb&quot;, pkgname, localdata)<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if custom_fields_chunk=
:<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctrlfile=
.write(custom_fields_chunk)<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctrlfile=
.write(&quot;\n&quot;)<br>
&gt;&gt; &gt;&gt; diff --git a/meta/classes/package_ipk.bbclass b/meta/cla=
sses/package_ipk.bbclass<br>
&gt;&gt; &gt;&gt; index c008559e4a..f78cec7a70 100644<br>
&gt;&gt; &gt;&gt; --- a/meta/classes/package_ipk.bbclass<br>
&gt;&gt; &gt;&gt; +++ b/meta/classes/package_ipk.bbclass<br>
&gt;&gt; &gt;&gt; @@ -155,7 +155,7 @@ def ipk_write_pkg(pkg, d):<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br=
>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ctrlfile.write(c % tuple(pullData(fs, localdata)))<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 custom_fields_chunk =3D get=
_package_additional_metadata(&quot;ipk&quot;, localdata)<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 custom_fields_chunk =3D get=
_package_additional_metadata(&quot;ipk&quot;, pkgname, localdata)<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if custom_fields_chunk=
 is not None:<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctrlfile=
.write(custom_fields_chunk)<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctrlfile=
.write(&quot;\n&quot;)<br>
&gt;&gt; &gt;&gt; diff --git a/meta/classes/package_rpm.bbclass b/meta/cla=
sses/package_rpm.bbclass<br>
&gt;&gt; &gt;&gt; index 9145717f98..ab019192da 100644<br>
&gt;&gt; &gt;&gt; --- a/meta/classes/package_rpm.bbclass<br>
&gt;&gt; &gt;&gt; +++ b/meta/classes/package_rpm.bbclass<br>
&gt;&gt; &gt;&gt; @@ -295,7 +295,6 @@ python write_specfile () {<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 srcmaintainer=C2=A0 =3D d.getVar(&#3=
9;MAINTAINER&#39;)<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 srchomepage=C2=A0 =C2=A0 =3D d.getVa=
r(&#39;HOMEPAGE&#39;)<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 srcdescription =3D d.getVar(&#39;DES=
CRIPTION&#39;) or &quot;.&quot;<br>
&gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 srccustomtagschunk =3D get_package_additi=
onal_metadata(&quot;rpm&quot;, d)<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 srcdepends=C2=A0 =C2=A0 =C2=A0=3D d.=
getVar(&#39;DEPENDS&#39;)<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 srcrdepends=C2=A0 =C2=A0 =3D []<br>
&gt;&gt; &gt;&gt; @@ -333,6 +332,8 @@ python write_specfile () {<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pkgname =3D localdata.=
getVar(&#39;PKG_%s&#39; % pkg)<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not pkgname:<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pkgname =
=
=3D pkg<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 srccustomtagschunk =3D get_=
package_additional_metadata(&quot;rpm&quot;, pkgname, d)<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 localdata.setVar(&#39;=
PKG&#39;, pkgname)<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 localdata.setVar(&#39;=
OVERRIDES&#39;, d.getVar(&quot;OVERRIDES&quot;, False) + &quot;:&quot; + pk=
g)<br>
&gt;&gt; &gt;&gt; @@ -351,7 +352,7 @@ python write_specfile () {<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 splitlicense =3D (loca=
ldata.getVar(&#39;LICENSE&#39;) or &quot;&quot;)<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 splitsection =3D (loca=
ldata.getVar(&#39;SECTION&#39;) or &quot;&quot;)<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 splitdescription =3D (=
localdata.getVar(&#39;DESCRIPTION&#39;) or &quot;.&quot;)<br>
&gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 splitcustomtagschunk =3D ge=
t_package_additional_metadata(&quot;rpm&quot;, localdata)<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 splitcustomtagschunk =3D ge=
t_package_additional_metadata(&quot;rpm&quot;, pkgname, localdata)<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 translate_vers(&#39;RD=
EPENDS&#39;, localdata)<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 translate_vers(&#39;RR=
ECOMMENDS&#39;, localdata)<br>
&gt;&gt; &gt;&gt; --<br>
&gt;&gt; &gt;&gt; 2.20.1<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; <br>
</blockquote></div>

--0000000000001a248705a641acf0--
