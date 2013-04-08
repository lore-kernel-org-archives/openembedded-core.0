Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UPEqC-0006al-ST
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 18:22:49 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r38G5OZM005162
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Apr 2013 09:05:24 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Mon, 8 Apr 2013 09:05:24 -0700
Message-ID: <5162EACA.7000905@windriver.com>
Date: Mon, 8 Apr 2013 11:05:30 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1365433358-29073-1-git-send-email-bogdan.a.marinescu@intel.com>
In-Reply-To: <1365433358-29073-1-git-send-email-bogdan.a.marinescu@intel.com>
Subject: Re: [PATCH] smart: disable CHANNELSDIR
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
X-List-Received-Date: Mon, 08 Apr 2013 16:22:51 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/8/13 10:02 AM, Bogdan Marinescu wrote:
> Make CHANNELSDIR in smart empty, since this causes host contamination issues
> on some RPM-based hosts on which smart is already installed.
>
> [YOCTO #3881]
>
> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> ---
>   .../python/python-smartpm/smart-channelsdir.patch  | 24 ++++++++++++++++++++++
>   .../python/python-smartpm_1.4.1.bb                 |  3 ++-
>   2 files changed, 26 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-channelsdir.patch
>
> diff --git a/meta/recipes-devtools/python/python-smartpm/smart-channelsdir.patch b/meta/recipes-devtools/python/python-smartpm/smart-channelsdir.patch
> new file mode 100644
> index 0000000..e621b33
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python-smartpm/smart-channelsdir.patch
> @@ -0,0 +1,24 @@
> +Make CHANNELSDIR in smart empty, since this causes host contamination issues
> +on some RPM-based hosts on which smart is already installed.
> +
> +[YOCTO #3881]
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +diff --git a/smart/plugins/channelsync.py b/smart/plugins/channelsync.py
> +index 3ba95ff..646d696 100644
> +--- a/smart/plugins/channelsync.py
> ++++ b/smart/plugins/channelsync.py
> +@@ -23,7 +23,11 @@ from smart.channel import *
> + from smart import *
> + import os
> +
> +-CHANNELSDIR = "/etc/smart/channels/"
> ++# For now, we leave the definition of CHANNELSDIR empty. This prevents smart
> ++# from erroneously consider the  build host's channels while setting up its
> ++# channels [YOCTO #3881]. If this feature will be used in the future, CHANNELSDIR
> ++# should be set to a proper value.
> ++CHANNELSDIR = ""

I don't remember if the channelsdir is used by default on the target or if there 
is a different directory.

Did you check if (on the target) you can still add channels and do a remove 
install/update of a package?

> +
> + def syncChannels(channelsdir, force=None):
> +
> diff --git a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
> index d92933f..001d9e4 100644
> --- a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
> +++ b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
> @@ -11,7 +11,7 @@ LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
>
>   DEPENDS = "python rpm"
> -PR = "r8"
> +PR = "r9"
>   SRCNAME = "smart"
>
>   SRC_URI = "\
> @@ -27,6 +27,7 @@ SRC_URI = "\
>             file://smart-improve-error-reporting.patch \
>             file://smart-multilib-fixes.patch \
>             file://smart-yaml-error.patch \
> +          file://smart-channelsdir.patch \
>             "
>
>   SRC_URI[md5sum] = "573ef32ba177a6b3c4bf7ef04873fcb6"
>



