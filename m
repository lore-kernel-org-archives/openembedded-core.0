Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UChJD-0002do-LG
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Mar 2013 03:08:52 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r251qOM1006577
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Mar 2013 17:52:24 -0800 (PST)
Received: from Marks-MacBook-Pro.local (147.11.118.211) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Mon, 4 Mar 2013 17:52:22 -0800
Message-ID: <51354FD3.5040206@windriver.com>
Date: Mon, 4 Mar 2013 19:52:19 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130216 Thunderbird/17.0.3
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1362419021.29587.44.camel@ted>
In-Reply-To: <1362419021.29587.44.camel@ted>
Subject: Re: [PATCH] populate_sdk_base/image: Fix races for variable mappings
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
X-List-Received-Date: Tue, 05 Mar 2013 02:08:52 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 3/4/13 11:43 AM, Richard Purdie wrote:
> When using the -c populate_sdk option, images are not generated quite as
> they should be under certain circumstances. For example the dropbear
> feature may not get replaced with openssh, leading to both being installed
> with an appropriate rootfs failure.
>
> This patch moves the remapping logic to later points in the code, ensuring
> there is no conflict. The result is slightly simpler too as an added bonus.
>
> [YOCTO #3749]

Just an FYI, I verified this corrects the reported issue with the 
core-image-sato-sdk as indicated in the defect.

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>

> ---
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 19564d8..68bd342 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -117,6 +117,10 @@ python () {
>
>       d.setVar('IMAGE_FEATURES', ' '.join(list(remain_features)))
>
> +    if d.getVar('BB_WORKERCONTEXT', True) is not None:
> +        runtime_mapping_rename("PACKAGE_INSTALL", d)
> +        runtime_mapping_rename("PACKAGE_INSTALL_ATTEMPTONLY", d)
> +
>       # Ensure we have the vendor list for complementary package handling
>       ml_vendor_list = ""
>       multilibs = d.getVar('MULTILIBS', True) or ""
> @@ -129,19 +133,6 @@ python () {
>       d.setVar('MULTILIB_VENDORS', ml_vendor_list)
>   }
>
> -python image_handler () {
> -    if not isinstance(e, bb.event.RecipeParsed):
> -        return
> -
> -    # If we don't do this we try and run the mapping hooks while parsing which is slow
> -    # bitbake should really provide something to let us know this...
> -    if e.data.getVar('BB_WORKERCONTEXT', True) is not None:
> -        runtime_mapping_rename("PACKAGE_INSTALL", e.data)
> -        runtime_mapping_rename("PACKAGE_INSTALL_ATTEMPTONLY", e.data)
> -
> -}
> -addhandler image_handler
> -
>   #
>   # Get a list of files containing device tables to create.
>   # * IMAGE_DEVICE_TABLE is the old name to an absolute path to a device table file
> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
> index 88de1e4..7af2d2e 100644
> --- a/meta/classes/populate_sdk_base.bbclass
> +++ b/meta/classes/populate_sdk_base.bbclass
> @@ -29,14 +29,9 @@ EXCLUDE_FROM_WORLD = "1"
>
>   SDK_PACKAGING_FUNC ?= "create_shar"
>
> -python () {
> -    # If we don't do this we try and run the mapping hooks while parsing which is slow
> -    # bitbake should really provide something to let us know this...
> -    if bb.data.getVar('BB_WORKERCONTEXT', d, True) is not None:
> -        runtime_mapping_rename("TOOLCHAIN_TARGET_TASK", d)
> -}
> -
>   fakeroot python do_populate_sdk() {
> +    runtime_mapping_rename("TOOLCHAIN_TARGET_TASK", d)
> +
>       bb.build.exec_func("populate_sdk_image", d)
>
>       # Handle multilibs in the SDK environment, siteconfig, etc files...
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



