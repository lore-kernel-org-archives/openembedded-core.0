Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.4729.1601059715880307406
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2020 11:48:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: randy.macleod@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 08PIlmcO023723
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2020 11:48:24 -0700
Received: from [172.25.44.2] (172.25.44.2) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 25 Sep
 2020 11:47:55 -0700
Subject: Re: [OE-core] [PATCH] pseudo: do not expand symlinks in /proc
To: Sakib Sajal <sakib.sajal@windriver.com>,
        "yocto@lists.yoctoproject.org"
	<yocto@lists.yoctoproject.org>
CC: <seebs@seebs.net>, Matt Cowell <matt.cowell@nokia.com>
References: <20200925170532.19685-1-sakib.sajal@windriver.com>
Reply-To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <3f474697-4594-a2f3-9988-55ef2b2d9eb5@windriver.com>
Date: Fri, 25 Sep 2020 14:47:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200925170532.19685-1-sakib.sajal@windriver.com>
X-Originating-IP: [172.25.44.2]
Content-Type: multipart/alternative;
	boundary="------------7F5FD1E8AA2E5D175C664DE8"
Content-Language: en-CA

--------------7F5FD1E8AA2E5D175C664DE8
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail5.wrs.com id 08PIlmcO023723

pseduo patches are usually sent to the yocto list so
I've added that list and only BCCed oe-core here so
people know where to look for follow-up.


On 2020-09-25 1:05 p.m., Sakib Sajal wrote:
> From: Matt Cowell <matt.cowell@nokia.com>
>
> Some symlinks in /proc, such as those under /proc/[pid]/fd,
> /proc/[pid]/cwd, and /proc/[pid]/exe that are not real and should not
> have readlink called on them.  These look like symlinks, but behave like
> hardlinks.  Readlink does not return actual paths.  Previously
> pseudo_fix_path would expand files such as /dev/stdin to paths such as
> /proc/6680/fd/pipe:[1270830076] which do not exist.
>
> This issue affects:
> - deleted files
> - deleted directories
> - fifos
> - sockets
> - anon_inodes (epoll, eventfd, inotify, signalfd, timerfd, etc)
>
> Testing:
> timed builds before and after applying patch, without significant
> measurable difference.
> $ bitbake -c compile <image>; time bitbake <image>
>
> installed pseudo on an image and was unable to reproduce the test
> on bug report after applying the patch.

There might be a better test so please let Sakib know if so.

Sakib,
 =C2=A0 If there's a v2 or in future work, please give the actual results
such as:

 =C2=A0 5 trials with an average time of 18m:14s and a range of 22 seconds
 =C2=A0 on a build host that no one else was using.

This will help people to understand what you mean by
 =C2=A0=C2=A0 "without significant measurable difference.

Thanks for testing and sending this change.

../Randy

>
> FIXES: Bug 13288
>
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>   pseudo_util.c | 27 +++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)
>
> diff --git a/pseudo_util.c b/pseudo_util.c
> index c867ed6..bce4d1e 100644
> --- a/pseudo_util.c
> +++ b/pseudo_util.c
> @@ -21,6 +21,8 @@
>   #include <sys/time.h>
>   #include <unistd.h>
>   #include <limits.h>
> +#include <sys/vfs.h>
> +#include <linux/magic.h>
>  =20
>   /* see the comments below about (*real_regcomp)() */
>   #include <dlfcn.h>
> @@ -29,6 +31,11 @@
>   #include "pseudo_ipc.h"
>   #include "pseudo_db.h"
>  =20
> +/* O_PATH is defined in glibc 2.16 and later only */
> +#ifndef O_PATH
> +#define O_PATH          010000000
> +#endif
> +
>   struct pseudo_variables {
>   =09char *key;
>   =09size_t key_len;
> @@ -677,6 +684,26 @@ pseudo_append_element(char *newpath, char *root, si=
ze_t allocated, char **pcurre
>   =09 */
>   =09if (!leave_this && is_dir) {
>   =09	int is_link =3D S_ISLNK(buf->st_mode);
> +
> +	=09/* do not expand symlinks in the proc filesystem, since they may no=
t be real */
> +	=09if (is_link) {
> +	=09	struct statfs sfs;
> +	=09	int fd;
> +
> +	=09	/* statfs follows symlinks, so use fstatfs */
> +	=09	fd =3D open(newpath, O_CLOEXEC | O_PATH | O_NOFOLLOW);
> +	=09	if (-1 !=3D fd) {
> +	=09	=09if (0 =3D=3D fstatfs(fd, &sfs) && sfs.f_type =3D=3D PROC_SUPER_=
MAGIC) {
> +	=09	=09	pseudo_debug(PDBGF_PATH | PDBGF_VERBOSE,
> +	=09	=09	=09"pae: '%s' is procfs symlink, not expanding\n",
> +	=09	=09	=09newpath);
> +	=09	=09	is_link =3D 0;
> +	=09	=09}
> +
> +	=09	=09close(fd);
> +	=09	}
> +	=09}
> +
>   =09	if (link_recursion >=3D PSEUDO_MAX_LINK_RECURSION && is_link) {
>   =09	=09pseudo_diag("link recursion too deep, not expanding path '%s'.\=
n", newpath);
>   =09	=09is_link =3D 0;
>
>=20
>

--=20
# Randy MacLeod
# Wind River Linux


--------------7F5FD1E8AA2E5D175C664DE8
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail5.wrs.com id 08PIlmcO023723

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-=
8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">pseduo patches are usually sent to the
      yocto list so<br>
      I've added that list and only BCCed oe-core here so<br>
      people know where to look for follow-up.</div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">On 2020-09-25 1:05 p.m., Sakib Sajal
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:20200925170532.19685-1-sakib.sajal@windriver.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">From: Matt Cowell <a class=3D=
"moz-txt-link-rfc2396E" href=3D"mailto:matt.cowell@nokia.com">&lt;matt.cowe=
ll@nokia.com&gt;</a>

Some symlinks in /proc, such as those under /proc/[pid]/fd,
/proc/[pid]/cwd, and /proc/[pid]/exe that are not real and should not
have readlink called on them.  These look like symlinks, but behave like
hardlinks.  Readlink does not return actual paths.  Previously
pseudo_fix_path would expand files such as /dev/stdin to paths such as
/proc/6680/fd/pipe:[1270830076] which do not exist.

This issue affects:
- deleted files
- deleted directories
- fifos
- sockets
- anon_inodes (epoll, eventfd, inotify, signalfd, timerfd, etc)

Testing:
timed builds before and after applying patch, without significant
measurable difference.
$ bitbake -c compile &lt;image&gt;; time bitbake &lt;image&gt;

installed pseudo on an image and was unable to reproduce the test
on bug report after applying the patch.</pre>
    </blockquote>
    <p>There might be a better test so please let Sakib know if so.</p>
    Sakib,<br>
    =C2=A0 If there's a v2 or in future work, please give the actual resul=
ts
    <br>
    such as:
    <p>=C2=A0 5 trials with an average time of 18m:14s and a range of 22
      seconds<br>
      =C2=A0 on a build host that no one else was using.<br>
    </p>
    <p>This will help people to understand what you mean by<br>
      =C2=A0=C2=A0 "without significant measurable difference.</p>
    <p>Thanks for testing and sending this change.<br>
    </p>
    <p>../Randy<br>
    </p>
    <blockquote type=3D"cite"
      cite=3D"mid:20200925170532.19685-1-sakib.sajal@windriver.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

FIXES: Bug 13288

Signed-off-by: Sakib Sajal <a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:sakib.sajal@windriver.com">&lt;sakib.sajal@windriver.com&gt;</a>
---
 pseudo_util.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/pseudo_util.c b/pseudo_util.c
index c867ed6..bce4d1e 100644
--- a/pseudo_util.c
+++ b/pseudo_util.c
@@ -21,6 +21,8 @@
 #include &lt;sys/time.h&gt;
 #include &lt;unistd.h&gt;
 #include &lt;limits.h&gt;
+#include &lt;sys/vfs.h&gt;
+#include &lt;linux/magic.h&gt;
=20
 /* see the comments below about (*real_regcomp)() */
 #include &lt;dlfcn.h&gt;
@@ -29,6 +31,11 @@
 #include "pseudo_ipc.h"
 #include "pseudo_db.h"
=20
+/* O_PATH is defined in glibc 2.16 and later only */
+#ifndef O_PATH
+#define O_PATH          010000000
+#endif
+
 struct pseudo_variables {
 =09char *key;
 =09size_t key_len;
@@ -677,6 +684,26 @@ pseudo_append_element(char *newpath, char *root, size=
_t allocated, char **pcurre
 =09 */
 =09if (!leave_this &amp;&amp; is_dir) {
 =09	int is_link =3D S_ISLNK(buf-&gt;st_mode);
+
+	=09/* do not expand symlinks in the proc filesystem, since they may not =
be real */
+	=09if (is_link) {
+	=09	struct statfs sfs;
+	=09	int fd;
+
+	=09	/* statfs follows symlinks, so use fstatfs */
+	=09	fd =3D open(newpath, O_CLOEXEC | O_PATH | O_NOFOLLOW);
+	=09	if (-1 !=3D fd) {
+	=09	=09if (0 =3D=3D fstatfs(fd, &amp;sfs) &amp;&amp; sfs.f_type =3D=3D P=
ROC_SUPER_MAGIC) {
+	=09	=09	pseudo_debug(PDBGF_PATH | PDBGF_VERBOSE,
+	=09	=09	=09"pae: '%s' is procfs symlink, not expanding\n",
+	=09	=09	=09newpath);
+	=09	=09	is_link =3D 0;
+	=09	=09}
+
+	=09	=09close(fd);
+	=09	}
+	=09}
+
 =09	if (link_recursion &gt;=3D PSEUDO_MAX_LINK_RECURSION &amp;&amp; is_li=
nk) {
 =09	=09pseudo_diag("link recursion too deep, not expanding path '%s'.\n",=
 newpath);
 =09	=09is_link =3D 0;
</pre>
      <br>
      <fieldset class=3D"mimeAttachmentHeader"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">


</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------7F5FD1E8AA2E5D175C664DE8--
