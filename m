Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 98EF27292E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 14:15:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBJEFTpP014294
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Fri, 19 Dec 2014 06:15:29 -0800 (PST)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 19 Dec 2014 06:15:29 -0800
Message-ID: <549432FA.5000005@windriver.com>
Date: Fri, 19 Dec 2014 09:15:22 -0500
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
References: <1418995131.13316.18.camel@linuxfoundation.org>
In-Reply-To: <1418995131.13316.18.camel@linuxfoundation.org>
Subject: Re: [PATCH] kernelsrc.bbclass: Ensure fetch/unpack/patch tasks don't run
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
X-List-Received-Date: Fri, 19 Dec 2014 14:15:33 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 14-12-19 08:18 AM, Richard Purdie wrote:
> In particular this removes a race condition where a ${S}/patches
> directory could be created by do_unpack. This confuses kern-tools.

Looks good here. This will keep the dreaded 'patches' directory from 
popping up and mucking up the existing detection of meta data.

On a related note, I'll see about making things more robust on the
detection end as well.

Cheers,

Bruce

>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/classes/kernelsrc.bbclass b/meta/classes/kernelsrc.bbclass
> index 11f04e9..4208eff 100644
> --- a/meta/classes/kernelsrc.bbclass
> +++ b/meta/classes/kernelsrc.bbclass
> @@ -1,5 +1,8 @@
>   S = "${STAGING_KERNEL_DIR}"
> +do_fetch[noexec] = "1"
>   do_unpack[depends] += "virtual/kernel:do_patch"
> +do_unpack[noexec] = "1"
> +do_patch[noexec] = "1"
>   do_package[depends] += "virtual/kernel:do_populate_sysroot"
>   KERNEL_VERSION = "${@get_kernelversion_file("${S}")}"
>
>
>


