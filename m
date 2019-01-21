Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5528779EF6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2019 23:00:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x0LN0b1r023698
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2019 15:00:37 -0800 (PST)
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Mon, 21 Jan 2019 15:00:36 -0800
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Xulin Sun
	<xulin.sun@windriver.com>
References: <20190118022248.17108-1-xulin.sun@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <ad8f8c65-e628-1102-b49d-883b4eb9ce09@windriver.com>
Date: Mon, 21 Jan 2019 18:00:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190118022248.17108-1-xulin.sun@windriver.com>
X-Originating-IP: [172.25.44.4]
Subject: Re: [meta-oe][PATCH] openssl: fix multilib file install conflicts
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
X-List-Received-Date: Mon, 21 Jan 2019 23:00:40 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Xulin,

Thanks for sending this patch.

On 1/17/19 9:22 PM, Xulin Sun wrote:
> To avoid issue like below if run "bitbake lib32-wrlinux-image-glibc-std"

For future oe-core commits, please use a core-image-minimal
example that will be more familiar to people outside of Wind River.

> with series userspace packages(LAMP,krb5...) added:
> 
> Error: Transaction check error:
>    file /usr/bin/c_rehash conflicts between attempted installs of
>    lib32-openssl-bin-1.1.1-r0.armv7at2hf_neon and openssl-bin-1.1.1-r0.aarch64
>

Also, while your commit log explains what you fixed, it
doesn't describe the issue for those who don't know what c_rehash is so 
something like:

   Add multilib_script support for openssl's c_rehash which is
   a perl script.

Followed by the example failure log that you showed.


Since this hasn't been merged to master/master-next,
it would be nice if you sent a v2.

Thanks,
../Randy

> Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
> ---
>   meta/recipes-connectivity/openssl/openssl_1.1.1a.bb | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
> index 5c4e69cfb7..21359fa68a 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
> @@ -206,3 +206,7 @@ RREPLACES_openssl-conf = "openssl10-conf"
>   RCONFLICTS_openssl-conf = "openssl10-conf"
>   
>   BBCLASSEXTEND = "native nativesdk"
> +
> +inherit multilib_script
> +
> +MULTILIB_SCRIPTS = "${PN}:${bindir}/c_rehash"
> 



-- 
# Randy MacLeod
# Wind River Linux

