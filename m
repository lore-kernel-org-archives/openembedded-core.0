Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12A84C369C2
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 01:20:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2674.1745371238382966193
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 18:20:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=62082053c6=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0mDAH021989
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 01:20:37 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 466jh6069g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 01:20:37 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 22 Apr 2025 18:20:35 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 22 Apr 2025 18:20:35 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH 1/2] systemd: backport patch to fix journal issue
Date: Wed, 23 Apr 2025 09:20:30 +0800
Message-ID: <20250423012031.2750737-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: J1cPkdrrnlYCuQ6GxXndJCikaNdJIrop
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDAwNiBTYWx0ZWRfXzaZPcmg5zoN+ L3Gq19w4gBgN5/O7O0t/sjKq4vFW6g6MSVh9SG/zuiPFjUAF1ofR1eRUnmKQKY4SxQLraAVtfCk YUPLI/8eIIwJuravueitYxQAdWpHOqgSM5Ib+Gv8oBwsCnfsiNAz9SY8WO8T3oCBBlYuA1VVyqW
 hqLE0H3Y+xNZOW+BS2YRHeqQIVWjW6fpGQHGGPuhvhRMe0p8SHJLU7lHF2WzTBW3KJN1zEdIwWH 51rGToU+jsZ7I7Kgxa4BgRZMzUoPyW1G1aKBFFx3THGtyM1jsr8XnTZzwRywLYSJSAUehdgXc4j 3hjAwbXOcGkXHvnMPhIYNXo247QMUpu8+dwZHgRb4gpHYCUBL95Hc+nD96fUpOHrzljXvJDYjaU
 WhTI24dR/Nn+tErmUpwQFs9T9cR9HICW+qjxImkkKkWglDrYiCoYTx4Ef/m6grM0xK4wVF9L
X-Authority-Analysis: v=2.4 cv=Lu+Symdc c=1 sm=1 tr=0 ts=68084065 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=hIBao7lJJBJFJ7Dp350A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: J1cPkdrrnlYCuQ6GxXndJCikaNdJIrop
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_01,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 clxscore=1015 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504230006
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 01:20:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215255

From: Chen Qi <Qi.Chen@windriver.com>

Backport a patch to fix systemd journal issue about
sd_journal_next not behaving correctly after sd_journal_seek_tail.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...journal_previous-next-return-0-at-HE.patch | 87 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_250.14.bb   |  1 +
 2 files changed, 88 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-journal-Make-sd_journal_previous-next-return-0-at-HE.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-journal-Make-sd_journal_previous-next-return-0-at-HE.patch b/meta/recipes-core/systemd/systemd/0001-journal-Make-sd_journal_previous-next-return-0-at-HE.patch
new file mode 100644
index 0000000000..17e83448e3
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-journal-Make-sd_journal_previous-next-return-0-at-HE.patch
@@ -0,0 +1,87 @@
+From e8d0681eb49697d91f277e2f9f4cff32a30b316c Mon Sep 17 00:00:00 2001
+From: Daan De Meyer <daan.j.demeyer@gmail.com>
+Date: Tue, 5 Jul 2022 15:22:01 +0200
+Subject: [PATCH] journal: Make sd_journal_previous/next() return 0 at
+ HEAD/TAIL
+
+Currently, both these functions don't return 0 if we're at HEAD/TAIL
+and move in the corresponding direction. Let's fix that.
+
+Replaces #23480
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/977ad21b5b8f6323515297bd8995dcaaca0905df]
+
+[Rebased for v250]
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/journal/test-journal-interleaving.c | 4 ++++
+ src/libsystemd/sd-journal/sd-journal.c  | 8 ++++----
+ 2 files changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/src/journal/test-journal-interleaving.c b/src/journal/test-journal-interleaving.c
+index c543b87b69..f0ed1b4c74 100644
+--- a/src/journal/test-journal-interleaving.c
++++ b/src/journal/test-journal-interleaving.c
+@@ -158,6 +158,7 @@ static void test_skip(void (*setup)(void)) {
+          */
+         assert_ret(sd_journal_open_directory(&j, t, 0));
+         assert_ret(sd_journal_seek_head(j));
++        assert_ret(sd_journal_previous(j) == 0);
+         assert_ret(sd_journal_next(j));
+         test_check_numbers_down(j, 4);
+         sd_journal_close(j);
+@@ -166,6 +167,7 @@ static void test_skip(void (*setup)(void)) {
+          */
+         assert_ret(sd_journal_open_directory(&j, t, 0));
+         assert_ret(sd_journal_seek_tail(j));
++        assert_ret(sd_journal_next(j) == 0);
+         assert_ret(sd_journal_previous(j));
+         test_check_numbers_up(j, 4);
+         sd_journal_close(j);
+@@ -174,6 +176,7 @@ static void test_skip(void (*setup)(void)) {
+          */
+         assert_ret(sd_journal_open_directory(&j, t, 0));
+         assert_ret(sd_journal_seek_tail(j));
++        assert_ret(sd_journal_next(j) == 0);
+         assert_ret(r = sd_journal_previous_skip(j, 4));
+         assert_se(r == 4);
+         test_check_numbers_down(j, 4);
+@@ -183,6 +186,7 @@ static void test_skip(void (*setup)(void)) {
+          */
+         assert_ret(sd_journal_open_directory(&j, t, 0));
+         assert_ret(sd_journal_seek_head(j));
++        assert_ret(sd_journal_previous(j) == 0);
+         assert_ret(r = sd_journal_next_skip(j, 4));
+         assert_se(r == 4);
+         test_check_numbers_up(j, 4);
+diff --git a/src/libsystemd/sd-journal/sd-journal.c b/src/libsystemd/sd-journal/sd-journal.c
+index 7a6cc4aca3..04cafdf1c8 100644
+--- a/src/libsystemd/sd-journal/sd-journal.c
++++ b/src/libsystemd/sd-journal/sd-journal.c
+@@ -611,9 +611,9 @@ static int find_location_for_match(
+                 /* FIXME: missing: find by monotonic */
+ 
+                 if (j->current_location.type == LOCATION_HEAD)
+-                        return journal_file_next_entry_for_data(f, dp, DIRECTION_DOWN, ret, offset);
++                        return direction == DIRECTION_DOWN ? journal_file_next_entry_for_data(f, dp, DIRECTION_DOWN, ret, offset) : 0;
+                 if (j->current_location.type == LOCATION_TAIL)
+-                        return journal_file_next_entry_for_data(f, dp, DIRECTION_UP, ret, offset);
++                        return direction == DIRECTION_UP ? journal_file_next_entry_for_data(f, dp, DIRECTION_UP, ret, offset) : 0;
+                 if (j->current_location.seqnum_set && sd_id128_equal(j->current_location.seqnum_id, f->header->seqnum_id))
+                         return journal_file_move_to_entry_by_seqnum_for_data(f, dp, j->current_location.seqnum, direction, ret, offset);
+                 if (j->current_location.monotonic_set) {
+@@ -704,9 +704,9 @@ static int find_location_with_matches(
+                 /* No matches is simple */
+ 
+                 if (j->current_location.type == LOCATION_HEAD)
+-                        return journal_file_next_entry(f, 0, DIRECTION_DOWN, ret, offset);
++                        return direction == DIRECTION_DOWN ? journal_file_next_entry(f, 0, DIRECTION_DOWN, ret, offset) : 0;
+                 if (j->current_location.type == LOCATION_TAIL)
+-                        return journal_file_next_entry(f, 0, DIRECTION_UP, ret, offset);
++                        return direction == DIRECTION_UP ? journal_file_next_entry(f, 0, DIRECTION_UP, ret, offset) : 0;
+                 if (j->current_location.seqnum_set && sd_id128_equal(j->current_location.seqnum_id, f->header->seqnum_id))
+                         return journal_file_move_to_entry_by_seqnum(f, j->current_location.seqnum, direction, ret, offset);
+                 if (j->current_location.monotonic_set) {
+-- 
+2.17.1
+
diff --git a/meta/recipes-core/systemd/systemd_250.14.bb b/meta/recipes-core/systemd/systemd_250.14.bb
index ef0476fad9..b79284d79c 100644
--- a/meta/recipes-core/systemd/systemd_250.14.bb
+++ b/meta/recipes-core/systemd/systemd_250.14.bb
@@ -29,6 +29,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0001-nspawn-make-sure-host-root-can-write-to-the-uidmappe.patch \
            file://fix-vlan-qos-mapping.patch \
            file://0001-core-fix-build-when-seccomp-is-off.patch \
+           file://0001-journal-Make-sd_journal_previous-next-return-0-at-HE.patch \
            "
 
 # patches needed by musl
-- 
2.34.1


