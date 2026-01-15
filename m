Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39519D29FFA
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 07:54:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30863.1768463682412879083
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 23:54:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=jUNI85kD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5475e51fc8=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6pXo62987819
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 07:54:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=uKLc7NqwjQ2sCxxprsC9
	LVC8KIA72fUvWACMj1V2nOg=; b=jUNI85kD4wyzTPFbL1/GCUjJLte41ZnURVMC
	DT0ww3Omweiex/uC0Bz3H3ddnafJ9/aRPk5AYw8k2wWrePEoP1CYrWA2QzKTOvBK
	LgUGK9QeHOWlddnZIuXx803cYfhYfG8EYGvtpC27ENzMec1F0ibt/Ssir8kxs34P
	Tq6OmtdW7Dojn1XkWNXGNs0K+6x+Clyb+tpR0JaH4h7HHyzdxImYNvI7s6D5w3Sj
	cwCeOcCSO9O2aytQeOO0uR1QpB/D6FcuTYEh8wdM1BOAPJfkIQMY7uPDDPQLB5xU
	j2gMEO9GUXIXXoc/NKytJjdb/rlzfegwfJ0VcK8NwlSBWTVM+w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bkbytnnr4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 07:54:40 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 14 Jan 2026 23:54:39 -0800
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 14 Jan 2026 23:54:39 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] qemu: 10.1.3 -> 10.2.0
Date: Thu, 15 Jan 2026 15:54:36 +0800
Message-ID: <20260115075436.261474-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: YGKDV_HVNxlUCR0jnwFj7vnLARWYKZSp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA1MiBTYWx0ZWRfX7RtvCMmxc38P
 NDJNUHVxZh4fqnNzUTG/Q4OZ0ZaHp71qBFysc5r+Vh88kIgmxlsJ20T4mWscDTJxTp6VtFA+6Vc
 UzbSMu+QXgkRan5O54BfCREV8gay9Myk7SeJA2UxZr4INE2xHR7juVHlsi0PsDeHIRZPC7TnTAe
 WZBfnBz3J/88lr7OVZ5kl+iId6//pp+Nojz7Ib73M03ZJ9ETBxwmNah/ID3gt6yfJk7U0FD7BLu
 QjloQOjbdv1l2HwuoF4QmU4Ocx6wWB+ZxEazu1pL7N8A9MrOSJpEBy4+warczzuyMUr/yDO4+2M
 ZKGMAKafSle7xHT2NFADrAoIqdAPf58T7nad2X4PdAIpWAiy79wEECrvUFQA05yflQ68hDxX668
 E+JrHZf9KyAUtC3gwHXqW1gEt4OJ4ih39EayuDvmCGgjbgVsXhEmbAsrG9w2e5bjuBLB1EXZhqh
 1yPZjqjjuWZPCP3XPMw==
X-Authority-Analysis: v=2.4 cv=b66/I9Gx c=1 sm=1 tr=0 ts=69689d41 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=ID6ng7r3AAAA:8 a=mDV3o1hIAAAA:8 a=p0WdMEafAAAA:8 a=t7CeM3EgAAAA:8
 a=a_U1oVfrAAAA:8 a=20KFwNOVAAAA:8 a=KKAkSRfTAAAA:8 a=7Qk2ozbKAAAA:8
 a=P-IC7800AAAA:8 a=9F4NrrFoVjnNtXH5E4YA:9 a=1QvJI713hp5zc_x7:21
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=D8c4xui6qSgA:10
 a=AkheI1RvQwOzcTXhi5f4:22 a=FdTzh2GWekK77mhwV6Dw:22 a=cvBusfyB2V15izCimMoJ:22
 a=1lyxoWkJIXJV6VJUPhuM:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: YGKDV_HVNxlUCR0jnwFj7vnLARWYKZSp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150052
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 60F6pXo62987819
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 07:54:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229389

From: Kai Kang <kai.kang@windriver.com>

Upgrade qemu from 10.1.3 to 10.2.0:

* remove backported 0012 patch
* update context for patches 0002 and 0010

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...native_10.1.3.bb =3D> qemu-native_10.2.0.bb} |   0
 ...10.1.3.bb =3D> qemu-system-native_10.2.0.bb} |   0
 meta/recipes-devtools/qemu/qemu.inc           |   3 +-
 .../0002-apic-fixup-fallthrough-to-PIC.patch  |  10 +-
 ...gure-lookup-meson-exutable-from-PATH.patch |  26 ++--
 ...x-size-check-for-backing-block-image.patch | 123 ------------------
 .../qemu/{qemu_10.1.3.bb =3D> qemu_10.2.0.bb}   |   0
 7 files changed, 22 insertions(+), 140 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu-native_10.1.3.bb =3D> qemu-nativ=
e_10.2.0.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_10.1.3.bb =3D> qem=
u-system-native_10.2.0.bb} (100%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0012-hw-sd-sdcard-Fix=
-size-check-for-backing-block-image.patch
 rename meta/recipes-devtools/qemu/{qemu_10.1.3.bb =3D> qemu_10.2.0.bb} (=
100%)

diff --git a/meta/recipes-devtools/qemu/qemu-native_10.1.3.bb b/meta/reci=
pes-devtools/qemu/qemu-native_10.2.0.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-native_10.1.3.bb
rename to meta/recipes-devtools/qemu/qemu-native_10.2.0.bb
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_10.1.3.bb b/me=
ta/recipes-devtools/qemu/qemu-system-native_10.2.0.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-system-native_10.1.3.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_10.2.0.bb
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index eb4a5f71bc..d320b13ba7 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -32,7 +32,6 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar=
.xz \
            file://0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed=
-li.patch \
            file://0010-configure-lookup-meson-exutable-from-PATH.patch \
            file://0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-f=
or-.patch \
-           file://0012-hw-sd-sdcard-Fix-size-check-for-backing-block-ima=
ge.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
            "
@@ -40,7 +39,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar=
.xz \
 UPSTREAM_CHECK_URI =3D "https://www.qemu.org"
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
=20
-SRC_URI[sha256sum] =3D "fbaa7a0d7a9a1deb5695b125916746ec28fe0de6275d4454=
f3e3bbaf8b339b53"
+SRC_URI[sha256sum] =3D "9e30ad1b8b9f7b4463001582d1ab297f39cfccea5d08540c=
0ca6d6672785883a"
=20
 CVE_STATUS[CVE-2007-0998] =3D "not-applicable-config: The VNC server can=
 expose host files uder some circumstances. We don't enable it by default=
."
=20
diff --git a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-=
to-PIC.patch b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthroug=
h-to-PIC.patch
index afbe1bd381..bfc85f4842 100644
--- a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.=
patch
+++ b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.=
patch
@@ -24,16 +24,20 @@ serviced, is -1.
 Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
 Upstream-Status: Submitted [https://lists.gnu.org/archive/html/qemu-deve=
l/2013-04/msg00878.html]
 Signed-off-by: He Zhe <zhe.he@windriver.com>
+
+Update context for qemu 10.2.0.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
  hw/intc/apic.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/hw/intc/apic.c b/hw/intc/apic.c
-index 143d08f1a..5bb008d59 100644
+index aad253a..212b01f 100644
 --- a/hw/intc/apic.c
 +++ b/hw/intc/apic.c
-@@ -756,7 +756,7 @@ int apic_accept_pic_intr(DeviceState *dev)
-     APICCommonState *s =3D APIC(dev);
+@@ -740,7 +740,7 @@ int apic_accept_pic_intr(APICCommonState *s)
+ {
      uint32_t lvt0;
 =20
 -    if (!s)
diff --git a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-=
exutable-from-PATH.patch b/meta/recipes-devtools/qemu/qemu/0010-configure=
-lookup-meson-exutable-from-PATH.patch
index 6e9350ad74..db88766cf6 100644
--- a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutabl=
e-from-PATH.patch
+++ b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutabl=
e-from-PATH.patch
@@ -4,24 +4,26 @@ Date: Wed, 22 May 2024 14:02:55 +0200
 Subject: [PATCH] configure: lookup meson exutable from PATH
=20
 Upstream-Status: Inappropriate [workaround, would need a real fix for up=
stream]
+
+Update context for qemu 10.2.0.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
- configure | 7 +------
- 1 file changed, 1 insertion(+), 6 deletions(-)
+ configure | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
=20
 diff --git a/configure b/configure
-index 274a77876..84e429409 100755
+index 82cace1..83bbda9 100755
 --- a/configure
 +++ b/configure
-@@ -995,12 +995,7 @@ mkvenv=3D"$python ${source_path}/python/scripts/mkv=
env.py"
- $mkvenv ensuregroup --dir "${source_path}/python/wheels" \
-      ${source_path}/pythondeps.toml meson || exit 1
+@@ -993,10 +993,7 @@ get_pwd() {
+     fi
+ }
 =20
--# At this point, we expect Meson to be installed and available.
--# We expect mkvenv or pip to have created pyvenv/bin/meson for us.
--# We ignore PATH completely here: we want to use the venv's Meson
--# *exclusively*.
--
--meson=3D"$(cd pyvenv/bin; pwd)/meson"
+-meson=3D"$(cd pyvenv/bin; get_pwd)/meson"
+-if [ -f "$meson$EXESUF" ]; then
+-  meson=3D"$meson$EXESUF"
+-fi
 +meson=3D`which meson`
 =20
  # Conditionally ensure Sphinx is installed.
diff --git a/meta/recipes-devtools/qemu/qemu/0012-hw-sd-sdcard-Fix-size-c=
heck-for-backing-block-image.patch b/meta/recipes-devtools/qemu/qemu/0012=
-hw-sd-sdcard-Fix-size-check-for-backing-block-image.patch
deleted file mode 100644
index 431b49bad7..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0012-hw-sd-sdcard-Fix-size-check-fo=
r-backing-block-image.patch
+++ /dev/null
@@ -1,123 +0,0 @@
-From 9b262cda68d2b687f803a8030d3a1ad29a93a41e Mon Sep 17 00:00:00 2001
-From: Jan Kiszka <jan.kiszka@siemens.com>
-Date: Sun, 24 Aug 2025 09:18:33 +0200
-Subject: [PATCH] hw/sd/sdcard: Fix size check for backing block image
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Alignment rules apply the the individual partitions (user, boot, later
-on also RPMB) and depend both on the size of the image and the type of
-the device. Up to and including 2GB, the power-of-2 rule applies to the
-user data area. For larger images, multiples of 512 sectors must be used
-for eMMC and multiples of 512K for SD-cards. Fix the check accordingly
-and also detect if the image is too small to even hold the boot
-partitions.
-
-Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
-Reviewed-by: C=C3=A9dric Le Goater <clg@redhat.com>
-Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
-Reviewed-by: Warner Losh <imp@bsdimp.com>
-Message-ID: <591f6d8a9dc86428723cb6876df6e717cc41a70e.1762261430.git.jan=
.kiszka@siemens.com>
-Tested-by: C=C3=A9dric Le Goater <clg@redhat.com>
-Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
-Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit=
/a362b19a39e458256cc7e3acd0dc7825b0389b48]
-Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
----
- hw/sd/sd.c | 67 ++++++++++++++++++++++++++++++++++++++----------------
- 1 file changed, 47 insertions(+), 20 deletions(-)
-
-diff --git a/hw/sd/sd.c b/hw/sd/sd.c
-index 8c290595f..58387440b 100644
---- a/hw/sd/sd.c
-+++ b/hw/sd/sd.c
-@@ -2767,9 +2767,32 @@ static void sd_instance_finalize(Object *obj)
-     timer_free(sd->ocr_power_timer);
- }
-=20
-+static void sd_blk_size_error(SDState *sd, int64_t blk_size,
-+                              int64_t blk_size_aligned, const char *rul=
e,
-+                              Error **errp)
-+{
-+    const char *dev_type =3D sd_is_emmc(sd) ? "eMMC" : "SD card";
-+    char *blk_size_str;
-+
-+    blk_size_str =3D size_to_str(blk_size);
-+    error_setg(errp, "Invalid %s size: %s", dev_type, blk_size_str);
-+    g_free(blk_size_str);
-+
-+    blk_size_str =3D size_to_str(blk_size_aligned);
-+    error_append_hint(errp,
-+                      "%s size has to be %s, e.g. %s.\n"
-+                      "You can resize disk images with"
-+                      " 'qemu-img resize <imagefile> <new-size>'\n"
-+                      "(note that this will lose data if you make the"
-+                      " image smaller than it currently is).\n",
-+                      dev_type, rule, blk_size_str);
-+    g_free(blk_size_str);
-+}
-+
- static void sd_realize(DeviceState *dev, Error **errp)
- {
-     SDState *sd =3D SDMMC_COMMON(dev);
-+    int64_t blk_size =3D -ENOMEDIUM;
-     int ret;
-=20
-     switch (sd->spec_version) {
-@@ -2782,32 +2805,36 @@ static void sd_realize(DeviceState *dev, Error *=
*errp)
-     }
-=20
-     if (sd->blk) {
--        int64_t blk_size;
--
-         if (!blk_supports_write_perm(sd->blk)) {
-             error_setg(errp, "Cannot use read-only drive as SD card");
-             return;
-         }
-=20
-         blk_size =3D blk_getlength(sd->blk);
--        if (blk_size > 0 && !is_power_of_2(blk_size)) {
--            int64_t blk_size_aligned =3D pow2ceil(blk_size);
--            char *blk_size_str;
--
--            blk_size_str =3D size_to_str(blk_size);
--            error_setg(errp, "Invalid SD card size: %s", blk_size_str);
--            g_free(blk_size_str);
--
--            blk_size_str =3D size_to_str(blk_size_aligned);
--            error_append_hint(errp,
--                              "SD card size has to be a power of 2, e.g=
. %s.\n"
--                              "You can resize disk images with"
--                              " 'qemu-img resize <imagefile> <new-size>=
'\n"
--                              "(note that this will lose data if you ma=
ke the"
--                              " image smaller than it currently is).\n"=
,
--                              blk_size_str);
--            g_free(blk_size_str);
--
-+    }
-+    if (blk_size >=3D 0) {
-+        blk_size -=3D sd->boot_part_size * 2;
-+        if (blk_size > SDSC_MAX_CAPACITY) {
-+            if (sd_is_emmc(sd) &&
-+                !QEMU_IS_ALIGNED(blk_size, 1 << HWBLOCK_SHIFT)) {
-+                int64_t blk_size_aligned =3D
-+                    ((blk_size >> HWBLOCK_SHIFT) + 1) << HWBLOCK_SHIFT;
-+                sd_blk_size_error(sd, blk_size, blk_size_aligned,
-+                                  "multiples of 512", errp);
-+                return;
-+            } else if (!sd_is_emmc(sd) &&
-+                !QEMU_IS_ALIGNED(blk_size, 512 * KiB)) {
-+                int64_t blk_size_aligned =3D ((blk_size >> 19) + 1) << =
19;
-+                sd_blk_size_error(sd, blk_size, blk_size_aligned,
-+                                  "multiples of 512K", errp);
-+                return;
-+            }
-+        } else if (blk_size > 0 && !is_power_of_2(blk_size)) {
-+            sd_blk_size_error(sd, blk_size, pow2ceil(blk_size), "a powe=
r of 2",
-+                              errp);
-+            return;
-+        } else if (blk_size < 0) {
-+            error_setg(errp, "eMMC image smaller than boot partitions")=
;
-             return;
-         }
-=20
diff --git a/meta/recipes-devtools/qemu/qemu_10.1.3.bb b/meta/recipes-dev=
tools/qemu/qemu_10.2.0.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_10.1.3.bb
rename to meta/recipes-devtools/qemu/qemu_10.2.0.bb
--=20
2.34.1


