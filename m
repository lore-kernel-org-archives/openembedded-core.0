Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A696F7F82D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2019 20:37:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id x9UKaxT9004827
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 30 Oct 2019 13:37:01 -0700 (PDT)
Received: from [147.11.119.146] (147.11.119.146) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 30 Oct 2019 13:36:59 -0700
To: Adrian Bunk <bunk@stusta.de>, <openembedded-core@lists.openembedded.org>
References: <20191028221328.15756-1-bunk@stusta.de>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <e3ede03b-34b7-4815-c5e3-cfc5eb6d8495@windriver.com>
Date: Wed, 30 Oct 2019 16:36:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20191028221328.15756-1-bunk@stusta.de>
X-Originating-IP: [147.11.119.146]
Subject: Re: [PATCH v4] coreutils: Move stdbuf into an own package coreutils-stdbuf
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
X-List-Received-Date: Wed, 30 Oct 2019 20:37:00 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

On 10/28/19 6:13 PM, Adrian Bunk wrote:
> This LD_PRELOAD trick is not really suitable for busybox,
> so can be the only part of coreutils needed.

Which LD_PRELOAD trick?

Ah, I think you mean:

    The coreutils implementation of stdbuf uses LD_PRELOAD [1]
    to dynamically load libstdbuf which calls setvbuf().
    This can't be implemented simply in busybox since it produces
    one or two statically linked executables. Therefore, stdbuf
    should be packaged separately.

[1]  ?? 
http://git.savannah.gnu.org/gitweb/?p=coreutils.git;a=blob;f=src/stdbuf.c;h=7eaadb45fef8c01783eeb5c27853fafbcef34f1c;hb=HEAD#l188

Could you send a v5 for plebs like me?

../Randy

> 
> coreutils depends on the new package,
> so nothing changes when installing coreutils.
> 
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>   meta/recipes-core/coreutils/coreutils_8.31.bb | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/coreutils/coreutils_8.31.bb b/meta/recipes-core/coreutils/coreutils_8.31.bb
> index 4a74f619af..57b2c1bdba 100644
> --- a/meta/recipes-core/coreutils/coreutils_8.31.bb
> +++ b/meta/recipes-core/coreutils/coreutils_8.31.bb
> @@ -49,7 +49,7 @@ bindir_progs = "arch basename chcon cksum comm csplit cut dir dircolors dirname
>                   env expand expr factor fmt fold groups head hostid id install \
>                   join link logname md5sum mkfifo nl nohup nproc od paste pathchk \
>                   pinky pr printf ptx readlink realpath runcon seq sha1sum sha224sum sha256sum \
> -                sha384sum sha512sum shred shuf sort split stdbuf sum tac tail tee test timeout \
> +                sha384sum sha512sum shred shuf sort split sum tac tail tee test timeout \
>                   tr truncate tsort tty unexpand uniq unlink uptime users vdir wc who whoami yes"
>   
>   # hostname gets a special treatment and is not included in this
> @@ -58,6 +58,10 @@ base_bindir_progs = "cat chgrp chmod chown cp date dd echo false hostname kill l
>   
>   sbindir_progs= "chroot"
>   
> +PACKAGE_BEFORE_PN_class-target += "coreutils-stdbuf"
> +FILES_coreutils-stdbuf = "${bindir}/stdbuf ${libdir}/coreutils/libstdbuf.so"
> +RDEPENDS_coreutils_class-target += "coreutils-stdbuf"
> +
>   # Let aclocal use the relative path for the m4 file rather than the
>   # absolute since coreutils has a lot of m4 files, otherwise there might
>   # be an "Argument list too long" error when it is built in a long/deep
> 


-- 
# Randy MacLeod
# Wind River Linux

