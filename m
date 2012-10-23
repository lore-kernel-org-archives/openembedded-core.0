Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1TQZZ0-00085Y-O4
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Oct 2012 10:10:15 +0200
Received: by mail-oa0-f47.google.com with SMTP id h1so3294742oag.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2012 00:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=7BOm7KfmuIXJwbgxngiUgC6hzUnIBtnydk36aPKoLlU=;
	b=D9VYGO8oQRDZH+geT/m9axI5928ED59SMV0cCz/wjhHb4xkFn9tMPnhetyatWjej2C
	w8ZBD7xyONImGuBCF2wDQovh+A0voOItX+jZGGBiHI2BjZuKoT4pMIASCXAQGzq3uNSH
	zKjl0yCXgS+jeBLxebya9HY9AmAMabaKMthoZBhK4krRsy9SIEhy5Xebt2GzBrBLF/Kj
	+SSMZWB6QGl8bshJoCaTXxY2mQtSN2NK9M39WTZLqSXPwjs0YDx6vv/wV3ES81IGirls
	LDfv3iMLPpg/eFsAAeRA6/UMtApFAYICnPf88b+9ArhKm0qKkPA2zUqfOSeVhNYCeRPW
	LJFQ==
MIME-Version: 1.0
Received: by 10.182.156.99 with SMTP id wd3mr9310675obb.15.1350979008531; Tue,
	23 Oct 2012 00:56:48 -0700 (PDT)
Received: by 10.60.123.47 with HTTP; Tue, 23 Oct 2012 00:56:48 -0700 (PDT)
In-Reply-To: <20121023075434.GM3269@jama.jama.net>
References: <1350919952-14859-1-git-send-email-giuseppe.condorelli@st.com>
	<20121023075434.GM3269@jama.jama.net>
Date: Tue, 23 Oct 2012 09:56:48 +0200
Message-ID: <CAOHjBZucSLBeztfN1-Oa3CwHh3GZq7ek-39FRuJvLdTA7NUpuA@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] base-files: do_install_basefilesissue error
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Oct 2012 08:10:15 -0000
Content-Type: multipart/alternative; boundary=f46d0444e869e70d3d04ccb54f70

--f46d0444e869e70d3d04ccb54f70
Content-Type: text/plain; charset=ISO-8859-1

Yes, you are right.
The mistake was in local setting because DISTRO_VERSION was set to
"-${DATE}" and the minus created
the install error.
Locally solved, please discard the patch.
Thanks,
Giuseppe

2012/10/23 Martin Jansa <martin.jansa@gmail.com>

> On Mon, Oct 22, 2012 at 05:32:32PM +0200, Giuseppe CONDORELLI wrote:
> > Fixed error in do_install_basefilesissue, printf is now replaced by echo.
>
> Looks like partial revert of
>
> commit a19880ad10ccb5d7d909dcf9de5c3dc58a0ebcd3
> Author: Andrei Gherzan <andrei@gherzan.ro>
> Date:   Thu Sep 20 12:56:59 2012 +0300
>
>     Replace "echo -e" with "printf" to have the same behavior in dash or
> bash
>
>     oe-core removed the prerequisite to have sh as bash. POSIX doesn't
> define
>     any options and furthermore allows 'echo -e' to be the default
> behavior.
>     This means that in dash 'echo -e' will actually print '-e' and
> interpret
>     backslashes by default. We use instead 'printf' builtin command with or
>     without '\n' to simulate 'echo -e' or 'echo -n'.
>     'printf' needs format while 'echo' can be used without any arguments.
> So
>     'echo >' was replaced by 'printf "" >'.
>     'echo' without '-n' flag adds a new line by default so to keep the same
>     behavior of two new lines while using 'echo "\n"', 'printf "\n\n"' is
>     used.
>
>     [YOCTO #3138]
>
> with very weak explanation why..
>
> >
> > Signed-off-by: Giuseppe Condorelli <giuseppe.condorelli@st.com>
> > ---
> >  meta/recipes-core/base-files/base-files_3.0.14.bb |    8 ++++----
> >  1 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bbb/meta/recipes-core/base-files/
> base-files_3.0.14.bb
> > index ba355ee..766b0e5 100644
> > --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
> > +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
> > @@ -117,11 +117,11 @@ do_install_basefilesissue () {
> >
> >       install -m 644 ${WORKDIR}/issue*  ${D}${sysconfdir}
> >          if [ -n "${DISTRO_NAME}" ]; then
> > -             printf "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue
> > -             printf "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue.net
> > +             echo "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue
> > +             echo "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue.net
> >               if [ -n "${DISTRO_VERSION}" ]; then
> > -                     printf "${DISTRO_VERSION} " >>
> ${D}${sysconfdir}/issue
> > -                     printf "${DISTRO_VERSION} " >> ${D}${sysconfdir}/
> issue.net
> > +                     echo "${DISTRO_VERSION} " >>
> ${D}${sysconfdir}/issue
> > +                     echo "${DISTRO_VERSION} " >> ${D}${sysconfdir}/
> issue.net
> >               fi
> >               echo "\n \l" >> ${D}${sysconfdir}/issue
> >               echo >> ${D}${sysconfdir}/issue
> > --
> > 1.7.4.4
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>

--f46d0444e869e70d3d04ccb54f70
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Yes, you are right.</div><div>The mistake was in local setting because=
 DISTRO_VERSION was set to &quot;-${DATE}&quot; and the minus created</div>=
<div>the install error.</div><div>Locally solved, please discard the patch.=
</div>
<div>Thanks,</div><div>Giuseppe<br><br></div><div class=3D"gmail_quote">201=
2/10/23 Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@g=
mail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;</span><br><block=
quote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-color:=
rgb(204,204,204);border-left-width:1px;border-left-style:solid" class=3D"gm=
ail_quote">
<div class=3D"im">On Mon, Oct 22, 2012 at 05:32:32PM +0200, Giuseppe CONDOR=
ELLI wrote:<br>
&gt; Fixed error in do_install_basefilesissue, printf is now replaced by ec=
ho.<br>
<br>
</div>Looks like partial revert of<br>
<br>
commit a19880ad10ccb5d7d909dcf9de5c3dc58a0ebcd3<br>
Author: Andrei Gherzan &lt;<a href=3D"mailto:andrei@gherzan.ro">andrei@gher=
zan.ro</a>&gt;<br>
Date: =A0 Thu Sep 20 12:56:59 2012 +0300<br>
<br>
=A0 =A0 Replace &quot;echo -e&quot; with &quot;printf&quot; to have the sam=
e behavior in dash or bash<br>
<br>
=A0 =A0 oe-core removed the prerequisite to have sh as bash. POSIX doesn&#3=
9;t define<br>
=A0 =A0 any options and furthermore allows &#39;echo -e&#39; to be the defa=
ult behavior.<br>
=A0 =A0 This means that in dash &#39;echo -e&#39; will actually print &#39;=
-e&#39; and interpret<br>
=A0 =A0 backslashes by default. We use instead &#39;printf&#39; builtin com=
mand with or<br>
=A0 =A0 without &#39;\n&#39; to simulate &#39;echo -e&#39; or &#39;echo -n&=
#39;.<br>
=A0 =A0 &#39;printf&#39; needs format while &#39;echo&#39; can be used with=
out any arguments. So<br>
=A0 =A0 &#39;echo &gt;&#39; was replaced by &#39;printf &quot;&quot; &gt;&#=
39;.<br>
=A0 =A0 &#39;echo&#39; without &#39;-n&#39; flag adds a new line by default=
 so to keep the same<br>
=A0 =A0 behavior of two new lines while using &#39;echo &quot;\n&quot;&#39;=
, &#39;printf &quot;\n\n&quot;&#39; is<br>
=A0 =A0 used.<br>
<br>
=A0 =A0 [YOCTO #3138]<br>
<br>
with very weak explanation why..<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt; Signed-off-by: Giuseppe Condorelli &lt;<a href=3D"mailto:giuseppe.cond=
orelli@st.com">giuseppe.condorelli@st.com</a>&gt;<br>
&gt; ---<br>
&gt; =A0meta/recipes-core/base-files/<a href=3D"http://base-files_3.0.14.bb=
" target=3D"_blank">base-files_3.0.14.bb</a> | =A0 =A08 ++++----<br>
&gt; =A01 files changed, 4 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/base-files/<a href=3D"http://base-files=
_3.0.14.bb" target=3D"_blank">base-files_3.0.14.bb</a> b/meta/recipes-core/=
base-files/<a href=3D"http://base-files_3.0.14.bb" target=3D"_blank">base-f=
iles_3.0.14.bb</a><br>

&gt; index ba355ee..766b0e5 100644<br>
&gt; --- a/meta/recipes-core/base-files/<a href=3D"http://base-files_3.0.14=
.bb" target=3D"_blank">base-files_3.0.14.bb</a><br>
&gt; +++ b/meta/recipes-core/base-files/<a href=3D"http://base-files_3.0.14=
.bb" target=3D"_blank">base-files_3.0.14.bb</a><br>
&gt; @@ -117,11 +117,11 @@ do_install_basefilesissue () {<br>
&gt;<br>
&gt; =A0 =A0 =A0 install -m 644 ${WORKDIR}/issue* =A0${D}${sysconfdir}<br>
&gt; =A0 =A0 =A0 =A0 =A0if [ -n &quot;${DISTRO_NAME}&quot; ]; then<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 printf &quot;${DISTRO_NAME} &quot; &gt;&gt; =
${D}${sysconfdir}/issue<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 printf &quot;${DISTRO_NAME} &quot; &gt;&gt; =
${D}${sysconfdir}/<a href=3D"http://issue.net" target=3D"_blank">issue.net<=
/a><br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 echo &quot;${DISTRO_NAME} &quot; &gt;&gt; ${=
D}${sysconfdir}/issue<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 echo &quot;${DISTRO_NAME} &quot; &gt;&gt; ${=
D}${sysconfdir}/<a href=3D"http://issue.net" target=3D"_blank">issue.net</a=
><br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 if [ -n &quot;${DISTRO_VERSION}&quot; ]; t=
hen<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printf &quot;${DISTRO_VERSIO=
N} &quot; &gt;&gt; ${D}${sysconfdir}/issue<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printf &quot;${DISTRO_VERSIO=
N} &quot; &gt;&gt; ${D}${sysconfdir}/<a href=3D"http://issue.net" target=3D=
"_blank">issue.net</a><br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo &quot;${DISTRO_VERSION}=
 &quot; &gt;&gt; ${D}${sysconfdir}/issue<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo &quot;${DISTRO_VERSION}=
 &quot; &gt;&gt; ${D}${sysconfdir}/<a href=3D"http://issue.net" target=3D"_=
blank">issue.net</a><br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 fi<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo &quot;\n \l&quot; &gt;&gt; ${D}${sysc=
onfdir}/issue<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo &gt;&gt; ${D}${sysconfdir}/issue<br>
&gt; --<br>
&gt; 1.7.4.4<br>
&gt;<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/li=
stinfo/openembedded-core</a><br>
<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">--<br>
Martin &#39;JaMa&#39; Jansa =A0 =A0 jabber: <a href=3D"mailto:Martin.Jansa@=
gmail.com">Martin.Jansa@gmail.com</a><br>
</font></span><br>_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
<br></blockquote></div><br>

--f46d0444e869e70d3d04ccb54f70--
