Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Ud3GB-0002gX-1M
	for openembedded-core@lists.openembedded.org;
	Thu, 16 May 2013 20:50:40 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 16 May 2013 11:32:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,685,1363158000"; d="scan'208";a="303544797"
Received: from unknown (HELO [10.255.12.48]) ([10.255.12.48])
	by azsmga001.ch.intel.com with ESMTP; 16 May 2013 11:32:13 -0700
Message-ID: <5195262C.3090709@linux.intel.com>
Date: Thu, 16 May 2013 21:32:12 +0300
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Qi.Chen@windriver.com
References: <cover.1368690819.git.Qi.Chen@windriver.com>
	<d978543b3558dc8cc14379cd10506c3f0c6f2953.1368690819.git.Qi.Chen@windriver.com>
In-Reply-To: <d978543b3558dc8cc14379cd10506c3f0c6f2953.1368690819.git.Qi.Chen@windriver.com>
Cc: qingtao.cao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] image.bbclass: add postinst_enable_logging
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 May 2013 18:50:55 -0000
X-List-Received-Date: Thu, 16 May 2013 18:50:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/16/2013 10:56 AM, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> Add a function postinst_enable_logging, so that when 'debug-tweaks'
> is in IMAGE_FEATURES, we create .enable_postinst_logging under /etc,
> which is used by run-postinst scripts to determine whether to log or
> not.
>
> [YOCTO #4262]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta/classes/image.bbclass |    7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 2b42e12..fc5e23c 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -175,6 +175,8 @@ MACHINE_POSTPROCESS_COMMAND ?= ""
>   ROOTFS_POSTPROCESS_COMMAND_prepend = "run_intercept_scriptlets; "
>   # Allow dropbear/openssh to accept logins from accounts with an empty password string if debug-tweaks is enabled
>   ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("IMAGE_FEATURES", "debug-tweaks", "ssh_allow_empty_password; ", "",d)}'
> +# Enable postinst logging if debug-tweaks is enabled
> +ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("IMAGE_FEATURES", "debug-tweaks", "postinst_enable_logging; ", "",d)}'
>
>   # some default locales
>   IMAGE_LINGUAS ?= "de-de fr-fr en-gb"
> @@ -484,6 +486,11 @@ ssh_allow_empty_password () {
>   	fi
>   }
>
> +# Enable postinst logging if debug-tweaks is enabled
> +postinst_enable_logging () {
> +	touch ${IMAGE_ROOTFS}/etc/.enable_postinst_logging

I do not think this should go here, maybe better to have it in the 
/etc/default dir and named postinst, since that matches what other init
related scripts do and source the file in each postinst script, it 
should also have a standard guard to check existance of the file and 
checks something like a "ENABLED" variable instead?  This could also be 
extended for getting the log file location also.

Sau!


> +}
> +
>   # Turn any symbolic /sbin/init link into a file
>   remove_init_link () {
>   	if [ -h ${IMAGE_ROOTFS}/sbin/init ]; then
>


