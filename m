Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id AD4D66CEEA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2013 13:43:17 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rB2DhBN5023601; Mon, 2 Dec 2013 13:43:11 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id w4nXpl9P-Rwq; Mon,  2 Dec 2013 13:43:11 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rB2Dh4i7023592
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 2 Dec 2013 13:43:06 GMT
Message-ID: <1385991782.11222.108.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: yzhu1 <yanjun.zhu@windriver.com>
Date: Mon, 02 Dec 2013 13:43:02 +0000
In-Reply-To: <1385968413-18202-1-git-send-email-yanjun.zhu@windriver.com>
References: <1385968413-18202-1-git-send-email-yanjun.zhu@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Modify the path of env in CA.pl to make export-sdk successfully.
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
X-List-Received-Date: Mon, 02 Dec 2013 13:43:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-12-02 at 15:13 +0800, yzhu1 wrote:
> ---
>  meta/recipes-connectivity/openssl/openssl.inc |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

What is "export-sdk" and how does this break it?

I suspect what we want to do is hardcode /usr/bin/env in here for
nativesdk? We can't/don't want to assume the sdk contains perl.

Cheers,

Richard

> diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
> index 3bfe569..de10d17 100644
> --- a/meta/recipes-connectivity/openssl/openssl.inc
> +++ b/meta/recipes-connectivity/openssl/openssl.inc
> @@ -154,7 +154,7 @@ do_install () {
>  
>  	install -d ${D}${includedir}
>  	cp --dereference -R include/openssl ${D}${includedir}
> -	sed -i -e '1s,.*,#!${bindir}/env perl,' ${D}${libdir}/ssl/misc/CA.pl
> +	sed -i -e '1s,^.*$,#! ${bindir}/perl,' ${D}${libdir}/ssl/misc/CA.pl
>  
>  	oe_multilib_header openssl/opensslconf.h
>  }



