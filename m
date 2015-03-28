Return-Path: <zhengjunling@huawei.com>
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [58.251.152.64])
	by mail.openembedded.org (Postfix) with ESMTP id 3F2EE723B3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Mar 2015 02:38:15 +0000 (UTC)
Received: from 172.24.2.119 (EHLO szxeml434-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CLK17368; Sat, 28 Mar 2015 10:38:13 +0800 (CST)
Received: from [127.0.0.1] (10.111.55.101) by szxeml434-hub.china.huawei.com
	(10.82.67.225) with Microsoft SMTP Server id 14.3.158.1;
	Sat, 28 Mar 2015 10:36:37 +0800
Message-ID: <551613A2.10506@huawei.com>
Date: Sat, 28 Mar 2015 10:36:18 +0800
From: Junling Zheng <zhengjunling@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.0.1
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1427361482-5775-1-git-send-email-zhengjunling@huawei.com>
	<1427363666.14020.62.camel@linuxfoundation.org>
	<5513EE0B.5070802@huawei.com>
	<5513F450.1010701@communistcode.co.uk>
	<5514025A.4080004@huawei.com>
	<CAJTo0LYk7tA=5Vos6BC4j8cC5V=9TK4BZ9H0j0RQeajQuo=D0A@mail.gmail.com>
	<5514CF16.2020804@huawei.com>
	<CAJTo0Latp9ifgWHDAJGb=m4tuj3ChahC4sxEOwy+pNjE0RkYSA@mail.gmail.com>
In-Reply-To: <CAJTo0Latp9ifgWHDAJGb=m4tuj3ChahC4sxEOwy+pNjE0RkYSA@mail.gmail.com>
X-Originating-IP: [10.111.55.101]
X-CFilter-Loop: Reflected
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	"peifeiyue@huawei.com" <peifeiyue@huawei.com>
Subject: Re: [PATCH] file: remove the original magic.h
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
X-List-Received-Date: Sat, 28 Mar 2015 02:38:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 2015/3/27 17:56, Burton, Ross wrote:
> 
> On 27 March 2015 at 03:31, Junling Zheng <zhengjunling@huawei.com <mailto:zhengjunling@huawei.com>> wrote:
> 
>     So I think the true reason is that if the magic.h exists already, sometimes Makefile will not generate it again.
> 
> 
> In that case it's likely entirely down to timestamps.   How are you modifying magic.h.in <http://magic.h.in>?
> 
> Ross
>
Hi, Ross

I backport some commits from upstream to fix CVE-2014-9620, and some of them involve the modifying of magic.h.in:

90018fe22ff8b74a22fcd142225b0a00f3f12677
6ce24f35cd4a43c4bdd249e8e0c4952c1f8eac67
0056ec32255de1de973574b0300161a1568767d6
09e41625c999a2e5b51e1092f0ef2432a99b5c33
ce90e05774dd77d86cfc8dfa6da57b32816841c4

And the final difference between magic.h and magic.h.in is:

z00238152@Patch-Test:file-5.14>0$ diff -u src/magic.h src/magic.h
magic.h     magic.h.in
z00238152@Patch-Test:file-5.14>0$ diff -u src/magic.h src/magic.h.in
--- src/magic.h	2015-03-28 02:01:46.000000000 +0000
+++ src/magic.h.in	2015-03-28 02:01:47.000000000 +0000
@@ -74,7 +74,7 @@
 #define	MAGIC_NO_CHECK_FORTRAN	0x000000 /* Don't check ascii/fortran */
 #define	MAGIC_NO_CHECK_TROFF	0x000000 /* Don't check ascii/troff */

-#define MAGIC_VERSION		514	/* This implementation */
+#define MAGIC_VERSION		X.YY	/* This implementation */


 #ifdef __cplusplus
@@ -100,7 +100,12 @@
 int magic_list(magic_t, const char *);
 int magic_errno(magic_t);

-#define MAGIC_PARAM_MAX_RECURSION	0
+#define MAGIC_PARAM_INDIR_MAX		0
+#define MAGIC_PARAM_NAME_MAX		1
+#define MAGIC_PARAM_ELF_PHNUM_MAX	2
+#define MAGIC_PARAM_ELF_SHNUM_MAX	3
+#define MAGIC_PARAM_ELF_NOTES_MAX	4
+
 int magic_setparam(magic_t, int, const void *);
 int magic_getparam(magic_t, int, void *);


So, if Makefile doesn't generate a new magic.h, there will be some "symbol undeclared" errors during compiling.

By the way, the upstream code has only magic.h.in, and no magic.h, which only exists in release version tarballs.

And I think the original magic.h is redundant.

Cheers,

Junling


