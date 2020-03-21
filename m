Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.2461.1584761507855433954
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2020 20:31:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: randy.macleod@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 02L3VlHu021816
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2020 20:31:47 -0700 (PDT)
Received: from [172.25.44.3] (172.25.44.3) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 20 Mar
 2020 20:31:46 -0700
Subject: Re: [OE-core] [PATCH] nfs-utils: fix do_package error when enable PACKAGECONFIG[nfsv4]
To: Yi Zhao <yi.zhao@windriver.com>,
        <openembedded-core@lists.openembedded.org>
References: <20200311033819.15438-1-yi.zhao@windriver.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <b3401922-d841-9e13-6929-a3eb6149bf44@windriver.com>
Date: Fri, 20 Mar 2020 23:31:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200311033819.15438-1-yi.zhao@windriver.com>
X-Originating-IP: [172.25.44.3]
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

On 2020-03-10 11:38 p.m., Yi Zhao wrote:
> Fixes:
> ERROR: nfs-utils-2.4.3-r0 do_package: QA Issue: nfs-utils:
> Files/directories were installed but not shipped in any package:
> /usr/lib/libnfsidmap/nsswitch.so
> /usr/lib/libnfsidmap/static.so
> Please set FILES such that these items are packaged. Alternatively if
> they are unneeded, avoid installing them or delete them within do_install.
> nfs-utils: 2 installed and not shipped files. [installed-vs-shipped]
> 
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>   meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.3.bb | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.3.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.3.bb
> index 42a4ba3dbd..9bdb6f4ae4 100644
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.3.bb
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.3.bb
> @@ -67,9 +67,9 @@ PACKAGECONFIG_remove_libc-musl = "tcp-wrappers"
>   PACKAGECONFIG[tcp-wrappers] = "--with-tcp-wrappers,--without-tcp-wrappers,tcp-wrappers"
>   PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
>   # libdevmapper is available in meta-oe

> -PACKAGECONFIG[nfsv41] = "--enable-nfsv41,--disable-nfsv41,libdevmapper"
> -# keyutils is available in meta-security
> -PACKAGECONFIG[nfsv4] = "--enable-nfsv4,--disable-nfsv4,keyutils"

> +PACKAGECONFIG[nfsv41] = "--enable-nfsv41,--disable-nfsv41,libdevmapper,libdevmapper"

Did you really mean to have libdevmapper twice?
If so, why not make it a mandatory DEPENDS?

> +# keyutils is available in meta-oe
> +PACKAGECONFIG[nfsv4] = "--enable-nfsv4,--disable-nfsv4,keyutils,python3-core"

Why? This change wasn't explained in the long log.

The rest seems fine, v2 please.

../Randy

>   
>   PACKAGES =+ "${PN}-client ${PN}-mount ${PN}-stats"
>   
> @@ -94,7 +94,9 @@ FILES_${PN}-mount = "${base_sbindir}/*mount.nfs*"
>   FILES_${PN}-stats = "${sbindir}/mountstats ${sbindir}/nfsiostat"
>   RDEPENDS_${PN}-stats = "python3-core"
>   
> -FILES_${PN} += "${systemd_unitdir}"
> +FILES_${PN}-staticdev += "${libdir}/libnfsidmap/*.a"
> +
> +FILES_${PN} += "${systemd_unitdir} ${libdir}/libnfsidmap/"
>   
>   do_configure_prepend() {
>           sed -i -e 's,sbindir = /sbin,sbindir = ${base_sbindir},g' \
> 


-- 
# Randy MacLeod
# Wind River Linux
