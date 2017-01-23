Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 590867198D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 08:15:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0N8Fgbq025062; Mon, 23 Jan 2017 08:15:42 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id JJG7mVA2OzhO; Mon, 23 Jan 2017 08:15:42 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0N8Fdnl025058
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 23 Jan 2017 08:15:41 GMT
Message-ID: <1485159339.30673.10.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yuanjie Huang <Yuanjie.Huang@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2017 08:15:39 +0000
In-Reply-To: <20170123034808.6311-1-Yuanjie.Huang@windriver.com>
References: <20170123034808.6311-1-Yuanjie.Huang@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] libgcc-common.inc: Fix symbol link to mutilib directories
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
X-List-Received-Date: Mon, 23 Jan 2017 08:15:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi,

On Mon, 2017-01-23 at 11:48 +0800, Yuanjie Huang wrote:
> From: Yuanjie Huang <yuanjie.huang@windriver.com>
> 
> The multilib symbol links are created for gcc to locate libgcc files.
> Its source path contains TARGET_SYS of multilib libgcc. However, a
> multilib's TARGET_SYS is not generated correctly all the time now.
> For example,
> 
>   MACHINE = "qemumips64"
>   DEFAULTTUNE = "mips64-n32"
>   MULTILIBS = "multilib:lib64"
>   DEFAULTTUNE_virtclass-multilib-lib64 = "mips64"
> 
> In N32 libgcc, the symbol link for N64 is created as:
> 
>   64 -> ../../../lib64/mips64-wrsmllib64-linux-gnun32/5.2.0/
> 
> while it should be:
> 
>   64 -> ../../../lib64/mips64-wrsmllib64-linux/5.2.0/
> 
> This issue sometimes won't break compiler, since gcc also searches
> paths
> calculated with OS multilib directories beside multilib directories .
> 
> This patch resolve the problem by reading TARGET_SYS from a localdata
> environment with proper multilib overrides.
> 
> Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
> ---
>  meta/recipes-devtools/gcc/libgcc-common.inc | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc
> b/meta/recipes-devtools/gcc/libgcc-common.inc
> index a8a3f0d..69eeb26 100644
> --- a/meta/recipes-devtools/gcc/libgcc-common.inc
> +++ b/meta/recipes-devtools/gcc/libgcc-common.inc
> @@ -106,20 +106,19 @@ fakeroot python do_multilib_install() {
>              bb.warn("Tune %s doesn't have a baselib set.
> Skipping..." % tune)
>              continue
>  
> -        tune_arch = tune_parameters['arch']
>          tune_bitness = tune_baselib.replace('lib', '')
>          if not tune_bitness:
>              tune_bitness = '32' # /lib => 32bit lib
>  
> -        tune_abiextension = tune_parameters['abiextension']
> -        if tune_abiextension:
> -            libcextension = '-gnu' + tune_abiextension
> -        else:
> -            libcextension = ''
> +        localdata = bb.data.createCopy(d)
> +        overrides = localdata.getVar("OVERRIDES", False) +
> ":virtclass-multilib-" + ml
> +        localdata.setVar("OVERRIDES", overrides)
> +        localdata.setVar("MLPREFIX", ml + "-")
> +        bb.data.update_data(localdata)
> +        ml_target_sys = localdata.getVar('TARGET_SYS', True) or ''
>  

Please take advantage of:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=a49ee524a933b433ea9c2e2be1bbf24909fcde77

Cheers,

Richard

