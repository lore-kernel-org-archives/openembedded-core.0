Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SHdEi-0006ou-5T
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 17:44:04 +0200
Received: by wibhj13 with SMTP id hj13so3030945wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2012 08:34:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=Hdec2EAahEWYELSpFVJpdkO4zaeFE1dn2l0+f1nEr8w=;
	b=S1DE9ed+UkTuG0WuexdAcyGOUzAmFi8N4yq6IfTfo5eMdaN650fxRWawLbrDYh2JEZ
	3Xwq3Bfc8Ysu3f5EwKMxC76/as6NpXYDplPOHhpXWL18qTg7T7q4NTAi/0hyTTwZfJa8
	Zdk0Z8d5U9Fe8TJD5jD2bpu+s7UnfvtRAyTTzNfjj+ESYxwrlaf3Pq3bXuznDkV2zOQP
	FyeHe5bmvqW8pehq6bxz/adYYyOOZCuWCFRtT7YRkgUGYf/e9qnbzNvNks1u2SdXHl+z
	DuVUZQyNWorM+4D3s2y3wxcMICjL5iew1g6XRWPlu0Idso/dKaimxQnMZQrOXjuLGQZG
	xadA==
Received: by 10.180.24.35 with SMTP id r3mr8072592wif.7.1334072086553; Tue, 10
	Apr 2012 08:34:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.227.158.16 with HTTP; Tue, 10 Apr 2012 08:34:25 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <1334048565.6861.1.camel@ted>
References: <cover.1333720467.git.andrei@gherzan.ro>
	<4803097570d9e27eb3931388eb76fe6d3d00591a.1333720467.git.andrei@gherzan.ro>
	<1334048565.6861.1.camel@ted>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Tue, 10 Apr 2012 18:34:25 +0300
Message-ID: <CAK18fxGMGA0Q=k4r27JjB2_wButvJWPDHjxEJtrYs7pN=oXvGg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQnBnSQ05vrOZ6yZcMEbmLcyIg2PJFWAxunbVxc3/Iz57LUbI5zBXESbl6VL3kny/HtzVWAh
Subject: Re: [PATCH 1/1] package.bbclass: needs_ldconfig from linux_so is needed in global namespace
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Apr 2012 15:44:04 -0000
Content-Type: multipart/alternative; boundary=f46d043bdf20d2e57704bd54dc89

--f46d043bdf20d2e57704bd54dc89
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Apr 10, 2012 at 12:02, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2012-04-06 at 16:57 +0300, Andrei Gherzan wrote:
> > "The suite of statements in a function definition executes with a local
> namespace
> > that is different from the global namespace. This means that all
> variables created
> > within a function are local to that function. When the suite finishes,
> these
> > working variables are discarded."
> >
> > In this way the needs_ldconfig variable in linux_so never gets True in
> the statements
> > below this function. As global statement is generally discouraged, a
> return value
> > would be a clean and fast way to solve this issue.
> >
> > [YOCTO #2205]
> >
> > Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> > ---
> >  meta/classes/package.bbclass |    4 +++-
> >  1 files changed, 3 insertions(+), 1 deletions(-)
> >
> > diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> > index d35667a..c98e8fa 100644
> > --- a/meta/classes/package.bbclass
> > +++ b/meta/classes/package.bbclass
> > @@ -1263,6 +1263,7 @@ python package_do_shlibs() {
> >       lf = bb.utils.lockfile(d.expand("${PACKAGELOCK}"))
> >
> >       def linux_so(root, path, file):
> > +             needs_ldconfig = False
> >               cmd = d.getVar('OBJDUMP', True) + " -p " +
> pipes.quote(os.path.join(root, file)) + " 2>/dev/null"
> >               cmd = "PATH=\"%s\" %s" % (d.getVar('PATH', True), cmd)
> >               fd = os.popen(cmd)
> > @@ -1283,6 +1284,7 @@ python package_do_shlibs() {
> >                                       needs_ldconfig = True
> >                               if snap_symlinks and (file != this_soname):
> >                                       renames.append((os.path.join(root,
> file), os.path.join(root, this_soname)))
> > +             return needs_ldconfig
> >
> >       def darwin_so(root, path, file):
> >               fullpath = os.path.join(root, file)
> > @@ -1382,7 +1384,7 @@ python package_do_shlibs() {
> >                               if targetos == "darwin" or targetos ==
> "darwin8":
> >                                       darwin_so(root, dirs, file)
> >                               elif os.access(path, os.X_OK) or
> lib_re.match(file):
> > -                                     linux_so(root, dirs, file)
> > +                                     needs_ldconfig = linux_so(root,
> dirs, file)
>
> Shouldn't this be something like:
>
> ldconfig = linux_so(root, dirs, file)
> needs_ldconfig = needs_ldconfig or ldconfig
>
> or can this only get called once?
>
>
As i recall this is called once but if you want i can amend with your hint.

@g

--f46d043bdf20d2e57704bd54dc89
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Tue, Apr 10, 2012 at 12:02, Richard Purdie <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">r=
ichard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">

<div class=3D"HOEnZb"><div class=3D"h5">On Fri, 2012-04-06 at 16:57 +0300, =
Andrei Gherzan wrote:<br>
&gt; &quot;The suite of statements in a function definition executes with a=
 local namespace<br>
&gt; that is different from the global namespace. This means that all varia=
bles created<br>
&gt; within a function are local to that function. When the suite finishes,=
 these<br>
&gt; working variables are discarded.&quot;<br>
&gt;<br>
&gt; In this way the needs_ldconfig variable in linux_so never gets True in=
 the statements<br>
&gt; below this function. As global statement is generally discouraged, a r=
eturn value<br>
&gt; would be a clean and fast way to solve this issue.<br>
&gt;<br>
&gt; [YOCTO #2205]<br>
&gt;<br>
&gt; Signed-off-by: Andrei Gherzan &lt;<a href=3D"mailto:andrei@gherzan.ro"=
>andrei@gherzan.ro</a>&gt;<br>
&gt; ---<br>
&gt; =A0meta/classes/package.bbclass | =A0 =A04 +++-<br>
&gt; =A01 files changed, 3 insertions(+), 1 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbcla=
ss<br>
&gt; index d35667a..c98e8fa 100644<br>
&gt; --- a/meta/classes/package.bbclass<br>
&gt; +++ b/meta/classes/package.bbclass<br>
&gt; @@ -1263,6 +1263,7 @@ python package_do_shlibs() {<br>
&gt; =A0 =A0 =A0 lf =3D bb.utils.lockfile(d.expand(&quot;${PACKAGELOCK}&quo=
t;))<br>
&gt;<br>
&gt; =A0 =A0 =A0 def linux_so(root, path, file):<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 needs_ldconfig =3D False<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 cmd =3D d.getVar(&#39;OBJDUMP&#39;, True) =
+ &quot; -p &quot; + pipes.quote(os.path.join(root, file)) + &quot; 2&gt;/d=
ev/null&quot;<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 cmd =3D &quot;PATH=3D\&quot;%s\&quot; %s&q=
uot; % (d.getVar(&#39;PATH&#39;, True), cmd)<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 fd =3D os.popen(cmd)<br>
&gt; @@ -1283,6 +1284,7 @@ python package_do_shlibs() {<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 needs_ldconfig =3D True<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if snap_sy=
mlinks and (file !=3D this_soname):<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 renames.append((os.path.join(root, file), os.path.join(root, this_s=
oname)))<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 return needs_ldconfig<br>
&gt;<br>
&gt; =A0 =A0 =A0 def darwin_so(root, path, file):<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 fullpath =3D os.path.join(root, file)<br>
&gt; @@ -1382,7 +1384,7 @@ python package_do_shlibs() {<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if targeto=
s =3D=3D &quot;darwin&quot; or targetos =3D=3D &quot;darwin8&quot;:<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 darwin_so(root, dirs, file)<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 elif os.ac=
cess(path, os.X_OK) or lib_re.match(file):<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 linux_so(root, dirs, file)<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 needs_ldconfig =3D linux_so(root, dirs, file)<br>
<br>
</div></div>Shouldn&#39;t this be something like:<br>
<br>
ldconfig =3D linux_so(root, dirs, file)<br>
needs_ldconfig =3D needs_ldconfig or ldconfig<br>
<br>
or can this only get called once?<br>
<br></blockquote><div>=A0</div><div>As i recall this is called once but if =
you want i can amend with your hint.</div><div><br></div><div>@g</div></div=
><br>

--f46d043bdf20d2e57704bd54dc89--
