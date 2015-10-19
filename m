Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id 5EB297422C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 15:37:47 +0000 (UTC)
Received: by qgbb65 with SMTP id b65so55409296qgb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 08:37:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=3p81+9iM6JLpln7yu6EBaf0naaz3eZCqxG/sm/KfJAQ=;
	b=W2HrRdJpnPL0cMFPNn9ZHpi3XhgucnFsdi9Qazqpr97nHc8YqZx1J0nXN/0hV6EG+L
	hq9kATtwXJT+AMceKi3JOYg/1gdhKOH8H4FvZUEkhxiKkmJmRhfBBx3z8BEy1xR/h8KV
	Xh9YzsOdUx5H5eB7a+TDZ4dOLX/CeuurJNz4aAPedv+OLQf4HN44hpbc+H+3qQr3+h4d
	Ou8s5vRhagUk905e+wFNd1zinbanlNK8y0aYf9cWoArSkbNeVR0UhcX3mwwGlykoZTZO
	d3q+nUWfd7f20lufiJlkMphldBrGLjooaaBlpfXUU+N2ajctufihGPiXyHYj7u5yviC0
	j59w==
X-Gm-Message-State: ALoCoQkGa9bcmJ0McSG9sA40ITFkxdkU/2a4tiipgbqhWJJ3EY+I2t543k5fOaAPu3dv50BrO4IK
X-Received: by 10.140.218.84 with SMTP id o81mr23769552qhb.22.1445269067686;
	Mon, 19 Oct 2015 08:37:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.82 with HTTP; Mon, 19 Oct 2015 08:37:28 -0700 (PDT)
In-Reply-To: <1445249129-1475-1-git-send-email-ross.burton@intel.com>
References: <1445249129-1475-1-git-send-email-ross.burton@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 19 Oct 2015 16:37:28 +0100
Message-ID: <CAJTo0LaoQ4yp0AQtdKLQq22Nh=bgKgb4T8ApxyqxUc=U09FLkA@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] bitbake: add file-native to ASSUME_PROVIDED
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
X-List-Received-Date: Mon, 19 Oct 2015 15:37:48 -0000
Content-Type: multipart/alternative; boundary=001a113734b462960f052276ed91

--001a113734b462960f052276ed91
Content-Type: text/plain; charset=UTF-8

So this breaks rpm-native v4, which needs file-native as it links to
libmagic.

Not sure what to do here.  If we install file-native directly into the
sysroot we get occasional races on the file binary  causing build
failures.  If we make file-native ASSUME_PROVIDED then rpm (and subversion)
change their behaviour depending on the presence of libmagic-dev on the
host (well, rpm4 requires libmagic, rpm5 and subversion change their
configuration).

Thoughts?

Ross

On 19 October 2015 at 11:05, Ross Burton <ross.burton@intel.com> wrote:

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/conf/bitbake.conf | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 9ddd1c0..06971da 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -166,6 +166,7 @@ DATETIME = "${DATE}${TIME}"
>  ASSUME_PROVIDED = "\
>      bzip2-native \
>      chrpath-native \
> +    file-native \
>      git-native \
>      grep-native \
>      diffstat-native \
> --
> 2.1.4
>
>

--001a113734b462960f052276ed91
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">So this breaks rpm-native v4, which needs file-native as i=
t links to libmagic.<div><br></div><div>Not sure what to do here.=C2=A0 If =
we install file-native directly into the sysroot we get occasional races on=
 the file binary =C2=A0causing build failures.=C2=A0 If we make file-native=
 ASSUME_PROVIDED then rpm (and subversion) change their behaviour depending=
 on the presence of libmagic-dev on the host (well, rpm4 requires libmagic,=
 rpm5 and subversion change their configuration).</div><div><br></div><div>=
Thoughts?</div><div><br></div><div>Ross</div></div><div class=3D"gmail_extr=
a"><br><div class=3D"gmail_quote">On 19 October 2015 at 11:05, Ross Burton =
<span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_b=
lank">ross.burton@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel=
.com">ross.burton@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/bitbake.conf | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
index 9ddd1c0..06971da 100644<br>
--- a/meta/conf/bitbake.conf<br>
+++ b/meta/conf/bitbake.conf<br>
@@ -166,6 +166,7 @@ DATETIME =3D &quot;${DATE}${TIME}&quot;<br>
=C2=A0ASSUME_PROVIDED =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0bzip2-native \<br>
=C2=A0 =C2=A0 =C2=A0chrpath-native \<br>
+=C2=A0 =C2=A0 file-native \<br>
=C2=A0 =C2=A0 =C2=A0git-native \<br>
=C2=A0 =C2=A0 =C2=A0grep-native \<br>
=C2=A0 =C2=A0 =C2=A0diffstat-native \<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.1.4<br>
<br>
</font></span></blockquote></div><br></div>

--001a113734b462960f052276ed91--
