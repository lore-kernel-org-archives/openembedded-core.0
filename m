Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C16CC6E78E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 01:19:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2Q1JJYK027911
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 25 Mar 2014 18:19:19 -0700 (PDT)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 25 Mar 2014 18:19:19 -0700
Message-ID: <53322B15.3000807@windriver.com>
Date: Wed, 26 Mar 2014 09:19:17 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <cover.1394948105.git.raj.khem@gmail.com>
	<a856ac4a0c03a5374e8e2f3567a213f09f33c10b.1394948105.git.raj.khem@gmail.com>
In-Reply-To: <a856ac4a0c03a5374e8e2f3567a213f09f33c10b.1394948105.git.raj.khem@gmail.com>
Subject: Re: [PATCH 5/7] util-linux: scanf_cv_alloc_modifier changed from 'as' -> 'ms'
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
X-List-Received-Date: Wed, 26 Mar 2014 01:19:21 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Khem,

I got an error on CentOS 5.10, seems caused by this patch:

| 
/home/build/lyang1/testre/bitbake_build/tmp/work/x86_64-linux/util-linux-native/2.24.1-r0/util-linux-2.24.1/sys-utils/unshare.c: 
In function 'main':
| 
/home/build/lyang1/testre/bitbake_build/tmp/work/x86_64-linux/util-linux-native/2.24.1-r0/util-linux-2.24.1/sys-utils/unshare.c:151: 
error: 'MS_PRIVATE' undeclared (first use in this function)
| 
/home/build/lyang1/testre/bitbake_build/tmp/work/x86_64-linux/util-linux-native/2.24.1-r0/util-linux-2.24.1/sys-utils/unshare.c:151: 
error: (Each undeclared identifier is reported only once
| 
/home/build/lyang1/testre/bitbake_build/tmp/work/x86_64-linux/util-linux-native/2.24.1-r0/util-linux-2.24.1/sys-utils/unshare.c:151: 
error: for each function it appears in.)
| 
/home/build/lyang1/testre/bitbake_build/tmp/work/x86_64-linux/util-linux-native/2.24.1-r0/util-linux-2.24.1/sys-utils/unshare.c:151: 
error: 'MS_REC' undeclared (first use in this function)
| make[2]: *** [sys-utils/unshare.o] Error 1

We can add the following lines to util-linux/sys-utils/unshare.c as a
workaround:

#ifndef MS_PRIVATE
#define MS_PRIVATE      (1<<18) /* 262144 Private*/
#endif

#ifndef MS_REC
#define MS_REC          0x4000  /* 16384: Recursive loopback */
#endif

#ifndef MS_NOSUID
#define MS_NOSUID        2      /* Ignore suid and sgid bits */
#endif

#ifndef MS_NOEXEC
#define MS_NOEXEC        8      /* Disallow program execution */
#endif

#ifndef MS_NODEV
#define MS_NODEV         4      /* Disallow access to device special files */
#endif

Do you have any ideas, please ?

// Robert

On 03/16/2014 01:42 PM, Khem Raj wrote:
> This patch actually makes sense for uclibc more than glibc
> since if we did not cache scanf_cv_alloc_modifier configure
> test will determine it correctly for glibc but the test does
> not do proper job when uclibc is involved the reason is it
> depends on define __GLIBC_ and uclibc unfortunately poses as
> glibc and defines this variable.
>
> %m is implemented in uclibc as well and we enable it so caching value of
> 'ms' specifier is going to work across all libcs
>
> This fixes mounting errors we see with util-linux/mount on
> uclibc/systemd
>
> Mar 16 01:46:40 qemux86 systemd-remount-fs[124]: /bin/mount: /proc/self/mountinfo: parse error: ignore entry at line 21.
> Mar 16 01:46:40 qemux86 systemd-remount-fs[124]: /bin/mount: /proc/self/mountinfo: parse error: ignore entry at line 22.
> Mar 16 01:46:40 qemux86 systemd-remount-fs[124]: /bin/mount: can't find / in /etc/fstab
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta/recipes-core/util-linux/util-linux_2.24.1.bb | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/util-linux/util-linux_2.24.1.bb b/meta/recipes-core/util-linux/util-linux_2.24.1.bb
> index b08d68d..aa98b65 100644
> --- a/meta/recipes-core/util-linux/util-linux_2.24.1.bb
> +++ b/meta/recipes-core/util-linux/util-linux_2.24.1.bb
> @@ -17,7 +17,8 @@ SRC_URI += "file://util-linux-ng-replace-siginterrupt.patch \
>   SRC_URI[md5sum] = "88d46ae23ca599ac5af9cf96b531590f"
>   SRC_URI[sha256sum] = "835eb6232cfab0118ef2e4fd649de0ba9f5bd1b8cbf9a7d4d84594541dec8410"
>
> -CACHED_CONFIGUREVARS += "scanf_cv_alloc_modifier=as"
> +CACHED_CONFIGUREVARS += "scanf_cv_alloc_modifier=ms"
> +
>   EXTRA_OECONF_class-native = "${SHARED_EXTRA_OECONF} \
>                                --disable-fallocate --disable-use-tty-group \
>   "
>

