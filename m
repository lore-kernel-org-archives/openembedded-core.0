Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TZOWo-0002Xv-PR
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Nov 2012 17:12:28 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa11so1790267pad.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Nov 2012 07:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=xpg05LaveM88jjaz5F5bEfYCp9Nj0ESRYIVSWQkPbqU=;
	b=D+ongEE2Y0JMxUXmEEDEBxJOoiC6U0r77864r7hfUFmnhv9cPgY86vj1e/FEKIAyCi
	B4z4N2yRTlwqXNe4f4N4wCh88+6FEBczN/OsMXaS8NDmd8vd6HWMqMZo7GIQo8CyqXa0
	S46oUssjkBctrWkafxVmWMalf8qC8TRwF1cUonCeZBAfLtVf63G90q2R54Pv6qCGUewJ
	3Gkl7RgNpveu+VlIM7BeNQBiCELmrIHAJ8UfyWuoWKNu4bENY0rABHkBKYySEqdq4jzB
	QyR2hSzRLv6bW0ZLqfyh23mIz+kIZxU2tBgOizuRb1Mnhxq3ugwApighqLHf/SAdbE5E
	8nRA==
MIME-Version: 1.0
Received: by 10.68.132.196 with SMTP id ow4mr16574499pbb.49.1353081507610;
	Fri, 16 Nov 2012 07:58:27 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Fri, 16 Nov 2012 07:58:27 -0800 (PST)
In-Reply-To: <1353079960.3709.93.camel@ted>
References: <1353079960.3709.93.camel@ted>
Date: Fri, 16 Nov 2012 13:58:27 -0200
X-Google-Sender-Auth: mJRgI2Xpef2IRa1JnogWuR3P0L0
Message-ID: <CAP9ODKrfu8CMJ+ZWqkwQUCP+56WU_4sLf0Js9j_fYYGfDr7a0w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sstate: Implement a setscene dependency validation routine to allow skipping of some sstate installation
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
X-List-Received-Date: Fri, 16 Nov 2012 16:12:28 -0000
Content-Type: multipart/alternative; boundary=047d7b15a8df9cfe7504ce9ed6aa

--047d7b15a8df9cfe7504ce9ed6aa
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Nov 16, 2012 at 1:32 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> This is a first attempt at logic to determine when a sstate dependency
> needs
> to be installed and when it does not. Its a start at the logic and errs on
> the
>

s/errs/errors/


> side of caution, as it gets wider testing, we can refine the logic as
> needed.
>
> This code should allow a significant performance speedup to certain
> workflows, for
> example "bitbake xxx-image -c rootfs" will not populate the target sysroot.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index c085c62..470e0ee 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -620,3 +620,55 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash,
> sq_hashfn, d):
>
>      return ret
>
> +BB_SETSCENE_DEPVALID = "setscene_depvalid"
> +
> +def setscene_depvalid(task, taskdependees, notneeded, d):
> +    # taskdependees is a dict of tasks which depend on task, each being a
> 3 item list of [PN, TASKNAME, FILENAME]
> +    # task is included in taskdependees too
> +
> +    bb.debug(2, "Considering setscene task: %s" %
> (str(taskdependees[task])))
> +
> +    def isNative(x):
> +        return x.endswith("-native")
> +    def isNativeCross(x):
> +        return x.endswith("-native") or x.endswith("-cross") or
> x.endswith("-cross-initial")
> +    def isSafeDep(x):
> +        if x in ["quilt-native", "autoconf-native", "automake-native",
> "gnu-config-native", "libtool-native", "pkgconfig-native", "gcc-cross",
> "binutils-cross"]:
> +            return True
> +        return False
> +
> +    # We can skip these "safe" dependencies since the aren't runtime
> dependencies, just build time
> +    if isSafeDep(taskdependees[task][0]) and taskdependees[task][1] ==
> "do_populate_sysroot":
> +        return True
> +
> +    # We only need to trigger populate_lic through direct dependencies
> +    if taskdependees[task][1] == "do_populate_lic":
> +        return True
> +
> +    for dep in taskdependees:
> +        bb.debug(2, "  considering dependency: %s" %
> (str(taskdependees[dep])))
> +        if task == dep:
> +            continue
> +        if dep in notneeded:
> +            continue
> +        # do_package_write_* and do_package doesn't need do_package
> +        if taskdependees[task][1] == "do_package" and
> taskdependees[dep][1] in ['do_package', 'do_package_write_deb',
> 'do_package_write_ipk', 'do_package_write_rpm']:
> +            continue
>

I understand why you does this but it would be better if we had a central
place to have the do_package_write_$pkg recorded or when adding new type
this could be forgotten.


> +        # do_package_write_* and do_package doesn't need
> do_populate_sysroot
> +        if taskdependees[task][1] == "do_populate_sysroot" and
> taskdependees[dep][1] in ['do_package', 'do_package_write_deb',
> 'do_package_write_ipk', 'do_package_write_rpm']:
> +            continue
> +        # Native/Cross packages don't exist and are noexec anyway
> +        if isNativeCross(taskdependees[dep][0]) and taskdependees[dep][1]
> in ['do_package_write_deb', 'do_package_write_ipk', 'do_package_write_rpm']:
> +            continue
> +        # Native/Cross populate_sysroot need their dependencies
> +        if isNativeCross(taskdependees[task][0]) and
> isNativeCross(taskdependees[dep][0]) and taskdependees[task][1] ==
> 'do_populate_sysroot' and taskdependees[dep][1] == 'do_populate_sysroot':
> +            return False
> +        # Target populate_sysroot do not need their dependencies
> +        if taskdependees[task][1] == 'do_populate_sysroot' and
> taskdependees[dep][1] == 'do_populate_sysroot':
> +            continue
> +
> +        # Safe fallthrough default
> +        bb.debug(2, " Default setscene dependency fall through due to
> dependency: %s" % (str(taskdependees[dep])))
> +        return False
> +    return True
> +
>

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--047d7b15a8df9cfe7504ce9ed6aa
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Fri, Nov 16, 2012 at 1:32 PM, Richard=
 Purdie <span dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundat=
ion.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;</span=
> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">This is a first attempt at logic to determin=
e when a sstate dependency needs<br>
to be installed and when it does not. Its a start at the logic and errs on =
the<br></blockquote><div><br></div><div>s/errs/errors/</div><div>=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">

side of caution, as it gets wider testing, we can refine the logic as neede=
d.<br>
<br>
This code should allow a significant performance speedup to certain workflo=
ws, for<br>
example &quot;bitbake xxx-image -c rootfs&quot; will not populate the targe=
t sysroot.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org">richard.purdie@linuxfoundation.org</a>&gt;<br>
---<br>
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass<br>
index c085c62..470e0ee 100644<br>
--- a/meta/classes/sstate.bbclass<br>
+++ b/meta/classes/sstate.bbclass<br>
@@ -620,3 +620,55 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_has=
hfn, d):<br>
<br>
=A0 =A0 =A0return ret<br>
<br>
+BB_SETSCENE_DEPVALID =3D &quot;setscene_depvalid&quot;<br>
+<br>
+def setscene_depvalid(task, taskdependees, notneeded, d):<br>
+ =A0 =A0# taskdependees is a dict of tasks which depend on task, each bein=
g a 3 item list of [PN, TASKNAME, FILENAME]<br>
+ =A0 =A0# task is included in taskdependees too<br>
+<br>
+ =A0 =A0bb.debug(2, &quot;Considering setscene task: %s&quot; % (str(taskd=
ependees[task])))<br>
+<br>
+ =A0 =A0def isNative(x):<br>
+ =A0 =A0 =A0 =A0return x.endswith(&quot;-native&quot;)<br>
+ =A0 =A0def isNativeCross(x):<br>
+ =A0 =A0 =A0 =A0return x.endswith(&quot;-native&quot;) or x.endswith(&quot=
;-cross&quot;) or x.endswith(&quot;-cross-initial&quot;)<br>
+ =A0 =A0def isSafeDep(x):<br>
+ =A0 =A0 =A0 =A0if x in [&quot;quilt-native&quot;, &quot;autoconf-native&q=
uot;, &quot;automake-native&quot;, &quot;gnu-config-native&quot;, &quot;lib=
tool-native&quot;, &quot;pkgconfig-native&quot;, &quot;gcc-cross&quot;, &qu=
ot;binutils-cross&quot;]:<br>

+ =A0 =A0 =A0 =A0 =A0 =A0return True<br>
+ =A0 =A0 =A0 =A0return False<br>
+<br>
+ =A0 =A0# We can skip these &quot;safe&quot; dependencies since the aren&#=
39;t runtime dependencies, just build time<br>
+ =A0 =A0if isSafeDep(taskdependees[task][0]) and taskdependees[task][1] =
=3D=3D &quot;do_populate_sysroot&quot;:<br>
+ =A0 =A0 =A0 =A0return True<br>
+<br>
+ =A0 =A0# We only need to trigger populate_lic through direct dependencies=
<br>
+ =A0 =A0if taskdependees[task][1] =3D=3D &quot;do_populate_lic&quot;:<br>
+ =A0 =A0 =A0 =A0return True<br>
+<br>
+ =A0 =A0for dep in taskdependees:<br>
+ =A0 =A0 =A0 =A0bb.debug(2, &quot; =A0considering dependency: %s&quot; % (=
str(taskdependees[dep])))<br>
+ =A0 =A0 =A0 =A0if task =3D=3D dep:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0continue<br>
+ =A0 =A0 =A0 =A0if dep in notneeded:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0continue<br>
+ =A0 =A0 =A0 =A0# do_package_write_* and do_package doesn&#39;t need do_pa=
ckage<br>
+ =A0 =A0 =A0 =A0if taskdependees[task][1] =3D=3D &quot;do_package&quot; an=
d taskdependees[dep][1] in [&#39;do_package&#39;, &#39;do_package_write_deb=
&#39;, &#39;do_package_write_ipk&#39;, &#39;do_package_write_rpm&#39;]:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0continue<br></blockquote><div><br></div><div>I und=
erstand why you does this but it would be better if we had a central place =
to have the do_package_write_$pkg recorded or when adding new type this cou=
ld be forgotten.</div>
<div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">
+ =A0 =A0 =A0 =A0# do_package_write_* and do_package doesn&#39;t need do_po=
pulate_sysroot<br>
+ =A0 =A0 =A0 =A0if taskdependees[task][1] =3D=3D &quot;do_populate_sysroot=
&quot; and taskdependees[dep][1] in [&#39;do_package&#39;, &#39;do_package_=
write_deb&#39;, &#39;do_package_write_ipk&#39;, &#39;do_package_write_rpm&#=
39;]:<br>

+ =A0 =A0 =A0 =A0 =A0 =A0continue<br>
+ =A0 =A0 =A0 =A0# Native/Cross packages don&#39;t exist and are noexec any=
way<br>
+ =A0 =A0 =A0 =A0if isNativeCross(taskdependees[dep][0]) and taskdependees[=
dep][1] in [&#39;do_package_write_deb&#39;, &#39;do_package_write_ipk&#39;,=
 &#39;do_package_write_rpm&#39;]:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0continue<br>
+ =A0 =A0 =A0 =A0# Native/Cross populate_sysroot need their dependencies<br=
>
+ =A0 =A0 =A0 =A0if isNativeCross(taskdependees[task][0]) and isNativeCross=
(taskdependees[dep][0]) and taskdependees[task][1] =3D=3D &#39;do_populate_=
sysroot&#39; and taskdependees[dep][1] =3D=3D &#39;do_populate_sysroot&#39;=
:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0return False<br>
+ =A0 =A0 =A0 =A0# Target populate_sysroot do not need their dependencies<b=
r>
+ =A0 =A0 =A0 =A0if taskdependees[task][1] =3D=3D &#39;do_populate_sysroot&=
#39; and taskdependees[dep][1] =3D=3D &#39;do_populate_sysroot&#39;:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0continue<br>
+<br>
+ =A0 =A0 =A0 =A0# Safe fallthrough default<br>
+ =A0 =A0 =A0 =A0bb.debug(2, &quot; Default setscene dependency fall throug=
h due to dependency: %s&quot; % (str(taskdependees[dep])))<br>
+ =A0 =A0 =A0 =A0return False<br>
+ =A0 =A0return True<br>
+<br></blockquote><div><br></div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a h=
ref=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio@ossystems.c=
om.br</a>=A0 <a href=3D"http://www.ossystems.com.br" target=3D"_blank">http=
://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--047d7b15a8df9cfe7504ce9ed6aa--
