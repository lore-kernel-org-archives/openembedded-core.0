Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 12F1C7886F;
	Tue, 30 Jan 2018 00:01:33 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id r78so37077774wme.0;
	Mon, 29 Jan 2018 16:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=QFYbhvg0Dff7aSt4jY1JTyeZEdJd2JiwvKGnKFruNOs=;
	b=PJgRMRyseq6pq6ueSKUXSyef0LbDkY3Rr8L4uMNNNgxIC+g30axn1XgtJiQnKuKmTs
	CiGrteJj8RZtywBCi87UjgImORv87IKNtRf3PshouSmOK5OxaEXp9GMrDlWAN8dovw26
	Sy91hjdyMWE8/o3VOf+zbXcmsnwuGxiAg8izklTa3j0BHCwjpQaBX4qT/DPQRsbjr9LG
	L11FrCFlvTkSDh+OxZrUaVZa7Hsv2u5Fd6bNzJy4/ynr0nlSQzY0D4h0ijRCg5EsjiCt
	UxPz8hrMbmJIb3+Jx3yNrafF009vQNr0ey8+N9O71WdNBcgeL+Uc+OZHt8DPFmEOX3us
	W2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=QFYbhvg0Dff7aSt4jY1JTyeZEdJd2JiwvKGnKFruNOs=;
	b=FUWgPlngDI6roJXArJPuMxuBT3tRaOWg8mKt4CLEKjFrMPrYVChARVE5irpCEx4WiS
	5MZrc+iFx+p9rqciJJVYSpepRGWwua0BsVzf8SL0uBUKBgo1BTLatHxcIkgEoOqil36+
	Pm720C60aoe+J9+ZheZ5xglOxyiwypE960vZhaBkDTH4+dVAtKDiCmr7ejHpn60ezVcw
	whMM16LTqyHWWwrEEJyUjumFnkyCGUSj1uiX1dm1G6ARKyvH2UyYZ2UZBL89RepKF9wE
	bPDmGuQzDcN5jLf3RFFo0cyIgCJX57n8kCctYZTl41X6qLPPvbKUnrXr4v59jZQZn6uf
	Psyg==
X-Gm-Message-State: AKwxyteYUV3Kbm+tjYjQ2OQhBh46h0HgRPPJzsnGCuoMU+lH2DsRTDF0
	bF6xEpNxWDUdkMhAzD19pB8tGMPEoqSN4HpIXOc=
X-Google-Smtp-Source: AH8x225mpknovGRmJx6jBJHG7oJSn/vS3FpJbTnVxvTNmcNxovbEptfLfzOfatHvU41bYc7R0tKmWSs+VPD9zDEC+XA=
X-Received: by 10.28.13.18 with SMTP id 18mr20147326wmn.112.1517270494755;
	Mon, 29 Jan 2018 16:01:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Mon, 29 Jan 2018 16:01:34 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 30 Jan 2018 01:01:34 +0100
Message-ID: <CA+chaQfBm2Yc1Pb=-W-ndoT1ECuCuawa8_YRakjYEKVje_oP-Q@mail.gmail.com>
To: Stefan Agner <stefan.agner@toradex.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-commits@lists.openembedded.org
Subject: waf warnings in jack and samba related recipes Was: [oe-commits] [openembedded-core] 07/44: waf.bbclass: explicitly pass bindir and libdir if supported
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
X-List-Received-Date: Tue, 30 Jan 2018 00:01:34 -0000
Content-Type: multipart/alternative; boundary="001a11443614de42a60563f310f2"

--001a11443614de42a60563f310f2
Content-Type: text/plain; charset="UTF-8"

Hi,

it might be useful to check if there is ${S}/waf at all before trying to
call it.

There are some recipes like jack and other which inherit waf-samba which
inherits waf, but they don't use waf for configure, strange isn't it?

But since this patch, there is new warning for every do_configure task,
because there is this prefuncs waf_preconfigure causing:
WARNING: libldb-1.1.29-r0 do_configure: Unable to execute waf --version,
exit code 127. Assuming waf version without bindir/libdir support.
WARNING: samba-4.6.7-r0 do_configure: Unable to execute waf --version, exit
code 127. Assuming waf version without bindir/libdir support.
WARNING: libtalloc-2.1.9-r0 do_configure: Unable to execute waf --version,
exit code 127. Assuming waf version without bindir/libdir support.
WARNING: jack-1.9.10+gitAUTOINC+2d1d323505-r0 do_configure: Unable to
execute waf --version, exit code 1. Assuming waf version without
bindir/libdir support.
WARNING: libtevent-0.9.31-r0 do_configure: Unable to execute waf --version,
exit code 127. Assuming waf version without bindir/libdir support.
WARNING: libtdb-1.3.14-r0 do_configure: Unable to execute waf --version,
exit code 127. Assuming waf version without bindir/libdir support.

Now when this change is also backported to rocko we should probably fix
those recipes to prevent introducing even more warnings to stable release
builds.

Regards,

On Tue, Jan 2, 2018 at 6:28 PM, <git@git.openembedded.org> wrote:

> This is an automated email from the git hooks/post-receive script.
>
> rpurdie pushed a commit to branch master
> in repository openembedded-core.
>
> commit 923f91d8d8606141ce218927bc943f4f4f34bcdd
> Author: Stefan Agner <stefan.agner@toradex.com>
> AuthorDate: Tue Dec 12 17:13:24 2017 +0100
>
>     waf.bbclass: explicitly pass bindir and libdir if supported
>
>     On some build hosts distros (e.g. Fedora 26) waf tries to be
>     smart about libdir detection and defaults to [EXEC_PREFIX/lib64].
>     This obviously is not what we want for 32-bit targets and usually
>     fails in the do_package phase:
>       WARNING: gstreamer1.0-plugins-imx-0.13.0-r0 do_package: QA Issue:
> gstreamer1.0-plugins-imx: Files/directories were installed but not shipped
> in any package:
>         /usr/lib64/libgstimxcommon.so.0
>         ...
>
>     Depending on version, waf knows prefix or prefix, bindir and
>     libdir as default options. Explicitly pass the right set of
>     arguments.
>
>     Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
>     Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/waf.bbclass | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
> index c4698e9..acbda27 100644
> --- a/meta/classes/waf.bbclass
> +++ b/meta/classes/waf.bbclass
> @@ -25,8 +25,23 @@ def get_waf_parallel_make(d):
>
>      return ""
>
> +python waf_preconfigure() {
> +    from distutils.version import StrictVersion
> +    srcsubdir = d.getVar('S')
> +    wafbin = os.path.join(srcsubdir, 'waf')
> +    status, result = oe.utils.getstatusoutput(wafbin + " --version")
> +    if status != 0:
> +        bb.warn("Unable to execute waf --version, exit code %d. Assuming
> waf version without bindir/libdir support." % status)
> +        return
> +    version = result.split()[1]
> +    if StrictVersion(version) >= StrictVersion("1.8.7"):
> +        d.setVar("WAF_EXTRA_CONF", "--bindir=${bindir}
> --libdir=${libdir}")
> +}
> +
> +do_configure[prefuncs] += "waf_preconfigure"
> +
>  waf_do_configure() {
> -       ${S}/waf configure --prefix=${prefix} ${EXTRA_OECONF}
> +       ${S}/waf configure --prefix=${prefix} ${WAF_EXTRA_CONF}
> ${EXTRA_OECONF}
>  }
>
>  waf_do_compile()  {
>
> --
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>

--001a11443614de42a60563f310f2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>it might be useful to check if ther=
e is ${S}/waf at all before trying to call it.</div><div><br></div><div>The=
re are some recipes like jack and other which inherit waf-samba which inher=
its waf, but they don&#39;t use waf for configure, strange isn&#39;t it?</d=
iv><div><br></div><div>But since this patch, there is new warning for every=
 do_configure task, because there is this prefuncs waf_preconfigure causing=
:</div><div>WARNING: libldb-1.1.29-r0 do_configure: Unable to execute waf -=
-version, exit code 127. Assuming waf version without bindir/libdir support=
.<br></div><div>WARNING: samba-4.6.7-r0 do_configure: Unable to execute waf=
 --version, exit code 127. Assuming waf version without bindir/libdir suppo=
rt.<br></div><div>WARNING: libtalloc-2.1.9-r0 do_configure: Unable to execu=
te waf --version, exit code 127. Assuming waf version without bindir/libdir=
 support.<br></div><div>WARNING: jack-1.9.10+gitAUTOINC+2d1d323505-r0 do_co=
nfigure: Unable to execute waf --version, exit code 1. Assuming waf version=
 without bindir/libdir support.<br></div><div>WARNING: libtevent-0.9.31-r0 =
do_configure: Unable to execute waf --version, exit code 127. Assuming waf =
version without bindir/libdir support.<br></div><div>WARNING: libtdb-1.3.14=
-r0 do_configure: Unable to execute waf --version, exit code 127. Assuming =
waf version without bindir/libdir support.<br></div><div><br></div><div>Now=
 when this change is also backported to rocko we should probably fix those =
recipes to prevent introducing even more warnings to stable release builds.=
</div><div><br></div><div>Regards,</div><div class=3D"gmail_extra"><br><div=
 class=3D"gmail_quote">On Tue, Jan 2, 2018 at 6:28 PM,  <span dir=3D"ltr">&=
lt;<a href=3D"mailto:git@git.openembedded.org" target=3D"_blank">git@git.op=
enembedded.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">This=
 is an automated email from the git hooks/post-receive script.<br>
<br>
rpurdie pushed a commit to branch master<br>
in repository openembedded-core.<br>
<br>
commit 923f91d8d8606141ce218927bc943f<wbr>4f4f34bcdd<br>
Author: Stefan Agner &lt;<a href=3D"mailto:stefan.agner@toradex.com">stefan=
.agner@toradex.com</a>&gt;<br>
AuthorDate: Tue Dec 12 17:13:24 2017 +0100<br>
<br>
=C2=A0 =C2=A0 waf.bbclass: explicitly pass bindir and libdir if supported<b=
r>
<br>
=C2=A0 =C2=A0 On some build hosts distros (e.g. Fedora 26) waf tries to be<=
br>
=C2=A0 =C2=A0 smart about libdir detection and defaults to [EXEC_PREFIX/lib=
64].<br>
=C2=A0 =C2=A0 This obviously is not what we want for 32-bit targets and usu=
ally<br>
=C2=A0 =C2=A0 fails in the do_package phase:<br>
=C2=A0 =C2=A0 =C2=A0 WARNING: gstreamer1.0-plugins-imx-0.13.<wbr>0-r0 do_pa=
ckage: QA Issue: gstreamer1.0-plugins-imx: Files/directories were installed=
 but not shipped in any package:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/lib64/libgstimxcommon.so.<wbr>0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ...<br>
<br>
=C2=A0 =C2=A0 Depending on version, waf knows prefix or prefix, bindir and<=
br>
=C2=A0 =C2=A0 libdir as default options. Explicitly pass the right set of<b=
r>
=C2=A0 =C2=A0 arguments.<br>
<br>
=C2=A0 =C2=A0 Signed-off-by: Stefan Agner &lt;<a href=3D"mailto:stefan.agne=
r@toradex.com">stefan.agner@toradex.com</a>&gt;<br>
=C2=A0 =C2=A0 Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@=
intel.com">ross.burton@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/waf.bbclass | 17 ++++++++++++++++-<br>
=C2=A01 file changed, 16 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass<br>
index c4698e9..acbda27 100644<br>
--- a/meta/classes/waf.bbclass<br>
+++ b/meta/classes/waf.bbclass<br>
@@ -25,8 +25,23 @@ def get_waf_parallel_make(d):<br>
<br>
=C2=A0 =C2=A0 =C2=A0return &quot;&quot;<br>
<br>
+python waf_preconfigure() {<br>
+=C2=A0 =C2=A0 from distutils.version import StrictVersion<br>
+=C2=A0 =C2=A0 srcsubdir =3D d.getVar(&#39;S&#39;)<br>
+=C2=A0 =C2=A0 wafbin =3D os.path.join(srcsubdir, &#39;waf&#39;)<br>
+=C2=A0 =C2=A0 status, result =3D oe.utils.getstatusoutput(<wbr>wafbin + &q=
uot; --version&quot;)<br>
+=C2=A0 =C2=A0 if status !=3D 0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot;Unable to execute waf --version,=
 exit code %d. Assuming waf version without bindir/libdir support.&quot; % =
status)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
+=C2=A0 =C2=A0 version =3D result.split()[1]<br>
+=C2=A0 =C2=A0 if StrictVersion(version) &gt;=3D StrictVersion(&quot;1.8.7&=
quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;WAF_EXTRA_CONF&quot;, &quot;--b=
indir=3D${bindir} --libdir=3D${libdir}&quot;)<br>
+}<br>
+<br>
+do_configure[prefuncs] +=3D &quot;waf_preconfigure&quot;<br>
+<br>
=C2=A0waf_do_configure() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0${S}/waf configure --prefix=3D${prefix} ${EXTRA=
_OECONF}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${S}/waf configure --prefix=3D${prefix} ${WAF_E=
XTRA_CONF} ${EXTRA_OECONF}<br>
=C2=A0}<br>
<br>
=C2=A0waf_do_compile()=C2=A0 {<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
To stop receiving notification emails like this one, please contact<br>
the administrator of this repository.<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-commits mailing list<br>
<a href=3D"mailto:Openembedded-commits@lists.openembedded.org">Openembedded=
-commits@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-comm=
its" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wb=
r>mailman/listinfo/openembedded-<wbr>commits</a><br>
</font></span></blockquote></div><br></div></div>

--001a11443614de42a60563f310f2--
