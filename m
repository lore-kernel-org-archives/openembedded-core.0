Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAB6CCFA775
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 10:52:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8855.1763722335920232066
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Nov 2025 02:52:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=MFwaDa73;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3420b0e600=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL6jB8Q366154
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 10:52:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=UkT6Cv1ez3WQ9pzUeOPr
	P1KDwuwLeX04IBpHMfQpTHY=; b=MFwaDa73MW6aQLsyyLeqhMAI0LfdMMweqWwp
	UIjQ8K4GD8gKxCt4ltOmG/MAWhkVTRSli6Dslran26bRoSmKw8a7nNIGbUoF83nn
	qogDOfVRRiisxuXpapVzFKgGc5KBtkA3WvccXhn3wmpanp+SFBAj6wl/MOFRPx5I
	OH0FQgHouroha7+pZWWbRalDHToRoggmczyP7sZYjVAMm0VbQxdpr14Ei/16vF/q
	sHwQz0JInfsRsue88+lGJyEMqkDBhNDf0FeJCxvKQcF3KZ0oHLQdT8Bb+xPUuCrs
	REH3OlQxehKlSYGxkcJeNm2juJHLRqOV+Qroxyz5TWyMa52J6A==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ajehqgdg6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 10:52:14 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 21 Nov 2025 02:52:13 -0800
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 21 Nov 2025 02:52:12 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] archiver.bbclass: remove workdir from patchdir
Date: Fri, 21 Nov 2025 18:52:11 +0800
Message-ID: <20251121105211.3664547-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA4MyBTYWx0ZWRfX+GsK9LtDw5ri
 rgEJmkRqDKm0VEinrWprRo+kXHo0hqyB3blmYRQk984rxCtFhes/XwTJfe1i+GyLl3hXI3ZIM1S
 sIldBoh2VFy1jmmYspGT3/U4f1Iv+ssqenaWtM+VNghKjanpenuZUjlJDWD48O+l9w9CsYXYWgO
 +ShFG4Vw/9+N4H15JDq9rBISli/zqH5Jtjwun/YEK2Dp5S+CSaodzvQ4OPQu8NGAQRYD8Lxy6K/
 8wSve9UiGhR0xSRYuGhLjiAw07nTkE50ugN8AqMIsHPFlqZ3w0HPCoCSpxEz8XduJ6HPbnCbr85
 uLBgCuYv0w56qqnajzsH9z32Hw610j16EwcT25Lut216OCtzBK8SR0XX/VNwoziOd7AnL/6Un1B
 aQnlJ5r4snsad8UvIiaj2qh23txPuQ==
X-Authority-Analysis: v=2.4 cv=EKQLElZC c=1 sm=1 tr=0 ts=6920445e cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=w3BEgU2pKs7IGWNQ-y8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 7qCwyk9tJmCdNSkv85MrHGv3SOBUmN2s
X-Proofpoint-GUID: 7qCwyk9tJmCdNSkv85MrHGv3SOBUmN2s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 10:52:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226666

From: Changqing Li <changqing.li@windriver.com>

Remove build path from patchdir, file name will change from
series.subdir._master_build_tmp_work_corei7-64-wrs-linux_thin-provisioning-tools_1.1.0_sources_cargo_home_bitbake_libc-0.2.155
to
series.subdir._sources_cargo_home_bitbake_libc-0.2.155.

This can also avoid the following error when the build path is long:
File: '/layers/oe-core/meta/classes/archiver.bbclass', lineno: 262, function: do_ar_original
     0258:            series = os.path.join(ar_outdir, 'series')
 *** 0262:        with open(series, 'a') as s:
     0263:            s.write('%s -p%s\n' % (os.path.basename(local), parm['striplevel']))

Exception: OSError: [Errno 36] File name too long: '/path/to/series.subdir._path_to_tmp_work_x86-64-v3-wrs-linux_thin-provisioning-tools_1.1.0_sources_cargo_home_bitbake_libc-0.2.155'

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/classes/archiver.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index a95c899a0f..d963d28f43 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -252,7 +252,7 @@ python do_ar_original() {
         _, _, local, _, _, parm = bb.fetch.decodeurl(patch)
         patchdir = parm.get('patchdir')
         if patchdir:
-            series = os.path.join(ar_outdir, 'series.subdir.%s' % patchdir.replace('/', '_'))
+            series = os.path.join(ar_outdir, 'series.subdir.%s' % patchdir.replace(d.getVar('WORKDIR'), '').replace('/', '_'))
         else:
             series = os.path.join(ar_outdir, 'series')
 
-- 
2.34.1


