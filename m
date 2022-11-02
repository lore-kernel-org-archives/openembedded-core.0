Return-Path: <xiangyu.chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EC00C4332F
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 02:52:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.2045.1667357524496783751
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 19:52:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=gkPz5+I0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=830551bf8f=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2A22PcSY008748
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Nov 2022 02:52:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=BhMsmAvZEo+kb3pmA+lVMsxyzbm8LGaLUm8qOWLZ+Zs=;
 b=gkPz5+I0XjAspyS6DMS8dDaQsIvTLHfsBfrSR/dSxiTeaeP/c8KRCq13w/Y+vTBwb9YV
 e9OG3BeipWe+Za/o/CVHk2Q5cz1KbiXi9MrRVVpjYNgtgOPl/79+1jyPEoNRRgGc5uyR
 vqsnqqw1SXMUDLFApMrfttsIhgQRn6+g+mQ1cpxgvbtPgvPDm21KEjLcQTiniybZ96AA
 ihVRMSokqSKhBjMSXBq+r11jg+oFYxxIe8odptzWeY/aESF+MCM9JZYTs07VnK4UXXfl
 3gz8X8B72q2IVpNXOMl3r7ZrmdwSSRNZoX8sYktHmV6y45CljPOyLF5Cs7S69/90yKM1 Qg== 
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kgsd1u37d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 02:52:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lYKEDr8lt0RVUljIr38kVpH3e350kiqNOu4WXLRX/2tSRzfO2jI95q1IUaFFg5x8dDDz8E4hSJeUKA9XJ2+VrtthWilBkw18exigzdYVTsqiE5ttbo9wUutqGv7Q0uHBokM2B15is/I7FNbj2g5o7U0teXUZ4D0QJYJbEycghn5iQfBl2jrrHiisTbCV00NJ1c53qe1YEMcNcLRVap1QKUNewicIz++1K/bfrMudctwfYE+CEldr9bdTApWCcbw4IlqIk/K0H7QqeZ4wQX+QZhL9WQrK14wJ4c5uvpqa7gv4/fIeybHh1KzRZGXrl+mOeXNTZ2MfjUnSESowdqErmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BhMsmAvZEo+kb3pmA+lVMsxyzbm8LGaLUm8qOWLZ+Zs=;
 b=JCgH18BdWhbx4cnU1+eEdvg/1pMDfiKucVf/+lxzSVkKB1tTYCI8N6C75NSHjoIZE60w4mESWOpyLMXYLv1gM6F2+Sh5VIB6GGrejrmvMm9I5GpfSdPXYJPsB0nxqoN52MQOpake1MiyBka5RaMVKSOFTjYh9+1EmSv+F9wJQQw23ZJKqEKJoWuLVsvu/OEt+sMvZb0rrDhKeGiwMaxR6EkFMSA9bprt4gOctzuoz9Bl5EX+9gTnmsWMUP31nWE1FDENS0Z+iypu+dIXqaagfK/INnPSwaXRukTjA+A4F9iLcsN11Rj2e1Wair/ALcNi5YYUdQ/LSmKoOErYwBeu1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by DM6PR11MB4723.namprd11.prod.outlook.com (2603:10b6:5:2a0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Wed, 2 Nov
 2022 02:52:00 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::99b5:140d:8487:5f3]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::99b5:140d:8487:5f3%8]) with mapi id 15.20.5769.019; Wed, 2 Nov 2022
 02:52:00 +0000
From: Xiangyu Chen <xiangyu.chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-Core][kirkstone][PATCH] ltp: backport clock_gettime04 fix from upstream
Date: Wed,  2 Nov 2022 10:51:45 +0800
Message-Id: <20221102025145.69935-1-xiangyu.chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0108.apcprd02.prod.outlook.com
 (2603:1096:4:92::24) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|DM6PR11MB4723:EE_
X-MS-Office365-Filtering-Correlation-Id: 26597007-7151-400c-0c5e-08dabc7d36bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2ifVTe/BZp2uYbVsbeHYfpZG0Uh0oF93uWWL1eKCqBtxBo8OZWq91hbo4RsPxhTHmSk6b3BMny4ZGj8siAdrq4YOPAF+/uGSMCy1VbD6pOxHiOuUjkwAsww5s3Zw+3aotl7ss55EQ85e8HlPx8ewYJ7h8HjwPTpqNN/ZA5ekCy5oueH/HkxvmRGoWU1+wR9ESUHXQ1dJ8agWEhL1PWwuCp22UxvXbEOExK3VArrORdw4365ymF/C6LB7ep6z07+67ZOoVrs8BbYADtIV/VD3B/yjAv00HKXHLR0pHDDuBsP4DtxbWTIeekpRpm0788D1L9q1OY3te+PHALheH1wDRTLQdCDHgIAwuKPKyVkPd00uTUkW0TIzJxbKAXfNeLi/Dd/YMhqrDWllOluR6UNkmO70iDbOkl9gs5xlM0OPD0OzpyFY+DWooENQHrPY42A00vJ993hBm1X6YFbmWCHZIpvvuu67YhKLFtp1V/5g4W6bGZg//HqSL+Ng2+5VMjJUuskG97TiDO3ubuvqxVyjj6l9zsqU/EnztFFVvbFgbs3lNVWM4HD2AKN6wWJyNBQJ1dPa6V2+makezgehMEFSmLLEKSZxGSQyh/9Rfkp1klGspyV9ipIpBkwLRP1KBgnWQaNKvRQInOeQoXlZC60Ip9+FwbnWMqE23SxSI4OtKfQ5Cd4AzZ47oGaFfHJtaEQCtTkRAgYu4VosvFWsaxkB1u/t3ym3NdqzpagklndeExG69eQYvK7b6VMwERtoznGZNSvdPB1IXjMKpsmN5TmL9KFvwuUej7yPXdeLvxc+yRM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(39850400004)(346002)(366004)(396003)(451199015)(8936002)(478600001)(6486002)(36756003)(44832011)(5660300002)(6512007)(52116002)(2906002)(6506007)(26005)(38350700002)(38100700002)(1076003)(186003)(2616005)(86362001)(83380400001)(6666004)(41300700001)(6916009)(66556008)(66476007)(8676002)(66946007)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?l9G+J5A62Cf0JaSt5ijmEAjV6ENHErBTGIjdH88eF0uEbw0EaW66LqlmeahI?=
 =?us-ascii?Q?ekII6ieCfKwTi6UZ+dFhahuHpd+//AdX/kNpLpwqqRD+rmhUuor2bUNverYk?=
 =?us-ascii?Q?NA0G4YE9889OTllsAWHH7QJR6YulhZGpypRevCt+lGFkl87VnJi5QfrQoP2i?=
 =?us-ascii?Q?wunUXSV6UIjLqfcWtdWZmAfqJDAN48NQBqOjiZ7mVIHDF3zXjCpsGA5Bkhn8?=
 =?us-ascii?Q?tXVrLFth3MvdfAQWOxPaWMS21Ck1GHH3VO0I1c/WZwueMO2G1ea41YEJfNs4?=
 =?us-ascii?Q?Ybdw+gix7sUCwFAcbjr6BIlZGOxgnf/kKlX7vo1ZgAVw/CFSs8//S/nrO20J?=
 =?us-ascii?Q?dtidiMp6nQwqIe3lsiyuL5a+TMqlFHqAephNOVLVf76P5vfuh6PDCPuWMrQU?=
 =?us-ascii?Q?8jC1lFq6AJqrLR3ycOT/21tnm0geaInDe35QBMS85kle0lfHKyxSlstGwVtU?=
 =?us-ascii?Q?voFnXWmozISE+2Jt7Jr9r5lvKT7l+2k89riT52gSoFgFpa+jq1TAjuEPoxQr?=
 =?us-ascii?Q?i5bEha4W0Dsp1EdLtKi6O4mOgJZZop45NiR+clI2c/Ra06RWJ5JyuKcgutWE?=
 =?us-ascii?Q?OpM/SeD9yFZ2nIh9ZCO4GuHdwaOS+CY86czllS824WbEHTLJ+bKMnxidygt4?=
 =?us-ascii?Q?8S8aRs9nyHuOEH/MW2+9L3jYS2G8pHZjob4uOXW1YuJp4rY9kowlk/v50Wlx?=
 =?us-ascii?Q?mzdpHKoevKmVZNOliYs1JIO6b91i79S+LY50yPag5SkFh7A4LM2izKVfWI1X?=
 =?us-ascii?Q?6y24HJd7X0fCya/1e8vE3dfj2+2ue5dL08CjMx5+5wuHrUxijX/XAfgueKZw?=
 =?us-ascii?Q?auK+8OpLwEGc6VTLnnOLUaZO4qjQVJdieqd6dHkahUP0UW3AMly4CtfgiPKL?=
 =?us-ascii?Q?NVTioympvQzRR313KYxSn/IHc9Bcr5Ct2hV0r8Lm0S2J+tNFnkq3qrFsQzlA?=
 =?us-ascii?Q?9oHtR+qsDWNRCvvuE7OZJMMMkrMzTzTpUnX1oWEoNYs7U+jleSbM7LEtDd/U?=
 =?us-ascii?Q?ufZN1h1zmiPAFUo5JGzNqyL+NT4PDJprmsCScXdXGpXSMGIiAtmjwxjYJvlj?=
 =?us-ascii?Q?YElNdNN9SJWVmCHOV8H+K8l6K/NPskjPfiqjn68zP7Gc0buLXFphhHt0Zj+K?=
 =?us-ascii?Q?9gkb58dpec8eQDUMys1LRZtj+YMwDpEwfnuU81i+HxmKr/86LBWE21+QfHir?=
 =?us-ascii?Q?HDYieuRbs0Ynmw11llNYnYt24FbZigC9M2yDh+IvqGEFOuptdozlO9g0/5Q+?=
 =?us-ascii?Q?QhclY3tDUYOcrruzer0HCo/VUTEdtGKNMSPuvsPOB9+v0ocTNbd6F08xT53N?=
 =?us-ascii?Q?5NCIHDabLn5D2pslmuEfM7OvKPWvtXwSzDz7RhnyRdbHFD1Qj/LCvrF09ac1?=
 =?us-ascii?Q?hlQhedRMkItNzHsOTsbdx6moH2pIYU8R3xpgMB6aMU2btf0q9cHkz0melSzF?=
 =?us-ascii?Q?/qMoWb+xr9RAYuKFNxB+jvwPTnBILb1XNbAnraPQhSfgk5DeHhJbtvm7a8Aj?=
 =?us-ascii?Q?q1CcY5DsZJy3QVQPYUPUQQdYZsElB+F8XwgBEP9JVPF8WpsxYAQgCkbfwuC4?=
 =?us-ascii?Q?TfoW5bVi9Ejuj+bG2831MOVIbagwTgOjGbFu5Vy34tlmpiU1WNYn1Yg4i+Is?=
 =?us-ascii?Q?dg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26597007-7151-400c-0c5e-08dabc7d36bf
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2022 02:52:00.3332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tfQdQuPo0n0d0k1oXNP7utb9KPzAqOA2ZajsEdmwbMgjH1aEk3Mgu5BapS/nO1I8g6Wsf4raDq4ntOwRnwlMAT+VoFxk8UZElJNcO8+bgAc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4723
X-Proofpoint-GUID: WQuZWLo5I60yi6zYnu0lni4mJI1Kzcim
X-Proofpoint-ORIG-GUID: WQuZWLo5I60yi6zYnu0lni4mJI1Kzcim
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-01_12,2022-11-01_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211020015
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 02:52:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172561

This is to get rid of the intermittent failures in clock_gettime04,
which are likely caused by different clock tick rates on platforms.
Here give two thresholds (in milliseconds) for comparison, one for
COARSE clock and one for the rest.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 ...set-threshold-based-on-the-clock-res.patch | 89 +++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20220121.bb     |  1 +
 2 files changed, 90 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-clock_gettime04-set-threshold-based-on-the-clock-res.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-clock_gettime04-set-threshold-based-on-the-clock-res.patch b/meta/recipes-extended/ltp/ltp/0001-clock_gettime04-set-threshold-based-on-the-clock-res.patch
new file mode 100644
index 0000000000..b4879221ad
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-clock_gettime04-set-threshold-based-on-the-clock-res.patch
@@ -0,0 +1,89 @@
+From 9851deb86ef257a98d7433280161d8ca685aa669 Mon Sep 17 00:00:00 2001
+From: Li Wang <liwang@redhat.com>
+Date: Tue, 29 Mar 2022 13:03:51 +0800
+Subject: [PATCH] clock_gettime04: set threshold based on the clock resolution
+
+This is to get rid of the intermittent failures in clock_gettime04,
+which are likely caused by different clock tick rates on platforms.
+Here give two thresholds (in milliseconds) for comparison, one for
+COARSE clock and one for the rest.
+
+Error log:
+  clock_gettime04.c:163: TFAIL: CLOCK_REALTIME_COARSE(syscall with old kernel spec):
+        Difference between successive readings greater than 5 ms (1): 10
+  clock_gettime04.c:163: TFAIL: CLOCK_MONOTONIC_COARSE(vDSO with old kernel spec):
+	Difference between successive readings greater than 5 ms (2): 10
+
+From Waiman Long:
+  That failure happens for CLOCK_REALTIME_COARSE which is a faster but less
+  precise version of CLOCK_REALTIME. The time resolution is actually a clock
+  tick. Since arm64 has a HZ rate of 100. That means each tick is 10ms. So a
+  CLOCK_REALTIME_COARSE threshold of 5ms is probably not enough. I would say
+  in the case of CLOCK_REALTIME_COARSE, we have to increase the threshold based
+  on the clock tick rate of the system. This is more a test failure than is
+  an inherent problem in the kernel.
+
+Fixes #898
+
+Upstream-Status: Backport
+[https://github.com/linux-test-project/ltp/commit/9851deb86ef257a98d7433280161d8ca685aa669]
+
+Reported-by: Eirik Fuller <efuller@redhat.com>
+Signed-off-by: Li Wang <liwang@redhat.com>
+Cc: Waiman Long <llong@redhat.com>
+Cc: Viresh Kumar <viresh.kumar@linaro.org>
+Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
+Acked-by: Waiman Long <longman@redhat.com>
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ .../syscalls/clock_gettime/clock_gettime04.c   | 18 ++++++++++++++++--
+ 1 file changed, 16 insertions(+), 2 deletions(-)
+
+diff --git a/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c b/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c
+index a8d2c5b38..c279da79e 100644
+--- a/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c
++++ b/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c
+@@ -35,7 +35,7 @@ clockid_t clks[] = {
+ };
+ 
+ static gettime_t ptr_vdso_gettime, ptr_vdso_gettime64;
+-static long long delta = 5;
++static long long delta, precise_delta, coarse_delta;
+ 
+ static inline int do_vdso_gettime(gettime_t vdso, clockid_t clk_id, void *ts)
+ {
+@@ -92,9 +92,18 @@ static struct time64_variants variants[] = {
+ 
+ static void setup(void)
+ {
++	struct timespec res;
++
++	clock_getres(CLOCK_REALTIME, &res);
++	precise_delta = 5 + res.tv_nsec / 1000000;
++
++	clock_getres(CLOCK_REALTIME_COARSE, &res);
++	coarse_delta = 5 + res.tv_nsec / 1000000;
++
+ 	if (tst_is_virt(VIRT_ANY)) {
+ 		tst_res(TINFO, "Running in a virtual machine, multiply the delta by 10.");
+-		delta *= 10;
++		precise_delta *= 10;
++		coarse_delta *= 10;
+ 	}
+ 
+ 	find_clock_gettime_vdso(&ptr_vdso_gettime, &ptr_vdso_gettime64);
+@@ -108,6 +117,11 @@ static void run(unsigned int i)
+ 	int count = 10000, ret;
+ 	unsigned int j;
+ 
++	if (clks[i] == CLOCK_REALTIME_COARSE || clks[i] == CLOCK_MONOTONIC_COARSE)
++		delta = coarse_delta;
++	else
++		delta = precise_delta;
++
+ 	do {
+ 		for (j = 0; j < ARRAY_SIZE(variants); j++) {
+ 			/* Refresh time in start */
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/ltp/ltp_20220121.bb b/meta/recipes-extended/ltp/ltp_20220121.bb
index 4ae54492f3..51e8db4f1e 100644
--- a/meta/recipes-extended/ltp/ltp_20220121.bb
+++ b/meta/recipes-extended/ltp/ltp_20220121.bb
@@ -29,6 +29,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=ht
            file://0001-metadata-parse.sh-sort-filelist-for-reproducibility.patch \
            file://disable_hanging_tests.patch \
            file://0001-syscalls-pread02-extend-buffer-to-avoid-glibc-overflow-detection.patch \
+           file://0001-clock_gettime04-set-threshold-based-on-the-clock-res.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.34.1


