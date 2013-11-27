Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5A7C16DCE5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 13:46:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rARDkP1q018466
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 27 Nov 2013 05:46:25 -0800 (PST)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Wed, 27 Nov 2013 05:46:24 -0800
Message-ID: <5295F7AF.1000506@windriver.com>
Date: Wed, 27 Nov 2013 08:46:23 -0500
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
References: <1385559899.11222.0.camel@ted>
In-Reply-To: <1385559899.11222.0.camel@ted>
Subject: Re: [PATCH] Revert "kernel: restore scripts in the sysroot"
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
X-List-Received-Date: Wed, 27 Nov 2013 13:46:27 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-11-27 08:44 AM, Richard Purdie wrote:
> This reverts commit 6a6735cb98d529c8c5376aedb5c951339f54fe96.
>
> The module class already ensures the scripts are rebuilt correctly. Running
> this at sstate installation time is problematic since it can require the
> cross compiler. Adding such a dependency would cause issues of its own.

I was waiting for the dust to clear and have been running with the
same thing here, saves me from sending it and I've removed it from
my queue.

Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>

>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 4974507..24ac778 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -290,17 +290,6 @@ kernel_do_install() {
>   }
>   do_install[prefuncs] += "package_get_auto_pr"
>
> -
> -SSTATEPOSTINSTFUNCS += "kernelscripts_sstate_postinst"
> -kernelscripts_sstate_postinst () {
> -	if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]; then
> -		(
> -		  cd ${STAGING_KERNEL_DIR}
> -		  oe_runmake scripts
> -		)
> -	fi
> -}
> -
>   python sysroot_stage_all () {
>       oe.path.copyhardlinktree(d.expand("${D}${KERNEL_SRC_PATH}"), d.expand("${SYSROOT_DESTDIR}${KERNEL_SRC_PATH}"))
>   }
>
>


