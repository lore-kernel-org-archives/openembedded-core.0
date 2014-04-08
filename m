Return-Path: <Ming.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 88DED6F573
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Apr 2014 02:05:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s3824xe4026569
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 7 Apr 2014 19:04:59 -0700 (PDT)
Received: from [128.224.163.186] (128.224.163.186) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Mon, 7 Apr 2014 19:04:59 -0700
Message-ID: <53435947.6050405@windriver.com>
Date: Tue, 8 Apr 2014 10:04:55 +0800
From: Ming Liu <ming.liu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130330 Thunderbird/17.0.5
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1396870039-26834-1-git-send-email-ming.liu@windriver.com>
	<CAMKF1soQs+xKTK3gQemohdN0Mgu05PWYAvbjXDopFM2H1qwGuw@mail.gmail.com>
In-Reply-To: <CAMKF1soQs+xKTK3gQemohdN0Mgu05PWYAvbjXDopFM2H1qwGuw@mail.gmail.com>
X-Originating-IP: [128.224.163.186]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] e2fsprogs: fix multilib header conflict - ext2_types.h
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
X-List-Received-Date: Tue, 08 Apr 2014 02:05:00 -0000
Content-Type: multipart/alternative;
	boundary="------------070007020908080701070604"

--------------070007020908080701070604
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 04/08/2014 03:50 AM, Khem Raj wrote:
>
>
> On Apr 7, 2014 1:28 AM, "Ming Liu" <ming.liu@windriver.com 
> <mailto:ming.liu@windriver.com>> wrote:
> >
> > ext2_types.h conflicts between 32-bit and 64-bit versions.
> >
>
> can you explain the conflicts
> may be they can be addressed
>
Yes, of course, see the following diff output of 64bits and 32bits 
ext2_types.h :
diff -urpN /tmp/64bits/ext2_types.h /tmp/32bits/ext2_types.h
--- /tmp/64bits/ext2_types.h
+++ /tmp/32bits/ext2_types.h
@@ -63,7 +63,7 @@ typedef __U32_TYPEDEF __u32;
  #if (4 == 4)
  typedef    unsigned int    __u32;
  #else
-#if (8 == 4)
+#if (4 == 4)
  typedef    unsigned long    __u32;
  #else
  #if (2 == 4)
@@ -81,7 +81,7 @@ typedef __S32_TYPEDEF __s32;
  #if (4 == 4)
  typedef    int        __s32;
  #else
-#if (8 == 4)
+#if (4 == 4)
  typedef    long        __s32;
  #else
  #if (2 == 4)
@@ -102,7 +102,7 @@ typedef unsigned int    __u64;
  #if (8 == 8)
  typedef unsigned long long    __u64;
  #else
-#if (8 == 8)
+#if (4 == 8)
  typedef unsigned long    __u64;
  #endif /* SIZEOF_LONG_LONG == 8 */
  #endif /* SIZEOF_LONG == 8 */
@@ -122,7 +122,7 @@ typedef __signed__ long long    __s64;
  typedef signed long long    __s64;
  #endif /* __GNUC__ */
  #else
-#if (8 == 8)
+#if (4 == 8)
  typedef long        __s64;
  #endif /* SIZEOF_LONG_LONG == 8 */
  #endif /* SIZEOF_LONG == 8 */

ext2_types.h conflicts between 32-bit and 64-bit versions.

//Ming Liu
>
> > Signed-off-by: Ming Liu <ming.liu@windriver.com 
> <mailto:ming.liu@windriver.com>>
> > ---
> >  meta/recipes-devtools/e2fsprogs/e2fsprogs.inc       | 3 +--
> >  meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb 
> <http://e2fsprogs_1.42.9.bb> | 2 ++
> >  2 files changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc 
> b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
> > index a34df37..99447c1 100644
> > --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
> > +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
> > @@ -22,5 +22,4 @@ DEPENDS = "util-linux"
> >  SRC_URI = "${SOURCEFORGE_MIRROR}/e2fsprogs/e2fsprogs-${PV}.tar.gz \
> >             file://mkdir.patch"
> >
> > -inherit autotools gettext pkgconfig
> > -
> > +inherit autotools gettext pkgconfig multilib_header
> > diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb 
> <http://e2fsprogs_1.42.9.bb> 
> b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb 
> <http://e2fsprogs_1.42.9.bb>
> > index 3a5d6ee..2bdd724 100644
> > --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb 
> <http://e2fsprogs_1.42.9.bb>
> > +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb 
> <http://e2fsprogs_1.42.9.bb>
> > @@ -52,6 +52,8 @@ do_install () {
> >                 mv ${D}${base_libdir}/e2initrd_helper ${D}${libdir}
> >                 mv ${D}${base_libdir}/pkgconfig ${D}${libdir}
> >         fi
> > +
> > +       oe_multilib_header ext2fs/ext2_types.h
> >  }
> >
> >  RDEPENDS_e2fsprogs = "e2fsprogs-badblocks"
> > --
> > 1.8.4.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org 
> <mailto:Openembedded-core@lists.openembedded.org>
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


--------------070007020908080701070604
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 04/08/2014 03:50 AM, Khem Raj wrote:<br>
    </div>
    <blockquote
cite="mid:CAMKF1soQs+xKTK3gQemohdN0Mgu05PWYAvbjXDopFM2H1qwGuw@mail.gmail.com"
      type="cite">
      <meta http-equiv="Context-Type" content="text/html; charset=UTF-8">
      <p dir="ltr"><br>
      </p>
      <p dir="ltr">On Apr 7, 2014 1:28 AM, "Ming Liu" &lt;<a
          moz-do-not-send="true" href="mailto:ming.liu@windriver.com">ming.liu@windriver.com</a>&gt;
        wrote:<br>
        &gt;<br>
        &gt; ext2_types.h conflicts between 32-bit and 64-bit versions.<br>
        &gt;</p>
      <p dir="ltr">can you explain the conflicts<br>
        may be they can be addressed</p>
    </blockquote>
    Yes, of course, see the following diff output of 64bits and 32bits
    ext2_types.h :<br>
    diff -urpN /tmp/64bits/ext2_types.h /tmp/32bits/ext2_types.h<br>
    --- /tmp/64bits/ext2_types.h<br>
    +++ /tmp/32bits/ext2_types.h<br>
    @@ -63,7 +63,7 @@ typedef __U32_TYPEDEF __u32;<br>
     #if (4 == 4)<br>
     typedef    unsigned int    __u32;<br>
     #else<br>
    -#if (8 == 4)<br>
    +#if (4 == 4)<br>
     typedef    unsigned long    __u32;<br>
     #else<br>
     #if (2 == 4)<br>
    @@ -81,7 +81,7 @@ typedef __S32_TYPEDEF __s32;<br>
     #if (4 == 4)<br>
     typedef    int        __s32;<br>
     #else<br>
    -#if (8 == 4)<br>
    +#if (4 == 4)<br>
     typedef    long        __s32;<br>
     #else<br>
     #if (2 == 4)<br>
    @@ -102,7 +102,7 @@ typedef unsigned int    __u64;<br>
     #if (8 == 8)<br>
     typedef unsigned long long    __u64;<br>
     #else<br>
    -#if (8 == 8)<br>
    +#if (4 == 8)<br>
     typedef unsigned long    __u64;<br>
     #endif /* SIZEOF_LONG_LONG == 8 */<br>
     #endif /* SIZEOF_LONG == 8 */<br>
    @@ -122,7 +122,7 @@ typedef __signed__ long long    __s64;<br>
     typedef signed long long    __s64;<br>
     #endif /* __GNUC__ */<br>
     #else<br>
    -#if (8 == 8)<br>
    +#if (4 == 8)<br>
     typedef long        __s64;<br>
     #endif /* SIZEOF_LONG_LONG == 8 */<br>
     #endif /* SIZEOF_LONG == 8 */<br>
    <br>
    ext2_types.h conflicts between 32-bit and 64-bit versions.<br>
    <br>
    //Ming Liu<br>
    <blockquote
cite="mid:CAMKF1soQs+xKTK3gQemohdN0Mgu05PWYAvbjXDopFM2H1qwGuw@mail.gmail.com"
      type="cite">
      <p dir="ltr">&gt; Signed-off-by: Ming Liu &lt;<a
          moz-do-not-send="true" href="mailto:ming.liu@windriver.com">ming.liu@windriver.com</a>&gt;<br>
        &gt; ---<br>
        &gt;  meta/recipes-devtools/e2fsprogs/e2fsprogs.inc       | 3
        +--<br>
        &gt;  meta/recipes-devtools/e2fsprogs/<a moz-do-not-send="true"
          href="http://e2fsprogs_1.42.9.bb">e2fsprogs_1.42.9.bb</a> | 2
        ++<br>
        &gt;  2 files changed, 3 insertions(+), 2 deletions(-)<br>
        &gt;<br>
        &gt; diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
        b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc<br>
        &gt; index a34df37..99447c1 100644<br>
        &gt; --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc<br>
        &gt; +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc<br>
        &gt; @@ -22,5 +22,4 @@ DEPENDS = "util-linux"<br>
        &gt;  SRC_URI =
        "${SOURCEFORGE_MIRROR}/e2fsprogs/e2fsprogs-${PV}.tar.gz \<br>
        &gt;             <a class="moz-txt-link-freetext" href="file://mkdir.patch">file://mkdir.patch</a>"<br>
        &gt;<br>
        &gt; -inherit autotools gettext pkgconfig<br>
        &gt; -<br>
        &gt; +inherit autotools gettext pkgconfig multilib_header<br>
        &gt; diff --git a/meta/recipes-devtools/e2fsprogs/<a
          moz-do-not-send="true" href="http://e2fsprogs_1.42.9.bb">e2fsprogs_1.42.9.bb</a>
        b/meta/recipes-devtools/e2fsprogs/<a moz-do-not-send="true"
          href="http://e2fsprogs_1.42.9.bb">e2fsprogs_1.42.9.bb</a><br>
        &gt; index 3a5d6ee..2bdd724 100644<br>
        &gt; --- a/meta/recipes-devtools/e2fsprogs/<a
          moz-do-not-send="true" href="http://e2fsprogs_1.42.9.bb">e2fsprogs_1.42.9.bb</a><br>
        &gt; +++ b/meta/recipes-devtools/e2fsprogs/<a
          moz-do-not-send="true" href="http://e2fsprogs_1.42.9.bb">e2fsprogs_1.42.9.bb</a><br>
        &gt; @@ -52,6 +52,8 @@ do_install () {<br>
        &gt;                 mv ${D}${base_libdir}/e2initrd_helper
        ${D}${libdir}<br>
        &gt;                 mv ${D}${base_libdir}/pkgconfig
        ${D}${libdir}<br>
        &gt;         fi<br>
        &gt; +<br>
        &gt; +       oe_multilib_header ext2fs/ext2_types.h<br>
        &gt;  }<br>
        &gt;<br>
        &gt;  RDEPENDS_e2fsprogs = "e2fsprogs-badblocks"<br>
        &gt; --<br>
        &gt; 1.8.4.1<br>
        &gt;<br>
        &gt; --<br>
        &gt; _______________________________________________<br>
        &gt; Openembedded-core mailing list<br>
        &gt; <a moz-do-not-send="true"
          href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a><br>
        &gt; <a moz-do-not-send="true"
          href="http://lists.openembedded.org/mailman/listinfo/openembedded-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
      </p>
    </blockquote>
    <br>
  </body>
</html>

--------------070007020908080701070604--
