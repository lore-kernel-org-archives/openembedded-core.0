Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 890637982A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 06:43:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8K6gmqI001455
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 19 Sep 2018 23:42:59 -0700
Received: from [128.224.162.173] (128.224.162.173) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Wed, 19 Sep 2018 23:42:38 -0700
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
References: =?UTF-8?Q?<=1d20180918094042.100881-1-mingli.yu@windriver.com=1d?=
	=?UTF-8?Q?>_<20180918094749.102156-1-mingli.yu@windriver.com>?=
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5BA3408B.7080501@windriver.com>
Date: Thu, 20 Sep 2018 14:39:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <20180918094749.102156-1-mingli.yu@windriver.com>
X-Originating-IP: [128.224.162.173]
Subject: Re: [PATCH v2] glibc: fix Segmentation fault in gethostid.c
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
X-List-Received-Date: Thu, 20 Sep 2018 06:43:25 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Will send out v3 with the update from glibc upstream.

Thanks,

On 2018年09月18日 17:47, mingli.yu@windriver.com wrote:
> From: Mingli Yu <Mingli.Yu@windriver.com>
>
> When run test program hostid, it encounters
> Segmentation fault as hp is NULL.
>
>   # cat /mybuild/hostid.c
>   #include <stdio.h>
>   #include <unistd.h>
>
>   int
>   main(int argc, char *argv[])
>   {
>      long hostid;
>      hostid = gethostid();
>      printf("the hostid is %ld\n", hostid);
>
>   }
>
>   # gcc -o /mybuild/hostid /mybuild/hostid.c
>   # /mybuild/hostid
>   Segmentation fault
>   # gdb /mybuild/hostid
>   GNU gdb (GDB) 8.2
>   Copyright (C) 2018 Free Software Foundation, Inc.
>   License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
>   This is free software: you are free to change and redistribute it.
>   There is NO WARRANTY, to the extent permitted by law.
>   Type "show copying" and "show warranty" for details.
>   This GDB was configured as "x86_64-wrs-linux".
>   Type "show configuration" for configuration details.
>   For bug reporting instructions, please see:
>   <http://www.gnu.org/software/gdb/bugs/>.
>   Find the GDB manual and other documentation resources online at:
>      <http://www.gnu.org/software/gdb/documentation/>.
>
>   For help, type "help".
>   Type "apropos word" to search for commands related to "word"...
>   Reading symbols from /mybuild/hostid...done.
>   (gdb) r
>   Starting program: /mybuild/hostid
>
>   Program received signal SIGSEGV, Segmentation fault.
>   0x00007ffff7f0330e in gethostid () at ../sysdeps/unix/sysv/linux/gethostid.c:125
>   125	  memcpy (&in, hp->h_addr,
>   (gdb) bt
>   #0  0x00007ffff7f0330e in gethostid () at ../sysdeps/unix/sysv/linux/gethostid.c:125
>   #1  0x0000555555555159 in main ()
>
> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> ---
>   .../0001-gethostid.c-check-the-value-of-hp.patch   | 75 ++++++++++++++++++++++
>   meta/recipes-core/glibc/glibc_2.28.bb              |  1 +
>   2 files changed, 76 insertions(+)
>   create mode 100644 meta/recipes-core/glibc/glibc/0001-gethostid.c-check-the-value-of-hp.patch
>
> diff --git a/meta/recipes-core/glibc/glibc/0001-gethostid.c-check-the-value-of-hp.patch b/meta/recipes-core/glibc/glibc/0001-gethostid.c-check-the-value-of-hp.patch
> new file mode 100644
> index 0000000000..04d1662361
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0001-gethostid.c-check-the-value-of-hp.patch
> @@ -0,0 +1,75 @@
> +From 84cc79a003cf1a29e0a45ee76b67a3800d9e412e Mon Sep 17 00:00:00 2001
> +From: Mingli Yu <Mingli.Yu@windriver.com>
> +Date: Tue, 18 Sep 2018 07:29:27 +0000
> +Subject: [PATCH] gethostid.c: check the value of hp
> +
> +Fix Segmentation fault in gethostid.c
> +
> +When run test program hostid, it encounters
> +Segmentation fault as hp is NULL.
> +
> +  # cat /mybuild/hostid.c
> +  #include <stdio.h>
> +  #include <unistd.h>
> +
> +  int
> +  main(int argc, char *argv[])
> +  {
> +    long hostid;
> +    hostid = gethostid();
> +    printf("the hostid is %ld\n", hostid);
> +  }
> +
> +  # gcc -o /mybuild/hostid /mybuild/hostid.c
> +  # /mybuild/hostid
> +  Segmentation fault
> +  # gdb /mybuild/hostid
> +  GNU gdb (GDB) 8.2
> +  Copyright (C) 2018 Free Software Foundation, Inc.
> +  License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
> +  This is free software: you are free to change and redistribute it.
> +  There is NO WARRANTY, to the extent permitted by law.
> +  Type "show copying" and "show warranty" for details.
> +  This GDB was configured as "x86_64-wrs-linux".
> +  Type "show configuration" for configuration details.
> +  For bug reporting instructions, please see:
> +  <http://www.gnu.org/software/gdb/bugs/>.
> +  Find the GDB manual and other documentation resources online at:
> +      <http://www.gnu.org/software/gdb/documentation/>.
> +
> +   For help, type "help".
> +   Type "apropos word" to search for commands related to "word"...
> +   Reading symbols from /mybuild/hostid...done.
> +   (gdb) r
> +   Starting program: /mybuild/hostid
> +
> +   Program received signal SIGSEGV, Segmentation fault.
> +   0x00007ffff7f0330e in gethostid () at ../sysdeps/unix/sysv/linux/gethostid.c:125
> +   125      memcpy (&in, hp->h_addr,
> +   (gdb) bt
> +    #0  0x00007ffff7f0330e in gethostid () at ../sysdeps/unix/sysv/linux/gethostid.c:125
> +    #1  0x0000555555555159 in main ()
> +
> +Upstream-Status: Submitted[https://sourceware.org/bugzilla/show_bug.cgi?id=23679]
> +
> +Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> +---
> + sysdeps/unix/sysv/linux/gethostid.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/sysdeps/unix/sysv/linux/gethostid.c b/sysdeps/unix/sysv/linux/gethostid.c
> +index 2e20f034dc..5904b61c40 100644
> +--- a/sysdeps/unix/sysv/linux/gethostid.c
> ++++ b/sysdeps/unix/sysv/linux/gethostid.c
> +@@ -102,7 +102,7 @@ gethostid (void)
> +     {
> +       int ret = __gethostbyname_r (hostname, &hostbuf,
> + 				   tmpbuf.data, tmpbuf.length, &hp, &herr);
> +-      if (ret == 0)
> ++      if (ret == 0 && hp != NULL)
> + 	break;
> +       else
> + 	{
> +--
> +2.13.3
> +
> diff --git a/meta/recipes-core/glibc/glibc_2.28.bb b/meta/recipes-core/glibc/glibc_2.28.bb
> index 0ebbaf9610..0a8fa0c25f 100644
> --- a/meta/recipes-core/glibc/glibc_2.28.bb
> +++ b/meta/recipes-core/glibc/glibc_2.28.bb
> @@ -45,6 +45,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>              file://0028-bits-siginfo-consts.h-enum-definition-for-TRAP_HWBKP.patch \
>              file://0029-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch \
>              file://0030-intl-Emit-no-lines-in-bison-generated-files.patch \
> +           file://0001-gethostid.c-check-the-value-of-hp.patch \
>   "
>
>   NATIVESDKFIXES ?= ""
>

