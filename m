Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 030566012C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 10:35:38 +0000 (UTC)
Received: by ioc74 with SMTP id 74so182124646ioc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 02:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=QwwrTddZyYhgZ3gWwMD7ENQcyLSRkPOArOQ9DuS5FNY=;
	b=DC7TVAey9G44GqWMLwuxHcRYDzbDQYZ50WGv06V3UX3QK0f8lo5bwZoWRT/izSGMYg
	/ySYqntIX6y/EHkQBOYoOnCC8DcYIAirJV1j8S4nbsOFEKRkQG7H5VAu1SpDuJT8yyVJ
	QkCBN7RpGJqg2SO1/z9muM9xallzjXY6BTfLXnJXF4FT8BixtgZ7k1jmRgkuLXDLN5RQ
	g7sCS5sXcJM1t724vzOrZzRIx2Bw34A44rtIm+HfQmMlN8IlOCm1sZoN2PbOE198v2QK
	HlCrd/+1NTzf0KENJjrzqMkmUrys//W0C2BG3N27xAvSjIg8NPfItizfUDd8MO7j78KI
	61JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=QwwrTddZyYhgZ3gWwMD7ENQcyLSRkPOArOQ9DuS5FNY=;
	b=UWw+4//bk5I6edxk/mGp4bLC44UxtleCCbU+QOwCK6ctUp4VcB4SY7fscFXfLnMu9L
	FMOH9fCzSK8P2CV5+GndId7YjwPLQb0od9A0TeKaMvLm14RY9gduu4dhZC+gnICajv76
	yHnfbXpZ+a9sydn/mJm+zsKUfyF0lVI/MPv2u043Qk/08eUQt0r4Ms8R7epwC8J0R4/x
	bpHoctZX8xwQeKsKd2w7d8EKIUMOInqThG1AS5i8EMu3tHfsjAt3evQOSDpwt+FCIw9d
	lvgO6hbsPg1mJBBEA7Tp9pMJ5p7UUNCBLyacpbzEJoNGZAI1HuDONcnqYy579GCwGcqz
	FSZg==
X-Gm-Message-State: ALoCoQmc5Hcd1dBVPSddstdUCGJFqKWzmXh7XBm+2ZfdQ6cSbRgFqloAw4TCjme6LG+hfjtwKBu8
X-Received: by 10.107.130.155 with SMTP id m27mr27716815ioi.133.1448274938950; 
	Mon, 23 Nov 2015 02:35:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Mon, 23 Nov 2015 02:35:19 -0800 (PST)
In-Reply-To: <1448131478-38698-1-git-send-email-ross.burton@intel.com>
References: <1448131478-38698-1-git-send-email-ross.burton@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 23 Nov 2015 10:35:19 +0000
Message-ID: <CAJTo0LZk9yvphJ7r6=feNK6n8XtPuoqFXx5qS=D9MOUYds-G-w@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] base: decode SRC_URI before adding implicit fetch dependencies
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
X-List-Received-Date: Mon, 23 Nov 2015 10:35:43 -0000
Content-Type: multipart/alternative; boundary=001a113ecd94460fae052532c978

--001a113ecd94460fae052532c978
Content-Type: text/plain; charset=UTF-8

These don't actually work, v2 incoming.

Ross

On 21 November 2015 at 18:44, Ross Burton <ross.burton@intel.com> wrote:

> To avoid false positives such as a SRC_URI for http://foo.xz/foo.zip
> gaining a
> dependnecy on xz-native decode the URI so that precise tests can be done.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/base.bbclass | 25 ++++++++++++-------------
>  1 file changed, 12 insertions(+), 13 deletions(-)
>
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index eb5edef..c7db81a 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -527,38 +527,37 @@ python () {
>                      bb.note("INCLUDING " + pn + " as buildable despite
> INCOMPATIBLE_LICENSE because it has been whitelisted for HOSTTOOLS")
>
>      srcuri = d.getVar('SRC_URI', True)
> +    (scheme, _ , path) = bb.fetch.decodeurl(srcuri)[:3]
>      # Svn packages should DEPEND on subversion-native
> -    if "svn://" in srcuri:
> +    if scheme == "svn":
>          d.appendVarFlag('do_fetch', 'depends', '
> subversion-native:do_populate_sysroot')
>
>      # Git packages should DEPEND on git-native
> -    if "git://" in srcuri:
> +    elif scheme == "git":
>          d.appendVarFlag('do_fetch', 'depends', '
> git-native:do_populate_sysroot')
>
>      # Mercurial packages should DEPEND on mercurial-native
> -    elif "hg://" in srcuri:
> +    elif scheme == "hg":
>          d.appendVarFlag('do_fetch', 'depends', '
> mercurial-native:do_populate_sysroot')
>
>      # OSC packages should DEPEND on osc-native
> -    elif "osc://" in srcuri:
> +    elif scheme == "osc"
>          d.appendVarFlag('do_fetch', 'depends', '
> osc-native:do_populate_sysroot')
>
> -    # *.lz4 should depends on lz4-native for unpacking
> -    # Not endswith because of "*.patch.lz4;patch=1". Need
> bb.fetch.decodeurl in future
> -    if '.lz4' in srcuri:
> +    # *.lz4 should DEPEND on lz4-native for unpacking
> +    if path.endswith('.lz4'):
>          d.appendVarFlag('do_unpack', 'depends', '
> lz4-native:do_populate_sysroot')
>
> -    # *.xz should depends on xz-native for unpacking
> -    # Not endswith because of "*.patch.xz;patch=1". Need
> bb.fetch.decodeurl in future
> -    if '.xz' in srcuri:
> +    # *.xz should DEPEND on xz-native for unpacking
> +    elif path.endswith('.xz'):
>          d.appendVarFlag('do_unpack', 'depends', '
> xz-native:do_populate_sysroot')
>
> -    # unzip-native should already be staged before unpacking ZIP recipes
> -    if ".zip" in srcuri:
> +    # .zip should DEPEND on unzip-native for unpacking
> +    elif path.endswith('.zip'):
>          d.appendVarFlag('do_unpack', 'depends', '
> unzip-native:do_populate_sysroot')
>
>      # file is needed by rpm2cpio.sh
> -    if ".src.rpm" in srcuri:
> +    elif path.endswith('.src.rpm'):
>          d.appendVarFlag('do_unpack', 'depends', '
> file-native:do_populate_sysroot')
>
>      set_packagetriplet(d)
> --
> 2.4.9 (Apple Git-60)
>
>

--001a113ecd94460fae052532c978
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">These don&#39;t actually work, v2 incoming.<div><br></div>=
<div>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 21 November 2015 at 18:44, Ross Burton <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">To avoid false posit=
ives such as a SRC_URI for <a href=3D"http://foo.xz/foo.zip" rel=3D"norefer=
rer" target=3D"_blank">http://foo.xz/foo.zip</a> gaining a<br>
dependnecy on xz-native decode the URI so that precise tests can be done.<b=
r>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ros=
s.burton@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/base.bbclass | 25 ++++++++++++-------------<br>
=C2=A01 file changed, 12 insertions(+), 13 deletions(-)<br>
<br>
diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass<br>
index eb5edef..c7db81a 100644<br>
--- a/meta/classes/base.bbclass<br>
+++ b/meta/classes/base.bbclass<br>
@@ -527,38 +527,37 @@ python () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0bb.note(&quot;INCLUDING &quot; + pn + &quot; as buildable despite INCOMP=
ATIBLE_LICENSE because it has been whitelisted for HOSTTOOLS&quot;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0srcuri =3D d.getVar(&#39;SRC_URI&#39;, True)<br>
+=C2=A0 =C2=A0 (scheme, _ , path) =3D bb.fetch.decodeurl(srcuri)[:3]<br>
=C2=A0 =C2=A0 =C2=A0# Svn packages should DEPEND on subversion-native<br>
-=C2=A0 =C2=A0 if &quot;svn://&quot; in srcuri:<br>
+=C2=A0 =C2=A0 if scheme =3D=3D &quot;svn&quot;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.appendVarFlag(&#39;do_fetch&#39;, &#39;=
depends&#39;, &#39; subversion-native:do_populate_sysroot&#39;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0# Git packages should DEPEND on git-native<br>
-=C2=A0 =C2=A0 if &quot;git://&quot; in srcuri:<br>
+=C2=A0 =C2=A0 elif scheme =3D=3D &quot;git&quot;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.appendVarFlag(&#39;do_fetch&#39;, &#39;=
depends&#39;, &#39; git-native:do_populate_sysroot&#39;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0# Mercurial packages should DEPEND on mercurial-native<=
br>
-=C2=A0 =C2=A0 elif &quot;hg://&quot; in srcuri:<br>
+=C2=A0 =C2=A0 elif scheme =3D=3D &quot;hg&quot;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.appendVarFlag(&#39;do_fetch&#39;, &#39;=
depends&#39;, &#39; mercurial-native:do_populate_sysroot&#39;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0# OSC packages should DEPEND on osc-native<br>
-=C2=A0 =C2=A0 elif &quot;osc://&quot; in srcuri:<br>
+=C2=A0 =C2=A0 elif scheme =3D=3D &quot;osc&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.appendVarFlag(&#39;do_fetch&#39;, &#39;=
depends&#39;, &#39; osc-native:do_populate_sysroot&#39;)<br>
<br>
-=C2=A0 =C2=A0 # *.lz4 should depends on lz4-native for unpacking<br>
-=C2=A0 =C2=A0 # Not endswith because of &quot;*.patch.lz4;patch=3D1&quot;.=
 Need bb.fetch.decodeurl in future<br>
-=C2=A0 =C2=A0 if &#39;.lz4&#39; in srcuri:<br>
+=C2=A0 =C2=A0 # *.lz4 should DEPEND on lz4-native for unpacking<br>
+=C2=A0 =C2=A0 if path.endswith(&#39;.lz4&#39;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.appendVarFlag(&#39;do_unpack&#39;, &#39=
;depends&#39;, &#39; lz4-native:do_populate_sysroot&#39;)<br>
<br>
-=C2=A0 =C2=A0 # *.xz should depends on xz-native for unpacking<br>
-=C2=A0 =C2=A0 # Not endswith because of &quot;*.patch.xz;patch=3D1&quot;. =
Need bb.fetch.decodeurl in future<br>
-=C2=A0 =C2=A0 if &#39;.xz&#39; in srcuri:<br>
+=C2=A0 =C2=A0 # *.xz should DEPEND on xz-native for unpacking<br>
+=C2=A0 =C2=A0 elif path.endswith(&#39;.xz&#39;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.appendVarFlag(&#39;do_unpack&#39;, &#39=
;depends&#39;, &#39; xz-native:do_populate_sysroot&#39;)<br>
<br>
-=C2=A0 =C2=A0 # unzip-native should already be staged before unpacking ZIP=
 recipes<br>
-=C2=A0 =C2=A0 if &quot;.zip&quot; in srcuri:<br>
+=C2=A0 =C2=A0 # .zip should DEPEND on unzip-native for unpacking<br>
+=C2=A0 =C2=A0 elif path.endswith(&#39;.zip&#39;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.appendVarFlag(&#39;do_unpack&#39;, &#39=
;depends&#39;, &#39; unzip-native:do_populate_sysroot&#39;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0# file is needed by rpm2cpio.sh<br>
-=C2=A0 =C2=A0 if &quot;.src.rpm&quot; in srcuri:<br>
+=C2=A0 =C2=A0 elif path.endswith(&#39;.src.rpm&#39;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.appendVarFlag(&#39;do_unpack&#39;, &#39=
;depends&#39;, &#39; file-native:do_populate_sysroot&#39;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0set_packagetriplet(d)<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.4.9 (Apple Git-60)<br>
<br>
</font></span></blockquote></div><br></div>

--001a113ecd94460fae052532c978--
