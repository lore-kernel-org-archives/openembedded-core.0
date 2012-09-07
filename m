Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TA1g1-0003Fj-4j
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Sep 2012 18:45:05 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q87GWcUY017788
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Sep 2012 09:32:38 -0700 (PDT)
Received: from msp-dhcp24.wrs.com (172.25.34.24) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Fri, 7 Sep 2012 09:32:37 -0700
Message-ID: <504A21A5.7000309@windriver.com>
Date: Fri, 7 Sep 2012 11:32:37 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120824 Thunderbird/15.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1347033943.8619.0.camel@ted>
In-Reply-To: <1347033943.8619.0.camel@ted>
Subject: Re: [PATCH] autotools.bbclass: Add functionality to force a distclean when reconfiguring
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
X-List-Received-Date: Fri, 07 Sep 2012 16:45:05 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

I'm curious, is there any [easy] way we can force a rerun of configure as a test 
pass over the system?

I'd like a way to verify that both this patch works as expected, and future 
recipes work as expected.  (It would also be nice to test the things that don't 
use the autotools.bbclass..)

--Mark

On 9/7/12 11:05 AM, Richard Purdie wrote:
> Unfortunately whilst reruning configure and make against a project will mostly
> work there are situations where it does not correctly do the right thing.
>
> In particular, eglibc and gcc will fail out with errors where settings
> do not match a previously built configuration. It could be argued they are
> broken but the situation is what it is. There is the possibility of more subtle
> errors too.
>
> This patch adds a "make distclean" call to recipes where configure is
> rerunning and the sstate checksum for do_configure has changed. We could
> simply use a stamp but saving out the previous configuration checksum
> adds some data at no real overhead.
>
> If we find there are things out there which don't have a "distclean" target,
> we can disable this behaviour with CONFIGURESTAMPFILE = "" in the recipe,
> or users could disable it globally.
>
> [YOCTO #2774]
> [YOCTO #2848]
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
> index 4c4bf87..1ab2e0c 100644
> --- a/meta/classes/autotools.bbclass
> +++ b/meta/classes/autotools.bbclass
> @@ -89,7 +89,16 @@ oe_runconf () {
>
>   AUTOTOOLS_AUXDIR ?= "${S}"
>
> +CONFIGURESTAMPFILE = "${WORKDIR}/configure.sstate"
> +
>   autotools_do_configure() {
> +	if [ -n "${CONFIGURESTAMPFILE}" -a -e "${CONFIGURESTAMPFILE}" ]; then
> +		if [ "`cat ${CONFIGURESTAMPFILE}`" != "${BB_TASKHASH}" ]; then
> +			echo "Previously configured build detected, running make distclean"
> +			oe_runmake distclean
> +		fi
> +	fi
> +
>   	case ${PN} in
>   	autoconf*)
>   	;;
> @@ -180,6 +189,9 @@ autotools_do_configure() {
>   	else
>   		bbnote "nothing to configure"
>   	fi
> +	if [ -n "${CONFIGURESTAMPFILE}" ]; then
> +		echo ${BB_TASKHASH} > ${CONFIGURESTAMPFILE}
> +	fi
>   }
>
>   autotools_do_install() {
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



