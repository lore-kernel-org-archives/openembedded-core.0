Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99FA1EB64D7
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 12:11:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6780.1686917453118811272
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jun 2023 05:10:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=J88vlwWt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=55315b4ca9=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35GApK5k005855
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 12:10:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=IeG2T8oFY+OC954s5uvSwZt/LJ+Re8z8/pLpfCzW9FQ=;
 b=J88vlwWtvIVGwujxMsZthw7uRaKpeqTGTUlFFN4/w8UPYFz25DyjrhTH/0Xh/YBtDbLl
 zHc4QQYwKN0zGoUGjqrw3XwOy8oaRGfcmVAYGSAx5YKPmE2qCixy637z2MH2AcS7nDA+
 eJ6ehQl1xBPpUbJQzxZ5nju4LBA3LcoQR9os5e/q+H+Gqgit8A8LUgpUKhhuiAfCgzY4
 4cvsoB9bzZzCXt3uxuyAsy2kme+ILwAfb/b+o9vFljFrTIPP5uoUHrz3noSOXgC3Zdcb
 ivf5E6iEFFmela5xEhuLrrQmldEFFDw85vvV6lK6Pdz/UnliWAjR6ZakMm8ICjUgJOTS Mg== 
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r4ed064na-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 12:10:52 +0000
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 16 Jun 2023 05:10:48 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>
Subject: [oe][meta-networking][kirkstone][PATCH V2 1/1] samba: fix CVE-2022-3437
Date: Fri, 16 Jun 2023 12:10:36 +0000
Message-ID: <20230616121036.3592064-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: ieWvQbRGINzQWQmWMyTstJMfQjAwkOmP
X-Proofpoint-ORIG-GUID: ieWvQbRGINzQWQmWMyTstJMfQjAwkOmP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-16_07,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 adultscore=0 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306160109
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 12:11:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183012

A heap-based buffer overflow vulnerability was found in Samba within
the GSSAPI unwrap_des() and unwrap_des3() routines of Heimdal. The
DES and Triple-DES decryption routines in the Heimdal GSSAPI library
allow a length-limited write buffer overflow on malloc() allocated
memory when presented with a maliciously small packet. This flaw
allows a remote user to send specially crafted malicious data to the
application, possibly resulting in a denial of service (DoS) attack.

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-3437

Upstream patches:
https://github.com/heimdal/heimdal/commit/f6edaafcfefd843ca1b1a041f942a853d85ee7c3
https://github.com/heimdal/heimdal/commit/c9cc34334bd64b08fe91a2f720262462e9f6bb49
https://github.com/heimdal/heimdal/commit/a587a4bcb28d5b9047f332573b1e7c8f89ca3edd
https://github.com/heimdal/heimdal/commit/c758910eaad3c0de2cfb68830a661c4739675a7d
https://github.com/heimdal/heimdal/commit/414b2a77fd61c26d64562e3800dc5578d9d0f15d
https://github.com/heimdal/heimdal/commit/be9bbd93ed8f204b4bc1b92d1bc3c16aac194696
https://github.com/heimdal/heimdal/commit/c8407ca079294d76a5ed140ba5b546f870d23ed2
https://github.com/heimdal/heimdal/commit/8fb508a25a6a47289c73e3f4339352a73a396eef

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../samba/samba/CVE-2022-3437-0001.patch      | 77 +++++++++++++++++++
 .../samba/samba/CVE-2022-3437-0002.patch      | 35 +++++++++
 .../samba/samba/CVE-2022-3437-0003.patch      | 50 ++++++++++++
 .../samba/samba/CVE-2022-3437-0004.patch      | 57 ++++++++++++++
 .../samba/samba/CVE-2022-3437-0005.patch      | 37 +++++++++
 .../samba/samba/CVE-2022-3437-0006.patch      | 65 ++++++++++++++++
 .../samba/samba/CVE-2022-3437-0007.patch      | 39 ++++++++++
 .../samba/samba/CVE-2022-3437-0008.patch      | 48 ++++++++++++
 .../samba/samba_4.14.14.bb                    |  8 ++
 9 files changed, 416 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0001.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0002.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0003.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0004.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0005.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0006.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0007.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0008.patch

diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0001.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0001.patch
new file mode 100644
index 000000000..abc778b73
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0001.patch
@@ -0,0 +1,77 @@
+From f6edaafcfefd843ca1b1a041f942a853d85ee7c3 Mon Sep 17 00:00:00 2001
+From: Joseph Sutton <josephsutton@catalyst.net.nz>
+Date: Wed, 12 Oct 2022 13:57:13 +1300
+Subject: [PATCH] gsskrb5: CVE-2022-3437 Use constant-time memcmp() for arcfour
+ unwrap
+
+Samba BUG: https://bugzilla.samba.org/show_bug.cgi?id=15134
+
+Signed-off-by: Joseph Sutton <josephsutton@catalyst.net.nz>
+Reviewed-by: Andrew Bartlett <abartlet@samba.org>
+
+Upstream-Status: Backport [https://github.com/heimdal/heimdal/commit/f6edaafcfefd843ca1b1a041f942a853d85ee7c3]
+CVE: CVE-2022-3437
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ lib/gssapi/krb5/arcfour.c | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/lib/gssapi/krb5/arcfour.c b/lib/gssapi/krb5/arcfour.c
+index a61f768..4fc46ce 100644
+--- a/lib/gssapi/krb5/arcfour.c
++++ b/lib/gssapi/krb5/arcfour.c
+@@ -365,7 +365,7 @@ _gssapi_verify_mic_arcfour(OM_uint32 * minor_status,
+	return GSS_S_FAILURE;
+     }
+
+-    cmp = ct_memcmp(cksum_data, p + 8, 8);
++    cmp = (ct_memcmp(cksum_data, p + 8, 8) == 0);
+     if (cmp) {
+	*minor_status = 0;
+	return GSS_S_BAD_MIC;
+@@ -385,9 +385,9 @@ _gssapi_verify_mic_arcfour(OM_uint32 * minor_status,
+     _gsskrb5_decode_be_om_uint32(SND_SEQ, &seq_number);
+
+     if (context_handle->more_flags & LOCAL)
+-	cmp = memcmp(&SND_SEQ[4], "\xff\xff\xff\xff", 4);
++	cmp = (ct_memcmp(&SND_SEQ[4], "\xff\xff\xff\xff", 4) != 0);
+     else
+-	cmp = memcmp(&SND_SEQ[4], "\x00\x00\x00\x00", 4);
++	cmp = (ct_memcmp(&SND_SEQ[4], "\x00\x00\x00\x00", 4) != 0);
+
+     memset(SND_SEQ, 0, sizeof(SND_SEQ));
+     if (cmp != 0) {
+@@ -656,9 +656,9 @@ OM_uint32 _gssapi_unwrap_arcfour(OM_uint32 *minor_status,
+     _gsskrb5_decode_be_om_uint32(SND_SEQ, &seq_number);
+
+     if (context_handle->more_flags & LOCAL)
+-	cmp = memcmp(&SND_SEQ[4], "\xff\xff\xff\xff", 4);
++	cmp = (ct_memcmp(&SND_SEQ[4], "\xff\xff\xff\xff", 4) != 0);
+     else
+-	cmp = memcmp(&SND_SEQ[4], "\x00\x00\x00\x00", 4);
++	cmp = (ct_memcmp(&SND_SEQ[4], "\x00\x00\x00\x00", 4) != 0);
+
+     if (cmp != 0) {
+	*minor_status = 0;
+@@ -730,7 +730,7 @@ OM_uint32 _gssapi_unwrap_arcfour(OM_uint32 *minor_status,
+	return GSS_S_FAILURE;
+     }
+
+-    cmp = ct_memcmp(cksum_data, p0 + 16, 8); /* SGN_CKSUM */
++    cmp = (ct_memcmp(cksum_data, p0 + 16, 8) == 0); /* SGN_CKSUM */
+     if (cmp) {
+	_gsskrb5_release_buffer(minor_status, output_message_buffer);
+	*minor_status = 0;
+@@ -1266,9 +1266,9 @@ _gssapi_unwrap_iov_arcfour(OM_uint32 *minor_status,
+     _gsskrb5_decode_be_om_uint32(snd_seq, &seq_number);
+
+     if (ctx->more_flags & LOCAL) {
+-	cmp = memcmp(&snd_seq[4], "\xff\xff\xff\xff", 4);
++	cmp = (ct_memcmp(&snd_seq[4], "\xff\xff\xff\xff", 4) != 0);
+     } else {
+-	cmp = memcmp(&snd_seq[4], "\x00\x00\x00\x00", 4);
++	cmp = (ct_memcmp(&snd_seq[4], "\x00\x00\x00\x00", 4) != 0);
+     }
+     if (cmp != 0) {
+	*minor_status = 0;
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0002.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0002.patch
new file mode 100644
index 000000000..5686df78e
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0002.patch
@@ -0,0 +1,35 @@
+From c9cc34334bd64b08fe91a2f720262462e9f6bb49 Mon Sep 17 00:00:00 2001
+From: Joseph Sutton <josephsutton@catalyst.net.nz>
+Date: Wed, 12 Oct 2022 13:57:55 +1300
+Subject: [PATCH] gsskrb5: CVE-2022-3437 Use constant-time memcmp() in
+ unwrap_des3()
+
+The surrounding checks all use ct_memcmp(), so this one was presumably
+meant to as well.
+
+Samba BUG: https://bugzilla.samba.org/show_bug.cgi?id=15134
+
+Signed-off-by: Joseph Sutton <josephsutton@catalyst.net.nz>
+Reviewed-by: Andrew Bartlett <abartlet@samba.org>
+
+Upstream-Status: Backport [https://github.com/heimdal/heimdal/commit/c9cc34334bd64b08fe91a2f720262462e9f6bb49]
+CVE: CVE-2022-3437
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ lib/gssapi/krb5/unwrap.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/gssapi/krb5/unwrap.c b/lib/gssapi/krb5/unwrap.c
+index da939c0529..61a341ee43 100644
+--- a/lib/gssapi/krb5/unwrap.c
++++ b/lib/gssapi/krb5/unwrap.c
+@@ -227,7 +227,7 @@ unwrap_des3
+   if (ret)
+       return ret;
+
+-  if (memcmp (p, "\x04\x00", 2) != 0) /* HMAC SHA1 DES3_KD */
++  if (ct_memcmp (p, "\x04\x00", 2) != 0) /* HMAC SHA1 DES3_KD */
+     return GSS_S_BAD_SIG;
+   p += 2;
+   if (ct_memcmp (p, "\x02\x00", 2) == 0) {
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0003.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0003.patch
new file mode 100644
index 000000000..55239356e
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0003.patch
@@ -0,0 +1,50 @@
+From a587a4bcb28d5b9047f332573b1e7c8f89ca3edd Mon Sep 17 00:00:00 2001
+From: Joseph Sutton <josephsutton@catalyst.net.nz>
+Date: Wed, 12 Oct 2022 13:57:42 +1300
+Subject: [PATCH] gsskrb5: CVE-2022-3437 Don't pass NULL pointers to memcpy()
+ in DES unwrap
+
+Samba BUG: https://bugzilla.samba.org/show_bug.cgi?id=15134
+
+Signed-off-by: Joseph Sutton <josephsutton@catalyst.net.nz>
+Reviewed-by: Andrew Bartlett <abartlet@samba.org>
+
+Upstream-Status: Backport [https://github.com/heimdal/heimdal/commit/a587a4bcb28d5b9047f332573b1e7c8f89ca3edd]
+CVE: CVE-2022-3437
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ lib/gssapi/krb5/unwrap.c | 14 ++++++++------
+ 1 file changed, 8 insertions(+), 6 deletions(-)
+
+diff --git a/lib/gssapi/krb5/unwrap.c b/lib/gssapi/krb5/unwrap.c
+index 61a341ee43..d3987240dd 100644
+--- a/lib/gssapi/krb5/unwrap.c
++++ b/lib/gssapi/krb5/unwrap.c
+@@ -180,9 +180,10 @@ unwrap_des
+   output_message_buffer->value  = malloc(output_message_buffer->length);
+   if(output_message_buffer->length != 0 && output_message_buffer->value == NULL)
+       return GSS_S_FAILURE;
+-  memcpy (output_message_buffer->value,
+-	  p + 24,
+-	  output_message_buffer->length);
++  if (output_message_buffer->value != NULL)
++      memcpy (output_message_buffer->value,
++	      p + 24,
++	      output_message_buffer->length);
+   return GSS_S_COMPLETE;
+ }
+ #endif
+@@ -374,9 +375,10 @@ unwrap_des3
+   output_message_buffer->value  = malloc(output_message_buffer->length);
+   if(output_message_buffer->length != 0 && output_message_buffer->value == NULL)
+       return GSS_S_FAILURE;
+-  memcpy (output_message_buffer->value,
+-	  p + 36,
+-	  output_message_buffer->length);
++  if (output_message_buffer->value != NULL)
++      memcpy (output_message_buffer->value,
++	      p + 36,
++	      output_message_buffer->length);
+   return GSS_S_COMPLETE;
+ }
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0004.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0004.patch
new file mode 100644
index 000000000..4e750f0dc
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0004.patch
@@ -0,0 +1,57 @@
+From c758910eaad3c0de2cfb68830a661c4739675a7d Mon Sep 17 00:00:00 2001
+From: Joseph Sutton <josephsutton@catalyst.net.nz>
+Date: Mon, 15 Aug 2022 16:53:45 +1200
+Subject: [PATCH] gsskrb5: CVE-2022-3437 Avoid undefined behaviour in
+ _gssapi_verify_pad()
+
+By decrementing 'pad' only when we know it's safe, we ensure we can't
+stray backwards past the start of a buffer, which would be undefined
+behaviour.
+
+In the previous version of the loop, 'i' is the number of bytes left to
+check, and 'pad' is the current byte we're checking. 'pad' was
+decremented at the end of each loop iteration. If 'i' was 1 (so we
+checked the final byte), 'pad' could potentially be pointing to the
+first byte of the input buffer, and the decrement would put it one
+byte behind the buffer.
+
+That would be undefined behaviour.
+
+The patch changes it so that 'pad' is the byte we previously checked,
+which allows us to ensure that we only decrement it when we know we
+have a byte to check.
+
+Samba BUG: https://bugzilla.samba.org/show_bug.cgi?id=15134
+
+Signed-off-by: Joseph Sutton <josephsutton@catalyst.net.nz>
+Reviewed-by: Andrew Bartlett <abartlet@samba.org>
+
+Upstream-Status: Backport [https://github.com/heimdal/heimdal/commit/c758910eaad3c0de2cfb68830a661c4739675a7d]
+CVE: CVE-2022-3437
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ lib/gssapi/krb5/decapsulate.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/lib/gssapi/krb5/decapsulate.c b/lib/gssapi/krb5/decapsulate.c
+index 86085f5695..4e3fcd659e 100644
+--- a/lib/gssapi/krb5/decapsulate.c
++++ b/lib/gssapi/krb5/decapsulate.c
+@@ -193,13 +193,13 @@ _gssapi_verify_pad(gss_buffer_t wrapped_token,
+     if (wrapped_token->length < 1)
+	return GSS_S_BAD_MECH;
+
+-    pad = (u_char *)wrapped_token->value + wrapped_token->length - 1;
+-    padlength = *pad;
++    pad = (u_char *)wrapped_token->value + wrapped_token->length;
++    padlength = pad[-1];
+
+     if (padlength > datalen)
+	return GSS_S_BAD_MECH;
+
+-    for (i = padlength; i > 0 && *pad == padlength; i--, pad--)
++    for (i = padlength; i > 0 && *--pad == padlength; i--)
+	;
+     if (i != 0)
+	return GSS_S_BAD_MIC;
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0005.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0005.patch
new file mode 100644
index 000000000..d6ea22e3d
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0005.patch
@@ -0,0 +1,37 @@
+From 414b2a77fd61c26d64562e3800dc5578d9d0f15d Mon Sep 17 00:00:00 2001
+From: Joseph Sutton <josephsutton@catalyst.net.nz>
+Date: Mon, 15 Aug 2022 16:53:55 +1200
+Subject: [PATCH] gsskrb5: CVE-2022-3437 Check the result of
+ _gsskrb5_get_mech()
+
+We should make sure that the result of 'total_len - mech_len' won't
+overflow, and that we don't memcmp() past the end of the buffer.
+
+Samba BUG: https://bugzilla.samba.org/show_bug.cgi?id=15134
+
+Signed-off-by: Joseph Sutton <josephsutton@catalyst.net.nz>
+Reviewed-by: Andrew Bartlett <abartlet@samba.org>
+
+Upstream-Status: Backport [https://github.com/heimdal/heimdal/commit/414b2a77fd61c26d64562e3800dc5578d9d0f15d]
+CVE: CVE-2022-3437
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ lib/gssapi/krb5/decapsulate.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/lib/gssapi/krb5/decapsulate.c b/lib/gssapi/krb5/decapsulate.c
+index 4e3fcd659e..031a621eab 100644
+--- a/lib/gssapi/krb5/decapsulate.c
++++ b/lib/gssapi/krb5/decapsulate.c
+@@ -80,6 +80,10 @@ _gssapi_verify_mech_header(u_char **str,
+
+     if (mech_len != mech->length)
+	return GSS_S_BAD_MECH;
++    if (mech_len > total_len)
++	return GSS_S_BAD_MECH;
++    if (p - *str > total_len - mech_len)
++	return GSS_S_BAD_MECH;
+     if (ct_memcmp(p,
+		  mech->elements,
+		  mech->length) != 0)
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0006.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0006.patch
new file mode 100644
index 000000000..9fa59c29b
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0006.patch
@@ -0,0 +1,65 @@
+From be9bbd93ed8f204b4bc1b92d1bc3c16aac194696 Mon Sep 17 00:00:00 2001
+From: Joseph Sutton <josephsutton@catalyst.net.nz>
+Date: Mon, 15 Aug 2022 16:54:23 +1200
+Subject: [PATCH] gsskrb5: CVE-2022-3437 Check buffer length against overflow
+ for DES{,3} unwrap
+
+Samba BUG: https://bugzilla.samba.org/show_bug.cgi?id=15134
+
+Signed-off-by: Joseph Sutton <josephsutton@catalyst.net.nz>
+Reviewed-by: Andrew Bartlett <abartlet@samba.org>
+
+Upstream-Status: Backport [https://github.com/heimdal/heimdal/commit/be9bbd93ed8f204b4bc1b92d1bc3c16aac194696]
+CVE: CVE-2022-3437
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ lib/gssapi/krb5/unwrap.c | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/lib/gssapi/krb5/unwrap.c b/lib/gssapi/krb5/unwrap.c
+index d3987240dd..fddb64bc53 100644
+--- a/lib/gssapi/krb5/unwrap.c
++++ b/lib/gssapi/krb5/unwrap.c
+@@ -64,6 +64,8 @@ unwrap_des
+
+   if (IS_DCE_STYLE(context_handle)) {
+      token_len = 22 + 8 + 15; /* 45 */
++     if (input_message_buffer->length < token_len)
++	  return GSS_S_BAD_MECH;
+   } else {
+      token_len = input_message_buffer->length;
+   }
+@@ -76,6 +78,11 @@ unwrap_des
+   if (ret)
+       return ret;
+
++  len = (p - (u_char *)input_message_buffer->value)
++      + 22 + 8;
++  if (input_message_buffer->length < len)
++      return GSS_S_BAD_MECH;
++
+   if (memcmp (p, "\x00\x00", 2) != 0)
+     return GSS_S_BAD_SIG;
+   p += 2;
+@@ -216,6 +223,8 @@ unwrap_des3
+
+   if (IS_DCE_STYLE(context_handle)) {
+      token_len = 34 + 8 + 15; /* 57 */
++     if (input_message_buffer->length < token_len)
++	  return GSS_S_BAD_MECH;
+   } else {
+      token_len = input_message_buffer->length;
+   }
+@@ -228,6 +237,11 @@ unwrap_des3
+   if (ret)
+       return ret;
+
++  len = (p - (u_char *)input_message_buffer->value)
++      + 34 + 8;
++  if (input_message_buffer->length < len)
++      return GSS_S_BAD_MECH;
++
+   if (ct_memcmp (p, "\x04\x00", 2) != 0) /* HMAC SHA1 DES3_KD */
+     return GSS_S_BAD_SIG;
+   p += 2;
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0007.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0007.patch
new file mode 100644
index 000000000..b3197afc3
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0007.patch
@@ -0,0 +1,39 @@
+From c8407ca079294d76a5ed140ba5b546f870d23ed2 Mon Sep 17 00:00:00 2001
+From: Joseph Sutton <josephsutton@catalyst.net.nz>
+Date: Mon, 10 Oct 2022 20:33:09 +1300
+Subject: [PATCH] gsskrb5: CVE-2022-3437 Check for overflow in
+ _gsskrb5_get_mech()
+
+If len_len is equal to total_len - 1 (i.e. the input consists only of a
+0x60 byte and a length), the expression 'total_len - 1 - len_len - 1',
+used as the 'len' parameter to der_get_length(), will overflow to
+SIZE_MAX. Then der_get_length() will proceed to read, unconstrained,
+whatever data follows in memory. Add a check to ensure that doesn't
+happen.
+
+Samba BUG: https://bugzilla.samba.org/show_bug.cgi?id=15134
+
+Signed-off-by: Joseph Sutton <josephsutton@catalyst.net.nz>
+Reviewed-by: Andrew Bartlett <abartlet@samba.org>
+
+Upstream-Status: Backport [https://github.com/heimdal/heimdal/commit/c8407ca079294d76a5ed140ba5b546f870d23ed2]
+CVE: CVE-2022-3437
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ lib/gssapi/krb5/decapsulate.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lib/gssapi/krb5/decapsulate.c b/lib/gssapi/krb5/decapsulate.c
+index 031a621eab..d7b75a6422 100644
+--- a/lib/gssapi/krb5/decapsulate.c
++++ b/lib/gssapi/krb5/decapsulate.c
+@@ -54,6 +54,8 @@ _gsskrb5_get_mech (const u_char *ptr,
+     e = der_get_length (p, total_len - 1, &len, &len_len);
+     if (e || 1 + len_len + len != total_len)
+	return -1;
++    if (total_len < 1 + len_len + 1)
++	return -1;
+     p += len_len;
+     if (*p++ != 0x06)
+	return -1;
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0008.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0008.patch
new file mode 100644
index 000000000..6d6431221
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0008.patch
@@ -0,0 +1,48 @@
+From 8fb508a25a6a47289c73e3f4339352a73a396eef Mon Sep 17 00:00:00 2001
+From: Joseph Sutton <josephsutton@catalyst.net.nz>
+Date: Wed, 12 Oct 2022 13:57:33 +1300
+Subject: [PATCH] gsskrb5: CVE-2022-3437 Pass correct length to
+ _gssapi_verify_pad()
+
+We later subtract 8 when calculating the length of the output message
+buffer. If padlength is excessively high, this calculation can underflow
+and result in a very large positive value.
+
+Now we properly constrain the value of padlength so underflow shouldn't
+be possible.
+
+Samba BUG: https://bugzilla.samba.org/show_bug.cgi?id=15134
+
+Signed-off-by: Joseph Sutton <josephsutton@catalyst.net.nz>
+Reviewed-by: Andrew Bartlett <abartlet@samba.org>
+
+Upstream-Status: Backport [https://github.com/heimdal/heimdal/commit/8fb508a25a6a47289c73e3f4339352a73a396eef]
+CVE: CVE-2022-3437
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ lib/gssapi/krb5/unwrap.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/gssapi/krb5/unwrap.c b/lib/gssapi/krb5/unwrap.c
+index fddb64bc53..bab30f4501 100644
+--- a/lib/gssapi/krb5/unwrap.c
++++ b/lib/gssapi/krb5/unwrap.c
+@@ -124,7 +124,7 @@ unwrap_des
+   } else {
+     /* check pad */
+     ret = _gssapi_verify_pad(input_message_buffer,
+-			     input_message_buffer->length - len,
++			     input_message_buffer->length - len - 8,
+			     &padlength);
+     if (ret)
+         return ret;
+@@ -289,7 +289,7 @@ unwrap_des3
+   } else {
+     /* check pad */
+     ret = _gssapi_verify_pad(input_message_buffer,
+-			     input_message_buffer->length - len,
++			     input_message_buffer->length - len - 8,
+			     &padlength);
+     if (ret)
+         return ret;
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
index 53526a26b..39ba85194 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
@@ -22,6 +22,14 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://0005-samba-build-dnsserver_common-code.patch \
            file://0001-Fix-pyext_PATTERN-for-cross-compilation.patch \
            file://0001-smbtorture-skip-test-case-tfork_cmd_send.patch \
+           file://CVE-2022-3437-0001.patch;patchdir=source4/heimdal \
+           file://CVE-2022-3437-0002.patch;patchdir=source4/heimdal \
+           file://CVE-2022-3437-0003.patch;patchdir=source4/heimdal \
+           file://CVE-2022-3437-0004.patch;patchdir=source4/heimdal \
+           file://CVE-2022-3437-0005.patch;patchdir=source4/heimdal \
+           file://CVE-2022-3437-0006.patch;patchdir=source4/heimdal \
+           file://CVE-2022-3437-0007.patch;patchdir=source4/heimdal \
+           file://CVE-2022-3437-0008.patch;patchdir=source4/heimdal \
            "
 
 SRC_URI:append:libc-musl = " \
-- 
2.40.0


