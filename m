Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 48C8F7844B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 05:55:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w0I5t68Y015561
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 17 Jan 2018 21:55:06 -0800 (PST)
Received: from [128.224.163.159] (128.224.163.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 17 Jan 2018 21:55:05 -0800
To: Dengke Du <dengke.du@windriver.com>, <juro.bystricky@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1516247117.git.dengke.du@windriver.com>
	<6ac9b47678b7329d1096ccbeea51409bb0a4c820.1516247117.git.dengke.du@windriver.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <0095643d-effc-26cf-ae4a-cb0d48319eef@windriver.com>
Date: Thu, 18 Jan 2018 13:58:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <6ac9b47678b7329d1096ccbeea51409bb0a4c820.1516247117.git.dengke.du@windriver.com>
Subject: Re: [PATCH 1/1] python2-dev: improve reproducibility
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
X-List-Received-Date: Thu, 18 Jan 2018 05:55:06 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年01月18日 11:48, Dengke Du wrote:
> oe-core has fixed it for python3, we can apply it to python2, the origin
> commit id:
>
>      e21723bb9b6035714268eeab5f43e2d1cb798a0d
>
> We can check it here:
>
>     http://git.openembedded.org/openembedded-core/commit/?id=e21723bb9b6035714268eeab5f43e2d1cb798a0d
>
> Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ---
>   meta/recipes-devtools/python/python_2.7.13.bb | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-devtools/python/python_2.7.13.bb b/meta/recipes-devtools/python/python_2.7.13.bb
> index 754c029..8075204 100644
> --- a/meta/recipes-devtools/python/python_2.7.13.bb
> +++ b/meta/recipes-devtools/python/python_2.7.13.bb
> @@ -140,6 +140,10 @@ py_package_preprocess () {
>   
>   	# Remove references to buildmachine paths in target Makefile and _sysconfigdata
>   	sed -i -e 's:--sysroot=${STAGING_DIR_TARGET}::g' -e s:'--with-libtool-sysroot=${STAGING_DIR_TARGET}'::g \
> +		-e 's|${DEBUG_PREFIX_MAP}||g' \
> +		-e 's:${RECIPE_SYSROOT_NATIVE}::g' \
> +		-e 's:${RECIPE_SYSROOT}::g' \
> +		-e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
>   		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile \
>   		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py
>       python -m py_compile ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py

There still build path issue,  use relative path to
recompile _sysconfigdata.py

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=hongxu/reproduce&id=8c1fe6eb54d88b7dd3081b57e98f8cf3b5298045

//Hongxu



