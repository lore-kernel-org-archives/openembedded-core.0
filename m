Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 275C97997D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 07:14:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x7T7EbEn011443
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 00:14:37 -0700 (PDT)
Received: from [128.224.162.148] (128.224.162.148) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Thu, 29 Aug 2019 00:14:35 -0700
To: <openembedded-core@lists.openembedded.org>
References: <20190823085629.13633-1-Qi.Chen@windriver.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <02678219-4860-343d-f090-173a4b4e026b@windriver.com>
Date: Thu, 29 Aug 2019 15:28:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20190823085629.13633-1-Qi.Chen@windriver.com>
X-Originating-IP: [128.224.162.148]
Subject: Re: [PATCH] bind: fix build with python3 PACKAGECONFIG enabled
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
X-List-Received-Date: Thu, 29 Aug 2019 07:14:37 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

ping

On 08/23/2019 04:56 PM, Chen Qi wrote:
> If the PACKAGECONFIG item, python3, is enabled, we get the following
> QA issue when multilib is enabled.
>
>    ERROR: bind-9.11.5-P4-r0 do_package: QA Issue: bind: Files/directories were installed but not shipped in any package:
>    /usr/lib
>    /usr/lib/python3.7
>    /usr/lib/python3.7/site-packages
>    /usr/lib/python3.7/site-packages/isc-2.0-py3.7.egg-info
>    /usr/lib/python3.7/site-packages/isc
>    /usr/lib/python3.7/site-packages/isc/policy.py
>    [snip]
>
> The thing is, when --with-python is specified with a path instead of 'yes',
> the --with-python-install-dir is in fact ignored.
>
> Fix this issue by specifying the correct arguments.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta/recipes-connectivity/bind/bind_9.11.5-P4.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/bind/bind_9.11.5-P4.bb b/meta/recipes-connectivity/bind/bind_9.11.5-P4.bb
> index 93c406f778..69b1174073 100644
> --- a/meta/recipes-connectivity/bind/bind_9.11.5-P4.bb
> +++ b/meta/recipes-connectivity/bind/bind_9.11.5-P4.bb
> @@ -39,7 +39,7 @@ PACKAGECONFIG[httpstats] = "--with-libxml2=${STAGING_DIR_HOST}${prefix},--withou
>   PACKAGECONFIG[readline] = "--with-readline=-lreadline,,readline"
>   PACKAGECONFIG[libedit] = "--with-readline=-ledit,,libedit"
>   PACKAGECONFIG[urandom] = "--with-randomdev=/dev/urandom,--with-randomdev=/dev/random,,"
> -PACKAGECONFIG[python3] = "--with-python=${PYTHON} --with-python-install-dir=${D}/${PYTHON_SITEPACKAGES_DIR} , --without-python, python3-ply-native,"
> +PACKAGECONFIG[python3] = "--with-python=yes --with-python-install-dir=${PYTHON_SITEPACKAGES_DIR} , --without-python, python3-ply-native,"
>   
>   ENABLE_IPV6 = "--enable-ipv6=${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'yes', 'no', d)}"
>   EXTRA_OECONF = " ${ENABLE_IPV6} --with-libtool --enable-threads \



