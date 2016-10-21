Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 93A5371A58
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2016 14:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 916073184A99;
	Fri, 21 Oct 2016 16:01:12 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id a2P-VwlHLdnv; Fri, 21 Oct 2016 16:01:08 +0200 (CEST)
Received: from [172.22.22.61] (55d475bb.access.ecotel.net [85.212.117.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 82E6731849BB;
	Fri, 21 Oct 2016 16:01:08 +0200 (CEST)
To: jackie.huang@windriver.com
References: <cover.1476345470.git.jackie.huang@windriver.com>
	<07b4065b12f5cf9dfe816e7cdb68a5e7d83e04c0.1476345470.git.jackie.huang@windriver.com>
From: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <5c605407-d802-456e-a876-317cefaef461@opendreambox.org>
Date: Fri, 21 Oct 2016 16:01:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <07b4065b12f5cf9dfe816e7cdb68a5e7d83e04c0.1476345470.git.jackie.huang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] ppp: fix building with linux-4.8
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
X-List-Received-Date: Fri, 21 Oct 2016 14:01:12 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Dear Jackie,

this patch broke compilation with linux-libc-headers 4.4, present in
morty, due to use of incomplete types.

Regards,
Andreas


On 14.10.2016 02:50, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
> 
> Fix a build error when using the linux-4.8 headers that results in:
> 
> In file included from pppoe.h:87:0,
>                  from plugin.c:29:
> ../usr/include/netinet/in.h:211:8: note: originally defined here
>  struct in6_addr
>         ^~~~~~~~
> In file included from ../usr/include/linux/if_pppol2tp.h:20:0,
>                  from ../usr/include/linux/if_pppox.h:26,
>                  from plugin.c:52:
> ../usr/include/linux/in6.h:49:8: error: redefinition of 'struct sockaddr_in6'
>  struct sockaddr_in6 {
>         ^~~~~~~~~~~~
> 
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  .../ppp/ppp/ppp-fix-building-with-linux-4.8.patch  | 44 ++++++++++++++++++++++
>  meta/recipes-connectivity/ppp/ppp_2.4.7.bb         |  1 +
>  2 files changed, 45 insertions(+)
>  create mode 100644 meta/recipes-connectivity/ppp/ppp/ppp-fix-building-with-linux-4.8.patch
> 
> diff --git a/meta/recipes-connectivity/ppp/ppp/ppp-fix-building-with-linux-4.8.patch b/meta/recipes-connectivity/ppp/ppp/ppp-fix-building-with-linux-4.8.patch
> new file mode 100644
> index 0000000..f77b0de
> --- /dev/null
> +++ b/meta/recipes-connectivity/ppp/ppp/ppp-fix-building-with-linux-4.8.patch
> @@ -0,0 +1,44 @@
> +From 3da19af53e2eee2e77b456cfbb9d633b06656d38 Mon Sep 17 00:00:00 2001
> +From: Jackie Huang <jackie.huang@windriver.com>
> +Date: Thu, 13 Oct 2016 13:41:43 +0800
> +Subject: [PATCH] ppp: fix building with linux-4.8
> +
> +Fix a build error when using the linux-4.8 headers that results in:
> +
> +In file included from pppoe.h:87:0,
> +                 from plugin.c:29:
> +../usr/include/netinet/in.h:211:8: note: originally defined here
> + struct in6_addr
> +        ^~~~~~~~
> +In file included from ../usr/include/linux/if_pppol2tp.h:20:0,
> +                 from ../usr/include/linux/if_pppox.h:26,
> +                 from plugin.c:52:
> +../usr/include/linux/in6.h:49:8: error: redefinition of 'struct sockaddr_in6'
> + struct sockaddr_in6 {
> +        ^~~~~~~~~~~~
> +
> +Upstream-Status: Submitted [1]
> +
> +[1] https://github.com/paulusmack/ppp/pull/69
> +
> +Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> +---
> + pppd/plugins/rp-pppoe/pppoe.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/pppd/plugins/rp-pppoe/pppoe.h b/pppd/plugins/rp-pppoe/pppoe.h
> +index 9ab2eee..96d2794 100644
> +--- a/pppd/plugins/rp-pppoe/pppoe.h
> ++++ b/pppd/plugins/rp-pppoe/pppoe.h
> +@@ -84,7 +84,7 @@ typedef unsigned long UINT32_t;
> + #include <linux/if_ether.h>
> + #endif
> + 
> +-#include <netinet/in.h>
> ++#include <linux/in.h>
> + 
> + #ifdef HAVE_NETINET_IF_ETHER_H
> + #include <sys/types.h>
> +-- 
> +2.8.3
> +
> diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
> index 4437b5c..56dbd98 100644
> --- a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
> +++ b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
> @@ -30,6 +30,7 @@ SRC_URI = "http://ppp.samba.org/ftp/ppp/ppp-${PV}.tar.gz \
>             file://0001-ppp-Fix-compilation-errors-in-Makefile.patch \
>             file://ppp@.service \
>             file://fix-CVE-2015-3310.patch \
> +           file://ppp-fix-building-with-linux-4.8.patch \
>  "
>  
>  SRC_URI_append_libc-musl = "\
> 


