Return-Path: <masahiroy@kernel.org>
X-Greylist: delayed 567 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 22 Dec 2019 08:15:40 UTC
Received: from condef-10.nifty.com (condef-10.nifty.com [202.248.20.75])
	by mail.openembedded.org (Postfix) with ESMTP id D76A57FC1C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Dec 2019 08:15:40 +0000 (UTC)
Received: from conuserg-11.nifty.com ([10.126.8.74])by condef-10.nifty.com
	with ESMTP id xBM80Hmt012123
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Dec 2019 17:00:17 +0900
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net
	[126.93.102.113]) (authenticated)
	by conuserg-11.nifty.com with ESMTP id xBM7xuW1020538;
	Sun, 22 Dec 2019 16:59:56 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com xBM7xuW1020538
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1577001597;
	bh=FBgu6qFSAfwyyuQ3nzA3a0JoFTTdAfFmvwof0olvH58=;
	h=From:To:Cc:Subject:Date:From;
	b=eXWBLgmvazw2iiQRPhovaRQTDpT+Suiznpw3bRBMsVYNhVNOwq0dbptswwy1VvThX
	TdV66U0GHo1yTHwZL+/f8N8Pb+wjM9mQ/cmMjcVi3C0qoPWkSyVzcOO1Z13hEDc166
	Bj2HKIbi5IvohUePztRSatjiin2tP1ZqqDfk6BEECOu6NKVsKarrcEswI0RuRk2L8D
	o64WrWwXgvWtYZ15jnFOxnkikSrXjUcyO5XigaA9Hg1AyH8IPZgb3bPqD8nECezFN1
	X5dtZhAVTTbEmyupXWblyiOcFbISXuxyRlcv1fENo6LgFN0zpql5n/gTxjX1MALXLx
	AVD7FN1J/+l0w==
X-Nifty-SrcIP: [126.93.102.113]
From: Masahiro Yamada <masahiroy@kernel.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 22 Dec 2019 16:59:51 +0900
Message-Id: <20191222075951.20275-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] bitbake.conf: fix suspicious comparison with ('' or 'custom')
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
X-List-Received-Date: Sun, 22 Dec 2019 08:15:41 -0000

I am not sure what is intended by the code:

    d.getVar('TARGET_OS', d, 1) == ('' or 'custom')

This is equivalent to:

    d.getVar('TARGET_OS', d, 1) == 'custom'

If the intended behavior is to take the second element of the array
when TARGET_OS is empty or 'custom', the correct code would be:

    d.getVar('TARGET_OS', d, 1) == '' or
    d.getVar('TARGET_OS', d, 1) == 'custom'

Or, more simply:

    d.getVar('TARGET_OS', d, 1) in ('', 'custom')

I guess this is probably the intended behavior.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 meta/conf/bitbake.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index e75bbcece0..7dc446b9a4 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -129,7 +129,7 @@ SDKUSE_NLS ??= "yes"
 TARGET_ARCH = "${TUNE_ARCH}"
 TARGET_OS = "linux${LIBCEXTENSION}${ABIEXTENSION}"
 TARGET_VENDOR = "-oe"
-TARGET_SYS = "${TARGET_ARCH}${TARGET_VENDOR}${@['-' + d.getVar('TARGET_OS'), ''][d.getVar('TARGET_OS') == ('' or 'custom')]}"
+TARGET_SYS = "${TARGET_ARCH}${TARGET_VENDOR}${@['-' + d.getVar('TARGET_OS'), ''][d.getVar('TARGET_OS') in ('', 'custom')]}"
 TARGET_PREFIX = "${TARGET_SYS}-"
 TARGET_CC_ARCH = "${TUNE_CCARGS}"
 TARGET_LD_ARCH = "${TUNE_LDARGS}"
@@ -138,7 +138,7 @@ TARGET_AS_ARCH = "${TUNE_ASARGS}"
 SDKMACHINE ??= "x86_64"
 SDK_OS = "${BUILD_OS}"
 SDK_VENDOR = "-oesdk"
-SDK_SYS = "${SDK_ARCH}${SDK_VENDOR}${@['-' + d.getVar('SDK_OS'), ''][d.getVar('SDK_OS') == ('' or 'custom')]}"
+SDK_SYS = "${SDK_ARCH}${SDK_VENDOR}${@['-' + d.getVar('SDK_OS'), ''][d.getVar('SDK_OS') in ('', 'custom')]}"
 SDK_PREFIX = "${SDK_SYS}-"
 SDK_CC_ARCH = "${BUILD_CC_ARCH}"
 SDKPKGSUFFIX = "nativesdk"
-- 
2.17.1


