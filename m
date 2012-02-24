Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S0zql-0007eF-Ss
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 19:26:36 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 24 Feb 2012 10:18:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="110466222"
Received: from unknown (HELO [10.255.15.58]) ([10.255.15.58])
	by azsmga001.ch.intel.com with ESMTP; 24 Feb 2012 10:17:57 -0800
Message-ID: <4F47D455.8030903@linux.intel.com>
Date: Fri, 24 Feb 2012 10:17:57 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1329335989-8424-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1329335989-8424-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH] wireless-tools: remove ldconfig call from install-libs
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
X-List-Received-Date: Fri, 24 Feb 2012 18:26:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/15/2012 11:59 AM, Martin Jansa wrote:
> * and drop apply=yes param as it's not needed
>
> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> ---
>   .../wireless-tools/remove.ldconfig.call.patch      |   19 +++++++++++++++++++
>   .../wireless-tools/wireless-tools_29.bb            |    5 +++--
>   2 files changed, 22 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-connectivity/wireless-tools/wireless-tools/remove.ldconfig.call.patch
>
> diff --git a/meta/recipes-connectivity/wireless-tools/wireless-tools/remove.ldconfig.call.patch b/meta/recipes-connectivity/wireless-tools/wireless-tools/remove.ldconfig.call.patch
> new file mode 100644
> index 0000000..3a22c3f
> --- /dev/null
> +++ b/meta/recipes-connectivity/wireless-tools/wireless-tools/remove.ldconfig.call.patch
> @@ -0,0 +1,19 @@
> +When /etc/ld.so.cache is writeable by user running bitbake then it creates invalid cache
> +(in my case libstdc++.so cannot be found after building zlib(-native) and I have to call
> +touch */libstdc++.so&&  /sbin/ldconfig to fix it.
> +
> +So remove ldconfig call from make install-libs
> +
> +Upstream-Status: Inappropriate [disable feature]
> +
> +diff -uNr wireless_tools.29.orig/Makefile wireless_tools.29/Makefile
> +--- wireless_tools.29.orig/Makefile	2007-09-18 01:56:46.000000000 +0200
> ++++ wireless_tools.29/Makefile	2012-02-15 20:46:41.780763514 +0100
> +@@ -163,7 +163,6 @@
> + 	install -m 755 $(DYNAMIC) $(INSTALL_LIB)
> + 	ln -sfn $(DYNAMIC) $(INSTALL_LIB)/$(DYNAMIC_LINK)
> + 	@echo "*** Don't forget to add $(INSTALL_LIB) to /etc/ld.so.conf, and run ldconfig as root. ***"
> +-	@$(LDCONFIG) || echo "*** Could not run ldconfig ! ***"
> +
> + # Install the static library
> + install-static:: $(STATIC)
> diff --git a/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb b/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb
> index cc51dec..c6235d6 100644
> --- a/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb
> +++ b/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb
> @@ -7,10 +7,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
>   			file://sample_enc.c;beginline=1;endline=4;md5=838372be07874260b566bae2f6ed33b6"
>   SECTION = "base"
>   PE = "1"
> -PR = "r2"
> +PR = "r3"
>
>   SRC_URI = "http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux/wireless_tools.29.tar.gz \
> -           file://man.patch;apply=yes \
> +	   file://remove.ldconfig.call.patch \
> +	   file://man.patch \
>   	   file://wireless-tools.if-pre-up \
>   	   file://zzz-wireless.if-pre-up \
>   	   file://avoid_strip.patch"

Merged into OE-core

Thanks
	Sau!


