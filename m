Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id D325F6C856
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 07:25:59 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id x12so284450wgg.16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 00:26:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0SIb817reDg3o4u74GZNgQxBQ1o6HoUWO02UHWgvBUA=;
	b=TZoCReG6BhNANxGXfYOkh4m56P3ND4o5YnEASx528l9R8rToDoSMHIu/fuLjsZs50x
	dEflsnwH2jxyVc6hsKNH36DsaWqGIsBuybpkyj9sh0lpwtXE89lpYYKuTGH5gETg1A8b
	MmTMu4Umt2aCXVSrHxTfW7Ie8yzLKGG12Xs20TqwLCzoVN05Xgm6r+AEb/eLHe6OS2WD
	nCkI6qPLYYyWApLPDnUPpsoz2gLmujAj6pZ5xs25sa6Bf+8V/ay5Vl2a2cYkFI707AHM
	htswG3LMZz8pcbAADvvrNNvRePF842xiXNXiixHI8UlwjDJAW5AU4PI1gNlqUEbD8sTA
	UIOQ==
X-Gm-Message-State: ALoCoQkhI0Tc2+A4PprkiCdfj5HDr2/Q2cO9btJnCBpk2Eff6qaTVfLrX+t5CAho9LmPLJpUNQGt
X-Received: by 10.180.36.80 with SMTP id o16mr995344wij.1.1381908361402;
	Wed, 16 Oct 2013 00:26:01 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPSA id jf2sm3080211wic.2.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 16 Oct 2013 00:26:00 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Oct 2013 09:25:55 +0200
Message-Id: <1381908355-18124-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.3.1
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCHv2] openssl: switch ARM builds from linux-elf-arm to linux-armv4 config
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
X-List-Received-Date: Wed, 16 Oct 2013 07:26:00 -0000

From: Koen Kooi <koen.kooi@linaro.org>

This enables aes and sha1 assembly at buildtime. Openssl does a
runtime check to see which portion gets enabled.

'./Configure TABLE' gives the following:

*** linux-elf-arm
$cc           =
$cflags       = -DL_ENDIAN      -DTERMIO  -O2 -pipe -g -feliminate-unused-debug-types -Wall -Wa,--noexecstack -DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS
$unistd       =
$thread_cflag = -D_REENTRANT
$sys_id       =
$lflags       = -ldl
$bn_ops       = BN_LLONG DES_RISC1
$cpuid_obj    =
$bn_obj       =
$des_obj      =
$aes_obj      =
$bf_obj       =
$md5_obj      =
$sha1_obj     =
$cast_obj     =
$rc4_obj      =
$rmd160_obj   =
$rc5_obj      =
$wp_obj       =
$cmll_obj     =
$modes_obj    =
$engines_obj  =
$perlasm_scheme = void
$dso_scheme   = dlfcn
$shared_target= linux-shared
$shared_cflag = -fPIC
$shared_ldflag =
$shared_extension = .so.$(SHLIB_MAJOR).$(SHLIB_MINOR)
$ranlib       =
$arflags      =
$multilib     =

*** linux-armv4
$cc           = gcc
$cflags       = -DTERMIO -O3 -Wall
$unistd       =
$thread_cflag = -D_REENTRANT
$sys_id       =
$lflags       = -ldl
$bn_ops       = BN_LLONG RC4_CHAR RC4_CHUNK DES_INT DES_UNROLL BF_PTR
$cpuid_obj    = armcap.o armv4cpuid.o
$bn_obj       = bn_asm.o armv4-mont.o armv4-gf2m.o
$des_obj      =
$aes_obj      = aes_cbc.o aes-armv4.o bsaes-armv7.o
$bf_obj       =
$md5_obj      =
$sha1_obj     = sha1-armv4-large.o sha256-armv4.o sha512-armv4.o
$cast_obj     =
$rc4_obj      =
$rmd160_obj   =
$rc5_obj      =
$wp_obj       =
$cmll_obj     =
$modes_obj    = ghash-armv4.o
$engines_obj  =
$perlasm_scheme = void
$dso_scheme   = dlfcn
$shared_target= linux-shared
$shared_cflag = -fPIC
$shared_ldflag =
$shared_extension = .so.$(SHLIB_MAJOR).$(SHLIB_MINOR)
$ranlib       =
$arflags      =
$multilib     =

Build tested on armv7a/angstrom and armv8/distroless, runtime tested on armv7a/angstrom.

'openssl speed' results:

Algo    blocksize       ops/s after
                ops/s before    difference
-------------------------------------------
MD5	16	308,766	264,664	-14.28%
	64	277,090	263,340	-4.96%
	256	212,652	197,043	-7.34%
	1024	103,604	100,157	-3.33%
	8192	17,936	17,796	-0.78%
sha1	16	290,011	385,098	32.79%
	64	234,939	302,788	28.88%
	256	144,831	177,028	22.23%
	1024	57,043	67,374	18.11%
	8192	8,586	9,932	15.68%
sha256	16	290,443	605,747	108.56%
	64	178,010	370,598	108.19%
	256	82,107	168,770	105.55%
	1024	26,064	53,068	103.61%
	8192	3,550	7,211	103.10%
sha512	16	59,618	259,354	335.03%
	64	59,616	258,265	333.22%
	256	21,727	98,057	351.31%
	1024	7,449	34,304	360.49%
	8192	1,047	4,842	362.63%
des cbc	16	964,682	1,124,459	16.56%
	64	260,188	298,910	14.88%
	256	65,945	76,273	15.66%
	1024	16,570	19,110	15.33%
	8192	2,082	2,398	15.17%
des ede3	16	370,442	429,906	16.05%
	64	95,429	110,147	15.42%
	256	23,928	27,808	16.21%
	1024	5,993	6,960	16.13%
	8192	752	868	15.36%
aes128	16	1,712,050	2,301,100	34.41%
	64	466,491	651,155	39.59%
	256	120,181	168,953	40.58%
	1024	30,177	42,792	41.80%
	8192	3,791	5,361	41.41%
aes192	16	1,472,560	1,964,900	33.43%
	64	400,087	544,971	36.21%
	256	103,245	141,062	36.63%
	1024	25,902	35,389	36.63%
	8192	3,256	4,451	36.67%
eas256	16	1,330,524	1,772,143	33.19%
	64	355,025	486,221	36.95%
	256	90,663	125,281	38.18%
	1024	22,725	31,484	38.54%
	8192	2,837	3,952	39.31%
rsa	2048bit	15	25	69.94%
	public	547	832	52.00%
dsa	2048bit	55	86	54.26%
	verify	47	73	53.33%

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/recipes-connectivity/openssl/openssl.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index f5b2432..f0fa180 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -61,7 +61,7 @@ do_configure () {
 	target="$os-${HOST_ARCH}"
 	case $target in
 	linux-arm)
-		target=linux-elf-arm
+		target=linux-armv4
 		;;
 	linux-armeb)
 		target=linux-elf-armeb
-- 
1.8.3.1


