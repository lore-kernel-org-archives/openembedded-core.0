Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1Su6It-0007MX-58
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 20:27:23 +0200
Received: by yhjj56 with SMTP id j56so975163yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2012 11:15:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=sNH7h9P/Csp8vq8JNXnwZYQzmeKGSyVZDc44GtAK7YI=;
	b=nl5JiOuwOeOS57nt5DOW8S6uz7xt0Csop36d9el/M1G2PQax2ExsqPTN0S1iWmGCY5
	1RRRM5wHoV0MEMX32zdH+2fh+Y+AoZqklVGWOYRDYBvXrUNQCu5eHjZVWcpRw2BHDI5w
	e0qDKkoWMjSZopQqUz/nSTyGL4lrPkmxnB1LgLQ/g4mYc0mt46YHxppMuIIJt/qE6kJo
	NcNqg1x3kwntCZMn/5hMqRtZ5WZKlotQcNo5h8O/bPSOcJpphiwCUSmIhbbcdsSuWRvH
	Bmro++vy5Hg0Kw/zQ7g5dFoMLGmd9LHlNKdZJorJ0u9I+OxHqcQUQhfYj/QilUaFZmrU
	/Eww==
Received: by 10.42.132.1 with SMTP id b1mr19091775ict.8.1343240152959; Wed, 25
	Jul 2012 11:15:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.139.164 with HTTP; Wed, 25 Jul 2012 11:15:32 -0700 (PDT)
X-Originating-IP: [79.117.115.156]
In-Reply-To: <1342708981.7940.14.camel@ted>
References: <1340871186-20545-1-git-send-email-andrei@gherzan.ro>
	<1342708981.7940.14.camel@ted>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Wed, 25 Jul 2012 21:15:32 +0300
Message-ID: <CAK18fxFqwi7-9+xG9mJaP4izg88hozvZ6zn8+OHLnHSs8QSHGw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQnycPhxhncbgQUhM7Z+miuypFvlYwNO3axJKxe3UtqmbMuROP/cpCgdhIcsy73vPhPX6i7d
Subject: Re: [PATCH] package.bbclass: Create symlinks for packages with different packaged name
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
X-List-Received-Date: Wed, 25 Jul 2012 18:27:23 -0000
Content-Type: multipart/alternative; boundary=90e6ba3fd4f92a4a0e04c5ab7867

--90e6ba3fd4f92a4a0e04c5ab7867
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jul 19, 2012 at 5:43 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2012-06-28 at 11:13 +0300, Andrei Gherzan wrote:
> > While generating license.manifest package information is searched in:
> > filename=`ls ${TMPDIR}/pkgdata/*/runtime/${pkg}| head -1`
> > This is ok as long as package name is the same as the package name
> > after packaging.
> > For example dbus is packaged as dbus-1. So, searching
> > ls ${TMPDIR}/pkgdata/*/runtime/dbus-1 will fail because there is no file
> > with this package name.
> >
> > Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> > ---
> >  meta/classes/package.bbclass |    5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> > index 10c2f0a..460b351 100644
> > --- a/meta/classes/package.bbclass
> > +++ b/meta/classes/package.bbclass
> > @@ -1120,6 +1120,11 @@ python emit_pkgdata() {
> >               sf.write('%s_%s: %s\n' % ('PKGSIZE', pkg,
> get_directory_size(pkgdest + "/%s" % pkg)))
> >               sf.close()
> >
> > +             # Symlinks needed while generating manifest
> > +             pkgval = d.getVar('PKG_%s' % (pkg), True)
> > +             if pkgval != pkg:
> > +                     subdata_sym = pkgdatadir + "/runtime/%s" % pkgval
> > +                     os.symlink(pkg,subdata_sym)
> >
> >               allow_empty = d.getVar('ALLOW_EMPTY_%s' % pkg, True)
> >               if not allow_empty:
>
> I think this is the right idea, I'm just worried about having things in
> the same directory. Could we do this but create the symlinks in a
> "runtime-renamed" directory instead, then alter licence.bbclass to look
> there?
>
> Cheers,
>
> Richard
>
>
> Paul reworked this.
http://patchwork.openembedded.org/patch/32871/

Thank you,
ag

--90e6ba3fd4f92a4a0e04c5ab7867
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Thu, Jul 19, 2012 at 5:43 PM, Richard Purdie =
<span dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org"=
 target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">

On Thu, 2012-06-28 at 11:13 +0300, Andrei Gherzan wrote:<br>
&gt; While generating license.manifest package information is searched in:<=
br>
&gt; filename=3D`ls ${TMPDIR}/pkgdata/*/runtime/${pkg}| head -1`<br>
&gt; This is ok as long as package name is the same as the package name<br>
&gt; after packaging.<br>
&gt; For example dbus is packaged as dbus-1. So, searching<br>
&gt; ls ${TMPDIR}/pkgdata/*/runtime/dbus-1 will fail because there is no fi=
le<br>
&gt; with this package name.<br>
&gt;<br>
&gt; Signed-off-by: Andrei Gherzan &lt;<a href=3D"mailto:andrei@gherzan.ro"=
>andrei@gherzan.ro</a>&gt;<br>
&gt; ---<br>
&gt; =A0meta/classes/package.bbclass | =A0 =A05 +++++<br>
&gt; =A01 file changed, 5 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbcla=
ss<br>
&gt; index 10c2f0a..460b351 100644<br>
&gt; --- a/meta/classes/package.bbclass<br>
&gt; +++ b/meta/classes/package.bbclass<br>
&gt; @@ -1120,6 +1120,11 @@ python emit_pkgdata() {<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 sf.write(&#39;%s_%s: %s\n&#39; % (&#39;PKG=
SIZE&#39;, pkg, get_directory_size(pkgdest + &quot;/%s&quot; % pkg)))<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 sf.close()<br>
&gt;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 # Symlinks needed while generating manifest<=
br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 pkgval =3D d.getVar(&#39;PKG_%s&#39; % (pkg)=
, True)<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 if pkgval !=3D pkg:<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 subdata_sym =3D pkgdatadir +=
 &quot;/runtime/%s&quot; % pkgval<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 os.symlink(pkg,subdata_sym)<=
br>
&gt;<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 allow_empty =3D d.getVar(&#39;ALLOW_EMPTY_=
%s&#39; % pkg, True)<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 if not allow_empty:<br>
<br>
I think this is the right idea, I&#39;m just worried about having things in=
<br>
the same directory. Could we do this but create the symlinks in a<br>
&quot;runtime-renamed&quot; directory instead, then alter licence.bbclass t=
o look<br>
there?<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br></blockquote><div>Paul reworked this.</div><div><a href=3D"http://patch=
work.openembedded.org/patch/32871/">http://patchwork.openembedded.org/patch=
/32871/</a></div><div><br></div><div>Thank you,</div><div>ag</div></div>


--90e6ba3fd4f92a4a0e04c5ab7867--
