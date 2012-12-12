Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TibgZ-0001HN-MB
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Dec 2012 03:04:38 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 11 Dec 2012 17:50:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,263,1355126400"; d="scan'208";a="262731655"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.105])
	by fmsmga002.fm.intel.com with ESMTP; 11 Dec 2012 17:50:01 -0800
Message-ID: <50C7E2C9.3010100@linux.intel.com>
Date: Tue, 11 Dec 2012 17:50:01 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1355224219-16454-1-git-send-email-Martin.Jansa@gmail.com>
	<1355224219-16454-2-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1355224219-16454-2-git-send-email-Martin.Jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] autotools: copy also remove-potcdate.sin from ${STAGING_DATADIR_NATIVE}/gettext/po
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
X-List-Received-Date: Wed, 12 Dec 2012 02:04:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/11/2012 03:10 AM, Martin Jansa wrote:
> * some packages (e.g. uptime, cpu, forecasts, news from meta-efl)
>    don't have remove-potcdate.sin in po subdirectory, but Makefile.in.in
>    supplied by autotools.bbclass depends on it and fails without like this:
>    | make[3]: Entering directory `/OE/shr-core/tmp-eglibc/work/x86_64-oe-linux/uptime/0.0.2+svnr80477-r0.0/E-MODULES-EXTRA/uptime/po'
>    | make[3]: *** No rule to make target `remove-potcdate.sin', needed by `remove-potcdate.sed'.  Stop.
>    | make[3]: Leaving directory `/OE/shr-core/tmp-eglibc/work/x86_64-oe-linux/uptime/0.0.2+svnr80477-r0.0/E-MODULES-EXTRA/uptime/po'
>    | make[2]: *** [uptime.pot] Error 2
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   meta/classes/autotools.bbclass | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
> index ca981ec..3154435 100644
> --- a/meta/classes/autotools.bbclass
> +++ b/meta/classes/autotools.bbclass
> @@ -193,6 +193,7 @@ autotools_do_configure() {
>   				cp ${STAGING_DATADIR_NATIVE}/gettext/config.rpath ${AUTOTOOLS_AUXDIR}/
>   				if [ -d ${S}/po/ ]; then
>   					cp ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in ${S}/po/
> +					cp ${STAGING_DATADIR_NATIVE}/gettext/po/remove-potcdate.sin ${S}/po/
>   				fi
>   				for i in gettext.m4 iconv.m4 lib-ld.m4 lib-link.m4 lib-prefix.m4 nls.m4 po.m4 progtest.m4; do
>   					for j in `find ${S} -name $i | grep -v aclocal-copy`; do
>
This patch seems to have an adverse affect on a number of other packages 
some how. I saw a number patch failures and configure failures with this 
patch.

See the Autobuilder for examples.

http://autobuilder.yoctoproject.org:8010/builders/nightly-x86/builds/830/steps/shell_29/logs/stdio


Sau!



