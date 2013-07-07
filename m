Return-Path: <v.mayoralv@gmail.com>
Received: from mail-vb0-f43.google.com (mail-vb0-f43.google.com
	[209.85.212.43])
	by mail.openembedded.org (Postfix) with ESMTP id F321C619DD
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Jul 2013 10:09:33 +0000 (UTC)
Received: by mail-vb0-f43.google.com with SMTP id e12so2705681vbg.16
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Jul 2013 03:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=GjV+sPbffnfgSp4SrRhk3kNyMmRU9CZcvcvfFHSaCyU=;
	b=ecOqc7KXLEGX1PhcvkxpWeTo27A0JI7qsfG8j+p6t+N8MqyYjN5Y8KEv6vBCf5fupE
	lp4lKO3Q7aerXXWpIbloA76eNzr+BSD4+8lr18M084XWq1mR2lX/MYJkOqpC19VGi+a+
	j1u4A9CHGGRMq08ZMpTUNAzVBAZGP6HvQ3YNJkRRNOD5vvtgx/qjqhy2lG+vw5a6I/EG
	hLFDSEfpq9b1QKE9mZ5C3yZqbLGJIOwQTPLtc7sjkUIY4ZaKHKDhR+aeU5zHwfspv7UR
	23AXqsG3whuao+k/7xhwBFnW8l4XnwwoLpKGqOhJ973dt+EYtaF6dJ9Bl4PiyO8lFsPY
	Hikg==
MIME-Version: 1.0
X-Received: by 10.58.237.105 with SMTP id vb9mr11676322vec.2.1373191774057;
	Sun, 07 Jul 2013 03:09:34 -0700 (PDT)
Received: by 10.58.210.42 with HTTP; Sun, 7 Jul 2013 03:09:34 -0700 (PDT)
In-Reply-To: <1373027799-3470-1-git-send-email-v.mayoralv@gmail.com>
References: <1373027799-3470-1-git-send-email-v.mayoralv@gmail.com>
Date: Sun, 7 Jul 2013 12:09:34 +0200
Message-ID: <CAKpQ202PRTQm4TwzVt_rOPmOo30FfG_tSe9sw4QUQ-cLz-UhHg@mail.gmail.com>
From: =?ISO-8859-1?Q?V=EDctor_MV?= <v.mayoralv@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] apr: add apr_cv_mutex_recursive=yes to support meta-ros
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
X-List-Received-Date: Sun, 07 Jul 2013 10:09:34 -0000
Content-Type: multipart/alternative; boundary=089e01294a50e6ba3d04e0e91f24

--089e01294a50e6ba3d04e0e91f24
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

I sent this patch to the list a couple of days ago following the
instructions given previously. What's the state of the patch?
There were some discussions regarding wether it should be separated in two
commits or not.

Could anybody inform me if the patch has been accepted?

Regards,

V=EDctor.



From: victor <v.mayoralv@gmail.com>

By default apr_cv_mutex_recursive in apr is set to "no" and this leads
to the APRENOTIMPL return value of apr_thread_mutex_create in
thread_mutex.c when
APR_THREAD_MUTEX_NESTED is requested via flags which leads to a deadlock in
applications
using apr, as observed in an application with log4cxx.

This commit adds CACHED_CONFIGUREVARS +=3D "apr_cv_mutex_recursive=3Dyes" t=
o
apr_1.4.6.bb
and removes this variable in powerpc32-linux to address this issue.

We detected this issue while working at the meta-ros project
https://github.com/bmwcarit/meta-ros
(https://github.com/bmwcarit/meta-ros/issues/68)

Signed-off-by: V=EDctor Mayoral Vilches <v.mayoralv@gmail.com>
---
 meta/recipes-support/apr/apr_1.4.6.bb |    3 +++
 meta/site/powerpc32-linux             |    1 -
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/apr/apr_1.4.6.bbb/meta/recipes-support/ap=
r/
apr_1.4.6.bb
index 896f79f..ba59639 100644
--- a/meta/recipes-support/apr/apr_1.4.6.bb
+++ b/meta/recipes-support/apr/apr_1.4.6.bb
@@ -23,6 +23,9 @@ inherit autotools lib_package binconfig multilib_header

 OE_BINCONFIG_EXTRA_MANGLE =3D " -e 's:location=3Dsource:location=3Dinstall=
ed:'"

+# Added to fix some issues with cmake. Refer to
https://github.com/bmwcarit/meta-ros/issues/68#issuecomment-19896928
+CACHED_CONFIGUREVARS +=3D "apr_cv_mutex_recursive=3Dyes"
+
 do_configure_prepend() {
        cd ${S}
        ./buildconf
diff --git a/meta/site/powerpc32-linux b/meta/site/powerpc32-linux
index 4550df3..b3973c9 100644
--- a/meta/site/powerpc32-linux
+++ b/meta/site/powerpc32-linux
@@ -203,7 +203,6 @@ apr_cv_use_lfs64=3D${apr_cv_use_lfs64=3Dyes}
 apr_cv_epoll=3D${apr_cv_epoll=3Dyes}
 apr_cv_pthreads_cflags=3D${apr_cv_pthreads_cflags=3D-pthread}
 apr_cv_pthreads_lib=3D${apr_cv_pthreads_lib=3D-lpthread}
-apr_cv_mutex_recursive=3D${apr_cv_mutex_recursive=3Dyes}
 ac_cv_func_mmap=3D${ac_cv_func_mmap=3Dyes}
 ac_cv_file__dev_zero=3D${ac_cv_file__dev_zero=3Dyes}
 ac_cv_sizeof_off_t=3D${ac_cv_sizeof_off_t=3D4}
--
1.7.9.5

--089e01294a50e6ba3d04e0e91f24
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br>Hi,<div><br></div><div>I sent this patch to the list a=
 couple of days ago following the instructions given previously. What&#39;s=
 the state of the patch?</div><div>There were some discussions regarding we=
ther it should be separated in two commits or not.</div>
<div><br></div><div>Could anybody inform me if the patch has been accepted?=
</div><div><br></div><div>Regards,</div><div><br></div><div>V=EDctor.<br><d=
iv class=3D"gmail_quote"><br></div><div class=3D"gmail_quote"><br><br>From:=
 victor &lt;<a href=3D"mailto:v.mayoralv@gmail.com">v.mayoralv@gmail.com</a=
>&gt;<br>

<br>
By default apr_cv_mutex_recursive in apr is set to &quot;no&quot; and this =
leads<br>
to the APRENOTIMPL return value of apr_thread_mutex_create in thread_mutex.=
c when<br>
APR_THREAD_MUTEX_NESTED is requested via flags which leads to a deadlock in=
 applications<br>
using apr, as observed in an application with log4cxx.<br>
<br>
This commit adds CACHED_CONFIGUREVARS +=3D &quot;apr_cv_mutex_recursive=3Dy=
es&quot; to <a href=3D"http://apr_1.4.6.bb" target=3D"_blank">apr_1.4.6.bb<=
/a><br>
and removes this variable in powerpc32-linux to address this issue.<br>
<br>
We detected this issue while working at the meta-ros project <a href=3D"htt=
ps://github.com/bmwcarit/meta-ros" target=3D"_blank">https://github.com/bmw=
carit/meta-ros</a><br>
(<a href=3D"https://github.com/bmwcarit/meta-ros/issues/68" target=3D"_blan=
k">https://github.com/bmwcarit/meta-ros/issues/68</a>)<br>
<br>
Signed-off-by: V=EDctor Mayoral Vilches &lt;<a href=3D"mailto:v.mayoralv@gm=
ail.com">v.mayoralv@gmail.com</a>&gt;<br>
---<br>
=A0meta/recipes-support/apr/<a href=3D"http://apr_1.4.6.bb" target=3D"_blan=
k">apr_1.4.6.bb</a> | =A0 =A03 +++<br>
=A0meta/site/powerpc32-linux =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A01 -<br>
=A02 files changed, 3 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-support/apr/<a href=3D"http://apr_1.4.6.bb" targe=
t=3D"_blank">apr_1.4.6.bb</a> b/meta/recipes-support/apr/<a href=3D"http://=
apr_1.4.6.bb" target=3D"_blank">apr_1.4.6.bb</a><br>
index 896f79f..ba59639 100644<br>
--- a/meta/recipes-support/apr/<a href=3D"http://apr_1.4.6.bb" target=3D"_b=
lank">apr_1.4.6.bb</a><br>
+++ b/meta/recipes-support/apr/<a href=3D"http://apr_1.4.6.bb" target=3D"_b=
lank">apr_1.4.6.bb</a><br>
@@ -23,6 +23,9 @@ inherit autotools lib_package binconfig multilib_header<b=
r>
<br>
=A0OE_BINCONFIG_EXTRA_MANGLE =3D &quot; -e &#39;s:location=3Dsource:locatio=
n=3Dinstalled:&#39;&quot;<br>
<br>
+# Added to fix some issues with cmake. Refer to <a href=3D"https://github.=
com/bmwcarit/meta-ros/issues/68#issuecomment-19896928" target=3D"_blank">ht=
tps://github.com/bmwcarit/meta-ros/issues/68#issuecomment-19896928</a><br>

+CACHED_CONFIGUREVARS +=3D &quot;apr_cv_mutex_recursive=3Dyes&quot;<br>
+<br>
=A0do_configure_prepend() {<br>
=A0 =A0 =A0 =A0 cd ${S}<br>
=A0 =A0 =A0 =A0 ./buildconf<br>
diff --git a/meta/site/powerpc32-linux b/meta/site/powerpc32-linux<br>
index 4550df3..b3973c9 100644<br>
--- a/meta/site/powerpc32-linux<br>
+++ b/meta/site/powerpc32-linux<br>
@@ -203,7 +203,6 @@ apr_cv_use_lfs64=3D${apr_cv_use_lfs64=3Dyes}<br>
=A0apr_cv_epoll=3D${apr_cv_epoll=3Dyes}<br>
=A0apr_cv_pthreads_cflags=3D${apr_cv_pthreads_cflags=3D-pthread}<br>
=A0apr_cv_pthreads_lib=3D${apr_cv_pthreads_lib=3D-lpthread}<br>
-apr_cv_mutex_recursive=3D${apr_cv_mutex_recursive=3Dyes}<br>
=A0ac_cv_func_mmap=3D${ac_cv_func_mmap=3Dyes}<br>
=A0ac_cv_file__dev_zero=3D${ac_cv_file__dev_zero=3Dyes}<br>
=A0ac_cv_sizeof_off_t=3D${ac_cv_sizeof_off_t=3D4}<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.9.5<br>
<br>
</font></span></div><br></div></div>

--089e01294a50e6ba3d04e0e91f24--
