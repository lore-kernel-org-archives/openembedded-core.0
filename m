Received: from mail-wg0-f45.google.com ([74.125.82.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UCTFB-0001PH-Ae
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Mar 2013 12:07:46 +0100
Received: by mail-wg0-f45.google.com with SMTP id dq12so4073302wgb.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2013 02:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=klnFynmaVSzAhnVBU8G6iWXQGNwOwJAchlcSH4zwsHE=;
	b=z0goMZKp8Uef96O+FZjFHln3+VXh5BobdVuuo36O4H0wxG+sIrlmba/fGmoYXF2Nvp
	QNOgPCb2dLJOiKaDjJVg3OE+aV6KeEGHitPocZ+PG7jbEeiYDDB0ct/ysx1OF34WE2BO
	9t8/loyunGZjtzAnBwDKBZZ/6m/nSJfW1jbggZFlNfSl4yL2vZ+D5tGzlX1qgz5p0wf1
	2IXqR/6thNtKMeyJjf1U1ppy4FxNbZKgyM3f2xKKEVZqxdqCFqT1Mjqd+w+cr+7VERgl
	tKuDYWglfDjrInRJEFJuAbfX5fwZ7HTbecU+ElZ64fgIwIz6bHnJozFNr4Ve3vXtmmv8
	Rdtw==
MIME-Version: 1.0
X-Received: by 10.194.133.198 with SMTP id pe6mr30372903wjb.9.1362394277898;
	Mon, 04 Mar 2013 02:51:17 -0800 (PST)
Received: by 10.194.89.106 with HTTP; Mon, 4 Mar 2013 02:51:17 -0800 (PST)
In-Reply-To: <1362393439-23933-1-git-send-email-laurentiu.palcu@intel.com>
References: <1362393439-23933-1-git-send-email-laurentiu.palcu@intel.com>
Date: Mon, 4 Mar 2013 11:51:17 +0100
Message-ID: <CA+chaQe3c3aYV6xEYsScoMWTMexe9rR4UiKCAszTjG-xrad59Q@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sstate.bbclass: consider postinstall dependencies too
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
X-List-Received-Date: Mon, 04 Mar 2013 11:07:54 -0000
Content-Type: multipart/alternative; boundary=089e01175f7dfa6fff04d7172298

--089e01175f7dfa6fff04d7172298
Content-Type: text/plain; charset=UTF-8

Shouldn't this list be defined in layer.conf like
SIGGEN_EXCLUDERECIPES_ABISAFE, so that other layers can extend that list?


On Mon, Mar 4, 2013 at 11:37 AM, Laurentiu Palcu
<laurentiu.palcu@intel.com>wrote:

> When checking the dependencies in setscene_depvalid(), make sure we also
> consider those dependencies needed when running the postinstalls on
> host.
>
> [YOCTO #3918]
>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> ---
>  meta/classes/sstate.bbclass |    8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 118a28a..be29e52 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -640,6 +640,10 @@ def setscene_depvalid(task, taskdependees, notneeded,
> d):
>          if x in ["quilt-native", "autoconf-native", "automake-native",
> "gnu-config-native", "libtool-native", "pkgconfig-native", "gcc-cross",
> "binutils-cross", "gcc-cross-initial"]:
>              return True
>          return False
> +    def isPostInstDep(x):
> +        if x in ["qemu-native", "gdk-pixbuf-native", "gtk+-native",
> "qemuwrapper-cross", "depmodwrapper-cross"]:
> +            return True
> +        return False
>
>      # We can skip these "safe" dependencies since the aren't runtime
> dependencies, just build time
>      if isSafeDep(taskdependees[task][0]) and taskdependees[task][1] ==
> "do_populate_sysroot":
> @@ -658,8 +662,10 @@ def setscene_depvalid(task, taskdependees, notneeded,
> d):
>          # do_package_write_* and do_package doesn't need do_package
>          if taskdependees[task][1] == "do_package" and
> taskdependees[dep][1] in ['do_package', 'do_package_write_deb',
> 'do_package_write_ipk', 'do_package_write_rpm', 'do_packagedata']:
>              continue
> -        # do_package_write_* and do_package doesn't need
> do_populate_sysroot
> +        # do_package_write_* and do_package doesn't need
> do_populate_sysroot, unless is a postinstall dependency
>          if taskdependees[task][1] == "do_populate_sysroot" and
> taskdependees[dep][1] in ['do_package', 'do_package_write_deb',
> 'do_package_write_ipk', 'do_package_write_rpm', 'do_packagedata']:
> +            if isPostInstDep(taskdependees[task][0]) and
> taskdependees[dep][1] in ['do_package_write_deb', 'do_package_write_ipk',
> 'do_package_write_rpm']:
> +                return False
>              continue
>          # Native/Cross packages don't exist and are noexec anyway
>          if isNativeCross(taskdependees[dep][0]) and taskdependees[dep][1]
> in ['do_package_write_deb', 'do_package_write_ipk', 'do_package_write_rpm',
> 'do_packagedata']:
> --
> 1.7.9.5
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--089e01175f7dfa6fff04d7172298
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div style>Shouldn&#39;t this list be defined in layer.con=
f like SIGGEN_EXCLUDERECIPES_ABISAFE, so that other layers can extend that =
list?</div></div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quo=
te">
On Mon, Mar 4, 2013 at 11:37 AM, Laurentiu Palcu <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:laurentiu.palcu@intel.com" target=3D"_blank">laurentiu.palcu@=
intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
When checking the dependencies in setscene_depvalid(), make sure we also<br=
>
consider those dependencies needed when running the postinstalls on<br>
host.<br>
<br>
[YOCTO #3918]<br>
<br>
Signed-off-by: Laurentiu Palcu &lt;<a href=3D"mailto:laurentiu.palcu@intel.=
com">laurentiu.palcu@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/sstate.bbclass | =C2=A0 =C2=A08 +++++++-<br>
=C2=A01 file changed, 7 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass<br>
index 118a28a..be29e52 100644<br>
--- a/meta/classes/sstate.bbclass<br>
+++ b/meta/classes/sstate.bbclass<br>
@@ -640,6 +640,10 @@ def setscene_depvalid(task, taskdependees, notneeded, =
d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if x in [&quot;quilt-native&quot;, &quot;=
autoconf-native&quot;, &quot;automake-native&quot;, &quot;gnu-config-native=
&quot;, &quot;libtool-native&quot;, &quot;pkgconfig-native&quot;, &quot;gcc=
-cross&quot;, &quot;binutils-cross&quot;, &quot;gcc-cross-initial&quot;]:<b=
r>

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return True<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return False<br>
+ =C2=A0 =C2=A0def isPostInstDep(x):<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0if x in [&quot;qemu-native&quot;, &quot;gdk-pi=
xbuf-native&quot;, &quot;gtk+-native&quot;, &quot;qemuwrapper-cross&quot;, =
&quot;depmodwrapper-cross&quot;]:<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return True<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0return False<br>
<br>
=C2=A0 =C2=A0 =C2=A0# We can skip these &quot;safe&quot; dependencies since=
 the aren&#39;t runtime dependencies, just build time<br>
=C2=A0 =C2=A0 =C2=A0if isSafeDep(taskdependees[task][0]) and taskdependees[=
task][1] =3D=3D &quot;do_populate_sysroot&quot;:<br>
@@ -658,8 +662,10 @@ def setscene_depvalid(task, taskdependees, notneeded, =
d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# do_package_write_* and do_package doesn=
&#39;t need do_package<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if taskdependees[task][1] =3D=3D &quot;do=
_package&quot; and taskdependees[dep][1] in [&#39;do_package&#39;, &#39;do_=
package_write_deb&#39;, &#39;do_package_write_ipk&#39;, &#39;do_package_wri=
te_rpm&#39;, &#39;do_packagedata&#39;]:<br>

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0# do_package_write_* and do_package doesn&#39;=
t need do_populate_sysroot<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0# do_package_write_* and do_package doesn&#39;=
t need do_populate_sysroot, unless is a postinstall dependency<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if taskdependees[task][1] =3D=3D &quot;do=
_populate_sysroot&quot; and taskdependees[dep][1] in [&#39;do_package&#39;,=
 &#39;do_package_write_deb&#39;, &#39;do_package_write_ipk&#39;, &#39;do_pa=
ckage_write_rpm&#39;, &#39;do_packagedata&#39;]:<br>

+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if isPostInstDep(taskdependees[t=
ask][0]) and taskdependees[dep][1] in [&#39;do_package_write_deb&#39;, &#39=
;do_package_write_ipk&#39;, &#39;do_package_write_rpm&#39;]:<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return False<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Native/Cross packages don&#39;t exist a=
nd are noexec anyway<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if isNativeCross(taskdependees[dep][0]) a=
nd taskdependees[dep][1] in [&#39;do_package_write_deb&#39;, &#39;do_packag=
e_write_ipk&#39;, &#39;do_package_write_rpm&#39;, &#39;do_packagedata&#39;]=
:<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.9.5<br>
<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</font></span></blockquote></div><br></div>

--089e01175f7dfa6fff04d7172298--
