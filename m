Return-Path: <sebmennetrier@gmail.com>
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 629DD6D406
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 16:37:41 +0000 (UTC)
Received: by mail-ie0-f170.google.com with SMTP id at1so193949iec.15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 09:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=bG9dNiatEnFLspStBYoYsUG1oOTO1z8ujg5uvVt3VQg=;
	b=eQLs2KI1YQUqMw29/yR9GrGICi7w9ub75Y6140t6yOL97+mEtcQBq0wUSm2w6KUSNC
	xhTfDeRwCFRanrlnZjptt4kGUQ7GKeix9YkJPpNmmrUx2Vg7sQLxC71UnEmIMhZQTdj/
	cfHLMUT+qGHcQnitrik8om1pFqUY5+tTx0EDyKOYFfstMHsVrytOmOeqwc4ZQMJ1p31a
	X0FHjhSzvQXuHxXRBZCLQWzCzMiu13rAVZxiVBfrrsxkabg7A1cYaJb08lTXmf0iteux
	+b/U7Cd4AGpl+69TcdaH/HeDv1SLZR8ocdDOD8RMtoxy3Q3lgSTGeUkt+kbf1ep1Qivd
	ExFg==
MIME-Version: 1.0
X-Received: by 10.50.87.74 with SMTP id v10mr13296910igz.27.1383064663146;
	Tue, 29 Oct 2013 09:37:43 -0700 (PDT)
Sender: sebmennetrier@gmail.com
Received: by 10.43.141.70 with HTTP; Tue, 29 Oct 2013 09:37:43 -0700 (PDT)
In-Reply-To: <1416831.14LsivE7s1@helios>
References: <1383062949-12318-1-git-send-email-s.mennetrier@innotis.org>
	<1416831.14LsivE7s1@helios>
Date: Tue, 29 Oct 2013 17:37:43 +0100
X-Google-Sender-Auth: gb_njHj-RHMuJeZx0yCMWOmtPzs
Message-ID: <CABgO3_M3cn4CU-GkhizXQEPMHdug-cv2UhrznQCNdV-1dzbrhQ@mail.gmail.com>
From: Sebastien MENNETRIER <s.mennetrier@innotis.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] package_rpm.bbclass : escape "%" in files and directories name
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
X-List-Received-Date: Tue, 29 Oct 2013 16:37:41 -0000
Content-Type: multipart/alternative; boundary=089e0102f84af2c8cb04e9e3d5df

--089e0102f84af2c8cb04e9e3d5df
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I'm not a specialist with rpm but I saw this documentation and I tried with
"%%" and with "\%" and it did not work.

I don't know if it's the best way but it work for me ;)

Regards,
Seb



2013/10/29 Paul Eggleton <paul.eggleton@linux.intel.com>

> Hi S=E9bastien,
>
> On Tuesday 29 October 2013 17:09:09 S=E9bastien Mennetrier wrote:
> > Fixes [YOCTO #5397]
> >
> > The rpm process replace all the "%name" in the spec file by the name of
> > the package. So, if the package is composed of some files or directorie=
s
> > named "%name...", the rpm package process failed.
> >
> > Replace all "%" present in files or directories names by "[%]"
> >
> > Signed-off-by: S=E9bastien Mennetrier <s.mennetrier@innotis.org>
> > ---
> >  meta/classes/package_rpm.bbclass | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta/classes/package_rpm.bbclass
> > b/meta/classes/package_rpm.bbclass index 36bad09..6c73e37 100644
> > --- a/meta/classes/package_rpm.bbclass
> > +++ b/meta/classes/package_rpm.bbclass
> > @@ -662,10 +662,13 @@ python write_specfile () {
> >      def walk_files(walkpath, target, conffiles):
> >          for rootpath, dirs, files in os.walk(walkpath):
> >              path =3D rootpath.replace(walkpath, "")
> > +            path =3D path.replace("%", "[%]")
> >              for dir in dirs:
> > +                dir =3D dir.replace("%", "[%]")
> >                  # All packages own the directories their files are in.=
..
> >                  target.append('%dir "' + path + '/' + dir + '"')
> >              for file in files:
> > +                file =3D file.replace("%", "[%]")
> >                  if conffiles.count(path + '/' + file):
> >                      target.append('%config "' + path + '/' + file + '"=
')
> >                  else:
>
> Are you sure this is correct? The documentation I have been able to dig u=
p
> via
> google seems to suggest that %% is the correct way to escape a % sign in =
a
> spec file.
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>

--089e0102f84af2c8cb04e9e3d5df
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>I&#39;m not a specialist with rpm but I saw this=
 documentation and I tried with &quot;%%&quot; and with &quot;\%&quot; and =
it did not work.<br><br></div>I don&#39;t know if it&#39;s the best way but=
 it work for me ;)<br>
<br></div><div>Regards,<br>Seb<br></div><div><br></div></div><div class=3D"=
gmail_extra"><br><br><div class=3D"gmail_quote">2013/10/29 Paul Eggleton <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:paul.eggleton@linux.intel.com" target=
=3D"_blank">paul.eggleton@linux.intel.com</a>&gt;</span><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Hi S=E9bastien,<br>
<div><div class=3D"h5"><br>
On Tuesday 29 October 2013 17:09:09 S=E9bastien Mennetrier wrote:<br>
&gt; Fixes [YOCTO #5397]<br>
&gt;<br>
&gt; The rpm process replace all the &quot;%name&quot; in the spec file by =
the name of<br>
&gt; the package. So, if the package is composed of some files or directori=
es<br>
&gt; named &quot;%name...&quot;, the rpm package process failed.<br>
&gt;<br>
&gt; Replace all &quot;%&quot; present in files or directories names by &qu=
ot;[%]&quot;<br>
&gt;<br>
&gt; Signed-off-by: S=E9bastien Mennetrier &lt;<a href=3D"mailto:s.mennetri=
er@innotis.org">s.mennetrier@innotis.org</a>&gt;<br>
&gt; ---<br>
&gt; =A0meta/classes/package_rpm.bbclass | 3 +++<br>
&gt; =A01 file changed, 3 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/classes/package_rpm.bbclass<br>
&gt; b/meta/classes/package_rpm.bbclass index 36bad09..6c73e37 100644<br>
&gt; --- a/meta/classes/package_rpm.bbclass<br>
&gt; +++ b/meta/classes/package_rpm.bbclass<br>
&gt; @@ -662,10 +662,13 @@ python write_specfile () {<br>
&gt; =A0 =A0 =A0def walk_files(walkpath, target, conffiles):<br>
&gt; =A0 =A0 =A0 =A0 =A0for rootpath, dirs, files in os.walk(walkpath):<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0path =3D rootpath.replace(walkpath, &quot;&=
quot;)<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0path =3D path.replace(&quot;%&quot;, &quot;[%=
]&quot;)<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0for dir in dirs:<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dir =3D dir.replace(&quot;%&quot;, &q=
uot;[%]&quot;)<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0# All packages own the directories =
their files are in...<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0target.append(&#39;%dir &quot;&#39;=
 + path + &#39;/&#39; + dir + &#39;&quot;&#39;)<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0for file in files:<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file =3D file.replace(&quot;%&quot;, =
&quot;[%]&quot;)<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if conffiles.count(path + &#39;/&#3=
9; + file):<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0target.append(&#39;%config =
&quot;&#39; + path + &#39;/&#39; + file + &#39;&quot;&#39;)<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else:<br>
<br>
</div></div>Are you sure this is correct? The documentation I have been abl=
e to dig up via<br>
google seems to suggest that %% is the correct way to escape a % sign in a<=
br>
spec file.<br>
<br>
Cheers,<br>
Paul<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
<br>
Paul Eggleton<br>
Intel Open Source Technology Centre<br>
</font></span></blockquote></div><br></div>

--089e0102f84af2c8cb04e9e3d5df--
