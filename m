Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89E4BEE4996
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 10:02:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.4639.1692698573750830934
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Aug 2023 03:02:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=OHna6em8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7598561214=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37M8S7k5018325
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 10:02:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding; s=PPS06212021; bh=ZsxswXljRym+3HAivb
	YYJ5/be/SCJ+L1FfpwPKw7tOg=; b=OHna6em82bT2wdaKQQx7DUuLi1zBMuk/ko
	iqyQu8dpYY2Q4dKyux3Nk14cin4gwFQPpIOoQ6APgSayGrLXlip83ix7OXosruxO
	OYKFXAf1tYdrmZKM4Qcjxiq3/xutgRZEY+v7m/YrDxavr1Co22K4lRxIgXC0U8Xj
	n8Fz+CjtvRB1FL/lg/JOJ6EqcqCvfPN/INLcpiwsjESws/plAaqNEEP6BV+M5q7w
	Rztzdtm53sZz0Wi/qsVoW3eBVQK2WiML5GeOkPhV7xWCFZbgv+ot42MnW1dA0MWa
	D0KZ6J5MJ1p8FHNXClbBuZUMc38LnuxdPgcelJHMYAyzePusaWdQ==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sjjxw2gh4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 10:02:52 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 22 Aug 2023 03:02:48 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 1/1] glib-2.0: Fix CVE-2023-29499 and CVE-2023-32611
Date: Tue, 22 Aug 2023 10:02:29 +0000
Message-ID: <20230822100229.1216337-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: e70N_wDVhglYsIa1RWmdJzTF0q2puLUm
X-Proofpoint-GUID: e70N_wDVhglYsIa1RWmdJzTF0q2puLUm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-22_10,2023-08-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 mlxscore=0 suspectscore=0 bulkscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2308220076
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 37M8S7k5018325
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 10:02:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186501

From: Soumya Sambu <soumya.sambu@windriver.com>

GVariant offset table entry size is not checked in is_normal()

g_variant_byteswap() can take a long time with some non-normal inputs

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../glib-2.0/glib-2.0/CVE-2023-29499.patch    | 291 ++++++++++++++++++
 .../glib-2.0/CVE-2023-32611-0001.patch        |  97 ++++++
 .../glib-2.0/CVE-2023-32611-0002.patch        | 282 +++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |   3 +
 4 files changed, 673 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-29499.pa=
tch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32611-00=
01.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32611-00=
02.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-29499.patch b/m=
eta/recipes-core/glib-2.0/glib-2.0/CVE-2023-29499.patch
new file mode 100644
index 0000000000..65174efa6d
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-29499.patch
@@ -0,0 +1,291 @@
+From 5f4485c4ff57fdefb1661531788def7ca5a47328 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@endlessos.org>
+Date: Thu, 17 Aug 2023 04:19:44 +0000
+Subject: [PATCH] gvariant-serialiser: Check offset table entry size is m=
inimal
+
+The entries in an offset table (which is used for variable sized arrays
+and tuples containing variable sized members) are sized so that they can
+address every byte in the overall variant.
+
+The specification requires that for a variant to be in normal form, its
+offset table entries must be the minimum width such that they can
+address every byte in the variant.
+
+That minimality requirement was not checked in
+`g_variant_is_normal_form()`, leading to two different byte arrays being
+interpreted as the normal form of a given variant tree. That kind of
+confusion could potentially be exploited, and is certainly a bug.
+
+Fix it by adding the necessary checks on offset table entry width, and
+unit tests.
+
+Spotted by William Manley.
+
+Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
+
+Fixes: #2794
+
+CVE: CVE-2023-29499
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/=
5f4485c4ff57fdefb1661531788def7ca5a47328]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ glib/gvariant-serialiser.c |  19 +++-
+ glib/tests/gvariant.c      | 176 +++++++++++++++++++++++++++++++++++++
+ 2 files changed, 194 insertions(+), 1 deletion(-)
+
+diff --git a/glib/gvariant-serialiser.c b/glib/gvariant-serialiser.c
+index 9c7f12a..3d6e7b8 100644
+--- a/glib/gvariant-serialiser.c
++++ b/glib/gvariant-serialiser.c
+@@ -694,6 +694,10 @@ gvs_variable_sized_array_get_frame_offsets (GVarian=
tSerialised value)
+   out.data_size =3D last_end;
+   out.array =3D value.data + last_end;
+   out.length =3D offsets_array_size / out.offset_size;
++
++  if (out.length > 0 && gvs_calculate_total_size (last_end, out.length)=
 !=3D value.size)
++    return out;  /* offset size not minimal */
++
+   out.is_normal =3D TRUE;
+
+   return out;
+@@ -1201,6 +1205,7 @@ gvs_tuple_is_normal (GVariantSerialised value)
+   gsize length;
+   gsize offset;
+   gsize i;
++  gsize offset_table_size;
+
+   /* as per the comment in gvs_tuple_get_child() */
+   if G_UNLIKELY (value.data =3D=3D NULL && value.size !=3D 0)
+@@ -1305,7 +1310,19 @@ gvs_tuple_is_normal (GVariantSerialised value)
+       }
+   }
+
+-  return offset_ptr =3D=3D offset;
++  /* @offset_ptr has been counting backwards from the end of the varian=
t, to
++   * find the beginning of the offset table. @offset has been counting =
forwards
++   * from the beginning of the variant to find the end of the data. The=
y should
++   * have met in the middle. */
++  if (offset_ptr !=3D offset)
++    return FALSE;
++
++  offset_table_size =3D value.size - offset_ptr;
++  if (value.size > 0 &&
++      gvs_calculate_total_size (offset, offset_table_size / offset_size=
) !=3D value.size)
++    return FALSE;  /* offset size not minimal */
++
++  return TRUE;
+ }
+
+ /* Variants {{{2
+diff --git a/glib/tests/gvariant.c b/glib/tests/gvariant.c
+index 44e4451..ad45043 100644
+--- a/glib/tests/gvariant.c
++++ b/glib/tests/gvariant.c
+@@ -5076,6 +5076,86 @@ test_normal_checking_array_offsets2 (void)
+   g_variant_unref (variant);
+ }
+
++/* Test that an otherwise-valid serialised GVariant is considered non-n=
ormal if
++ * its offset table entries are too wide.
++ *
++ * See =C2=A72.3.6 (Framing Offsets) of the GVariant specification. */
++static void
++test_normal_checking_array_offsets_minimal_sized (void)
++{
++  GVariantBuilder builder;
++  gsize i;
++  GVariant *aay_constructed =3D NULL;
++  const guint8 *data =3D NULL;
++  guint8 *data_owned =3D NULL;
++  GVariant *aay_deserialised =3D NULL;
++  GVariant *aay_normalised =3D NULL;
++
++  /* Construct an array of type aay, consisting of 128 elements which a=
re each
++   * an empty array, i.e. `[[] * 128]`. This is chosen because the inne=
r
++   * elements are variable sized (making the outer array variable sized=
, so it
++   * must have an offset table), but they are also zero-sized when seri=
alised.
++   * So the serialised representation of @aay_constructed consists enti=
rely of
++   * its offset table, which is entirely zeroes.
++   *
++   * The array is chosen to be 128 elements long because that means off=
set
++   * table entries which are 1 byte long. If the elements in the array =
were
++   * non-zero-sized (to the extent that the overall array is =E2=89=A52=
56 bytes long),
++   * the offset table entries would end up being 2 bytes long. */
++  g_variant_builder_init (&builder, G_VARIANT_TYPE ("aay"));
++
++  for (i =3D 0; i < 128; i++)
++    g_variant_builder_add_value (&builder, g_variant_new_array (G_VARIA=
NT_TYPE_BYTE, NULL, 0));
++
++  aay_constructed =3D g_variant_builder_end (&builder);
++
++  /* Verify that the constructed array is in normal form, and its seria=
lised
++   * form is `b'\0' * 128`. */
++  g_assert_true (g_variant_is_normal_form (aay_constructed));
++  g_assert_cmpuint (g_variant_n_children (aay_constructed), =3D=3D, 128=
);
++  g_assert_cmpuint (g_variant_get_size (aay_constructed), =3D=3D, 128);
++
++  data =3D g_variant_get_data (aay_constructed);
++  for (i =3D 0; i < g_variant_get_size (aay_constructed); i++)
++    g_assert_cmpuint (data[i], =3D=3D, 0);
++
++  /* Construct a serialised `aay` GVariant which is `b'\0' * 256`. This=
 has to
++   * be a non-normal form of `[[] * 128]`, with 2-byte-long offset tabl=
e
++   * entries, because each offset table entry has to be able to referen=
ce all of
++   * the byte boundaries in the container. All the entries in the offse=
t table
++   * are zero, so all the elements of the array are zero-sized. */
++  data =3D data_owned =3D g_malloc0 (256);
++  aay_deserialised =3D g_variant_new_from_data (G_VARIANT_TYPE ("aay"),
++                                              data,
++                                              256,
++                                              FALSE,
++                                              g_free,
++                                              g_steal_pointer (&data_ow=
ned));
++
++  g_assert_false (g_variant_is_normal_form (aay_deserialised));
++  g_assert_cmpuint (g_variant_n_children (aay_deserialised), =3D=3D, 12=
8);
++  g_assert_cmpuint (g_variant_get_size (aay_deserialised), =3D=3D, 256)=
;
++
++  data =3D g_variant_get_data (aay_deserialised);
++  for (i =3D 0; i < g_variant_get_size (aay_deserialised); i++)
++    g_assert_cmpuint (data[i], =3D=3D, 0);
++
++  /* Get its normal form. That should change the serialised size. */
++  aay_normalised =3D g_variant_get_normal_form (aay_deserialised);
++
++  g_assert_true (g_variant_is_normal_form (aay_normalised));
++  g_assert_cmpuint (g_variant_n_children (aay_normalised), =3D=3D, 128)=
;
++  g_assert_cmpuint (g_variant_get_size (aay_normalised), =3D=3D, 128);
++
++  data =3D g_variant_get_data (aay_normalised);
++  for (i =3D 0; i < g_variant_get_size (aay_normalised); i++)
++    g_assert_cmpuint (data[i], =3D=3D, 0);
++
++  g_variant_unref (aay_normalised);
++  g_variant_unref (aay_deserialised);
++  g_variant_unref (aay_constructed);
++}
++
+ /* Test that a tuple with invalidly large values in its offset table is
+  * normalised successfully without looping infinitely. */
+ static void
+@@ -5270,6 +5350,98 @@ test_normal_checking_tuple_offsets4 (void)
+   g_variant_unref (variant);
+ }
+
++/* Test that an otherwise-valid serialised GVariant is considered non-n=
ormal if
++ * its offset table entries are too wide.
++ *
++ * See =C2=A72.3.6 (Framing Offsets) of the GVariant specification. */
++static void
++test_normal_checking_tuple_offsets_minimal_sized (void)
++{
++  GString *type_string =3D NULL;
++  GVariantBuilder builder;
++  gsize i;
++  GVariant *ray_constructed =3D NULL;
++  const guint8 *data =3D NULL;
++  guint8 *data_owned =3D NULL;
++  GVariant *ray_deserialised =3D NULL;
++  GVariant *ray_normalised =3D NULL;
++
++  /* Construct a tuple of type (ay=E2=80=A6ay), consisting of 129 membe=
rs which are each
++   * an empty array, i.e. `([] * 129)`. This is chosen because the inne=
r
++   * members are variable sized, so the outer tuple must have an offset=
 table,
++   * but they are also zero-sized when serialised. So the serialised
++   * representation of @ray_constructed consists entirely of its offset=
 table,
++   * which is entirely zeroes.
++   *
++   * The tuple is chosen to be 129 members long because that means it h=
as 128
++   * offset table entries which are 1 byte long each. If the members in=
 the
++   * tuple were non-zero-sized (to the extent that the overall tuple is=
 =E2=89=A5256
++   * bytes long), the offset table entries would end up being 2 bytes l=
ong.
++   *
++   * 129 members are used unlike 128 array elements in
++   * test_normal_checking_array_offsets_minimal_sized(), because the la=
st member
++   * in a tuple never needs an offset table entry. */
++  type_string =3D g_string_new ("");
++  g_string_append_c (type_string, '(');
++  for (i =3D 0; i < 129; i++)
++    g_string_append (type_string, "ay");
++  g_string_append_c (type_string, ')');
++
++  g_variant_builder_init (&builder, G_VARIANT_TYPE (type_string->str));
++
++  for (i =3D 0; i < 129; i++)
++    g_variant_builder_add_value (&builder, g_variant_new_array (G_VARIA=
NT_TYPE_BYTE, NULL, 0));
++
++  ray_constructed =3D g_variant_builder_end (&builder);
++
++  /* Verify that the constructed tuple is in normal form, and its seria=
lised
++   * form is `b'\0' * 128`. */
++  g_assert_true (g_variant_is_normal_form (ray_constructed));
++  g_assert_cmpuint (g_variant_n_children (ray_constructed), =3D=3D, 129=
);
++  g_assert_cmpuint (g_variant_get_size (ray_constructed), =3D=3D, 128);
++
++  data =3D g_variant_get_data (ray_constructed);
++  for (i =3D 0; i < g_variant_get_size (ray_constructed); i++)
++    g_assert_cmpuint (data[i], =3D=3D, 0);
++
++  /* Construct a serialised `(ay=E2=80=A6ay)` GVariant which is `b'\0' =
* 256`. This has
++   * to be a non-normal form of `([] * 129)`, with 2-byte-long offset t=
able
++   * entries, because each offset table entry has to be able to referen=
ce all of
++   * the byte boundaries in the container. All the entries in the offse=
t table
++   * are zero, so all the members of the tuple are zero-sized. */
++  data =3D data_owned =3D g_malloc0 (256);
++  ray_deserialised =3D g_variant_new_from_data (G_VARIANT_TYPE (type_st=
ring->str),
++                                              data,
++                                              256,
++                                              FALSE,
++                                              g_free,
++                                              g_steal_pointer (&data_ow=
ned));
++
++  g_assert_false (g_variant_is_normal_form (ray_deserialised));
++  g_assert_cmpuint (g_variant_n_children (ray_deserialised), =3D=3D, 12=
9);
++  g_assert_cmpuint (g_variant_get_size (ray_deserialised), =3D=3D, 256)=
;
++
++  data =3D g_variant_get_data (ray_deserialised);
++  for (i =3D 0; i < g_variant_get_size (ray_deserialised); i++)
++    g_assert_cmpuint (data[i], =3D=3D, 0);
++
++  /* Get its normal form. That should change the serialised size. */
++  ray_normalised =3D g_variant_get_normal_form (ray_deserialised);
++
++  g_assert_true (g_variant_is_normal_form (ray_normalised));
++  g_assert_cmpuint (g_variant_n_children (ray_normalised), =3D=3D, 129)=
;
++  g_assert_cmpuint (g_variant_get_size (ray_normalised), =3D=3D, 128);
++
++  data =3D g_variant_get_data (ray_normalised);
++  for (i =3D 0; i < g_variant_get_size (ray_normalised); i++)
++    g_assert_cmpuint (data[i], =3D=3D, 0);
++
++  g_variant_unref (ray_normalised);
++  g_variant_unref (ray_deserialised);
++  g_variant_unref (ray_constructed);
++  g_string_free (type_string, TRUE);
++}
++
+ /* Test that an empty object path is normalised successfully to the bas=
e object
+  * path, =E2=80=98/=E2=80=99. */
+ static void
+@@ -5414,6 +5586,8 @@ main (int argc, char **argv)
+                    test_normal_checking_array_offsets);
+   g_test_add_func ("/gvariant/normal-checking/array-offsets2",
+                    test_normal_checking_array_offsets2);
++  g_test_add_func ("/gvariant/normal-checking/array-offsets/minimal-siz=
ed",
++                   test_normal_checking_array_offsets_minimal_sized);
+   g_test_add_func ("/gvariant/normal-checking/tuple-offsets",
+                    test_normal_checking_tuple_offsets);
+   g_test_add_func ("/gvariant/normal-checking/tuple-offsets2",
+@@ -5422,6 +5596,8 @@ main (int argc, char **argv)
+                    test_normal_checking_tuple_offsets3);
+   g_test_add_func ("/gvariant/normal-checking/tuple-offsets4",
+                    test_normal_checking_tuple_offsets4);
++  g_test_add_func ("/gvariant/normal-checking/tuple-offsets/minimal-siz=
ed",
++                   test_normal_checking_tuple_offsets_minimal_sized);
+   g_test_add_func ("/gvariant/normal-checking/empty-object-path",
+                    test_normal_checking_empty_object_path);
+
+--
+2.40.0
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32611-0001.patc=
h b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32611-0001.patch
new file mode 100644
index 0000000000..cc4b4055b2
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32611-0001.patch
@@ -0,0 +1,97 @@
+From 4c4cf568f0f710baf0bd04d52df715636bc6b971 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@endlessos.org>
+Date: Thu, 17 Aug 2023 04:23:41 +0000
+Subject: [PATCH] gvariant: Fix g_variant_byteswap() returning non-normal=
 data
+
+If `g_variant_byteswap()` was called on a non-normal variant of a type
+which doesn=E2=80=99t need byteswapping, it would return a non-normal ou=
tput.
+
+That contradicts the documentation, which says that the return value is
+always in normal form.
+
+Fix the code so it matches the documentation.
+
+Includes a unit test.
+
+Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
+
+Helps: #2797
+
+CVE: CVE-2023-32611
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/=
4c4cf568f0f710baf0bd04d52df715636bc6b971]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ glib/gvariant.c       |  8 +++++---
+ glib/tests/gvariant.c | 24 ++++++++++++++++++++++++
+ 2 files changed, 29 insertions(+), 3 deletions(-)
+
+diff --git a/glib/gvariant.c b/glib/gvariant.c
+index 30a3280..7e568d1 100644
+--- a/glib/gvariant.c
++++ b/glib/gvariant.c
+@@ -6004,14 +6004,16 @@ g_variant_byteswap (GVariant *value)
+       g_variant_serialised_byteswap (serialised);
+
+       bytes =3D g_bytes_new_take (serialised.data, serialised.size);
+-      new =3D g_variant_new_from_bytes (g_variant_get_type (value), byt=
es, TRUE);
++      new =3D g_variant_ref_sink (g_variant_new_from_bytes (g_variant_g=
et_type (value), bytes, TRUE));
+       g_bytes_unref (bytes);
+     }
+   else
+     /* contains no multi-byte data */
+-    new =3D value;
++    new =3D g_variant_get_normal_form (value);
+
+-  return g_variant_ref_sink (new);
++  g_assert (g_variant_is_trusted (new));
++
++  return g_steal_pointer (&new);
+ }
+
+ /**
+diff --git a/glib/tests/gvariant.c b/glib/tests/gvariant.c
+index ad45043..36c86c2 100644
+--- a/glib/tests/gvariant.c
++++ b/glib/tests/gvariant.c
+@@ -3818,6 +3818,29 @@ test_gv_byteswap (void)
+   g_free (string);
+ }
+
++static void
++test_gv_byteswap_non_normal_non_aligned (void)
++{
++  const guint8 data[] =3D { 0x02 };
++  GVariant *v =3D NULL;
++  GVariant *v_byteswapped =3D NULL;
++
++  g_test_summary ("Test that calling g_variant_byteswap() on a variant =
which "
++                  "is in non-normal form and doesn=E2=80=99t need bytes=
wapping returns "
++                  "the same variant in normal form.");
++
++  v =3D g_variant_new_from_data (G_VARIANT_TYPE_BOOLEAN, data, sizeof (=
data), FALSE, NULL, NULL);
++  g_assert_false (g_variant_is_normal_form (v));
++
++  v_byteswapped =3D g_variant_byteswap (v);
++  g_assert_true (g_variant_is_normal_form (v_byteswapped));
++
++  g_assert_cmpvariant (v, v_byteswapped);
++
++  g_variant_unref (v);
++  g_variant_unref (v_byteswapped);
++}
++
+ static void
+ test_parser (void)
+ {
+@@ -5553,6 +5576,7 @@ main (int argc, char **argv)
+   g_test_add_func ("/gvariant/builder-memory", test_builder_memory);
+   g_test_add_func ("/gvariant/hashing", test_hashing);
+   g_test_add_func ("/gvariant/byteswap", test_gv_byteswap);
++  g_test_add_func ("/gvariant/byteswap/non-normal-non-aligned", test_gv=
_byteswap_non_normal_non_aligned);
+   g_test_add_func ("/gvariant/parser", test_parses);
+   g_test_add_func ("/gvariant/parser/integer-bounds", test_parser_integ=
er_bounds);
+   g_test_add_func ("/gvariant/parser/recursion", test_parser_recursion)=
;
+--
+2.40.0
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32611-0002.patc=
h b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32611-0002.patch
new file mode 100644
index 0000000000..304c15bceb
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32611-0002.patch
@@ -0,0 +1,282 @@
+From 7d7efce1d9c379fdd7d2ff58caea88f8806fdd2e Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@endlessos.org>
+Date: Thu, 17 Aug 2023 05:05:39 +0000
+Subject: [PATCH] gvariant: Allow g_variant_byteswap() to operate on tree=
-form
+ variants
+
+This avoids needing to always serialise a variant before byteswapping it.
+With variants in non-normal forms, serialisation can result in a large
+increase in size of the variant, and a lot of allocations for leaf
+`GVariant`s. This can lead to a denial of service attack.
+
+Avoid that by changing byteswapping so that it happens on the tree form
+of the variant if the input is in non-normal form. If the input is in
+normal form (either serialised or in tree form), continue using the
+existing code as byteswapping an already-serialised normal variant is
+about 3=C3=97 faster than byteswapping on the equivalent tree form.
+
+The existing unit tests cover byteswapping well, but need some
+adaptation so that they operate on tree form variants too.
+
+I considered dropping the serialised byteswapping code and doing all
+byteswapping on tree-form variants, as that would make maintenance
+simpler (avoiding having two parallel implementations of byteswapping).
+However, most inputs to `g_variant_byteswap()` are likely to be
+serialised variants (coming from a byte array of input from some foreign
+source) and most of them are going to be in normal form (as corruption
+and malicious action are rare). So getting rid of the serialised
+byteswapping code would impose quite a performance penalty on the common
+case.
+
+Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
+
+Fixes: #2797
+
+CVE: CVE-2023-32611
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/=
7d7efce1d9c379fdd7d2ff58caea88f8806fdd2e]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ glib/gvariant.c       | 83 ++++++++++++++++++++++++++++++++-----------
+ glib/tests/gvariant.c | 57 +++++++++++++++++++++++++----
+ 2 files changed, 113 insertions(+), 27 deletions(-)
+
+diff --git a/glib/gvariant.c b/glib/gvariant.c
+index 7e568d1..65b8443 100644
+--- a/glib/gvariant.c
++++ b/glib/gvariant.c
+@@ -5839,7 +5839,8 @@ g_variant_iter_loop (GVariantIter *iter,
+
+ /* Serialized data {{{1 */
+ static GVariant *
+-g_variant_deep_copy (GVariant *value)
++g_variant_deep_copy (GVariant *value,
++                     gboolean  byteswap)
+ {
+   switch (g_variant_classify (value))
+     {
+@@ -5857,7 +5858,7 @@ g_variant_deep_copy (GVariant *value)
+         for (i =3D 0, n_children =3D g_variant_n_children (value); i < =
n_children; i++)
+           {
+             GVariant *child =3D g_variant_get_child_value (value, i);
+-            g_variant_builder_add_value (&builder, g_variant_deep_copy =
(child));
++            g_variant_builder_add_value (&builder, g_variant_deep_copy =
(child, byteswap));
+             g_variant_unref (child);
+           }
+
+@@ -5871,28 +5872,63 @@ g_variant_deep_copy (GVariant *value)
+       return g_variant_new_byte (g_variant_get_byte (value));
+
+     case G_VARIANT_CLASS_INT16:
+-      return g_variant_new_int16 (g_variant_get_int16 (value));
++      if (byteswap)
++        return g_variant_new_int16 (GUINT16_SWAP_LE_BE (g_variant_get_i=
nt16 (value)));
++      else
++        return g_variant_new_int16 (g_variant_get_int16 (value));
+
+     case G_VARIANT_CLASS_UINT16:
+-      return g_variant_new_uint16 (g_variant_get_uint16 (value));
++      if (byteswap)
++        return g_variant_new_uint16 (GUINT16_SWAP_LE_BE (g_variant_get_=
uint16 (value)));
++      else
++        return g_variant_new_uint16 (g_variant_get_uint16 (value));
+
+     case G_VARIANT_CLASS_INT32:
+-      return g_variant_new_int32 (g_variant_get_int32 (value));
++      if (byteswap)
++        return g_variant_new_int32 (GUINT32_SWAP_LE_BE (g_variant_get_i=
nt32 (value)));
++      else
++        return g_variant_new_int32 (g_variant_get_int32 (value));
+
+     case G_VARIANT_CLASS_UINT32:
+-      return g_variant_new_uint32 (g_variant_get_uint32 (value));
++      if (byteswap)
++        return g_variant_new_uint32 (GUINT32_SWAP_LE_BE (g_variant_get_=
uint32 (value)));
++      else
++        return g_variant_new_uint32 (g_variant_get_uint32 (value));
+
+     case G_VARIANT_CLASS_INT64:
+-      return g_variant_new_int64 (g_variant_get_int64 (value));
++      if (byteswap)
++        return g_variant_new_int64 (GUINT64_SWAP_LE_BE (g_variant_get_i=
nt64 (value)));
++      else
++        return g_variant_new_int64 (g_variant_get_int64 (value));
+
+     case G_VARIANT_CLASS_UINT64:
+-      return g_variant_new_uint64 (g_variant_get_uint64 (value));
++      if (byteswap)
++        return g_variant_new_uint64 (GUINT64_SWAP_LE_BE (g_variant_get_=
uint64 (value)));
++      else
++        return g_variant_new_uint64 (g_variant_get_uint64 (value));
+
+     case G_VARIANT_CLASS_HANDLE:
+-      return g_variant_new_handle (g_variant_get_handle (value));
++      if (byteswap)
++        return g_variant_new_handle (GUINT32_SWAP_LE_BE (g_variant_get_=
handle (value)));
++      else
++        return g_variant_new_handle (g_variant_get_handle (value));
+
+     case G_VARIANT_CLASS_DOUBLE:
+-      return g_variant_new_double (g_variant_get_double (value));
++      if (byteswap)
++        {
++          /* We have to convert the double to a uint64 here using a uni=
on,
++           * because a cast will round it numerically. */
++          union
++            {
++              guint64 u64;
++              gdouble dbl;
++            } u1, u2;
++          u1.dbl =3D g_variant_get_double (value);
++          u2.u64 =3D GUINT64_SWAP_LE_BE (u1.u64);
++          return g_variant_new_double (u2.dbl);
++        }
++      else
++        return g_variant_new_double (g_variant_get_double (value));
+
+     case G_VARIANT_CLASS_STRING:
+       return g_variant_new_string (g_variant_get_string (value, NULL));
+@@ -5947,7 +5983,7 @@ g_variant_get_normal_form (GVariant *value)
+   if (g_variant_is_normal_form (value))
+     return g_variant_ref (value);
+
+-  trusted =3D g_variant_deep_copy (value);
++  trusted =3D g_variant_deep_copy (value, FALSE);
+   g_assert (g_variant_is_trusted (trusted));
+
+   return g_variant_ref_sink (trusted);
+@@ -5967,6 +6003,11 @@ g_variant_get_normal_form (GVariant *value)
+  * contain multi-byte numeric data.  That include strings, booleans,
+  * bytes and containers containing only these things (recursively).
+  *
++ * While this function can safely handle untrusted, non-normal data, it=
 is
++ * recommended to check whether the input is in normal form beforehand,=
 using
++ * g_variant_is_normal_form(), and to reject non-normal inputs if your
++ * application can be strict about what inputs it rejects.
++ *
+  * The returned value is always in normal form and is marked as trusted.
+  *
+  * Returns: (transfer full): the byteswapped form of @value
+@@ -5984,22 +6025,21 @@ g_variant_byteswap (GVariant *value)
+
+   g_variant_type_info_query (type_info, &alignment, NULL);
+
+-  if (alignment)
+-    /* (potentially) contains multi-byte numeric data */
++  if (alignment && g_variant_is_normal_form (value))
+     {
++      /* (potentially) contains multi-byte numeric data, but is also al=
ready in
++       * normal form so we can use a faster byteswapping codepath on th=
e
++       * serialised data */
+       GVariantSerialised serialised =3D { 0, };
+-      GVariant *trusted;
+       GBytes *bytes;
+
+-      trusted =3D g_variant_get_normal_form (value);
+-      serialised.type_info =3D g_variant_get_type_info (trusted);
+-      serialised.size =3D g_variant_get_size (trusted);
++      serialised.type_info =3D g_variant_get_type_info (value);
++      serialised.size =3D g_variant_get_size (value);
+       serialised.data =3D g_malloc (serialised.size);
+-      serialised.depth =3D g_variant_get_depth (trusted);
++      serialised.depth =3D g_variant_get_depth (value);
+       serialised.ordered_offsets_up_to =3D G_MAXSIZE;  /* operating on =
the normal form */
+       serialised.checked_offsets_up_to =3D G_MAXSIZE;
+-      g_variant_store (trusted, serialised.data);
+-      g_variant_unref (trusted);
++      g_variant_store (value, serialised.data);
+
+       g_variant_serialised_byteswap (serialised);
+
+@@ -6007,6 +6047,9 @@ g_variant_byteswap (GVariant *value)
+       new =3D g_variant_ref_sink (g_variant_new_from_bytes (g_variant_g=
et_type (value), bytes, TRUE));
+       g_bytes_unref (bytes);
+     }
++  else if (alignment)
++    /* (potentially) contains multi-byte numeric data */
++    new =3D g_variant_ref_sink (g_variant_deep_copy (value, TRUE));
+   else
+     /* contains no multi-byte data */
+     new =3D g_variant_get_normal_form (value);
+diff --git a/glib/tests/gvariant.c b/glib/tests/gvariant.c
+index 36c86c2..43091f2 100644
+--- a/glib/tests/gvariant.c
++++ b/glib/tests/gvariant.c
+@@ -2280,24 +2280,67 @@ serialise_tree (TreeInstance       *tree,
+ static void
+ test_byteswap (void)
+ {
+-  GVariantSerialised one =3D { 0, }, two =3D { 0, };
++  GVariantSerialised one =3D { 0, }, two =3D { 0, }, three =3D { 0, };
+   TreeInstance *tree;
+-
++  GVariant *one_variant =3D NULL;
++  GVariant *two_variant =3D NULL;
++  GVariant *two_byteswapped =3D NULL;
++  GVariant *three_variant =3D NULL;
++  GVariant *three_byteswapped =3D NULL;
++  guint8 *three_data_copy =3D NULL;
++  gsize three_size_copy =3D 0;
++
++  /* Write a tree out twice, once normally and once byteswapped. */
+   tree =3D tree_instance_new (NULL, 3);
+   serialise_tree (tree, &one);
+
++  one_variant =3D g_variant_new_from_data (G_VARIANT_TYPE (g_variant_ty=
pe_info_get_type_string (one.type_info)),
++                                         one.data, one.size, FALSE, NUL=
L, NULL);
++
+   i_am_writing_byteswapped =3D TRUE;
+   serialise_tree (tree, &two);
++  serialise_tree (tree, &three);
+   i_am_writing_byteswapped =3D FALSE;
+
+-  g_variant_serialised_byteswap (two);
+-
+-  g_assert_cmpmem (one.data, one.size, two.data, two.size);
+-  g_assert_cmpuint (one.depth, =3D=3D, two.depth);
+-
++  /* Swap the first byteswapped one back using the function we want to =
test. */
++  two_variant =3D g_variant_new_from_data (G_VARIANT_TYPE (g_variant_ty=
pe_info_get_type_string (two.type_info)),
++                                         two.data, two.size, FALSE, NUL=
L, NULL);
++  two_byteswapped =3D g_variant_byteswap (two_variant);
++
++  /* Make the second byteswapped one non-normal (hopefully), and then b=
yteswap
++   * it back using the function we want to test in its non-normal mode.
++   * This might not work because it=E2=80=99s not necessarily possible =
to make an
++   * arbitrary random variant non-normal. Adding a single zero byte to =
the end
++   * often makes something non-normal but still readable. */
++  three_size_copy =3D three.size + 1;
++  three_data_copy =3D g_malloc (three_size_copy);
++  memcpy (three_data_copy, three.data, three.size);
++  three_data_copy[three.size] =3D '\0';
++
++  three_variant =3D g_variant_new_from_data (G_VARIANT_TYPE (g_variant_=
type_info_get_type_string (three.type_info)),
++                                           three_data_copy, three_size_=
copy, FALSE, NULL, NULL);
++  three_byteswapped =3D g_variant_byteswap (three_variant);
++
++  /* Check they=E2=80=99re the same. We can always compare @one_variant=
 and
++   * @two_byteswapped. We can only compare @two_byteswapped and
++   * @three_byteswapped if @two_variant and @three_variant are equal: i=
n that
++   * case, the corruption to @three_variant was enough to make it non-n=
ormal but
++   * not enough to change its value. */
++  g_assert_cmpvariant (one_variant, two_byteswapped);
++
++  if (g_variant_equal (two_variant, three_variant))
++    g_assert_cmpvariant (two_byteswapped, three_byteswapped);
++
++  g_variant_unref (three_byteswapped);
++  g_variant_unref (three_variant);
++  g_variant_unref (two_byteswapped);
++  g_variant_unref (two_variant);
++  g_variant_unref (one_variant);
+   tree_instance_free (tree);
+   g_free (one.data);
+   g_free (two.data);
++  g_free (three.data);
++  g_free (three_data_copy);
+ }
+
+ static void
+--
+2.40.0
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb b/meta/recipes=
-core/glib-2.0/glib-2.0_2.72.3.bb
index b04b5f0a44..3545e6675a 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
@@ -26,6 +26,9 @@ SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV=
}.tar.xz \
            file://CVE-2023-32665-0007.patch \
            file://CVE-2023-32665-0008.patch \
            file://CVE-2023-32665-0009.patch \
+           file://CVE-2023-29499.patch \
+           file://CVE-2023-32611-0001.patch \
+           file://CVE-2023-32611-0002.patch \
            "
 SRC_URI:append:class-native =3D " file://relocate-modules.patch"
=20
--=20
2.40.0


