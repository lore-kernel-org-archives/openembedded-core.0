Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	by mail.openembedded.org (Postfix) with ESMTP id D012A6080F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Aug 2016 10:10:00 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id j185so229218516oih.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Aug 2016 03:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CmOwkCdjKVT6SoymdKccuCEgKaT7/H8L0TMmkImIZ+E=;
	b=YJRMyHi+ieUaZmSUSXJ40s+yQT3x0/V1Fgq44GNm2aYucxAXIa0l1Gib/vgKiFO7D4
	zJvezlO74ie4sye4fGawL8HNCtjM1VzPPqqLzci6DrHvd1vc3uwJQ+hK5BVNfN898+3Y
	EFN+7lDBSMeKB8TOHR1gPx5CntEewQRsQVFoAo8zpSlhdZy2LmkIGNNFCdeVlG/WKmbG
	6WH8YjSGt67Lurl5jCIw6vF71zTOn/V/gGL7XOtD6wXo+DZvUepjcTxpz3Z6zAlxe8pH
	7nO4K2p4QRPs9Rzg6bZT9aQ6ZTar4aIlayW+qhWIUwvJBLSgePaxLX1hCfEV0nqVDJgG
	WXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CmOwkCdjKVT6SoymdKccuCEgKaT7/H8L0TMmkImIZ+E=;
	b=XSVX8NuuGVRIGKgZTeUQpcmwYQl0i/b5N+5lIMMyNgQ++57v1lHpLZ5gO7tPTcmeCl
	zwanBmj7CrLWJ7yieYCFE0qIqbim/+5j0ZbB8p7SbCD3E8x8t5OF58Kp3ea+/Xbw5ju/
	o/NACdfbx7AoKPNy6UMsJt8L1BSVStKOnutOsa+ERtO0f07YGDNslrNJWX8l2fpPDD9l
	Wu3GdKhNB0OQb+0zPnE8iWR8Vd9Bqhv7jU8ow6SgBm6NbPtqZw7zWnvTotrEOc4LAYXA
	qHO4bg13jcnn5J2EHcoMNmFl3C2muGvMr/uPPYNwjwlxXvAFeKY9sRPdswPjDHCDHBNM
	TEdA==
X-Gm-Message-State: AEkoousJwAq7NLDM/z7HRgndtF1TD66PWcNLmfMflq2/eLh60WCWLSraRYYs+tCdfo+TbZMlFeLffkWiJBQxyJl4
X-Received: by 10.157.31.35 with SMTP id x32mr39372759otd.15.1470132601528;
	Tue, 02 Aug 2016 03:10:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.241.11 with HTTP; Tue, 2 Aug 2016 03:09:31 -0700 (PDT)
In-Reply-To: <1470065689-27089-1-git-send-email-maxin.john@intel.com>
References: <1470065689-27089-1-git-send-email-maxin.john@intel.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Tue, 2 Aug 2016 13:09:31 +0300
Message-ID: <CAHiDW_GZOaN8u00PtXu=K=5eQSDE_AfaBrACC0nRP9bEsVVd3Q@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] piglit: fix build failure with gold linker
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
X-List-Received-Date: Tue, 02 Aug 2016 10:10:05 -0000
Content-Type: multipart/alternative; boundary=001a1141bfd27cb72c053913eb37

--001a1141bfd27cb72c053913eb37
Content-Type: text/plain; charset=UTF-8

On 1 August 2016 at 18:34, Maxin B. John <maxin.john@intel.com> wrote:

> When we use gold linker while DISTRO set to "nodistro", piglit build
> fails with the following error:
>
> | ../../../../lib/libpiglitutil_gl.so.0: error: undefined reference to
> 'dlsym'
> | ../../../../lib/libpiglitutil_gl.so.0: error: undefined reference to
> 'dlerror'
> | ../../../../lib/libpiglitutil_gl.so.0: error: undefined reference to
> 'dlopen'
> | collect2: error: ld returned 1 exit status
>
> Fix it by providing '-ldl' to LDFLAGS.
>
> [YOCTO #9851]
>
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  meta/recipes-graphics/piglit/piglit_git.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-graphics/piglit/piglit_git.bb
> b/meta/recipes-graphics/piglit/piglit_git.bb
> index 811f7af..df90c4d 100644
> --- a/meta/recipes-graphics/piglit/piglit_git.bb
> +++ b/meta/recipes-graphics/piglit/piglit_git.bb
> @@ -30,6 +30,8 @@ do_compile[dirs] =+ "${B}/temp/"
>  PACKAGECONFIG ??= ""
>  PACKAGECONFIG[freeglut] =
> "-DPIGLIT_USE_GLUT=1,-DPIGLIT_USE_GLUT=0,freeglut,"
>
> +LDFLAGS_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold',
> '-ldl', '', d)}"
>

I think we should fix this with a build system patch and send it upstream
-- the problem only shows up with gold but it looks like a real bug.

Jussi

+
>  do_configure_prepend() {
>     if [ "${@bb.utils.contains('PACKAGECONFIG', 'freeglut', 'yes', 'no',
> d)}" = "no" ]; then
>          sed -i -e "/^#.*include <GL\/freeglut_ext.h>$/d"
> ${S}/src/piglit/glut_wrap.h
> --
> 2.4.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1141bfd27cb72c053913eb37
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 1 August 2016 at 18:34, Maxin B. John <span dir=3D"ltr">&lt;<a href=
=3D"mailto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">When we use gold linke=
r while DISTRO set to &quot;nodistro&quot;, piglit build<br>
fails with the following error:<br>
<br>
| ../../../../lib/libpiglitutil_gl.so.0: error: undefined reference to<br>
&#39;dlsym&#39;<br>
| ../../../../lib/libpiglitutil_gl.so.0: error: undefined reference to<br>
&#39;dlerror&#39;<br>
| ../../../../lib/libpiglitutil_gl.so.0: error: undefined reference to<br>
&#39;dlopen&#39;<br>
| collect2: error: ld returned 1 exit status<br>
<br>
Fix it by providing &#39;-ldl&#39; to LDFLAGS.<br>
<br>
[YOCTO #9851]<br>
<br>
Signed-off-by: Maxin B. John &lt;<a href=3D"mailto:maxin.john@intel.com">ma=
xin.john@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/piglit/<a href=3D"http://piglit_git.bb" rel=3D"=
noreferrer" target=3D"_blank">piglit_git.bb</a> | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/recipes-graphics/piglit/<a href=3D"http://piglit_git.bb" =
rel=3D"noreferrer" target=3D"_blank">piglit_git.bb</a> b/meta/recipes-graph=
ics/piglit/<a href=3D"http://piglit_git.bb" rel=3D"noreferrer" target=3D"_b=
lank">piglit_git.bb</a><br>
index 811f7af..df90c4d 100644<br>
--- a/meta/recipes-graphics/piglit/<a href=3D"http://piglit_git.bb" rel=3D"=
noreferrer" target=3D"_blank">piglit_git.bb</a><br>
+++ b/meta/recipes-graphics/piglit/<a href=3D"http://piglit_git.bb" rel=3D"=
noreferrer" target=3D"_blank">piglit_git.bb</a><br>
@@ -30,6 +30,8 @@ do_compile[dirs] =3D+ &quot;${B}/temp/&quot;<br>
=C2=A0PACKAGECONFIG ??=3D &quot;&quot;<br>
=C2=A0PACKAGECONFIG[freeglut] =3D &quot;-DPIGLIT_USE_GLUT=3D1,-DPIGLIT_USE_=
GLUT=3D0,freeglut,&quot;<br>
<br>
+LDFLAGS_append =3D &quot; ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, =
&#39;ld-is-gold&#39;, &#39;-ldl&#39;, &#39;&#39;, d)}&quot;<br>
</blockquote><div><br></div><div>I think we should fix this with a build sy=
stem patch and send it upstream -- the problem only shows up with gold but =
it looks like a real bug.</div><div><br></div><div>Jussi</div><div><br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">+<br>
=C2=A0do_configure_prepend() {<br>
=C2=A0 =C2=A0 if [ &quot;${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39=
;freeglut&#39;, &#39;yes&#39;, &#39;no&#39;, d)}&quot; =3D &quot;no&quot; ]=
; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &quot;/^#.*include &lt;GL\/free=
glut_ext.h&gt;$/d&quot; ${S}/src/piglit/glut_wrap.h<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.4.0<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div></div>

--001a1141bfd27cb72c053913eb37--
