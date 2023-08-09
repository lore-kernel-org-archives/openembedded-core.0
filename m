Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFDA5C04A94
	for <webhook@archiver.kernel.org>; Wed,  9 Aug 2023 14:55:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.90268.1691592933690863459
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Aug 2023 07:55:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 80DDED75;
	Wed,  9 Aug 2023 07:56:15 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EE62B3F59C;
	Wed,  9 Aug 2023 07:55:31 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH v2] linux-yocto: add script to generate kernel CVE_STATUS entries
Date: Wed,  9 Aug 2023 15:55:29 +0100
Message-Id: <20230809145529.3111980-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 14:55:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185710

From: Ross Burton <ross.burton@arm.com>

Instead of manually looking up new CVEs and determining what point
releases the fixes are incorporated into, add a script to generate the
CVE_STATUS data automatically.

First, note that this is very much an interim solution until the
cve-check class fetches data from www.linuxkernelcves.com directly.

The script should be passed the path to a local clone of the
linuxkernelcves repository[1] and the kernel version number. It will
then write to standard output the CVE_STATUS entries for every known
kernel CVE.

The script should be periodically reran as CVEs are backported and
kernels upgraded frequently.

[1] https://github.com/nluedtke/linux_kernel_cves

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../linux/cve-exclusion_6.1.inc               | 5572 +++++++++++++++--
 .../linux/cve-exclusion_6.4.inc               | 4967 +++++++++++++++
 .../linux/generate-cve-exclusions.py          |   89 +
 3 files changed, 10023 insertions(+), 605 deletions(-)
 create mode 100644 meta/recipes-kernel/linux/cve-exclusion_6.4.inc
 create mode 100755 meta/recipes-kernel/linux/generate-cve-exclusions.py

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc b/meta/recip=
es-kernel/linux/cve-exclusion_6.1.inc
index 6505fbeb605..2441788008a 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
@@ -1,605 +1,4967 @@
-CVE_STATUS[CVE-2018-6559] =3D "not-applicable-platform: Issue only affec=
ts Ubuntu"
-
-# https://www.linuxkernelcves.com/cves/CVE-2019-3016
-# Fixed with 5.6
-CVE_STATUS[CVE-2019-3016] =3D "fixed-version: Fixed in version v5.6"
-
-# https://www.linuxkernelcves.com/cves/CVE-2019-3819
-# Fixed with 5.1
-CVE_STATUS[CVE-2019-3819] =3D "fixed-version: Fixed in version v5.1"
-
-# https://www.linuxkernelcves.com/cves/CVE-2019-3887
-# Fixed with 5.2
-CVE_STATUS[CVE-2019-3887] =3D "fixed-version: Fixed in version v5.2"
-
-CVE_STATUS[CVE-2020-11935] =3D "not-applicable-config: Issue only affect=
s aufs, which is not in linux-yocto"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2020-27784
-# Introduced in version v4.1 b26394bd567e5ebe57ec4dee7fe6cd14023c96e9
-#=C2=A0Patched in kernel since v5.10	e8d5f92b8d30bb4ade76494490c3c065e12=
411b1
-# Backported in version v5.4.73	e9e791f5c39ab30e374a3b1a9c25ca7ff24988f3
-CVE_STATUS[CVE-2020-27784] =3D "cpe-stable-backport: Backported in versi=
on v5.4.73"
-
-
-# 2021
-
-# https://nvd.nist.gov/vuln/detail/CVE-2021-3669
-# Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
-# Patched in kernel since v5.15 20401d1058f3f841f35a594ac2fc1293710e55b9
-CVE_STATUS[CVE-2021-3669] =3D "fixed-version: Fixed in version v5.15"
-
-#=C2=A0https://nvd.nist.gov/vuln/detail/CVE-2021-3759
-# Introduced in version v4.5 a9bb7e620efdfd29b6d1c238041173e411670996
-#=C2=A0Patched in kernel since v5.15 18319498fdd4cdf8c1c2c48cd432863b1f9=
15d6f
-# Backported in version v5.4.224 bad83d55134e647a739ebef2082541963f2cbc9=
2
-# Backported in version v5.10.154 836686e1a01d7e2fda6a5a18252243ff30a6e1=
96
-CVE_STATUS[CVE-2021-3759] =3D "cpe-stable-backport: Backported in versio=
ns v5.4.224 and v6.1.11"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2021-4218
-# Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
-# Patched in kernel since v5.8 32927393dc1ccd60fb2bdc05b9e8e88753761469
-CVE_STATUS[CVE-2021-4218] =3D "fixed-version: Fixed in version v5.8"
-
-
-# 2022
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-0480
-# Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
-# Patched in kernel since v5.15 0f12156dff2862ac54235fc72703f18770769042
-CVE_STATUS[CVE-2022-0480] =3D "fixed-version: Fixed in version v5.15"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-1184
-# Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
-# Patched in kernel since v5.19 46c116b920ebec58031f0a78c5ea9599b0d2a371
-# Backported in version v5.4.198 17034d45ec443fb0e3c0e7297f9cd10f7044606=
4
-# Backported in version v5.10.121 da2f05919238c7bdc6e28c79539f55c8355408=
bb
-# Backported in version v5.15.46 ca17db384762be0ec38373a12460081d22a8b42=
d
-CVE_STATUS[CVE-2022-1184] =3D "cpe-stable-backport: Backported in versio=
ns v5.4.198, v5.10.121 and v5.15.46"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-1462
-# Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
-# Patched in kernel since v5.19 a501ab75e7624d133a5a3c7ec010687c8b961d23
-# Backported in version v5.4.208 f7785092cb7f022f59ebdaa181651f7c877df13=
2
-# Backported in version v5.10.134 08afa87f58d83dfe040572ed591b47e8cb9e22=
5c
-# Backported in version v5.15.58 b2d1e4cd558cffec6bfe318f5d74e6cffc374d2=
9
-CVE_STATUS[CVE-2022-1462] =3D "cpe-stable-backport: Backported in versio=
ns v5.4.208, v5.10.134 and v5.15.58"
-
-#=C2=A0https://nvd.nist.gov/vuln/detail/CVE-2022-2196
-# Introduced in version v5.8 5c911beff20aa8639e7a1f28988736c13e03ed54
-# Breaking commit backported in v5.4.47 64b8f33b2e1e687d465b5cb382e7bec4=
95f1e026
-# Patched in kernel since v6.2 2e7eab81425ad6c875f2ed47c0ce01e78afc38a5
-# Backported in version v5.4.233 f93a1a5bdcdd122aae0a3eab7a52c15b71fb725=
b
-# Backported in version v5.10.170 1b0cafaae8884726c597caded50af185ffc133=
49
-# Backported in version v5.15.96 6b539a7dbb49250f92515c2ba60aea239efc9e3=
5
-# Backported in version v6.1.14 63fada296062e91ad9f871970d4e7f19e21a6a15
-CVE_STATUS[CVE-2022-2196] =3D "cpe-stable-backport: Backported in versio=
ns v5.4.1233, v5.10.170, v5.15.46 and v6.1.14"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-2308
-# Introduced in version v5.15 c8a6153b6c59d95c0e091f053f6f180952ade91e
-# Patched in kernel since v6.0 46f8a29272e51b6df7393d58fc5cb8967397ef2b
-# Backported in version v5.15.72 dc248ddf41eab4566e95b1ee2433c8a5134ad94=
a
-# Backported in version v5.19.14 38d854c4a11c3bbf6a96ea46f14b282670c784a=
c
-CVE_STATUS[CVE-2022-2308] =3D "cpe-stable-backport: Backported in versio=
ns v5.15.72 and v5.19.14"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-2327
-# Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
-# Patched in kernel since v5.10.125 df3f3bb5059d20ef094d6b2f0256c4bf4127=
a859
-CVE_STATUS[CVE-2022-2327] =3D "fixed-version: Fixed in version v5.10.125=
"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-2663
-# Introduced in version v2.6.20 869f37d8e48f3911eb70f38a994feaa8f8380008
-# Patched in kernel since v6.0 0efe125cfb99e6773a7434f3463f7c2fa28f3a43
-# Backported in version v5.4.213 36f7b71f8ad8e4d224b45f7d6ecfeff63b09154=
7
-# Backported in version v5.10.143 e12ce30fe593dd438c5b392290ad7316befc11=
ca
-# Backported in version v5.15.68 451c9ce1e2fc9b9e40303bef8e5a0dca1a923cc=
4
-# Backported in version v5.19.9 6cf0609154b2ce8d3ae160e7506ab316400a8d3d
-CVE_STATUS[CVE-2022-2663] =3D "cpe-stable-backport: Backported in versio=
ns v5.4.213, v5.10.143, v5.15.68 and v5.19.9"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-2785
-# Introduced in version v5.18 b1d18a7574d0df5eb4117c14742baf8bc2b9bb74
-# Patched in kernel since v6.0 86f44fcec22ce2979507742bc53db8400e454f46
-# Backported in version v5.19.4 b429d0b9a7a0f3dddb1f782b72629e6353f292fd
-CVE_STATUS[CVE-2022-2785] =3D "cpe-stable-backport: Backported in versio=
n v5.19.4"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-3176
-# Introduced in version v5.1 221c5eb2338232f7340386de1c43decc32682e58
-# Patched in kernel since v5.17 791f3465c4afde02d7f16cf7424ca87070b69396
-# Backported in version v5.15.65 e9d7ca0c4640cbebe6840ee3bac66a25a9bacaf=
5
-CVE_STATUS[CVE-2022-3176] =3D "cpe-stable-backport: Backported in versio=
n v5.15.65"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-3424
-# Introduced in version v2.6.33 55484c45dbeca2eec7642932ec3f60f8a2d4bdbf
-# Patched in kernel since v6.2 643a16a0eb1d6ac23744bb6e90a00fc21148a9dc
-# Backported in version v5.4.229 0078dd8758561540ed30b2c5daa1cb647e75897=
7
-# Backported in version v5.10.163 0f67ed565f20ea2fdd98e3b0b0169d9e580bb8=
3c
-# Backported in version v5.15.86 d5c8f9003a289ee2a9b564d109e021fc4d05d10=
6
-# Backported in version v6.1.2 4e947fc71bec7c7da791f8562d5da233b235ba5e
-CVE_STATUS[CVE-2022-3424] =3D "cpe-stable-backport: Backported in versio=
ns v5.4.229, v5.10.163, v5.15.86 and v 6.1.2"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-3435
-# Introduced in version v5.18 6bf92d70e690b7ff12b24f4bfff5e5434d019b82
-#=C2=A0Breaking commit backported in v5.4.189 f5064531c23ad646da7be8b938=
292b00a7e61438
-#=C2=A0Breaking commit backported in v5.10.111 63ea57478aaa3e06a597081a0=
f537318fc04e49f
-#=C2=A0Breaking commit backported in v5.15.34 907c97986d6fa77318d17659dd=
76c94b65dd27c5
-# Patched in kernel since v6.1 61b91eb33a69c3be11b259c5ea484505cd79f883
-# Backported in version v5.4.226 cc3cd130ecfb8b0ae52e235e487bae3f16a24a3=
2
-# Backported in version v5.10.158 0b5394229ebae09afc07aabccb5ffd705ffd25=
0e
-# Backported in version v5.15.82 25174d91e4a32a24204060d283bd5fa6d0ddf13=
3
-CVE_STATUS[CVE-2022-3435] =3D "cpe-stable-backport: Backported in versio=
ns v5.4.226, v5.10.158 and v5.15.82"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-3523
-# Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
-# Patched in kernel since v6.1 16ce101db85db694a91380aa4c89b25530871d33
-CVE_STATUS[CVE-2022-3523] =3D "fixed-version: Fixed in version v6.1"
-
-#=C2=A0https://nvd.nist.gov/vuln/detail/CVE-2022-3526
-# Introduced in version v5.13 427f0c8c194b22edcafef1b0a42995ddc5c2227d
-# Patched in kernel since v5.18 e16b859872b87650bb55b12cca5a5fcdc49c1442
-# Backported in version v5.15.35 8f79ce226ad2e9b2ec598de2b9560863b7549d1=
b
-CVE_STATUS[CVE-2022-3526] =3D "cpe-stable-backport: Backported in versio=
n v5.15.35"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-3534
-#=C2=A0Introduced in version v5.10 919d2b1dbb074d438027135ba644411931179=
a59
-# Patched in kernel since v6.2 93c660ca40b5d2f7c1b1626e955a8e9fa30e0749
-# Backported in version v5.10.163 c61650b869e0b6fb0c0a28ed42d928eea969af=
c8
-# Backported in version v5.15.86 a733bf10198eb5bb927890940de8ab457491ed3=
b
-# Backported in version v6.1.2 fbe08093fb2334549859829ef81d42570812597d
-CVE_STATUS[CVE-2022-3534] =3D "cpe-stable-backport: Backported in versio=
ns v5.10.163, v5.15.86 and v6.1.2"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-3564
-#=C2=A0Introduced in version v3.6 4b51dae96731c9d82f5634e75ac7ffd3b9c1b0=
60
-# Patched in kernel since v6.1 3aff8aaca4e36dc8b17eaa011684881a80238966
-# Backported in version v5.10.154 cb1c012099ef5904cd468bdb8d6fcdfdd9bcb5=
69
-# Backported in version v5.15.78 8278a87bb1eeea94350d675ef961ee5a03341fd=
e
-CVE_STATUS[CVE-2022-3564] =3D "cpe-stable-backport: Backported in versio=
ns v5.10.154 and v5.15.78"
-
-#=C2=A0https://nvd.nist.gov/vuln/detail/CVE-2022-3566
-# Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
-# Patched in kernel since v6.1 f49cd2f4d6170d27a2c61f1fecb03d8a70c91f57
-CVE_STATUS[CVE-2022-3566] =3D "fixed-version: Fixed in version v6.1"
-
-#=C2=A0https://nvd.nist.gov/vuln/detail/CVE-2022-3567
-# Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
-# Patched in kernel since v6.1 364f997b5cfe1db0d63a390fe7c801fa2b3115f6
-CVE_STATUS[CVE-2022-3567] =3D "fixed-version: Fixed in version v6.1"
-
-#=C2=A0https://nvd.nist.gov/vuln/detail/CVE-2022-3619
-# Introduced in version v5.12 4d7ea8ee90e42fc75995f6fb24032d3233314528
-# Patched in kernel since v6.1 7c9524d929648935bac2bbb4c20437df8f9c3f42
-# Backported in version v5.15.78 aa16cac06b752e5f609c106735bd7838f444784=
c
-CVE_STATUS[CVE-2022-3619] =3D "cpe-stable-backport: Backported in versio=
n v5.15.78"
-
-#=C2=A0https://nvd.nist.gov/vuln/detail/CVE-2022-3621
-# Introduced in version v2.60.30 05fe58fdc10df9ebea04c0eaed57adc47af5c18=
4
-# Patched in kernel since v6.1 21a87d88c2253350e115029f14fe2a10a7e6c856
-# Backported in version v5.4.218 792211333ad77fcea50a44bb7f695783159fc63=
c
-# Backported in version v5.10.148 3f840480e31495ce674db4a69912882b5ac083=
f2
-# Backported in version v5.15.74 1e512c65b4adcdbdf7aead052f2162b079cc7f5=
5
-# Backported in version v5.19.16 caf2c6b580433b3d3e413a3d54b8414a94725dc=
d
-CVE_STATUS[CVE-2022-3621] =3D "cpe-stable-backport: Backported in versio=
ns v5.4.218, v5.10.148, v5.15.74 and v5.19.16"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-3623
-# Introduced in version v5.1 5480280d3f2d11d47f9be59d49b20a8d7d1b33e8
-# Patched in kernel since v6.1 fac35ba763ed07ba93154c95ffc0c4a55023707f
-# Backported in version v5.4.228 176ba4c19d1bb153aa6baaa61d586e785b7d736=
c
-# Backported in version v5.10.159 fccee93eb20d72f5390432ecea7f8c16af88c8=
50
-# Backported in version v5.15.78 3a44ae4afaa5318baed3c6e2959f24454e0ae4f=
f
-# Backported in version v5.19.17 86a913d55c89dd13ba070a87f61a493563e94b5=
4
-CVE_STATUS[CVE-2022-3623] =3D "cpe-stable-backport: Backported in versio=
ns v5.4.228, v5.10.159, v5.15.78 and v 5.19.17"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-3624
-# Introduced in version v6.0 d5410ac7b0baeca91cf73ff5241d35998ecc8c9e
-# Patched in kernel since v6.0 4f5d33f4f798b1c6d92b613f0087f639d9836971
-CVE_STATUS[CVE-2022-3624] =3D "fixed-version: Fixed in version v6.0"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-3625
-# Introduced in version v4.19 45f05def5c44c806f094709f1c9b03dcecdd54f0
-# Patched in kernel since v6.0 6b4db2e528f650c7fb712961aac36455468d5902
-# Backported in version v5.4.211 1ad4ba9341f15412cf86dc6addbb73871a10212=
f
-# Backported in version v5.10.138 0e28678a770df7989108327cfe86f835d8760c=
33
-# Backported in version v5.15.63 c4d09fd1e18bac11c2f7cf73604811256868730=
1
-# Backported in version v5.19.4 26bef5616255066268c0e40e1da10cc9b78b82e9
-CVE_STATUS[CVE-2022-3625] =3D "cpe-stable-backport: Backported in versio=
ns v5.4.211, v5.10.138, v5.15.63 and v5.19.4"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-3629
-# Introduced in version v3.9 d021c344051af91f42c5ba9fdedc176740cbd238
-# Patched in kernel since v6.0 7e97cfed9929eaabc41829c395eb0d1350fccb9d
-# Backported in version v5.4.211 f82f1e2042b397277cd39f16349950f5abade58=
d
-# Backported in version v5.10.138 38ddccbda5e8b762c8ee06670bb1f64f1be5ee=
50
-# Backported in version v5.15.63 e4c0428f8a6fc8c218d7fd72bddd163f05b2979=
5
-# Backported in version v5.19.4 8ff5db3c1b3d6797eda5cd326dcd31b9cd1c5f72
-CVE_STATUS[CVE-2022-3629] =3D "cpe-stable-backport: Backported in versio=
ns v5.4.211, v5.10.138, v5.15.63 and v5.19.4"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-3630
-# Introduced in version v5.19 85e4ea1049c70fb99de5c6057e835d151fb647da
-# Patched in kernel since v6.0 fb24771faf72a2fd62b3b6287af3c610c3ec9cf1
-# Backported in version v5.19.4 7a369dc87b66acc85d0cffcf39984344a203e20b
-CVE_STATUS[CVE-2022-3630] =3D "cpe-stable-backport: Backported in versio=
n v5.19.4"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-3633
-# Introduced in version v5.4 9d71dd0c70099914fcd063135da3c580865e924c
-# Patched in kernel since v6.0 8c21c54a53ab21842f5050fa090f26b03c0313d6
-# Backported in version v5.4.211 04e41b6bacf474f5431491f92e981096e8cc8e9=
3
-# Backported in version v5.10.138 a220ff343396bae8d3b6abee72ab51f1f34b30=
27
-# Backported in version v5.15.63 98dc8fb08299ab49e0b9c08daedadd2f4de1a2f=
2
-# Backported in version v5.19.4 a0278dbeaaf7ca60346c62a9add65ae7d62564de
-CVE_STATUS[CVE-2022-3633] =3D "cpe-stable-backport: Backported in versio=
ns v5.4.211, v5.10.138, v5.15.63 and v5.19.4"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-3635
-# Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
-# Patched in kernel since v6.0 3f4093e2bf4673f218c0bf17d8362337c400e77b
-# Backported in version v5.4.211 9a6cbaa50f263b12df18a051b37f3f42f9fb525=
3
-# Backported in version v5.10.138 a0ae122e9aeccbff75014c4d36d11a9d32e7fb=
5e
-# Backported in version v5.15.63 a5d7ce086fe942c5ab422fd2c034968a152be4c=
4
-# Backported in version v5.19.4 af412b252550f9ac36d9add7b013c2a2c3463835
-CVE_STATUS[CVE-2022-3635] =3D "cpe-stable-backport: Backported in versio=
ns v5.4.211, v5.10.138, v5.15.63 and v5.19.4"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-3636
-# Introduced in version v5.19 33fc42de33278b2b3ec6f3390512987bc29a62b7
-# Patched in kernel since v5.19 17a5f6a78dc7b8db385de346092d7d9f9dc24df6
-CVE_STATUS[CVE-2022-3636] =3D "cpe-stable-backport: Backported in versio=
n v5.19"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-3640
-# Introduced in version v5.19 d0be8347c623e0ac4202a1d4e0373882821f56b0
-# Breaking commit backported in v5.4.209 098e07ef0059296e710a801cdbd74b5=
9016e6624
-# Breaking commit backported in v5.10.135 de5d4654ac6c22b1be756fdf7db184=
71e7df01ea
-# Breaking commit backported in v5.15.59 f32d5615a78a1256c4f557ccc654386=
6e75d03f4
-# Patched in kernel since v6.1 0d0e2d032811280b927650ff3c15fe5020e82533
-# Backported in version v5.4.224 c1f594dddd9ffd747c39f49cc5b67a9b7677d2a=
b
-# Backported in version v5.10.154 d9ec6e2fbd4a565b2345d4852f586b7ae3ab41=
fd
-# Backported in version v5.15.78 a3a7b2ac64de232edb67279e804932cb42f0b52=
a
-CVE_STATUS[CVE-2022-3640] =3D "cpe-stable-backport: Backported in versio=
ns v5.4.224, v5.10.154 and v5.15.78"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-3646
-# Introduced in version v2.6.30 9ff05123e3bfbb1d2b68ba1d9bf1f7d1dffc1453
-# Patched in kernel since v6.1 d0d51a97063db4704a5ef6bc978dddab1636a306
-# Backported in version v5.4.218 b7e409d11db9ce9f8bc05fcdfa24d143f60cd39=
3
-# Backported in version v5.10.148 aad4c997857f1d4b6c1e296c07e4729d3f8058=
ee
-# Backported in version v5.15.74 44b1ee304bac03f1b879be5afe920e3a844e40f=
c
-# Backported in version v5.19.16 4755fcd844240857b525f6e8d8b65ee140fe957=
0
-CVE_STATUS[CVE-2022-3646] =3D "cpe-stable-backport: Backported in versio=
ns v5.4.218, v5.10.148, v5.15.74 and v5.19.16"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-3649
-# Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
-# Patched in kernel since v6.1 d325dc6eb763c10f591c239550b8c7e5466a5d09
-# Backported in version v5.4.220 d1c2d820a2cd73867b7d352e89e92fb3ac29e92=
6
-# Backported in version v5.10.148 21ee3cffed8fbabb669435facfd576ba18ac86=
52
-# Backported in version v5.15.74 cb602c2b654e26763226d8bd27a702f79cff400=
6
-# Backported in version v5.19.16 394b2571e9a74ddaed55aa9c4d0f5772f81c21e=
4
-CVE_STATUS[CVE-2022-3649] =3D "cpe-stable-backport: Backported in versio=
ns v5.4.220, v5.10.148, v5.15.74 and v5.19.16"
-
-#=C2=A0https://nvd.nist.gov/vuln/detail/CVE-2022-4382
-# Introduced in version v5.3 e5d82a7360d124ae1a38c2a5eac92ba49b125191
-# Patched in kernel since v6.2-rc5 d18dcfe9860e842f394e37ba01ca9440ab217=
8f4
-# Backported in version v5.4.230 9a39f4626b361ee7aa10fd990401c37ec3b466a=
e
-# Backported in version v5.10.165 856e4b5e53f21edbd15d275dde62228dd94fb2=
b4
-# Backported in version v5.15.90 a2e075f40122d8daf587db126c562a67abd69cf=
9
-# Backported in version v6.1.8 616fd34d017000ecf9097368b13d8a266f4920b3
-CVE_STATUS[CVE-2022-4382] =3D "cpe-stable-backport: Backported in versio=
ns v5.4.230, v5.10.165, v5.15.90 and v6.1.8"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-26365
-# Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
-# Patched in kernel since v5.19 2f446ffe9d737e9a844b97887919c4fda18246e7
-# Backported in version v5.4.204 42112e8f94617d83943f8f3b8de2b6604190550=
6
-# Backported in version v5.10.129 cfea428030be836d79a7690968232bb7fa4410=
f1
-# Backported in version v5.15.53 7ed65a4ad8fa9f40bc3979b32c54243d6a684ec=
9
-CVE_STATUS[CVE-2022-26365] =3D "cpe-stable-backport: Backported in versi=
ons v5.4.204, v5.10.129 and v5.15.53"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-33740
-# Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
-# Patched in kernel since v5.19 307c8de2b02344805ebead3440d8feed28f2f010
-# Backported in version v5.4.204 04945b5beb73019145ac17a2565526afa7293c1=
4
-# Backported in version v5.10.129 728d68bfe68d92eae1407b8a9edc7817d62274=
04
-# Backported in version v5.15.53 5dd0993c36832d33820238fc8dc741ba801b796=
1
-CVE_STATUS[CVE-2022-33740] =3D "cpe-stable-backport: Backported in versi=
ons v5.4.204, v5.10.129 and v5.15.53"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-33741
-# Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
-# Patched in kernel since v5.19 4491001c2e0fa69efbb748c96ec96b100a5cdb7e
-# Backported in version v5.4.204 ede57be88a5fff42cd00e6bcd071503194d398d=
d
-# Backported in version v5.10.129 4923217af5742a796821272ee03f8d6de15c0c=
ca
-# Backported in version v5.15.53 ed3cfc690675d852c3416aedb271e0e7d179bf4=
9
-CVE_STATUS[CVE-2022-33741] =3D "cpe-stable-backport: Backported in versi=
ons v5.4.204, v5.10.129 and v5.15.53"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-33742
-# Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
-# Patched in kernel since v5.19 2400617da7eebf9167d71a46122828bc479d64c9
-# Backported in version v5.4.204 60ac50daad36ef3fe9d70d89cfe3b95d381db99=
7
-# Backported in version v5.10.129 cbbd2d2531539212ff090aecbea9877c996e6c=
e6
-# Backported in version v5.15.53 6d0a9127279a4533815202e30ad1b3a39f560ba=
3
-CVE_STATUS[CVE-2022-33742] =3D "cpe-stable-backport: Backported in versi=
ons v5.4.204, v5.10.129 and v5.15.53"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-42895
-# Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
-# Patched in kernel since v6.1 b1a2cd50c0357f243b7435a732b4e62ba3157a2e
-# Backported in version v5.4.224 6949400ec9feca7f88c0f6ca5cb5fdbcef419c8=
9
-# Backported in version v5.10.154 26ca2ac091b49281d73df86111d16e5a76e43b=
d7
-# Backported in version v5.15.78 3e4697ffdfbb38a2755012c4e571546c89ab642=
2
-CVE_STATUS[CVE-2022-42895] =3D "cpe-stable-backport: Backported in versi=
ons v5.4.224, v5.10.154 and v5.15.78"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-42896
-# Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
-# Patched in kernel since v6.1 711f8c3fb3db61897080468586b970c87c61d9e4
-# Backported in version v5.4.226 0d87bb6070361e5d1d9cb391ba7ee73413bc109=
b
-# Backported in version v5.10.154 6b6f94fb9a74dd2891f11de4e638c6202bc894=
76
-# Backported in version v5.15.78 81035e1201e26d57d9733ac59140a3e29befbc5=
a
-CVE_STATUS[CVE-2022-42896] =3D "cpe-stable-backport: Backported in versi=
ons v5.4.226, v5.10.154 and v5.15.78"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-38457
-# https://nvd.nist.gov/vuln/detail/CVE-2022-40133
-# Both CVE-2022-38457 & CVE-2022-40133 are fixed by the same commit:
-# Introduced in version v4.20 e14c02e6b6990e9f6ee18a214a22ac26bae1b25e
-# Patched in kernel since v6.2 a309c7194e8a2f8bd4539b9449917913f6c2cd50
-# Backported in version v6.1.7 7ac9578e45b20e3f3c0c8eb71f5417a499a7226a
-# See:
-#  * https://www.linuxkernelcves.com/cves/CVE-2022-38457
-#  * https://www.linuxkernelcves.com/cves/CVE-2022-40133
-#  * https://lore.kernel.org/all/CAODzB9q3OBD0k6W2bcWrSZo2jC3EvV0PrLyWmO=
07rxR4nQgkJA@mail.gmail.com/T/
-CVE_STATUS[CVE-2022-38457] =3D "cpe-stable-backport: Backported in versi=
on v6.1.7"
-CVE_STATUS[CVE-2022-40133] =3D "cpe-stable-backport: Backported in versi=
on v6.1.7"
-
-# Backported to 6.1.33
-CVE_STATUS[CVE-2022-48425] =3D "cpe-stable-backport: Backported in versi=
on v6.1.33"
-
-# 2023
-
-# https://nvd.nist.gov/vuln/detail/CVE-2023-0179
-# Patched in kernel since v6.2 696e1a48b1a1b01edad542a1ef293665864a4dd0
-# Backported in version v5.10.164 550efeff989b041f3746118c0ddd863c39ddc1=
aa
-# Backported in version v5.15.89 a8acfe2c6fb99f9375a9325807a179cd8c32e6e=
3
-# Backported in version v6.1.7 76ef74d4a379faa451003621a84e3498044e7aa3
-CVE_STATUS[CVE-2023-0179] =3D "cpe-stable-backport: Backported in versio=
ns v5.10.164, v5.15.89 and v6.1.7"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2023-0266
-# Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
-# Patched in kernel since v6.2 56b88b50565cd8b946a2d00b0c83927b7ebb055e
-# Backported in version v5.15.88 26350c21bc5e97a805af878e092eb8125843fe2=
c
-# Backported in version v6.1.6 d6ad4bd1d896ae1daffd7628cd50f124280fb8b1
-CVE_STATUS[CVE-2023-0266] =3D "cpe-stable-backport: Backported in versio=
ns v5.15.88 and v6.1.6"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2023-0394
-# Introduced in version 2.6.12 357b40a18b04c699da1d45608436e9b76b50e251
-# Patched in kernel since v6.2 cb3e9864cdbe35ff6378966660edbcbac955fe17
-# Backported in version v5.4.229 3998dba0f78a59922b0ef333ccfeb58d9410cd3=
d
-# Backported in version v5.10.164 6c9e2c11c33c35563d34d12b343d43b5c12200=
b5
-# Backported in version v5.15.89 456e3794e08a0b59b259da666e31d0884b376bc=
f
-# Backported in version v6.1.7 0afa5f0736584411771299074bbeca8c1f9706d4
-CVE_STATUS[CVE-2023-0394] =3D "cpe-stable-backport: Backported in versio=
ns v5.4.229, v5.10.164, v5.15.89 and v6.1.7"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2023-0386
-# Introduced in 5.11 459c7c565ac36ba09ffbf24231147f408fde4203
-# Patched in kernel v6.2 4f11ada10d0ad3fd53e2bd67806351de63a4f9c3
-# Backported in version 5.15.91 e91308e63710574c4b6a0cadda3e042a3699666e
-# Backported in version 6.1.9 42fea1c35254c49cce07c600d026cbc00c6d3c81
-CVE_STATUS[CVE-2023-0386] =3D "cpe-stable-backport: Backported in versio=
ns v5.15.91 and v6.1.9"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2023-0461
-# Introduced in version v4.13 734942cc4ea6478eed125af258da1bdbb4afe578
-# Patched in kernel since v6.2 2c02d41d71f90a5168391b6a5f2954112ba2307c
-# Backported in version v5.4.229 c6d29a5ffdbc362314853462a0e24e63330a654=
d
-# Backported in version v5.10.163 f8ed0a93b5d576bbaf01639ad816473bdfd1dc=
b0
-# Backported in version v5.15.88 dadd0dcaa67d27f550131de95c8e182643d2c9d=
6
-# Backported in version v6.1.5 7d242f4a0c8319821548c7176c09a6e0e71f223c
-CVE_STATUS[CVE-2023-0461] =3D "cpe-stable-backport: Backported in versio=
ns v5.4.229, v5.10.163, v5.15.88 and v6.1.5"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2023-1073
-# Introduced in v3.16 1b15d2e5b8077670b1e6a33250a0d9577efff4a5
-# Patched in kernel v6.2 b12fece4c64857e5fab4290bf01b2e0317a88456
-# Backported in version 5.10.166 5dc3469a1170dd1344d262a332b26994214eeb5=
8
-# Backported in version 5.15.91 2b49568254365c9c247beb0eabbaa15d0e279d64
-# Backported in version 6.1.9 cdcdc0531a51659527fea4b4d064af343452062d
-CVE_STATUS[CVE-2023-1073] =3D "cpe-stable-backport: Backported in versio=
ns v5.10.166, v5.15.91 and v6.1.9"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2023-1074
-# Patched in kernel v6.2 458e279f861d3f61796894cd158b780765a1569f
-# Backported in version 5.15.91 3391bd42351be0beb14f438c7556912b9f96cb32
-# Backported in version 6.1.9 9f08bb650078dca24a13fea1c375358ed6292df3
-CVE_STATUS[CVE-2023-1074] =3D "cpe-stable-backport: Backported in versio=
ns v5.15.91 andv6.1.9"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2023-1075
-# Introduced in v4.20 a42055e8d2c30d4decfc13ce943d09c7b9dad221
-# Patched in kernel v6.2 ffe2a22562444720b05bdfeb999c03e810d84cbb
-# Backported in version 6.1.11 37c0cdf7e4919e5f76381ac60817b67bcbdacb50
-# 5.15 still has issue, include/net/tls.h:is_tx_ready() would need patch
-CVE_STATUS[CVE-2023-1075] =3D "cpe-stable-backport: Backported in versio=
n v6.1.11"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2023-1076
-# Patched in kernel v6.3 a096ccca6e503a5c575717ff8a36ace27510ab0a
-# Backported in version v5.4.235 d92d87000eda9884d49f1acec1c1fccd63cd9b1=
1
-# Backported in version v5.10.173 9a31af61f397500ccae49d56d809b2217d1e21=
78
-# Backported in version v5.15.99 67f9f02928a34aad0a2c11dab5eea269f5ecf42=
7
-# Backported in version v6.1.16 b4ada752eaf1341f47bfa3d8ada377eca75a8d44
-# Backported in version v6.2.3 4aa4b4b3b3e9551c4de2bf2987247c28805fb8f6
-CVE_STATUS[CVE-2023-1076] =3D "cpe-stable-backport: Backported in versio=
ns v5.4.235, v5.10.173, v5.15.99, v6.1.16 and v6.2.3"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2023-1077
-# Patched in kernel 6.3rc1 7c4a5b89a0b5a57a64b601775b296abf77a9fe97
-# Backported in version 5.15.99 2c36c390a74981d03f04f01fe7ee9c3ac3ea11f7
-# Backported in version 6.1.16 6b4fcc4e8a3016e85766c161daf0732fca16c3a3
-CVE_STATUS[CVE-2023-1077] =3D "cpe-stable-backport: Backported in versio=
ns v5.15.99 and v6.1.16"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2023-1078
-# Patched in kernel 6.2 f753a68980cf4b59a80fe677619da2b1804f526d
-# Backported in version 5.15.94 528e3f3a4b53df36dafd10cdf6b8c0fe2aa1c4ba
-# Backported in version 6.1.12 1d52bbfd469af69fbcae88c67f160ce1b968e7f3
-CVE_STATUS[CVE-2023-1078] =3D "cpe-stable-backport: Backported in versio=
ns v5.15.94 and v6.1.12"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2023-1079
-# Patched in kernel since v6.3-rc1 4ab3a086d10eeec1424f2e8a968827a633620=
3df
-# Backported in version v5.4.235 dd08e68d04d08d2f42b09162c939a0b0841216c=
c
-# Backported in version v5.10.173 21a2eec4a440060a6eb294dc890eaf553101ba=
09
-# Backported in version v5.15.99 3959316f8ceb17866646abc6be4a33265540713=
8
-# Backported in version v6.1.16 ee907829b36949c452c6f89485cb2a58e97c048e
-# Backported in version v6.2.3 b08bcfb4c97d7bd41b362cff44b2c537ce9e8540
-CVE_STATUS[CVE-2023-1079] =3D "cpe-stable-backport: Backported in versio=
ns v5.4.235, v5.10.173, v5.15.99, v6.1.16 and v6.2.3"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2023-1118
-# Introduced in version v2.6.36 9ea53b74df9c4681f5bb2da6b2e10e37d87ea6d6
-# Patched in kernel since v6.3-rc1 29b0589a865b6f66d141d79b2dd1373e4e50f=
e17
-# Backported in version v5.4.235 d120334278b370b6a1623a75ebe53b0c76cb247=
c
-# Backported in version v5.10.173 78da5a378bdacd5bf68c3a6389bdc1dd0c0f5b=
3c
-# Backported in version v5.15.99 29962c478e8b2e6a6154d8d84b8806dbe36f9c2=
8
-# Backported in version v6.1.16 029c1410e345ce579db5c007276340d072aac54a
-# Backported in version v6.2.3 182ea492aae5b64067277e60a4ea5995c4628555
-CVE_STATUS[CVE-2023-1118] =3D "cpe-stable-backport: Backported in versio=
ns v5.4.235, v5.10.173, v5.15.99, v6.1.16 and v6.2.3"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2023-1281
-# Introduced in version v4.14 9b0d4446b56904b59ae3809913b0ac760fa941a6
-# Patched in kernel since v6.2 ee059170b1f7e94e55fa6cadee544e176a6e59c2
-# Backported in version v5.10.169 eb8e9d8572d1d9df17272783ad8a84843ce559=
d4
-# Backported in version v5.15.95 becf55394f6acb60dd60634a1c797e73c747f9d=
a
-# Backported in version v6.1.13 bd662ba56187b5ef8a62a3511371cd38299a507f
-CVE_STATUS[CVE-2023-1281] =3D "cpe-stable-backport: Backported in versio=
ns v5.10.169, v5.15.95 and v6.1.13"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2023-1513
-# Patched in kernel since v6.2 2c10b61421a28e95a46ab489fd56c0f442ff6952
-# Backported in version v5.4.232 9f95a161a7deef62d6d2f57b1a69f94e0546d8d=
8
-# Backported in version v5.10.169 6416c2108ba54d569e4c98d3b62ac78cb12e71=
07
-# Backported in version v5.15.95 35351e3060d67eed8af1575d74b71347a87425d=
8
-# Backported in version v6.1.13 747ca7c8a0c7bce004709143d1cd6596b79b1deb
-CVE_STATUS[CVE-2023-1513] =3D "cpe-stable-backport: Backported in versio=
ns v5.4.232, v5.10.169, v5.15.95 and v6.1.13"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2023-1652
-# Patched in kernel since v6.2 e6cf91b7b47ff82b624bdfe2fdcde32bb52e71dd
-# Backported in version v5.15.91 0a27dcd5343026ac0cb168ee63304255372b7a3=
6
-# Backported in version v6.1.9 32d5eb95f8f0e362e37c393310b13b9e95404560
-# Ref: https://www.linuxkernelcves.com/cves/CVE-2023-1652
-# Ref: Debian kernel-sec team: https://salsa.debian.org/kernel-team/kern=
el-sec/-/blob/1fa77554d4721da54e2df06fa1908a83ba6b1045/retired/CVE-2023-1=
652
-CVE_STATUS[CVE-2023-1652] =3D "cpe-stable-backport: Backported in versio=
ns v5.15.91 and v6.1.9"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2023-1829
-# Patched in kernel since v6.3-rc1 8c710f75256bb3cf05ac7b1672c82b92c43f3=
d28
-# Backported in version v5.4.235 7a6fb69bbcb21e9ce13bdf18c008c268874f048=
0
-# Backported in version v5.10.173 18c3fa7a7fdbb4d21dafc8a7710ae2c1680930=
f6
-# Backported in version v5.15.100 7c183dc0af472dec33d2c0786a5e356baa8cad=
19
-# Backported in version v6.1.18 3abebc503a5148072052c229c6b04b329a420ecd
-# Backported in version v6.2.5 372ae77cf11d11fb118cbe2d37def9dd5f826abd
-# Ref: https://www.linuxkernelcves.com/cves/CVE-2023-1829
-# Ref: Debian kernel-sec team : https://salsa.debian.org/kernel-team/ker=
nel-sec/-/blob/1fa77554d4721da54e2df06fa1908a83ba6b1045/active/CVE-2023-1=
829
-CVE_STATUS[CVE-2023-1829] =3D "cpe-stable-backport: Backported in versio=
ns v5.4.235, v5.10.173, v5.15.100, v6.1.18 and v6.2.5"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2023-28466
-# Introduced in version v4.13 3c4d7559159bfe1e3b94df3a657b2cda3a34e218
-# Patched in kernel since v6.3-rc2 49c47cc21b5b7a3d8deb18fc57b0aa2ab1286=
962
-# Backported in version v5.15.105 0b54d75aa43a1edebc8a3770901f5c3557ee0d=
aa
-# Backported in version v6.1.20 14c17c673e1bba08032d245d5fb025d1cbfee123
-# Backported in version v6.2.7 5231fa057bb0e52095591b303cf95ebd17bc62ce
-CVE_STATUS[CVE-2023-28466] =3D "cpe-stable-backport: Backported in versi=
ons v5.15.05, v6.1.20 and v6.2.7"
-
-
-# https://www.linuxkernelcves.com/cves/CVE-2023-0615
-# Fixed in 6.1 onwards
-CVE_STATUS[CVE-2023-0615] =3D "fixed-version: Fixed in version v6.1 onwa=
rds"
-
-# https://www.linuxkernelcves.com/cves/CVE-2023-28328
-# Fixed with 6.1.2
-CVE_STATUS[CVE-2023-28328] =3D "fixed-version: Fixed in version v6.1.2"
-
-# https://www.linuxkernelcves.com/cves/CVE-2023-2162
-# Fixed in 6.1.11
-CVE_STATUS[CVE-2023-2162] =3D "fixed-version: Fixed in version v6.1.11"
-
-# https://www.linuxkernelcves.com/cves/CVE-2023-0459
-# Fixed in 6.1.14 onwards
-CVE_STATUS[CVE-2023-0459] =3D "fixed-version: Fixed in version v6.1.14"
-
-# https://www.linuxkernelcves.com/cves/CVE-2023-1999
-# https://www.linuxkernelcves.com/cves/CVE-2023-2985
-# Fixed in 6.1.16
-CVE_STATUS[CVE-2023-1998] =3D "fixed-version: Fixed in version v6.1.16"
-CVE_STATUS[CVE-2023-2985] =3D "fixed-version: Fixed in version v6.1.16"
-
-# https://www.linuxkernelcves.com/cves/CVE-2023-1855
-# https://www.linuxkernelcves.com/cves/CVE-2023-1990
-# https://www.linuxkernelcves.com/cves/CVE-2023-2235
-# https://www.linuxkernelcves.com/cves/CVE-2023-30456
-# Fixed in 6.1.21
-CVE_STATUS_GROUPS +=3D "CVE_STATUS_KERNEL_6121"
-CVE_STATUS_KERNEL_6121 =3D "CVE-2023-1855 CVE-2023-1990 CVE-2023-2235 CV=
E-2023-30456"
-CVE_STATUS_KERNEL_6121[status] =3D  "fixed-version: Fixed in version v6.=
1.21"
-
-# https://www.linuxkernelcves.com/cves/CVE-2023-1989
-# https://www.linuxkernelcves.com/cves/CVE-2023-2194
-# https://www.linuxkernelcves.com/cves/CVE-2023-28866
-# https://www.linuxkernelcves.com/cves/CVE-2023-30772
-# https://www.linuxkernelcves.com/cves/CVE-2023-33203
-# https://www.linuxkernelcves.com/cves/CVE-2023-33288
-# Fixed with 6.1.22
-CVE_STATUS_GROUPS +=3D "CVE_STATUS_KERNEL_6122"
-CVE_STATUS_KERNEL_6122 =3D "CVE-2023-2194 CVE-2023-1989 CVE-2023-28866 C=
VE-2023-30772 CVE-2023-33203 CVE-2023-33288"
-CVE_STATUS_KERNEL_6122[status] =3D  "fixed-version: Fixed in version v6.=
1.22"
-
-# https://www.linuxkernelcves.com/cves/CVE-2023-1611
-# Fixed in 6.1.23
-CVE_STATUS[CVE-2023-1611] =3D "fixed-version: Fixed in version v6.1.23"
-
-# https://www.linuxkernelcves.com/cves/CVE-2023-1859
-# Fixed in 6.1.25
-CVE_STATUS[CVE-2023-1859] =3D "fixed-version: Fixed in version v6.1.25"
-
-# https://www.linuxkernelcves.com/cves/CVE-2023-2156
-# https://www.linuxkernelcves.com/cves/CVE-2023-31436
-# Fixed in 6.1.26
-CVE_STATUS[CVE-2023-2156] =3D "fixed-version: Fixed in version v6.1.26"
-CVE_STATUS[CVE-2023-31436] =3D "fixed-version: Fixed in version v6.1.26"
-
-# https://www.linuxkernelcves.com/cves/CVE-2023-1380
-# https://www.linuxkernelcves.com/cves/CVE-2023-2002
-# Fixed in 6.1.27
-CVE_STATUS[CVE-2023-1380] =3D "fixed-version: Fixed in version v6.1.27"
-CVE_STATUS[CVE-2023-2002] =3D "fixed-version: Fixed in version v6.1.27"
-
-# https://www.linuxkernelcves.com/cves/CVE-2023-32233
-# Fixed with 6.1.28
-CVE_STATUS[CVE-2023-32233] =3D "fixed-version: Fixed in version v6.1.28"
-
-# https://www.linuxkernelcves.com/cves/CVE-2023-34256
-# Fixed in 6.1.29
-CVE_STATUS[CVE-2023-34256] =3D "fixed-version: Fixed in version v6.1.29"
-
-
-# Backported to 6.1.9
-CVE_STATUS[CVE-2023-3358] =3D "cpe-stable-backport: Backported in versio=
n v6.1.9"
-
-# Backported to 6.1.11
-CVE_STATUS[CVE-2023-3359] =3D "cpe-stable-backport: Backported in versio=
n v6.1.11"
-CVE_STATUS[CVE-2023-3161] =3D "cpe-stable-backport: Backported in versio=
n v6.1.11"
-
-# Backported to 6.1.16
-CVE_STATUS[CVE-2023-3220] =3D "cpe-stable-backport: Backported in versio=
n v6.1.16"
-
-# Backported to 6.1.28
-CVE_STATUS_GROUPS +=3D "CVE_STATUS_KERNEL_6128"
-CVE_STATUS_KERNEL_6128 =3D "CVE-2023-3268 CVE-2023-35823 CVE-2023-35824 =
CVE-2023-35826 CVE-2023-35828 CVE-2023-35829"
-CVE_STATUS_KERNEL_6128[status] =3D "cpe-stable-backport: Backported in v=
ersion v6.1.28"
-
-# Backported to 6.1.30
-# Backported to 6.1.30 as 9a342d4
-CVE_STATUS[CVE-2023-3090] =3D "cpe-stable-backport: Backported in versio=
n v6.1.30"
-CVE_STATUS[CVE-2023-3141] =3D "cpe-stable-backport: Backported in versio=
n v6.1.30 as 9a342d4"
-
-# Backported to 6.1.33
-CVE_STATUS_GROUPS +=3D "CVE_STATUS_KERNEL_6133"
-CVE_STATUS_KERNEL_6133 =3D "CVE-2023-2124 CVE-2023-3212 CVE-2023-35788"
-CVE_STATUS_KERNEL_6133[status] =3D "cpe-stable-backport: Backported in v=
ersion v6.1.33"
-
-# Backported to 6.1.35
-CVE_STATUS[CVE-2023-3117] =3D "cpe-stable-backport: Backported in versio=
n v6.1.35"
-CVE_STATUS[CVE-2023-3390] =3D "cpe-stable-backport: Backported in versio=
n v6.1.35"
-
-# Backported to 6.1.36
-CVE_STATUS[CVE-2023-3389] =3D "cpe-stable-backport: Backported in versio=
n v6.1.36"
-
-# Only in 6.2.0 to 6.2.14, and 6.3.0 to 6.3.1
-CVE_STATUS[CVE-2023-3312] =3D "not-applicable-config: Only in versions v=
6.2.0 to v6.2.4 and v6.3.0 to v6.3.1"
-
-
-# https://nvd.nist.gov/vuln/detail/CVE-2023-23005
-# Introduced in version v6.1 7b88bda3761b95856cf97822efe8281c8100067b
-# Patched in kernel since v6.2 4a625ceee8a0ab0273534cb6b432ce6b331db5ee
-# But, the CVE is disputed:
-CVE_STATUS[CVE-2023-23005] =3D "disputed: There are no realistic cases \
-in which a user can cause the alloc_memory_type error case to be reached=
. \
-See: https://bugzilla.suse.com/show_bug.cgi?id=3D1208844#c2"
-
-CVE_STATUS[CVE-2023-28464] =3D "not-applicable-config: Only in 6.3-rc"
+# Auto-generated CVE metadata, DO NOT EDIT BY HAND.
+# Generated at 2023-08-09 15:51:19.757857 for version 6.1.43
+
+CVE_STATUS[CVE-2003-1604] =3D "fixed-version: Fixed after version 2.6.12=
rc2"
+
+CVE_STATUS[CVE-2004-0230] =3D "fixed-version: Fixed after version 3.6rc1=
"
+
+# CVE-2005-3660 has no known resolution
+
+CVE_STATUS[CVE-2006-3635] =3D "fixed-version: Fixed after version 2.6.26=
rc5"
+
+CVE_STATUS[CVE-2006-5331] =3D "fixed-version: Fixed after version 2.6.19=
rc3"
+
+CVE_STATUS[CVE-2006-6128] =3D "fixed-version: Fixed after version 2.6.19=
rc2"
+
+# CVE-2007-3719 has no known resolution
+
+CVE_STATUS[CVE-2007-4774] =3D "fixed-version: Fixed after version 2.6.12=
rc2"
+
+CVE_STATUS[CVE-2007-6761] =3D "fixed-version: Fixed after version 2.6.24=
rc6"
+
+CVE_STATUS[CVE-2007-6762] =3D "fixed-version: Fixed after version 2.6.20=
rc5"
+
+# CVE-2008-2544 has no known resolution
+
+# CVE-2008-4609 has no known resolution
+
+CVE_STATUS[CVE-2008-7316] =3D "fixed-version: Fixed after version 2.6.25=
rc1"
+
+CVE_STATUS[CVE-2009-2692] =3D "fixed-version: Fixed after version 2.6.31=
rc6"
+
+CVE_STATUS[CVE-2010-0008] =3D "fixed-version: Fixed after version 2.6.23=
rc9"
+
+CVE_STATUS[CVE-2010-3432] =3D "fixed-version: Fixed after version 2.6.36=
rc5"
+
+# CVE-2010-4563 has no known resolution
+
+CVE_STATUS[CVE-2010-4648] =3D "fixed-version: Fixed after version 2.6.37=
rc6"
+
+CVE_STATUS[CVE-2010-5313] =3D "fixed-version: Fixed after version 2.6.38=
rc1"
+
+# CVE-2010-5321 has no known resolution
+
+CVE_STATUS[CVE-2010-5328] =3D "fixed-version: Fixed after version 2.6.35=
rc1"
+
+CVE_STATUS[CVE-2010-5329] =3D "fixed-version: Fixed after version 2.6.39=
rc1"
+
+CVE_STATUS[CVE-2010-5331] =3D "fixed-version: Fixed after version 2.6.34=
rc7"
+
+CVE_STATUS[CVE-2010-5332] =3D "fixed-version: Fixed after version 2.6.37=
rc1"
+
+CVE_STATUS[CVE-2011-4098] =3D "fixed-version: Fixed after version 3.2rc1=
"
+
+CVE_STATUS[CVE-2011-4131] =3D "fixed-version: Fixed after version 3.3rc1=
"
+
+CVE_STATUS[CVE-2011-4915] =3D "fixed-version: Fixed after version 3.2rc1=
"
+
+# CVE-2011-4916 has no known resolution
+
+# CVE-2011-4917 has no known resolution
+
+CVE_STATUS[CVE-2011-5321] =3D "fixed-version: Fixed after version 3.2rc1=
"
+
+CVE_STATUS[CVE-2011-5327] =3D "fixed-version: Fixed after version 3.1rc1=
"
+
+CVE_STATUS[CVE-2012-0957] =3D "fixed-version: Fixed after version 3.7rc2=
"
+
+CVE_STATUS[CVE-2012-2119] =3D "fixed-version: Fixed after version 3.5rc1=
"
+
+CVE_STATUS[CVE-2012-2136] =3D "fixed-version: Fixed after version 3.5rc1=
"
+
+CVE_STATUS[CVE-2012-2137] =3D "fixed-version: Fixed after version 3.5rc2=
"
+
+CVE_STATUS[CVE-2012-2313] =3D "fixed-version: Fixed after version 3.4rc6=
"
+
+CVE_STATUS[CVE-2012-2319] =3D "fixed-version: Fixed after version 3.4rc6=
"
+
+CVE_STATUS[CVE-2012-2372] =3D "fixed-version: Fixed after version 3.13rc=
4"
+
+CVE_STATUS[CVE-2012-2375] =3D "fixed-version: Fixed after version 3.4rc1=
"
+
+CVE_STATUS[CVE-2012-2390] =3D "fixed-version: Fixed after version 3.5rc1=
"
+
+CVE_STATUS[CVE-2012-2669] =3D "fixed-version: Fixed after version 3.5rc4=
"
+
+CVE_STATUS[CVE-2012-2744] =3D "fixed-version: Fixed after version 2.6.34=
rc1"
+
+CVE_STATUS[CVE-2012-2745] =3D "fixed-version: Fixed after version 3.4rc3=
"
+
+CVE_STATUS[CVE-2012-3364] =3D "fixed-version: Fixed after version 3.5rc6=
"
+
+CVE_STATUS[CVE-2012-3375] =3D "fixed-version: Fixed after version 3.4rc5=
"
+
+CVE_STATUS[CVE-2012-3400] =3D "fixed-version: Fixed after version 3.5rc5=
"
+
+CVE_STATUS[CVE-2012-3412] =3D "fixed-version: Fixed after version 3.6rc2=
"
+
+CVE_STATUS[CVE-2012-3430] =3D "fixed-version: Fixed after version 3.6rc1=
"
+
+CVE_STATUS[CVE-2012-3510] =3D "fixed-version: Fixed after version 2.6.19=
rc4"
+
+CVE_STATUS[CVE-2012-3511] =3D "fixed-version: Fixed after version 3.5rc6=
"
+
+CVE_STATUS[CVE-2012-3520] =3D "fixed-version: Fixed after version 3.6rc3=
"
+
+CVE_STATUS[CVE-2012-3552] =3D "fixed-version: Fixed after version 3.0rc1=
"
+
+# Skipping CVE-2012-4220, no affected_versions
+
+# Skipping CVE-2012-4221, no affected_versions
+
+# Skipping CVE-2012-4222, no affected_versions
+
+CVE_STATUS[CVE-2012-4398] =3D "fixed-version: Fixed after version 3.4rc1=
"
+
+CVE_STATUS[CVE-2012-4444] =3D "fixed-version: Fixed after version 2.6.36=
rc4"
+
+CVE_STATUS[CVE-2012-4461] =3D "fixed-version: Fixed after version 3.7rc6=
"
+
+CVE_STATUS[CVE-2012-4467] =3D "fixed-version: Fixed after version 3.6rc5=
"
+
+CVE_STATUS[CVE-2012-4508] =3D "fixed-version: Fixed after version 3.7rc3=
"
+
+CVE_STATUS[CVE-2012-4530] =3D "fixed-version: Fixed after version 3.8rc1=
"
+
+# CVE-2012-4542 has no known resolution
+
+CVE_STATUS[CVE-2012-4565] =3D "fixed-version: Fixed after version 3.7rc4=
"
+
+CVE_STATUS[CVE-2012-5374] =3D "fixed-version: Fixed after version 3.8rc1=
"
+
+CVE_STATUS[CVE-2012-5375] =3D "fixed-version: Fixed after version 3.8rc1=
"
+
+CVE_STATUS[CVE-2012-5517] =3D "fixed-version: Fixed after version 3.6rc1=
"
+
+CVE_STATUS[CVE-2012-6536] =3D "fixed-version: Fixed after version 3.6rc7=
"
+
+CVE_STATUS[CVE-2012-6537] =3D "fixed-version: Fixed after version 3.6rc7=
"
+
+CVE_STATUS[CVE-2012-6538] =3D "fixed-version: Fixed after version 3.6rc7=
"
+
+CVE_STATUS[CVE-2012-6539] =3D "fixed-version: Fixed after version 3.6rc3=
"
+
+CVE_STATUS[CVE-2012-6540] =3D "fixed-version: Fixed after version 3.6rc3=
"
+
+CVE_STATUS[CVE-2012-6541] =3D "fixed-version: Fixed after version 3.6rc3=
"
+
+CVE_STATUS[CVE-2012-6542] =3D "fixed-version: Fixed after version 3.6rc3=
"
+
+CVE_STATUS[CVE-2012-6543] =3D "fixed-version: Fixed after version 3.6rc3=
"
+
+CVE_STATUS[CVE-2012-6544] =3D "fixed-version: Fixed after version 3.6rc3=
"
+
+CVE_STATUS[CVE-2012-6545] =3D "fixed-version: Fixed after version 3.6rc3=
"
+
+CVE_STATUS[CVE-2012-6546] =3D "fixed-version: Fixed after version 3.6rc3=
"
+
+CVE_STATUS[CVE-2012-6547] =3D "fixed-version: Fixed after version 3.6rc1=
"
+
+CVE_STATUS[CVE-2012-6548] =3D "fixed-version: Fixed after version 3.6rc1=
"
+
+CVE_STATUS[CVE-2012-6549] =3D "fixed-version: Fixed after version 3.6rc1=
"
+
+CVE_STATUS[CVE-2012-6638] =3D "fixed-version: Fixed after version 3.3rc1=
"
+
+CVE_STATUS[CVE-2012-6647] =3D "fixed-version: Fixed after version 3.6rc2=
"
+
+CVE_STATUS[CVE-2012-6657] =3D "fixed-version: Fixed after version 3.6"
+
+CVE_STATUS[CVE-2012-6689] =3D "fixed-version: Fixed after version 3.6rc5=
"
+
+CVE_STATUS[CVE-2012-6701] =3D "fixed-version: Fixed after version 3.5rc1=
"
+
+CVE_STATUS[CVE-2012-6703] =3D "fixed-version: Fixed after version 3.7rc1=
"
+
+CVE_STATUS[CVE-2012-6704] =3D "fixed-version: Fixed after version 3.5rc1=
"
+
+CVE_STATUS[CVE-2012-6712] =3D "fixed-version: Fixed after version 3.4rc1=
"
+
+CVE_STATUS[CVE-2013-0160] =3D "fixed-version: Fixed after version 3.9rc1=
"
+
+CVE_STATUS[CVE-2013-0190] =3D "fixed-version: Fixed after version 3.8rc5=
"
+
+CVE_STATUS[CVE-2013-0216] =3D "fixed-version: Fixed after version 3.8rc7=
"
+
+CVE_STATUS[CVE-2013-0217] =3D "fixed-version: Fixed after version 3.8rc7=
"
+
+CVE_STATUS[CVE-2013-0228] =3D "fixed-version: Fixed after version 3.8"
+
+CVE_STATUS[CVE-2013-0231] =3D "fixed-version: Fixed after version 3.8rc7=
"
+
+CVE_STATUS[CVE-2013-0268] =3D "fixed-version: Fixed after version 3.8rc6=
"
+
+CVE_STATUS[CVE-2013-0290] =3D "fixed-version: Fixed after version 3.8"
+
+CVE_STATUS[CVE-2013-0309] =3D "fixed-version: Fixed after version 3.7rc1=
"
+
+CVE_STATUS[CVE-2013-0310] =3D "fixed-version: Fixed after version 3.5"
+
+CVE_STATUS[CVE-2013-0311] =3D "fixed-version: Fixed after version 3.7rc8=
"
+
+CVE_STATUS[CVE-2013-0313] =3D "fixed-version: Fixed after version 3.8rc5=
"
+
+CVE_STATUS[CVE-2013-0343] =3D "fixed-version: Fixed after version 3.11rc=
7"
+
+CVE_STATUS[CVE-2013-0349] =3D "fixed-version: Fixed after version 3.8rc6=
"
+
+CVE_STATUS[CVE-2013-0871] =3D "fixed-version: Fixed after version 3.8rc5=
"
+
+CVE_STATUS[CVE-2013-0913] =3D "fixed-version: Fixed after version 3.9rc4=
"
+
+CVE_STATUS[CVE-2013-0914] =3D "fixed-version: Fixed after version 3.9rc3=
"
+
+CVE_STATUS[CVE-2013-1059] =3D "fixed-version: Fixed after version 3.11rc=
1"
+
+CVE_STATUS[CVE-2013-1763] =3D "fixed-version: Fixed after version 3.9rc1=
"
+
+CVE_STATUS[CVE-2013-1767] =3D "fixed-version: Fixed after version 3.9rc1=
"
+
+CVE_STATUS[CVE-2013-1772] =3D "fixed-version: Fixed after version 3.5rc1=
"
+
+CVE_STATUS[CVE-2013-1773] =3D "fixed-version: Fixed after version 3.3rc1=
"
+
+CVE_STATUS[CVE-2013-1774] =3D "fixed-version: Fixed after version 3.8rc5=
"
+
+CVE_STATUS[CVE-2013-1792] =3D "fixed-version: Fixed after version 3.9rc3=
"
+
+CVE_STATUS[CVE-2013-1796] =3D "fixed-version: Fixed after version 3.9rc4=
"
+
+CVE_STATUS[CVE-2013-1797] =3D "fixed-version: Fixed after version 3.9rc4=
"
+
+CVE_STATUS[CVE-2013-1798] =3D "fixed-version: Fixed after version 3.9rc4=
"
+
+CVE_STATUS[CVE-2013-1819] =3D "fixed-version: Fixed after version 3.8rc6=
"
+
+CVE_STATUS[CVE-2013-1826] =3D "fixed-version: Fixed after version 3.6rc7=
"
+
+CVE_STATUS[CVE-2013-1827] =3D "fixed-version: Fixed after version 3.6rc3=
"
+
+CVE_STATUS[CVE-2013-1828] =3D "fixed-version: Fixed after version 3.9rc2=
"
+
+CVE_STATUS[CVE-2013-1848] =3D "fixed-version: Fixed after version 3.9rc3=
"
+
+CVE_STATUS[CVE-2013-1858] =3D "fixed-version: Fixed after version 3.9rc3=
"
+
+CVE_STATUS[CVE-2013-1860] =3D "fixed-version: Fixed after version 3.9rc3=
"
+
+CVE_STATUS[CVE-2013-1928] =3D "fixed-version: Fixed after version 3.7rc3=
"
+
+CVE_STATUS[CVE-2013-1929] =3D "fixed-version: Fixed after version 3.9rc6=
"
+
+# Skipping CVE-2013-1935, no affected_versions
+
+CVE_STATUS[CVE-2013-1943] =3D "fixed-version: Fixed after version 3.0rc1=
"
+
+CVE_STATUS[CVE-2013-1956] =3D "fixed-version: Fixed after version 3.9rc5=
"
+
+CVE_STATUS[CVE-2013-1957] =3D "fixed-version: Fixed after version 3.9rc5=
"
+
+CVE_STATUS[CVE-2013-1958] =3D "fixed-version: Fixed after version 3.9rc5=
"
+
+CVE_STATUS[CVE-2013-1959] =3D "fixed-version: Fixed after version 3.9rc7=
"
+
+CVE_STATUS[CVE-2013-1979] =3D "fixed-version: Fixed after version 3.9rc8=
"
+
+CVE_STATUS[CVE-2013-2015] =3D "fixed-version: Fixed after version 3.8rc2=
"
+
+CVE_STATUS[CVE-2013-2017] =3D "fixed-version: Fixed after version 2.6.34=
"
+
+CVE_STATUS[CVE-2013-2058] =3D "fixed-version: Fixed after version 3.8rc4=
"
+
+CVE_STATUS[CVE-2013-2094] =3D "fixed-version: Fixed after version 3.9rc8=
"
+
+CVE_STATUS[CVE-2013-2128] =3D "fixed-version: Fixed after version 2.6.34=
rc4"
+
+CVE_STATUS[CVE-2013-2140] =3D "fixed-version: Fixed after version 3.11rc=
3"
+
+CVE_STATUS[CVE-2013-2141] =3D "fixed-version: Fixed after version 3.9rc8=
"
+
+CVE_STATUS[CVE-2013-2146] =3D "fixed-version: Fixed after version 3.9rc8=
"
+
+CVE_STATUS[CVE-2013-2147] =3D "fixed-version: Fixed after version 3.12rc=
3"
+
+CVE_STATUS[CVE-2013-2148] =3D "fixed-version: Fixed after version 3.11rc=
1"
+
+CVE_STATUS[CVE-2013-2164] =3D "fixed-version: Fixed after version 3.11rc=
1"
+
+# Skipping CVE-2013-2188, no affected_versions
+
+CVE_STATUS[CVE-2013-2206] =3D "fixed-version: Fixed after version 3.9rc4=
"
+
+# Skipping CVE-2013-2224, no affected_versions
+
+CVE_STATUS[CVE-2013-2232] =3D "fixed-version: Fixed after version 3.10"
+
+CVE_STATUS[CVE-2013-2234] =3D "fixed-version: Fixed after version 3.10"
+
+CVE_STATUS[CVE-2013-2237] =3D "fixed-version: Fixed after version 3.9rc6=
"
+
+# Skipping CVE-2013-2239, no affected_versions
+
+CVE_STATUS[CVE-2013-2546] =3D "fixed-version: Fixed after version 3.9rc1=
"
+
+CVE_STATUS[CVE-2013-2547] =3D "fixed-version: Fixed after version 3.9rc1=
"
+
+CVE_STATUS[CVE-2013-2548] =3D "fixed-version: Fixed after version 3.9rc1=
"
+
+CVE_STATUS[CVE-2013-2596] =3D "fixed-version: Fixed after version 3.9rc8=
"
+
+CVE_STATUS[CVE-2013-2634] =3D "fixed-version: Fixed after version 3.9rc3=
"
+
+CVE_STATUS[CVE-2013-2635] =3D "fixed-version: Fixed after version 3.9rc3=
"
+
+CVE_STATUS[CVE-2013-2636] =3D "fixed-version: Fixed after version 3.9rc3=
"
+
+CVE_STATUS[CVE-2013-2850] =3D "fixed-version: Fixed after version 3.10rc=
4"
+
+CVE_STATUS[CVE-2013-2851] =3D "fixed-version: Fixed after version 3.11rc=
1"
+
+CVE_STATUS[CVE-2013-2852] =3D "fixed-version: Fixed after version 3.10rc=
6"
+
+CVE_STATUS[CVE-2013-2888] =3D "fixed-version: Fixed after version 3.12rc=
1"
+
+CVE_STATUS[CVE-2013-2889] =3D "fixed-version: Fixed after version 3.12rc=
2"
+
+CVE_STATUS[CVE-2013-2890] =3D "fixed-version: Fixed after version 3.12rc=
2"
+
+CVE_STATUS[CVE-2013-2891] =3D "fixed-version: Fixed after version 3.12rc=
2"
+
+CVE_STATUS[CVE-2013-2892] =3D "fixed-version: Fixed after version 3.12rc=
1"
+
+CVE_STATUS[CVE-2013-2893] =3D "fixed-version: Fixed after version 3.12rc=
2"
+
+CVE_STATUS[CVE-2013-2894] =3D "fixed-version: Fixed after version 3.12rc=
2"
+
+CVE_STATUS[CVE-2013-2895] =3D "fixed-version: Fixed after version 3.12rc=
2"
+
+CVE_STATUS[CVE-2013-2896] =3D "fixed-version: Fixed after version 3.12rc=
1"
+
+CVE_STATUS[CVE-2013-2897] =3D "fixed-version: Fixed after version 3.12rc=
2"
+
+CVE_STATUS[CVE-2013-2898] =3D "fixed-version: Fixed after version 3.12rc=
1"
+
+CVE_STATUS[CVE-2013-2899] =3D "fixed-version: Fixed after version 3.12rc=
1"
+
+CVE_STATUS[CVE-2013-2929] =3D "fixed-version: Fixed after version 3.13rc=
1"
+
+CVE_STATUS[CVE-2013-2930] =3D "fixed-version: Fixed after version 3.13rc=
1"
+
+CVE_STATUS[CVE-2013-3076] =3D "fixed-version: Fixed after version 3.9"
+
+CVE_STATUS[CVE-2013-3222] =3D "fixed-version: Fixed after version 3.9rc7=
"
+
+CVE_STATUS[CVE-2013-3223] =3D "fixed-version: Fixed after version 3.9rc7=
"
+
+CVE_STATUS[CVE-2013-3224] =3D "fixed-version: Fixed after version 3.9rc7=
"
+
+CVE_STATUS[CVE-2013-3225] =3D "fixed-version: Fixed after version 3.9rc7=
"
+
+CVE_STATUS[CVE-2013-3226] =3D "fixed-version: Fixed after version 3.9rc7=
"
+
+CVE_STATUS[CVE-2013-3227] =3D "fixed-version: Fixed after version 3.9rc7=
"
+
+CVE_STATUS[CVE-2013-3228] =3D "fixed-version: Fixed after version 3.9rc7=
"
+
+CVE_STATUS[CVE-2013-3229] =3D "fixed-version: Fixed after version 3.9rc7=
"
+
+CVE_STATUS[CVE-2013-3230] =3D "fixed-version: Fixed after version 3.9rc7=
"
+
+CVE_STATUS[CVE-2013-3231] =3D "fixed-version: Fixed after version 3.9rc7=
"
+
+CVE_STATUS[CVE-2013-3232] =3D "fixed-version: Fixed after version 3.9rc7=
"
+
+CVE_STATUS[CVE-2013-3233] =3D "fixed-version: Fixed after version 3.9rc7=
"
+
+CVE_STATUS[CVE-2013-3234] =3D "fixed-version: Fixed after version 3.9rc7=
"
+
+CVE_STATUS[CVE-2013-3235] =3D "fixed-version: Fixed after version 3.9rc7=
"
+
+CVE_STATUS[CVE-2013-3236] =3D "fixed-version: Fixed after version 3.9rc7=
"
+
+CVE_STATUS[CVE-2013-3237] =3D "fixed-version: Fixed after version 3.9rc7=
"
+
+CVE_STATUS[CVE-2013-3301] =3D "fixed-version: Fixed after version 3.9rc7=
"
+
+CVE_STATUS[CVE-2013-3302] =3D "fixed-version: Fixed after version 3.8rc3=
"
+
+CVE_STATUS[CVE-2013-4125] =3D "fixed-version: Fixed after version 3.11rc=
1"
+
+CVE_STATUS[CVE-2013-4127] =3D "fixed-version: Fixed after version 3.11rc=
1"
+
+CVE_STATUS[CVE-2013-4129] =3D "fixed-version: Fixed after version 3.11rc=
1"
+
+CVE_STATUS[CVE-2013-4162] =3D "fixed-version: Fixed after version 3.11rc=
1"
+
+CVE_STATUS[CVE-2013-4163] =3D "fixed-version: Fixed after version 3.11rc=
1"
+
+CVE_STATUS[CVE-2013-4205] =3D "fixed-version: Fixed after version 3.11rc=
5"
+
+CVE_STATUS[CVE-2013-4220] =3D "fixed-version: Fixed after version 3.10rc=
4"
+
+CVE_STATUS[CVE-2013-4247] =3D "fixed-version: Fixed after version 3.10rc=
5"
+
+CVE_STATUS[CVE-2013-4254] =3D "fixed-version: Fixed after version 3.11rc=
6"
+
+CVE_STATUS[CVE-2013-4270] =3D "fixed-version: Fixed after version 3.12rc=
4"
+
+CVE_STATUS[CVE-2013-4299] =3D "fixed-version: Fixed after version 3.12rc=
6"
+
+CVE_STATUS[CVE-2013-4300] =3D "fixed-version: Fixed after version 3.11"
+
+CVE_STATUS[CVE-2013-4312] =3D "fixed-version: Fixed after version 4.5rc1=
"
+
+CVE_STATUS[CVE-2013-4343] =3D "fixed-version: Fixed after version 3.12rc=
2"
+
+CVE_STATUS[CVE-2013-4345] =3D "fixed-version: Fixed after version 3.13rc=
2"
+
+CVE_STATUS[CVE-2013-4348] =3D "fixed-version: Fixed after version 3.13rc=
1"
+
+CVE_STATUS[CVE-2013-4350] =3D "fixed-version: Fixed after version 3.12rc=
2"
+
+CVE_STATUS[CVE-2013-4387] =3D "fixed-version: Fixed after version 3.12rc=
4"
+
+CVE_STATUS[CVE-2013-4470] =3D "fixed-version: Fixed after version 3.12rc=
7"
+
+CVE_STATUS[CVE-2013-4483] =3D "fixed-version: Fixed after version 3.10rc=
1"
+
+CVE_STATUS[CVE-2013-4511] =3D "fixed-version: Fixed after version 3.12"
+
+CVE_STATUS[CVE-2013-4512] =3D "fixed-version: Fixed after version 3.12"
+
+CVE_STATUS[CVE-2013-4513] =3D "fixed-version: Fixed after version 3.12"
+
+CVE_STATUS[CVE-2013-4514] =3D "fixed-version: Fixed after version 3.12"
+
+CVE_STATUS[CVE-2013-4515] =3D "fixed-version: Fixed after version 3.12"
+
+CVE_STATUS[CVE-2013-4516] =3D "fixed-version: Fixed after version 3.12"
+
+CVE_STATUS[CVE-2013-4563] =3D "fixed-version: Fixed after version 3.13rc=
1"
+
+CVE_STATUS[CVE-2013-4579] =3D "fixed-version: Fixed after version 3.13rc=
7"
+
+CVE_STATUS[CVE-2013-4587] =3D "fixed-version: Fixed after version 3.13rc=
4"
+
+CVE_STATUS[CVE-2013-4588] =3D "fixed-version: Fixed after version 2.6.33=
rc4"
+
+CVE_STATUS[CVE-2013-4591] =3D "fixed-version: Fixed after version 3.8rc1=
"
+
+CVE_STATUS[CVE-2013-4592] =3D "fixed-version: Fixed after version 3.7rc1=
"
+
+# Skipping CVE-2013-4737, no affected_versions
+
+# Skipping CVE-2013-4738, no affected_versions
+
+# Skipping CVE-2013-4739, no affected_versions
+
+CVE_STATUS[CVE-2013-5634] =3D "fixed-version: Fixed after version 3.10rc=
5"
+
+CVE_STATUS[CVE-2013-6282] =3D "fixed-version: Fixed after version 3.6rc6=
"
+
+CVE_STATUS[CVE-2013-6367] =3D "fixed-version: Fixed after version 3.13rc=
4"
+
+CVE_STATUS[CVE-2013-6368] =3D "fixed-version: Fixed after version 3.13rc=
4"
+
+CVE_STATUS[CVE-2013-6376] =3D "fixed-version: Fixed after version 3.13rc=
4"
+
+CVE_STATUS[CVE-2013-6378] =3D "fixed-version: Fixed after version 3.13rc=
1"
+
+CVE_STATUS[CVE-2013-6380] =3D "fixed-version: Fixed after version 3.13rc=
1"
+
+CVE_STATUS[CVE-2013-6381] =3D "fixed-version: Fixed after version 3.13rc=
1"
+
+CVE_STATUS[CVE-2013-6382] =3D "fixed-version: Fixed after version 3.13rc=
4"
+
+CVE_STATUS[CVE-2013-6383] =3D "fixed-version: Fixed after version 3.12"
+
+# Skipping CVE-2013-6392, no affected_versions
+
+CVE_STATUS[CVE-2013-6431] =3D "fixed-version: Fixed after version 3.12rc=
1"
+
+CVE_STATUS[CVE-2013-6432] =3D "fixed-version: Fixed after version 3.13rc=
1"
+
+CVE_STATUS[CVE-2013-6885] =3D "fixed-version: Fixed after version 3.14rc=
1"
+
+CVE_STATUS[CVE-2013-7026] =3D "fixed-version: Fixed after version 3.13rc=
1"
+
+CVE_STATUS[CVE-2013-7027] =3D "fixed-version: Fixed after version 3.12rc=
7"
+
+CVE_STATUS[CVE-2013-7263] =3D "fixed-version: Fixed after version 3.13rc=
1"
+
+CVE_STATUS[CVE-2013-7264] =3D "fixed-version: Fixed after version 3.13rc=
1"
+
+CVE_STATUS[CVE-2013-7265] =3D "fixed-version: Fixed after version 3.13rc=
1"
+
+CVE_STATUS[CVE-2013-7266] =3D "fixed-version: Fixed after version 3.13rc=
1"
+
+CVE_STATUS[CVE-2013-7267] =3D "fixed-version: Fixed after version 3.13rc=
1"
+
+CVE_STATUS[CVE-2013-7268] =3D "fixed-version: Fixed after version 3.13rc=
1"
+
+CVE_STATUS[CVE-2013-7269] =3D "fixed-version: Fixed after version 3.13rc=
1"
+
+CVE_STATUS[CVE-2013-7270] =3D "fixed-version: Fixed after version 3.13rc=
1"
+
+CVE_STATUS[CVE-2013-7271] =3D "fixed-version: Fixed after version 3.13rc=
1"
+
+CVE_STATUS[CVE-2013-7281] =3D "fixed-version: Fixed after version 3.13rc=
1"
+
+CVE_STATUS[CVE-2013-7339] =3D "fixed-version: Fixed after version 3.13rc=
7"
+
+CVE_STATUS[CVE-2013-7348] =3D "fixed-version: Fixed after version 3.13rc=
1"
+
+CVE_STATUS[CVE-2013-7421] =3D "fixed-version: Fixed after version 3.19rc=
1"
+
+# CVE-2013-7445 has no known resolution
+
+CVE_STATUS[CVE-2013-7446] =3D "fixed-version: Fixed after version 4.4rc4=
"
+
+CVE_STATUS[CVE-2013-7470] =3D "fixed-version: Fixed after version 3.12rc=
7"
+
+CVE_STATUS[CVE-2014-0038] =3D "fixed-version: Fixed after version 3.14rc=
1"
+
+CVE_STATUS[CVE-2014-0049] =3D "fixed-version: Fixed after version 3.14rc=
5"
+
+CVE_STATUS[CVE-2014-0055] =3D "fixed-version: Fixed after version 3.14"
+
+CVE_STATUS[CVE-2014-0069] =3D "fixed-version: Fixed after version 3.14rc=
4"
+
+CVE_STATUS[CVE-2014-0077] =3D "fixed-version: Fixed after version 3.14"
+
+CVE_STATUS[CVE-2014-0100] =3D "fixed-version: Fixed after version 3.14rc=
7"
+
+CVE_STATUS[CVE-2014-0101] =3D "fixed-version: Fixed after version 3.14rc=
6"
+
+CVE_STATUS[CVE-2014-0102] =3D "fixed-version: Fixed after version 3.14rc=
6"
+
+CVE_STATUS[CVE-2014-0131] =3D "fixed-version: Fixed after version 3.14rc=
7"
+
+CVE_STATUS[CVE-2014-0155] =3D "fixed-version: Fixed after version 3.15rc=
2"
+
+CVE_STATUS[CVE-2014-0181] =3D "fixed-version: Fixed after version 3.15rc=
5"
+
+CVE_STATUS[CVE-2014-0196] =3D "fixed-version: Fixed after version 3.15rc=
5"
+
+CVE_STATUS[CVE-2014-0203] =3D "fixed-version: Fixed after version 2.6.33=
rc5"
+
+CVE_STATUS[CVE-2014-0205] =3D "fixed-version: Fixed after version 2.6.37=
rc1"
+
+CVE_STATUS[CVE-2014-0206] =3D "fixed-version: Fixed after version 3.16rc=
3"
+
+# Skipping CVE-2014-0972, no affected_versions
+
+CVE_STATUS[CVE-2014-1438] =3D "fixed-version: Fixed after version 3.13"
+
+CVE_STATUS[CVE-2014-1444] =3D "fixed-version: Fixed after version 3.12rc=
7"
+
+CVE_STATUS[CVE-2014-1445] =3D "fixed-version: Fixed after version 3.12rc=
7"
+
+CVE_STATUS[CVE-2014-1446] =3D "fixed-version: Fixed after version 3.13rc=
7"
+
+CVE_STATUS[CVE-2014-1690] =3D "fixed-version: Fixed after version 3.13rc=
8"
+
+CVE_STATUS[CVE-2014-1737] =3D "fixed-version: Fixed after version 3.15rc=
5"
+
+CVE_STATUS[CVE-2014-1738] =3D "fixed-version: Fixed after version 3.15rc=
5"
+
+CVE_STATUS[CVE-2014-1739] =3D "fixed-version: Fixed after version 3.15rc=
6"
+
+CVE_STATUS[CVE-2014-1874] =3D "fixed-version: Fixed after version 3.14rc=
2"
+
+CVE_STATUS[CVE-2014-2038] =3D "fixed-version: Fixed after version 3.14rc=
1"
+
+CVE_STATUS[CVE-2014-2039] =3D "fixed-version: Fixed after version 3.14rc=
3"
+
+CVE_STATUS[CVE-2014-2309] =3D "fixed-version: Fixed after version 3.14rc=
7"
+
+CVE_STATUS[CVE-2014-2523] =3D "fixed-version: Fixed after version 3.14rc=
1"
+
+CVE_STATUS[CVE-2014-2568] =3D "fixed-version: Fixed after version 3.14"
+
+CVE_STATUS[CVE-2014-2580] =3D "fixed-version: Fixed after version 3.15rc=
1"
+
+CVE_STATUS[CVE-2014-2672] =3D "fixed-version: Fixed after version 3.14rc=
6"
+
+CVE_STATUS[CVE-2014-2673] =3D "fixed-version: Fixed after version 3.14rc=
6"
+
+CVE_STATUS[CVE-2014-2678] =3D "fixed-version: Fixed after version 3.15rc=
1"
+
+CVE_STATUS[CVE-2014-2706] =3D "fixed-version: Fixed after version 3.14rc=
6"
+
+CVE_STATUS[CVE-2014-2739] =3D "fixed-version: Fixed after version 3.15rc=
1"
+
+CVE_STATUS[CVE-2014-2851] =3D "fixed-version: Fixed after version 3.15rc=
2"
+
+CVE_STATUS[CVE-2014-2889] =3D "fixed-version: Fixed after version 3.2rc7=
"
+
+CVE_STATUS[CVE-2014-3122] =3D "fixed-version: Fixed after version 3.15rc=
1"
+
+CVE_STATUS[CVE-2014-3144] =3D "fixed-version: Fixed after version 3.15rc=
2"
+
+CVE_STATUS[CVE-2014-3145] =3D "fixed-version: Fixed after version 3.15rc=
2"
+
+CVE_STATUS[CVE-2014-3153] =3D "fixed-version: Fixed after version 3.15"
+
+CVE_STATUS[CVE-2014-3180] =3D "fixed-version: Fixed after version 3.17rc=
4"
+
+CVE_STATUS[CVE-2014-3181] =3D "fixed-version: Fixed after version 3.17rc=
3"
+
+CVE_STATUS[CVE-2014-3182] =3D "fixed-version: Fixed after version 3.17rc=
2"
+
+CVE_STATUS[CVE-2014-3183] =3D "fixed-version: Fixed after version 3.17rc=
2"
+
+CVE_STATUS[CVE-2014-3184] =3D "fixed-version: Fixed after version 3.17rc=
2"
+
+CVE_STATUS[CVE-2014-3185] =3D "fixed-version: Fixed after version 3.17rc=
3"
+
+CVE_STATUS[CVE-2014-3186] =3D "fixed-version: Fixed after version 3.17rc=
3"
+
+# Skipping CVE-2014-3519, no affected_versions
+
+CVE_STATUS[CVE-2014-3534] =3D "fixed-version: Fixed after version 3.16rc=
7"
+
+CVE_STATUS[CVE-2014-3535] =3D "fixed-version: Fixed after version 2.6.36=
rc1"
+
+CVE_STATUS[CVE-2014-3601] =3D "fixed-version: Fixed after version 3.17rc=
2"
+
+CVE_STATUS[CVE-2014-3610] =3D "fixed-version: Fixed after version 3.18rc=
2"
+
+CVE_STATUS[CVE-2014-3611] =3D "fixed-version: Fixed after version 3.18rc=
2"
+
+CVE_STATUS[CVE-2014-3631] =3D "fixed-version: Fixed after version 3.17rc=
5"
+
+CVE_STATUS[CVE-2014-3645] =3D "fixed-version: Fixed after version 3.12rc=
1"
+
+CVE_STATUS[CVE-2014-3646] =3D "fixed-version: Fixed after version 3.18rc=
2"
+
+CVE_STATUS[CVE-2014-3647] =3D "fixed-version: Fixed after version 3.18rc=
2"
+
+CVE_STATUS[CVE-2014-3673] =3D "fixed-version: Fixed after version 3.18rc=
1"
+
+CVE_STATUS[CVE-2014-3687] =3D "fixed-version: Fixed after version 3.18rc=
1"
+
+CVE_STATUS[CVE-2014-3688] =3D "fixed-version: Fixed after version 3.18rc=
1"
+
+CVE_STATUS[CVE-2014-3690] =3D "fixed-version: Fixed after version 3.18rc=
1"
+
+CVE_STATUS[CVE-2014-3917] =3D "fixed-version: Fixed after version 3.16rc=
1"
+
+CVE_STATUS[CVE-2014-3940] =3D "fixed-version: Fixed after version 3.15"
+
+CVE_STATUS[CVE-2014-4014] =3D "fixed-version: Fixed after version 3.16rc=
1"
+
+CVE_STATUS[CVE-2014-4027] =3D "fixed-version: Fixed after version 3.14rc=
1"
+
+CVE_STATUS[CVE-2014-4157] =3D "fixed-version: Fixed after version 3.15rc=
1"
+
+CVE_STATUS[CVE-2014-4171] =3D "fixed-version: Fixed after version 3.16rc=
3"
+
+# Skipping CVE-2014-4322, no affected_versions
+
+# Skipping CVE-2014-4323, no affected_versions
+
+CVE_STATUS[CVE-2014-4508] =3D "fixed-version: Fixed after version 3.16rc=
3"
+
+CVE_STATUS[CVE-2014-4608] =3D "fixed-version: Fixed after version 3.18rc=
1"
+
+CVE_STATUS[CVE-2014-4611] =3D "fixed-version: Fixed after version 3.16rc=
3"
+
+CVE_STATUS[CVE-2014-4652] =3D "fixed-version: Fixed after version 3.16rc=
2"
+
+CVE_STATUS[CVE-2014-4653] =3D "fixed-version: Fixed after version 3.16rc=
2"
+
+CVE_STATUS[CVE-2014-4654] =3D "fixed-version: Fixed after version 3.16rc=
2"
+
+CVE_STATUS[CVE-2014-4655] =3D "fixed-version: Fixed after version 3.16rc=
2"
+
+CVE_STATUS[CVE-2014-4656] =3D "fixed-version: Fixed after version 3.16rc=
2"
+
+CVE_STATUS[CVE-2014-4667] =3D "fixed-version: Fixed after version 3.16rc=
1"
+
+CVE_STATUS[CVE-2014-4699] =3D "fixed-version: Fixed after version 3.16rc=
4"
+
+CVE_STATUS[CVE-2014-4943] =3D "fixed-version: Fixed after version 3.16rc=
6"
+
+CVE_STATUS[CVE-2014-5045] =3D "fixed-version: Fixed after version 3.16rc=
7"
+
+CVE_STATUS[CVE-2014-5077] =3D "fixed-version: Fixed after version 3.16"
+
+CVE_STATUS[CVE-2014-5206] =3D "fixed-version: Fixed after version 3.17rc=
1"
+
+CVE_STATUS[CVE-2014-5207] =3D "fixed-version: Fixed after version 3.17rc=
1"
+
+# Skipping CVE-2014-5332, no affected_versions
+
+CVE_STATUS[CVE-2014-5471] =3D "fixed-version: Fixed after version 3.17rc=
2"
+
+CVE_STATUS[CVE-2014-5472] =3D "fixed-version: Fixed after version 3.17rc=
2"
+
+CVE_STATUS[CVE-2014-6410] =3D "fixed-version: Fixed after version 3.17rc=
5"
+
+CVE_STATUS[CVE-2014-6416] =3D "fixed-version: Fixed after version 3.17rc=
5"
+
+CVE_STATUS[CVE-2014-6417] =3D "fixed-version: Fixed after version 3.17rc=
5"
+
+CVE_STATUS[CVE-2014-6418] =3D "fixed-version: Fixed after version 3.17rc=
5"
+
+CVE_STATUS[CVE-2014-7145] =3D "fixed-version: Fixed after version 3.17rc=
2"
+
+# Skipping CVE-2014-7207, no affected_versions
+
+CVE_STATUS[CVE-2014-7283] =3D "fixed-version: Fixed after version 3.15rc=
1"
+
+CVE_STATUS[CVE-2014-7284] =3D "fixed-version: Fixed after version 3.15rc=
7"
+
+CVE_STATUS[CVE-2014-7822] =3D "fixed-version: Fixed after version 3.16rc=
1"
+
+CVE_STATUS[CVE-2014-7825] =3D "fixed-version: Fixed after version 3.18rc=
3"
+
+CVE_STATUS[CVE-2014-7826] =3D "fixed-version: Fixed after version 3.18rc=
3"
+
+CVE_STATUS[CVE-2014-7841] =3D "fixed-version: Fixed after version 3.18rc=
5"
+
+CVE_STATUS[CVE-2014-7842] =3D "fixed-version: Fixed after version 3.18rc=
1"
+
+CVE_STATUS[CVE-2014-7843] =3D "fixed-version: Fixed after version 3.18rc=
5"
+
+CVE_STATUS[CVE-2014-7970] =3D "fixed-version: Fixed after version 3.18rc=
1"
+
+CVE_STATUS[CVE-2014-7975] =3D "fixed-version: Fixed after version 3.18rc=
1"
+
+CVE_STATUS[CVE-2014-8086] =3D "fixed-version: Fixed after version 3.18rc=
3"
+
+CVE_STATUS[CVE-2014-8133] =3D "fixed-version: Fixed after version 3.19rc=
1"
+
+CVE_STATUS[CVE-2014-8134] =3D "fixed-version: Fixed after version 3.19rc=
1"
+
+CVE_STATUS[CVE-2014-8159] =3D "fixed-version: Fixed after version 4.0rc7=
"
+
+CVE_STATUS[CVE-2014-8160] =3D "fixed-version: Fixed after version 3.18rc=
1"
+
+CVE_STATUS[CVE-2014-8171] =3D "fixed-version: Fixed after version 3.12rc=
1"
+
+CVE_STATUS[CVE-2014-8172] =3D "fixed-version: Fixed after version 3.13rc=
1"
+
+CVE_STATUS[CVE-2014-8173] =3D "fixed-version: Fixed after version 3.13rc=
5"
+
+# Skipping CVE-2014-8181, no affected_versions
+
+CVE_STATUS[CVE-2014-8369] =3D "fixed-version: Fixed after version 3.18rc=
2"
+
+CVE_STATUS[CVE-2014-8480] =3D "fixed-version: Fixed after version 3.18rc=
2"
+
+CVE_STATUS[CVE-2014-8481] =3D "fixed-version: Fixed after version 3.18rc=
2"
+
+CVE_STATUS[CVE-2014-8559] =3D "fixed-version: Fixed after version 3.19rc=
1"
+
+CVE_STATUS[CVE-2014-8709] =3D "fixed-version: Fixed after version 3.14rc=
3"
+
+CVE_STATUS[CVE-2014-8884] =3D "fixed-version: Fixed after version 3.18rc=
1"
+
+CVE_STATUS[CVE-2014-8989] =3D "fixed-version: Fixed after version 3.19rc=
1"
+
+CVE_STATUS[CVE-2014-9090] =3D "fixed-version: Fixed after version 3.18rc=
6"
+
+CVE_STATUS[CVE-2014-9322] =3D "fixed-version: Fixed after version 3.18rc=
6"
+
+CVE_STATUS[CVE-2014-9419] =3D "fixed-version: Fixed after version 3.19rc=
1"
+
+CVE_STATUS[CVE-2014-9420] =3D "fixed-version: Fixed after version 3.19rc=
1"
+
+CVE_STATUS[CVE-2014-9428] =3D "fixed-version: Fixed after version 3.19rc=
3"
+
+CVE_STATUS[CVE-2014-9529] =3D "fixed-version: Fixed after version 3.19rc=
4"
+
+CVE_STATUS[CVE-2014-9584] =3D "fixed-version: Fixed after version 3.19rc=
3"
+
+CVE_STATUS[CVE-2014-9585] =3D "fixed-version: Fixed after version 3.19rc=
4"
+
+CVE_STATUS[CVE-2014-9644] =3D "fixed-version: Fixed after version 3.19rc=
1"
+
+CVE_STATUS[CVE-2014-9683] =3D "fixed-version: Fixed after version 3.19rc=
1"
+
+CVE_STATUS[CVE-2014-9710] =3D "fixed-version: Fixed after version 3.19rc=
1"
+
+CVE_STATUS[CVE-2014-9715] =3D "fixed-version: Fixed after version 3.15rc=
1"
+
+CVE_STATUS[CVE-2014-9717] =3D "fixed-version: Fixed after version 4.1rc1=
"
+
+CVE_STATUS[CVE-2014-9728] =3D "fixed-version: Fixed after version 3.19rc=
3"
+
+CVE_STATUS[CVE-2014-9729] =3D "fixed-version: Fixed after version 3.19rc=
3"
+
+CVE_STATUS[CVE-2014-9730] =3D "fixed-version: Fixed after version 3.19rc=
3"
+
+CVE_STATUS[CVE-2014-9731] =3D "fixed-version: Fixed after version 3.19rc=
3"
+
+# Skipping CVE-2014-9777, no affected_versions
+
+# Skipping CVE-2014-9778, no affected_versions
+
+# Skipping CVE-2014-9779, no affected_versions
+
+# Skipping CVE-2014-9780, no affected_versions
+
+# Skipping CVE-2014-9781, no affected_versions
+
+# Skipping CVE-2014-9782, no affected_versions
+
+# Skipping CVE-2014-9783, no affected_versions
+
+# Skipping CVE-2014-9784, no affected_versions
+
+# Skipping CVE-2014-9785, no affected_versions
+
+# Skipping CVE-2014-9786, no affected_versions
+
+# Skipping CVE-2014-9787, no affected_versions
+
+# Skipping CVE-2014-9788, no affected_versions
+
+# Skipping CVE-2014-9789, no affected_versions
+
+CVE_STATUS[CVE-2014-9803] =3D "fixed-version: Fixed after version 3.16rc=
1"
+
+# Skipping CVE-2014-9863, no affected_versions
+
+# Skipping CVE-2014-9864, no affected_versions
+
+# Skipping CVE-2014-9865, no affected_versions
+
+# Skipping CVE-2014-9866, no affected_versions
+
+# Skipping CVE-2014-9867, no affected_versions
+
+# Skipping CVE-2014-9868, no affected_versions
+
+# Skipping CVE-2014-9869, no affected_versions
+
+CVE_STATUS[CVE-2014-9870] =3D "fixed-version: Fixed after version 3.11rc=
1"
+
+# Skipping CVE-2014-9871, no affected_versions
+
+# Skipping CVE-2014-9872, no affected_versions
+
+# Skipping CVE-2014-9873, no affected_versions
+
+# Skipping CVE-2014-9874, no affected_versions
+
+# Skipping CVE-2014-9875, no affected_versions
+
+# Skipping CVE-2014-9876, no affected_versions
+
+# Skipping CVE-2014-9877, no affected_versions
+
+# Skipping CVE-2014-9878, no affected_versions
+
+# Skipping CVE-2014-9879, no affected_versions
+
+# Skipping CVE-2014-9880, no affected_versions
+
+# Skipping CVE-2014-9881, no affected_versions
+
+# Skipping CVE-2014-9882, no affected_versions
+
+# Skipping CVE-2014-9883, no affected_versions
+
+# Skipping CVE-2014-9884, no affected_versions
+
+# Skipping CVE-2014-9885, no affected_versions
+
+# Skipping CVE-2014-9886, no affected_versions
+
+# Skipping CVE-2014-9887, no affected_versions
+
+CVE_STATUS[CVE-2014-9888] =3D "fixed-version: Fixed after version 3.13rc=
1"
+
+# Skipping CVE-2014-9889, no affected_versions
+
+# Skipping CVE-2014-9890, no affected_versions
+
+# Skipping CVE-2014-9891, no affected_versions
+
+# Skipping CVE-2014-9892, no affected_versions
+
+# Skipping CVE-2014-9893, no affected_versions
+
+# Skipping CVE-2014-9894, no affected_versions
+
+CVE_STATUS[CVE-2014-9895] =3D "fixed-version: Fixed after version 3.11rc=
1"
+
+# Skipping CVE-2014-9896, no affected_versions
+
+# Skipping CVE-2014-9897, no affected_versions
+
+# Skipping CVE-2014-9898, no affected_versions
+
+# Skipping CVE-2014-9899, no affected_versions
+
+# Skipping CVE-2014-9900, no affected_versions
+
+CVE_STATUS[CVE-2014-9903] =3D "fixed-version: Fixed after version 3.14rc=
4"
+
+CVE_STATUS[CVE-2014-9904] =3D "fixed-version: Fixed after version 3.17rc=
1"
+
+CVE_STATUS[CVE-2014-9914] =3D "fixed-version: Fixed after version 3.16rc=
1"
+
+CVE_STATUS[CVE-2014-9922] =3D "fixed-version: Fixed after version 3.18rc=
2"
+
+CVE_STATUS[CVE-2014-9940] =3D "fixed-version: Fixed after version 3.19rc=
1"
+
+CVE_STATUS[CVE-2015-0239] =3D "fixed-version: Fixed after version 3.19rc=
6"
+
+CVE_STATUS[CVE-2015-0274] =3D "fixed-version: Fixed after version 3.15rc=
5"
+
+CVE_STATUS[CVE-2015-0275] =3D "fixed-version: Fixed after version 4.1rc1=
"
+
+# Skipping CVE-2015-0777, no affected_versions
+
+# Skipping CVE-2015-1328, no affected_versions
+
+CVE_STATUS[CVE-2015-1333] =3D "fixed-version: Fixed after version 4.2rc5=
"
+
+CVE_STATUS[CVE-2015-1339] =3D "fixed-version: Fixed after version 4.4rc5=
"
+
+CVE_STATUS[CVE-2015-1350] =3D "fixed-version: Fixed after version 4.9rc1=
"
+
+CVE_STATUS[CVE-2015-1420] =3D "fixed-version: Fixed after version 4.1rc7=
"
+
+CVE_STATUS[CVE-2015-1421] =3D "fixed-version: Fixed after version 3.19rc=
7"
+
+CVE_STATUS[CVE-2015-1465] =3D "fixed-version: Fixed after version 3.19rc=
7"
+
+CVE_STATUS[CVE-2015-1573] =3D "fixed-version: Fixed after version 3.19rc=
5"
+
+CVE_STATUS[CVE-2015-1593] =3D "fixed-version: Fixed after version 4.0rc1=
"
+
+CVE_STATUS[CVE-2015-1805] =3D "fixed-version: Fixed after version 3.16rc=
1"
+
+CVE_STATUS[CVE-2015-2041] =3D "fixed-version: Fixed after version 3.19rc=
7"
+
+CVE_STATUS[CVE-2015-2042] =3D "fixed-version: Fixed after version 3.19"
+
+CVE_STATUS[CVE-2015-2150] =3D "fixed-version: Fixed after version 4.0rc4=
"
+
+CVE_STATUS[CVE-2015-2666] =3D "fixed-version: Fixed after version 4.0rc1=
"
+
+CVE_STATUS[CVE-2015-2672] =3D "fixed-version: Fixed after version 4.0rc3=
"
+
+CVE_STATUS[CVE-2015-2686] =3D "fixed-version: Fixed after version 4.0rc6=
"
+
+CVE_STATUS[CVE-2015-2830] =3D "fixed-version: Fixed after version 4.0rc3=
"
+
+# CVE-2015-2877 has no known resolution
+
+CVE_STATUS[CVE-2015-2922] =3D "fixed-version: Fixed after version 4.0rc7=
"
+
+CVE_STATUS[CVE-2015-2925] =3D "fixed-version: Fixed after version 4.3rc1=
"
+
+CVE_STATUS[CVE-2015-3212] =3D "fixed-version: Fixed after version 4.2rc1=
"
+
+CVE_STATUS[CVE-2015-3214] =3D "fixed-version: Fixed after version 2.6.33=
rc8"
+
+CVE_STATUS[CVE-2015-3288] =3D "fixed-version: Fixed after version 4.2rc2=
"
+
+CVE_STATUS[CVE-2015-3290] =3D "fixed-version: Fixed after version 4.2rc3=
"
+
+CVE_STATUS[CVE-2015-3291] =3D "fixed-version: Fixed after version 4.2rc3=
"
+
+CVE_STATUS[CVE-2015-3331] =3D "fixed-version: Fixed after version 4.0rc5=
"
+
+# Skipping CVE-2015-3332, no affected_versions
+
+CVE_STATUS[CVE-2015-3339] =3D "fixed-version: Fixed after version 4.1rc1=
"
+
+CVE_STATUS[CVE-2015-3636] =3D "fixed-version: Fixed after version 4.1rc2=
"
+
+CVE_STATUS[CVE-2015-4001] =3D "fixed-version: Fixed after version 4.1rc7=
"
+
+CVE_STATUS[CVE-2015-4002] =3D "fixed-version: Fixed after version 4.1rc7=
"
+
+CVE_STATUS[CVE-2015-4003] =3D "fixed-version: Fixed after version 4.1rc7=
"
+
+CVE_STATUS[CVE-2015-4004] =3D "fixed-version: Fixed after version 4.3rc1=
"
+
+CVE_STATUS[CVE-2015-4036] =3D "fixed-version: Fixed after version 4.0rc1=
"
+
+CVE_STATUS[CVE-2015-4167] =3D "fixed-version: Fixed after version 4.0rc1=
"
+
+CVE_STATUS[CVE-2015-4170] =3D "fixed-version: Fixed after version 3.13rc=
5"
+
+CVE_STATUS[CVE-2015-4176] =3D "fixed-version: Fixed after version 4.1rc1=
"
+
+CVE_STATUS[CVE-2015-4177] =3D "fixed-version: Fixed after version 4.1rc1=
"
+
+CVE_STATUS[CVE-2015-4178] =3D "fixed-version: Fixed after version 4.1rc1=
"
+
+CVE_STATUS[CVE-2015-4692] =3D "fixed-version: Fixed after version 4.2rc1=
"
+
+CVE_STATUS[CVE-2015-4700] =3D "fixed-version: Fixed after version 4.1rc6=
"
+
+CVE_STATUS[CVE-2015-5156] =3D "fixed-version: Fixed after version 4.2rc7=
"
+
+CVE_STATUS[CVE-2015-5157] =3D "fixed-version: Fixed after version 4.2rc3=
"
+
+CVE_STATUS[CVE-2015-5257] =3D "fixed-version: Fixed after version 4.3rc3=
"
+
+CVE_STATUS[CVE-2015-5283] =3D "fixed-version: Fixed after version 4.3rc3=
"
+
+CVE_STATUS[CVE-2015-5307] =3D "fixed-version: Fixed after version 4.4rc1=
"
+
+CVE_STATUS[CVE-2015-5327] =3D "fixed-version: Fixed after version 4.4rc1=
"
+
+CVE_STATUS[CVE-2015-5364] =3D "fixed-version: Fixed after version 4.1rc7=
"
+
+CVE_STATUS[CVE-2015-5366] =3D "fixed-version: Fixed after version 4.1rc7=
"
+
+CVE_STATUS[CVE-2015-5697] =3D "fixed-version: Fixed after version 4.2rc6=
"
+
+CVE_STATUS[CVE-2015-5706] =3D "fixed-version: Fixed after version 4.1rc3=
"
+
+CVE_STATUS[CVE-2015-5707] =3D "fixed-version: Fixed after version 4.1rc1=
"
+
+CVE_STATUS[CVE-2015-6252] =3D "fixed-version: Fixed after version 4.2rc5=
"
+
+CVE_STATUS[CVE-2015-6526] =3D "fixed-version: Fixed after version 4.1rc1=
"
+
+# CVE-2015-6619 has no known resolution
+
+# CVE-2015-6646 has no known resolution
+
+CVE_STATUS[CVE-2015-6937] =3D "fixed-version: Fixed after version 4.3rc1=
"
+
+# Skipping CVE-2015-7312, no affected_versions
+
+CVE_STATUS[CVE-2015-7509] =3D "fixed-version: Fixed after version 3.7rc1=
"
+
+CVE_STATUS[CVE-2015-7513] =3D "fixed-version: Fixed after version 4.4rc7=
"
+
+CVE_STATUS[CVE-2015-7515] =3D "fixed-version: Fixed after version 4.4rc6=
"
+
+CVE_STATUS[CVE-2015-7550] =3D "fixed-version: Fixed after version 4.4rc8=
"
+
+# Skipping CVE-2015-7553, no affected_versions
+
+CVE_STATUS[CVE-2015-7566] =3D "fixed-version: Fixed after version 4.5rc2=
"
+
+CVE_STATUS[CVE-2015-7613] =3D "fixed-version: Fixed after version 4.3rc4=
"
+
+CVE_STATUS[CVE-2015-7799] =3D "fixed-version: Fixed after version 4.4rc1=
"
+
+CVE_STATUS[CVE-2015-7833] =3D "fixed-version: Fixed after version 4.6rc6=
"
+
+# Skipping CVE-2015-7837, no affected_versions
+
+CVE_STATUS[CVE-2015-7872] =3D "fixed-version: Fixed after version 4.3rc7=
"
+
+CVE_STATUS[CVE-2015-7884] =3D "fixed-version: Fixed after version 4.4rc1=
"
+
+CVE_STATUS[CVE-2015-7885] =3D "fixed-version: Fixed after version 4.4rc1=
"
+
+CVE_STATUS[CVE-2015-7990] =3D "fixed-version: Fixed after version 4.4rc4=
"
+
+# Skipping CVE-2015-8019, no affected_versions
+
+CVE_STATUS[CVE-2015-8104] =3D "fixed-version: Fixed after version 4.4rc1=
"
+
+CVE_STATUS[CVE-2015-8215] =3D "fixed-version: Fixed after version 4.0rc3=
"
+
+CVE_STATUS[CVE-2015-8324] =3D "fixed-version: Fixed after version 2.6.34=
rc1"
+
+CVE_STATUS[CVE-2015-8374] =3D "fixed-version: Fixed after version 4.4rc1=
"
+
+CVE_STATUS[CVE-2015-8539] =3D "fixed-version: Fixed after version 4.4rc3=
"
+
+CVE_STATUS[CVE-2015-8543] =3D "fixed-version: Fixed after version 4.4rc6=
"
+
+CVE_STATUS[CVE-2015-8550] =3D "fixed-version: Fixed after version 4.4rc6=
"
+
+CVE_STATUS[CVE-2015-8551] =3D "fixed-version: Fixed after version 4.4rc6=
"
+
+CVE_STATUS[CVE-2015-8552] =3D "fixed-version: Fixed after version 4.4rc6=
"
+
+CVE_STATUS[CVE-2015-8553] =3D "fixed-version: Fixed after version 4.4rc6=
"
+
+CVE_STATUS[CVE-2015-8569] =3D "fixed-version: Fixed after version 4.4rc6=
"
+
+CVE_STATUS[CVE-2015-8575] =3D "fixed-version: Fixed after version 4.4rc6=
"
+
+CVE_STATUS[CVE-2015-8660] =3D "fixed-version: Fixed after version 4.4rc4=
"
+
+CVE_STATUS[CVE-2015-8709] =3D "fixed-version: Fixed after version 4.10rc=
1"
+
+CVE_STATUS[CVE-2015-8746] =3D "fixed-version: Fixed after version 4.3rc1=
"
+
+CVE_STATUS[CVE-2015-8767] =3D "fixed-version: Fixed after version 4.3rc4=
"
+
+CVE_STATUS[CVE-2015-8785] =3D "fixed-version: Fixed after version 4.4rc5=
"
+
+CVE_STATUS[CVE-2015-8787] =3D "fixed-version: Fixed after version 4.4rc1=
"
+
+CVE_STATUS[CVE-2015-8812] =3D "fixed-version: Fixed after version 4.5rc1=
"
+
+CVE_STATUS[CVE-2015-8816] =3D "fixed-version: Fixed after version 4.4rc6=
"
+
+CVE_STATUS[CVE-2015-8830] =3D "fixed-version: Fixed after version 4.1rc1=
"
+
+CVE_STATUS[CVE-2015-8839] =3D "fixed-version: Fixed after version 4.5rc1=
"
+
+CVE_STATUS[CVE-2015-8844] =3D "fixed-version: Fixed after version 4.4rc3=
"
+
+CVE_STATUS[CVE-2015-8845] =3D "fixed-version: Fixed after version 4.4rc3=
"
+
+# Skipping CVE-2015-8937, no affected_versions
+
+# Skipping CVE-2015-8938, no affected_versions
+
+# Skipping CVE-2015-8939, no affected_versions
+
+# Skipping CVE-2015-8940, no affected_versions
+
+# Skipping CVE-2015-8941, no affected_versions
+
+# Skipping CVE-2015-8942, no affected_versions
+
+# Skipping CVE-2015-8943, no affected_versions
+
+# Skipping CVE-2015-8944, no affected_versions
+
+CVE_STATUS[CVE-2015-8950] =3D "fixed-version: Fixed after version 4.1rc2=
"
+
+CVE_STATUS[CVE-2015-8952] =3D "fixed-version: Fixed after version 4.6rc1=
"
+
+CVE_STATUS[CVE-2015-8953] =3D "fixed-version: Fixed after version 4.3"
+
+CVE_STATUS[CVE-2015-8955] =3D "fixed-version: Fixed after version 4.1rc1=
"
+
+CVE_STATUS[CVE-2015-8956] =3D "fixed-version: Fixed after version 4.2rc1=
"
+
+CVE_STATUS[CVE-2015-8961] =3D "fixed-version: Fixed after version 4.4rc1=
"
+
+CVE_STATUS[CVE-2015-8962] =3D "fixed-version: Fixed after version 4.4rc1=
"
+
+CVE_STATUS[CVE-2015-8963] =3D "fixed-version: Fixed after version 4.4"
+
+CVE_STATUS[CVE-2015-8964] =3D "fixed-version: Fixed after version 4.5rc1=
"
+
+CVE_STATUS[CVE-2015-8966] =3D "fixed-version: Fixed after version 4.4rc8=
"
+
+CVE_STATUS[CVE-2015-8967] =3D "fixed-version: Fixed after version 4.0rc1=
"
+
+CVE_STATUS[CVE-2015-8970] =3D "fixed-version: Fixed after version 4.5rc1=
"
+
+CVE_STATUS[CVE-2015-9004] =3D "fixed-version: Fixed after version 3.19rc=
7"
+
+CVE_STATUS[CVE-2015-9016] =3D "fixed-version: Fixed after version 4.3rc1=
"
+
+CVE_STATUS[CVE-2015-9289] =3D "fixed-version: Fixed after version 4.2rc1=
"
+
+CVE_STATUS[CVE-2016-0617] =3D "fixed-version: Fixed after version 4.5rc1=
"
+
+CVE_STATUS[CVE-2016-0723] =3D "fixed-version: Fixed after version 4.5rc2=
"
+
+CVE_STATUS[CVE-2016-0728] =3D "fixed-version: Fixed after version 4.5rc1=
"
+
+CVE_STATUS[CVE-2016-0758] =3D "fixed-version: Fixed after version 4.6"
+
+# Skipping CVE-2016-0774, no affected_versions
+
+CVE_STATUS[CVE-2016-0821] =3D "fixed-version: Fixed after version 4.3rc1=
"
+
+CVE_STATUS[CVE-2016-0823] =3D "fixed-version: Fixed after version 4.0rc5=
"
+
+CVE_STATUS[CVE-2016-10044] =3D "fixed-version: Fixed after version 4.8rc=
7"
+
+CVE_STATUS[CVE-2016-10088] =3D "fixed-version: Fixed after version 4.10r=
c1"
+
+CVE_STATUS[CVE-2016-10147] =3D "fixed-version: Fixed after version 4.9"
+
+CVE_STATUS[CVE-2016-10150] =3D "fixed-version: Fixed after version 4.9rc=
8"
+
+CVE_STATUS[CVE-2016-10153] =3D "fixed-version: Fixed after version 4.10r=
c1"
+
+CVE_STATUS[CVE-2016-10154] =3D "fixed-version: Fixed after version 4.10r=
c1"
+
+CVE_STATUS[CVE-2016-10200] =3D "fixed-version: Fixed after version 4.9rc=
7"
+
+CVE_STATUS[CVE-2016-10208] =3D "fixed-version: Fixed after version 4.10r=
c1"
+
+CVE_STATUS[CVE-2016-10229] =3D "fixed-version: Fixed after version 4.5rc=
1"
+
+CVE_STATUS[CVE-2016-10318] =3D "fixed-version: Fixed after version 4.8rc=
6"
+
+CVE_STATUS[CVE-2016-10723] =3D "fixed-version: Fixed after version 4.19r=
c1"
+
+CVE_STATUS[CVE-2016-10741] =3D "fixed-version: Fixed after version 4.10r=
c1"
+
+CVE_STATUS[CVE-2016-10764] =3D "fixed-version: Fixed after version 4.10r=
c1"
+
+CVE_STATUS[CVE-2016-10905] =3D "fixed-version: Fixed after version 4.8rc=
1"
+
+CVE_STATUS[CVE-2016-10906] =3D "fixed-version: Fixed after version 4.5rc=
6"
+
+CVE_STATUS[CVE-2016-10907] =3D "fixed-version: Fixed after version 4.9rc=
1"
+
+CVE_STATUS[CVE-2016-1237] =3D "fixed-version: Fixed after version 4.7rc5=
"
+
+CVE_STATUS[CVE-2016-1575] =3D "fixed-version: Fixed after version 4.5rc1=
"
+
+CVE_STATUS[CVE-2016-1576] =3D "fixed-version: Fixed after version 4.5rc1=
"
+
+CVE_STATUS[CVE-2016-1583] =3D "fixed-version: Fixed after version 4.7rc3=
"
+
+CVE_STATUS[CVE-2016-2053] =3D "fixed-version: Fixed after version 4.3rc1=
"
+
+CVE_STATUS[CVE-2016-2069] =3D "fixed-version: Fixed after version 4.5rc1=
"
+
+CVE_STATUS[CVE-2016-2070] =3D "fixed-version: Fixed after version 4.4"
+
+CVE_STATUS[CVE-2016-2085] =3D "fixed-version: Fixed after version 4.5rc4=
"
+
+CVE_STATUS[CVE-2016-2117] =3D "fixed-version: Fixed after version 4.6rc5=
"
+
+CVE_STATUS[CVE-2016-2143] =3D "fixed-version: Fixed after version 4.5"
+
+CVE_STATUS[CVE-2016-2184] =3D "fixed-version: Fixed after version 4.6rc1=
"
+
+CVE_STATUS[CVE-2016-2185] =3D "fixed-version: Fixed after version 4.6rc1=
"
+
+CVE_STATUS[CVE-2016-2186] =3D "fixed-version: Fixed after version 4.6rc1=
"
+
+CVE_STATUS[CVE-2016-2187] =3D "fixed-version: Fixed after version 4.6rc5=
"
+
+CVE_STATUS[CVE-2016-2188] =3D "fixed-version: Fixed after version 4.11rc=
2"
+
+CVE_STATUS[CVE-2016-2383] =3D "fixed-version: Fixed after version 4.5rc4=
"
+
+CVE_STATUS[CVE-2016-2384] =3D "fixed-version: Fixed after version 4.5rc4=
"
+
+CVE_STATUS[CVE-2016-2543] =3D "fixed-version: Fixed after version 4.5rc1=
"
+
+CVE_STATUS[CVE-2016-2544] =3D "fixed-version: Fixed after version 4.5rc1=
"
+
+CVE_STATUS[CVE-2016-2545] =3D "fixed-version: Fixed after version 4.5rc1=
"
+
+CVE_STATUS[CVE-2016-2546] =3D "fixed-version: Fixed after version 4.5rc1=
"
+
+CVE_STATUS[CVE-2016-2547] =3D "fixed-version: Fixed after version 4.5rc1=
"
+
+CVE_STATUS[CVE-2016-2548] =3D "fixed-version: Fixed after version 4.5rc1=
"
+
+CVE_STATUS[CVE-2016-2549] =3D "fixed-version: Fixed after version 4.5rc1=
"
+
+CVE_STATUS[CVE-2016-2550] =3D "fixed-version: Fixed after version 4.5rc4=
"
+
+CVE_STATUS[CVE-2016-2782] =3D "fixed-version: Fixed after version 4.5rc2=
"
+
+CVE_STATUS[CVE-2016-2847] =3D "fixed-version: Fixed after version 4.5rc1=
"
+
+# Skipping CVE-2016-2853, no affected_versions
+
+# Skipping CVE-2016-2854, no affected_versions
+
+CVE_STATUS[CVE-2016-3044] =3D "fixed-version: Fixed after version 4.5"
+
+CVE_STATUS[CVE-2016-3070] =3D "fixed-version: Fixed after version 4.4rc1=
"
+
+CVE_STATUS[CVE-2016-3134] =3D "fixed-version: Fixed after version 4.6rc2=
"
+
+CVE_STATUS[CVE-2016-3135] =3D "fixed-version: Fixed after version 4.6rc1=
"
+
+CVE_STATUS[CVE-2016-3136] =3D "fixed-version: Fixed after version 4.6rc3=
"
+
+CVE_STATUS[CVE-2016-3137] =3D "fixed-version: Fixed after version 4.6rc3=
"
+
+CVE_STATUS[CVE-2016-3138] =3D "fixed-version: Fixed after version 4.6rc1=
"
+
+CVE_STATUS[CVE-2016-3139] =3D "fixed-version: Fixed after version 3.17rc=
1"
+
+CVE_STATUS[CVE-2016-3140] =3D "fixed-version: Fixed after version 4.6rc3=
"
+
+CVE_STATUS[CVE-2016-3156] =3D "fixed-version: Fixed after version 4.6rc1=
"
+
+CVE_STATUS[CVE-2016-3157] =3D "fixed-version: Fixed after version 4.6rc1=
"
+
+CVE_STATUS[CVE-2016-3672] =3D "fixed-version: Fixed after version 4.6rc1=
"
+
+CVE_STATUS[CVE-2016-3689] =3D "fixed-version: Fixed after version 4.6rc1=
"
+
+# Skipping CVE-2016-3695, no affected_versions
+
+# Skipping CVE-2016-3699, no affected_versions
+
+# Skipping CVE-2016-3707, no affected_versions
+
+CVE_STATUS[CVE-2016-3713] =3D "fixed-version: Fixed after version 4.7rc1=
"
+
+# CVE-2016-3775 has no known resolution
+
+# CVE-2016-3802 has no known resolution
+
+# CVE-2016-3803 has no known resolution
+
+CVE_STATUS[CVE-2016-3841] =3D "fixed-version: Fixed after version 4.4rc4=
"
+
+CVE_STATUS[CVE-2016-3857] =3D "fixed-version: Fixed after version 4.8rc2=
"
+
+CVE_STATUS[CVE-2016-3951] =3D "fixed-version: Fixed after version 4.5"
+
+CVE_STATUS[CVE-2016-3955] =3D "fixed-version: Fixed after version 4.6rc3=
"
+
+CVE_STATUS[CVE-2016-3961] =3D "fixed-version: Fixed after version 4.6rc5=
"
+
+CVE_STATUS[CVE-2016-4440] =3D "fixed-version: Fixed after version 4.7rc1=
"
+
+CVE_STATUS[CVE-2016-4470] =3D "fixed-version: Fixed after version 4.7rc4=
"
+
+CVE_STATUS[CVE-2016-4482] =3D "fixed-version: Fixed after version 4.7rc1=
"
+
+CVE_STATUS[CVE-2016-4485] =3D "fixed-version: Fixed after version 4.6"
+
+CVE_STATUS[CVE-2016-4486] =3D "fixed-version: Fixed after version 4.6"
+
+CVE_STATUS[CVE-2016-4557] =3D "fixed-version: Fixed after version 4.6rc6=
"
+
+CVE_STATUS[CVE-2016-4558] =3D "fixed-version: Fixed after version 4.6rc7=
"
+
+CVE_STATUS[CVE-2016-4565] =3D "fixed-version: Fixed after version 4.6rc6=
"
+
+CVE_STATUS[CVE-2016-4568] =3D "fixed-version: Fixed after version 4.6rc6=
"
+
+CVE_STATUS[CVE-2016-4569] =3D "fixed-version: Fixed after version 4.7rc1=
"
+
+CVE_STATUS[CVE-2016-4578] =3D "fixed-version: Fixed after version 4.7rc1=
"
+
+CVE_STATUS[CVE-2016-4580] =3D "fixed-version: Fixed after version 4.6"
+
+CVE_STATUS[CVE-2016-4581] =3D "fixed-version: Fixed after version 4.6rc7=
"
+
+CVE_STATUS[CVE-2016-4794] =3D "fixed-version: Fixed after version 4.7rc4=
"
+
+CVE_STATUS[CVE-2016-4805] =3D "fixed-version: Fixed after version 4.6rc1=
"
+
+CVE_STATUS[CVE-2016-4913] =3D "fixed-version: Fixed after version 4.6"
+
+CVE_STATUS[CVE-2016-4951] =3D "fixed-version: Fixed after version 4.7rc1=
"
+
+CVE_STATUS[CVE-2016-4997] =3D "fixed-version: Fixed after version 4.7rc1=
"
+
+CVE_STATUS[CVE-2016-4998] =3D "fixed-version: Fixed after version 4.7rc1=
"
+
+CVE_STATUS[CVE-2016-5195] =3D "fixed-version: Fixed after version 4.9rc2=
"
+
+CVE_STATUS[CVE-2016-5243] =3D "fixed-version: Fixed after version 4.7rc3=
"
+
+CVE_STATUS[CVE-2016-5244] =3D "fixed-version: Fixed after version 4.7rc3=
"
+
+# Skipping CVE-2016-5340, no affected_versions
+
+# Skipping CVE-2016-5342, no affected_versions
+
+# Skipping CVE-2016-5343, no affected_versions
+
+# Skipping CVE-2016-5344, no affected_versions
+
+CVE_STATUS[CVE-2016-5400] =3D "fixed-version: Fixed after version 4.7"
+
+CVE_STATUS[CVE-2016-5412] =3D "fixed-version: Fixed after version 4.8rc1=
"
+
+CVE_STATUS[CVE-2016-5696] =3D "fixed-version: Fixed after version 4.7"
+
+CVE_STATUS[CVE-2016-5728] =3D "fixed-version: Fixed after version 4.7rc1=
"
+
+CVE_STATUS[CVE-2016-5828] =3D "fixed-version: Fixed after version 4.7rc6=
"
+
+CVE_STATUS[CVE-2016-5829] =3D "fixed-version: Fixed after version 4.7rc5=
"
+
+# CVE-2016-5870 has no known resolution
+
+CVE_STATUS[CVE-2016-6130] =3D "fixed-version: Fixed after version 4.6rc6=
"
+
+CVE_STATUS[CVE-2016-6136] =3D "fixed-version: Fixed after version 4.8rc1=
"
+
+CVE_STATUS[CVE-2016-6156] =3D "fixed-version: Fixed after version 4.7rc7=
"
+
+CVE_STATUS[CVE-2016-6162] =3D "fixed-version: Fixed after version 4.7"
+
+CVE_STATUS[CVE-2016-6187] =3D "fixed-version: Fixed after version 4.7rc7=
"
+
+CVE_STATUS[CVE-2016-6197] =3D "fixed-version: Fixed after version 4.6rc1=
"
+
+CVE_STATUS[CVE-2016-6198] =3D "fixed-version: Fixed after version 4.6"
+
+CVE_STATUS[CVE-2016-6213] =3D "fixed-version: Fixed after version 4.9rc1=
"
+
+CVE_STATUS[CVE-2016-6327] =3D "fixed-version: Fixed after version 4.6rc1=
"
+
+CVE_STATUS[CVE-2016-6480] =3D "fixed-version: Fixed after version 4.8rc3=
"
+
+CVE_STATUS[CVE-2016-6516] =3D "fixed-version: Fixed after version 4.8rc1=
"
+
+# Skipping CVE-2016-6753, no affected_versions
+
+CVE_STATUS[CVE-2016-6786] =3D "fixed-version: Fixed after version 4.0rc1=
"
+
+CVE_STATUS[CVE-2016-6787] =3D "fixed-version: Fixed after version 4.0rc1=
"
+
+CVE_STATUS[CVE-2016-6828] =3D "fixed-version: Fixed after version 4.8rc5=
"
+
+CVE_STATUS[CVE-2016-7039] =3D "fixed-version: Fixed after version 4.9rc4=
"
+
+CVE_STATUS[CVE-2016-7042] =3D "fixed-version: Fixed after version 4.9rc3=
"
+
+CVE_STATUS[CVE-2016-7097] =3D "fixed-version: Fixed after version 4.9rc1=
"
+
+CVE_STATUS[CVE-2016-7117] =3D "fixed-version: Fixed after version 4.6rc1=
"
+
+# Skipping CVE-2016-7118, no affected_versions
+
+CVE_STATUS[CVE-2016-7425] =3D "fixed-version: Fixed after version 4.9rc1=
"
+
+CVE_STATUS[CVE-2016-7910] =3D "fixed-version: Fixed after version 4.8rc1=
"
+
+CVE_STATUS[CVE-2016-7911] =3D "fixed-version: Fixed after version 4.7rc7=
"
+
+CVE_STATUS[CVE-2016-7912] =3D "fixed-version: Fixed after version 4.6rc5=
"
+
+CVE_STATUS[CVE-2016-7913] =3D "fixed-version: Fixed after version 4.6rc1=
"
+
+CVE_STATUS[CVE-2016-7914] =3D "fixed-version: Fixed after version 4.6rc4=
"
+
+CVE_STATUS[CVE-2016-7915] =3D "fixed-version: Fixed after version 4.6rc1=
"
+
+CVE_STATUS[CVE-2016-7916] =3D "fixed-version: Fixed after version 4.6rc7=
"
+
+CVE_STATUS[CVE-2016-7917] =3D "fixed-version: Fixed after version 4.5rc6=
"
+
+CVE_STATUS[CVE-2016-8399] =3D "fixed-version: Fixed after version 4.9"
+
+# Skipping CVE-2016-8401, no affected_versions
+
+# Skipping CVE-2016-8402, no affected_versions
+
+# Skipping CVE-2016-8403, no affected_versions
+
+# Skipping CVE-2016-8404, no affected_versions
+
+CVE_STATUS[CVE-2016-8405] =3D "fixed-version: Fixed after version 4.10rc=
6"
+
+# Skipping CVE-2016-8406, no affected_versions
+
+# Skipping CVE-2016-8407, no affected_versions
+
+CVE_STATUS[CVE-2016-8630] =3D "fixed-version: Fixed after version 4.9rc4=
"
+
+CVE_STATUS[CVE-2016-8632] =3D "fixed-version: Fixed after version 4.9rc8=
"
+
+CVE_STATUS[CVE-2016-8633] =3D "fixed-version: Fixed after version 4.9rc4=
"
+
+CVE_STATUS[CVE-2016-8636] =3D "fixed-version: Fixed after version 4.10rc=
8"
+
+CVE_STATUS[CVE-2016-8645] =3D "fixed-version: Fixed after version 4.9rc6=
"
+
+CVE_STATUS[CVE-2016-8646] =3D "fixed-version: Fixed after version 4.4rc1=
"
+
+CVE_STATUS[CVE-2016-8650] =3D "fixed-version: Fixed after version 4.9rc7=
"
+
+CVE_STATUS[CVE-2016-8655] =3D "fixed-version: Fixed after version 4.9rc8=
"
+
+CVE_STATUS[CVE-2016-8658] =3D "fixed-version: Fixed after version 4.8rc7=
"
+
+# CVE-2016-8660 has no known resolution
+
+CVE_STATUS[CVE-2016-8666] =3D "fixed-version: Fixed after version 4.6rc1=
"
+
+CVE_STATUS[CVE-2016-9083] =3D "fixed-version: Fixed after version 4.9rc4=
"
+
+CVE_STATUS[CVE-2016-9084] =3D "fixed-version: Fixed after version 4.9rc4=
"
+
+CVE_STATUS[CVE-2016-9120] =3D "fixed-version: Fixed after version 4.6rc1=
"
+
+CVE_STATUS[CVE-2016-9178] =3D "fixed-version: Fixed after version 4.8rc7=
"
+
+CVE_STATUS[CVE-2016-9191] =3D "fixed-version: Fixed after version 4.10rc=
4"
+
+CVE_STATUS[CVE-2016-9313] =3D "fixed-version: Fixed after version 4.9rc3=
"
+
+CVE_STATUS[CVE-2016-9555] =3D "fixed-version: Fixed after version 4.9rc4=
"
+
+CVE_STATUS[CVE-2016-9576] =3D "fixed-version: Fixed after version 4.9"
+
+CVE_STATUS[CVE-2016-9588] =3D "fixed-version: Fixed after version 4.10rc=
1"
+
+CVE_STATUS[CVE-2016-9604] =3D "fixed-version: Fixed after version 4.11rc=
8"
+
+# Skipping CVE-2016-9644, no affected_versions
+
+CVE_STATUS[CVE-2016-9685] =3D "fixed-version: Fixed after version 4.6rc1=
"
+
+CVE_STATUS[CVE-2016-9754] =3D "fixed-version: Fixed after version 4.7rc1=
"
+
+CVE_STATUS[CVE-2016-9755] =3D "fixed-version: Fixed after version 4.9rc8=
"
+
+CVE_STATUS[CVE-2016-9756] =3D "fixed-version: Fixed after version 4.9rc7=
"
+
+CVE_STATUS[CVE-2016-9777] =3D "fixed-version: Fixed after version 4.9rc7=
"
+
+CVE_STATUS[CVE-2016-9793] =3D "fixed-version: Fixed after version 4.9rc8=
"
+
+CVE_STATUS[CVE-2016-9794] =3D "fixed-version: Fixed after version 4.7rc1=
"
+
+CVE_STATUS[CVE-2016-9806] =3D "fixed-version: Fixed after version 4.7rc1=
"
+
+CVE_STATUS[CVE-2016-9919] =3D "fixed-version: Fixed after version 4.9rc8=
"
+
+# Skipping CVE-2017-0403, no affected_versions
+
+# Skipping CVE-2017-0404, no affected_versions
+
+# Skipping CVE-2017-0426, no affected_versions
+
+# Skipping CVE-2017-0427, no affected_versions
+
+# CVE-2017-0507 has no known resolution
+
+# CVE-2017-0508 has no known resolution
+
+# Skipping CVE-2017-0510, no affected_versions
+
+# Skipping CVE-2017-0528, no affected_versions
+
+# Skipping CVE-2017-0537, no affected_versions
+
+# CVE-2017-0564 has no known resolution
+
+CVE_STATUS[CVE-2017-0605] =3D "fixed-version: Fixed after version 4.12rc=
1"
+
+CVE_STATUS[CVE-2017-0627] =3D "fixed-version: Fixed after version 4.14rc=
1"
+
+# CVE-2017-0630 has no known resolution
+
+# CVE-2017-0749 has no known resolution
+
+CVE_STATUS[CVE-2017-0750] =3D "fixed-version: Fixed after version 4.5rc1=
"
+
+CVE_STATUS[CVE-2017-0786] =3D "fixed-version: Fixed after version 4.14rc=
4"
+
+CVE_STATUS[CVE-2017-0861] =3D "fixed-version: Fixed after version 4.15rc=
3"
+
+CVE_STATUS[CVE-2017-1000] =3D "fixed-version: Fixed after version 4.13rc=
5"
+
+CVE_STATUS[CVE-2017-1000111] =3D "fixed-version: Fixed after version 4.1=
3rc5"
+
+CVE_STATUS[CVE-2017-1000112] =3D "fixed-version: Fixed after version 4.1=
3rc5"
+
+CVE_STATUS[CVE-2017-1000251] =3D "fixed-version: Fixed after version 4.1=
4rc1"
+
+CVE_STATUS[CVE-2017-1000252] =3D "fixed-version: Fixed after version 4.1=
4rc1"
+
+CVE_STATUS[CVE-2017-1000253] =3D "fixed-version: Fixed after version 4.1=
rc1"
+
+CVE_STATUS[CVE-2017-1000255] =3D "fixed-version: Fixed after version 4.1=
4rc5"
+
+CVE_STATUS[CVE-2017-1000363] =3D "fixed-version: Fixed after version 4.1=
2rc2"
+
+CVE_STATUS[CVE-2017-1000364] =3D "fixed-version: Fixed after version 4.1=
2rc6"
+
+CVE_STATUS[CVE-2017-1000365] =3D "fixed-version: Fixed after version 4.1=
2rc7"
+
+CVE_STATUS[CVE-2017-1000370] =3D "fixed-version: Fixed after version 4.1=
3rc1"
+
+CVE_STATUS[CVE-2017-1000371] =3D "fixed-version: Fixed after version 4.1=
3rc1"
+
+CVE_STATUS[CVE-2017-1000379] =3D "fixed-version: Fixed after version 4.1=
2rc6"
+
+CVE_STATUS[CVE-2017-1000380] =3D "fixed-version: Fixed after version 4.1=
2rc5"
+
+CVE_STATUS[CVE-2017-1000405] =3D "fixed-version: Fixed after version 4.1=
5rc2"
+
+CVE_STATUS[CVE-2017-1000407] =3D "fixed-version: Fixed after version 4.1=
5rc3"
+
+CVE_STATUS[CVE-2017-1000410] =3D "fixed-version: Fixed after version 4.1=
5rc8"
+
+CVE_STATUS[CVE-2017-10661] =3D "fixed-version: Fixed after version 4.11r=
c1"
+
+CVE_STATUS[CVE-2017-10662] =3D "fixed-version: Fixed after version 4.12r=
c1"
+
+CVE_STATUS[CVE-2017-10663] =3D "fixed-version: Fixed after version 4.13r=
c1"
+
+CVE_STATUS[CVE-2017-10810] =3D "fixed-version: Fixed after version 4.12r=
c1"
+
+CVE_STATUS[CVE-2017-10911] =3D "fixed-version: Fixed after version 4.12r=
c7"
+
+CVE_STATUS[CVE-2017-11089] =3D "fixed-version: Fixed after version 4.13r=
c1"
+
+CVE_STATUS[CVE-2017-11176] =3D "fixed-version: Fixed after version 4.13r=
c1"
+
+CVE_STATUS[CVE-2017-11472] =3D "fixed-version: Fixed after version 4.12r=
c1"
+
+CVE_STATUS[CVE-2017-11473] =3D "fixed-version: Fixed after version 4.13r=
c2"
+
+CVE_STATUS[CVE-2017-11600] =3D "fixed-version: Fixed after version 4.13"
+
+CVE_STATUS[CVE-2017-12134] =3D "fixed-version: Fixed after version 4.13r=
c6"
+
+CVE_STATUS[CVE-2017-12146] =3D "fixed-version: Fixed after version 4.13r=
c1"
+
+CVE_STATUS[CVE-2017-12153] =3D "fixed-version: Fixed after version 4.14r=
c2"
+
+CVE_STATUS[CVE-2017-12154] =3D "fixed-version: Fixed after version 4.14r=
c1"
+
+CVE_STATUS[CVE-2017-12168] =3D "fixed-version: Fixed after version 4.9rc=
6"
+
+CVE_STATUS[CVE-2017-12188] =3D "fixed-version: Fixed after version 4.14r=
c5"
+
+CVE_STATUS[CVE-2017-12190] =3D "fixed-version: Fixed after version 4.14r=
c5"
+
+CVE_STATUS[CVE-2017-12192] =3D "fixed-version: Fixed after version 4.14r=
c3"
+
+CVE_STATUS[CVE-2017-12193] =3D "fixed-version: Fixed after version 4.14r=
c7"
+
+CVE_STATUS[CVE-2017-12762] =3D "fixed-version: Fixed after version 4.13r=
c4"
+
+CVE_STATUS[CVE-2017-13080] =3D "fixed-version: Fixed after version 4.14r=
c6"
+
+CVE_STATUS[CVE-2017-13166] =3D "fixed-version: Fixed after version 4.16r=
c1"
+
+CVE_STATUS[CVE-2017-13167] =3D "fixed-version: Fixed after version 4.5rc=
4"
+
+CVE_STATUS[CVE-2017-13168] =3D "fixed-version: Fixed after version 4.18r=
c4"
+
+CVE_STATUS[CVE-2017-13215] =3D "fixed-version: Fixed after version 4.5rc=
1"
+
+CVE_STATUS[CVE-2017-13216] =3D "fixed-version: Fixed after version 4.15r=
c8"
+
+CVE_STATUS[CVE-2017-13220] =3D "fixed-version: Fixed after version 3.19r=
c3"
+
+# CVE-2017-13221 has no known resolution
+
+# CVE-2017-13222 has no known resolution
+
+CVE_STATUS[CVE-2017-13305] =3D "fixed-version: Fixed after version 4.12r=
c5"
+
+CVE_STATUS[CVE-2017-13686] =3D "fixed-version: Fixed after version 4.13r=
c7"
+
+# CVE-2017-13693 has no known resolution
+
+# CVE-2017-13694 has no known resolution
+
+CVE_STATUS[CVE-2017-13695] =3D "fixed-version: Fixed after version 4.17r=
c1"
+
+CVE_STATUS[CVE-2017-13715] =3D "fixed-version: Fixed after version 4.3rc=
1"
+
+CVE_STATUS[CVE-2017-14051] =3D "fixed-version: Fixed after version 4.14r=
c1"
+
+CVE_STATUS[CVE-2017-14106] =3D "fixed-version: Fixed after version 4.12r=
c3"
+
+CVE_STATUS[CVE-2017-14140] =3D "fixed-version: Fixed after version 4.13r=
c6"
+
+CVE_STATUS[CVE-2017-14156] =3D "fixed-version: Fixed after version 4.14r=
c1"
+
+CVE_STATUS[CVE-2017-14340] =3D "fixed-version: Fixed after version 4.14r=
c1"
+
+CVE_STATUS[CVE-2017-14489] =3D "fixed-version: Fixed after version 4.14r=
c3"
+
+CVE_STATUS[CVE-2017-14497] =3D "fixed-version: Fixed after version 4.13"
+
+CVE_STATUS[CVE-2017-14954] =3D "fixed-version: Fixed after version 4.14r=
c3"
+
+CVE_STATUS[CVE-2017-14991] =3D "fixed-version: Fixed after version 4.14r=
c2"
+
+CVE_STATUS[CVE-2017-15102] =3D "fixed-version: Fixed after version 4.9rc=
1"
+
+CVE_STATUS[CVE-2017-15115] =3D "fixed-version: Fixed after version 4.14r=
c6"
+
+CVE_STATUS[CVE-2017-15116] =3D "fixed-version: Fixed after version 4.2rc=
1"
+
+CVE_STATUS[CVE-2017-15121] =3D "fixed-version: Fixed after version 3.11r=
c1"
+
+CVE_STATUS[CVE-2017-15126] =3D "fixed-version: Fixed after version 4.14r=
c4"
+
+CVE_STATUS[CVE-2017-15127] =3D "fixed-version: Fixed after version 4.13r=
c5"
+
+CVE_STATUS[CVE-2017-15128] =3D "fixed-version: Fixed after version 4.14r=
c8"
+
+CVE_STATUS[CVE-2017-15129] =3D "fixed-version: Fixed after version 4.15r=
c5"
+
+CVE_STATUS[CVE-2017-15265] =3D "fixed-version: Fixed after version 4.14r=
c5"
+
+CVE_STATUS[CVE-2017-15274] =3D "fixed-version: Fixed after version 4.12r=
c5"
+
+CVE_STATUS[CVE-2017-15299] =3D "fixed-version: Fixed after version 4.14r=
c6"
+
+CVE_STATUS[CVE-2017-15306] =3D "fixed-version: Fixed after version 4.14r=
c7"
+
+CVE_STATUS[CVE-2017-15537] =3D "fixed-version: Fixed after version 4.14r=
c3"
+
+CVE_STATUS[CVE-2017-15649] =3D "fixed-version: Fixed after version 4.14r=
c4"
+
+CVE_STATUS[CVE-2017-15868] =3D "fixed-version: Fixed after version 3.19r=
c3"
+
+CVE_STATUS[CVE-2017-15951] =3D "fixed-version: Fixed after version 4.14r=
c6"
+
+CVE_STATUS[CVE-2017-16525] =3D "fixed-version: Fixed after version 4.14r=
c5"
+
+CVE_STATUS[CVE-2017-16526] =3D "fixed-version: Fixed after version 4.14r=
c4"
+
+CVE_STATUS[CVE-2017-16527] =3D "fixed-version: Fixed after version 4.14r=
c5"
+
+CVE_STATUS[CVE-2017-16528] =3D "fixed-version: Fixed after version 4.14r=
c1"
+
+CVE_STATUS[CVE-2017-16529] =3D "fixed-version: Fixed after version 4.14r=
c4"
+
+CVE_STATUS[CVE-2017-16530] =3D "fixed-version: Fixed after version 4.14r=
c4"
+
+CVE_STATUS[CVE-2017-16531] =3D "fixed-version: Fixed after version 4.14r=
c4"
+
+CVE_STATUS[CVE-2017-16532] =3D "fixed-version: Fixed after version 4.14r=
c5"
+
+CVE_STATUS[CVE-2017-16533] =3D "fixed-version: Fixed after version 4.14r=
c5"
+
+CVE_STATUS[CVE-2017-16534] =3D "fixed-version: Fixed after version 4.14r=
c4"
+
+CVE_STATUS[CVE-2017-16535] =3D "fixed-version: Fixed after version 4.14r=
c6"
+
+CVE_STATUS[CVE-2017-16536] =3D "fixed-version: Fixed after version 4.15r=
c1"
+
+CVE_STATUS[CVE-2017-16537] =3D "fixed-version: Fixed after version 4.15r=
c1"
+
+CVE_STATUS[CVE-2017-16538] =3D "fixed-version: Fixed after version 4.16r=
c1"
+
+CVE_STATUS[CVE-2017-16643] =3D "fixed-version: Fixed after version 4.14r=
c7"
+
+CVE_STATUS[CVE-2017-16644] =3D "fixed-version: Fixed after version 4.16r=
c1"
+
+CVE_STATUS[CVE-2017-16645] =3D "fixed-version: Fixed after version 4.14r=
c6"
+
+CVE_STATUS[CVE-2017-16646] =3D "fixed-version: Fixed after version 4.15r=
c1"
+
+CVE_STATUS[CVE-2017-16647] =3D "fixed-version: Fixed after version 4.14"
+
+CVE_STATUS[CVE-2017-16648] =3D "fixed-version: Fixed after version 4.15r=
c1"
+
+CVE_STATUS[CVE-2017-16649] =3D "fixed-version: Fixed after version 4.14"
+
+CVE_STATUS[CVE-2017-16650] =3D "fixed-version: Fixed after version 4.14"
+
+CVE_STATUS[CVE-2017-16911] =3D "fixed-version: Fixed after version 4.15r=
c4"
+
+CVE_STATUS[CVE-2017-16912] =3D "fixed-version: Fixed after version 4.15r=
c4"
+
+CVE_STATUS[CVE-2017-16913] =3D "fixed-version: Fixed after version 4.15r=
c4"
+
+CVE_STATUS[CVE-2017-16914] =3D "fixed-version: Fixed after version 4.15r=
c4"
+
+CVE_STATUS[CVE-2017-16939] =3D "fixed-version: Fixed after version 4.14r=
c7"
+
+CVE_STATUS[CVE-2017-16994] =3D "fixed-version: Fixed after version 4.15r=
c1"
+
+CVE_STATUS[CVE-2017-16995] =3D "fixed-version: Fixed after version 4.15r=
c5"
+
+CVE_STATUS[CVE-2017-16996] =3D "fixed-version: Fixed after version 4.15r=
c5"
+
+CVE_STATUS[CVE-2017-17052] =3D "fixed-version: Fixed after version 4.13r=
c7"
+
+CVE_STATUS[CVE-2017-17053] =3D "fixed-version: Fixed after version 4.13r=
c7"
+
+CVE_STATUS[CVE-2017-17448] =3D "fixed-version: Fixed after version 4.15r=
c4"
+
+CVE_STATUS[CVE-2017-17449] =3D "fixed-version: Fixed after version 4.15r=
c4"
+
+CVE_STATUS[CVE-2017-17450] =3D "fixed-version: Fixed after version 4.15r=
c4"
+
+CVE_STATUS[CVE-2017-17558] =3D "fixed-version: Fixed after version 4.15r=
c4"
+
+CVE_STATUS[CVE-2017-17712] =3D "fixed-version: Fixed after version 4.15r=
c4"
+
+CVE_STATUS[CVE-2017-17741] =3D "fixed-version: Fixed after version 4.15r=
c5"
+
+CVE_STATUS[CVE-2017-17805] =3D "fixed-version: Fixed after version 4.15r=
c4"
+
+CVE_STATUS[CVE-2017-17806] =3D "fixed-version: Fixed after version 4.15r=
c4"
+
+CVE_STATUS[CVE-2017-17807] =3D "fixed-version: Fixed after version 4.15r=
c3"
+
+CVE_STATUS[CVE-2017-17852] =3D "fixed-version: Fixed after version 4.15r=
c5"
+
+CVE_STATUS[CVE-2017-17853] =3D "fixed-version: Fixed after version 4.15r=
c5"
+
+CVE_STATUS[CVE-2017-17854] =3D "fixed-version: Fixed after version 4.15r=
c5"
+
+CVE_STATUS[CVE-2017-17855] =3D "fixed-version: Fixed after version 4.15r=
c5"
+
+CVE_STATUS[CVE-2017-17856] =3D "fixed-version: Fixed after version 4.15r=
c5"
+
+CVE_STATUS[CVE-2017-17857] =3D "fixed-version: Fixed after version 4.15r=
c5"
+
+CVE_STATUS[CVE-2017-17862] =3D "fixed-version: Fixed after version 4.15r=
c1"
+
+CVE_STATUS[CVE-2017-17863] =3D "fixed-version: Fixed after version 4.15r=
c5"
+
+CVE_STATUS[CVE-2017-17864] =3D "fixed-version: Fixed after version 4.15r=
c5"
+
+CVE_STATUS[CVE-2017-17975] =3D "fixed-version: Fixed after version 4.17r=
c1"
+
+CVE_STATUS[CVE-2017-18017] =3D "fixed-version: Fixed after version 4.11r=
c7"
+
+CVE_STATUS[CVE-2017-18075] =3D "fixed-version: Fixed after version 4.15r=
c7"
+
+CVE_STATUS[CVE-2017-18079] =3D "fixed-version: Fixed after version 4.13r=
c1"
+
+# CVE-2017-18169 has no known resolution
+
+CVE_STATUS[CVE-2017-18174] =3D "fixed-version: Fixed after version 4.7rc=
1"
+
+CVE_STATUS[CVE-2017-18193] =3D "fixed-version: Fixed after version 4.13r=
c1"
+
+CVE_STATUS[CVE-2017-18200] =3D "fixed-version: Fixed after version 4.14r=
c5"
+
+CVE_STATUS[CVE-2017-18202] =3D "fixed-version: Fixed after version 4.15r=
c2"
+
+CVE_STATUS[CVE-2017-18203] =3D "fixed-version: Fixed after version 4.15r=
c1"
+
+CVE_STATUS[CVE-2017-18204] =3D "fixed-version: Fixed after version 4.15r=
c1"
+
+CVE_STATUS[CVE-2017-18208] =3D "fixed-version: Fixed after version 4.15r=
c2"
+
+CVE_STATUS[CVE-2017-18216] =3D "fixed-version: Fixed after version 4.15r=
c1"
+
+CVE_STATUS[CVE-2017-18218] =3D "fixed-version: Fixed after version 4.13r=
c1"
+
+CVE_STATUS[CVE-2017-18221] =3D "fixed-version: Fixed after version 4.12r=
c4"
+
+CVE_STATUS[CVE-2017-18222] =3D "fixed-version: Fixed after version 4.12r=
c1"
+
+CVE_STATUS[CVE-2017-18224] =3D "fixed-version: Fixed after version 4.15r=
c1"
+
+CVE_STATUS[CVE-2017-18232] =3D "fixed-version: Fixed after version 4.16r=
c1"
+
+CVE_STATUS[CVE-2017-18241] =3D "fixed-version: Fixed after version 4.13r=
c1"
+
+CVE_STATUS[CVE-2017-18249] =3D "fixed-version: Fixed after version 4.12r=
c1"
+
+CVE_STATUS[CVE-2017-18255] =3D "fixed-version: Fixed after version 4.11r=
c1"
+
+CVE_STATUS[CVE-2017-18257] =3D "fixed-version: Fixed after version 4.11r=
c1"
+
+CVE_STATUS[CVE-2017-18261] =3D "fixed-version: Fixed after version 4.13r=
c6"
+
+CVE_STATUS[CVE-2017-18270] =3D "fixed-version: Fixed after version 4.14r=
c3"
+
+CVE_STATUS[CVE-2017-18344] =3D "fixed-version: Fixed after version 4.15r=
c4"
+
+CVE_STATUS[CVE-2017-18360] =3D "fixed-version: Fixed after version 4.12r=
c2"
+
+CVE_STATUS[CVE-2017-18379] =3D "fixed-version: Fixed after version 4.14r=
c3"
+
+CVE_STATUS[CVE-2017-18509] =3D "fixed-version: Fixed after version 4.11r=
c1"
+
+CVE_STATUS[CVE-2017-18549] =3D "fixed-version: Fixed after version 4.13r=
c1"
+
+CVE_STATUS[CVE-2017-18550] =3D "fixed-version: Fixed after version 4.13r=
c1"
+
+CVE_STATUS[CVE-2017-18551] =3D "fixed-version: Fixed after version 4.15r=
c9"
+
+CVE_STATUS[CVE-2017-18552] =3D "fixed-version: Fixed after version 4.11r=
c1"
+
+CVE_STATUS[CVE-2017-18595] =3D "fixed-version: Fixed after version 4.15r=
c6"
+
+CVE_STATUS[CVE-2017-2583] =3D "fixed-version: Fixed after version 4.10rc=
4"
+
+CVE_STATUS[CVE-2017-2584] =3D "fixed-version: Fixed after version 4.10rc=
4"
+
+CVE_STATUS[CVE-2017-2596] =3D "fixed-version: Fixed after version 4.11rc=
1"
+
+CVE_STATUS[CVE-2017-2618] =3D "fixed-version: Fixed after version 4.10rc=
8"
+
+CVE_STATUS[CVE-2017-2634] =3D "fixed-version: Fixed after version 2.6.25=
rc1"
+
+CVE_STATUS[CVE-2017-2636] =3D "fixed-version: Fixed after version 4.11rc=
2"
+
+CVE_STATUS[CVE-2017-2647] =3D "fixed-version: Fixed after version 3.18rc=
1"
+
+CVE_STATUS[CVE-2017-2671] =3D "fixed-version: Fixed after version 4.11rc=
6"
+
+CVE_STATUS[CVE-2017-5123] =3D "fixed-version: Fixed after version 4.14rc=
5"
+
+CVE_STATUS[CVE-2017-5546] =3D "fixed-version: Fixed after version 4.10rc=
4"
+
+CVE_STATUS[CVE-2017-5547] =3D "fixed-version: Fixed after version 4.10rc=
5"
+
+CVE_STATUS[CVE-2017-5548] =3D "fixed-version: Fixed after version 4.10rc=
5"
+
+CVE_STATUS[CVE-2017-5549] =3D "fixed-version: Fixed after version 4.10rc=
4"
+
+CVE_STATUS[CVE-2017-5550] =3D "fixed-version: Fixed after version 4.10rc=
4"
+
+CVE_STATUS[CVE-2017-5551] =3D "fixed-version: Fixed after version 4.10rc=
4"
+
+CVE_STATUS[CVE-2017-5576] =3D "fixed-version: Fixed after version 4.10rc=
6"
+
+CVE_STATUS[CVE-2017-5577] =3D "fixed-version: Fixed after version 4.10rc=
6"
+
+CVE_STATUS[CVE-2017-5669] =3D "fixed-version: Fixed after version 4.11rc=
1"
+
+CVE_STATUS[CVE-2017-5715] =3D "fixed-version: Fixed after version 4.15rc=
8"
+
+CVE_STATUS[CVE-2017-5753] =3D "fixed-version: Fixed after version 4.15rc=
8"
+
+CVE_STATUS[CVE-2017-5754] =3D "fixed-version: Fixed after version 4.16rc=
1"
+
+CVE_STATUS[CVE-2017-5897] =3D "fixed-version: Fixed after version 4.10rc=
8"
+
+CVE_STATUS[CVE-2017-5967] =3D "fixed-version: Fixed after version 4.11rc=
1"
+
+CVE_STATUS[CVE-2017-5970] =3D "fixed-version: Fixed after version 4.10rc=
8"
+
+CVE_STATUS[CVE-2017-5972] =3D "fixed-version: Fixed after version 4.4rc1=
"
+
+CVE_STATUS[CVE-2017-5986] =3D "fixed-version: Fixed after version 4.10rc=
8"
+
+CVE_STATUS[CVE-2017-6001] =3D "fixed-version: Fixed after version 4.10rc=
4"
+
+CVE_STATUS[CVE-2017-6074] =3D "fixed-version: Fixed after version 4.10"
+
+CVE_STATUS[CVE-2017-6214] =3D "fixed-version: Fixed after version 4.10rc=
8"
+
+CVE_STATUS[CVE-2017-6345] =3D "fixed-version: Fixed after version 4.10"
+
+CVE_STATUS[CVE-2017-6346] =3D "fixed-version: Fixed after version 4.10"
+
+CVE_STATUS[CVE-2017-6347] =3D "fixed-version: Fixed after version 4.11rc=
1"
+
+CVE_STATUS[CVE-2017-6348] =3D "fixed-version: Fixed after version 4.10"
+
+CVE_STATUS[CVE-2017-6353] =3D "fixed-version: Fixed after version 4.11rc=
1"
+
+CVE_STATUS[CVE-2017-6874] =3D "fixed-version: Fixed after version 4.11rc=
2"
+
+CVE_STATUS[CVE-2017-6951] =3D "fixed-version: Fixed after version 3.18rc=
1"
+
+CVE_STATUS[CVE-2017-7184] =3D "fixed-version: Fixed after version 4.11rc=
5"
+
+CVE_STATUS[CVE-2017-7187] =3D "fixed-version: Fixed after version 4.11rc=
5"
+
+CVE_STATUS[CVE-2017-7261] =3D "fixed-version: Fixed after version 4.11rc=
6"
+
+CVE_STATUS[CVE-2017-7273] =3D "fixed-version: Fixed after version 4.10rc=
4"
+
+CVE_STATUS[CVE-2017-7277] =3D "fixed-version: Fixed after version 4.11rc=
4"
+
+CVE_STATUS[CVE-2017-7294] =3D "fixed-version: Fixed after version 4.11rc=
6"
+
+CVE_STATUS[CVE-2017-7308] =3D "fixed-version: Fixed after version 4.11rc=
6"
+
+CVE_STATUS[CVE-2017-7346] =3D "fixed-version: Fixed after version 4.12rc=
5"
+
+# CVE-2017-7369 has no known resolution
+
+CVE_STATUS[CVE-2017-7374] =3D "fixed-version: Fixed after version 4.11rc=
4"
+
+CVE_STATUS[CVE-2017-7472] =3D "fixed-version: Fixed after version 4.11rc=
8"
+
+CVE_STATUS[CVE-2017-7477] =3D "fixed-version: Fixed after version 4.11"
+
+CVE_STATUS[CVE-2017-7482] =3D "fixed-version: Fixed after version 4.12rc=
7"
+
+CVE_STATUS[CVE-2017-7487] =3D "fixed-version: Fixed after version 4.12rc=
1"
+
+CVE_STATUS[CVE-2017-7495] =3D "fixed-version: Fixed after version 4.7rc1=
"
+
+CVE_STATUS[CVE-2017-7518] =3D "fixed-version: Fixed after version 4.12rc=
7"
+
+CVE_STATUS[CVE-2017-7533] =3D "fixed-version: Fixed after version 4.13rc=
1"
+
+CVE_STATUS[CVE-2017-7541] =3D "fixed-version: Fixed after version 4.13rc=
1"
+
+CVE_STATUS[CVE-2017-7542] =3D "fixed-version: Fixed after version 4.13rc=
2"
+
+CVE_STATUS[CVE-2017-7558] =3D "fixed-version: Fixed after version 4.13"
+
+CVE_STATUS[CVE-2017-7616] =3D "fixed-version: Fixed after version 4.11rc=
6"
+
+CVE_STATUS[CVE-2017-7618] =3D "fixed-version: Fixed after version 4.11rc=
8"
+
+CVE_STATUS[CVE-2017-7645] =3D "fixed-version: Fixed after version 4.11"
+
+CVE_STATUS[CVE-2017-7889] =3D "fixed-version: Fixed after version 4.11rc=
7"
+
+CVE_STATUS[CVE-2017-7895] =3D "fixed-version: Fixed after version 4.11"
+
+CVE_STATUS[CVE-2017-7979] =3D "fixed-version: Fixed after version 4.11rc=
8"
+
+CVE_STATUS[CVE-2017-8061] =3D "fixed-version: Fixed after version 4.11rc=
4"
+
+CVE_STATUS[CVE-2017-8062] =3D "fixed-version: Fixed after version 4.11rc=
2"
+
+CVE_STATUS[CVE-2017-8063] =3D "fixed-version: Fixed after version 4.11rc=
1"
+
+CVE_STATUS[CVE-2017-8064] =3D "fixed-version: Fixed after version 4.11rc=
1"
+
+CVE_STATUS[CVE-2017-8065] =3D "fixed-version: Fixed after version 4.11rc=
1"
+
+CVE_STATUS[CVE-2017-8066] =3D "fixed-version: Fixed after version 4.11rc=
1"
+
+CVE_STATUS[CVE-2017-8067] =3D "fixed-version: Fixed after version 4.11rc=
1"
+
+CVE_STATUS[CVE-2017-8068] =3D "fixed-version: Fixed after version 4.10rc=
8"
+
+CVE_STATUS[CVE-2017-8069] =3D "fixed-version: Fixed after version 4.10rc=
8"
+
+CVE_STATUS[CVE-2017-8070] =3D "fixed-version: Fixed after version 4.10rc=
8"
+
+CVE_STATUS[CVE-2017-8071] =3D "fixed-version: Fixed after version 4.10rc=
7"
+
+CVE_STATUS[CVE-2017-8072] =3D "fixed-version: Fixed after version 4.10rc=
7"
+
+CVE_STATUS[CVE-2017-8106] =3D "fixed-version: Fixed after version 3.16rc=
1"
+
+CVE_STATUS[CVE-2017-8240] =3D "fixed-version: Fixed after version 3.19rc=
6"
+
+# CVE-2017-8242 has no known resolution
+
+# CVE-2017-8244 has no known resolution
+
+# CVE-2017-8245 has no known resolution
+
+# CVE-2017-8246 has no known resolution
+
+CVE_STATUS[CVE-2017-8797] =3D "fixed-version: Fixed after version 4.12rc=
1"
+
+CVE_STATUS[CVE-2017-8824] =3D "fixed-version: Fixed after version 4.15rc=
3"
+
+CVE_STATUS[CVE-2017-8831] =3D "fixed-version: Fixed after version 4.13rc=
1"
+
+CVE_STATUS[CVE-2017-8890] =3D "fixed-version: Fixed after version 4.12rc=
1"
+
+CVE_STATUS[CVE-2017-8924] =3D "fixed-version: Fixed after version 4.11rc=
2"
+
+CVE_STATUS[CVE-2017-8925] =3D "fixed-version: Fixed after version 4.11rc=
2"
+
+CVE_STATUS[CVE-2017-9059] =3D "fixed-version: Fixed after version 4.12rc=
1"
+
+CVE_STATUS[CVE-2017-9074] =3D "fixed-version: Fixed after version 4.12rc=
2"
+
+CVE_STATUS[CVE-2017-9075] =3D "fixed-version: Fixed after version 4.12rc=
2"
+
+CVE_STATUS[CVE-2017-9076] =3D "fixed-version: Fixed after version 4.12rc=
2"
+
+CVE_STATUS[CVE-2017-9077] =3D "fixed-version: Fixed after version 4.12rc=
2"
+
+CVE_STATUS[CVE-2017-9150] =3D "fixed-version: Fixed after version 4.12rc=
1"
+
+CVE_STATUS[CVE-2017-9211] =3D "fixed-version: Fixed after version 4.12rc=
3"
+
+CVE_STATUS[CVE-2017-9242] =3D "fixed-version: Fixed after version 4.12rc=
3"
+
+CVE_STATUS[CVE-2017-9605] =3D "fixed-version: Fixed after version 4.12rc=
5"
+
+CVE_STATUS[CVE-2017-9725] =3D "fixed-version: Fixed after version 4.3rc7=
"
+
+CVE_STATUS[CVE-2017-9984] =3D "fixed-version: Fixed after version 4.13rc=
1"
+
+CVE_STATUS[CVE-2017-9985] =3D "fixed-version: Fixed after version 4.13rc=
1"
+
+CVE_STATUS[CVE-2017-9986] =3D "fixed-version: Fixed after version 4.15rc=
1"
+
+CVE_STATUS[CVE-2018-1000004] =3D "fixed-version: Fixed after version 4.1=
5rc9"
+
+CVE_STATUS[CVE-2018-1000026] =3D "fixed-version: Fixed after version 4.1=
6rc1"
+
+CVE_STATUS[CVE-2018-1000028] =3D "fixed-version: Fixed after version 4.1=
5"
+
+CVE_STATUS[CVE-2018-1000199] =3D "fixed-version: Fixed after version 4.1=
6"
+
+CVE_STATUS[CVE-2018-1000200] =3D "fixed-version: Fixed after version 4.1=
7rc5"
+
+CVE_STATUS[CVE-2018-1000204] =3D "fixed-version: Fixed after version 4.1=
7rc7"
+
+CVE_STATUS[CVE-2018-10021] =3D "fixed-version: Fixed after version 4.16r=
c7"
+
+CVE_STATUS[CVE-2018-10074] =3D "fixed-version: Fixed after version 4.16r=
c7"
+
+CVE_STATUS[CVE-2018-10087] =3D "fixed-version: Fixed after version 4.13r=
c1"
+
+CVE_STATUS[CVE-2018-10124] =3D "fixed-version: Fixed after version 4.13r=
c1"
+
+CVE_STATUS[CVE-2018-10322] =3D "fixed-version: Fixed after version 4.17r=
c4"
+
+CVE_STATUS[CVE-2018-10323] =3D "fixed-version: Fixed after version 4.17r=
c4"
+
+CVE_STATUS[CVE-2018-1065] =3D "fixed-version: Fixed after version 4.16rc=
3"
+
+CVE_STATUS[CVE-2018-1066] =3D "fixed-version: Fixed after version 4.11rc=
1"
+
+CVE_STATUS[CVE-2018-10675] =3D "fixed-version: Fixed after version 4.13r=
c6"
+
+CVE_STATUS[CVE-2018-1068] =3D "fixed-version: Fixed after version 4.16rc=
5"
+
+CVE_STATUS[CVE-2018-10840] =3D "fixed-version: Fixed after version 4.18r=
c1"
+
+CVE_STATUS[CVE-2018-10853] =3D "fixed-version: Fixed after version 4.18r=
c1"
+
+CVE_STATUS[CVE-2018-1087] =3D "fixed-version: Fixed after version 4.16rc=
7"
+
+# CVE-2018-10872 has no known resolution
+
+CVE_STATUS[CVE-2018-10876] =3D "fixed-version: Fixed after version 4.18r=
c4"
+
+CVE_STATUS[CVE-2018-10877] =3D "fixed-version: Fixed after version 4.18r=
c4"
+
+CVE_STATUS[CVE-2018-10878] =3D "fixed-version: Fixed after version 4.18r=
c4"
+
+CVE_STATUS[CVE-2018-10879] =3D "fixed-version: Fixed after version 4.18r=
c4"
+
+CVE_STATUS[CVE-2018-10880] =3D "fixed-version: Fixed after version 4.18r=
c4"
+
+CVE_STATUS[CVE-2018-10881] =3D "fixed-version: Fixed after version 4.18r=
c4"
+
+CVE_STATUS[CVE-2018-10882] =3D "fixed-version: Fixed after version 4.18r=
c4"
+
+CVE_STATUS[CVE-2018-10883] =3D "fixed-version: Fixed after version 4.18r=
c4"
+
+CVE_STATUS[CVE-2018-10901] =3D "fixed-version: Fixed after version 2.6.3=
6rc1"
+
+CVE_STATUS[CVE-2018-10902] =3D "fixed-version: Fixed after version 4.18r=
c6"
+
+CVE_STATUS[CVE-2018-1091] =3D "fixed-version: Fixed after version 4.14rc=
2"
+
+CVE_STATUS[CVE-2018-1092] =3D "fixed-version: Fixed after version 4.17rc=
1"
+
+CVE_STATUS[CVE-2018-1093] =3D "fixed-version: Fixed after version 4.17rc=
1"
+
+CVE_STATUS[CVE-2018-10938] =3D "fixed-version: Fixed after version 4.13r=
c5"
+
+CVE_STATUS[CVE-2018-1094] =3D "fixed-version: Fixed after version 4.17rc=
1"
+
+CVE_STATUS[CVE-2018-10940] =3D "fixed-version: Fixed after version 4.17r=
c3"
+
+CVE_STATUS[CVE-2018-1095] =3D "fixed-version: Fixed after version 4.17rc=
1"
+
+CVE_STATUS[CVE-2018-1108] =3D "fixed-version: Fixed after version 4.17rc=
2"
+
+CVE_STATUS[CVE-2018-1118] =3D "fixed-version: Fixed after version 4.18rc=
1"
+
+CVE_STATUS[CVE-2018-1120] =3D "fixed-version: Fixed after version 4.17rc=
6"
+
+# CVE-2018-1121 has no known resolution
+
+CVE_STATUS[CVE-2018-11232] =3D "fixed-version: Fixed after version 4.11r=
c1"
+
+CVE_STATUS[CVE-2018-1128] =3D "fixed-version: Fixed after version 4.19rc=
1"
+
+CVE_STATUS[CVE-2018-1129] =3D "fixed-version: Fixed after version 4.19rc=
1"
+
+CVE_STATUS[CVE-2018-1130] =3D "fixed-version: Fixed after version 4.16rc=
7"
+
+CVE_STATUS[CVE-2018-11412] =3D "fixed-version: Fixed after version 4.18r=
c1"
+
+CVE_STATUS[CVE-2018-11506] =3D "fixed-version: Fixed after version 4.17r=
c7"
+
+CVE_STATUS[CVE-2018-11508] =3D "fixed-version: Fixed after version 4.17r=
c5"
+
+# CVE-2018-11987 has no known resolution
+
+CVE_STATUS[CVE-2018-12126] =3D "fixed-version: Fixed after version 5.2rc=
1"
+
+CVE_STATUS[CVE-2018-12127] =3D "fixed-version: Fixed after version 5.2rc=
1"
+
+CVE_STATUS[CVE-2018-12130] =3D "fixed-version: Fixed after version 5.2rc=
1"
+
+CVE_STATUS[CVE-2018-12207] =3D "fixed-version: Fixed after version 5.4rc=
2"
+
+CVE_STATUS[CVE-2018-12232] =3D "fixed-version: Fixed after version 4.18r=
c1"
+
+CVE_STATUS[CVE-2018-12233] =3D "fixed-version: Fixed after version 4.18r=
c2"
+
+CVE_STATUS[CVE-2018-12633] =3D "fixed-version: Fixed after version 4.18r=
c1"
+
+CVE_STATUS[CVE-2018-12714] =3D "fixed-version: Fixed after version 4.18r=
c2"
+
+CVE_STATUS[CVE-2018-12896] =3D "fixed-version: Fixed after version 4.19r=
c1"
+
+CVE_STATUS[CVE-2018-12904] =3D "fixed-version: Fixed after version 4.18r=
c1"
+
+# CVE-2018-12928 has no known resolution
+
+# CVE-2018-12929 has no known resolution
+
+# CVE-2018-12930 has no known resolution
+
+# CVE-2018-12931 has no known resolution
+
+CVE_STATUS[CVE-2018-13053] =3D "fixed-version: Fixed after version 4.19r=
c1"
+
+CVE_STATUS[CVE-2018-13093] =3D "fixed-version: Fixed after version 4.18r=
c1"
+
+CVE_STATUS[CVE-2018-13094] =3D "fixed-version: Fixed after version 4.18r=
c1"
+
+CVE_STATUS[CVE-2018-13095] =3D "fixed-version: Fixed after version 4.18r=
c3"
+
+CVE_STATUS[CVE-2018-13096] =3D "fixed-version: Fixed after version 4.19r=
c1"
+
+CVE_STATUS[CVE-2018-13097] =3D "fixed-version: Fixed after version 4.19r=
c1"
+
+CVE_STATUS[CVE-2018-13098] =3D "fixed-version: Fixed after version 4.19r=
c1"
+
+CVE_STATUS[CVE-2018-13099] =3D "fixed-version: Fixed after version 4.19r=
c1"
+
+CVE_STATUS[CVE-2018-13100] =3D "fixed-version: Fixed after version 4.19r=
c1"
+
+CVE_STATUS[CVE-2018-13405] =3D "fixed-version: Fixed after version 4.18r=
c4"
+
+CVE_STATUS[CVE-2018-13406] =3D "fixed-version: Fixed after version 4.18r=
c1"
+
+CVE_STATUS[CVE-2018-14609] =3D "fixed-version: Fixed after version 4.19r=
c1"
+
+CVE_STATUS[CVE-2018-14610] =3D "fixed-version: Fixed after version 4.19r=
c1"
+
+CVE_STATUS[CVE-2018-14611] =3D "fixed-version: Fixed after version 4.19r=
c1"
+
+CVE_STATUS[CVE-2018-14612] =3D "fixed-version: Fixed after version 4.19r=
c1"
+
+CVE_STATUS[CVE-2018-14613] =3D "fixed-version: Fixed after version 4.19r=
c1"
+
+CVE_STATUS[CVE-2018-14614] =3D "fixed-version: Fixed after version 4.19r=
c1"
+
+CVE_STATUS[CVE-2018-14615] =3D "fixed-version: Fixed after version 4.19r=
c1"
+
+CVE_STATUS[CVE-2018-14616] =3D "fixed-version: Fixed after version 4.19r=
c1"
+
+CVE_STATUS[CVE-2018-14617] =3D "fixed-version: Fixed after version 4.19r=
c1"
+
+CVE_STATUS[CVE-2018-14619] =3D "fixed-version: Fixed after version 4.15r=
c4"
+
+CVE_STATUS[CVE-2018-14625] =3D "fixed-version: Fixed after version 4.20r=
c6"
+
+CVE_STATUS[CVE-2018-14633] =3D "fixed-version: Fixed after version 4.19r=
c6"
+
+CVE_STATUS[CVE-2018-14634] =3D "fixed-version: Fixed after version 4.13r=
c1"
+
+CVE_STATUS[CVE-2018-14641] =3D "fixed-version: Fixed after version 4.19r=
c4"
+
+CVE_STATUS[CVE-2018-14646] =3D "fixed-version: Fixed after version 4.15r=
c8"
+
+CVE_STATUS[CVE-2018-14656] =3D "fixed-version: Fixed after version 4.19r=
c2"
+
+CVE_STATUS[CVE-2018-14678] =3D "fixed-version: Fixed after version 4.18r=
c8"
+
+CVE_STATUS[CVE-2018-14734] =3D "fixed-version: Fixed after version 4.18r=
c1"
+
+CVE_STATUS[CVE-2018-15471] =3D "fixed-version: Fixed after version 4.19r=
c7"
+
+CVE_STATUS[CVE-2018-15572] =3D "fixed-version: Fixed after version 4.19r=
c1"
+
+CVE_STATUS[CVE-2018-15594] =3D "fixed-version: Fixed after version 4.19r=
c1"
+
+CVE_STATUS[CVE-2018-16276] =3D "fixed-version: Fixed after version 4.18r=
c5"
+
+CVE_STATUS[CVE-2018-16597] =3D "fixed-version: Fixed after version 4.8rc=
1"
+
+CVE_STATUS[CVE-2018-16658] =3D "fixed-version: Fixed after version 4.19r=
c2"
+
+CVE_STATUS[CVE-2018-16862] =3D "fixed-version: Fixed after version 4.20r=
c5"
+
+CVE_STATUS[CVE-2018-16871] =3D "fixed-version: Fixed after version 4.20r=
c3"
+
+CVE_STATUS[CVE-2018-16880] =3D "fixed-version: Fixed after version 5.0rc=
5"
+
+CVE_STATUS[CVE-2018-16882] =3D "fixed-version: Fixed after version 4.20"
+
+CVE_STATUS[CVE-2018-16884] =3D "fixed-version: Fixed after version 5.0rc=
1"
+
+# CVE-2018-16885 has no known resolution
+
+CVE_STATUS[CVE-2018-17182] =3D "fixed-version: Fixed after version 4.19r=
c4"
+
+CVE_STATUS[CVE-2018-17972] =3D "fixed-version: Fixed after version 4.19r=
c7"
+
+# CVE-2018-17977 has no known resolution
+
+CVE_STATUS[CVE-2018-18021] =3D "fixed-version: Fixed after version 4.19r=
c7"
+
+CVE_STATUS[CVE-2018-18281] =3D "fixed-version: Fixed after version 4.19"
+
+CVE_STATUS[CVE-2018-18386] =3D "fixed-version: Fixed after version 4.15r=
c6"
+
+CVE_STATUS[CVE-2018-18397] =3D "fixed-version: Fixed after version 4.20r=
c5"
+
+CVE_STATUS[CVE-2018-18445] =3D "fixed-version: Fixed after version 4.19r=
c7"
+
+CVE_STATUS[CVE-2018-18559] =3D "fixed-version: Fixed after version 4.15r=
c2"
+
+# CVE-2018-18653 has no known resolution
+
+CVE_STATUS[CVE-2018-18690] =3D "fixed-version: Fixed after version 4.17r=
c4"
+
+CVE_STATUS[CVE-2018-18710] =3D "fixed-version: Fixed after version 4.20r=
c1"
+
+CVE_STATUS[CVE-2018-18955] =3D "fixed-version: Fixed after version 4.20r=
c2"
+
+CVE_STATUS[CVE-2018-19406] =3D "fixed-version: Fixed after version 4.20r=
c5"
+
+CVE_STATUS[CVE-2018-19407] =3D "fixed-version: Fixed after version 4.20r=
c5"
+
+CVE_STATUS[CVE-2018-19824] =3D "fixed-version: Fixed after version 4.20r=
c6"
+
+CVE_STATUS[CVE-2018-19854] =3D "fixed-version: Fixed after version 4.20r=
c3"
+
+CVE_STATUS[CVE-2018-19985] =3D "fixed-version: Fixed after version 4.20"
+
+CVE_STATUS[CVE-2018-20169] =3D "fixed-version: Fixed after version 4.20r=
c6"
+
+CVE_STATUS[CVE-2018-20449] =3D "fixed-version: Fixed after version 4.15r=
c2"
+
+CVE_STATUS[CVE-2018-20509] =3D "fixed-version: Fixed after version 4.14r=
c1"
+
+CVE_STATUS[CVE-2018-20510] =3D "fixed-version: Fixed after version 4.16r=
c3"
+
+CVE_STATUS[CVE-2018-20511] =3D "fixed-version: Fixed after version 4.19r=
c5"
+
+CVE_STATUS[CVE-2018-20669] =3D "fixed-version: Fixed after version 5.0rc=
1"
+
+CVE_STATUS[CVE-2018-20784] =3D "fixed-version: Fixed after version 5.0rc=
1"
+
+CVE_STATUS[CVE-2018-20836] =3D "fixed-version: Fixed after version 4.20r=
c1"
+
+CVE_STATUS[CVE-2018-20854] =3D "fixed-version: Fixed after version 4.20r=
c1"
+
+CVE_STATUS[CVE-2018-20855] =3D "fixed-version: Fixed after version 4.19r=
c1"
+
+CVE_STATUS[CVE-2018-20856] =3D "fixed-version: Fixed after version 4.19r=
c1"
+
+CVE_STATUS[CVE-2018-20961] =3D "fixed-version: Fixed after version 4.17r=
c1"
+
+CVE_STATUS[CVE-2018-20976] =3D "fixed-version: Fixed after version 4.18r=
c1"
+
+CVE_STATUS[CVE-2018-21008] =3D "fixed-version: Fixed after version 4.18r=
c1"
+
+CVE_STATUS[CVE-2018-25015] =3D "fixed-version: Fixed after version 4.15r=
c9"
+
+CVE_STATUS[CVE-2018-25020] =3D "fixed-version: Fixed after version 4.17r=
c7"
+
+# CVE-2018-3574 has no known resolution
+
+CVE_STATUS[CVE-2018-3620] =3D "fixed-version: Fixed after version 4.19rc=
1"
+
+CVE_STATUS[CVE-2018-3639] =3D "fixed-version: Fixed after version 4.17rc=
7"
+
+CVE_STATUS[CVE-2018-3646] =3D "fixed-version: Fixed after version 4.19rc=
1"
+
+CVE_STATUS[CVE-2018-3665] =3D "fixed-version: Fixed after version 3.7rc1=
"
+
+CVE_STATUS[CVE-2018-3693] =3D "fixed-version: Fixed after version 4.19rc=
1"
+
+CVE_STATUS[CVE-2018-5332] =3D "fixed-version: Fixed after version 4.15rc=
8"
+
+CVE_STATUS[CVE-2018-5333] =3D "fixed-version: Fixed after version 4.15rc=
8"
+
+CVE_STATUS[CVE-2018-5344] =3D "fixed-version: Fixed after version 4.15rc=
8"
+
+CVE_STATUS[CVE-2018-5390] =3D "fixed-version: Fixed after version 4.18rc=
7"
+
+CVE_STATUS[CVE-2018-5391] =3D "fixed-version: Fixed after version 4.19rc=
1"
+
+CVE_STATUS[CVE-2018-5703] =3D "fixed-version: Fixed after version 4.16rc=
5"
+
+CVE_STATUS[CVE-2018-5750] =3D "fixed-version: Fixed after version 4.16rc=
1"
+
+CVE_STATUS[CVE-2018-5803] =3D "fixed-version: Fixed after version 4.16rc=
1"
+
+CVE_STATUS[CVE-2018-5814] =3D "fixed-version: Fixed after version 4.17rc=
6"
+
+CVE_STATUS[CVE-2018-5848] =3D "fixed-version: Fixed after version 4.16rc=
1"
+
+# Skipping CVE-2018-5856, no affected_versions
+
+CVE_STATUS[CVE-2018-5873] =3D "fixed-version: Fixed after version 4.11rc=
8"
+
+CVE_STATUS[CVE-2018-5953] =3D "fixed-version: Fixed after version 4.15rc=
2"
+
+CVE_STATUS[CVE-2018-5995] =3D "fixed-version: Fixed after version 4.15rc=
2"
+
+CVE_STATUS[CVE-2018-6412] =3D "fixed-version: Fixed after version 4.16rc=
5"
+
+CVE_STATUS[CVE-2018-6554] =3D "fixed-version: Fixed after version 4.17rc=
1"
+
+CVE_STATUS[CVE-2018-6555] =3D "fixed-version: Fixed after version 4.17rc=
1"
+
+# CVE-2018-6559 has no known resolution
+
+CVE_STATUS[CVE-2018-6927] =3D "fixed-version: Fixed after version 4.15rc=
9"
+
+CVE_STATUS[CVE-2018-7191] =3D "fixed-version: Fixed after version 4.14rc=
6"
+
+CVE_STATUS[CVE-2018-7273] =3D "fixed-version: Fixed after version 4.15rc=
2"
+
+CVE_STATUS[CVE-2018-7480] =3D "fixed-version: Fixed after version 4.11rc=
1"
+
+CVE_STATUS[CVE-2018-7492] =3D "fixed-version: Fixed after version 4.15rc=
3"
+
+CVE_STATUS[CVE-2018-7566] =3D "fixed-version: Fixed after version 4.16rc=
2"
+
+CVE_STATUS[CVE-2018-7740] =3D "fixed-version: Fixed after version 4.16rc=
7"
+
+CVE_STATUS[CVE-2018-7754] =3D "fixed-version: Fixed after version 4.15rc=
2"
+
+CVE_STATUS[CVE-2018-7755] =3D "fixed-version: Fixed after version 4.19rc=
5"
+
+CVE_STATUS[CVE-2018-7757] =3D "fixed-version: Fixed after version 4.16rc=
1"
+
+CVE_STATUS[CVE-2018-7995] =3D "fixed-version: Fixed after version 4.16rc=
5"
+
+CVE_STATUS[CVE-2018-8043] =3D "fixed-version: Fixed after version 4.16rc=
1"
+
+CVE_STATUS[CVE-2018-8087] =3D "fixed-version: Fixed after version 4.16rc=
1"
+
+CVE_STATUS[CVE-2018-8781] =3D "fixed-version: Fixed after version 4.16rc=
7"
+
+CVE_STATUS[CVE-2018-8822] =3D "fixed-version: Fixed after version 4.16rc=
7"
+
+CVE_STATUS[CVE-2018-8897] =3D "fixed-version: Fixed after version 4.16rc=
7"
+
+CVE_STATUS[CVE-2018-9363] =3D "fixed-version: Fixed after version 4.19rc=
1"
+
+CVE_STATUS[CVE-2018-9385] =3D "fixed-version: Fixed after version 4.17rc=
3"
+
+CVE_STATUS[CVE-2018-9415] =3D "fixed-version: Fixed after version 4.17rc=
3"
+
+CVE_STATUS[CVE-2018-9422] =3D "fixed-version: Fixed after version 4.6rc1=
"
+
+CVE_STATUS[CVE-2018-9465] =3D "fixed-version: Fixed after version 4.15rc=
6"
+
+CVE_STATUS[CVE-2018-9516] =3D "fixed-version: Fixed after version 4.18rc=
5"
+
+CVE_STATUS[CVE-2018-9517] =3D "fixed-version: Fixed after version 4.14rc=
1"
+
+CVE_STATUS[CVE-2018-9518] =3D "fixed-version: Fixed after version 4.16rc=
3"
+
+CVE_STATUS[CVE-2018-9568] =3D "fixed-version: Fixed after version 4.14rc=
4"
+
+CVE_STATUS[CVE-2019-0136] =3D "fixed-version: Fixed after version 5.2rc6=
"
+
+CVE_STATUS[CVE-2019-0145] =3D "fixed-version: Fixed after version 5.2rc1=
"
+
+CVE_STATUS[CVE-2019-0146] =3D "fixed-version: Fixed after version 5.2rc1=
"
+
+CVE_STATUS[CVE-2019-0147] =3D "fixed-version: Fixed after version 5.2rc1=
"
+
+CVE_STATUS[CVE-2019-0148] =3D "fixed-version: Fixed after version 5.2rc1=
"
+
+CVE_STATUS[CVE-2019-0149] =3D "fixed-version: Fixed after version 5.3rc1=
"
+
+CVE_STATUS[CVE-2019-0154] =3D "fixed-version: Fixed after version 5.4rc8=
"
+
+CVE_STATUS[CVE-2019-0155] =3D "fixed-version: Fixed after version 5.4rc8=
"
+
+CVE_STATUS[CVE-2019-10124] =3D "fixed-version: Fixed after version 5.1rc=
1"
+
+CVE_STATUS[CVE-2019-10125] =3D "fixed-version: Fixed after version 5.1rc=
1"
+
+CVE_STATUS[CVE-2019-10126] =3D "fixed-version: Fixed after version 5.2rc=
6"
+
+# CVE-2019-10140 has no known resolution
+
+CVE_STATUS[CVE-2019-10142] =3D "fixed-version: Fixed after version 5.2rc=
1"
+
+CVE_STATUS[CVE-2019-10207] =3D "fixed-version: Fixed after version 5.3rc=
3"
+
+CVE_STATUS[CVE-2019-10220] =3D "fixed-version: Fixed after version 5.4rc=
2"
+
+CVE_STATUS[CVE-2019-10638] =3D "fixed-version: Fixed after version 5.2rc=
1"
+
+CVE_STATUS[CVE-2019-10639] =3D "fixed-version: Fixed after version 5.1rc=
4"
+
+CVE_STATUS[CVE-2019-11085] =3D "fixed-version: Fixed after version 5.0rc=
3"
+
+CVE_STATUS[CVE-2019-11091] =3D "fixed-version: Fixed after version 5.2rc=
1"
+
+CVE_STATUS[CVE-2019-11135] =3D "fixed-version: Fixed after version 5.4rc=
8"
+
+CVE_STATUS[CVE-2019-11190] =3D "fixed-version: Fixed after version 4.8rc=
5"
+
+CVE_STATUS[CVE-2019-11191] =3D "fixed-version: Fixed after version 5.1rc=
1"
+
+CVE_STATUS[CVE-2019-1125] =3D "fixed-version: Fixed after version 5.3rc4=
"
+
+CVE_STATUS[CVE-2019-11477] =3D "fixed-version: Fixed after version 5.2rc=
6"
+
+CVE_STATUS[CVE-2019-11478] =3D "fixed-version: Fixed after version 5.2rc=
6"
+
+CVE_STATUS[CVE-2019-11479] =3D "fixed-version: Fixed after version 5.2rc=
6"
+
+CVE_STATUS[CVE-2019-11486] =3D "fixed-version: Fixed after version 5.1rc=
4"
+
+CVE_STATUS[CVE-2019-11487] =3D "fixed-version: Fixed after version 5.1rc=
5"
+
+CVE_STATUS[CVE-2019-11599] =3D "fixed-version: Fixed after version 5.1rc=
6"
+
+CVE_STATUS[CVE-2019-11683] =3D "fixed-version: Fixed after version 5.1"
+
+CVE_STATUS[CVE-2019-11810] =3D "fixed-version: Fixed after version 5.1rc=
1"
+
+CVE_STATUS[CVE-2019-11811] =3D "fixed-version: Fixed after version 5.1rc=
1"
+
+CVE_STATUS[CVE-2019-11815] =3D "fixed-version: Fixed after version 5.1rc=
4"
+
+CVE_STATUS[CVE-2019-11833] =3D "fixed-version: Fixed after version 5.2rc=
1"
+
+CVE_STATUS[CVE-2019-11884] =3D "fixed-version: Fixed after version 5.2rc=
1"
+
+CVE_STATUS[CVE-2019-12378] =3D "fixed-version: Fixed after version 5.2rc=
3"
+
+CVE_STATUS[CVE-2019-12379] =3D "fixed-version: Fixed after version 5.3rc=
1"
+
+CVE_STATUS[CVE-2019-12380] =3D "fixed-version: Fixed after version 5.2rc=
3"
+
+CVE_STATUS[CVE-2019-12381] =3D "fixed-version: Fixed after version 5.2rc=
3"
+
+CVE_STATUS[CVE-2019-12382] =3D "fixed-version: Fixed after version 5.3rc=
1"
+
+CVE_STATUS[CVE-2019-12454] =3D "fixed-version: Fixed after version 5.3rc=
1"
+
+CVE_STATUS[CVE-2019-12455] =3D "fixed-version: Fixed after version 5.3rc=
1"
+
+# CVE-2019-12456 has no known resolution
+
+CVE_STATUS[CVE-2019-12614] =3D "fixed-version: Fixed after version 5.3rc=
1"
+
+CVE_STATUS[CVE-2019-12615] =3D "fixed-version: Fixed after version 5.2rc=
4"
+
+CVE_STATUS[CVE-2019-12817] =3D "fixed-version: Fixed after version 5.2rc=
7"
+
+CVE_STATUS[CVE-2019-12818] =3D "fixed-version: Fixed after version 5.0"
+
+CVE_STATUS[CVE-2019-12819] =3D "fixed-version: Fixed after version 5.0rc=
8"
+
+CVE_STATUS[CVE-2019-12881] =3D "fixed-version: Fixed after version 4.18r=
c1"
+
+CVE_STATUS[CVE-2019-12984] =3D "fixed-version: Fixed after version 5.2rc=
6"
+
+CVE_STATUS[CVE-2019-13233] =3D "fixed-version: Fixed after version 5.2rc=
4"
+
+CVE_STATUS[CVE-2019-13272] =3D "fixed-version: Fixed after version 5.2"
+
+CVE_STATUS[CVE-2019-13631] =3D "fixed-version: Fixed after version 5.3rc=
1"
+
+CVE_STATUS[CVE-2019-13648] =3D "fixed-version: Fixed after version 5.3rc=
2"
+
+CVE_STATUS[CVE-2019-14283] =3D "fixed-version: Fixed after version 5.3rc=
1"
+
+CVE_STATUS[CVE-2019-14284] =3D "fixed-version: Fixed after version 5.3rc=
1"
+
+CVE_STATUS[CVE-2019-14615] =3D "fixed-version: Fixed after version 5.5rc=
7"
+
+CVE_STATUS[CVE-2019-14763] =3D "fixed-version: Fixed after version 4.17r=
c1"
+
+CVE_STATUS[CVE-2019-14814] =3D "fixed-version: Fixed after version 5.3"
+
+CVE_STATUS[CVE-2019-14815] =3D "fixed-version: Fixed after version 5.3"
+
+CVE_STATUS[CVE-2019-14816] =3D "fixed-version: Fixed after version 5.3"
+
+CVE_STATUS[CVE-2019-14821] =3D "fixed-version: Fixed after version 5.4rc=
1"
+
+CVE_STATUS[CVE-2019-14835] =3D "fixed-version: Fixed after version 5.3"
+
+CVE_STATUS[CVE-2019-14895] =3D "fixed-version: Fixed after version 5.5rc=
3"
+
+CVE_STATUS[CVE-2019-14896] =3D "fixed-version: Fixed after version 5.5"
+
+CVE_STATUS[CVE-2019-14897] =3D "fixed-version: Fixed after version 5.5"
+
+# CVE-2019-14898 has no known resolution
+
+CVE_STATUS[CVE-2019-14901] =3D "fixed-version: Fixed after version 5.5rc=
3"
+
+CVE_STATUS[CVE-2019-15030] =3D "fixed-version: Fixed after version 5.3rc=
8"
+
+CVE_STATUS[CVE-2019-15031] =3D "fixed-version: Fixed after version 5.3rc=
8"
+
+CVE_STATUS[CVE-2019-15090] =3D "fixed-version: Fixed after version 5.2rc=
2"
+
+CVE_STATUS[CVE-2019-15098] =3D "fixed-version: Fixed after version 5.4rc=
1"
+
+CVE_STATUS[CVE-2019-15099] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-15117] =3D "fixed-version: Fixed after version 5.3rc=
5"
+
+CVE_STATUS[CVE-2019-15118] =3D "fixed-version: Fixed after version 5.3rc=
5"
+
+CVE_STATUS[CVE-2019-15211] =3D "fixed-version: Fixed after version 5.3rc=
1"
+
+CVE_STATUS[CVE-2019-15212] =3D "fixed-version: Fixed after version 5.2rc=
3"
+
+CVE_STATUS[CVE-2019-15213] =3D "fixed-version: Fixed after version 5.3rc=
1"
+
+CVE_STATUS[CVE-2019-15214] =3D "fixed-version: Fixed after version 5.1rc=
6"
+
+CVE_STATUS[CVE-2019-15215] =3D "fixed-version: Fixed after version 5.3rc=
1"
+
+CVE_STATUS[CVE-2019-15216] =3D "fixed-version: Fixed after version 5.1"
+
+CVE_STATUS[CVE-2019-15217] =3D "fixed-version: Fixed after version 5.3rc=
1"
+
+CVE_STATUS[CVE-2019-15218] =3D "fixed-version: Fixed after version 5.2rc=
3"
+
+CVE_STATUS[CVE-2019-15219] =3D "fixed-version: Fixed after version 5.2rc=
3"
+
+CVE_STATUS[CVE-2019-15220] =3D "fixed-version: Fixed after version 5.3rc=
1"
+
+CVE_STATUS[CVE-2019-15221] =3D "fixed-version: Fixed after version 5.2"
+
+CVE_STATUS[CVE-2019-15222] =3D "fixed-version: Fixed after version 5.3rc=
3"
+
+CVE_STATUS[CVE-2019-15223] =3D "fixed-version: Fixed after version 5.2rc=
3"
+
+# CVE-2019-15239 has no known resolution
+
+# CVE-2019-15290 has no known resolution
+
+CVE_STATUS[CVE-2019-15291] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-15292] =3D "fixed-version: Fixed after version 5.1rc=
1"
+
+CVE_STATUS[CVE-2019-15504] =3D "fixed-version: Fixed after version 5.3"
+
+CVE_STATUS[CVE-2019-15505] =3D "fixed-version: Fixed after version 5.4rc=
1"
+
+CVE_STATUS[CVE-2019-15538] =3D "fixed-version: Fixed after version 5.3rc=
6"
+
+CVE_STATUS[CVE-2019-15666] =3D "fixed-version: Fixed after version 5.1"
+
+# CVE-2019-15791 has no known resolution
+
+# CVE-2019-15792 has no known resolution
+
+# CVE-2019-15793 has no known resolution
+
+CVE_STATUS[CVE-2019-15794] =3D "fixed-version: Fixed after version 5.12"
+
+CVE_STATUS[CVE-2019-15807] =3D "fixed-version: Fixed after version 5.2rc=
3"
+
+# CVE-2019-15902 has no known resolution
+
+CVE_STATUS[CVE-2019-15916] =3D "fixed-version: Fixed after version 5.1rc=
1"
+
+CVE_STATUS[CVE-2019-15917] =3D "fixed-version: Fixed after version 5.1rc=
1"
+
+CVE_STATUS[CVE-2019-15918] =3D "fixed-version: Fixed after version 5.1rc=
6"
+
+CVE_STATUS[CVE-2019-15919] =3D "fixed-version: Fixed after version 5.1rc=
6"
+
+CVE_STATUS[CVE-2019-15920] =3D "fixed-version: Fixed after version 5.1rc=
6"
+
+CVE_STATUS[CVE-2019-15921] =3D "fixed-version: Fixed after version 5.1rc=
3"
+
+CVE_STATUS[CVE-2019-15922] =3D "fixed-version: Fixed after version 5.1rc=
4"
+
+CVE_STATUS[CVE-2019-15923] =3D "fixed-version: Fixed after version 5.1rc=
4"
+
+CVE_STATUS[CVE-2019-15924] =3D "fixed-version: Fixed after version 5.1rc=
4"
+
+CVE_STATUS[CVE-2019-15925] =3D "fixed-version: Fixed after version 5.3rc=
1"
+
+CVE_STATUS[CVE-2019-15926] =3D "fixed-version: Fixed after version 5.3rc=
1"
+
+CVE_STATUS[CVE-2019-15927] =3D "fixed-version: Fixed after version 5.0rc=
2"
+
+# CVE-2019-16089 has no known resolution
+
+CVE_STATUS[CVE-2019-16229] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-16230] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-16231] =3D "fixed-version: Fixed after version 5.4rc=
6"
+
+CVE_STATUS[CVE-2019-16232] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-16233] =3D "fixed-version: Fixed after version 5.4rc=
5"
+
+CVE_STATUS[CVE-2019-16234] =3D "fixed-version: Fixed after version 5.4rc=
4"
+
+CVE_STATUS[CVE-2019-16413] =3D "fixed-version: Fixed after version 5.1rc=
1"
+
+CVE_STATUS[CVE-2019-16714] =3D "fixed-version: Fixed after version 5.3rc=
7"
+
+CVE_STATUS[CVE-2019-16746] =3D "fixed-version: Fixed after version 5.4rc=
2"
+
+CVE_STATUS[CVE-2019-16921] =3D "fixed-version: Fixed after version 4.17r=
c1"
+
+CVE_STATUS[CVE-2019-16994] =3D "fixed-version: Fixed after version 5.0"
+
+CVE_STATUS[CVE-2019-16995] =3D "fixed-version: Fixed after version 5.1rc=
1"
+
+CVE_STATUS[CVE-2019-17052] =3D "fixed-version: Fixed after version 5.4rc=
1"
+
+CVE_STATUS[CVE-2019-17053] =3D "fixed-version: Fixed after version 5.4rc=
1"
+
+CVE_STATUS[CVE-2019-17054] =3D "fixed-version: Fixed after version 5.4rc=
1"
+
+CVE_STATUS[CVE-2019-17055] =3D "fixed-version: Fixed after version 5.4rc=
1"
+
+CVE_STATUS[CVE-2019-17056] =3D "fixed-version: Fixed after version 5.4rc=
1"
+
+CVE_STATUS[CVE-2019-17075] =3D "fixed-version: Fixed after version 5.4rc=
3"
+
+CVE_STATUS[CVE-2019-17133] =3D "fixed-version: Fixed after version 5.4rc=
4"
+
+CVE_STATUS[CVE-2019-17351] =3D "fixed-version: Fixed after version 5.3rc=
1"
+
+CVE_STATUS[CVE-2019-17666] =3D "fixed-version: Fixed after version 5.4rc=
6"
+
+CVE_STATUS[CVE-2019-18198] =3D "fixed-version: Fixed after version 5.4rc=
1"
+
+CVE_STATUS[CVE-2019-18282] =3D "fixed-version: Fixed after version 5.4rc=
6"
+
+CVE_STATUS[CVE-2019-18660] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-18675] =3D "fixed-version: Fixed after version 4.17r=
c5"
+
+# CVE-2019-18680 has no known resolution
+
+CVE_STATUS[CVE-2019-18683] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-18786] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-18805] =3D "fixed-version: Fixed after version 5.1rc=
7"
+
+CVE_STATUS[CVE-2019-18806] =3D "fixed-version: Fixed after version 5.4rc=
2"
+
+CVE_STATUS[CVE-2019-18807] =3D "fixed-version: Fixed after version 5.4rc=
2"
+
+CVE_STATUS[CVE-2019-18808] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-18809] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-18810] =3D "fixed-version: Fixed after version 5.4rc=
2"
+
+CVE_STATUS[CVE-2019-18811] =3D "fixed-version: Fixed after version 5.4rc=
7"
+
+CVE_STATUS[CVE-2019-18812] =3D "fixed-version: Fixed after version 5.4rc=
7"
+
+CVE_STATUS[CVE-2019-18813] =3D "fixed-version: Fixed after version 5.4rc=
6"
+
+CVE_STATUS[CVE-2019-18814] =3D "fixed-version: Fixed after version 5.7rc=
7"
+
+CVE_STATUS[CVE-2019-18885] =3D "fixed-version: Fixed after version 5.1rc=
1"
+
+CVE_STATUS[CVE-2019-19036] =3D "fixed-version: Fixed after version 5.4rc=
1"
+
+CVE_STATUS[CVE-2019-19037] =3D "fixed-version: Fixed after version 5.5rc=
3"
+
+CVE_STATUS[CVE-2019-19039] =3D "fixed-version: Fixed after version 5.7rc=
1"
+
+CVE_STATUS[CVE-2019-19043] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-19044] =3D "fixed-version: Fixed after version 5.4rc=
6"
+
+CVE_STATUS[CVE-2019-19045] =3D "fixed-version: Fixed after version 5.4rc=
6"
+
+CVE_STATUS[CVE-2019-19046] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-19047] =3D "fixed-version: Fixed after version 5.4rc=
6"
+
+CVE_STATUS[CVE-2019-19048] =3D "fixed-version: Fixed after version 5.4rc=
3"
+
+CVE_STATUS[CVE-2019-19049] =3D "fixed-version: Fixed after version 5.4rc=
5"
+
+CVE_STATUS[CVE-2019-19050] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-19051] =3D "fixed-version: Fixed after version 5.4rc=
6"
+
+CVE_STATUS[CVE-2019-19052] =3D "fixed-version: Fixed after version 5.4rc=
7"
+
+CVE_STATUS[CVE-2019-19053] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-19054] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-19055] =3D "fixed-version: Fixed after version 5.4rc=
4"
+
+CVE_STATUS[CVE-2019-19056] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-19057] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-19058] =3D "fixed-version: Fixed after version 5.4rc=
4"
+
+CVE_STATUS[CVE-2019-19059] =3D "fixed-version: Fixed after version 5.4rc=
4"
+
+CVE_STATUS[CVE-2019-19060] =3D "fixed-version: Fixed after version 5.4rc=
3"
+
+CVE_STATUS[CVE-2019-19061] =3D "fixed-version: Fixed after version 5.4rc=
3"
+
+CVE_STATUS[CVE-2019-19062] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-19063] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-19064] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-19065] =3D "fixed-version: Fixed after version 5.4rc=
3"
+
+CVE_STATUS[CVE-2019-19066] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-19067] =3D "fixed-version: Fixed after version 5.4rc=
2"
+
+CVE_STATUS[CVE-2019-19068] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-19069] =3D "fixed-version: Fixed after version 5.4rc=
3"
+
+CVE_STATUS[CVE-2019-19070] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-19071] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-19072] =3D "fixed-version: Fixed after version 5.4rc=
1"
+
+CVE_STATUS[CVE-2019-19073] =3D "fixed-version: Fixed after version 5.4rc=
1"
+
+CVE_STATUS[CVE-2019-19074] =3D "fixed-version: Fixed after version 5.4rc=
1"
+
+CVE_STATUS[CVE-2019-19075] =3D "fixed-version: Fixed after version 5.4rc=
2"
+
+CVE_STATUS[CVE-2019-19076] =3D "fixed-version: Fixed after version 5.4rc=
1"
+
+CVE_STATUS[CVE-2019-19077] =3D "fixed-version: Fixed after version 5.4rc=
1"
+
+CVE_STATUS[CVE-2019-19078] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-19079] =3D "fixed-version: Fixed after version 5.3"
+
+CVE_STATUS[CVE-2019-19080] =3D "fixed-version: Fixed after version 5.4rc=
1"
+
+CVE_STATUS[CVE-2019-19081] =3D "fixed-version: Fixed after version 5.4rc=
1"
+
+CVE_STATUS[CVE-2019-19082] =3D "fixed-version: Fixed after version 5.4rc=
1"
+
+CVE_STATUS[CVE-2019-19083] =3D "fixed-version: Fixed after version 5.4rc=
2"
+
+CVE_STATUS[CVE-2019-19227] =3D "fixed-version: Fixed after version 5.1rc=
3"
+
+CVE_STATUS[CVE-2019-19241] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-19252] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-19318] =3D "fixed-version: Fixed after version 5.4rc=
1"
+
+CVE_STATUS[CVE-2019-19319] =3D "fixed-version: Fixed after version 5.2rc=
1"
+
+CVE_STATUS[CVE-2019-19332] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-19338] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-19377] =3D "fixed-version: Fixed after version 5.7rc=
1"
+
+# CVE-2019-19378 has no known resolution
+
+CVE_STATUS[CVE-2019-19447] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-19448] =3D "fixed-version: Fixed after version 5.9rc=
1"
+
+CVE_STATUS[CVE-2019-19449] =3D "fixed-version: Fixed after version 5.10r=
c1"
+
+CVE_STATUS[CVE-2019-19462] =3D "fixed-version: Fixed after version 5.8rc=
1"
+
+CVE_STATUS[CVE-2019-19523] =3D "fixed-version: Fixed after version 5.4rc=
3"
+
+CVE_STATUS[CVE-2019-19524] =3D "fixed-version: Fixed after version 5.4rc=
8"
+
+CVE_STATUS[CVE-2019-19525] =3D "fixed-version: Fixed after version 5.4rc=
2"
+
+CVE_STATUS[CVE-2019-19526] =3D "fixed-version: Fixed after version 5.4rc=
4"
+
+CVE_STATUS[CVE-2019-19527] =3D "fixed-version: Fixed after version 5.3rc=
4"
+
+CVE_STATUS[CVE-2019-19528] =3D "fixed-version: Fixed after version 5.4rc=
3"
+
+CVE_STATUS[CVE-2019-19529] =3D "fixed-version: Fixed after version 5.4rc=
7"
+
+CVE_STATUS[CVE-2019-19530] =3D "fixed-version: Fixed after version 5.3rc=
5"
+
+CVE_STATUS[CVE-2019-19531] =3D "fixed-version: Fixed after version 5.3rc=
4"
+
+CVE_STATUS[CVE-2019-19532] =3D "fixed-version: Fixed after version 5.4rc=
6"
+
+CVE_STATUS[CVE-2019-19533] =3D "fixed-version: Fixed after version 5.4rc=
1"
+
+CVE_STATUS[CVE-2019-19534] =3D "fixed-version: Fixed after version 5.4rc=
7"
+
+CVE_STATUS[CVE-2019-19535] =3D "fixed-version: Fixed after version 5.3rc=
4"
+
+CVE_STATUS[CVE-2019-19536] =3D "fixed-version: Fixed after version 5.3rc=
4"
+
+CVE_STATUS[CVE-2019-19537] =3D "fixed-version: Fixed after version 5.3rc=
5"
+
+CVE_STATUS[CVE-2019-19543] =3D "fixed-version: Fixed after version 5.2rc=
1"
+
+CVE_STATUS[CVE-2019-19602] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-19767] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-19768] =3D "fixed-version: Fixed after version 5.6rc=
4"
+
+CVE_STATUS[CVE-2019-19769] =3D "fixed-version: Fixed after version 5.6rc=
5"
+
+CVE_STATUS[CVE-2019-19770] =3D "fixed-version: Fixed after version 5.9rc=
1"
+
+CVE_STATUS[CVE-2019-19807] =3D "fixed-version: Fixed after version 5.4rc=
7"
+
+CVE_STATUS[CVE-2019-19813] =3D "fixed-version: Fixed after version 5.2rc=
1"
+
+# CVE-2019-19814 has no known resolution
+
+CVE_STATUS[CVE-2019-19815] =3D "fixed-version: Fixed after version 5.3rc=
1"
+
+CVE_STATUS[CVE-2019-19816] =3D "fixed-version: Fixed after version 5.2rc=
1"
+
+CVE_STATUS[CVE-2019-19922] =3D "fixed-version: Fixed after version 5.4rc=
1"
+
+CVE_STATUS[CVE-2019-19927] =3D "fixed-version: Fixed after version 5.1rc=
6"
+
+CVE_STATUS[CVE-2019-19947] =3D "fixed-version: Fixed after version 5.5rc=
3"
+
+CVE_STATUS[CVE-2019-19965] =3D "fixed-version: Fixed after version 5.5rc=
2"
+
+CVE_STATUS[CVE-2019-19966] =3D "fixed-version: Fixed after version 5.2rc=
1"
+
+CVE_STATUS[CVE-2019-1999] =3D "fixed-version: Fixed after version 5.1rc3=
"
+
+CVE_STATUS[CVE-2019-20054] =3D "fixed-version: Fixed after version 5.1rc=
3"
+
+CVE_STATUS[CVE-2019-20095] =3D "fixed-version: Fixed after version 5.2rc=
1"
+
+CVE_STATUS[CVE-2019-20096] =3D "fixed-version: Fixed after version 5.1rc=
4"
+
+CVE_STATUS[CVE-2019-2024] =3D "fixed-version: Fixed after version 4.16rc=
1"
+
+CVE_STATUS[CVE-2019-2025] =3D "fixed-version: Fixed after version 4.20rc=
5"
+
+CVE_STATUS[CVE-2019-20422] =3D "fixed-version: Fixed after version 5.4rc=
1"
+
+CVE_STATUS[CVE-2019-2054] =3D "fixed-version: Fixed after version 4.8rc1=
"
+
+CVE_STATUS[CVE-2019-20636] =3D "fixed-version: Fixed after version 5.5rc=
6"
+
+# CVE-2019-20794 has no known resolution
+
+CVE_STATUS[CVE-2019-20806] =3D "fixed-version: Fixed after version 5.2rc=
1"
+
+CVE_STATUS[CVE-2019-20810] =3D "fixed-version: Fixed after version 5.6rc=
1"
+
+CVE_STATUS[CVE-2019-20811] =3D "fixed-version: Fixed after version 5.1rc=
3"
+
+CVE_STATUS[CVE-2019-20812] =3D "fixed-version: Fixed after version 5.5rc=
3"
+
+CVE_STATUS[CVE-2019-20908] =3D "fixed-version: Fixed after version 5.4rc=
1"
+
+CVE_STATUS[CVE-2019-20934] =3D "fixed-version: Fixed after version 5.3rc=
2"
+
+CVE_STATUS[CVE-2019-2101] =3D "fixed-version: Fixed after version 5.1rc1=
"
+
+CVE_STATUS[CVE-2019-2181] =3D "fixed-version: Fixed after version 5.2rc1=
"
+
+CVE_STATUS[CVE-2019-2182] =3D "fixed-version: Fixed after version 4.16rc=
3"
+
+CVE_STATUS[CVE-2019-2213] =3D "fixed-version: Fixed after version 5.2rc6=
"
+
+CVE_STATUS[CVE-2019-2214] =3D "fixed-version: Fixed after version 5.3rc2=
"
+
+CVE_STATUS[CVE-2019-2215] =3D "fixed-version: Fixed after version 4.16rc=
1"
+
+CVE_STATUS[CVE-2019-25044] =3D "fixed-version: Fixed after version 5.2rc=
4"
+
+CVE_STATUS[CVE-2019-25045] =3D "fixed-version: Fixed after version 5.1"
+
+CVE_STATUS[CVE-2019-3016] =3D "fixed-version: Fixed after version 5.6rc1=
"
+
+CVE_STATUS[CVE-2019-3459] =3D "fixed-version: Fixed after version 5.1rc1=
"
+
+CVE_STATUS[CVE-2019-3460] =3D "fixed-version: Fixed after version 5.1rc1=
"
+
+CVE_STATUS[CVE-2019-3701] =3D "fixed-version: Fixed after version 5.0rc3=
"
+
+CVE_STATUS[CVE-2019-3819] =3D "fixed-version: Fixed after version 5.0rc6=
"
+
+CVE_STATUS[CVE-2019-3837] =3D "fixed-version: Fixed after version 3.18rc=
1"
+
+CVE_STATUS[CVE-2019-3846] =3D "fixed-version: Fixed after version 5.2rc6=
"
+
+CVE_STATUS[CVE-2019-3874] =3D "fixed-version: Fixed after version 5.2rc1=
"
+
+CVE_STATUS[CVE-2019-3882] =3D "fixed-version: Fixed after version 5.1rc4=
"
+
+CVE_STATUS[CVE-2019-3887] =3D "fixed-version: Fixed after version 5.1rc4=
"
+
+CVE_STATUS[CVE-2019-3892] =3D "fixed-version: Fixed after version 5.1rc6=
"
+
+CVE_STATUS[CVE-2019-3896] =3D "fixed-version: Fixed after version 2.6.35=
rc1"
+
+CVE_STATUS[CVE-2019-3900] =3D "fixed-version: Fixed after version 5.2rc4=
"
+
+CVE_STATUS[CVE-2019-3901] =3D "fixed-version: Fixed after version 4.6rc6=
"
+
+CVE_STATUS[CVE-2019-5108] =3D "fixed-version: Fixed after version 5.3"
+
+# Skipping CVE-2019-5489, no affected_versions
+
+CVE_STATUS[CVE-2019-6133] =3D "fixed-version: Fixed after version 5.0rc2=
"
+
+CVE_STATUS[CVE-2019-6974] =3D "fixed-version: Fixed after version 5.0rc6=
"
+
+CVE_STATUS[CVE-2019-7221] =3D "fixed-version: Fixed after version 5.0rc6=
"
+
+CVE_STATUS[CVE-2019-7222] =3D "fixed-version: Fixed after version 5.0rc6=
"
+
+CVE_STATUS[CVE-2019-7308] =3D "fixed-version: Fixed after version 5.0rc3=
"
+
+CVE_STATUS[CVE-2019-8912] =3D "fixed-version: Fixed after version 5.0rc8=
"
+
+CVE_STATUS[CVE-2019-8956] =3D "fixed-version: Fixed after version 5.0rc6=
"
+
+CVE_STATUS[CVE-2019-8980] =3D "fixed-version: Fixed after version 5.1rc1=
"
+
+CVE_STATUS[CVE-2019-9003] =3D "fixed-version: Fixed after version 5.0rc4=
"
+
+CVE_STATUS[CVE-2019-9162] =3D "fixed-version: Fixed after version 5.0rc7=
"
+
+CVE_STATUS[CVE-2019-9213] =3D "fixed-version: Fixed after version 5.0"
+
+CVE_STATUS[CVE-2019-9245] =3D "fixed-version: Fixed after version 5.0rc1=
"
+
+CVE_STATUS[CVE-2019-9444] =3D "fixed-version: Fixed after version 4.15rc=
2"
+
+CVE_STATUS[CVE-2019-9445] =3D "fixed-version: Fixed after version 5.1rc1=
"
+
+CVE_STATUS[CVE-2019-9453] =3D "fixed-version: Fixed after version 5.2rc1=
"
+
+CVE_STATUS[CVE-2019-9454] =3D "fixed-version: Fixed after version 4.15rc=
9"
+
+CVE_STATUS[CVE-2019-9455] =3D "fixed-version: Fixed after version 5.0rc1=
"
+
+CVE_STATUS[CVE-2019-9456] =3D "fixed-version: Fixed after version 4.16rc=
6"
+
+CVE_STATUS[CVE-2019-9457] =3D "fixed-version: Fixed after version 4.13rc=
1"
+
+CVE_STATUS[CVE-2019-9458] =3D "fixed-version: Fixed after version 4.19rc=
7"
+
+CVE_STATUS[CVE-2019-9466] =3D "fixed-version: Fixed after version 5.1rc1=
"
+
+CVE_STATUS[CVE-2019-9500] =3D "fixed-version: Fixed after version 5.1rc1=
"
+
+CVE_STATUS[CVE-2019-9503] =3D "fixed-version: Fixed after version 5.1rc1=
"
+
+CVE_STATUS[CVE-2019-9506] =3D "fixed-version: Fixed after version 5.2"
+
+CVE_STATUS[CVE-2019-9857] =3D "fixed-version: Fixed after version 5.1rc2=
"
+
+CVE_STATUS[CVE-2020-0009] =3D "fixed-version: Fixed after version 5.6rc3=
"
+
+CVE_STATUS[CVE-2020-0030] =3D "fixed-version: Fixed after version 4.16rc=
3"
+
+CVE_STATUS[CVE-2020-0041] =3D "fixed-version: Fixed after version 5.5rc2=
"
+
+CVE_STATUS[CVE-2020-0066] =3D "fixed-version: Fixed after version 4.3rc7=
"
+
+CVE_STATUS[CVE-2020-0067] =3D "fixed-version: Fixed after version 5.5rc1=
"
+
+CVE_STATUS[CVE-2020-0110] =3D "fixed-version: Fixed after version 5.6rc2=
"
+
+CVE_STATUS[CVE-2020-0255] =3D "fixed-version: Fixed after version 5.7rc4=
"
+
+CVE_STATUS[CVE-2020-0305] =3D "fixed-version: Fixed after version 5.5rc6=
"
+
+# CVE-2020-0347 has no known resolution
+
+CVE_STATUS[CVE-2020-0404] =3D "fixed-version: Fixed after version 5.6rc1=
"
+
+CVE_STATUS[CVE-2020-0423] =3D "fixed-version: Fixed after version 5.10rc=
1"
+
+CVE_STATUS[CVE-2020-0427] =3D "fixed-version: Fixed after version 5.5rc1=
"
+
+CVE_STATUS[CVE-2020-0429] =3D "fixed-version: Fixed after version 4.14rc=
4"
+
+CVE_STATUS[CVE-2020-0430] =3D "fixed-version: Fixed after version 4.18rc=
1"
+
+CVE_STATUS[CVE-2020-0431] =3D "fixed-version: Fixed after version 5.5rc6=
"
+
+CVE_STATUS[CVE-2020-0432] =3D "fixed-version: Fixed after version 5.6rc1=
"
+
+CVE_STATUS[CVE-2020-0433] =3D "fixed-version: Fixed after version 4.19rc=
1"
+
+CVE_STATUS[CVE-2020-0435] =3D "fixed-version: Fixed after version 4.19rc=
1"
+
+CVE_STATUS[CVE-2020-0444] =3D "fixed-version: Fixed after version 5.6rc4=
"
+
+CVE_STATUS[CVE-2020-0465] =3D "fixed-version: Fixed after version 5.9rc4=
"
+
+CVE_STATUS[CVE-2020-0466] =3D "fixed-version: Fixed after version 5.9rc2=
"
+
+CVE_STATUS[CVE-2020-0543] =3D "fixed-version: Fixed after version 5.8rc1=
"
+
+CVE_STATUS[CVE-2020-10135] =3D "fixed-version: Fixed after version 5.8rc=
1"
+
+CVE_STATUS[CVE-2020-10690] =3D "fixed-version: Fixed after version 5.5rc=
5"
+
+# CVE-2020-10708 has no known resolution
+
+CVE_STATUS[CVE-2020-10711] =3D "fixed-version: Fixed after version 5.7rc=
6"
+
+CVE_STATUS[CVE-2020-10720] =3D "fixed-version: Fixed after version 5.2rc=
3"
+
+CVE_STATUS[CVE-2020-10732] =3D "fixed-version: Fixed after version 5.7"
+
+CVE_STATUS[CVE-2020-10742] =3D "fixed-version: Fixed after version 3.16r=
c1"
+
+CVE_STATUS[CVE-2020-10751] =3D "fixed-version: Fixed after version 5.7rc=
4"
+
+CVE_STATUS[CVE-2020-10757] =3D "fixed-version: Fixed after version 5.8rc=
1"
+
+CVE_STATUS[CVE-2020-10766] =3D "fixed-version: Fixed after version 5.8rc=
1"
+
+CVE_STATUS[CVE-2020-10767] =3D "fixed-version: Fixed after version 5.8rc=
1"
+
+CVE_STATUS[CVE-2020-10768] =3D "fixed-version: Fixed after version 5.8rc=
1"
+
+CVE_STATUS[CVE-2020-10769] =3D "fixed-version: Fixed after version 5.0rc=
3"
+
+CVE_STATUS[CVE-2020-10773] =3D "fixed-version: Fixed after version 5.4rc=
6"
+
+# CVE-2020-10774 has no known resolution
+
+CVE_STATUS[CVE-2020-10781] =3D "fixed-version: Fixed after version 5.8rc=
6"
+
+CVE_STATUS[CVE-2020-10942] =3D "fixed-version: Fixed after version 5.6rc=
4"
+
+CVE_STATUS[CVE-2020-11494] =3D "fixed-version: Fixed after version 5.7rc=
1"
+
+CVE_STATUS[CVE-2020-11565] =3D "fixed-version: Fixed after version 5.7rc=
1"
+
+CVE_STATUS[CVE-2020-11608] =3D "fixed-version: Fixed after version 5.7rc=
1"
+
+CVE_STATUS[CVE-2020-11609] =3D "fixed-version: Fixed after version 5.7rc=
1"
+
+CVE_STATUS[CVE-2020-11668] =3D "fixed-version: Fixed after version 5.7rc=
1"
+
+CVE_STATUS[CVE-2020-11669] =3D "fixed-version: Fixed after version 5.2rc=
1"
+
+# CVE-2020-11725 has no known resolution
+
+CVE_STATUS[CVE-2020-11884] =3D "fixed-version: Fixed after version 5.7rc=
4"
+
+# CVE-2020-11935 has no known resolution
+
+CVE_STATUS[CVE-2020-12114] =3D "fixed-version: Fixed after version 5.3rc=
1"
+
+CVE_STATUS[CVE-2020-12351] =3D "fixed-version: Fixed after version 5.10r=
c1"
+
+CVE_STATUS[CVE-2020-12352] =3D "fixed-version: Fixed after version 5.10r=
c1"
+
+CVE_STATUS[CVE-2020-12362] =3D "fixed-version: Fixed after version 5.11r=
c1"
+
+CVE_STATUS[CVE-2020-12363] =3D "fixed-version: Fixed after version 5.11r=
c1"
+
+CVE_STATUS[CVE-2020-12364] =3D "fixed-version: Fixed after version 5.11r=
c1"
+
+CVE_STATUS[CVE-2020-12464] =3D "fixed-version: Fixed after version 5.7rc=
3"
+
+CVE_STATUS[CVE-2020-12465] =3D "fixed-version: Fixed after version 5.6rc=
6"
+
+CVE_STATUS[CVE-2020-12652] =3D "fixed-version: Fixed after version 5.5rc=
7"
+
+CVE_STATUS[CVE-2020-12653] =3D "fixed-version: Fixed after version 5.6rc=
1"
+
+CVE_STATUS[CVE-2020-12654] =3D "fixed-version: Fixed after version 5.6rc=
1"
+
+CVE_STATUS[CVE-2020-12655] =3D "fixed-version: Fixed after version 5.7rc=
1"
+
+CVE_STATUS[CVE-2020-12656] =3D "fixed-version: Fixed after version 5.8rc=
1"
+
+CVE_STATUS[CVE-2020-12657] =3D "fixed-version: Fixed after version 5.7rc=
1"
+
+CVE_STATUS[CVE-2020-12659] =3D "fixed-version: Fixed after version 5.7rc=
2"
+
+CVE_STATUS[CVE-2020-12768] =3D "fixed-version: Fixed after version 5.6rc=
4"
+
+CVE_STATUS[CVE-2020-12769] =3D "fixed-version: Fixed after version 5.5rc=
6"
+
+CVE_STATUS[CVE-2020-12770] =3D "fixed-version: Fixed after version 5.7rc=
3"
+
+CVE_STATUS[CVE-2020-12771] =3D "fixed-version: Fixed after version 5.8rc=
2"
+
+CVE_STATUS[CVE-2020-12826] =3D "fixed-version: Fixed after version 5.7rc=
1"
+
+CVE_STATUS[CVE-2020-12888] =3D "fixed-version: Fixed after version 5.8rc=
1"
+
+CVE_STATUS[CVE-2020-12912] =3D "fixed-version: Fixed after version 5.10r=
c4"
+
+CVE_STATUS[CVE-2020-13143] =3D "fixed-version: Fixed after version 5.7rc=
6"
+
+CVE_STATUS[CVE-2020-13974] =3D "fixed-version: Fixed after version 5.8rc=
1"
+
+# CVE-2020-14304 has no known resolution
+
+CVE_STATUS[CVE-2020-14305] =3D "fixed-version: Fixed after version 4.12r=
c1"
+
+CVE_STATUS[CVE-2020-14314] =3D "fixed-version: Fixed after version 5.9rc=
2"
+
+CVE_STATUS[CVE-2020-14331] =3D "fixed-version: Fixed after version 5.9rc=
1"
+
+CVE_STATUS[CVE-2020-14351] =3D "fixed-version: Fixed after version 5.10r=
c1"
+
+CVE_STATUS[CVE-2020-14353] =3D "fixed-version: Fixed after version 4.14r=
c3"
+
+CVE_STATUS[CVE-2020-14356] =3D "fixed-version: Fixed after version 5.8rc=
5"
+
+CVE_STATUS[CVE-2020-14381] =3D "fixed-version: Fixed after version 5.6rc=
6"
+
+CVE_STATUS[CVE-2020-14385] =3D "fixed-version: Fixed after version 5.9rc=
4"
+
+CVE_STATUS[CVE-2020-14386] =3D "fixed-version: Fixed after version 5.9rc=
4"
+
+CVE_STATUS[CVE-2020-14390] =3D "fixed-version: Fixed after version 5.9rc=
6"
+
+CVE_STATUS[CVE-2020-14416] =3D "fixed-version: Fixed after version 5.5"
+
+CVE_STATUS[CVE-2020-15393] =3D "fixed-version: Fixed after version 5.8rc=
3"
+
+CVE_STATUS[CVE-2020-15436] =3D "fixed-version: Fixed after version 5.8rc=
2"
+
+CVE_STATUS[CVE-2020-15437] =3D "fixed-version: Fixed after version 5.8rc=
7"
+
+CVE_STATUS[CVE-2020-15780] =3D "fixed-version: Fixed after version 5.8rc=
3"
+
+# CVE-2020-15802 has no known resolution
+
+CVE_STATUS[CVE-2020-15852] =3D "fixed-version: Fixed after version 5.8rc=
6"
+
+CVE_STATUS[CVE-2020-16119] =3D "fixed-version: Fixed after version 5.15r=
c2"
+
+CVE_STATUS[CVE-2020-16120] =3D "fixed-version: Fixed after version 5.8rc=
1"
+
+CVE_STATUS[CVE-2020-16166] =3D "fixed-version: Fixed after version 5.8"
+
+CVE_STATUS[CVE-2020-1749] =3D "fixed-version: Fixed after version 5.5rc1=
"
+
+CVE_STATUS[CVE-2020-24394] =3D "fixed-version: Fixed after version 5.8rc=
4"
+
+CVE_STATUS[CVE-2020-24490] =3D "fixed-version: Fixed after version 5.8"
+
+# CVE-2020-24502 has no known resolution
+
+# CVE-2020-24503 has no known resolution
+
+CVE_STATUS[CVE-2020-24504] =3D "fixed-version: Fixed after version 5.12r=
c1"
+
+CVE_STATUS[CVE-2020-24586] =3D "fixed-version: Fixed after version 5.13r=
c4"
+
+CVE_STATUS[CVE-2020-24587] =3D "fixed-version: Fixed after version 5.13r=
c4"
+
+CVE_STATUS[CVE-2020-24588] =3D "fixed-version: Fixed after version 5.13r=
c4"
+
+CVE_STATUS[CVE-2020-25211] =3D "fixed-version: Fixed after version 5.9rc=
7"
+
+CVE_STATUS[CVE-2020-25212] =3D "fixed-version: Fixed after version 5.9rc=
1"
+
+# CVE-2020-25220 has no known resolution
+
+CVE_STATUS[CVE-2020-25221] =3D "fixed-version: Fixed after version 5.9rc=
4"
+
+CVE_STATUS[CVE-2020-25284] =3D "fixed-version: Fixed after version 5.9rc=
5"
+
+CVE_STATUS[CVE-2020-25285] =3D "fixed-version: Fixed after version 5.9rc=
4"
+
+CVE_STATUS[CVE-2020-25639] =3D "fixed-version: Fixed after version 5.12r=
c1"
+
+CVE_STATUS[CVE-2020-25641] =3D "fixed-version: Fixed after version 5.9rc=
4"
+
+CVE_STATUS[CVE-2020-25643] =3D "fixed-version: Fixed after version 5.9rc=
7"
+
+CVE_STATUS[CVE-2020-25645] =3D "fixed-version: Fixed after version 5.9rc=
7"
+
+CVE_STATUS[CVE-2020-25656] =3D "fixed-version: Fixed after version 5.10r=
c2"
+
+# CVE-2020-25661 has no known resolution
+
+# CVE-2020-25662 has no known resolution
+
+CVE_STATUS[CVE-2020-25668] =3D "fixed-version: Fixed after version 5.10r=
c3"
+
+CVE_STATUS[CVE-2020-25669] =3D "fixed-version: Fixed after version 5.10r=
c5"
+
+CVE_STATUS[CVE-2020-25670] =3D "fixed-version: Fixed after version 5.12r=
c7"
+
+CVE_STATUS[CVE-2020-25671] =3D "fixed-version: Fixed after version 5.12r=
c7"
+
+CVE_STATUS[CVE-2020-25672] =3D "fixed-version: Fixed after version 5.12r=
c7"
+
+CVE_STATUS[CVE-2020-25673] =3D "fixed-version: Fixed after version 5.12r=
c7"
+
+CVE_STATUS[CVE-2020-25704] =3D "fixed-version: Fixed after version 5.10r=
c3"
+
+CVE_STATUS[CVE-2020-25705] =3D "fixed-version: Fixed after version 5.10r=
c1"
+
+CVE_STATUS[CVE-2020-26088] =3D "fixed-version: Fixed after version 5.9rc=
1"
+
+CVE_STATUS[CVE-2020-26139] =3D "fixed-version: Fixed after version 5.13r=
c4"
+
+# CVE-2020-26140 has no known resolution
+
+CVE_STATUS[CVE-2020-26141] =3D "fixed-version: Fixed after version 5.13r=
c4"
+
+# CVE-2020-26142 has no known resolution
+
+# CVE-2020-26143 has no known resolution
+
+CVE_STATUS[CVE-2020-26145] =3D "fixed-version: Fixed after version 5.13r=
c4"
+
+CVE_STATUS[CVE-2020-26147] =3D "fixed-version: Fixed after version 5.13r=
c4"
+
+CVE_STATUS[CVE-2020-26541] =3D "fixed-version: Fixed after version 5.13r=
c1"
+
+CVE_STATUS[CVE-2020-26555] =3D "fixed-version: Fixed after version 5.13r=
c1"
+
+# CVE-2020-26556 has no known resolution
+
+# CVE-2020-26557 has no known resolution
+
+CVE_STATUS[CVE-2020-26558] =3D "fixed-version: Fixed after version 5.13r=
c1"
+
+# CVE-2020-26559 has no known resolution
+
+# CVE-2020-26560 has no known resolution
+
+CVE_STATUS[CVE-2020-27066] =3D "fixed-version: Fixed after version 5.6"
+
+CVE_STATUS[CVE-2020-27067] =3D "fixed-version: Fixed after version 4.14r=
c4"
+
+CVE_STATUS[CVE-2020-27068] =3D "fixed-version: Fixed after version 5.6rc=
2"
+
+CVE_STATUS[CVE-2020-27152] =3D "fixed-version: Fixed after version 5.10r=
c1"
+
+CVE_STATUS[CVE-2020-27170] =3D "fixed-version: Fixed after version 5.12r=
c5"
+
+CVE_STATUS[CVE-2020-27171] =3D "fixed-version: Fixed after version 5.12r=
c5"
+
+CVE_STATUS[CVE-2020-27194] =3D "fixed-version: Fixed after version 5.9"
+
+CVE_STATUS[CVE-2020-2732] =3D "fixed-version: Fixed after version 5.6rc4=
"
+
+CVE_STATUS[CVE-2020-27673] =3D "fixed-version: Fixed after version 5.10r=
c1"
+
+CVE_STATUS[CVE-2020-27675] =3D "fixed-version: Fixed after version 5.10r=
c1"
+
+CVE_STATUS[CVE-2020-27777] =3D "fixed-version: Fixed after version 5.10r=
c1"
+
+CVE_STATUS[CVE-2020-27784] =3D "fixed-version: Fixed after version 5.10r=
c1"
+
+CVE_STATUS[CVE-2020-27786] =3D "fixed-version: Fixed after version 5.7rc=
6"
+
+CVE_STATUS[CVE-2020-27815] =3D "fixed-version: Fixed after version 5.11r=
c1"
+
+CVE_STATUS[CVE-2020-27820] =3D "fixed-version: Fixed after version 5.16r=
c1"
+
+CVE_STATUS[CVE-2020-27825] =3D "fixed-version: Fixed after version 5.10r=
c1"
+
+CVE_STATUS[CVE-2020-27830] =3D "fixed-version: Fixed after version 5.10r=
c7"
+
+CVE_STATUS[CVE-2020-27835] =3D "fixed-version: Fixed after version 5.10r=
c6"
+
+CVE_STATUS[CVE-2020-28097] =3D "fixed-version: Fixed after version 5.9rc=
6"
+
+CVE_STATUS[CVE-2020-28374] =3D "fixed-version: Fixed after version 5.11r=
c4"
+
+CVE_STATUS[CVE-2020-28588] =3D "fixed-version: Fixed after version 5.10r=
c7"
+
+CVE_STATUS[CVE-2020-28915] =3D "fixed-version: Fixed after version 5.9"
+
+CVE_STATUS[CVE-2020-28941] =3D "fixed-version: Fixed after version 5.10r=
c5"
+
+CVE_STATUS[CVE-2020-28974] =3D "fixed-version: Fixed after version 5.10r=
c3"
+
+CVE_STATUS[CVE-2020-29368] =3D "fixed-version: Fixed after version 5.8rc=
1"
+
+CVE_STATUS[CVE-2020-29369] =3D "fixed-version: Fixed after version 5.8rc=
7"
+
+CVE_STATUS[CVE-2020-29370] =3D "fixed-version: Fixed after version 5.6rc=
7"
+
+CVE_STATUS[CVE-2020-29371] =3D "fixed-version: Fixed after version 5.9rc=
2"
+
+CVE_STATUS[CVE-2020-29372] =3D "fixed-version: Fixed after version 5.7rc=
3"
+
+CVE_STATUS[CVE-2020-29373] =3D "fixed-version: Fixed after version 5.6rc=
2"
+
+CVE_STATUS[CVE-2020-29374] =3D "fixed-version: Fixed after version 5.8rc=
1"
+
+CVE_STATUS[CVE-2020-29534] =3D "fixed-version: Fixed after version 5.10r=
c1"
+
+CVE_STATUS[CVE-2020-29568] =3D "fixed-version: Fixed after version 5.11r=
c1"
+
+CVE_STATUS[CVE-2020-29569] =3D "fixed-version: Fixed after version 5.11r=
c1"
+
+CVE_STATUS[CVE-2020-29660] =3D "fixed-version: Fixed after version 5.10r=
c7"
+
+CVE_STATUS[CVE-2020-29661] =3D "fixed-version: Fixed after version 5.10r=
c7"
+
+CVE_STATUS[CVE-2020-35499] =3D "fixed-version: Fixed after version 5.11r=
c1"
+
+# CVE-2020-35501 has no known resolution
+
+CVE_STATUS[CVE-2020-35508] =3D "fixed-version: Fixed after version 5.10r=
c3"
+
+CVE_STATUS[CVE-2020-35513] =3D "fixed-version: Fixed after version 4.17r=
c1"
+
+CVE_STATUS[CVE-2020-35519] =3D "fixed-version: Fixed after version 5.10r=
c7"
+
+CVE_STATUS[CVE-2020-36158] =3D "fixed-version: Fixed after version 5.11r=
c1"
+
+CVE_STATUS[CVE-2020-36310] =3D "fixed-version: Fixed after version 5.8rc=
1"
+
+CVE_STATUS[CVE-2020-36311] =3D "fixed-version: Fixed after version 5.9rc=
5"
+
+CVE_STATUS[CVE-2020-36312] =3D "fixed-version: Fixed after version 5.9rc=
5"
+
+CVE_STATUS[CVE-2020-36313] =3D "fixed-version: Fixed after version 5.7rc=
1"
+
+CVE_STATUS[CVE-2020-36322] =3D "fixed-version: Fixed after version 5.11r=
c1"
+
+CVE_STATUS[CVE-2020-36385] =3D "fixed-version: Fixed after version 5.10r=
c1"
+
+CVE_STATUS[CVE-2020-36386] =3D "fixed-version: Fixed after version 5.9rc=
1"
+
+CVE_STATUS[CVE-2020-36387] =3D "fixed-version: Fixed after version 5.9rc=
1"
+
+CVE_STATUS[CVE-2020-36516] =3D "fixed-version: Fixed after version 5.17r=
c2"
+
+CVE_STATUS[CVE-2020-36557] =3D "fixed-version: Fixed after version 5.7rc=
1"
+
+CVE_STATUS[CVE-2020-36558] =3D "fixed-version: Fixed after version 5.6rc=
3"
+
+CVE_STATUS[CVE-2020-36691] =3D "fixed-version: Fixed after version 5.8rc=
1"
+
+CVE_STATUS[CVE-2020-36694] =3D "fixed-version: Fixed after version 5.10"
+
+CVE_STATUS[CVE-2020-3702] =3D "fixed-version: Fixed after version 5.12rc=
1"
+
+CVE_STATUS[CVE-2020-4788] =3D "fixed-version: Fixed after version 5.10rc=
5"
+
+CVE_STATUS[CVE-2020-7053] =3D "fixed-version: Fixed after version 5.2rc1=
"
+
+CVE_STATUS[CVE-2020-8428] =3D "fixed-version: Fixed after version 5.5"
+
+CVE_STATUS[CVE-2020-8647] =3D "fixed-version: Fixed after version 5.6rc5=
"
+
+CVE_STATUS[CVE-2020-8648] =3D "fixed-version: Fixed after version 5.6rc3=
"
+
+CVE_STATUS[CVE-2020-8649] =3D "fixed-version: Fixed after version 5.6rc5=
"
+
+CVE_STATUS[CVE-2020-8694] =3D "fixed-version: Fixed after version 5.10rc=
4"
+
+# CVE-2020-8832 has no known resolution
+
+CVE_STATUS[CVE-2020-8834] =3D "fixed-version: Fixed after version 4.18rc=
1"
+
+CVE_STATUS[CVE-2020-8835] =3D "fixed-version: Fixed after version 5.7rc1=
"
+
+CVE_STATUS[CVE-2020-8992] =3D "fixed-version: Fixed after version 5.6rc2=
"
+
+CVE_STATUS[CVE-2020-9383] =3D "fixed-version: Fixed after version 5.6rc4=
"
+
+CVE_STATUS[CVE-2020-9391] =3D "fixed-version: Fixed after version 5.6rc3=
"
+
+CVE_STATUS[CVE-2021-0129] =3D "fixed-version: Fixed after version 5.13rc=
1"
+
+CVE_STATUS[CVE-2021-0342] =3D "fixed-version: Fixed after version 5.8rc1=
"
+
+# CVE-2021-0399 has no known resolution
+
+CVE_STATUS[CVE-2021-0447] =3D "fixed-version: Fixed after version 4.15rc=
1"
+
+CVE_STATUS[CVE-2021-0448] =3D "fixed-version: Fixed after version 5.9rc7=
"
+
+CVE_STATUS[CVE-2021-0512] =3D "fixed-version: Fixed after version 5.12rc=
1"
+
+CVE_STATUS[CVE-2021-0605] =3D "fixed-version: Fixed after version 5.8"
+
+# CVE-2021-0606 has no known resolution
+
+# CVE-2021-0695 has no known resolution
+
+CVE_STATUS[CVE-2021-0707] =3D "fixed-version: Fixed after version 5.11rc=
3"
+
+CVE_STATUS[CVE-2021-0920] =3D "fixed-version: Fixed after version 5.14rc=
4"
+
+# CVE-2021-0924 has no known resolution
+
+CVE_STATUS[CVE-2021-0929] =3D "fixed-version: Fixed after version 5.6rc1=
"
+
+CVE_STATUS[CVE-2021-0935] =3D "fixed-version: Fixed after version 4.16rc=
7"
+
+# CVE-2021-0936 has no known resolution
+
+CVE_STATUS[CVE-2021-0937] =3D "fixed-version: Fixed after version 5.12rc=
8"
+
+CVE_STATUS[CVE-2021-0938] =3D "fixed-version: Fixed after version 5.10rc=
4"
+
+CVE_STATUS[CVE-2021-0941] =3D "fixed-version: Fixed after version 5.12rc=
1"
+
+# CVE-2021-0961 has no known resolution
+
+CVE_STATUS[CVE-2021-1048] =3D "fixed-version: Fixed after version 5.9rc4=
"
+
+CVE_STATUS[CVE-2021-20177] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2021-20194] =3D "fixed-version: Fixed after version 5.10r=
c1"
+
+# CVE-2021-20219 has no known resolution
+
+CVE_STATUS[CVE-2021-20226] =3D "fixed-version: Fixed after version 5.10r=
c1"
+
+CVE_STATUS[CVE-2021-20239] =3D "fixed-version: Fixed after version 5.9rc=
1"
+
+CVE_STATUS[CVE-2021-20261] =3D "fixed-version: Fixed after version 4.5rc=
5"
+
+CVE_STATUS[CVE-2021-20265] =3D "fixed-version: Fixed after version 4.5rc=
3"
+
+CVE_STATUS[CVE-2021-20268] =3D "fixed-version: Fixed after version 5.11r=
c5"
+
+CVE_STATUS[CVE-2021-20292] =3D "fixed-version: Fixed after version 5.9rc=
1"
+
+CVE_STATUS[CVE-2021-20317] =3D "fixed-version: Fixed after version 5.4rc=
1"
+
+CVE_STATUS[CVE-2021-20320] =3D "fixed-version: Fixed after version 5.15r=
c3"
+
+CVE_STATUS[CVE-2021-20321] =3D "fixed-version: Fixed after version 5.15r=
c5"
+
+CVE_STATUS[CVE-2021-20322] =3D "fixed-version: Fixed after version 5.15r=
c1"
+
+CVE_STATUS[CVE-2021-21781] =3D "fixed-version: Fixed after version 5.11r=
c7"
+
+CVE_STATUS[CVE-2021-22543] =3D "fixed-version: Fixed after version 5.13"
+
+CVE_STATUS[CVE-2021-22555] =3D "fixed-version: Fixed after version 5.12r=
c8"
+
+CVE_STATUS[CVE-2021-22600] =3D "fixed-version: Fixed after version 5.16r=
c6"
+
+CVE_STATUS[CVE-2021-23133] =3D "fixed-version: Fixed after version 5.12r=
c8"
+
+CVE_STATUS[CVE-2021-23134] =3D "fixed-version: Fixed after version 5.13r=
c1"
+
+CVE_STATUS[CVE-2021-26401] =3D "fixed-version: Fixed after version 5.17r=
c8"
+
+CVE_STATUS[CVE-2021-26708] =3D "fixed-version: Fixed after version 5.11r=
c7"
+
+CVE_STATUS[CVE-2021-26930] =3D "fixed-version: Fixed after version 5.12r=
c1"
+
+CVE_STATUS[CVE-2021-26931] =3D "fixed-version: Fixed after version 5.12r=
c1"
+
+CVE_STATUS[CVE-2021-26932] =3D "fixed-version: Fixed after version 5.12r=
c1"
+
+# CVE-2021-26934 has no known resolution
+
+CVE_STATUS[CVE-2021-27363] =3D "fixed-version: Fixed after version 5.12r=
c2"
+
+CVE_STATUS[CVE-2021-27364] =3D "fixed-version: Fixed after version 5.12r=
c2"
+
+CVE_STATUS[CVE-2021-27365] =3D "fixed-version: Fixed after version 5.12r=
c2"
+
+CVE_STATUS[CVE-2021-28038] =3D "fixed-version: Fixed after version 5.12r=
c2"
+
+CVE_STATUS[CVE-2021-28039] =3D "fixed-version: Fixed after version 5.12r=
c2"
+
+CVE_STATUS[CVE-2021-28375] =3D "fixed-version: Fixed after version 5.12r=
c3"
+
+CVE_STATUS[CVE-2021-28660] =3D "fixed-version: Fixed after version 5.12r=
c3"
+
+CVE_STATUS[CVE-2021-28688] =3D "fixed-version: Fixed after version 5.12r=
c6"
+
+CVE_STATUS[CVE-2021-28691] =3D "fixed-version: Fixed after version 5.13r=
c6"
+
+CVE_STATUS[CVE-2021-28711] =3D "fixed-version: Fixed after version 5.16r=
c7"
+
+CVE_STATUS[CVE-2021-28712] =3D "fixed-version: Fixed after version 5.16r=
c7"
+
+CVE_STATUS[CVE-2021-28713] =3D "fixed-version: Fixed after version 5.16r=
c7"
+
+CVE_STATUS[CVE-2021-28714] =3D "fixed-version: Fixed after version 5.16r=
c7"
+
+CVE_STATUS[CVE-2021-28715] =3D "fixed-version: Fixed after version 5.16r=
c7"
+
+CVE_STATUS[CVE-2021-28950] =3D "fixed-version: Fixed after version 5.12r=
c4"
+
+CVE_STATUS[CVE-2021-28951] =3D "fixed-version: Fixed after version 5.12r=
c2"
+
+CVE_STATUS[CVE-2021-28952] =3D "fixed-version: Fixed after version 5.12r=
c4"
+
+CVE_STATUS[CVE-2021-28964] =3D "fixed-version: Fixed after version 5.12r=
c4"
+
+CVE_STATUS[CVE-2021-28971] =3D "fixed-version: Fixed after version 5.12r=
c4"
+
+CVE_STATUS[CVE-2021-28972] =3D "fixed-version: Fixed after version 5.12r=
c4"
+
+CVE_STATUS[CVE-2021-29154] =3D "fixed-version: Fixed after version 5.12r=
c7"
+
+CVE_STATUS[CVE-2021-29155] =3D "fixed-version: Fixed after version 5.12r=
c8"
+
+CVE_STATUS[CVE-2021-29264] =3D "fixed-version: Fixed after version 5.12r=
c3"
+
+CVE_STATUS[CVE-2021-29265] =3D "fixed-version: Fixed after version 5.12r=
c3"
+
+CVE_STATUS[CVE-2021-29266] =3D "fixed-version: Fixed after version 5.12r=
c4"
+
+CVE_STATUS[CVE-2021-29646] =3D "fixed-version: Fixed after version 5.12r=
c5"
+
+CVE_STATUS[CVE-2021-29647] =3D "fixed-version: Fixed after version 5.12r=
c5"
+
+CVE_STATUS[CVE-2021-29648] =3D "fixed-version: Fixed after version 5.12r=
c5"
+
+CVE_STATUS[CVE-2021-29649] =3D "fixed-version: Fixed after version 5.12r=
c5"
+
+CVE_STATUS[CVE-2021-29650] =3D "fixed-version: Fixed after version 5.12r=
c5"
+
+CVE_STATUS[CVE-2021-29657] =3D "fixed-version: Fixed after version 5.12r=
c6"
+
+CVE_STATUS[CVE-2021-30002] =3D "fixed-version: Fixed after version 5.12r=
c1"
+
+CVE_STATUS[CVE-2021-30178] =3D "fixed-version: Fixed after version 5.12r=
c2"
+
+CVE_STATUS[CVE-2021-31440] =3D "fixed-version: Fixed after version 5.13r=
c1"
+
+CVE_STATUS[CVE-2021-3178] =3D "fixed-version: Fixed after version 5.11rc=
5"
+
+CVE_STATUS[CVE-2021-31829] =3D "fixed-version: Fixed after version 5.13r=
c1"
+
+CVE_STATUS[CVE-2021-31916] =3D "fixed-version: Fixed after version 5.12r=
c5"
+
+CVE_STATUS[CVE-2021-32078] =3D "fixed-version: Fixed after version 5.13r=
c1"
+
+CVE_STATUS[CVE-2021-32399] =3D "fixed-version: Fixed after version 5.13r=
c1"
+
+CVE_STATUS[CVE-2021-32606] =3D "fixed-version: Fixed after version 5.13r=
c4"
+
+CVE_STATUS[CVE-2021-33033] =3D "fixed-version: Fixed after version 5.12r=
c3"
+
+CVE_STATUS[CVE-2021-33034] =3D "fixed-version: Fixed after version 5.13r=
c1"
+
+CVE_STATUS[CVE-2021-33061] =3D "fixed-version: Fixed after version 5.18r=
c1"
+
+CVE_STATUS[CVE-2021-33098] =3D "fixed-version: Fixed after version 5.13r=
c4"
+
+CVE_STATUS[CVE-2021-33135] =3D "fixed-version: Fixed after version 5.17r=
c8"
+
+CVE_STATUS[CVE-2021-33200] =3D "fixed-version: Fixed after version 5.13r=
c4"
+
+CVE_STATUS[CVE-2021-3347] =3D "fixed-version: Fixed after version 5.11rc=
6"
+
+CVE_STATUS[CVE-2021-3348] =3D "fixed-version: Fixed after version 5.11rc=
6"
+
+CVE_STATUS[CVE-2021-33624] =3D "fixed-version: Fixed after version 5.13r=
c7"
+
+CVE_STATUS[CVE-2021-33655] =3D "fixed-version: Fixed after version 5.19r=
c6"
+
+CVE_STATUS[CVE-2021-33656] =3D "fixed-version: Fixed after version 5.12r=
c1"
+
+CVE_STATUS[CVE-2021-33909] =3D "fixed-version: Fixed after version 5.14r=
c3"
+
+CVE_STATUS[CVE-2021-3411] =3D "fixed-version: Fixed after version 5.10"
+
+CVE_STATUS[CVE-2021-3428] =3D "fixed-version: Fixed after version 5.9rc2=
"
+
+CVE_STATUS[CVE-2021-3444] =3D "fixed-version: Fixed after version 5.12rc=
1"
+
+CVE_STATUS[CVE-2021-34556] =3D "fixed-version: Fixed after version 5.14r=
c4"
+
+CVE_STATUS[CVE-2021-34693] =3D "fixed-version: Fixed after version 5.13r=
c7"
+
+CVE_STATUS[CVE-2021-3483] =3D "fixed-version: Fixed after version 5.12rc=
6"
+
+CVE_STATUS[CVE-2021-34866] =3D "fixed-version: Fixed after version 5.14"
+
+CVE_STATUS[CVE-2021-3489] =3D "fixed-version: Fixed after version 5.13rc=
4"
+
+CVE_STATUS[CVE-2021-3490] =3D "fixed-version: Fixed after version 5.13rc=
4"
+
+CVE_STATUS[CVE-2021-3491] =3D "fixed-version: Fixed after version 5.13rc=
1"
+
+# CVE-2021-3492 has no known resolution
+
+CVE_STATUS[CVE-2021-3493] =3D "fixed-version: Fixed after version 5.11rc=
1"
+
+CVE_STATUS[CVE-2021-34981] =3D "fixed-version: Fixed after version 5.14r=
c1"
+
+CVE_STATUS[CVE-2021-3501] =3D "fixed-version: Fixed after version 5.12rc=
8"
+
+CVE_STATUS[CVE-2021-35039] =3D "fixed-version: Fixed after version 5.13"
+
+CVE_STATUS[CVE-2021-3506] =3D "fixed-version: Fixed after version 5.13rc=
1"
+
+# CVE-2021-3542 has no known resolution
+
+CVE_STATUS[CVE-2021-3543] =3D "fixed-version: Fixed after version 5.13rc=
1"
+
+CVE_STATUS[CVE-2021-35477] =3D "fixed-version: Fixed after version 5.14r=
c4"
+
+CVE_STATUS[CVE-2021-3564] =3D "fixed-version: Fixed after version 5.13rc=
5"
+
+CVE_STATUS[CVE-2021-3573] =3D "fixed-version: Fixed after version 5.13rc=
5"
+
+CVE_STATUS[CVE-2021-3587] =3D "fixed-version: Fixed after version 5.13rc=
5"
+
+CVE_STATUS[CVE-2021-3600] =3D "fixed-version: Fixed after version 5.11"
+
+CVE_STATUS[CVE-2021-3609] =3D "fixed-version: Fixed after version 5.14rc=
1"
+
+CVE_STATUS[CVE-2021-3612] =3D "fixed-version: Fixed after version 5.12rc=
1"
+
+CVE_STATUS[CVE-2021-3635] =3D "fixed-version: Fixed after version 5.5rc7=
"
+
+CVE_STATUS[CVE-2021-3640] =3D "fixed-version: Fixed after version 5.16rc=
1"
+
+CVE_STATUS[CVE-2021-3653] =3D "fixed-version: Fixed after version 5.14rc=
7"
+
+CVE_STATUS[CVE-2021-3655] =3D "fixed-version: Fixed after version 5.14rc=
1"
+
+CVE_STATUS[CVE-2021-3656] =3D "fixed-version: Fixed after version 5.14rc=
7"
+
+CVE_STATUS[CVE-2021-3659] =3D "fixed-version: Fixed after version 5.12rc=
7"
+
+CVE_STATUS[CVE-2021-3669] =3D "fixed-version: Fixed after version 5.15rc=
1"
+
+CVE_STATUS[CVE-2021-3679] =3D "fixed-version: Fixed after version 5.14rc=
3"
+
+# CVE-2021-3714 has no known resolution
+
+CVE_STATUS[CVE-2021-3715] =3D "fixed-version: Fixed after version 5.6"
+
+CVE_STATUS[CVE-2021-37159] =3D "fixed-version: Fixed after version 5.14r=
c3"
+
+CVE_STATUS[CVE-2021-3732] =3D "fixed-version: Fixed after version 5.14rc=
6"
+
+CVE_STATUS[CVE-2021-3736] =3D "fixed-version: Fixed after version 5.15rc=
1"
+
+CVE_STATUS[CVE-2021-3739] =3D "fixed-version: Fixed after version 5.15rc=
1"
+
+CVE_STATUS[CVE-2021-3743] =3D "fixed-version: Fixed after version 5.13rc=
7"
+
+CVE_STATUS[CVE-2021-3744] =3D "fixed-version: Fixed after version 5.15rc=
4"
+
+CVE_STATUS[CVE-2021-3752] =3D "fixed-version: Fixed after version 5.16rc=
1"
+
+CVE_STATUS[CVE-2021-3753] =3D "fixed-version: Fixed after version 5.15rc=
1"
+
+CVE_STATUS[CVE-2021-37576] =3D "fixed-version: Fixed after version 5.14r=
c3"
+
+CVE_STATUS[CVE-2021-3759] =3D "fixed-version: Fixed after version 5.15rc=
1"
+
+CVE_STATUS[CVE-2021-3760] =3D "fixed-version: Fixed after version 5.15rc=
6"
+
+CVE_STATUS[CVE-2021-3764] =3D "fixed-version: Fixed after version 5.15rc=
4"
+
+CVE_STATUS[CVE-2021-3772] =3D "fixed-version: Fixed after version 5.15"
+
+CVE_STATUS[CVE-2021-38160] =3D "fixed-version: Fixed after version 5.14r=
c1"
+
+CVE_STATUS[CVE-2021-38166] =3D "fixed-version: Fixed after version 5.14r=
c6"
+
+CVE_STATUS[CVE-2021-38198] =3D "fixed-version: Fixed after version 5.13r=
c6"
+
+CVE_STATUS[CVE-2021-38199] =3D "fixed-version: Fixed after version 5.14r=
c1"
+
+CVE_STATUS[CVE-2021-38200] =3D "fixed-version: Fixed after version 5.13r=
c7"
+
+CVE_STATUS[CVE-2021-38201] =3D "fixed-version: Fixed after version 5.14r=
c1"
+
+CVE_STATUS[CVE-2021-38202] =3D "fixed-version: Fixed after version 5.14r=
c1"
+
+CVE_STATUS[CVE-2021-38203] =3D "fixed-version: Fixed after version 5.14r=
c2"
+
+CVE_STATUS[CVE-2021-38204] =3D "fixed-version: Fixed after version 5.14r=
c3"
+
+CVE_STATUS[CVE-2021-38205] =3D "fixed-version: Fixed after version 5.14r=
c1"
+
+CVE_STATUS[CVE-2021-38206] =3D "fixed-version: Fixed after version 5.13r=
c7"
+
+CVE_STATUS[CVE-2021-38207] =3D "fixed-version: Fixed after version 5.13r=
c7"
+
+CVE_STATUS[CVE-2021-38208] =3D "fixed-version: Fixed after version 5.13r=
c5"
+
+CVE_STATUS[CVE-2021-38209] =3D "fixed-version: Fixed after version 5.13r=
c1"
+
+CVE_STATUS[CVE-2021-38300] =3D "fixed-version: Fixed after version 5.15r=
c4"
+
+# CVE-2021-3847 has no known resolution
+
+# CVE-2021-3864 has no known resolution
+
+# CVE-2021-3892 has no known resolution
+
+CVE_STATUS[CVE-2021-3894] =3D "fixed-version: Fixed after version 5.15rc=
6"
+
+CVE_STATUS[CVE-2021-3896] =3D "fixed-version: Fixed after version 5.15rc=
6"
+
+CVE_STATUS[CVE-2021-3923] =3D "fixed-version: Fixed after version 5.16"
+
+CVE_STATUS[CVE-2021-39633] =3D "fixed-version: Fixed after version 5.14"
+
+CVE_STATUS[CVE-2021-39634] =3D "fixed-version: Fixed after version 5.9rc=
8"
+
+CVE_STATUS[CVE-2021-39636] =3D "fixed-version: Fixed after version 4.16r=
c1"
+
+CVE_STATUS[CVE-2021-39648] =3D "fixed-version: Fixed after version 5.11r=
c3"
+
+CVE_STATUS[CVE-2021-39656] =3D "fixed-version: Fixed after version 5.12r=
c3"
+
+CVE_STATUS[CVE-2021-39657] =3D "fixed-version: Fixed after version 5.11r=
c4"
+
+CVE_STATUS[CVE-2021-39685] =3D "fixed-version: Fixed after version 5.16r=
c5"
+
+CVE_STATUS[CVE-2021-39686] =3D "fixed-version: Fixed after version 5.16r=
c1"
+
+CVE_STATUS[CVE-2021-39698] =3D "fixed-version: Fixed after version 5.16r=
c5"
+
+CVE_STATUS[CVE-2021-39711] =3D "fixed-version: Fixed after version 4.18r=
c6"
+
+CVE_STATUS[CVE-2021-39713] =3D "fixed-version: Fixed after version 4.20r=
c1"
+
+CVE_STATUS[CVE-2021-39714] =3D "fixed-version: Fixed after version 4.12r=
c1"
+
+# CVE-2021-39800 has no known resolution
+
+# CVE-2021-39801 has no known resolution
+
+# CVE-2021-39802 has no known resolution
+
+CVE_STATUS[CVE-2021-4001] =3D "fixed-version: Fixed after version 5.16rc=
2"
+
+CVE_STATUS[CVE-2021-4002] =3D "fixed-version: Fixed after version 5.16rc=
3"
+
+CVE_STATUS[CVE-2021-4023] =3D "fixed-version: Fixed after version 5.15rc=
1"
+
+CVE_STATUS[CVE-2021-4028] =3D "fixed-version: Fixed after version 5.15rc=
4"
+
+CVE_STATUS[CVE-2021-4032] =3D "fixed-version: Fixed after version 5.15rc=
7"
+
+CVE_STATUS[CVE-2021-4037] =3D "fixed-version: Fixed after version 5.12rc=
1"
+
+CVE_STATUS[CVE-2021-40490] =3D "fixed-version: Fixed after version 5.15r=
c1"
+
+CVE_STATUS[CVE-2021-4083] =3D "fixed-version: Fixed after version 5.16rc=
4"
+
+CVE_STATUS[CVE-2021-4090] =3D "fixed-version: Fixed after version 5.16rc=
2"
+
+CVE_STATUS[CVE-2021-4093] =3D "fixed-version: Fixed after version 5.15rc=
7"
+
+CVE_STATUS[CVE-2021-4095] =3D "fixed-version: Fixed after version 5.17rc=
1"
+
+CVE_STATUS[CVE-2021-41073] =3D "fixed-version: Fixed after version 5.15r=
c2"
+
+CVE_STATUS[CVE-2021-4135] =3D "fixed-version: Fixed after version 5.16rc=
6"
+
+CVE_STATUS[CVE-2021-4148] =3D "fixed-version: Fixed after version 5.15"
+
+CVE_STATUS[CVE-2021-4149] =3D "fixed-version: Fixed after version 5.15rc=
6"
+
+CVE_STATUS[CVE-2021-4150] =3D "fixed-version: Fixed after version 5.15rc=
7"
+
+CVE_STATUS[CVE-2021-4154] =3D "fixed-version: Fixed after version 5.14rc=
2"
+
+CVE_STATUS[CVE-2021-4155] =3D "fixed-version: Fixed after version 5.16"
+
+CVE_STATUS[CVE-2021-4157] =3D "fixed-version: Fixed after version 5.13rc=
1"
+
+CVE_STATUS[CVE-2021-4159] =3D "fixed-version: Fixed after version 5.7rc1=
"
+
+CVE_STATUS[CVE-2021-41864] =3D "fixed-version: Fixed after version 5.15r=
c5"
+
+CVE_STATUS[CVE-2021-4197] =3D "fixed-version: Fixed after version 5.16"
+
+CVE_STATUS[CVE-2021-42008] =3D "fixed-version: Fixed after version 5.14r=
c7"
+
+CVE_STATUS[CVE-2021-4202] =3D "fixed-version: Fixed after version 5.16rc=
2"
+
+CVE_STATUS[CVE-2021-4203] =3D "fixed-version: Fixed after version 5.15rc=
4"
+
+CVE_STATUS[CVE-2021-4204] =3D "fixed-version: Fixed after version 5.17rc=
1"
+
+CVE_STATUS[CVE-2021-4218] =3D "fixed-version: Fixed after version 5.8rc1=
"
+
+CVE_STATUS[CVE-2021-42252] =3D "fixed-version: Fixed after version 5.15r=
c1"
+
+CVE_STATUS[CVE-2021-42327] =3D "fixed-version: Fixed after version 5.15"
+
+CVE_STATUS[CVE-2021-42739] =3D "fixed-version: Fixed after version 5.16r=
c1"
+
+CVE_STATUS[CVE-2021-43056] =3D "fixed-version: Fixed after version 5.15r=
c6"
+
+CVE_STATUS[CVE-2021-43057] =3D "fixed-version: Fixed after version 5.15r=
c3"
+
+CVE_STATUS[CVE-2021-43267] =3D "fixed-version: Fixed after version 5.15"
+
+CVE_STATUS[CVE-2021-43389] =3D "fixed-version: Fixed after version 5.15r=
c6"
+
+CVE_STATUS[CVE-2021-43975] =3D "fixed-version: Fixed after version 5.16r=
c2"
+
+CVE_STATUS[CVE-2021-43976] =3D "fixed-version: Fixed after version 5.17r=
c1"
+
+CVE_STATUS[CVE-2021-44733] =3D "fixed-version: Fixed after version 5.16r=
c7"
+
+CVE_STATUS[CVE-2021-44879] =3D "fixed-version: Fixed after version 5.17r=
c1"
+
+CVE_STATUS[CVE-2021-45095] =3D "fixed-version: Fixed after version 5.16r=
c6"
+
+CVE_STATUS[CVE-2021-45100] =3D "fixed-version: Fixed after version 5.16r=
c7"
+
+CVE_STATUS[CVE-2021-45402] =3D "fixed-version: Fixed after version 5.16r=
c6"
+
+CVE_STATUS[CVE-2021-45469] =3D "fixed-version: Fixed after version 5.17r=
c1"
+
+CVE_STATUS[CVE-2021-45480] =3D "fixed-version: Fixed after version 5.16r=
c6"
+
+CVE_STATUS[CVE-2021-45485] =3D "fixed-version: Fixed after version 5.14r=
c1"
+
+CVE_STATUS[CVE-2021-45486] =3D "fixed-version: Fixed after version 5.13r=
c1"
+
+CVE_STATUS[CVE-2021-45868] =3D "fixed-version: Fixed after version 5.16r=
c1"
+
+CVE_STATUS[CVE-2021-46283] =3D "fixed-version: Fixed after version 5.13r=
c7"
+
+CVE_STATUS[CVE-2022-0001] =3D "fixed-version: Fixed after version 5.17rc=
8"
+
+CVE_STATUS[CVE-2022-0002] =3D "fixed-version: Fixed after version 5.17rc=
8"
+
+CVE_STATUS[CVE-2022-0168] =3D "fixed-version: Fixed after version 5.18rc=
1"
+
+CVE_STATUS[CVE-2022-0171] =3D "fixed-version: Fixed after version 5.18rc=
4"
+
+CVE_STATUS[CVE-2022-0185] =3D "fixed-version: Fixed after version 5.17rc=
1"
+
+CVE_STATUS[CVE-2022-0264] =3D "fixed-version: Fixed after version 5.16rc=
6"
+
+CVE_STATUS[CVE-2022-0286] =3D "fixed-version: Fixed after version 5.14rc=
2"
+
+CVE_STATUS[CVE-2022-0322] =3D "fixed-version: Fixed after version 5.15rc=
6"
+
+CVE_STATUS[CVE-2022-0330] =3D "fixed-version: Fixed after version 5.17rc=
2"
+
+CVE_STATUS[CVE-2022-0382] =3D "fixed-version: Fixed after version 5.16"
+
+# CVE-2022-0400 has no known resolution
+
+CVE_STATUS[CVE-2022-0433] =3D "fixed-version: Fixed after version 5.17rc=
1"
+
+CVE_STATUS[CVE-2022-0435] =3D "fixed-version: Fixed after version 5.17rc=
4"
+
+CVE_STATUS[CVE-2022-0480] =3D "fixed-version: Fixed after version 5.15rc=
1"
+
+CVE_STATUS[CVE-2022-0487] =3D "fixed-version: Fixed after version 5.17rc=
4"
+
+CVE_STATUS[CVE-2022-0492] =3D "fixed-version: Fixed after version 5.17rc=
3"
+
+CVE_STATUS[CVE-2022-0494] =3D "fixed-version: Fixed after version 5.17rc=
5"
+
+CVE_STATUS[CVE-2022-0500] =3D "fixed-version: Fixed after version 5.17rc=
1"
+
+CVE_STATUS[CVE-2022-0516] =3D "fixed-version: Fixed after version 5.17rc=
4"
+
+CVE_STATUS[CVE-2022-0617] =3D "fixed-version: Fixed after version 5.17rc=
2"
+
+CVE_STATUS[CVE-2022-0644] =3D "fixed-version: Fixed after version 5.15rc=
7"
+
+CVE_STATUS[CVE-2022-0646] =3D "fixed-version: Fixed after version 5.17rc=
5"
+
+CVE_STATUS[CVE-2022-0742] =3D "fixed-version: Fixed after version 5.17rc=
7"
+
+CVE_STATUS[CVE-2022-0812] =3D "fixed-version: Fixed after version 5.8rc6=
"
+
+CVE_STATUS[CVE-2022-0847] =3D "fixed-version: Fixed after version 5.17rc=
6"
+
+CVE_STATUS[CVE-2022-0850] =3D "fixed-version: Fixed after version 5.14rc=
1"
+
+CVE_STATUS[CVE-2022-0854] =3D "fixed-version: Fixed after version 5.17rc=
8"
+
+CVE_STATUS[CVE-2022-0995] =3D "fixed-version: Fixed after version 5.17rc=
8"
+
+CVE_STATUS[CVE-2022-0998] =3D "fixed-version: Fixed after version 5.17rc=
1"
+
+CVE_STATUS[CVE-2022-1011] =3D "fixed-version: Fixed after version 5.17rc=
8"
+
+CVE_STATUS[CVE-2022-1012] =3D "fixed-version: Fixed after version 5.18rc=
6"
+
+CVE_STATUS[CVE-2022-1015] =3D "fixed-version: Fixed after version 5.18rc=
1"
+
+CVE_STATUS[CVE-2022-1016] =3D "fixed-version: Fixed after version 5.18rc=
1"
+
+CVE_STATUS[CVE-2022-1043] =3D "fixed-version: Fixed after version 5.14rc=
7"
+
+CVE_STATUS[CVE-2022-1048] =3D "fixed-version: Fixed after version 5.18rc=
1"
+
+CVE_STATUS[CVE-2022-1055] =3D "fixed-version: Fixed after version 5.17rc=
3"
+
+# CVE-2022-1116 has no known resolution
+
+CVE_STATUS[CVE-2022-1158] =3D "fixed-version: Fixed after version 5.18rc=
1"
+
+CVE_STATUS[CVE-2022-1184] =3D "fixed-version: Fixed after version 5.19rc=
1"
+
+CVE_STATUS[CVE-2022-1195] =3D "fixed-version: Fixed after version 5.16rc=
7"
+
+CVE_STATUS[CVE-2022-1198] =3D "fixed-version: Fixed after version 5.17rc=
6"
+
+CVE_STATUS[CVE-2022-1199] =3D "fixed-version: Fixed after version 5.17rc=
8"
+
+CVE_STATUS[CVE-2022-1204] =3D "fixed-version: Fixed after version 5.18rc=
1"
+
+CVE_STATUS[CVE-2022-1205] =3D "fixed-version: Fixed after version 5.18rc=
1"
+
+# CVE-2022-1247 has no known resolution
+
+CVE_STATUS[CVE-2022-1263] =3D "fixed-version: Fixed after version 5.18rc=
3"
+
+CVE_STATUS[CVE-2022-1280] =3D "fixed-version: Fixed after version 5.15rc=
1"
+
+CVE_STATUS[CVE-2022-1353] =3D "fixed-version: Fixed after version 5.17"
+
+CVE_STATUS[CVE-2022-1419] =3D "fixed-version: Fixed after version 5.6rc2=
"
+
+CVE_STATUS[CVE-2022-1462] =3D "fixed-version: Fixed after version 5.19rc=
7"
+
+CVE_STATUS[CVE-2022-1508] =3D "fixed-version: Fixed after version 5.15rc=
1"
+
+CVE_STATUS[CVE-2022-1516] =3D "fixed-version: Fixed after version 5.18rc=
1"
+
+CVE_STATUS[CVE-2022-1651] =3D "fixed-version: Fixed after version 5.18rc=
1"
+
+CVE_STATUS[CVE-2022-1652] =3D "fixed-version: Fixed after version 5.18rc=
6"
+
+CVE_STATUS[CVE-2022-1671] =3D "fixed-version: Fixed after version 5.18rc=
1"
+
+CVE_STATUS[CVE-2022-1678] =3D "fixed-version: Fixed after version 4.20rc=
1"
+
+CVE_STATUS[CVE-2022-1679] =3D "fixed-version: Fixed after version 6.0rc1=
"
+
+CVE_STATUS[CVE-2022-1729] =3D "fixed-version: Fixed after version 5.18"
+
+CVE_STATUS[CVE-2022-1734] =3D "fixed-version: Fixed after version 5.18rc=
6"
+
+CVE_STATUS[CVE-2022-1786] =3D "fixed-version: Fixed after version 5.12rc=
1"
+
+CVE_STATUS[CVE-2022-1789] =3D "fixed-version: Fixed after version 5.18"
+
+CVE_STATUS[CVE-2022-1836] =3D "fixed-version: Fixed after version 5.18rc=
5"
+
+CVE_STATUS[CVE-2022-1852] =3D "fixed-version: Fixed after version 5.19rc=
1"
+
+CVE_STATUS[CVE-2022-1882] =3D "fixed-version: Fixed after version 5.19rc=
8"
+
+CVE_STATUS[CVE-2022-1943] =3D "fixed-version: Fixed after version 5.18rc=
7"
+
+CVE_STATUS[CVE-2022-1966] =3D "fixed-version: Fixed after version 5.19rc=
1"
+
+CVE_STATUS[CVE-2022-1972] =3D "fixed-version: Fixed after version 5.19rc=
1"
+
+CVE_STATUS[CVE-2022-1973] =3D "fixed-version: Fixed after version 5.19rc=
1"
+
+CVE_STATUS[CVE-2022-1974] =3D "fixed-version: Fixed after version 5.18rc=
6"
+
+CVE_STATUS[CVE-2022-1975] =3D "fixed-version: Fixed after version 5.18rc=
6"
+
+CVE_STATUS[CVE-2022-1976] =3D "fixed-version: Fixed after version 5.19rc=
1"
+
+CVE_STATUS[CVE-2022-1998] =3D "fixed-version: Fixed after version 5.17rc=
3"
+
+CVE_STATUS[CVE-2022-20008] =3D "fixed-version: Fixed after version 5.17r=
c5"
+
+CVE_STATUS[CVE-2022-20132] =3D "fixed-version: Fixed after version 5.16r=
c5"
+
+CVE_STATUS[CVE-2022-20141] =3D "fixed-version: Fixed after version 5.15r=
c1"
+
+CVE_STATUS[CVE-2022-20148] =3D "fixed-version: Fixed after version 5.16r=
c1"
+
+CVE_STATUS[CVE-2022-20153] =3D "fixed-version: Fixed after version 5.13r=
c1"
+
+CVE_STATUS[CVE-2022-20154] =3D "fixed-version: Fixed after version 5.16r=
c8"
+
+CVE_STATUS[CVE-2022-20158] =3D "fixed-version: Fixed after version 5.17"
+
+CVE_STATUS[CVE-2022-20166] =3D "fixed-version: Fixed after version 5.10r=
c1"
+
+CVE_STATUS[CVE-2022-20368] =3D "fixed-version: Fixed after version 5.17"
+
+CVE_STATUS[CVE-2022-20369] =3D "fixed-version: Fixed after version 5.18r=
c1"
+
+CVE_STATUS[CVE-2022-20409] =3D "fixed-version: Fixed after version 5.12r=
c1"
+
+CVE_STATUS[CVE-2022-20421] =3D "fixed-version: Fixed after version 6.0rc=
4"
+
+CVE_STATUS[CVE-2022-20422] =3D "fixed-version: Fixed after version 6.0rc=
1"
+
+CVE_STATUS[CVE-2022-20423] =3D "fixed-version: Fixed after version 5.17"
+
+CVE_STATUS[CVE-2022-20424] =3D "fixed-version: Fixed after version 5.12r=
c1"
+
+CVE_STATUS[CVE-2022-20565] =3D "fixed-version: Fixed after version 5.9rc=
4"
+
+CVE_STATUS[CVE-2022-20566] =3D "fixed-version: Fixed after version 5.19"
+
+CVE_STATUS[CVE-2022-20567] =3D "fixed-version: Fixed after version 4.16r=
c5"
+
+CVE_STATUS[CVE-2022-20568] =3D "fixed-version: Fixed after version 5.12r=
c1"
+
+CVE_STATUS[CVE-2022-20572] =3D "fixed-version: Fixed after version 5.19r=
c1"
+
+CVE_STATUS[CVE-2022-2078] =3D "fixed-version: Fixed after version 5.19rc=
1"
+
+CVE_STATUS[CVE-2022-21123] =3D "fixed-version: Fixed after version 5.19r=
c3"
+
+CVE_STATUS[CVE-2022-21125] =3D "fixed-version: Fixed after version 5.19r=
c3"
+
+CVE_STATUS[CVE-2022-21166] =3D "fixed-version: Fixed after version 5.19r=
c3"
+
+CVE_STATUS[CVE-2022-21385] =3D "fixed-version: Fixed after version 4.20"
+
+CVE_STATUS[CVE-2022-21499] =3D "fixed-version: Fixed after version 5.19r=
c1"
+
+CVE_STATUS[CVE-2022-21505] =3D "fixed-version: Fixed after version 5.19r=
c8"
+
+CVE_STATUS[CVE-2022-2153] =3D "fixed-version: Fixed after version 5.18rc=
1"
+
+CVE_STATUS[CVE-2022-2196] =3D "cpe-stable-backport: Backported in 6.1.14=
"
+
+# CVE-2022-2209 has no known resolution
+
+CVE_STATUS[CVE-2022-22942] =3D "fixed-version: Fixed after version 5.17r=
c2"
+
+CVE_STATUS[CVE-2022-23036] =3D "fixed-version: Fixed after version 5.17r=
c8"
+
+CVE_STATUS[CVE-2022-23037] =3D "fixed-version: Fixed after version 5.17r=
c8"
+
+CVE_STATUS[CVE-2022-23038] =3D "fixed-version: Fixed after version 5.17r=
c8"
+
+CVE_STATUS[CVE-2022-23039] =3D "fixed-version: Fixed after version 5.17r=
c8"
+
+CVE_STATUS[CVE-2022-23040] =3D "fixed-version: Fixed after version 5.17r=
c8"
+
+CVE_STATUS[CVE-2022-23041] =3D "fixed-version: Fixed after version 5.17r=
c8"
+
+CVE_STATUS[CVE-2022-23042] =3D "fixed-version: Fixed after version 5.17r=
c8"
+
+CVE_STATUS[CVE-2022-2308] =3D "fixed-version: Fixed after version 6.0"
+
+CVE_STATUS[CVE-2022-2318] =3D "fixed-version: Fixed after version 5.19rc=
5"
+
+CVE_STATUS[CVE-2022-23222] =3D "fixed-version: Fixed after version 5.17r=
c1"
+
+CVE_STATUS[CVE-2022-2327] =3D "fixed-version: Fixed after version 5.12rc=
1"
+
+CVE_STATUS[CVE-2022-2380] =3D "fixed-version: Fixed after version 5.18rc=
1"
+
+CVE_STATUS[CVE-2022-23816] =3D "fixed-version: Fixed after version 5.19r=
c7"
+
+# CVE-2022-23825 has no known resolution
+
+CVE_STATUS[CVE-2022-23960] =3D "fixed-version: Fixed after version 5.17r=
c8"
+
+CVE_STATUS[CVE-2022-24122] =3D "fixed-version: Fixed after version 5.17r=
c2"
+
+CVE_STATUS[CVE-2022-24448] =3D "fixed-version: Fixed after version 5.17r=
c2"
+
+CVE_STATUS[CVE-2022-24958] =3D "fixed-version: Fixed after version 5.17r=
c1"
+
+CVE_STATUS[CVE-2022-24959] =3D "fixed-version: Fixed after version 5.17r=
c2"
+
+CVE_STATUS[CVE-2022-2503] =3D "fixed-version: Fixed after version 5.19rc=
1"
+
+CVE_STATUS[CVE-2022-25258] =3D "fixed-version: Fixed after version 5.17r=
c4"
+
+# CVE-2022-25265 has no known resolution
+
+CVE_STATUS[CVE-2022-25375] =3D "fixed-version: Fixed after version 5.17r=
c4"
+
+CVE_STATUS[CVE-2022-25636] =3D "fixed-version: Fixed after version 5.17r=
c6"
+
+CVE_STATUS[CVE-2022-2585] =3D "fixed-version: Fixed after version 6.0rc1=
"
+
+CVE_STATUS[CVE-2022-2586] =3D "fixed-version: Fixed after version 6.0rc1=
"
+
+CVE_STATUS[CVE-2022-2588] =3D "fixed-version: Fixed after version 6.0rc1=
"
+
+CVE_STATUS[CVE-2022-2590] =3D "fixed-version: Fixed after version 6.0rc3=
"
+
+CVE_STATUS[CVE-2022-2602] =3D "fixed-version: Fixed after version 6.1rc1=
"
+
+CVE_STATUS[CVE-2022-26365] =3D "fixed-version: Fixed after version 5.19r=
c6"
+
+CVE_STATUS[CVE-2022-26373] =3D "fixed-version: Fixed after version 6.0rc=
1"
+
+CVE_STATUS[CVE-2022-2639] =3D "fixed-version: Fixed after version 5.18rc=
4"
+
+CVE_STATUS[CVE-2022-26490] =3D "fixed-version: Fixed after version 5.17r=
c1"
+
+CVE_STATUS[CVE-2022-2663] =3D "fixed-version: Fixed after version 6.0rc5=
"
+
+# CVE-2022-26878 has no known resolution
+
+CVE_STATUS[CVE-2022-26966] =3D "fixed-version: Fixed after version 5.17r=
c6"
+
+CVE_STATUS[CVE-2022-27223] =3D "fixed-version: Fixed after version 5.17r=
c6"
+
+CVE_STATUS[CVE-2022-27666] =3D "fixed-version: Fixed after version 5.17r=
c8"
+
+CVE_STATUS[CVE-2022-27672] =3D "cpe-stable-backport: Backported in 6.1.1=
2"
+
+CVE_STATUS[CVE-2022-2785] =3D "fixed-version: Fixed after version 6.0rc1=
"
+
+CVE_STATUS[CVE-2022-27950] =3D "fixed-version: Fixed after version 5.17r=
c5"
+
+CVE_STATUS[CVE-2022-28356] =3D "fixed-version: Fixed after version 5.18r=
c1"
+
+CVE_STATUS[CVE-2022-28388] =3D "fixed-version: Fixed after version 5.18r=
c1"
+
+CVE_STATUS[CVE-2022-28389] =3D "fixed-version: Fixed after version 5.18r=
c1"
+
+CVE_STATUS[CVE-2022-28390] =3D "fixed-version: Fixed after version 5.18r=
c1"
+
+CVE_STATUS[CVE-2022-2873] =3D "fixed-version: Fixed after version 5.19rc=
1"
+
+CVE_STATUS[CVE-2022-28796] =3D "fixed-version: Fixed after version 5.18r=
c1"
+
+CVE_STATUS[CVE-2022-28893] =3D "fixed-version: Fixed after version 5.18r=
c2"
+
+CVE_STATUS[CVE-2022-2905] =3D "fixed-version: Fixed after version 6.0rc4=
"
+
+CVE_STATUS[CVE-2022-29156] =3D "fixed-version: Fixed after version 5.17r=
c6"
+
+CVE_STATUS[CVE-2022-2938] =3D "fixed-version: Fixed after version 5.17rc=
2"
+
+CVE_STATUS[CVE-2022-29581] =3D "fixed-version: Fixed after version 5.18r=
c4"
+
+CVE_STATUS[CVE-2022-29582] =3D "fixed-version: Fixed after version 5.18r=
c2"
+
+CVE_STATUS[CVE-2022-2959] =3D "fixed-version: Fixed after version 5.19rc=
1"
+
+# CVE-2022-2961 has no known resolution
+
+CVE_STATUS[CVE-2022-2964] =3D "fixed-version: Fixed after version 5.17rc=
4"
+
+CVE_STATUS[CVE-2022-2977] =3D "fixed-version: Fixed after version 5.18rc=
1"
+
+CVE_STATUS[CVE-2022-2978] =3D "fixed-version: Fixed after version 6.1rc1=
"
+
+CVE_STATUS[CVE-2022-29900] =3D "fixed-version: Fixed after version 5.19r=
c7"
+
+CVE_STATUS[CVE-2022-29901] =3D "fixed-version: Fixed after version 5.19r=
c7"
+
+CVE_STATUS[CVE-2022-2991] =3D "fixed-version: Fixed after version 5.15rc=
1"
+
+CVE_STATUS[CVE-2022-29968] =3D "fixed-version: Fixed after version 5.18r=
c5"
+
+CVE_STATUS[CVE-2022-3028] =3D "fixed-version: Fixed after version 6.0rc3=
"
+
+CVE_STATUS[CVE-2022-30594] =3D "fixed-version: Fixed after version 5.18r=
c1"
+
+CVE_STATUS[CVE-2022-3061] =3D "fixed-version: Fixed after version 5.18rc=
5"
+
+CVE_STATUS[CVE-2022-3077] =3D "fixed-version: Fixed after version 5.19rc=
1"
+
+CVE_STATUS[CVE-2022-3078] =3D "fixed-version: Fixed after version 5.18rc=
1"
+
+CVE_STATUS[CVE-2022-3103] =3D "fixed-version: Fixed after version 6.0rc3=
"
+
+CVE_STATUS[CVE-2022-3104] =3D "fixed-version: Fixed after version 5.19rc=
1"
+
+CVE_STATUS[CVE-2022-3105] =3D "fixed-version: Fixed after version 5.16"
+
+CVE_STATUS[CVE-2022-3106] =3D "fixed-version: Fixed after version 5.16rc=
6"
+
+CVE_STATUS[CVE-2022-3107] =3D "fixed-version: Fixed after version 5.17"
+
+CVE_STATUS[CVE-2022-3108] =3D "fixed-version: Fixed after version 5.17rc=
1"
+
+CVE_STATUS[CVE-2022-3110] =3D "fixed-version: Fixed after version 5.19rc=
1"
+
+CVE_STATUS[CVE-2022-3111] =3D "fixed-version: Fixed after version 5.18rc=
1"
+
+CVE_STATUS[CVE-2022-3112] =3D "fixed-version: Fixed after version 5.18rc=
1"
+
+CVE_STATUS[CVE-2022-3113] =3D "fixed-version: Fixed after version 5.18rc=
1"
+
+CVE_STATUS[CVE-2022-3114] =3D "fixed-version: Fixed after version 5.19rc=
1"
+
+CVE_STATUS[CVE-2022-3115] =3D "fixed-version: Fixed after version 5.19rc=
1"
+
+CVE_STATUS[CVE-2022-3169] =3D "fixed-version: Fixed after version 6.1rc1=
"
+
+CVE_STATUS[CVE-2022-3170] =3D "fixed-version: Fixed after version 6.0rc4=
"
+
+CVE_STATUS[CVE-2022-3176] =3D "fixed-version: Fixed after version 5.17rc=
1"
+
+CVE_STATUS[CVE-2022-3202] =3D "fixed-version: Fixed after version 5.18rc=
1"
+
+CVE_STATUS[CVE-2022-32250] =3D "fixed-version: Fixed after version 5.19r=
c1"
+
+CVE_STATUS[CVE-2022-32296] =3D "fixed-version: Fixed after version 5.18r=
c6"
+
+# CVE-2022-3238 has no known resolution
+
+CVE_STATUS[CVE-2022-3239] =3D "fixed-version: Fixed after version 5.18rc=
1"
+
+CVE_STATUS[CVE-2022-32981] =3D "fixed-version: Fixed after version 5.19r=
c2"
+
+CVE_STATUS[CVE-2022-3303] =3D "fixed-version: Fixed after version 6.0rc5=
"
+
+CVE_STATUS[CVE-2022-3344] =3D "fixed-version: Fixed after version 6.1rc7=
"
+
+CVE_STATUS[CVE-2022-33740] =3D "fixed-version: Fixed after version 5.19r=
c6"
+
+CVE_STATUS[CVE-2022-33741] =3D "fixed-version: Fixed after version 5.19r=
c6"
+
+CVE_STATUS[CVE-2022-33742] =3D "fixed-version: Fixed after version 5.19r=
c6"
+
+CVE_STATUS[CVE-2022-33743] =3D "fixed-version: Fixed after version 5.19r=
c6"
+
+CVE_STATUS[CVE-2022-33744] =3D "fixed-version: Fixed after version 5.19r=
c6"
+
+CVE_STATUS[CVE-2022-33981] =3D "fixed-version: Fixed after version 5.18r=
c5"
+
+CVE_STATUS[CVE-2022-3424] =3D "cpe-stable-backport: Backported in 6.1.2"
+
+CVE_STATUS[CVE-2022-3435] =3D "fixed-version: Fixed after version 6.1rc1=
"
+
+CVE_STATUS[CVE-2022-34494] =3D "fixed-version: Fixed after version 5.19r=
c1"
+
+CVE_STATUS[CVE-2022-34495] =3D "fixed-version: Fixed after version 5.19r=
c1"
+
+CVE_STATUS[CVE-2022-34918] =3D "fixed-version: Fixed after version 5.19r=
c6"
+
+CVE_STATUS[CVE-2022-3521] =3D "fixed-version: Fixed after version 6.1rc1=
"
+
+CVE_STATUS[CVE-2022-3522] =3D "fixed-version: Fixed after version 6.1rc1=
"
+
+CVE_STATUS[CVE-2022-3523] =3D "fixed-version: Fixed after version 6.1rc1=
"
+
+CVE_STATUS[CVE-2022-3524] =3D "fixed-version: Fixed after version 6.1rc1=
"
+
+CVE_STATUS[CVE-2022-3526] =3D "fixed-version: Fixed after version 5.18rc=
3"
+
+CVE_STATUS[CVE-2022-3531] =3D "cpe-stable-backport: Backported in 6.1.2"
+
+CVE_STATUS[CVE-2022-3532] =3D "cpe-stable-backport: Backported in 6.1.2"
+
+# CVE-2022-3533 has no known resolution
+
+CVE_STATUS[CVE-2022-3534] =3D "cpe-stable-backport: Backported in 6.1.2"
+
+CVE_STATUS[CVE-2022-3535] =3D "fixed-version: Fixed after version 6.1rc1=
"
+
+CVE_STATUS[CVE-2022-3541] =3D "fixed-version: Fixed after version 6.1rc1=
"
+
+CVE_STATUS[CVE-2022-3542] =3D "fixed-version: Fixed after version 6.1rc1=
"
+
+CVE_STATUS[CVE-2022-3543] =3D "fixed-version: Fixed after version 6.1rc1=
"
+
+# CVE-2022-3544 has no known resolution
+
+CVE_STATUS[CVE-2022-3545] =3D "fixed-version: Fixed after version 6.0rc1=
"
+
+CVE_STATUS[CVE-2022-3564] =3D "fixed-version: Fixed after version 6.1rc4=
"
+
+CVE_STATUS[CVE-2022-3565] =3D "fixed-version: Fixed after version 6.1rc1=
"
+
+CVE_STATUS[CVE-2022-3566] =3D "fixed-version: Fixed after version 6.1rc1=
"
+
+CVE_STATUS[CVE-2022-3567] =3D "fixed-version: Fixed after version 6.1rc1=
"
+
+CVE_STATUS[CVE-2022-3577] =3D "fixed-version: Fixed after version 5.19rc=
1"
+
+CVE_STATUS[CVE-2022-3586] =3D "fixed-version: Fixed after version 6.0rc5=
"
+
+CVE_STATUS[CVE-2022-3594] =3D "fixed-version: Fixed after version 6.1rc1=
"
+
+CVE_STATUS[CVE-2022-3595] =3D "fixed-version: Fixed after version 6.1rc1=
"
+
+# CVE-2022-3606 has no known resolution
+
+CVE_STATUS[CVE-2022-36123] =3D "fixed-version: Fixed after version 5.19r=
c6"
+
+CVE_STATUS[CVE-2022-3619] =3D "fixed-version: Fixed after version 6.1rc4=
"
+
+CVE_STATUS[CVE-2022-3621] =3D "fixed-version: Fixed after version 6.1rc1=
"
+
+CVE_STATUS[CVE-2022-3623] =3D "fixed-version: Fixed after version 6.1rc1=
"
+
+CVE_STATUS[CVE-2022-3624] =3D "fixed-version: Fixed after version 6.0rc1=
"
+
+CVE_STATUS[CVE-2022-3625] =3D "fixed-version: Fixed after version 6.0rc1=
"
+
+CVE_STATUS[CVE-2022-3628] =3D "fixed-version: Fixed after version 6.1rc5=
"
+
+CVE_STATUS[CVE-2022-36280] =3D "cpe-stable-backport: Backported in 6.1.4=
"
+
+CVE_STATUS[CVE-2022-3629] =3D "fixed-version: Fixed after version 6.0rc1=
"
+
+CVE_STATUS[CVE-2022-3630] =3D "fixed-version: Fixed after version 6.0rc1=
"
+
+CVE_STATUS[CVE-2022-3633] =3D "fixed-version: Fixed after version 6.0rc1=
"
+
+CVE_STATUS[CVE-2022-3635] =3D "fixed-version: Fixed after version 6.0rc1=
"
+
+CVE_STATUS[CVE-2022-3636] =3D "fixed-version: Fixed after version 5.19rc=
1"
+
+CVE_STATUS[CVE-2022-3640] =3D "fixed-version: Fixed after version 6.1rc4=
"
+
+# CVE-2022-36402 has no known resolution
+
+# CVE-2022-3642 has no known resolution
+
+CVE_STATUS[CVE-2022-3643] =3D "fixed-version: Fixed after version 6.1"
+
+CVE_STATUS[CVE-2022-3646] =3D "fixed-version: Fixed after version 6.1rc1=
"
+
+CVE_STATUS[CVE-2022-3649] =3D "fixed-version: Fixed after version 6.1rc1=
"
+
+CVE_STATUS[CVE-2022-36879] =3D "fixed-version: Fixed after version 5.19r=
c8"
+
+CVE_STATUS[CVE-2022-36946] =3D "fixed-version: Fixed after version 5.19"
+
+CVE_STATUS[CVE-2022-3707] =3D "cpe-stable-backport: Backported in 6.1.5"
+
+# CVE-2022-38096 has no known resolution
+
+CVE_STATUS[CVE-2022-38457] =3D "cpe-stable-backport: Backported in 6.1.7=
"
+
+CVE_STATUS[CVE-2022-3903] =3D "fixed-version: Fixed after version 6.1rc2=
"
+
+CVE_STATUS[CVE-2022-3910] =3D "fixed-version: Fixed after version 6.0rc6=
"
+
+CVE_STATUS[CVE-2022-39188] =3D "fixed-version: Fixed after version 5.19r=
c8"
+
+CVE_STATUS[CVE-2022-39189] =3D "fixed-version: Fixed after version 5.19r=
c2"
+
+CVE_STATUS[CVE-2022-39190] =3D "fixed-version: Fixed after version 6.0rc=
3"
+
+CVE_STATUS[CVE-2022-3977] =3D "fixed-version: Fixed after version 6.1rc1=
"
+
+CVE_STATUS[CVE-2022-39842] =3D "fixed-version: Fixed after version 5.19r=
c4"
+
+CVE_STATUS[CVE-2022-40133] =3D "cpe-stable-backport: Backported in 6.1.7=
"
+
+CVE_STATUS[CVE-2022-40307] =3D "fixed-version: Fixed after version 6.0rc=
5"
+
+CVE_STATUS[CVE-2022-40476] =3D "fixed-version: Fixed after version 5.19r=
c4"
+
+CVE_STATUS[CVE-2022-40768] =3D "fixed-version: Fixed after version 6.1rc=
1"
+
+CVE_STATUS[CVE-2022-4095] =3D "fixed-version: Fixed after version 6.0rc4=
"
+
+CVE_STATUS[CVE-2022-41218] =3D "cpe-stable-backport: Backported in 6.1.4=
"
+
+CVE_STATUS[CVE-2022-41222] =3D "fixed-version: Fixed after version 5.14r=
c1"
+
+CVE_STATUS[CVE-2022-4127] =3D "fixed-version: Fixed after version 5.19rc=
6"
+
+CVE_STATUS[CVE-2022-4128] =3D "fixed-version: Fixed after version 5.19rc=
7"
+
+CVE_STATUS[CVE-2022-4129] =3D "fixed-version: Fixed after version 6.1rc6=
"
+
+CVE_STATUS[CVE-2022-4139] =3D "fixed-version: Fixed after version 6.1rc8=
"
+
+CVE_STATUS[CVE-2022-41674] =3D "fixed-version: Fixed after version 6.1rc=
1"
+
+# CVE-2022-41848 has no known resolution
+
+CVE_STATUS[CVE-2022-41849] =3D "fixed-version: Fixed after version 6.1rc=
1"
+
+CVE_STATUS[CVE-2022-41850] =3D "fixed-version: Fixed after version 6.1rc=
1"
+
+CVE_STATUS[CVE-2022-41858] =3D "fixed-version: Fixed after version 5.18r=
c2"
+
+CVE_STATUS[CVE-2022-42328] =3D "fixed-version: Fixed after version 6.1"
+
+CVE_STATUS[CVE-2022-42329] =3D "fixed-version: Fixed after version 6.1"
+
+CVE_STATUS[CVE-2022-42432] =3D "fixed-version: Fixed after version 6.0rc=
7"
+
+CVE_STATUS[CVE-2022-4269] =3D "cpe-stable-backport: Backported in 6.1.22=
"
+
+CVE_STATUS[CVE-2022-42703] =3D "fixed-version: Fixed after version 6.0rc=
4"
+
+CVE_STATUS[CVE-2022-42719] =3D "fixed-version: Fixed after version 6.1rc=
1"
+
+CVE_STATUS[CVE-2022-42720] =3D "fixed-version: Fixed after version 6.1rc=
1"
+
+CVE_STATUS[CVE-2022-42721] =3D "fixed-version: Fixed after version 6.1rc=
1"
+
+CVE_STATUS[CVE-2022-42722] =3D "fixed-version: Fixed after version 6.1rc=
1"
+
+CVE_STATUS[CVE-2022-42895] =3D "fixed-version: Fixed after version 6.1rc=
4"
+
+CVE_STATUS[CVE-2022-42896] =3D "fixed-version: Fixed after version 6.1rc=
4"
+
+CVE_STATUS[CVE-2022-43750] =3D "fixed-version: Fixed after version 6.1rc=
1"
+
+CVE_STATUS[CVE-2022-4378] =3D "fixed-version: Fixed after version 6.1"
+
+CVE_STATUS[CVE-2022-4379] =3D "cpe-stable-backport: Backported in 6.1.3"
+
+CVE_STATUS[CVE-2022-4382] =3D "cpe-stable-backport: Backported in 6.1.8"
+
+CVE_STATUS[CVE-2022-43945] =3D "fixed-version: Fixed after version 6.1rc=
1"
+
+# CVE-2022-44032 has no known resolution
+
+# CVE-2022-44033 has no known resolution
+
+# CVE-2022-44034 has no known resolution
+
+# CVE-2022-4543 has no known resolution
+
+CVE_STATUS[CVE-2022-45869] =3D "fixed-version: Fixed after version 6.1rc=
7"
+
+# CVE-2022-45884 has no known resolution
+
+# CVE-2022-45885 has no known resolution
+
+# CVE-2022-45886 has no known resolution
+
+# CVE-2022-45887 has no known resolution
+
+# CVE-2022-45888 needs backporting (fixed from 6.2rc1)
+
+# CVE-2022-45919 has no known resolution
+
+CVE_STATUS[CVE-2022-45934] =3D "fixed-version: Fixed after version 6.1"
+
+CVE_STATUS[CVE-2022-4662] =3D "fixed-version: Fixed after version 6.0rc4=
"
+
+CVE_STATUS[CVE-2022-4696] =3D "fixed-version: Fixed after version 5.12rc=
1"
+
+CVE_STATUS[CVE-2022-4744] =3D "fixed-version: Fixed after version 5.16rc=
7"
+
+CVE_STATUS[CVE-2022-47518] =3D "fixed-version: Fixed after version 6.1rc=
8"
+
+CVE_STATUS[CVE-2022-47519] =3D "fixed-version: Fixed after version 6.1rc=
8"
+
+CVE_STATUS[CVE-2022-47520] =3D "fixed-version: Fixed after version 6.1rc=
8"
+
+CVE_STATUS[CVE-2022-47521] =3D "fixed-version: Fixed after version 6.1rc=
8"
+
+CVE_STATUS[CVE-2022-47929] =3D "cpe-stable-backport: Backported in 6.1.6=
"
+
+CVE_STATUS[CVE-2022-47938] =3D "fixed-version: Fixed after version 6.0rc=
1"
+
+CVE_STATUS[CVE-2022-47939] =3D "fixed-version: Fixed after version 6.0rc=
1"
+
+CVE_STATUS[CVE-2022-47940] =3D "fixed-version: Fixed after version 5.19r=
c1"
+
+CVE_STATUS[CVE-2022-47941] =3D "fixed-version: Fixed after version 6.0rc=
1"
+
+CVE_STATUS[CVE-2022-47942] =3D "fixed-version: Fixed after version 6.0rc=
1"
+
+CVE_STATUS[CVE-2022-47943] =3D "fixed-version: Fixed after version 6.0rc=
1"
+
+CVE_STATUS[CVE-2022-47946] =3D "fixed-version: Fixed after version 5.12r=
c2"
+
+CVE_STATUS[CVE-2022-4842] =3D "cpe-stable-backport: Backported in 6.1.8"
+
+CVE_STATUS[CVE-2022-48423] =3D "cpe-stable-backport: Backported in 6.1.3=
"
+
+CVE_STATUS[CVE-2022-48424] =3D "cpe-stable-backport: Backported in 6.1.3=
"
+
+CVE_STATUS[CVE-2022-48425] =3D "cpe-stable-backport: Backported in 6.1.3=
3"
+
+CVE_STATUS[CVE-2022-48502] =3D "cpe-stable-backport: Backported in 6.1.4=
0"
+
+CVE_STATUS[CVE-2023-0030] =3D "fixed-version: Fixed after version 5.0rc1=
"
+
+CVE_STATUS[CVE-2023-0045] =3D "cpe-stable-backport: Backported in 6.1.5"
+
+CVE_STATUS[CVE-2023-0047] =3D "fixed-version: Fixed after version 5.16rc=
1"
+
+CVE_STATUS[CVE-2023-0122] =3D "fixed-version: Fixed after version 6.0rc4=
"
+
+# CVE-2023-0160 has no known resolution
+
+CVE_STATUS[CVE-2023-0179] =3D "cpe-stable-backport: Backported in 6.1.7"
+
+CVE_STATUS[CVE-2023-0210] =3D "cpe-stable-backport: Backported in 6.1.5"
+
+CVE_STATUS[CVE-2023-0240] =3D "fixed-version: Fixed after version 5.10rc=
1"
+
+CVE_STATUS[CVE-2023-0266] =3D "cpe-stable-backport: Backported in 6.1.6"
+
+CVE_STATUS[CVE-2023-0386] =3D "cpe-stable-backport: Backported in 6.1.9"
+
+CVE_STATUS[CVE-2023-0394] =3D "cpe-stable-backport: Backported in 6.1.7"
+
+CVE_STATUS[CVE-2023-0458] =3D "cpe-stable-backport: Backported in 6.1.8"
+
+CVE_STATUS[CVE-2023-0459] =3D "cpe-stable-backport: Backported in 6.1.14=
"
+
+CVE_STATUS[CVE-2023-0461] =3D "cpe-stable-backport: Backported in 6.1.5"
+
+CVE_STATUS[CVE-2023-0468] =3D "fixed-version: Fixed after version 6.1rc7=
"
+
+CVE_STATUS[CVE-2023-0469] =3D "fixed-version: Fixed after version 6.1rc7=
"
+
+CVE_STATUS[CVE-2023-0590] =3D "fixed-version: Fixed after version 6.1rc2=
"
+
+# CVE-2023-0597 needs backporting (fixed from 6.2rc1)
+
+CVE_STATUS[CVE-2023-0615] =3D "fixed-version: Fixed after version 6.1rc3=
"
+
+CVE_STATUS[CVE-2023-1032] =3D "cpe-stable-backport: Backported in 6.1.16=
"
+
+CVE_STATUS[CVE-2023-1073] =3D "cpe-stable-backport: Backported in 6.1.9"
+
+CVE_STATUS[CVE-2023-1074] =3D "cpe-stable-backport: Backported in 6.1.9"
+
+CVE_STATUS[CVE-2023-1075] =3D "cpe-stable-backport: Backported in 6.1.11=
"
+
+CVE_STATUS[CVE-2023-1076] =3D "cpe-stable-backport: Backported in 6.1.16=
"
+
+CVE_STATUS[CVE-2023-1077] =3D "cpe-stable-backport: Backported in 6.1.16=
"
+
+CVE_STATUS[CVE-2023-1078] =3D "cpe-stable-backport: Backported in 6.1.12=
"
+
+CVE_STATUS[CVE-2023-1079] =3D "cpe-stable-backport: Backported in 6.1.16=
"
+
+CVE_STATUS[CVE-2023-1095] =3D "fixed-version: Fixed after version 6.0rc1=
"
+
+CVE_STATUS[CVE-2023-1118] =3D "cpe-stable-backport: Backported in 6.1.16=
"
+
+CVE_STATUS[CVE-2023-1192] =3D "cpe-stable-backport: Backported in 6.1.33=
"
+
+# CVE-2023-1193 has no known resolution
+
+# CVE-2023-1194 has no known resolution
+
+CVE_STATUS[CVE-2023-1195] =3D "fixed-version: Fixed after version 6.1rc3=
"
+
+# CVE-2023-1206 has no known resolution
+
+CVE_STATUS[CVE-2023-1249] =3D "fixed-version: Fixed after version 5.18rc=
1"
+
+CVE_STATUS[CVE-2023-1252] =3D "fixed-version: Fixed after version 5.16rc=
1"
+
+CVE_STATUS[CVE-2023-1281] =3D "cpe-stable-backport: Backported in 6.1.13=
"
+
+CVE_STATUS[CVE-2023-1295] =3D "fixed-version: Fixed after version 5.12rc=
1"
+
+CVE_STATUS[CVE-2023-1380] =3D "cpe-stable-backport: Backported in 6.1.27=
"
+
+CVE_STATUS[CVE-2023-1382] =3D "fixed-version: Fixed after version 6.1rc7=
"
+
+CVE_STATUS[CVE-2023-1390] =3D "fixed-version: Fixed after version 5.11rc=
4"
+
+CVE_STATUS[CVE-2023-1513] =3D "cpe-stable-backport: Backported in 6.1.13=
"
+
+CVE_STATUS[CVE-2023-1582] =3D "fixed-version: Fixed after version 5.17rc=
4"
+
+CVE_STATUS[CVE-2023-1583] =3D "cpe-stable-backport: Backported in 6.1.22=
"
+
+CVE_STATUS[CVE-2023-1611] =3D "cpe-stable-backport: Backported in 6.1.23=
"
+
+CVE_STATUS[CVE-2023-1637] =3D "fixed-version: Fixed after version 5.18rc=
2"
+
+CVE_STATUS[CVE-2023-1652] =3D "cpe-stable-backport: Backported in 6.1.9"
+
+CVE_STATUS[CVE-2023-1670] =3D "cpe-stable-backport: Backported in 6.1.22=
"
+
+CVE_STATUS[CVE-2023-1829] =3D "cpe-stable-backport: Backported in 6.1.18=
"
+
+CVE_STATUS[CVE-2023-1838] =3D "fixed-version: Fixed after version 5.18"
+
+CVE_STATUS[CVE-2023-1855] =3D "cpe-stable-backport: Backported in 6.1.21=
"
+
+CVE_STATUS[CVE-2023-1859] =3D "cpe-stable-backport: Backported in 6.1.25=
"
+
+CVE_STATUS[CVE-2023-1872] =3D "fixed-version: Fixed after version 5.18rc=
2"
+
+CVE_STATUS[CVE-2023-1989] =3D "cpe-stable-backport: Backported in 6.1.22=
"
+
+CVE_STATUS[CVE-2023-1990] =3D "cpe-stable-backport: Backported in 6.1.21=
"
+
+CVE_STATUS[CVE-2023-1998] =3D "cpe-stable-backport: Backported in 6.1.16=
"
+
+CVE_STATUS[CVE-2023-2002] =3D "cpe-stable-backport: Backported in 6.1.27=
"
+
+CVE_STATUS[CVE-2023-2006] =3D "fixed-version: Fixed after version 6.1rc7=
"
+
+CVE_STATUS[CVE-2023-2007] =3D "fixed-version: Fixed after version 6.0rc1=
"
+
+CVE_STATUS[CVE-2023-2008] =3D "fixed-version: Fixed after version 5.19rc=
4"
+
+CVE_STATUS[CVE-2023-2019] =3D "fixed-version: Fixed after version 6.0rc1=
"
+
+# CVE-2023-20593 has no known resolution
+
+CVE_STATUS[CVE-2023-20928] =3D "fixed-version: Fixed after version 6.0rc=
1"
+
+# CVE-2023-20937 has no known resolution
+
+CVE_STATUS[CVE-2023-20938] =3D "fixed-version: Fixed after version 5.18r=
c5"
+
+# CVE-2023-20941 has no known resolution
+
+CVE_STATUS[CVE-2023-21102] =3D "cpe-stable-backport: Backported in 6.1.8=
"
+
+CVE_STATUS[CVE-2023-21106] =3D "cpe-stable-backport: Backported in 6.1.9=
"
+
+CVE_STATUS[CVE-2023-2124] =3D "cpe-stable-backport: Backported in 6.1.33=
"
+
+CVE_STATUS[CVE-2023-21255] =3D "cpe-stable-backport: Backported in 6.1.3=
1"
+
+CVE_STATUS[CVE-2023-2156] =3D "cpe-stable-backport: Backported in 6.1.26=
"
+
+CVE_STATUS[CVE-2023-2162] =3D "cpe-stable-backport: Backported in 6.1.11=
"
+
+CVE_STATUS[CVE-2023-2163] =3D "cpe-stable-backport: Backported in 6.1.26=
"
+
+CVE_STATUS[CVE-2023-2166] =3D "fixed-version: Fixed after version 6.1"
+
+# CVE-2023-2176 needs backporting (fixed from 6.3rc1)
+
+CVE_STATUS[CVE-2023-2177] =3D "fixed-version: Fixed after version 5.19"
+
+CVE_STATUS[CVE-2023-2194] =3D "cpe-stable-backport: Backported in 6.1.22=
"
+
+CVE_STATUS[CVE-2023-2235] =3D "cpe-stable-backport: Backported in 6.1.21=
"
+
+CVE_STATUS[CVE-2023-2236] =3D "fixed-version: Fixed after version 6.1rc7=
"
+
+CVE_STATUS[CVE-2023-2248] =3D "cpe-stable-backport: Backported in 6.1.26=
"
+
+CVE_STATUS[CVE-2023-2269] =3D "cpe-stable-backport: Backported in 6.1.28=
"
+
+CVE_STATUS[CVE-2023-22995] =3D "fixed-version: Fixed after version 5.17r=
c1"
+
+CVE_STATUS[CVE-2023-22996] =3D "fixed-version: Fixed after version 5.18r=
c1"
+
+CVE_STATUS[CVE-2023-22997] =3D "cpe-stable-backport: Backported in 6.1.2=
"
+
+CVE_STATUS[CVE-2023-22998] =3D "fixed-version: Fixed after version 6.0rc=
1"
+
+CVE_STATUS[CVE-2023-22999] =3D "fixed-version: Fixed after version 5.17r=
c1"
+
+CVE_STATUS[CVE-2023-23000] =3D "fixed-version: Fixed after version 5.17r=
c1"
+
+CVE_STATUS[CVE-2023-23001] =3D "fixed-version: Fixed after version 5.17r=
c1"
+
+CVE_STATUS[CVE-2023-23002] =3D "fixed-version: Fixed after version 5.17r=
c1"
+
+CVE_STATUS[CVE-2023-23003] =3D "fixed-version: Fixed after version 5.16r=
c6"
+
+CVE_STATUS[CVE-2023-23004] =3D "fixed-version: Fixed after version 5.19r=
c1"
+
+# CVE-2023-23005 needs backporting (fixed from 6.2rc1)
+
+CVE_STATUS[CVE-2023-23006] =3D "fixed-version: Fixed after version 5.16r=
c8"
+
+# CVE-2023-23039 has no known resolution
+
+CVE_STATUS[CVE-2023-23454] =3D "cpe-stable-backport: Backported in 6.1.5=
"
+
+CVE_STATUS[CVE-2023-23455] =3D "cpe-stable-backport: Backported in 6.1.5=
"
+
+CVE_STATUS[CVE-2023-23559] =3D "cpe-stable-backport: Backported in 6.1.9=
"
+
+CVE_STATUS[CVE-2023-23586] =3D "fixed-version: Fixed after version 5.12r=
c1"
+
+# CVE-2023-2430 needs backporting (fixed from 6.2rc5)
+
+CVE_STATUS[CVE-2023-2483] =3D "cpe-stable-backport: Backported in 6.1.22=
"
+
+CVE_STATUS[CVE-2023-25012] =3D "cpe-stable-backport: Backported in 6.1.1=
6"
+
+CVE_STATUS[CVE-2023-2513] =3D "fixed-version: Fixed after version 6.0rc1=
"
+
+CVE_STATUS[CVE-2023-2598] =3D "fixed-version: only affects 6.3rc1 onward=
s"
+
+# CVE-2023-26242 has no known resolution
+
+CVE_STATUS[CVE-2023-26544] =3D "cpe-stable-backport: Backported in 6.1.3=
"
+
+CVE_STATUS[CVE-2023-26545] =3D "cpe-stable-backport: Backported in 6.1.1=
3"
+
+CVE_STATUS[CVE-2023-26605] =3D "fixed-version: Fixed after version 6.1rc=
7"
+
+CVE_STATUS[CVE-2023-26606] =3D "cpe-stable-backport: Backported in 6.1.2=
"
+
+CVE_STATUS[CVE-2023-26607] =3D "fixed-version: Fixed after version 6.1rc=
1"
+
+CVE_STATUS[CVE-2023-28327] =3D "fixed-version: Fixed after version 6.1"
+
+CVE_STATUS[CVE-2023-28328] =3D "cpe-stable-backport: Backported in 6.1.2=
"
+
+CVE_STATUS[CVE-2023-28410] =3D "fixed-version: Fixed after version 5.19r=
c1"
+
+CVE_STATUS[CVE-2023-28464] =3D "fixed-version: only affects 6.3rc1 onwar=
ds"
+
+CVE_STATUS[CVE-2023-28466] =3D "cpe-stable-backport: Backported in 6.1.2=
0"
+
+CVE_STATUS[CVE-2023-2860] =3D "fixed-version: Fixed after version 6.0rc5=
"
+
+CVE_STATUS[CVE-2023-28772] =3D "fixed-version: Fixed after version 5.14r=
c1"
+
+CVE_STATUS[CVE-2023-28866] =3D "cpe-stable-backport: Backported in 6.1.2=
2"
+
+CVE_STATUS[CVE-2023-2898] =3D "cpe-stable-backport: Backported in 6.1.39=
"
+
+CVE_STATUS[CVE-2023-2985] =3D "cpe-stable-backport: Backported in 6.1.16=
"
+
+CVE_STATUS[CVE-2023-3006] =3D "fixed-version: Fixed after version 6.1rc1=
"
+
+# Skipping CVE-2023-3022, no affected_versions
+
+CVE_STATUS[CVE-2023-30456] =3D "cpe-stable-backport: Backported in 6.1.2=
1"
+
+CVE_STATUS[CVE-2023-30772] =3D "cpe-stable-backport: Backported in 6.1.2=
2"
+
+CVE_STATUS[CVE-2023-3090] =3D "cpe-stable-backport: Backported in 6.1.30=
"
+
+CVE_STATUS[CVE-2023-3106] =3D "fixed-version: Fixed after version 4.8rc7=
"
+
+# Skipping CVE-2023-3108, no affected_versions
+
+# CVE-2023-31081 has no known resolution
+
+# CVE-2023-31082 has no known resolution
+
+# CVE-2023-31083 has no known resolution
+
+# CVE-2023-31084 needs backporting (fixed from 6.4rc3)
+
+# CVE-2023-31085 has no known resolution
+
+CVE_STATUS[CVE-2023-3111] =3D "fixed-version: Fixed after version 6.0rc2=
"
+
+CVE_STATUS[CVE-2023-3117] =3D "cpe-stable-backport: Backported in 6.1.35=
"
+
+CVE_STATUS[CVE-2023-31248] =3D "cpe-stable-backport: Backported in 6.1.3=
9"
+
+CVE_STATUS[CVE-2023-3141] =3D "cpe-stable-backport: Backported in 6.1.30=
"
+
+CVE_STATUS[CVE-2023-31436] =3D "cpe-stable-backport: Backported in 6.1.2=
6"
+
+CVE_STATUS[CVE-2023-3159] =3D "fixed-version: Fixed after version 5.18rc=
6"
+
+CVE_STATUS[CVE-2023-3161] =3D "cpe-stable-backport: Backported in 6.1.11=
"
+
+CVE_STATUS[CVE-2023-3212] =3D "cpe-stable-backport: Backported in 6.1.33=
"
+
+CVE_STATUS[CVE-2023-3220] =3D "cpe-stable-backport: Backported in 6.1.16=
"
+
+CVE_STATUS[CVE-2023-32233] =3D "cpe-stable-backport: Backported in 6.1.2=
8"
+
+CVE_STATUS[CVE-2023-32247] =3D "cpe-stable-backport: Backported in 6.1.2=
9"
+
+CVE_STATUS[CVE-2023-32248] =3D "cpe-stable-backport: Backported in 6.1.2=
8"
+
+CVE_STATUS[CVE-2023-32250] =3D "cpe-stable-backport: Backported in 6.1.2=
9"
+
+CVE_STATUS[CVE-2023-32252] =3D "cpe-stable-backport: Backported in 6.1.2=
9"
+
+CVE_STATUS[CVE-2023-32254] =3D "cpe-stable-backport: Backported in 6.1.2=
8"
+
+CVE_STATUS[CVE-2023-32257] =3D "cpe-stable-backport: Backported in 6.1.2=
9"
+
+CVE_STATUS[CVE-2023-32258] =3D "cpe-stable-backport: Backported in 6.1.2=
9"
+
+CVE_STATUS[CVE-2023-32269] =3D "cpe-stable-backport: Backported in 6.1.1=
1"
+
+CVE_STATUS[CVE-2023-3268] =3D "cpe-stable-backport: Backported in 6.1.28=
"
+
+CVE_STATUS[CVE-2023-3269] =3D "cpe-stable-backport: Backported in 6.1.37=
"
+
+CVE_STATUS[CVE-2023-3312] =3D "fixed-version: only affects 6.2rc1 onward=
s"
+
+CVE_STATUS[CVE-2023-3317] =3D "fixed-version: only affects 6.2rc1 onward=
s"
+
+CVE_STATUS[CVE-2023-33203] =3D "cpe-stable-backport: Backported in 6.1.2=
2"
+
+# CVE-2023-33250 has no known resolution
+
+CVE_STATUS[CVE-2023-33288] =3D "cpe-stable-backport: Backported in 6.1.2=
2"
+
+CVE_STATUS[CVE-2023-3338] =3D "fixed-version: Fixed after version 6.1rc1=
"
+
+CVE_STATUS[CVE-2023-3355] =3D "cpe-stable-backport: Backported in 6.1.16=
"
+
+CVE_STATUS[CVE-2023-3357] =3D "cpe-stable-backport: Backported in 6.1.2"
+
+CVE_STATUS[CVE-2023-3358] =3D "cpe-stable-backport: Backported in 6.1.9"
+
+CVE_STATUS[CVE-2023-3359] =3D "cpe-stable-backport: Backported in 6.1.11=
"
+
+CVE_STATUS[CVE-2023-3389] =3D "fixed-version: Fixed after version 6.0rc1=
"
+
+CVE_STATUS[CVE-2023-3390] =3D "cpe-stable-backport: Backported in 6.1.35=
"
+
+CVE_STATUS[CVE-2023-33951] =3D "cpe-stable-backport: Backported in 6.1.1=
3"
+
+CVE_STATUS[CVE-2023-33952] =3D "cpe-stable-backport: Backported in 6.1.1=
3"
+
+# CVE-2023-3397 has no known resolution
+
+CVE_STATUS[CVE-2023-34255] =3D "cpe-stable-backport: Backported in 6.1.3=
3"
+
+CVE_STATUS[CVE-2023-34256] =3D "cpe-stable-backport: Backported in 6.1.2=
9"
+
+CVE_STATUS[CVE-2023-3439] =3D "fixed-version: Fixed after version 5.18rc=
5"
+
+CVE_STATUS[CVE-2023-35001] =3D "cpe-stable-backport: Backported in 6.1.3=
9"
+
+CVE_STATUS[CVE-2023-3567] =3D "cpe-stable-backport: Backported in 6.1.11=
"
+
+# CVE-2023-35693 has no known resolution
+
+CVE_STATUS[CVE-2023-35788] =3D "cpe-stable-backport: Backported in 6.1.3=
3"
+
+CVE_STATUS[CVE-2023-35823] =3D "cpe-stable-backport: Backported in 6.1.2=
8"
+
+CVE_STATUS[CVE-2023-35824] =3D "cpe-stable-backport: Backported in 6.1.2=
8"
+
+CVE_STATUS[CVE-2023-35826] =3D "cpe-stable-backport: Backported in 6.1.2=
8"
+
+# CVE-2023-35827 has no known resolution
+
+CVE_STATUS[CVE-2023-35828] =3D "cpe-stable-backport: Backported in 6.1.2=
8"
+
+CVE_STATUS[CVE-2023-35829] =3D "cpe-stable-backport: Backported in 6.1.2=
8"
+
+CVE_STATUS[CVE-2023-3609] =3D "cpe-stable-backport: Backported in 6.1.35=
"
+
+CVE_STATUS[CVE-2023-3610] =3D "cpe-stable-backport: Backported in 6.1.36=
"
+
+CVE_STATUS[CVE-2023-3611] =3D "cpe-stable-backport: Backported in 6.1.40=
"
+
+# CVE-2023-3640 has no known resolution
+
+# CVE-2023-37453 has no known resolution
+
+# CVE-2023-37454 has no known resolution
+
+# CVE-2023-3772 has no known resolution
+
+# CVE-2023-3773 has no known resolution
+
+CVE_STATUS[CVE-2023-3776] =3D "cpe-stable-backport: Backported in 6.1.40=
"
+
+CVE_STATUS[CVE-2023-3812] =3D "fixed-version: Fixed after version 6.1rc4=
"
+
+CVE_STATUS[CVE-2023-38409] =3D "cpe-stable-backport: Backported in 6.1.2=
5"
+
+CVE_STATUS[CVE-2023-38426] =3D "cpe-stable-backport: Backported in 6.1.3=
0"
+
+CVE_STATUS[CVE-2023-38427] =3D "cpe-stable-backport: Backported in 6.1.3=
4"
+
+CVE_STATUS[CVE-2023-38428] =3D "cpe-stable-backport: Backported in 6.1.3=
0"
+
+CVE_STATUS[CVE-2023-38429] =3D "cpe-stable-backport: Backported in 6.1.3=
0"
+
+CVE_STATUS[CVE-2023-38430] =3D "cpe-stable-backport: Backported in 6.1.3=
5"
+
+CVE_STATUS[CVE-2023-38431] =3D "cpe-stable-backport: Backported in 6.1.3=
4"
+
+CVE_STATUS[CVE-2023-38432] =3D "cpe-stable-backport: Backported in 6.1.3=
6"
+
+CVE_STATUS[CVE-2023-3863] =3D "cpe-stable-backport: Backported in 6.1.39=
"
+
diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.4.inc b/meta/recip=
es-kernel/linux/cve-exclusion_6.4.inc
new file mode 100644
index 00000000000..98e9ee25a5b
--- /dev/null
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.4.inc
@@ -0,0 +1,4967 @@
+# Auto-generated CVE metadata, DO NOT EDIT BY HAND.
+# Generated at 2023-08-09 15:51:30.073765 for version 6.4.9
+
+CVE_STATUS[CVE-2003-1604] =3D "fixed-version: Fixed after version 2.6.12=
rc2"
+
+CVE_STATUS[CVE-2004-0230] =3D "fixed-version: Fixed after version 3.6rc1=
"
+
+# CVE-2005-3660 has no known resolution
+
+CVE_STATUS[CVE-2006-3635] =3D "fixed-version: Fixed after version 2.6.26=
rc5"
+
+CVE_STATUS[CVE-2006-5331] =3D "fixed-version: Fixed after version 2.6.19=
rc3"
+
+CVE_STATUS[CVE-2006-6128] =3D "fixed-version: Fixed after version 2.6.19=
rc2"
+
+# CVE-2007-3719 has no known resolution
+
+CVE_STATUS[CVE-2007-4774] =3D "fixed-version: Fixed after version 2.6.12=
rc2"
+
+CVE_STATUS[CVE-2007-6761] =3D "fixed-version: Fixed after version 2.6.24=
rc6"
+
+CVE_STATUS[CVE-2007-6762] =3D "fixed-version: Fixed after version 2.6.20=
rc5"
+
+# CVE-2008-2544 has no known resolution
+
+# CVE-2008-4609 has no known resolution
+
+CVE_STATUS[CVE-2008-7316] =3D "fixed-version: Fixed after version 2.6.25=
rc1"
+
+CVE_STATUS[CVE-2009-2692] =3D "fixed-version: Fixed after version 2.6.31=
rc6"
+
+CVE_STATUS[CVE-2010-0008] =3D "fixed-version: Fixed after version 2.6.23=
rc9"
+
+CVE_STATUS[CVE-2010-3432] =3D "fixed-version: Fixed after version 2.6.36=
rc5"
+
+# CVE-2010-4563 has no known resolution
+
+CVE_STATUS[CVE-2010-4648] =3D "fixed-version: Fixed after version 2.6.37=
rc6"
+
+CVE_STATUS[CVE-2010-5313] =3D "fixed-version: Fixed after version 2.6.38=
rc1"
+
+# CVE-2010-5321 has no known resolution
+
+CVE_STATUS[CVE-2010-5328] =3D "fixed-version: Fixed after version 2.6.35=
rc1"
+
+CVE_STATUS[CVE-2010-5329] =3D "fixed-version: Fixed after version 2.6.39=
rc1"
+
+CVE_STATUS[CVE-2010-5331] =3D "fixed-version: Fixed after version 2.6.34=
rc7"
+
+CVE_STATUS[CVE-2010-5332] =3D "fixed-version: Fixed after version 2.6.37=
rc1"
+
+CVE_STATUS[CVE-2011-4098] =3D "fixed-version: Fixed after version 3.2rc1=
"
+
+CVE_STATUS[CVE-2011-4131] =3D "fixed-version: Fixed after version 3.3rc1=
"
+
+CVE_STATUS[CVE-2011-4915] =3D "fixed-version: Fixed after version 3.2rc1=
"
+
+# CVE-2011-4916 has no known resolution
+
+# CVE-2011-4917 has no known resolution
+
+CVE_STATUS[CVE-2011-5321] =3D "fixed-version: Fixed after version 3.2rc1=
"
+
+CVE_STATUS[CVE-2011-5327] =3D "fixed-version: Fixed after version 3.1rc1=
"
+
+CVE_STATUS[CVE-2012-0957] =3D "fixed-version: Fixed after version 3.7rc2=
"
+
+CVE_STATUS[CVE-2012-2119] =3D "fixed-version: Fixed after version 3.5rc1=
"
+
+CVE_STATUS[CVE-2012-2136] =3D "fixed-version: Fixed after version 3.5rc1=
"
+
+CVE_STATUS[CVE-2012-2137] =3D "fixed-version: Fixed after version 3.5rc2=
"
+
+CVE_STATUS[CVE-2012-2313] =3D "fixed-version: Fixed after version 3.4rc6=
"
+
+CVE_STATUS[CVE-2012-2319] =3D "fixed-version: Fixed after version 3.4rc6=
"
+
+CVE_STATUS[CVE-2012-2372] =3D "fixed-version: Fixed after version 3.13rc=
4"
+
+CVE_STATUS[CVE-2012-2375] =3D "fixed-version: Fixed after version 3.4rc1=
"
+
+CVE_STATUS[CVE-2012-2390] =3D "fixed-version: Fixed after version 3.5rc1=
"
+
+CVE_STATUS[CVE-2012-2669] =3D "fixed-version: Fixed after version 3.5rc4=
"
+
+CVE_STATUS[CVE-2012-2744] =3D "fixed-version: Fixed after version 2.6.34=
rc1"
+
+CVE_STATUS[CVE-2012-2745] =3D "fixed-version: Fixed after version 3.4rc3=
"
+
+CVE_STATUS[CVE-2012-3364] =3D "fixed-version: Fixed after version 3.5rc6=
"
+
+CVE_STATUS[CVE-2012-3375] =3D "fixed-version: Fixed after version 3.4rc5=
"
+
+CVE_STATUS[CVE-2012-3400] =3D "fixed-version: Fixed after version 3.5rc5=
"
+
+CVE_STATUS[CVE-2012-3412] =3D "fixed-version: Fixed after version 3.6rc2=
"
+
+CVE_STATUS[CVE-2012-3430] =3D "fixed-version: Fixed after version 3.6rc1=
"
+
+CVE_STATUS[CVE-2012-3510] =3D "fixed-version: Fixed after version 2.6.19=
rc4"
+
+CVE_STATUS[CVE-2012-3511] =3D "fixed-version: Fixed after version 3.5rc6=
"
+
+CVE_STATUS[CVE-2012-3520] =3D "fixed-version: Fixed after version 3.6rc3=
"
+
+CVE_STATUS[CVE-2012-3552] =3D "fixed-version: Fixed after version 3.0rc1=
"
+
+# Skipping CVE-2012-4220, no affected_versions
+
+# Skipping CVE-2012-4221, no affected_versions
+
+# Skipping CVE-2012-4222, no affected_versions
+
+CVE_STATUS[CVE-2012-4398] =3D "fixed-version: Fixed after version 3.4rc1=
"
+
+CVE_STATUS[CVE-2012-4444] =3D "fixed-version: Fixed after version 2.6.36=
rc4"
+
+CVE_STATUS[CVE-2012-4461] =3D "fixed-version: Fixed after version 3.7rc6=
"
+
+CVE_STATUS[CVE-2012-4467] =3D "fixed-version: Fixed after version 3.6rc5=
"
+
+CVE_STATUS[CVE-2012-4508] =3D "fixed-version: Fixed after version 3.7rc3=
"
+
+CVE_STATUS[CVE-2012-4530] =3D "fixed-version: Fixed after version 3.8rc1=
"
+
+# CVE-2012-4542 has no known resolution
+
+CVE_STATUS[CVE-2012-4565] =3D "fixed-version: Fixed after version 3.7rc4=
"
+
+CVE_STATUS[CVE-2012-5374] =3D "fixed-version: Fixed after version 3.8rc1=
"
+
+CVE_STATUS[CVE-2012-5375] =3D "fixed-version: Fixed after version 3.8rc1=
"
+
+CVE_STATUS[CVE-2012-5517] =3D "fixed-version: Fixed after version 3.6rc1=
"
+
+CVE_STATUS[CVE-2012-6536] =3D "fixed-version: Fixed after version 3.6rc7=
"
+
+CVE_STATUS[CVE-2012-6537] =3D "fixed-version: Fixed after version 3.6rc7=
"
+
+CVE_STATUS[CVE-2012-6538] =3D "fixed-version: Fixed after version 3.6rc7=
"
+
+CVE_STATUS[CVE-2012-6539] =3D "fixed-version: Fixed after version 3.6rc3=
"
+
+CVE_STATUS[CVE-2012-6540] =3D "fixed-version: Fixed after version 3.6rc3=
"
+
+CVE_STATUS[CVE-2012-6541] =3D "fixed-version: Fixed after version 3.6rc3=
"
+
+CVE_STATUS[CVE-2012-6542] =3D "fixed-version: Fixed after version 3.6rc3=
"
+
+CVE_STATUS[CVE-2012-6543] =3D "fixed-version: Fixed after version 3.6rc3=
"
+
+CVE_STATUS[CVE-2012-6544] =3D "fixed-version: Fixed after version 3.6rc3=
"
+
+CVE_STATUS[CVE-2012-6545] =3D "fixed-version: Fixed after version 3.6rc3=
"
+
+CVE_STATUS[CVE-2012-6546] =3D "fixed-version: Fixed after version 3.6rc3=
"
+
+CVE_STATUS[CVE-2012-6547] =3D "fixed-version: Fixed after version 3.6rc1=
"
+
+CVE_STATUS[CVE-2012-6548] =3D "fixed-version: Fixed after version 3.6rc1=
"
+
+CVE_STATUS[CVE-2012-6549] =3D "fixed-version: Fixed after version 3.6rc1=
"
+
+CVE_STATUS[CVE-2012-6638] =3D "fixed-version: Fixed after version 3.3rc1=
"
+
+CVE_STATUS[CVE-2012-6647] =3D "fixed-version: Fixed after version 3.6rc2=
"
+
+CVE_STATUS[CVE-2012-6657] =3D "fixed-version: Fixed after version 3.6"
+
+CVE_STATUS[CVE-2012-6689] =3D "fixed-version: Fixed after version 3.6rc5=
"
+
+CVE_STATUS[CVE-2012-6701] =3D "fixed-version: Fixed after version 3.5rc1=
"
+
+CVE_STATUS[CVE-2012-6703] =3D "fixed-version: Fixed after version 3.7rc1=
"
+
+CVE_STATUS[CVE-2012-6704] =3D "fixed-version: Fixed after version 3.5rc1=
"
+
+CVE_STATUS[CVE-2012-6712] =3D "fixed-version: Fixed after version 3.4rc1=
"
+
+CVE_STATUS[CVE-2013-0160] =3D "fixed-version: Fixed after version 3.9rc1=
"
+
+CVE_STATUS[CVE-2013-0190] =3D "fixed-version: Fixed after version 3.8rc5=
"
+
+CVE_STATUS[CVE-2013-0216] =3D "fixed-version: Fixed after version 3.8rc7=
"
+
+CVE_STATUS[CVE-2013-0217] =3D "fixed-version: Fixed after version 3.8rc7=
"
+
+CVE_STATUS[CVE-2013-0228] =3D "fixed-version: Fixed after version 3.8"
+
+CVE_STATUS[CVE-2013-0231] =3D "fixed-version: Fixed after version 3.8rc7=
"
+
+CVE_STATUS[CVE-2013-0268] =3D "fixed-version: Fixed after version 3.8rc6=
"
+
+CVE_STATUS[CVE-2013-0290] =3D "fixed-version: Fixed after version 3.8"
+
+CVE_STATUS[CVE-2013-0309] =3D "fixed-version: Fixed after version 3.7rc1=
"
+
+CVE_STATUS[CVE-2013-0310] =3D "fixed-version: Fixed after version 3.5"
+
+CVE_STATUS[CVE-2013-0311] =3D "fixed-version: Fixed after version 3.7rc8=
"
+
+CVE_STATUS[CVE-2013-0313] =3D "fixed-version: Fixed after version 3.8rc5=
"
+
+CVE_STATUS[CVE-2013-0343] =3D "fixed-version: Fixed after version 3.11rc=
7"
+
+CVE_STATUS[CVE-2013-0349] =3D "fixed-version: Fixed after version 3.8rc6=
"
+
+CVE_STATUS[CVE-2013-0871] =3D "fixed-version: Fixed after version 3.8rc5=
"
+
+CVE_STATUS[CVE-2013-0913] =3D "fixed-version: Fixed after version 3.9rc4=
"
+
+CVE_STATUS[CVE-2013-0914] =3D "fixed-version: Fixed after version 3.9rc3=
"
+
+CVE_STATUS[CVE-2013-1059] =3D "fixed-version: Fixed after version 3.11rc=
1"
+
+CVE_STATUS[CVE-2013-1763] =3D "fixed-version: Fixed after version 3.9rc1=
"
+
+CVE_STATUS[CVE-2013-1767] =3D "fixed-version: Fixed after version 3.9rc1=
"
+
+CVE_STATUS[CVE-2013-1772] =3D "fixed-version: Fixed after version 3.5rc1=
"
+
+CVE_STATUS[CVE-2013-1773] =3D "fixed-version: Fixed after version 3.3rc1=
"
+
+CVE_STATUS[CVE-2013-1774] =3D "fixed-version: Fixed after version 3.8rc5=
"
+
+CVE_STATUS[CVE-2013-1792] =3D "fixed-version: Fixed after version 3.9rc3=
"
+
+CVE_STATUS[CVE-2013-1796] =3D "fixed-version: Fixed after version 3.9rc4=
"
+
+CVE_STATUS[CVE-2013-1797] =3D "fixed-version: Fixed after version 3.9rc4=
"
+
+CVE_STATUS[CVE-2013-1798] =3D "fixed-version: Fixed after version 3.9rc4=
"
+
+CVE_STATUS[CVE-2013-1819] =3D "fixed-version: Fixed after version 3.8rc6=
"
+
+CVE_STATUS[CVE-2013-1826] =3D "fixed-version: Fixed after version 3.6rc7=
"
+
+CVE_STATUS[CVE-2013-1827] =3D "fixed-version: Fixed after version 3.6rc3=
"
+
+CVE_STATUS[CVE-2013-1828] =3D "fixed-version: Fixed after version 3.9rc2=
"
+
+CVE_STATUS[CVE-2013-1848] =3D "fixed-version: Fixed after version 3.9rc3=
"
+
+CVE_STATUS[CVE-2013-1858] =3D "fixed-version: Fixed after version 3.9rc3=
"
+
+CVE_STATUS[CVE-2013-1860] =3D "fixed-version: Fixed after version 3.9rc3=
"
+
+CVE_STATUS[CVE-2013-1928] =3D "fixed-version: Fixed after version 3.7rc3=
"
+
+CVE_STATUS[CVE-2013-1929] =3D "fixed-version: Fixed after version 3.9rc6=
"
+
+# Skipping CVE-2013-1935, no affected_versions
+
+CVE_STATUS[CVE-2013-1943] =3D "fixed-version: Fixed after version 3.0rc1=
"
+
+CVE_STATUS[CVE-2013-1956] =3D "fixed-version: Fixed after version 3.9rc5=
"
+
+CVE_STATUS[CVE-2013-1957] =3D "fixed-version: Fixed after version 3.9rc5=
"
+
+CVE_STATUS[CVE-2013-1958] =3D "fixed-version: Fixed after version 3.9rc5=
"
+
+CVE_STATUS[CVE-2013-1959] =3D "fixed-version: Fixed after version 3.9rc7=
"
+
+CVE_STATUS[CVE-2013-1979] =3D "fixed-version: Fixed after version 3.9rc8=
"
+
+CVE_STATUS[CVE-2013-2015] =3D "fixed-version: Fixed after version 3.8rc2=
"
+
+CVE_STATUS[CVE-2013-2017] =3D "fixed-version: Fixed after version 2.6.34=
"
+
+CVE_STATUS[CVE-2013-2058] =3D "fixed-version: Fixed after version 3.8rc4=
"
+
+CVE_STATUS[CVE-2013-2094] =3D "fixed-version: Fixed after version 3.9rc8=
"
+
+CVE_STATUS[CVE-2013-2128] =3D "fixed-version: Fixed after version 2.6.34=
rc4"
+
+CVE_STATUS[CVE-2013-2140] =3D "fixed-version: Fixed after version 3.11rc=
3"
+
+CVE_STATUS[CVE-2013-2141] =3D "fixed-version: Fixed after version 3.9rc8=
"
+
+CVE_STATUS[CVE-2013-2146] =3D "fixed-version: Fixed after version 3.9rc8=
"
+
+CVE_STATUS[CVE-2013-2147] =3D "fixed-version: Fixed after version 3.12rc=
3"
+
+CVE_STATUS[CVE-2013-2148] =3D "fixed-version: Fixed after version 3.11rc=
1"
+
+CVE_STATUS[CVE-2013-2164] =3D "fixed-version: Fixed after version 3.11rc=
1"
+
+# Skipping CVE-2013-2188, no affected_versions
+
+CVE_STATUS[CVE-2013-2206] =3D "fixed-version: Fixed after version 3.9rc4=
"
+
+# Skipping CVE-2013-2224, no affected_versions
+
+CVE_STATUS[CVE-2013-2232] =3D "fixed-version: Fixed after version 3.10"
+
+CVE_STATUS[CVE-2013-2234] =3D "fixed-version: Fixed after version 3.10"
+
+CVE_STATUS[CVE-2013-2237] =3D "fixed-version: Fixed after version 3.9rc6=
"
+
+# Skipping CVE-2013-2239, no affected_versions
+
+CVE_STATUS[CVE-2013-2546] =3D "fixed-version: Fixed after version 3.9rc1=
"
+
+CVE_STATUS[CVE-2013-2547] =3D "fixed-version: Fixed after version 3.9rc1=
"
+
+CVE_STATUS[CVE-2013-2548] =3D "fixed-version: Fixed after version 3.9rc1=
"
+
+CVE_STATUS[CVE-2013-2596] =3D "fixed-version: Fixed after version 3.9rc8=
"
+
+CVE_STATUS[CVE-2013-2634] =3D "fixed-version: Fixed after version 3.9rc3=
"
+
+CVE_STATUS[CVE-2013-2635] =3D "fixed-version: Fixed after version 3.9rc3=
"
+
+CVE_STATUS[CVE-2013-2636] =3D "fixed-version: Fixed after version 3.9rc3=
"
+
+CVE_STATUS[CVE-2013-2850] =3D "fixed-version: Fixed after version 3.10rc=
4"
+
+CVE_STATUS[CVE-2013-2851] =3D "fixed-version: Fixed after version 3.11rc=
1"
+
+CVE_STATUS[CVE-2013-2852] =3D "fixed-version: Fixed after version 3.10rc=
6"
+
+CVE_STATUS[CVE-2013-2888] =3D "fixed-version: Fixed after version 3.12rc=
1"
+
+CVE_STATUS[CVE-2013-2889] =3D "fixed-version: Fixed after version 3.12rc=
2"
+
+CVE_STATUS[CVE-2013-2890] =3D "fixed-version: Fixed after version 3.12rc=
2"
+
+CVE_STATUS[CVE-2013-2891] =3D "fixed-version: Fixed after version 3.12rc=
2"
+
+CVE_STATUS[CVE-2013-2892] =3D "fixed-version: Fixed after version 3.12rc=
1"
+
+CVE_STATUS[CVE-2013-2893] =3D "fixed-version: Fixed after version 3.12rc=
2"
+
+CVE_STATUS[CVE-2013-2894] =3D "fixed-version: Fixed after version 3.12rc=
2"
+
+CVE_STATUS[CVE-2013-2895] =3D "fixed-version: Fixed after version 3.12rc=
2"
+
+CVE_STATUS[CVE-2013-2896] =3D "fixed-version: Fixed after version 3.12rc=
1"
+
+CVE_STATUS[CVE-2013-2897] =3D "fixed-version: Fixed after version 3.12rc=
2"
+
+CVE_STATUS[CVE-2013-2898] =3D "fixed-version: Fixed after version 3.12rc=
1"
+
+CVE_STATUS[CVE-2013-2899] =3D "fixed-version: Fixed after version 3.12rc=
1"
+
+CVE_STATUS[CVE-2013-2929] =3D "fixed-version: Fixed after version 3.13rc=
1"
+
+CVE_STATUS[CVE-2013-2930] =3D "fixed-version: Fixed after version 3.13rc=
1"
+
+CVE_STATUS[CVE-2013-3076] =3D "fixed-version: Fixed after version 3.9"
+
+CVE_STATUS[CVE-2013-3222] =3D "fixed-version: Fixed after version 3.9rc7=
"
+
+CVE_STATUS[CVE-2013-3223] =3D "fixed-version: Fixed after version 3.9rc7=
"
+
+CVE_STATUS[CVE-2013-3224] =3D "fixed-version: Fixed after version 3.9rc7=
"
+
+CVE_STATUS[CVE-2013-3225] =3D "fixed-version: Fixed after version 3.9rc7=
"
+
+CVE_STATUS[CVE-2013-3226] =3D "fixed-version: Fixed after version 3.9rc7=
"
+
+CVE_STATUS[CVE-2013-3227] =3D "fixed-version: Fixed after version 3.9rc7=
"
+
+CVE_STATUS[CVE-2013-3228] =3D "fixed-version: Fixed after version 3.9rc7=
"
+
+CVE_STATUS[CVE-2013-3229] =3D "fixed-version: Fixed after version 3.9rc7=
"
+
+CVE_STATUS[CVE-2013-3230] =3D "fixed-version: Fixed after version 3.9rc7=
"
+
+CVE_STATUS[CVE-2013-3231] =3D "fixed-version: Fixed after version 3.9rc7=
"
+
+CVE_STATUS[CVE-2013-3232] =3D "fixed-version: Fixed after version 3.9rc7=
"
+
+CVE_STATUS[CVE-2013-3233] =3D "fixed-version: Fixed after version 3.9rc7=
"
+
+CVE_STATUS[CVE-2013-3234] =3D "fixed-version: Fixed after version 3.9rc7=
"
+
+CVE_STATUS[CVE-2013-3235] =3D "fixed-version: Fixed after version 3.9rc7=
"
+
+CVE_STATUS[CVE-2013-3236] =3D "fixed-version: Fixed after version 3.9rc7=
"
+
+CVE_STATUS[CVE-2013-3237] =3D "fixed-version: Fixed after version 3.9rc7=
"
+
+CVE_STATUS[CVE-2013-3301] =3D "fixed-version: Fixed after version 3.9rc7=
"
+
+CVE_STATUS[CVE-2013-3302] =3D "fixed-version: Fixed after version 3.8rc3=
"
+
+CVE_STATUS[CVE-2013-4125] =3D "fixed-version: Fixed after version 3.11rc=
1"
+
+CVE_STATUS[CVE-2013-4127] =3D "fixed-version: Fixed after version 3.11rc=
1"
+
+CVE_STATUS[CVE-2013-4129] =3D "fixed-version: Fixed after version 3.11rc=
1"
+
+CVE_STATUS[CVE-2013-4162] =3D "fixed-version: Fixed after version 3.11rc=
1"
+
+CVE_STATUS[CVE-2013-4163] =3D "fixed-version: Fixed after version 3.11rc=
1"
+
+CVE_STATUS[CVE-2013-4205] =3D "fixed-version: Fixed after version 3.11rc=
5"
+
+CVE_STATUS[CVE-2013-4220] =3D "fixed-version: Fixed after version 3.10rc=
4"
+
+CVE_STATUS[CVE-2013-4247] =3D "fixed-version: Fixed after version 3.10rc=
5"
+
+CVE_STATUS[CVE-2013-4254] =3D "fixed-version: Fixed after version 3.11rc=
6"
+
+CVE_STATUS[CVE-2013-4270] =3D "fixed-version: Fixed after version 3.12rc=
4"
+
+CVE_STATUS[CVE-2013-4299] =3D "fixed-version: Fixed after version 3.12rc=
6"
+
+CVE_STATUS[CVE-2013-4300] =3D "fixed-version: Fixed after version 3.11"
+
+CVE_STATUS[CVE-2013-4312] =3D "fixed-version: Fixed after version 4.5rc1=
"
+
+CVE_STATUS[CVE-2013-4343] =3D "fixed-version: Fixed after version 3.12rc=
2"
+
+CVE_STATUS[CVE-2013-4345] =3D "fixed-version: Fixed after version 3.13rc=
2"
+
+CVE_STATUS[CVE-2013-4348] =3D "fixed-version: Fixed after version 3.13rc=
1"
+
+CVE_STATUS[CVE-2013-4350] =3D "fixed-version: Fixed after version 3.12rc=
2"
+
+CVE_STATUS[CVE-2013-4387] =3D "fixed-version: Fixed after version 3.12rc=
4"
+
+CVE_STATUS[CVE-2013-4470] =3D "fixed-version: Fixed after version 3.12rc=
7"
+
+CVE_STATUS[CVE-2013-4483] =3D "fixed-version: Fixed after version 3.10rc=
1"
+
+CVE_STATUS[CVE-2013-4511] =3D "fixed-version: Fixed after version 3.12"
+
+CVE_STATUS[CVE-2013-4512] =3D "fixed-version: Fixed after version 3.12"
+
+CVE_STATUS[CVE-2013-4513] =3D "fixed-version: Fixed after version 3.12"
+
+CVE_STATUS[CVE-2013-4514] =3D "fixed-version: Fixed after version 3.12"
+
+CVE_STATUS[CVE-2013-4515] =3D "fixed-version: Fixed after version 3.12"
+
+CVE_STATUS[CVE-2013-4516] =3D "fixed-version: Fixed after version 3.12"
+
+CVE_STATUS[CVE-2013-4563] =3D "fixed-version: Fixed after version 3.13rc=
1"
+
+CVE_STATUS[CVE-2013-4579] =3D "fixed-version: Fixed after version 3.13rc=
7"
+
+CVE_STATUS[CVE-2013-4587] =3D "fixed-version: Fixed after version 3.13rc=
4"
+
+CVE_STATUS[CVE-2013-4588] =3D "fixed-version: Fixed after version 2.6.33=
rc4"
+
+CVE_STATUS[CVE-2013-4591] =3D "fixed-version: Fixed after version 3.8rc1=
"
+
+CVE_STATUS[CVE-2013-4592] =3D "fixed-version: Fixed after version 3.7rc1=
"
+
+# Skipping CVE-2013-4737, no affected_versions
+
+# Skipping CVE-2013-4738, no affected_versions
+
+# Skipping CVE-2013-4739, no affected_versions
+
+CVE_STATUS[CVE-2013-5634] =3D "fixed-version: Fixed after version 3.10rc=
5"
+
+CVE_STATUS[CVE-2013-6282] =3D "fixed-version: Fixed after version 3.6rc6=
"
+
+CVE_STATUS[CVE-2013-6367] =3D "fixed-version: Fixed after version 3.13rc=
4"
+
+CVE_STATUS[CVE-2013-6368] =3D "fixed-version: Fixed after version 3.13rc=
4"
+
+CVE_STATUS[CVE-2013-6376] =3D "fixed-version: Fixed after version 3.13rc=
4"
+
+CVE_STATUS[CVE-2013-6378] =3D "fixed-version: Fixed after version 3.13rc=
1"
+
+CVE_STATUS[CVE-2013-6380] =3D "fixed-version: Fixed after version 3.13rc=
1"
+
+CVE_STATUS[CVE-2013-6381] =3D "fixed-version: Fixed after version 3.13rc=
1"
+
+CVE_STATUS[CVE-2013-6382] =3D "fixed-version: Fixed after version 3.13rc=
4"
+
+CVE_STATUS[CVE-2013-6383] =3D "fixed-version: Fixed after version 3.12"
+
+# Skipping CVE-2013-6392, no affected_versions
+
+CVE_STATUS[CVE-2013-6431] =3D "fixed-version: Fixed after version 3.12rc=
1"
+
+CVE_STATUS[CVE-2013-6432] =3D "fixed-version: Fixed after version 3.13rc=
1"
+
+CVE_STATUS[CVE-2013-6885] =3D "fixed-version: Fixed after version 3.14rc=
1"
+
+CVE_STATUS[CVE-2013-7026] =3D "fixed-version: Fixed after version 3.13rc=
1"
+
+CVE_STATUS[CVE-2013-7027] =3D "fixed-version: Fixed after version 3.12rc=
7"
+
+CVE_STATUS[CVE-2013-7263] =3D "fixed-version: Fixed after version 3.13rc=
1"
+
+CVE_STATUS[CVE-2013-7264] =3D "fixed-version: Fixed after version 3.13rc=
1"
+
+CVE_STATUS[CVE-2013-7265] =3D "fixed-version: Fixed after version 3.13rc=
1"
+
+CVE_STATUS[CVE-2013-7266] =3D "fixed-version: Fixed after version 3.13rc=
1"
+
+CVE_STATUS[CVE-2013-7267] =3D "fixed-version: Fixed after version 3.13rc=
1"
+
+CVE_STATUS[CVE-2013-7268] =3D "fixed-version: Fixed after version 3.13rc=
1"
+
+CVE_STATUS[CVE-2013-7269] =3D "fixed-version: Fixed after version 3.13rc=
1"
+
+CVE_STATUS[CVE-2013-7270] =3D "fixed-version: Fixed after version 3.13rc=
1"
+
+CVE_STATUS[CVE-2013-7271] =3D "fixed-version: Fixed after version 3.13rc=
1"
+
+CVE_STATUS[CVE-2013-7281] =3D "fixed-version: Fixed after version 3.13rc=
1"
+
+CVE_STATUS[CVE-2013-7339] =3D "fixed-version: Fixed after version 3.13rc=
7"
+
+CVE_STATUS[CVE-2013-7348] =3D "fixed-version: Fixed after version 3.13rc=
1"
+
+CVE_STATUS[CVE-2013-7421] =3D "fixed-version: Fixed after version 3.19rc=
1"
+
+# CVE-2013-7445 has no known resolution
+
+CVE_STATUS[CVE-2013-7446] =3D "fixed-version: Fixed after version 4.4rc4=
"
+
+CVE_STATUS[CVE-2013-7470] =3D "fixed-version: Fixed after version 3.12rc=
7"
+
+CVE_STATUS[CVE-2014-0038] =3D "fixed-version: Fixed after version 3.14rc=
1"
+
+CVE_STATUS[CVE-2014-0049] =3D "fixed-version: Fixed after version 3.14rc=
5"
+
+CVE_STATUS[CVE-2014-0055] =3D "fixed-version: Fixed after version 3.14"
+
+CVE_STATUS[CVE-2014-0069] =3D "fixed-version: Fixed after version 3.14rc=
4"
+
+CVE_STATUS[CVE-2014-0077] =3D "fixed-version: Fixed after version 3.14"
+
+CVE_STATUS[CVE-2014-0100] =3D "fixed-version: Fixed after version 3.14rc=
7"
+
+CVE_STATUS[CVE-2014-0101] =3D "fixed-version: Fixed after version 3.14rc=
6"
+
+CVE_STATUS[CVE-2014-0102] =3D "fixed-version: Fixed after version 3.14rc=
6"
+
+CVE_STATUS[CVE-2014-0131] =3D "fixed-version: Fixed after version 3.14rc=
7"
+
+CVE_STATUS[CVE-2014-0155] =3D "fixed-version: Fixed after version 3.15rc=
2"
+
+CVE_STATUS[CVE-2014-0181] =3D "fixed-version: Fixed after version 3.15rc=
5"
+
+CVE_STATUS[CVE-2014-0196] =3D "fixed-version: Fixed after version 3.15rc=
5"
+
+CVE_STATUS[CVE-2014-0203] =3D "fixed-version: Fixed after version 2.6.33=
rc5"
+
+CVE_STATUS[CVE-2014-0205] =3D "fixed-version: Fixed after version 2.6.37=
rc1"
+
+CVE_STATUS[CVE-2014-0206] =3D "fixed-version: Fixed after version 3.16rc=
3"
+
+# Skipping CVE-2014-0972, no affected_versions
+
+CVE_STATUS[CVE-2014-1438] =3D "fixed-version: Fixed after version 3.13"
+
+CVE_STATUS[CVE-2014-1444] =3D "fixed-version: Fixed after version 3.12rc=
7"
+
+CVE_STATUS[CVE-2014-1445] =3D "fixed-version: Fixed after version 3.12rc=
7"
+
+CVE_STATUS[CVE-2014-1446] =3D "fixed-version: Fixed after version 3.13rc=
7"
+
+CVE_STATUS[CVE-2014-1690] =3D "fixed-version: Fixed after version 3.13rc=
8"
+
+CVE_STATUS[CVE-2014-1737] =3D "fixed-version: Fixed after version 3.15rc=
5"
+
+CVE_STATUS[CVE-2014-1738] =3D "fixed-version: Fixed after version 3.15rc=
5"
+
+CVE_STATUS[CVE-2014-1739] =3D "fixed-version: Fixed after version 3.15rc=
6"
+
+CVE_STATUS[CVE-2014-1874] =3D "fixed-version: Fixed after version 3.14rc=
2"
+
+CVE_STATUS[CVE-2014-2038] =3D "fixed-version: Fixed after version 3.14rc=
1"
+
+CVE_STATUS[CVE-2014-2039] =3D "fixed-version: Fixed after version 3.14rc=
3"
+
+CVE_STATUS[CVE-2014-2309] =3D "fixed-version: Fixed after version 3.14rc=
7"
+
+CVE_STATUS[CVE-2014-2523] =3D "fixed-version: Fixed after version 3.14rc=
1"
+
+CVE_STATUS[CVE-2014-2568] =3D "fixed-version: Fixed after version 3.14"
+
+CVE_STATUS[CVE-2014-2580] =3D "fixed-version: Fixed after version 3.15rc=
1"
+
+CVE_STATUS[CVE-2014-2672] =3D "fixed-version: Fixed after version 3.14rc=
6"
+
+CVE_STATUS[CVE-2014-2673] =3D "fixed-version: Fixed after version 3.14rc=
6"
+
+CVE_STATUS[CVE-2014-2678] =3D "fixed-version: Fixed after version 3.15rc=
1"
+
+CVE_STATUS[CVE-2014-2706] =3D "fixed-version: Fixed after version 3.14rc=
6"
+
+CVE_STATUS[CVE-2014-2739] =3D "fixed-version: Fixed after version 3.15rc=
1"
+
+CVE_STATUS[CVE-2014-2851] =3D "fixed-version: Fixed after version 3.15rc=
2"
+
+CVE_STATUS[CVE-2014-2889] =3D "fixed-version: Fixed after version 3.2rc7=
"
+
+CVE_STATUS[CVE-2014-3122] =3D "fixed-version: Fixed after version 3.15rc=
1"
+
+CVE_STATUS[CVE-2014-3144] =3D "fixed-version: Fixed after version 3.15rc=
2"
+
+CVE_STATUS[CVE-2014-3145] =3D "fixed-version: Fixed after version 3.15rc=
2"
+
+CVE_STATUS[CVE-2014-3153] =3D "fixed-version: Fixed after version 3.15"
+
+CVE_STATUS[CVE-2014-3180] =3D "fixed-version: Fixed after version 3.17rc=
4"
+
+CVE_STATUS[CVE-2014-3181] =3D "fixed-version: Fixed after version 3.17rc=
3"
+
+CVE_STATUS[CVE-2014-3182] =3D "fixed-version: Fixed after version 3.17rc=
2"
+
+CVE_STATUS[CVE-2014-3183] =3D "fixed-version: Fixed after version 3.17rc=
2"
+
+CVE_STATUS[CVE-2014-3184] =3D "fixed-version: Fixed after version 3.17rc=
2"
+
+CVE_STATUS[CVE-2014-3185] =3D "fixed-version: Fixed after version 3.17rc=
3"
+
+CVE_STATUS[CVE-2014-3186] =3D "fixed-version: Fixed after version 3.17rc=
3"
+
+# Skipping CVE-2014-3519, no affected_versions
+
+CVE_STATUS[CVE-2014-3534] =3D "fixed-version: Fixed after version 3.16rc=
7"
+
+CVE_STATUS[CVE-2014-3535] =3D "fixed-version: Fixed after version 2.6.36=
rc1"
+
+CVE_STATUS[CVE-2014-3601] =3D "fixed-version: Fixed after version 3.17rc=
2"
+
+CVE_STATUS[CVE-2014-3610] =3D "fixed-version: Fixed after version 3.18rc=
2"
+
+CVE_STATUS[CVE-2014-3611] =3D "fixed-version: Fixed after version 3.18rc=
2"
+
+CVE_STATUS[CVE-2014-3631] =3D "fixed-version: Fixed after version 3.17rc=
5"
+
+CVE_STATUS[CVE-2014-3645] =3D "fixed-version: Fixed after version 3.12rc=
1"
+
+CVE_STATUS[CVE-2014-3646] =3D "fixed-version: Fixed after version 3.18rc=
2"
+
+CVE_STATUS[CVE-2014-3647] =3D "fixed-version: Fixed after version 3.18rc=
2"
+
+CVE_STATUS[CVE-2014-3673] =3D "fixed-version: Fixed after version 3.18rc=
1"
+
+CVE_STATUS[CVE-2014-3687] =3D "fixed-version: Fixed after version 3.18rc=
1"
+
+CVE_STATUS[CVE-2014-3688] =3D "fixed-version: Fixed after version 3.18rc=
1"
+
+CVE_STATUS[CVE-2014-3690] =3D "fixed-version: Fixed after version 3.18rc=
1"
+
+CVE_STATUS[CVE-2014-3917] =3D "fixed-version: Fixed after version 3.16rc=
1"
+
+CVE_STATUS[CVE-2014-3940] =3D "fixed-version: Fixed after version 3.15"
+
+CVE_STATUS[CVE-2014-4014] =3D "fixed-version: Fixed after version 3.16rc=
1"
+
+CVE_STATUS[CVE-2014-4027] =3D "fixed-version: Fixed after version 3.14rc=
1"
+
+CVE_STATUS[CVE-2014-4157] =3D "fixed-version: Fixed after version 3.15rc=
1"
+
+CVE_STATUS[CVE-2014-4171] =3D "fixed-version: Fixed after version 3.16rc=
3"
+
+# Skipping CVE-2014-4322, no affected_versions
+
+# Skipping CVE-2014-4323, no affected_versions
+
+CVE_STATUS[CVE-2014-4508] =3D "fixed-version: Fixed after version 3.16rc=
3"
+
+CVE_STATUS[CVE-2014-4608] =3D "fixed-version: Fixed after version 3.18rc=
1"
+
+CVE_STATUS[CVE-2014-4611] =3D "fixed-version: Fixed after version 3.16rc=
3"
+
+CVE_STATUS[CVE-2014-4652] =3D "fixed-version: Fixed after version 3.16rc=
2"
+
+CVE_STATUS[CVE-2014-4653] =3D "fixed-version: Fixed after version 3.16rc=
2"
+
+CVE_STATUS[CVE-2014-4654] =3D "fixed-version: Fixed after version 3.16rc=
2"
+
+CVE_STATUS[CVE-2014-4655] =3D "fixed-version: Fixed after version 3.16rc=
2"
+
+CVE_STATUS[CVE-2014-4656] =3D "fixed-version: Fixed after version 3.16rc=
2"
+
+CVE_STATUS[CVE-2014-4667] =3D "fixed-version: Fixed after version 3.16rc=
1"
+
+CVE_STATUS[CVE-2014-4699] =3D "fixed-version: Fixed after version 3.16rc=
4"
+
+CVE_STATUS[CVE-2014-4943] =3D "fixed-version: Fixed after version 3.16rc=
6"
+
+CVE_STATUS[CVE-2014-5045] =3D "fixed-version: Fixed after version 3.16rc=
7"
+
+CVE_STATUS[CVE-2014-5077] =3D "fixed-version: Fixed after version 3.16"
+
+CVE_STATUS[CVE-2014-5206] =3D "fixed-version: Fixed after version 3.17rc=
1"
+
+CVE_STATUS[CVE-2014-5207] =3D "fixed-version: Fixed after version 3.17rc=
1"
+
+# Skipping CVE-2014-5332, no affected_versions
+
+CVE_STATUS[CVE-2014-5471] =3D "fixed-version: Fixed after version 3.17rc=
2"
+
+CVE_STATUS[CVE-2014-5472] =3D "fixed-version: Fixed after version 3.17rc=
2"
+
+CVE_STATUS[CVE-2014-6410] =3D "fixed-version: Fixed after version 3.17rc=
5"
+
+CVE_STATUS[CVE-2014-6416] =3D "fixed-version: Fixed after version 3.17rc=
5"
+
+CVE_STATUS[CVE-2014-6417] =3D "fixed-version: Fixed after version 3.17rc=
5"
+
+CVE_STATUS[CVE-2014-6418] =3D "fixed-version: Fixed after version 3.17rc=
5"
+
+CVE_STATUS[CVE-2014-7145] =3D "fixed-version: Fixed after version 3.17rc=
2"
+
+# Skipping CVE-2014-7207, no affected_versions
+
+CVE_STATUS[CVE-2014-7283] =3D "fixed-version: Fixed after version 3.15rc=
1"
+
+CVE_STATUS[CVE-2014-7284] =3D "fixed-version: Fixed after version 3.15rc=
7"
+
+CVE_STATUS[CVE-2014-7822] =3D "fixed-version: Fixed after version 3.16rc=
1"
+
+CVE_STATUS[CVE-2014-7825] =3D "fixed-version: Fixed after version 3.18rc=
3"
+
+CVE_STATUS[CVE-2014-7826] =3D "fixed-version: Fixed after version 3.18rc=
3"
+
+CVE_STATUS[CVE-2014-7841] =3D "fixed-version: Fixed after version 3.18rc=
5"
+
+CVE_STATUS[CVE-2014-7842] =3D "fixed-version: Fixed after version 3.18rc=
1"
+
+CVE_STATUS[CVE-2014-7843] =3D "fixed-version: Fixed after version 3.18rc=
5"
+
+CVE_STATUS[CVE-2014-7970] =3D "fixed-version: Fixed after version 3.18rc=
1"
+
+CVE_STATUS[CVE-2014-7975] =3D "fixed-version: Fixed after version 3.18rc=
1"
+
+CVE_STATUS[CVE-2014-8086] =3D "fixed-version: Fixed after version 3.18rc=
3"
+
+CVE_STATUS[CVE-2014-8133] =3D "fixed-version: Fixed after version 3.19rc=
1"
+
+CVE_STATUS[CVE-2014-8134] =3D "fixed-version: Fixed after version 3.19rc=
1"
+
+CVE_STATUS[CVE-2014-8159] =3D "fixed-version: Fixed after version 4.0rc7=
"
+
+CVE_STATUS[CVE-2014-8160] =3D "fixed-version: Fixed after version 3.18rc=
1"
+
+CVE_STATUS[CVE-2014-8171] =3D "fixed-version: Fixed after version 3.12rc=
1"
+
+CVE_STATUS[CVE-2014-8172] =3D "fixed-version: Fixed after version 3.13rc=
1"
+
+CVE_STATUS[CVE-2014-8173] =3D "fixed-version: Fixed after version 3.13rc=
5"
+
+# Skipping CVE-2014-8181, no affected_versions
+
+CVE_STATUS[CVE-2014-8369] =3D "fixed-version: Fixed after version 3.18rc=
2"
+
+CVE_STATUS[CVE-2014-8480] =3D "fixed-version: Fixed after version 3.18rc=
2"
+
+CVE_STATUS[CVE-2014-8481] =3D "fixed-version: Fixed after version 3.18rc=
2"
+
+CVE_STATUS[CVE-2014-8559] =3D "fixed-version: Fixed after version 3.19rc=
1"
+
+CVE_STATUS[CVE-2014-8709] =3D "fixed-version: Fixed after version 3.14rc=
3"
+
+CVE_STATUS[CVE-2014-8884] =3D "fixed-version: Fixed after version 3.18rc=
1"
+
+CVE_STATUS[CVE-2014-8989] =3D "fixed-version: Fixed after version 3.19rc=
1"
+
+CVE_STATUS[CVE-2014-9090] =3D "fixed-version: Fixed after version 3.18rc=
6"
+
+CVE_STATUS[CVE-2014-9322] =3D "fixed-version: Fixed after version 3.18rc=
6"
+
+CVE_STATUS[CVE-2014-9419] =3D "fixed-version: Fixed after version 3.19rc=
1"
+
+CVE_STATUS[CVE-2014-9420] =3D "fixed-version: Fixed after version 3.19rc=
1"
+
+CVE_STATUS[CVE-2014-9428] =3D "fixed-version: Fixed after version 3.19rc=
3"
+
+CVE_STATUS[CVE-2014-9529] =3D "fixed-version: Fixed after version 3.19rc=
4"
+
+CVE_STATUS[CVE-2014-9584] =3D "fixed-version: Fixed after version 3.19rc=
3"
+
+CVE_STATUS[CVE-2014-9585] =3D "fixed-version: Fixed after version 3.19rc=
4"
+
+CVE_STATUS[CVE-2014-9644] =3D "fixed-version: Fixed after version 3.19rc=
1"
+
+CVE_STATUS[CVE-2014-9683] =3D "fixed-version: Fixed after version 3.19rc=
1"
+
+CVE_STATUS[CVE-2014-9710] =3D "fixed-version: Fixed after version 3.19rc=
1"
+
+CVE_STATUS[CVE-2014-9715] =3D "fixed-version: Fixed after version 3.15rc=
1"
+
+CVE_STATUS[CVE-2014-9717] =3D "fixed-version: Fixed after version 4.1rc1=
"
+
+CVE_STATUS[CVE-2014-9728] =3D "fixed-version: Fixed after version 3.19rc=
3"
+
+CVE_STATUS[CVE-2014-9729] =3D "fixed-version: Fixed after version 3.19rc=
3"
+
+CVE_STATUS[CVE-2014-9730] =3D "fixed-version: Fixed after version 3.19rc=
3"
+
+CVE_STATUS[CVE-2014-9731] =3D "fixed-version: Fixed after version 3.19rc=
3"
+
+# Skipping CVE-2014-9777, no affected_versions
+
+# Skipping CVE-2014-9778, no affected_versions
+
+# Skipping CVE-2014-9779, no affected_versions
+
+# Skipping CVE-2014-9780, no affected_versions
+
+# Skipping CVE-2014-9781, no affected_versions
+
+# Skipping CVE-2014-9782, no affected_versions
+
+# Skipping CVE-2014-9783, no affected_versions
+
+# Skipping CVE-2014-9784, no affected_versions
+
+# Skipping CVE-2014-9785, no affected_versions
+
+# Skipping CVE-2014-9786, no affected_versions
+
+# Skipping CVE-2014-9787, no affected_versions
+
+# Skipping CVE-2014-9788, no affected_versions
+
+# Skipping CVE-2014-9789, no affected_versions
+
+CVE_STATUS[CVE-2014-9803] =3D "fixed-version: Fixed after version 3.16rc=
1"
+
+# Skipping CVE-2014-9863, no affected_versions
+
+# Skipping CVE-2014-9864, no affected_versions
+
+# Skipping CVE-2014-9865, no affected_versions
+
+# Skipping CVE-2014-9866, no affected_versions
+
+# Skipping CVE-2014-9867, no affected_versions
+
+# Skipping CVE-2014-9868, no affected_versions
+
+# Skipping CVE-2014-9869, no affected_versions
+
+CVE_STATUS[CVE-2014-9870] =3D "fixed-version: Fixed after version 3.11rc=
1"
+
+# Skipping CVE-2014-9871, no affected_versions
+
+# Skipping CVE-2014-9872, no affected_versions
+
+# Skipping CVE-2014-9873, no affected_versions
+
+# Skipping CVE-2014-9874, no affected_versions
+
+# Skipping CVE-2014-9875, no affected_versions
+
+# Skipping CVE-2014-9876, no affected_versions
+
+# Skipping CVE-2014-9877, no affected_versions
+
+# Skipping CVE-2014-9878, no affected_versions
+
+# Skipping CVE-2014-9879, no affected_versions
+
+# Skipping CVE-2014-9880, no affected_versions
+
+# Skipping CVE-2014-9881, no affected_versions
+
+# Skipping CVE-2014-9882, no affected_versions
+
+# Skipping CVE-2014-9883, no affected_versions
+
+# Skipping CVE-2014-9884, no affected_versions
+
+# Skipping CVE-2014-9885, no affected_versions
+
+# Skipping CVE-2014-9886, no affected_versions
+
+# Skipping CVE-2014-9887, no affected_versions
+
+CVE_STATUS[CVE-2014-9888] =3D "fixed-version: Fixed after version 3.13rc=
1"
+
+# Skipping CVE-2014-9889, no affected_versions
+
+# Skipping CVE-2014-9890, no affected_versions
+
+# Skipping CVE-2014-9891, no affected_versions
+
+# Skipping CVE-2014-9892, no affected_versions
+
+# Skipping CVE-2014-9893, no affected_versions
+
+# Skipping CVE-2014-9894, no affected_versions
+
+CVE_STATUS[CVE-2014-9895] =3D "fixed-version: Fixed after version 3.11rc=
1"
+
+# Skipping CVE-2014-9896, no affected_versions
+
+# Skipping CVE-2014-9897, no affected_versions
+
+# Skipping CVE-2014-9898, no affected_versions
+
+# Skipping CVE-2014-9899, no affected_versions
+
+# Skipping CVE-2014-9900, no affected_versions
+
+CVE_STATUS[CVE-2014-9903] =3D "fixed-version: Fixed after version 3.14rc=
4"
+
+CVE_STATUS[CVE-2014-9904] =3D "fixed-version: Fixed after version 3.17rc=
1"
+
+CVE_STATUS[CVE-2014-9914] =3D "fixed-version: Fixed after version 3.16rc=
1"
+
+CVE_STATUS[CVE-2014-9922] =3D "fixed-version: Fixed after version 3.18rc=
2"
+
+CVE_STATUS[CVE-2014-9940] =3D "fixed-version: Fixed after version 3.19rc=
1"
+
+CVE_STATUS[CVE-2015-0239] =3D "fixed-version: Fixed after version 3.19rc=
6"
+
+CVE_STATUS[CVE-2015-0274] =3D "fixed-version: Fixed after version 3.15rc=
5"
+
+CVE_STATUS[CVE-2015-0275] =3D "fixed-version: Fixed after version 4.1rc1=
"
+
+# Skipping CVE-2015-0777, no affected_versions
+
+# Skipping CVE-2015-1328, no affected_versions
+
+CVE_STATUS[CVE-2015-1333] =3D "fixed-version: Fixed after version 4.2rc5=
"
+
+CVE_STATUS[CVE-2015-1339] =3D "fixed-version: Fixed after version 4.4rc5=
"
+
+CVE_STATUS[CVE-2015-1350] =3D "fixed-version: Fixed after version 4.9rc1=
"
+
+CVE_STATUS[CVE-2015-1420] =3D "fixed-version: Fixed after version 4.1rc7=
"
+
+CVE_STATUS[CVE-2015-1421] =3D "fixed-version: Fixed after version 3.19rc=
7"
+
+CVE_STATUS[CVE-2015-1465] =3D "fixed-version: Fixed after version 3.19rc=
7"
+
+CVE_STATUS[CVE-2015-1573] =3D "fixed-version: Fixed after version 3.19rc=
5"
+
+CVE_STATUS[CVE-2015-1593] =3D "fixed-version: Fixed after version 4.0rc1=
"
+
+CVE_STATUS[CVE-2015-1805] =3D "fixed-version: Fixed after version 3.16rc=
1"
+
+CVE_STATUS[CVE-2015-2041] =3D "fixed-version: Fixed after version 3.19rc=
7"
+
+CVE_STATUS[CVE-2015-2042] =3D "fixed-version: Fixed after version 3.19"
+
+CVE_STATUS[CVE-2015-2150] =3D "fixed-version: Fixed after version 4.0rc4=
"
+
+CVE_STATUS[CVE-2015-2666] =3D "fixed-version: Fixed after version 4.0rc1=
"
+
+CVE_STATUS[CVE-2015-2672] =3D "fixed-version: Fixed after version 4.0rc3=
"
+
+CVE_STATUS[CVE-2015-2686] =3D "fixed-version: Fixed after version 4.0rc6=
"
+
+CVE_STATUS[CVE-2015-2830] =3D "fixed-version: Fixed after version 4.0rc3=
"
+
+# CVE-2015-2877 has no known resolution
+
+CVE_STATUS[CVE-2015-2922] =3D "fixed-version: Fixed after version 4.0rc7=
"
+
+CVE_STATUS[CVE-2015-2925] =3D "fixed-version: Fixed after version 4.3rc1=
"
+
+CVE_STATUS[CVE-2015-3212] =3D "fixed-version: Fixed after version 4.2rc1=
"
+
+CVE_STATUS[CVE-2015-3214] =3D "fixed-version: Fixed after version 2.6.33=
rc8"
+
+CVE_STATUS[CVE-2015-3288] =3D "fixed-version: Fixed after version 4.2rc2=
"
+
+CVE_STATUS[CVE-2015-3290] =3D "fixed-version: Fixed after version 4.2rc3=
"
+
+CVE_STATUS[CVE-2015-3291] =3D "fixed-version: Fixed after version 4.2rc3=
"
+
+CVE_STATUS[CVE-2015-3331] =3D "fixed-version: Fixed after version 4.0rc5=
"
+
+# Skipping CVE-2015-3332, no affected_versions
+
+CVE_STATUS[CVE-2015-3339] =3D "fixed-version: Fixed after version 4.1rc1=
"
+
+CVE_STATUS[CVE-2015-3636] =3D "fixed-version: Fixed after version 4.1rc2=
"
+
+CVE_STATUS[CVE-2015-4001] =3D "fixed-version: Fixed after version 4.1rc7=
"
+
+CVE_STATUS[CVE-2015-4002] =3D "fixed-version: Fixed after version 4.1rc7=
"
+
+CVE_STATUS[CVE-2015-4003] =3D "fixed-version: Fixed after version 4.1rc7=
"
+
+CVE_STATUS[CVE-2015-4004] =3D "fixed-version: Fixed after version 4.3rc1=
"
+
+CVE_STATUS[CVE-2015-4036] =3D "fixed-version: Fixed after version 4.0rc1=
"
+
+CVE_STATUS[CVE-2015-4167] =3D "fixed-version: Fixed after version 4.0rc1=
"
+
+CVE_STATUS[CVE-2015-4170] =3D "fixed-version: Fixed after version 3.13rc=
5"
+
+CVE_STATUS[CVE-2015-4176] =3D "fixed-version: Fixed after version 4.1rc1=
"
+
+CVE_STATUS[CVE-2015-4177] =3D "fixed-version: Fixed after version 4.1rc1=
"
+
+CVE_STATUS[CVE-2015-4178] =3D "fixed-version: Fixed after version 4.1rc1=
"
+
+CVE_STATUS[CVE-2015-4692] =3D "fixed-version: Fixed after version 4.2rc1=
"
+
+CVE_STATUS[CVE-2015-4700] =3D "fixed-version: Fixed after version 4.1rc6=
"
+
+CVE_STATUS[CVE-2015-5156] =3D "fixed-version: Fixed after version 4.2rc7=
"
+
+CVE_STATUS[CVE-2015-5157] =3D "fixed-version: Fixed after version 4.2rc3=
"
+
+CVE_STATUS[CVE-2015-5257] =3D "fixed-version: Fixed after version 4.3rc3=
"
+
+CVE_STATUS[CVE-2015-5283] =3D "fixed-version: Fixed after version 4.3rc3=
"
+
+CVE_STATUS[CVE-2015-5307] =3D "fixed-version: Fixed after version 4.4rc1=
"
+
+CVE_STATUS[CVE-2015-5327] =3D "fixed-version: Fixed after version 4.4rc1=
"
+
+CVE_STATUS[CVE-2015-5364] =3D "fixed-version: Fixed after version 4.1rc7=
"
+
+CVE_STATUS[CVE-2015-5366] =3D "fixed-version: Fixed after version 4.1rc7=
"
+
+CVE_STATUS[CVE-2015-5697] =3D "fixed-version: Fixed after version 4.2rc6=
"
+
+CVE_STATUS[CVE-2015-5706] =3D "fixed-version: Fixed after version 4.1rc3=
"
+
+CVE_STATUS[CVE-2015-5707] =3D "fixed-version: Fixed after version 4.1rc1=
"
+
+CVE_STATUS[CVE-2015-6252] =3D "fixed-version: Fixed after version 4.2rc5=
"
+
+CVE_STATUS[CVE-2015-6526] =3D "fixed-version: Fixed after version 4.1rc1=
"
+
+# CVE-2015-6619 has no known resolution
+
+# CVE-2015-6646 has no known resolution
+
+CVE_STATUS[CVE-2015-6937] =3D "fixed-version: Fixed after version 4.3rc1=
"
+
+# Skipping CVE-2015-7312, no affected_versions
+
+CVE_STATUS[CVE-2015-7509] =3D "fixed-version: Fixed after version 3.7rc1=
"
+
+CVE_STATUS[CVE-2015-7513] =3D "fixed-version: Fixed after version 4.4rc7=
"
+
+CVE_STATUS[CVE-2015-7515] =3D "fixed-version: Fixed after version 4.4rc6=
"
+
+CVE_STATUS[CVE-2015-7550] =3D "fixed-version: Fixed after version 4.4rc8=
"
+
+# Skipping CVE-2015-7553, no affected_versions
+
+CVE_STATUS[CVE-2015-7566] =3D "fixed-version: Fixed after version 4.5rc2=
"
+
+CVE_STATUS[CVE-2015-7613] =3D "fixed-version: Fixed after version 4.3rc4=
"
+
+CVE_STATUS[CVE-2015-7799] =3D "fixed-version: Fixed after version 4.4rc1=
"
+
+CVE_STATUS[CVE-2015-7833] =3D "fixed-version: Fixed after version 4.6rc6=
"
+
+# Skipping CVE-2015-7837, no affected_versions
+
+CVE_STATUS[CVE-2015-7872] =3D "fixed-version: Fixed after version 4.3rc7=
"
+
+CVE_STATUS[CVE-2015-7884] =3D "fixed-version: Fixed after version 4.4rc1=
"
+
+CVE_STATUS[CVE-2015-7885] =3D "fixed-version: Fixed after version 4.4rc1=
"
+
+CVE_STATUS[CVE-2015-7990] =3D "fixed-version: Fixed after version 4.4rc4=
"
+
+# Skipping CVE-2015-8019, no affected_versions
+
+CVE_STATUS[CVE-2015-8104] =3D "fixed-version: Fixed after version 4.4rc1=
"
+
+CVE_STATUS[CVE-2015-8215] =3D "fixed-version: Fixed after version 4.0rc3=
"
+
+CVE_STATUS[CVE-2015-8324] =3D "fixed-version: Fixed after version 2.6.34=
rc1"
+
+CVE_STATUS[CVE-2015-8374] =3D "fixed-version: Fixed after version 4.4rc1=
"
+
+CVE_STATUS[CVE-2015-8539] =3D "fixed-version: Fixed after version 4.4rc3=
"
+
+CVE_STATUS[CVE-2015-8543] =3D "fixed-version: Fixed after version 4.4rc6=
"
+
+CVE_STATUS[CVE-2015-8550] =3D "fixed-version: Fixed after version 4.4rc6=
"
+
+CVE_STATUS[CVE-2015-8551] =3D "fixed-version: Fixed after version 4.4rc6=
"
+
+CVE_STATUS[CVE-2015-8552] =3D "fixed-version: Fixed after version 4.4rc6=
"
+
+CVE_STATUS[CVE-2015-8553] =3D "fixed-version: Fixed after version 4.4rc6=
"
+
+CVE_STATUS[CVE-2015-8569] =3D "fixed-version: Fixed after version 4.4rc6=
"
+
+CVE_STATUS[CVE-2015-8575] =3D "fixed-version: Fixed after version 4.4rc6=
"
+
+CVE_STATUS[CVE-2015-8660] =3D "fixed-version: Fixed after version 4.4rc4=
"
+
+CVE_STATUS[CVE-2015-8709] =3D "fixed-version: Fixed after version 4.10rc=
1"
+
+CVE_STATUS[CVE-2015-8746] =3D "fixed-version: Fixed after version 4.3rc1=
"
+
+CVE_STATUS[CVE-2015-8767] =3D "fixed-version: Fixed after version 4.3rc4=
"
+
+CVE_STATUS[CVE-2015-8785] =3D "fixed-version: Fixed after version 4.4rc5=
"
+
+CVE_STATUS[CVE-2015-8787] =3D "fixed-version: Fixed after version 4.4rc1=
"
+
+CVE_STATUS[CVE-2015-8812] =3D "fixed-version: Fixed after version 4.5rc1=
"
+
+CVE_STATUS[CVE-2015-8816] =3D "fixed-version: Fixed after version 4.4rc6=
"
+
+CVE_STATUS[CVE-2015-8830] =3D "fixed-version: Fixed after version 4.1rc1=
"
+
+CVE_STATUS[CVE-2015-8839] =3D "fixed-version: Fixed after version 4.5rc1=
"
+
+CVE_STATUS[CVE-2015-8844] =3D "fixed-version: Fixed after version 4.4rc3=
"
+
+CVE_STATUS[CVE-2015-8845] =3D "fixed-version: Fixed after version 4.4rc3=
"
+
+# Skipping CVE-2015-8937, no affected_versions
+
+# Skipping CVE-2015-8938, no affected_versions
+
+# Skipping CVE-2015-8939, no affected_versions
+
+# Skipping CVE-2015-8940, no affected_versions
+
+# Skipping CVE-2015-8941, no affected_versions
+
+# Skipping CVE-2015-8942, no affected_versions
+
+# Skipping CVE-2015-8943, no affected_versions
+
+# Skipping CVE-2015-8944, no affected_versions
+
+CVE_STATUS[CVE-2015-8950] =3D "fixed-version: Fixed after version 4.1rc2=
"
+
+CVE_STATUS[CVE-2015-8952] =3D "fixed-version: Fixed after version 4.6rc1=
"
+
+CVE_STATUS[CVE-2015-8953] =3D "fixed-version: Fixed after version 4.3"
+
+CVE_STATUS[CVE-2015-8955] =3D "fixed-version: Fixed after version 4.1rc1=
"
+
+CVE_STATUS[CVE-2015-8956] =3D "fixed-version: Fixed after version 4.2rc1=
"
+
+CVE_STATUS[CVE-2015-8961] =3D "fixed-version: Fixed after version 4.4rc1=
"
+
+CVE_STATUS[CVE-2015-8962] =3D "fixed-version: Fixed after version 4.4rc1=
"
+
+CVE_STATUS[CVE-2015-8963] =3D "fixed-version: Fixed after version 4.4"
+
+CVE_STATUS[CVE-2015-8964] =3D "fixed-version: Fixed after version 4.5rc1=
"
+
+CVE_STATUS[CVE-2015-8966] =3D "fixed-version: Fixed after version 4.4rc8=
"
+
+CVE_STATUS[CVE-2015-8967] =3D "fixed-version: Fixed after version 4.0rc1=
"
+
+CVE_STATUS[CVE-2015-8970] =3D "fixed-version: Fixed after version 4.5rc1=
"
+
+CVE_STATUS[CVE-2015-9004] =3D "fixed-version: Fixed after version 3.19rc=
7"
+
+CVE_STATUS[CVE-2015-9016] =3D "fixed-version: Fixed after version 4.3rc1=
"
+
+CVE_STATUS[CVE-2015-9289] =3D "fixed-version: Fixed after version 4.2rc1=
"
+
+CVE_STATUS[CVE-2016-0617] =3D "fixed-version: Fixed after version 4.5rc1=
"
+
+CVE_STATUS[CVE-2016-0723] =3D "fixed-version: Fixed after version 4.5rc2=
"
+
+CVE_STATUS[CVE-2016-0728] =3D "fixed-version: Fixed after version 4.5rc1=
"
+
+CVE_STATUS[CVE-2016-0758] =3D "fixed-version: Fixed after version 4.6"
+
+# Skipping CVE-2016-0774, no affected_versions
+
+CVE_STATUS[CVE-2016-0821] =3D "fixed-version: Fixed after version 4.3rc1=
"
+
+CVE_STATUS[CVE-2016-0823] =3D "fixed-version: Fixed after version 4.0rc5=
"
+
+CVE_STATUS[CVE-2016-10044] =3D "fixed-version: Fixed after version 4.8rc=
7"
+
+CVE_STATUS[CVE-2016-10088] =3D "fixed-version: Fixed after version 4.10r=
c1"
+
+CVE_STATUS[CVE-2016-10147] =3D "fixed-version: Fixed after version 4.9"
+
+CVE_STATUS[CVE-2016-10150] =3D "fixed-version: Fixed after version 4.9rc=
8"
+
+CVE_STATUS[CVE-2016-10153] =3D "fixed-version: Fixed after version 4.10r=
c1"
+
+CVE_STATUS[CVE-2016-10154] =3D "fixed-version: Fixed after version 4.10r=
c1"
+
+CVE_STATUS[CVE-2016-10200] =3D "fixed-version: Fixed after version 4.9rc=
7"
+
+CVE_STATUS[CVE-2016-10208] =3D "fixed-version: Fixed after version 4.10r=
c1"
+
+CVE_STATUS[CVE-2016-10229] =3D "fixed-version: Fixed after version 4.5rc=
1"
+
+CVE_STATUS[CVE-2016-10318] =3D "fixed-version: Fixed after version 4.8rc=
6"
+
+CVE_STATUS[CVE-2016-10723] =3D "fixed-version: Fixed after version 4.19r=
c1"
+
+CVE_STATUS[CVE-2016-10741] =3D "fixed-version: Fixed after version 4.10r=
c1"
+
+CVE_STATUS[CVE-2016-10764] =3D "fixed-version: Fixed after version 4.10r=
c1"
+
+CVE_STATUS[CVE-2016-10905] =3D "fixed-version: Fixed after version 4.8rc=
1"
+
+CVE_STATUS[CVE-2016-10906] =3D "fixed-version: Fixed after version 4.5rc=
6"
+
+CVE_STATUS[CVE-2016-10907] =3D "fixed-version: Fixed after version 4.9rc=
1"
+
+CVE_STATUS[CVE-2016-1237] =3D "fixed-version: Fixed after version 4.7rc5=
"
+
+CVE_STATUS[CVE-2016-1575] =3D "fixed-version: Fixed after version 4.5rc1=
"
+
+CVE_STATUS[CVE-2016-1576] =3D "fixed-version: Fixed after version 4.5rc1=
"
+
+CVE_STATUS[CVE-2016-1583] =3D "fixed-version: Fixed after version 4.7rc3=
"
+
+CVE_STATUS[CVE-2016-2053] =3D "fixed-version: Fixed after version 4.3rc1=
"
+
+CVE_STATUS[CVE-2016-2069] =3D "fixed-version: Fixed after version 4.5rc1=
"
+
+CVE_STATUS[CVE-2016-2070] =3D "fixed-version: Fixed after version 4.4"
+
+CVE_STATUS[CVE-2016-2085] =3D "fixed-version: Fixed after version 4.5rc4=
"
+
+CVE_STATUS[CVE-2016-2117] =3D "fixed-version: Fixed after version 4.6rc5=
"
+
+CVE_STATUS[CVE-2016-2143] =3D "fixed-version: Fixed after version 4.5"
+
+CVE_STATUS[CVE-2016-2184] =3D "fixed-version: Fixed after version 4.6rc1=
"
+
+CVE_STATUS[CVE-2016-2185] =3D "fixed-version: Fixed after version 4.6rc1=
"
+
+CVE_STATUS[CVE-2016-2186] =3D "fixed-version: Fixed after version 4.6rc1=
"
+
+CVE_STATUS[CVE-2016-2187] =3D "fixed-version: Fixed after version 4.6rc5=
"
+
+CVE_STATUS[CVE-2016-2188] =3D "fixed-version: Fixed after version 4.11rc=
2"
+
+CVE_STATUS[CVE-2016-2383] =3D "fixed-version: Fixed after version 4.5rc4=
"
+
+CVE_STATUS[CVE-2016-2384] =3D "fixed-version: Fixed after version 4.5rc4=
"
+
+CVE_STATUS[CVE-2016-2543] =3D "fixed-version: Fixed after version 4.5rc1=
"
+
+CVE_STATUS[CVE-2016-2544] =3D "fixed-version: Fixed after version 4.5rc1=
"
+
+CVE_STATUS[CVE-2016-2545] =3D "fixed-version: Fixed after version 4.5rc1=
"
+
+CVE_STATUS[CVE-2016-2546] =3D "fixed-version: Fixed after version 4.5rc1=
"
+
+CVE_STATUS[CVE-2016-2547] =3D "fixed-version: Fixed after version 4.5rc1=
"
+
+CVE_STATUS[CVE-2016-2548] =3D "fixed-version: Fixed after version 4.5rc1=
"
+
+CVE_STATUS[CVE-2016-2549] =3D "fixed-version: Fixed after version 4.5rc1=
"
+
+CVE_STATUS[CVE-2016-2550] =3D "fixed-version: Fixed after version 4.5rc4=
"
+
+CVE_STATUS[CVE-2016-2782] =3D "fixed-version: Fixed after version 4.5rc2=
"
+
+CVE_STATUS[CVE-2016-2847] =3D "fixed-version: Fixed after version 4.5rc1=
"
+
+# Skipping CVE-2016-2853, no affected_versions
+
+# Skipping CVE-2016-2854, no affected_versions
+
+CVE_STATUS[CVE-2016-3044] =3D "fixed-version: Fixed after version 4.5"
+
+CVE_STATUS[CVE-2016-3070] =3D "fixed-version: Fixed after version 4.4rc1=
"
+
+CVE_STATUS[CVE-2016-3134] =3D "fixed-version: Fixed after version 4.6rc2=
"
+
+CVE_STATUS[CVE-2016-3135] =3D "fixed-version: Fixed after version 4.6rc1=
"
+
+CVE_STATUS[CVE-2016-3136] =3D "fixed-version: Fixed after version 4.6rc3=
"
+
+CVE_STATUS[CVE-2016-3137] =3D "fixed-version: Fixed after version 4.6rc3=
"
+
+CVE_STATUS[CVE-2016-3138] =3D "fixed-version: Fixed after version 4.6rc1=
"
+
+CVE_STATUS[CVE-2016-3139] =3D "fixed-version: Fixed after version 3.17rc=
1"
+
+CVE_STATUS[CVE-2016-3140] =3D "fixed-version: Fixed after version 4.6rc3=
"
+
+CVE_STATUS[CVE-2016-3156] =3D "fixed-version: Fixed after version 4.6rc1=
"
+
+CVE_STATUS[CVE-2016-3157] =3D "fixed-version: Fixed after version 4.6rc1=
"
+
+CVE_STATUS[CVE-2016-3672] =3D "fixed-version: Fixed after version 4.6rc1=
"
+
+CVE_STATUS[CVE-2016-3689] =3D "fixed-version: Fixed after version 4.6rc1=
"
+
+# Skipping CVE-2016-3695, no affected_versions
+
+# Skipping CVE-2016-3699, no affected_versions
+
+# Skipping CVE-2016-3707, no affected_versions
+
+CVE_STATUS[CVE-2016-3713] =3D "fixed-version: Fixed after version 4.7rc1=
"
+
+# CVE-2016-3775 has no known resolution
+
+# CVE-2016-3802 has no known resolution
+
+# CVE-2016-3803 has no known resolution
+
+CVE_STATUS[CVE-2016-3841] =3D "fixed-version: Fixed after version 4.4rc4=
"
+
+CVE_STATUS[CVE-2016-3857] =3D "fixed-version: Fixed after version 4.8rc2=
"
+
+CVE_STATUS[CVE-2016-3951] =3D "fixed-version: Fixed after version 4.5"
+
+CVE_STATUS[CVE-2016-3955] =3D "fixed-version: Fixed after version 4.6rc3=
"
+
+CVE_STATUS[CVE-2016-3961] =3D "fixed-version: Fixed after version 4.6rc5=
"
+
+CVE_STATUS[CVE-2016-4440] =3D "fixed-version: Fixed after version 4.7rc1=
"
+
+CVE_STATUS[CVE-2016-4470] =3D "fixed-version: Fixed after version 4.7rc4=
"
+
+CVE_STATUS[CVE-2016-4482] =3D "fixed-version: Fixed after version 4.7rc1=
"
+
+CVE_STATUS[CVE-2016-4485] =3D "fixed-version: Fixed after version 4.6"
+
+CVE_STATUS[CVE-2016-4486] =3D "fixed-version: Fixed after version 4.6"
+
+CVE_STATUS[CVE-2016-4557] =3D "fixed-version: Fixed after version 4.6rc6=
"
+
+CVE_STATUS[CVE-2016-4558] =3D "fixed-version: Fixed after version 4.6rc7=
"
+
+CVE_STATUS[CVE-2016-4565] =3D "fixed-version: Fixed after version 4.6rc6=
"
+
+CVE_STATUS[CVE-2016-4568] =3D "fixed-version: Fixed after version 4.6rc6=
"
+
+CVE_STATUS[CVE-2016-4569] =3D "fixed-version: Fixed after version 4.7rc1=
"
+
+CVE_STATUS[CVE-2016-4578] =3D "fixed-version: Fixed after version 4.7rc1=
"
+
+CVE_STATUS[CVE-2016-4580] =3D "fixed-version: Fixed after version 4.6"
+
+CVE_STATUS[CVE-2016-4581] =3D "fixed-version: Fixed after version 4.6rc7=
"
+
+CVE_STATUS[CVE-2016-4794] =3D "fixed-version: Fixed after version 4.7rc4=
"
+
+CVE_STATUS[CVE-2016-4805] =3D "fixed-version: Fixed after version 4.6rc1=
"
+
+CVE_STATUS[CVE-2016-4913] =3D "fixed-version: Fixed after version 4.6"
+
+CVE_STATUS[CVE-2016-4951] =3D "fixed-version: Fixed after version 4.7rc1=
"
+
+CVE_STATUS[CVE-2016-4997] =3D "fixed-version: Fixed after version 4.7rc1=
"
+
+CVE_STATUS[CVE-2016-4998] =3D "fixed-version: Fixed after version 4.7rc1=
"
+
+CVE_STATUS[CVE-2016-5195] =3D "fixed-version: Fixed after version 4.9rc2=
"
+
+CVE_STATUS[CVE-2016-5243] =3D "fixed-version: Fixed after version 4.7rc3=
"
+
+CVE_STATUS[CVE-2016-5244] =3D "fixed-version: Fixed after version 4.7rc3=
"
+
+# Skipping CVE-2016-5340, no affected_versions
+
+# Skipping CVE-2016-5342, no affected_versions
+
+# Skipping CVE-2016-5343, no affected_versions
+
+# Skipping CVE-2016-5344, no affected_versions
+
+CVE_STATUS[CVE-2016-5400] =3D "fixed-version: Fixed after version 4.7"
+
+CVE_STATUS[CVE-2016-5412] =3D "fixed-version: Fixed after version 4.8rc1=
"
+
+CVE_STATUS[CVE-2016-5696] =3D "fixed-version: Fixed after version 4.7"
+
+CVE_STATUS[CVE-2016-5728] =3D "fixed-version: Fixed after version 4.7rc1=
"
+
+CVE_STATUS[CVE-2016-5828] =3D "fixed-version: Fixed after version 4.7rc6=
"
+
+CVE_STATUS[CVE-2016-5829] =3D "fixed-version: Fixed after version 4.7rc5=
"
+
+# CVE-2016-5870 has no known resolution
+
+CVE_STATUS[CVE-2016-6130] =3D "fixed-version: Fixed after version 4.6rc6=
"
+
+CVE_STATUS[CVE-2016-6136] =3D "fixed-version: Fixed after version 4.8rc1=
"
+
+CVE_STATUS[CVE-2016-6156] =3D "fixed-version: Fixed after version 4.7rc7=
"
+
+CVE_STATUS[CVE-2016-6162] =3D "fixed-version: Fixed after version 4.7"
+
+CVE_STATUS[CVE-2016-6187] =3D "fixed-version: Fixed after version 4.7rc7=
"
+
+CVE_STATUS[CVE-2016-6197] =3D "fixed-version: Fixed after version 4.6rc1=
"
+
+CVE_STATUS[CVE-2016-6198] =3D "fixed-version: Fixed after version 4.6"
+
+CVE_STATUS[CVE-2016-6213] =3D "fixed-version: Fixed after version 4.9rc1=
"
+
+CVE_STATUS[CVE-2016-6327] =3D "fixed-version: Fixed after version 4.6rc1=
"
+
+CVE_STATUS[CVE-2016-6480] =3D "fixed-version: Fixed after version 4.8rc3=
"
+
+CVE_STATUS[CVE-2016-6516] =3D "fixed-version: Fixed after version 4.8rc1=
"
+
+# Skipping CVE-2016-6753, no affected_versions
+
+CVE_STATUS[CVE-2016-6786] =3D "fixed-version: Fixed after version 4.0rc1=
"
+
+CVE_STATUS[CVE-2016-6787] =3D "fixed-version: Fixed after version 4.0rc1=
"
+
+CVE_STATUS[CVE-2016-6828] =3D "fixed-version: Fixed after version 4.8rc5=
"
+
+CVE_STATUS[CVE-2016-7039] =3D "fixed-version: Fixed after version 4.9rc4=
"
+
+CVE_STATUS[CVE-2016-7042] =3D "fixed-version: Fixed after version 4.9rc3=
"
+
+CVE_STATUS[CVE-2016-7097] =3D "fixed-version: Fixed after version 4.9rc1=
"
+
+CVE_STATUS[CVE-2016-7117] =3D "fixed-version: Fixed after version 4.6rc1=
"
+
+# Skipping CVE-2016-7118, no affected_versions
+
+CVE_STATUS[CVE-2016-7425] =3D "fixed-version: Fixed after version 4.9rc1=
"
+
+CVE_STATUS[CVE-2016-7910] =3D "fixed-version: Fixed after version 4.8rc1=
"
+
+CVE_STATUS[CVE-2016-7911] =3D "fixed-version: Fixed after version 4.7rc7=
"
+
+CVE_STATUS[CVE-2016-7912] =3D "fixed-version: Fixed after version 4.6rc5=
"
+
+CVE_STATUS[CVE-2016-7913] =3D "fixed-version: Fixed after version 4.6rc1=
"
+
+CVE_STATUS[CVE-2016-7914] =3D "fixed-version: Fixed after version 4.6rc4=
"
+
+CVE_STATUS[CVE-2016-7915] =3D "fixed-version: Fixed after version 4.6rc1=
"
+
+CVE_STATUS[CVE-2016-7916] =3D "fixed-version: Fixed after version 4.6rc7=
"
+
+CVE_STATUS[CVE-2016-7917] =3D "fixed-version: Fixed after version 4.5rc6=
"
+
+CVE_STATUS[CVE-2016-8399] =3D "fixed-version: Fixed after version 4.9"
+
+# Skipping CVE-2016-8401, no affected_versions
+
+# Skipping CVE-2016-8402, no affected_versions
+
+# Skipping CVE-2016-8403, no affected_versions
+
+# Skipping CVE-2016-8404, no affected_versions
+
+CVE_STATUS[CVE-2016-8405] =3D "fixed-version: Fixed after version 4.10rc=
6"
+
+# Skipping CVE-2016-8406, no affected_versions
+
+# Skipping CVE-2016-8407, no affected_versions
+
+CVE_STATUS[CVE-2016-8630] =3D "fixed-version: Fixed after version 4.9rc4=
"
+
+CVE_STATUS[CVE-2016-8632] =3D "fixed-version: Fixed after version 4.9rc8=
"
+
+CVE_STATUS[CVE-2016-8633] =3D "fixed-version: Fixed after version 4.9rc4=
"
+
+CVE_STATUS[CVE-2016-8636] =3D "fixed-version: Fixed after version 4.10rc=
8"
+
+CVE_STATUS[CVE-2016-8645] =3D "fixed-version: Fixed after version 4.9rc6=
"
+
+CVE_STATUS[CVE-2016-8646] =3D "fixed-version: Fixed after version 4.4rc1=
"
+
+CVE_STATUS[CVE-2016-8650] =3D "fixed-version: Fixed after version 4.9rc7=
"
+
+CVE_STATUS[CVE-2016-8655] =3D "fixed-version: Fixed after version 4.9rc8=
"
+
+CVE_STATUS[CVE-2016-8658] =3D "fixed-version: Fixed after version 4.8rc7=
"
+
+# CVE-2016-8660 has no known resolution
+
+CVE_STATUS[CVE-2016-8666] =3D "fixed-version: Fixed after version 4.6rc1=
"
+
+CVE_STATUS[CVE-2016-9083] =3D "fixed-version: Fixed after version 4.9rc4=
"
+
+CVE_STATUS[CVE-2016-9084] =3D "fixed-version: Fixed after version 4.9rc4=
"
+
+CVE_STATUS[CVE-2016-9120] =3D "fixed-version: Fixed after version 4.6rc1=
"
+
+CVE_STATUS[CVE-2016-9178] =3D "fixed-version: Fixed after version 4.8rc7=
"
+
+CVE_STATUS[CVE-2016-9191] =3D "fixed-version: Fixed after version 4.10rc=
4"
+
+CVE_STATUS[CVE-2016-9313] =3D "fixed-version: Fixed after version 4.9rc3=
"
+
+CVE_STATUS[CVE-2016-9555] =3D "fixed-version: Fixed after version 4.9rc4=
"
+
+CVE_STATUS[CVE-2016-9576] =3D "fixed-version: Fixed after version 4.9"
+
+CVE_STATUS[CVE-2016-9588] =3D "fixed-version: Fixed after version 4.10rc=
1"
+
+CVE_STATUS[CVE-2016-9604] =3D "fixed-version: Fixed after version 4.11rc=
8"
+
+# Skipping CVE-2016-9644, no affected_versions
+
+CVE_STATUS[CVE-2016-9685] =3D "fixed-version: Fixed after version 4.6rc1=
"
+
+CVE_STATUS[CVE-2016-9754] =3D "fixed-version: Fixed after version 4.7rc1=
"
+
+CVE_STATUS[CVE-2016-9755] =3D "fixed-version: Fixed after version 4.9rc8=
"
+
+CVE_STATUS[CVE-2016-9756] =3D "fixed-version: Fixed after version 4.9rc7=
"
+
+CVE_STATUS[CVE-2016-9777] =3D "fixed-version: Fixed after version 4.9rc7=
"
+
+CVE_STATUS[CVE-2016-9793] =3D "fixed-version: Fixed after version 4.9rc8=
"
+
+CVE_STATUS[CVE-2016-9794] =3D "fixed-version: Fixed after version 4.7rc1=
"
+
+CVE_STATUS[CVE-2016-9806] =3D "fixed-version: Fixed after version 4.7rc1=
"
+
+CVE_STATUS[CVE-2016-9919] =3D "fixed-version: Fixed after version 4.9rc8=
"
+
+# Skipping CVE-2017-0403, no affected_versions
+
+# Skipping CVE-2017-0404, no affected_versions
+
+# Skipping CVE-2017-0426, no affected_versions
+
+# Skipping CVE-2017-0427, no affected_versions
+
+# CVE-2017-0507 has no known resolution
+
+# CVE-2017-0508 has no known resolution
+
+# Skipping CVE-2017-0510, no affected_versions
+
+# Skipping CVE-2017-0528, no affected_versions
+
+# Skipping CVE-2017-0537, no affected_versions
+
+# CVE-2017-0564 has no known resolution
+
+CVE_STATUS[CVE-2017-0605] =3D "fixed-version: Fixed after version 4.12rc=
1"
+
+CVE_STATUS[CVE-2017-0627] =3D "fixed-version: Fixed after version 4.14rc=
1"
+
+# CVE-2017-0630 has no known resolution
+
+# CVE-2017-0749 has no known resolution
+
+CVE_STATUS[CVE-2017-0750] =3D "fixed-version: Fixed after version 4.5rc1=
"
+
+CVE_STATUS[CVE-2017-0786] =3D "fixed-version: Fixed after version 4.14rc=
4"
+
+CVE_STATUS[CVE-2017-0861] =3D "fixed-version: Fixed after version 4.15rc=
3"
+
+CVE_STATUS[CVE-2017-1000] =3D "fixed-version: Fixed after version 4.13rc=
5"
+
+CVE_STATUS[CVE-2017-1000111] =3D "fixed-version: Fixed after version 4.1=
3rc5"
+
+CVE_STATUS[CVE-2017-1000112] =3D "fixed-version: Fixed after version 4.1=
3rc5"
+
+CVE_STATUS[CVE-2017-1000251] =3D "fixed-version: Fixed after version 4.1=
4rc1"
+
+CVE_STATUS[CVE-2017-1000252] =3D "fixed-version: Fixed after version 4.1=
4rc1"
+
+CVE_STATUS[CVE-2017-1000253] =3D "fixed-version: Fixed after version 4.1=
rc1"
+
+CVE_STATUS[CVE-2017-1000255] =3D "fixed-version: Fixed after version 4.1=
4rc5"
+
+CVE_STATUS[CVE-2017-1000363] =3D "fixed-version: Fixed after version 4.1=
2rc2"
+
+CVE_STATUS[CVE-2017-1000364] =3D "fixed-version: Fixed after version 4.1=
2rc6"
+
+CVE_STATUS[CVE-2017-1000365] =3D "fixed-version: Fixed after version 4.1=
2rc7"
+
+CVE_STATUS[CVE-2017-1000370] =3D "fixed-version: Fixed after version 4.1=
3rc1"
+
+CVE_STATUS[CVE-2017-1000371] =3D "fixed-version: Fixed after version 4.1=
3rc1"
+
+CVE_STATUS[CVE-2017-1000379] =3D "fixed-version: Fixed after version 4.1=
2rc6"
+
+CVE_STATUS[CVE-2017-1000380] =3D "fixed-version: Fixed after version 4.1=
2rc5"
+
+CVE_STATUS[CVE-2017-1000405] =3D "fixed-version: Fixed after version 4.1=
5rc2"
+
+CVE_STATUS[CVE-2017-1000407] =3D "fixed-version: Fixed after version 4.1=
5rc3"
+
+CVE_STATUS[CVE-2017-1000410] =3D "fixed-version: Fixed after version 4.1=
5rc8"
+
+CVE_STATUS[CVE-2017-10661] =3D "fixed-version: Fixed after version 4.11r=
c1"
+
+CVE_STATUS[CVE-2017-10662] =3D "fixed-version: Fixed after version 4.12r=
c1"
+
+CVE_STATUS[CVE-2017-10663] =3D "fixed-version: Fixed after version 4.13r=
c1"
+
+CVE_STATUS[CVE-2017-10810] =3D "fixed-version: Fixed after version 4.12r=
c1"
+
+CVE_STATUS[CVE-2017-10911] =3D "fixed-version: Fixed after version 4.12r=
c7"
+
+CVE_STATUS[CVE-2017-11089] =3D "fixed-version: Fixed after version 4.13r=
c1"
+
+CVE_STATUS[CVE-2017-11176] =3D "fixed-version: Fixed after version 4.13r=
c1"
+
+CVE_STATUS[CVE-2017-11472] =3D "fixed-version: Fixed after version 4.12r=
c1"
+
+CVE_STATUS[CVE-2017-11473] =3D "fixed-version: Fixed after version 4.13r=
c2"
+
+CVE_STATUS[CVE-2017-11600] =3D "fixed-version: Fixed after version 4.13"
+
+CVE_STATUS[CVE-2017-12134] =3D "fixed-version: Fixed after version 4.13r=
c6"
+
+CVE_STATUS[CVE-2017-12146] =3D "fixed-version: Fixed after version 4.13r=
c1"
+
+CVE_STATUS[CVE-2017-12153] =3D "fixed-version: Fixed after version 4.14r=
c2"
+
+CVE_STATUS[CVE-2017-12154] =3D "fixed-version: Fixed after version 4.14r=
c1"
+
+CVE_STATUS[CVE-2017-12168] =3D "fixed-version: Fixed after version 4.9rc=
6"
+
+CVE_STATUS[CVE-2017-12188] =3D "fixed-version: Fixed after version 4.14r=
c5"
+
+CVE_STATUS[CVE-2017-12190] =3D "fixed-version: Fixed after version 4.14r=
c5"
+
+CVE_STATUS[CVE-2017-12192] =3D "fixed-version: Fixed after version 4.14r=
c3"
+
+CVE_STATUS[CVE-2017-12193] =3D "fixed-version: Fixed after version 4.14r=
c7"
+
+CVE_STATUS[CVE-2017-12762] =3D "fixed-version: Fixed after version 4.13r=
c4"
+
+CVE_STATUS[CVE-2017-13080] =3D "fixed-version: Fixed after version 4.14r=
c6"
+
+CVE_STATUS[CVE-2017-13166] =3D "fixed-version: Fixed after version 4.16r=
c1"
+
+CVE_STATUS[CVE-2017-13167] =3D "fixed-version: Fixed after version 4.5rc=
4"
+
+CVE_STATUS[CVE-2017-13168] =3D "fixed-version: Fixed after version 4.18r=
c4"
+
+CVE_STATUS[CVE-2017-13215] =3D "fixed-version: Fixed after version 4.5rc=
1"
+
+CVE_STATUS[CVE-2017-13216] =3D "fixed-version: Fixed after version 4.15r=
c8"
+
+CVE_STATUS[CVE-2017-13220] =3D "fixed-version: Fixed after version 3.19r=
c3"
+
+# CVE-2017-13221 has no known resolution
+
+# CVE-2017-13222 has no known resolution
+
+CVE_STATUS[CVE-2017-13305] =3D "fixed-version: Fixed after version 4.12r=
c5"
+
+CVE_STATUS[CVE-2017-13686] =3D "fixed-version: Fixed after version 4.13r=
c7"
+
+# CVE-2017-13693 has no known resolution
+
+# CVE-2017-13694 has no known resolution
+
+CVE_STATUS[CVE-2017-13695] =3D "fixed-version: Fixed after version 4.17r=
c1"
+
+CVE_STATUS[CVE-2017-13715] =3D "fixed-version: Fixed after version 4.3rc=
1"
+
+CVE_STATUS[CVE-2017-14051] =3D "fixed-version: Fixed after version 4.14r=
c1"
+
+CVE_STATUS[CVE-2017-14106] =3D "fixed-version: Fixed after version 4.12r=
c3"
+
+CVE_STATUS[CVE-2017-14140] =3D "fixed-version: Fixed after version 4.13r=
c6"
+
+CVE_STATUS[CVE-2017-14156] =3D "fixed-version: Fixed after version 4.14r=
c1"
+
+CVE_STATUS[CVE-2017-14340] =3D "fixed-version: Fixed after version 4.14r=
c1"
+
+CVE_STATUS[CVE-2017-14489] =3D "fixed-version: Fixed after version 4.14r=
c3"
+
+CVE_STATUS[CVE-2017-14497] =3D "fixed-version: Fixed after version 4.13"
+
+CVE_STATUS[CVE-2017-14954] =3D "fixed-version: Fixed after version 4.14r=
c3"
+
+CVE_STATUS[CVE-2017-14991] =3D "fixed-version: Fixed after version 4.14r=
c2"
+
+CVE_STATUS[CVE-2017-15102] =3D "fixed-version: Fixed after version 4.9rc=
1"
+
+CVE_STATUS[CVE-2017-15115] =3D "fixed-version: Fixed after version 4.14r=
c6"
+
+CVE_STATUS[CVE-2017-15116] =3D "fixed-version: Fixed after version 4.2rc=
1"
+
+CVE_STATUS[CVE-2017-15121] =3D "fixed-version: Fixed after version 3.11r=
c1"
+
+CVE_STATUS[CVE-2017-15126] =3D "fixed-version: Fixed after version 4.14r=
c4"
+
+CVE_STATUS[CVE-2017-15127] =3D "fixed-version: Fixed after version 4.13r=
c5"
+
+CVE_STATUS[CVE-2017-15128] =3D "fixed-version: Fixed after version 4.14r=
c8"
+
+CVE_STATUS[CVE-2017-15129] =3D "fixed-version: Fixed after version 4.15r=
c5"
+
+CVE_STATUS[CVE-2017-15265] =3D "fixed-version: Fixed after version 4.14r=
c5"
+
+CVE_STATUS[CVE-2017-15274] =3D "fixed-version: Fixed after version 4.12r=
c5"
+
+CVE_STATUS[CVE-2017-15299] =3D "fixed-version: Fixed after version 4.14r=
c6"
+
+CVE_STATUS[CVE-2017-15306] =3D "fixed-version: Fixed after version 4.14r=
c7"
+
+CVE_STATUS[CVE-2017-15537] =3D "fixed-version: Fixed after version 4.14r=
c3"
+
+CVE_STATUS[CVE-2017-15649] =3D "fixed-version: Fixed after version 4.14r=
c4"
+
+CVE_STATUS[CVE-2017-15868] =3D "fixed-version: Fixed after version 3.19r=
c3"
+
+CVE_STATUS[CVE-2017-15951] =3D "fixed-version: Fixed after version 4.14r=
c6"
+
+CVE_STATUS[CVE-2017-16525] =3D "fixed-version: Fixed after version 4.14r=
c5"
+
+CVE_STATUS[CVE-2017-16526] =3D "fixed-version: Fixed after version 4.14r=
c4"
+
+CVE_STATUS[CVE-2017-16527] =3D "fixed-version: Fixed after version 4.14r=
c5"
+
+CVE_STATUS[CVE-2017-16528] =3D "fixed-version: Fixed after version 4.14r=
c1"
+
+CVE_STATUS[CVE-2017-16529] =3D "fixed-version: Fixed after version 4.14r=
c4"
+
+CVE_STATUS[CVE-2017-16530] =3D "fixed-version: Fixed after version 4.14r=
c4"
+
+CVE_STATUS[CVE-2017-16531] =3D "fixed-version: Fixed after version 4.14r=
c4"
+
+CVE_STATUS[CVE-2017-16532] =3D "fixed-version: Fixed after version 4.14r=
c5"
+
+CVE_STATUS[CVE-2017-16533] =3D "fixed-version: Fixed after version 4.14r=
c5"
+
+CVE_STATUS[CVE-2017-16534] =3D "fixed-version: Fixed after version 4.14r=
c4"
+
+CVE_STATUS[CVE-2017-16535] =3D "fixed-version: Fixed after version 4.14r=
c6"
+
+CVE_STATUS[CVE-2017-16536] =3D "fixed-version: Fixed after version 4.15r=
c1"
+
+CVE_STATUS[CVE-2017-16537] =3D "fixed-version: Fixed after version 4.15r=
c1"
+
+CVE_STATUS[CVE-2017-16538] =3D "fixed-version: Fixed after version 4.16r=
c1"
+
+CVE_STATUS[CVE-2017-16643] =3D "fixed-version: Fixed after version 4.14r=
c7"
+
+CVE_STATUS[CVE-2017-16644] =3D "fixed-version: Fixed after version 4.16r=
c1"
+
+CVE_STATUS[CVE-2017-16645] =3D "fixed-version: Fixed after version 4.14r=
c6"
+
+CVE_STATUS[CVE-2017-16646] =3D "fixed-version: Fixed after version 4.15r=
c1"
+
+CVE_STATUS[CVE-2017-16647] =3D "fixed-version: Fixed after version 4.14"
+
+CVE_STATUS[CVE-2017-16648] =3D "fixed-version: Fixed after version 4.15r=
c1"
+
+CVE_STATUS[CVE-2017-16649] =3D "fixed-version: Fixed after version 4.14"
+
+CVE_STATUS[CVE-2017-16650] =3D "fixed-version: Fixed after version 4.14"
+
+CVE_STATUS[CVE-2017-16911] =3D "fixed-version: Fixed after version 4.15r=
c4"
+
+CVE_STATUS[CVE-2017-16912] =3D "fixed-version: Fixed after version 4.15r=
c4"
+
+CVE_STATUS[CVE-2017-16913] =3D "fixed-version: Fixed after version 4.15r=
c4"
+
+CVE_STATUS[CVE-2017-16914] =3D "fixed-version: Fixed after version 4.15r=
c4"
+
+CVE_STATUS[CVE-2017-16939] =3D "fixed-version: Fixed after version 4.14r=
c7"
+
+CVE_STATUS[CVE-2017-16994] =3D "fixed-version: Fixed after version 4.15r=
c1"
+
+CVE_STATUS[CVE-2017-16995] =3D "fixed-version: Fixed after version 4.15r=
c5"
+
+CVE_STATUS[CVE-2017-16996] =3D "fixed-version: Fixed after version 4.15r=
c5"
+
+CVE_STATUS[CVE-2017-17052] =3D "fixed-version: Fixed after version 4.13r=
c7"
+
+CVE_STATUS[CVE-2017-17053] =3D "fixed-version: Fixed after version 4.13r=
c7"
+
+CVE_STATUS[CVE-2017-17448] =3D "fixed-version: Fixed after version 4.15r=
c4"
+
+CVE_STATUS[CVE-2017-17449] =3D "fixed-version: Fixed after version 4.15r=
c4"
+
+CVE_STATUS[CVE-2017-17450] =3D "fixed-version: Fixed after version 4.15r=
c4"
+
+CVE_STATUS[CVE-2017-17558] =3D "fixed-version: Fixed after version 4.15r=
c4"
+
+CVE_STATUS[CVE-2017-17712] =3D "fixed-version: Fixed after version 4.15r=
c4"
+
+CVE_STATUS[CVE-2017-17741] =3D "fixed-version: Fixed after version 4.15r=
c5"
+
+CVE_STATUS[CVE-2017-17805] =3D "fixed-version: Fixed after version 4.15r=
c4"
+
+CVE_STATUS[CVE-2017-17806] =3D "fixed-version: Fixed after version 4.15r=
c4"
+
+CVE_STATUS[CVE-2017-17807] =3D "fixed-version: Fixed after version 4.15r=
c3"
+
+CVE_STATUS[CVE-2017-17852] =3D "fixed-version: Fixed after version 4.15r=
c5"
+
+CVE_STATUS[CVE-2017-17853] =3D "fixed-version: Fixed after version 4.15r=
c5"
+
+CVE_STATUS[CVE-2017-17854] =3D "fixed-version: Fixed after version 4.15r=
c5"
+
+CVE_STATUS[CVE-2017-17855] =3D "fixed-version: Fixed after version 4.15r=
c5"
+
+CVE_STATUS[CVE-2017-17856] =3D "fixed-version: Fixed after version 4.15r=
c5"
+
+CVE_STATUS[CVE-2017-17857] =3D "fixed-version: Fixed after version 4.15r=
c5"
+
+CVE_STATUS[CVE-2017-17862] =3D "fixed-version: Fixed after version 4.15r=
c1"
+
+CVE_STATUS[CVE-2017-17863] =3D "fixed-version: Fixed after version 4.15r=
c5"
+
+CVE_STATUS[CVE-2017-17864] =3D "fixed-version: Fixed after version 4.15r=
c5"
+
+CVE_STATUS[CVE-2017-17975] =3D "fixed-version: Fixed after version 4.17r=
c1"
+
+CVE_STATUS[CVE-2017-18017] =3D "fixed-version: Fixed after version 4.11r=
c7"
+
+CVE_STATUS[CVE-2017-18075] =3D "fixed-version: Fixed after version 4.15r=
c7"
+
+CVE_STATUS[CVE-2017-18079] =3D "fixed-version: Fixed after version 4.13r=
c1"
+
+# CVE-2017-18169 has no known resolution
+
+CVE_STATUS[CVE-2017-18174] =3D "fixed-version: Fixed after version 4.7rc=
1"
+
+CVE_STATUS[CVE-2017-18193] =3D "fixed-version: Fixed after version 4.13r=
c1"
+
+CVE_STATUS[CVE-2017-18200] =3D "fixed-version: Fixed after version 4.14r=
c5"
+
+CVE_STATUS[CVE-2017-18202] =3D "fixed-version: Fixed after version 4.15r=
c2"
+
+CVE_STATUS[CVE-2017-18203] =3D "fixed-version: Fixed after version 4.15r=
c1"
+
+CVE_STATUS[CVE-2017-18204] =3D "fixed-version: Fixed after version 4.15r=
c1"
+
+CVE_STATUS[CVE-2017-18208] =3D "fixed-version: Fixed after version 4.15r=
c2"
+
+CVE_STATUS[CVE-2017-18216] =3D "fixed-version: Fixed after version 4.15r=
c1"
+
+CVE_STATUS[CVE-2017-18218] =3D "fixed-version: Fixed after version 4.13r=
c1"
+
+CVE_STATUS[CVE-2017-18221] =3D "fixed-version: Fixed after version 4.12r=
c4"
+
+CVE_STATUS[CVE-2017-18222] =3D "fixed-version: Fixed after version 4.12r=
c1"
+
+CVE_STATUS[CVE-2017-18224] =3D "fixed-version: Fixed after version 4.15r=
c1"
+
+CVE_STATUS[CVE-2017-18232] =3D "fixed-version: Fixed after version 4.16r=
c1"
+
+CVE_STATUS[CVE-2017-18241] =3D "fixed-version: Fixed after version 4.13r=
c1"
+
+CVE_STATUS[CVE-2017-18249] =3D "fixed-version: Fixed after version 4.12r=
c1"
+
+CVE_STATUS[CVE-2017-18255] =3D "fixed-version: Fixed after version 4.11r=
c1"
+
+CVE_STATUS[CVE-2017-18257] =3D "fixed-version: Fixed after version 4.11r=
c1"
+
+CVE_STATUS[CVE-2017-18261] =3D "fixed-version: Fixed after version 4.13r=
c6"
+
+CVE_STATUS[CVE-2017-18270] =3D "fixed-version: Fixed after version 4.14r=
c3"
+
+CVE_STATUS[CVE-2017-18344] =3D "fixed-version: Fixed after version 4.15r=
c4"
+
+CVE_STATUS[CVE-2017-18360] =3D "fixed-version: Fixed after version 4.12r=
c2"
+
+CVE_STATUS[CVE-2017-18379] =3D "fixed-version: Fixed after version 4.14r=
c3"
+
+CVE_STATUS[CVE-2017-18509] =3D "fixed-version: Fixed after version 4.11r=
c1"
+
+CVE_STATUS[CVE-2017-18549] =3D "fixed-version: Fixed after version 4.13r=
c1"
+
+CVE_STATUS[CVE-2017-18550] =3D "fixed-version: Fixed after version 4.13r=
c1"
+
+CVE_STATUS[CVE-2017-18551] =3D "fixed-version: Fixed after version 4.15r=
c9"
+
+CVE_STATUS[CVE-2017-18552] =3D "fixed-version: Fixed after version 4.11r=
c1"
+
+CVE_STATUS[CVE-2017-18595] =3D "fixed-version: Fixed after version 4.15r=
c6"
+
+CVE_STATUS[CVE-2017-2583] =3D "fixed-version: Fixed after version 4.10rc=
4"
+
+CVE_STATUS[CVE-2017-2584] =3D "fixed-version: Fixed after version 4.10rc=
4"
+
+CVE_STATUS[CVE-2017-2596] =3D "fixed-version: Fixed after version 4.11rc=
1"
+
+CVE_STATUS[CVE-2017-2618] =3D "fixed-version: Fixed after version 4.10rc=
8"
+
+CVE_STATUS[CVE-2017-2634] =3D "fixed-version: Fixed after version 2.6.25=
rc1"
+
+CVE_STATUS[CVE-2017-2636] =3D "fixed-version: Fixed after version 4.11rc=
2"
+
+CVE_STATUS[CVE-2017-2647] =3D "fixed-version: Fixed after version 3.18rc=
1"
+
+CVE_STATUS[CVE-2017-2671] =3D "fixed-version: Fixed after version 4.11rc=
6"
+
+CVE_STATUS[CVE-2017-5123] =3D "fixed-version: Fixed after version 4.14rc=
5"
+
+CVE_STATUS[CVE-2017-5546] =3D "fixed-version: Fixed after version 4.10rc=
4"
+
+CVE_STATUS[CVE-2017-5547] =3D "fixed-version: Fixed after version 4.10rc=
5"
+
+CVE_STATUS[CVE-2017-5548] =3D "fixed-version: Fixed after version 4.10rc=
5"
+
+CVE_STATUS[CVE-2017-5549] =3D "fixed-version: Fixed after version 4.10rc=
4"
+
+CVE_STATUS[CVE-2017-5550] =3D "fixed-version: Fixed after version 4.10rc=
4"
+
+CVE_STATUS[CVE-2017-5551] =3D "fixed-version: Fixed after version 4.10rc=
4"
+
+CVE_STATUS[CVE-2017-5576] =3D "fixed-version: Fixed after version 4.10rc=
6"
+
+CVE_STATUS[CVE-2017-5577] =3D "fixed-version: Fixed after version 4.10rc=
6"
+
+CVE_STATUS[CVE-2017-5669] =3D "fixed-version: Fixed after version 4.11rc=
1"
+
+CVE_STATUS[CVE-2017-5715] =3D "fixed-version: Fixed after version 4.15rc=
8"
+
+CVE_STATUS[CVE-2017-5753] =3D "fixed-version: Fixed after version 4.15rc=
8"
+
+CVE_STATUS[CVE-2017-5754] =3D "fixed-version: Fixed after version 4.16rc=
1"
+
+CVE_STATUS[CVE-2017-5897] =3D "fixed-version: Fixed after version 4.10rc=
8"
+
+CVE_STATUS[CVE-2017-5967] =3D "fixed-version: Fixed after version 4.11rc=
1"
+
+CVE_STATUS[CVE-2017-5970] =3D "fixed-version: Fixed after version 4.10rc=
8"
+
+CVE_STATUS[CVE-2017-5972] =3D "fixed-version: Fixed after version 4.4rc1=
"
+
+CVE_STATUS[CVE-2017-5986] =3D "fixed-version: Fixed after version 4.10rc=
8"
+
+CVE_STATUS[CVE-2017-6001] =3D "fixed-version: Fixed after version 4.10rc=
4"
+
+CVE_STATUS[CVE-2017-6074] =3D "fixed-version: Fixed after version 4.10"
+
+CVE_STATUS[CVE-2017-6214] =3D "fixed-version: Fixed after version 4.10rc=
8"
+
+CVE_STATUS[CVE-2017-6345] =3D "fixed-version: Fixed after version 4.10"
+
+CVE_STATUS[CVE-2017-6346] =3D "fixed-version: Fixed after version 4.10"
+
+CVE_STATUS[CVE-2017-6347] =3D "fixed-version: Fixed after version 4.11rc=
1"
+
+CVE_STATUS[CVE-2017-6348] =3D "fixed-version: Fixed after version 4.10"
+
+CVE_STATUS[CVE-2017-6353] =3D "fixed-version: Fixed after version 4.11rc=
1"
+
+CVE_STATUS[CVE-2017-6874] =3D "fixed-version: Fixed after version 4.11rc=
2"
+
+CVE_STATUS[CVE-2017-6951] =3D "fixed-version: Fixed after version 3.18rc=
1"
+
+CVE_STATUS[CVE-2017-7184] =3D "fixed-version: Fixed after version 4.11rc=
5"
+
+CVE_STATUS[CVE-2017-7187] =3D "fixed-version: Fixed after version 4.11rc=
5"
+
+CVE_STATUS[CVE-2017-7261] =3D "fixed-version: Fixed after version 4.11rc=
6"
+
+CVE_STATUS[CVE-2017-7273] =3D "fixed-version: Fixed after version 4.10rc=
4"
+
+CVE_STATUS[CVE-2017-7277] =3D "fixed-version: Fixed after version 4.11rc=
4"
+
+CVE_STATUS[CVE-2017-7294] =3D "fixed-version: Fixed after version 4.11rc=
6"
+
+CVE_STATUS[CVE-2017-7308] =3D "fixed-version: Fixed after version 4.11rc=
6"
+
+CVE_STATUS[CVE-2017-7346] =3D "fixed-version: Fixed after version 4.12rc=
5"
+
+# CVE-2017-7369 has no known resolution
+
+CVE_STATUS[CVE-2017-7374] =3D "fixed-version: Fixed after version 4.11rc=
4"
+
+CVE_STATUS[CVE-2017-7472] =3D "fixed-version: Fixed after version 4.11rc=
8"
+
+CVE_STATUS[CVE-2017-7477] =3D "fixed-version: Fixed after version 4.11"
+
+CVE_STATUS[CVE-2017-7482] =3D "fixed-version: Fixed after version 4.12rc=
7"
+
+CVE_STATUS[CVE-2017-7487] =3D "fixed-version: Fixed after version 4.12rc=
1"
+
+CVE_STATUS[CVE-2017-7495] =3D "fixed-version: Fixed after version 4.7rc1=
"
+
+CVE_STATUS[CVE-2017-7518] =3D "fixed-version: Fixed after version 4.12rc=
7"
+
+CVE_STATUS[CVE-2017-7533] =3D "fixed-version: Fixed after version 4.13rc=
1"
+
+CVE_STATUS[CVE-2017-7541] =3D "fixed-version: Fixed after version 4.13rc=
1"
+
+CVE_STATUS[CVE-2017-7542] =3D "fixed-version: Fixed after version 4.13rc=
2"
+
+CVE_STATUS[CVE-2017-7558] =3D "fixed-version: Fixed after version 4.13"
+
+CVE_STATUS[CVE-2017-7616] =3D "fixed-version: Fixed after version 4.11rc=
6"
+
+CVE_STATUS[CVE-2017-7618] =3D "fixed-version: Fixed after version 4.11rc=
8"
+
+CVE_STATUS[CVE-2017-7645] =3D "fixed-version: Fixed after version 4.11"
+
+CVE_STATUS[CVE-2017-7889] =3D "fixed-version: Fixed after version 4.11rc=
7"
+
+CVE_STATUS[CVE-2017-7895] =3D "fixed-version: Fixed after version 4.11"
+
+CVE_STATUS[CVE-2017-7979] =3D "fixed-version: Fixed after version 4.11rc=
8"
+
+CVE_STATUS[CVE-2017-8061] =3D "fixed-version: Fixed after version 4.11rc=
4"
+
+CVE_STATUS[CVE-2017-8062] =3D "fixed-version: Fixed after version 4.11rc=
2"
+
+CVE_STATUS[CVE-2017-8063] =3D "fixed-version: Fixed after version 4.11rc=
1"
+
+CVE_STATUS[CVE-2017-8064] =3D "fixed-version: Fixed after version 4.11rc=
1"
+
+CVE_STATUS[CVE-2017-8065] =3D "fixed-version: Fixed after version 4.11rc=
1"
+
+CVE_STATUS[CVE-2017-8066] =3D "fixed-version: Fixed after version 4.11rc=
1"
+
+CVE_STATUS[CVE-2017-8067] =3D "fixed-version: Fixed after version 4.11rc=
1"
+
+CVE_STATUS[CVE-2017-8068] =3D "fixed-version: Fixed after version 4.10rc=
8"
+
+CVE_STATUS[CVE-2017-8069] =3D "fixed-version: Fixed after version 4.10rc=
8"
+
+CVE_STATUS[CVE-2017-8070] =3D "fixed-version: Fixed after version 4.10rc=
8"
+
+CVE_STATUS[CVE-2017-8071] =3D "fixed-version: Fixed after version 4.10rc=
7"
+
+CVE_STATUS[CVE-2017-8072] =3D "fixed-version: Fixed after version 4.10rc=
7"
+
+CVE_STATUS[CVE-2017-8106] =3D "fixed-version: Fixed after version 3.16rc=
1"
+
+CVE_STATUS[CVE-2017-8240] =3D "fixed-version: Fixed after version 3.19rc=
6"
+
+# CVE-2017-8242 has no known resolution
+
+# CVE-2017-8244 has no known resolution
+
+# CVE-2017-8245 has no known resolution
+
+# CVE-2017-8246 has no known resolution
+
+CVE_STATUS[CVE-2017-8797] =3D "fixed-version: Fixed after version 4.12rc=
1"
+
+CVE_STATUS[CVE-2017-8824] =3D "fixed-version: Fixed after version 4.15rc=
3"
+
+CVE_STATUS[CVE-2017-8831] =3D "fixed-version: Fixed after version 4.13rc=
1"
+
+CVE_STATUS[CVE-2017-8890] =3D "fixed-version: Fixed after version 4.12rc=
1"
+
+CVE_STATUS[CVE-2017-8924] =3D "fixed-version: Fixed after version 4.11rc=
2"
+
+CVE_STATUS[CVE-2017-8925] =3D "fixed-version: Fixed after version 4.11rc=
2"
+
+CVE_STATUS[CVE-2017-9059] =3D "fixed-version: Fixed after version 4.12rc=
1"
+
+CVE_STATUS[CVE-2017-9074] =3D "fixed-version: Fixed after version 4.12rc=
2"
+
+CVE_STATUS[CVE-2017-9075] =3D "fixed-version: Fixed after version 4.12rc=
2"
+
+CVE_STATUS[CVE-2017-9076] =3D "fixed-version: Fixed after version 4.12rc=
2"
+
+CVE_STATUS[CVE-2017-9077] =3D "fixed-version: Fixed after version 4.12rc=
2"
+
+CVE_STATUS[CVE-2017-9150] =3D "fixed-version: Fixed after version 4.12rc=
1"
+
+CVE_STATUS[CVE-2017-9211] =3D "fixed-version: Fixed after version 4.12rc=
3"
+
+CVE_STATUS[CVE-2017-9242] =3D "fixed-version: Fixed after version 4.12rc=
3"
+
+CVE_STATUS[CVE-2017-9605] =3D "fixed-version: Fixed after version 4.12rc=
5"
+
+CVE_STATUS[CVE-2017-9725] =3D "fixed-version: Fixed after version 4.3rc7=
"
+
+CVE_STATUS[CVE-2017-9984] =3D "fixed-version: Fixed after version 4.13rc=
1"
+
+CVE_STATUS[CVE-2017-9985] =3D "fixed-version: Fixed after version 4.13rc=
1"
+
+CVE_STATUS[CVE-2017-9986] =3D "fixed-version: Fixed after version 4.15rc=
1"
+
+CVE_STATUS[CVE-2018-1000004] =3D "fixed-version: Fixed after version 4.1=
5rc9"
+
+CVE_STATUS[CVE-2018-1000026] =3D "fixed-version: Fixed after version 4.1=
6rc1"
+
+CVE_STATUS[CVE-2018-1000028] =3D "fixed-version: Fixed after version 4.1=
5"
+
+CVE_STATUS[CVE-2018-1000199] =3D "fixed-version: Fixed after version 4.1=
6"
+
+CVE_STATUS[CVE-2018-1000200] =3D "fixed-version: Fixed after version 4.1=
7rc5"
+
+CVE_STATUS[CVE-2018-1000204] =3D "fixed-version: Fixed after version 4.1=
7rc7"
+
+CVE_STATUS[CVE-2018-10021] =3D "fixed-version: Fixed after version 4.16r=
c7"
+
+CVE_STATUS[CVE-2018-10074] =3D "fixed-version: Fixed after version 4.16r=
c7"
+
+CVE_STATUS[CVE-2018-10087] =3D "fixed-version: Fixed after version 4.13r=
c1"
+
+CVE_STATUS[CVE-2018-10124] =3D "fixed-version: Fixed after version 4.13r=
c1"
+
+CVE_STATUS[CVE-2018-10322] =3D "fixed-version: Fixed after version 4.17r=
c4"
+
+CVE_STATUS[CVE-2018-10323] =3D "fixed-version: Fixed after version 4.17r=
c4"
+
+CVE_STATUS[CVE-2018-1065] =3D "fixed-version: Fixed after version 4.16rc=
3"
+
+CVE_STATUS[CVE-2018-1066] =3D "fixed-version: Fixed after version 4.11rc=
1"
+
+CVE_STATUS[CVE-2018-10675] =3D "fixed-version: Fixed after version 4.13r=
c6"
+
+CVE_STATUS[CVE-2018-1068] =3D "fixed-version: Fixed after version 4.16rc=
5"
+
+CVE_STATUS[CVE-2018-10840] =3D "fixed-version: Fixed after version 4.18r=
c1"
+
+CVE_STATUS[CVE-2018-10853] =3D "fixed-version: Fixed after version 4.18r=
c1"
+
+CVE_STATUS[CVE-2018-1087] =3D "fixed-version: Fixed after version 4.16rc=
7"
+
+# CVE-2018-10872 has no known resolution
+
+CVE_STATUS[CVE-2018-10876] =3D "fixed-version: Fixed after version 4.18r=
c4"
+
+CVE_STATUS[CVE-2018-10877] =3D "fixed-version: Fixed after version 4.18r=
c4"
+
+CVE_STATUS[CVE-2018-10878] =3D "fixed-version: Fixed after version 4.18r=
c4"
+
+CVE_STATUS[CVE-2018-10879] =3D "fixed-version: Fixed after version 4.18r=
c4"
+
+CVE_STATUS[CVE-2018-10880] =3D "fixed-version: Fixed after version 4.18r=
c4"
+
+CVE_STATUS[CVE-2018-10881] =3D "fixed-version: Fixed after version 4.18r=
c4"
+
+CVE_STATUS[CVE-2018-10882] =3D "fixed-version: Fixed after version 4.18r=
c4"
+
+CVE_STATUS[CVE-2018-10883] =3D "fixed-version: Fixed after version 4.18r=
c4"
+
+CVE_STATUS[CVE-2018-10901] =3D "fixed-version: Fixed after version 2.6.3=
6rc1"
+
+CVE_STATUS[CVE-2018-10902] =3D "fixed-version: Fixed after version 4.18r=
c6"
+
+CVE_STATUS[CVE-2018-1091] =3D "fixed-version: Fixed after version 4.14rc=
2"
+
+CVE_STATUS[CVE-2018-1092] =3D "fixed-version: Fixed after version 4.17rc=
1"
+
+CVE_STATUS[CVE-2018-1093] =3D "fixed-version: Fixed after version 4.17rc=
1"
+
+CVE_STATUS[CVE-2018-10938] =3D "fixed-version: Fixed after version 4.13r=
c5"
+
+CVE_STATUS[CVE-2018-1094] =3D "fixed-version: Fixed after version 4.17rc=
1"
+
+CVE_STATUS[CVE-2018-10940] =3D "fixed-version: Fixed after version 4.17r=
c3"
+
+CVE_STATUS[CVE-2018-1095] =3D "fixed-version: Fixed after version 4.17rc=
1"
+
+CVE_STATUS[CVE-2018-1108] =3D "fixed-version: Fixed after version 4.17rc=
2"
+
+CVE_STATUS[CVE-2018-1118] =3D "fixed-version: Fixed after version 4.18rc=
1"
+
+CVE_STATUS[CVE-2018-1120] =3D "fixed-version: Fixed after version 4.17rc=
6"
+
+# CVE-2018-1121 has no known resolution
+
+CVE_STATUS[CVE-2018-11232] =3D "fixed-version: Fixed after version 4.11r=
c1"
+
+CVE_STATUS[CVE-2018-1128] =3D "fixed-version: Fixed after version 4.19rc=
1"
+
+CVE_STATUS[CVE-2018-1129] =3D "fixed-version: Fixed after version 4.19rc=
1"
+
+CVE_STATUS[CVE-2018-1130] =3D "fixed-version: Fixed after version 4.16rc=
7"
+
+CVE_STATUS[CVE-2018-11412] =3D "fixed-version: Fixed after version 4.18r=
c1"
+
+CVE_STATUS[CVE-2018-11506] =3D "fixed-version: Fixed after version 4.17r=
c7"
+
+CVE_STATUS[CVE-2018-11508] =3D "fixed-version: Fixed after version 4.17r=
c5"
+
+# CVE-2018-11987 has no known resolution
+
+CVE_STATUS[CVE-2018-12126] =3D "fixed-version: Fixed after version 5.2rc=
1"
+
+CVE_STATUS[CVE-2018-12127] =3D "fixed-version: Fixed after version 5.2rc=
1"
+
+CVE_STATUS[CVE-2018-12130] =3D "fixed-version: Fixed after version 5.2rc=
1"
+
+CVE_STATUS[CVE-2018-12207] =3D "fixed-version: Fixed after version 5.4rc=
2"
+
+CVE_STATUS[CVE-2018-12232] =3D "fixed-version: Fixed after version 4.18r=
c1"
+
+CVE_STATUS[CVE-2018-12233] =3D "fixed-version: Fixed after version 4.18r=
c2"
+
+CVE_STATUS[CVE-2018-12633] =3D "fixed-version: Fixed after version 4.18r=
c1"
+
+CVE_STATUS[CVE-2018-12714] =3D "fixed-version: Fixed after version 4.18r=
c2"
+
+CVE_STATUS[CVE-2018-12896] =3D "fixed-version: Fixed after version 4.19r=
c1"
+
+CVE_STATUS[CVE-2018-12904] =3D "fixed-version: Fixed after version 4.18r=
c1"
+
+# CVE-2018-12928 has no known resolution
+
+# CVE-2018-12929 has no known resolution
+
+# CVE-2018-12930 has no known resolution
+
+# CVE-2018-12931 has no known resolution
+
+CVE_STATUS[CVE-2018-13053] =3D "fixed-version: Fixed after version 4.19r=
c1"
+
+CVE_STATUS[CVE-2018-13093] =3D "fixed-version: Fixed after version 4.18r=
c1"
+
+CVE_STATUS[CVE-2018-13094] =3D "fixed-version: Fixed after version 4.18r=
c1"
+
+CVE_STATUS[CVE-2018-13095] =3D "fixed-version: Fixed after version 4.18r=
c3"
+
+CVE_STATUS[CVE-2018-13096] =3D "fixed-version: Fixed after version 4.19r=
c1"
+
+CVE_STATUS[CVE-2018-13097] =3D "fixed-version: Fixed after version 4.19r=
c1"
+
+CVE_STATUS[CVE-2018-13098] =3D "fixed-version: Fixed after version 4.19r=
c1"
+
+CVE_STATUS[CVE-2018-13099] =3D "fixed-version: Fixed after version 4.19r=
c1"
+
+CVE_STATUS[CVE-2018-13100] =3D "fixed-version: Fixed after version 4.19r=
c1"
+
+CVE_STATUS[CVE-2018-13405] =3D "fixed-version: Fixed after version 4.18r=
c4"
+
+CVE_STATUS[CVE-2018-13406] =3D "fixed-version: Fixed after version 4.18r=
c1"
+
+CVE_STATUS[CVE-2018-14609] =3D "fixed-version: Fixed after version 4.19r=
c1"
+
+CVE_STATUS[CVE-2018-14610] =3D "fixed-version: Fixed after version 4.19r=
c1"
+
+CVE_STATUS[CVE-2018-14611] =3D "fixed-version: Fixed after version 4.19r=
c1"
+
+CVE_STATUS[CVE-2018-14612] =3D "fixed-version: Fixed after version 4.19r=
c1"
+
+CVE_STATUS[CVE-2018-14613] =3D "fixed-version: Fixed after version 4.19r=
c1"
+
+CVE_STATUS[CVE-2018-14614] =3D "fixed-version: Fixed after version 4.19r=
c1"
+
+CVE_STATUS[CVE-2018-14615] =3D "fixed-version: Fixed after version 4.19r=
c1"
+
+CVE_STATUS[CVE-2018-14616] =3D "fixed-version: Fixed after version 4.19r=
c1"
+
+CVE_STATUS[CVE-2018-14617] =3D "fixed-version: Fixed after version 4.19r=
c1"
+
+CVE_STATUS[CVE-2018-14619] =3D "fixed-version: Fixed after version 4.15r=
c4"
+
+CVE_STATUS[CVE-2018-14625] =3D "fixed-version: Fixed after version 4.20r=
c6"
+
+CVE_STATUS[CVE-2018-14633] =3D "fixed-version: Fixed after version 4.19r=
c6"
+
+CVE_STATUS[CVE-2018-14634] =3D "fixed-version: Fixed after version 4.13r=
c1"
+
+CVE_STATUS[CVE-2018-14641] =3D "fixed-version: Fixed after version 4.19r=
c4"
+
+CVE_STATUS[CVE-2018-14646] =3D "fixed-version: Fixed after version 4.15r=
c8"
+
+CVE_STATUS[CVE-2018-14656] =3D "fixed-version: Fixed after version 4.19r=
c2"
+
+CVE_STATUS[CVE-2018-14678] =3D "fixed-version: Fixed after version 4.18r=
c8"
+
+CVE_STATUS[CVE-2018-14734] =3D "fixed-version: Fixed after version 4.18r=
c1"
+
+CVE_STATUS[CVE-2018-15471] =3D "fixed-version: Fixed after version 4.19r=
c7"
+
+CVE_STATUS[CVE-2018-15572] =3D "fixed-version: Fixed after version 4.19r=
c1"
+
+CVE_STATUS[CVE-2018-15594] =3D "fixed-version: Fixed after version 4.19r=
c1"
+
+CVE_STATUS[CVE-2018-16276] =3D "fixed-version: Fixed after version 4.18r=
c5"
+
+CVE_STATUS[CVE-2018-16597] =3D "fixed-version: Fixed after version 4.8rc=
1"
+
+CVE_STATUS[CVE-2018-16658] =3D "fixed-version: Fixed after version 4.19r=
c2"
+
+CVE_STATUS[CVE-2018-16862] =3D "fixed-version: Fixed after version 4.20r=
c5"
+
+CVE_STATUS[CVE-2018-16871] =3D "fixed-version: Fixed after version 4.20r=
c3"
+
+CVE_STATUS[CVE-2018-16880] =3D "fixed-version: Fixed after version 5.0rc=
5"
+
+CVE_STATUS[CVE-2018-16882] =3D "fixed-version: Fixed after version 4.20"
+
+CVE_STATUS[CVE-2018-16884] =3D "fixed-version: Fixed after version 5.0rc=
1"
+
+# CVE-2018-16885 has no known resolution
+
+CVE_STATUS[CVE-2018-17182] =3D "fixed-version: Fixed after version 4.19r=
c4"
+
+CVE_STATUS[CVE-2018-17972] =3D "fixed-version: Fixed after version 4.19r=
c7"
+
+# CVE-2018-17977 has no known resolution
+
+CVE_STATUS[CVE-2018-18021] =3D "fixed-version: Fixed after version 4.19r=
c7"
+
+CVE_STATUS[CVE-2018-18281] =3D "fixed-version: Fixed after version 4.19"
+
+CVE_STATUS[CVE-2018-18386] =3D "fixed-version: Fixed after version 4.15r=
c6"
+
+CVE_STATUS[CVE-2018-18397] =3D "fixed-version: Fixed after version 4.20r=
c5"
+
+CVE_STATUS[CVE-2018-18445] =3D "fixed-version: Fixed after version 4.19r=
c7"
+
+CVE_STATUS[CVE-2018-18559] =3D "fixed-version: Fixed after version 4.15r=
c2"
+
+# CVE-2018-18653 has no known resolution
+
+CVE_STATUS[CVE-2018-18690] =3D "fixed-version: Fixed after version 4.17r=
c4"
+
+CVE_STATUS[CVE-2018-18710] =3D "fixed-version: Fixed after version 4.20r=
c1"
+
+CVE_STATUS[CVE-2018-18955] =3D "fixed-version: Fixed after version 4.20r=
c2"
+
+CVE_STATUS[CVE-2018-19406] =3D "fixed-version: Fixed after version 4.20r=
c5"
+
+CVE_STATUS[CVE-2018-19407] =3D "fixed-version: Fixed after version 4.20r=
c5"
+
+CVE_STATUS[CVE-2018-19824] =3D "fixed-version: Fixed after version 4.20r=
c6"
+
+CVE_STATUS[CVE-2018-19854] =3D "fixed-version: Fixed after version 4.20r=
c3"
+
+CVE_STATUS[CVE-2018-19985] =3D "fixed-version: Fixed after version 4.20"
+
+CVE_STATUS[CVE-2018-20169] =3D "fixed-version: Fixed after version 4.20r=
c6"
+
+CVE_STATUS[CVE-2018-20449] =3D "fixed-version: Fixed after version 4.15r=
c2"
+
+CVE_STATUS[CVE-2018-20509] =3D "fixed-version: Fixed after version 4.14r=
c1"
+
+CVE_STATUS[CVE-2018-20510] =3D "fixed-version: Fixed after version 4.16r=
c3"
+
+CVE_STATUS[CVE-2018-20511] =3D "fixed-version: Fixed after version 4.19r=
c5"
+
+CVE_STATUS[CVE-2018-20669] =3D "fixed-version: Fixed after version 5.0rc=
1"
+
+CVE_STATUS[CVE-2018-20784] =3D "fixed-version: Fixed after version 5.0rc=
1"
+
+CVE_STATUS[CVE-2018-20836] =3D "fixed-version: Fixed after version 4.20r=
c1"
+
+CVE_STATUS[CVE-2018-20854] =3D "fixed-version: Fixed after version 4.20r=
c1"
+
+CVE_STATUS[CVE-2018-20855] =3D "fixed-version: Fixed after version 4.19r=
c1"
+
+CVE_STATUS[CVE-2018-20856] =3D "fixed-version: Fixed after version 4.19r=
c1"
+
+CVE_STATUS[CVE-2018-20961] =3D "fixed-version: Fixed after version 4.17r=
c1"
+
+CVE_STATUS[CVE-2018-20976] =3D "fixed-version: Fixed after version 4.18r=
c1"
+
+CVE_STATUS[CVE-2018-21008] =3D "fixed-version: Fixed after version 4.18r=
c1"
+
+CVE_STATUS[CVE-2018-25015] =3D "fixed-version: Fixed after version 4.15r=
c9"
+
+CVE_STATUS[CVE-2018-25020] =3D "fixed-version: Fixed after version 4.17r=
c7"
+
+# CVE-2018-3574 has no known resolution
+
+CVE_STATUS[CVE-2018-3620] =3D "fixed-version: Fixed after version 4.19rc=
1"
+
+CVE_STATUS[CVE-2018-3639] =3D "fixed-version: Fixed after version 4.17rc=
7"
+
+CVE_STATUS[CVE-2018-3646] =3D "fixed-version: Fixed after version 4.19rc=
1"
+
+CVE_STATUS[CVE-2018-3665] =3D "fixed-version: Fixed after version 3.7rc1=
"
+
+CVE_STATUS[CVE-2018-3693] =3D "fixed-version: Fixed after version 4.19rc=
1"
+
+CVE_STATUS[CVE-2018-5332] =3D "fixed-version: Fixed after version 4.15rc=
8"
+
+CVE_STATUS[CVE-2018-5333] =3D "fixed-version: Fixed after version 4.15rc=
8"
+
+CVE_STATUS[CVE-2018-5344] =3D "fixed-version: Fixed after version 4.15rc=
8"
+
+CVE_STATUS[CVE-2018-5390] =3D "fixed-version: Fixed after version 4.18rc=
7"
+
+CVE_STATUS[CVE-2018-5391] =3D "fixed-version: Fixed after version 4.19rc=
1"
+
+CVE_STATUS[CVE-2018-5703] =3D "fixed-version: Fixed after version 4.16rc=
5"
+
+CVE_STATUS[CVE-2018-5750] =3D "fixed-version: Fixed after version 4.16rc=
1"
+
+CVE_STATUS[CVE-2018-5803] =3D "fixed-version: Fixed after version 4.16rc=
1"
+
+CVE_STATUS[CVE-2018-5814] =3D "fixed-version: Fixed after version 4.17rc=
6"
+
+CVE_STATUS[CVE-2018-5848] =3D "fixed-version: Fixed after version 4.16rc=
1"
+
+# Skipping CVE-2018-5856, no affected_versions
+
+CVE_STATUS[CVE-2018-5873] =3D "fixed-version: Fixed after version 4.11rc=
8"
+
+CVE_STATUS[CVE-2018-5953] =3D "fixed-version: Fixed after version 4.15rc=
2"
+
+CVE_STATUS[CVE-2018-5995] =3D "fixed-version: Fixed after version 4.15rc=
2"
+
+CVE_STATUS[CVE-2018-6412] =3D "fixed-version: Fixed after version 4.16rc=
5"
+
+CVE_STATUS[CVE-2018-6554] =3D "fixed-version: Fixed after version 4.17rc=
1"
+
+CVE_STATUS[CVE-2018-6555] =3D "fixed-version: Fixed after version 4.17rc=
1"
+
+# CVE-2018-6559 has no known resolution
+
+CVE_STATUS[CVE-2018-6927] =3D "fixed-version: Fixed after version 4.15rc=
9"
+
+CVE_STATUS[CVE-2018-7191] =3D "fixed-version: Fixed after version 4.14rc=
6"
+
+CVE_STATUS[CVE-2018-7273] =3D "fixed-version: Fixed after version 4.15rc=
2"
+
+CVE_STATUS[CVE-2018-7480] =3D "fixed-version: Fixed after version 4.11rc=
1"
+
+CVE_STATUS[CVE-2018-7492] =3D "fixed-version: Fixed after version 4.15rc=
3"
+
+CVE_STATUS[CVE-2018-7566] =3D "fixed-version: Fixed after version 4.16rc=
2"
+
+CVE_STATUS[CVE-2018-7740] =3D "fixed-version: Fixed after version 4.16rc=
7"
+
+CVE_STATUS[CVE-2018-7754] =3D "fixed-version: Fixed after version 4.15rc=
2"
+
+CVE_STATUS[CVE-2018-7755] =3D "fixed-version: Fixed after version 4.19rc=
5"
+
+CVE_STATUS[CVE-2018-7757] =3D "fixed-version: Fixed after version 4.16rc=
1"
+
+CVE_STATUS[CVE-2018-7995] =3D "fixed-version: Fixed after version 4.16rc=
5"
+
+CVE_STATUS[CVE-2018-8043] =3D "fixed-version: Fixed after version 4.16rc=
1"
+
+CVE_STATUS[CVE-2018-8087] =3D "fixed-version: Fixed after version 4.16rc=
1"
+
+CVE_STATUS[CVE-2018-8781] =3D "fixed-version: Fixed after version 4.16rc=
7"
+
+CVE_STATUS[CVE-2018-8822] =3D "fixed-version: Fixed after version 4.16rc=
7"
+
+CVE_STATUS[CVE-2018-8897] =3D "fixed-version: Fixed after version 4.16rc=
7"
+
+CVE_STATUS[CVE-2018-9363] =3D "fixed-version: Fixed after version 4.19rc=
1"
+
+CVE_STATUS[CVE-2018-9385] =3D "fixed-version: Fixed after version 4.17rc=
3"
+
+CVE_STATUS[CVE-2018-9415] =3D "fixed-version: Fixed after version 4.17rc=
3"
+
+CVE_STATUS[CVE-2018-9422] =3D "fixed-version: Fixed after version 4.6rc1=
"
+
+CVE_STATUS[CVE-2018-9465] =3D "fixed-version: Fixed after version 4.15rc=
6"
+
+CVE_STATUS[CVE-2018-9516] =3D "fixed-version: Fixed after version 4.18rc=
5"
+
+CVE_STATUS[CVE-2018-9517] =3D "fixed-version: Fixed after version 4.14rc=
1"
+
+CVE_STATUS[CVE-2018-9518] =3D "fixed-version: Fixed after version 4.16rc=
3"
+
+CVE_STATUS[CVE-2018-9568] =3D "fixed-version: Fixed after version 4.14rc=
4"
+
+CVE_STATUS[CVE-2019-0136] =3D "fixed-version: Fixed after version 5.2rc6=
"
+
+CVE_STATUS[CVE-2019-0145] =3D "fixed-version: Fixed after version 5.2rc1=
"
+
+CVE_STATUS[CVE-2019-0146] =3D "fixed-version: Fixed after version 5.2rc1=
"
+
+CVE_STATUS[CVE-2019-0147] =3D "fixed-version: Fixed after version 5.2rc1=
"
+
+CVE_STATUS[CVE-2019-0148] =3D "fixed-version: Fixed after version 5.2rc1=
"
+
+CVE_STATUS[CVE-2019-0149] =3D "fixed-version: Fixed after version 5.3rc1=
"
+
+CVE_STATUS[CVE-2019-0154] =3D "fixed-version: Fixed after version 5.4rc8=
"
+
+CVE_STATUS[CVE-2019-0155] =3D "fixed-version: Fixed after version 5.4rc8=
"
+
+CVE_STATUS[CVE-2019-10124] =3D "fixed-version: Fixed after version 5.1rc=
1"
+
+CVE_STATUS[CVE-2019-10125] =3D "fixed-version: Fixed after version 5.1rc=
1"
+
+CVE_STATUS[CVE-2019-10126] =3D "fixed-version: Fixed after version 5.2rc=
6"
+
+# CVE-2019-10140 has no known resolution
+
+CVE_STATUS[CVE-2019-10142] =3D "fixed-version: Fixed after version 5.2rc=
1"
+
+CVE_STATUS[CVE-2019-10207] =3D "fixed-version: Fixed after version 5.3rc=
3"
+
+CVE_STATUS[CVE-2019-10220] =3D "fixed-version: Fixed after version 5.4rc=
2"
+
+CVE_STATUS[CVE-2019-10638] =3D "fixed-version: Fixed after version 5.2rc=
1"
+
+CVE_STATUS[CVE-2019-10639] =3D "fixed-version: Fixed after version 5.1rc=
4"
+
+CVE_STATUS[CVE-2019-11085] =3D "fixed-version: Fixed after version 5.0rc=
3"
+
+CVE_STATUS[CVE-2019-11091] =3D "fixed-version: Fixed after version 5.2rc=
1"
+
+CVE_STATUS[CVE-2019-11135] =3D "fixed-version: Fixed after version 5.4rc=
8"
+
+CVE_STATUS[CVE-2019-11190] =3D "fixed-version: Fixed after version 4.8rc=
5"
+
+CVE_STATUS[CVE-2019-11191] =3D "fixed-version: Fixed after version 5.1rc=
1"
+
+CVE_STATUS[CVE-2019-1125] =3D "fixed-version: Fixed after version 5.3rc4=
"
+
+CVE_STATUS[CVE-2019-11477] =3D "fixed-version: Fixed after version 5.2rc=
6"
+
+CVE_STATUS[CVE-2019-11478] =3D "fixed-version: Fixed after version 5.2rc=
6"
+
+CVE_STATUS[CVE-2019-11479] =3D "fixed-version: Fixed after version 5.2rc=
6"
+
+CVE_STATUS[CVE-2019-11486] =3D "fixed-version: Fixed after version 5.1rc=
4"
+
+CVE_STATUS[CVE-2019-11487] =3D "fixed-version: Fixed after version 5.1rc=
5"
+
+CVE_STATUS[CVE-2019-11599] =3D "fixed-version: Fixed after version 5.1rc=
6"
+
+CVE_STATUS[CVE-2019-11683] =3D "fixed-version: Fixed after version 5.1"
+
+CVE_STATUS[CVE-2019-11810] =3D "fixed-version: Fixed after version 5.1rc=
1"
+
+CVE_STATUS[CVE-2019-11811] =3D "fixed-version: Fixed after version 5.1rc=
1"
+
+CVE_STATUS[CVE-2019-11815] =3D "fixed-version: Fixed after version 5.1rc=
4"
+
+CVE_STATUS[CVE-2019-11833] =3D "fixed-version: Fixed after version 5.2rc=
1"
+
+CVE_STATUS[CVE-2019-11884] =3D "fixed-version: Fixed after version 5.2rc=
1"
+
+CVE_STATUS[CVE-2019-12378] =3D "fixed-version: Fixed after version 5.2rc=
3"
+
+CVE_STATUS[CVE-2019-12379] =3D "fixed-version: Fixed after version 5.3rc=
1"
+
+CVE_STATUS[CVE-2019-12380] =3D "fixed-version: Fixed after version 5.2rc=
3"
+
+CVE_STATUS[CVE-2019-12381] =3D "fixed-version: Fixed after version 5.2rc=
3"
+
+CVE_STATUS[CVE-2019-12382] =3D "fixed-version: Fixed after version 5.3rc=
1"
+
+CVE_STATUS[CVE-2019-12454] =3D "fixed-version: Fixed after version 5.3rc=
1"
+
+CVE_STATUS[CVE-2019-12455] =3D "fixed-version: Fixed after version 5.3rc=
1"
+
+# CVE-2019-12456 has no known resolution
+
+CVE_STATUS[CVE-2019-12614] =3D "fixed-version: Fixed after version 5.3rc=
1"
+
+CVE_STATUS[CVE-2019-12615] =3D "fixed-version: Fixed after version 5.2rc=
4"
+
+CVE_STATUS[CVE-2019-12817] =3D "fixed-version: Fixed after version 5.2rc=
7"
+
+CVE_STATUS[CVE-2019-12818] =3D "fixed-version: Fixed after version 5.0"
+
+CVE_STATUS[CVE-2019-12819] =3D "fixed-version: Fixed after version 5.0rc=
8"
+
+CVE_STATUS[CVE-2019-12881] =3D "fixed-version: Fixed after version 4.18r=
c1"
+
+CVE_STATUS[CVE-2019-12984] =3D "fixed-version: Fixed after version 5.2rc=
6"
+
+CVE_STATUS[CVE-2019-13233] =3D "fixed-version: Fixed after version 5.2rc=
4"
+
+CVE_STATUS[CVE-2019-13272] =3D "fixed-version: Fixed after version 5.2"
+
+CVE_STATUS[CVE-2019-13631] =3D "fixed-version: Fixed after version 5.3rc=
1"
+
+CVE_STATUS[CVE-2019-13648] =3D "fixed-version: Fixed after version 5.3rc=
2"
+
+CVE_STATUS[CVE-2019-14283] =3D "fixed-version: Fixed after version 5.3rc=
1"
+
+CVE_STATUS[CVE-2019-14284] =3D "fixed-version: Fixed after version 5.3rc=
1"
+
+CVE_STATUS[CVE-2019-14615] =3D "fixed-version: Fixed after version 5.5rc=
7"
+
+CVE_STATUS[CVE-2019-14763] =3D "fixed-version: Fixed after version 4.17r=
c1"
+
+CVE_STATUS[CVE-2019-14814] =3D "fixed-version: Fixed after version 5.3"
+
+CVE_STATUS[CVE-2019-14815] =3D "fixed-version: Fixed after version 5.3"
+
+CVE_STATUS[CVE-2019-14816] =3D "fixed-version: Fixed after version 5.3"
+
+CVE_STATUS[CVE-2019-14821] =3D "fixed-version: Fixed after version 5.4rc=
1"
+
+CVE_STATUS[CVE-2019-14835] =3D "fixed-version: Fixed after version 5.3"
+
+CVE_STATUS[CVE-2019-14895] =3D "fixed-version: Fixed after version 5.5rc=
3"
+
+CVE_STATUS[CVE-2019-14896] =3D "fixed-version: Fixed after version 5.5"
+
+CVE_STATUS[CVE-2019-14897] =3D "fixed-version: Fixed after version 5.5"
+
+# CVE-2019-14898 has no known resolution
+
+CVE_STATUS[CVE-2019-14901] =3D "fixed-version: Fixed after version 5.5rc=
3"
+
+CVE_STATUS[CVE-2019-15030] =3D "fixed-version: Fixed after version 5.3rc=
8"
+
+CVE_STATUS[CVE-2019-15031] =3D "fixed-version: Fixed after version 5.3rc=
8"
+
+CVE_STATUS[CVE-2019-15090] =3D "fixed-version: Fixed after version 5.2rc=
2"
+
+CVE_STATUS[CVE-2019-15098] =3D "fixed-version: Fixed after version 5.4rc=
1"
+
+CVE_STATUS[CVE-2019-15099] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-15117] =3D "fixed-version: Fixed after version 5.3rc=
5"
+
+CVE_STATUS[CVE-2019-15118] =3D "fixed-version: Fixed after version 5.3rc=
5"
+
+CVE_STATUS[CVE-2019-15211] =3D "fixed-version: Fixed after version 5.3rc=
1"
+
+CVE_STATUS[CVE-2019-15212] =3D "fixed-version: Fixed after version 5.2rc=
3"
+
+CVE_STATUS[CVE-2019-15213] =3D "fixed-version: Fixed after version 5.3rc=
1"
+
+CVE_STATUS[CVE-2019-15214] =3D "fixed-version: Fixed after version 5.1rc=
6"
+
+CVE_STATUS[CVE-2019-15215] =3D "fixed-version: Fixed after version 5.3rc=
1"
+
+CVE_STATUS[CVE-2019-15216] =3D "fixed-version: Fixed after version 5.1"
+
+CVE_STATUS[CVE-2019-15217] =3D "fixed-version: Fixed after version 5.3rc=
1"
+
+CVE_STATUS[CVE-2019-15218] =3D "fixed-version: Fixed after version 5.2rc=
3"
+
+CVE_STATUS[CVE-2019-15219] =3D "fixed-version: Fixed after version 5.2rc=
3"
+
+CVE_STATUS[CVE-2019-15220] =3D "fixed-version: Fixed after version 5.3rc=
1"
+
+CVE_STATUS[CVE-2019-15221] =3D "fixed-version: Fixed after version 5.2"
+
+CVE_STATUS[CVE-2019-15222] =3D "fixed-version: Fixed after version 5.3rc=
3"
+
+CVE_STATUS[CVE-2019-15223] =3D "fixed-version: Fixed after version 5.2rc=
3"
+
+# CVE-2019-15239 has no known resolution
+
+# CVE-2019-15290 has no known resolution
+
+CVE_STATUS[CVE-2019-15291] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-15292] =3D "fixed-version: Fixed after version 5.1rc=
1"
+
+CVE_STATUS[CVE-2019-15504] =3D "fixed-version: Fixed after version 5.3"
+
+CVE_STATUS[CVE-2019-15505] =3D "fixed-version: Fixed after version 5.4rc=
1"
+
+CVE_STATUS[CVE-2019-15538] =3D "fixed-version: Fixed after version 5.3rc=
6"
+
+CVE_STATUS[CVE-2019-15666] =3D "fixed-version: Fixed after version 5.1"
+
+# CVE-2019-15791 has no known resolution
+
+# CVE-2019-15792 has no known resolution
+
+# CVE-2019-15793 has no known resolution
+
+CVE_STATUS[CVE-2019-15794] =3D "fixed-version: Fixed after version 5.12"
+
+CVE_STATUS[CVE-2019-15807] =3D "fixed-version: Fixed after version 5.2rc=
3"
+
+# CVE-2019-15902 has no known resolution
+
+CVE_STATUS[CVE-2019-15916] =3D "fixed-version: Fixed after version 5.1rc=
1"
+
+CVE_STATUS[CVE-2019-15917] =3D "fixed-version: Fixed after version 5.1rc=
1"
+
+CVE_STATUS[CVE-2019-15918] =3D "fixed-version: Fixed after version 5.1rc=
6"
+
+CVE_STATUS[CVE-2019-15919] =3D "fixed-version: Fixed after version 5.1rc=
6"
+
+CVE_STATUS[CVE-2019-15920] =3D "fixed-version: Fixed after version 5.1rc=
6"
+
+CVE_STATUS[CVE-2019-15921] =3D "fixed-version: Fixed after version 5.1rc=
3"
+
+CVE_STATUS[CVE-2019-15922] =3D "fixed-version: Fixed after version 5.1rc=
4"
+
+CVE_STATUS[CVE-2019-15923] =3D "fixed-version: Fixed after version 5.1rc=
4"
+
+CVE_STATUS[CVE-2019-15924] =3D "fixed-version: Fixed after version 5.1rc=
4"
+
+CVE_STATUS[CVE-2019-15925] =3D "fixed-version: Fixed after version 5.3rc=
1"
+
+CVE_STATUS[CVE-2019-15926] =3D "fixed-version: Fixed after version 5.3rc=
1"
+
+CVE_STATUS[CVE-2019-15927] =3D "fixed-version: Fixed after version 5.0rc=
2"
+
+# CVE-2019-16089 has no known resolution
+
+CVE_STATUS[CVE-2019-16229] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-16230] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-16231] =3D "fixed-version: Fixed after version 5.4rc=
6"
+
+CVE_STATUS[CVE-2019-16232] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-16233] =3D "fixed-version: Fixed after version 5.4rc=
5"
+
+CVE_STATUS[CVE-2019-16234] =3D "fixed-version: Fixed after version 5.4rc=
4"
+
+CVE_STATUS[CVE-2019-16413] =3D "fixed-version: Fixed after version 5.1rc=
1"
+
+CVE_STATUS[CVE-2019-16714] =3D "fixed-version: Fixed after version 5.3rc=
7"
+
+CVE_STATUS[CVE-2019-16746] =3D "fixed-version: Fixed after version 5.4rc=
2"
+
+CVE_STATUS[CVE-2019-16921] =3D "fixed-version: Fixed after version 4.17r=
c1"
+
+CVE_STATUS[CVE-2019-16994] =3D "fixed-version: Fixed after version 5.0"
+
+CVE_STATUS[CVE-2019-16995] =3D "fixed-version: Fixed after version 5.1rc=
1"
+
+CVE_STATUS[CVE-2019-17052] =3D "fixed-version: Fixed after version 5.4rc=
1"
+
+CVE_STATUS[CVE-2019-17053] =3D "fixed-version: Fixed after version 5.4rc=
1"
+
+CVE_STATUS[CVE-2019-17054] =3D "fixed-version: Fixed after version 5.4rc=
1"
+
+CVE_STATUS[CVE-2019-17055] =3D "fixed-version: Fixed after version 5.4rc=
1"
+
+CVE_STATUS[CVE-2019-17056] =3D "fixed-version: Fixed after version 5.4rc=
1"
+
+CVE_STATUS[CVE-2019-17075] =3D "fixed-version: Fixed after version 5.4rc=
3"
+
+CVE_STATUS[CVE-2019-17133] =3D "fixed-version: Fixed after version 5.4rc=
4"
+
+CVE_STATUS[CVE-2019-17351] =3D "fixed-version: Fixed after version 5.3rc=
1"
+
+CVE_STATUS[CVE-2019-17666] =3D "fixed-version: Fixed after version 5.4rc=
6"
+
+CVE_STATUS[CVE-2019-18198] =3D "fixed-version: Fixed after version 5.4rc=
1"
+
+CVE_STATUS[CVE-2019-18282] =3D "fixed-version: Fixed after version 5.4rc=
6"
+
+CVE_STATUS[CVE-2019-18660] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-18675] =3D "fixed-version: Fixed after version 4.17r=
c5"
+
+# CVE-2019-18680 has no known resolution
+
+CVE_STATUS[CVE-2019-18683] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-18786] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-18805] =3D "fixed-version: Fixed after version 5.1rc=
7"
+
+CVE_STATUS[CVE-2019-18806] =3D "fixed-version: Fixed after version 5.4rc=
2"
+
+CVE_STATUS[CVE-2019-18807] =3D "fixed-version: Fixed after version 5.4rc=
2"
+
+CVE_STATUS[CVE-2019-18808] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-18809] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-18810] =3D "fixed-version: Fixed after version 5.4rc=
2"
+
+CVE_STATUS[CVE-2019-18811] =3D "fixed-version: Fixed after version 5.4rc=
7"
+
+CVE_STATUS[CVE-2019-18812] =3D "fixed-version: Fixed after version 5.4rc=
7"
+
+CVE_STATUS[CVE-2019-18813] =3D "fixed-version: Fixed after version 5.4rc=
6"
+
+CVE_STATUS[CVE-2019-18814] =3D "fixed-version: Fixed after version 5.7rc=
7"
+
+CVE_STATUS[CVE-2019-18885] =3D "fixed-version: Fixed after version 5.1rc=
1"
+
+CVE_STATUS[CVE-2019-19036] =3D "fixed-version: Fixed after version 5.4rc=
1"
+
+CVE_STATUS[CVE-2019-19037] =3D "fixed-version: Fixed after version 5.5rc=
3"
+
+CVE_STATUS[CVE-2019-19039] =3D "fixed-version: Fixed after version 5.7rc=
1"
+
+CVE_STATUS[CVE-2019-19043] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-19044] =3D "fixed-version: Fixed after version 5.4rc=
6"
+
+CVE_STATUS[CVE-2019-19045] =3D "fixed-version: Fixed after version 5.4rc=
6"
+
+CVE_STATUS[CVE-2019-19046] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-19047] =3D "fixed-version: Fixed after version 5.4rc=
6"
+
+CVE_STATUS[CVE-2019-19048] =3D "fixed-version: Fixed after version 5.4rc=
3"
+
+CVE_STATUS[CVE-2019-19049] =3D "fixed-version: Fixed after version 5.4rc=
5"
+
+CVE_STATUS[CVE-2019-19050] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-19051] =3D "fixed-version: Fixed after version 5.4rc=
6"
+
+CVE_STATUS[CVE-2019-19052] =3D "fixed-version: Fixed after version 5.4rc=
7"
+
+CVE_STATUS[CVE-2019-19053] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-19054] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-19055] =3D "fixed-version: Fixed after version 5.4rc=
4"
+
+CVE_STATUS[CVE-2019-19056] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-19057] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-19058] =3D "fixed-version: Fixed after version 5.4rc=
4"
+
+CVE_STATUS[CVE-2019-19059] =3D "fixed-version: Fixed after version 5.4rc=
4"
+
+CVE_STATUS[CVE-2019-19060] =3D "fixed-version: Fixed after version 5.4rc=
3"
+
+CVE_STATUS[CVE-2019-19061] =3D "fixed-version: Fixed after version 5.4rc=
3"
+
+CVE_STATUS[CVE-2019-19062] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-19063] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-19064] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-19065] =3D "fixed-version: Fixed after version 5.4rc=
3"
+
+CVE_STATUS[CVE-2019-19066] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-19067] =3D "fixed-version: Fixed after version 5.4rc=
2"
+
+CVE_STATUS[CVE-2019-19068] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-19069] =3D "fixed-version: Fixed after version 5.4rc=
3"
+
+CVE_STATUS[CVE-2019-19070] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-19071] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-19072] =3D "fixed-version: Fixed after version 5.4rc=
1"
+
+CVE_STATUS[CVE-2019-19073] =3D "fixed-version: Fixed after version 5.4rc=
1"
+
+CVE_STATUS[CVE-2019-19074] =3D "fixed-version: Fixed after version 5.4rc=
1"
+
+CVE_STATUS[CVE-2019-19075] =3D "fixed-version: Fixed after version 5.4rc=
2"
+
+CVE_STATUS[CVE-2019-19076] =3D "fixed-version: Fixed after version 5.4rc=
1"
+
+CVE_STATUS[CVE-2019-19077] =3D "fixed-version: Fixed after version 5.4rc=
1"
+
+CVE_STATUS[CVE-2019-19078] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-19079] =3D "fixed-version: Fixed after version 5.3"
+
+CVE_STATUS[CVE-2019-19080] =3D "fixed-version: Fixed after version 5.4rc=
1"
+
+CVE_STATUS[CVE-2019-19081] =3D "fixed-version: Fixed after version 5.4rc=
1"
+
+CVE_STATUS[CVE-2019-19082] =3D "fixed-version: Fixed after version 5.4rc=
1"
+
+CVE_STATUS[CVE-2019-19083] =3D "fixed-version: Fixed after version 5.4rc=
2"
+
+CVE_STATUS[CVE-2019-19227] =3D "fixed-version: Fixed after version 5.1rc=
3"
+
+CVE_STATUS[CVE-2019-19241] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-19252] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-19318] =3D "fixed-version: Fixed after version 5.4rc=
1"
+
+CVE_STATUS[CVE-2019-19319] =3D "fixed-version: Fixed after version 5.2rc=
1"
+
+CVE_STATUS[CVE-2019-19332] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-19338] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-19377] =3D "fixed-version: Fixed after version 5.7rc=
1"
+
+# CVE-2019-19378 has no known resolution
+
+CVE_STATUS[CVE-2019-19447] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-19448] =3D "fixed-version: Fixed after version 5.9rc=
1"
+
+CVE_STATUS[CVE-2019-19449] =3D "fixed-version: Fixed after version 5.10r=
c1"
+
+CVE_STATUS[CVE-2019-19462] =3D "fixed-version: Fixed after version 5.8rc=
1"
+
+CVE_STATUS[CVE-2019-19523] =3D "fixed-version: Fixed after version 5.4rc=
3"
+
+CVE_STATUS[CVE-2019-19524] =3D "fixed-version: Fixed after version 5.4rc=
8"
+
+CVE_STATUS[CVE-2019-19525] =3D "fixed-version: Fixed after version 5.4rc=
2"
+
+CVE_STATUS[CVE-2019-19526] =3D "fixed-version: Fixed after version 5.4rc=
4"
+
+CVE_STATUS[CVE-2019-19527] =3D "fixed-version: Fixed after version 5.3rc=
4"
+
+CVE_STATUS[CVE-2019-19528] =3D "fixed-version: Fixed after version 5.4rc=
3"
+
+CVE_STATUS[CVE-2019-19529] =3D "fixed-version: Fixed after version 5.4rc=
7"
+
+CVE_STATUS[CVE-2019-19530] =3D "fixed-version: Fixed after version 5.3rc=
5"
+
+CVE_STATUS[CVE-2019-19531] =3D "fixed-version: Fixed after version 5.3rc=
4"
+
+CVE_STATUS[CVE-2019-19532] =3D "fixed-version: Fixed after version 5.4rc=
6"
+
+CVE_STATUS[CVE-2019-19533] =3D "fixed-version: Fixed after version 5.4rc=
1"
+
+CVE_STATUS[CVE-2019-19534] =3D "fixed-version: Fixed after version 5.4rc=
7"
+
+CVE_STATUS[CVE-2019-19535] =3D "fixed-version: Fixed after version 5.3rc=
4"
+
+CVE_STATUS[CVE-2019-19536] =3D "fixed-version: Fixed after version 5.3rc=
4"
+
+CVE_STATUS[CVE-2019-19537] =3D "fixed-version: Fixed after version 5.3rc=
5"
+
+CVE_STATUS[CVE-2019-19543] =3D "fixed-version: Fixed after version 5.2rc=
1"
+
+CVE_STATUS[CVE-2019-19602] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-19767] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2019-19768] =3D "fixed-version: Fixed after version 5.6rc=
4"
+
+CVE_STATUS[CVE-2019-19769] =3D "fixed-version: Fixed after version 5.6rc=
5"
+
+CVE_STATUS[CVE-2019-19770] =3D "fixed-version: Fixed after version 5.9rc=
1"
+
+CVE_STATUS[CVE-2019-19807] =3D "fixed-version: Fixed after version 5.4rc=
7"
+
+CVE_STATUS[CVE-2019-19813] =3D "fixed-version: Fixed after version 5.2rc=
1"
+
+# CVE-2019-19814 has no known resolution
+
+CVE_STATUS[CVE-2019-19815] =3D "fixed-version: Fixed after version 5.3rc=
1"
+
+CVE_STATUS[CVE-2019-19816] =3D "fixed-version: Fixed after version 5.2rc=
1"
+
+CVE_STATUS[CVE-2019-19922] =3D "fixed-version: Fixed after version 5.4rc=
1"
+
+CVE_STATUS[CVE-2019-19927] =3D "fixed-version: Fixed after version 5.1rc=
6"
+
+CVE_STATUS[CVE-2019-19947] =3D "fixed-version: Fixed after version 5.5rc=
3"
+
+CVE_STATUS[CVE-2019-19965] =3D "fixed-version: Fixed after version 5.5rc=
2"
+
+CVE_STATUS[CVE-2019-19966] =3D "fixed-version: Fixed after version 5.2rc=
1"
+
+CVE_STATUS[CVE-2019-1999] =3D "fixed-version: Fixed after version 5.1rc3=
"
+
+CVE_STATUS[CVE-2019-20054] =3D "fixed-version: Fixed after version 5.1rc=
3"
+
+CVE_STATUS[CVE-2019-20095] =3D "fixed-version: Fixed after version 5.2rc=
1"
+
+CVE_STATUS[CVE-2019-20096] =3D "fixed-version: Fixed after version 5.1rc=
4"
+
+CVE_STATUS[CVE-2019-2024] =3D "fixed-version: Fixed after version 4.16rc=
1"
+
+CVE_STATUS[CVE-2019-2025] =3D "fixed-version: Fixed after version 4.20rc=
5"
+
+CVE_STATUS[CVE-2019-20422] =3D "fixed-version: Fixed after version 5.4rc=
1"
+
+CVE_STATUS[CVE-2019-2054] =3D "fixed-version: Fixed after version 4.8rc1=
"
+
+CVE_STATUS[CVE-2019-20636] =3D "fixed-version: Fixed after version 5.5rc=
6"
+
+# CVE-2019-20794 has no known resolution
+
+CVE_STATUS[CVE-2019-20806] =3D "fixed-version: Fixed after version 5.2rc=
1"
+
+CVE_STATUS[CVE-2019-20810] =3D "fixed-version: Fixed after version 5.6rc=
1"
+
+CVE_STATUS[CVE-2019-20811] =3D "fixed-version: Fixed after version 5.1rc=
3"
+
+CVE_STATUS[CVE-2019-20812] =3D "fixed-version: Fixed after version 5.5rc=
3"
+
+CVE_STATUS[CVE-2019-20908] =3D "fixed-version: Fixed after version 5.4rc=
1"
+
+CVE_STATUS[CVE-2019-20934] =3D "fixed-version: Fixed after version 5.3rc=
2"
+
+CVE_STATUS[CVE-2019-2101] =3D "fixed-version: Fixed after version 5.1rc1=
"
+
+CVE_STATUS[CVE-2019-2181] =3D "fixed-version: Fixed after version 5.2rc1=
"
+
+CVE_STATUS[CVE-2019-2182] =3D "fixed-version: Fixed after version 4.16rc=
3"
+
+CVE_STATUS[CVE-2019-2213] =3D "fixed-version: Fixed after version 5.2rc6=
"
+
+CVE_STATUS[CVE-2019-2214] =3D "fixed-version: Fixed after version 5.3rc2=
"
+
+CVE_STATUS[CVE-2019-2215] =3D "fixed-version: Fixed after version 4.16rc=
1"
+
+CVE_STATUS[CVE-2019-25044] =3D "fixed-version: Fixed after version 5.2rc=
4"
+
+CVE_STATUS[CVE-2019-25045] =3D "fixed-version: Fixed after version 5.1"
+
+CVE_STATUS[CVE-2019-3016] =3D "fixed-version: Fixed after version 5.6rc1=
"
+
+CVE_STATUS[CVE-2019-3459] =3D "fixed-version: Fixed after version 5.1rc1=
"
+
+CVE_STATUS[CVE-2019-3460] =3D "fixed-version: Fixed after version 5.1rc1=
"
+
+CVE_STATUS[CVE-2019-3701] =3D "fixed-version: Fixed after version 5.0rc3=
"
+
+CVE_STATUS[CVE-2019-3819] =3D "fixed-version: Fixed after version 5.0rc6=
"
+
+CVE_STATUS[CVE-2019-3837] =3D "fixed-version: Fixed after version 3.18rc=
1"
+
+CVE_STATUS[CVE-2019-3846] =3D "fixed-version: Fixed after version 5.2rc6=
"
+
+CVE_STATUS[CVE-2019-3874] =3D "fixed-version: Fixed after version 5.2rc1=
"
+
+CVE_STATUS[CVE-2019-3882] =3D "fixed-version: Fixed after version 5.1rc4=
"
+
+CVE_STATUS[CVE-2019-3887] =3D "fixed-version: Fixed after version 5.1rc4=
"
+
+CVE_STATUS[CVE-2019-3892] =3D "fixed-version: Fixed after version 5.1rc6=
"
+
+CVE_STATUS[CVE-2019-3896] =3D "fixed-version: Fixed after version 2.6.35=
rc1"
+
+CVE_STATUS[CVE-2019-3900] =3D "fixed-version: Fixed after version 5.2rc4=
"
+
+CVE_STATUS[CVE-2019-3901] =3D "fixed-version: Fixed after version 4.6rc6=
"
+
+CVE_STATUS[CVE-2019-5108] =3D "fixed-version: Fixed after version 5.3"
+
+# Skipping CVE-2019-5489, no affected_versions
+
+CVE_STATUS[CVE-2019-6133] =3D "fixed-version: Fixed after version 5.0rc2=
"
+
+CVE_STATUS[CVE-2019-6974] =3D "fixed-version: Fixed after version 5.0rc6=
"
+
+CVE_STATUS[CVE-2019-7221] =3D "fixed-version: Fixed after version 5.0rc6=
"
+
+CVE_STATUS[CVE-2019-7222] =3D "fixed-version: Fixed after version 5.0rc6=
"
+
+CVE_STATUS[CVE-2019-7308] =3D "fixed-version: Fixed after version 5.0rc3=
"
+
+CVE_STATUS[CVE-2019-8912] =3D "fixed-version: Fixed after version 5.0rc8=
"
+
+CVE_STATUS[CVE-2019-8956] =3D "fixed-version: Fixed after version 5.0rc6=
"
+
+CVE_STATUS[CVE-2019-8980] =3D "fixed-version: Fixed after version 5.1rc1=
"
+
+CVE_STATUS[CVE-2019-9003] =3D "fixed-version: Fixed after version 5.0rc4=
"
+
+CVE_STATUS[CVE-2019-9162] =3D "fixed-version: Fixed after version 5.0rc7=
"
+
+CVE_STATUS[CVE-2019-9213] =3D "fixed-version: Fixed after version 5.0"
+
+CVE_STATUS[CVE-2019-9245] =3D "fixed-version: Fixed after version 5.0rc1=
"
+
+CVE_STATUS[CVE-2019-9444] =3D "fixed-version: Fixed after version 4.15rc=
2"
+
+CVE_STATUS[CVE-2019-9445] =3D "fixed-version: Fixed after version 5.1rc1=
"
+
+CVE_STATUS[CVE-2019-9453] =3D "fixed-version: Fixed after version 5.2rc1=
"
+
+CVE_STATUS[CVE-2019-9454] =3D "fixed-version: Fixed after version 4.15rc=
9"
+
+CVE_STATUS[CVE-2019-9455] =3D "fixed-version: Fixed after version 5.0rc1=
"
+
+CVE_STATUS[CVE-2019-9456] =3D "fixed-version: Fixed after version 4.16rc=
6"
+
+CVE_STATUS[CVE-2019-9457] =3D "fixed-version: Fixed after version 4.13rc=
1"
+
+CVE_STATUS[CVE-2019-9458] =3D "fixed-version: Fixed after version 4.19rc=
7"
+
+CVE_STATUS[CVE-2019-9466] =3D "fixed-version: Fixed after version 5.1rc1=
"
+
+CVE_STATUS[CVE-2019-9500] =3D "fixed-version: Fixed after version 5.1rc1=
"
+
+CVE_STATUS[CVE-2019-9503] =3D "fixed-version: Fixed after version 5.1rc1=
"
+
+CVE_STATUS[CVE-2019-9506] =3D "fixed-version: Fixed after version 5.2"
+
+CVE_STATUS[CVE-2019-9857] =3D "fixed-version: Fixed after version 5.1rc2=
"
+
+CVE_STATUS[CVE-2020-0009] =3D "fixed-version: Fixed after version 5.6rc3=
"
+
+CVE_STATUS[CVE-2020-0030] =3D "fixed-version: Fixed after version 4.16rc=
3"
+
+CVE_STATUS[CVE-2020-0041] =3D "fixed-version: Fixed after version 5.5rc2=
"
+
+CVE_STATUS[CVE-2020-0066] =3D "fixed-version: Fixed after version 4.3rc7=
"
+
+CVE_STATUS[CVE-2020-0067] =3D "fixed-version: Fixed after version 5.5rc1=
"
+
+CVE_STATUS[CVE-2020-0110] =3D "fixed-version: Fixed after version 5.6rc2=
"
+
+CVE_STATUS[CVE-2020-0255] =3D "fixed-version: Fixed after version 5.7rc4=
"
+
+CVE_STATUS[CVE-2020-0305] =3D "fixed-version: Fixed after version 5.5rc6=
"
+
+# CVE-2020-0347 has no known resolution
+
+CVE_STATUS[CVE-2020-0404] =3D "fixed-version: Fixed after version 5.6rc1=
"
+
+CVE_STATUS[CVE-2020-0423] =3D "fixed-version: Fixed after version 5.10rc=
1"
+
+CVE_STATUS[CVE-2020-0427] =3D "fixed-version: Fixed after version 5.5rc1=
"
+
+CVE_STATUS[CVE-2020-0429] =3D "fixed-version: Fixed after version 4.14rc=
4"
+
+CVE_STATUS[CVE-2020-0430] =3D "fixed-version: Fixed after version 4.18rc=
1"
+
+CVE_STATUS[CVE-2020-0431] =3D "fixed-version: Fixed after version 5.5rc6=
"
+
+CVE_STATUS[CVE-2020-0432] =3D "fixed-version: Fixed after version 5.6rc1=
"
+
+CVE_STATUS[CVE-2020-0433] =3D "fixed-version: Fixed after version 4.19rc=
1"
+
+CVE_STATUS[CVE-2020-0435] =3D "fixed-version: Fixed after version 4.19rc=
1"
+
+CVE_STATUS[CVE-2020-0444] =3D "fixed-version: Fixed after version 5.6rc4=
"
+
+CVE_STATUS[CVE-2020-0465] =3D "fixed-version: Fixed after version 5.9rc4=
"
+
+CVE_STATUS[CVE-2020-0466] =3D "fixed-version: Fixed after version 5.9rc2=
"
+
+CVE_STATUS[CVE-2020-0543] =3D "fixed-version: Fixed after version 5.8rc1=
"
+
+CVE_STATUS[CVE-2020-10135] =3D "fixed-version: Fixed after version 5.8rc=
1"
+
+CVE_STATUS[CVE-2020-10690] =3D "fixed-version: Fixed after version 5.5rc=
5"
+
+# CVE-2020-10708 has no known resolution
+
+CVE_STATUS[CVE-2020-10711] =3D "fixed-version: Fixed after version 5.7rc=
6"
+
+CVE_STATUS[CVE-2020-10720] =3D "fixed-version: Fixed after version 5.2rc=
3"
+
+CVE_STATUS[CVE-2020-10732] =3D "fixed-version: Fixed after version 5.7"
+
+CVE_STATUS[CVE-2020-10742] =3D "fixed-version: Fixed after version 3.16r=
c1"
+
+CVE_STATUS[CVE-2020-10751] =3D "fixed-version: Fixed after version 5.7rc=
4"
+
+CVE_STATUS[CVE-2020-10757] =3D "fixed-version: Fixed after version 5.8rc=
1"
+
+CVE_STATUS[CVE-2020-10766] =3D "fixed-version: Fixed after version 5.8rc=
1"
+
+CVE_STATUS[CVE-2020-10767] =3D "fixed-version: Fixed after version 5.8rc=
1"
+
+CVE_STATUS[CVE-2020-10768] =3D "fixed-version: Fixed after version 5.8rc=
1"
+
+CVE_STATUS[CVE-2020-10769] =3D "fixed-version: Fixed after version 5.0rc=
3"
+
+CVE_STATUS[CVE-2020-10773] =3D "fixed-version: Fixed after version 5.4rc=
6"
+
+# CVE-2020-10774 has no known resolution
+
+CVE_STATUS[CVE-2020-10781] =3D "fixed-version: Fixed after version 5.8rc=
6"
+
+CVE_STATUS[CVE-2020-10942] =3D "fixed-version: Fixed after version 5.6rc=
4"
+
+CVE_STATUS[CVE-2020-11494] =3D "fixed-version: Fixed after version 5.7rc=
1"
+
+CVE_STATUS[CVE-2020-11565] =3D "fixed-version: Fixed after version 5.7rc=
1"
+
+CVE_STATUS[CVE-2020-11608] =3D "fixed-version: Fixed after version 5.7rc=
1"
+
+CVE_STATUS[CVE-2020-11609] =3D "fixed-version: Fixed after version 5.7rc=
1"
+
+CVE_STATUS[CVE-2020-11668] =3D "fixed-version: Fixed after version 5.7rc=
1"
+
+CVE_STATUS[CVE-2020-11669] =3D "fixed-version: Fixed after version 5.2rc=
1"
+
+# CVE-2020-11725 has no known resolution
+
+CVE_STATUS[CVE-2020-11884] =3D "fixed-version: Fixed after version 5.7rc=
4"
+
+# CVE-2020-11935 has no known resolution
+
+CVE_STATUS[CVE-2020-12114] =3D "fixed-version: Fixed after version 5.3rc=
1"
+
+CVE_STATUS[CVE-2020-12351] =3D "fixed-version: Fixed after version 5.10r=
c1"
+
+CVE_STATUS[CVE-2020-12352] =3D "fixed-version: Fixed after version 5.10r=
c1"
+
+CVE_STATUS[CVE-2020-12362] =3D "fixed-version: Fixed after version 5.11r=
c1"
+
+CVE_STATUS[CVE-2020-12363] =3D "fixed-version: Fixed after version 5.11r=
c1"
+
+CVE_STATUS[CVE-2020-12364] =3D "fixed-version: Fixed after version 5.11r=
c1"
+
+CVE_STATUS[CVE-2020-12464] =3D "fixed-version: Fixed after version 5.7rc=
3"
+
+CVE_STATUS[CVE-2020-12465] =3D "fixed-version: Fixed after version 5.6rc=
6"
+
+CVE_STATUS[CVE-2020-12652] =3D "fixed-version: Fixed after version 5.5rc=
7"
+
+CVE_STATUS[CVE-2020-12653] =3D "fixed-version: Fixed after version 5.6rc=
1"
+
+CVE_STATUS[CVE-2020-12654] =3D "fixed-version: Fixed after version 5.6rc=
1"
+
+CVE_STATUS[CVE-2020-12655] =3D "fixed-version: Fixed after version 5.7rc=
1"
+
+CVE_STATUS[CVE-2020-12656] =3D "fixed-version: Fixed after version 5.8rc=
1"
+
+CVE_STATUS[CVE-2020-12657] =3D "fixed-version: Fixed after version 5.7rc=
1"
+
+CVE_STATUS[CVE-2020-12659] =3D "fixed-version: Fixed after version 5.7rc=
2"
+
+CVE_STATUS[CVE-2020-12768] =3D "fixed-version: Fixed after version 5.6rc=
4"
+
+CVE_STATUS[CVE-2020-12769] =3D "fixed-version: Fixed after version 5.5rc=
6"
+
+CVE_STATUS[CVE-2020-12770] =3D "fixed-version: Fixed after version 5.7rc=
3"
+
+CVE_STATUS[CVE-2020-12771] =3D "fixed-version: Fixed after version 5.8rc=
2"
+
+CVE_STATUS[CVE-2020-12826] =3D "fixed-version: Fixed after version 5.7rc=
1"
+
+CVE_STATUS[CVE-2020-12888] =3D "fixed-version: Fixed after version 5.8rc=
1"
+
+CVE_STATUS[CVE-2020-12912] =3D "fixed-version: Fixed after version 5.10r=
c4"
+
+CVE_STATUS[CVE-2020-13143] =3D "fixed-version: Fixed after version 5.7rc=
6"
+
+CVE_STATUS[CVE-2020-13974] =3D "fixed-version: Fixed after version 5.8rc=
1"
+
+# CVE-2020-14304 has no known resolution
+
+CVE_STATUS[CVE-2020-14305] =3D "fixed-version: Fixed after version 4.12r=
c1"
+
+CVE_STATUS[CVE-2020-14314] =3D "fixed-version: Fixed after version 5.9rc=
2"
+
+CVE_STATUS[CVE-2020-14331] =3D "fixed-version: Fixed after version 5.9rc=
1"
+
+CVE_STATUS[CVE-2020-14351] =3D "fixed-version: Fixed after version 5.10r=
c1"
+
+CVE_STATUS[CVE-2020-14353] =3D "fixed-version: Fixed after version 4.14r=
c3"
+
+CVE_STATUS[CVE-2020-14356] =3D "fixed-version: Fixed after version 5.8rc=
5"
+
+CVE_STATUS[CVE-2020-14381] =3D "fixed-version: Fixed after version 5.6rc=
6"
+
+CVE_STATUS[CVE-2020-14385] =3D "fixed-version: Fixed after version 5.9rc=
4"
+
+CVE_STATUS[CVE-2020-14386] =3D "fixed-version: Fixed after version 5.9rc=
4"
+
+CVE_STATUS[CVE-2020-14390] =3D "fixed-version: Fixed after version 5.9rc=
6"
+
+CVE_STATUS[CVE-2020-14416] =3D "fixed-version: Fixed after version 5.5"
+
+CVE_STATUS[CVE-2020-15393] =3D "fixed-version: Fixed after version 5.8rc=
3"
+
+CVE_STATUS[CVE-2020-15436] =3D "fixed-version: Fixed after version 5.8rc=
2"
+
+CVE_STATUS[CVE-2020-15437] =3D "fixed-version: Fixed after version 5.8rc=
7"
+
+CVE_STATUS[CVE-2020-15780] =3D "fixed-version: Fixed after version 5.8rc=
3"
+
+# CVE-2020-15802 has no known resolution
+
+CVE_STATUS[CVE-2020-15852] =3D "fixed-version: Fixed after version 5.8rc=
6"
+
+CVE_STATUS[CVE-2020-16119] =3D "fixed-version: Fixed after version 5.15r=
c2"
+
+CVE_STATUS[CVE-2020-16120] =3D "fixed-version: Fixed after version 5.8rc=
1"
+
+CVE_STATUS[CVE-2020-16166] =3D "fixed-version: Fixed after version 5.8"
+
+CVE_STATUS[CVE-2020-1749] =3D "fixed-version: Fixed after version 5.5rc1=
"
+
+CVE_STATUS[CVE-2020-24394] =3D "fixed-version: Fixed after version 5.8rc=
4"
+
+CVE_STATUS[CVE-2020-24490] =3D "fixed-version: Fixed after version 5.8"
+
+# CVE-2020-24502 has no known resolution
+
+# CVE-2020-24503 has no known resolution
+
+CVE_STATUS[CVE-2020-24504] =3D "fixed-version: Fixed after version 5.12r=
c1"
+
+CVE_STATUS[CVE-2020-24586] =3D "fixed-version: Fixed after version 5.13r=
c4"
+
+CVE_STATUS[CVE-2020-24587] =3D "fixed-version: Fixed after version 5.13r=
c4"
+
+CVE_STATUS[CVE-2020-24588] =3D "fixed-version: Fixed after version 5.13r=
c4"
+
+CVE_STATUS[CVE-2020-25211] =3D "fixed-version: Fixed after version 5.9rc=
7"
+
+CVE_STATUS[CVE-2020-25212] =3D "fixed-version: Fixed after version 5.9rc=
1"
+
+# CVE-2020-25220 has no known resolution
+
+CVE_STATUS[CVE-2020-25221] =3D "fixed-version: Fixed after version 5.9rc=
4"
+
+CVE_STATUS[CVE-2020-25284] =3D "fixed-version: Fixed after version 5.9rc=
5"
+
+CVE_STATUS[CVE-2020-25285] =3D "fixed-version: Fixed after version 5.9rc=
4"
+
+CVE_STATUS[CVE-2020-25639] =3D "fixed-version: Fixed after version 5.12r=
c1"
+
+CVE_STATUS[CVE-2020-25641] =3D "fixed-version: Fixed after version 5.9rc=
4"
+
+CVE_STATUS[CVE-2020-25643] =3D "fixed-version: Fixed after version 5.9rc=
7"
+
+CVE_STATUS[CVE-2020-25645] =3D "fixed-version: Fixed after version 5.9rc=
7"
+
+CVE_STATUS[CVE-2020-25656] =3D "fixed-version: Fixed after version 5.10r=
c2"
+
+# CVE-2020-25661 has no known resolution
+
+# CVE-2020-25662 has no known resolution
+
+CVE_STATUS[CVE-2020-25668] =3D "fixed-version: Fixed after version 5.10r=
c3"
+
+CVE_STATUS[CVE-2020-25669] =3D "fixed-version: Fixed after version 5.10r=
c5"
+
+CVE_STATUS[CVE-2020-25670] =3D "fixed-version: Fixed after version 5.12r=
c7"
+
+CVE_STATUS[CVE-2020-25671] =3D "fixed-version: Fixed after version 5.12r=
c7"
+
+CVE_STATUS[CVE-2020-25672] =3D "fixed-version: Fixed after version 5.12r=
c7"
+
+CVE_STATUS[CVE-2020-25673] =3D "fixed-version: Fixed after version 5.12r=
c7"
+
+CVE_STATUS[CVE-2020-25704] =3D "fixed-version: Fixed after version 5.10r=
c3"
+
+CVE_STATUS[CVE-2020-25705] =3D "fixed-version: Fixed after version 5.10r=
c1"
+
+CVE_STATUS[CVE-2020-26088] =3D "fixed-version: Fixed after version 5.9rc=
1"
+
+CVE_STATUS[CVE-2020-26139] =3D "fixed-version: Fixed after version 5.13r=
c4"
+
+# CVE-2020-26140 has no known resolution
+
+CVE_STATUS[CVE-2020-26141] =3D "fixed-version: Fixed after version 5.13r=
c4"
+
+# CVE-2020-26142 has no known resolution
+
+# CVE-2020-26143 has no known resolution
+
+CVE_STATUS[CVE-2020-26145] =3D "fixed-version: Fixed after version 5.13r=
c4"
+
+CVE_STATUS[CVE-2020-26147] =3D "fixed-version: Fixed after version 5.13r=
c4"
+
+CVE_STATUS[CVE-2020-26541] =3D "fixed-version: Fixed after version 5.13r=
c1"
+
+CVE_STATUS[CVE-2020-26555] =3D "fixed-version: Fixed after version 5.13r=
c1"
+
+# CVE-2020-26556 has no known resolution
+
+# CVE-2020-26557 has no known resolution
+
+CVE_STATUS[CVE-2020-26558] =3D "fixed-version: Fixed after version 5.13r=
c1"
+
+# CVE-2020-26559 has no known resolution
+
+# CVE-2020-26560 has no known resolution
+
+CVE_STATUS[CVE-2020-27066] =3D "fixed-version: Fixed after version 5.6"
+
+CVE_STATUS[CVE-2020-27067] =3D "fixed-version: Fixed after version 4.14r=
c4"
+
+CVE_STATUS[CVE-2020-27068] =3D "fixed-version: Fixed after version 5.6rc=
2"
+
+CVE_STATUS[CVE-2020-27152] =3D "fixed-version: Fixed after version 5.10r=
c1"
+
+CVE_STATUS[CVE-2020-27170] =3D "fixed-version: Fixed after version 5.12r=
c5"
+
+CVE_STATUS[CVE-2020-27171] =3D "fixed-version: Fixed after version 5.12r=
c5"
+
+CVE_STATUS[CVE-2020-27194] =3D "fixed-version: Fixed after version 5.9"
+
+CVE_STATUS[CVE-2020-2732] =3D "fixed-version: Fixed after version 5.6rc4=
"
+
+CVE_STATUS[CVE-2020-27673] =3D "fixed-version: Fixed after version 5.10r=
c1"
+
+CVE_STATUS[CVE-2020-27675] =3D "fixed-version: Fixed after version 5.10r=
c1"
+
+CVE_STATUS[CVE-2020-27777] =3D "fixed-version: Fixed after version 5.10r=
c1"
+
+CVE_STATUS[CVE-2020-27784] =3D "fixed-version: Fixed after version 5.10r=
c1"
+
+CVE_STATUS[CVE-2020-27786] =3D "fixed-version: Fixed after version 5.7rc=
6"
+
+CVE_STATUS[CVE-2020-27815] =3D "fixed-version: Fixed after version 5.11r=
c1"
+
+CVE_STATUS[CVE-2020-27820] =3D "fixed-version: Fixed after version 5.16r=
c1"
+
+CVE_STATUS[CVE-2020-27825] =3D "fixed-version: Fixed after version 5.10r=
c1"
+
+CVE_STATUS[CVE-2020-27830] =3D "fixed-version: Fixed after version 5.10r=
c7"
+
+CVE_STATUS[CVE-2020-27835] =3D "fixed-version: Fixed after version 5.10r=
c6"
+
+CVE_STATUS[CVE-2020-28097] =3D "fixed-version: Fixed after version 5.9rc=
6"
+
+CVE_STATUS[CVE-2020-28374] =3D "fixed-version: Fixed after version 5.11r=
c4"
+
+CVE_STATUS[CVE-2020-28588] =3D "fixed-version: Fixed after version 5.10r=
c7"
+
+CVE_STATUS[CVE-2020-28915] =3D "fixed-version: Fixed after version 5.9"
+
+CVE_STATUS[CVE-2020-28941] =3D "fixed-version: Fixed after version 5.10r=
c5"
+
+CVE_STATUS[CVE-2020-28974] =3D "fixed-version: Fixed after version 5.10r=
c3"
+
+CVE_STATUS[CVE-2020-29368] =3D "fixed-version: Fixed after version 5.8rc=
1"
+
+CVE_STATUS[CVE-2020-29369] =3D "fixed-version: Fixed after version 5.8rc=
7"
+
+CVE_STATUS[CVE-2020-29370] =3D "fixed-version: Fixed after version 5.6rc=
7"
+
+CVE_STATUS[CVE-2020-29371] =3D "fixed-version: Fixed after version 5.9rc=
2"
+
+CVE_STATUS[CVE-2020-29372] =3D "fixed-version: Fixed after version 5.7rc=
3"
+
+CVE_STATUS[CVE-2020-29373] =3D "fixed-version: Fixed after version 5.6rc=
2"
+
+CVE_STATUS[CVE-2020-29374] =3D "fixed-version: Fixed after version 5.8rc=
1"
+
+CVE_STATUS[CVE-2020-29534] =3D "fixed-version: Fixed after version 5.10r=
c1"
+
+CVE_STATUS[CVE-2020-29568] =3D "fixed-version: Fixed after version 5.11r=
c1"
+
+CVE_STATUS[CVE-2020-29569] =3D "fixed-version: Fixed after version 5.11r=
c1"
+
+CVE_STATUS[CVE-2020-29660] =3D "fixed-version: Fixed after version 5.10r=
c7"
+
+CVE_STATUS[CVE-2020-29661] =3D "fixed-version: Fixed after version 5.10r=
c7"
+
+CVE_STATUS[CVE-2020-35499] =3D "fixed-version: Fixed after version 5.11r=
c1"
+
+# CVE-2020-35501 has no known resolution
+
+CVE_STATUS[CVE-2020-35508] =3D "fixed-version: Fixed after version 5.10r=
c3"
+
+CVE_STATUS[CVE-2020-35513] =3D "fixed-version: Fixed after version 4.17r=
c1"
+
+CVE_STATUS[CVE-2020-35519] =3D "fixed-version: Fixed after version 5.10r=
c7"
+
+CVE_STATUS[CVE-2020-36158] =3D "fixed-version: Fixed after version 5.11r=
c1"
+
+CVE_STATUS[CVE-2020-36310] =3D "fixed-version: Fixed after version 5.8rc=
1"
+
+CVE_STATUS[CVE-2020-36311] =3D "fixed-version: Fixed after version 5.9rc=
5"
+
+CVE_STATUS[CVE-2020-36312] =3D "fixed-version: Fixed after version 5.9rc=
5"
+
+CVE_STATUS[CVE-2020-36313] =3D "fixed-version: Fixed after version 5.7rc=
1"
+
+CVE_STATUS[CVE-2020-36322] =3D "fixed-version: Fixed after version 5.11r=
c1"
+
+CVE_STATUS[CVE-2020-36385] =3D "fixed-version: Fixed after version 5.10r=
c1"
+
+CVE_STATUS[CVE-2020-36386] =3D "fixed-version: Fixed after version 5.9rc=
1"
+
+CVE_STATUS[CVE-2020-36387] =3D "fixed-version: Fixed after version 5.9rc=
1"
+
+CVE_STATUS[CVE-2020-36516] =3D "fixed-version: Fixed after version 5.17r=
c2"
+
+CVE_STATUS[CVE-2020-36557] =3D "fixed-version: Fixed after version 5.7rc=
1"
+
+CVE_STATUS[CVE-2020-36558] =3D "fixed-version: Fixed after version 5.6rc=
3"
+
+CVE_STATUS[CVE-2020-36691] =3D "fixed-version: Fixed after version 5.8rc=
1"
+
+CVE_STATUS[CVE-2020-36694] =3D "fixed-version: Fixed after version 5.10"
+
+CVE_STATUS[CVE-2020-3702] =3D "fixed-version: Fixed after version 5.12rc=
1"
+
+CVE_STATUS[CVE-2020-4788] =3D "fixed-version: Fixed after version 5.10rc=
5"
+
+CVE_STATUS[CVE-2020-7053] =3D "fixed-version: Fixed after version 5.2rc1=
"
+
+CVE_STATUS[CVE-2020-8428] =3D "fixed-version: Fixed after version 5.5"
+
+CVE_STATUS[CVE-2020-8647] =3D "fixed-version: Fixed after version 5.6rc5=
"
+
+CVE_STATUS[CVE-2020-8648] =3D "fixed-version: Fixed after version 5.6rc3=
"
+
+CVE_STATUS[CVE-2020-8649] =3D "fixed-version: Fixed after version 5.6rc5=
"
+
+CVE_STATUS[CVE-2020-8694] =3D "fixed-version: Fixed after version 5.10rc=
4"
+
+# CVE-2020-8832 has no known resolution
+
+CVE_STATUS[CVE-2020-8834] =3D "fixed-version: Fixed after version 4.18rc=
1"
+
+CVE_STATUS[CVE-2020-8835] =3D "fixed-version: Fixed after version 5.7rc1=
"
+
+CVE_STATUS[CVE-2020-8992] =3D "fixed-version: Fixed after version 5.6rc2=
"
+
+CVE_STATUS[CVE-2020-9383] =3D "fixed-version: Fixed after version 5.6rc4=
"
+
+CVE_STATUS[CVE-2020-9391] =3D "fixed-version: Fixed after version 5.6rc3=
"
+
+CVE_STATUS[CVE-2021-0129] =3D "fixed-version: Fixed after version 5.13rc=
1"
+
+CVE_STATUS[CVE-2021-0342] =3D "fixed-version: Fixed after version 5.8rc1=
"
+
+# CVE-2021-0399 has no known resolution
+
+CVE_STATUS[CVE-2021-0447] =3D "fixed-version: Fixed after version 4.15rc=
1"
+
+CVE_STATUS[CVE-2021-0448] =3D "fixed-version: Fixed after version 5.9rc7=
"
+
+CVE_STATUS[CVE-2021-0512] =3D "fixed-version: Fixed after version 5.12rc=
1"
+
+CVE_STATUS[CVE-2021-0605] =3D "fixed-version: Fixed after version 5.8"
+
+# CVE-2021-0606 has no known resolution
+
+# CVE-2021-0695 has no known resolution
+
+CVE_STATUS[CVE-2021-0707] =3D "fixed-version: Fixed after version 5.11rc=
3"
+
+CVE_STATUS[CVE-2021-0920] =3D "fixed-version: Fixed after version 5.14rc=
4"
+
+# CVE-2021-0924 has no known resolution
+
+CVE_STATUS[CVE-2021-0929] =3D "fixed-version: Fixed after version 5.6rc1=
"
+
+CVE_STATUS[CVE-2021-0935] =3D "fixed-version: Fixed after version 4.16rc=
7"
+
+# CVE-2021-0936 has no known resolution
+
+CVE_STATUS[CVE-2021-0937] =3D "fixed-version: Fixed after version 5.12rc=
8"
+
+CVE_STATUS[CVE-2021-0938] =3D "fixed-version: Fixed after version 5.10rc=
4"
+
+CVE_STATUS[CVE-2021-0941] =3D "fixed-version: Fixed after version 5.12rc=
1"
+
+# CVE-2021-0961 has no known resolution
+
+CVE_STATUS[CVE-2021-1048] =3D "fixed-version: Fixed after version 5.9rc4=
"
+
+CVE_STATUS[CVE-2021-20177] =3D "fixed-version: Fixed after version 5.5rc=
1"
+
+CVE_STATUS[CVE-2021-20194] =3D "fixed-version: Fixed after version 5.10r=
c1"
+
+# CVE-2021-20219 has no known resolution
+
+CVE_STATUS[CVE-2021-20226] =3D "fixed-version: Fixed after version 5.10r=
c1"
+
+CVE_STATUS[CVE-2021-20239] =3D "fixed-version: Fixed after version 5.9rc=
1"
+
+CVE_STATUS[CVE-2021-20261] =3D "fixed-version: Fixed after version 4.5rc=
5"
+
+CVE_STATUS[CVE-2021-20265] =3D "fixed-version: Fixed after version 4.5rc=
3"
+
+CVE_STATUS[CVE-2021-20268] =3D "fixed-version: Fixed after version 5.11r=
c5"
+
+CVE_STATUS[CVE-2021-20292] =3D "fixed-version: Fixed after version 5.9rc=
1"
+
+CVE_STATUS[CVE-2021-20317] =3D "fixed-version: Fixed after version 5.4rc=
1"
+
+CVE_STATUS[CVE-2021-20320] =3D "fixed-version: Fixed after version 5.15r=
c3"
+
+CVE_STATUS[CVE-2021-20321] =3D "fixed-version: Fixed after version 5.15r=
c5"
+
+CVE_STATUS[CVE-2021-20322] =3D "fixed-version: Fixed after version 5.15r=
c1"
+
+CVE_STATUS[CVE-2021-21781] =3D "fixed-version: Fixed after version 5.11r=
c7"
+
+CVE_STATUS[CVE-2021-22543] =3D "fixed-version: Fixed after version 5.13"
+
+CVE_STATUS[CVE-2021-22555] =3D "fixed-version: Fixed after version 5.12r=
c8"
+
+CVE_STATUS[CVE-2021-22600] =3D "fixed-version: Fixed after version 5.16r=
c6"
+
+CVE_STATUS[CVE-2021-23133] =3D "fixed-version: Fixed after version 5.12r=
c8"
+
+CVE_STATUS[CVE-2021-23134] =3D "fixed-version: Fixed after version 5.13r=
c1"
+
+CVE_STATUS[CVE-2021-26401] =3D "fixed-version: Fixed after version 5.17r=
c8"
+
+CVE_STATUS[CVE-2021-26708] =3D "fixed-version: Fixed after version 5.11r=
c7"
+
+CVE_STATUS[CVE-2021-26930] =3D "fixed-version: Fixed after version 5.12r=
c1"
+
+CVE_STATUS[CVE-2021-26931] =3D "fixed-version: Fixed after version 5.12r=
c1"
+
+CVE_STATUS[CVE-2021-26932] =3D "fixed-version: Fixed after version 5.12r=
c1"
+
+# CVE-2021-26934 has no known resolution
+
+CVE_STATUS[CVE-2021-27363] =3D "fixed-version: Fixed after version 5.12r=
c2"
+
+CVE_STATUS[CVE-2021-27364] =3D "fixed-version: Fixed after version 5.12r=
c2"
+
+CVE_STATUS[CVE-2021-27365] =3D "fixed-version: Fixed after version 5.12r=
c2"
+
+CVE_STATUS[CVE-2021-28038] =3D "fixed-version: Fixed after version 5.12r=
c2"
+
+CVE_STATUS[CVE-2021-28039] =3D "fixed-version: Fixed after version 5.12r=
c2"
+
+CVE_STATUS[CVE-2021-28375] =3D "fixed-version: Fixed after version 5.12r=
c3"
+
+CVE_STATUS[CVE-2021-28660] =3D "fixed-version: Fixed after version 5.12r=
c3"
+
+CVE_STATUS[CVE-2021-28688] =3D "fixed-version: Fixed after version 5.12r=
c6"
+
+CVE_STATUS[CVE-2021-28691] =3D "fixed-version: Fixed after version 5.13r=
c6"
+
+CVE_STATUS[CVE-2021-28711] =3D "fixed-version: Fixed after version 5.16r=
c7"
+
+CVE_STATUS[CVE-2021-28712] =3D "fixed-version: Fixed after version 5.16r=
c7"
+
+CVE_STATUS[CVE-2021-28713] =3D "fixed-version: Fixed after version 5.16r=
c7"
+
+CVE_STATUS[CVE-2021-28714] =3D "fixed-version: Fixed after version 5.16r=
c7"
+
+CVE_STATUS[CVE-2021-28715] =3D "fixed-version: Fixed after version 5.16r=
c7"
+
+CVE_STATUS[CVE-2021-28950] =3D "fixed-version: Fixed after version 5.12r=
c4"
+
+CVE_STATUS[CVE-2021-28951] =3D "fixed-version: Fixed after version 5.12r=
c2"
+
+CVE_STATUS[CVE-2021-28952] =3D "fixed-version: Fixed after version 5.12r=
c4"
+
+CVE_STATUS[CVE-2021-28964] =3D "fixed-version: Fixed after version 5.12r=
c4"
+
+CVE_STATUS[CVE-2021-28971] =3D "fixed-version: Fixed after version 5.12r=
c4"
+
+CVE_STATUS[CVE-2021-28972] =3D "fixed-version: Fixed after version 5.12r=
c4"
+
+CVE_STATUS[CVE-2021-29154] =3D "fixed-version: Fixed after version 5.12r=
c7"
+
+CVE_STATUS[CVE-2021-29155] =3D "fixed-version: Fixed after version 5.12r=
c8"
+
+CVE_STATUS[CVE-2021-29264] =3D "fixed-version: Fixed after version 5.12r=
c3"
+
+CVE_STATUS[CVE-2021-29265] =3D "fixed-version: Fixed after version 5.12r=
c3"
+
+CVE_STATUS[CVE-2021-29266] =3D "fixed-version: Fixed after version 5.12r=
c4"
+
+CVE_STATUS[CVE-2021-29646] =3D "fixed-version: Fixed after version 5.12r=
c5"
+
+CVE_STATUS[CVE-2021-29647] =3D "fixed-version: Fixed after version 5.12r=
c5"
+
+CVE_STATUS[CVE-2021-29648] =3D "fixed-version: Fixed after version 5.12r=
c5"
+
+CVE_STATUS[CVE-2021-29649] =3D "fixed-version: Fixed after version 5.12r=
c5"
+
+CVE_STATUS[CVE-2021-29650] =3D "fixed-version: Fixed after version 5.12r=
c5"
+
+CVE_STATUS[CVE-2021-29657] =3D "fixed-version: Fixed after version 5.12r=
c6"
+
+CVE_STATUS[CVE-2021-30002] =3D "fixed-version: Fixed after version 5.12r=
c1"
+
+CVE_STATUS[CVE-2021-30178] =3D "fixed-version: Fixed after version 5.12r=
c2"
+
+CVE_STATUS[CVE-2021-31440] =3D "fixed-version: Fixed after version 5.13r=
c1"
+
+CVE_STATUS[CVE-2021-3178] =3D "fixed-version: Fixed after version 5.11rc=
5"
+
+CVE_STATUS[CVE-2021-31829] =3D "fixed-version: Fixed after version 5.13r=
c1"
+
+CVE_STATUS[CVE-2021-31916] =3D "fixed-version: Fixed after version 5.12r=
c5"
+
+CVE_STATUS[CVE-2021-32078] =3D "fixed-version: Fixed after version 5.13r=
c1"
+
+CVE_STATUS[CVE-2021-32399] =3D "fixed-version: Fixed after version 5.13r=
c1"
+
+CVE_STATUS[CVE-2021-32606] =3D "fixed-version: Fixed after version 5.13r=
c4"
+
+CVE_STATUS[CVE-2021-33033] =3D "fixed-version: Fixed after version 5.12r=
c3"
+
+CVE_STATUS[CVE-2021-33034] =3D "fixed-version: Fixed after version 5.13r=
c1"
+
+CVE_STATUS[CVE-2021-33061] =3D "fixed-version: Fixed after version 5.18r=
c1"
+
+CVE_STATUS[CVE-2021-33098] =3D "fixed-version: Fixed after version 5.13r=
c4"
+
+CVE_STATUS[CVE-2021-33135] =3D "fixed-version: Fixed after version 5.17r=
c8"
+
+CVE_STATUS[CVE-2021-33200] =3D "fixed-version: Fixed after version 5.13r=
c4"
+
+CVE_STATUS[CVE-2021-3347] =3D "fixed-version: Fixed after version 5.11rc=
6"
+
+CVE_STATUS[CVE-2021-3348] =3D "fixed-version: Fixed after version 5.11rc=
6"
+
+CVE_STATUS[CVE-2021-33624] =3D "fixed-version: Fixed after version 5.13r=
c7"
+
+CVE_STATUS[CVE-2021-33655] =3D "fixed-version: Fixed after version 5.19r=
c6"
+
+CVE_STATUS[CVE-2021-33656] =3D "fixed-version: Fixed after version 5.12r=
c1"
+
+CVE_STATUS[CVE-2021-33909] =3D "fixed-version: Fixed after version 5.14r=
c3"
+
+CVE_STATUS[CVE-2021-3411] =3D "fixed-version: Fixed after version 5.10"
+
+CVE_STATUS[CVE-2021-3428] =3D "fixed-version: Fixed after version 5.9rc2=
"
+
+CVE_STATUS[CVE-2021-3444] =3D "fixed-version: Fixed after version 5.12rc=
1"
+
+CVE_STATUS[CVE-2021-34556] =3D "fixed-version: Fixed after version 5.14r=
c4"
+
+CVE_STATUS[CVE-2021-34693] =3D "fixed-version: Fixed after version 5.13r=
c7"
+
+CVE_STATUS[CVE-2021-3483] =3D "fixed-version: Fixed after version 5.12rc=
6"
+
+CVE_STATUS[CVE-2021-34866] =3D "fixed-version: Fixed after version 5.14"
+
+CVE_STATUS[CVE-2021-3489] =3D "fixed-version: Fixed after version 5.13rc=
4"
+
+CVE_STATUS[CVE-2021-3490] =3D "fixed-version: Fixed after version 5.13rc=
4"
+
+CVE_STATUS[CVE-2021-3491] =3D "fixed-version: Fixed after version 5.13rc=
1"
+
+# CVE-2021-3492 has no known resolution
+
+CVE_STATUS[CVE-2021-3493] =3D "fixed-version: Fixed after version 5.11rc=
1"
+
+CVE_STATUS[CVE-2021-34981] =3D "fixed-version: Fixed after version 5.14r=
c1"
+
+CVE_STATUS[CVE-2021-3501] =3D "fixed-version: Fixed after version 5.12rc=
8"
+
+CVE_STATUS[CVE-2021-35039] =3D "fixed-version: Fixed after version 5.13"
+
+CVE_STATUS[CVE-2021-3506] =3D "fixed-version: Fixed after version 5.13rc=
1"
+
+# CVE-2021-3542 has no known resolution
+
+CVE_STATUS[CVE-2021-3543] =3D "fixed-version: Fixed after version 5.13rc=
1"
+
+CVE_STATUS[CVE-2021-35477] =3D "fixed-version: Fixed after version 5.14r=
c4"
+
+CVE_STATUS[CVE-2021-3564] =3D "fixed-version: Fixed after version 5.13rc=
5"
+
+CVE_STATUS[CVE-2021-3573] =3D "fixed-version: Fixed after version 5.13rc=
5"
+
+CVE_STATUS[CVE-2021-3587] =3D "fixed-version: Fixed after version 5.13rc=
5"
+
+CVE_STATUS[CVE-2021-3600] =3D "fixed-version: Fixed after version 5.11"
+
+CVE_STATUS[CVE-2021-3609] =3D "fixed-version: Fixed after version 5.14rc=
1"
+
+CVE_STATUS[CVE-2021-3612] =3D "fixed-version: Fixed after version 5.12rc=
1"
+
+CVE_STATUS[CVE-2021-3635] =3D "fixed-version: Fixed after version 5.5rc7=
"
+
+CVE_STATUS[CVE-2021-3640] =3D "fixed-version: Fixed after version 5.16rc=
1"
+
+CVE_STATUS[CVE-2021-3653] =3D "fixed-version: Fixed after version 5.14rc=
7"
+
+CVE_STATUS[CVE-2021-3655] =3D "fixed-version: Fixed after version 5.14rc=
1"
+
+CVE_STATUS[CVE-2021-3656] =3D "fixed-version: Fixed after version 5.14rc=
7"
+
+CVE_STATUS[CVE-2021-3659] =3D "fixed-version: Fixed after version 5.12rc=
7"
+
+CVE_STATUS[CVE-2021-3669] =3D "fixed-version: Fixed after version 5.15rc=
1"
+
+CVE_STATUS[CVE-2021-3679] =3D "fixed-version: Fixed after version 5.14rc=
3"
+
+# CVE-2021-3714 has no known resolution
+
+CVE_STATUS[CVE-2021-3715] =3D "fixed-version: Fixed after version 5.6"
+
+CVE_STATUS[CVE-2021-37159] =3D "fixed-version: Fixed after version 5.14r=
c3"
+
+CVE_STATUS[CVE-2021-3732] =3D "fixed-version: Fixed after version 5.14rc=
6"
+
+CVE_STATUS[CVE-2021-3736] =3D "fixed-version: Fixed after version 5.15rc=
1"
+
+CVE_STATUS[CVE-2021-3739] =3D "fixed-version: Fixed after version 5.15rc=
1"
+
+CVE_STATUS[CVE-2021-3743] =3D "fixed-version: Fixed after version 5.13rc=
7"
+
+CVE_STATUS[CVE-2021-3744] =3D "fixed-version: Fixed after version 5.15rc=
4"
+
+CVE_STATUS[CVE-2021-3752] =3D "fixed-version: Fixed after version 5.16rc=
1"
+
+CVE_STATUS[CVE-2021-3753] =3D "fixed-version: Fixed after version 5.15rc=
1"
+
+CVE_STATUS[CVE-2021-37576] =3D "fixed-version: Fixed after version 5.14r=
c3"
+
+CVE_STATUS[CVE-2021-3759] =3D "fixed-version: Fixed after version 5.15rc=
1"
+
+CVE_STATUS[CVE-2021-3760] =3D "fixed-version: Fixed after version 5.15rc=
6"
+
+CVE_STATUS[CVE-2021-3764] =3D "fixed-version: Fixed after version 5.15rc=
4"
+
+CVE_STATUS[CVE-2021-3772] =3D "fixed-version: Fixed after version 5.15"
+
+CVE_STATUS[CVE-2021-38160] =3D "fixed-version: Fixed after version 5.14r=
c1"
+
+CVE_STATUS[CVE-2021-38166] =3D "fixed-version: Fixed after version 5.14r=
c6"
+
+CVE_STATUS[CVE-2021-38198] =3D "fixed-version: Fixed after version 5.13r=
c6"
+
+CVE_STATUS[CVE-2021-38199] =3D "fixed-version: Fixed after version 5.14r=
c1"
+
+CVE_STATUS[CVE-2021-38200] =3D "fixed-version: Fixed after version 5.13r=
c7"
+
+CVE_STATUS[CVE-2021-38201] =3D "fixed-version: Fixed after version 5.14r=
c1"
+
+CVE_STATUS[CVE-2021-38202] =3D "fixed-version: Fixed after version 5.14r=
c1"
+
+CVE_STATUS[CVE-2021-38203] =3D "fixed-version: Fixed after version 5.14r=
c2"
+
+CVE_STATUS[CVE-2021-38204] =3D "fixed-version: Fixed after version 5.14r=
c3"
+
+CVE_STATUS[CVE-2021-38205] =3D "fixed-version: Fixed after version 5.14r=
c1"
+
+CVE_STATUS[CVE-2021-38206] =3D "fixed-version: Fixed after version 5.13r=
c7"
+
+CVE_STATUS[CVE-2021-38207] =3D "fixed-version: Fixed after version 5.13r=
c7"
+
+CVE_STATUS[CVE-2021-38208] =3D "fixed-version: Fixed after version 5.13r=
c5"
+
+CVE_STATUS[CVE-2021-38209] =3D "fixed-version: Fixed after version 5.13r=
c1"
+
+CVE_STATUS[CVE-2021-38300] =3D "fixed-version: Fixed after version 5.15r=
c4"
+
+# CVE-2021-3847 has no known resolution
+
+# CVE-2021-3864 has no known resolution
+
+# CVE-2021-3892 has no known resolution
+
+CVE_STATUS[CVE-2021-3894] =3D "fixed-version: Fixed after version 5.15rc=
6"
+
+CVE_STATUS[CVE-2021-3896] =3D "fixed-version: Fixed after version 5.15rc=
6"
+
+CVE_STATUS[CVE-2021-3923] =3D "fixed-version: Fixed after version 5.16"
+
+CVE_STATUS[CVE-2021-39633] =3D "fixed-version: Fixed after version 5.14"
+
+CVE_STATUS[CVE-2021-39634] =3D "fixed-version: Fixed after version 5.9rc=
8"
+
+CVE_STATUS[CVE-2021-39636] =3D "fixed-version: Fixed after version 4.16r=
c1"
+
+CVE_STATUS[CVE-2021-39648] =3D "fixed-version: Fixed after version 5.11r=
c3"
+
+CVE_STATUS[CVE-2021-39656] =3D "fixed-version: Fixed after version 5.12r=
c3"
+
+CVE_STATUS[CVE-2021-39657] =3D "fixed-version: Fixed after version 5.11r=
c4"
+
+CVE_STATUS[CVE-2021-39685] =3D "fixed-version: Fixed after version 5.16r=
c5"
+
+CVE_STATUS[CVE-2021-39686] =3D "fixed-version: Fixed after version 5.16r=
c1"
+
+CVE_STATUS[CVE-2021-39698] =3D "fixed-version: Fixed after version 5.16r=
c5"
+
+CVE_STATUS[CVE-2021-39711] =3D "fixed-version: Fixed after version 4.18r=
c6"
+
+CVE_STATUS[CVE-2021-39713] =3D "fixed-version: Fixed after version 4.20r=
c1"
+
+CVE_STATUS[CVE-2021-39714] =3D "fixed-version: Fixed after version 4.12r=
c1"
+
+# CVE-2021-39800 has no known resolution
+
+# CVE-2021-39801 has no known resolution
+
+# CVE-2021-39802 has no known resolution
+
+CVE_STATUS[CVE-2021-4001] =3D "fixed-version: Fixed after version 5.16rc=
2"
+
+CVE_STATUS[CVE-2021-4002] =3D "fixed-version: Fixed after version 5.16rc=
3"
+
+CVE_STATUS[CVE-2021-4023] =3D "fixed-version: Fixed after version 5.15rc=
1"
+
+CVE_STATUS[CVE-2021-4028] =3D "fixed-version: Fixed after version 5.15rc=
4"
+
+CVE_STATUS[CVE-2021-4032] =3D "fixed-version: Fixed after version 5.15rc=
7"
+
+CVE_STATUS[CVE-2021-4037] =3D "fixed-version: Fixed after version 5.12rc=
1"
+
+CVE_STATUS[CVE-2021-40490] =3D "fixed-version: Fixed after version 5.15r=
c1"
+
+CVE_STATUS[CVE-2021-4083] =3D "fixed-version: Fixed after version 5.16rc=
4"
+
+CVE_STATUS[CVE-2021-4090] =3D "fixed-version: Fixed after version 5.16rc=
2"
+
+CVE_STATUS[CVE-2021-4093] =3D "fixed-version: Fixed after version 5.15rc=
7"
+
+CVE_STATUS[CVE-2021-4095] =3D "fixed-version: Fixed after version 5.17rc=
1"
+
+CVE_STATUS[CVE-2021-41073] =3D "fixed-version: Fixed after version 5.15r=
c2"
+
+CVE_STATUS[CVE-2021-4135] =3D "fixed-version: Fixed after version 5.16rc=
6"
+
+CVE_STATUS[CVE-2021-4148] =3D "fixed-version: Fixed after version 5.15"
+
+CVE_STATUS[CVE-2021-4149] =3D "fixed-version: Fixed after version 5.15rc=
6"
+
+CVE_STATUS[CVE-2021-4150] =3D "fixed-version: Fixed after version 5.15rc=
7"
+
+CVE_STATUS[CVE-2021-4154] =3D "fixed-version: Fixed after version 5.14rc=
2"
+
+CVE_STATUS[CVE-2021-4155] =3D "fixed-version: Fixed after version 5.16"
+
+CVE_STATUS[CVE-2021-4157] =3D "fixed-version: Fixed after version 5.13rc=
1"
+
+CVE_STATUS[CVE-2021-4159] =3D "fixed-version: Fixed after version 5.7rc1=
"
+
+CVE_STATUS[CVE-2021-41864] =3D "fixed-version: Fixed after version 5.15r=
c5"
+
+CVE_STATUS[CVE-2021-4197] =3D "fixed-version: Fixed after version 5.16"
+
+CVE_STATUS[CVE-2021-42008] =3D "fixed-version: Fixed after version 5.14r=
c7"
+
+CVE_STATUS[CVE-2021-4202] =3D "fixed-version: Fixed after version 5.16rc=
2"
+
+CVE_STATUS[CVE-2021-4203] =3D "fixed-version: Fixed after version 5.15rc=
4"
+
+CVE_STATUS[CVE-2021-4204] =3D "fixed-version: Fixed after version 5.17rc=
1"
+
+CVE_STATUS[CVE-2021-4218] =3D "fixed-version: Fixed after version 5.8rc1=
"
+
+CVE_STATUS[CVE-2021-42252] =3D "fixed-version: Fixed after version 5.15r=
c1"
+
+CVE_STATUS[CVE-2021-42327] =3D "fixed-version: Fixed after version 5.15"
+
+CVE_STATUS[CVE-2021-42739] =3D "fixed-version: Fixed after version 5.16r=
c1"
+
+CVE_STATUS[CVE-2021-43056] =3D "fixed-version: Fixed after version 5.15r=
c6"
+
+CVE_STATUS[CVE-2021-43057] =3D "fixed-version: Fixed after version 5.15r=
c3"
+
+CVE_STATUS[CVE-2021-43267] =3D "fixed-version: Fixed after version 5.15"
+
+CVE_STATUS[CVE-2021-43389] =3D "fixed-version: Fixed after version 5.15r=
c6"
+
+CVE_STATUS[CVE-2021-43975] =3D "fixed-version: Fixed after version 5.16r=
c2"
+
+CVE_STATUS[CVE-2021-43976] =3D "fixed-version: Fixed after version 5.17r=
c1"
+
+CVE_STATUS[CVE-2021-44733] =3D "fixed-version: Fixed after version 5.16r=
c7"
+
+CVE_STATUS[CVE-2021-44879] =3D "fixed-version: Fixed after version 5.17r=
c1"
+
+CVE_STATUS[CVE-2021-45095] =3D "fixed-version: Fixed after version 5.16r=
c6"
+
+CVE_STATUS[CVE-2021-45100] =3D "fixed-version: Fixed after version 5.16r=
c7"
+
+CVE_STATUS[CVE-2021-45402] =3D "fixed-version: Fixed after version 5.16r=
c6"
+
+CVE_STATUS[CVE-2021-45469] =3D "fixed-version: Fixed after version 5.17r=
c1"
+
+CVE_STATUS[CVE-2021-45480] =3D "fixed-version: Fixed after version 5.16r=
c6"
+
+CVE_STATUS[CVE-2021-45485] =3D "fixed-version: Fixed after version 5.14r=
c1"
+
+CVE_STATUS[CVE-2021-45486] =3D "fixed-version: Fixed after version 5.13r=
c1"
+
+CVE_STATUS[CVE-2021-45868] =3D "fixed-version: Fixed after version 5.16r=
c1"
+
+CVE_STATUS[CVE-2021-46283] =3D "fixed-version: Fixed after version 5.13r=
c7"
+
+CVE_STATUS[CVE-2022-0001] =3D "fixed-version: Fixed after version 5.17rc=
8"
+
+CVE_STATUS[CVE-2022-0002] =3D "fixed-version: Fixed after version 5.17rc=
8"
+
+CVE_STATUS[CVE-2022-0168] =3D "fixed-version: Fixed after version 5.18rc=
1"
+
+CVE_STATUS[CVE-2022-0171] =3D "fixed-version: Fixed after version 5.18rc=
4"
+
+CVE_STATUS[CVE-2022-0185] =3D "fixed-version: Fixed after version 5.17rc=
1"
+
+CVE_STATUS[CVE-2022-0264] =3D "fixed-version: Fixed after version 5.16rc=
6"
+
+CVE_STATUS[CVE-2022-0286] =3D "fixed-version: Fixed after version 5.14rc=
2"
+
+CVE_STATUS[CVE-2022-0322] =3D "fixed-version: Fixed after version 5.15rc=
6"
+
+CVE_STATUS[CVE-2022-0330] =3D "fixed-version: Fixed after version 5.17rc=
2"
+
+CVE_STATUS[CVE-2022-0382] =3D "fixed-version: Fixed after version 5.16"
+
+# CVE-2022-0400 has no known resolution
+
+CVE_STATUS[CVE-2022-0433] =3D "fixed-version: Fixed after version 5.17rc=
1"
+
+CVE_STATUS[CVE-2022-0435] =3D "fixed-version: Fixed after version 5.17rc=
4"
+
+CVE_STATUS[CVE-2022-0480] =3D "fixed-version: Fixed after version 5.15rc=
1"
+
+CVE_STATUS[CVE-2022-0487] =3D "fixed-version: Fixed after version 5.17rc=
4"
+
+CVE_STATUS[CVE-2022-0492] =3D "fixed-version: Fixed after version 5.17rc=
3"
+
+CVE_STATUS[CVE-2022-0494] =3D "fixed-version: Fixed after version 5.17rc=
5"
+
+CVE_STATUS[CVE-2022-0500] =3D "fixed-version: Fixed after version 5.17rc=
1"
+
+CVE_STATUS[CVE-2022-0516] =3D "fixed-version: Fixed after version 5.17rc=
4"
+
+CVE_STATUS[CVE-2022-0617] =3D "fixed-version: Fixed after version 5.17rc=
2"
+
+CVE_STATUS[CVE-2022-0644] =3D "fixed-version: Fixed after version 5.15rc=
7"
+
+CVE_STATUS[CVE-2022-0646] =3D "fixed-version: Fixed after version 5.17rc=
5"
+
+CVE_STATUS[CVE-2022-0742] =3D "fixed-version: Fixed after version 5.17rc=
7"
+
+CVE_STATUS[CVE-2022-0812] =3D "fixed-version: Fixed after version 5.8rc6=
"
+
+CVE_STATUS[CVE-2022-0847] =3D "fixed-version: Fixed after version 5.17rc=
6"
+
+CVE_STATUS[CVE-2022-0850] =3D "fixed-version: Fixed after version 5.14rc=
1"
+
+CVE_STATUS[CVE-2022-0854] =3D "fixed-version: Fixed after version 5.17rc=
8"
+
+CVE_STATUS[CVE-2022-0995] =3D "fixed-version: Fixed after version 5.17rc=
8"
+
+CVE_STATUS[CVE-2022-0998] =3D "fixed-version: Fixed after version 5.17rc=
1"
+
+CVE_STATUS[CVE-2022-1011] =3D "fixed-version: Fixed after version 5.17rc=
8"
+
+CVE_STATUS[CVE-2022-1012] =3D "fixed-version: Fixed after version 5.18rc=
6"
+
+CVE_STATUS[CVE-2022-1015] =3D "fixed-version: Fixed after version 5.18rc=
1"
+
+CVE_STATUS[CVE-2022-1016] =3D "fixed-version: Fixed after version 5.18rc=
1"
+
+CVE_STATUS[CVE-2022-1043] =3D "fixed-version: Fixed after version 5.14rc=
7"
+
+CVE_STATUS[CVE-2022-1048] =3D "fixed-version: Fixed after version 5.18rc=
1"
+
+CVE_STATUS[CVE-2022-1055] =3D "fixed-version: Fixed after version 5.17rc=
3"
+
+# CVE-2022-1116 has no known resolution
+
+CVE_STATUS[CVE-2022-1158] =3D "fixed-version: Fixed after version 5.18rc=
1"
+
+CVE_STATUS[CVE-2022-1184] =3D "fixed-version: Fixed after version 5.19rc=
1"
+
+CVE_STATUS[CVE-2022-1195] =3D "fixed-version: Fixed after version 5.16rc=
7"
+
+CVE_STATUS[CVE-2022-1198] =3D "fixed-version: Fixed after version 5.17rc=
6"
+
+CVE_STATUS[CVE-2022-1199] =3D "fixed-version: Fixed after version 5.17rc=
8"
+
+CVE_STATUS[CVE-2022-1204] =3D "fixed-version: Fixed after version 5.18rc=
1"
+
+CVE_STATUS[CVE-2022-1205] =3D "fixed-version: Fixed after version 5.18rc=
1"
+
+# CVE-2022-1247 has no known resolution
+
+CVE_STATUS[CVE-2022-1263] =3D "fixed-version: Fixed after version 5.18rc=
3"
+
+CVE_STATUS[CVE-2022-1280] =3D "fixed-version: Fixed after version 5.15rc=
1"
+
+CVE_STATUS[CVE-2022-1353] =3D "fixed-version: Fixed after version 5.17"
+
+CVE_STATUS[CVE-2022-1419] =3D "fixed-version: Fixed after version 5.6rc2=
"
+
+CVE_STATUS[CVE-2022-1462] =3D "fixed-version: Fixed after version 5.19rc=
7"
+
+CVE_STATUS[CVE-2022-1508] =3D "fixed-version: Fixed after version 5.15rc=
1"
+
+CVE_STATUS[CVE-2022-1516] =3D "fixed-version: Fixed after version 5.18rc=
1"
+
+CVE_STATUS[CVE-2022-1651] =3D "fixed-version: Fixed after version 5.18rc=
1"
+
+CVE_STATUS[CVE-2022-1652] =3D "fixed-version: Fixed after version 5.18rc=
6"
+
+CVE_STATUS[CVE-2022-1671] =3D "fixed-version: Fixed after version 5.18rc=
1"
+
+CVE_STATUS[CVE-2022-1678] =3D "fixed-version: Fixed after version 4.20rc=
1"
+
+CVE_STATUS[CVE-2022-1679] =3D "fixed-version: Fixed after version 6.0rc1=
"
+
+CVE_STATUS[CVE-2022-1729] =3D "fixed-version: Fixed after version 5.18"
+
+CVE_STATUS[CVE-2022-1734] =3D "fixed-version: Fixed after version 5.18rc=
6"
+
+CVE_STATUS[CVE-2022-1786] =3D "fixed-version: Fixed after version 5.12rc=
1"
+
+CVE_STATUS[CVE-2022-1789] =3D "fixed-version: Fixed after version 5.18"
+
+CVE_STATUS[CVE-2022-1836] =3D "fixed-version: Fixed after version 5.18rc=
5"
+
+CVE_STATUS[CVE-2022-1852] =3D "fixed-version: Fixed after version 5.19rc=
1"
+
+CVE_STATUS[CVE-2022-1882] =3D "fixed-version: Fixed after version 5.19rc=
8"
+
+CVE_STATUS[CVE-2022-1943] =3D "fixed-version: Fixed after version 5.18rc=
7"
+
+CVE_STATUS[CVE-2022-1966] =3D "fixed-version: Fixed after version 5.19rc=
1"
+
+CVE_STATUS[CVE-2022-1972] =3D "fixed-version: Fixed after version 5.19rc=
1"
+
+CVE_STATUS[CVE-2022-1973] =3D "fixed-version: Fixed after version 5.19rc=
1"
+
+CVE_STATUS[CVE-2022-1974] =3D "fixed-version: Fixed after version 5.18rc=
6"
+
+CVE_STATUS[CVE-2022-1975] =3D "fixed-version: Fixed after version 5.18rc=
6"
+
+CVE_STATUS[CVE-2022-1976] =3D "fixed-version: Fixed after version 5.19rc=
1"
+
+CVE_STATUS[CVE-2022-1998] =3D "fixed-version: Fixed after version 5.17rc=
3"
+
+CVE_STATUS[CVE-2022-20008] =3D "fixed-version: Fixed after version 5.17r=
c5"
+
+CVE_STATUS[CVE-2022-20132] =3D "fixed-version: Fixed after version 5.16r=
c5"
+
+CVE_STATUS[CVE-2022-20141] =3D "fixed-version: Fixed after version 5.15r=
c1"
+
+CVE_STATUS[CVE-2022-20148] =3D "fixed-version: Fixed after version 5.16r=
c1"
+
+CVE_STATUS[CVE-2022-20153] =3D "fixed-version: Fixed after version 5.13r=
c1"
+
+CVE_STATUS[CVE-2022-20154] =3D "fixed-version: Fixed after version 5.16r=
c8"
+
+CVE_STATUS[CVE-2022-20158] =3D "fixed-version: Fixed after version 5.17"
+
+CVE_STATUS[CVE-2022-20166] =3D "fixed-version: Fixed after version 5.10r=
c1"
+
+CVE_STATUS[CVE-2022-20368] =3D "fixed-version: Fixed after version 5.17"
+
+CVE_STATUS[CVE-2022-20369] =3D "fixed-version: Fixed after version 5.18r=
c1"
+
+CVE_STATUS[CVE-2022-20409] =3D "fixed-version: Fixed after version 5.12r=
c1"
+
+CVE_STATUS[CVE-2022-20421] =3D "fixed-version: Fixed after version 6.0rc=
4"
+
+CVE_STATUS[CVE-2022-20422] =3D "fixed-version: Fixed after version 6.0rc=
1"
+
+CVE_STATUS[CVE-2022-20423] =3D "fixed-version: Fixed after version 5.17"
+
+CVE_STATUS[CVE-2022-20424] =3D "fixed-version: Fixed after version 5.12r=
c1"
+
+CVE_STATUS[CVE-2022-20565] =3D "fixed-version: Fixed after version 5.9rc=
4"
+
+CVE_STATUS[CVE-2022-20566] =3D "fixed-version: Fixed after version 5.19"
+
+CVE_STATUS[CVE-2022-20567] =3D "fixed-version: Fixed after version 4.16r=
c5"
+
+CVE_STATUS[CVE-2022-20568] =3D "fixed-version: Fixed after version 5.12r=
c1"
+
+CVE_STATUS[CVE-2022-20572] =3D "fixed-version: Fixed after version 5.19r=
c1"
+
+CVE_STATUS[CVE-2022-2078] =3D "fixed-version: Fixed after version 5.19rc=
1"
+
+CVE_STATUS[CVE-2022-21123] =3D "fixed-version: Fixed after version 5.19r=
c3"
+
+CVE_STATUS[CVE-2022-21125] =3D "fixed-version: Fixed after version 5.19r=
c3"
+
+CVE_STATUS[CVE-2022-21166] =3D "fixed-version: Fixed after version 5.19r=
c3"
+
+CVE_STATUS[CVE-2022-21385] =3D "fixed-version: Fixed after version 4.20"
+
+CVE_STATUS[CVE-2022-21499] =3D "fixed-version: Fixed after version 5.19r=
c1"
+
+CVE_STATUS[CVE-2022-21505] =3D "fixed-version: Fixed after version 5.19r=
c8"
+
+CVE_STATUS[CVE-2022-2153] =3D "fixed-version: Fixed after version 5.18rc=
1"
+
+CVE_STATUS[CVE-2022-2196] =3D "fixed-version: Fixed after version 6.2rc1=
"
+
+# CVE-2022-2209 has no known resolution
+
+CVE_STATUS[CVE-2022-22942] =3D "fixed-version: Fixed after version 5.17r=
c2"
+
+CVE_STATUS[CVE-2022-23036] =3D "fixed-version: Fixed after version 5.17r=
c8"
+
+CVE_STATUS[CVE-2022-23037] =3D "fixed-version: Fixed after version 5.17r=
c8"
+
+CVE_STATUS[CVE-2022-23038] =3D "fixed-version: Fixed after version 5.17r=
c8"
+
+CVE_STATUS[CVE-2022-23039] =3D "fixed-version: Fixed after version 5.17r=
c8"
+
+CVE_STATUS[CVE-2022-23040] =3D "fixed-version: Fixed after version 5.17r=
c8"
+
+CVE_STATUS[CVE-2022-23041] =3D "fixed-version: Fixed after version 5.17r=
c8"
+
+CVE_STATUS[CVE-2022-23042] =3D "fixed-version: Fixed after version 5.17r=
c8"
+
+CVE_STATUS[CVE-2022-2308] =3D "fixed-version: Fixed after version 6.0"
+
+CVE_STATUS[CVE-2022-2318] =3D "fixed-version: Fixed after version 5.19rc=
5"
+
+CVE_STATUS[CVE-2022-23222] =3D "fixed-version: Fixed after version 5.17r=
c1"
+
+CVE_STATUS[CVE-2022-2327] =3D "fixed-version: Fixed after version 5.12rc=
1"
+
+CVE_STATUS[CVE-2022-2380] =3D "fixed-version: Fixed after version 5.18rc=
1"
+
+CVE_STATUS[CVE-2022-23816] =3D "fixed-version: Fixed after version 5.19r=
c7"
+
+# CVE-2022-23825 has no known resolution
+
+CVE_STATUS[CVE-2022-23960] =3D "fixed-version: Fixed after version 5.17r=
c8"
+
+CVE_STATUS[CVE-2022-24122] =3D "fixed-version: Fixed after version 5.17r=
c2"
+
+CVE_STATUS[CVE-2022-24448] =3D "fixed-version: Fixed after version 5.17r=
c2"
+
+CVE_STATUS[CVE-2022-24958] =3D "fixed-version: Fixed after version 5.17r=
c1"
+
+CVE_STATUS[CVE-2022-24959] =3D "fixed-version: Fixed after version 5.17r=
c2"
+
+CVE_STATUS[CVE-2022-2503] =3D "fixed-version: Fixed after version 5.19rc=
1"
+
+CVE_STATUS[CVE-2022-25258] =3D "fixed-version: Fixed after version 5.17r=
c4"
+
+# CVE-2022-25265 has no known resolution
+
+CVE_STATUS[CVE-2022-25375] =3D "fixed-version: Fixed after version 5.17r=
c4"
+
+CVE_STATUS[CVE-2022-25636] =3D "fixed-version: Fixed after version 5.17r=
c6"
+
+CVE_STATUS[CVE-2022-2585] =3D "fixed-version: Fixed after version 6.0rc1=
"
+
+CVE_STATUS[CVE-2022-2586] =3D "fixed-version: Fixed after version 6.0rc1=
"
+
+CVE_STATUS[CVE-2022-2588] =3D "fixed-version: Fixed after version 6.0rc1=
"
+
+CVE_STATUS[CVE-2022-2590] =3D "fixed-version: Fixed after version 6.0rc3=
"
+
+CVE_STATUS[CVE-2022-2602] =3D "fixed-version: Fixed after version 6.1rc1=
"
+
+CVE_STATUS[CVE-2022-26365] =3D "fixed-version: Fixed after version 5.19r=
c6"
+
+CVE_STATUS[CVE-2022-26373] =3D "fixed-version: Fixed after version 6.0rc=
1"
+
+CVE_STATUS[CVE-2022-2639] =3D "fixed-version: Fixed after version 5.18rc=
4"
+
+CVE_STATUS[CVE-2022-26490] =3D "fixed-version: Fixed after version 5.17r=
c1"
+
+CVE_STATUS[CVE-2022-2663] =3D "fixed-version: Fixed after version 6.0rc5=
"
+
+# CVE-2022-26878 has no known resolution
+
+CVE_STATUS[CVE-2022-26966] =3D "fixed-version: Fixed after version 5.17r=
c6"
+
+CVE_STATUS[CVE-2022-27223] =3D "fixed-version: Fixed after version 5.17r=
c6"
+
+CVE_STATUS[CVE-2022-27666] =3D "fixed-version: Fixed after version 5.17r=
c8"
+
+CVE_STATUS[CVE-2022-27672] =3D "fixed-version: Fixed after version 6.2"
+
+CVE_STATUS[CVE-2022-2785] =3D "fixed-version: Fixed after version 6.0rc1=
"
+
+CVE_STATUS[CVE-2022-27950] =3D "fixed-version: Fixed after version 5.17r=
c5"
+
+CVE_STATUS[CVE-2022-28356] =3D "fixed-version: Fixed after version 5.18r=
c1"
+
+CVE_STATUS[CVE-2022-28388] =3D "fixed-version: Fixed after version 5.18r=
c1"
+
+CVE_STATUS[CVE-2022-28389] =3D "fixed-version: Fixed after version 5.18r=
c1"
+
+CVE_STATUS[CVE-2022-28390] =3D "fixed-version: Fixed after version 5.18r=
c1"
+
+CVE_STATUS[CVE-2022-2873] =3D "fixed-version: Fixed after version 5.19rc=
1"
+
+CVE_STATUS[CVE-2022-28796] =3D "fixed-version: Fixed after version 5.18r=
c1"
+
+CVE_STATUS[CVE-2022-28893] =3D "fixed-version: Fixed after version 5.18r=
c2"
+
+CVE_STATUS[CVE-2022-2905] =3D "fixed-version: Fixed after version 6.0rc4=
"
+
+CVE_STATUS[CVE-2022-29156] =3D "fixed-version: Fixed after version 5.17r=
c6"
+
+CVE_STATUS[CVE-2022-2938] =3D "fixed-version: Fixed after version 5.17rc=
2"
+
+CVE_STATUS[CVE-2022-29581] =3D "fixed-version: Fixed after version 5.18r=
c4"
+
+CVE_STATUS[CVE-2022-29582] =3D "fixed-version: Fixed after version 5.18r=
c2"
+
+CVE_STATUS[CVE-2022-2959] =3D "fixed-version: Fixed after version 5.19rc=
1"
+
+# CVE-2022-2961 has no known resolution
+
+CVE_STATUS[CVE-2022-2964] =3D "fixed-version: Fixed after version 5.17rc=
4"
+
+CVE_STATUS[CVE-2022-2977] =3D "fixed-version: Fixed after version 5.18rc=
1"
+
+CVE_STATUS[CVE-2022-2978] =3D "fixed-version: Fixed after version 6.1rc1=
"
+
+CVE_STATUS[CVE-2022-29900] =3D "fixed-version: Fixed after version 5.19r=
c7"
+
+CVE_STATUS[CVE-2022-29901] =3D "fixed-version: Fixed after version 5.19r=
c7"
+
+CVE_STATUS[CVE-2022-2991] =3D "fixed-version: Fixed after version 5.15rc=
1"
+
+CVE_STATUS[CVE-2022-29968] =3D "fixed-version: Fixed after version 5.18r=
c5"
+
+CVE_STATUS[CVE-2022-3028] =3D "fixed-version: Fixed after version 6.0rc3=
"
+
+CVE_STATUS[CVE-2022-30594] =3D "fixed-version: Fixed after version 5.18r=
c1"
+
+CVE_STATUS[CVE-2022-3061] =3D "fixed-version: Fixed after version 5.18rc=
5"
+
+CVE_STATUS[CVE-2022-3077] =3D "fixed-version: Fixed after version 5.19rc=
1"
+
+CVE_STATUS[CVE-2022-3078] =3D "fixed-version: Fixed after version 5.18rc=
1"
+
+CVE_STATUS[CVE-2022-3103] =3D "fixed-version: Fixed after version 6.0rc3=
"
+
+CVE_STATUS[CVE-2022-3104] =3D "fixed-version: Fixed after version 5.19rc=
1"
+
+CVE_STATUS[CVE-2022-3105] =3D "fixed-version: Fixed after version 5.16"
+
+CVE_STATUS[CVE-2022-3106] =3D "fixed-version: Fixed after version 5.16rc=
6"
+
+CVE_STATUS[CVE-2022-3107] =3D "fixed-version: Fixed after version 5.17"
+
+CVE_STATUS[CVE-2022-3108] =3D "fixed-version: Fixed after version 5.17rc=
1"
+
+CVE_STATUS[CVE-2022-3110] =3D "fixed-version: Fixed after version 5.19rc=
1"
+
+CVE_STATUS[CVE-2022-3111] =3D "fixed-version: Fixed after version 5.18rc=
1"
+
+CVE_STATUS[CVE-2022-3112] =3D "fixed-version: Fixed after version 5.18rc=
1"
+
+CVE_STATUS[CVE-2022-3113] =3D "fixed-version: Fixed after version 5.18rc=
1"
+
+CVE_STATUS[CVE-2022-3114] =3D "fixed-version: Fixed after version 5.19rc=
1"
+
+CVE_STATUS[CVE-2022-3115] =3D "fixed-version: Fixed after version 5.19rc=
1"
+
+CVE_STATUS[CVE-2022-3169] =3D "fixed-version: Fixed after version 6.1rc1=
"
+
+CVE_STATUS[CVE-2022-3170] =3D "fixed-version: Fixed after version 6.0rc4=
"
+
+CVE_STATUS[CVE-2022-3176] =3D "fixed-version: Fixed after version 5.17rc=
1"
+
+CVE_STATUS[CVE-2022-3202] =3D "fixed-version: Fixed after version 5.18rc=
1"
+
+CVE_STATUS[CVE-2022-32250] =3D "fixed-version: Fixed after version 5.19r=
c1"
+
+CVE_STATUS[CVE-2022-32296] =3D "fixed-version: Fixed after version 5.18r=
c6"
+
+# CVE-2022-3238 has no known resolution
+
+CVE_STATUS[CVE-2022-3239] =3D "fixed-version: Fixed after version 5.18rc=
1"
+
+CVE_STATUS[CVE-2022-32981] =3D "fixed-version: Fixed after version 5.19r=
c2"
+
+CVE_STATUS[CVE-2022-3303] =3D "fixed-version: Fixed after version 6.0rc5=
"
+
+CVE_STATUS[CVE-2022-3344] =3D "fixed-version: Fixed after version 6.1rc7=
"
+
+CVE_STATUS[CVE-2022-33740] =3D "fixed-version: Fixed after version 5.19r=
c6"
+
+CVE_STATUS[CVE-2022-33741] =3D "fixed-version: Fixed after version 5.19r=
c6"
+
+CVE_STATUS[CVE-2022-33742] =3D "fixed-version: Fixed after version 5.19r=
c6"
+
+CVE_STATUS[CVE-2022-33743] =3D "fixed-version: Fixed after version 5.19r=
c6"
+
+CVE_STATUS[CVE-2022-33744] =3D "fixed-version: Fixed after version 5.19r=
c6"
+
+CVE_STATUS[CVE-2022-33981] =3D "fixed-version: Fixed after version 5.18r=
c5"
+
+CVE_STATUS[CVE-2022-3424] =3D "fixed-version: Fixed after version 6.2rc1=
"
+
+CVE_STATUS[CVE-2022-3435] =3D "fixed-version: Fixed after version 6.1rc1=
"
+
+CVE_STATUS[CVE-2022-34494] =3D "fixed-version: Fixed after version 5.19r=
c1"
+
+CVE_STATUS[CVE-2022-34495] =3D "fixed-version: Fixed after version 5.19r=
c1"
+
+CVE_STATUS[CVE-2022-34918] =3D "fixed-version: Fixed after version 5.19r=
c6"
+
+CVE_STATUS[CVE-2022-3521] =3D "fixed-version: Fixed after version 6.1rc1=
"
+
+CVE_STATUS[CVE-2022-3522] =3D "fixed-version: Fixed after version 6.1rc1=
"
+
+CVE_STATUS[CVE-2022-3523] =3D "fixed-version: Fixed after version 6.1rc1=
"
+
+CVE_STATUS[CVE-2022-3524] =3D "fixed-version: Fixed after version 6.1rc1=
"
+
+CVE_STATUS[CVE-2022-3526] =3D "fixed-version: Fixed after version 5.18rc=
3"
+
+CVE_STATUS[CVE-2022-3531] =3D "fixed-version: Fixed after version 6.2rc1=
"
+
+CVE_STATUS[CVE-2022-3532] =3D "fixed-version: Fixed after version 6.2rc1=
"
+
+# CVE-2022-3533 has no known resolution
+
+CVE_STATUS[CVE-2022-3534] =3D "fixed-version: Fixed after version 6.2rc1=
"
+
+CVE_STATUS[CVE-2022-3535] =3D "fixed-version: Fixed after version 6.1rc1=
"
+
+CVE_STATUS[CVE-2022-3541] =3D "fixed-version: Fixed after version 6.1rc1=
"
+
+CVE_STATUS[CVE-2022-3542] =3D "fixed-version: Fixed after version 6.1rc1=
"
+
+CVE_STATUS[CVE-2022-3543] =3D "fixed-version: Fixed after version 6.1rc1=
"
+
+# CVE-2022-3544 has no known resolution
+
+CVE_STATUS[CVE-2022-3545] =3D "fixed-version: Fixed after version 6.0rc1=
"
+
+CVE_STATUS[CVE-2022-3564] =3D "fixed-version: Fixed after version 6.1rc4=
"
+
+CVE_STATUS[CVE-2022-3565] =3D "fixed-version: Fixed after version 6.1rc1=
"
+
+CVE_STATUS[CVE-2022-3566] =3D "fixed-version: Fixed after version 6.1rc1=
"
+
+CVE_STATUS[CVE-2022-3567] =3D "fixed-version: Fixed after version 6.1rc1=
"
+
+CVE_STATUS[CVE-2022-3577] =3D "fixed-version: Fixed after version 5.19rc=
1"
+
+CVE_STATUS[CVE-2022-3586] =3D "fixed-version: Fixed after version 6.0rc5=
"
+
+CVE_STATUS[CVE-2022-3594] =3D "fixed-version: Fixed after version 6.1rc1=
"
+
+CVE_STATUS[CVE-2022-3595] =3D "fixed-version: Fixed after version 6.1rc1=
"
+
+# CVE-2022-3606 has no known resolution
+
+CVE_STATUS[CVE-2022-36123] =3D "fixed-version: Fixed after version 5.19r=
c6"
+
+CVE_STATUS[CVE-2022-3619] =3D "fixed-version: Fixed after version 6.1rc4=
"
+
+CVE_STATUS[CVE-2022-3621] =3D "fixed-version: Fixed after version 6.1rc1=
"
+
+CVE_STATUS[CVE-2022-3623] =3D "fixed-version: Fixed after version 6.1rc1=
"
+
+CVE_STATUS[CVE-2022-3624] =3D "fixed-version: Fixed after version 6.0rc1=
"
+
+CVE_STATUS[CVE-2022-3625] =3D "fixed-version: Fixed after version 6.0rc1=
"
+
+CVE_STATUS[CVE-2022-3628] =3D "fixed-version: Fixed after version 6.1rc5=
"
+
+CVE_STATUS[CVE-2022-36280] =3D "fixed-version: Fixed after version 6.2rc=
1"
+
+CVE_STATUS[CVE-2022-3629] =3D "fixed-version: Fixed after version 6.0rc1=
"
+
+CVE_STATUS[CVE-2022-3630] =3D "fixed-version: Fixed after version 6.0rc1=
"
+
+CVE_STATUS[CVE-2022-3633] =3D "fixed-version: Fixed after version 6.0rc1=
"
+
+CVE_STATUS[CVE-2022-3635] =3D "fixed-version: Fixed after version 6.0rc1=
"
+
+CVE_STATUS[CVE-2022-3636] =3D "fixed-version: Fixed after version 5.19rc=
1"
+
+CVE_STATUS[CVE-2022-3640] =3D "fixed-version: Fixed after version 6.1rc4=
"
+
+# CVE-2022-36402 has no known resolution
+
+# CVE-2022-3642 has no known resolution
+
+CVE_STATUS[CVE-2022-3643] =3D "fixed-version: Fixed after version 6.1"
+
+CVE_STATUS[CVE-2022-3646] =3D "fixed-version: Fixed after version 6.1rc1=
"
+
+CVE_STATUS[CVE-2022-3649] =3D "fixed-version: Fixed after version 6.1rc1=
"
+
+CVE_STATUS[CVE-2022-36879] =3D "fixed-version: Fixed after version 5.19r=
c8"
+
+CVE_STATUS[CVE-2022-36946] =3D "fixed-version: Fixed after version 5.19"
+
+CVE_STATUS[CVE-2022-3707] =3D "fixed-version: Fixed after version 6.2rc3=
"
+
+# CVE-2022-38096 has no known resolution
+
+CVE_STATUS[CVE-2022-38457] =3D "fixed-version: Fixed after version 6.2rc=
4"
+
+CVE_STATUS[CVE-2022-3903] =3D "fixed-version: Fixed after version 6.1rc2=
"
+
+CVE_STATUS[CVE-2022-3910] =3D "fixed-version: Fixed after version 6.0rc6=
"
+
+CVE_STATUS[CVE-2022-39188] =3D "fixed-version: Fixed after version 5.19r=
c8"
+
+CVE_STATUS[CVE-2022-39189] =3D "fixed-version: Fixed after version 5.19r=
c2"
+
+CVE_STATUS[CVE-2022-39190] =3D "fixed-version: Fixed after version 6.0rc=
3"
+
+CVE_STATUS[CVE-2022-3977] =3D "fixed-version: Fixed after version 6.1rc1=
"
+
+CVE_STATUS[CVE-2022-39842] =3D "fixed-version: Fixed after version 5.19r=
c4"
+
+CVE_STATUS[CVE-2022-40133] =3D "fixed-version: Fixed after version 6.2rc=
4"
+
+CVE_STATUS[CVE-2022-40307] =3D "fixed-version: Fixed after version 6.0rc=
5"
+
+CVE_STATUS[CVE-2022-40476] =3D "fixed-version: Fixed after version 5.19r=
c4"
+
+CVE_STATUS[CVE-2022-40768] =3D "fixed-version: Fixed after version 6.1rc=
1"
+
+CVE_STATUS[CVE-2022-4095] =3D "fixed-version: Fixed after version 6.0rc4=
"
+
+CVE_STATUS[CVE-2022-41218] =3D "fixed-version: Fixed after version 6.2rc=
1"
+
+CVE_STATUS[CVE-2022-41222] =3D "fixed-version: Fixed after version 5.14r=
c1"
+
+CVE_STATUS[CVE-2022-4127] =3D "fixed-version: Fixed after version 5.19rc=
6"
+
+CVE_STATUS[CVE-2022-4128] =3D "fixed-version: Fixed after version 5.19rc=
7"
+
+CVE_STATUS[CVE-2022-4129] =3D "fixed-version: Fixed after version 6.1rc6=
"
+
+CVE_STATUS[CVE-2022-4139] =3D "fixed-version: Fixed after version 6.1rc8=
"
+
+CVE_STATUS[CVE-2022-41674] =3D "fixed-version: Fixed after version 6.1rc=
1"
+
+# CVE-2022-41848 has no known resolution
+
+CVE_STATUS[CVE-2022-41849] =3D "fixed-version: Fixed after version 6.1rc=
1"
+
+CVE_STATUS[CVE-2022-41850] =3D "fixed-version: Fixed after version 6.1rc=
1"
+
+CVE_STATUS[CVE-2022-41858] =3D "fixed-version: Fixed after version 5.18r=
c2"
+
+CVE_STATUS[CVE-2022-42328] =3D "fixed-version: Fixed after version 6.1"
+
+CVE_STATUS[CVE-2022-42329] =3D "fixed-version: Fixed after version 6.1"
+
+CVE_STATUS[CVE-2022-42432] =3D "fixed-version: Fixed after version 6.0rc=
7"
+
+CVE_STATUS[CVE-2022-4269] =3D "fixed-version: Fixed after version 6.3rc1=
"
+
+CVE_STATUS[CVE-2022-42703] =3D "fixed-version: Fixed after version 6.0rc=
4"
+
+CVE_STATUS[CVE-2022-42719] =3D "fixed-version: Fixed after version 6.1rc=
1"
+
+CVE_STATUS[CVE-2022-42720] =3D "fixed-version: Fixed after version 6.1rc=
1"
+
+CVE_STATUS[CVE-2022-42721] =3D "fixed-version: Fixed after version 6.1rc=
1"
+
+CVE_STATUS[CVE-2022-42722] =3D "fixed-version: Fixed after version 6.1rc=
1"
+
+CVE_STATUS[CVE-2022-42895] =3D "fixed-version: Fixed after version 6.1rc=
4"
+
+CVE_STATUS[CVE-2022-42896] =3D "fixed-version: Fixed after version 6.1rc=
4"
+
+CVE_STATUS[CVE-2022-43750] =3D "fixed-version: Fixed after version 6.1rc=
1"
+
+CVE_STATUS[CVE-2022-4378] =3D "fixed-version: Fixed after version 6.1"
+
+CVE_STATUS[CVE-2022-4379] =3D "fixed-version: Fixed after version 6.2rc1=
"
+
+CVE_STATUS[CVE-2022-4382] =3D "fixed-version: Fixed after version 6.2rc5=
"
+
+CVE_STATUS[CVE-2022-43945] =3D "fixed-version: Fixed after version 6.1rc=
1"
+
+# CVE-2022-44032 has no known resolution
+
+# CVE-2022-44033 has no known resolution
+
+# CVE-2022-44034 has no known resolution
+
+# CVE-2022-4543 has no known resolution
+
+CVE_STATUS[CVE-2022-45869] =3D "fixed-version: Fixed after version 6.1rc=
7"
+
+# CVE-2022-45884 has no known resolution
+
+# CVE-2022-45885 has no known resolution
+
+# CVE-2022-45886 has no known resolution
+
+# CVE-2022-45887 has no known resolution
+
+CVE_STATUS[CVE-2022-45888] =3D "fixed-version: Fixed after version 6.2rc=
1"
+
+# CVE-2022-45919 has no known resolution
+
+CVE_STATUS[CVE-2022-45934] =3D "fixed-version: Fixed after version 6.1"
+
+CVE_STATUS[CVE-2022-4662] =3D "fixed-version: Fixed after version 6.0rc4=
"
+
+CVE_STATUS[CVE-2022-4696] =3D "fixed-version: Fixed after version 5.12rc=
1"
+
+CVE_STATUS[CVE-2022-4744] =3D "fixed-version: Fixed after version 5.16rc=
7"
+
+CVE_STATUS[CVE-2022-47518] =3D "fixed-version: Fixed after version 6.1rc=
8"
+
+CVE_STATUS[CVE-2022-47519] =3D "fixed-version: Fixed after version 6.1rc=
8"
+
+CVE_STATUS[CVE-2022-47520] =3D "fixed-version: Fixed after version 6.1rc=
8"
+
+CVE_STATUS[CVE-2022-47521] =3D "fixed-version: Fixed after version 6.1rc=
8"
+
+CVE_STATUS[CVE-2022-47929] =3D "fixed-version: Fixed after version 6.2rc=
4"
+
+CVE_STATUS[CVE-2022-47938] =3D "fixed-version: Fixed after version 6.0rc=
1"
+
+CVE_STATUS[CVE-2022-47939] =3D "fixed-version: Fixed after version 6.0rc=
1"
+
+CVE_STATUS[CVE-2022-47940] =3D "fixed-version: Fixed after version 5.19r=
c1"
+
+CVE_STATUS[CVE-2022-47941] =3D "fixed-version: Fixed after version 6.0rc=
1"
+
+CVE_STATUS[CVE-2022-47942] =3D "fixed-version: Fixed after version 6.0rc=
1"
+
+CVE_STATUS[CVE-2022-47943] =3D "fixed-version: Fixed after version 6.0rc=
1"
+
+CVE_STATUS[CVE-2022-47946] =3D "fixed-version: Fixed after version 5.12r=
c2"
+
+CVE_STATUS[CVE-2022-4842] =3D "fixed-version: Fixed after version 6.2rc1=
"
+
+CVE_STATUS[CVE-2022-48423] =3D "fixed-version: Fixed after version 6.2rc=
1"
+
+CVE_STATUS[CVE-2022-48424] =3D "fixed-version: Fixed after version 6.2rc=
1"
+
+CVE_STATUS[CVE-2022-48425] =3D "fixed-version: Fixed after version 6.4rc=
1"
+
+CVE_STATUS[CVE-2022-48502] =3D "fixed-version: Fixed after version 6.2rc=
1"
+
+CVE_STATUS[CVE-2023-0030] =3D "fixed-version: Fixed after version 5.0rc1=
"
+
+CVE_STATUS[CVE-2023-0045] =3D "fixed-version: Fixed after version 6.2rc3=
"
+
+CVE_STATUS[CVE-2023-0047] =3D "fixed-version: Fixed after version 5.16rc=
1"
+
+CVE_STATUS[CVE-2023-0122] =3D "fixed-version: Fixed after version 6.0rc4=
"
+
+# CVE-2023-0160 has no known resolution
+
+CVE_STATUS[CVE-2023-0179] =3D "fixed-version: Fixed after version 6.2rc5=
"
+
+CVE_STATUS[CVE-2023-0210] =3D "fixed-version: Fixed after version 6.2rc4=
"
+
+CVE_STATUS[CVE-2023-0240] =3D "fixed-version: Fixed after version 5.10rc=
1"
+
+CVE_STATUS[CVE-2023-0266] =3D "fixed-version: Fixed after version 6.2rc4=
"
+
+CVE_STATUS[CVE-2023-0386] =3D "fixed-version: Fixed after version 6.2rc6=
"
+
+CVE_STATUS[CVE-2023-0394] =3D "fixed-version: Fixed after version 6.2rc4=
"
+
+CVE_STATUS[CVE-2023-0458] =3D "fixed-version: Fixed after version 6.2rc5=
"
+
+CVE_STATUS[CVE-2023-0459] =3D "fixed-version: Fixed after version 6.3rc1=
"
+
+CVE_STATUS[CVE-2023-0461] =3D "fixed-version: Fixed after version 6.2rc3=
"
+
+CVE_STATUS[CVE-2023-0468] =3D "fixed-version: Fixed after version 6.1rc7=
"
+
+CVE_STATUS[CVE-2023-0469] =3D "fixed-version: Fixed after version 6.1rc7=
"
+
+CVE_STATUS[CVE-2023-0590] =3D "fixed-version: Fixed after version 6.1rc2=
"
+
+CVE_STATUS[CVE-2023-0597] =3D "fixed-version: Fixed after version 6.2rc1=
"
+
+CVE_STATUS[CVE-2023-0615] =3D "fixed-version: Fixed after version 6.1rc3=
"
+
+CVE_STATUS[CVE-2023-1032] =3D "fixed-version: Fixed after version 6.3rc2=
"
+
+CVE_STATUS[CVE-2023-1073] =3D "fixed-version: Fixed after version 6.2rc5=
"
+
+CVE_STATUS[CVE-2023-1074] =3D "fixed-version: Fixed after version 6.2rc6=
"
+
+CVE_STATUS[CVE-2023-1075] =3D "fixed-version: Fixed after version 6.2rc7=
"
+
+CVE_STATUS[CVE-2023-1076] =3D "fixed-version: Fixed after version 6.3rc1=
"
+
+CVE_STATUS[CVE-2023-1077] =3D "fixed-version: Fixed after version 6.3rc1=
"
+
+CVE_STATUS[CVE-2023-1078] =3D "fixed-version: Fixed after version 6.2rc8=
"
+
+CVE_STATUS[CVE-2023-1079] =3D "fixed-version: Fixed after version 6.3rc1=
"
+
+CVE_STATUS[CVE-2023-1095] =3D "fixed-version: Fixed after version 6.0rc1=
"
+
+CVE_STATUS[CVE-2023-1118] =3D "fixed-version: Fixed after version 6.3rc1=
"
+
+CVE_STATUS[CVE-2023-1192] =3D "fixed-version: Fixed after version 6.4rc1=
"
+
+# CVE-2023-1193 has no known resolution
+
+# CVE-2023-1194 has no known resolution
+
+CVE_STATUS[CVE-2023-1195] =3D "fixed-version: Fixed after version 6.1rc3=
"
+
+# CVE-2023-1206 has no known resolution
+
+CVE_STATUS[CVE-2023-1249] =3D "fixed-version: Fixed after version 5.18rc=
1"
+
+CVE_STATUS[CVE-2023-1252] =3D "fixed-version: Fixed after version 5.16rc=
1"
+
+CVE_STATUS[CVE-2023-1281] =3D "fixed-version: Fixed after version 6.2"
+
+CVE_STATUS[CVE-2023-1295] =3D "fixed-version: Fixed after version 5.12rc=
1"
+
+CVE_STATUS[CVE-2023-1380] =3D "fixed-version: Fixed after version 6.4rc1=
"
+
+CVE_STATUS[CVE-2023-1382] =3D "fixed-version: Fixed after version 6.1rc7=
"
+
+CVE_STATUS[CVE-2023-1390] =3D "fixed-version: Fixed after version 5.11rc=
4"
+
+CVE_STATUS[CVE-2023-1513] =3D "fixed-version: Fixed after version 6.2"
+
+CVE_STATUS[CVE-2023-1582] =3D "fixed-version: Fixed after version 5.17rc=
4"
+
+CVE_STATUS[CVE-2023-1583] =3D "fixed-version: Fixed after version 6.3rc4=
"
+
+CVE_STATUS[CVE-2023-1611] =3D "fixed-version: Fixed after version 6.3rc5=
"
+
+CVE_STATUS[CVE-2023-1637] =3D "fixed-version: Fixed after version 5.18rc=
2"
+
+CVE_STATUS[CVE-2023-1652] =3D "fixed-version: Fixed after version 6.2rc5=
"
+
+CVE_STATUS[CVE-2023-1670] =3D "fixed-version: Fixed after version 6.3rc4=
"
+
+CVE_STATUS[CVE-2023-1829] =3D "fixed-version: Fixed after version 6.3rc1=
"
+
+CVE_STATUS[CVE-2023-1838] =3D "fixed-version: Fixed after version 5.18"
+
+CVE_STATUS[CVE-2023-1855] =3D "fixed-version: Fixed after version 6.3rc3=
"
+
+CVE_STATUS[CVE-2023-1859] =3D "fixed-version: Fixed after version 6.3rc7=
"
+
+CVE_STATUS[CVE-2023-1872] =3D "fixed-version: Fixed after version 5.18rc=
2"
+
+CVE_STATUS[CVE-2023-1989] =3D "fixed-version: Fixed after version 6.3rc4=
"
+
+CVE_STATUS[CVE-2023-1990] =3D "fixed-version: Fixed after version 6.3rc3=
"
+
+CVE_STATUS[CVE-2023-1998] =3D "fixed-version: Fixed after version 6.3rc1=
"
+
+CVE_STATUS[CVE-2023-2002] =3D "fixed-version: Fixed after version 6.4rc1=
"
+
+CVE_STATUS[CVE-2023-2006] =3D "fixed-version: Fixed after version 6.1rc7=
"
+
+CVE_STATUS[CVE-2023-2007] =3D "fixed-version: Fixed after version 6.0rc1=
"
+
+CVE_STATUS[CVE-2023-2008] =3D "fixed-version: Fixed after version 5.19rc=
4"
+
+CVE_STATUS[CVE-2023-2019] =3D "fixed-version: Fixed after version 6.0rc1=
"
+
+# CVE-2023-20593 has no known resolution
+
+CVE_STATUS[CVE-2023-20928] =3D "fixed-version: Fixed after version 6.0rc=
1"
+
+# CVE-2023-20937 has no known resolution
+
+CVE_STATUS[CVE-2023-20938] =3D "fixed-version: Fixed after version 5.18r=
c5"
+
+# CVE-2023-20941 has no known resolution
+
+CVE_STATUS[CVE-2023-21102] =3D "fixed-version: Fixed after version 6.2rc=
4"
+
+CVE_STATUS[CVE-2023-21106] =3D "fixed-version: Fixed after version 6.2rc=
5"
+
+CVE_STATUS[CVE-2023-2124] =3D "fixed-version: Fixed after version 6.4rc1=
"
+
+CVE_STATUS[CVE-2023-21255] =3D "fixed-version: Fixed after version 6.4rc=
4"
+
+CVE_STATUS[CVE-2023-2156] =3D "fixed-version: Fixed after version 6.3"
+
+CVE_STATUS[CVE-2023-2162] =3D "fixed-version: Fixed after version 6.2rc6=
"
+
+CVE_STATUS[CVE-2023-2163] =3D "fixed-version: Fixed after version 6.3"
+
+CVE_STATUS[CVE-2023-2166] =3D "fixed-version: Fixed after version 6.1"
+
+CVE_STATUS[CVE-2023-2176] =3D "fixed-version: Fixed after version 6.3rc1=
"
+
+CVE_STATUS[CVE-2023-2177] =3D "fixed-version: Fixed after version 5.19"
+
+CVE_STATUS[CVE-2023-2194] =3D "fixed-version: Fixed after version 6.3rc4=
"
+
+CVE_STATUS[CVE-2023-2235] =3D "fixed-version: Fixed after version 6.3rc3=
"
+
+CVE_STATUS[CVE-2023-2236] =3D "fixed-version: Fixed after version 6.1rc7=
"
+
+CVE_STATUS[CVE-2023-2248] =3D "fixed-version: Fixed after version 6.3"
+
+CVE_STATUS[CVE-2023-2269] =3D "fixed-version: Fixed after version 6.4rc1=
"
+
+CVE_STATUS[CVE-2023-22995] =3D "fixed-version: Fixed after version 5.17r=
c1"
+
+CVE_STATUS[CVE-2023-22996] =3D "fixed-version: Fixed after version 5.18r=
c1"
+
+CVE_STATUS[CVE-2023-22997] =3D "fixed-version: Fixed after version 6.2rc=
1"
+
+CVE_STATUS[CVE-2023-22998] =3D "fixed-version: Fixed after version 6.0rc=
1"
+
+CVE_STATUS[CVE-2023-22999] =3D "fixed-version: Fixed after version 5.17r=
c1"
+
+CVE_STATUS[CVE-2023-23000] =3D "fixed-version: Fixed after version 5.17r=
c1"
+
+CVE_STATUS[CVE-2023-23001] =3D "fixed-version: Fixed after version 5.17r=
c1"
+
+CVE_STATUS[CVE-2023-23002] =3D "fixed-version: Fixed after version 5.17r=
c1"
+
+CVE_STATUS[CVE-2023-23003] =3D "fixed-version: Fixed after version 5.16r=
c6"
+
+CVE_STATUS[CVE-2023-23004] =3D "fixed-version: Fixed after version 5.19r=
c1"
+
+CVE_STATUS[CVE-2023-23005] =3D "fixed-version: Fixed after version 6.2rc=
1"
+
+CVE_STATUS[CVE-2023-23006] =3D "fixed-version: Fixed after version 5.16r=
c8"
+
+# CVE-2023-23039 has no known resolution
+
+CVE_STATUS[CVE-2023-23454] =3D "fixed-version: Fixed after version 6.2rc=
3"
+
+CVE_STATUS[CVE-2023-23455] =3D "fixed-version: Fixed after version 6.2rc=
3"
+
+CVE_STATUS[CVE-2023-23559] =3D "fixed-version: Fixed after version 6.2rc=
5"
+
+CVE_STATUS[CVE-2023-23586] =3D "fixed-version: Fixed after version 5.12r=
c1"
+
+CVE_STATUS[CVE-2023-2430] =3D "fixed-version: Fixed after version 6.2rc5=
"
+
+CVE_STATUS[CVE-2023-2483] =3D "fixed-version: Fixed after version 6.3rc4=
"
+
+CVE_STATUS[CVE-2023-25012] =3D "fixed-version: Fixed after version 6.3rc=
1"
+
+CVE_STATUS[CVE-2023-2513] =3D "fixed-version: Fixed after version 6.0rc1=
"
+
+CVE_STATUS[CVE-2023-2598] =3D "fixed-version: Fixed after version 6.4rc1=
"
+
+# CVE-2023-26242 has no known resolution
+
+CVE_STATUS[CVE-2023-26544] =3D "fixed-version: Fixed after version 6.2rc=
1"
+
+CVE_STATUS[CVE-2023-26545] =3D "fixed-version: Fixed after version 6.2"
+
+CVE_STATUS[CVE-2023-26605] =3D "fixed-version: Fixed after version 6.1rc=
7"
+
+CVE_STATUS[CVE-2023-26606] =3D "fixed-version: Fixed after version 6.2rc=
1"
+
+CVE_STATUS[CVE-2023-26607] =3D "fixed-version: Fixed after version 6.1rc=
1"
+
+CVE_STATUS[CVE-2023-28327] =3D "fixed-version: Fixed after version 6.1"
+
+CVE_STATUS[CVE-2023-28328] =3D "fixed-version: Fixed after version 6.2rc=
1"
+
+CVE_STATUS[CVE-2023-28410] =3D "fixed-version: Fixed after version 5.19r=
c1"
+
+CVE_STATUS[CVE-2023-28464] =3D "fixed-version: Fixed after version 6.3rc=
7"
+
+CVE_STATUS[CVE-2023-28466] =3D "fixed-version: Fixed after version 6.3rc=
2"
+
+CVE_STATUS[CVE-2023-2860] =3D "fixed-version: Fixed after version 6.0rc5=
"
+
+CVE_STATUS[CVE-2023-28772] =3D "fixed-version: Fixed after version 5.14r=
c1"
+
+CVE_STATUS[CVE-2023-28866] =3D "fixed-version: Fixed after version 6.3rc=
4"
+
+CVE_STATUS[CVE-2023-2898] =3D "cpe-stable-backport: Backported in 6.4.4"
+
+CVE_STATUS[CVE-2023-2985] =3D "fixed-version: Fixed after version 6.3rc1=
"
+
+CVE_STATUS[CVE-2023-3006] =3D "fixed-version: Fixed after version 6.1rc1=
"
+
+# Skipping CVE-2023-3022, no affected_versions
+
+CVE_STATUS[CVE-2023-30456] =3D "fixed-version: Fixed after version 6.3rc=
3"
+
+CVE_STATUS[CVE-2023-30772] =3D "fixed-version: Fixed after version 6.3rc=
4"
+
+CVE_STATUS[CVE-2023-3090] =3D "fixed-version: Fixed after version 6.4rc2=
"
+
+CVE_STATUS[CVE-2023-3106] =3D "fixed-version: Fixed after version 4.8rc7=
"
+
+# Skipping CVE-2023-3108, no affected_versions
+
+# CVE-2023-31081 has no known resolution
+
+# CVE-2023-31082 has no known resolution
+
+# CVE-2023-31083 has no known resolution
+
+CVE_STATUS[CVE-2023-31084] =3D "fixed-version: Fixed after version 6.4rc=
3"
+
+# CVE-2023-31085 has no known resolution
+
+CVE_STATUS[CVE-2023-3111] =3D "fixed-version: Fixed after version 6.0rc2=
"
+
+CVE_STATUS[CVE-2023-3117] =3D "fixed-version: Fixed after version 6.4rc7=
"
+
+CVE_STATUS[CVE-2023-31248] =3D "cpe-stable-backport: Backported in 6.4.4=
"
+
+CVE_STATUS[CVE-2023-3141] =3D "fixed-version: Fixed after version 6.4rc1=
"
+
+CVE_STATUS[CVE-2023-31436] =3D "fixed-version: Fixed after version 6.3"
+
+CVE_STATUS[CVE-2023-3159] =3D "fixed-version: Fixed after version 5.18rc=
6"
+
+CVE_STATUS[CVE-2023-3161] =3D "fixed-version: Fixed after version 6.2rc7=
"
+
+CVE_STATUS[CVE-2023-3212] =3D "fixed-version: Fixed after version 6.4rc2=
"
+
+CVE_STATUS[CVE-2023-3220] =3D "fixed-version: Fixed after version 6.3rc1=
"
+
+CVE_STATUS[CVE-2023-32233] =3D "fixed-version: Fixed after version 6.4rc=
1"
+
+CVE_STATUS[CVE-2023-32247] =3D "fixed-version: Fixed after version 6.4rc=
1"
+
+CVE_STATUS[CVE-2023-32248] =3D "fixed-version: Fixed after version 6.4rc=
1"
+
+CVE_STATUS[CVE-2023-32250] =3D "fixed-version: Fixed after version 6.4rc=
1"
+
+CVE_STATUS[CVE-2023-32252] =3D "fixed-version: Fixed after version 6.4rc=
1"
+
+CVE_STATUS[CVE-2023-32254] =3D "fixed-version: Fixed after version 6.4rc=
1"
+
+CVE_STATUS[CVE-2023-32257] =3D "fixed-version: Fixed after version 6.4rc=
1"
+
+CVE_STATUS[CVE-2023-32258] =3D "fixed-version: Fixed after version 6.4rc=
1"
+
+CVE_STATUS[CVE-2023-32269] =3D "fixed-version: Fixed after version 6.2rc=
7"
+
+CVE_STATUS[CVE-2023-3268] =3D "fixed-version: Fixed after version 6.4rc1=
"
+
+CVE_STATUS[CVE-2023-3269] =3D "cpe-stable-backport: Backported in 6.4.1"
+
+CVE_STATUS[CVE-2023-3312] =3D "fixed-version: Fixed after version 6.4rc1=
"
+
+CVE_STATUS[CVE-2023-3317] =3D "fixed-version: Fixed after version 6.3rc6=
"
+
+CVE_STATUS[CVE-2023-33203] =3D "fixed-version: Fixed after version 6.3rc=
4"
+
+# CVE-2023-33250 has no known resolution
+
+CVE_STATUS[CVE-2023-33288] =3D "fixed-version: Fixed after version 6.3rc=
4"
+
+CVE_STATUS[CVE-2023-3338] =3D "fixed-version: Fixed after version 6.1rc1=
"
+
+CVE_STATUS[CVE-2023-3355] =3D "fixed-version: Fixed after version 6.3rc1=
"
+
+CVE_STATUS[CVE-2023-3357] =3D "fixed-version: Fixed after version 6.2rc1=
"
+
+CVE_STATUS[CVE-2023-3358] =3D "fixed-version: Fixed after version 6.2rc5=
"
+
+CVE_STATUS[CVE-2023-3359] =3D "fixed-version: Fixed after version 6.2rc7=
"
+
+CVE_STATUS[CVE-2023-3389] =3D "fixed-version: Fixed after version 6.0rc1=
"
+
+CVE_STATUS[CVE-2023-3390] =3D "fixed-version: Fixed after version 6.4rc7=
"
+
+CVE_STATUS[CVE-2023-33951] =3D "fixed-version: Fixed after version 6.4rc=
1"
+
+CVE_STATUS[CVE-2023-33952] =3D "fixed-version: Fixed after version 6.4rc=
1"
+
+# CVE-2023-3397 has no known resolution
+
+CVE_STATUS[CVE-2023-34255] =3D "fixed-version: Fixed after version 6.4rc=
1"
+
+CVE_STATUS[CVE-2023-34256] =3D "fixed-version: Fixed after version 6.4rc=
2"
+
+CVE_STATUS[CVE-2023-3439] =3D "fixed-version: Fixed after version 5.18rc=
5"
+
+CVE_STATUS[CVE-2023-35001] =3D "cpe-stable-backport: Backported in 6.4.4=
"
+
+CVE_STATUS[CVE-2023-3567] =3D "fixed-version: Fixed after version 6.2rc7=
"
+
+# CVE-2023-35693 has no known resolution
+
+CVE_STATUS[CVE-2023-35788] =3D "fixed-version: Fixed after version 6.4rc=
5"
+
+CVE_STATUS[CVE-2023-35823] =3D "fixed-version: Fixed after version 6.4rc=
1"
+
+CVE_STATUS[CVE-2023-35824] =3D "fixed-version: Fixed after version 6.4rc=
1"
+
+CVE_STATUS[CVE-2023-35826] =3D "fixed-version: Fixed after version 6.4rc=
1"
+
+# CVE-2023-35827 has no known resolution
+
+CVE_STATUS[CVE-2023-35828] =3D "fixed-version: Fixed after version 6.4rc=
1"
+
+CVE_STATUS[CVE-2023-35829] =3D "fixed-version: Fixed after version 6.4rc=
1"
+
+CVE_STATUS[CVE-2023-3609] =3D "fixed-version: Fixed after version 6.4rc7=
"
+
+CVE_STATUS[CVE-2023-3610] =3D "fixed-version: Fixed after version 6.4"
+
+CVE_STATUS[CVE-2023-3611] =3D "cpe-stable-backport: Backported in 6.4.5"
+
+# CVE-2023-3640 has no known resolution
+
+# CVE-2023-37453 has no known resolution
+
+# CVE-2023-37454 has no known resolution
+
+# CVE-2023-3772 has no known resolution
+
+# CVE-2023-3773 has no known resolution
+
+CVE_STATUS[CVE-2023-3776] =3D "cpe-stable-backport: Backported in 6.4.5"
+
+CVE_STATUS[CVE-2023-3812] =3D "fixed-version: Fixed after version 6.1rc4=
"
+
+CVE_STATUS[CVE-2023-38409] =3D "fixed-version: Fixed after version 6.3rc=
7"
+
+CVE_STATUS[CVE-2023-38426] =3D "fixed-version: Fixed after version 6.4rc=
3"
+
+CVE_STATUS[CVE-2023-38427] =3D "fixed-version: Fixed after version 6.4rc=
6"
+
+CVE_STATUS[CVE-2023-38428] =3D "fixed-version: Fixed after version 6.4rc=
3"
+
+CVE_STATUS[CVE-2023-38429] =3D "fixed-version: Fixed after version 6.4rc=
3"
+
+CVE_STATUS[CVE-2023-38430] =3D "fixed-version: Fixed after version 6.4rc=
6"
+
+CVE_STATUS[CVE-2023-38431] =3D "fixed-version: Fixed after version 6.4rc=
6"
+
+CVE_STATUS[CVE-2023-38432] =3D "fixed-version: Fixed after version 6.4"
+
+CVE_STATUS[CVE-2023-3863] =3D "cpe-stable-backport: Backported in 6.4.4"
+
diff --git a/meta/recipes-kernel/linux/generate-cve-exclusions.py b/meta/=
recipes-kernel/linux/generate-cve-exclusions.py
new file mode 100755
index 00000000000..4d96f19fe7a
--- /dev/null
+++ b/meta/recipes-kernel/linux/generate-cve-exclusions.py
@@ -0,0 +1,89 @@
+#! /usr/bin/env python3
+
+# Generate granular CVE status metadata for a specific version of the ke=
rnel
+# using data from linuxkernelcves.com.
+#
+# SPDX-License-Identifier: GPL-2.0-only
+
+import argparse
+import datetime
+import json
+import pathlib
+import re
+
+from packaging.version import Version
+
+
+def parse_version(s):
+    """
+    Parse the version string and either return a packaging.version.Versi=
on, or
+    None if the string was unset or "unk".
+    """
+    if s and s !=3D "unk":
+        # packaging.version.Version doesn't approve of versions like v5.=
12-rc1-dontuse
+        s =3D s.replace("-dontuse", "")
+        return Version(s)
+    return None
+
+
+def main(argp=3DNone):
+    parser =3D argparse.ArgumentParser()
+    parser.add_argument("datadir", type=3Dpathlib.Path, help=3D"Path to =
a clone of https://github.com/nluedtke/linux_kernel_cves")
+    parser.add_argument("version", type=3DVersion, help=3D"Kernel versio=
n number to generate data for, such as 6.1.38")
+
+    args =3D parser.parse_args(argp)
+    datadir =3D args.datadir
+    version =3D args.version
+    base_version =3D f"{version.major}.{version.minor}"
+
+    with open(datadir / "data" / "kernel_cves.json", "r") as f:
+        cve_data =3D json.load(f)
+
+    with open(datadir / "data" / "stream_fixes.json", "r") as f:
+        stream_data =3D json.load(f)
+
+    print("# Auto-generated CVE metadata, DO NOT EDIT BY HAND.")
+    print(f"# Generated at {datetime.datetime.now()} for version {versio=
n}")
+    print()
+
+    for cve, data in cve_data.items():
+        if "affected_versions" not in data:
+            print(f"# Skipping {cve}, no affected_versions")
+            print()
+            continue
+
+        affected =3D data["affected_versions"]
+        first_affected, last_affected =3D re.search(r"(.+) to (.+)", aff=
ected).groups()
+        first_affected =3D parse_version(first_affected)
+        last_affected =3D parse_version(last_affected)
+
+        if not last_affected:
+            print(f"# {cve} has no known resolution")
+        elif first_affected and version < first_affected:
+            print(f'CVE_STATUS[{cve}] =3D "fixed-version: only affects {=
first_affected} onwards"')
+        elif last_affected < version:
+            print(
+                f'CVE_STATUS[{cve}] =3D "fixed-version: Fixed after vers=
ion {last_affected}"'
+            )
+        else:
+            if cve in stream_data:
+                backport_data =3D stream_data[cve]
+                if base_version in backport_data:
+                    backport_ver =3D Version(backport_data[base_version]=
["fixed_version"])
+                    if backport_ver < version:
+                        print(
+                            f'CVE_STATUS[{cve}] =3D "cpe-stable-backport=
: Backported in {backport_ver}"'
+                        )
+                    else:
+                        # TODO print a note that the kernel needs bumpin=
g
+                        print(f"# {cve} needs backporting (fixed from {b=
ackport_ver})")
+                else:
+                    print(f"# {cve} needs backporting (fixed from {last_=
affected})")
+            else:
+                print(f"# {cve} needs backporting (fixed from {last_affe=
cted})")
+
+        print()
+
+
+if __name__ =3D=3D "__main__":
+    main()
--=20
2.34.1


