Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f181.google.com (mail-ie0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 8028B6D965
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 14:53:00 +0000 (UTC)
Received: by mail-ie0-f181.google.com with SMTP id tp5so2685505ieb.26
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 06:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=XkEgM+6q2jzavweij7iDmncGYjAW5KQYAShKEGe96cI=;
	b=T4ELBhBfb92mxzciLuMzM32c+cgHPoRGzl8d5xVhH79KiPq7ebPtEFMLJg8OcuV+uP
	O60LEu8Lu5US+asmnx3VmlwaRfsYizz7gW1L7ZAa0YEWoP7VBLEqU2VSdd2F7YhucagV
	ckcvV0qgX5QwF11PpL5jLatQ5vCyzpJQ801+T1BCvMftVGzv5XsocgWql5ayt38/q7Bt
	p1tBCsdmjqHOOenc/tNchpTwxauOaqJ0W4ly4ccRYX7jwaFJLA9/L/2sLe6SYIJKftu/
	qOBERo2H5yFLJ3XossNM230EaJ+qCWvr9/7MgEHofTXTvRVlK106vdYUgoW3RlCilVUM
	1ZIA==
MIME-Version: 1.0
X-Received: by 10.50.25.129 with SMTP id c1mr1537455igg.23.1384440782200; Thu,
	14 Nov 2013 06:53:02 -0800 (PST)
Received: by 10.50.79.167 with HTTP; Thu, 14 Nov 2013 06:53:02 -0800 (PST)
In-Reply-To: <1384440081.17320.65.camel@phil-desktop.brightsign>
References: <1384440081.17320.65.camel@phil-desktop.brightsign>
Date: Thu, 14 Nov 2013 06:53:02 -0800
Message-ID: <CAMKF1spw=ARc3dXgTX4k9E4T4y39Vctyx9RNeeaAqoj9zfcYUw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] boost: Add patch to avoid undefined references to boost::atomic::lockpool::get_lock_for()
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
X-List-Received-Date: Thu, 14 Nov 2013 14:53:00 -0000
Content-Type: multipart/alternative; boundary=047d7bdc10ec092d0004eb243d15

--047d7bdc10ec092d0004eb243d15
Content-Type: text/plain; charset=UTF-8

On Thursday, November 14, 2013, Phil Blundell wrote:

> Boost::thread uses functions from boost::atomic but doesn't actually
> link with libboost_atomic.  This works fine on platforms where
> BOOST_ATOMIC_FLAG_LOCK_FREE is true but will lead to undefined
> symbol references otherwise.  Fix this by applying a patch from
> the upstream bug tracker to add the missing library linkage.


Is it fixed in 1.55? Then we might apply this to Dora and upgrade master to
1.55

>
> Signed-off-by: Phil Blundell <pb@pbcl.net <javascript:;>>
> ---
>  meta/recipes-support/boost/boost_1.54.0.bb         |  1 +
>  .../files/boost-1.54.0-thread-link_atomic.patch    | 59
> ++++++++++++++++++++++
>  2 files changed, 60 insertions(+)
>  create mode 100644
> meta/recipes-support/boost/files/boost-1.54.0-thread-link_atomic.patch
>
> diff --git a/meta/recipes-support/boost/boost_1.54.0.bbb/meta/recipes-support/boost/
> boost_1.54.0.bb
> index 3cf88fa..9e7a60a 100644
> --- a/meta/recipes-support/boost/boost_1.54.0.bb
> +++ b/meta/recipes-support/boost/boost_1.54.0.bb
> @@ -3,4 +3,5 @@ include boost.inc
>
>  SRC_URI += "file://arm-intrinsics.patch \
>              file://glibc.patch \
> +            file://boost-1.54.0-thread-link_atomic.patch \
>             "
> diff --git
> a/meta/recipes-support/boost/files/boost-1.54.0-thread-link_atomic.patch
> b/meta/recipes-support/boost/files/boost-1.54.0-thread-link_atomic.patch
> new file mode 100644
> index 0000000..d39d0a9
> --- /dev/null
> +++
> b/meta/recipes-support/boost/files/boost-1.54.0-thread-link_atomic.patch
> @@ -0,0 +1,59 @@
> +Link boost_thread with boost_atomic to avoid undefined references to
> +boost::atomic::detail::lock_pool::get_lock_for().
> +
> +From https://svn.boost.org/trac/boost/ticket/9041
> +
> +Phil Blundell <pb@pbcl.net <javascript:;>>
> +Upstream-Status: Backport
> +
> +diff -Nurp
> boost_1_54_0/libs/thread/build/has_atomic_flag_lockfree_test.cpp
> boost_1_54_0.pm/libs/thread/build/has_atomic_flag_lockfree_test.cpp
> +--- boost_1_54_0/libs/thread/build/has_atomic_flag_lockfree_test.cpp
> 1970-01-01 01:00:00.000000000 +0100
> ++++ boost_1_54_0.pm/libs/thread/build/has_atomic_flag_lockfree_test.cpp       2013-08-23 19:51:52.706329968 +0200
> +@@ -0,0 +1,14 @@
> ++// Copyright (c) 2013, Petr Machata, Red Hat Inc.
> ++//
> ++// Use modification and distribution are subject to the boost Software
> ++// License, Version 1.0.  (See http://www.boost.org/LICENSE_1_0.txt).
> ++
> ++#include "../../../boost/atomic.hpp"
> ++#include "../../../boost/static_assert.hpp"
> ++
> ++int
> ++main(int argc, char *argv[])
> ++{
> ++  BOOST_STATIC_ASSERT(BOOST_ATOMIC_FLAG_LOCK_FREE);
> ++  return 0;
> ++}
> +diff -Nurp boost_1_54_0/libs/thread/build/Jamfile.v2
> boost_1_54_0.pm/libs/thread/build/Jamfile.v2
> +--- boost_1_54_0/libs/thread/build/Jamfile.v2  2013-06-15
> 12:35:45.000000000 +0200
> ++++ boost_1_54_0.pm/libs/thread/build/Jamfile.v2       2013-08-23
> 19:52:30.018613408 +0200
> +@@ -36,6 +36,7 @@ import os ;
> + import feature ;
> + import indirect ;
> + import path ;
> ++import configure ;
> +
> + project boost/thread
> +     : source-location ../src
> +@@ -140,6 +141,8 @@ local rule default_threadapi ( )
> + feature.feature threadapi : pthread win32 : propagated ;
> + feature.set-default threadapi : [ default_threadapi ] ;
> +
> ++exe has_atomic_flag_lockfree :
> ../build/has_atomic_flag_lockfree_test.cpp ;
> ++
> + rule tag ( name : type ? : property-set )
> + {
> +     local result = $(name) ;
> +@@ -248,6 +251,12 @@ rule requirements ( properties * )
> + {
> +     local result ;
> +
> ++    if ! [ configure.builds has_atomic_flag_lockfree
> ++         : $(properties) : "lockfree boost::atomic_flag" ]
> ++    {
> ++        result += <library>/boost/atomic//boost_atomic ;
> ++    }
> ++
> +     if <threadapi>pthread in $(properties)
> +     {
> +         result += <define>BOOST_THREAD_POSIX ;
> --
> 1.8.4.rc3
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org <javascript:;>
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--047d7bdc10ec092d0004eb243d15
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Thursday, November 14, 2013, Phil Blundell  wrote:<br><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">Boost::thread uses functions from boost::atomic but do=
esn&#39;t actually<br>

link with libboost_atomic. =C2=A0This works fine on platforms where<br>
BOOST_ATOMIC_FLAG_LOCK_FREE is true but will lead to undefined<br>
symbol references otherwise. =C2=A0Fix this by applying a patch from<br>
the upstream bug tracker to add the missing library linkage.</blockquote><d=
iv><br></div><div>Is it fixed in 1.55? Then we might apply this to Dora and=
 upgrade master to 1.55=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">

<br>
Signed-off-by: Phil Blundell &lt;<a href=3D"javascript:;" onclick=3D"_e(eve=
nt, &#39;cvml&#39;, &#39;pb@pbcl.net&#39;)">pb@pbcl.net</a>&gt;<br>
---<br>
=C2=A0meta/recipes-support/boost/<a href=3D"http://boost_1.54.0.bb" target=
=3D"_blank">boost_1.54.0.bb</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A01 +<br>
=C2=A0.../files/boost-1.54.0-thread-link_atomic.patch =C2=A0 =C2=A0| 59 +++=
+++++++++++++++++++<br>
=C2=A02 files changed, 60 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-support/boost/files/boost-1.54.0-thre=
ad-link_atomic.patch<br>
<br>
diff --git a/meta/recipes-support/boost/<a href=3D"http://boost_1.54.0.bb" =
target=3D"_blank">boost_1.54.0.bb</a> b/meta/recipes-support/boost/<a href=
=3D"http://boost_1.54.0.bb" target=3D"_blank">boost_1.54.0.bb</a><br>
index 3cf88fa..9e7a60a 100644<br>
--- a/meta/recipes-support/boost/<a href=3D"http://boost_1.54.0.bb" target=
=3D"_blank">boost_1.54.0.bb</a><br>
+++ b/meta/recipes-support/boost/<a href=3D"http://boost_1.54.0.bb" target=
=3D"_blank">boost_1.54.0.bb</a><br>
@@ -3,4 +3,5 @@ include boost.inc<br>
<br>
=C2=A0SRC_URI +=3D &quot;file://arm-intrinsics.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://glibc.patch \<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://boost-1.54.0-thread-link_=
atomic.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
diff --git a/meta/recipes-support/boost/files/boost-1.54.0-thread-link_atom=
ic.patch b/meta/recipes-support/boost/files/boost-1.54.0-thread-link_atomic=
.patch<br>
new file mode 100644<br>
index 0000000..d39d0a9<br>
--- /dev/null<br>
+++ b/meta/recipes-support/boost/files/boost-1.54.0-thread-link_atomic.patc=
h<br>
@@ -0,0 +1,59 @@<br>
+Link boost_thread with boost_atomic to avoid undefined references to<br>
+boost::atomic::detail::lock_pool::get_lock_for().<br>
+<br>
+From <a href=3D"https://svn.boost.org/trac/boost/ticket/9041" target=3D"_b=
lank">https://svn.boost.org/trac/boost/ticket/9041</a><br>
+<br>
+Phil Blundell &lt;<a href=3D"javascript:;" onclick=3D"_e(event, &#39;cvml&=
#39;, &#39;pb@pbcl.net&#39;)">pb@pbcl.net</a>&gt;<br>
+Upstream-Status: Backport<br>
+<br>
+diff -Nurp boost_1_54_0/libs/thread/build/has_atomic_flag_lockfree_test.cp=
p <a href=3D"http://boost_1_54_0.pm/libs/thread/build/has_atomic_flag_lockf=
ree_test.cpp" target=3D"_blank">boost_1_54_0.pm/libs/thread/build/has_atomi=
c_flag_lockfree_test.cpp</a><br>

+--- boost_1_54_0/libs/thread/build/has_atomic_flag_lockfree_test.cpp =C2=
=A0 1970-01-01 01:00:00.000000000 +0100<br>
++++ <a href=3D"http://boost_1_54_0.pm/libs/thread/build/has_atomic_flag_lo=
ckfree_test.cpp" target=3D"_blank">boost_1_54_0.pm/libs/thread/build/has_at=
omic_flag_lockfree_test.cpp</a> =C2=A0 =C2=A0 =C2=A0 =C2=A02013-08-23 19:51=
:52.706329968 +0200<br>

+@@ -0,0 +1,14 @@<br>
++// Copyright (c) 2013, Petr Machata, Red Hat Inc.<br>
++//<br>
++// Use modification and distribution are subject to the boost Software<br=
>
++// License, Version 1.0. =C2=A0(See <a href=3D"http://www.boost.org/LICEN=
SE_1_0.txt" target=3D"_blank">http://www.boost.org/LICENSE_1_0.txt</a>).<br=
>
++<br>
++#include &quot;../../../boost/atomic.hpp&quot;<br>
++#include &quot;../../../boost/static_assert.hpp&quot;<br>
++<br>
++int<br>
++main(int argc, char *argv[])<br>
++{<br>
++ =C2=A0BOOST_STATIC_ASSERT(BOOST_ATOMIC_FLAG_LOCK_FREE);<br>
++ =C2=A0return 0;<br>
++}<br>
+diff -Nurp boost_1_54_0/libs/thread/build/Jamfile.v2 <a href=3D"http://boo=
st_1_54_0.pm/libs/thread/build/Jamfile.v2" target=3D"_blank">boost_1_54_0.p=
m/libs/thread/build/Jamfile.v2</a><br>
+--- boost_1_54_0/libs/thread/build/Jamfile.v2 =C2=A02013-06-15 12:35:45.00=
0000000 +0200<br>
++++ <a href=3D"http://boost_1_54_0.pm/libs/thread/build/Jamfile.v2" target=
=3D"_blank">boost_1_54_0.pm/libs/thread/build/Jamfile.v2</a> =C2=A0 =C2=A0 =
=C2=A0 2013-08-23 19:52:30.018613408 +0200<br>
+@@ -36,6 +36,7 @@ import os ;<br>
+ import feature ;<br>
+ import indirect ;<br>
+ import path ;<br>
++import configure ;<br>
+<br>
+ project boost/thread<br>
+ =C2=A0 =C2=A0 : source-location ../src<br>
+@@ -140,6 +141,8 @@ local rule default_threadapi ( )<br>
+ feature.feature threadapi : pthread win32 : propagated ;<br>
+ feature.set-default threadapi : [ default_threadapi ] ;<br>
+<br>
++exe has_atomic_flag_lockfree : ../build/has_atomic_flag_lockfree_test.cpp=
 ;<br>
++<br>
+ rule tag ( name : type ? : property-set )<br>
+ {<br>
+ =C2=A0 =C2=A0 local result =3D $(name) ;<br>
+@@ -248,6 +251,12 @@ rule requirements ( properties * )<br>
+ {<br>
+ =C2=A0 =C2=A0 local result ;<br>
+<br>
++ =C2=A0 =C2=A0if ! [ configure.builds has_atomic_flag_lockfree<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 : $(properties) : &quot;lockfree boost::atom=
ic_flag&quot; ]<br>
++ =C2=A0 =C2=A0{<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0result +=3D &lt;library&gt;/boost/atomic//boo=
st_atomic ;<br>
++ =C2=A0 =C2=A0}<br>
++<br>
+ =C2=A0 =C2=A0 if &lt;threadapi&gt;pthread in $(properties)<br>
+ =C2=A0 =C2=A0 {<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 result +=3D &lt;define&gt;BOOST_THREAD_POSIX =
;<br>
--<br>
1.8.4.rc3<br>
<br>
<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"javascript:;" onclick=3D"_e(event, &#39;cvml&#39;, &#39;Openembe=
dded-core@lists.openembedded.org&#39;)">Openembedded-core@lists.openembedde=
d.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</blockquote>

--047d7bdc10ec092d0004eb243d15--
