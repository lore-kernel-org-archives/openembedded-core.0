Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by mail.openembedded.org (Postfix) with ESMTP id E37886FF3D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 00:59:29 +0000 (UTC)
Received: from vz-proxy-l008.mx.aol.com ([64.236.82.153])
	by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O6700ILMUR0ZY10@vms173019.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Mon, 25 Apr 2016 19:59:30 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=kj9zAlcOel0A:10 a=kziv93cY1bsA:10	a=fk1lIlRQAAAA:8 a=NEAV23lmAAAA:8
	a=64SeUrbXAAAA:8 a=n0vAvVC2AAAA:8	a=Q4-j1AaZAAAA:8
	a=wK60fTWE-4EYMJZzEGsA:9 a=CjuIK1q_8ugA:10
Received: by 100.15.86.14 with SMTP id 76eb154b; Tue, 26 Apr 2016 00:59:30 GMT
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 62F52161FC8; Mon,
	25 Apr 2016 20:59:24 -0400 (EDT)
Date: Mon, 25 Apr 2016 20:59:24 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Armin Kuster <akuster808@gmail.com>
Message-id: <20160426005924.GB31113@denix.org>
References: <1461630581-26018-1-git-send-email-akuster808@gmail.com>
MIME-version: 1.0
In-reply-to: <1461630581-26018-1-git-send-email-akuster808@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Armin Kuster <akuster@mvista.com>, openembedded-core@lists.openembedded.org
Subject: Re: [master][kergoth][PATCH] tiff: Security fixes CVE-2015-8665 and CVE-2015-8683
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
X-List-Received-Date: Tue, 26 Apr 2016 00:59:30 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

It was meant to happen eventually - someone had to confuse krogoth for kergoth 
sooner or later... :)


On Mon, Apr 25, 2016 at 05:29:41PM -0700, Armin Kuster wrote:
> From: Armin Kuster <akuster@mvista.com>
> 
> same fix for both CVE's
> 
> tiff <= 4.0.6
> 
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>  .../libtiff/files/CVE-2015-8665_8683.patch         | 137 +++++++++++++++++++++
>  meta/recipes-multimedia/libtiff/tiff_4.0.6.bb      |   1 +
>  2 files changed, 138 insertions(+)
>  create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2015-8665_8683.patch
> 
> diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2015-8665_8683.patch b/meta/recipes-multimedia/libtiff/files/CVE-2015-8665_8683.patch
> new file mode 100644
> index 0000000..39c5059
> --- /dev/null
> +++ b/meta/recipes-multimedia/libtiff/files/CVE-2015-8665_8683.patch
> @@ -0,0 +1,137 @@
> +From f94a29a822f5528d2334592760fbb7938f15eb55 Mon Sep 17 00:00:00 2001
> +From: erouault <erouault>
> +Date: Sat, 26 Dec 2015 17:32:03 +0000
> +Subject: [PATCH] * libtiff/tif_getimage.c: fix out-of-bound reads in
> + TIFFRGBAImage interface in case of unsupported values of
> + SamplesPerPixel/ExtraSamples for LogLUV / CIELab. Add explicit call to
> + TIFFRGBAImageOK() in TIFFRGBAImageBegin(). Fix CVE-2015-8665 reported by
> + limingxing and CVE-2015-8683 reported by zzf of Alibaba.
> +
> +Upstream-Status: Backport
> +CVE: CVE-2015-8665
> +CVE: CVE-2015-8683
> +https://github.com/vadz/libtiff/commit/f94a29a822f5528d2334592760fbb7938f15eb55
> +
> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> +
> +---
> + ChangeLog              |  8 ++++++++
> + libtiff/tif_getimage.c | 35 ++++++++++++++++++++++-------------
> + 2 files changed, 30 insertions(+), 13 deletions(-)
> +
> +Index: tiff-4.0.6/libtiff/tif_getimage.c
> +===================================================================
> +--- tiff-4.0.6.orig/libtiff/tif_getimage.c
> ++++ tiff-4.0.6/libtiff/tif_getimage.c
> +@@ -182,20 +182,22 @@ TIFFRGBAImageOK(TIFF* tif, char emsg[102
> + 				    "Planarconfiguration", td->td_planarconfig);
> + 				return (0);
> + 			}
> +-			if( td->td_samplesperpixel != 3 )
> ++			if( td->td_samplesperpixel != 3 || colorchannels != 3 )
> +             {
> +                 sprintf(emsg,
> +-                        "Sorry, can not handle image with %s=%d",
> +-                        "Samples/pixel", td->td_samplesperpixel);
> ++                        "Sorry, can not handle image with %s=%d, %s=%d",
> ++                        "Samples/pixel", td->td_samplesperpixel,
> ++                        "colorchannels", colorchannels);
> +                 return 0;
> +             }
> + 			break;
> + 		case PHOTOMETRIC_CIELAB:
> +-            if( td->td_samplesperpixel != 3 || td->td_bitspersample != 8 )
> ++            if( td->td_samplesperpixel != 3 || colorchannels != 3 || td->td_bitspersample != 8 )
> +             {
> +                 sprintf(emsg,
> +-                        "Sorry, can not handle image with %s=%d and %s=%d",
> ++                        "Sorry, can not handle image with %s=%d, %s=%d and %s=%d",
> +                         "Samples/pixel", td->td_samplesperpixel,
> ++                        "colorchannels", colorchannels,
> +                         "Bits/sample", td->td_bitspersample);
> +                 return 0;
> +             }
> +@@ -255,6 +257,9 @@ TIFFRGBAImageBegin(TIFFRGBAImage* img, T
> + 	int colorchannels;
> + 	uint16 *red_orig, *green_orig, *blue_orig;
> + 	int n_color;
> ++	
> ++	if( !TIFFRGBAImageOK(tif, emsg) )
> ++		return 0;
> + 
> + 	/* Initialize to normal values */
> + 	img->row_offset = 0;
> +@@ -2508,29 +2513,33 @@ PickContigCase(TIFFRGBAImage* img)
> + 		case PHOTOMETRIC_RGB:
> + 			switch (img->bitspersample) {
> + 				case 8:
> +-					if (img->alpha == EXTRASAMPLE_ASSOCALPHA)
> ++					if (img->alpha == EXTRASAMPLE_ASSOCALPHA &&
> ++						img->samplesperpixel >= 4)
> + 						img->put.contig = putRGBAAcontig8bittile;
> +-					else if (img->alpha == EXTRASAMPLE_UNASSALPHA)
> ++					else if (img->alpha == EXTRASAMPLE_UNASSALPHA &&
> ++							 img->samplesperpixel >= 4)
> + 					{
> + 						if (BuildMapUaToAa(img))
> + 							img->put.contig = putRGBUAcontig8bittile;
> + 					}
> +-					else
> ++					else if( img->samplesperpixel >= 3 )
> + 						img->put.contig = putRGBcontig8bittile;
> + 					break;
> + 				case 16:
> +-					if (img->alpha == EXTRASAMPLE_ASSOCALPHA)
> ++					if (img->alpha == EXTRASAMPLE_ASSOCALPHA &&
> ++						img->samplesperpixel >=4 )
> + 					{
> + 						if (BuildMapBitdepth16To8(img))
> + 							img->put.contig = putRGBAAcontig16bittile;
> + 					}
> +-					else if (img->alpha == EXTRASAMPLE_UNASSALPHA)
> ++					else if (img->alpha == EXTRASAMPLE_UNASSALPHA &&
> ++							 img->samplesperpixel >=4 )
> + 					{
> + 						if (BuildMapBitdepth16To8(img) &&
> + 						    BuildMapUaToAa(img))
> + 							img->put.contig = putRGBUAcontig16bittile;
> + 					}
> +-					else
> ++					else if( img->samplesperpixel >=3 )
> + 					{
> + 						if (BuildMapBitdepth16To8(img))
> + 							img->put.contig = putRGBcontig16bittile;
> +@@ -2539,7 +2548,7 @@ PickContigCase(TIFFRGBAImage* img)
> + 			}
> + 			break;
> + 		case PHOTOMETRIC_SEPARATED:
> +-			if (buildMap(img)) {
> ++			if (img->samplesperpixel >=4 && buildMap(img)) {
> + 				if (img->bitspersample == 8) {
> + 					if (!img->Map)
> + 						img->put.contig = putRGBcontig8bitCMYKtile;
> +@@ -2635,7 +2644,7 @@ PickContigCase(TIFFRGBAImage* img)
> + 			}
> + 			break;
> + 		case PHOTOMETRIC_CIELAB:
> +-			if (buildMap(img)) {
> ++			if (img->samplesperpixel == 3 && buildMap(img)) {
> + 				if (img->bitspersample == 8)
> + 					img->put.contig = initCIELabConversion(img);
> + 				break;
> +Index: tiff-4.0.6/ChangeLog
> +===================================================================
> +--- tiff-4.0.6.orig/ChangeLog
> ++++ tiff-4.0.6/ChangeLog
> +@@ -1,3 +1,11 @@
> ++2015-12-26  Even Rouault <even.rouault at spatialys.com>
> ++
> ++   * libtiff/tif_getimage.c: fix out-of-bound reads in TIFFRGBAImage
> ++   interface in case of unsupported values of SamplesPerPixel/ExtraSamples
> ++   for LogLUV / CIELab. Add explicit call to TIFFRGBAImageOK() in
> ++   TIFFRGBAImageBegin(). Fix CVE-2015-8665 reported by limingxing and
> ++   CVE-2015-8683 reported by zzf of Alibaba.
> ++
> + 2015-09-12  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>
> + 
> + 	* libtiff 4.0.6 released.
> diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
> index e2e24e0..810a5e4 100644
> --- a/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
> +++ b/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
> @@ -5,6 +5,7 @@ HOMEPAGE = "http://www.remotesensing.org/libtiff/"
>  
>  SRC_URI = "ftp://ftp.remotesensing.org/pub/libtiff/tiff-${PV}.tar.gz \
>             file://libtool2.patch \
> +           file://CVE-2015-8665_8683.patch \
>            "
>  
>  SRC_URI[md5sum] = "d1d2e940dea0b5ad435f21f03d96dd72"
> -- 
> 2.3.5
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

