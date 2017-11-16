Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4225278589
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 08:44:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vAG8isdJ007035
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 00:44:54 -0800
Received: from [128.224.162.152] (128.224.162.152) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 16 Nov 2017 00:44:53 -0800
To: <openembedded-core@lists.openembedded.org>
References: <20171018080205.9834-1-kai.kang@windriver.com>
	<20171018080205.9834-2-kai.kang@windriver.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <ad549f16-99d7-8197-5320-84aee7c8668c@windriver.com>
Date: Thu, 16 Nov 2017 16:44:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20171018080205.9834-2-kai.kang@windriver.com>
Subject: Re: [PATCH 1/1] toolchain-scripts.bbclass: do not extend dependency if extended already
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
X-List-Received-Date: Thu, 16 Nov 2017 08:44:54 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2017年10月18日 16:02, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> When set MULTILIBS with two or more items, such as for mips64:
>
> MULTILIBS ?= "multilib:lib32 multilib:libn32"
>
> It extends dependency package name once in multilib.bbclass, and expand again
> in toolchain-scripts.bbclass which causes error:
>
> | ERROR: Nothing PROVIDES 'virtual/lib32-libn32-libc'. Close matches:
> |   virtual/libn32-libc
> |   virtual/lib32-libc
> |   virtual/libn32-librpc
> | ERROR: Required build target 'libn32-meta-ide-support' has no buildable providers.
> | Missing or unbuildable dependency chain was: ['libn32-meta-ide-support', 'virtual/lib32-libn32-libc']
>
> Don't extend package name if it has been extended already.

Any comment? Thanks.

--Kai

>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   meta/classes/toolchain-scripts.bbclass | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
> index 9bcfe708c7..4e4334abbb 100644
> --- a/meta/classes/toolchain-scripts.bbclass
> +++ b/meta/classes/toolchain-scripts.bbclass
> @@ -150,11 +150,17 @@ toolchain_create_sdk_siteconfig () {
>   toolchain_create_sdk_siteconfig[vardepsexclude] = "TOOLCHAIN_CONFIGSITE_SYSROOTCACHE"
>   
>   python __anonymous () {
> +    import re
>       import oe.classextend
>       deps = ""
>       for dep in (d.getVar('TOOLCHAIN_NEED_CONFIGSITE_CACHE') or "").split():
>           deps += " %s:do_populate_sysroot" % dep
> -        for variant in (d.getVar('MULTILIB_VARIANTS') or "").split():
> +        ml_variants = (d.getVar('MULTILIB_VARIANTS') or "").split()
> +        for variant in ml_variants:
> +            # don't extend if dep has been extended already
> +            if filter(lambda x: re.match('(virtual/)?' + x, dep), ml_variants):
> +                continue
> +
>               clsextend = oe.classextend.ClassExtender(variant, d)
>               newdep = clsextend.extend_name(dep)
>               deps += " %s:do_populate_sysroot" % newdep


-- 
Regards,
Neil | Kai Kang


