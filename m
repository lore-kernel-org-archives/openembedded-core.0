Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RNum7-0005q9-HA
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 00:08:15 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 08 Nov 2011 15:01:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,479,1315206000"; d="scan'208";a="34658324"
Received: from unknown (HELO [10.255.12.14]) ([10.255.12.14])
	by AZSMGA002.ch.intel.com with ESMTP; 08 Nov 2011 15:01:59 -0800
Message-ID: <4EB9B4E7.7070503@linux.intel.com>
Date: Tue, 08 Nov 2011 15:01:59 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4EB82C5F.6020806@linux.intel.com>
	<1320693604-24998-1-git-send-email-msm@freescale.com>
In-Reply-To: <1320693604-24998-1-git-send-email-msm@freescale.com>
Cc: Matthew McClintock <msm@freescale.com>
Subject: Re: [PATCH v3] Add new IMAGE_CLASSES variable for classes for image generation
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
X-List-Received-Date: Tue, 08 Nov 2011 23:08:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/07/2011 11:20 AM, Matthew McClintock wrote:
> Allows us to import classes only for images and not to the global
> namespace
>
> Signed-off-by: Matthew McClintock<msm@freescale.com>
> ---
>
> v2: Change IMAGE_CLASSES definition to use ?= instead of =
> so it's clear we want to override this variable. This worked
> before because the value in my distro.conf file overwrote
> this value regardless of the fact it was set with =
>
> v3: Move documentation to local.conf.sample.extended
>
>   meta-yocto/conf/local.conf.sample.extended |    6 ++++++
>   meta/classes/image.bbclass                 |    3 ++-
>   2 files changed, 8 insertions(+), 1 deletions(-)
>
> diff --git a/meta-yocto/conf/local.conf.sample.extended b/meta-yocto/conf/local.conf.sample.extended
> index 0c3197d..e9935ce 100644
> --- a/meta-yocto/conf/local.conf.sample.extended
> +++ b/meta-yocto/conf/local.conf.sample.extended
> @@ -114,3 +114,9 @@
>   # The network based PR service host and port
>   #PRSERV_HOST = "localhost"
>   #PRSERV_PORT = "8585"
> +
> +# Additional image generation features
> +#
> +# The following is a list of classes to import to use in the generation of images
> +# currently an example class is image_types_uboot
> +# IMAGE_CLASSES = " image_types_uboot"
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

Merged to OE-Core

Thanks
	Sau!


