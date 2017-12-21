Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 361816FFA4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Dec 2017 05:53:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vBL5rrgD004427
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Dec 2017 21:53:53 -0800 (PST)
Received: from [128.224.162.167] (128.224.162.167) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 20 Dec 2017 21:53:52 -0800
To: Robert Yang <liezhi.yang@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1513831180.git.liezhi.yang@windriver.com>
	<65382db74f44d0296de2ccc3e5f67bef740e8422.1513831180.git.liezhi.yang@windriver.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <2c33a5f2-26ae-3050-86f8-62a41d5ec593@windriver.com>
Date: Thu, 21 Dec 2017 13:55:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <65382db74f44d0296de2ccc3e5f67bef740e8422.1513831180.git.liezhi.yang@windriver.com>
X-Originating-IP: [128.224.162.167]
Subject: Re: [PATCH 1/1] systemd: fix PACKAGECONFIG for lz4
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
X-List-Received-Date: Thu, 21 Dec 2017 05:53:53 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

The problem seems to be that the lz4 packaging problem.
lz4-ptest is packages as liblz4 and is installed instead of the lz4 package.

Best Regards,
Chen Qi

On 12/21/2017 12:41 PM, Robert Yang wrote:
> Fixed:
> MACHINE = "qemux86-64"
> PACKAGECONFIG_append_pn-systemd = "lz4"
> DISTRO_FEATURES_append = " systemd"
> DISTRO_FEATURES_BACKFILL_CONSIDERED += "sysvinit"
> VIRTUAL-RUNTIME_init_manager = "systemd"
> VIRTUAL-RUNTIME_initscripts = "systemd-compat-units"
>
> $ bitbake core-image-minimal
> $ runqemu tmp/deploy/images/qemux86-64/ nographic
> /sbin/init: error while loading shared libraries: liblz4.so.1: cannot open shared object file: No such file or directory
>
> Add lz4 to RDEPENDS to fix the problem.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   meta/recipes-core/systemd/systemd_234.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_234.bb b/meta/recipes-core/systemd/systemd_234.bb
> index 778b868..ed82c33 100644
> --- a/meta/recipes-core/systemd/systemd_234.bb
> +++ b/meta/recipes-core/systemd/systemd_234.bb
> @@ -122,7 +122,7 @@ PACKAGECONFIG[ldconfig] = "--enable-ldconfig,--disable-ldconfig"
>   PACKAGECONFIG[libidn] = "--enable-libidn,--disable-libidn,libidn"
>   PACKAGECONFIG[localed] = "--enable-localed,--disable-localed"
>   PACKAGECONFIG[logind] = "--enable-logind,--disable-logind"
> -PACKAGECONFIG[lz4] = "--enable-lz4,--disable-lz4,lz4"
> +PACKAGECONFIG[lz4] = "--enable-lz4,--disable-lz4,lz4,lz4"
>   PACKAGECONFIG[machined] = "--enable-machined,--disable-machined"
>   PACKAGECONFIG[manpages] = "--enable-manpages,--disable-manpages,libxslt-native xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
>   PACKAGECONFIG[microhttpd] = "--enable-microhttpd,--disable-microhttpd,libmicrohttpd"



