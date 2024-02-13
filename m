Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C672DC48260
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 13:07:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.10849.1707829633874065071
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 05:07:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=N3mL19qm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2773eee731=yash.shinde@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41DCwSQn018994
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 05:07:13 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=aLS6dg5n1eCDOSlT8e
	S9DoEFJSBo5nj7xYZlB+irVC8=; b=N3mL19qmW/4WJH0ERrPmUmFAUwXCCaooeN
	ibsNbjwnuFC0JssflyTDZJe4c1SEU3fEfTkWNBkARZKARqgw4jyZn7P8nU2Vnse9
	AUgCeOBM8unQaQ2jbXorvxO3282yn8m68bbzp/si/ayNlf4Zo+CIypwp1rdSZ1Ar
	EGqUIlraplXLt01mIZ6VCdoXiMvFdzMOk+oUymoKDunv1v2mpqtVcQY79UDBLDDo
	vLO2SYSVIiibYTBWhNwfEJqokb6vTyp9ua+n+fOZW4MLQ/raTckDyY489EJv8mPd
	2x6AiSZ2DUXSZcZiesl4xULI71CDjJ+lwvs9kHjDwgbzHCV//rEA==
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2169.outbound.protection.outlook.com [104.47.73.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w69hm2bb9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 05:07:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pqq50KpF53CYQ3KObv8FC52ftssy/zEnitQVNHntZUnzdeATHuyqL9JV3R3c90buJ5toQIBMvNGPU/509JQS/AyEElGmStgfozpWLZ3QCOMmvGcZ0Ky2IutvyF4AHlzZRCOJ1r9v/sPrUqyQe8AkMqSO+CmSiY0wwMq9BZAYkwDxW/BCZtM20FUVL/DH5FOZYGoJtfZVnmJ/SYGwlL0Mc2tbyJJe4c3Z5j5t7AIhTe5beEc9vlxbNfkhGgDkdpU2sEw0wnZB5KsOPgh47nRa7o01SHHhfUuhVAv0hPIHEqf10jAzxh9Xzc3pR4UcEWAtTt3I5fwNIuDAg+8/M9GjpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aLS6dg5n1eCDOSlT8eS9DoEFJSBo5nj7xYZlB+irVC8=;
 b=ArB9BNT3tjUT5Y3Qhz/0eXyF6x3vc1Ocn+gI4715MVlxOzY3ULQBtGCi4eySgNv2VOwmpEzOAPhEw+JZsi+ymFSLwF1gUsC6uDpP+sSvZL+QlZWNcetPxQlohRvS9MzGUsVYz4oT3ITpJJNTSMPoscPm2PdnGElJLJPjMFnXnnKbKUcQsiPXqfzkdWaYMA+22tgzxchPloXcwnHX5uMRfB+Mi9Kr/l1TmqH6Ob4zOMPfc2nt2J5DL+L6vak1e59Q7AfuKJapXLSWHi86YNWlWAP0Nn8u5OpZOtxDNkut2mZ3f5iXSKywaoATqODws7QWM6hy5MQ9+tER6sgGt6P86A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by SJ2PR11MB8421.namprd11.prod.outlook.com (2603:10b6:a03:549::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.38; Tue, 13 Feb
 2024 13:07:06 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107%4]) with mapi id 15.20.7270.036; Tue, 13 Feb 2024
 13:07:06 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH] rust: Oe-selftest error log on console when it fails.
Date: Tue, 13 Feb 2024 05:04:04 -0800
Message-ID: <20240213130404.3285564-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0078.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::19) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|SJ2PR11MB8421:EE_
X-MS-Office365-Filtering-Correlation-Id: 031539aa-80a1-4efd-7fd6-08dc2c94ad94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eXgsCxNzryW2o1IUO3xfgD4FfGj4LGEBvuoibfDjJuQ9cCvlhIL5ZcH1SxyMpHnKF1E3RJoJxDU8sGNordAZgZGakwJZXd/j+z65VNnhNTNVqAs4AG2EjJOGbsOxfRZEn8BDANYB3KJ6r2yRQVAJzgiR/VJ+Fl7Rp09mngtFC5Oy0OU5jINbpWowEL+Up2ALW3nD3Jn860OAGWuDS+7o4A8Y02OQMDQTwsgT/23cEIyvNFXu63O9a3YuUdCGNk1bgvHQDhWGVTbqHzc6pjvdPSkvu+2JEy1UD2l2CLmLBokR6LSzafVmB1Gv6aFHFCKXHrVuolgcL2t+lrgAUWk3sgLoCxUNCA8DYUPehJQulh9KvK/uKjUINDGsskK/Q/KIMauJjJVjHziZTuvJ5xtYDE7IJqnK1n1KPqVWtBKTnAz8q51MvTjbJaHIxZG8QqygKgfypdAsvnfHU3u1fkctLav0lAtSEX/Xa76YZ/DvBohGwTR0EgoUaW3zTydpQgeABH9GqsXRrLrrlFON4h60k2sQciTLI0H85iilVUBw4rfsjLL4oS9Yv97+r5/WGbsNFNBRwA5Tl4ECOd/c88RPje4WCAfSgZzjr6o21wKgxAgPTa2tULPG4GGBl7/moIdS
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(39850400004)(366004)(396003)(376002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(41300700001)(5660300002)(38350700005)(107886003)(83380400001)(36756003)(2616005)(66946007)(26005)(66476007)(8936002)(6486002)(6916009)(6506007)(8676002)(4326008)(66556008)(6512007)(9686003)(316002)(38100700002)(86362001)(1076003)(52116002)(478600001)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?B3FeTih4I8kEJJs44LCs7K4zYHiDnigYxNxHVV094xKWlfz35rdavDnOiLjJ?=
 =?us-ascii?Q?XfPUeV+qjr8AR6J1i531YRYVsbo8iU1VOIWRy86qBCURClaMoM8mFfQZrEyq?=
 =?us-ascii?Q?RIkvsZHYqRgZyRuRYKExdxZTcoL978jgcGAP3eua0j17jgfpu/SIOu1M3Rak?=
 =?us-ascii?Q?HxgZZ250YyiQ9vlfpSneYJC4+b50InFGoAAk7BuMnSCbeslt6dvQzz7ZLued?=
 =?us-ascii?Q?eEyrwA2O8G0+sr99AOj6UevGO3qLTu02uTJwS8TfjoewZtQcvUiglznAcECx?=
 =?us-ascii?Q?5uUcQXoMug3P81NfRDRBE61W/gjFSMcMrF0MtKwj5zzTFRI/UYHwqUocnWAR?=
 =?us-ascii?Q?BvGfFX7+W9B4TAf1+Bfx+i/hhPHSlys2Vk7pjUGN8e0D1T/YxGZeeX1ErICS?=
 =?us-ascii?Q?lA6XBRF7o5a5tUsYYQuI2d0eDUnBn02bS0VwFVD70HAwM3EVn/XOL8JgrTcY?=
 =?us-ascii?Q?mczdE9ZhCaXHtIxcrsL/GVPGG4DSCtr3jarV4GD+f8IGHgaAa84njp24r6PT?=
 =?us-ascii?Q?1mLtwSDAUojRhMJcns29gFkFlhZwcS6tyrlSNrNYqZ1oW1WP9dPpTyPYtB5F?=
 =?us-ascii?Q?SoghtAafZBWiX0Aioj4k79DTUOL3l+QTUm6xNmPqtNvPlWYOFHTjCFpuyAoX?=
 =?us-ascii?Q?hh9nFFSaPIew0iXODG46SaJUXQlHBdYw3QUFaYkN5p9OlksGstgg+zeJ6rB8?=
 =?us-ascii?Q?V2X8fhok5MRU2I0ofcy386zv5AUVS3hjSgqF1KzMJsY3cVCOjzsc5g0n5K8L?=
 =?us-ascii?Q?DaD5o8E9c/7OULbPqHuJK/hRxtuWDrKVRxQdJOP77z03GLvNnO7Chtd3Nl1C?=
 =?us-ascii?Q?NX/7Yqa9QViedPB+ngFjimx1KV6RgJuIz2G78j7AAmXx1gIKjwOtEEqItOAR?=
 =?us-ascii?Q?RsQl89iTh3ZBGqMM7frv+uT6YG5UiOZGikidCfSvzmcZTz4TCnKBCJIWQfTm?=
 =?us-ascii?Q?4dY7sQhG7lhPTQoib6do4jThYiUsxWDFfy2EqSOti1uwroghvt/93kL7+OIl?=
 =?us-ascii?Q?dVUvmtsDD3umFwd8O+iARTzraywBXh+uhSo5g/iAMxnD5X3/H8Z51Rh6ClDk?=
 =?us-ascii?Q?i9efiHkKqp7ussbWshrfVgPz7jx8q54ZWRffqsC1gdZK/NlIQlu/5kpj//Vt?=
 =?us-ascii?Q?uJZbwz+LgyzDiExvk7TH1eFCYT76SLvHg/otdbtTacbezkeFBy2fGOHQFNlC?=
 =?us-ascii?Q?E1cs19IXJD9HmWpt7fjFUJ390wH7pPMo/1B8kF8cPxO5Ea1vyLZbm3tPJheF?=
 =?us-ascii?Q?CPqChG/qekosxfiT76Lh8KAjBaU7TR3liMI9S5JhY+RO4DtgbHJ8ttPLAOHg?=
 =?us-ascii?Q?PECxGN66udps2d8nSOcOtxdyYXG8BmuWoTApeeNysj4ZucylHWE8Eydb6yc3?=
 =?us-ascii?Q?tfi/zcwNS9svuvJy0Gz/n1h/4FioeSlREbKzYZFyaqmQ8LlyQq2tL4sA4EV2?=
 =?us-ascii?Q?dUgf9pvtv0fvZqIEp7VTh6umYCMN0zl+chQUGx/eSeZUIuneC47YdpCsnq9+?=
 =?us-ascii?Q?j0EgpfvbsCDVf2NRUMz/0f/037DYjRcKeAM8ECfGjoGZ1JXi4pyHSKrj3JzF?=
 =?us-ascii?Q?ZmB5gWDzp8VCRfjpLY+pQxAXzvEUUwiunwJ31oT9rqY9+t0MkJw2psZlIT0j?=
 =?us-ascii?Q?ig=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 031539aa-80a1-4efd-7fd6-08dc2c94ad94
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 13:07:06.0581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HwWT647xlenqwlBdHmmLw4sLpy1Gxqh/DmipJ12ruWYq/H26zT9nyajWytTMdpIFsan6+p7BCAUWVoYu0PZLAgFioUndgys1ZX7gWak58qM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8421
X-Proofpoint-ORIG-GUID: jC-YoW_9DxVOW4BP5agVs6Xnu_gukHZk
X-Proofpoint-GUID: jC-YoW_9DxVOW4BP5agVs6Xnu_gukHZk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-13_06,2024-02-12_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=892 phishscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402130103
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 13:07:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195397

From: Yash Shinde <Yash.Shinde@windriver.com>

The rust oe-selftest output error log doesn't show any information on console when it fails.
The following changes emit stderr logs in terminal along with re-directing stdout and stderr to "summary.txt" file.

Changes made::
- cmd = cmd + " cd %s; python3 src/bootstrap/bootstrap.py test %s --target %s > summary.txt 2>&1;" % (builddir, testargs, targetsys)
+ cmd = cmd + " cd %s; python3 src/bootstrap/bootstrap.py test %s --target %s  > summary.txt 2> >(tee summary.txt >&2);" % (builddir, testargs, targetsys)

> summary.txt:                  Redirects the standard output (stdout) of the command to a file 'summary.txt'
2> >(tee summary.txt >&2):      Redirects stderr & stdout to summary.txt & writes stderr on terminal

The overall effect is that both stdout and stderr are captured in the summary.txt file, while stderr still being displayed in the terminal.

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/lib/oeqa/selftest/cases/rust.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index 164ad11ecd..07f1b5706c 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -213,7 +213,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
             cmd = cmd + " export RUST_TARGET_PATH=%s/rust-targets;" % rustlibpath
             # Trigger testing.
             cmd = cmd + " export TEST_DEVICE_ADDR=\"%s:12345\";" % qemu.ip
-            cmd = cmd + " cd %s; python3 src/bootstrap/bootstrap.py test %s --target %s > summary.txt 2>&1;" % (builddir, testargs, targetsys)
+            cmd = cmd + " cd %s; python3 src/bootstrap/bootstrap.py test %s --target %s  > summary.txt 2> >(tee summary.txt >&2);" % (builddir, testargs, targetsys)
             runCmd(cmd)
             end_time = time.time()
 
-- 
2.43.0


