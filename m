Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id C265465CAC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 03:45:51 +0000 (UTC)
Received: by qkx62 with SMTP id 62so216478290qkx.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 20:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=Oh/bZXbC/uKlrz8UUG6x30nxW/Dc/68eeZDVA52tlHw=;
	b=ryySfeB+lFDCyQ2Du65OOmZWqidKn1GAxZWHmqmRLwatxxymZ3tk+XaOFRITv5TXgW
	f6pBzSYrs0NQC7q365KrNQSeEuFOeUpraMa0kEwN2qqeEaRZFnV4tLTZqos4+Ovz9vuz
	D8x7CVPGQs033Vm8m12+0binyHJR62e88hRB84MCYx8cFM7FfXuNQ8Tpe/NgEXwi46m7
	biRHNweD0shfiuIEXk+Gt5WLwumaonZE3B+jubhycknRqxJzCyYjBpir1MSj0iRwC6J4
	5IubC3k+C46b2pu3Q+3yr5zoB869c21yluHmdVuKPL17RZWXp+JG24js86upl9C7WW3s
	jtKQ==
X-Received: by 10.55.20.159 with SMTP id 31mr36134575qku.64.1428983150975;
	Mon, 13 Apr 2015 20:45:50 -0700 (PDT)
Received: from [172.20.2.145] ([4.35.217.65])
	by mx.google.com with ESMTPSA id z69sm5566357qkz.27.2015.04.13.20.45.50
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 13 Apr 2015 20:45:50 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LaOa96E1-X16GoS0J753UGeYqX7pob4mgxqFUJ5aWWedw@mail.gmail.com>
Date: Mon, 13 Apr 2015 23:45:51 -0400
Message-Id: <CDEFCBEA-9EA0-49B0-8F7C-67119FD31FD1@gmail.com>
References: <cover.1428714999.git.raj.khem@gmail.com>
	<4f4335547f6d158ebc82ac40895259697e805e49.1428714999.git.raj.khem@gmail.com>
	<CAJTo0LaOa96E1-X16GoS0J753UGeYqX7pob4mgxqFUJ5aWWedw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.2098)
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
X-List-Received-Date: Tue, 14 Apr 2015 03:45:54 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_745D7CEC-717A-4298-96D1-B00B879DF54F"

--Apple-Mail=_745D7CEC-717A-4298-96D1-B00B879DF54F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Apr 13, 2015, at 9:50 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
> On 11 April 2015 at 02:20, Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>> wrote:
> ++#ifdef __GLIBC__
> + #include <execinfo.h>

yeah ideally, I could just use libunwind and get the backtrace API for =
musl too but I will do that when I need it.

>=20
> As you're checking for this header at configure time wouldn't it be =
best to use #ifdef HAVE_EXECINFO_H, just in case another C library adds =
it later?
>=20
> + /* from netinet/in.h */
> ++#if 0
> + struct in6_pktinfo {
> +       struct in6_addr ipi6_addr;  /* src/dst IPv6 address */
> +       unsigned int ipi6_ifindex;  /* send/recv interface index */
> + };
> ++#endif
>=20
> #if 0?  Is this entirely redundant code (in which case, delete it), or =
is this disabling something?

it is redundant if you are including netinet/in.h

> =20
> ++++ b/gweb/gresolv.c
> +@@ -876,8 +876,6 @@ GResolv *g_resolv_new(int index)
> +       resolv->index =3D index;
> +       resolv->nameserver_list =3D NULL;
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
>=20
> Surely these should be checked at configure time or wrapped in GLIBC =
tests, with the new codepath as a fallback.  Ideally we can upstream =
most of this.
> =20
> Ross=20


--Apple-Mail=_745D7CEC-717A-4298-96D1-B00B879DF54F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Apr 13, 2015, at 9:50 AM, Burton, Ross &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D""><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 11 =
April 2015 at 02:20, Khem Raj <span dir=3D"ltr" class=3D"">&lt;<a =
href=3D"mailto:raj.khem@gmail.com" target=3D"_blank" =
class=3D"">raj.khem@gmail.com</a>&gt;</span> wrote:<br =
class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left=
-style:solid;padding-left:1ex">++#ifdef __GLIBC__<br class=3D"">
</blockquote><div class=3D""><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left=
-style:solid;padding-left:1ex">+ #include &lt;execinfo.h&gt;<br =
class=3D""></blockquote></div></div></div></div></div></blockquote><div><b=
r class=3D""></div><div>yeah ideally, I could just use libunwind and get =
the backtrace API for musl too but I will do that when I need =
it.</div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D""><div dir=3D"ltr" class=3D""><div class=3D"gmail_extra"><div =
class=3D"gmail_quote"><div class=3D""><br class=3D""></div><div =
class=3D"">As you're checking for this header at configure time wouldn't =
it be best to use #ifdef HAVE_EXECINFO_H, just in case another =
C&nbsp;library adds it later?</div><div class=3D""><br =
class=3D""></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px =
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left=
-style:solid;padding-left:1ex">+ /* from netinet/in.h */<br =
class=3D""></blockquote><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left=
-style:solid;padding-left:1ex">
++#if 0<br class=3D"">
+ struct in6_pktinfo {<br class=3D"">
+&nbsp; &nbsp; &nbsp; &nbsp;struct in6_addr ipi6_addr;&nbsp; /* src/dst =
IPv6 address */<br class=3D"">
+&nbsp; &nbsp; &nbsp; &nbsp;unsigned int ipi6_ifindex;&nbsp; /* =
send/recv interface index */<br class=3D"">
+ };<br class=3D"">
++#endif<br class=3D"">
</blockquote><div class=3D""><br class=3D""></div><div class=3D"">#if =
0?&nbsp; Is this entirely redundant code (in which case, delete it), or =
is this disabling =
something?</div></div></div></div></div></blockquote><div><br =
class=3D""></div><div style=3D"widows: 1;">it is redundant if you are =
including <font color=3D"#500050" face=3D"arial, sans-serif" size=3D"2" =
class=3D""><span style=3D"background-color: rgb(255, 255, 255);" =
class=3D"">netinet/in.h</span></font></div><br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D""><div dir=3D"ltr" class=3D""><div =
class=3D"gmail_extra"><div class=3D"gmail_quote"><div =
class=3D"">&nbsp;</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left=
-style:solid;padding-left:1ex">++++ b/gweb/gresolv.c<br class=3D"">
+@@ -876,8 +876,6 @@ GResolv *g_resolv_new(int index)<br class=3D"">
+&nbsp; &nbsp; &nbsp; &nbsp;resolv-&gt;index =3D index;<br class=3D"">
+&nbsp; &nbsp; &nbsp; &nbsp;resolv-&gt;nameserver_list =3D NULL;<br =
class=3D"">
+<br class=3D"">
+-&nbsp; &nbsp; &nbsp; res_ninit(&amp;resolv-&gt;res);<br class=3D"">
+-<br class=3D"">
+&nbsp; &nbsp; &nbsp; &nbsp;return resolv;<br class=3D"">
+ }<br class=3D"">
+<br class=3D"">
+@@ -917,8 +915,6 @@ void g_resolv_unref(GResolv *resolv)<br class=3D"">
+<br class=3D"">
+&nbsp; &nbsp; &nbsp; &nbsp;flush_nameservers(resolv);<br class=3D"">
+<br class=3D"">
+-&nbsp; &nbsp; &nbsp; res_nclose(&amp;resolv-&gt;res);<br class=3D"">
+-<br class=3D"">
+&nbsp; &nbsp; &nbsp; &nbsp;g_free(resolv);<br class=3D"">
+ }<br class=3D"">
</blockquote><div class=3D""><br class=3D""></div><div class=3D"">Surely =
these should be checked at configure time or wrapped in GLIBC tests, =
with the new codepath as a fallback.&nbsp; Ideally we can upstream most =
of this.</div><div class=3D"">&nbsp;</div><div =
class=3D"">Ross&nbsp;</div></div></div></div>
</div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_745D7CEC-717A-4298-96D1-B00B879DF54F--
