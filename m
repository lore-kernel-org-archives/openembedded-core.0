Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UNPsk-0003ay-JB
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 17:45:54 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 Apr 2013 08:28:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,402,1363158000"; d="scan'208";a="313056578"
Received: from unknown (HELO [10.255.14.19]) ([10.255.14.19])
	by fmsmga001.fm.intel.com with ESMTP; 03 Apr 2013 08:28:37 -0700
Message-ID: <515C4AA5.4040501@linux.intel.com>
Date: Wed, 03 Apr 2013 08:28:37 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Qi.Chen@windriver.com
References: <cover.1364969701.git.Qi.Chen@windriver.com>
	<3d56b617bac180023326d302a14d675710d4380d.1364969701.git.Qi.Chen@windriver.com>
In-Reply-To: <3d56b617bac180023326d302a14d675710d4380d.1364969701.git.Qi.Chen@windriver.com>
Cc: qingtao.cao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] core-image-sato.bb: increase free space size
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
X-List-Received-Date: Wed, 03 Apr 2013 15:45:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/02/2013 11:16 PM, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> Sato images, by default, have about 100M free space. This is not enough
> and it blocks automatic testing.
>
> This patch fixes this problem by setting the default value of
> IMAGE_OVERHEAD_FACTOR to "2.0" in the sato image recipe.
>
We need to think hard about this one, we have a couple of conflicting 
interests here with the amount of space.

The Poky distro and core-image-sato are examples of for the community 
and developers to use, we want to set good examples where ever possible. 
One of the intentions of core-image-sato is to show a compact image with 
a graphical user interface, so having a minimal, but usable amount of 
free space is important. We don't want someone new to look at this and 
see a large image as it might put them off the project without 
understanding the tune-ability. This is an embedded environment, not a 
desktop with a large disk, we want to share that message.

Another goal of the Poky distro is to create something that is testable 
and automated testing is important part of this.  I read the bug report 
and commented on it as well.  Is there a way to clean-up after the 
tests?  Are single tests consuming the 100M available? Is it slowly 
accumulating tmp space?

What other options can we do here?  Do we need to consider a different 
image for testing?  Or build 2 images similarly one with extra space?

We need to think about the different scenarios and usage.

Thanks
	Sau!


> [YOCTO #4109]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta/recipes-sato/images/core-image-sato.bb |    4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-sato/images/core-image-sato.bb b/meta/recipes-sato/images/core-image-sato.bb
> index e3246d2..4b4e595 100644
> --- a/meta/recipes-sato/images/core-image-sato.bb
> +++ b/meta/recipes-sato/images/core-image-sato.bb
> @@ -9,3 +9,7 @@ LICENSE = "MIT"
>   inherit core-image
>
>   IMAGE_INSTALL += "packagegroup-core-x11-sato-games"
> +
> +# Increase the default value of IMAGE_OVERHEAD_FACTOR from "1.3" to "2.0"
> +# to increase the free space size in sato images.
> +IMAGE_OVERHEAD_FACTOR ?= "2.0"
>


