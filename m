Return-Path: <danismostlikely@gmail.com>
Received: from mail-yk0-f175.google.com (mail-yk0-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id EB04062132
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 03:49:01 +0000 (UTC)
Received: by ykba77 with SMTP id a77so43635953ykb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 19:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=rZW1Uauztn+CMACIdTWHr1aZUjjvM6YHFO8NmsKUwL4=;
	b=vjpTNvLtJUuhsaBneJ+j2bJrDZFoQ15x0wThJZI76IdHGeyQSgxu+20BRWYj4pIIkN
	Ziqx89jM/6uCNculURoF/S5OREafQdn+kYW2jCbiGqKr9c6nUOCFd9hnJH1H+Dh7VHX8
	khKP1/0Iw7+wm0mtPtymB7aFWRPruLb3yW1E0oTlJ8s0dfGag4rzc8b9axPwjf0IjUr+
	UnReY9AFKUAB+A8Lr+CN3y9cFF2RR5VE1eVhSj98Tj7IbpAZPG8Cjn25Qul1U42DHuiX
	wYmUWeQ+X/xMksRVadt+Q3OOTUBgaEIgEbgaLhFepJqWt/WQdb+j3I0raeXRUTZevD59
	EQ7w==
MIME-Version: 1.0
X-Received: by 10.129.57.214 with SMTP id g205mr13414201ywa.172.1447818541978; 
	Tue, 17 Nov 2015 19:49:01 -0800 (PST)
Received: by 10.31.237.197 with HTTP; Tue, 17 Nov 2015 19:49:01 -0800 (PST)
Received: by 10.31.237.197 with HTTP; Tue, 17 Nov 2015 19:49:01 -0800 (PST)
In-Reply-To: <05b7cc8c957a9756e7af964a09bc2a89e0aedd9f.1447371049.git.chris_larson@mentor.com>
References: <cover.1447371049.git.chris_larson@mentor.com>
	<130d9a6c1f4ecea86748a44b73f51d8ddb2e63da.1447371049.git.chris_larson@mentor.com>
	<05b7cc8c957a9756e7af964a09bc2a89e0aedd9f.1447371049.git.chris_larson@mentor.com>
Date: Tue, 17 Nov 2015 21:49:01 -0600
Message-ID: <CACS+7ZR-KmxgSjSOptx_E3w4dFbMz_90munhQPcCfcEmvdV2DA@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: Christopher Larson <kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] systemd: add myhostname to nsswitch.conf
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
X-List-Received-Date: Wed, 18 Nov 2015 03:49:04 -0000
Content-Type: multipart/alternative; boundary=001a114c78d4e4de030524c885ec

--001a114c78d4e4de030524c885ec
Content-Type: text/plain; charset=UTF-8

On 12 Nov 2015 5:41 p.m., "Christopher Larson" <kergoth@gmail.com> wrote:
>
> From: Christopher Larson <chris_larson@mentor.com>
>
> We don't need nss-myhostname on systemd systems, because systemd already
> provides myhostname, but we weren't configuring nsswitch to use it. Being
able
> to resolve the hostname is useful for a number of different applications,
so
> enable it using the same postinst/prerm bits which are in nss-myhostname.

I have this and a similar change for resolved in an append at work. Would
others be interested in that too?

>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>  meta/recipes-core/systemd/systemd_225.bb | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/meta/recipes-core/systemd/systemd_225.bb
b/meta/recipes-core/systemd/systemd_225.bb
> index 18c2448..20515f5 100644
> --- a/meta/recipes-core/systemd/systemd_225.bb
> +++ b/meta/recipes-core/systemd/systemd_225.bb
> @@ -397,6 +397,18 @@ ALTERNATIVE_TARGET[runlevel] =
"${base_bindir}/systemctl"
>  ALTERNATIVE_LINK_NAME[runlevel] = "${base_sbindir}/runlevel"
>  ALTERNATIVE_PRIORITY[runlevel] ?= "300"
>
> +pkg_postinst_${PN} () {
> +       sed -e '/^hosts:/s/\s*\<myhostname\>//' \
> +               -e
's/\(^hosts:.*\)\(\<files\>\)\(.*\)\(\<dns\>\)\(.*\)/\1\2 myhostname
\3\4\5/' \
> +               -i $D${sysconfdir}/nsswitch.conf
> +}
> +
> +pkg_prerm_${PN} () {
> +       sed -e '/^hosts:/s/\s*\<myhostname\>//' \
> +               -e '/^hosts:/s/\s*myhostname//' \
> +               -i $D${sysconfdir}/nsswitch.conf
> +}
> +
>  pkg_postinst_udev-hwdb () {
>         if test -n "$D"; then
>                 ${@qemu_run_binary(d, '$D', '${base_bindir}/udevadm')}
hwdb --update \
> --
> 2.2.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--001a114c78d4e4de030524c885ec
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On 12 Nov 2015 5:41 p.m., &quot;Christopher Larson&quot; &lt;<a href=3D"mai=
lto:kergoth@gmail.com">kergoth@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor.com=
">chris_larson@mentor.com</a>&gt;<br>
&gt;<br>
&gt; We don&#39;t need nss-myhostname on systemd systems, because systemd a=
lready<br>
&gt; provides myhostname, but we weren&#39;t configuring nsswitch to use it=
. Being able<br>
&gt; to resolve the hostname is useful for a number of different applicatio=
ns, so<br>
&gt; enable it using the same postinst/prerm bits which are in nss-myhostna=
me.</p>
<p dir=3D"ltr">I have this and a similar change for resolved in an append a=
t work. Would others be interested in that too?<br></p>
<p dir=3D"ltr">&gt;<br>
&gt; Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@m=
entor.com">chris_larson@mentor.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_225.bb">syst=
emd_225.bb</a> | 12 ++++++++++++<br>
&gt; =C2=A01 file changed, 12 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_225.b=
b">systemd_225.bb</a> b/meta/recipes-core/systemd/<a href=3D"http://systemd=
_225.bb">systemd_225.bb</a><br>
&gt; index 18c2448..20515f5 100644<br>
&gt; --- a/meta/recipes-core/systemd/<a href=3D"http://systemd_225.bb">syst=
emd_225.bb</a><br>
&gt; +++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_225.bb">syst=
emd_225.bb</a><br>
&gt; @@ -397,6 +397,18 @@ ALTERNATIVE_TARGET[runlevel] =3D &quot;${base_bin=
dir}/systemctl&quot;<br>
&gt; =C2=A0ALTERNATIVE_LINK_NAME[runlevel] =3D &quot;${base_sbindir}/runlev=
el&quot;<br>
&gt; =C2=A0ALTERNATIVE_PRIORITY[runlevel] ?=3D &quot;300&quot;<br>
&gt;<br>
&gt; +pkg_postinst_${PN} () {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -e &#39;/^hosts:/s/\s*\&lt;myhostname\=
&gt;//&#39; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s/\(^h=
osts:.*\)\(\&lt;files\&gt;\)\(.*\)\(\&lt;dns\&gt;\)\(.*\)/\1\2 myhostname \=
3\4\5/&#39; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-i $D${sysconf=
dir}/nsswitch.conf<br>
&gt; +}<br>
&gt; +<br>
&gt; +pkg_prerm_${PN} () {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -e &#39;/^hosts:/s/\s*\&lt;myhostname\=
&gt;//&#39; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;/^host=
s:/s/\s*myhostname//&#39; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-i $D${sysconf=
dir}/nsswitch.conf<br>
&gt; +}<br>
&gt; +<br>
&gt; =C2=A0pkg_postinst_udev-hwdb () {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test -n &quot;$D&quot;; then<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@qemu_run_bi=
nary(d, &#39;$D&#39;, &#39;${base_bindir}/udevadm&#39;)} hwdb --update \<br=
>
&gt; --<br>
&gt; 2.2.1<br>
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

--001a114c78d4e4de030524c885ec--
