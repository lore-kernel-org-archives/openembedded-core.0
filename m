Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TgKuF-00039r-5v
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 20:45:35 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 05 Dec 2012 11:30:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,224,1355126400"; d="scan'208";a="229437469"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.117])
	by orsmga001.jf.intel.com with ESMTP; 05 Dec 2012 11:30:53 -0800
Message-ID: <50BFA0ED.2030303@linux.intel.com>
Date: Wed, 05 Dec 2012 11:30:53 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Ming Liu <ming.liu@windriver.com>
References: <1354694264-23741-1-git-send-email-ming.liu@windriver.com>
In-Reply-To: <1354694264-23741-1-git-send-email-ming.liu@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V1] initscripts/urandom: create directory before staging into it
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
X-List-Received-Date: Wed, 05 Dec 2012 19:45:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/04/2012 11:57 PM, Ming Liu wrote:
> /etc/init.d/urandom fails to start/stop because it tries to save
> random-seed into /var/lib/urandom folder which does not exist in the
> file system.
>
> Fixed by creating /var/lib/urandom at do_install time.
>
> Signed-off-by: Ming Liu <ming.liu@windriver.com>
> ---
>   meta/recipes-core/initscripts/initscripts_1.0.bb | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
> index d25838b..39be9a8 100644
> --- a/meta/recipes-core/initscripts/initscripts_1.0.bb
> +++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
> @@ -3,7 +3,7 @@ DESCRIPTION = "Initscripts provide the basic system startup initialization scrip
>   SECTION = "base"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
> -PR = "r137"
> +PR = "r138"
>
>   INHIBIT_DEFAULT_DEPS = "1"
>
> @@ -133,4 +133,6 @@ do_install () {
>   	fi
>
>   	install -m 0755		${WORKDIR}/device_table.txt		${D}${sysconfdir}/device_table
> +	# Holds state information pertaining to urandom
> +	install -d ${D}/var/lib/urandom

I thought this would go in volatiles, not here.

Sau!

>   }
>


