Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web11.5747.1617304472001332053
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Apr 2021 12:14:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pYCJpslC;
 spf=pass (domain: gmail.com, ip: 209.85.166.42, mailfrom: devendra.tewari@gmail.com)
Received: by mail-io1-f42.google.com with SMTP id x17so3279631iog.2
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Apr 2021 12:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2fBYU4EBH+tA7XVAxiQwFhA9ratZJquzHaZX2SKrMuk=;
        b=pYCJpslCSq9kN843fPOTaLlxskFP9OGxRqt+mfKAi13AL/wl0bi2FcVltB98cVarF5
         UXujnDGCp94wYCEKydRob3o7RTxcBYazke2W19netiwnMb0HwRjWureaTvQW7Qg3dddY
         EzejelGnlBonFtoFkB54Y7hhWjmrfQS23uC1anrSnNs4XDfdN3GcTWm+Rt4lLV06E+F5
         jSkUL4nl8G1K52YqPShSYWFre/l+0cL8AyXEzuUuo9DLZ2zZxt47aBBrPxti5hdXw1hG
         GkDIrv7sFSLJYZj7X+qi1j1BwsA15uHPtmTKwUNgYONG+qNtH92t6S6seFZrZeRXSIj/
         bN1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2fBYU4EBH+tA7XVAxiQwFhA9ratZJquzHaZX2SKrMuk=;
        b=gB8WhkSo9Em0PadugJUXDdCCTWP/5I3AvtisdbOLon+RyiSZ1L1GznCvhVvOQglVdF
         esXN8f2FSUC0V5aZKuxRBJqNV34LIAlythQIr+5gsuTDB/XmOlK3OxMVVrFgigXgWNTk
         4VrzGQbpks8O0z3uJ8LgO15mKE+/hOF7IrxdBDxomsoPTxcbnJeFeSuEqJnKBlWFX9F3
         /ZfmUKoB+tC8Sn6t2vISJCoKlQMXilF5O8kRQSGB63AxiFUTEGS79brVVm6HacG9tq+h
         UcJFPU9YL1+skcgGTShL0Vb1ZjJzHX9s6oz/roG/00c5u0eqERPmC4IJ3wRgA2kAbxwY
         bEdw==
X-Gm-Message-State: AOAM532jfVVK69c2IyeM4LXrCoGeUQJawCfMW95hNtHGlY9CS+DpzXnq
	2rBNZpQE671LlSDLOE/zM1IXa7sKycKEbA2lw/A=
X-Google-Smtp-Source: ABdhPJxP/r5gubwBr59+xyscAJ5KstrO6GtNKRqA1zuB5Yw1BtABd84htBrAqAS0Bdo4IWzmPecr+OfByWUxSAu33ig=
X-Received: by 2002:a6b:fd07:: with SMTP id c7mr7999043ioi.198.1617304471329;
 Thu, 01 Apr 2021 12:14:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210330215941.GD23013@denix.org> <3FA0EC13-0FC5-4E14-AC33-731A23F515F9@gmail.com>
In-Reply-To: <3FA0EC13-0FC5-4E14-AC33-731A23F515F9@gmail.com>
From: "Devendra Tewari" <devendra.tewari@gmail.com>
Date: Thu, 1 Apr 2021 16:14:19 -0300
Message-ID: <CAEuZuT+K=T_HED0UT3h4PeHa3DLwrA_jQWg9w+SnKy2mNReLag@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Use shutil.move when os.rename fails
To: Denys Dmytriyenko <denis@denix.org>
Cc: Konrad Weihmann <kweihmann@outlook.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000081e14d05beee0a21"

--00000000000081e14d05beee0a21
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From 57b633a93bd91b7b1aa21cce5ac7997b958ca917 Mon Sep 17 00:00:00 2001
From: Devendra Tewari <devendra.tewari@gmail.com>
Date: Thu, 1 Apr 2021 16:07:25 -0300
Subject: [PATCH] Use shutil.move when os.rename fails

Incremental build in Docker fails with

OSError: [Errno 18] Invalid cross-device link

When source and destination are on different overlay filesystems.

This change handles error with os.rename and retries with shutil.move.
The reason os.rename is still used is because shutil.move is too slow
for speed sensitive sections of code.

[Yocto #14301]
---
 meta/classes/sstate.bbclass | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 8e8efd18d5..60f7a94285 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -384,6 +384,7 @@ def sstate_installpkg(ss, d):
 def sstate_installpkgdir(ss, d):
     import oe.path
     import subprocess
+    import shutil

     sstateinst =3D d.getVar("SSTATE_INSTDIR")
     d.setVar('SSTATE_FIXMEDIR', ss['fixmedir'])
@@ -401,7 +402,10 @@ def sstate_installpkgdir(ss, d):

     for state in ss['dirs']:
         prepdir(state[1])
-        os.rename(sstateinst + state[0], state[1])
+        try:
+            os.rename(sstateinst + state[0], state[1])
+        except OSError:
+            shutil.move(sstateinst + state[0], state[1])
     sstate_install(ss, d)

     for plain in ss['plaindirs']:
@@ -413,7 +417,10 @@ def sstate_installpkgdir(ss, d):
         dest =3D plain
         bb.utils.mkdirhier(src)
         prepdir(dest)
-        os.rename(src, dest)
+        try:
+            os.rename(src, dest)
+        except OSError:
+            shutil.move(src, dest)

     return True

@@ -638,6 +645,7 @@ python sstate_hardcode_path () {

 def sstate_package(ss, d):
     import oe.path
+    import shutil

     tmpdir =3D d.getVar('TMPDIR')

@@ -664,7 +672,10 @@ def sstate_package(ss, d):
                     continue
                 bb.error("sstate found an absolute path symlink %s
pointing at %s. Please replace this with a relative link." % (srcpath,
link))
         bb.debug(2, "Preparing tree %s for packaging at %s" % (state[1],
sstatebuild + state[0]))
-        os.rename(state[1], sstatebuild + state[0])
+        try:
+            os.rename(state[1], sstatebuild + state[0])
+        except OSError:
+            shutil.move(state[1], sstatebuild + state[0])

     workdir =3D d.getVar('WORKDIR')
     sharedworkdir =3D os.path.join(d.getVar('TMPDIR'), "work-shared")
@@ -674,7 +685,10 @@ def sstate_package(ss, d):
             pdir =3D plain.replace(sharedworkdir, sstatebuild)
         bb.utils.mkdirhier(plain)
         bb.utils.mkdirhier(pdir)
-        os.rename(plain, pdir)
+        try:
+            os.rename(plain, pdir)
+        except OSError:
+            shutil.move(plain, pdir)

     d.setVar('SSTATE_BUILDDIR', sstatebuild)
     d.setVar('SSTATE_INSTDIR', sstatebuild)
--=20
2.29.2


On Tue, Mar 30, 2021 at 7:39 PM Devendra Tewari <devendra.tewari@gmail.com>
wrote:

> Here's the correct link
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14301. I'll resubmit
> the patch referencing the bug in the commit message. Thanks.
>
> Em 30 de mar. de 2021, =C3=A0(s) 18:59, Denys Dmytriyenko <denis@denix.or=
g>
> escreveu:
>
> =EF=BB=BFThe link is for a 10-year old bug, probably not what you wanted.
> Also, if a patch fixes existing bug in bugzilla, it needs to reference it
> in
> commit message as well - [YOCTO#1234567]
>
>
> On Mon, Mar 29, 2021 at 12:37:45PM -0300, Devendra Tewari wrote:
>
> Also, this is due to
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1430.
>
>
> On 29 Mar 2021, at 12:35, Devendra Tewari <devendra.tewari@gmail.com>
> wrote:
>
>
> Sure.
>
>
> Would the following commit message be sufficient?
>
>
>   Use shutil.move when os.rename fails
>
>
>   Incremental build in Docker fails with
>
>
>   OSError: [Errno 18] Invalid cross-device link
>
>
>   When source and destination are on different overlay filesystems.
>
>
>   This change handles the error with os.rename and retries with
> shutil.move.
>
>
> Thanks,
>
> Devendra
>
>
> On 29 Mar 2021, at 12:23, Konrad Weihmann <kweihmann@outlook.com> wrote:
>
>
> Yes please quote a bit from the python manpage [1] - I certainly see the
> difference (and the edge cases where os.rename might fail), but that shou=
ld
> be documented as part of the commit message
>
>
> [1] https://docs.python.org/3/library/shutil.html#shutil.move
>
>
> On 29.03.21 17:21, Bruce Ashfield wrote:
>
> Can you document the cases that os.rename() is failing ? And also why
>
> would we expect the shutil.move() to work in those cases ?
>
> If a change like this cases issues in the future, we need that extra
>
> information in the commit head for proper triage.
>
> Bruce
>
> On Mon, Mar 29, 2021 at 11:16 AM Devendra Tewari
>
> <devendra.tewari@gmail.com> wrote:
>
>
> ---
>
> meta/classes/sstate.bbclass | 26 ++++++++++++++++++++++----
>
> 1 file changed, 22 insertions(+), 4 deletions(-)
>
>
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
>
> index f579168162..f94aa96d70 100644
>
> --- a/meta/classes/sstate.bbclass
>
> +++ b/meta/classes/sstate.bbclass
>
> @@ -384,6 +384,7 @@ def sstate_installpkg(ss, d):
>
> def sstate_installpkgdir(ss, d):
>
>    import oe.path
>
>    import subprocess
>
> +    import shutil
>
>
>    sstateinst =3D d.getVar("SSTATE_INSTDIR")
>
>    d.setVar('SSTATE_FIXMEDIR', ss['fixmedir'])
>
> @@ -401,7 +402,11 @@ def sstate_installpkgdir(ss, d):
>
>
>    for state in ss['dirs']:
>
>        prepdir(state[1])
>
> -        os.rename(sstateinst + state[0], state[1])
>
> +        try:
>
> +            os.rename(sstateinst + state[0], state[1])
>
> +            break
>
> +        except OSError:
>
> +            shutil.move(sstateinst + state[0], state[1])
>
>    sstate_install(ss, d)
>
>
>    for plain in ss['plaindirs']:
>
> @@ -413,7 +418,11 @@ def sstate_installpkgdir(ss, d):
>
>        dest =3D plain
>
>        bb.utils.mkdirhier(src)
>
>        prepdir(dest)
>
> -        os.rename(src, dest)
>
> +        try:
>
> +            os.rename(src, dest)
>
> +            break
>
> +        except OSError:
>
> +            shutil.move(src, dest)
>
>
>    return True
>
>
> @@ -638,6 +647,7 @@ python sstate_hardcode_path () {
>
>
> def sstate_package(ss, d):
>
>    import oe.path
>
> +    import shutil
>
>
>    tmpdir =3D d.getVar('TMPDIR')
>
>
> @@ -664,7 +674,11 @@ def sstate_package(ss, d):
>
>                    continue
>
>                bb.error("sstate found an absolute path symlink %s pointin=
g
> at %s. Please replace this with a relative link." % (srcpath, link))
>
>        bb.debug(2, "Preparing tree %s for packaging at %s" % (state[1],
> sstatebuild + state[0]))
>
> -        os.rename(state[1], sstatebuild + state[0])
>
> +        try:
>
> +            os.rename(state[1], sstatebuild + state[0])
>
> +            break
>
> +        except OSError:
>
> +            shutil.move(state[1], sstatebuild + state[0])
>
>
>    workdir =3D d.getVar('WORKDIR')
>
>    sharedworkdir =3D os.path.join(d.getVar('TMPDIR'), "work-shared")
>
> @@ -674,7 +688,11 @@ def sstate_package(ss, d):
>
>            pdir =3D plain.replace(sharedworkdir, sstatebuild)
>
>        bb.utils.mkdirhier(plain)
>
>        bb.utils.mkdirhier(pdir)
>
> -        os.rename(plain, pdir)
>
> +        try:
>
> +            os.rename(plain, pdir)
>
> +            break
>
> +        except OSError:
>
> +            shutil.move(plain, pdir)
>
>
>    d.setVar('SSTATE_BUILDDIR', sstatebuild)
>
>    d.setVar('SSTATE_INSTDIR', sstatebuild)
>
> --
>
> 2.29.2
>
>
>
>
>
>
>
>
>

--00000000000081e14d05beee0a21
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>From 57b633a93bd91b7b1aa21cce5ac7997=
b958ca917 Mon Sep 17 00:00:00 2001</div><div>From: Devendra Tewari &lt;<a h=
ref=3D"mailto:devendra.tewari@gmail.com">devendra.tewari@gmail.com</a>&gt;<=
/div><div>Date: Thu, 1 Apr 2021 16:07:25 -0300</div><div>Subject: [PATCH] U=
se shutil.move when os.rename fails</div><div><br></div><div>Incremental bu=
ild in Docker fails with</div><div><br></div><div>OSError: [Errno 18] Inval=
id cross-device link</div><div><br></div><div>When source and destination a=
re on different overlay filesystems.</div><div><br></div><div>This change h=
andles error with os.rename and retries with shutil.move.</div><div>The rea=
son os.rename is still used is because shutil.move is too slow</div><div>fo=
r speed sensitive sections of code.</div><div><br></div><div>[Yocto #14301]=
</div><div>---</div><div>=C2=A0meta/classes/sstate.bbclass | 22 +++++++++++=
+++++++----</div><div>=C2=A01 file changed, 18 insertions(+), 4 deletions(-=
)</div><div><br></div><div>diff --git a/meta/classes/sstate.bbclass b/meta/=
classes/sstate.bbclass</div><div>index 8e8efd18d5..60f7a94285 100644</div><=
div>--- a/meta/classes/sstate.bbclass</div><div>+++ b/meta/classes/sstate.b=
bclass</div><div>@@ -384,6 +384,7 @@ def sstate_installpkg(ss, d):</div><di=
v>=C2=A0def sstate_installpkgdir(ss, d):</div><div>=C2=A0 =C2=A0 =C2=A0impo=
rt oe.path</div><div>=C2=A0 =C2=A0 =C2=A0import subprocess</div><div>+ =C2=
=A0 =C2=A0import shutil</div><div>=C2=A0</div><div>=C2=A0 =C2=A0 =C2=A0ssta=
teinst =3D d.getVar(&quot;SSTATE_INSTDIR&quot;)</div><div>=C2=A0 =C2=A0 =C2=
=A0d.setVar(&#39;SSTATE_FIXMEDIR&#39;, ss[&#39;fixmedir&#39;])</div><div>@@=
 -401,7 +402,10 @@ def sstate_installpkgdir(ss, d):</div><div>=C2=A0</div><=
div>=C2=A0 =C2=A0 =C2=A0for state in ss[&#39;dirs&#39;]:</div><div>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0prepdir(state[1])</div><div>- =C2=A0 =C2=A0 =C2=
=A0 =C2=A0os.rename(sstateinst + state[0], state[1])</div><div>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0try:</div><div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
os.rename(sstateinst + state[0], state[1])</div><div>+ =C2=A0 =C2=A0 =C2=A0=
 =C2=A0except OSError:</div><div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0shutil.move(sstateinst + state[0], state[1])</div><div>=C2=A0 =C2=A0 =C2=
=A0sstate_install(ss, d)</div><div>=C2=A0</div><div>=C2=A0 =C2=A0 =C2=A0for=
 plain in ss[&#39;plaindirs&#39;]:</div><div>@@ -413,7 +417,10 @@ def sstat=
e_installpkgdir(ss, d):</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dest =
=3D plain</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.utils.mkdirhier(sr=
c)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prepdir(dest)</div><div>- =
=C2=A0 =C2=A0 =C2=A0 =C2=A0os.rename(src, dest)</div><div>+ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0try:</div><div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.r=
ename(src, dest)</div><div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0except OSError:</di=
v><div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shutil.move(src, dest)</d=
iv><div>=C2=A0</div><div>=C2=A0 =C2=A0 =C2=A0return True</div><div>=C2=A0</=
div><div>@@ -638,6 +645,7 @@ python sstate_hardcode_path () {</div><div>=C2=
=A0</div><div>=C2=A0def sstate_package(ss, d):</div><div>=C2=A0 =C2=A0 =C2=
=A0import oe.path</div><div>+ =C2=A0 =C2=A0import shutil</div><div>=C2=A0</=
div><div>=C2=A0 =C2=A0 =C2=A0tmpdir =3D d.getVar(&#39;TMPDIR&#39;)</div><di=
v>=C2=A0</div><div>@@ -664,7 +672,10 @@ def sstate_package(ss, d):</div><di=
v>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0continue</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0bb.error(&quot;sstate found an absolute path symlink %s pointing =
at %s. Please replace this with a relative link.&quot; % (srcpath, link))</=
div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.debug(2, &quot;Preparing tree=
 %s for packaging at %s&quot; % (state[1], sstatebuild + state[0]))</div><d=
iv>- =C2=A0 =C2=A0 =C2=A0 =C2=A0os.rename(state[1], sstatebuild + state[0])=
</div><div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0try:</div><div>+ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0os.rename(state[1], sstatebuild + state[0])</div><d=
iv>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0except OSError:</div><div>+ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0shutil.move(state[1], sstatebuild + state[0])</d=
iv><div>=C2=A0</div><div>=C2=A0 =C2=A0 =C2=A0workdir =3D d.getVar(&#39;WORK=
DIR&#39;)</div><div>=C2=A0 =C2=A0 =C2=A0sharedworkdir =3D os.path.join(d.ge=
tVar(&#39;TMPDIR&#39;), &quot;work-shared&quot;)</div><div>@@ -674,7 +685,1=
0 @@ def sstate_package(ss, d):</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0pdir =3D plain.replace(sharedworkdir, sstatebuild)</div><d=
iv>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.utils.mkdirhier(plain)</div><div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.utils.mkdirhier(pdir)</div><div>- =C2=
=A0 =C2=A0 =C2=A0 =C2=A0os.rename(plain, pdir)</div><div>+ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0try:</div><div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.r=
ename(plain, pdir)</div><div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0except OSError:</=
div><div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shutil.move(plain, pdir=
)</div><div>=C2=A0</div><div>=C2=A0 =C2=A0 =C2=A0d.setVar(&#39;SSTATE_BUILD=
DIR&#39;, sstatebuild)</div><div>=C2=A0 =C2=A0 =C2=A0d.setVar(&#39;SSTATE_I=
NSTDIR&#39;, sstatebuild)</div><div>--=C2=A0</div><div>2.29.2</div><div><br=
></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Tue, Mar 30, 2021 at 7:39 PM Devendra Tewari &lt;<a href=3D=
"mailto:devendra.tewari@gmail.com">devendra.tewari@gmail.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,=
204,204);padding-left:1ex"><div dir=3D"auto"><div dir=3D"ltr">Here&#39;s th=
e correct link=C2=A0<a href=3D"https://bugzilla.yoctoproject.org/show_bug.c=
gi?id=3D14301" target=3D"_blank">https://bugzilla.yoctoproject.org/show_bug=
.cgi?id=3D14301</a>. I&#39;ll resubmit the patch referencing the bug in the=
 commit message. Thanks.</div><div dir=3D"ltr"><br><blockquote type=3D"cite=
">Em 30 de mar. de 2021, =C3=A0(s) 18:59, Denys Dmytriyenko &lt;<a href=3D"=
mailto:denis@denix.org" target=3D"_blank">denis@denix.org</a>&gt; escreveu:=
<br><br></blockquote></div><blockquote type=3D"cite"><div dir=3D"ltr">=EF=
=BB=BF<span>The link is for a 10-year old bug, probably not what you wanted=
.</span><br><span>Also, if a patch fixes existing bug in bugzilla, it needs=
 to reference it in </span><br><span>commit message as well - [YOCTO#123456=
7]</span><br><span></span><br><span></span><br><span>On Mon, Mar 29, 2021 a=
t 12:37:45PM -0300, Devendra Tewari wrote:</span><br><blockquote type=3D"ci=
te"><span>Also, this is due to <a href=3D"https://bugzilla.yoctoproject.org=
/show_bug.cgi?id=3D1430" target=3D"_blank">https://bugzilla.yoctoproject.or=
g/show_bug.cgi?id=3D1430</a>.</span><br></blockquote><blockquote type=3D"ci=
te"><span></span><br></blockquote><blockquote type=3D"cite"><blockquote typ=
e=3D"cite"><span>On 29 Mar 2021, at 12:35, Devendra Tewari &lt;<a href=3D"m=
ailto:devendra.tewari@gmail.com" target=3D"_blank">devendra.tewari@gmail.co=
m</a>&gt; wrote:</span><br></blockquote></blockquote><blockquote type=3D"ci=
te"><blockquote type=3D"cite"><span></span><br></blockquote></blockquote><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><span>Sure.</span><br></b=
lockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite">=
<span></span><br></blockquote></blockquote><blockquote type=3D"cite"><block=
quote type=3D"cite"><span>Would the following commit message be sufficient?=
</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote =
type=3D"cite"><span></span><br></blockquote></blockquote><blockquote type=
=3D"cite"><blockquote type=3D"cite"><span> =C2=A0=C2=A0Use shutil.move when=
 os.rename fails</span><br></blockquote></blockquote><blockquote type=3D"ci=
te"><blockquote type=3D"cite"><span></span><br></blockquote></blockquote><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><span> =C2=A0=C2=A0Increm=
ental build in Docker fails with</span><br></blockquote></blockquote><block=
quote type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote=
></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span> =
=C2=A0=C2=A0OSError: [Errno 18] Invalid cross-device link</span><br></block=
quote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><spa=
n></span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquot=
e type=3D"cite"><span> =C2=A0=C2=A0When source and destination are on diffe=
rent overlay filesystems.</span><br></blockquote></blockquote><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote></bloc=
kquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span> =C2=A0=C2=
=A0This change handles the error with os.rename and retries with shutil.mov=
e.</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquot=
e type=3D"cite"><span></span><br></blockquote></blockquote><blockquote type=
=3D"cite"><blockquote type=3D"cite"><span>Thanks,</span><br></blockquote></=
blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>Devend=
ra</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquot=
e type=3D"cite"><span></span><br></blockquote></blockquote><blockquote type=
=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>On 29 M=
ar 2021, at 12:23, Konrad Weihmann &lt;<a href=3D"mailto:kweihmann@outlook.=
com" target=3D"_blank">kweihmann@outlook.com</a>&gt; wrote:</span><br></blo=
ckquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote typ=
e=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote></blockq=
uote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><span>Yes please quote a bit from the python manpage [=
1] - I certainly see the difference (and the edge cases where os.rename mig=
ht fail), but that should be documented as part of the commit message</span=
><br></blockquote></blockquote></blockquote><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquot=
e></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"c=
ite"><blockquote type=3D"cite"><span>[1] <a href=3D"https://docs.python.org=
/3/library/shutil.html#shutil.move" target=3D"_blank">https://docs.python.o=
rg/3/library/shutil.html#shutil.move</a></span><br></blockquote></blockquot=
e></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockqu=
ote type=3D"cite"><span></span><br></blockquote></blockquote></blockquote><=
blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite=
"><span>On 29.03.21 17:21, Bruce Ashfield wrote:</span><br></blockquote></b=
lockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite">=
<blockquote type=3D"cite"><blockquote type=3D"cite"><span>Can you document =
the cases that os.rename() is failing ? And also why</span><br></blockquote=
></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>=
would we expect the shutil.move() to work in those cases ?</span><br></bloc=
kquote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite">=
<span>If a change like this cases issues in the future, we need that extra<=
/span><br></blockquote></blockquote></blockquote></blockquote><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquot=
e type=3D"cite"><span>information in the commit head for proper triage.</sp=
an><br></blockquote></blockquote></blockquote></blockquote><blockquote type=
=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span>Bruce</span><br></blockquote></blockquote></blockquote><=
/blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><span>On Mon, Mar 29, 2021 at 11:1=
6 AM Devendra Tewari</span><br></blockquote></blockquote></blockquote></blo=
ckquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote typ=
e=3D"cite"><blockquote type=3D"cite"><span>&lt;<a href=3D"mailto:devendra.t=
ewari@gmail.com" target=3D"_blank">devendra.tewari@gmail.com</a>&gt; wrote:=
</span><br></blockquote></blockquote></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote></=
blockquote></blockquote></blockquote></blockquote><blockquote type=3D"cite"=
><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"ci=
te"><blockquote type=3D"cite"><span>---</span><br></blockquote></blockquote=
></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><block=
quote type=3D"cite"><span>meta/classes/sstate.bbclass | 26 ++++++++++++++++=
++++++----</span><br></blockquote></blockquote></blockquote></blockquote></=
blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote =
type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>1 f=
ile changed, 22 insertions(+), 4 deletions(-)</span><br></blockquote></bloc=
kquote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite">=
<blockquote type=3D"cite"><span></span><br></blockquote></blockquote></bloc=
kquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=
=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span>diff --git a/meta/classes/sstate.bbclass b/meta/classes/=
sstate.bbclass</span><br></blockquote></blockquote></blockquote></blockquot=
e></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockqu=
ote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span=
>index f579168162..f94aa96d70 100644</span><br></blockquote></blockquote></=
blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote =
type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><span>--- a/meta/classes/sstate.bbclass</span><br></blockq=
uote></blockquote></blockquote></blockquote></blockquote><blockquote type=
=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><span>+++ b/meta/classes/sstate.bbcl=
ass</span><br></blockquote></blockquote></blockquote></blockquote></blockqu=
ote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>@@ -384,6 =
+384,7 @@ def sstate_installpkg(ss, d):</span><br></blockquote></blockquote=
></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><block=
quote type=3D"cite"><span>def sstate_installpkgdir(ss, d):</span><br></bloc=
kquote></blockquote></blockquote></blockquote></blockquote><blockquote type=
=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><span> =C2=A0=C2=A0=C2=A0import oe.p=
ath</span><br></blockquote></blockquote></blockquote></blockquote></blockqu=
ote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span> =C2=A0=C2=
=A0=C2=A0import subprocess</span><br></blockquote></blockquote></blockquote=
></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"ci=
te"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>+ =C2=A0=C2=A0=C2=A0import shutil</span><br></blockquote></blo=
ckquote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"=
><blockquote type=3D"cite"><span></span><br></blockquote></blockquote></blo=
ckquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote typ=
e=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote =
type=3D"cite"><span> =C2=A0=C2=A0=C2=A0sstateinst =3D d.getVar(&quot;SSTATE=
_INSTDIR&quot;)</span><br></blockquote></blockquote></blockquote></blockquo=
te></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockq=
uote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><spa=
n> =C2=A0=C2=A0=C2=A0d.setVar(&#39;SSTATE_FIXMEDIR&#39;, ss[&#39;fixmedir&#=
39;])</span><br></blockquote></blockquote></blockquote></blockquote></block=
quote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=
=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>@@ -401=
,7 +402,11 @@ def sstate_installpkgdir(ss, d):</span><br></blockquote></blo=
ckquote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"=
><blockquote type=3D"cite"><span></span><br></blockquote></blockquote></blo=
ckquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote typ=
e=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote =
type=3D"cite"><span> =C2=A0=C2=A0=C2=A0for state in ss[&#39;dirs&#39;]:</sp=
an><br></blockquote></blockquote></blockquote></blockquote></blockquote><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite">=
<blockquote type=3D"cite"><blockquote type=3D"cite"><span> =C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0prepdir(state[1])</span><br></blockquote></block=
quote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blo=
ckquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><=
blockquote type=3D"cite"><span>- =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
os.rename(sstateinst + state[0], state[1])</span><br></blockquote></blockqu=
ote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><block=
quote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><span>+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0tr=
y:</span><br></blockquote></blockquote></blockquote></blockquote></blockquo=
te><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"=
cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+ =C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0os.rename(sstatein=
st + state[0], state[1])</span><br></blockquote></blockquote></blockquote><=
/blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite=
"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"c=
ite"><span>+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0break</span><br></blockquote></blockquote></blockquote></blockquote><=
/blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+ =
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0except OSError:</span><br></block=
quote></blockquote></blockquote></blockquote></blockquote><blockquote type=
=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><span>+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0shutil.move(sstateinst + state[0], s=
tate[1])</span><br></blockquote></blockquote></blockquote></blockquote></bl=
ockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span> =C2=
=A0=C2=A0=C2=A0sstate_install(ss, d)</span><br></blockquote></blockquote></=
blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote =
type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><span></span><br></blockquote></blockquote></blockquote></=
blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"=
><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"ci=
te"><span> =C2=A0=C2=A0=C2=A0for plain in ss[&#39;plaindirs&#39;]:</span><b=
r></blockquote></blockquote></blockquote></blockquote></blockquote><blockqu=
ote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><span>@@ -413,7 +418,11 @@ d=
ef sstate_installpkgdir(ss, d):</span><br></blockquote></blockquote></block=
quote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=
=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dest =3D plai=
n</span><br></blockquote></blockquote></blockquote></blockquote></blockquot=
e><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"c=
ite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span> =C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bb.utils.mkdirhier(src)</span><br></blockq=
uote></blockquote></blockquote></blockquote></blockquote><blockquote type=
=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><span> =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0prepdir(dest)</span><br></blockquote></blockquote></blockquo=
te></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"=
cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=
=3D"cite"><span>- =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0os.rename(src, =
dest)</span><br></blockquote></blockquote></blockquote></blockquote></block=
quote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=
=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+ =C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0try:</span><br></blockquote></blockq=
uote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><span>+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0os.rename(src, dest)</span><br></blockquote></block=
quote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blo=
ckquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><=
blockquote type=3D"cite"><span>+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0break</span><br></blockquote></blockquote></blockqu=
ote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=
=3D"cite"><span>+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0except OSError:=
</span><br></blockquote></blockquote></blockquote></blockquote></blockquote=
><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"ci=
te"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+ =C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0shutil.move(src, d=
est)</span><br></blockquote></blockquote></blockquote></blockquote></blockq=
uote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=
=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span></span>=
<br></blockquote></blockquote></blockquote></blockquote></blockquote><block=
quote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><span> =C2=A0=C2=A0=C2=A0r=
eturn True</span><br></blockquote></blockquote></blockquote></blockquote></=
blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote =
type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span></s=
pan><br></blockquote></blockquote></blockquote></blockquote></blockquote><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"=
><blockquote type=3D"cite"><blockquote type=3D"cite"><span>@@ -638,6 +647,7=
 @@ python sstate_hardcode_path () {</span><br></blockquote></blockquote></=
blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote =
type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><span></span><br></blockquote></blockquote></blockquote></=
blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"=
><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"ci=
te"><span>def sstate_package(ss, d):</span><br></blockquote></blockquote></=
blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote =
type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><span> =C2=A0=C2=A0=C2=A0import oe.path</span><br></blockq=
uote></blockquote></blockquote></blockquote></blockquote><blockquote type=
=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><span>+ =C2=A0=C2=A0=C2=A0import shu=
til</span><br></blockquote></blockquote></blockquote></blockquote></blockqu=
ote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span></span><br=
></blockquote></blockquote></blockquote></blockquote></blockquote><blockquo=
te type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><block=
quote type=3D"cite"><blockquote type=3D"cite"><span> =C2=A0=C2=A0=C2=A0tmpd=
ir =3D d.getVar(&#39;TMPDIR&#39;)</span><br></blockquote></blockquote></blo=
ckquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote typ=
e=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote =
type=3D"cite"><span></span><br></blockquote></blockquote></blockquote></blo=
ckquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"=
><span>@@ -664,7 +674,11 @@ def sstate_package(ss, d):</span><br></blockquo=
te></blockquote></blockquote></blockquote></blockquote><blockquote type=3D"=
cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=
=3D"cite"><blockquote type=3D"cite"><span> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0continue</span><br></blockquote></blockquote></blockquote></blockq=
uote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><s=
pan> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0bb.error(&quot;sstate found an absolute path symlink %=
s pointing at %s. Please replace this with a relative link.&quot; % (srcpat=
h, link))</span><br></blockquote></blockquote></blockquote></blockquote></b=
lockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span> =C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bb.debug(2, &quot;Preparing tree %s =
for packaging at %s&quot; % (state[1], sstatebuild + state[0]))</span><br><=
/blockquote></blockquote></blockquote></blockquote></blockquote><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockqu=
ote type=3D"cite"><blockquote type=3D"cite"><span>- =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0os.rename(state[1], sstatebuild + state[0])</span><br>=
</blockquote></blockquote></blockquote></blockquote></blockquote><blockquot=
e type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockq=
uote type=3D"cite"><blockquote type=3D"cite"><span>+ =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0try:</span><br></blockquote></blockquote></blockquote>=
</blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"=
cite"><span>+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0os.rename(state[1], sstatebuild + state[0])</span><br></blockquote></=
blockquote></blockquote></blockquote></blockquote><blockquote type=3D"cite"=
><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"ci=
te"><blockquote type=3D"cite"><span>+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0break</span><br></blockquote></blockquote></b=
lockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquot=
e type=3D"cite"><span>+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0except OS=
Error:</span><br></blockquote></blockquote></blockquote></blockquote></bloc=
kquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=
=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+ =C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0shutil.move(=
state[1], sstatebuild + state[0])</span><br></blockquote></blockquote></blo=
ckquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote typ=
e=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote =
type=3D"cite"><span></span><br></blockquote></blockquote></blockquote></blo=
ckquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"=
><span> =C2=A0=C2=A0=C2=A0workdir =3D d.getVar(&#39;WORKDIR&#39;)</span><br=
></blockquote></blockquote></blockquote></blockquote></blockquote><blockquo=
te type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><block=
quote type=3D"cite"><blockquote type=3D"cite"><span> =C2=A0=C2=A0=C2=A0shar=
edworkdir =3D os.path.join(d.getVar(&#39;TMPDIR&#39;), &quot;work-shared&qu=
ot;)</span><br></blockquote></blockquote></blockquote></blockquote></blockq=
uote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=
=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>@@ -674=
,7 +688,11 @@ def sstate_package(ss, d):</span><br></blockquote></blockquot=
e></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockqu=
ote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><span> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0pdir =3D plain.replace(sharedworkdir, sstatebuild)</sp=
an><br></blockquote></blockquote></blockquote></blockquote></blockquote><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite">=
<blockquote type=3D"cite"><blockquote type=3D"cite"><span> =C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0bb.utils.mkdirhier(plain)</span><br></blockquote=
></blockquote></blockquote></blockquote></blockquote><blockquote type=3D"ci=
te"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0bb.utils.mkdirhier(pdir)</span><br></blockquote></blockquote></blo=
ckquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote typ=
e=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote =
type=3D"cite"><span>- =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0os.rename(p=
lain, pdir)</span><br></blockquote></blockquote></blockquote></blockquote><=
/blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+ =
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0try:</span><br></blockquote></blo=
ckquote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"=
><blockquote type=3D"cite"><span>+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0os.rename(plain, pdir)</span><br></blockquote></=
blockquote></blockquote></blockquote></blockquote><blockquote type=3D"cite"=
><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"ci=
te"><blockquote type=3D"cite"><span>+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0break</span><br></blockquote></blockquote></b=
lockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquot=
e type=3D"cite"><span>+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0except OS=
Error:</span><br></blockquote></blockquote></blockquote></blockquote></bloc=
kquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=
=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+ =C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0shutil.move(=
plain, pdir)</span><br></blockquote></blockquote></blockquote></blockquote>=
</blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquot=
e type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span><=
/span><br></blockquote></blockquote></blockquote></blockquote></blockquote>=
<blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><blockquote type=3D"cite"><span> =C2=A0=C2=A0=
=C2=A0d.setVar(&#39;SSTATE_BUILDDIR&#39;, sstatebuild)</span><br></blockquo=
te></blockquote></blockquote></blockquote></blockquote><blockquote type=3D"=
cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=
=3D"cite"><blockquote type=3D"cite"><span> =C2=A0=C2=A0=C2=A0d.setVar(&#39;=
SSTATE_INSTDIR&#39;, sstatebuild)</span><br></blockquote></blockquote></blo=
ckquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote typ=
e=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote =
type=3D"cite"><span>--</span><br></blockquote></blockquote></blockquote></b=
lockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite">=
<blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cit=
e"><span>2.29.2</span><br></blockquote></blockquote></blockquote></blockquo=
te></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockq=
uote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><spa=
n></span><br></blockquote></blockquote></blockquote></blockquote></blockquo=
te><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"=
cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span></span><br>=
</blockquote></blockquote></blockquote></blockquote></blockquote><blockquot=
e type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockq=
uote type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote>=
</blockquote></blockquote></blockquote></blockquote><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"=
cite"><blockquote type=3D"cite"><span></span><br></blockquote></blockquote>=
</blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquot=
e type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span><=
/span><br></blockquote></blockquote></blockquote></blockquote><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote></bloc=
kquote><blockquote type=3D"cite"><span></span><br></blockquote></div></bloc=
kquote></div></blockquote></div>

--00000000000081e14d05beee0a21--
