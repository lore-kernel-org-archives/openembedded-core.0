Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id B515D6DEE2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Dec 2013 12:14:47 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rB3CEVYM006486; Tue, 3 Dec 2013 12:14:31 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id BZ4nGkxmh3JR; Tue,  3 Dec 2013 12:14:30 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rB3CENsw006478
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 3 Dec 2013 12:14:25 GMT
Message-ID: <1386072858.4463.42.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Hongxu Jia <hongxu.jia@windriver.com>
Date: Tue, 03 Dec 2013 12:14:18 +0000
In-Reply-To: <837855b3a50fc0672000e2419763a8c6ad062ae3.1386066250.git.hongxu.jia@windriver.com>
References: <cover.1386066249.git.hongxu.jia@windriver.com>
	<837855b3a50fc0672000e2419763a8c6ad062ae3.1386066250.git.hongxu.jia@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] eglibc-locale.inc: use nativesdk override with the PACKAGES_DYNAMIC statement
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
X-List-Received-Date: Tue, 03 Dec 2013 12:14:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-12-03 at 18:27 +0800, Hongxu Jia wrote:
> While compiling nativesdk-mtools, there was failure:
> ...
> Nothing PROVIDES 'nativesdk-glibc-gconv-ibm850'. Close matches:
> ...
> 
> Using nativesdk override with the PACKAGES_DYNAMIC statement fixed this issue.
> 
> [YOCTO #5623]
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/recipes-core/eglibc/eglibc-locale.inc | 6 ++++++
>  1 file changed, 6 insertions(+)

No.

lib/oe/classextend.py has a map_regexp_variable() function which is
called from classes/multilib.bbclass:

clsextend.map_regexp_variable("PACKAGES_DYNAMIC")

Perhaps such a line should be added to nativesdk.bbclass to fix this
properly instead?

Cheers,

Richard

> diff --git a/meta/recipes-core/eglibc/eglibc-locale.inc b/meta/recipes-core/eglibc/eglibc-locale.inc
> index 83569da..5e256a5 100644
> --- a/meta/recipes-core/eglibc/eglibc-locale.inc
> +++ b/meta/recipes-core/eglibc/eglibc-locale.inc
> @@ -35,6 +35,12 @@ PACKAGES_DYNAMIC = "^locale-base-.* \
>                      ^eglibc-gconv-.* ^eglibc-charmap-.* ^eglibc-localedata-.* ^eglibc-binary-localedata-.* \
>                      ^glibc-gconv-.*  ^glibc-charmap-.*  ^glibc-localedata-.*  ^glibc-binary-localedata-.*"
>  
> +PACKAGES_DYNAMIC_class-nativesdk = "^nativesdk-locale-base-.* \
> +                    ^nativesdk-eglibc-gconv-.* ^nativesdk-eglibc-charmap-.* \
> +                    ^nativesdk-eglibc-localedata-.* ^nativesdk-eglibc-binary-localedata-.* \
> +                    ^nativesdk-glibc-gconv-.*  ^nativesdk-glibc-charmap-.*  \
> +                    ^nativesdk-glibc-localedata-.*  ^nativesdk-glibc-binary-localedata-.*"
> +
>  # Create a eglibc-binaries package
>  ALLOW_EMPTY_${BPN}-binaries = "1"
>  PACKAGES += "${BPN}-binaries"



