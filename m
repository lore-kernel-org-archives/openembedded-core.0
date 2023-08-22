Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 798BFEE4996
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 10:03:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.4650.1692698620665396514
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Aug 2023 03:03:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=TFI+LR84;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7598561214=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37M6OtTx015038
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 03:03:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding; s=PPS06212021; bh=wlIpE9ouII2A4L1vXt
	EOADPV+y10SJ5BSxlXmDl6Ex0=; b=TFI+LR84Zf46sB1LeNSBteHTec7j5wkYzq
	Eb6nTA8aPZlc7KO3pz2tAy8EjbH9Vjt9sXuR0GfhGGYreDTgosy1PowK54KnsZWv
	ZSOBaW12Vh9q9YLeuxYhEGallc30kisCvROld1dZdQj/3E0fsPUtkm0Wf5gECqRL
	bmyKIxF1a0cjFmhr6FxLmvmHDZh7agUgvMKo+ZqtcTMHczmslDX0IzecmGgpLhPf
	9eCQ8MJGRhtbfZMbbjNO8UsiTSAHNII8sp6f6M3TaNSwpbiot1rtT8cKsBA+5wnb
	6xfzlYsICeESuJ9GZaFcBga5nJzCaPtAqMtwcoh5/99ARZin4xGg==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sjs0ytbqg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 03:03:40 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 22 Aug 2023 03:03:37 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 1/1] glib-2.0: Fix CVE-2023-32643 and CVE-2023-32636
Date: Tue, 22 Aug 2023 10:03:20 +0000
Message-ID: <20230822100320.1263872-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: l17uY2oMw1M_PfpBUMBXf_2O_gigLPgA
X-Proofpoint-ORIG-GUID: l17uY2oMw1M_PfpBUMBXf_2O_gigLPgA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-22_10,2023-08-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 mlxscore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=999
 spamscore=0 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2306200000
 definitions=main-2308220076
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 37M6OtTx015038
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 10:03:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186502

From: Soumya Sambu <soumya.sambu@windriver.com>

fuzz_variant_binary_byteswap: Heap-buffer-overflow in g_variant_serialise=
d_get_child

fuzz_variant_text: Timeout in fuzz_variant_text

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../glib-2.0/glib-2.0/CVE-2023-32636.patch    |  50 ++++++
 .../glib-2.0/glib-2.0/CVE-2023-32643.patch    | 155 ++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |   2 +
 3 files changed, 207 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32636.pa=
tch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32643.pa=
tch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32636.patch b/m=
eta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32636.patch
new file mode 100644
index 0000000000..311993625a
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32636.patch
@@ -0,0 +1,50 @@
+From 21a204147b16539b3eda3143b32844c49e29f4d4 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@endlessos.org>
+Date: Thu, 17 Aug 2023 11:33:49 +0000
+Subject: [PATCH] gvariant: Propagate trust when getting a child of a
+ serialised variant
+
+If a variant is trusted, that means all its children are trusted, so
+ensure that their checked offsets are set as such.
+
+This allows a lot of the offset table checks to be avoided when getting
+children from trusted serialised tuples, which speeds things up.
+
+No unit test is included because this is just a performance fix. If
+there are other slownesses, or regressions, in serialised `GVariant`
+performance, the fuzzing setup will catch them like it did this one.
+
+This change does reduce the time to run the oss-fuzz reproducer from 80s
+to about 0.7s on my machine.
+
+Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
+
+Fixes: #2841
+oss-fuzz#54314
+
+CVE: CVE-2023-32636
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/=
21a204147b16539b3eda3143b32844c49e29f4d4]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ glib/gvariant-core.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/glib/gvariant-core.c b/glib/gvariant-core.c
+index 7b71efc..a2c7d2d 100644
+--- a/glib/gvariant-core.c
++++ b/glib/gvariant-core.c
+@@ -1195,8 +1195,8 @@ g_variant_get_child_value (GVariant *value,
+     child->contents.serialised.bytes =3D
+       g_bytes_ref (value->contents.serialised.bytes);
+     child->contents.serialised.data =3D s_child.data;
+-    child->contents.serialised.ordered_offsets_up_to =3D s_child.ordere=
d_offsets_up_to;
+-    child->contents.serialised.checked_offsets_up_to =3D s_child.checke=
d_offsets_up_to;
++    child->contents.serialised.ordered_offsets_up_to =3D (value->state =
& STATE_TRUSTED) ? G_MAXSIZE : s_child.ordered_offsets_up_to;
++    child->contents.serialised.checked_offsets_up_to =3D (value->state =
& STATE_TRUSTED) ? G_MAXSIZE : s_child.checked_offsets_up_to;
+
+     return child;
+   }
+--
+2.40.0
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32643.patch b/m=
eta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32643.patch
new file mode 100644
index 0000000000..b5cb4273b6
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32643.patch
@@ -0,0 +1,155 @@
+From 78da5faccb3e065116b75b3ff87ff55381da6c76 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@endlessos.org>
+Date: Thu, 17 Aug 2023 11:24:43 +0000
+Subject: [PATCH] gvariant: Check offset table doesn't fall outside varia=
nt
+ bounds
+
+When dereferencing the first entry in the offset table for a tuple,
+check that it doesn=E2=80=99t fall outside the bounds of the variant fir=
st.
+
+This prevents an out-of-bounds read from some non-normal tuples.
+
+This bug was introduced in commit 73d0aa81c2575a5c9ae77d.
+
+Includes a unit test, although the test will likely only catch the
+original bug if run with asan enabled.
+
+Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
+
+Fixes: #2840
+oss-fuzz#54302
+
+CVE: CVE-2023-32643
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/=
78da5faccb3e065116b75b3ff87ff55381da6c76]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ glib/gvariant-serialiser.c | 12 ++++++--
+ glib/tests/gvariant.c      | 63 ++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 72 insertions(+), 3 deletions(-)
+
+diff --git a/glib/gvariant-serialiser.c b/glib/gvariant-serialiser.c
+index 3d6e7b8..5abb87e 100644
+--- a/glib/gvariant-serialiser.c
++++ b/glib/gvariant-serialiser.c
+@@ -979,7 +979,8 @@ gvs_tuple_get_member_bounds (GVariantSerialised  val=
ue,
+
+   member_info =3D g_variant_type_info_member_info (value.type_info, ind=
ex_);
+
+-  if (member_info->i + 1)
++  if (member_info->i + 1 &&
++      offset_size * (member_info->i + 1) <=3D value.size)
+     member_start =3D gvs_read_unaligned_le (value.data + value.size -
+                                           offset_size * (member_info->i=
 + 1),
+                                           offset_size);
+@@ -990,7 +991,8 @@ gvs_tuple_get_member_bounds (GVariantSerialised  val=
ue,
+   member_start &=3D member_info->b;
+   member_start |=3D member_info->c;
+
+-  if (member_info->ending_type =3D=3D G_VARIANT_MEMBER_ENDING_LAST)
++  if (member_info->ending_type =3D=3D G_VARIANT_MEMBER_ENDING_LAST &&
++      offset_size * (member_info->i + 1) <=3D value.size)
+     member_end =3D value.size - offset_size * (member_info->i + 1);
+
+   else if (member_info->ending_type =3D=3D G_VARIANT_MEMBER_ENDING_FIXE=
D)
+@@ -1001,11 +1003,15 @@ gvs_tuple_get_member_bounds (GVariantSerialised =
 value,
+       member_end =3D member_start + fixed_size;
+     }
+
+-  else /* G_VARIANT_MEMBER_ENDING_OFFSET */
++  else if (member_info->ending_type =3D=3D G_VARIANT_MEMBER_ENDING_OFFS=
ET &&
++           offset_size * (member_info->i + 2) <=3D value.size)
+     member_end =3D gvs_read_unaligned_le (value.data + value.size -
+                                         offset_size * (member_info->i +=
 2),
+                                         offset_size);
+
++  else  /* invalid */
++    member_end =3D G_MAXSIZE;
++
+   if (out_member_start !=3D NULL)
+     *out_member_start =3D member_start;
+   if (out_member_end !=3D NULL)
+diff --git a/glib/tests/gvariant.c b/glib/tests/gvariant.c
+index 43091f2..ab0361a 100644
+--- a/glib/tests/gvariant.c
++++ b/glib/tests/gvariant.c
+@@ -5416,6 +5416,67 @@ test_normal_checking_tuple_offsets4 (void)
+   g_variant_unref (variant);
+ }
+
++/* This is a regression test that dereferencing the first element in th=
e offset
++ * table doesn=E2=80=99t dereference memory before the start of the GVa=
riant. The first
++ * element in the offset table gives the offset of the final member in =
the
++ * tuple (the offset table is stored in reverse), and the position of t=
his final
++ * member is needed to check that none of the tuple members overlap wit=
h the
++ * offset table
++ *
++ * See https://gitlab.gnome.org/GNOME/glib/-/issues/2840 */
++static void
++test_normal_checking_tuple_offsets5 (void)
++{
++  /* A tuple of type (sss) in normal form would have an offset table wi=
th two
++   * entries:
++   *  - The first entry (lowest index in the table) gives the offset of=
 the
++   *    third `s` in the tuple, as the offset table is reversed compare=
d to the
++   *    tuple members.
++   *  - The second entry (highest index in the table) gives the offset =
of the
++   *    second `s` in the tuple.
++   *  - The offset of the first `s` in the tuple is always 0.
++   *
++   * See =C2=A72.5.4 (Structures) of the GVariant specification for det=
ails, noting
++   * that the table is only layed out this way because all three member=
s of the
++   * tuple have non-fixed sizes.
++   *
++   * It=E2=80=99s not clear whether the 0xaa data of this variant is pa=
rt of the strings
++   * in the tuple, or part of the offset table. It doesn=E2=80=99t real=
ly matter. This
++   * is a regression test to check that the code to validate the offset=
 table
++   * doesn=E2=80=99t unconditionally try to access the first entry in t=
he offset table
++   * by subtracting the table size from the end of the GVariant data.
++   *
++   * In this non-normal case, that would result in an address off the s=
tart of
++   * the GVariant data, and an out-of-bounds read, because the GVariant=
 is one
++   * byte long, but the offset table is calculated as two bytes long (w=
ith 1B
++   * sized entries) from the tuple=E2=80=99s type.
++   */
++  const GVariantType *data_type =3D G_VARIANT_TYPE ("(sss)");
++  const guint8 data[] =3D { 0xaa };
++  gsize size =3D sizeof (data);
++  GVariant *variant =3D NULL;
++  GVariant *normal_variant =3D NULL;
++  GVariant *expected =3D NULL;
++
++  g_test_bug ("https://gitlab.gnome.org/GNOME/glib/-/issues/2840");
++
++  variant =3D g_variant_new_from_data (data_type, data, size, FALSE, NU=
LL, NULL);
++  g_assert_nonnull (variant);
++
++  g_assert_false (g_variant_is_normal_form (variant));
++
++  normal_variant =3D g_variant_get_normal_form (variant);
++  g_assert_nonnull (normal_variant);
++
++  expected =3D g_variant_new_parsed ("('', '', '')");
++  g_assert_cmpvariant (expected, variant);
++  g_assert_cmpvariant (expected, normal_variant);
++
++  g_variant_unref (expected);
++  g_variant_unref (normal_variant);
++  g_variant_unref (variant);
++}
++
+ /* Test that an otherwise-valid serialised GVariant is considered non-n=
ormal if
+  * its offset table entries are too wide.
+  *
+@@ -5663,6 +5724,8 @@ main (int argc, char **argv)
+                    test_normal_checking_tuple_offsets3);
+   g_test_add_func ("/gvariant/normal-checking/tuple-offsets4",
+                    test_normal_checking_tuple_offsets4);
++  g_test_add_func ("/gvariant/normal-checking/tuple-offsets5",
++                   test_normal_checking_tuple_offsets5);
+   g_test_add_func ("/gvariant/normal-checking/tuple-offsets/minimal-siz=
ed",
+                    test_normal_checking_tuple_offsets_minimal_sized);
+   g_test_add_func ("/gvariant/normal-checking/empty-object-path",
+--
+2.40.0
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb b/meta/recipes=
-core/glib-2.0/glib-2.0_2.72.3.bb
index 3545e6675a..24c590a714 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
@@ -29,6 +29,8 @@ SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV=
}.tar.xz \
            file://CVE-2023-29499.patch \
            file://CVE-2023-32611-0001.patch \
            file://CVE-2023-32611-0002.patch \
+           file://CVE-2023-32643.patch \
+           file://CVE-2023-32636.patch \
            "
 SRC_URI:append:class-native =3D " file://relocate-modules.patch"
=20
--=20
2.40.0


