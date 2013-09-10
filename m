Return-Path: <hans.beckerus@gmail.com>
Received: from mail-qe0-f51.google.com (mail-qe0-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id A1A8B6160E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 11:44:10 +0000 (UTC)
Received: by mail-qe0-f51.google.com with SMTP id ne12so4140118qeb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 04:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=yWzrlRH1IIlf/7nGyA/94TbXqR34PQgSOo2y+zQ1sTk=;
	b=Ze/Po3p1xfxTsg5OOMPq58fg12PmEgN08QHbsYFNK0VdL/ZOyex65xKtFQiuVTgCNC
	nkfc9fzJT+3bHjY8wNixIHqDZ75zNwY+cDZn6qk/apTX6f6V3dNspAY6yfNpXOQGCXYX
	zCgxF7lTEkmgeYvBM/pbQBVrRVUh5kyXxPvkMVAj/goqe19fi9ygeID4bUIbKaLQHml9
	LvJ95NWtynejigBqJhUNHxutYuOSh3g4mgB5xXoDQfB466LUS5Qs9AW/5nnXYrnWSRzq
	Bv3I9snZWoUf1Ekf0HPDdfrKfXLZwfqE2wrMzwE2qigdK/9prRYJ++56hU25MHE1AOpI
	sc7Q==
MIME-Version: 1.0
X-Received: by 10.49.47.50 with SMTP id a18mr31601291qen.61.1378813451948;
	Tue, 10 Sep 2013 04:44:11 -0700 (PDT)
Received: by 10.49.57.197 with HTTP; Tue, 10 Sep 2013 04:44:11 -0700 (PDT)
In-Reply-To: <00D40DBB-D50A-44EE-B939-8EC0AD1024EB@gmail.com>
References: <00D40DBB-D50A-44EE-B939-8EC0AD1024EB@gmail.com>
Date: Tue, 10 Sep 2013 13:44:11 +0200
Message-ID: <CAFyqS9rEabcr+RMS_i+9+JMpVMnKucSB8GU9GS5pJf8SAr-MSA@mail.gmail.com>
From: =?ISO-8859-1?Q?Hans_Beck=E9rus?= <hans.beckerus@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] libtool: fix resolve of lt_sysroot
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
X-List-Received-Date: Tue, 10 Sep 2013 11:44:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Could someone please verify if this patch (original v3 post) can be
saved without line-feed corruption? It seems very client dependent how
a message is saved, irrespective of source format. Some client seems
to cut lines like crazy, others does not.

Thanks.
Hans



On Tue, Sep 10, 2013 at 1:31 PM, Hans Beck=E9rus <hans.beckerus@gmail.com> =
wrote:
>
> This patch updates libtool.m4 (and its output) to resolve a problem
>
> with variable 'lt_sysroot' not being properly updated if the option
>
> '--with[-libtool]-sysroot' is not provided when running the 'configure'
>
> script for a package.
>
>
>
> According to the help text ouput from 'configure':
>
> --with-libtool-sysroot=3DDIR Search for dependent libraries within DIR
>
>                        (or the compiler's sysrooot if not specified).
>
>
>
> Due to swapped cases in a switch statement, when checking if the option
>
> was specified or not, wrong actions were taken resulting in an
>
> incorrect sysroot and failures to properly locate e.g. .la files.
>
>
>
> For current upstream status see:
>
> http://lists.gnu.org/archive/html/bug-libtool/2013-09/msg00005.html
>
>
>
> Signed-off-by: Hans Beckerus <hans.beckerus at gmail.com>
>
> ---
>
> meta/recipes-devtools/libtool/libtool-2.4.2.inc    |  1 +
>
> .../libtool/libtool/fix-resolve-lt-sysroot.patch   | 35
> ++++++++++++++++++++++
>
> 2 files changed, 36 insertions(+)
>
> create mode 100644
> meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch
>
>
>
> diff --git a/meta/recipes-devtools/libtool/libtool-2.4.2.inc
> b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
>
> index bb4ddf0..92e4949 100644
>
> --- a/meta/recipes-devtools/libtool/libtool-2.4.2.inc
>
> +++ b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
>
> @@ -20,6 +20,7 @@ SRC_URI =3D "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz=
 \
>
>                   file://respect-fstack-protector.patch \
>
>             file://norm-rpath.patch \
>
>             file://dont-depend-on-help2man.patch \
>
> +           file://fix-resolve-lt-sysroot.patch \
>
>            "
>
>  SRC_URI[md5sum] =3D "d2f3b7d4627e69e13514a40e72a24d50"
>
> diff --git
> a/meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch
> b/meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch
>
> new file mode 100644
>
> index 0000000..5a6335b
>
> --- /dev/null
>
> +++ b/meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch
>
> @@ -0,0 +1,35 @@
>
> +
>
> +Upstream-Status: Pending
>
> +
>
> +This patch updates libtool.m4 (and its output) to resolve a problem
>
> +with variable 'lt_sysroot' not being properly updated if the option
>
> +'--with[-libtool]-sysroot' is not provided when running the 'configure'
>
> +script for a package.
>
> +
>
> +I have also reported the problem to libtool here
>
> +
>
> +http://lists.gnu.org/archive/html/bug-libtool/2013-09/msg00005.html
>
> +
>
> +Signed-off-by: Hans Beckerus <hans.beckerus at gmail.com>
>
> +---
>
> +diff -ur libtool-2.4.2.orig/libltdl/m4/libtool.m4
> libtool-2.4.2/libltdl/m4/libtool.m4
>
> +--- libtool-2.4.2.orig/libltdl/m4/libtool.m4           2013-09-05
> 10:37:24.690013000 +0200
>
> ++++ libtool-2.4.2/libltdl/m4/libtool.m4 2013-09-05 12:05:51.560281000 +0=
200
>
> +@@ -1234,7 +1234,7 @@
>
> + dnl in case the user passed a directory name.
>
> + lt_sysroot=3D
>
> + case ${with_libtool_sysroot} in #(
>
> +- yes)
>
> ++ no)
>
> +    if test "$GCC" =3D yes; then
>
> +      lt_sysroot=3D`$CC --print-sysroot 2>/dev/null`
>
> +    fi
>
> +@@ -1242,7 +1242,7 @@
>
> +  /*)
>
> +    lt_sysroot=3D`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subs=
t"`
>
> +    ;; #(
>
> +- no|'')
>
> ++ yes|'')
>
> +    ;; #(
>
> +  *)
>
> +    AC_MSG_RESULT([${with_libtool_sysroot}])
>
> --
>
> 1.8.3.3

