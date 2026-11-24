Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10635.1795490679231587409
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 19:24:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=lWoRdWar;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.180.131, mailfrom: jinwli@qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2kkD93738514;
	Tue, 24 Nov 2026 03:24:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mwN4KH+rMJp7BdXQY94MnvOB4b6GtUAS1vG
	aTolK0TY=; b=lWoRdWarIua1Wt4B2prXBWJXtY3G70Q69U22x542qes6xc9PcEk
	WOS5UjvWZWLmDQBZJ2y+PCx0zhwWnHLJAENbzO3G+QOXuJLXn7phPpskbm7btBVW
	GwAIMtLpuDqbWeeuaI+IGOAlSsRIByW+wVB/UyL806kzMsO/78xbLC3X5HKuS6Ij
	L/I8TV6kBpLbBInpGyvxx6yQ748dg6W8tgHxGNxSJZTHBerIayqiyYZRgp3EZifZ
	0TT4DBql3GOpMNGJ8rV2TbemjEj7/9nymUYRcAXuDT/MdLZiTLiOGbYRnC4oemE2
	Ioc0sjTsIl2hU4TXc6TFB/jJqnSrEzMrWjg==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4m7uuj2n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Nov 2026 03:24:37 +0000 (GMT)
Received: from pps.filterd (aptaippmta01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO3OZ113995727;
	Tue, 24 Nov 2026 03:24:35 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 6AO3OZef3995721
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Nov 2026 03:24:35 +0000 (GMT)
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467392)
	id 1D13B2372B; Tue, 24 Nov 2026 11:24:34 +0800 (CST)
From: Jinwang Li <jinwang.li@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org, yoann.congal@smile.fr
Cc: cheng.jiang@oss.qualcomm.com, wei.deng@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com
Subject: [wrynose][PATCH] bluez5: backport obexd phonebook-dummy and NewMissedCalls fixes
Date: Tue, 24 Nov 2026 11:24:29 +0800
Message-Id: <20261124032429.3477445-1-jinwang.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: hAVCDxK__xSFW7fh5MOmespEfWThdHi_
X-Authority-Analysis: v=2.4 cv=KurYSmWN c=1 sm=1 tr=0 ts=6b050375 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=IUn8tT7Z2qCdTtQOOCMA:9 a=IcQjpISvx0Ct2ArQ:21
X-Proofpoint-GUID: hAVCDxK__xSFW7fh5MOmespEfWThdHi_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAxMyBTYWx0ZWRfXzaeMdkCDzWFN
 rBtiMZKdhUecba0quw2AY7vVOPgIjR709UhEsIxXdrMkZn0+JvkNdwqGNQXUdGIBkMSHycZE6Lb
 hfZR80JP5vpAd2yiKV2IMitoWViCVMY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAxMyBTYWx0ZWRfX2E10815hZk+J
 f8BESkVC848Cb1mou4gV01wI/me/9TEzeL9viQEa01GhQ4OgJXvWNdU1ucZST4NWMphAPkZdn9C
 8Qmgqb1ONzzBPfkOD8bpHpbyel9NY122SybfYUS38ORqmxQzmZm63GeXQrK2IbemcSGfpwsE8Fi
 5hWLBoQ3PhOb+3lZ94XGe4ZEQ5EGBPWVA88Ck5ziRr4zua3fkrrJ5Z7zFRCmkA4jgNdQS4stbi5
 YlK7UksRdTqpnFfZIQlKgne8uMkQWEzSzpAqY1ICak6VtfVksJICt38u8Jd/i3CufIqsrObkAr0
 iMClZJxlerHGasKXSy3SbX237WQUJT5LslxNSvD7lBM36LNljbGk1CMkVLu4jh1qn65XHPfnzqG
 yPsJUrmweG6dTAgUp16SLGh4gUAlN/EsAUYcgBpRmY3pYbsqCKgvS5RAwHPrHIP4cMGvo5GTlIo
 /K7bitxKSUJG9UF7pag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240013
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 03:24:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250940
Content-Type: text/plain; charset="utf-8"

Backport three obexd fixes from upstream:
- Fix FILE* leak in phonebook-dummy
- Fix the size of the PBAP NewMissedCalls parameter (uint8, not uint16)
- Report NewMissedCalls for the mch folder in the dummy backend

Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |   3 +
 ...exd-Fix-FILE-leak-in-phonebook-dummy.patch |  47 ++++++++
 ...ap-Fix-NewMissedCalls-parameter-size.patch | 110 ++++++++++++++++++
 ...d-pbap-Report-NewMissedCalls-for-mch.patch |  74 ++++++++++++
 4 files changed, 234 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-obexd-Fix-FILE-leak-in-phonebook-dummy.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pbap-Fix-NewMissedCalls-parameter-size.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pbap-Report-NewMissedCalls-for-mch.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 7583b34fa6..fd3b5ffbf1 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -84,6 +84,9 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://CVE-2026-19774_p1.patch \
            file://CVE-2026-19774_p2.patch \
            file://0001-avrcp-Abort-continuing-response-on-fragmented-CT-rep.patch \
+           file://0001-obexd-Fix-FILE-leak-in-phonebook-dummy.patch \
+           file://0001-obexd-pbap-Fix-NewMissedCalls-parameter-size.patch \
+           file://0001-obexd-pbap-Report-NewMissedCalls-for-mch.patch \
            "
 S = "${UNPACKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-obexd-Fix-FILE-leak-in-phonebook-dummy.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-obexd-Fix-FILE-leak-in-phonebook-dummy.patch
new file mode 100644
index 0000000000..8eb1233b2c
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-obexd-Fix-FILE-leak-in-phonebook-dummy.patch
@@ -0,0 +1,47 @@
+From b89a1e515dab0c23dde7f15cd264af87dd4a3984 Mon Sep 17 00:00:00 2001
+From: Jinwang Li <jinwang.li@oss.qualcomm.com>
+Date: Wed, 30 Sep 2026 15:39:53 +0800
+Subject: [PATCH 1/3] obexd: Fix FILE* leak in phonebook-dummy
+
+fdopen(fd, "r") transfers ownership of fd to the FILE stream, but the
+loop was calling close(fd) directly instead of fclose(fp), leaking the
+FILE structure and its stdio buffer on every vCard read. Also handle
+fdopen() failure, which was previously unchecked.
+
+Upstream-Status: Backport [https://github.com/bluez/bluez/commit/549f3d50686bbf18f01b949a913ddd10cb6e8b5c]
+Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
+---
+ obexd/plugins/phonebook-dummy.c | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/obexd/plugins/phonebook-dummy.c b/obexd/plugins/phonebook-dummy.c
+index 0dce13f66..188429a21 100644
+--- a/obexd/plugins/phonebook-dummy.c
++++ b/obexd/plugins/phonebook-dummy.c
+@@ -164,6 +164,14 @@ static int foreach_vcard(DIR *dp, vcard_func_t func, uint16_t offset,
+ 		}
+ 
+ 		fp = fdopen(fd, "r");
++		if (fp == NULL) {
++			err = errno;
++			error("fdopen(%s): %s(%d)", filename, strerror(err),
++									err);
++			close(fd);
++			continue;
++		}
++
+ 		v = Parse_MIME_FromFile(fp);
+ 		if (v != NULL) {
+ 			func(filename, v, user_data);
+@@ -171,7 +179,7 @@ static int foreach_vcard(DIR *dp, vcard_func_t func, uint16_t offset,
+ 			n++;
+ 		}
+ 
+-		close(fd);
++		fclose(fp);
+ 	}
+ 
+ 	g_slist_free_full(sorted, g_free);
+-- 
+2.34.1
+
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pbap-Fix-NewMissedCalls-parameter-size.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pbap-Fix-NewMissedCalls-parameter-size.patch
new file mode 100644
index 0000000000..61bb4e3265
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pbap-Fix-NewMissedCalls-parameter-size.patch
@@ -0,0 +1,110 @@
+From a98ad2f9495625b9fd9c1c3c67251db31232b504 Mon Sep 17 00:00:00 2001
+From: Jinwang Li <jinwang.li@oss.qualcomm.com>
+Date: Tue, 27 Oct 2026 15:10:45 +0800
+Subject: [PATCH 2/3] obexd/pbap: Fix NewMissedCalls parameter size
+
+NewMissedCalls is a one-byte apparam, but was encoded with
+g_obex_apparam_set_uint16(). Use uint8 instead, and update the
+phonebook callback type to match.
+
+Fixes: 398d3e23533a ("obexd: Make use of GObexApparam API")
+Upstream-Status: Backport [https://github.com/bluez/bluez/commit/f1af76b9868ef8f7f403d572f07fc533b1908eda]
+Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
+---
+ obexd/plugins/irmc.c              | 4 ++--
+ obexd/plugins/pbap.c              | 8 ++++----
+ obexd/plugins/phonebook-tracker.c | 2 +-
+ obexd/plugins/phonebook.h         | 2 +-
+ 4 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/obexd/plugins/irmc.c b/obexd/plugins/irmc.c
+index cfd8a45d4..b9888bbed 100644
+--- a/obexd/plugins/irmc.c
++++ b/obexd/plugins/irmc.c
+@@ -74,7 +74,7 @@ static const char *owner_vcard =
+ 		"END:VCARD\r\n";
+ 
+ static void phonebook_size_result(const char *buffer, size_t bufsize,
+-					int vcards, int missed,
++					int vcards, uint8_t missed,
+ 					gboolean lastpart, void *user_data)
+ {
+ 	struct irmc_session *irmc = user_data;
+@@ -90,7 +90,7 @@ static void phonebook_size_result(const char *buffer, size_t bufsize,
+ }
+ 
+ static void query_result(const char *buffer, size_t bufsize, int vcards,
+-				int missed, gboolean lastpart, void *user_data)
++			uint8_t missed, gboolean lastpart, void *user_data)
+ {
+ 	struct irmc_session *irmc = user_data;
+ 	const char *s, *t;
+diff --git a/obexd/plugins/pbap.c b/obexd/plugins/pbap.c
+index 74976890d..7c7b324d6 100644
+--- a/obexd/plugins/pbap.c
++++ b/obexd/plugins/pbap.c
+@@ -159,7 +159,7 @@ static void cache_clear(struct cache *cache)
+ }
+ 
+ static void phonebook_size_result(const char *buffer, size_t bufsize,
+-					int vcards, int missed,
++					int vcards, uint8_t missed,
+ 					gboolean lastpart, void *user_data)
+ {
+ 	struct pbap_session *pbap = user_data;
+@@ -186,7 +186,7 @@ static void phonebook_size_result(const char *buffer, size_t bufsize,
+ 		DBG("missed %d", missed);
+ 	}
+ 
+-	pbap->obj->apparam = g_obex_apparam_set_uint16(pbap->obj->apparam,
++	pbap->obj->apparam = g_obex_apparam_set_uint8(pbap->obj->apparam,
+ 							NEWMISSEDCALLS_TAG,
+ 							missed);
+ 
+@@ -194,7 +194,7 @@ static void phonebook_size_result(const char *buffer, size_t bufsize,
+ }
+ 
+ static void query_result(const char *buffer, size_t bufsize, int vcards,
+-				int missed, gboolean lastpart, void *user_data)
++			uint8_t missed, gboolean lastpart, void *user_data)
+ {
+ 	struct pbap_session *pbap = user_data;
+ 
+@@ -224,7 +224,7 @@ static void query_result(const char *buffer, size_t bufsize, int vcards,
+ 		pbap->obj->firstpacket = TRUE;
+ 	}
+ 
+-	pbap->obj->apparam = g_obex_apparam_set_uint16(pbap->obj->apparam,
++	pbap->obj->apparam = g_obex_apparam_set_uint8(pbap->obj->apparam,
+ 							NEWMISSEDCALLS_TAG,
+ 							missed);
+ 
+diff --git a/obexd/plugins/phonebook-tracker.c b/obexd/plugins/phonebook-tracker.c
+index eb7a84f46..2f7411312 100644
+--- a/obexd/plugins/phonebook-tracker.c
++++ b/obexd/plugins/phonebook-tracker.c
+@@ -488,7 +488,7 @@ struct phonebook_data {
+ 	GSList *contacts;
+ 	phonebook_cache_ready_cb ready_cb;
+ 	phonebook_entry_cb entry_cb;
+-	int newmissedcalls;
++	uint8_t newmissedcalls;
+ 	GCancellable *query_canc;
+ 	char *req_name;
+ 	int vcard_part_count;
+diff --git a/obexd/plugins/phonebook.h b/obexd/plugins/phonebook.h
+index c73ae73b8..f3150e1f6 100644
+--- a/obexd/plugins/phonebook.h
++++ b/obexd/plugins/phonebook.h
+@@ -61,7 +61,7 @@ struct apparam_field {
+  * Contacts will be returned in the vcard format.
+  */
+ typedef void (*phonebook_cb) (const char *buffer, size_t bufsize,
+-		int vcards, int missed, gboolean lastpart, void *user_data);
++		int vcards, uint8_t missed, gboolean lastpart, void *user_data);
+ 
+ /*
+  * Interface between the PBAP core and backends to
+-- 
+2.34.1
+
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pbap-Report-NewMissedCalls-for-mch.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pbap-Report-NewMissedCalls-for-mch.patch
new file mode 100644
index 0000000000..f1bc27a7a6
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pbap-Report-NewMissedCalls-for-mch.patch
@@ -0,0 +1,74 @@
+From 810f5a271a5583270287fdb36431d99f8200c09f Mon Sep 17 00:00:00 2001
+From: Jinwang Li <jinwang.li@oss.qualcomm.com>
+Date: Tue, 27 Oct 2026 15:10:46 +0800
+Subject: [PATCH 3/3] obexd/pbap: Report NewMissedCalls for mch
+
+The dummy backend always reports zero NewMissedCalls. Count the
+vCards in the folder instead, capped at UINT8_MAX.
+
+Fixes PTS test PBAP/PSE/PBD/BV-05-C
+
+Upstream-Status: Backport [https://github.com/bluez/bluez/commit/d987dbc0f0817fa7927be174920713dfe2aaff13]
+Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
+---
+ obexd/plugins/phonebook-dummy.c | 23 ++++++++++++++++++++++-
+ 1 file changed, 22 insertions(+), 1 deletion(-)
+
+diff --git a/obexd/plugins/phonebook-dummy.c b/obexd/plugins/phonebook-dummy.c
+index 188429a21..d04cc98e0 100644
+--- a/obexd/plugins/phonebook-dummy.c
++++ b/obexd/plugins/phonebook-dummy.c
+@@ -41,6 +41,7 @@ struct dummy_data {
+ 	char *folder;
+ 	int fd;
+ 	guint id;
++	uint8_t newmissedcalls;
+ };
+ 
+ struct cache_query {
+@@ -244,7 +245,8 @@ static gboolean read_dir(void *user_data)
+ 	closedir(dp);
+ done:
+ 	/* FIXME: Missing vCards fields filtering */
+-	dummy->cb(buffer->str, buffer->len, count, 0, TRUE, dummy->user_data);
++	dummy->cb(buffer->str, buffer->len, count, dummy->newmissedcalls,
++							TRUE, dummy->user_data);
+ 
+ 	g_string_free(buffer, TRUE);
+ 
+@@ -360,6 +362,22 @@ static gboolean is_dir(const char *dir)
+ 	return S_ISDIR(st.st_mode);
+ }
+ 
++static uint8_t count_vcards(const char *folder)
++{
++	DIR *dp;
++	uint16_t count = 0;
++
++	dp = opendir(folder);
++	if (dp == NULL)
++		return 0;
++
++	foreach_vcard(dp, NULL, 0, UINT8_MAX, NULL, &count);
++
++	closedir(dp);
++
++	return count;
++}
++
+ char *phonebook_set_folder(const char *current_folder,
+ 		const char *new_folder, uint8_t flags, int *err)
+ {
+@@ -490,6 +508,9 @@ void *phonebook_pull(const char *name, const struct apparam_field *params,
+ 	dummy->folder = folder;
+ 	dummy->fd = -1;
+ 
++	if (g_strcmp0(name, PB_CALLS_MISSED) == 0)
++		dummy->newmissedcalls = count_vcards(folder);
++
+ 	if (err)
+ 		*err = 0;
+ 
+-- 
+2.34.1
+
-- 
2.34.1

