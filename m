Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.4674.1598475670913792113
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2020 14:01:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: randy.macleod@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 07QL183Q025789
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Wed, 26 Aug 2020 14:01:09 -0700 (PDT)
Received: from [172.25.44.3] (172.25.44.3) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 26 Aug
 2020 14:01:08 -0700
Subject: Re: [oe-core][PATCH 1/1] pseudo: fix renaming to self
From: "Randy MacLeod" <randy.macleod@windriver.com>
To: Joe Slater <joe.slater@windriver.com>,
        <openembedded-core@lists.openembedded.org>, Seebs <seebs@seebs.net>
References: <20200826185857.24292-1-joe.slater@windriver.com>
 <20200826185857.24292-2-joe.slater@windriver.com>
 <ef96587f-41d7-d285-27e8-cd6f78737028@windriver.com>
Message-ID: <4f1b7794-19fd-d981-03bc-1f80d65a42a6@windriver.com>
Date: Wed, 26 Aug 2020 17:01:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ef96587f-41d7-d285-27e8-cd6f78737028@windriver.com>
X-Originating-IP: [172.25.44.3]
Content-Type: multipart/alternative;
	boundary="------------8B869DB4A1D43C7854A90D48"
Content-Language: en-CA

--------------8B869DB4A1D43C7854A90D48
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id 07QL183Q025789

On 2020-08-26 4:04 p.m., Randy MacLeod wrote:
>
> Add Seebs.
>
> Joe,
> How did you test this change?

Oops, I see that you attached the test to the defect:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13426

See below for (barfy) src. ;-)

../Randy


/*
  * test for pseudo renaming
  *
  *   Run in a directory named arf with files arf and arfat existing.
  */


#include <fcntl.h>
#include <stdio.h>

int main(int argc, char **argv)
  {
    if (!rename("arf","barf"))  printf("arf to barf\n");
    if (!rename("barf","barf"))  printf("barf to barf\n");
    if (!rename("barf","../arf/barf"))  printf("barf to ../arf/barf\n");

    if (!renameat(AT_FDCWD,"arfat",AT_FDCWD,"barfat"))
       printf("arfat to barfat\n");
    if (!renameat(AT_FDCWD,"barfat",AT_FDCWD,"barfat"))
       printf("barfat to barfat\n");

#ifdef UNDEFINED
    if (!renameat2(AT_FDCWD,"arf2",AT_FDCWD,"barf2",0))
       printf("arf2 to barf2\n");
    if (!renameat2(AT_FDCWD,"barf2",AT_FDCWD,"barf2",0))
       printf("barf2 to barf2\n");
#endif

    return 0;

  }

>
> ../Randy
>
> On 2020-08-26 2:58 p.m., Joe Slater wrote:
>> Pseudo tests for an item being renamed to itself only after
>> information about it has been deleted.=C2=A0 Move the test to before
>> we change the database.
>>
>> Note that pseudo does not support renameat2(), but neither does
>> glibc.
>>
>> Signed-off-by: Joe Slater <joe.slater@windriver.com>
>> ---
>> =C2=A0 .../pseudo/files/rename.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 73 +++++++=
++++++++++++
>> =C2=A0 meta/recipes-devtools/pseudo/pseudo_git.bb=C2=A0=C2=A0=C2=A0 |=C2=
=A0 1 +
>> =C2=A0 2 files changed, 74 insertions(+)
>> =C2=A0 create mode 100644 meta/recipes-devtools/pseudo/files/rename.pa=
tch
>>
>> diff --git a/meta/recipes-devtools/pseudo/files/rename.patch=20
>> b/meta/recipes-devtools/pseudo/files/rename.patch
>> new file mode 100644
>> index 0000000000..bc344db3b5
>> --- /dev/null
>> +++ b/meta/recipes-devtools/pseudo/files/rename.patch
>> @@ -0,0 +1,73 @@
>> +pseudo: fix renaming to self
>> +
>> +The pseudo rename guts test for an item being renamed to
>> +itself, only after information about it has been deleted.
>> +We move the test to before we play with the database.
>> +
>> +Note that pseudo does not support renameat2().
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Joe Slater <joe.slater@windriver.com>
>> +
>> +
>> +--- a/ports/unix/guts/rename.c
>> ++++ b/ports/unix/guts/rename.c
>> +@@ -29,6 +29,14 @@
>> +=C2=A0=C2=A0=C2=A0=C2=A0 newrc =3D base_lstat(newpath, &newbuf);
>> +=C2=A0=C2=A0=C2=A0=C2=A0 oldrc =3D base_lstat(oldpath, &oldbuf);
>> +
>> ++=C2=A0=C2=A0=C2=A0 /* nothing to do for a "rename" of a link to itse=
lf */
>> ++=C2=A0=C2=A0=C2=A0 if (newrc !=3D -1 && oldrc !=3D -1 &&
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 newbuf.st_dev =3D=3D oldb=
uf.st_dev &&
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 newbuf.st_ino =3D=3D oldb=
uf.st_ino) {
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pseudo_debug(PDBGF_OP, "r=
ename: paths are the same\n");
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return real_rename(oldpat=
h, newpath);
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> ++
>> +=C2=A0=C2=A0=C2=A0=C2=A0 errno =3D save_errno;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0 /* newpath must be removed. */
>> +@@ -58,12 +66,6 @@
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return rc;
>> +=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0=C2=A0 save_errno =3D errno;
>> +-=C2=A0=C2=A0=C2=A0 /* nothing to do for a "rename" of a link to itse=
lf */
>> +-=C2=A0=C2=A0=C2=A0 if (newrc !=3D -1 && oldrc !=3D -1 &&
>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 newbuf.st_dev =3D=3D oldb=
uf.st_dev &&
>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 newbuf.st_ino =3D=3D oldb=
uf.st_ino) {
>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return rc;
>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0 /* rename(3) is not mv(1).=C2=A0 rename(file=
, dir) fails; you must=20
>> provide
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * the corrected path yourself.=C2=A0 Y=
ou can rename over a=20
>> directory only
>> +--- a/ports/unix/guts/renameat.c
>> ++++ b/ports/unix/guts/renameat.c
>> +@@ -41,6 +41,14 @@
>> +=C2=A0=C2=A0=C2=A0=C2=A0 newrc =3D base_fstatat(newdirfd, newpath, &n=
ewbuf,=20
>> AT_SYMLINK_NOFOLLOW);
>> + #endif
>> +
>> ++=C2=A0=C2=A0=C2=A0 /* nothing to do for a "rename" of a link to itse=
lf */
>> ++=C2=A0=C2=A0=C2=A0 if (newrc !=3D -1 && oldrc !=3D -1 &&
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 newbuf.st_dev =3D=3D oldb=
uf.st_dev &&
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 newbuf.st_ino =3D=3D oldb=
uf.st_ino) {
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pseudo_debug(PDBGF_OP, "r=
enameat: paths are the same\n");
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return real_renameat(oldd=
irfd, oldpath, newdirfd, newpath);
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> ++
>> +=C2=A0=C2=A0=C2=A0=C2=A0 errno =3D save_errno;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0 /* newpath must be removed. */
>> +@@ -71,12 +79,6 @@
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return rc;
>> +=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0=C2=A0 save_errno =3D errno;
>> +-=C2=A0=C2=A0=C2=A0 /* nothing to do for a "rename" of a link to itse=
lf */
>> +-=C2=A0=C2=A0=C2=A0 if (newrc !=3D -1 && oldrc !=3D -1 &&
>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 newbuf.st_dev =3D=3D oldb=
uf.st_dev &&
>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 newbuf.st_ino =3D=3D oldb=
uf.st_ino) {
>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return rc;
>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0 /* rename(3) is not mv(1).=C2=A0 rename(file=
, dir) fails; you must=20
>> provide
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * the corrected path yourself.=C2=A0 Y=
ou can rename over a=20
>> directory only
>> diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb=20
>> b/meta/recipes-devtools/pseudo/pseudo_git.bb
>> index 9a22304bba..8d8cf8d523 100644
>> --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
>> +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
>> @@ -4,6 +4,7 @@ SRC_URI =3D=20
>> "git://git.yoctoproject.org/pseudo;branch=3Doe-core \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 file://0001-configure-Prune-PIE-flags.patch \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 file://fallback-passwd \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 file://fallback-group \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://r=
ename.patch \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 "
>> =C2=A0 =C2=A0 SRCREV =3D "8efb082863ff0ceec7b7e46f9a44750e12f48039"
>
>

--=20
# Randy MacLeod
# Wind River Linux


--------------8B869DB4A1D43C7854A90D48
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id 07QL183Q025789

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2020-08-26 4:04 p.m., Randy MacLeod
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:ef96587f-41d7-d285-27e8-cd6f78737028@windriver.com">
      <br>
      Add Seebs.
      <br>
      <br>
      Joe,
      <br>
      How did you test this change?
      <br>
    </blockquote>
    <p>Oops, I see that you attached the test to the defect:</p>
    <p><a class=3D"moz-txt-link-freetext" href=3D"https://bugzilla.yoctop=
roject.org/show_bug.cgi?id=3D13426">https://bugzilla.yoctoproject.org/sho=
w_bug.cgi?id=3D13426</a></p>
    <p>See below for (barfy) src. ;-)<br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <pre>/*
 * test for pseudo renaming
 *
 *   Run in a directory named arf with files arf and arfat existing.
 */


#include &lt;fcntl.h&gt;
#include &lt;stdio.h&gt;

int main(int argc, char **argv)
 {
   if (!rename("arf","barf"))  printf("arf to barf\n");
   if (!rename("barf","barf"))  printf("barf to barf\n");
   if (!rename("barf","../arf/barf"))  printf("barf to ../arf/barf\n");

   if (!renameat(AT_FDCWD,"arfat",AT_FDCWD,"barfat"))
      printf("arfat to barfat\n");
   if (!renameat(AT_FDCWD,"barfat",AT_FDCWD,"barfat"))
      printf("barfat to barfat\n");

#ifdef UNDEFINED
   if (!renameat2(AT_FDCWD,"arf2",AT_FDCWD,"barf2",0))
      printf("arf2 to barf2\n");
   if (!renameat2(AT_FDCWD,"barf2",AT_FDCWD,"barf2",0))
      printf("barf2 to barf2\n");
#endif

   return 0;

 }</pre>
    <blockquote type=3D"cite"
      cite=3D"mid:ef96587f-41d7-d285-27e8-cd6f78737028@windriver.com">
      <br>
      ../Randy
      <br>
      <br>
      On 2020-08-26 2:58 p.m., Joe Slater wrote:
      <br>
      <blockquote type=3D"cite">Pseudo tests for an item being renamed to
        itself only after
        <br>
        information about it has been deleted.=C2=A0 Move the test to bef=
ore
        <br>
        we change the database.
        <br>
        <br>
        Note that pseudo does not support renameat2(), but neither does
        <br>
        glibc.
        <br>
        <br>
        Signed-off-by: Joe Slater <a class=3D"moz-txt-link-rfc2396E" href=
=3D"mailto:joe.slater@windriver.com">&lt;joe.slater@windriver.com&gt;</a>
        <br>
        ---
        <br>
        =C2=A0 .../pseudo/files/rename.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 73
        +++++++++++++++++++
        <br>
        =C2=A0 meta/recipes-devtools/pseudo/pseudo_git.bb=C2=A0=C2=A0=C2=A0=
 |=C2=A0 1 +
        <br>
        =C2=A0 2 files changed, 74 insertions(+)
        <br>
        =C2=A0 create mode 100644
        meta/recipes-devtools/pseudo/files/rename.patch
        <br>
        <br>
        diff --git a/meta/recipes-devtools/pseudo/files/rename.patch
        b/meta/recipes-devtools/pseudo/files/rename.patch
        <br>
        new file mode 100644
        <br>
        index 0000000000..bc344db3b5
        <br>
        --- /dev/null
        <br>
        +++ b/meta/recipes-devtools/pseudo/files/rename.patch
        <br>
        @@ -0,0 +1,73 @@
        <br>
        +pseudo: fix renaming to self
        <br>
        +
        <br>
        +The pseudo rename guts test for an item being renamed to
        <br>
        +itself, only after information about it has been deleted.
        <br>
        +We move the test to before we play with the database.
        <br>
        +
        <br>
        +Note that pseudo does not support renameat2().
        <br>
        +
        <br>
        +Upstream-Status: Pending
        <br>
        +
        <br>
        +Signed-off-by: Joe Slater <a class=3D"moz-txt-link-rfc2396E" hre=
f=3D"mailto:joe.slater@windriver.com">&lt;joe.slater@windriver.com&gt;</a=
>
        <br>
        +
        <br>
        +
        <br>
        +--- a/ports/unix/guts/rename.c
        <br>
        ++++ b/ports/unix/guts/rename.c
        <br>
        +@@ -29,6 +29,14 @@
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0 newrc =3D base_lstat(newpath, &amp;newb=
uf);
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0 oldrc =3D base_lstat(oldpath, &amp;oldb=
uf);
        <br>
        +
        <br>
        ++=C2=A0=C2=A0=C2=A0 /* nothing to do for a "rename" of a link to=
 itself */
        <br>
        ++=C2=A0=C2=A0=C2=A0 if (newrc !=3D -1 &amp;&amp; oldrc !=3D -1 &=
amp;&amp;
        <br>
        ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 newbuf.st_dev =3D=3D=
 oldbuf.st_dev &amp;&amp;
        <br>
        ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 newbuf.st_ino =3D=3D=
 oldbuf.st_ino) {
        <br>
        ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pseudo_debug(PDBGF_O=
P, "rename: paths are the
        same\n");
        <br>
        ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return real_rename(o=
ldpath, newpath);
        <br>
        ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
        <br>
        ++
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0 errno =3D save_errno;
        <br>
        +
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0 /* newpath must be removed. */
        <br>
        +@@ -58,12 +66,6 @@
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return rc;
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0 }
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0 save_errno =3D errno;
        <br>
        +-=C2=A0=C2=A0=C2=A0 /* nothing to do for a "rename" of a link to=
 itself */
        <br>
        +-=C2=A0=C2=A0=C2=A0 if (newrc !=3D -1 &amp;&amp; oldrc !=3D -1 &=
amp;&amp;
        <br>
        +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 newbuf.st_dev =3D=3D=
 oldbuf.st_dev &amp;&amp;
        <br>
        +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 newbuf.st_ino =3D=3D=
 oldbuf.st_ino) {
        <br>
        +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return rc;
        <br>
        +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
        <br>
        +
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0 /* rename(3) is not mv(1).=C2=A0 rename=
(file, dir) fails; you
        must provide
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * the corrected path yourself.=C2=
=A0 You can rename over a
        directory only
        <br>
        +--- a/ports/unix/guts/renameat.c
        <br>
        ++++ b/ports/unix/guts/renameat.c
        <br>
        +@@ -41,6 +41,14 @@
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0 newrc =3D base_fstatat(newdirfd, newpat=
h, &amp;newbuf,
        AT_SYMLINK_NOFOLLOW);
        <br>
        + #endif
        <br>
        +
        <br>
        ++=C2=A0=C2=A0=C2=A0 /* nothing to do for a "rename" of a link to=
 itself */
        <br>
        ++=C2=A0=C2=A0=C2=A0 if (newrc !=3D -1 &amp;&amp; oldrc !=3D -1 &=
amp;&amp;
        <br>
        ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 newbuf.st_dev =3D=3D=
 oldbuf.st_dev &amp;&amp;
        <br>
        ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 newbuf.st_ino =3D=3D=
 oldbuf.st_ino) {
        <br>
        ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pseudo_debug(PDBGF_O=
P, "renameat: paths are the
        same\n");
        <br>
        ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return real_renameat=
(olddirfd, oldpath, newdirfd,
        newpath);
        <br>
        ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
        <br>
        ++
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0 errno =3D save_errno;
        <br>
        +
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0 /* newpath must be removed. */
        <br>
        +@@ -71,12 +79,6 @@
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return rc;
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0 }
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0 save_errno =3D errno;
        <br>
        +-=C2=A0=C2=A0=C2=A0 /* nothing to do for a "rename" of a link to=
 itself */
        <br>
        +-=C2=A0=C2=A0=C2=A0 if (newrc !=3D -1 &amp;&amp; oldrc !=3D -1 &=
amp;&amp;
        <br>
        +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 newbuf.st_dev =3D=3D=
 oldbuf.st_dev &amp;&amp;
        <br>
        +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 newbuf.st_ino =3D=3D=
 oldbuf.st_ino) {
        <br>
        +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return rc;
        <br>
        +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
        <br>
        +
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0 /* rename(3) is not mv(1).=C2=A0 rename=
(file, dir) fails; you
        must provide
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * the corrected path yourself.=C2=
=A0 You can rename over a
        directory only
        <br>
        diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb
        b/meta/recipes-devtools/pseudo/pseudo_git.bb
        <br>
        index 9a22304bba..8d8cf8d523 100644
        <br>
        --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
        <br>
        +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
        <br>
        @@ -4,6 +4,7 @@ SRC_URI =3D
        "git://git.yoctoproject.org/pseudo;branch=3Doe-core \
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 <a class=3D"moz-txt-link-freetext" href=3D"file://0001-configure-P=
rune-PIE-flags.patch">file://0001-configure-Prune-PIE-flags.patch</a> \
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 <a class=3D"moz-txt-link-freetext" href=3D"file://fallback-passwd"=
>file://fallback-passwd</a> \
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 <a class=3D"moz-txt-link-freetext" href=3D"file://fallback-group">=
file://fallback-group</a> \
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a =
class=3D"moz-txt-link-freetext" href=3D"file://rename.patch">file://renam=
e.patch</a> \
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 "
        <br>
        =C2=A0 =C2=A0 SRCREV =3D "8efb082863ff0ceec7b7e46f9a44750e12f4803=
9"
        <br>
      </blockquote>
      <br>
      <br>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------8B869DB4A1D43C7854A90D48--
