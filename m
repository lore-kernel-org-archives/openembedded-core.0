Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BA3CC25B75
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 05:54:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7712.1715752442306035487
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 May 2024 22:54:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5865944998=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44EME6xg018472
	for <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 05:54:01 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3y1yn53ttr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 05:54:01 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 14 May 2024 22:53:58 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/1] bluez5: Fix CVE-2023-50230, CVE-2023-50229 and CVE-2023-27349
Date: Wed, 15 May 2024 05:53:38 +0000
Message-ID: <20240515055338.788503-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: Si4wkPrtiTaN-PQhSR0B3OL8S2ky1yfX
X-Proofpoint-ORIG-GUID: Si4wkPrtiTaN-PQhSR0B3OL8S2ky1yfX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-15_02,2024-05-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405150039
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 05:54:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199270

From: Soumya Sambu <soumya.sambu@windriver.com>

CVE-2023-50230:
BlueZ Phone Book Access Profile Heap-based Buffer Overflow Remote Code
Execution Vulnerability. This vulnerability allows network-adjacent
attackers to execute arbitrary code on affected installations of BlueZ.
User interaction is required to exploit this vulnerability in that the
target must connect to a malicious Bluetooth device. The specific flaw
exists within the handling of the Phone Book Access profile. The issue
results from the lack of proper validation of the length of user-supplied
data prior to copying it to a fixed-length heap-based buffer. An attacker
can leverage this vulnerability to execute code in the context of root.
Was ZDI-CAN-20938.

CVE-2023-50229:
BlueZ Phone Book Access Profile Heap-based Buffer Overflow Remote Code
Execution Vulnerability. This vulnerability allows network-adjacent
attackers to execute arbitrary code on affected installations of BlueZ.
User interaction is required to exploit this vulnerability in that the
target must connect to a malicious Bluetooth device. The specific flaw
exists within the handling of the Phone Book Access profile. The issue
results from the lack of proper validation of the length of user-supplied
data prior to copying it to a fixed-length heap-based buffer. An attacker
can leverage this vulnerability to execute code in the context of root.
Was ZDI-CAN-20936.

CVE-2023-27349:
BlueZ Audio Profile AVRCP Improper Validation of Array Index Remote Code
Execution Vulnerability. This vulnerability allows network-adjacent
attackers to execute arbitrary code via Bluetooth on affected installations
of BlueZ. User interaction is required to exploit this vulnerability in
that the target must connect to a malicious device. The specific flaw
exists within the handling of the AVRCP protocol. The issue results from
the lack of proper validation of user-supplied data, which can result in a
write past the end of an allocated buffer. An attacker can leverage this
vulnerability to execute code in the context of root. Was ZDI-CAN-19908.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-50230
https://nvd.nist.gov/vuln/detail/CVE-2023-50229
https://nvd.nist.gov/vuln/detail/CVE-2023-27349

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  4 +-
 .../bluez5/bluez5/CVE-2023-27349.patch        | 52 ++++++++++++++
 .../CVE-2023-50230-CVE-2023-50229.patch       | 71 +++++++++++++++++++
 3 files changed, 126 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/CVE-2023-27349.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/CVE-2023-50230-CVE-2023-50229.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 7786b65670..a752975b3a 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -54,7 +54,9 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'file://0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch', d)} \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
            file://0001-test-gatt-Fix-hung-issue.patch \
-	   file://CVE-2023-45866.patch \
+           file://CVE-2023-45866.patch \
+           file://CVE-2023-50230-CVE-2023-50229.patch \
+           file://CVE-2023-27349.patch \
            "
 S = "${WORKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/CVE-2023-27349.patch b/meta/recipes-connectivity/bluez5/bluez5/CVE-2023-27349.patch
new file mode 100644
index 0000000000..26edb3a5cb
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/CVE-2023-27349.patch
@@ -0,0 +1,52 @@
+From f54299a850676d92c3dafd83e9174fcfe420ccc9 Mon Sep 17 00:00:00 2001
+From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
+Date: Wed, 22 Mar 2023 11:34:24 -0700
+Subject: [PATCH] avrcp: Fix crash while handling unsupported events
+
+The following crash can be observed if the remote peer send and
+unsupported event:
+
+ERROR: AddressSanitizer: heap-use-after-free on address 0x60b000148f11
+ at pc 0x559644552088 bp 0x7ffe28b3c7b0 sp 0x7ffe28b3c7a0
+ WRITE of size 1 at 0x60b000148f11 thread T0
+     #0 0x559644552087 in avrcp_handle_event profiles/audio/avrcp.c:3907
+     #1 0x559644536c22 in control_response profiles/audio/avctp.c:939
+     #2 0x5596445379ab in session_cb profiles/audio/avctp.c:1108
+     #3 0x7fbcb3e51c43 in g_main_context_dispatch (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x55c43)
+     #4 0x7fbcb3ea66c7  (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0xaa6c7)
+     #5 0x7fbcb3e512b2 in g_main_loop_run (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x552b2)
+     #6 0x559644754ab6 in mainloop_run src/shared/mainloop-glib.c:66
+     #7 0x559644755606 in mainloop_run_with_signal src/shared/mainloop-notify.c:188
+     #8 0x5596445bb963 in main src/main.c:1289
+     #9 0x7fbcb3bafd8f in __libc_start_call_main ../sysdeps/nptl/libc_start_call_main.h:58
+     #10 0x7fbcb3bafe3f in __libc_start_main_impl ../csu/libc-start.c:392
+     #11 0x5596444e8224 in _start (/usr/local/libexec/bluetooth/bluetoothd+0xf0224)
+
+CVE: CVE-2023-27349
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=f54299a850676d92c3dafd83e9174fcfe420ccc9]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ profiles/audio/avrcp.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/profiles/audio/avrcp.c b/profiles/audio/avrcp.c
+index 80f34c7..dda9a30 100644
+--- a/profiles/audio/avrcp.c
++++ b/profiles/audio/avrcp.c
+@@ -3901,6 +3901,12 @@ static gboolean avrcp_handle_event(struct avctp *conn, uint8_t code,
+	case AVRCP_EVENT_UIDS_CHANGED:
+		avrcp_uids_changed(session, pdu);
+		break;
++	default:
++		if (event > AVRCP_EVENT_LAST) {
++			warn("Unsupported event: %u", event);
++			return FALSE;
++		}
++		break;
+	}
+
+	session->registered_events |= (1 << event);
+--
+2.40.0
diff --git a/meta/recipes-connectivity/bluez5/bluez5/CVE-2023-50230-CVE-2023-50229.patch b/meta/recipes-connectivity/bluez5/bluez5/CVE-2023-50230-CVE-2023-50229.patch
new file mode 100644
index 0000000000..5d44d78469
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/CVE-2023-50230-CVE-2023-50229.patch
@@ -0,0 +1,71 @@
+From 5ab5352531a9cc7058cce569607f3a6831464443 Mon Sep 17 00:00:00 2001
+From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
+Date: Tue, 19 Sep 2023 12:14:01 -0700
+Subject: [PATCH] pbap: Fix not checking Primary/Secundary Counter length
+
+Primary/Secundary Counters are supposed to be 16 bytes values, if the
+server has implemented them incorrectly it may lead to the following
+crash:
+
+=================================================================
+==31860==ERROR: AddressSanitizer: heap-buffer-overflow on address
+0x607000001878 at pc 0x7f95a1575638 bp 0x7fff58c6bb80 sp 0x7fff58c6b328
+
+ READ of size 48 at 0x607000001878 thread T0
+     #0 0x7f95a1575637 in MemcmpInterceptorCommon(void*, int (*)(void const*, void const*, unsigned long), void const*, void const*, unsigned long) ../../../../src/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc:860
+     #1 0x7f95a1575ba6 in __interceptor_memcmp ../../../../src/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc:892
+     #2 0x7f95a1575ba6 in __interceptor_memcmp ../../../../src/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc:887
+     #3 0x564df69c77a0 in read_version obexd/client/pbap.c:288
+     #4 0x564df69c77a0 in read_return_apparam obexd/client/pbap.c:352
+     #5 0x564df69c77a0 in phonebook_size_callback obexd/client/pbap.c:374
+     #6 0x564df69bea3c in session_terminate_transfer obexd/client/session.c:921
+     #7 0x564df69d56b0 in get_xfer_progress_first obexd/client/transfer.c:729
+     #8 0x564df698b9ee in handle_response gobex/gobex.c:1140
+     #9 0x564df698cdea in incoming_data gobex/gobex.c:1385
+     #10 0x7f95a12fdc43 in g_main_context_dispatch (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x55c43)
+     #11 0x7f95a13526c7  (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0xaa6c7)
+     #12 0x7f95a12fd2b2 in g_main_loop_run (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x552b2)
+     #13 0x564df6977d41 in main obexd/src/main.c:307
+     #14 0x7f95a10a7d8f in __libc_start_call_main ../sysdeps/nptl/libc_start_call_main.h:58
+     #15 0x7f95a10a7e3f in __libc_start_main_impl ../csu/libc-start.c:392
+     #16 0x564df6978704 in _start (/usr/local/libexec/bluetooth/obexd+0x8b704)
+ 0x607000001878 is located 0 bytes to the right of 72-byte region [0x607000001830,0x607000001878)
+
+ allocated by thread T0 here:
+     #0 0x7f95a1595a37 in __interceptor_calloc ../../../../src/libsanitizer/asan/asan_malloc_linux.cpp:154
+     #1 0x564df69c8b6a in pbap_probe obexd/client/pbap.c:1259
+
+CVE: CVE-2023-50230, CVE-2023-50229
+
+Upstream-Status: Backport [https://github.com/bluez/bluez/commit/5ab5352531a9cc7058cce569607f3a6831464443]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ obexd/client/pbap.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/obexd/client/pbap.c b/obexd/client/pbap.c
+index 1ed8c68..2d2aa95 100644
+--- a/obexd/client/pbap.c
++++ b/obexd/client/pbap.c
+@@ -285,7 +285,7 @@ static void read_version(struct pbap_data *pbap, GObexApparam *apparam)
+		data = value;
+	}
+
+-	if (memcmp(pbap->primary, data, len)) {
++	if (len == sizeof(pbap->primary) && memcmp(pbap->primary, data, len)) {
+		memcpy(pbap->primary, data, len);
+		g_dbus_emit_property_changed(conn,
+					obc_session_get_path(pbap->session),
+@@ -299,7 +299,8 @@ static void read_version(struct pbap_data *pbap, GObexApparam *apparam)
+		data = value;
+	}
+
+-	if (memcmp(pbap->secondary, data, len)) {
++	if (len == sizeof(pbap->secondary) &&
++			memcmp(pbap->secondary, data, len)) {
+		memcpy(pbap->secondary, data, len);
+		g_dbus_emit_property_changed(conn,
+					obc_session_get_path(pbap->session),
+--
+2.40.0
-- 
2.40.0


