Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DDEDB73D46
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Nov 2015 07:23:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tA77NwHb017089
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 6 Nov 2015 23:23:58 -0800 (PST)
Received: from [128.224.162.154] (128.224.162.154) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 6 Nov 2015 23:23:57 -0800
Message-ID: <563DA70B.8090409@windriver.com>
Date: Sat, 7 Nov 2015 15:23:55 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1446703751-58313-1-git-send-email-wenzong.fan@windriver.com>
	<11B9075E-35C1-4101-8072-D44DCDF9A210@gmail.com>
	<563DA31B.5080404@windriver.com>
	<CAMKF1spYkB4xA94TuVUkaX3g-U3+TmPnhDQMN+EzTgX1pMKZdQ@mail.gmail.com>
In-Reply-To: <CAMKF1spYkB4xA94TuVUkaX3g-U3+TmPnhDQMN+EzTgX1pMKZdQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: fix mips64 configure support
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
X-List-Received-Date: Sat, 07 Nov 2015 07:24:00 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/07/2015 03:09 PM, Khem Raj wrote:
> On Fri, Nov 6, 2015 at 11:07 PM, wenzong fan <wenzong.fan@windriver.com> wrote:
>> If target name is linux-mips64, set it as linux-mips to get it build with
>> mips(32) userspace.
>
> is it really building for mips32 ?
>
>

Yes, with this change, the "Configure" will pass '-mips2' to CFLAGS, 
otherwise it will pass '-mips3' which may cause build errors:

| Error: -mips3 conflicts with the other architecture options, which 
imply -mips64r2
| cryptlib.c:1:0: error: '-mips3' conflicts with the other architecture 
options, which specify a mips64r2 processor

I built it with a cav-octeon3 bsp.

Looks openssl doesn't work with mips64 userspace, I got this from git logs:

commit 858646c7bd11d1dad8c14e30f3fe6b4bd58a31b2
Author: Randy MacLeod <Randy.MacLeod@windriver.com>
Date:   Fri Dec 21 14:05:46 2012 -0500

     openssl: Add mips64 configure support.

     Add mips64 configure support but assume mips(32) userspace.

     (From OE-Core rev: 7d775b071b902ee0de6391b2c30d36e3003643e1)

     Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
     Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
     Signed-off-by: Saul Wold <sgw@linux.intel.com>
     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-connectivity/openssl/openssl.inc 
b/meta/recipes-connectivity/openssl/openssl.inc
index e1e7b65..af1922e 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -95,6 +95,9 @@ do_configure () {
         linux-mipsel)
                 target=debian-mipsel
                 ;;
+        linux-*-mips64)
+               target=linux-mips
+                ;;
         linux-powerpc)
                 target=linux-ppc
                 ;;

Thanks
Wenzong

