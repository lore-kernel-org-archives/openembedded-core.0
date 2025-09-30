Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3E1ECAC5B8
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 08:01:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.20054.1759219259577405523
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Sep 2025 01:00:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=AyQvvc9N;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2368e8d559=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58U4o2a02650304
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Sep 2025 08:00:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=Xlmyvg9GvkX+S26RBww6
	BJxY8m+RlcxE6e7atujohh8=; b=AyQvvc9NRDDymIFOWn+yoFzdw4CGzm+kDab1
	Q7XoPGru0/8KwWMmkryi+ITIQzV4u48cL5zVRzJ1o2HU4DF3ZYd+fyDH9L9a4yPD
	Tuo6pJ0vK4LKDrSwq6CVaCUIDSSrgMaGlR55YMta1EqukUo6n4j9BayY2PXQjkQ9
	hnb4NFgLsOJ8WGXBtFQgGO4NVsEB/IUPkTqtsab33V1OLYeMN6IgHh4tjVPkGlu6
	BgWYd4rJs7pc12uTFnUUXfAbkOlVfRAtVQanb93Ke2pXd0H6lkgUcWRaACERTbkN
	G4emiNWuEtGPPOSKLU8QldQP9rorvQw8cSMVy9Ebn4NgUsgjbw==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49e54wu4hp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Sep 2025 08:00:58 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Tue, 30 Sep 2025 01:00:56 -0700
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Tue, 30 Sep 2025 01:00:56 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] package.py: replace all files unconditionally when copy debug sources
Date: Tue, 30 Sep 2025 16:00:55 +0800
Message-ID: <20250930080055.1164699-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTMwMDA3MCBTYWx0ZWRfXwdMiUYbmApME
 h8ptV+doQBFRsaI0Qe+nIdl6047NdhNXB8qvcQlGbxn7i0lYwah3wAYXuyECdnoWpjzdTsulF9/
 PUg0St1koPcsFd9F/0bsjMKZziovSZ6F0eSIuLlkJ2cfS0+KY2ogWW42zQbVjh2T/ArfadtV2j6
 c3w1/QCZ3syrhxU/9eo5DIG12xLyI/Jg1f0PsVEBMKArKPPKca+YUwWjvY/QbjWVFSfDxcW+Uh/
 XqRREtiUvKATgw5fp3FdzEqtC61HRowcFY60ruRU8hC2leMWx3hCasAbGnG80Mm1P5On5d94FXs
 zYTLaTSPw8x5J8jy1QkU3mi6n7kMf65+GlLeEHeLxbwAX7Xd8nn0PCGMFT8gt/TF+6RCUHUKxJj
 pjW8+JLIZd1owl9eybRWVl7E41CNPQ==
X-Authority-Analysis: v=2.4 cv=ZNPaWH7b c=1 sm=1 tr=0 ts=68db8e3a cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=7r6sNG4xj8oxaJNMBOkA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: wBeg5teqb4ATi1mNZACJIpy8SJJNELqq
X-Proofpoint-GUID: wBeg5teqb4ATi1mNZACJIpy8SJJNELqq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2509150000
 definitions=main-2509300070
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Sep 2025 08:01:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224177

From: Changqing Li <changqing.li@windriver.com>

This is for fixing reproducible issue for package like:
intel-speed-select-src. For intel-speed-select, one of the debug sources
is /usr/src/debug/intel-speed-select/1.0/include/linux/thermal.h,
file include/linux/thermal.h under ${S} (kernel-sources)
link file include/linux/thermal.h under ${B}, which link to ${S}/include/uapi/linux/thermal.h

During copy debug sources, sources under ${S} copied first, then sources
under ${B} is copied. mtime of ${S}/include/linux/thermal.h and
${S}/include/uapi/linux/thermal.h are decided by when it is fetched, so
it is not determinate, maybe same or different.

For cpio, if the in file is older than or the same as the exist file,
cpio will not replace the exist file with warning "cpio: xxx not created:
newer or same age version exists".  And this will cause
intel-speed-select-src maybe not reproducible.

And option '-u' for cpio, first, this will make the copied file
determistic. Second, source files under ${B} should have higher priority
then ${S}, it may be generated during build, the target is more likely
to use this file.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/lib/oe/package.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index ce69151e5d..baaa0cba02 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -1016,7 +1016,7 @@ def copydebugsources(debugsrcdir, sources, d):
             cmd += "fgrep -zw '%s' | " % prefixmap[pmap]
             # Remove prefix in the source paths
             cmd += "sed 's#%s/##g' | " % (prefixmap[pmap])
-            cmd += "(cd '%s' ; cpio -pd0mlL --no-preserve-owner '%s%s' 2>/dev/null)" % (pmap, dvar, prefixmap[pmap])
+            cmd += "(cd '%s' ; cpio -pd0mlLu --no-preserve-owner '%s%s' 2>/dev/null)" % (pmap, dvar, prefixmap[pmap])
 
             try:
                 subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
-- 
2.34.1


