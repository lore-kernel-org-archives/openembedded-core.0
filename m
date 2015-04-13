Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	by mail.openembedded.org (Postfix) with ESMTP id 4C58773D3D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 13:51:03 +0000 (UTC)
Received: by oign205 with SMTP id n205so4264576oig.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 06:51:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=QYpbIynWR5OA5gwPwKYVncuAkIn9d7uFvR8QV0DQxQw=;
	b=S3ggy/sUtKIPt+RaLYSMiufPyz62co+4O5HmVrNPLrnfgOV5QbwOVesuCZOij8jGiA
	IpPHuua7zRsyu1jO3rR3yUsrJj1xvKuaOqbSib4cDhArWJeXdViNjDbIiThI/jBN2uUT
	Stj2M4fDbeBbv4fkcFUBhZLV2iD+66PPMox9oZN6tT/uOwOSKkpwngupHmBGKSNjFq7/
	OQ0vOc6nJtqIQ4U0Bahz5qdMnZKx1d/NcVd43VSAdOCKYUwNg1vfk6k5XI3Dab52iL5F
	/ZXKZdJ0yE5+VNDtJ9qfnJ8TZ2+IhckvGCMek9XptyOFlcdoIHymH4IDwX3pEBgVBroi
	ntAw==
X-Gm-Message-State: ALoCoQnhVqOQO4mzQLVF80/s1RM4sdwqf39NSFUsJRW5s3EKOdW5fQpBa3fS18+fnzKnkQ7VF5F8
X-Received: by 10.182.92.165 with SMTP id cn5mr12204420obb.10.1428933064543;
	Mon, 13 Apr 2015 06:51:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.108.216 with HTTP; Mon, 13 Apr 2015 06:50:44 -0700 (PDT)
In-Reply-To: <4f4335547f6d158ebc82ac40895259697e805e49.1428714999.git.raj.khem@gmail.com>
References: <cover.1428714999.git.raj.khem@gmail.com>
	<4f4335547f6d158ebc82ac40895259697e805e49.1428714999.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 13 Apr 2015 14:50:44 +0100
Message-ID: <CAJTo0LaOa96E1-X16GoS0J753UGeYqX7pob4mgxqFUJ5aWWedw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 08/17] connman: Fix builds to compile on musl
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
X-List-Received-Date: Mon, 13 Apr 2015 13:51:06 -0000
Content-Type: multipart/alternative; boundary=001a11c330d0b8683605139b6767

--001a11c330d0b8683605139b6767
Content-Type: text/plain; charset=UTF-8

On 11 April 2015 at 02:20, Khem Raj <raj.khem@gmail.com> wrote:

> ++#ifdef __GLIBC__
>
+ #include <execinfo.h>
>

As you're checking for this header at configure time wouldn't it be best to
use #ifdef HAVE_EXECINFO_H, just in case another C library adds it later?

+ /* from netinet/in.h */
>
++#if 0
> + struct in6_pktinfo {
> +       struct in6_addr ipi6_addr;  /* src/dst IPv6 address */
> +       unsigned int ipi6_ifindex;  /* send/recv interface index */
> + };
> ++#endif
>

#if 0?  Is this entirely redundant code (in which case, delete it), or is
this disabling something?


> ++++ b/gweb/gresolv.c
> +@@ -876,8 +876,6 @@ GResolv *g_resolv_new(int index)
> +       resolv->index = index;
> +       resolv->nameserver_list = NULL;
> +
> +-      res_ninit(&resolv->res);
> +-
> +       return resolv;
> + }
> +
> +@@ -917,8 +915,6 @@ void g_resolv_unref(GResolv *resolv)
> +
> +       flush_nameservers(resolv);
> +
> +-      res_nclose(&resolv->res);
> +-
> +       g_free(resolv);
> + }
>

Surely these should be checked at configure time or wrapped in GLIBC tests,
with the new codepath as a fallback.  Ideally we can upstream most of this.

Ross

--001a11c330d0b8683605139b6767
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
1 April 2015 at 02:20, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj=
.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:sol=
id;padding-left:1ex">++#ifdef __GLIBC__<br>
</blockquote><div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-=
left-style:solid;padding-left:1ex">+ #include &lt;execinfo.h&gt;<br></block=
quote></div><div><br></div><div>As you&#39;re checking for this header at c=
onfigure time wouldn&#39;t it be best to use #ifdef HAVE_EXECINFO_H, just i=
n case another C=C2=A0library adds it later?</div><div><br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width=
:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-lef=
t:1ex">+ /* from netinet/in.h */<br></blockquote><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left=
-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
++#if 0<br>
+ struct in6_pktinfo {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct in6_addr ipi6_addr;=C2=A0 /* src/dst IPv=
6 address */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int ipi6_ifindex;=C2=A0 /* send/recv i=
nterface index */<br>
+ };<br>
++#endif<br>
</blockquote><div><br></div><div>#if 0?=C2=A0 Is this entirely redundant co=
de (in which case, delete it), or is this disabling something?</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-s=
tyle:solid;padding-left:1ex">++++ b/gweb/gresolv.c<br>
+@@ -876,8 +876,6 @@ GResolv *g_resolv_new(int index)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0resolv-&gt;index =3D index;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0resolv-&gt;nameserver_list =3D NULL;<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 res_ninit(&amp;resolv-&gt;res);<br>
+-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return resolv;<br>
+ }<br>
+<br>
+@@ -917,8 +915,6 @@ void g_resolv_unref(GResolv *resolv)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0flush_nameservers(resolv);<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 res_nclose(&amp;resolv-&gt;res);<br>
+-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0g_free(resolv);<br>
+ }<br>
</blockquote><div><br></div><div>Surely these should be checked at configur=
e time or wrapped in GLIBC tests, with the new codepath as a fallback.=C2=
=A0 Ideally we can upstream most of this.</div><div>=C2=A0</div><div>Ross=
=C2=A0</div></div></div></div>

--001a11c330d0b8683605139b6767--
