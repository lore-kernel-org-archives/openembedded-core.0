Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
 by mx.groups.io with SMTP id smtpd.web11.1718.1590566356513997238
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 00:59:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=G49+EdAk;
 spf=pass (domain: gmail.com, ip: 209.85.217.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f49.google.com with SMTP id 1so13274251vsl.9
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2020 00:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NzjJ8cTILAZGzvY1EggOIXcSBjaysxDesM/YKbWzGmY=;
        b=G49+EdAkDd+KLBhYUQw8KBtZracfI2ySkZz0IyXdCUTVlMXYh7Hhn3d0gbCrXKuc9u
         uSiwWZ8Y2wQ5xny3afoP50nHSeeYevghg/7+XoyjPlHzdHDCPYaGUGyGQAIcMmU20z4c
         StV2bp9cqY6mUtKK4FuSNhWuMPQJ1f2gHAqKWiqxm5alKEwNJ4vlT3PLhwqk4ATqADF5
         qL6gBshQRfiWRMK3d6TcRkWUlL7bBKWP1FqOLUV1yIUHt6HAD3YqfKmxJgXjSRjXpVGb
         icgw57m78v3jgnmyUPbSyUR5oO21GQz7oEPW9rPw2NEABKoq0isg4zlaAxIEADSJFzRS
         zAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NzjJ8cTILAZGzvY1EggOIXcSBjaysxDesM/YKbWzGmY=;
        b=UadPi5zhtqtxyvau6dm5A6plB8uwnOk7Ac+a0zWJJ/2vi3vbB96cahMN8RglfZ5h6d
         PDVtu4mj6Zh9vChfpIiTfUxmReo5FcduplGbBYNe1v5A8LPJkG0IzZArb+DB2928tSah
         pUARIohP3F3iFSfCE1TW9xMW4A96tzEJ3s78W8xUssvEtUPGbrpBDmYCgnYwzaWqcgmv
         mRuzgeF+uAmE2x6mTknfs6sb11fFq2ULURRIDeJfyVyKcGdnPvUQsInsJ6gnyaZ/mBIJ
         b2Dha9mfwKM0T+iXdZkWUsIbzYJfz3Pjgxj7aviI01JPIQ3mR+42IgIAf09rj5Deyd0P
         yVVQ==
X-Gm-Message-State: AOAM532wz0uA3uBLouVg3eNTEosqRZRPPSIhJGIVH1R9b1PcjpfUOkvq
	YuU8F08QjOgfklM9/SYr8ce8DJN0tlS/qd3pJU8=
X-Google-Smtp-Source: ABdhPJym7y7WsOnFyW1wXkJT97E1oV3U0Bbu7BW8HaZkNPhfQdG9ft0V5tUUWaAieu50SV5i/wtkgaV8CJqWZsvJFOY=
X-Received: by 2002:a67:ee46:: with SMTP id g6mr3733307vsp.23.1590566355474;
 Wed, 27 May 2020 00:59:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200526211257.37713-1-trevor.gamblin@windriver.com>
In-Reply-To: <20200526211257.37713-1-trevor.gamblin@windriver.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 27 May 2020 09:59:04 +0200
Message-ID: <CANNYZj9v6gxW+jz4b6ejo838tTRNkSUB3DYULy4yEADz+gZdKw@mail.gmail.com>
Subject: Re: [oe-core][PATCH] libexif: upgrade to 0.6.22, change source to GitHub
To: Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000009c1f2105a69c96d4"

--0000000000009c1f2105a69c96d4
Content-Type: text/plain; charset="UTF-8"

Hardcoding the split version components isn't great (and breaks automated
updates), I have a patch queued that does this better:

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=akanavin/package-version-updates&id=314af89080317673cf91e24537b2e0d9b36747c2

Specifically:
def version_underscore(v):
 return "_".join(v.split("."))

SRC_URI = "
https://github.com/libexif/libexif/releases/download/libexif-${@version_underscore("${PV}")}-release/libexif-${PV}.tar.xz
\
 "

Alex

On Tue, 26 May 2020 at 23:13, Trevor Gamblin <trevor.gamblin@windriver.com>
wrote:

> Updated libexif to 0.6.22, but needed to change to GitHub as a source,
> since SourceForge does not yet have 0.6.22 version. The new version
> includes the fixes for the three patch files that have been removed,
> as well as other severe CVEs.
>
> CVE: CVE-2018-20030
> CVE: CVE-2020-13114
> CVE: CVE-2020-13113
> CVE: CVE-2020-13112
> CVE: CVE-2020-0093
> CVE: CVE-2019-9278
> CVE: CVE-2020-12767
> CVE: CVE-2016-6328
> CVE: CVE-2017-7544
>
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>  .../libexif/libexif/CVE-2016-6328.patch       |  64 ----------
>  .../libexif/libexif/CVE-2017-7544.patch       |  40 ------
>  .../libexif/libexif/CVE-2018-20030.patch      | 115 ------------------
>  .../recipes-support/libexif/libexif_0.6.21.bb |  17 ---
>  .../recipes-support/libexif/libexif_0.6.22.bb |  21 ++++
>  5 files changed, 21 insertions(+), 236 deletions(-)
>  delete mode 100644
> meta/recipes-support/libexif/libexif/CVE-2016-6328.patch
>  delete mode 100644
> meta/recipes-support/libexif/libexif/CVE-2017-7544.patch
>  delete mode 100644
> meta/recipes-support/libexif/libexif/CVE-2018-20030.patch
>  delete mode 100644 meta/recipes-support/libexif/libexif_0.6.21.bb
>  create mode 100644 meta/recipes-support/libexif/libexif_0.6.22.bb
>
> diff --git a/meta/recipes-support/libexif/libexif/CVE-2016-6328.patch
> b/meta/recipes-support/libexif/libexif/CVE-2016-6328.patch
> deleted file mode 100644
> index a6f307439b..0000000000
> --- a/meta/recipes-support/libexif/libexif/CVE-2016-6328.patch
> +++ /dev/null
> @@ -1,64 +0,0 @@
> -CVE: CVE-2016-6328
> -Upstream-Status: Backport
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -From 41bd04234b104312f54d25822f68738ba8d7133d Mon Sep 17 00:00:00 2001
> -From: Marcus Meissner <marcus@jet.franken.de>
> -Date: Tue, 25 Jul 2017 23:44:44 +0200
> -Subject: [PATCH] fixes some (not all) buffer overreads during decoding
> pentax
> - makernote entries.
> -
> -This should fix:
> -https://sourceforge.net/p/libexif/bugs/125/ CVE-2016-6328
> ----
> - libexif/pentax/mnote-pentax-entry.c | 16 +++++++++++++---
> - 1 file changed, 13 insertions(+), 3 deletions(-)
> -
> -diff --git a/libexif/pentax/mnote-pentax-entry.c
> b/libexif/pentax/mnote-pentax-entry.c
> -index d03d159..ea0429a 100644
> ---- a/libexif/pentax/mnote-pentax-entry.c
> -+++ b/libexif/pentax/mnote-pentax-entry.c
> -@@ -425,24 +425,34 @@ mnote_pentax_entry_get_value (MnotePentaxEntry
> *entry,
> -               case EXIF_FORMAT_SHORT:
> -                 {
> -                       const unsigned char *data = entry->data;
> --                      size_t k, len = strlen(val);
> -+                      size_t k, len = strlen(val), sizeleft;
> -+
> -+                      sizeleft = entry->size;
> -                       for(k=0; k<entry->components; k++) {
> -+                              if (sizeleft < 2)
> -+                                      break;
> -                               vs = exif_get_short (data, entry->order);
> -                               snprintf (val+len, maxlen-len, "%i ", vs);
> -                               len = strlen(val);
> -                               data += 2;
> -+                              sizeleft -= 2;
> -                       }
> -                 }
> -                 break;
> -               case EXIF_FORMAT_LONG:
> -                 {
> -                       const unsigned char *data = entry->data;
> --                      size_t k, len = strlen(val);
> -+                      size_t k, len = strlen(val), sizeleft;
> -+
> -+                      sizeleft = entry->size;
> -                       for(k=0; k<entry->components; k++) {
> -+                              if (sizeleft < 4)
> -+                                      break;
> -                               vl = exif_get_long (data, entry->order);
> -                               snprintf (val+len, maxlen-len, "%li",
> (long int) vl);
> -                               len = strlen(val);
> -                               data += 4;
> -+                              sizeleft -= 4;
> -                       }
> -                 }
> -                 break;
> -@@ -455,5 +465,5 @@ mnote_pentax_entry_get_value (MnotePentaxEntry *entry,
> -               break;
> -       }
> -
> --      return (val);
> -+      return val;
> - }
> diff --git a/meta/recipes-support/libexif/libexif/CVE-2017-7544.patch
> b/meta/recipes-support/libexif/libexif/CVE-2017-7544.patch
> deleted file mode 100644
> index e49481ff84..0000000000
> --- a/meta/recipes-support/libexif/libexif/CVE-2017-7544.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -From 8a92f964a66d476ca8907234359e92a70fc1325b Mon Sep 17 00:00:00 2001
> -From: Changqing Li <changqing.li@windriver.com>
> -Date: Tue, 28 Aug 2018 15:12:10 +0800
> -Subject: [PATCH] On saving makernotes, make sure the makernote container
> tags
> - has a type with 1 byte components.
> -
> -Fixes (at least):
> -       https://sourceforge.net/p/libexif/bugs/130
> -       https://sourceforge.net/p/libexif/bugs/129
> -
> -Upstream-Status: Backport[https://github.com/libexif/libexif/commit/
>
> -c39acd1692023b26290778a02a9232c873f9d71a#diff-830e348923810f00726700b083ec00cd
> <https://github.com/libexif/libexif/commit/-c39acd1692023b26290778a02a9232c873f9d71a#diff-830e348923810f00726700b083ec00cd>
> ]
> -
> -CVE: CVE-2017-7544
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - libexif/exif-data.c | 6 ++++++
> - 1 file changed, 6 insertions(+)
> -
> -diff --git a/libexif/exif-data.c b/libexif/exif-data.c
> -index 67df4db..6bf89eb 100644
> ---- a/libexif/exif-data.c
> -+++ b/libexif/exif-data.c
> -@@ -255,6 +255,12 @@ exif_data_save_data_entry (ExifData *data, ExifEntry
> *e,
> -                       exif_mnote_data_set_offset (data->priv->md, *ds -
> 6);
> -                       exif_mnote_data_save (data->priv->md, &e->data,
> &e->size);
> -                       e->components = e->size;
> -+                        if (exif_format_get_size (e->format) != 1) {
> -+                              /* e->format is taken from input code,
> -+                               * but we need to make sure it is a 1 byte
> -+                               * entity due to the multiplication below.
> */
> -+                              e->format = EXIF_FORMAT_UNDEFINED;
> -+                      }
> -               }
> -       }
> -
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-support/libexif/libexif/CVE-2018-20030.patch
> b/meta/recipes-support/libexif/libexif/CVE-2018-20030.patch
> deleted file mode 100644
> index 76233e6dc9..0000000000
> --- a/meta/recipes-support/libexif/libexif/CVE-2018-20030.patch
> +++ /dev/null
> @@ -1,115 +0,0 @@
> -CVE: CVE-2018-20030
> -Upstream-Status: Backport
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -From 6aa11df549114ebda520dde4cdaea2f9357b2c89 Mon Sep 17 00:00:00 2001
> -From: Dan Fandrich <dan@coneharvesters.com>
> -Date: Fri, 12 Oct 2018 16:01:45 +0200
> -Subject: [PATCH] Improve deep recursion detection in
> - exif_data_load_data_content.
> -
> -The existing detection was still vulnerable to pathological cases
> -causing DoS by wasting CPU. The new algorithm takes the number of tags
> -into account to make it harder to abuse by cases using shallow recursion
> -but with a very large number of tags.  This improves on commit 5d28011c
> -which wasn't sufficient to counter this kind of case.
> -
> -The limitation in the previous fix was discovered by Laurent Delosieres,
> -Secunia Research at Flexera (Secunia Advisory SA84652) and is assigned
> -the identifier CVE-2018-20030.
> -
> -diff --git a/libexif/exif-data.c b/libexif/exif-data.c
> -index 67df4db..8d9897e 100644
> ---- a/libexif/exif-data.c
> -+++ b/libexif/exif-data.c
> -@@ -35,6 +35,7 @@
> - #include <libexif/olympus/exif-mnote-data-olympus.h>
> - #include <libexif/pentax/exif-mnote-data-pentax.h>
> -
> -+#include <math.h>
> - #include <stdlib.h>
> - #include <stdio.h>
> - #include <string.h>
> -@@ -344,6 +345,20 @@ if (data->ifd[(i)]->count) {
>       \
> -       break;                                          \
> - }
> -
> -+/*! Calculate the recursion cost added by one level of IFD loading.
> -+ *
> -+ * The work performed is related to the cost in the exponential relation
> -+ *   work=1.1**cost
> -+ */
> -+static unsigned int
> -+level_cost(unsigned int n)
> -+{
> -+    static const double log_1_1 = 0.09531017980432493;
> -+
> -+      /* Adding 0.1 protects against the case where n==1 */
> -+      return ceil(log(n + 0.1)/log_1_1);
> -+}
> -+
> - /*! Load data for an IFD.
> -  *
> -  * \param[in,out] data #ExifData
> -@@ -351,13 +366,13 @@ if (data->ifd[(i)]->count) {
>      \
> -  * \param[in] d pointer to buffer containing raw IFD data
> -  * \param[in] ds size of raw data in buffer at \c d
> -  * \param[in] offset offset into buffer at \c d at which IFD starts
> -- * \param[in] recursion_depth number of times this function has been
> -- * recursively called without returning
> -+ * \param[in] recursion_cost factor indicating how expensive this
> recursive
> -+ * call could be
> -  */
> - static void
> - exif_data_load_data_content (ExifData *data, ExifIfd ifd,
> -                            const unsigned char *d,
> --                           unsigned int ds, unsigned int offset,
> unsigned int recursion_depth)
> -+                           unsigned int ds, unsigned int offset,
> unsigned int recursion_cost)
> - {
> -       ExifLong o, thumbnail_offset = 0, thumbnail_length = 0;
> -       ExifShort n;
> -@@ -372,9 +387,20 @@ exif_data_load_data_content (ExifData *data, ExifIfd
> ifd,
> -       if ((((int)ifd) < 0) || ( ((int)ifd) >= EXIF_IFD_COUNT))
> -         return;
> -
> --      if (recursion_depth > 30) {
> -+      if (recursion_cost > 170) {
> -+              /*
> -+               * recursion_cost is a logarithmic-scale indicator of how
> expensive this
> -+               * recursive call might end up being. It is an indicator
> of the depth of
> -+               * recursion as well as the potential for worst-case
> future recursive
> -+               * calls. Since it's difficult to tell ahead of time how
> often recursion
> -+               * will occur, this assumes the worst by assuming every
> tag could end up
> -+               * causing recursion.
> -+               * The value of 170 was chosen to limit typical EXIF
> structures to a
> -+               * recursive depth of about 6, but pathological ones
> (those with very
> -+               * many tags) to only 2.
> -+               */
> -               exif_log (data->priv->log, EXIF_LOG_CODE_CORRUPT_DATA,
> "ExifData",
> --                        "Deep recursion detected!");
> -+                        "Deep/expensive recursion detected!");
> -               return;
> -       }
> -
> -@@ -416,15 +442,18 @@ exif_data_load_data_content (ExifData *data,
> ExifIfd ifd,
> -                       switch (tag) {
> -                       case EXIF_TAG_EXIF_IFD_POINTER:
> -                               CHECK_REC (EXIF_IFD_EXIF);
> --                              exif_data_load_data_content (data,
> EXIF_IFD_EXIF, d, ds, o, recursion_depth + 1);
> -+                              exif_data_load_data_content (data,
> EXIF_IFD_EXIF, d, ds, o,
> -+                                      recursion_cost + level_cost(n));
> -                               break;
> -                       case EXIF_TAG_GPS_INFO_IFD_POINTER:
> -                               CHECK_REC (EXIF_IFD_GPS);
> --                              exif_data_load_data_content (data,
> EXIF_IFD_GPS, d, ds, o, recursion_depth + 1);
> -+                              exif_data_load_data_content (data,
> EXIF_IFD_GPS, d, ds, o,
> -+                                      recursion_cost + level_cost(n));
> -                               break;
> -                       case EXIF_TAG_INTEROPERABILITY_IFD_POINTER:
> -                               CHECK_REC (EXIF_IFD_INTEROPERABILITY);
> --                              exif_data_load_data_content (data,
> EXIF_IFD_INTEROPERABILITY, d, ds, o, recursion_depth + 1);
> -+                              exif_data_load_data_content (data,
> EXIF_IFD_INTEROPERABILITY, d, ds, o,
> -+                                      recursion_cost + level_cost(n));
> -                               break;
> -                       case EXIF_TAG_JPEG_INTERCHANGE_FORMAT:
> -                               thumbnail_offset = o;
> diff --git a/meta/recipes-support/libexif/libexif_0.6.21.bb
> b/meta/recipes-support/libexif/libexif_0.6.21.bb
> deleted file mode 100644
> index d847beab18..0000000000
> --- a/meta/recipes-support/libexif/libexif_0.6.21.bb
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -SUMMARY = "Library for reading extended image information (EXIF) from
> JPEG files"
> -HOMEPAGE = "http://sourceforge.net/projects/libexif"
> -SECTION = "libs"
> -LICENSE = "LGPLv2.1"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad"
> -
> -SRC_URI = "${SOURCEFORGE_MIRROR}/libexif/libexif-${PV}.tar.bz2 \
> -           file://CVE-2017-7544.patch \
> -           file://CVE-2016-6328.patch \
> -           file://CVE-2018-20030.patch"
> -
> -SRC_URI[md5sum] = "27339b89850f28c8f1c237f233e05b27"
> -SRC_URI[sha256sum] =
> "16cdaeb62eb3e6dfab2435f7d7bccd2f37438d21c5218ec4e58efa9157d4d41a"
> -
> -inherit autotools gettext
> -
> -EXTRA_OECONF += "--disable-docs"
> diff --git a/meta/recipes-support/libexif/libexif_0.6.22.bb
> b/meta/recipes-support/libexif/libexif_0.6.22.bb
> new file mode 100644
> index 0000000000..b24135db0f
> --- /dev/null
> +++ b/meta/recipes-support/libexif/libexif_0.6.22.bb
> @@ -0,0 +1,21 @@
> +SUMMARY = "Library for reading extended image information (EXIF) from
> JPEG files"
> +HOMEPAGE = "http://sourceforge.net/projects/libexif"
> +SECTION = "libs"
> +LICENSE = "LGPLv2.1"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad"
> +
> +MAJOR_VERSION = "0"
> +MINOR_VERSION = "6"
> +PATCH_VERSION = "22"
> +
> +PV = "${MAJOR_VERSION}.${MINOR_VERSION}.${PATCH_VERSION}"
> +PATH_PV = "${MAJOR_VERSION}_${MINOR_VERSION}_${PATCH_VERSION}"
> +
> +SRC_URI = "
> https://github.com/libexif/libexif/releases/download/libexif-${PATH_PV}-release/libexif-${PV}.tar.gz
> "
> +
> +SRC_URI[md5sum] = "dd67f593b046ad93d01437081329af02"
> +SRC_URI[sha256sum] =
> "75dc5c135c61b5e0b15f3911b4de4b3070dd1a1683b9fc08d9ce3518d54d758d"
> +
> +inherit autotools gettext
> +
> +EXTRA_OECONF += "--disable-docs"
> --
> 2.26.2
>
> 
>

--0000000000009c1f2105a69c96d4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hardcoding the split version components isn&#39;t gre=
at (and breaks automated updates), I have a patch queued that does this bet=
ter:</div><div><br></div><div></div><div><a href=3D"http://git.yoctoproject=
.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dakanavin/package-version-update=
s&amp;id=3D314af89080317673cf91e24537b2e0d9b36747c2">http://git.yoctoprojec=
t.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dakanavin/package-version-updat=
es&amp;id=3D314af89080317673cf91e24537b2e0d9b36747c2</a></div><div><br></di=
v><div>Specifically:</div><div><div class=3D"gmail-add">def version_undersc=
ore(v):</div><div class=3D"gmail-add">=C2=A0return &quot;_&quot;.join(v.spl=
it(&quot;.&quot;))</div><div class=3D"gmail-add"><br></div><div class=3D"gm=
ail-add">SRC_URI =3D &quot;<a href=3D"https://github.com/libexif/libexif/re=
leases/download/libexif-${@version_underscore(">https://github.com/libexif/=
libexif/releases/download/libexif-${@version_underscore(</a>&quot;${PV}&quo=
t;)}-release/libexif-${PV}.tar.xz \</div><div class=3D"gmail-add">=C2=A0&qu=
ot;</div><div class=3D"gmail-add"><br></div><div class=3D"gmail-add">Alex<b=
r></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, 26 May 2020 at 23:13, Trevor Gamblin &lt;<a href=
=3D"mailto:trevor.gamblin@windriver.com">trevor.gamblin@windriver.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Updat=
ed libexif to 0.6.22, but needed to change to GitHub as a source,<br>
since SourceForge does not yet have 0.6.22 version. The new version<br>
includes the fixes for the three patch files that have been removed,<br>
as well as other severe CVEs.<br>
<br>
CVE: CVE-2018-20030<br>
CVE: CVE-2020-13114<br>
CVE: CVE-2020-13113<br>
CVE: CVE-2020-13112<br>
CVE: CVE-2020-0093<br>
CVE: CVE-2019-9278<br>
CVE: CVE-2020-12767<br>
CVE: CVE-2016-6328<br>
CVE: CVE-2017-7544<br>
<br>
Signed-off-by: Trevor Gamblin &lt;<a href=3D"mailto:trevor.gamblin@windriv=
er.com" target=3D"_blank">trevor.gamblin@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../libexif/libexif/CVE-2016-6328.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 64 ----------<br>
=C2=A0.../libexif/libexif/CVE-2017-7544.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 40 ------<br>
=C2=A0.../libexif/libexif/CVE-2018-20030.patch=C2=A0 =C2=A0 =C2=A0 | 115 -=
-----------------<br>
=C2=A0.../recipes-support/libexif/<a href=3D"http://libexif_0.6.21.bb" rel=
=
=3D"noreferrer" target=3D"_blank">libexif_0.6.21.bb</a> |=C2=A0 17 ---<br>
=C2=A0.../recipes-support/libexif/<a href=3D"http://libexif_0.6.22.bb" rel=
=
=3D"noreferrer" target=3D"_blank">libexif_0.6.22.bb</a> |=C2=A0 21 ++++<br=
>
=C2=A05 files changed, 21 insertions(+), 236 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-support/libexif/libexif/CVE-2016-632=
8.patch<br>
=C2=A0delete mode 100644 meta/recipes-support/libexif/libexif/CVE-2017-754=
4.patch<br>
=C2=A0delete mode 100644 meta/recipes-support/libexif/libexif/CVE-2018-200=
30.patch<br>
=C2=A0delete mode 100644 meta/recipes-support/libexif/<a href=3D"http://li=
bexif_0.6.21.bb" rel=3D"noreferrer" target=3D"_blank">libexif_0.6.21.bb</a>=
<br>
=C2=A0create mode 100644 meta/recipes-support/libexif/<a href=3D"http://li=
bexif_0.6.22.bb" rel=3D"noreferrer" target=3D"_blank">libexif_0.6.22.bb</a>=
<br>
<br>
diff --git a/meta/recipes-support/libexif/libexif/CVE-2016-6328.patch b/me=
ta/recipes-support/libexif/libexif/CVE-2016-6328.patch<br>
deleted file mode 100644<br>
index a6f307439b..0000000000<br>
--- a/meta/recipes-support/libexif/libexif/CVE-2016-6328.patch<br>
+++ /dev/null<br>
@@ -1,64 +0,0 @@<br>
-CVE: CVE-2016-6328<br>
-Upstream-Status: Backport<br>
-Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" t=
arget=3D"_blank">ross.burton@intel.com</a>&gt;<br>
-<br>
-From 41bd04234b104312f54d25822f68738ba8d7133d Mon Sep 17 00:00:00 2001<br=
>
-From: Marcus Meissner &lt;<a href=3D"mailto:marcus@jet.franken.de" target=
=
=3D"_blank">marcus@jet.franken.de</a>&gt;<br>
-Date: Tue, 25 Jul 2017 23:44:44 +0200<br>
-Subject: [PATCH] fixes some (not all) buffer overreads during decoding pe=
ntax<br>
- makernote entries.<br>
-<br>
-This should fix:<br>
-<a href=3D"https://sourceforge.net/p/libexif/bugs/125/" rel=3D"noreferrer=
" target=3D"_blank">https://sourceforge.net/p/libexif/bugs/125/</a> CVE-201=
6-6328<br>
----<br>
- libexif/pentax/mnote-pentax-entry.c | 16 +++++++++++++---<br>
- 1 file changed, 13 insertions(+), 3 deletions(-)<br>
-<br>
-diff --git a/libexif/pentax/mnote-pentax-entry.c b/libexif/pentax/mnote-p=
entax-entry.c<br>
-index d03d159..ea0429a 100644<br>
---- a/libexif/pentax/mnote-pentax-entry.c<br>
-+++ b/libexif/pentax/mnote-pentax-entry.c<br>
-@@ -425,24 +425,34 @@ mnote_pentax_entry_get_value (MnotePentaxEntry *ent=
ry,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case EXIF_FORMAT_S=
HORT:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0const unsigned char *data =3D entry-&gt;data;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 size_t k, len =3D strlen(val);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 size_t k, len =3D strlen(val), sizeleft;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 sizeleft =3D entry-&gt;size;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0for(k=3D0; k&lt;entry-&gt;components; k++) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sizeleft &lt; 2)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vs =3D exif_get_short (data, entry-&=
gt;order);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf (val+len, maxlen-len, &quot=
;%i &quot;, vs);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D strlen(val);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data +=3D 2;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeleft -=3D 2;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case EXIF_FORMAT_L=
ONG:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0const unsigned char *data =3D entry-&gt;data;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 size_t k, len =3D strlen(val);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 size_t k, len =3D strlen(val), sizeleft;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 sizeleft =3D entry-&gt;size;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0for(k=3D0; k&lt;entry-&gt;components; k++) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sizeleft &lt; 4)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vl =3D exif_get_long (data, entry-&g=
t;order);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf (val+len, maxlen-len, &quot=
;%li&quot;, (long int) vl);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D strlen(val);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data +=3D 4;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeleft -=3D 4;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-@@ -455,5 +465,5 @@ mnote_pentax_entry_get_value (MnotePentaxEntry *entry=
,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 return (val);<br>
-+=C2=A0 =C2=A0 =C2=A0 return val;<br>
- }<br>
diff --git a/meta/recipes-support/libexif/libexif/CVE-2017-7544.patch b/me=
ta/recipes-support/libexif/libexif/CVE-2017-7544.patch<br>
deleted file mode 100644<br>
index e49481ff84..0000000000<br>
--- a/meta/recipes-support/libexif/libexif/CVE-2017-7544.patch<br>
+++ /dev/null<br>
@@ -1,40 +0,0 @@<br>
-From 8a92f964a66d476ca8907234359e92a70fc1325b Mon Sep 17 00:00:00 2001<br=
>
-From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.com" targ=
et=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
-Date: Tue, 28 Aug 2018 15:12:10 +0800<br>
-Subject: [PATCH] On saving makernotes, make sure the makernote container =
tags<br>
- has a type with 1 byte components.<br>
-<br>
-Fixes (at least):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://sourceforge.net/p/libexif/b=
ugs/130" rel=3D"noreferrer" target=3D"_blank">https://sourceforge.net/p/lib=
exif/bugs/130</a><br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://sourceforge.net/p/libexif/b=
ugs/129" rel=3D"noreferrer" target=3D"_blank">https://sourceforge.net/p/lib=
exif/bugs/129</a><br>
-<br>
-Upstream-Status: Backport[<a href=3D"https://github.com/libexif/libexif/c=
ommit/-c39acd1692023b26290778a02a9232c873f9d71a#diff-830e348923810f00726700=
b083ec00cd" rel=3D"noreferrer" target=3D"_blank">https://github.com/libexif=
/libexif/commit/<br>
-c39acd1692023b26290778a02a9232c873f9d71a#diff-830e348923810f00726700b083e=
c00cd</a>]<br>
-<br>
-CVE: CVE-2017-7544<br>
-<br>
-Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.=
com" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
----<br>
- libexif/exif-data.c | 6 ++++++<br>
- 1 file changed, 6 insertions(+)<br>
-<br>
-diff --git a/libexif/exif-data.c b/libexif/exif-data.c<br>
-index 67df4db..6bf89eb 100644<br>
---- a/libexif/exif-data.c<br>
-+++ b/libexif/exif-data.c<br>
-@@ -255,6 +255,12 @@ exif_data_save_data_entry (ExifData *data, ExifEntry=
 *e,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0exif_mnote_data_set_offset (data-&gt;priv-&gt;md, *ds - 6);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0exif_mnote_data_save (data-&gt;priv-&gt;md, &amp;e-&gt;data, &am=
p;e-&gt;size);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0e-&gt;components =3D e-&gt;size;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 if (exif_format_get_size (e-&gt;format) !=3D 1) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* e-&gt;format is taken from input cod=
e,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* but we need to make sure it is =
a 1 byte<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* entity due to the multiplicatio=
n below. */<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 e-&gt;format =3D EXIF_FORMAT_UNDEFINED;=
<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
--- <br>
-2.7.4<br>
-<br>
diff --git a/meta/recipes-support/libexif/libexif/CVE-2018-20030.patch b/m=
eta/recipes-support/libexif/libexif/CVE-2018-20030.patch<br>
deleted file mode 100644<br>
index 76233e6dc9..0000000000<br>
--- a/meta/recipes-support/libexif/libexif/CVE-2018-20030.patch<br>
+++ /dev/null<br>
@@ -1,115 +0,0 @@<br>
-CVE: CVE-2018-20030<br>
-Upstream-Status: Backport<br>
-Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" t=
arget=3D"_blank">ross.burton@intel.com</a>&gt;<br>
-<br>
-From 6aa11df549114ebda520dde4cdaea2f9357b2c89 Mon Sep 17 00:00:00 2001<br=
>
-From: Dan Fandrich &lt;<a href=3D"mailto:dan@coneharvesters.com" target=
=3D"_blank">dan@coneharvesters.com</a>&gt;<br>
-Date: Fri, 12 Oct 2018 16:01:45 +0200<br>
-Subject: [PATCH] Improve deep recursion detection in<br>
- exif_data_load_data_content.<br>
-<br>
-The existing detection was still vulnerable to pathological cases<br>
-causing DoS by wasting CPU. The new algorithm takes the number of tags<br=
>
-into account to make it harder to abuse by cases using shallow recursion<=
br>
-but with a very large number of tags.=C2=A0 This improves on commit 5d280=
11c<br>
-which wasn&#39;t sufficient to counter this kind of case.<br>
-<br>
-The limitation in the previous fix was discovered by Laurent Delosieres,<=
br>
-Secunia Research at Flexera (Secunia Advisory SA84652) and is assigned<br=
>
-the identifier CVE-2018-20030.<br>
-<br>
-diff --git a/libexif/exif-data.c b/libexif/exif-data.c<br>
-index 67df4db..8d9897e 100644<br>
---- a/libexif/exif-data.c<br>
-+++ b/libexif/exif-data.c<br>
-@@ -35,6 +35,7 @@<br>
- #include &lt;libexif/olympus/exif-mnote-data-olympus.h&gt;<br>
- #include &lt;libexif/pentax/exif-mnote-data-pentax.h&gt;<br>
- <br>
-+#include &lt;math.h&gt;<br>
- #include &lt;stdlib.h&gt;<br>
- #include &lt;stdio.h&gt;<br>
- #include &lt;string.h&gt;<br>
-@@ -344,6 +345,20 @@ if (data-&gt;ifd[(i)]-&gt;count) {=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0break;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
- }<br>
- <br>
-+/*! Calculate the recursion cost added by one level of IFD loading.<br>
-+ *<br>
-+ * The work performed is related to the cost in the exponential relation=
<br>
-+ *=C2=A0 =C2=A0work=3D1.1**cost<br>
-+ */<br>
-+static unsigned int<br>
-+level_cost(unsigned int n)<br>
-+{<br>
-+=C2=A0 =C2=A0 static const double log_1_1 =3D 0.09531017980432493;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 /* Adding 0.1 protects against the case where n=3D=
=3D1 */<br>
-+=C2=A0 =C2=A0 =C2=A0 return ceil(log(n + 0.1)/log_1_1);<br>
-+}<br>
-+<br>
- /*! Load data for an IFD.<br>
-=C2=A0 *<br>
-=C2=A0 * \param[in,out] data #ExifData<br>
-@@ -351,13 +366,13 @@ if (data-&gt;ifd[(i)]-&gt;count) {=C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0\<br>
-=C2=A0 * \param[in] d pointer to buffer containing raw IFD data<br>
-=C2=A0 * \param[in] ds size of raw data in buffer at \c d<br>
-=C2=A0 * \param[in] offset offset into buffer at \c d at which IFD starts=
<br>
-- * \param[in] recursion_depth number of times this function has been<br>
-- * recursively called without returning<br>
-+ * \param[in] recursion_cost factor indicating how expensive this recurs=
ive<br>
-+ * call could be<br>
-=C2=A0 */<br>
- static void<br>
- exif_data_load_data_content (ExifData *data, ExifIfd ifd,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 const unsigned char *d,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int ds, unsigned int offset, unsigned =
int recursion_depth)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int ds, unsigned int offset, unsigned =
int recursion_cost)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ExifLong o, thumbnail_offset =3D 0, thumbnail_=
length =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ExifShort n;<br>
-@@ -372,9 +387,20 @@ exif_data_load_data_content (ExifData *data, ExifIfd=
 ifd,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((((int)ifd) &lt; 0) || ( ((int)ifd) &gt;=
=3D EXIF_IFD_COUNT))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 if (recursion_depth &gt; 30) {<br>
-+=C2=A0 =C2=A0 =C2=A0 if (recursion_cost &gt; 170) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* recursion_cost =
is a logarithmic-scale indicator of how expensive this<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* recursive call =
might end up being. It is an indicator of the depth of<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* recursion as we=
ll as the potential for worst-case future recursive<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* calls. Since it=
&#39;s difficult to tell ahead of time how often recursion<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* will occur, thi=
s assumes the worst by assuming every tag could end up<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* causing recursi=
on.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* The value of 17=
0 was chosen to limit typical EXIF structures to a<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* recursive depth=
 of about 6, but pathological ones (those with very<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* many tags) to o=
nly 2.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exif_log (data-&gt=
;priv-&gt;log, EXIF_LOG_CODE_CORRUPT_DATA, &quot;ExifData&quot;,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;Deep recursion detected!&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;Deep/expensive recursion detected!&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-@@ -416,15 +442,18 @@ exif_data_load_data_content (ExifData *data, ExifIf=
d ifd,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0switch (tag) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0case EXIF_TAG_EXIF_IFD_POINTER:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CHECK_REC (EXIF_IFD_EXIF);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exif_data_load_data_content (data, EXIF=
_IFD_EXIF, d, ds, o, recursion_depth + 1);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exif_data_load_data_content (data, EXIF=
_IFD_EXIF, d, ds, o,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 recursion_c=
ost + level_cost(n));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0case EXIF_TAG_GPS_INFO_IFD_POINTER:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CHECK_REC (EXIF_IFD_GPS);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exif_data_load_data_content (data, EXIF=
_IFD_GPS, d, ds, o, recursion_depth + 1);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exif_data_load_data_content (data, EXIF=
_IFD_GPS, d, ds, o,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 recursion_c=
ost + level_cost(n));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0case EXIF_TAG_INTEROPERABILITY_IFD_POINTER:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CHECK_REC (EXIF_IFD_INTEROPERABILITY=
);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exif_data_load_data_content (data, EXIF=
_IFD_INTEROPERABILITY, d, ds, o, recursion_depth + 1);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exif_data_load_data_content (data, EXIF=
_IFD_INTEROPERABILITY, d, ds, o,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 recursion_c=
ost + level_cost(n));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0case EXIF_TAG_JPEG_INTERCHANGE_FORMAT:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0thumbnail_offset =3D o;<br>
diff --git a/meta/recipes-support/libexif/<a href=3D"http://libexif_0.6.21=
.bb" rel=3D"noreferrer" target=3D"_blank">libexif_0.6.21.bb</a> b/meta/reci=
pes-support/libexif/<a href=3D"http://libexif_0.6.21.bb" rel=3D"noreferrer"=
 target=3D"_blank">libexif_0.6.21.bb</a><br>
deleted file mode 100644<br>
index d847beab18..0000000000<br>
--- a/meta/recipes-support/libexif/<a href=3D"http://libexif_0.6.21.bb" re=
l=3D"noreferrer" target=3D"_blank">libexif_0.6.21.bb</a><br>
+++ /dev/null<br>
@@ -1,17 +0,0 @@<br>
-SUMMARY =3D &quot;Library for reading extended image information (EXIF) f=
rom JPEG files&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"http://sourceforge.net/projects/libexif" re=
l=3D"noreferrer" target=3D"_blank">http://sourceforge.net/projects/libexif<=
/a>&quot;<br>
-SECTION =3D &quot;libs&quot;<br>
-LICENSE =3D &quot;LGPLv2.1&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D243b725d71bb5df4a1e5920b3=
44b86ad&quot;<br>
-<br>
-SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/libexif/libexif-${PV}.tar.bz2 \<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2017-7544.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2016-6328.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2018-20030.patch&quot=
;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;27339b89850f28c8f1c237f233e05b27&quot;<br>
-SRC_URI[sha256sum] =3D &quot;16cdaeb62eb3e6dfab2435f7d7bccd2f37438d21c521=
8ec4e58efa9157d4d41a&quot;<br>
-<br>
-inherit autotools gettext<br>
-<br>
-EXTRA_OECONF +=3D &quot;--disable-docs&quot;<br>
diff --git a/meta/recipes-support/libexif/<a href=3D"http://libexif_0.6.22=
.bb" rel=3D"noreferrer" target=3D"_blank">libexif_0.6.22.bb</a> b/meta/reci=
pes-support/libexif/<a href=3D"http://libexif_0.6.22.bb" rel=3D"noreferrer"=
 target=3D"_blank">libexif_0.6.22.bb</a><br>
new file mode 100644<br>
index 0000000000..b24135db0f<br>
--- /dev/null<br>
+++ b/meta/recipes-support/libexif/<a href=3D"http://libexif_0.6.22.bb" re=
l=3D"noreferrer" target=3D"_blank">libexif_0.6.22.bb</a><br>
@@ -0,0 +1,21 @@<br>
+SUMMARY =3D &quot;Library for reading extended image information (EXIF) f=
rom JPEG files&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"http://sourceforge.net/projects/libexif" re=
l=3D"noreferrer" target=3D"_blank">http://sourceforge.net/projects/libexif<=
/a>&quot;<br>
+SECTION =3D &quot;libs&quot;<br>
+LICENSE =3D &quot;LGPLv2.1&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D243b725d71bb5df4a1e5920b3=
44b86ad&quot;<br>
+<br>
+MAJOR_VERSION =3D &quot;0&quot;<br>
+MINOR_VERSION =3D &quot;6&quot;<br>
+PATCH_VERSION =3D &quot;22&quot;<br>
+<br>
+PV =3D &quot;${MAJOR_VERSION}.${MINOR_VERSION}.${PATCH_VERSION}&quot;<br>
+PATH_PV =3D &quot;${MAJOR_VERSION}_${MINOR_VERSION}_${PATCH_VERSION}&quot=
;<br>
+<br>
+SRC_URI =3D &quot;<a href=3D"https://github.com/libexif/libexif/releases/=
download/libexif-$%7BPATH_PV%7D-release/libexif-$%7BPV%7D.tar.gz" rel=3D"no=
referrer" target=3D"_blank">https://github.com/libexif/libexif/releases/dow=
nload/libexif-${PATH_PV}-release/libexif-${PV}.tar.gz</a>&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;dd67f593b046ad93d01437081329af02&quot;<br>
+SRC_URI[sha256sum] =3D &quot;75dc5c135c61b5e0b15f3911b4de4b3070dd1a1683b9=
fc08d9ce3518d54d758d&quot;<br>
+<br>
+inherit autotools gettext<br>
+<br>
+EXTRA_OECONF +=3D &quot;--disable-docs&quot;<br>
-- <br>
2.26.2<br>
<br>
<br>
</blockquote></div>

--0000000000009c1f2105a69c96d4--
