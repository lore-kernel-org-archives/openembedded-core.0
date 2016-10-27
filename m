Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0B60C71A71
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Oct 2016 09:41:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u9R9f7ts005231
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 27 Oct 2016 02:41:07 -0700 (PDT)
Received: from [128.224.162.198] (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Thu, 27 Oct 2016 02:41:06 -0700
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
References: <cover.1477470209.git.yi.zhao@windriver.com>
	<d6ab73986d4bdbf772bfeda912ba8098200c52cc.1477470209.git.yi.zhao@windriver.com>
	<CAHiDW_FezY8Ee_VObh-n+kf_GCoOWWbwPGpVM6s_7htfv9UhmQ@mail.gmail.com>
From: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <339c9a44-0ab5-405a-e6ec-9923a689f69e@windriver.com>
Date: Thu, 27 Oct 2016 17:41:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CAHiDW_FezY8Ee_VObh-n+kf_GCoOWWbwPGpVM6s_7htfv9UhmQ@mail.gmail.com>
X-Originating-IP: [128.224.162.198]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] tiff: Security fix CVE-2016-3945
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
X-List-Received-Date: Thu, 27 Oct 2016 09:41:08 -0000
Content-Type: multipart/alternative;
	boundary="------------6DF7BA127ADB4ABAA461502C"

--------------6DF7BA127ADB4ABAA461502C
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jussi,


在 2016年10月26日 17:09, Jussi Kukkonen 写道:
> On 26 October 2016 at 11:26, Yi Zhao <yi.zhao@windriver.com 
> <mailto:yi.zhao@windriver.com>> wrote:
>
>     CVE-2016-3945 libtiff: Multiple integer overflows in the (1)
>     cvt_by_strip and (2) cvt_by_tile functions in the tiff2rgba tool in
>     LibTIFF 4.0.6 and earlier, when -b mode is enabled, allow remote
>     attackers to cause a denial of service (crash) or execute
>     arbitrary code
>     via a crafted TIFF image, which triggers an out-of-bounds write.
>
>     External References:
>     https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-3945
>     <https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-3945>
>     http://bugzilla.maptools.org/show_bug.cgi?id=2545
>     <http://bugzilla.maptools.org/show_bug.cgi?id=2545>
>
>     Patch from:
>     https://github.com/vadz/libtiff/commit/7c39352ccd9060d311d3dc9a1f1bc00133a160e6
>     <https://github.com/vadz/libtiff/commit/7c39352ccd9060d311d3dc9a1f1bc00133a160e6>
>
>     Signed-off-by: Yi Zhao <yi.zhao@windriver.com
>     <mailto:yi.zhao@windriver.com>>
>     ---
>      .../libtiff/files/CVE-2016-3945.patch              | 118
>     +++++++++++++++++++++
>      meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
>     <http://tiff_4.0.6.bb> |   1 +
>      2 files changed, 119 insertions(+)
>      create mode 100644
>     meta/recipes-multimedia/libtiff/files/CVE-2016-3945.patch
>
>     diff --git
>     a/meta/recipes-multimedia/libtiff/files/CVE-2016-3945.patch
>     b/meta/recipes-multimedia/libtiff/files/CVE-2016-3945.patch
>     new file mode 100644
>     index 0000000..4d965be
>     --- /dev/null
>     +++ b/meta/recipes-multimedia/libtiff/files/CVE-2016-3945.patch
>     @@ -0,0 +1,118 @@
>     +From 7c39352ccd9060d311d3dc9a1f1bc00133a160e6 Mon Sep 17 00:00:00
>     2001
>     +From: erouault <erouault>
>     +Date: Mon, 15 Aug 2016 20:06:40 +0000
>     +Subject: [PATCH] * tools/tiff2rgba.c: Fix integer overflow in size of
>     + allocated buffer, when -b mode is enabled, that could result in
>     out-of-bounds
>     + write. Based initially on patch tiff-CVE-2016-3945.patch from
>     + libtiff-4.0.3-25.el7_2.src.rpm by Nikola Forro, with correction
>     for invalid
>     + tests that rejected valid files.
>     +
>     +CVE: CVE-2016-3945
>     +Upstream-Status: Backport
>     +https://github.com/vadz/libtiff/commit/7c39352ccd9060d311d3dc9a1f1bc00133a160e6
>     <https://github.com/vadz/libtiff/commit/7c39352ccd9060d311d3dc9a1f1bc00133a160e6>
>
>
> It would be appropriate to point out that this is not the real 
> upstream, just a nameless github user who maintains a git mirror of 
> the libtiff repository. It's probably a reasonable choice -- the 
> current libtiff situation with no real homepage, no real tarball 
> hosting and a half-hidden cvs server for source control is pretty sad 
> -- but should still be openly mentioned.

Thank you for your suggestion.  This github is a mirror for libtiff cvs 
repository in cvs.maptools.org. If the cvs repository is official, take 
the patches from it is better.

Yi

>
> Jussi
>
>     +
>     +Signed-off-by: Yi Zhao <yi.zhao@windirver.com
>     <mailto:yi.zhao@windirver.com>>
>     +---
>     + ChangeLog         |  8 ++++++++
>     + tools/tiff2rgba.c | 34 ++++++++++++++++++++++++++++++----
>     + 2 files changed, 38 insertions(+), 4 deletions(-)
>     +
>     +diff --git a/ChangeLog b/ChangeLog
>     +index 62dc1b5..9c0ab29 100644
>     +--- a/ChangeLog
>     ++++ b/ChangeLog
>     +@@ -1,3 +1,11 @@
>     ++2016-08-15 Even Rouault <even.rouault at spatialys.com
>     <http://spatialys.com>>
>     ++
>     ++      * tools/tiff2rgba.c: Fix integer overflow in size of allocated
>     ++      buffer, when -b mode is enabled, that could result in
>     out-of-bounds
>     ++      write. Based initially on patch tiff-CVE-2016-3945.patch from
>     ++      libtiff-4.0.3-25.el7_2.src.rpm by Nikola Forro, with
>     correction for
>     ++      invalid tests that rejected valid files.
>     ++
>     + 2016-07-11 Even Rouault <even.rouault at spatialys.com
>     <http://spatialys.com>>
>     +
>     +       * tools/tiffcrop.c: Avoid access outside of stack
>     allocated array
>     +diff --git a/tools/tiff2rgba.c b/tools/tiff2rgba.c
>     +index b7a81eb..16e3dc4 100644
>     +--- a/tools/tiff2rgba.c
>     ++++ b/tools/tiff2rgba.c
>     +@@ -147,6 +147,7 @@ cvt_by_tile( TIFF *in, TIFF *out )
>     +     uint32  row, col;
>     +     uint32  *wrk_line;
>     +     int           ok = 1;
>     ++    uint32  rastersize, wrk_linesize;
>     +
>     +     TIFFGetField(in, TIFFTAG_IMAGEWIDTH, &width);
>     +     TIFFGetField(in, TIFFTAG_IMAGELENGTH, &height);
>     +@@ -163,7 +164,13 @@ cvt_by_tile( TIFF *in, TIFF *out )
>     +     /*
>     +      * Allocate tile buffer
>     +      */
>     +-    raster = (uint32*)_TIFFmalloc(tile_width * tile_height *
>     sizeof (uint32));
>     ++    rastersize = tile_width * tile_height * sizeof (uint32);
>     ++    if (tile_width != (rastersize / tile_height) / sizeof( uint32))
>     ++    {
>     ++      TIFFError(TIFFFileName(in), "Integer overflow when
>     calculating raster buffer");
>     ++      exit(-1);
>     ++    }
>     ++    raster = (uint32*)_TIFFmalloc(rastersize);
>     +     if (raster == 0) {
>     +         TIFFError(TIFFFileName(in), "No space for raster buffer");
>     +         return (0);
>     +@@ -173,7 +180,13 @@ cvt_by_tile( TIFF *in, TIFF *out )
>     +      * Allocate a scanline buffer for swapping during the vertical
>     +      * mirroring pass.
>     +      */
>     +-    wrk_line = (uint32*)_TIFFmalloc(tile_width * sizeof (uint32));
>     ++    wrk_linesize = tile_width * sizeof (uint32);
>     ++    if (tile_width != wrk_linesize / sizeof (uint32))
>     ++    {
>     ++        TIFFError(TIFFFileName(in), "Integer overflow when
>     calculating wrk_line buffer");
>     ++      exit(-1);
>     ++    }
>     ++    wrk_line = (uint32*)_TIFFmalloc(wrk_linesize);
>     +     if (!wrk_line) {
>     +         TIFFError(TIFFFileName(in), "No space for raster
>     scanline buffer");
>     +         ok = 0;
>     +@@ -249,6 +262,7 @@ cvt_by_strip( TIFF *in, TIFF *out )
>     +     uint32  row;
>     +     uint32  *wrk_line;
>     +     int           ok = 1;
>     ++    uint32  rastersize, wrk_linesize;
>     +
>     +     TIFFGetField(in, TIFFTAG_IMAGEWIDTH, &width);
>     +     TIFFGetField(in, TIFFTAG_IMAGELENGTH, &height);
>     +@@ -263,7 +277,13 @@ cvt_by_strip( TIFF *in, TIFF *out )
>     +     /*
>     +      * Allocate strip buffer
>     +      */
>     +-    raster = (uint32*)_TIFFmalloc(width * rowsperstrip * sizeof
>     (uint32));
>     ++    rastersize = width * rowsperstrip * sizeof (uint32);
>     ++    if (width != (rastersize / rowsperstrip) / sizeof( uint32))
>     ++    {
>     ++      TIFFError(TIFFFileName(in), "Integer overflow when
>     calculating raster buffer");
>     ++      exit(-1);
>     ++    }
>     ++    raster = (uint32*)_TIFFmalloc(rastersize);
>     +     if (raster == 0) {
>     +         TIFFError(TIFFFileName(in), "No space for raster buffer");
>     +         return (0);
>     +@@ -273,7 +293,13 @@ cvt_by_strip( TIFF *in, TIFF *out )
>     +      * Allocate a scanline buffer for swapping during the vertical
>     +      * mirroring pass.
>     +      */
>     +-    wrk_line = (uint32*)_TIFFmalloc(width * sizeof (uint32));
>     ++    wrk_linesize = width * sizeof (uint32);
>     ++    if (width != wrk_linesize / sizeof (uint32))
>     ++    {
>     ++        TIFFError(TIFFFileName(in), "Integer overflow when
>     calculating wrk_line buffer");
>     ++      exit(-1);
>     ++    }
>     ++    wrk_line = (uint32*)_TIFFmalloc(wrk_linesize);
>     +     if (!wrk_line) {
>     +         TIFFError(TIFFFileName(in), "No space for raster
>     scanline buffer");
>     +         ok = 0;
>     +--
>     +2.7.4
>     +
>     diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
>     <http://tiff_4.0.6.bb>
>     b/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb <http://tiff_4.0.6.bb>
>     index 8147bc4..b978528 100644
>     --- a/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
>     <http://tiff_4.0.6.bb>
>     +++ b/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
>     <http://tiff_4.0.6.bb>
>     @@ -10,6 +10,7 @@ SRC_URI =
>     "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz
>     <http://download.osgeo.org/libtiff/tiff-$%7BPV%7D.tar.gz> \
>                 file://CVE-2016-3186.patch \
>                 file://CVE-2016-5321.patch \
>                 file://CVE-2016-5323.patch \
>     +           file://CVE-2016-3945.patch \
>                "
>
>      SRC_URI[md5sum] = "d1d2e940dea0b5ad435f21f03d96dd72"
>     --
>     2.7.4
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>
>


--------------6DF7BA127ADB4ABAA461502C
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hi Jussi,<br>
    </p>
    <br>
    <div class="moz-cite-prefix">在 2016年10月26日 17:09, Jussi Kukkonen 写道:<br>
    </div>
    <blockquote
cite="mid:CAHiDW_FezY8Ee_VObh-n+kf_GCoOWWbwPGpVM6s_7htfv9UhmQ@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">On 26 October 2016 at 11:26, Yi Zhao
            <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:yi.zhao@windriver.com" target="_blank">yi.zhao@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">CVE-2016-3945
              libtiff: Multiple integer overflows in the (1)<br>
              cvt_by_strip and (2) cvt_by_tile functions in the
              tiff2rgba tool in<br>
              LibTIFF 4.0.6 and earlier, when -b mode is enabled, allow
              remote<br>
              attackers to cause a denial of service (crash) or execute
              arbitrary code<br>
              via a crafted TIFF image, which triggers an out-of-bounds
              write.<br>
              <br>
              External References:<br>
              <a moz-do-not-send="true"
                href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-3945"
                rel="noreferrer" target="_blank">https://web.nvd.nist.gov/view/<wbr>vuln/detail?vulnId=CVE-2016-<wbr>3945</a><br>
              <a moz-do-not-send="true"
                href="http://bugzilla.maptools.org/show_bug.cgi?id=2545"
                rel="noreferrer" target="_blank">http://bugzilla.maptools.org/<wbr>show_bug.cgi?id=2545</a><br>
              <br>
              Patch from:<br>
              <a moz-do-not-send="true"
href="https://github.com/vadz/libtiff/commit/7c39352ccd9060d311d3dc9a1f1bc00133a160e6"
                rel="noreferrer" target="_blank">https://github.com/vadz/<wbr>libtiff/commit/<wbr>7c39352ccd9060d311d3dc9a1f1bc0<wbr>0133a160e6</a><br>
              <br>
              Signed-off-by: Yi Zhao &lt;<a moz-do-not-send="true"
                href="mailto:yi.zhao@windriver.com">yi.zhao@windriver.com</a>&gt;<br>
              ---<br>
               .../libtiff/files/CVE-2016-<wbr>3945.patch              |
              118 +++++++++++++++++++++<br>
               meta/recipes-multimedia/<wbr>libtiff/<a
                moz-do-not-send="true" href="http://tiff_4.0.6.bb"
                rel="noreferrer" target="_blank">tiff_4.0.6.bb</a>     
              |   1 +<br>
               2 files changed, 119 insertions(+)<br>
               create mode 100644 meta/recipes-multimedia/<wbr>libtiff/files/CVE-2016-3945.<wbr>patch<br>
              <br>
              diff --git a/meta/recipes-multimedia/<wbr>libtiff/files/CVE-2016-3945.<wbr>patch
              b/meta/recipes-multimedia/<wbr>libtiff/files/CVE-2016-3945.<wbr>patch<br>
              new file mode 100644<br>
              index 0000000..4d965be<br>
              --- /dev/null<br>
              +++ b/meta/recipes-multimedia/<wbr>libtiff/files/CVE-2016-3945.<wbr>patch<br>
              @@ -0,0 +1,118 @@<br>
              +From 7c39352ccd9060d311d3dc9a1f1bc0<wbr>0133a160e6 Mon
              Sep 17 00:00:00 2001<br>
              +From: erouault &lt;erouault&gt;<br>
              +Date: Mon, 15 Aug 2016 20:06:40 +0000<br>
              +Subject: [PATCH] * tools/tiff2rgba.c: Fix integer
              overflow in size of<br>
              + allocated buffer, when -b mode is enabled, that could
              result in out-of-bounds<br>
              + write. Based initially on patch tiff-CVE-2016-3945.patch
              from<br>
              + libtiff-4.0.3-25.el7_2.src.rpm by Nikola Forro, with
              correction for invalid<br>
              + tests that rejected valid files.<br>
              +<br>
              +CVE: CVE-2016-3945<br>
              +Upstream-Status: Backport<br>
              +<a moz-do-not-send="true"
href="https://github.com/vadz/libtiff/commit/7c39352ccd9060d311d3dc9a1f1bc00133a160e6"
                rel="noreferrer" target="_blank">https://github.com/vadz/<wbr>libtiff/commit/<wbr>7c39352ccd9060d311d3dc9a1f1bc0<wbr>0133a160e6</a><br>
            </blockquote>
            <div><br>
            </div>
            <div>It would be appropriate to point out that this is not
              the real upstream, just a nameless github user who
              maintains a git mirror of the libtiff repository. It's
              probably a reasonable choice -- the current libtiff
              situation with no real homepage, no real tarball hosting
              and a half-hidden cvs server for source control is pretty
              sad -- but should still be openly mentioned.</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    Thank you for your suggestion.  This github is a mirror for libtiff
    cvs repository in <tt>cvs.maptools.org. If the cvs repository is
      official, take the patches from it is better.<br>
      <br>
      Yi<br>
      <br>
    </tt>
    <blockquote
cite="mid:CAHiDW_FezY8Ee_VObh-n+kf_GCoOWWbwPGpVM6s_7htfv9UhmQ@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div><br>
            </div>
            <div>Jussi</div>
            <div> </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">+<br>
              +Signed-off-by: Yi Zhao &lt;<a moz-do-not-send="true"
                href="mailto:yi.zhao@windirver.com">yi.zhao@windirver.com</a>&gt;<br>
              +---<br>
              + ChangeLog         |  8 ++++++++<br>
              + tools/tiff2rgba.c | 34 ++++++++++++++++++++++++++++++<wbr>----<br>
              + 2 files changed, 38 insertions(+), 4 deletions(-)<br>
              +<br>
              +diff --git a/ChangeLog b/ChangeLog<br>
              +index 62dc1b5..9c0ab29 100644<br>
              +--- a/ChangeLog<br>
              ++++ b/ChangeLog<br>
              +@@ -1,3 +1,11 @@<br>
              ++2016-08-15 Even Rouault &lt;even.rouault at <a
                moz-do-not-send="true" href="http://spatialys.com"
                rel="noreferrer" target="_blank">spatialys.com</a>&gt;<br>
              ++<br>
              ++      * tools/tiff2rgba.c: Fix integer overflow in size
              of allocated<br>
              ++      buffer, when -b mode is enabled, that could result
              in out-of-bounds<br>
              ++      write. Based initially on patch
              tiff-CVE-2016-3945.patch from<br>
              ++      libtiff-4.0.3-25.el7_2.src.rpm by Nikola Forro,
              with correction for<br>
              ++      invalid tests that rejected valid files.<br>
              ++<br>
              + 2016-07-11 Even Rouault &lt;even.rouault at <a
                moz-do-not-send="true" href="http://spatialys.com"
                rel="noreferrer" target="_blank">spatialys.com</a>&gt;<br>
              +<br>
              +       * tools/tiffcrop.c: Avoid access outside of stack
              allocated array<br>
              +diff --git a/tools/tiff2rgba.c b/tools/tiff2rgba.c<br>
              +index b7a81eb..16e3dc4 100644<br>
              +--- a/tools/tiff2rgba.c<br>
              ++++ b/tools/tiff2rgba.c<br>
              +@@ -147,6 +147,7 @@ cvt_by_tile( TIFF *in, TIFF *out )<br>
              +     uint32  row, col;<br>
              +     uint32  *wrk_line;<br>
              +     int           ok = 1;<br>
              ++    uint32  rastersize, wrk_linesize;<br>
              +<br>
              +     TIFFGetField(in, TIFFTAG_IMAGEWIDTH, &amp;width);<br>
              +     TIFFGetField(in, TIFFTAG_IMAGELENGTH, &amp;height);<br>
              +@@ -163,7 +164,13 @@ cvt_by_tile( TIFF *in, TIFF *out )<br>
              +     /*<br>
              +      * Allocate tile buffer<br>
              +      */<br>
              +-    raster = (uint32*)_TIFFmalloc(tile_<wbr>width *
              tile_height * sizeof (uint32));<br>
              ++    rastersize = tile_width * tile_height * sizeof
              (uint32);<br>
              ++    if (tile_width != (rastersize / tile_height) /
              sizeof( uint32))<br>
              ++    {<br>
              ++      TIFFError(TIFFFileName(in), "Integer overflow when
              calculating raster buffer");<br>
              ++      exit(-1);<br>
              ++    }<br>
              ++    raster = (uint32*)_TIFFmalloc(<wbr>rastersize);<br>
              +     if (raster == 0) {<br>
              +         TIFFError(TIFFFileName(in), "No space for raster
              buffer");<br>
              +         return (0);<br>
              +@@ -173,7 +180,13 @@ cvt_by_tile( TIFF *in, TIFF *out )<br>
              +      * Allocate a scanline buffer for swapping during
              the vertical<br>
              +      * mirroring pass.<br>
              +      */<br>
              +-    wrk_line = (uint32*)_TIFFmalloc(tile_<wbr>width *
              sizeof (uint32));<br>
              ++    wrk_linesize = tile_width * sizeof (uint32);<br>
              ++    if (tile_width != wrk_linesize / sizeof (uint32))<br>
              ++    {<br>
              ++        TIFFError(TIFFFileName(in), "Integer overflow
              when calculating wrk_line buffer");<br>
              ++      exit(-1);<br>
              ++    }<br>
              ++    wrk_line = (uint32*)_TIFFmalloc(wrk_<wbr>linesize);<br>
              +     if (!wrk_line) {<br>
              +         TIFFError(TIFFFileName(in), "No space for raster
              scanline buffer");<br>
              +         ok = 0;<br>
              +@@ -249,6 +262,7 @@ cvt_by_strip( TIFF *in, TIFF *out )<br>
              +     uint32  row;<br>
              +     uint32  *wrk_line;<br>
              +     int           ok = 1;<br>
              ++    uint32  rastersize, wrk_linesize;<br>
              +<br>
              +     TIFFGetField(in, TIFFTAG_IMAGEWIDTH, &amp;width);<br>
              +     TIFFGetField(in, TIFFTAG_IMAGELENGTH, &amp;height);<br>
              +@@ -263,7 +277,13 @@ cvt_by_strip( TIFF *in, TIFF *out )<br>
              +     /*<br>
              +      * Allocate strip buffer<br>
              +      */<br>
              +-    raster = (uint32*)_TIFFmalloc(width * rowsperstrip *
              sizeof (uint32));<br>
              ++    rastersize = width * rowsperstrip * sizeof (uint32);<br>
              ++    if (width != (rastersize / rowsperstrip) / sizeof(
              uint32))<br>
              ++    {<br>
              ++      TIFFError(TIFFFileName(in), "Integer overflow when
              calculating raster buffer");<br>
              ++      exit(-1);<br>
              ++    }<br>
              ++    raster = (uint32*)_TIFFmalloc(<wbr>rastersize);<br>
              +     if (raster == 0) {<br>
              +         TIFFError(TIFFFileName(in), "No space for raster
              buffer");<br>
              +         return (0);<br>
              +@@ -273,7 +293,13 @@ cvt_by_strip( TIFF *in, TIFF *out )<br>
              +      * Allocate a scanline buffer for swapping during
              the vertical<br>
              +      * mirroring pass.<br>
              +      */<br>
              +-    wrk_line = (uint32*)_TIFFmalloc(width * sizeof
              (uint32));<br>
              ++    wrk_linesize = width * sizeof (uint32);<br>
              ++    if (width != wrk_linesize / sizeof (uint32))<br>
              ++    {<br>
              ++        TIFFError(TIFFFileName(in), "Integer overflow
              when calculating wrk_line buffer");<br>
              ++      exit(-1);<br>
              ++    }<br>
              ++    wrk_line = (uint32*)_TIFFmalloc(wrk_<wbr>linesize);<br>
              +     if (!wrk_line) {<br>
              +         TIFFError(TIFFFileName(in), "No space for raster
              scanline buffer");<br>
              +         ok = 0;<br>
              +--<br>
              +2.7.4<br>
              +<br>
              diff --git a/meta/recipes-multimedia/<wbr>libtiff/<a
                moz-do-not-send="true" href="http://tiff_4.0.6.bb"
                rel="noreferrer" target="_blank">tiff_4.0.6.bb</a>
              b/meta/recipes-multimedia/<wbr>libtiff/<a
                moz-do-not-send="true" href="http://tiff_4.0.6.bb"
                rel="noreferrer" target="_blank">tiff_4.0.6.bb</a><br>
              index 8147bc4..b978528 100644<br>
              --- a/meta/recipes-multimedia/<wbr>libtiff/<a
                moz-do-not-send="true" href="http://tiff_4.0.6.bb"
                rel="noreferrer" target="_blank">tiff_4.0.6.bb</a><br>
              +++ b/meta/recipes-multimedia/<wbr>libtiff/<a
                moz-do-not-send="true" href="http://tiff_4.0.6.bb"
                rel="noreferrer" target="_blank">tiff_4.0.6.bb</a><br>
              @@ -10,6 +10,7 @@ SRC_URI = "<a moz-do-not-send="true"
                href="http://download.osgeo.org/libtiff/tiff-$%7BPV%7D.tar.gz"
                rel="noreferrer" target="_blank">http://download.osgeo.org/<wbr>libtiff/tiff-${PV}.tar.gz</a>
              \<br>
                          <a class="moz-txt-link-freetext" href="file://CVE-2016-3186.patch">file://CVE-2016-3186.patch</a> \<br>
                          <a class="moz-txt-link-freetext" href="file://CVE-2016-5321.patch">file://CVE-2016-5321.patch</a> \<br>
                          <a class="moz-txt-link-freetext" href="file://CVE-2016-5323.patch">file://CVE-2016-5323.patch</a> \<br>
              +           <a class="moz-txt-link-freetext" href="file://CVE-2016-3945.patch">file://CVE-2016-3945.patch</a> \<br>
                         "<br>
              <br>
               SRC_URI[md5sum] = "<wbr>d1d2e940dea0b5ad435f21f03d96dd<wbr>72"<br>
              <span class="HOEnZb"><font color="#888888">--<br>
                  2.7.4<br>
                  <br>
                  --<br>
                  ______________________________<wbr>_________________<br>
                  Openembedded-core mailing list<br>
                  <a moz-do-not-send="true"
                    href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.<wbr>openembedded.org</a><br>
                  <a moz-do-not-send="true"
                    href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                    rel="noreferrer" target="_blank">http://lists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
                </font></span></blockquote>
          </div>
          <br>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------6DF7BA127ADB4ABAA461502C--
