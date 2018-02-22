Return-Path: <anuj.mittal@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D43D278622
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 05:49:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Feb 2018 21:49:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,377,1515484800"; d="scan'208";a="20180571"
Received: from anmitta2-mobl1.png.intel.com (HELO [10.221.20.193])
	([10.221.20.193])
	by orsmga006.jf.intel.com with ESMTP; 21 Feb 2018 21:49:47 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org, raj.khem@gmail.com
References: <1519278352-5224-1-git-send-email-anuj.mittal@intel.com>
	<1519278352-5224-3-git-send-email-anuj.mittal@intel.com>
Message-ID: <213a5a1b-9912-3f0e-de29-7471243e0113@intel.com>
Date: Thu, 22 Feb 2018 13:49:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1519278352-5224-3-git-send-email-anuj.mittal@intel.com>
Subject: Re: [PATCH 3/3] gstreamer-rtsp-server: remove unnecessary dependencies
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
X-List-Received-Date: Thu, 22 Feb 2018 05:49:48 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Khem,

On 02/22/2018 01:45 PM, Anuj Mittal wrote:
> libcheck dep was removed from gst-rtsp-server some time back [1].
> 
> Disable building of examples and remove dep on libcgroup which
> was needed, if present, to build only one specific example.
> 
> Make building of tests optional.
> 
> [1] https://cgit.freedesktop.org/gstreamer/gst-rtsp-server/commit?id=43ec4e7c786227b85aec06599c3955626e241a01
> 
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>  meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
> index 70e90b8..938e919 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
> @@ -3,7 +3,7 @@ HOMEPAGE = "http://cgit.freedesktop.org/gstreamer/gst-rtsp-server/"
>  SECTION = "multimedia"
>  LICENSE = "LGPLv2"
>  
> -DEPENDS = "gstreamer1.0 libcgroup gstreamer1.0-plugins-base libcheck"
> +DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base"

I noticed that you had explicitly added a dependency on libcheck some
time back.

http://git.openembedded.org/openembedded-core/commit/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc?id=13164cc3c040eca3ffc0feb82ad707c363a57f07

Do you by any chance remember what was the error? I may have overlooked
something.

Thanks,
Anuj

>  
>  PNREAL = "gst-rtsp-server"
>  
> @@ -16,6 +16,11 @@ S = "${WORKDIR}/${PNREAL}-${PV}"
>  
>  inherit autotools pkgconfig upstream-version-is-even gobject-introspection gtk-doc
>  
> +PACKAGECONFIG ??= ""
> +PACKAGECONFIG[tests] = "--enable-tests,--disable-tests"
> +
> +EXTRA_OECONF = "--disable-examples"
> +
>  # Starting with 1.8.0 gst-rtsp-server includes dependency-less plugins as well
>  LIBV = "1.0"
>  require gst-plugins-package.inc
> @@ -26,4 +31,3 @@ delete_pkg_m4_file() {
>  }
>  
>  do_configure[prefuncs] += " delete_pkg_m4_file"
> -
> 


