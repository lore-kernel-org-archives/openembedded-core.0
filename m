Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.553.1584999167234562582
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2020 14:32:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9535940BFD;
	Mon, 23 Mar 2020 21:32:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O-PTezD3ue6P; Mon, 23 Mar 2020 21:32:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1197040BEF;
	Mon, 23 Mar 2020 21:32:45 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C24201718E5; Mon, 23 Mar 2020 17:32:44 -0400 (EDT)
Date: Mon, 23 Mar 2020 17:32:44 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Sakib Sajal <sakib.sajal@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] libpng: Fix CVE-2019-6129
Message-ID: <20200323213244.GV1578@denix.org>
References: <20200323212823.104190-1-sakib.sajal@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20200323212823.104190-1-sakib.sajal@windriver.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Is this v2? Should say so in the subject. Also, should mention the changes 
from v1 under the commit log.


On Mon, Mar 23, 2020 at 02:28:23PM -0700, Sakib Sajal wrote:
> Fix memory leak in png_create_info_struct.
> 
> Upstream-Status: Submitted [https://github.com/glennrp/libpng/pull/293]

BTW, Upstream-Status: should be in the patch, not in the commit log.


> CVE: CVE-2019-6129
> 
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  .../libpng/0001-Repair-of-CVE-2019-6129.patch | 27 +++++++++++++++++++
>  .../libpng/libpng_1.6.37.bb                   |  5 +++-
>  2 files changed, 31 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-multimedia/libpng/libpng/0001-Repair-of-CVE-2019-6129.patch
> 
> diff --git a/meta/recipes-multimedia/libpng/libpng/0001-Repair-of-CVE-2019-6129.patch b/meta/recipes-multimedia/libpng/libpng/0001-Repair-of-CVE-2019-6129.patch
> new file mode 100644
> index 0000000000..1bb2da1984
> --- /dev/null
> +++ b/meta/recipes-multimedia/libpng/libpng/0001-Repair-of-CVE-2019-6129.patch
> @@ -0,0 +1,27 @@
> +From ed73b082d0296c6181f2ac11e8dd78e8f7c6d66b Mon Sep 17 00:00:00 2001
> +From: tangyaofang <tangyaofang6666@163.com>
> +Date: Mon, 10 Jun 2019 11:30:15 +0800
> +Subject: [PATCH] Repair of CVE-2019-6129
> +
> +CVE: CVE-2019-6129
> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> +---
> + contrib/tools/pngcp.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/contrib/tools/pngcp.c b/contrib/tools/pngcp.c
> +index 16d4e7f4d..a02d5b7ff 100644
> +--- a/contrib/tools/pngcp.c
> ++++ b/contrib/tools/pngcp.c
> +@@ -506,7 +506,7 @@ static void
> + display_clean_read(struct display *dp)
> + {
> +    if (dp->read_pp != NULL)
> +-      png_destroy_read_struct(&dp->read_pp, NULL, NULL);
> ++      png_destroy_read_struct(&dp->read_pp, (dp->ip!=NULL ? &dp->ip : NULL), NULL);
> + 
> +    if (dp->fp != NULL)
> +    {
> +-- 
> +2.20.1
> +
> diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.37.bb b/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
> index 8c53d11642..f33b942cd7 100644
> --- a/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
> +++ b/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
> @@ -7,7 +7,10 @@ DEPENDS = "zlib"
>  
>  LIBV = "16"
>  
> -SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz"
> +SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz \
> +           file://0001-Repair-of-CVE-2019-6129.patch \
> +          "
> +
>  SRC_URI[md5sum] = "015e8e15db1eecde5f2eb9eb5b6e59e9"
>  SRC_URI[sha256sum] = "505e70834d35383537b6491e7ae8641f1a4bed1876dbfe361201fc80868d88ca"
>  
> -- 
> 2.24.1
> 

> 

