Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 64EC16D433
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 12:20:19 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAICKFCS029668; Mon, 18 Nov 2013 12:20:15 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id U4mOrkv0SVre; Mon, 18 Nov 2013 12:20:14 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAICK9x3029660
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 18 Nov 2013 12:20:11 GMT
Message-ID: <1384777206.6460.222.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "yanjun.zhu" <yanjun.zhu@windriver.com>
Date: Mon, 18 Nov 2013 12:20:06 +0000
In-Reply-To: <1384770701-30455-1-git-send-email-yanjun.zhu@windriver.com>
References: <1384770701-30455-1-git-send-email-yanjun.zhu@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pr-util: insert appropriate parameter to adapt libtool
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Nov 2013 12:20:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-11-18 at 18:31 +0800, yanjun.zhu wrote:
> When ccache is enabled, a parameter "ccache" is inserted.
> libtool can not handle this parameter correctly. So "--tag=CC"
> is introduced to help libtool handle it.
> ---
>  meta/recipes-support/apr/apr-util_1.5.2.bb |    5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/recipes-support/apr/apr-util_1.5.2.bb b/meta/recipes-support/apr/apr-util_1.5.2.bb
> index ea0f7fb..d6ae394 100644
> --- a/meta/recipes-support/apr/apr-util_1.5.2.bb
> +++ b/meta/recipes-support/apr/apr-util_1.5.2.bb
> @@ -34,6 +34,11 @@ do_configure_append() {
>  	if [ "${CLASSOVERRIDE}" = "class-target" ]; then
>  		cp ${STAGING_DATADIR}/apr/apr_rules.mk ${S}/build/rules.mk
>  	fi
> +
> +	# When ccache is enabled, libtool needs --tag=CC to choose correct handle methods.
> +	if [ -f ${S}/build/rules.mk ]; then
> +		sed -i "s,^LTFLAGS,LTFLAGS      = --silent --tag=CC\n#LTFLAGS,g" ${S}/build/rules.mk
> +	fi
>  }
>  do_configure_prepend_class-native() {
>  	cp ${STAGING_DATADIR_NATIVE}/apr/apr_rules.mk ${S}/build/rules.mk

This looks like something better done with a specific patch along with
an explanation in the patch header. Is there any reason upstream
wouldn't do this?

By using a patch we ensure that when things are upgraded, the right
thing still gets done. You may need to update the apr recipe itself to
get the patch right.

Cheers,

Richard


