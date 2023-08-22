Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A895AEE49A3
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 10:00:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4720.1692698453504678878
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Aug 2023 03:00:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=DE9GpGEl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7598561214=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37M9Bn63025209
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 10:00:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding; s=PPS06212021; bh=cPBbwXG+AcYO2PIx3A
	eBJkVc1lLKhNEIGVxawWTSJ4Y=; b=DE9GpGElBUIdNQveoTWgKkHqGSdtH4/pLU
	r0U5NCJQKIorCMLQkaBpTiUmxgWlenoUZj2p1e1283AV3YYcWkIZPkXFd2GytMYS
	oIqOnEHDPo30LhmErr1k3m80R9TD+rWpOZyJCQ9xjP3yLlkJaWwt2RHNOyv4U2o5
	Nky+XCnFfKh+WSIIgqczEJp/0B8gu5RtI0PfDBoA2Y2JO1iRLJFbfD4qQzjEGusO
	iuQQjQJPz7Aw1kbIq+7GFRqoJ18b1UQFHRkoCVLIpRpUg2lv17/3zm6Wyc+MwgLM
	pBCi0iShM+KTjeg9pyml6fnPGO6DW7fIJz8gD6h3rXz/l3JqPjFQ==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sjjxw2gea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 10:00:51 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 22 Aug 2023 03:00:47 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 1/1] glib-2.0: Fix CVE-2023-32665
Date: Tue, 22 Aug 2023 10:00:31 +0000
Message-ID: <20230822100031.1091125-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: MSNSJJMHh-XwWhv1vZTwJLAtEQ1iKCzL
X-Proofpoint-GUID: MSNSJJMHh-XwWhv1vZTwJLAtEQ1iKCzL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-22_10,2023-08-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 clxscore=1011 priorityscore=1501
 impostorscore=0 mlxscore=0 suspectscore=0 bulkscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2308220075
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 37M9Bn63025209
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 10:00:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186499

From: Soumya Sambu <soumya.sambu@windriver.com>

GVariant deserialisation does not match spec for non-normal data

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../glib-2.0/CVE-2023-32665-0001.patch        | 104 +++++
 .../glib-2.0/CVE-2023-32665-0002.patch        | 211 +++++++++
 .../glib-2.0/CVE-2023-32665-0003.patch        | 418 ++++++++++++++++++
 .../glib-2.0/CVE-2023-32665-0004.patch        | 114 +++++
 .../glib-2.0/CVE-2023-32665-0005.patch        |  81 ++++
 .../glib-2.0/CVE-2023-32665-0006.patch        | 397 +++++++++++++++++
 .../glib-2.0/CVE-2023-32665-0007.patch        |  50 +++
 .../glib-2.0/CVE-2023-32665-0008.patch        | 395 +++++++++++++++++
 .../glib-2.0/CVE-2023-32665-0009.patch        |  98 ++++
 meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |   9 +
 10 files changed, 1877 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-00=
01.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-00=
02.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-00=
03.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-00=
04.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-00=
05.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-00=
06.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-00=
07.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-00=
08.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-00=
09.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0001.patc=
h b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0001.patch
new file mode 100644
index 0000000000..2b7536c42d
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0001.patch
@@ -0,0 +1,104 @@
+From 1deacdd4e8e35a5cf1417918ca4f6b0afa6409b1 Mon Sep 17 00:00:00 2001
+From: William Manley <will@stb-tester.com>
+Date: Wed, 9 Aug 2023 10:04:49 +0000
+Subject: [PATCH] gvariant-core: Consolidate construction of
+ `GVariantSerialised`
+
+So I only need to change it in one place.
+
+This introduces no functional changes.
+
+Helps: #2121
+
+CVE: CVE-2023-32665
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/=
1deacdd4e8e35a5cf1417918ca4f6b0afa6409b1]
+
+Signed-off-by: Soumya <soumya.sambu@windriver.com>
+---
+ glib/gvariant-core.c | 49 ++++++++++++++++++++++----------------------
+ 1 file changed, 25 insertions(+), 24 deletions(-)
+
+diff --git a/glib/gvariant-core.c b/glib/gvariant-core.c
+index a31d396..496f2e2 100644
+--- a/glib/gvariant-core.c
++++ b/glib/gvariant-core.c
+@@ -349,6 +349,27 @@ g_variant_ensure_size (GVariant *value)
+     }
+ }
+
++/* < private >
++ * g_variant_to_serialised:
++ * @value: a #GVariant
++ *
++ * Gets a GVariantSerialised for a GVariant in state STATE_SERIALISED.
++ */
++inline static GVariantSerialised
++g_variant_to_serialised (GVariant *value)
++{
++  g_assert (value->state & STATE_SERIALISED);
++  {
++    GVariantSerialised serialised =3D {
++      value->type_info,
++      (gpointer) value->contents.serialised.data,
++      value->size,
++      value->depth,
++    };
++    return serialised;
++  }
++}
++
+ /* < private >
+  * g_variant_serialise:
+  * @value: a #GVariant
+@@ -1007,16 +1028,8 @@ g_variant_n_children (GVariant *value)
+   g_variant_lock (value);
+
+   if (value->state & STATE_SERIALISED)
+-    {
+-      GVariantSerialised serialised =3D {
+-        value->type_info,
+-        (gpointer) value->contents.serialised.data,
+-        value->size,
+-        value->depth,
+-      };
+-
+-      n_children =3D g_variant_serialised_n_children (serialised);
+-    }
++    n_children =3D g_variant_serialised_n_children (
++        g_variant_to_serialised (value));
+   else
+     n_children =3D value->contents.tree.n_children;
+
+@@ -1083,12 +1096,7 @@ g_variant_get_child_value (GVariant *value,
+     }
+
+   {
+-    GVariantSerialised serialised =3D {
+-      value->type_info,
+-      (gpointer) value->contents.serialised.data,
+-      value->size,
+-      value->depth,
+-    };
++    GVariantSerialised serialised =3D g_variant_to_serialised (value);
+     GVariantSerialised s_child;
+     GVariant *child;
+
+@@ -1201,14 +1209,7 @@ g_variant_is_normal_form (GVariant *value)
+
+   if (value->state & STATE_SERIALISED)
+     {
+-      GVariantSerialised serialised =3D {
+-        value->type_info,
+-        (gpointer) value->contents.serialised.data,
+-        value->size,
+-        value->depth
+-      };
+-
+-      if (g_variant_serialised_is_normal (serialised))
++      if (g_variant_serialised_is_normal (g_variant_to_serialised (valu=
e)))
+         value->state |=3D STATE_TRUSTED;
+     }
+   else
+--
+2.40.0
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0002.patc=
h b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0002.patch
new file mode 100644
index 0000000000..4eff85a5f3
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0002.patch
@@ -0,0 +1,211 @@
+From 446e69f5edd72deb2196dee36bbaf8056caf6948 Mon Sep 17 00:00:00 2001
+From: William Manley <will@stb-tester.com>
+Date: Wed, 9 Aug 2023 10:39:34 +0000
+Subject: [PATCH] gvariant-serialiser: Factor out functions for dealing w=
ith
+ framing offsets
+
+This introduces no functional changes.
+
+Helps: #2121
+
+CVE: CVE-2023-32665
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/=
446e69f5edd72deb2196dee36bbaf8056caf6948]
+
+Signed-off-by: Soumya <soumya.sambu@windriver.com>
+---
+ glib/gvariant-serialiser.c | 108 +++++++++++++++++++------------------
+ 1 file changed, 57 insertions(+), 51 deletions(-)
+
+diff --git a/glib/gvariant-serialiser.c b/glib/gvariant-serialiser.c
+index 7b13381..e71248e 100644
+--- a/glib/gvariant-serialiser.c
++++ b/glib/gvariant-serialiser.c
+@@ -633,30 +633,62 @@ gvs_calculate_total_size (gsize body_size,
+   return body_size + 8 * offsets;
+ }
+
++struct Offsets
++{
++  gsize     data_size;
++
++  guchar   *array;
++  gsize     length;
++  guint     offset_size;
++
++  gboolean  is_normal;
++};
++
+ static gsize
+-gvs_variable_sized_array_n_children (GVariantSerialised value)
++gvs_offsets_get_offset_n (struct Offsets *offsets,
++                          gsize           n)
++{
++  return gvs_read_unaligned_le (
++      offsets->array + (offsets->offset_size * n), offsets->offset_size=
);
++}
++
++static struct Offsets
++gvs_variable_sized_array_get_frame_offsets (GVariantSerialised value)
+ {
++  struct Offsets out =3D { 0, };
+   gsize offsets_array_size;
+-  gsize offset_size;
+   gsize last_end;
+
+   if (value.size =3D=3D 0)
+-    return 0;
+-
+-  offset_size =3D gvs_get_offset_size (value.size);
++    {
++      out.is_normal =3D TRUE;
++      return out;
++    }
+
+-  last_end =3D gvs_read_unaligned_le (value.data + value.size -
+-                                    offset_size, offset_size);
++  out.offset_size =3D gvs_get_offset_size (value.size);
++  last_end =3D gvs_read_unaligned_le (value.data + value.size - out.off=
set_size,
++                                    out.offset_size);
+
+   if (last_end > value.size)
+-    return 0;
++    return out;  /* offsets not normal */
+
+   offsets_array_size =3D value.size - last_end;
+
+-  if (offsets_array_size % offset_size)
+-    return 0;
++  if (offsets_array_size % out.offset_size)
++    return out;  /* offsets not normal */
++
++  out.data_size =3D last_end;
++  out.array =3D value.data + last_end;
++  out.length =3D offsets_array_size / out.offset_size;
++  out.is_normal =3D TRUE;
+
+-  return offsets_array_size / offset_size;
++  return out;
++}
++
++static gsize
++gvs_variable_sized_array_n_children (GVariantSerialised value)
++{
++  return gvs_variable_sized_array_get_frame_offsets (value).length;
+ }
+
+ static GVariantSerialised
+@@ -664,8 +696,9 @@ gvs_variable_sized_array_get_child (GVariantSerialis=
ed value,
+                                     gsize              index_)
+ {
+   GVariantSerialised child =3D { 0, };
+-  gsize offset_size;
+-  gsize last_end;
++
++  struct Offsets offsets =3D gvs_variable_sized_array_get_frame_offsets=
 (value);
++
+   gsize start;
+   gsize end;
+
+@@ -673,18 +706,11 @@ gvs_variable_sized_array_get_child (GVariantSerial=
ised value,
+   g_variant_type_info_ref (child.type_info);
+   child.depth =3D value.depth + 1;
+
+-  offset_size =3D gvs_get_offset_size (value.size);
+-
+-  last_end =3D gvs_read_unaligned_le (value.data + value.size -
+-                                    offset_size, offset_size);
+-
+   if (index_ > 0)
+     {
+       guint alignment;
+
+-      start =3D gvs_read_unaligned_le (value.data + last_end +
+-                                     (offset_size * (index_ - 1)),
+-                                     offset_size);
++      start =3D gvs_offsets_get_offset_n (&offsets, index_ - 1);
+
+       g_variant_type_info_query (child.type_info, &alignment, NULL);
+       start +=3D (-start) & alignment;
+@@ -692,11 +718,9 @@ gvs_variable_sized_array_get_child (GVariantSeriali=
sed value,
+   else
+     start =3D 0;
+
+-  end =3D gvs_read_unaligned_le (value.data + last_end +
+-                               (offset_size * index_),
+-                               offset_size);
++  end =3D gvs_offsets_get_offset_n (&offsets, index_);
+
+-  if (start < end && end <=3D value.size && end <=3D last_end)
++  if (start < end && end <=3D value.size && end <=3D offsets.data_size)
+     {
+       child.data =3D value.data + start;
+       child.size =3D end - start;
+@@ -768,34 +792,16 @@ static gboolean
+ gvs_variable_sized_array_is_normal (GVariantSerialised value)
+ {
+   GVariantSerialised child =3D { 0, };
+-  gsize offsets_array_size;
+-  guchar *offsets_array;
+-  guint offset_size;
+   guint alignment;
+-  gsize last_end;
+-  gsize length;
+   gsize offset;
+   gsize i;
+
+-  if (value.size =3D=3D 0)
+-    return TRUE;
+-
+-  offset_size =3D gvs_get_offset_size (value.size);
+-  last_end =3D gvs_read_unaligned_le (value.data + value.size -
+-                                    offset_size, offset_size);
++  struct Offsets offsets =3D gvs_variable_sized_array_get_frame_offsets=
 (value);
+
+-  if (last_end > value.size)
++  if (!offsets.is_normal)
+     return FALSE;
+
+-  offsets_array_size =3D value.size - last_end;
+-
+-  if (offsets_array_size % offset_size)
+-    return FALSE;
+-
+-  offsets_array =3D value.data + value.size - offsets_array_size;
+-  length =3D offsets_array_size / offset_size;
+-
+-  if (length =3D=3D 0)
++  if (value.size !=3D 0 && offsets.length =3D=3D 0)
+     return FALSE;
+
+   child.type_info =3D g_variant_type_info_element (value.type_info);
+@@ -803,14 +809,14 @@ gvs_variable_sized_array_is_normal (GVariantSerial=
ised value)
+   child.depth =3D value.depth + 1;
+   offset =3D 0;
+
+-  for (i =3D 0; i < length; i++)
++  for (i =3D 0; i < offsets.length; i++)
+     {
+       gsize this_end;
+
+-      this_end =3D gvs_read_unaligned_le (offsets_array + offset_size *=
 i,
+-                                        offset_size);
++      this_end =3D gvs_read_unaligned_le (offsets.array + offsets.offse=
t_size * i,
++                                        offsets.offset_size);
+
+-      if (this_end < offset || this_end > last_end)
++      if (this_end < offset || this_end > offsets.data_size)
+         return FALSE;
+
+       while (offset & alignment)
+@@ -832,7 +838,7 @@ gvs_variable_sized_array_is_normal (GVariantSerialis=
ed value)
+       offset =3D this_end;
+     }
+
+-  g_assert (offset =3D=3D last_end);
++  g_assert (offset =3D=3D offsets.data_size);
+
+   return TRUE;
+ }
+--
+2.40.0
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0003.patc=
h b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0003.patch
new file mode 100644
index 0000000000..183c6b20e7
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0003.patch
@@ -0,0 +1,418 @@
+From ade71fb544391b2e33e1859645726bfee0d5eaaf Mon Sep 17 00:00:00 2001
+From: William Manley <will@stb-tester.com>
+Date: Wed, 16 Aug 2023 03:12:21 +0000
+Subject: [PATCH] gvariant: Don't allow child elements to overlap with ea=
ch
+ other
+
+If different elements of a variable sized array can overlap with each
+other then we can cause a `GVariant` to normalise to a much larger type.
+
+This commit changes the behaviour of `GVariant` with non-normal form dat=
a. If
+an invalid frame offset is found all subsequent elements are given their
+default value.
+
+When retrieving an element at index `n` we scan the frame offsets up to =
index
+`n` and if they are not in order we return an element with the default v=
alue
+for that type.  This guarantees that elements don't overlap with each
+other.  We remember the offset we've scanned up to so we don't need to
+repeat this work on subsequent accesses.  We skip these checks for trust=
ed
+data.
+
+Unfortunately this makes random access of untrusted data O(n) =E2=80=94 =
at least
+on first access.  It doesn't affect the algorithmic complexity of access=
ing
+elements in order, such as when using the `GVariantIter` interface.  Als=
o:
+the cost of validation will be amortised as the `GVariant` instance is
+continued to be used.
+
+I've implemented this with 4 different functions, 1 for each element siz=
e,
+rather than looping calling `gvs_read_unaligned_le` in the hope that the
+compiler will find it easy to optimise and should produce fairly tight
+code.
+
+Fixes: #2121
+
+CVE: CVE-2023-32665
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/=
ade71fb544391b2e33e1859645726bfee0d5eaaf]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ glib/gvariant-core.c       | 35 ++++++++++++++++
+ glib/gvariant-serialiser.c | 86 ++++++++++++++++++++++++++++++++++++--
+ glib/gvariant-serialiser.h |  8 ++++
+ glib/tests/gvariant.c      | 45 ++++++++++++++++++++
+ 4 files changed, 171 insertions(+), 3 deletions(-)
+
+diff --git a/glib/gvariant-core.c b/glib/gvariant-core.c
+index 496f2e2..4e0b2b5 100644
+--- a/glib/gvariant-core.c
++++ b/glib/gvariant-core.c
+@@ -65,6 +65,7 @@ struct _GVariant
+     {
+       GBytes *bytes;
+       gconstpointer data;
++      gsize ordered_offsets_up_to;
+     } serialised;
+
+     struct
+@@ -162,6 +163,24 @@ struct _GVariant
+  *                if .data pointed to the appropriate number of nul
+  *                bytes.
+  *
++ *     .ordered_offsets_up_to: If ordered_offsets_up_to =3D=3D n this m=
eans that all
++ *                             the frame offsets up to and including th=
e frame
++ *                             offset determining the end of element n =
are in
++ *                             order. This guarantees that the bytes of=
 element
++ *                             n don't overlap with any previous elemen=
t.
++ *
++ *                             For trusted data this is set to G_MAXSIZ=
E and we
++ *                             don't check that the frame offsets are i=
n order.
++ *
++ *                             Note: This doesn't imply the offsets are=
 good in
++ *                             any way apart from their ordering.  In p=
articular
++ *                             offsets may be out of bounds for this va=
lue or
++ *                             may imply that the data overlaps the fra=
me
++ *                             offsets themselves.
++ *
++ *                             This field is only relevant for arrays o=
f non
++ *                             fixed width types.
++ *
+  *   .tree: Only valid when the instance is in tree form.
+  *
+  *          Note that accesses from other threads could result in
+@@ -365,6 +384,7 @@ g_variant_to_serialised (GVariant *value)
+       (gpointer) value->contents.serialised.data,
+       value->size,
+       value->depth,
++      value->contents.serialised.ordered_offsets_up_to,
+     };
+     return serialised;
+   }
+@@ -396,6 +416,7 @@ g_variant_serialise (GVariant *value,
+   serialised.size =3D value->size;
+   serialised.data =3D data;
+   serialised.depth =3D value->depth;
++  serialised.ordered_offsets_up_to =3D 0;
+
+   children =3D (gpointer *) value->contents.tree.children;
+   n_children =3D value->contents.tree.n_children;
+@@ -439,6 +460,15 @@ g_variant_fill_gvs (GVariantSerialised *serialised,
+   g_assert (serialised->size =3D=3D value->size);
+   serialised->depth =3D value->depth;
+
++  if (value->state & STATE_SERIALISED)
++    {
++      serialised->ordered_offsets_up_to =3D value->contents.serialised.=
ordered_offsets_up_to;
++    }
++  else
++    {
++      serialised->ordered_offsets_up_to =3D 0;
++    }
++
+   if (serialised->data)
+     /* g_variant_store() is a public API, so it
+      * it will reacquire the lock if it needs to.
+@@ -481,6 +511,7 @@ g_variant_ensure_serialised (GVariant *value)
+       bytes =3D g_bytes_new_take (data, value->size);
+       value->contents.serialised.data =3D g_bytes_get_data (bytes, NULL=
);
+       value->contents.serialised.bytes =3D bytes;
++      value->contents.serialised.ordered_offsets_up_to =3D G_MAXSIZE;
+       value->state |=3D STATE_SERIALISED;
+     }
+ }
+@@ -561,6 +592,7 @@ g_variant_new_from_bytes (const GVariantType *type,
+   serialised.type_info =3D value->type_info;
+   serialised.data =3D (guchar *) g_bytes_get_data (bytes, &serialised.s=
ize);
+   serialised.depth =3D 0;
++  serialised.ordered_offsets_up_to =3D trusted ? G_MAXSIZE : 0;
+
+   if (!g_variant_serialised_check (serialised))
+     {
+@@ -611,6 +643,8 @@ g_variant_new_from_bytes (const GVariantType *type,
+       value->contents.serialised.data =3D g_bytes_get_data (bytes, &val=
ue->size);
+     }
+
++  value->contents.serialised.ordered_offsets_up_to =3D trusted ? G_MAXS=
IZE : 0;
++
+   g_clear_pointer (&owned_bytes, g_bytes_unref);
+
+   return value;
+@@ -1130,6 +1164,7 @@ g_variant_get_child_value (GVariant *value,
+     child->contents.serialised.bytes =3D
+       g_bytes_ref (value->contents.serialised.bytes);
+     child->contents.serialised.data =3D s_child.data;
++    child->contents.serialised.ordered_offsets_up_to =3D s_child.ordere=
d_offsets_up_to;
+
+     return child;
+   }
+diff --git a/glib/gvariant-serialiser.c b/glib/gvariant-serialiser.c
+index e71248e..6fb3f2f 100644
+--- a/glib/gvariant-serialiser.c
++++ b/glib/gvariant-serialiser.c
+@@ -1,6 +1,7 @@
+ /*
+  * Copyright =C2=A9 2007, 2008 Ryan Lortie
+  * Copyright =C2=A9 2010 Codethink Limited
++ * Copyright =C2=A9 2020 William Manley
+  *
+  * This library is free software; you can redistribute it and/or
+  * modify it under the terms of the GNU Lesser General Public
+@@ -264,6 +265,7 @@ gvs_fixed_sized_maybe_get_child (GVariantSerialised =
value,
+   value.type_info =3D g_variant_type_info_element (value.type_info);
+   g_variant_type_info_ref (value.type_info);
+   value.depth++;
++  value.ordered_offsets_up_to =3D 0;
+
+   return value;
+ }
+@@ -295,7 +297,7 @@ gvs_fixed_sized_maybe_serialise (GVariantSerialised =
       value,
+ {
+   if (n_children)
+     {
+-      GVariantSerialised child =3D { NULL, value.data, value.size, valu=
e.depth + 1 };
++      GVariantSerialised child =3D { NULL, value.data, value.size, valu=
e.depth + 1, 0 };
+
+       gvs_filler (&child, children[0]);
+     }
+@@ -317,6 +319,7 @@ gvs_fixed_sized_maybe_is_normal (GVariantSerialised =
value)
+       /* proper element size: "Just".  recurse to the child. */
+       value.type_info =3D g_variant_type_info_element (value.type_info)=
;
+       value.depth++;
++      value.ordered_offsets_up_to =3D 0;
+
+       return g_variant_serialised_is_normal (value);
+     }
+@@ -358,6 +361,7 @@ gvs_variable_sized_maybe_get_child (GVariantSerialis=
ed value,
+     value.data =3D NULL;
+
+   value.depth++;
++  value.ordered_offsets_up_to =3D 0;
+
+   return value;
+ }
+@@ -388,7 +392,7 @@ gvs_variable_sized_maybe_serialise (GVariantSerialis=
ed        value,
+ {
+   if (n_children)
+     {
+-      GVariantSerialised child =3D { NULL, value.data, value.size - 1, =
value.depth + 1 };
++      GVariantSerialised child =3D { NULL, value.data, value.size - 1, =
value.depth + 1, 0 };
+
+       /* write the data for the child.  */
+       gvs_filler (&child, children[0]);
+@@ -408,6 +412,7 @@ gvs_variable_sized_maybe_is_normal (GVariantSerialis=
ed value)
+   value.type_info =3D g_variant_type_info_element (value.type_info);
+   value.size--;
+   value.depth++;
++  value.ordered_offsets_up_to =3D 0;
+
+   return g_variant_serialised_is_normal (value);
+ }
+@@ -691,6 +696,32 @@ gvs_variable_sized_array_n_children (GVariantSerial=
ised value)
+   return gvs_variable_sized_array_get_frame_offsets (value).length;
+ }
+
++/* Find the index of the first out-of-order element in @data, assuming =
that
++ * @data is an array of elements of given @type, starting at index @sta=
rt and
++ * containing a further @len-@start elements. */
++#define DEFINE_FIND_UNORDERED(type) \
++  static gsize \
++  find_unordered_##type (const guint8 *data, gsize start, gsize len) \
++  { \
++    gsize off; \
++    type current, previous; \
++    \
++    memcpy (&previous, data + start * sizeof (current), sizeof (current=
)); \
++    for (off =3D (start + 1) * sizeof (current); off < len * sizeof (cu=
rrent); off +=3D sizeof (current)) \
++      { \
++        memcpy (&current, data + off, sizeof (current)); \
++        if (current < previous) \
++          break; \
++        previous =3D current; \
++      } \
++    return off / sizeof (current) - 1; \
++  }
++
++DEFINE_FIND_UNORDERED (guint8);
++DEFINE_FIND_UNORDERED (guint16);
++DEFINE_FIND_UNORDERED (guint32);
++DEFINE_FIND_UNORDERED (guint64);
++
+ static GVariantSerialised
+ gvs_variable_sized_array_get_child (GVariantSerialised value,
+                                     gsize              index_)
+@@ -706,6 +737,49 @@ gvs_variable_sized_array_get_child (GVariantSeriali=
sed value,
+   g_variant_type_info_ref (child.type_info);
+   child.depth =3D value.depth + 1;
+
++  /* If the requested @index_ is beyond the set of indices whose framin=
g offsets
++   * have been checked, check the remaining offsets to see whether they=
=E2=80=99re
++   * normal (in order, no overlapping array elements). */
++  if (index_ > value.ordered_offsets_up_to)
++    {
++      switch (offsets.offset_size)
++        {
++        case 1:
++          {
++            value.ordered_offsets_up_to =3D find_unordered_guint8 (
++                offsets.array, value.ordered_offsets_up_to, index_ + 1)=
;
++            break;
++          }
++        case 2:
++          {
++            value.ordered_offsets_up_to =3D find_unordered_guint16 (
++                offsets.array, value.ordered_offsets_up_to, index_ + 1)=
;
++            break;
++          }
++        case 4:
++          {
++            value.ordered_offsets_up_to =3D find_unordered_guint32 (
++                offsets.array, value.ordered_offsets_up_to, index_ + 1)=
;
++            break;
++          }
++        case 8:
++          {
++            value.ordered_offsets_up_to =3D find_unordered_guint64 (
++                offsets.array, value.ordered_offsets_up_to, index_ + 1)=
;
++            break;
++          }
++        default:
++          /* gvs_get_offset_size() only returns maximum 8 */
++          g_assert_not_reached ();
++        }
++    }
++
++  if (index_ > value.ordered_offsets_up_to)
++    {
++      /* Offsets are invalid somewhere, so return an empty child. */
++      return child;
++    }
++
+   if (index_ > 0)
+     {
+       guint alignment;
+@@ -840,6 +914,9 @@ gvs_variable_sized_array_is_normal (GVariantSerialis=
ed value)
+
+   g_assert (offset =3D=3D offsets.data_size);
+
++  /* All offsets have now been checked. */
++  value.ordered_offsets_up_to =3D G_MAXSIZE;
++
+   return TRUE;
+ }
+
+@@ -1072,7 +1149,7 @@ gvs_tuple_is_normal (GVariantSerialised value)
+   for (i =3D 0; i < length; i++)
+     {
+       const GVariantMemberInfo *member_info;
+-      GVariantSerialised child;
++      GVariantSerialised child =3D { 0, };
+       gsize fixed_size;
+       guint alignment;
+       gsize end;
+@@ -1132,6 +1209,9 @@ gvs_tuple_is_normal (GVariantSerialised value)
+       offset =3D end;
+     }
+
++  /* All element bounds have been checked above. */
++  value.ordered_offsets_up_to =3D G_MAXSIZE;
++
+   {
+     gsize fixed_size;
+     guint alignment;
+diff --git a/glib/gvariant-serialiser.h b/glib/gvariant-serialiser.h
+index 859cb7b..3ab83b3 100644
+--- a/glib/gvariant-serialiser.h
++++ b/glib/gvariant-serialiser.h
+@@ -29,6 +29,14 @@ typedef struct
+   guchar           *data;
+   gsize             size;
+   gsize             depth;  /* same semantics as GVariant.depth */
++  /* If ordered_offsets_up_to =3D=3D n this means that all the frame of=
fsets up to and
++   * including the frame offset determining the end of element n are in=
 order.
++   * This guarantees that the bytes of element n don't overlap with any=
 previous
++   * element.
++   *
++   * This is both read and set by g_variant_serialised_get_child for ar=
rays of
++   * non-fixed-width types */
++  gsize             ordered_offsets_up_to;
+ } GVariantSerialised;
+
+ /* deserialization */
+diff --git a/glib/tests/gvariant.c b/glib/tests/gvariant.c
+index 0110f26..291f796 100644
+--- a/glib/tests/gvariant.c
++++ b/glib/tests/gvariant.c
+@@ -1,5 +1,6 @@
+ /*
+  * Copyright =C2=A9 2010 Codethink Limited
++ * Copyright =C2=A9 2020 William Manley
+  *
+  * This library is free software; you can redistribute it and/or
+  * modify it under the terms of the GNU Lesser General Public
+@@ -1279,6 +1280,7 @@ random_instance_filler (GVariantSerialised *serial=
ised,
+     serialised->size =3D instance->size;
+
+   serialised->depth =3D 0;
++  serialised->ordered_offsets_up_to =3D 0;
+
+   g_assert_true (serialised->type_info =3D=3D instance->type_info);
+   g_assert_cmpuint (serialised->size, =3D=3D, instance->size);
+@@ -5023,6 +5025,47 @@ test_normal_checking_array_offsets (void)
+   g_variant_unref (variant);
+ }
+
++/* This is a regression test that we can't have non-normal values that =
take up
++ * significantly more space than the normal equivalent, by specifying t=
he
++ * offset table entries so that array elements overlap.
++ *
++ * See https://gitlab.gnome.org/GNOME/glib/-/issues/2121#note_832242 */
++static void
++test_normal_checking_array_offsets2 (void)
++{
++  const guint8 data[] =3D {
++    'h', 'i', '\0',
++    0x03, 0x00, 0x03,
++    0x06, 0x00, 0x06,
++    0x09, 0x00, 0x09,
++    0x0c, 0x00, 0x0c,
++    0x0f, 0x00, 0x0f,
++    0x12, 0x00, 0x12,
++    0x15, 0x00, 0x15,
++  };
++  gsize size =3D sizeof (data);
++  const GVariantType *aaaaaaas =3D G_VARIANT_TYPE ("aaaaaaas");
++  GVariant *variant =3D NULL;
++  GVariant *normal_variant =3D NULL;
++  GVariant *expected =3D NULL;
++
++  variant =3D g_variant_new_from_data (aaaaaaas, data, size, FALSE, NUL=
L, NULL);
++  g_assert_nonnull (variant);
++
++  normal_variant =3D g_variant_get_normal_form (variant);
++  g_assert_nonnull (normal_variant);
++  g_assert_cmpuint (g_variant_get_size (normal_variant), <=3D, size * 2=
);
++
++  expected =3D g_variant_new_parsed (
++      "[[[[[[['hi', '', ''], [], []], [], []], [], []], [], []], [], []=
], [], []]");
++  g_assert_cmpvariant (expected, variant);
++  g_assert_cmpvariant (expected, normal_variant);
++
++  g_variant_unref (expected);
++  g_variant_unref (normal_variant);
++  g_variant_unref (variant);
++}
++
+ /* Test that a tuple with invalidly large values in its offset table is
+  * normalised successfully without looping infinitely. */
+ static void
+@@ -5189,6 +5232,8 @@ main (int argc, char **argv)
+                    test_normal_checking_tuples);
+   g_test_add_func ("/gvariant/normal-checking/array-offsets",
+                    test_normal_checking_array_offsets);
++  g_test_add_func ("/gvariant/normal-checking/array-offsets2",
++                   test_normal_checking_array_offsets2);
+   g_test_add_func ("/gvariant/normal-checking/tuple-offsets",
+                    test_normal_checking_tuple_offsets);
+   g_test_add_func ("/gvariant/normal-checking/empty-object-path",
+--
+2.40.0
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0004.patc=
h b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0004.patch
new file mode 100644
index 0000000000..791efdee87
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0004.patch
@@ -0,0 +1,114 @@
+From 345cae9c1aa7bf6752039225ef4c8d8d69fa8d76 Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@endlessos.org>
+Date: Fri, 11 Aug 2023 04:09:12 +0000
+Subject: [PATCH] gvariant-serialiser: Factor out code to get bounds of a=
 tuple
+ member
+
+This introduces no functional changes.
+
+Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
+
+Helps: #2121
+
+CVE: CVE-2023-32665
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/=
345cae9c1aa7bf6752039225ef4c8d8d69fa8d76]
+
+Signed-off-by: Soumya <soumya.sambu@windriver.com>
+---
+ glib/gvariant-serialiser.c | 73 ++++++++++++++++++++++++--------------
+ 1 file changed, 46 insertions(+), 27 deletions(-)
+
+diff --git a/glib/gvariant-serialiser.c b/glib/gvariant-serialiser.c
+index 2932427..1c23eab 100644
+--- a/glib/gvariant-serialiser.c
++++ b/glib/gvariant-serialiser.c
+@@ -946,6 +946,51 @@ gvs_variable_sized_array_is_normal (GVariantSeriali=
sed value)
+  * for the tuple.  See the notes in gvarianttypeinfo.h.
+  */
+
++static void
++gvs_tuple_get_member_bounds (GVariantSerialised  value,
++                             gsize               index_,
++                             gsize               offset_size,
++                             gsize              *out_member_start,
++                             gsize              *out_member_end)
++{
++  const GVariantMemberInfo *member_info;
++  gsize member_start, member_end;
++
++  member_info =3D g_variant_type_info_member_info (value.type_info, ind=
ex_);
++
++  if (member_info->i + 1)
++    member_start =3D gvs_read_unaligned_le (value.data + value.size -
++                                          offset_size * (member_info->i=
 + 1),
++                                          offset_size);
++  else
++    member_start =3D 0;
++
++  member_start +=3D member_info->a;
++  member_start &=3D member_info->b;
++  member_start |=3D member_info->c;
++
++  if (member_info->ending_type =3D=3D G_VARIANT_MEMBER_ENDING_LAST)
++    member_end =3D value.size - offset_size * (member_info->i + 1);
++
++  else if (member_info->ending_type =3D=3D G_VARIANT_MEMBER_ENDING_FIXE=
D)
++    {
++      gsize fixed_size;
++
++      g_variant_type_info_query (member_info->type_info, NULL, &fixed_s=
ize);
++      member_end =3D member_start + fixed_size;
++    }
++
++  else /* G_VARIANT_MEMBER_ENDING_OFFSET */
++    member_end =3D gvs_read_unaligned_le (value.data + value.size -
++                                        offset_size * (member_info->i +=
 2),
++                                        offset_size);
++
++  if (out_member_start !=3D NULL)
++    *out_member_start =3D member_start;
++  if (out_member_end !=3D NULL)
++    *out_member_end =3D member_end;
++}
++
+ static gsize
+ gvs_tuple_n_children (GVariantSerialised value)
+ {
+@@ -1001,33 +1046,7 @@ gvs_tuple_get_child (GVariantSerialised value,
+         }
+     }
+
+-  if (member_info->i + 1)
+-    start =3D gvs_read_unaligned_le (value.data + value.size -
+-                                   offset_size * (member_info->i + 1),
+-                                   offset_size);
+-  else
+-    start =3D 0;
+-
+-  start +=3D member_info->a;
+-  start &=3D member_info->b;
+-  start |=3D member_info->c;
+-
+-  if (member_info->ending_type =3D=3D G_VARIANT_MEMBER_ENDING_LAST)
+-    end =3D value.size - offset_size * (member_info->i + 1);
+-
+-  else if (member_info->ending_type =3D=3D G_VARIANT_MEMBER_ENDING_FIXE=
D)
+-    {
+-      gsize fixed_size;
+-
+-      g_variant_type_info_query (child.type_info, NULL, &fixed_size);
+-      end =3D start + fixed_size;
+-      child.size =3D fixed_size;
+-    }
+-
+-  else /* G_VARIANT_MEMBER_ENDING_OFFSET */
+-    end =3D gvs_read_unaligned_le (value.data + value.size -
+-                                 offset_size * (member_info->i + 2),
+-                                 offset_size);
++  gvs_tuple_get_member_bounds (value, index_, offset_size, &start, &end=
);
+
+   /* The child should not extend into the offset table. */
+   if (index_ !=3D g_variant_type_info_n_members (value.type_info) - 1)
+--
+2.40.0
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0005.patc=
h b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0005.patch
new file mode 100644
index 0000000000..6c71c20819
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0005.patch
@@ -0,0 +1,81 @@
+From 73d0aa81c2575a5c9ae77dcb94da919579014fc0 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@endlessos.org>
+Date: Fri, 11 Aug 2023 04:13:02 +0000
+Subject: [PATCH] gvariant-serialiser: Rework child size calculation
+
+This reduces a few duplicate calls to `g_variant_type_info_query()` and
+explains why they=E2=80=99re needed.
+
+Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
+
+Helps: #2121
+
+CVE: CVE-2023-32665
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/=
73d0aa81c2575a5c9ae77dcb94da919579014fc0]
+
+Signed-off-by: Soumya <soumya.sambu@windriver.com>
+---
+ glib/gvariant-serialiser.c | 31 +++++++++----------------------
+ 1 file changed, 9 insertions(+), 22 deletions(-)
+
+diff --git a/glib/gvariant-serialiser.c b/glib/gvariant-serialiser.c
+index 1c23eab..b63e99f 100644
+--- a/glib/gvariant-serialiser.c
++++ b/glib/gvariant-serialiser.c
+@@ -1011,14 +1011,18 @@ gvs_tuple_get_child (GVariantSerialised value,
+   child.depth =3D value.depth + 1;
+   offset_size =3D gvs_get_offset_size (value.size);
+
++  /* Ensure the size is set for fixed-sized children, or
++   * g_variant_serialised_check() will fail, even if we return
++   * (child.data =3D=3D NULL) to indicate an error. */
++  if (member_info->ending_type =3D=3D G_VARIANT_MEMBER_ENDING_FIXED)
++    g_variant_type_info_query (child.type_info, NULL, &child.size);
++
+   /* tuples are the only (potentially) fixed-sized containers, so the
+    * only ones that have to deal with the possibility of having %NULL
+    * data with a non-zero %size if errors occurred elsewhere.
+    */
+   if G_UNLIKELY (value.data =3D=3D NULL && value.size !=3D 0)
+     {
+-      g_variant_type_info_query (child.type_info, NULL, &child.size);
+-
+       /* this can only happen in fixed-sized tuples,
+        * so the child must also be fixed sized.
+        */
+@@ -1036,29 +1040,12 @@ gvs_tuple_get_child (GVariantSerialised value,
+   else
+     {
+       if (offset_size * (member_info->i + 1) > value.size)
+-        {
+-          /* if the child is fixed size, return its size.
+-           * if child is not fixed-sized, return size =3D 0.
+-           */
+-          g_variant_type_info_query (child.type_info, NULL, &child.size=
);
+-
+-          return child;
+-        }
++        return child;
+     }
+
+-  gvs_tuple_get_member_bounds (value, index_, offset_size, &start, &end=
);
+-
+   /* The child should not extend into the offset table. */
+-  if (index_ !=3D g_variant_type_info_n_members (value.type_info) - 1)
+-    {
+-      GVariantSerialised last_child;
+-      last_child =3D gvs_tuple_get_child (value,
+-                                        g_variant_type_info_n_members (=
value.type_info) - 1);
+-      last_end =3D last_child.data + last_child.size - value.data;
+-      g_variant_type_info_unref (last_child.type_info);
+-    }
+-  else
+-    last_end =3D end;
++  gvs_tuple_get_member_bounds (value, index_, offset_size, &start, &end=
);
++  gvs_tuple_get_member_bounds (value, g_variant_type_info_n_members (va=
lue.type_info) - 1, offset_size, NULL, &last_end);
+
+   if (start < end && end <=3D value.size && end <=3D last_end)
+     {
+--
+2.40.0
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0006.patc=
h b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0006.patch
new file mode 100644
index 0000000000..194ce15287
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0006.patch
@@ -0,0 +1,397 @@
+From 7cf6f5b69146d20948d42f0c476688fe17fef787 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@endlessos.org>
+Date: Wed, 16 Aug 2023 12:09:06 +0000
+Subject: [PATCH] gvariant: Don't allow child elements of a tuple to over=
lap
+ each other
+
+This is similar to the earlier commit which prevents child elements of a
+variable-sized array from overlapping each other, but this time for
+tuples. It is based heavily on ideas by William Manley.
+
+Tuples are slightly different from variable-sized arrays in that they
+contain a mixture of fixed and variable sized elements. All but one of
+the variable sized elements have an entry in the frame offsets table.
+This means that if we were to just check the ordering of the frame
+offsets table, the variable sized elements could still overlap
+interleaving fixed sized elements, which would be bad.
+
+Therefore we have to check the elements rather than the frame offsets.
+
+The logic of checking the elements up to the index currently being
+requested, and caching the result in `ordered_offsets_up_to`, means that
+the algorithmic cost implications are the same for this commit as for
+variable-sized arrays: an O(N) cost for these checks is amortised out
+over N accesses to O(1) per access.
+
+Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
+
+Fixes: #2121
+
+CVE: CVE-2023-32665
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/=
7cf6f5b69146d20948d42f0c476688fe17fef787]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ glib/gvariant-core.c       |   6 +-
+ glib/gvariant-serialiser.c |  40 ++++++++
+ glib/gvariant-serialiser.h |   7 +-
+ glib/gvariant.c            |   1 +
+ glib/tests/gvariant.c      | 181 +++++++++++++++++++++++++++++++++++++
+ 5 files changed, 232 insertions(+), 3 deletions(-)
+
+diff --git a/glib/gvariant-core.c b/glib/gvariant-core.c
+index 4e0b2b5..c57ee77 100644
+--- a/glib/gvariant-core.c
++++ b/glib/gvariant-core.c
+@@ -1,6 +1,7 @@
+ /*
+  * Copyright =C2=A9 2007, 2008 Ryan Lortie
+  * Copyright =C2=A9 2010 Codethink Limited
++ * Copyright =C2=A9 2022 Endless OS Foundation, LLC
+  *
+  * This library is free software; you can redistribute it and/or
+  * modify it under the terms of the GNU Lesser General Public
+@@ -179,7 +180,7 @@ struct _GVariant
+  *                             offsets themselves.
+  *
+  *                             This field is only relevant for arrays o=
f non
+- *                             fixed width types.
++ *                             fixed width types and for tuples.
+  *
+  *   .tree: Only valid when the instance is in tree form.
+  *
+@@ -1139,6 +1140,9 @@ g_variant_get_child_value (GVariant *value,
+      */
+     s_child =3D g_variant_serialised_get_child (serialised, index_);
+
++    /* Update the cached ordered_offsets_up_to, since @serialised will =
be thrown away when this function exits */
++    value->contents.serialised.ordered_offsets_up_to =3D MAX (value->co=
ntents.serialised.ordered_offsets_up_to, serialised.ordered_offsets_up_to=
);
++
+     /* Check whether this would cause nesting too deep. If so, return a=
 fake
+      * child. The only situation we expect this to happen in is with a =
variant,
+      * as all other deeply-nested types have a static type, and hence s=
hould
+diff --git a/glib/gvariant-serialiser.c b/glib/gvariant-serialiser.c
+index 2493e76..d46d05c 100644
+--- a/glib/gvariant-serialiser.c
++++ b/glib/gvariant-serialiser.c
+@@ -942,6 +942,10 @@ gvs_variable_sized_array_is_normal (GVariantSeriali=
sed value)
+  * for the tuple.  See the notes in gvarianttypeinfo.h.
+  */
+
++/* Note: This doesn=E2=80=99t guarantee that @out_member_end >=3D @out_=
member_start; that
++ * condition may not hold true for invalid serialised variants. The cal=
ler is
++ * responsible for checking the returned values and handling invalid on=
es
++ * appropriately. */
+ static void
+ gvs_tuple_get_member_bounds (GVariantSerialised  value,
+                              gsize               index_,
+@@ -1028,6 +1032,42 @@ gvs_tuple_get_child (GVariantSerialised value,
+       return child;
+     }
+
++  /* If the requested @index_ is beyond the set of indices whose framin=
g offsets
++   * have been checked, check the remaining offsets to see whether they=
=E2=80=99re
++   * normal (in order, no overlapping tuple elements).
++   *
++   * Unlike the checks in gvs_variable_sized_array_get_child(), we have=
 to check
++   * all the tuple *elements* here, not just all the framing offsets, s=
ince
++   * tuples contain a mix of elements which use framing offsets and one=
s which
++   * don=E2=80=99t. None of them are allowed to overlap. */
++  if (index_ > value.ordered_offsets_up_to)
++    {
++      gsize i, prev_i_end =3D 0;
++
++      if (value.ordered_offsets_up_to > 0)
++        gvs_tuple_get_member_bounds (value, value.ordered_offsets_up_to=
 - 1, offset_size, NULL, &prev_i_end);
++
++      for (i =3D value.ordered_offsets_up_to; i <=3D index_; i++)
++        {
++          gsize i_start, i_end;
++
++          gvs_tuple_get_member_bounds (value, i, offset_size, &i_start,=
 &i_end);
++
++          if (i_start > i_end || i_start < prev_i_end || i_end > value.=
size)
++            break;
++
++          prev_i_end =3D i_end;
++        }
++
++      value.ordered_offsets_up_to =3D i - 1;
++    }
++
++  if (index_ > value.ordered_offsets_up_to)
++    {
++      /* Offsets are invalid somewhere, so return an empty child. */
++      return child;
++    }
++
+   if (member_info->ending_type =3D=3D G_VARIANT_MEMBER_ENDING_OFFSET)
+     {
+       if (offset_size * (member_info->i + 2) > value.size)
+diff --git a/glib/gvariant-serialiser.h b/glib/gvariant-serialiser.h
+index 3ab83b3..03826f9 100644
+--- a/glib/gvariant-serialiser.h
++++ b/glib/gvariant-serialiser.h
+@@ -34,8 +34,11 @@ typedef struct
+    * This guarantees that the bytes of element n don't overlap with any=
 previous
+    * element.
+    *
+-   * This is both read and set by g_variant_serialised_get_child for ar=
rays of
+-   * non-fixed-width types */
++   * This is both read and set by g_variant_serialised_get_child() for =
arrays of
++   * non-fixed-width types, and for tuples.
++   *
++   * Even when dealing with tuples, @ordered_offsets_up_to is an elemen=
t index,
++   * rather than an index into the frame offsets. */
+   gsize             ordered_offsets_up_to;
+ } GVariantSerialised;
+
+diff --git a/glib/gvariant.c b/glib/gvariant.c
+index 42ffc9a..f645e05 100644
+--- a/glib/gvariant.c
++++ b/glib/gvariant.c
+@@ -5997,6 +5997,7 @@ g_variant_byteswap (GVariant *value)
+       serialised.size =3D g_variant_get_size (trusted);
+       serialised.data =3D g_malloc (serialised.size);
+       serialised.depth =3D g_variant_get_depth (trusted);
++      serialised.ordered_offsets_up_to =3D G_MAXSIZE;  /* operating on =
the normal form */
+       g_variant_store (trusted, serialised.data);
+       g_variant_unref (trusted);
+
+diff --git a/glib/tests/gvariant.c b/glib/tests/gvariant.c
+index 291f796..3ddff96 100644
+--- a/glib/tests/gvariant.c
++++ b/glib/tests/gvariant.c
+@@ -1,6 +1,7 @@
+ /*
+  * Copyright =C2=A9 2010 Codethink Limited
+  * Copyright =C2=A9 2020 William Manley
++ * Copyright =C2=A9 2022 Endless OS Foundation, LLC
+  *
+  * This library is free software; you can redistribute it and/or
+  * modify it under the terms of the GNU Lesser General Public
+@@ -1447,6 +1448,7 @@ test_maybe (void)
+         serialised.data =3D flavoured_malloc (needed_size, flavour);
+         serialised.size =3D needed_size;
+         serialised.depth =3D 0;
++	serialised.ordered_offsets_up_to =3D 0;
+
+         g_variant_serialiser_serialise (serialised,
+                                         random_instance_filler,
+@@ -1570,6 +1572,7 @@ test_array (void)
+         serialised.data =3D flavoured_malloc (needed_size, flavour);
+         serialised.size =3D needed_size;
+         serialised.depth =3D 0;
++	serialised.ordered_offsets_up_to =3D 0;
+
+         g_variant_serialiser_serialise (serialised, random_instance_fil=
ler,
+                                         (gpointer *) instances, n_child=
ren);
+@@ -1734,6 +1737,7 @@ test_tuple (void)
+         serialised.data =3D flavoured_malloc (needed_size, flavour);
+         serialised.size =3D needed_size;
+         serialised.depth =3D 0;
++	serialised.ordered_offsets_up_to =3D 0;
+
+         g_variant_serialiser_serialise (serialised, random_instance_fil=
ler,
+                                         (gpointer *) instances, n_child=
ren);
+@@ -1830,6 +1834,7 @@ test_variant (void)
+         serialised.data =3D flavoured_malloc (needed_size, flavour);
+         serialised.size =3D needed_size;
+         serialised.depth =3D 0;
++	serialised.ordered_offsets_up_to =3D 0;
+
+         g_variant_serialiser_serialise (serialised, random_instance_fil=
ler,
+                                         (gpointer *) &instance, 1);
+@@ -5090,6 +5095,176 @@ test_normal_checking_tuple_offsets (void)
+   g_variant_unref (variant);
+ }
+
++/* This is a regression test that we can't have non-normal values that =
take up
++ * significantly more space than the normal equivalent, by specifying t=
he
++ * offset table entries so that tuple elements overlap.
++ *
++ * See https://gitlab.gnome.org/GNOME/glib/-/issues/2121#note_838503 an=
d
++ * https://gitlab.gnome.org/GNOME/glib/-/issues/2121#note_838513 */
++static void
++test_normal_checking_tuple_offsets2 (void)
++{
++  const GVariantType *data_type =3D G_VARIANT_TYPE ("(yyaiyyaiyy)");
++  const guint8 data[] =3D {
++    0x12, 0x34, 0x56, 0x78, 0x01,
++    /*
++         ^=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98
++
++    ^^^^^^^^^^                   1st yy
++          ^^^^^^^^^^             2nd yy
++                ^^^^^^^^^^       3rd yy
++                            ^^^^ Framing offsets
++     */
++
++  /* If this variant was encoded normally, it would be something like t=
his:
++   * 0x12, 0x34,  pad,  pad, [array bytes], 0x56, 0x78,  pad,  pad, [ar=
ray bytes], 0x9A, 0xBC, 0xXX
++   *                                      ^=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=98
++   *
++   * ^^^^^^^^^^                                                        =
                             1st yy
++   *                                        ^^^^^^^^^^                 =
                             2nd yy
++   *                                                                   =
            ^^^^^^^^^^       3rd yy
++   *                                                                   =
                        ^^^^ Framing offsets
++   */
++  };
++  gsize size =3D sizeof (data);
++  GVariant *variant =3D NULL;
++  GVariant *normal_variant =3D NULL;
++  GVariant *expected =3D NULL;
++
++  variant =3D g_variant_new_from_data (data_type, data, size, FALSE, NU=
LL, NULL);
++  g_assert_nonnull (variant);
++
++  normal_variant =3D g_variant_get_normal_form (variant);
++  g_assert_nonnull (normal_variant);
++  g_assert_cmpuint (g_variant_get_size (normal_variant), <=3D, size * 3=
);
++
++  expected =3D g_variant_new_parsed (
++      "@(yyaiyyaiyy) (0x12, 0x34, [], 0x00, 0x00, [], 0x00, 0x00)");
++  g_assert_cmpvariant (expected, variant);
++  g_assert_cmpvariant (expected, normal_variant);
++
++  g_variant_unref (expected);
++  g_variant_unref (normal_variant);
++  g_variant_unref (variant);
++}
++
++/* This is a regression test that overlapping entries in the offset tab=
le are
++ * decoded consistently, even though they=E2=80=99re non-normal.
++ *
++ * See https://gitlab.gnome.org/GNOME/glib/-/issues/2121#note_910935 */
++static void
++test_normal_checking_tuple_offsets3 (void)
++{
++  /* The expected decoding of this non-normal byte stream is complex. S=
ee
++   * section 2.7.3 (Handling Non-Normal Serialised Data) of the GVarian=
t
++   * specification.
++   *
++   * The rule =E2=80=9CChild Values Overlapping Framing Offsets=E2=80=9D=
 from the specification
++   * says that the first `ay` must be decoded as `[0x01]` even though i=
t
++   * overlaps the first byte of the offset table. However, since commit
++   * 7eedcd76f7d5b8c98fa60013e1fe6e960bf19df3, GLib explicitly doesn=E2=
=80=99t allow
++   * this as it=E2=80=99s exploitable. So the first `ay` must be given =
a default value.
++   *
++   * The second and third `ay`s must be given default values because of=
 rule
++   * =E2=80=9CEnd Boundary Precedes Start Boundary=E2=80=9D.
++   *
++   * The `i` must be given a default value because of rule =E2=80=9CSta=
rt or End
++   * Boundary of a Child Falls Outside the Container=E2=80=9D.
++   */
++  const GVariantType *data_type =3D G_VARIANT_TYPE ("(ayayiay)");
++  const guint8 data[] =3D {
++    0x01, 0x00, 0x02,
++    /*
++               ^=E2=94=80=E2=94=80=E2=94=98
++
++    ^^^^^^^^^^                   1st ay, bytes 0-2 (but given a default=
 value anyway, see above)
++                                 2nd ay, bytes 2-0
++                                     i,  bytes 0-4
++                                 3rd ay, bytes 4-1
++          ^^^^^^^^^^ Framing offsets
++     */
++  };
++  gsize size =3D sizeof (data);
++  GVariant *variant =3D NULL;
++  GVariant *normal_variant =3D NULL;
++  GVariant *expected =3D NULL;
++
++  variant =3D g_variant_new_from_data (data_type, data, size, FALSE, NU=
LL, NULL);
++  g_assert_nonnull (variant);
++
++  g_assert_false (g_variant_is_normal_form (variant));
++
++  normal_variant =3D g_variant_get_normal_form (variant);
++  g_assert_nonnull (normal_variant);
++  g_assert_cmpuint (g_variant_get_size (normal_variant), <=3D, size * 3=
);
++
++  expected =3D g_variant_new_parsed ("@(ayayiay) ([], [], 0, [])");
++  g_assert_cmpvariant (expected, variant);
++  g_assert_cmpvariant (expected, normal_variant);
++
++  g_variant_unref (expected);
++  g_variant_unref (normal_variant);
++  g_variant_unref (variant);
++}
++
++/* This is a regression test that overlapping entries in the offset tab=
le are
++ * decoded consistently, even though they=E2=80=99re non-normal.
++ *
++ * See https://gitlab.gnome.org/GNOME/glib/-/issues/2121#note_910935 */
++static void
++test_normal_checking_tuple_offsets4 (void)
++{
++  /* The expected decoding of this non-normal byte stream is complex. S=
ee
++   * section 2.7.3 (Handling Non-Normal Serialised Data) of the GVarian=
t
++   * specification.
++   *
++   * The rule =E2=80=9CChild Values Overlapping Framing Offsets=E2=80=9D=
 from the specification
++   * says that the first `ay` must be decoded as `[0x01]` even though i=
t
++   * overlaps the first byte of the offset table. However, since commit
++   * 7eedcd76f7d5b8c98fa60013e1fe6e960bf19df3, GLib explicitly doesn=E2=
=80=99t allow
++   * this as it=E2=80=99s exploitable. So the first `ay` must be given =
a default value.
++   *
++   * The second `ay` must be given a default value because of rule =E2=80=
=9CEnd Boundary
++   * Precedes Start Boundary=E2=80=9D.
++   *
++   * The third `ay` must be given a default value because its framing o=
ffsets
++   * overlap that of the first `ay`.
++   */
++  const GVariantType *data_type =3D G_VARIANT_TYPE ("(ayayay)");
++  const guint8 data[] =3D {
++    0x01, 0x00, 0x02,
++    /*
++               ^=E2=94=80=E2=94=80=E2=94=98
++
++    ^^^^^^^^^^                   1st ay, bytes 0-2 (but given a default=
 value anyway, see above)
++                                 2nd ay, bytes 2-0
++                                 3rd ay, bytes 0-1
++          ^^^^^^^^^^ Framing offsets
++     */
++  };
++  gsize size =3D sizeof (data);
++  GVariant *variant =3D NULL;
++  GVariant *normal_variant =3D NULL;
++  GVariant *expected =3D NULL;
++
++  variant =3D g_variant_new_from_data (data_type, data, size, FALSE, NU=
LL, NULL);
++  g_assert_nonnull (variant);
++
++  g_assert_false (g_variant_is_normal_form (variant));
++
++  normal_variant =3D g_variant_get_normal_form (variant);
++  g_assert_nonnull (normal_variant);
++  g_assert_cmpuint (g_variant_get_size (normal_variant), <=3D, size * 3=
);
++
++  expected =3D g_variant_new_parsed ("@(ayayay) ([], [], [])");
++  g_assert_cmpvariant (expected, variant);
++  g_assert_cmpvariant (expected, normal_variant);
++
++  g_variant_unref (expected);
++  g_variant_unref (normal_variant);
++  g_variant_unref (variant);
++}
++
+ /* Test that an empty object path is normalised successfully to the bas=
e object
+  * path, =E2=80=98/=E2=80=99. */
+ static void
+@@ -5236,6 +5411,12 @@ main (int argc, char **argv)
+                    test_normal_checking_array_offsets2);
+   g_test_add_func ("/gvariant/normal-checking/tuple-offsets",
+                    test_normal_checking_tuple_offsets);
++  g_test_add_func ("/gvariant/normal-checking/tuple-offsets2",
++                   test_normal_checking_tuple_offsets2);
++  g_test_add_func ("/gvariant/normal-checking/tuple-offsets3",
++                   test_normal_checking_tuple_offsets3);
++  g_test_add_func ("/gvariant/normal-checking/tuple-offsets4",
++                   test_normal_checking_tuple_offsets4);
+   g_test_add_func ("/gvariant/normal-checking/empty-object-path",
+                    test_normal_checking_empty_object_path);
+
+--
+2.40.0
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0007.patc=
h b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0007.patch
new file mode 100644
index 0000000000..8a408ab030
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0007.patch
@@ -0,0 +1,50 @@
+From e6490c84e84ba9f182fbd83b51ff4f9f5a0a1793 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@endlessos.org>
+Date: Wed, 16 Aug 2023 03:42:47 +0000
+Subject: [PATCH] gvariant: Port g_variant_deep_copy() to count its itera=
tions
+ directly
+
+This is equivalent to what `GVariantIter` does, but it means that
+`g_variant_deep_copy()` is making its own `g_variant_get_child_value()`
+calls.
+
+This will be useful in an upcoming commit, where those child values will
+be inspected a little more deeply.
+
+Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
+
+Helps: #2121
+
+CVE: CVE-2023-32665
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/=
e6490c84e84ba9f182fbd83b51ff4f9f5a0a1793]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ glib/gvariant.c | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/glib/gvariant.c b/glib/gvariant.c
+index 42ffc9a..ca13cc1 100644
+--- a/glib/gvariant.c
++++ b/glib/gvariant.c
+@@ -5850,14 +5850,13 @@ g_variant_deep_copy (GVariant *value)
+     case G_VARIANT_CLASS_VARIANT:
+       {
+         GVariantBuilder builder;
+-        GVariantIter iter;
+-        GVariant *child;
++        gsize i, n_children;
+
+         g_variant_builder_init (&builder, g_variant_get_type (value));
+-        g_variant_iter_init (&iter, value);
+
+-        while ((child =3D g_variant_iter_next_value (&iter)))
++        for (i =3D 0, n_children =3D g_variant_n_children (value); i < =
n_children; i++)
+           {
++            GVariant *child =3D g_variant_get_child_value (value, i);
+             g_variant_builder_add_value (&builder, g_variant_deep_copy =
(child));
+             g_variant_unref (child);
+           }
+--
+2.40.0
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0008.patc=
h b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0008.patch
new file mode 100644
index 0000000000..9b074a543d
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0008.patch
@@ -0,0 +1,395 @@
+From d1a293c4e29880b8d17bb826c9a426a440ca4a91 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@endlessos.org>
+Date: Thu, 17 Aug 2023 01:30:38 +0000
+Subject: [PATCH] gvariant: Track checked and ordered offsets independent=
ly
+
+The past few commits introduced the concept of known-good offsets in the
+offset table (which is used for variable-width arrays and tuples).
+Good offsets are ones which are non-overlapping with all the previous
+offsets in the table.
+
+If a bad offset is encountered when indexing into the array or tuple,
+the cached known-good offset index will not be increased. In this way,
+all child variants at and beyond the first bad offset can be returned as
+default values rather than dereferencing potentially invalid data.
+
+In this case, there was no information about the fact that the indexes
+between the highest known-good index and the requested one had been
+checked already. That could lead to a pathological case where an offset
+table with an invalid first offset is repeatedly checked in full when
+trying to access higher-indexed children.
+
+Avoid that by storing the index of the highest checked offset in the
+table, as well as the index of the highest good/ordered offset.
+
+Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
+
+Helps: #2121
+
+CVE: CVE-2023-32665
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/=
d1a293c4e29880b8d17bb826c9a426a440ca4a91]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ glib/gvariant-core.c       | 28 ++++++++++++++++++++++++
+ glib/gvariant-serialiser.c | 44 +++++++++++++++++++++++++++-----------
+ glib/gvariant-serialiser.h |  9 ++++++++
+ glib/gvariant.c            |  1 +
+ glib/tests/gvariant.c      |  5 +++++
+ 5 files changed, 75 insertions(+), 12 deletions(-)
+
+diff --git a/glib/gvariant-core.c b/glib/gvariant-core.c
+index c57ee77..7b71efc 100644
+--- a/glib/gvariant-core.c
++++ b/glib/gvariant-core.c
+@@ -67,6 +67,7 @@ struct _GVariant
+       GBytes *bytes;
+       gconstpointer data;
+       gsize ordered_offsets_up_to;
++      gsize checked_offsets_up_to;
+     } serialised;
+
+     struct
+@@ -182,6 +183,24 @@ struct _GVariant
+  *                             This field is only relevant for arrays o=
f non
+  *                             fixed width types and for tuples.
+  *
++ *     .checked_offsets_up_to: Similarly to .ordered_offsets_up_to, thi=
s stores
++ *                             the index of the highest element, n, who=
se frame
++ *                             offsets (and all the preceding frame off=
sets)
++ *                             have been checked for validity.
++ *
++ *                             It is always the case that
++ *                             .checked_offsets_up_to =E2=89=A5 .ordere=
d_offsets_up_to.
++ *
++ *                             If .checked_offsets_up_to =3D=3D .ordere=
d_offsets_up_to,
++ *                             then a bad offset has not been found so =
far.
++ *
++ *                             If .checked_offsets_up_to > .ordered_off=
sets_up_to,
++ *                             then a bad offset has been found at
++ *                             (.ordered_offsets_up_to + 1).
++ *
++ *                             This field is only relevant for arrays o=
f non
++ *                             fixed width types and for tuples.
++ *
+  *   .tree: Only valid when the instance is in tree form.
+  *
+  *          Note that accesses from other threads could result in
+@@ -386,6 +405,7 @@ g_variant_to_serialised (GVariant *value)
+       value->size,
+       value->depth,
+       value->contents.serialised.ordered_offsets_up_to,
++      value->contents.serialised.checked_offsets_up_to,
+     };
+     return serialised;
+   }
+@@ -418,6 +438,7 @@ g_variant_serialise (GVariant *value,
+   serialised.data =3D data;
+   serialised.depth =3D value->depth;
+   serialised.ordered_offsets_up_to =3D 0;
++  serialised.checked_offsets_up_to =3D 0;
+
+   children =3D (gpointer *) value->contents.tree.children;
+   n_children =3D value->contents.tree.n_children;
+@@ -464,10 +485,12 @@ g_variant_fill_gvs (GVariantSerialised *serialised=
,
+   if (value->state & STATE_SERIALISED)
+     {
+       serialised->ordered_offsets_up_to =3D value->contents.serialised.=
ordered_offsets_up_to;
++      serialised->checked_offsets_up_to =3D value->contents.serialised.=
checked_offsets_up_to;
+     }
+   else
+     {
+       serialised->ordered_offsets_up_to =3D 0;
++      serialised->checked_offsets_up_to =3D 0;
+     }
+
+   if (serialised->data)
+@@ -513,6 +536,7 @@ g_variant_ensure_serialised (GVariant *value)
+       value->contents.serialised.data =3D g_bytes_get_data (bytes, NULL=
);
+       value->contents.serialised.bytes =3D bytes;
+       value->contents.serialised.ordered_offsets_up_to =3D G_MAXSIZE;
++      value->contents.serialised.checked_offsets_up_to =3D G_MAXSIZE;
+       value->state |=3D STATE_SERIALISED;
+     }
+ }
+@@ -594,6 +618,7 @@ g_variant_new_from_bytes (const GVariantType *type,
+   serialised.data =3D (guchar *) g_bytes_get_data (bytes, &serialised.s=
ize);
+   serialised.depth =3D 0;
+   serialised.ordered_offsets_up_to =3D trusted ? G_MAXSIZE : 0;
++  serialised.checked_offsets_up_to =3D trusted ? G_MAXSIZE : 0;
+
+   if (!g_variant_serialised_check (serialised))
+     {
+@@ -645,6 +670,7 @@ g_variant_new_from_bytes (const GVariantType *type,
+     }
+
+   value->contents.serialised.ordered_offsets_up_to =3D trusted ? G_MAXS=
IZE : 0;
++  value->contents.serialised.checked_offsets_up_to =3D trusted ? G_MAXS=
IZE : 0;
+
+   g_clear_pointer (&owned_bytes, g_bytes_unref);
+
+@@ -1142,6 +1168,7 @@ g_variant_get_child_value (GVariant *value,
+
+     /* Update the cached ordered_offsets_up_to, since @serialised will =
be thrown away when this function exits */
+     value->contents.serialised.ordered_offsets_up_to =3D MAX (value->co=
ntents.serialised.ordered_offsets_up_to, serialised.ordered_offsets_up_to=
);
++    value->contents.serialised.checked_offsets_up_to =3D MAX (value->co=
ntents.serialised.checked_offsets_up_to, serialised.checked_offsets_up_to=
);
+
+     /* Check whether this would cause nesting too deep. If so, return a=
 fake
+      * child. The only situation we expect this to happen in is with a =
variant,
+@@ -1169,6 +1196,7 @@ g_variant_get_child_value (GVariant *value,
+       g_bytes_ref (value->contents.serialised.bytes);
+     child->contents.serialised.data =3D s_child.data;
+     child->contents.serialised.ordered_offsets_up_to =3D s_child.ordere=
d_offsets_up_to;
++    child->contents.serialised.checked_offsets_up_to =3D s_child.checke=
d_offsets_up_to;
+
+     return child;
+   }
+diff --git a/glib/gvariant-serialiser.c b/glib/gvariant-serialiser.c
+index d46d05c..9c7f12a 100644
+--- a/glib/gvariant-serialiser.c
++++ b/glib/gvariant-serialiser.c
+@@ -120,6 +120,8 @@
+  *
+  * @depth has no restrictions; the depth of a top-level serialized #GVa=
riant is
+  * zero, and it increases for each level of nested child.
++ *
++ * @checked_offsets_up_to is always =E2=89=A5 @ordered_offsets_up_to
+  */
+
+ /* < private >
+@@ -147,6 +149,9 @@ g_variant_serialised_check (GVariantSerialised seria=
lised)
+            !(serialised.size =3D=3D 0 || serialised.data !=3D NULL))
+     return FALSE;
+
++  if (serialised.ordered_offsets_up_to > serialised.checked_offsets_up_=
to)
++    return FALSE;
++
+   /* Depending on the native alignment requirements of the machine, the
+    * compiler will insert either 3 or 7 padding bytes after the char.
+    * This will result in the sizeof() the struct being 12 or 16.
+@@ -266,6 +271,7 @@ gvs_fixed_sized_maybe_get_child (GVariantSerialised =
value,
+   g_variant_type_info_ref (value.type_info);
+   value.depth++;
+   value.ordered_offsets_up_to =3D 0;
++  value.checked_offsets_up_to =3D 0;
+
+   return value;
+ }
+@@ -297,7 +303,7 @@ gvs_fixed_sized_maybe_serialise (GVariantSerialised =
       value,
+ {
+   if (n_children)
+     {
+-      GVariantSerialised child =3D { NULL, value.data, value.size, valu=
e.depth + 1, 0 };
++      GVariantSerialised child =3D { NULL, value.data, value.size, valu=
e.depth + 1, 0, 0 };
+
+       gvs_filler (&child, children[0]);
+     }
+@@ -320,6 +326,7 @@ gvs_fixed_sized_maybe_is_normal (GVariantSerialised =
value)
+       value.type_info =3D g_variant_type_info_element (value.type_info)=
;
+       value.depth++;
+       value.ordered_offsets_up_to =3D 0;
++      value.checked_offsets_up_to =3D 0;
+
+       return g_variant_serialised_is_normal (value);
+     }
+@@ -362,6 +369,7 @@ gvs_variable_sized_maybe_get_child (GVariantSerialis=
ed value,
+
+   value.depth++;
+   value.ordered_offsets_up_to =3D 0;
++  value.checked_offsets_up_to =3D 0;
+
+   return value;
+ }
+@@ -392,7 +400,7 @@ gvs_variable_sized_maybe_serialise (GVariantSerialis=
ed        value,
+ {
+   if (n_children)
+     {
+-      GVariantSerialised child =3D { NULL, value.data, value.size - 1, =
value.depth + 1, 0 };
++      GVariantSerialised child =3D { NULL, value.data, value.size - 1, =
value.depth + 1, 0, 0 };
+
+       /* write the data for the child.  */
+       gvs_filler (&child, children[0]);
+@@ -413,6 +421,7 @@ gvs_variable_sized_maybe_is_normal (GVariantSerialis=
ed value)
+   value.size--;
+   value.depth++;
+   value.ordered_offsets_up_to =3D 0;
++  value.checked_offsets_up_to =3D 0;
+
+   return g_variant_serialised_is_normal (value);
+ }
+@@ -739,39 +748,46 @@ gvs_variable_sized_array_get_child (GVariantSerial=
ised value,
+
+   /* If the requested @index_ is beyond the set of indices whose framin=
g offsets
+    * have been checked, check the remaining offsets to see whether they=
=E2=80=99re
+-   * normal (in order, no overlapping array elements). */
+-  if (index_ > value.ordered_offsets_up_to)
++   * normal (in order, no overlapping array elements).
++   *
++   * Don=E2=80=99t bother checking if the highest known-good offset is =
lower than the
++   * highest checked offset, as that means there=E2=80=99s an invalid e=
lement at that
++   * index, so there=E2=80=99s no need to check further. */
++  if (index_ > value.checked_offsets_up_to &&
++      value.ordered_offsets_up_to =3D=3D value.checked_offsets_up_to)
+     {
+       switch (offsets.offset_size)
+         {
+         case 1:
+           {
+             value.ordered_offsets_up_to =3D find_unordered_guint8 (
+-                offsets.array, value.ordered_offsets_up_to, index_ + 1)=
;
++                offsets.array, value.checked_offsets_up_to, index_ + 1)=
;
+             break;
+           }
+         case 2:
+           {
+             value.ordered_offsets_up_to =3D find_unordered_guint16 (
+-                offsets.array, value.ordered_offsets_up_to, index_ + 1)=
;
++                offsets.array, value.checked_offsets_up_to, index_ + 1)=
;
+             break;
+           }
+         case 4:
+           {
+             value.ordered_offsets_up_to =3D find_unordered_guint32 (
+-                offsets.array, value.ordered_offsets_up_to, index_ + 1)=
;
++                offsets.array, value.checked_offsets_up_to, index_ + 1)=
;
+             break;
+           }
+         case 8:
+           {
+             value.ordered_offsets_up_to =3D find_unordered_guint64 (
+-                offsets.array, value.ordered_offsets_up_to, index_ + 1)=
;
++                offsets.array, value.checked_offsets_up_to, index_ + 1)=
;
+             break;
+           }
+         default:
+           /* gvs_get_offset_size() only returns maximum 8 */
+           g_assert_not_reached ();
+         }
++
++      value.checked_offsets_up_to =3D index_;
+     }
+
+   if (index_ > value.ordered_offsets_up_to)
+@@ -916,6 +932,7 @@ gvs_variable_sized_array_is_normal (GVariantSerialis=
ed value)
+
+   /* All offsets have now been checked. */
+   value.ordered_offsets_up_to =3D G_MAXSIZE;
++  value.checked_offsets_up_to =3D G_MAXSIZE;
+
+   return TRUE;
+ }
+@@ -1040,14 +1057,15 @@ gvs_tuple_get_child (GVariantSerialised value,
+    * all the tuple *elements* here, not just all the framing offsets, s=
ince
+    * tuples contain a mix of elements which use framing offsets and one=
s which
+    * don=E2=80=99t. None of them are allowed to overlap. */
+-  if (index_ > value.ordered_offsets_up_to)
++  if (index_ > value.checked_offsets_up_to &&
++      value.ordered_offsets_up_to =3D=3D value.checked_offsets_up_to)
+     {
+       gsize i, prev_i_end =3D 0;
+
+-      if (value.ordered_offsets_up_to > 0)
+-        gvs_tuple_get_member_bounds (value, value.ordered_offsets_up_to=
 - 1, offset_size, NULL, &prev_i_end);
++      if (value.checked_offsets_up_to > 0)
++        gvs_tuple_get_member_bounds (value, value.checked_offsets_up_to=
 - 1, offset_size, NULL, &prev_i_end);
+
+-      for (i =3D value.ordered_offsets_up_to; i <=3D index_; i++)
++      for (i =3D value.checked_offsets_up_to; i <=3D index_; i++)
+         {
+           gsize i_start, i_end;
+
+@@ -1060,6 +1078,7 @@ gvs_tuple_get_child (GVariantSerialised value,
+         }
+
+       value.ordered_offsets_up_to =3D i - 1;
++      value.checked_offsets_up_to =3D index_;
+     }
+
+   if (index_ > value.ordered_offsets_up_to)
+@@ -1257,6 +1276,7 @@ gvs_tuple_is_normal (GVariantSerialised value)
+
+   /* All element bounds have been checked above. */
+   value.ordered_offsets_up_to =3D G_MAXSIZE;
++  value.checked_offsets_up_to =3D G_MAXSIZE;
+
+   {
+     gsize fixed_size;
+diff --git a/glib/gvariant-serialiser.h b/glib/gvariant-serialiser.h
+index 03826f9..2423e01 100644
+--- a/glib/gvariant-serialiser.h
++++ b/glib/gvariant-serialiser.h
+@@ -40,6 +40,15 @@ typedef struct
+    * Even when dealing with tuples, @ordered_offsets_up_to is an elemen=
t index,
+    * rather than an index into the frame offsets. */
+   gsize             ordered_offsets_up_to;
++
++  /* Similar to @ordered_offsets_up_to. This gives the index of the chi=
ld element
++   * whose frame offset is the highest in the offset table which has be=
en
++   * checked so far.
++   *
++   * This is always =E2=89=A5 @ordered_offsets_up_to. It is always an e=
lement index.
++   *
++   * See documentation in gvariant-core.c for `struct GVariant` for det=
ails. */
++  gsize             checked_offsets_up_to;
+ } GVariantSerialised;
+
+ /* deserialization */
+diff --git a/glib/gvariant.c b/glib/gvariant.c
+index 1b1cbdc..2e288af 100644
+--- a/glib/gvariant.c
++++ b/glib/gvariant.c
+@@ -5997,6 +5997,7 @@ g_variant_byteswap (GVariant *value)
+       serialised.data =3D g_malloc (serialised.size);
+       serialised.depth =3D g_variant_get_depth (trusted);
+       serialised.ordered_offsets_up_to =3D G_MAXSIZE;  /* operating on =
the normal form */
++      serialised.checked_offsets_up_to =3D G_MAXSIZE;
+       g_variant_store (trusted, serialised.data);
+       g_variant_unref (trusted);
+
+diff --git a/glib/tests/gvariant.c b/glib/tests/gvariant.c
+index 3ddff96..31a7dde 100644
+--- a/glib/tests/gvariant.c
++++ b/glib/tests/gvariant.c
+@@ -1282,6 +1282,7 @@ random_instance_filler (GVariantSerialised *serial=
ised,
+
+   serialised->depth =3D 0;
+   serialised->ordered_offsets_up_to =3D 0;
++  serialised->checked_offsets_up_to =3D 0;
+
+   g_assert_true (serialised->type_info =3D=3D instance->type_info);
+   g_assert_cmpuint (serialised->size, =3D=3D, instance->size);
+@@ -1449,6 +1450,7 @@ test_maybe (void)
+         serialised.size =3D needed_size;
+         serialised.depth =3D 0;
+	serialised.ordered_offsets_up_to =3D 0;
++	serialised.checked_offsets_up_to =3D 0;
+
+         g_variant_serialiser_serialise (serialised,
+                                         random_instance_filler,
+@@ -1573,6 +1575,7 @@ test_array (void)
+         serialised.size =3D needed_size;
+         serialised.depth =3D 0;
+	serialised.ordered_offsets_up_to =3D 0;
++	serialised.checked_offsets_up_to =3D 0;
+
+         g_variant_serialiser_serialise (serialised, random_instance_fil=
ler,
+                                         (gpointer *) instances, n_child=
ren);
+@@ -1738,6 +1741,7 @@ test_tuple (void)
+         serialised.size =3D needed_size;
+         serialised.depth =3D 0;
+	serialised.ordered_offsets_up_to =3D 0;
++	serialised.checked_offsets_up_to =3D 0;
+
+         g_variant_serialiser_serialise (serialised, random_instance_fil=
ler,
+                                         (gpointer *) instances, n_child=
ren);
+@@ -1835,6 +1839,7 @@ test_variant (void)
+         serialised.size =3D needed_size;
+         serialised.depth =3D 0;
+	serialised.ordered_offsets_up_to =3D 0;
++	serialised.checked_offsets_up_to =3D 0;
+
+         g_variant_serialiser_serialise (serialised, random_instance_fil=
ler,
+                                         (gpointer *) &instance, 1);
+--
+2.40.0
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0009.patc=
h b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0009.patch
new file mode 100644
index 0000000000..7a43b138f3
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0009.patch
@@ -0,0 +1,98 @@
+From 298a537d5f6783e55d87e40011ee3fd3b22b72f9 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@endlessos.org>
+Date: Thu, 17 Aug 2023 01:39:01 +0000
+Subject: [PATCH] gvariant: Zero-initialise various GVariantSerialised ob=
jects
+
+The following few commits will add a couple of new fields to
+`GVariantSerialised`, and they should be zero-filled by default.
+
+Try and pre-empt that a bit by zero-filling `GVariantSerialised` by
+default in a few places.
+
+Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
+
+Helps: #2121
+
+CVE: CVE-2023-32665
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/=
298a537d5f6783e55d87e40011ee3fd3b22b72f9]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ glib/gvariant.c       |  2 +-
+ glib/tests/gvariant.c | 12 ++++++------
+ 2 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/glib/gvariant.c b/glib/gvariant.c
+index 2e288af..30a3280 100644
+--- a/glib/gvariant.c
++++ b/glib/gvariant.c
+@@ -5987,7 +5987,7 @@ g_variant_byteswap (GVariant *value)
+   if (alignment)
+     /* (potentially) contains multi-byte numeric data */
+     {
+-      GVariantSerialised serialised;
++      GVariantSerialised serialised =3D { 0, };
+       GVariant *trusted;
+       GBytes *bytes;
+
+diff --git a/glib/tests/gvariant.c b/glib/tests/gvariant.c
+index 31a7dde..2f33a3e 100644
+--- a/glib/tests/gvariant.c
++++ b/glib/tests/gvariant.c
+@@ -1442,7 +1442,7 @@ test_maybe (void)
+
+     for (flavour =3D 0; flavour < 8; flavour +=3D alignment)
+       {
+-        GVariantSerialised serialised;
++        GVariantSerialised serialised =3D { 0, };
+         GVariantSerialised child;
+
+         serialised.type_info =3D type_info;
+@@ -1568,7 +1568,7 @@ test_array (void)
+
+     for (flavour =3D 0; flavour < 8; flavour +=3D alignment)
+       {
+-        GVariantSerialised serialised;
++        GVariantSerialised serialised =3D { 0, };
+
+         serialised.type_info =3D array_info;
+         serialised.data =3D flavoured_malloc (needed_size, flavour);
+@@ -1734,7 +1734,7 @@ test_tuple (void)
+
+     for (flavour =3D 0; flavour < 8; flavour +=3D alignment)
+       {
+-        GVariantSerialised serialised;
++        GVariantSerialised serialised =3D { 0, };
+
+         serialised.type_info =3D type_info;
+         serialised.data =3D flavoured_malloc (needed_size, flavour);
+@@ -1831,7 +1831,7 @@ test_variant (void)
+
+     for (flavour =3D 0; flavour < 8; flavour +=3D alignment)
+       {
+-        GVariantSerialised serialised;
++        GVariantSerialised serialised =3D { 0, };
+         GVariantSerialised child;
+
+         serialised.type_info =3D type_info;
+@@ -2280,7 +2280,7 @@ serialise_tree (TreeInstance       *tree,
+ static void
+ test_byteswap (void)
+ {
+-  GVariantSerialised one, two;
++  GVariantSerialised one =3D { 0, }, two =3D { 0, };
+   TreeInstance *tree;
+
+   tree =3D tree_instance_new (NULL, 3);
+@@ -2354,7 +2354,7 @@ test_serialiser_children (void)
+ static void
+ test_fuzz (gdouble *fuzziness)
+ {
+-  GVariantSerialised serialised;
++  GVariantSerialised serialised =3D { 0, };
+   TreeInstance *tree;
+
+   /* make an instance */
+--
+2.40.0
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb b/meta/recipes=
-core/glib-2.0/glib-2.0_2.72.3.bb
index b5ab6502a3..b04b5f0a44 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
@@ -17,6 +17,15 @@ SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${P=
V}.tar.xz \
            file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-on=
ly-.patch \
            file://0001-gio-tests-g-file-info-don-t-assume-million-in-one=
-ev.patch \
+           file://CVE-2023-32665-0001.patch \
+           file://CVE-2023-32665-0002.patch \
+           file://CVE-2023-32665-0003.patch \
+           file://CVE-2023-32665-0004.patch \
+           file://CVE-2023-32665-0005.patch \
+           file://CVE-2023-32665-0006.patch \
+           file://CVE-2023-32665-0007.patch \
+           file://CVE-2023-32665-0008.patch \
+           file://CVE-2023-32665-0009.patch \
            "
 SRC_URI:append:class-native =3D " file://relocate-modules.patch"
=20
--=20
2.40.0


