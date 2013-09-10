Return-Path: <hans.beckerus@gmail.com>
Received: from mail-qc0-f171.google.com (mail-qc0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 9DA9D6BE4F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 10:17:02 +0000 (UTC)
Received: by mail-qc0-f171.google.com with SMTP id x19so3617065qcw.30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 03:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=WiG3xhDdb23wu3neGVU5AGSCeS8uGe8/aAVnEmzuxmg=;
	b=owza/n1hwrAFL46Va6t5DjdZxM/xgDASu8ZDUOugh/av/IZqhhYgDFtbpxSv/FLnAD
	O3Fwfwfdcf0Fw2Bz1jsuwSjmSD1C27EbHwKRS1hnYM9DaFOAK9YOPUJQMROIFVLdNUqf
	c/WOKOHLVXVVf6cS6yZdBlamCZTeiSQfVb8aWTfxW+SU2xLUhYi+7Of7YI0VQ7RF4Ok3
	/SN98RbsqI93yCiOZ4hauxKvUdFXt55DeOu0CJykrNgeFh1cqVi02HD2S/i3wuXYGRjj
	Q6CmH4yAGN4XIswunrmXRWL8aNg+M3Qgd3YZNtwYt/22dtotVL3Pt8tNzIsSi0yvbkcQ
	AVAg==
MIME-Version: 1.0
X-Received: by 10.49.97.134 with SMTP id ea6mr30964436qeb.34.1378808224172;
	Tue, 10 Sep 2013 03:17:04 -0700 (PDT)
Received: by 10.49.57.197 with HTTP; Tue, 10 Sep 2013 03:17:04 -0700 (PDT)
In-Reply-To: <CAFyqS9qQR+YQj8tKWHJxOc=9Ti34gM4DFjxaoJi9cVbnDWzLAA@mail.gmail.com>
References: <CAFyqS9qQR+YQj8tKWHJxOc=9Ti34gM4DFjxaoJi9cVbnDWzLAA@mail.gmail.com>
Date: Tue, 10 Sep 2013 12:17:04 +0200
Message-ID: <CAFyqS9pEJziMZx-p_u7OVKMV+dOeBcw2F2MOMqvgaP9Y=JWBaA@mail.gmail.com>
From: =?ISO-8859-1?Q?Hans_Beck=E9rus?= <hans.beckerus@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] libtool: fix resolve of variable lt_sysroot
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
X-List-Received-Date: Tue, 10 Sep 2013 10:17:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

The patch is still getting corrupted by the mail client :( It looks ok
before sending but after it has been sent lines seems to get split in
a bad way! I can not use the sendmail function due to access
restrictions so unless I can not solve that I will have to drop this
patch.

Thanks.
Hans


On Tue, Sep 10, 2013 at 12:12 PM, Hans Beck=E9rus <hans.beckerus@gmail.com>=
 wrote:
> This patch updates libtool.m4 (and its output) to resolve a problem
> with variable 'lt_sysroot' not being properly updated if the option
> '--with[-libtool]-sysroot' is not provided when running the 'configure'
> script for a package.
>
> According to the help text ouput from 'configure':
>  --with-libtool-sysroot=3DDIR Search for dependent libraries within DIR
>                        (or the compiler's sysrooot if not specified).
>
> Due to swapped cases in a switch statement, when checking if the option
> was specified or not, wrong actions were taken resulting in an
> incorrect sysroot and failures to properly locate e.g. .la files.
>
> For current upstream status see:
> http://lists.gnu.org/archive/html/bug-libtool/2013-09/msg00005.html
>
> Signed-off-by: Hans Beckerus <hans.beckerus at gmail.com>
> ---
>  meta/recipes-devtools/libtool/libtool-2.4.2.inc    |  1 +
>  .../libtool/libtool/fix-resolve-lt-sysroot.patch   | 35 ++++++++++++++++=
++++++
>  2 files changed, 36 insertions(+)
>  create mode 100644
> meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch
>
> diff --git a/meta/recipes-devtools/libtool/libtool-2.4.2.inc
> b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
> index bb4ddf0..92e4949 100644
> --- a/meta/recipes-devtools/libtool/libtool-2.4.2.inc
> +++ b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
> @@ -20,6 +20,7 @@ SRC_URI =3D "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz=
 \
>            file://respect-fstack-protector.patch \
>             file://norm-rpath.patch \
>             file://dont-depend-on-help2man.patch \
> +           file://fix-resolve-lt-sysroot.patch \
>            "
>
>  SRC_URI[md5sum] =3D "d2f3b7d4627e69e13514a40e72a24d50"
> diff --git a/meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot=
.patch
> b/meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch
> new file mode 100644
> index 0000000..5a6335b
> --- /dev/null
> +++ b/meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch
> @@ -0,0 +1,35 @@
> +
> +Upstream-Status: Pending
> +
> +This patch updates libtool.m4 (and its output) to resolve a problem
> +with variable 'lt_sysroot' not being properly updated if the option
> +'--with[-libtool]-sysroot' is not provided when running the 'configure'
> +script for a package.
> +
> +I have also reported the problem to libtool here
> +
> +http://lists.gnu.org/archive/html/bug-libtool/2013-09/msg00005.html
> +
> +Signed-off-by: Hans Beckerus <hans.beckerus at gmail.com>
> +---
> +diff -ur libtool-2.4.2.orig/libltdl/m4/libtool.m4
> libtool-2.4.2/libltdl/m4/libtool.m4
> +--- libtool-2.4.2.orig/libltdl/m4/libtool.m4   2013-09-05
> 10:37:24.690013000 +0200
> ++++ libtool-2.4.2/libltdl/m4/libtool.m4        2013-09-05
> 12:05:51.560281000 +0200
> +@@ -1234,7 +1234,7 @@
> + dnl in case the user passed a directory name.
> + lt_sysroot=3D
> + case ${with_libtool_sysroot} in #(
> +- yes)
> ++ no)
> +    if test "$GCC" =3D yes; then
> +      lt_sysroot=3D`$CC --print-sysroot 2>/dev/null`
> +    fi
> +@@ -1242,7 +1242,7 @@
> +  /*)
> +    lt_sysroot=3D`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subs=
t"`
> +    ;; #(
> +- no|'')
> ++ yes|'')
> +    ;; #(
> +  *)
> +    AC_MSG_RESULT([${with_libtool_sysroot}])
> --
> 1.8.3.3

