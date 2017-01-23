Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 384C371B31
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 12:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0NCLspI012799; Mon, 23 Jan 2017 12:22:16 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id vTlDPJZJ1Ayp; Mon, 23 Jan 2017 12:22:16 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0NCM991012829
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 23 Jan 2017 12:22:11 GMT
Message-ID: <1485174129.30673.14.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yuanjie Huang <yuanjie.huang@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2017 12:22:09 +0000
In-Reply-To: <20170123082922.243238-1-yuanjie.huang@windriver.com>
References: <1485159339.30673.10.camel@linuxfoundation.org>
	<20170123082922.243238-1-yuanjie.huang@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH V3] libgcc-common.inc: Fix symbol link to mutilib directories
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
X-List-Received-Date: Mon, 23 Jan 2017 12:22:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-01-23 at 00:29 -0800, Yuanjie Huang wrote:
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
>  meta/recipes-devtools/gcc/libgcc-common.inc | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc
> b/meta/recipes-devtools/gcc/libgcc-common.inc
> index 7a3b410..7198664 100644
> --- a/meta/recipes-devtools/gcc/libgcc-common.inc
> +++ b/meta/recipes-devtools/gcc/libgcc-common.inc
> @@ -106,20 +106,15 @@ fakeroot python do_multilib_install() {
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
> +        localdata = get_multilib_datastore(ml, d)
> +        ml_target_sys = localdata.getVar('TARGET_SYS') or ''
>  
>          src = '../../../' + tune_baselib + '/' + \
> -            tune_arch + d.getVar('TARGET_VENDOR') + 'ml' + ml + \
> -            '-' + d.getVar('TARGET_OS') + libcextension +  '/' +
> binv + '/'
> +            ml_target_sys + '/' + binv + '/'
>  
>          dest = d.getVar('D') + d.getVar('libdir') + '/' + \
>              d.getVar('TARGET_SYS') + '/' + binv + '/' + tune_bitness

This looks better, thanks. Looking at the function a bit more, I
suspect we should probably do something like:

tune_bitness = (localdata.getVar('baselib') or '').replace('lib', '')

and then drop the get_tune_parameters call entirely.

Cheers,

Richard


