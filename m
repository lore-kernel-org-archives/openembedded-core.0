Return-Path: <David.Nystrom@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id B0A336EE4C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 11:45:34 +0000 (UTC)
Received: from [172.16.141.133] (172.16.141.133) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 13 Feb 2014 12:45:25 +0100
Message-ID: <52FCB055.7050609@enea.com>
Date: Thu, 13 Feb 2014 12:45:25 +0100
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <rongqing.li@windriver.com>, <openembedded-core@lists.openembedded.org>
References: <1392263338-9144-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1392263338-9144-1-git-send-email-rongqing.li@windriver.com>
X-Originating-IP: [172.16.141.133]
Subject: Re: [PATCH] nss: avoid to use the hardcode kernel version
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
X-List-Received-Date: Thu, 13 Feb 2014 11:45:36 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-02-13 04:48, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>
> Read kernel version from ${STAGING_KERNEL_DIR}/kernel-abiversion, to avoid
> to use the hardcode kernel version.
>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>   meta/recipes-support/nss/nss.inc |    6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-support/nss/nss.inc b/meta/recipes-support/nss/nss.inc
> index a6aeed8..3ad12cc 100644
> --- a/meta/recipes-support/nss/nss.inc
> +++ b/meta/recipes-support/nss/nss.inc
> @@ -23,7 +23,7 @@ SRC_URI_append_class-target = "\
>   "
>   inherit siteinfo
>   PR = "r0"
> -DEPENDS = "sqlite3 nspr zlib nss-native"
> +DEPENDS = "sqlite3 nspr zlib nss-native virtual/kernel"
>   DEPENDS_class-native = "sqlite3-native nspr-native zlib-native"
>   RDEPENDS_${PN} = "perl"
>
> @@ -55,7 +55,7 @@ do_compile() {
>       export NSS_USE_SYSTEM_SQLITE=1
>       export NSS_ENABLE_ECC=1
>
> -    export OS_RELEASE=3.4
> +    export OS_RELEASE=`cat ${STAGING_KERNEL_DIR}/kernel-abiversion|sed 's/-.*//'`

So if native or nativesdk versions compile before virtual/kernel 
${STAGING_KERNEL_DIR}/kernel-abiversion is available  ?

What will happen then ?

>       export OS_TARGET=Linux
>       export OS_ARCH=Linux
>
> @@ -95,7 +95,7 @@ do_install() {
>       export NSS_USE_SYSTEM_SQLITE=1
>       export NSS_ENABLE_ECC=1
>
> -    export OS_RELEASE=3.4
> +    export OS_RELEASE=`cat ${STAGING_KERNEL_DIR}/kernel-abiversion|sed 's/-.*//'`
>       export OS_TARGET=Linux
>       export OS_ARCH=Linux
>
>


