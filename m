Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CD39C605FF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 16:57:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v2AGvIIS012135
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 10 Mar 2017 08:57:18 -0800
Received: from soho-mhatle-m.local (172.25.36.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 10 Mar 2017 08:57:17 -0800
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
	<fbae88fe04c9ca949e0b3a021c4cf015c666da9d.1489144807.git.alexander.kanavin@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <e8c2ff30-fe00-5413-6ce7-4182f6e53e49@windriver.com>
Date: Fri, 10 Mar 2017 10:57:16 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <fbae88fe04c9ca949e0b3a021c4cf015c666da9d.1489144807.git.alexander.kanavin@linux.intel.com>
Subject: Re: [PATCH 36/44] package_rpm.bbclass: do not set the OS dynamically when building rpms
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
X-List-Received-Date: Fri, 10 Mar 2017 16:57:18 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 3/10/17 5:24 AM, Alexander Kanavin wrote:
> Packages need to contain just one value for the os field, otherwise
> rpm will refuse to install them if they don't match what is in
> /etc/rpm/platform.

How will this work with nativesdk for things like targeting mingw (windows),
darwin, or even alternative OS like Zephyr?

I'm thinking if 'linux-gnu' is invalid, then a simple conversion to 'linux'
would be better then hard coding everything to 'linux'.

--Mark

> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/classes/package_rpm.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
> index 2cdaae0ff25..4f4f8e4e11c 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -692,7 +692,7 @@ python do_package_rpm () {
>      pkgwritedir = d.expand('${PKGWRITEDIRRPM}/${PACKAGE_ARCH_EXTEND}')
>      d.setVar('RPM_PKGWRITEDIR', pkgwritedir)
>      bb.debug(1, 'PKGWRITEDIR: %s' % d.getVar('RPM_PKGWRITEDIR'))
> -    pkgarch = d.expand('${PACKAGE_ARCH_EXTEND}${HOST_VENDOR}-${HOST_OS}')
> +    pkgarch = d.expand('${PACKAGE_ARCH_EXTEND}${HOST_VENDOR}-linux')
>      bb.utils.mkdirhier(pkgwritedir)
>      os.chmod(pkgwritedir, 0o755)
>  
> 


