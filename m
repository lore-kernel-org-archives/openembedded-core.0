Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1U58x1-0007SP-Q0
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 07:02:44 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 11 Feb 2013 21:46:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,647,1355126400"; d="scan'208";a="255751401"
Received: from unknown (HELO [10.255.12.192]) ([10.255.12.192])
	by azsmga001.ch.intel.com with ESMTP; 11 Feb 2013 21:46:31 -0800
Message-ID: <5119D737.3000309@linux.intel.com>
Date: Mon, 11 Feb 2013 21:46:31 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
References: <cover.1360079373.git.rep.dot.nop@gmail.com>
	<c4bfd1da6209da458cb0944a719801346f300dd9.1360079373.git.rep.dot.nop@gmail.com>
In-Reply-To: <c4bfd1da6209da458cb0944a719801346f300dd9.1360079373.git.rep.dot.nop@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/8] busybox: add ifup's ifstate dir to package
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
X-List-Received-Date: Tue, 12 Feb 2013 06:02:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/05/2013 07:55 AM, Bernhard Reutner-Fischer wrote:
> ifupdown stores its ifstate into CONFIG_IFIPDOWN_IFSTATE_PATH.
> Fixes:
> ifup: can't open '/var/run/ifstate': No such file or directory
>
> Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ---
>   meta/recipes-core/busybox/busybox.inc |    4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
> index 972e7d0..972df6d 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -199,6 +199,10 @@ do_install () {
>                          install -m 644 ${WORKDIR}/mdev.conf ${D}${sysconfdir}/mdev.conf
>                  fi
>   	fi
> +	IFUPDOWN_IFSTATE_PATH=`awk '/^CONFIG_IFUPDOWN_IFSTATE_PATH/{split($0,x,/=/);p=x[2];gsub("\"","",p);print p;}' ${WORKDIR}/defconfig`
> +	if test -n "$IFUPDOWN_IFSTATE_PATH"; then
Should this also be ${D} in the test, other wise you might be testing 
the host!


Sau!

> +		install -m 0755 -d ${D}/"$IFUPDOWN_IFSTATE_PATH"
> +	fi
>   	install -m 0644 ${S}/busybox.links ${D}${sysconfdir}
>   }
>
>


