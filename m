Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Tao9K-0000fd-S0
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Nov 2012 14:46:03 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa11so3800146pad.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2012 05:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=U2Qv1XMqpwMuT87aay8glkY/n+DYKV+Nc7awicHxQYk=;
	b=iUL/xgKydA22Jujau+eHju3FSzArThHD6H2wyWBrl4PxvTWTKgz2T+q0dXSoxNBzOQ
	tfgcaVwjTwOOFQBlbst9TklYzFl8A/pgPB+cqtcxQSRS9L81Hps2X3TRdfqafddA4V3L
	drAnsVq0FTwBtIx3w39n6W/3Zcg2nSE/UPevNN3p5rNOVVz2jaGsiKzA3FIQ39k8+4n4
	sSfEMCWA5kMmMWXGeuCXnVn0T3U1sqQ+OIItm5QQeGpSMOnqzTrJ2OkH5m8++OXtbMJ9
	VIHhgi5riBlVrpt15wlk1ed4vmlDytH3nHxVXFlExHqJaOhA4D/SRmiYkr+Sm2Wyvn5N
	ZRCA==
MIME-Version: 1.0
Received: by 10.68.132.196 with SMTP id ow4mr49626572pbb.49.1353418318602;
	Tue, 20 Nov 2012 05:31:58 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Tue, 20 Nov 2012 05:31:58 -0800 (PST)
In-Reply-To: <1353417464.23758.6.camel@ted>
References: <1353417464.23758.6.camel@ted>
Date: Tue, 20 Nov 2012 11:31:58 -0200
X-Google-Sender-Auth: t0RnrGbsMfQpxL3kKtZPubK8M0g
Message-ID: <CAP9ODKrzr3nXFoGoGBQP_uc5QFK1CkrAMCia3R=LjfU-jcNuTg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] build-appliance-image: Simplify fetch/unpack execution
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
X-List-Received-Date: Tue, 20 Nov 2012 13:46:03 -0000
Content-Type: multipart/alternative; boundary=047d7b15a8df1ce31e04ceed4288

--047d7b15a8df1ce31e04ceed4288
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Nov 20, 2012 at 11:17 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> This provides a slightly neater way of ensuring fetch/unpack get
> executed (image.bbclass marks them as noexec) since I found the
> current approach harder to understand at first glance.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>

Agreed.


> ---
> diff --git a/meta/recipes-core/images/build-appliance-image.bbb/meta/recipes-core/images/
> build-appliance-image.bb
> index 59ccb98..bf1e585 100644
> --- a/meta/recipes-core/images/build-appliance-image.bb
> +++ b/meta/recipes-core/images/build-appliance-image.bb
> @@ -68,11 +68,11 @@ fakeroot do_populate_poky_src () {
>
>  IMAGE_PREPROCESS_COMMAND += "do_populate_poky_src; "
>
> -python do_get_poky_src () {
> -    bb.build.exec_func('base_do_fetch', d)
> -    bb.build.exec_func('base_do_unpack', d)
> +python () {
> +       # Ensure we run these usually noexec tasks
> +       d.delVarFlag("do_fetch", "noexec")
> +       d.delVarFlag("do_unpack", "noexec")
>  }
> -addtask do_get_poky_src before do_rootfs
>

I'd say for include a comment in code so it is easy to understand why
you're drpping the flag.


>  create_bundle_files () {
>         cd ${WORKDIR}
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--047d7b15a8df1ce31e04ceed4288
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Tue, Nov 20, 2012 at 11:17 AM, Richar=
d Purdie <span dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfounda=
tion.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;</spa=
n> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">This provides a slightly neater way of ensur=
ing fetch/unpack get<br>
executed (image.bbclass marks them as noexec) since I found the<br>
current approach harder to understand at first glance.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org">richard.purdie@linuxfoundation.org</a>&gt;<br></blockquote><di=
v><br></div><div>Agreed.</div><div>=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">

---<br>
diff --git a/meta/recipes-core/images/<a href=3D"http://build-appliance-ima=
ge.bb" target=3D"_blank">build-appliance-image.bb</a> b/meta/recipes-core/i=
mages/<a href=3D"http://build-appliance-image.bb" target=3D"_blank">build-a=
ppliance-image.bb</a><br>

index 59ccb98..bf1e585 100644<br>
--- a/meta/recipes-core/images/<a href=3D"http://build-appliance-image.bb" =
target=3D"_blank">build-appliance-image.bb</a><br>
+++ b/meta/recipes-core/images/<a href=3D"http://build-appliance-image.bb" =
target=3D"_blank">build-appliance-image.bb</a><br>
@@ -68,11 +68,11 @@ fakeroot do_populate_poky_src () {<br>
<br>
=A0IMAGE_PREPROCESS_COMMAND +=3D &quot;do_populate_poky_src; &quot;<br>
<br>
-python do_get_poky_src () {<br>
- =A0 =A0bb.build.exec_func(&#39;base_do_fetch&#39;, d)<br>
- =A0 =A0bb.build.exec_func(&#39;base_do_unpack&#39;, d)<br>
+python () {<br>
+ =A0 =A0 =A0 # Ensure we run these usually noexec tasks<br>
+ =A0 =A0 =A0 d.delVarFlag(&quot;do_fetch&quot;, &quot;noexec&quot;)<br>
+ =A0 =A0 =A0 d.delVarFlag(&quot;do_unpack&quot;, &quot;noexec&quot;)<br>
=A0}<br>
-addtask do_get_poky_src before do_rootfs<br></blockquote><div><br></div><d=
iv>I&#39;d say for include a comment in code so it is easy to understand wh=
y you&#39;re drpping the flag.</div><div>=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">

=A0create_bundle_files () {<br>
=A0 =A0 =A0 =A0 cd ${WORKDIR}<br>
<br>
<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>Otavio Salva=
dor=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<=
br>E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">ota=
vio@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" target=
=3D"_blank">http://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--047d7b15a8df1ce31e04ceed4288--
