Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SbbbT-0005ND-TD
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Jun 2012 20:02:08 +0200
Received: by yhjj56 with SMTP id j56so3169188yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jun 2012 10:51:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=z2Sq885TlmYw4DYVTjqId1nyvVVqypEjpb17v9sAuZU=;
	b=i60NVk2Y3cMi1zCjb5X+mkT81i+MPdy1V9oDQzRbQjQ78U/6O2kjQGHjDSMal+12Hp
	4YpDXG+VRqVv2pQqUwrzFKr2U7l4XIJ2EFRdZfxmw+0wfJpZviI2TYYqMwRZOZop5PBQ
	G3WBqDvOBr2nnXLP+8uf3xdjcNNTILm2gBY7zWmXb5NtIuYo4Cyzxhuv7J5q+eMpde2W
	w0GrGs8RudLb9e+cbgCdVw7rPv2rktEP7VatCoyU900XxgmJFGGWUSsaX/V9skXwceG3
	o+R6RiH0YSQ5y47wmngGRjHJTvZXTx/2gStceQ3UiHfBKh03NVTo1hzPNookd5oZLKNh
	lHqw==
Received: by 10.50.161.198 with SMTP id xu6mr9074863igb.40.1338832302265; Mon,
	04 Jun 2012 10:51:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.28.147 with HTTP; Mon, 4 Jun 2012 10:51:22 -0700 (PDT)
X-Originating-IP: [79.115.102.71]
In-Reply-To: <CAPhnLPAUewTddwVFXa77deAUomq7_T17MAYCsr_t+6rmT0OLxw@mail.gmail.com>
References: <1338537158-19917-1-git-send-email-cristian.iorga@intel.com>
	<CAPhnLPAUewTddwVFXa77deAUomq7_T17MAYCsr_t+6rmT0OLxw@mail.gmail.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Mon, 4 Jun 2012 20:51:22 +0300
Message-ID: <CAK18fxGZvO+Eu0ZoL0FFQTfPvppYCVdLSQ+D+zeDxLVXT9aeRw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkKlmJDSqbzUMZiSQ/qx6AXukJNLBdlX4lE1gFzTco41gITaZ9m7FWiJ0dWQ6YbhVlcNSkO
Subject: Re: [PATCH] ltp: Add patch to correct failing build
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
X-List-Received-Date: Mon, 04 Jun 2012 18:02:08 -0000
Content-Type: multipart/alternative; boundary=14dae9341141ca577e04c1a92f78

--14dae9341141ca577e04c1a92f78
Content-Type: text/plain; charset=ISO-8859-1

Confirmed.

@g


On Sat, Jun 2, 2012 at 7:59 PM, Flanagan, Elizabeth <
elizabeth.flanagan@intel.com> wrote:

> On Fri, Jun 1, 2012 at 12:52 AM, Cristian Iorga
> <cristian.iorga@intel.com> wrote:
> > ltp makefile does not interpret correctly the result of git describe
> > command and assumes that it is working with a git repo, while in fact
> > working with a source code archive.
> > Added a patch to corect makefile system.
> >
> > Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> > ---
> >  .../ltp/ltp/fix_building_fom_archive.patch         |   23
> ++++++++++++++++++++
> >  meta/recipes-extended/ltp/ltp_20120401.bb          |    4 ++--
> >  2 files changed, 25 insertions(+), 2 deletions(-)
> >  create mode 100644
> meta/recipes-extended/ltp/ltp/fix_building_fom_archive.patch
> >
> > diff --git
> a/meta/recipes-extended/ltp/ltp/fix_building_fom_archive.patch
> b/meta/recipes-extended/ltp/ltp/fix_building_fom_archive.patch
> > new file mode 100644
> > index 0000000..c0ecc86
> > --- /dev/null
> > +++ b/meta/recipes-extended/ltp/ltp/fix_building_fom_archive.patch
> > @@ -0,0 +1,23 @@
> > +ltp package build system is broken if building from archive
> > +
> > +ltp makefile does not interpret correctly the result of git describe
> > +command and assumes that it is working with a git repo, while in fact
> > +working with a source code archive.
> > +
> > +Upstream-Status: Pending
> > +Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> > +
> > +Index: ltp-20120401/Makefile
> > +===================================================================
> > +--- ltp-20120401.orig/Makefile
> > ++++ ltp-20120401/Makefile
> > +@@ -173,7 +173,8 @@ SRCDIR_INSTALL_TARGETS     := $(SRCDIR_INSTA
> > + #
> > + .PHONY: Version
> > + Version:
> > +-      if git describe &> /dev/null; then \
> > ++      git describe &> /dev/null
> > ++      if [ $? -eq 0 ]; then \
> > +               git describe > "$@"; \
> > +       else \
> > +               cp VERSION "$@"; \
> > diff --git a/meta/recipes-extended/ltp/ltp_20120401.bbb/meta/recipes-extended/ltp/
> ltp_20120401.bb
> > index 912d6d9..563bd58 100644
> > --- a/meta/recipes-extended/ltp/ltp_20120401.bb
> > +++ b/meta/recipes-extended/ltp/ltp_20120401.bb
> > @@ -21,10 +21,10 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
> >
> >  DEPENDS = "attr"
> >
> > -PR = "r3"
> > +PR = "r4"
> >
> >  SRC_URI = "${SOURCEFORGE_MIRROR}/ltp/ltp-full-${PV}.bz2 \
> > -          "
> > +           file://fix_building_fom_archive.patch"
> >
> >  SRC_URI[md5sum] = "e1d0acf1a6b6da0cb30dc1b0dcf5f26d"
> >  SRC_URI[sha256sum] =
> "f0f5845f9666f61332fdf0b7e396fc647f9372db0902a829af2cf9402b807bd1"
> > --
> > 1.7.9.5
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> This patch seems to be causing build failures:
>
> | ERROR: Function failed: do_compile (see
>
> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/work/ppc603e-poky-linux/ltp-20120401-r4/temp/log.do_compile.695
> for further information)
> | NOTE: make -j 16
> | make -C "lib" \
> |       -f
> "/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/work/ppc603e-poky-linux/ltp-20120401-r4/ltp-20120401/lib/Makefile"
> all
> | git describe &> /dev/null
> | make: *** [Version] Error 128
> | make: *** Waiting for unfinished jobs....
> | make[1]: Entering directory
>
> `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/work/ppc603e-poky-linux/ltp-20120401-r4/ltp-20120401/lib'
> | make[1]: Nothing to be done for `all'.
> | make[1]: Leaving directory
>
> `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/work/ppc603e-poky-linux/ltp-20120401-r4/ltp-20120401/lib'
> | ERROR: oe_runmake failed
>
>
>
> -b
>
> --
> Elizabeth Flanagan
> Yocto Project
> Build and Release
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--14dae9341141ca577e04c1a92f78
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Confirmed.<br clear=3D"all"><div style=3D"text-align:center"></div><div sty=
le=3D"text-align:center"><div align=3D"left" style=3D"font-family:&#39;Time=
s New Roman&#39;;font-size:medium"><font face=3D"Arial" color=3D"#333333" s=
ize=3D"-1"><br>

@g</font></div></div>
<br><br><div class=3D"gmail_quote">On Sat, Jun 2, 2012 at 7:59 PM, Flanagan=
, Elizabeth <span dir=3D"ltr">&lt;<a href=3D"mailto:elizabeth.flanagan@inte=
l.com" target=3D"_blank">elizabeth.flanagan@intel.com</a>&gt;</span> wrote:=
<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">On Fri, Jun 1, 2012 at 12:52 AM, Cristian Io=
rga<br>
&lt;<a href=3D"mailto:cristian.iorga@intel.com">cristian.iorga@intel.com</a=
>&gt; wrote:<br>
&gt; ltp makefile does not interpret correctly the result of git describe<b=
r>
&gt; command and assumes that it is working with a git repo, while in fact<=
br>
&gt; working with a source code archive.<br>
&gt; Added a patch to corect makefile system.<br>
&gt;<br>
&gt; Signed-off-by: Cristian Iorga &lt;<a href=3D"mailto:cristian.iorga@int=
el.com">cristian.iorga@intel.com</a>&gt;<br>
&gt; ---<br>
&gt; =A0.../ltp/ltp/fix_building_fom_archive.patch =A0 =A0 =A0 =A0 | =A0 23=
 ++++++++++++++++++++<br>
&gt; =A0meta/recipes-extended/ltp/<a href=3D"http://ltp_20120401.bb" target=
=3D"_blank">ltp_20120401.bb</a> =A0 =A0 =A0 =A0 =A0| =A0 =A04 ++--<br>
&gt; =A02 files changed, 25 insertions(+), 2 deletions(-)<br>
&gt; =A0create mode 100644 meta/recipes-extended/ltp/ltp/fix_building_fom_a=
rchive.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-extended/ltp/ltp/fix_building_fom_archive.pa=
tch b/meta/recipes-extended/ltp/ltp/fix_building_fom_archive.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000..c0ecc86<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-extended/ltp/ltp/fix_building_fom_archive.patch<br>
&gt; @@ -0,0 +1,23 @@<br>
&gt; +ltp package build system is broken if building from archive<br>
&gt; +<br>
&gt; +ltp makefile does not interpret correctly the result of git describe<=
br>
&gt; +command and assumes that it is working with a git repo, while in fact=
<br>
&gt; +working with a source code archive.<br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
&gt; +Signed-off-by: Cristian Iorga &lt;<a href=3D"mailto:cristian.iorga@in=
tel.com">cristian.iorga@intel.com</a>&gt;<br>
&gt; +<br>
&gt; +Index: ltp-20120401/Makefile<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +--- ltp-20120401.orig/Makefile<br>
&gt; ++++ ltp-20120401/Makefile<br>
&gt; +@@ -173,7 +173,8 @@ SRCDIR_INSTALL_TARGETS =A0 =A0 :=3D $(SRCDIR_INST=
A<br>
&gt; + #<br>
&gt; + .PHONY: Version<br>
&gt; + Version:<br>
&gt; +- =A0 =A0 =A0if git describe &amp;&gt; /dev/null; then \<br>
&gt; ++ =A0 =A0 =A0git describe &amp;&gt; /dev/null<br>
&gt; ++ =A0 =A0 =A0if [ $? -eq 0 ]; then \<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 git describe &gt; &quot;$@&quot;; \<br>
&gt; + =A0 =A0 =A0 else \<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cp VERSION &quot;$@&quot;; \<br>
&gt; diff --git a/meta/recipes-extended/ltp/<a href=3D"http://ltp_20120401.=
bb" target=3D"_blank">ltp_20120401.bb</a> b/meta/recipes-extended/ltp/<a hr=
ef=3D"http://ltp_20120401.bb" target=3D"_blank">ltp_20120401.bb</a><br>
&gt; index 912d6d9..563bd58 100644<br>
&gt; --- a/meta/recipes-extended/ltp/<a href=3D"http://ltp_20120401.bb" tar=
get=3D"_blank">ltp_20120401.bb</a><br>
&gt; +++ b/meta/recipes-extended/ltp/<a href=3D"http://ltp_20120401.bb" tar=
get=3D"_blank">ltp_20120401.bb</a><br>
&gt; @@ -21,10 +21,10 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D06=
36e73ff0215e8d672dc4c32c317bb3 \<br>
&gt;<br>
&gt; =A0DEPENDS =3D &quot;attr&quot;<br>
&gt;<br>
&gt; -PR =3D &quot;r3&quot;<br>
&gt; +PR =3D &quot;r4&quot;<br>
&gt;<br>
&gt; =A0SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/ltp/ltp-full-${PV}.bz2 \<br=
>
&gt; - =A0 =A0 =A0 =A0 =A0&quot;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 file://fix_building_fom_archive.patch&quot;<br>
&gt;<br>
&gt; =A0SRC_URI[md5sum] =3D &quot;e1d0acf1a6b6da0cb30dc1b0dcf5f26d&quot;<br=
>
&gt; =A0SRC_URI[sha256sum] =3D &quot;f0f5845f9666f61332fdf0b7e396fc647f9372=
db0902a829af2cf9402b807bd1&quot;<br>
&gt; --<br>
&gt; 1.7.9.5<br>
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
This patch seems to be causing build failures:<br>
<br>
| ERROR: Function failed: do_compile (see<br>
/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/t=
mp/work/ppc603e-poky-linux/ltp-20120401-r4/temp/log.do_compile.695<br>
for further information)<br>
| NOTE: make -j 16<br>
| make -C &quot;lib&quot; \<br>
| =A0 =A0 =A0 -f &quot;/srv/home/pokybuild/yocto-autobuilder/yocto-slave/ni=
ghtly-ppc/build/build/tmp/work/ppc603e-poky-linux/ltp-20120401-r4/ltp-20120=
401/lib/Makefile&quot;<br>
all<br>
| git describe &amp;&gt; /dev/null<br>
| make: *** [Version] Error 128<br>
| make: *** Waiting for unfinished jobs....<br>
| make[1]: Entering directory<br>
`/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/=
tmp/work/ppc603e-poky-linux/ltp-20120401-r4/ltp-20120401/lib&#39;<br>
| make[1]: Nothing to be done for `all&#39;.<br>
| make[1]: Leaving directory<br>
`/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/=
tmp/work/ppc603e-poky-linux/ltp-20120401-r4/ltp-20120401/lib&#39;<br>
| ERROR: oe_runmake failed<br>
<br>
<br>
<br>
-b<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Elizabeth Flanagan<br>
Yocto Project<br>
Build and Release<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</font></span></blockquote></div><br>

--14dae9341141ca577e04c1a92f78--
