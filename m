Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 0E87971B86
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 07:57:11 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 8475B68A01C; Wed, 17 May 2017 08:57:11 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_20,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 200AC68A019;
	Wed, 17 May 2017 08:57:11 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id CBE6F674006F;
	Wed, 17 May 2017 09:57:10 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
References: <1495006622-39912-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <fcee47c5-415a-4b80-4ca0-9c13f7dccc27@mlbassoc.com>
Date: Wed, 17 May 2017 09:57:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1495006622-39912-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
Subject: Re: [PATCH] curl: fix error for ARMv8 32BE
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
X-List-Received-Date: Wed, 17 May 2017 07:57:12 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2017-05-17 09:37, Huang Qiyu wrote:
> curl + gnutls can not work on ARMv8 32BE, so change it to curl + ssl.
>
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-support/curl/curl_7.54.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/curl/curl_7.54.0.bb b/meta/recipes-support/curl/curl_7.54.0.bb
> index ce5ca37..2c0a395 100644
> --- a/meta/recipes-support/curl/curl_7.54.0.bb
> +++ b/meta/recipes-support/curl/curl_7.54.0.bb
> @@ -20,7 +20,7 @@ SRC_URI[sha256sum] = "f50ebaf43c507fa7cc32be4b8108fa8bbd0f5022e90794388f3c7694a3
>  CVE_PRODUCT = "libcurl"
>  inherit autotools pkgconfig binconfig multilib_header
>
> -PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} gnutls proxy zlib"
> +PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} ssl proxy zlib"
>  PACKAGECONFIG_class-native = "ipv6 proxy ssl zlib"
>  PACKAGECONFIG_class-nativesdk = "ipv6 proxy ssl zlib"
>

This seems like a pretty big change and affects all targets,
not just ARMv8/BE

Maybe ssl vs gnutls should be a PACKAGECONFIG option of its own with an
override for just ARMv8/BE?


-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

