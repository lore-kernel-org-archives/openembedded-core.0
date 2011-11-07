Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RNUdb-0007MM-VN
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 20:13:44 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 07 Nov 2011 11:07:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,471,1315206000"; d="scan'208";a="87139410"
Received: from unknown (HELO [10.255.12.14]) ([10.255.12.14])
	by fmsmga002.fm.intel.com with ESMTP; 07 Nov 2011 11:07:11 -0800
Message-ID: <4EB82C5F.6020806@linux.intel.com>
Date: Mon, 07 Nov 2011 11:07:11 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CAEsOVNeWr9A+8e62+A7YxSNwWzDJsyxqmOnKh=+EqG+4L04YjA@mail.gmail.com>
	<1320251115-29360-1-git-send-email-msm@freescale.com>
In-Reply-To: <1320251115-29360-1-git-send-email-msm@freescale.com>
Cc: Matthew McClintock <msm@freescale.com>
Subject: Re: [PATCH v2] Add new IMAGE_CLASSES variable for classes for image generation
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Nov 2011 19:13:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/02/2011 09:25 AM, Matthew McClintock wrote:
> Allows us to import classes only for images and not to the global
> namespace
>
> Signed-off-by: Matthew McClintock<msm@freescale.com>
> ---
> Change IMAGE_CLASSES definition to use ?= instead of =
> so it's clear we want to override this variable. This worked
> before because the value in my distro.conf file overwrote
> this value regardless of the fact it was set with =
>
>   meta-yocto/conf/local.conf.sample |    6 ++++++
>   meta/classes/image.bbclass        |    3 ++-
>   2 files changed, 8 insertions(+), 1 deletions(-)
>
> diff --git a/meta-yocto/conf/local.conf.sample b/meta-yocto/conf/local.conf.sample
> index da3f8df..8177713 100644
> --- a/meta-yocto/conf/local.conf.sample
> +++ b/meta-yocto/conf/local.conf.sample
> @@ -163,6 +163,12 @@ EXTRA_IMAGE_FEATURES = "debug-tweaks"
>   # NOTE: mklibs also needs to be explicitly enabled for a given image, see local.conf.extended
>   USER_CLASSES ?= "image-mklibs image-prelink"
>
> +# Additional image generation features
> +#
> +# The following is a list of classes to import to use in the generation of images
> +# currently an example class is image_types_uboot
> +# IMAGE_CLASSES = " image_types_uboot"
> +
>   #
>   # Runtime testing of images
>   #

The preferred location for this advanced functionality should be the 
local.conf.sample.extended as Richard points out, please resubmit.

Thanks
	Sau!

> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 05f4331..a2770a4 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -111,7 +111,8 @@ def get_devtable_list(d):
>           str += " %s" % bb.which(bb.data.getVar('BBPATH', d, 1), devtable)
>       return str
>
> -inherit image_types
> +IMAGE_CLASSES ?= "image_types"
> +inherit ${IMAGE_CLASSES}
>
>   IMAGE_POSTPROCESS_COMMAND ?= ""
>   MACHINE_POSTPROCESS_COMMAND ?= ""


