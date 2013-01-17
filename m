Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1Tvljq-0001Nt-Ep
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 10:26:24 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 17 Jan 2013 01:09:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,484,1355126400"; d="scan'208";a="273158685"
Received: from lpalcu-linux (HELO [10.237.105.165]) ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 17 Jan 2013 01:10:57 -0800
Message-ID: <50F7C020.8090505@intel.com>
Date: Thu, 17 Jan 2013 11:10:56 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Hongxu Jia <hongxu.jia@windriver.com>
References: <cover.1358406049.git.hongxu.jia@windriver.com>
	<4dc1347ed4057656a542263878aeeadf768dd2e9.1358406049.git.hongxu.jia@windriver.com>
In-Reply-To: <4dc1347ed4057656a542263878aeeadf768dd2e9.1358406049.git.hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] gtk-icon-cache.bbclass:fix support postrm at image creation time
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
X-List-Received-Date: Thu, 17 Jan 2013 09:26:26 -0000
X-List-Received-Date: Thu, 17 Jan 2013 09:26:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 01/17/2013 09:07 AM, Hongxu Jia wrote:
>  gtk_icon_cache_postrm() {
> +if [ "$D" != "" ]; then
> +    for icondir in $D/usr/share/icons/* ; do
> +        if [ -d $icondir ] ; then
> +            gtk-update-icon-cache -qt  $icondir
> +        fi
> +    done
> +    exit 0
> +fi
I think you can just exit 0 here and let the hook in intercept-scripts
directory do the rest. The hook was added in the postinst and it will
properly call gtk-update-icon-cache. If you look in the log.do_rootfs
you'll see that the intercept scripts are run at the end (just look for
"Running intercept scripts"). So, I don't think you need to do this loop
here. Besides, it will be called for every postrm and running
gtk-update-icon-cache is not cheap...

Thanks,
Laurentiu


