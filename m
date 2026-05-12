Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADC16CD484C
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 03:26:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.67666.1778556400936942346
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 20:26:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DIcBNBJc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=95926deccb=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C1e5n63095316
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 03:26:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=t39f4c82Ct9BYctsrmwSfz+VME5mRwp20s9PKbKeYsE=; b=
	DIcBNBJchKB7nQUtzqlrj84t1y5yHYyrYJxOWK83u52KBj9DpAkAb5LQK62zf3t8
	IHsdQEFuYkRh/WBbDYUZ0QYFP5JHkv45LJNyFv1TJQUwcy/AUb4JnPCjNC3XI6Y7
	KFNzbXOkupxIWbYKBc1ikL0qwxsxz1+z1YqfI/vdKBruhIs+mUd8dNp/G4SVzcb5
	Vkp5m4RfBreqycv6Jd2m1edaN1vCRKr1N8Alg72uN/dvD3ECT6MTyPY1AZzhbE/B
	ElZlags4qq0dEYutukaW6l20g7ZP4RK9wKBuVxVGEYwZk6Xf7R/qqVtzE40YuQ+3
	xGPUQ8qQdFNP7o+yy/u3ow==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011047.outbound.protection.outlook.com [40.93.194.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e3nvhrc6g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 03:26:39 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KYYawFCtt6PkPadN3SQDuDUtDejJBHgSMpHt32zvKRlyPzYMJ6gaIX5Ed3cYYr4ROL0O6HYKf1zdBbZdEA4jFpeFIChwRDH5NUoRz1CLYYUUmqFsmK+leL5HoyCTBSvMEB06pZElQfknqvMiaEHmfEHr8ix00k/LTJcULqUf2fPr0xEfzac+D3AcjL0T7qoSCZvDmBtrMwGI43kMENZ6dlX/exKM5AdTf5qZ1H75AJwIde5V0jI+pZjmwkyAFP48x5B3HvTuMQqgYkFtvFfWdOCYEIvPUMUyJ18bKtxjUq9KOph3fzPzea49/Z0QbfGE8552z+uVVQJZMGKQ/sPCyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t39f4c82Ct9BYctsrmwSfz+VME5mRwp20s9PKbKeYsE=;
 b=kieViabhqFyb+oQGezpT4JOLDA14o7BEXrIg/zHiNiR7vqyEJTaW4Z/3u9pgH5mMg99An142A/SNaNHFo7sdEmOHSq9uQi0HieOm844/WQCzIUkNpa+0VRTKljSAcMe7y5rAaW6mpEh36CdqSFNeCmytlkjeFfIb/ZpQdalOkx7Dsd4JSAcqBObdQq0ecDy1Ehpa/yi1VHkntqEYQ6GXnfZIrG9gAwuMf0kISWvCTHMx5cW9qGfImq/J+jP1J77wcbp2b3ci7MOxdS8Pfmru84/XFZNxYr90Toy2ZKeMZcg0irtceD5jE3Owr0h58quzXiB7oenvRfobFRN+ScbB4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA2PR11MB5017.namprd11.prod.outlook.com (2603:10b6:806:11e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Tue, 12 May
 2026 03:26:38 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 03:26:37 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, randy.macleod@windriver.com
Subject: [OE-core][PATCH V4 4/7] systemd: inherit upstream-stable-release-point
Date: Tue, 12 May 2026 11:26:11 +0800
Message-Id: <20260512032614.2814369-4-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260512032614.2814369-1-Qi.Chen@windriver.com>
References: <20260512032614.2814369-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0105.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c4::16) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA2PR11MB5017:EE_
X-MS-Office365-Filtering-Correlation-Id: a0f9afca-812d-4332-8d0a-08deafd646a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|3023799003|56012099003|18002099003|22082099003|11063799003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	3CaGiAKQlFv59KYiS462pn93WAIA0mwilqENlGBPUnhxWOXwlIR565H3vOy2GDdVCPpJc6XhOdrMHos5Jl2dnPOMR1RmX+UUeqePErVS98yZOZBpHARw44gk/m6m19BzTtpzMO8rT4sQyF3xxkmDtRoSILXxG1v2w/caTJSyo3EFp3n7+eiT5+Abprzlp5udK21gtwO2PPl4MeY1MaZU2UB4mbY0i+HafsP3UkntR6zLBKtg6HT1T5pCaubhws6lLFpu+Xbm2E5+TgbIRn9GNQmJ+kkQkbrBi4y5/UKKe1ezEQLNZ3MYBt7t3fxrnNbycrKt2QMRrFe4sqJC5zkufKJ/E/ohASjDyddkaWkL/PbEtHgTig9J9PS2XP80ps6bvBCc2ALUjsHJDK9FntNMUiAiKJtWnLtMj/ahG41W0tGDnTh/3b7hgB/rOyqMgT6iX6GQWAUi7Kh/i4/eCMwWQcbu3Kq8SWXkzBb2dA06DGkNfIETDn5BKliB4bYfMUJO6UL/m69YA1tggCLMw+XyC/VJN8Ennb8jCy44LuCjc6obtwZsZXeyUD9WUvIY6FA4wGiXrNcJ+oj19QnNN9x7YvnGb541yLjfBAD3JN30U60uowMwlL3/XxZ9SmTzW3RZzjiYSM211b0zTeolrfNL7qETyGzrH4slWqEg5Cne9gP9uwSdk83PBS+A5cxJbN//5YNXqOtp0lYeiufJiuuNXllvwgscDD+JTRCrTs4h7gdrE9vvdQ6b1Rkwn1AlmGQx
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(3023799003)(56012099003)(18002099003)(22082099003)(11063799003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?b8FYmwQ8Oxl8jUj6lIvwPMsS+bipR0r4jw27rhY+LmwlMSUmSYa/vvZ5OO1m?=
 =?us-ascii?Q?aBoEZOdpJWTl4AGTHFvbRYcgObZRvWF0kQpYJgC7rCSnYHJK+zQ9s3gpcqZY?=
 =?us-ascii?Q?GftauB1FrW82hfe59m+qlymqBmD0D8PZpAiNVxcpta+uH5oGRudF2oaMYlOX?=
 =?us-ascii?Q?8BakKajG9oDDWIIgG/1W67/Kh1l4JT4oWiEPwNWWFspUrwnFndOxRhhbUWs4?=
 =?us-ascii?Q?mx+ETUWpnO24Q6L8mvJch375dONvggC7iw7b4/2RjgXLHyt0XCYXEnENL0Ml?=
 =?us-ascii?Q?N1bm5aIcHDdxi9dojLzJogpuFZJjDarDOYSXvhqPWYG4ZD5EvEGjBN1YgnOV?=
 =?us-ascii?Q?cJPI7xbVLb19FbWIlhmfhlyI6UQsct5JVXAFVNuwRJhvO2C17sZBCv4ovffS?=
 =?us-ascii?Q?eOBVLXR5uqadkBTrkS0ouBGIrXlZ/dt8WcmGAVLH5/YE+DLmYjybqUs7abUq?=
 =?us-ascii?Q?K5yBqFHujepDGs+L269We9x7jkb1Ci4HgzQIiIH87QnG7kf7DydZ9n3MMAER?=
 =?us-ascii?Q?Tf1se3PFoGtiqrTO9RU7cghQ2yA6kjYyzP/mQrSLD3zC8mIsE824qtIV5lP2?=
 =?us-ascii?Q?8RDU9bSlK5orDLrheT8nc7N4VPu00ZLRQUA+dxzFh+IsQQcuTPP5xrwPqQG/?=
 =?us-ascii?Q?wRZ0ghuYIO7T0iHYpe80piSsgvtdTyzlkLKfJBDHJ+vodjUvqMoDVy/xkRyi?=
 =?us-ascii?Q?j+ohKFrCkvr5nBn0+JFm+YGBlJmPcW/NeeBwMVbplW9yJ+vmOtVy2TS5/mGW?=
 =?us-ascii?Q?nKaaJ4ICfz72AR+Kr6Eui5/pByajuOcYIaV+tq/QRfVwu+4BnPKs+osvSLX9?=
 =?us-ascii?Q?WOXZ+DiPNBw2d0R/7dLP61YQhGKmT8Ux5iTP6duFRciL0VRawnmUBtBdwcFM?=
 =?us-ascii?Q?H13M0heENn2S1eE78Qewjtexe6aSjvJPGJVWb73fG9kgPtckM+KIUvSJZz25?=
 =?us-ascii?Q?sB7cgFLQ8TVeYNz22fuLWhfiKfP13WWOqPwPB1EwUSxzmuISupNSvt/tzp8f?=
 =?us-ascii?Q?ehFjTI6TOxM+phgh5uwPKUn8+m55b/yBoGAQQ0UiiiwGuTFSl/yXhatCdPTs?=
 =?us-ascii?Q?SdMpGcOT75JkcLkX/F1sKKbr/cKKaDiexLTvtpBRXdJsF/+3DcKv4UnBWlmS?=
 =?us-ascii?Q?jg+7v+9jwKjkjmPWZ1/nL2oJGGgFDmkJtXXHjdGa8sj2WZysK0rK8g5VuRFR?=
 =?us-ascii?Q?PH2J+MfN7NhpsZbJEb/NaWU2ymeaDJQiVcDfmLxO5RGYXiDIettCcsr8XNi9?=
 =?us-ascii?Q?fPxXujO0KtD2OQCfLc78zUuAq2LHbcHdYbDEdSldEh9uNbf+4ryxFGyAfXL3?=
 =?us-ascii?Q?DT5pRsCbyRcxtUrJQW6e71cY9N1y+DPV05Tf/BHmH8yPa12DBTpwlO2kRkNV?=
 =?us-ascii?Q?AbvBTh3v3uZM+gKKy5uI1E+LBr4wf/v9NKQdZFwqpVar+pbEfaSRHoZxGht3?=
 =?us-ascii?Q?SLbPz2fjDFle3jMGCrN388tuwVFMOfFB4fiWnfL+UBOAJyf8W/4GEoV3/7iA?=
 =?us-ascii?Q?poFkaRGXY7O8Fn4yGteIWzeg+R+DCcVTIOrVa/vqmbDVV98LgqJHxEKcSUzY?=
 =?us-ascii?Q?icA0NPlnEdz3M/ONA40FkEav+mmR1jglnW2LY2Q86PSL/1D5yX5nLUTBYpr7?=
 =?us-ascii?Q?sr75dzBJtwRuerPmaOFlTZLxy/w0m7ODqbpCpobz9vkOQQNtkKygT2+XL29k?=
 =?us-ascii?Q?lWhWmx+vmiD49zF31GQ1LI5AvbAOshw+OuyljrJuFrEa0CRz7pTWGe7X51Bt?=
 =?us-ascii?Q?aM/YE/ft0g=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	avfIMmz5P7c59PMJbWC3Q1u3foE7yIpd2nGPI9fMPHpws4CMbsCAvX3mjc2vJrx9KyDbtl72lYQ1zIpYN1/SbUsTE44JfK6Atcja5pRqaRor8D6RqagFofUOvO47fvhgX5IlYkJHpW3LyUwA7N5HFz6ZaiV4WpGZMDq/3g8XYv+IlGUBf7Icp7wy90KqvZZEw4/YUdNVBHw2DHa2x7yKeFtCxb5w37YT0wSiXGifAw87sE0v87cph4UlQKpZ7pQz5EcbhdPgP3TERmktjgFRTX/pbmMDINAkUYMwTvnBf5K9ZmKv7e4smuKg0WBlK8wo9xardrfLaJFDpHrDIkd5Eg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0f9afca-812d-4332-8d0a-08deafd646a5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 03:26:37.8981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ymB8BRb7GTMvTm3gR7iU+NG083Bkji2+P5vf384BjPKO9et7dpe0clWokw8nGBVRWEcxDMir6IskfmeLTZLHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5017
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: OF3EcFL_sRhRT0R9yOxFO5zJ02jEssoF
X-Proofpoint-ORIG-GUID: ix3kVS7e4OM5stulHfVlZosX2x8ONX2p
X-Authority-Analysis: v=2.4 cv=b4mCJNGx c=1 sm=1 tr=0 ts=6a029def cx=c_pps
 a=bw0VQspFR1l10E3Rz9sV8Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=TIlOCVwuG6zFfn-mFGAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDAyOCBTYWx0ZWRfX6QMIOgGLLv0y
 9divZsf9x/kDbbwP1PmbNZEQE92OW5moq38FTs9dOvPft1z1dIyZauIEVkHFKL8hFSd6m8nnO9f
 Ueg2NAFwTKpRYLkfnnT61eiOqsMZiM5geZfICArqc2CfNLiXS9l9i8Uq6H2HWVBIQPD2NANJ0zn
 hupOz03xX33RfTapKezD1q3iZ4VzCQE+QBgKUKmpcfjJz9Z6yc2mBnB+uC03VLZs9EVmGKY76Bi
 mCWLQnUi5COX35y+75UXBJkmI4bXlWb0KiO0xJIS/aIOwrhZvAmt732EceRokiAD2aUXqsDPmGi
 LLVKtlBdNDJvfr/2m/rxzQgHMJ/Xb29DwQkXTul14yAlZ+9QlAAll2yc4buZRnADpM7o4vPwSd6
 ZpI8fiJ1ftR8r3JRo+CZGQQ8Ex4NFvawu42S2yE82KVHcKRiN+s+nEovouDfuN/mMp5DtjM67LW
 l9diTPXJfvs5HGzkkfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120028
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 03:26:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236847

From: Chen Qi <Qi.Chen@windriver.com>

Upgrades like 259 -> 259.1 or 259.1 -> 259.2 are stable upgrades
for systemd.

* Evidence

  Its repo[1] has remote branches like:
    origin/v256-stable
    origin/v257-stable
    origin/v258-stable
    origin/v259-stable
    origin/v260-stable

[1] https://github.com/systemd/systemd.git

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/systemd/systemd.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index f107c4c5da..e63dde3af9 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -19,6 +19,9 @@ SRCREV = "b3d8fc43e9cb531d958c17ef2cd93b374bc14e8a"
 SRCBRANCH = "v259-stable"
 SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANCH};tag=v${PV}"
 
+inherit upstream-stable-release-point
+STABLE_VERSION_PARTS = "1"
+
 CVE_PRODUCT = "systemd"
 
 CVE_STATUS[CVE-2019-3815] = "not-applicable-platform: only applied to RHEL"
-- 
2.34.1


