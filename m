Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 08FFE6B574
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2013 06:35:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r776Z34e015839
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Aug 2013 23:35:03 -0700 (PDT)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 6 Aug 2013 23:35:01 -0700
Message-ID: <5201EA90.2010600@windriver.com>
Date: Wed, 7 Aug 2013 14:34:56 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: "'Patches and discussions about the oe-core layer'"
	<openembedded-core@lists.openembedded.org>
Subject: nss-native fails to build with older binutils on host
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
X-List-Received-Date: Wed, 07 Aug 2013 06:35:02 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi folks,

I'm looking for a proper solution to fix this build failure:

Package name: nss-native
Host binutils version: 2.17.50.0.6-20.el5_8.3
Host type: CentOS 5.9

Error message:
--------------
gcc -o 
Linux3.4_x86_64_glibc_PTH_64_OPT.OBJ/Linux_SINGLE_SHLIB/intel-gcm.o -O2 
-D_POSIX_SOURCE -D_BSD_SOURCE -D_XOPEN_SOURCE -fPIC -DLINUX2_1  -Wall 
-Werror-implicit-function-declaration -Wno-switch -pipe -DLINUX -Dlinux 
-DHAVE_STRERROR -DXP_UNIX -DSHLIB_SUFFIX=\"so\" -DSHLIB_PREFIX=\"lib\" 
-DSHLIB_VERSION=\"3\" -DSOFTOKEN_SHLIB_VERSION=\"3\" 
-DRIJNDAEL_INCLUDE_TABLES -UDEBUG -DNDEBUG -D_REENTRANT -DNSS_ENABLE_ECC 
-DUSE_UTIL_DIRECTLY -DNO_NSPR_10_SUPPORT -DNSS_USE_64 -DFREEBL_NO_DEPEND 
-DNSS_X86_OR_X64 -DNSS_X64 -DNSS_BEVAND_ARCFOUR -DMPI_AMD64 
-DMP_ASSEMBLY_MULTIPLY -DNSS_USE_COMBA -DMP_CHAR_STORE_SLOW 
-DMP_IS_LITTLE_ENDIAN -DUSE_HW_AES -DMP_API_COMPATIBLE 
-I/home/nxadm/nx/yow-blade14.1/builds-2013-08-07-005810/qemumips_world_oe/bitbake_build/tmp/sysroots/x86_64-linux/usr/include 
-I../../../dist/Linux3.4_x86_64_glibc_PTH_64_OPT.OBJ/include 
-I../../../dist/public/nss -I../../../dist/private/nss -Impi -Iecl  -m64 
-fPIC -Wa,--noexecstack -c intel-gcm.s
intel-gcm.s: Assembler messages:
intel-gcm.s:39: Error: no such instruction: `vmovdqu (Tp),T'
intel-gcm.s:40: Error: no such instruction: `vpshufb .Lbswap_mask(%rip),T,T'
intel-gcm.s:41: Error: no such instruction: `vpxor TMP0,TMP0,TMP0'
intel-gcm.s:44: Error: no such instruction: `vpinsrq $0,Mlen,TMP0,TMP0'
intel-gcm.s:45: Error: no such instruction: `vpinsrq $1,Alen,TMP0,TMP0'
......

A similar bug at:

https://bugzilla.mozilla.org/show_bug.cgi?id=838401

That shows it caused by older host binutils (as|objdump).

I think this could be fixed by getting nss-native depends on 
binutils-native, but binutils-native somehow only install some libraries 
and remove all the binaries.

Could I just override the do_install_class-native() for binutils? Or 
provide a second recipe like 'binutils-tools-native' to produce the full 
binutils?

Any advices/suggestions will be welcome.


Thanks
Wenzong

