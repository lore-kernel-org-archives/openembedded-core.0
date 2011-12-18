Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RcQHC-0006rp-43
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 00:36:18 +0100
Received: by lami14 with SMTP id i14so1976899lam.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Dec 2011 15:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=WDEmhQE43S5sT6Gd9hVD8hOrJmE2ZxZmA068NWIueP8=;
	b=C6846eXbV7OtKbflpQ7oQJuPHc3gsKgNeKqb2iQ+9lLfIBqsgXrpQb9pAh7P0HBwxe
	Lt00RCrUr417nURFXSnbk54KXTuCx33GWo0DGI8elCM252C+Kc2FMWiozzh3n61ZZQDH
	PvZUK1mV4pYdEX9CWFKx93i0JxlbVc9PqenWs=
MIME-Version: 1.0
Received: by 10.152.104.103 with SMTP id gd7mr14363852lab.34.1324250955655;
	Sun, 18 Dec 2011 15:29:15 -0800 (PST)
Received: by 10.152.36.198 with HTTP; Sun, 18 Dec 2011 15:29:15 -0800 (PST)
In-Reply-To: <1324237652-15618-2-git-send-email-dbaryshkov@gmail.com>
References: <1324237652-15618-1-git-send-email-dbaryshkov@gmail.com>
	<1324237652-15618-2-git-send-email-dbaryshkov@gmail.com>
Date: Sun, 18 Dec 2011 15:29:15 -0800
Message-ID: <CAMKF1sofqczGSZg47zkRdFU+f-FntO4-Tms_pi9kTs=3cs_kVw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] Move check that all installed files are shipped into insane.bbclass
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
X-List-Received-Date: Sun, 18 Dec 2011 23:36:18 -0000
Content-Type: multipart/alternative; boundary=f46d04088e85ce2a9b04b4663342

--f46d04088e85ce2a9b04b4663342
Content-Type: text/plain; charset=UTF-8

On Sunday, December 18, 2011, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
wrote:
> Checking that all installed files are shipped is in reality a QA check.
> It would benefit from mechanisms like ERROR_QA/WARNING_QA. So move it
> into insane.bbclass. If some of the files are installed but should not
> be shipped for some reasons, one can add them to the variable
> IGNORE_UNSHIPPED_FILES.
>

This needs to be documented somewhere too and may be added to
sample.conf.extended

> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> ---
>  meta/classes/insane.bbclass  |   50
++++++++++++++++++++++++++++++++++++++++-
>  meta/classes/package.bbclass |   15 ------------
>  2 files changed, 48 insertions(+), 17 deletions(-)
>
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 5726e69..41b815c 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -100,7 +100,7 @@ def package_qa_get_machine_dict():
>
>
>  # Currently not being used by default "desktop"
> -WARN_QA ?= "ldflags useless-rpaths rpaths"
> +WARN_QA ?= "ldflags useless-rpaths rpaths unshipped"
>  ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch la2 pkgconfig
la perms"
>
>  def package_qa_clean_path(path,d):
> @@ -485,6 +485,49 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, d):
>
>     return sane
>
> +IGNORE_UNSHIPPED_FILES ??= ""
> +
> +def packages_qa_unshipped_files(d):
> +    warn = (d.getVar('WARN_QA', True) or "").split()
> +    err = (d.getVar('ERROR_QA', True) or "").split()
> +    if not "unshipped" in warn + err:
> +        return True
> +
> +    seen = d.getVar('IGNORE_UNSHIPPED_FILES', True).split()
> +    unshipped = []
> +    dvar = d.getVar('PKGD', True)
> +    destvar = d.getVar('PKGDEST', True)
> +    packages = d.getVar('PACKAGES', True).split()
> +    for p in packages:
> +        pdir = os.path.join(destvar, p)
> +        for root, dirs, files in os.walk(pdir):
> +            dir = root[len(pdir):]
> +            if not dir:
> +                dir = os.sep
> +            for f in (files + dirs):
> +                path = os.path.join(dir, f)
> +                if path not in seen
> +                    seen.append(path)
> +
> +    for root, dirs, files in os.walk(dvar):
> +        dir = root[len(dvar):]
> +        if not dir:
> +            dir = os.sep
> +        for f in (files + dirs):
> +            path = os.path.join(dir, f)
> +            if path not in seen:
> +                unshipped.append(path)
> +
> +    pn = d.getVar('PN', True)
> +
> +    if unshipped == []:
> +        return True
> +
> +    ret = package_qa_handle_error("unshipped", "For recipe %s, the
following files/directories were installed but not shipped in any package:"
% pn, d)
> +    for f in unshipped:
> +        package_qa_handle_error("unshipped", f, d)
> +    return ret
> +
>  # The PACKAGE FUNC to scan each package
>  python do_package_qa () {
>     bb.note("DO PACKAGE QA")
> @@ -522,6 +565,7 @@ python do_package_qa () {
>     g = globals()
>     walk_sane = True
>     rdepends_sane = True
> +    shipped_sane = True
>     for package in packages.split():
>         skip = (d.getVar('INSANE_SKIP_' + package, True) or "").split()
>         if skip:
> @@ -546,8 +590,10 @@ python do_package_qa () {
>         if not package_qa_check_rdepends(package, pkgdest, skip, d):
>             rdepends_sane = False
>
> +    if not packages_qa_unshipped_files(d):
> +        shipped_sane = False
>
> -    if not walk_sane or not rdepends_sane:
> +    if not walk_sane or not rdepends_sane or not shipped_sane:
>         bb.fatal("QA run found fatal errors. Please consider fixing
them.")
>     bb.note("DONE with PACKAGE QA")
>  }
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 39c1d4b..fbea9c6 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -957,21 +957,6 @@ python populate_packages () {
>                del localdata
>        os.chdir(workdir)
>
> -       unshipped = []
> -       for root, dirs, files in os.walk(dvar):
> -               dir = root[len(dvar):]
> -               if not dir:
> -                       dir = os.sep
> -               for f in (files + dirs):
> -                       path = os.path.join(dir, f)
> -                       if ('.' + path) not in seen:
> -                               unshipped.append(path)
> -
> -       if unshipped != []:
> -               bb.warn("For recipe %s, the following files/directories
were installed but not shipped in any package:" % pn)
> -               for f in unshipped:
> -                       bb.warn("  " + f)
> -
>        bb.build.exec_func("package_name_hook", d)
>
>        for pkg in package_list:
> --
> 1.7.7.3
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--f46d04088e85ce2a9b04b4663342
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Sunday, December 18, 2011, Dmitry Eremin-Solenikov &lt;<a href=
=3D"mailto:dbaryshkov@gmail.com">dbaryshkov@gmail.com</a>&gt; wrote:<br>&gt=
; Checking that all installed files are shipped is in reality a QA check.<b=
r>
&gt; It would benefit from mechanisms like ERROR_QA/WARNING_QA. So move it<=
br>&gt; into insane.bbclass. If some of the files are installed but should =
not<br>&gt; be shipped for some reasons, one can add them to the variable<b=
r>
&gt; IGNORE_UNSHIPPED_FILES.<br>&gt;<br><br>This needs to be documented som=
ewhere too and may be added to sample.conf.extended<br><br>&gt; Signed-off-=
by: Dmitry Eremin-Solenikov &lt;<a href=3D"mailto:dbaryshkov@gmail.com">dba=
ryshkov@gmail.com</a>&gt;<br>
&gt; ---<br>&gt; =C2=A0meta/classes/insane.bbclass =C2=A0| =C2=A0 50 ++++++=
++++++++++++++++++++++++++++++++++-<br>&gt; =C2=A0meta/classes/package.bbcl=
ass | =C2=A0 15 ------------<br>&gt; =C2=A02 files changed, 48 insertions(+=
), 17 deletions(-)<br>&gt;<br>
&gt; diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass=
<br>&gt; index 5726e69..41b815c 100644<br>&gt; --- a/meta/classes/insane.bb=
class<br>&gt; +++ b/meta/classes/insane.bbclass<br>&gt; @@ -100,7 +100,7 @@=
 def package_qa_get_machine_dict():<br>
&gt;<br>&gt;<br>&gt; =C2=A0# Currently not being used by default &quot;desk=
top&quot;<br>&gt; -WARN_QA ?=3D &quot;ldflags useless-rpaths rpaths&quot;<b=
r>&gt; +WARN_QA ?=3D &quot;ldflags useless-rpaths rpaths unshipped&quot;<br=
>&gt; =C2=A0ERROR_QA ?=3D &quot;dev-so debug-deps dev-deps debug-files arch=
 la2 pkgconfig la perms&quot;<br>
&gt;<br>&gt; =C2=A0def package_qa_clean_path(path,d):<br>&gt; @@ -485,6 +48=
5,49 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, d):<br>&gt;<br>&g=
t; =C2=A0 =C2=A0 return sane<br>&gt;<br>&gt; +IGNORE_UNSHIPPED_FILES ??=3D =
&quot;&quot;<br>
&gt; +<br>&gt; +def packages_qa_unshipped_files(d):<br>&gt; + =C2=A0 =C2=A0=
warn =3D (d.getVar(&#39;WARN_QA&#39;, True) or &quot;&quot;).split()<br>&gt=
; + =C2=A0 =C2=A0err =3D (d.getVar(&#39;ERROR_QA&#39;, True) or &quot;&quot=
;).split()<br>&gt; + =C2=A0 =C2=A0if not &quot;unshipped&quot; in warn + er=
r:<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0return True<br>&gt; +<br>&gt; + =C2=A0 =
=C2=A0seen =3D d.getVar(&#39;IGNORE_UNSHIPPED_FILES&#39;, True).split()<br>=
&gt; + =C2=A0 =C2=A0unshipped =3D []<br>&gt; + =C2=A0 =C2=A0dvar =3D d.getV=
ar(&#39;PKGD&#39;, True)<br>&gt; + =C2=A0 =C2=A0destvar =3D d.getVar(&#39;P=
KGDEST&#39;, True)<br>
&gt; + =C2=A0 =C2=A0packages =3D d.getVar(&#39;PACKAGES&#39;, True).split()=
<br>&gt; + =C2=A0 =C2=A0for p in packages:<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0pdir =3D os.path.join(destvar, p)<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0for root, dirs, files in os.walk(pdir):<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0dir =3D root[len(pdir):]<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not dir:<br>&gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dir =3D os.sep<br>&gt; =
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for f in (files + dirs):<br>&gt;=
 + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0path =3D os.path.=
join(dir, f)<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if path not in seen<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0seen.append(path)<br>
&gt; +<br>&gt; + =C2=A0 =C2=A0for root, dirs, files in os.walk(dvar):<br>&g=
t; + =C2=A0 =C2=A0 =C2=A0 =C2=A0dir =3D root[len(dvar):]<br>&gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0if not dir:<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dir =3D os.sep<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0for f in (fil=
es + dirs):<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0path =3D os.=
path.join(dir, f)<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if path not in seen:<br>&gt=
; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unshipped.append=
(path)<br>&gt; +<br>&gt; + =C2=A0 =C2=A0pn =3D d.getVar(&#39;PN&#39;, True)=
<br>&gt; +<br>&gt; + =C2=A0 =C2=A0if unshipped =3D=3D []:<br>&gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0return True<br>&gt; +<br>
&gt; + =C2=A0 =C2=A0ret =3D package_qa_handle_error(&quot;unshipped&quot;, =
&quot;For recipe %s, the following files/directories were installed but not=
 shipped in any package:&quot; % pn, d)<br>&gt; + =C2=A0 =C2=A0for f in uns=
hipped:<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0package_qa_handle_error(&quot;=
unshipped&quot;, f, d)<br>
&gt; + =C2=A0 =C2=A0return ret<br>&gt; +<br>&gt; =C2=A0# The PACKAGE FUNC t=
o scan each package<br>&gt; =C2=A0python do_package_qa () {<br>&gt; =C2=A0 =
=C2=A0 bb.note(&quot;DO PACKAGE QA&quot;)<br>&gt; @@ -522,6 +565,7 @@ pytho=
n do_package_qa () {<br>&gt; =C2=A0 =C2=A0 g =3D globals()<br>
&gt; =C2=A0 =C2=A0 walk_sane =3D True<br>&gt; =C2=A0 =C2=A0 rdepends_sane =
=3D True<br>&gt; + =C2=A0 =C2=A0shipped_sane =3D True<br>&gt; =C2=A0 =C2=A0=
 for package in packages.split():<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 skip =
=3D (d.getVar(&#39;INSANE_SKIP_&#39; + package, True) or &quot;&quot;).spli=
t()<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 if skip:<br>&gt; @@ -546,8 +590,10 @@ pyth=
on do_package_qa () {<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not package_qa=
_check_rdepends(package, pkgdest, skip, d):<br>&gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 rdepends_sane =3D False<br>&gt;<br>&gt; + =C2=A0 =C2=
=A0if not packages_qa_unshipped_files(d):<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0shipped_sane =3D False<br>&gt;<br>&gt; - =
=C2=A0 =C2=A0if not walk_sane or not rdepends_sane:<br>&gt; + =C2=A0 =C2=A0=
if not walk_sane or not rdepends_sane or not shipped_sane:<br>&gt; =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 bb.fatal(&quot;QA run found fatal errors. Please consi=
der fixing them.&quot;)<br>
&gt; =C2=A0 =C2=A0 bb.note(&quot;DONE with PACKAGE QA&quot;)<br>&gt; =C2=A0=
}<br>&gt; diff --git a/meta/classes/package.bbclass b/meta/classes/package.=
bbclass<br>&gt; index 39c1d4b..fbea9c6 100644<br>&gt; --- a/meta/classes/pa=
ckage.bbclass<br>
&gt; +++ b/meta/classes/package.bbclass<br>&gt; @@ -957,21 +957,6 @@ python=
 populate_packages () {<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0del localdata<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0os.chdir(work=
dir)<br>&gt;<br>&gt; - =C2=A0 =C2=A0 =C2=A0 unshipped =3D []<br>&gt; - =C2=
=A0 =C2=A0 =C2=A0 for root, dirs, files in os.walk(dvar):<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dir =3D root[len(dv=
ar):]<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not dir=
:<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 dir =3D os.sep<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 for f in (files + dirs):<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 path =3D os.path.join(=
dir, f)<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (&#39;.&#39; + path) not in seen:<br>&gt; - =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 unshipped.append(path)<br>&gt; -<br>&gt; - =C2=A0 =C2=A0 =C2=
=A0 if unshipped !=3D []:<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 bb.warn(&quot;For recipe %s, the following files/directories wer=
e installed but not shipped in any package:&quot; % pn)<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for f in unshipped:=
<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 bb.warn(&quot; =C2=A0&quot; + f)<br>&gt; -<br>&gt; =C2=A0 =C2=
=A0 =C2=A0 =C2=A0bb.build.exec_func(&quot;package_name_hook&quot;, d)<br>&g=
t;<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0for pkg in package_list:<br>
&gt; --<br>&gt; 1.7.7.3<br>&gt;<br>&gt;<br>&gt; ___________________________=
____________________<br>&gt; Openembedded-core mailing list<br>&gt; <a href=
=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@list=
s.openembedded.org</a><br>
&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedde=
d-core</a><br>&gt;

--f46d04088e85ce2a9b04b4663342--
