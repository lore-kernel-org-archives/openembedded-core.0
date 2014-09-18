Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id CC1406FC54
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 07:19:02 +0000 (UTC)
Received: by mail-pd0-f176.google.com with SMTP id g10so819956pdj.35
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 00:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=7PBa3ubtSnhfSZvy9Yf7u7ztuXHnO0NN2jE85d4nHHI=;
	b=mcBAgKuYr6PPbw0FWVLW2ZzVxy+zNQwWVELLtDG6AGLQVg9qRk7vCltYiex4RsAOlU
	n9LbM3ixiXGmvCtUo+pwnVAec6axldalz30I2q++lxHLps+KMyHdFqBb4YG+ZfGoJyCk
	qipyDSDOSnYnLTn+qdIP5aeg2C1PKYkpoeZ4zu/dnWxBUbF32fiYyhnYqMPCoJ0sepuB
	8PqcIviUve0J/L7dhv5YZgSYUYnqBZFiiZn2KPqvh7ckJIjca4KWQojd0pMCTr5JVsq4
	HvO52VZuYMe+5Jz0Mr0rvyU3hOaVNTYdEYiqg12ZIArDuTz56PrKaavzpQrjchcdO2G7
	t9Fw==
X-Received: by 10.67.3.106 with SMTP id bv10mr3042226pad.13.1411024743647;
	Thu, 18 Sep 2014 00:19:03 -0700 (PDT)
Received: from CACSVMO-14452.local ([2601:9:3580:7a5:c0c6:c4a3:f3e7:1968])
	by mx.google.com with ESMTPSA id
	dg5sm19359224pac.12.2014.09.18.00.19.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Sep 2014 00:19:03 -0700 (PDT)
Message-ID: <541A8765.1060800@gmail.com>
Date: Thu, 18 Sep 2014 00:19:01 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1410879378.git.kai.kang@windriver.com>
	<f1a77eb073405fd9bcccc0dac37be98848ddf08b.1410879378.git.kai.kang@windriver.com>
In-Reply-To: <f1a77eb073405fd9bcccc0dac37be98848ddf08b.1410879378.git.kai.kang@windriver.com>
Subject: Re: [PATCH 3/9] gcc-4.9: redefine dynamic linker for aarch64
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
X-List-Received-Date: Thu, 18 Sep 2014 07:19:05 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



On 9/16/14 8:06 AM, Kai Kang wrote:
> Redefine dynamic linker for aarch64 from /lib to /lib64.
> 
> BASELIB of aarch64 has to be defined with 'lib64', then linker file
> ld-linux-aarch64.so.1 is installed into /lib64 rather than /lib. So
> update it here too.

hmmm since the ldso name is different it can still live in /lib
and there will be ilp32 version ldso multilib as well later. can we keep
ldso in /lib ?

> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-devtools/gcc/gcc-4.9.inc              |  1 +
>  .../0056-redefine-dynamic-linker-for-aarch64.patch | 34 ++++++++++++++++++++++
>  2 files changed, 35 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0056-redefine-dynamic-linker-for-aarch64.patch
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
> index 25778bd..c434a45 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.9.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
> @@ -70,6 +70,7 @@ SRC_URI = "\
>      file://0053-gcc-fix-segfault-from-calling-free-on-non-malloc-d-a.patch \
>      file://0054-gcc-Makefile.in-fix-parallel-building-failure.patch \
>      file://0055-PR-rtl-optimization-61801.patch \
> +    file://0056-redefine-dynamic-linker-for-aarch64.patch \
>  "
>  SRC_URI[md5sum] = "fddf71348546af523353bd43d34919c1"
>  SRC_URI[sha256sum] = "d334781a124ada6f38e63b545e2a3b8c2183049515a1abab6d513f109f1d717e"
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0056-redefine-dynamic-linker-for-aarch64.patch b/meta/recipes-devtools/gcc/gcc-4.9/0056-redefine-dynamic-linker-for-aarch64.patch
> new file mode 100644
> index 0000000..6933e2f
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-4.9/0056-redefine-dynamic-linker-for-aarch64.patch
> @@ -0,0 +1,34 @@
> +From 8fbb60d89e569b68b13e4fd419e20640eb49cabc Mon Sep 17 00:00:00 2001
> +From: Kai Kang <kai.kang@windriver.com>
> +Date: Tue, 16 Sep 2014 16:01:31 +0800
> +Subject: [PATCH] Redefine dynamic linker for aarch64
> +
> +Redefine dynamic linker for aarch64 from /lib to /lib64.
> +
> +BASELIB of aarch64 has to be defined with 'lib64', then linker file
> +ld-linux-aarch64.so.1 is installed into /lib64 rather than /lib. So
> +update it here too.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +---
> + gcc/config/aarch64/aarch64-linux.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64/aarch64-linux.h
> +index a8f0771..2a6f06d 100644
> +--- a/gcc/config/aarch64/aarch64-linux.h
> ++++ b/gcc/config/aarch64/aarch64-linux.h
> +@@ -21,7 +21,7 @@
> + #ifndef GCC_AARCH64_LINUX_H
> + #define GCC_AARCH64_LINUX_H
> + 
> +-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-aarch64%{mbig-endian:_be}.so.1"
> ++#define GLIBC_DYNAMIC_LINKER "/lib64/ld-linux-aarch64%{mbig-endian:_be}.so.1"
> + 
> + #define CPP_SPEC "%{pthread:-D_REENTRANT}"
> + 
> +-- 
> +1.9.1
> +
> 

- -- 
- -Khem
-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.22 (Darwin)
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlQah2UACgkQuwUzVZGdMxT98wCghPbcAP/2xFgFn9Lv3Wisexa6
kHkAni6hykOqPq44VheOimbMbcimHaZD
=jpy6
-----END PGP SIGNATURE-----

