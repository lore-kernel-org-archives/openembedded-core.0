Return-Path: <patrick.wicki@subset.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1196710A88E3
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 16:07:46 +0000 (UTC)
Received: from outbound.ms.icloud.com (outbound.ms.icloud.com [57.103.72.11])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52040.1774541259165097600
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 09:07:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@subset.ch header.s=sig1 header.b=U0/Iy6Ap;
 spf=pass (domain: subset.ch, ip: 57.103.72.11, mailfrom: patrick@subset.ch)
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-10 (Postfix) with ESMTPS id 3BF6318015AC;
	Thu, 26 Mar 2026 16:07:36 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=subset.ch; s=sig1; t=1774541258; x=1777133258; bh=VbvBnZTNZtrg+BR/Znd2WJ5esGW8GzF5SwjtP4WNKY4=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=U0/Iy6Apwwg/q+o6c9DDk/6NnVeJQZ8dvzZTsUk+v14/yaj7/GCHfV3U9oCFpp0vvun1G/czleczI3KMti8rSuZlwCyxdUEbgWrv/CFHwNJt4AsJaaSIcMN04k3WO2s7qhKNoZvF9sNn3MoHJfLxNRmQk/RDYKalpbazWp4w+Z+qNlwf1bU3hsVsHH/D6kO/aU1nrS4KR5Gv11FAKQJbg2QZvXzRxnRtcMKDcP02lgAshSce+c2MX+EFBRHYRU4exU4lq30loKp9MjIWqiGFmWN2zZ1ocUlAshGBZvWU0snBRw+dij1IdVJgHQ4JP9odvMY+WwXiLTldL9l26nYCWA==
mail-alias-created-date: 1663698038540
Received: from desk (unknown [17.57.154.37])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-10 (Postfix) with ESMTPSA id 24C9D18015BB;
	Thu, 26 Mar 2026 16:07:22 +0000 (UTC)
From: patrick@subset.ch
To: openembedded-core@lists.openembedded.org
Cc: Patrick Wicki <patrick.wicki@siemens.com>
Subject: [PATCH] systemd: backport fix for tpm2 without efi support
Date: Thu, 26 Mar 2026 17:06:50 +0100
Message-ID: <20260326160650.559827-1-patrick@subset.ch>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Proofpoint-GUID: Ky7csYST6tyAq7wK8K4-vYJLVhXQ-M_m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDExNCBTYWx0ZWRfXy7cZA/tpAR6W
 ZECEVzQGZFBsTwnM7JSWHhu67J5GGQF6yOmvYJiSPuiRWh9qTZzg6O3SEhqCyajMwRGkRI4wWe9
 7JuAvjVBbgdq9q1KsaBU+ad2HfBWoHWkxQE6mtmjgdWExLUFi506aYOqntDVTTxLXJBuKNg7f9X
 nNK13tCu+hkg8Mh6HI9p+PRsRYzVo8/yrStyp+oB21tnMvZ8m4KdOw93TNLTSYm2muFDBDZ6c4O
 3ioGN0kKzlvijHqB2Y2Mx3AlsL07aAIDMrceC0C5fLfqcg/hrgdY62qAFsKe0uEuIMWqNO1Yq+u
 0CmLj0IHSrTpkXdyAP3nkuNC/u+WohCm63ClqqAZ4aha2DL5pM6iYjJF2ywlv8=
X-Authority-Info-Out: v=2.4 cv=TY6bdBQh c=1 sm=1 tr=0 ts=69c559c9
 cx=c_apl:c_pps:t_out a=qkKslKyYc0ctBTeLUVfTFg==:117 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=a_U1oVfrAAAA:8
 a=QanVp7CtNVlXdqeE9kkA:9
X-Proofpoint-ORIG-GUID: Ky7csYST6tyAq7wK8K4-vYJLVhXQ-M_m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_03,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999 clxscore=1030 spamscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0 classifier=spam
 authscore=0 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2603260114
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 16:07:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234030

From: Patrick Wicki <patrick.wicki@siemens.com>

See https://github.com/systemd/systemd/pull/41231 or the patch commit
message for details. The regression affects v259.1 to 259.5 as well as
v260.1. Requested a backport to v259 but for now a patch is needed.

Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
---
 ...il-fix-PCR-bank-guessing-without-EFI.patch | 62 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_259.5.bb    |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0004-tpm2-util-fix-=
PCR-bank-guessing-without-EFI.patch

diff --git a/meta/recipes-core/systemd/systemd/0004-tpm2-util-fix-PCR-ban=
k-guessing-without-EFI.patch b/meta/recipes-core/systemd/systemd/0004-tpm=
2-util-fix-PCR-bank-guessing-without-EFI.patch
new file mode 100644
index 0000000000..c590b01cd3
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0004-tpm2-util-fix-PCR-bank-guess=
ing-without-EFI.patch
@@ -0,0 +1,62 @@
+From 3cef11c710e95bb5f891181e9b2a6d8f174712c3 Mon Sep 17 00:00:00 2001
+From: Patrick Wicki <patrick.wicki@subset.ch>
+Date: Fri, 20 Mar 2026 15:56:56 +0100
+Subject: [PATCH] tpm2-util: fix PCR bank guessing without EFI
+
+Since 7643e4a89 efi_get_active_pcr_banks() is used to determine the
+active PCR banks. Without EFI support, this returns -EOPNOTSUPP. This in
+turns leads to cryptenroll and cryptsetup attach failures unless the PCR
+bank is explicitly set, i.e.
+
+$ systemd-cryptenroll $LUKS_PART --tpm2-device=3Dauto --tpm2-pcrs=3D'7'
+[...]
+Could not read pcr values: Operation not supported
+
+But it works fine with --tpm2-pcrs=3D'7:sha256'.
+
+Similarly, unsealing during cryptsetup attach also fails if the bank
+needs to be determined:
+
+Failed to unseal secret using TPM2: Operation not supported
+
+Catch the -EOPNOTSUPP and fallback to the guessing strategy.
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/pull/41231=
]
+
+Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
+---
+ src/shared/tpm2-util.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/shared/tpm2-util.c b/src/shared/tpm2-util.c
+index cf11b50695..c0590fe575 100644
+--- a/src/shared/tpm2-util.c
++++ b/src/shared/tpm2-util.c
+@@ -2702,11 +2702,11 @@ int tpm2_get_best_pcr_bank(
+         uint32_t efi_banks;
+         r =3D efi_get_active_pcr_banks(&efi_banks);
+         if (r < 0) {
+-                if (r !=3D -ENOENT)
++                if (!IN_SET(r, -ENOENT, -EOPNOTSUPP))
+                         return r;
+=20
+                 /* If variable is not set use guesswork below */
+-                log_debug("Boot loader didn't set the LoaderTpm2ActiveP=
crBanks EFI variable, we have to guess the used PCR banks.");
++                log_debug("Boot loader didn't set the LoaderTpm2ActiveP=
crBanks EFI variable or EFI support is unavailable, we have to guess the =
used PCR banks.");
+         } else if (efi_banks =3D=3D UINT32_MAX)
+                 log_debug("Boot loader set the LoaderTpm2ActivePcrBanks=
 EFI variable to indicate that the GetActivePcrBanks() API is not availab=
le in the firmware. We have to guess the used PCR banks.");
+         else {
+@@ -2811,11 +2811,11 @@ int tpm2_get_good_pcr_banks(
+         uint32_t efi_banks;
+         r =3D efi_get_active_pcr_banks(&efi_banks);
+         if (r < 0) {
+-                if (r !=3D -ENOENT)
++                if (!IN_SET(r, -ENOENT, -EOPNOTSUPP))
+                         return r;
+=20
+                 /* If the variable is not set we have to guess via the =
code below */
+-                log_debug("Boot loader didn't set the LoaderTpm2ActiveP=
crBanks EFI variable, we have to guess the used PCR banks.");
++                log_debug("Boot loader didn't set the LoaderTpm2ActiveP=
crBanks EFI variable or EFI support is unavailable, we have to guess the =
used PCR banks.");
+         } else if (efi_banks =3D=3D UINT32_MAX)
+                 log_debug("Boot loader set the LoaderTpm2ActivePcrBanks=
 EFI variable to indicate that the GetActivePcrBanks() API is not availab=
le in the firmware. We have to guess the used PCR banks.");
+         else {
diff --git a/meta/recipes-core/systemd/systemd_259.5.bb b/meta/recipes-co=
re/systemd/systemd_259.5.bb
index f0cc83095d..b824261578 100644
--- a/meta/recipes-core/systemd/systemd_259.5.bb
+++ b/meta/recipes-core/systemd/systemd_259.5.bb
@@ -35,6 +35,7 @@ SRC_URI +=3D " \
            file://0003-Do-not-create-var-log-README.patch \
            file://0001-meson-use-libfido2_cflags-dependency.patch \
            file://0018-shared-fdset-add-detailed-debug-logging-to-fdset_=
new.patch \
+           file://0004-tpm2-util-fix-PCR-bank-guessing-without-EFI.patch=
 \
            "
=20
 PAM_PLUGINS =3D " \
--=20
2.53.0


