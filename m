Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00020C61DB2
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 05:01:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.2909.1749790874896169820
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 22:01:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=82598fc9cb=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D4cvRQ024970
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 22:01:14 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474gq46d08-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 22:01:13 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 12 Jun 2025 22:01:13 -0700
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Thu, 12 Jun 2025 22:01:13 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] ovmf: fix CVE-2024-38797
Date: Thu, 12 Jun 2025 22:01:13 -0700
Message-ID: <20250613050113.3022522-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Qrde3Uyd c=1 sm=1 tr=0 ts=684bb09a cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=hqBzw_eTAAAA:8 a=t7CeM3EgAAAA:8 a=yMhMjlubAAAA:8 a=QyXUC8HyAAAA:8
 a=RkDKFArEn3lLgLxa9W0A:9 a=MRw_IcwRwWj9AOZ2:21 a=bkWp_v3HvcftT6DRAIDL:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: OXm5hmEiyKnZyz2k1vkJrBlndwbEJ-Q1
X-Proofpoint-ORIG-GUID: OXm5hmEiyKnZyz2k1vkJrBlndwbEJ-Q1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDAzNSBTYWx0ZWRfX/v6N6KY4CH3P 0RZJF/QOo6fiHlX7uyccF35gXqAVHp/TsYGDLRdvqrhbZEdtG0nfw+ZeRye7jqfWk8S18LeOpVH vcSTEN7cwGKP3uGs6lni+c7Ypgbb9pzw0ElonRNVLGqlPGm6NX4fAq8GoL9znsM8QKEQXXNUADq
 Q2MWFsysfJVFv8yp0ZiM1mpe68rbzi4vCPItM8PcmpFv5vELlQV+hBiMTmfv2Fwf3JUkAoUss4q HE0w704WXjsGguoVmqpcn4KgglCjXefeq6jprCD5QEDDZ9oH0tDIoGPK18EW6Lrax37AJcsAhei F8G4C2jkj5VCyIUEJyJKzdftQGYJecGZIdDAcudQVZbMkVsoNMGOJT8mrhs2/rCq/0ZuUnbXSil
 pBglYTV/Jf6lP42gJIozvR+OSr7AB0yrgMkbFFfC5wOrmFBosYb2tf96oYoIEx9SFIDR0/XB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506130035
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 05:01:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218574

According to [1]:

EDK2 contains a vulnerability in the HashPeImageByType(). A user may cause =
a read out of
bounds when a corrupted data pointer and length are sent via an adjecent ne=
twork.
A successful exploit of this vulnerability may lead to a loss of Integrity =
and/or
Availability.

Backport fixes from upstream edk2 [2][3]

[1] https://nvd.nist.gov/vuln/detail/CVE-2024-38797
[2] https://github.com/tianocore/edk2/security/advisories/GHSA-4wjw-6xmf-44=
xf
[3] https://github.com/tianocore/edk2/pull/10928

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../ovmf/ovmf/CVE-2024-38797-1.patch          | 43 ++++++++
 .../ovmf/ovmf/CVE-2024-38797-2.patch          | 63 ++++++++++++
 .../ovmf/ovmf/CVE-2024-38797-3.patch          | 99 +++++++++++++++++++
 .../ovmf/ovmf/CVE-2024-38797-4.patch          | 97 ++++++++++++++++++
 meta/recipes-core/ovmf/ovmf_git.bb            |  4 +
 5 files changed, 306 insertions(+)
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2024-38797-1.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2024-38797-2.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2024-38797-3.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2024-38797-4.patch

diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2024-38797-1.patch b/meta/reci=
pes-core/ovmf/ovmf/CVE-2024-38797-1.patch
new file mode 100644
index 0000000000..066dfa0ff0
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/CVE-2024-38797-1.patch
@@ -0,0 +1,43 @@
+From 2c8fb3e5164effc8a370e800fe91db7341e69116 Mon Sep 17 00:00:00 2001
+From: Doug Flick <dougflick@microsoft.com>
+Date: Mon, 7 Apr 2025 11:23:41 -0700
+Subject: [PATCH 1/4] SecurityPkg: Update SecurityFixes.yaml for CVE-2024-3=
8797
+
+This commit updates the SecurityFixes.yaml file to include
+information about the CVE-2024-38797 vulnerability.
+
+Signed-off-by: Doug Flick <DougFlick@microsoft.com>
+
+CVE: CVE-2024-38797
+Upstream-Status: Backport [https://github.com/tianocore/edk2/pull/10928/co=
mmits/519366f542e9370bee982b1c3687ffedb5cabc21]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ SecurityPkg/SecurityFixes.yaml | 15 +++++++++++++++
+ 1 file changed, 15 insertions(+)
+
+diff --git a/SecurityPkg/SecurityFixes.yaml b/SecurityPkg/SecurityFixes.ya=
ml
+index b4006b4..06b597a 100644
+--- a/SecurityPkg/SecurityFixes.yaml
++++ b/SecurityPkg/SecurityFixes.yaml
+@@ -40,3 +40,18 @@ CVE_2022_36764:
+     - Library\DxeTpmMeasureBootLib\DxeTpmMeasureBootLib.c=0D
+   links:=0D
+     - https://bugzilla.tianocore.org/show_bug.cgi?id=3D4118=0D
++CVE_2024_38797:=0D
++  commit-titles:=0D
++    - "SecurityPkg: Out of bound read in HashPeImageByType()"=0D
++    - "SecurityPkg: Improving HashPeImageByType () logic"=0D
++    - "SecurityPkg: Improving SecureBootConfigImpl:HashPeImageByType () l=
ogic"=0D
++  cve: CVE-2024-38797=0D
++  date_reported: 2024-06-04 12:00 UTC=0D
++  description: Out of bound read in HashPeImageByType()=0D
++  note:=0D
++  files_impacted:=0D
++    - SecurityPkg\Library\DxeImageVerificationLib\DxeImageVerificationLib=
.c=0D
++    - SecurityPkg\VariableAuthenticated\SecureBootConfigDxe\SecureBootCon=
figImpl.c=0D
++  links:=0D
++    - https://bugzilla.tianocore.org/show_bug.cgi?id=3D2214=0D
++    - https://github.com/tianocore/edk2/security/advisories/GHSA-4wjw-6xm=
f-44xf=0D
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2024-38797-2.patch b/meta/reci=
pes-core/ovmf/ovmf/CVE-2024-38797-2.patch
new file mode 100644
index 0000000000..9bf6645681
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/CVE-2024-38797-2.patch
@@ -0,0 +1,63 @@
+From 1a7be26382c4a34504875f094e15fe371d44192e Mon Sep 17 00:00:00 2001
+From: Doug Flick <dougflick@microsoft.com>
+Date: Thu, 3 Oct 2024 09:37:18 -0700
+Subject: [PATCH 2/4] SecurityPkg: Out of bound read in HashPeImageByType()
+
+In HashPeImageByType(), the hash of PE/COFF image is calculated.
+This function may get untrusted input.
+
+Inside this function, the following code verifies the loaded image has
+the correct format, by reading the second byte of the buffer.
+
+```c
+  if ((*(AuthData + 1) & TWO_BYTE_ENCODE) !=3D TWO_BYTE_ENCODE) {
+  	...
+  }
+```
+
+The input image is not trusted and that may not have the second byte to
+read. So this poses an out of bound read error.
+
+With below fix we are assuring that we don't do out of bound read. i.e,
+we make sure that AuthDataSize is greater than 1.
+
+```c
+  if (AuthDataSize > 1
+      && (*(AuthData + 1) & TWO_BYTE_ENCODE) !=3D TWO_BYTE_ENCODE){
+    ...
+  }
+```
+
+AuthDataSize size is verified before reading the second byte.
+So if AuthDataSize is less than 2, the second byte will not be read, and
+the out of bound read situation won't occur.
+
+Tested the patch on real platform with and without TPM connected and
+verified image is booting fine.
+
+Authored-by: Raj AlwinX Selvaraj <Alw...@intel.com>
+Signed-off-by: Doug Flick <DougFlick@microsoft.com>
+
+CVE: CVE-2024-38797
+Upstream-Status: Backport [https://github.com/tianocore/edk2/pull/10928/co=
mmits/2dcdb41b564aa3cb846644b4b1722a0b3ae5e06b]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ .../Library/DxeImageVerificationLib/DxeImageVerificationLib.c   | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/SecurityPkg/Library/DxeImageVerificationLib/DxeImageVerificat=
ionLib.c b/SecurityPkg/Library/DxeImageVerificationLib/DxeImageVerification=
Lib.c
+index b05da19..2afa2c9 100644
+--- a/SecurityPkg/Library/DxeImageVerificationLib/DxeImageVerificationLib.c
++++ b/SecurityPkg/Library/DxeImageVerificationLib/DxeImageVerificationLib.c
+@@ -642,7 +642,7 @@ HashPeImageByType (
+     //    This field has the fixed offset (+32) in final Authenticode ASN=
.1 data.=0D
+     //    Fixed offset (+32) is calculated based on two bytes of length e=
ncoding.=0D
+     //=0D
+-    if ((*(AuthData + 1) & TWO_BYTE_ENCODE) !=3D TWO_BYTE_ENCODE) {=0D
++    if ((AuthDataSize > 1) && ((*(AuthData + 1) & TWO_BYTE_ENCODE) !=3D T=
WO_BYTE_ENCODE)) {=0D
+       //=0D
+       // Only support two bytes of Long Form of Length Encoding.=0D
+       //=0D
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2024-38797-3.patch b/meta/reci=
pes-core/ovmf/ovmf/CVE-2024-38797-3.patch
new file mode 100644
index 0000000000..169c78daab
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/CVE-2024-38797-3.patch
@@ -0,0 +1,99 @@
+From 4db363db013a92937431234252fc9d84e44fc120 Mon Sep 17 00:00:00 2001
+From: Doug Flick <dougflick@microsoft.com>
+Date: Thu, 3 Oct 2024 10:16:57 -0700
+Subject: [PATCH 3/4] SecurityPkg: Improving HashPeImageByType () logic
+
+Namely:
+
+(1) The TWO_BYTE_ENCODE check is independent of Index. If it evalutes
+    to TRUE for Index=3D=3D0, then it will evaluate to TRUE for all other
+    Index values as well. As a result, the (Index =3D=3D HASHALG_MAX)
+    condition will fire after the loop, and we'll return
+    EFI_UNSUPPORTED.
+
+    While this is correct, functionally speaking, it is wasteful to
+    keep re-checking TWO_BYTE_ENCODE in the loop body. The check
+    should be made at the top of the function, and EFI_UNSUPPORTED
+    should be returned at once, if appropriate.
+
+(2) If the hash algorithm selected by Index has such a large OID that
+    the OID comparison cannot even be performed (because AuthDataSize
+    is not large enough for containing the OID in question, starting
+    at offset 32), then the function returns EFI_UNSUPPORTED at once.
+
+    This is bogus; this case should simply be treated as an OID
+    mismatch, and the loop should advance to the next Index value /
+    hash algorithm candidate. A remaining hash algo may have a shorter
+    OID and yield an OID match.
+
+Signed-off-by: Doug Flick <DougFlick@microsoft.com>
+
+CVE: CVE-2024-38797
+Upstream-Status: Backport [https://github.com/tianocore/edk2/pull/10928/co=
mmits/5df518ec510324f48ed1cf0376150960644b41f0]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ .../DxeImageVerificationLib.c                 | 37 ++++++++++---------
+ 1 file changed, 19 insertions(+), 18 deletions(-)
+
+diff --git a/SecurityPkg/Library/DxeImageVerificationLib/DxeImageVerificat=
ionLib.c b/SecurityPkg/Library/DxeImageVerificationLib/DxeImageVerification=
Lib.c
+index 2afa2c9..2eca39d 100644
+--- a/SecurityPkg/Library/DxeImageVerificationLib/DxeImageVerificationLib.c
++++ b/SecurityPkg/Library/DxeImageVerificationLib/DxeImageVerificationLib.c
+@@ -618,6 +618,7 @@ Done:
+   @param[in]  AuthDataSize        Size of the Authenticode Signature in b=
ytes.=0D
+ =0D
+   @retval EFI_UNSUPPORTED             Hash algorithm is not supported.=0D
++  @retval EFI_BAD_BUFFER_SIZE         AuthData provided is invalid size.=
=0D
+   @retval EFI_SUCCESS                 Hash successfully.=0D
+ =0D
+ **/=0D
+@@ -629,28 +630,28 @@ HashPeImageByType (
+ {=0D
+   UINT8  Index;=0D
+ =0D
+-  for (Index =3D 0; Index < HASHALG_MAX; Index++) {=0D
++  //=0D
++  // Check the Hash algorithm in PE/COFF Authenticode.=0D
++  //    According to PKCS#7 Definition:=0D
++  //        SignedData ::=3D SEQUENCE {=0D
++  //            version Version,=0D
++  //            digestAlgorithms DigestAlgorithmIdentifiers,=0D
++  //            contentInfo ContentInfo,=0D
++  //            .... }=0D
++  //    The DigestAlgorithmIdentifiers can be used to determine the hash =
algorithm in PE/COFF hashing=0D
++  //    This field has the fixed offset (+32) in final Authenticode ASN.1=
 data.=0D
++  //    Fixed offset (+32) is calculated based on two bytes of length enc=
oding.=0D
++  //=0D
++  if ((AuthDataSize > 1) && ((*(AuthData + 1) & TWO_BYTE_ENCODE) !=3D TWO=
_BYTE_ENCODE)) {=0D
+     //=0D
+-    // Check the Hash algorithm in PE/COFF Authenticode.=0D
+-    //    According to PKCS#7 Definition:=0D
+-    //        SignedData ::=3D SEQUENCE {=0D
+-    //            version Version,=0D
+-    //            digestAlgorithms DigestAlgorithmIdentifiers,=0D
+-    //            contentInfo ContentInfo,=0D
+-    //            .... }=0D
+-    //    The DigestAlgorithmIdentifiers can be used to determine the has=
h algorithm in PE/COFF hashing=0D
+-    //    This field has the fixed offset (+32) in final Authenticode ASN=
.1 data.=0D
+-    //    Fixed offset (+32) is calculated based on two bytes of length e=
ncoding.=0D
++    // Only support two bytes of Long Form of Length Encoding.=0D
+     //=0D
+-    if ((AuthDataSize > 1) && ((*(AuthData + 1) & TWO_BYTE_ENCODE) !=3D T=
WO_BYTE_ENCODE)) {=0D
+-      //=0D
+-      // Only support two bytes of Long Form of Length Encoding.=0D
+-      //=0D
+-      continue;=0D
+-    }=0D
++    return EFI_BAD_BUFFER_SIZE;=0D
++  }=0D
+ =0D
++  for (Index =3D 0; Index < HASHALG_MAX; Index++) {=0D
+     if (AuthDataSize < 32 + mHash[Index].OidLength) {=0D
+-      return EFI_UNSUPPORTED;=0D
++      continue;=0D
+     }=0D
+ =0D
+     if (CompareMem (AuthData + 32, mHash[Index].OidValue, mHash[Index].Oi=
dLength) =3D=3D 0) {=0D
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2024-38797-4.patch b/meta/reci=
pes-core/ovmf/ovmf/CVE-2024-38797-4.patch
new file mode 100644
index 0000000000..86bc950e7d
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/CVE-2024-38797-4.patch
@@ -0,0 +1,97 @@
+From cb3342702c5c1f8a4ddbb6d503a98ed720d14eb3 Mon Sep 17 00:00:00 2001
+From: Doug Flick <dougflick@microsoft.com>
+Date: Fri, 17 Jan 2025 11:30:17 -0800
+Subject: [PATCH 4/4] SecurityPkg: Improving
+ SecureBootConfigImpl:HashPeImageByType () logic
+
+Namely:
+
+(1) The TWO_BYTE_ENCODE check is independent of Index. If it evalutes
+    to TRUE for Index=3D=3D0, then it will evaluate to TRUE for all other
+    Index values as well. As a result, the (Index =3D=3D HASHALG_MAX)
+    condition will fire after the loop, and we'll return
+    EFI_UNSUPPORTED.
+
+    While this is correct, functionally speaking, it is wasteful to
+    keep re-checking TWO_BYTE_ENCODE in the loop body. The check
+    should be made at the top of the function, and EFI_UNSUPPORTED
+    should be returned at once, if appropriate.
+
+(2) If the hash algorithm selected by Index has such a large OID that
+    the OID comparison cannot even be performed (because AuthDataSize
+    is not large enough for containing the OID in question, starting
+    at offset 32), then the function returns EFI_UNSUPPORTED at once.
+
+    This is bogus; this case should simply be treated as an OID
+    mismatch, and the loop should advance to the next Index value /
+    hash algorithm candidate. A remaining hash algo may have a shorter
+    OID and yield an OID match.
+
+Signed-off-by: Doug Flick <DougFlick@microsoft.com>
+
+CVE: CVE-2024-38797
+Upstream-Status: Backport [https://github.com/tianocore/edk2/pull/10928/co=
mmits/8676572908b950dd4d1f8985006011be99c0a5b6]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ .../SecureBootConfigImpl.c                    | 37 +++++++++++--------
+ 1 file changed, 21 insertions(+), 16 deletions(-)
+
+diff --git a/SecurityPkg/VariableAuthenticated/SecureBootConfigDxe/SecureB=
ootConfigImpl.c b/SecurityPkg/VariableAuthenticated/SecureBootConfigDxe/Sec=
ureBootConfigImpl.c
+index 6d4560c..155e755 100644
+--- a/SecurityPkg/VariableAuthenticated/SecureBootConfigDxe/SecureBootConf=
igImpl.c
++++ b/SecurityPkg/VariableAuthenticated/SecureBootConfigDxe/SecureBootConf=
igImpl.c
+@@ -2096,30 +2096,35 @@ HashPeImageByType (
+ {=0D
+   UINT8                     Index;=0D
+   WIN_CERTIFICATE_EFI_PKCS  *PkcsCertData;=0D
++  UINT32                    PkcsCertSize;=0D
+ =0D
+   PkcsCertData =3D (WIN_CERTIFICATE_EFI_PKCS *)(mImageBase + mSecDataDir-=
>Offset);=0D
++  PkcsCertSize =3D mSecDataDir->SizeOfCert;=0D
+ =0D
+-  for (Index =3D 0; Index < HASHALG_MAX; Index++) {=0D
++  //=0D
++  // Check the Hash algorithm in PE/COFF Authenticode.=0D
++  //    According to PKCS#7 Definition:=0D
++  //        SignedData ::=3D SEQUENCE {=0D
++  //            version Version,=0D
++  //            digestAlgorithms DigestAlgorithmIdentifiers,=0D
++  //            contentInfo ContentInfo,=0D
++  //            .... }=0D
++  //    The DigestAlgorithmIdentifiers can be used to determine the hash =
algorithm in PE/COFF hashing=0D
++  //    This field has the fixed offset (+32) in final Authenticode ASN.1=
 data.=0D
++  //    Fixed offset (+32) is calculated based on two bytes of length enc=
oding.=0D
++  //=0D
++  if ((PkcsCertSize > 1) && ((*(PkcsCertData->CertData + 1) & TWO_BYTE_EN=
CODE) !=3D TWO_BYTE_ENCODE)) {=0D
+     //=0D
+-    // Check the Hash algorithm in PE/COFF Authenticode.=0D
+-    //    According to PKCS#7 Definition:=0D
+-    //        SignedData ::=3D SEQUENCE {=0D
+-    //            version Version,=0D
+-    //            digestAlgorithms DigestAlgorithmIdentifiers,=0D
+-    //            contentInfo ContentInfo,=0D
+-    //            .... }=0D
+-    //    The DigestAlgorithmIdentifiers can be used to determine the has=
h algorithm in PE/COFF hashing=0D
+-    //    This field has the fixed offset (+32) in final Authenticode ASN=
.1 data.=0D
+-    //    Fixed offset (+32) is calculated based on two bytes of length e=
ncoding.=0D
++    // Only support two bytes of Long Form of Length Encoding.=0D
+     //=0D
+-    if ((*(PkcsCertData->CertData + 1) & TWO_BYTE_ENCODE) !=3D TWO_BYTE_E=
NCODE) {=0D
+-      //=0D
+-      // Only support two bytes of Long Form of Length Encoding.=0D
+-      //=0D
++    return EFI_BAD_BUFFER_SIZE;=0D
++  }=0D
++=0D
++  for (Index =3D 0; Index < HASHALG_MAX; Index++) {=0D
++    if (PkcsCertSize < 32 + mHash[Index].OidLength) {=0D
+       continue;=0D
+     }=0D
+ =0D
+-    //=0D
+     if (CompareMem (PkcsCertData->CertData + 32, mHash[Index].OidValue, m=
Hash[Index].OidLength) =3D=3D 0) {=0D
+       break;=0D
+     }=0D
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ov=
mf_git.bb
index aa7de3af2b..ab6c580722 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -27,6 +27,10 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branc=
h=3Dmaster;protocol=3Dhttps \
            file://0003-debug-prefix-map.patch \
            file://0004-reproducible.patch \
            file://CVE-2025-2295.patch \
+           file://CVE-2024-38797-1.patch \
+           file://CVE-2024-38797-2.patch \
+           file://CVE-2024-38797-3.patch \
+           file://CVE-2024-38797-4.patch \
            "
=20
 PV =3D "edk2-stable202502"
--=20
2.49.0


