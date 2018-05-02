Return-Path: <anuj.mittal@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 0CF55607A4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 May 2018 03:17:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 May 2018 20:17:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,353,1520924400"; d="scan'208";a="225024923"
Received: from anmitta2-mobl1.png.intel.com (HELO [10.221.22.30])
	([10.221.22.30])
	by fmsmga006.fm.intel.com with ESMTP; 01 May 2018 20:17:56 -0700
To: kai.kang@windriver.com, openembedded-core@lists.openembedded.org
References: <cover.1524640773.git.kai.kang@windriver.com>
	<47c479f97f5141b022f0e8f55015116a3af39b29.1524640773.git.kai.kang@windriver.com>
From: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <1f6c9477-d9f1-df66-eefe-058a643a2684@intel.com>
Date: Wed, 2 May 2018 11:17:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <47c479f97f5141b022f0e8f55015116a3af39b29.1524640773.git.kai.kang@windriver.com>
Subject: Re: [PATCH v2 5/8] gstreamer1.0-plugins-good: 1.12.4 -> 1.14.0
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
X-List-Received-Date: Wed, 02 May 2018 03:17:57 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/25/2018 03:23 PM, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> Upgrade gstreamer1.0-plugins-good from 1.12.4 to 1.14.0.
> 
> * add packageconfig 'gtk' and configure option '--disable-qt' from -bad
> * add packageconfig 'lame', 'mpg123' and configure option
>   '--disable-twolame' from -ugly
> * remove configure option '--disable-sunaudio' since plugin sunaudio has
>   been removed
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  .../gstreamer/gstreamer1.0-plugins-good.inc               | 15 +++++++++++++--
>  ...good_1.12.4.bb => gstreamer1.0-plugins-good_1.14.0.bb} |  4 ++--
>  2 files changed, 15 insertions(+), 4 deletions(-)
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.12.4.bb => gstreamer1.0-plugins-good_1.14.0.bb} (85%)
> 
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
> index 14c3d61848..ed14ed56c2 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
> @@ -6,10 +6,12 @@ DEPENDS += "gstreamer1.0-plugins-base libcap zlib bzip2"
>  
>  inherit gettext
>  
> +# gtk is not in the PACKAGECONFIG variable by default until
> +# the transition to gtk+3 is finished
>  PACKAGECONFIG ??= " \
>      ${GSTREAMER_ORC} \
>      ${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio x11', d)} \
> -    cairo flac gdk-pixbuf gudev jpeg libpng soup speex taglib v4l2 \
> +    cairo flac gdk-pixbuf gudev jpeg lame libpng mpg123 soup speex taglib v4l2 \
>  "
>  
>  X11DEPENDS = "virtual/libx11 libsm libxrender libxfixes libxdamage"
> @@ -18,11 +20,14 @@ PACKAGECONFIG[cairo]      = "--enable-cairo,--disable-cairo,cairo"
>  PACKAGECONFIG[dv1394]     = "--enable-dv1394,--disable-dv1394,libiec61883 libavc1394 libraw1394"
>  PACKAGECONFIG[flac]       = "--enable-flac,--disable-flac,flac"
>  PACKAGECONFIG[gdk-pixbuf] = "--enable-gdk_pixbuf,--disable-gdk_pixbuf,gdk-pixbuf"
> +PACKAGECONFIG[gtk]             = "--enable-gtk3,--disable-gtk3,gtk+3"
>  PACKAGECONFIG[gudev]      = "--with-gudev,--without-gudev,libgudev"
>  PACKAGECONFIG[jack]       = "--enable-jack,--disable-jack,jack"
>  PACKAGECONFIG[jpeg]       = "--enable-jpeg,--disable-jpeg,jpeg"
> +PACKAGECONFIG[lame]       = "--enable-lame,--disable-lame,lame"
>  PACKAGECONFIG[libpng]     = "--enable-libpng,--disable-libpng,libpng"
>  PACKAGECONFIG[libv4l2]    = "--with-libv4l2,--without-libv4l2,v4l-utils"
> +PACKAGECONFIG[mpg123]     = "--enable-mpg123,--disable-mpg123,mpg123"
>  PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio"
>  PACKAGECONFIG[soup]       = "--enable-soup,--disable-soup,libsoup-2.4"
>  PACKAGECONFIG[speex]      = "--enable-speex,--disable-speex,speex"
> @@ -32,6 +37,11 @@ PACKAGECONFIG[vpx]        = "--enable-vpx,--disable-vpx,libvpx"
>  PACKAGECONFIG[wavpack]    = "--enable-wavpack,--disable-wavpack,wavpack"
>  PACKAGECONFIG[x11]        = "--enable-x,--disable-x,${X11DEPENDS}"
>  
> +# qt5 support is disabled, because it is not present in OE core, and requires more work than
> +# just adding a packageconfig (it requires access to moc, uic, rcc, and qmake paths).
> +# This is better done in a separate qt5 layer (which then should add a "qt5" packageconfig
> +# in a gstreamer1.0-plugins-bad bbappend).
> +
>  EXTRA_OECONF += " \
>      --enable-bz2 \

bz2 and zlib are optional and perhaps should be moved to PACKAGECONFIG
instead.

I had done a similar upgrade but was waiting for the release before
submitting:

https://github.com/anujm1/poky/commit/83204baaa9023e1514132534acbb4ec3968c1a15



