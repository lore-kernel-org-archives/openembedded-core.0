Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id A56EF76732
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 13:30:00 +0000 (UTC)
Received: by iodv127 with SMTP id v127so8522526iod.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 06:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=88VLYSYPmCpkCHwrdQHBInWIiPDBj/xGx3Ry5/i+fng=;
	b=M3n8IMKyP/dlxD5obd6l1xSgvBTIl8boupXLADazwy18j09Fbtp7U2ndF+e5cSLQEg
	HOCZeFFqmfimuFbVZfEBl7h0yM2LLElz6ciJK0AbHLMbd7cZhX3Rh8JQeG1BS7lO1bBd
	/IRyok48SXRwO4J9tsx+pvEFJiZd+mwjQ5hqOZgIKYOXbBNzFBJrOi+ulLW1Zs+Oep2A
	rb50NmjLGafrTfULO2OBpKihagNy2/fh0F1blUMMkDH2Y00MjxL/vsDuaWdI4Qj7y2rr
	xK2bD52aZQUjCUaw7jkUPkan63urT82AclZZKpKNm0jBmFKSDcjfIvIOUbD3s5cZsX2j
	Dxsg==
MIME-Version: 1.0
X-Received: by 10.107.168.214 with SMTP id e83mr11783874ioj.112.1439991000212; 
	Wed, 19 Aug 2015 06:30:00 -0700 (PDT)
Received: by 10.107.38.79 with HTTP; Wed, 19 Aug 2015 06:30:00 -0700 (PDT)
Received: by 10.107.38.79 with HTTP; Wed, 19 Aug 2015 06:30:00 -0700 (PDT)
In-Reply-To: <7f16380e7f6a96b203f3b54738330785685ed093.1439970618.git.liezhi.yang@windriver.com>
References: <cover.1439970618.git.liezhi.yang@windriver.com>
	<7f16380e7f6a96b203f3b54738330785685ed093.1439970618.git.liezhi.yang@windriver.com>
Date: Wed, 19 Aug 2015 06:30:00 -0700
Message-ID: <CAMKF1sqB6W-z1cByvrJ9=ppxoOyjf6zS8aBCNm_vnAmwZ_M+2A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] glibc: use cross-rpcgen to replace host's rpcgen
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
X-List-Received-Date: Wed, 19 Aug 2015 13:30:00 -0000
Content-Type: multipart/alternative; boundary=001a114275880c2915051daa080b

--001a114275880c2915051daa080b
Content-Type: text/plain; charset=UTF-8

On Aug 19, 2015 12:51 AM, "Robert Yang" <liezhi.yang@windriver.com> wrote:
>
> There might be unexpected errors when use host's rpcgen.
>
> [YOCTO #8181]

This is fine

>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-core/glibc/glibc_2.22.bb |    6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/meta/recipes-core/glibc/glibc_2.22.bb
b/meta/recipes-core/glibc/glibc_2.22.bb
> index 6aaf722..f0e1fad 100644
> --- a/meta/recipes-core/glibc/glibc_2.22.bb
> +++ b/meta/recipes-core/glibc/glibc_2.22.bb
> @@ -97,10 +97,6 @@ do_configure () {
>  # calls for now
>  # don't pass CPPFLAGS into configure, since it upsets the kernel-headers
>  # version check and doesn't really help with anything
> -        if [ -z "`which rpcgen`" ]; then
> -                echo "rpcgen not found.  Install glibc-devel."
> -                exit 1
> -        fi
>          (cd ${S} && gnu-configize) || die "failure in running
gnu-configize"
>          find ${S} -name "configure" | xargs touch
>          CPPFLAGS="" oe_runconf
> @@ -119,7 +115,7 @@ do_compile () {
>                 for r in ${rpcsvc}; do
>                         h=`echo $r|sed -e's,\.x$,.h,'`
>                         rm -f $h
> -                       rpcgen -h $r -o $h || bbwarn "${PN}: unable to
generate header for $r"
> +                       ${B}/sunrpc/cross-rpcgen -h $r -o $h || bbwarn
"${PN}: unable to generate header for $r"
>                 done
>         )
>         echo "Adjust ldd script"
> --
> 1.7.9.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--001a114275880c2915051daa080b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Aug 19, 2015 12:51 AM, &quot;Robert Yang&quot; &lt;<a href=3D"mailto:lie=
zhi.yang@windriver.com">liezhi.yang@windriver.com</a>&gt; wrote:<br>
&gt;<br>
&gt; There might be unexpected errors when use host&#39;s rpcgen.<br>
&gt;<br>
&gt; [YOCTO #8181]</p>
<p dir=3D"ltr">This is fine</p>
<p dir=3D"ltr">&gt;<br>
&gt; Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver=
.com">liezhi.yang@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/recipes-core/glibc/<a href=3D"http://glibc_2.22.bb">glibc_2=
.22.bb</a> |=C2=A0 =C2=A0 6 +-----<br>
&gt; =C2=A01 file changed, 1 insertion(+), 5 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.22.bb">=
glibc_2.22.bb</a> b/meta/recipes-core/glibc/<a href=3D"http://glibc_2.22.bb=
">glibc_2.22.bb</a><br>
&gt; index 6aaf722..f0e1fad 100644<br>
&gt; --- a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.22.bb">glibc_2=
.22.bb</a><br>
&gt; +++ b/meta/recipes-core/glibc/<a href=3D"http://glibc_2.22.bb">glibc_2=
.22.bb</a><br>
&gt; @@ -97,10 +97,6 @@ do_configure () {<br>
&gt; =C2=A0# calls for now<br>
&gt; =C2=A0# don&#39;t pass CPPFLAGS into configure, since it upsets the ke=
rnel-headers<br>
&gt; =C2=A0# version check and doesn&#39;t really help with anything<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -z &quot;`which rpcgen`&quot; ]; the=
n<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;rp=
cgen not found.=C2=A0 Install glibc-devel.&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(cd ${S} &amp;&amp; gnu-configize) |=
| die &quot;failure in running gnu-configize&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0find ${S} -name &quot;configure&quot=
; | xargs touch<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CPPFLAGS=3D&quot;&quot; oe_runconf<b=
r>
&gt; @@ -119,7 +115,7 @@ do_compile () {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for r in ${rpc=
svc}; do<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 h=3D`echo $r|sed -e&#39;s,\.x$,.h,&#39;`<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 rm -f $h<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0rpcgen -h $r -o $h || bbwarn &quot;${PN}: unable to generate =
header for $r&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0${B}/sunrpc/cross-rpcgen -h $r -o $h || bbwarn &quot;${PN}: u=
nable to generate header for $r&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Adjust ldd script&quot;<br>
&gt; --<br>
&gt; 1.7.9.5<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>=
<br>
</p>

--001a114275880c2915051daa080b--
