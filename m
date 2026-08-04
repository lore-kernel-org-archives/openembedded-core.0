Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ED90C55172
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 04:08:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9704.1785816512446467373
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 21:08:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Dz2J5LZm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2676761eb7=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6743lWWn2852368
	for <openembedded-core@lists.openembedded.org>; Mon, 3 Aug 2026 21:08:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=S54xvFPD4
	8i5wf7fKhBIhR9auQjrr6R1/pNaljTsByY=; b=Dz2J5LZmwzMNXgQ4TFhLhO8dm
	nOkoTfiaPz0eCFrx6D9Y8hwHwzHj+djsT38Wp61vPYi9XeVxprjzvCf1aLqfIPAr
	A+qdFaSv41UTqPYkbddjWZkfOu5VKQ2GVZD6t+VP3uMDkuACdC03uQmH1rr2YxUv
	63PatPbboFmT0mznd41k9iSt+aOUlt9BQEL9B3hJBSSTwud/UR+B4hu8ikM9drg8
	l7E+4PFA00s4vjjlX/1OyaIb4k0LFYGnVDS0O7uBh3IKHzsiB0FnCAMjHdZ1sww3
	tYBM3ajG/6uQ3xOIDrZeET8jZ3pCEhP+Rt1U0ZP+M6mRy5fpyYv1XUY5NYbwA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011054.outbound.protection.outlook.com [52.101.52.54])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fsc31kg1a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 03 Aug 2026 21:08:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a62X2KNZAVwavAcpD8n3IQAgx2RXJZVsTx9lQtQo3Mqva9T+iu0bfl1WZ4OgMmIhiFtonEEh8ParUzbpEao2RImLIdz+s9jC/8Kb870pHelth4xg8Kg2TskBFmKVJrDVwSMK/cvjGu/mCS9BOWDvXSZtO03g0aug38qD3b6AjQ1ehSjC7VOygnKaL4+/zriK5JpRIaOtz0y/dghfsJLDPt+tyQuCSVV7dfY+mmpjaha3LUPJcQG4BY++bf7Mbw/aSyVf1+NJ/p7Cf9vpvj6mEHgehsiAvXu2tHBSyY2dXGgmzPbDNEAYKlIAYAzcZUQqBr+VKznVXbnviYgl3U2Ekg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S54xvFPD48i5wf7fKhBIhR9auQjrr6R1/pNaljTsByY=;
 b=az2MkdCkIB0b+JCon28Gt+JwupGMZM4Wf+B3KDW/6N230AueS0TeCCtIF3fR1hVpaVQECfLlcjV5P4QArlbWiY55ab5OqHihmbxOZJGXcHTJYi4SpaMIkekhelGxCIVN7XbjcoXba/3FFOQFASMkXKNO78I32tceUE8hcM1HWRc5pd/JgOJGwfDVZLBEmH4wKwqO2Vr07Ma608giUnrisSVrc0OSy/MkWi+i1zghY/BjYnyufI4w+Sfau1VbHHsN9L/2RAHH8qKS4aHz1a0CTrM9kpHr2a+dD94PqIC30RV9gX7k6WJAwUrj3tg7YL6wodtMADcq0TzzDojtv343ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by SA3PR11MB737119.namprd11.prod.outlook.com (2603:10b6:806:594::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 04:08:28 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0270.016; Tue, 4 Aug 2026
 04:08:28 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v12 0/8] rpm: 4.20.1 -> 6.0.2
Date: Mon,  3 Aug 2026 21:08:07 -0700
Message-ID: <20260804040815.1499699-1-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0015.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::10) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|SA3PR11MB737119:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b62f416-adff-4517-f469-08def1de09ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|23010399003|366016|38350700014|6133799003|56012099006|5023799004|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	ccmynpfp0k8sVU4Sea+HXaybVIO5RA05NXUyehS8/8HFO/ZOfCBiCq9tr/8NGBeNCAFmwyIG93/8uUQ8/QGMqn3YPSQ5tbpBTAchHCk/vlPgA7j2WAHB+Fwh6RGwv8YW6C6yblDUtOLzMq+YxcH0HUXAIzH8bI0M9iN7cXlaiDG6YDmPih8aJTZ5UxMCeMH6JZc8PgLot2SIm75yjgPpcNYeL8asznrzdzzn6o/mdTjittFgtqgZqNXrJgF2C1U2azNj5rm2l/9TwL5fLdmXSlKhVUvyDmbM69Sm0bK8TGOC/ou1fbHcjNbJNEAKb9dIRwY6eFAWMjTbuahuevDYXCYUzhiqdF/vHieiG/N7SNwnT7zFt3eiF8GDaCBQARGG5Sei089rN7a0hTQ4lhtRctbCZUROMEPHkBsMf01uhM4CSXVuJ4bCBwiHl2NogRrk/Up28ULriZxp+DiWfoy2y2AuPzhrvmRrwrfuAzbM9VA5vpBt3GD6AFUp+F0ujblURHV0XQyhQAOHYfaiAWt7dA2+TLFy6kgihbw9fjrlpDspW3wUyWR0iGFqDOUpkPkd3awwD1ipqEJs3531FH9kpmILsOB6MkIoy7avOftAHZkd2NSmNdb1E9uPJzSx+FlyRKL6e4qArV6wGwNgzK4iHLA1n3hJdEkiXuUmxfpMvSGMEgHTfZJMDTH91PeCUosM+LvsEMfHMCRrDgplk9gmlXmFdeWsF8t+f20LdoMg6g4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(23010399003)(366016)(38350700014)(6133799003)(56012099006)(5023799004)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fkiksmD5FrGVSgObDnd/ycTjQTPB+5ib22TpdOG6YaXUAWy7sTOJ+oVOZv7d?=
 =?us-ascii?Q?qQ8IjySaQNBen3eXtnkHMy+L3CjSwAQd+2bdIY2gC2CD+hWb9zzDKc9J+GiB?=
 =?us-ascii?Q?Vj2o+CJE5YkMr78IeHKsslqiZ8JiWMYV3DM4aSiMDGtPgdx75YVQCE7PIeih?=
 =?us-ascii?Q?yfs6ve2vMIF3qO93zl3gRKpDuS42M98T3ysW+84oj9hs6wub1EMETORH7ACw?=
 =?us-ascii?Q?wnyXTQhqQ/C4mZPRhdQnMWBgZnnt5YKjfgxBKmsoMyLJjwF2H2U5fL2PRLH8?=
 =?us-ascii?Q?63QjoEmI79MWwQk/RjdJyY6RNBYY2PWeYR70nKMEg/K8mxy98RmVZtZT/1cy?=
 =?us-ascii?Q?9g8ixOKVKrp8TRHIsVNw8rytneND8k11klDspdUZaOSggL4v74WcPSWgAU7b?=
 =?us-ascii?Q?H3iXrb2cGquY4mhsBXku6iHhmUmi2u87OiXHI6Duzly7GxIbF8g15AnSpHr/?=
 =?us-ascii?Q?e1NtZQZeYeqhXcoq8KGekQ3HdbTVE2FaEGPHHds0c02HB5eGgFeqEDnotpTs?=
 =?us-ascii?Q?SAURhwpFT3C3eaGzz1wSRx5q4jyEyRrLk/E8uwgVwuc0QY/TmpkdmWylD0qz?=
 =?us-ascii?Q?y++N94EMKjNsukb/ZM1CL4IenizwJ8q1jxqt1BNH6fDCKfkQQKTndK2HBGZ1?=
 =?us-ascii?Q?NYPcb7gtf0kzYMne2RRQ9eOcu8IS1Jhh5fB/FwAUykYWf0UO8M+fonHB9Oia?=
 =?us-ascii?Q?SwVy1to4I8AGp0fdXYB6FWH3xhLZvPBO5CT4VxNFgHxAzpb5syaU0uA0nBlo?=
 =?us-ascii?Q?1JoyeFfZ2Jc03Pk7XyGkPN6ipVqtCE/PoeVlWdlxKxMj3HG4q4RexeJXlQWu?=
 =?us-ascii?Q?zH5/wGP2dYcbB8hhwtJa1Y3MbmVIupQ1H/dfRYjMLfCGUOP8dDSUWEgR/+j4?=
 =?us-ascii?Q?MEWeJV1iOLE3lGbP5pq8s5xd6nXGY3JsKlrlFg8zmrnQpKJWYRLD39fuF2Os?=
 =?us-ascii?Q?+uJRDR7MHP+fyz2HvtjDzvx165D41VoSw98Nuf5Z7aW29JWXgaWd9SRuBazK?=
 =?us-ascii?Q?5Zt57Tiu7XgywwUgvvc9+mNEktVE9saY5Rx/wjRp883tGJc9ld9mh5hY4MQS?=
 =?us-ascii?Q?ja4wb4/cz1s3EIMsmcJHudbV4EpQrQ1PJeJMwdZ/8p9UEnWFRLVafp4JIQMJ?=
 =?us-ascii?Q?hLnMCvqKyLs2HDFznC/IuKnYA/l3oHB891k7KUq0dt0Gdo6AEOLUdDRpOufO?=
 =?us-ascii?Q?xHJI66G6QN1MXWguylwajxmXKybQHwaYFUn+LXk60lGHInrm6RTDpcMWtZEI?=
 =?us-ascii?Q?btrlC5hsoAXgXgBtMh08FwCOY2JEMzpKaE8apn7gCXAkK19omh3AUp061oWV?=
 =?us-ascii?Q?1G3ZM8aY8nn6gijFJXs7b1c9HXdWkJyMxhdOevBHgBQFVzqlqQC5csjTbkew?=
 =?us-ascii?Q?LY8F4xgZ2k+pdufxntCaM9FFg+lVrop6iJK9DmL/s3kjSXRJ3rK15w3l+Vs5?=
 =?us-ascii?Q?n8InvBO86e94LWnhbwHznXAZSg955JHArdLkyr/ufPsDorjnhOXqacrwOkQg?=
 =?us-ascii?Q?IpcrUmsUBU60CAnPiUDthm2RQmoKpAcwchD9hZL34IQtHZMAhqzTFkSRr/il?=
 =?us-ascii?Q?n5WxZq3czs6qE8xUUlIMTK8HWann3PyxOx3P+bOUdyfLOfrADtGVgeXOpLlH?=
 =?us-ascii?Q?uRbI2C/53Vtaxx4LgTUXRWqVbfpo/e/LBoi1Thrr5233/1X0idn0VOHqZs9h?=
 =?us-ascii?Q?j3IUWoyuJte0vN2ThOeRnVLLx0bOllOE4YTOgnwV5iCAvae9zj2JVpMIPH7M?=
 =?us-ascii?Q?nJIAwP/sSFcg71tljEHC7or1YyKENvo=3D?=
X-Exchange-RoutingPolicyChecked: 
	QkkWeMIMOP99nOjCf3GbW8pQpa4x7c6lClB5sJ+9rByXNflErquCpQjgmAUFsQKIoG6zlbGh/Da28Smsas4TBWbqVJmu6FnU0DGLngJdHkYN2FBoQSCeUBP5Cw9M3GpsGnoCIme2bK4qz0ZIOi3rks/Tsh7ed7Q6thJuS1qQwI6JSkB2TDdMQEv+84/ce6ujpA0/kM/9bWzj6pjV3PuzRn+7sdEKmHa9+ptRxlYL3MNhB7VRbuWahJUG97RgdI3m738Z7800m+aNUNgqQSjuv2rZ4g6Gl7IohCnXF3GUKMy460E+ClJ7va+ii3te8IbKTkMX/JDE4Valyy2qwkVZjA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b62f416-adff-4517-f469-08def1de09ec
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 04:08:28.6312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4uBQ7/GN6ECDUGoE9GXZy7wHV8eJxUKozOYqD25IEU9m/k7rr6rkq9rxJ2x0z7K26qU9kLyU20q80ThUdZcqaoMfOQDNt7eDU4HjzJS8uhI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB737119
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: gv50lLt6HAQO2Na1_pHNtjbMFCu2boMA
X-Proofpoint-ORIG-GUID: Rd0k0BBOv39OFAsCVVU4yWgayb35mvmD
X-Authority-Analysis: v=2.4 cv=afFRWxot c=1 sm=1 tr=0 ts=6a7165bf cx=c_pps
 a=i69ZgmgbQZPDBD2C4G6j1A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=NEAV23lmAAAA:8
 a=t0rKf4AJ0CnzStvd_OYA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDAyOSBTYWx0ZWRfX2+9kq2sUn6Cy
 uR0knxaIxQ+ZJM8awdifegu7xTM5bhpOzm7KNh4DU8dhbLsDIAqGKViNPN7c6O/D7v28hnXXdQI
 wujJl16PSqZf+8qU8yMLscNk6STG1rI+7gvygC0Fx2/kAoCFXxMkJScy1y4PCW+F36LHsHVC7GX
 D0nTKiEV506UHNMHlFs7GY74ZcM3PlM17u6F/feitSk8H8bXEwJiybJLiqj3ojxw464yENlVKps
 FWj4tq3aPYarsRdYItgM/3dKJRF6raYim+D1fV0+VLyPirVn5dbBrQdBOWfgaUU/nDrIhErTWiS
 6gZ0hLgPXsd3xdfwfsj2ysa9cVaMZG5q+rNdQRnh3pFMpHE0B0XgpTwt2OeR2HS5wbJT928NwGl
 d/Xm44pPIlzxvaNYVKnrCmAlFBB6ueWXFBmCbvAmMFriOM78vY+o8+nalepFcEyi3kCAwBwjQ6f
 ScTJ0gVX1aRhgBKWjjQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDAyOSBTYWx0ZWRfX3EPsEj0qrW6H
 meYEtj0foE0jW2vY9W0UVaYPOEPZ6Fv27rapiRbBD2ew5dHmGcc1u5ZkbVDipE2P+qksi06klBd
 MdnEJuiP0gM0Bac1FK+IZcLr8Fc0+bBKlI/PVA1jYTIm3EP277PM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_01,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 adultscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040029
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 04:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242686

* V12:
  - The previous libarchive-related changes for 3.8.8 are no longer
    applicable because libarchive has been upgraded to 3.8.9. Updated the
    implementation to work with libarchive 3.8.9 and applied the upstream
    fix for "attach filter to correct bidder".
    Upstream patch: Upstream patch:
    https://github.com/libarchive/libarchive/pull/3346/
 
 -  Dropped the following changes:
    rpm: lib/oe/package.py: Filter out /usr/bin/pkg-config file dependency
    rpm: Filter /usr/bin/pkg-config from RPM auto-generated Requires
  
    Why drop the old change:
   The filedeprunner() fix runs at OE's external scanning stage
   (do_package), but RPM 6's internal dependency generator runs later,
   inside rpmbuild itself. It re-adds Requires:
   /usr/bin/pkg-config regardless of what OE filtered. The old fix simply
   operates at the wrong layer it's like closing a door that RPM 6 walks
   around.

   Why the new changes:
   It operates at the same layer where the problem originates, inside
   rpmbuild. By setting __pkgconfig_provides and __pkgconfig_requires to
   %{nil}, we tell RPM 6's internal
   scanner to skip pkgconfigdeps.sh entirely. This is the RPM 6
   equivalent of what _use_internal_dependency_generator 0 did in RPM 4
   just scoped to pkgconfig specifically rather than globally.
  
  With these changes, the previously observed test failures have been resolved:
  - bitbake core-image-sato:do_populate_sdk 
  - bitbake core-image-sato-sdk: do_rootfs 
  - bitbake core-image-ptest-glib-2.0 
  - bitbake core-image-ptest-libarchive
  - bitbake core-image-ptest-libarchive:do_testimage

* V11: 
 - Added 0001-pkgconfigdeps.sh-Do-not-emit-usr-bin-pkg-config-as-a.patch
   To fix "bitbake core-image-minimal-dev" Could not invoke dnf. Command...
   pkgconfigdeps.sh unconditionally emits /usr/bin/pkg-config as a hard
   Requires for packages shipping .pc files. In OE/Yocto cross-compilation,
   pkg-config is a host-only build tool not needed on the target rootfs,
   causing failures with -dev packages.

* v10:
  - The ARCHIVE_FILTER_RPM macro was commented out in a previous
    libarchive change, causing do_compile_ptest_base to fail with:
    error: 'ARCHIVE_FILTER_RPM' undeclared
    Restore the macro definition. The ptest now compiles and passes
    successfully.

* V9:
  - Updated SRCREV to the 6.0.2 tag.
  - Incorporated all V8 changes and updated them as needed for 6.0.2.
  - Dropped
    0001-scripts-pkgconfigdeps.sh-Use-pkg-config-from-PATH.patch
    from V8, as it is no longer needed. After filtering out the
    /usr/bin/pkg-config file dependency, "bitbake core-image-sato -c
    populate_sdk" completes successfully without the patch.
  - Fixed the filtering of the /usr/bin/pkg-config file dependency.
    pkg-config is a build-time tool, not a runtime dependency. Filtered
    the /usr/bin/pkg-config dependency automatically detected by
    pkgconfig.attr for packages containing .pc files, preventing
    unnecessary hard runtime dependencies in -dev packages.
  - Removed v8 libarchive-related changes since the latest version
   (3.8.8) already includes the required updates.
  - Fixed the "oe-selftest -r debuginfod.Debuginfod.test_debuginfod_native"
    failure observed after upgrading to 6.0.2.
  - Verified that previously reported Autobuilder issues are no longer observed.
    The following builds/tests were successfully completed:
     "bitbake core-image-minimal"
     "bitbake core-image-full-cmdline"
     "bitbake core-image-sato"
     "bitbake core-image-sato world"
     "bitbake core-image-full-cmdline:do_testimage"
     "bitbake core-image-minimal:do_rootfs"
     "bitbake core-image-sato -c populate_sdk"

* V8:
  - Fix build with systemd (Check patch 7 for detailes)
  - Make rpmbuild can find the pkgconfig (.pc) files in /usr/share/pkgconfig 
    (Check patch 7 for detailes)
  - Backport a PULL from git/libarchive to fix oe-selftest failures.

* V7:
  - Add 0001-scripts-pkgconfigdeps.sh-Use-pkg-config-from-PATH.patch:
    To fix "bitbake core-image-sato -cpopulate_sdk" error on Ubuntu 24.04 when
    pkg-config is installed on host, now the host contamination has been fixed,
    and the patch has been submitted to upstream:
    https://github.com/rpm-software-management/rpm/pull/4127

* V6
  - Fix -cpopulate_sdk error when DISTRO = "poky"

* V5
  - Fix RP's comments: Don't hardcode libc6 into package_rpm.bbclass
  - Use SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN} to fix the loop dependencies
    between /bin/sh and libc.so. 

* V4
  - Fix loop dependencies issues for libc6 and busybox
  - Fix issues for can't find pkg-config files (.pc) on qemux86-64.

* V3
  - Fix Alexender's comments
    a) Suppot rpm 6
    b) Move rpm-setup-autosign to rpm-build
    c) Remove -DLIBELF_FOUND=False

  - Fix build for nativesdk-rpm

  - Drop patch for createrepo-c since it has been upgraded (rev:
    804a238c8a4e86c2bcfb2192d54cb861d5fd32a6)

* V1 & V2
  - Initial version


--
# Sumanth Gavini
# Wind River Linux 

-----------------------------------------------------------------------


Sumanth Gavini (8):
  package_rpm.bbclass: Drop external dependency generator to support rpm
    6
  package_rpm.bbclass: Define _lib and _libdir for rpmbuild
  lib/oe/package.py: Don't add ldconfig_postinst_fragment for glibc or
    musl
  lib/oe/package.py: Don't redirect stderr
  target-sdk-provides-dummy: Add pkg-config to DUMMYPROVIDES
  rpm: 4.20.1 -> 6.0.2
  libarchive: Make it work with rpm 6.0.2
  rpm: filter /usr/bin/pkg-config from RPM auto-generated Requires

 meta/classes-global/package_rpm.bbclass       |  90 +-----
 meta/lib/oe/package.py                        |   5 +-
 meta/recipes-core/glibc/glibc-package.inc     |   5 +
 .../meta/nativesdk-sdk-provides-dummy.bb      |   1 +
 .../meta/target-sdk-provides-dummy.bb         |   1 +
 meta/recipes-core/musl/musl_git.bb            |   4 +
 ...olor-setting-for-mips64_n32-binaries.patch |  22 +-
 ...akeLists.txt-Fix-checking-for-CFLAGS.patch |  46 ----
 ...et-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch |  50 ----
 ...satisfiable-dependency-when-building.patch |  18 +-
 ...lib-rpm-as-the-installation-path-for.patch |  24 +-
 ...1-Do-not-read-config-files-from-HOME.patch |  18 +-
 ...-PATH-environment-variable-before-ru.patch |  16 +-
 ...lling-execute-package-scriptlets-wit.patch |  12 +-
 ...not-insert-payloadflags-into-.rpm-me.patch |  18 +-
 ....c-fix-file-conflicts-for-MIPS64-N32.patch |  18 +-
 ...kgverify_level-to-digest-as-RCPM-4.2.patch |  35 +++
 ...-Do-not-emit-usr-bin-pkg-config-as-a.patch |  59 ++++
 ...ools-elfdeps.cc-Remove-format-module.patch |  38 +++
 ...prefixing-etc-from-RPM_ETCCONFIGDIR-.patch |  26 +-
 ...avoid-using-GLOB_BRACE-if-undefined-.patch |  14 +-
 ...ge-logging-level-around-scriptlets-t.patch |  14 +-
 .../rpm/{rpm_4.20.1.bb => rpm_6.0.2.bb}       |  15 +-
 ...-Verify-that-bidder-and-filter-match.patch | 101 +++++++
 ...nd_filter-Use-last-bidder-for-filter.patch | 185 +++++++++++++
 .../libarchive/0003-Remove-bidder-name.patch  | 258 ++++++++++++++++++
 .../libarchive/libarchive_3.8.9.bb            |   3 +
 27 files changed, 825 insertions(+), 271 deletions(-)
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-Fix-checking-for-CFLAGS.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-set-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-macros.in-Set-_pkgverify_level-to-digest-as-RCPM-4.2.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-pkgconfigdeps.sh-Do-not-emit-usr-bin-pkg-config-as-a.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-tools-elfdeps.cc-Remove-format-module.patch
 rename meta/recipes-devtools/rpm/{rpm_4.20.1.bb => rpm_6.0.2.bb} (95%)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-append_filter-Verify-that-bidder-and-filter-match.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0002-append_filter-Use-last-bidder-for-filter.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0003-Remove-bidder-name.patch


