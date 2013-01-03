Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TqtFT-0006S2-Tt
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Jan 2013 23:26:52 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 03 Jan 2013 14:11:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,405,1355126400"; d="scan'208";a="241801349"
Received: from unknown (HELO [10.255.14.41]) ([10.255.14.41])
	by orsmga001.jf.intel.com with ESMTP; 03 Jan 2013 14:11:30 -0800
Message-ID: <50E601F9.7010705@linux.intel.com>
Date: Thu, 03 Jan 2013 14:11:05 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Marko Lindqvist <cazfi74@gmail.com>
References: <1356662690-16034-1-git-send-email-cazfi74@gmail.com>
	<1356662690-16034-2-git-send-email-cazfi74@gmail.com>
In-Reply-To: <1356662690-16034-2-git-send-email-cazfi74@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] icu: update to upstream version 50.1.1
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
X-List-Received-Date: Thu, 03 Jan 2013 22:26:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/27/2012 06:44 PM, Marko Lindqvist wrote:
> This seems to fix HarfBuzz compile problems.
>
Just found a problem with this in my testing:

> | configure:3983: error: No such directory /home/sgw/yocto/builds/world/tmp/sysroots/x86_64-linux/usr/share/icu/50.1.1 supplied as the argument to --with-cross-build. Use an absolute path.

Seems that icu lays down a /usr/share/icu/50.1 directory, not a ${PV}, 
so this needs a little work.

I am still testing with HaftBuzz, I saw one issue with building it that 
I need to investigate further.

Sau!
> Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
> ---
>   meta/recipes-support/icu/icu_50.1.1.bb |   11 +++++++++++
>   meta/recipes-support/icu/icu_50.1.bb   |   11 -----------
>   2 files changed, 11 insertions(+), 11 deletions(-)
>   create mode 100644 meta/recipes-support/icu/icu_50.1.1.bb
>   delete mode 100644 meta/recipes-support/icu/icu_50.1.bb
>
> diff --git a/meta/recipes-support/icu/icu_50.1.1.bb b/meta/recipes-support/icu/icu_50.1.1.bb
> new file mode 100644
> index 0000000..26b086f
> --- /dev/null
> +++ b/meta/recipes-support/icu/icu_50.1.1.bb
> @@ -0,0 +1,11 @@
> +require icu.inc
> +
> +LIC_FILES_CHKSUM = "file://../license.html;md5=4ee45701e87d34303281978e3b78ecda"
> +
> +PR = "r0"
> +
> +BASE_SRC_URI = "http://download.icu-project.org/files/icu4c/${PV}/icu4c-50_1_1-src.tgz"
> +SRC_URI = "${BASE_SRC_URI}"
> +
> +SRC_URI[md5sum] = "c721c2e0c8f86975ccea620d09aedc81"
> +SRC_URI[sha256sum] = "a6f426e3c04749c74bcb9d2ce229f905de88deda2353db2249f2e96fe604df8f"
> diff --git a/meta/recipes-support/icu/icu_50.1.bb b/meta/recipes-support/icu/icu_50.1.bb
> deleted file mode 100644
> index 8f65c6d..0000000
> --- a/meta/recipes-support/icu/icu_50.1.bb
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -require icu.inc
> -
> -LIC_FILES_CHKSUM = "file://../license.html;md5=4ee45701e87d34303281978e3b78ecda"
> -
> -PR = "r1"
> -
> -BASE_SRC_URI = "http://download.icu-project.org/files/icu4c/50.1/icu4c-50_1-src.tgz"
> -SRC_URI = "${BASE_SRC_URI}"
> -
> -SRC_URI[md5sum] = "cf7bf9e56aa6c2057a8b6f464046483e"
> -SRC_URI[sha256sum] = "68592b3c07d9b86100f41d0172eb1a81f3ffb2a8fef1104d7395099079ba7350"
> \ No newline at end of file
>


