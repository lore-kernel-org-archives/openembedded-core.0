Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2148C27C4F
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 05:57:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.18773.1719381418305459130
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jun 2024 22:56:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6907085cc7=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45Q2FRmT002077
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 05:56:57 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ywktwuk38-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 05:56:57 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45Q5uuHH017003
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 05:56:56 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2040.outbound.protection.outlook.com [104.47.74.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ywktwuk36-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 05:56:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QgFsCakn0P5GPJfjUiaxrpxEgC2scrA8QSACRHOKsNgDNsdNp/dR5sgpjskAiE9wvmHZqKJm4zxHXQQzVuDfNPcl480ZI6pQx94vbUxSjPZlFJ8xHO1jwFxtsiaYvz22KqwX7RKQv+B7FI9AAwuMQSP0Y5JClbLSW1shKXwYkXG5dJWLVwjBM++LUP1IShIpZbXHhsPmJm22KwO/S9c35JLcEg1elU59ucUZJAkMVAKV7QLT3PyQ+Xve3g2W95k7Y1al8RJ7F6KC410VbAEQzcoq2ECy9i8GJeQlzMXBJoM/76yew0ial9GegLFxttFm5T9lsESYcB1ImJjweT6OLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O1LhCUtQtkL1QHbIrOktxl7uQ+2MXj1XE7UEHYzkKjk=;
 b=OQEVPZ5UxNtgyCKcbY7mvdfkxj7IYbiP76NXRaiGV6XJ8GPVOLluYS642MQU0NKZ8/imNG7GjIa4c9PZDdTdOo3KdTvpQ/NWn2CvzWUrCrMRdA5Dl4u5L2B9bZUMbwyN+DZySeC463wy/OkkbsNcXIHYJ5TEk3Gev6Z02gHEEobiXe6bVxFYU5oTd3Qjm98MUlaJIy4UoyD8g40XPOWYcrsHG7OT1mQXjCnV6waxK8h+3nWeAFi148R3OPp56hiIBBy/Vj8jfV/0SZk2Pxc4o6XZFWqjW0hMDM5VD+Lx3q6JSc9d89I9ow30wsA8WIgPsMN8OyDO2mXkyavksqidTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by DS7PR11MB5989.namprd11.prod.outlook.com (2603:10b6:8:70::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.29; Wed, 26 Jun
 2024 05:56:54 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976%6]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 05:56:53 +0000
From: mingli.yu@windriver.com
To: openembedded-core@lists.openembedded.org, Ross.Burton@arm.com
Subject: [PATCH v2] acl: Fix nfs ptest failure
Date: Wed, 26 Jun 2024 13:56:37 +0800
Message-Id: <20240626055637.2195328-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=utf-8
X-ClientProxiedBy: TY2PR01CA0009.jpnprd01.prod.outlook.com
 (2603:1096:404:a::21) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|DS7PR11MB5989:EE_
X-MS-Office365-Filtering-Correlation-Id: bd31c195-d2ea-4411-2203-08dc95a4c791
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230038|1800799022|366014|376012|52116012|38350700012;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TnRJdTJ4K0NMWHZBR2Q5bmdTVlpyTktwdFcvNFZrRVJYd3dpWnAzc0FxaFN5?=
 =?utf-8?B?d2pJaVlUbkY0UFNwU3h6NVZNcVZrVXROdGxMeDRuMHdEcHlDTXBYSVlZWk5I?=
 =?utf-8?B?aGx5KzJZOFpjREFYak9PenBUMzNrRXZkNy9SZXFzd2kzNURJSlhSSGhsbldl?=
 =?utf-8?B?RFJOeTJ3YVdhZjlmRGhFUjdIdlplRnJoVDBCWUYzOE1BL3BiNHFkaFFrTUIy?=
 =?utf-8?B?Ulh3OGwzUFFzS3FNNWFMVnpjTDAzQzgwaWFiUmU4WXVLclMwMEVyTHYvc2JS?=
 =?utf-8?B?V1U5Q1NYenczSTNKV0cvZklhZ3BOdzZ4Uk1SQVhkbFBDQTJQRG1TcGdBVW5E?=
 =?utf-8?B?dVE1c1VMUHhSbjlJekx6bVBNLzdNV2Fidk9VM2ZoSnNqaEpDUGUyZXVXMklv?=
 =?utf-8?B?YzNiUk5kajRzZUVlM2RwVTI2V01GRnI2NDR6dXo4cGluU3lJcjRzcVJoU3Fq?=
 =?utf-8?B?cjdEYUxIM1dzdUN0RGtkUFdhN2xZdFNiRUQxVk1MVFlGelhTYnU2MG9wS0Q0?=
 =?utf-8?B?by85QnREYkhtYVEvNWFnRTVlaW8zU2E2cWdkVXNXVnprcEZad09VRjgzSmNz?=
 =?utf-8?B?SHU2bTBHcWVEazNzcmx3cmFlU2RpbGNkZ0FRSUV5UHJzTTlBMGV6eXBBbjNr?=
 =?utf-8?B?SnBESGJCVmlSOEt1TitDZzR4KzE1NGo4eTNJL1krUDZjUUprQWpNZU5xOU03?=
 =?utf-8?B?NzhmYTFmeFZsUjh3MUJYTVUxY3hFaHg0Sytqd3BCZmlkaWRMSGIwejNRR3VX?=
 =?utf-8?B?cXZNeCtNT1JoaFlTK2I4TDhPRm5ONENNT0JRUTdxVzBqU3VkaFZjRlVKZTRB?=
 =?utf-8?B?aDlicWNER2JGTzFkVFZWaVE1VDhOeGUvUDBQOVpPQlFiZEFSZTJwWUUvVG9h?=
 =?utf-8?B?Q3JTV1ZaSmJpak44ZHFSNHAvZDV2MXJyQzJXdy9lM1YzOFJYa1JXVFBhMzF3?=
 =?utf-8?B?dlVhdXpNWW44OENTRjRnLzNnRFBOc3hCNEgvTit0SmZYSzhOT084MTFVWWdv?=
 =?utf-8?B?eUs5Wkh2U25KYTNxU0lFanFUZ3dWS3VjRlhTYjVjelNwTUNTemtmOXkrR3Ri?=
 =?utf-8?B?eWRyazU1MUlZazIwQWZsSkhUeWs5TE9mbkVEM3ZqR1RZakNOaHJqRUhqZ0pp?=
 =?utf-8?B?YXNLQU1LMHJhRnp6cDNrUHJ5R2E5bHNxWkd2T0EyMTRwa1JJbTUvWDdpTnVP?=
 =?utf-8?B?aFVYZ0xEV2pXekRhRVlhNHFLUGtFczVuZ2lUM2UrZTdEMnlPNjVyZVNSczg1?=
 =?utf-8?B?Tll3OGxFTDYrLy9IVzBrQmgzLzJiZHprRWl2SDZEUmI4L0VMSjZrVjZ6OFpy?=
 =?utf-8?B?amNrc3VWWkpPQUtGaHFaTUJqL2hJN3VmeU1zRE5veG9WSnBBWFZrUlZvcmo2?=
 =?utf-8?B?czFXY3ZBZnJFY2x2U1BiYXJWZWJMc09YcmpPeGp3dDByUmdBaHN6NjdoNHRT?=
 =?utf-8?B?R20rOXFzZU45VGpSMi9pRndQTXdDUExwZnJGTS9ueVNubnhBSDlWUDQvdTBn?=
 =?utf-8?B?bXowYUFKNVpsL1JvRWpKNVBwdzNmN3lGL3NRS2h1OEtReHdUa2NkOWhleGt0?=
 =?utf-8?B?cWQ3ZHIxWUVXM3doZlkyL00rQTdMOFhKN1dXOTJpWjdtTEN5WGF0M0RrQ04y?=
 =?utf-8?B?R0dLd1BoNHVvNlJlOUJ4dExDS2JiL2lZUElCOFVuY1VvMlJWMmEzZXZlakJ0?=
 =?utf-8?B?NEtoQ1lLd2JnRG1kLzhGVVpkMXdFVGI5bEIvbDAwWC9JTi9wSlVRVVYvTUJQ?=
 =?utf-8?B?enRGL2NUNXloTmJwUTJvamxidGtvay82ejFxeEZWa09peFJwV2Fic0xpSC9p?=
 =?utf-8?Q?klxg6Q6trB/OdNmm+fI49zIER17kIy1df4wrw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230038)(1800799022)(366014)(376012)(52116012)(38350700012);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?a3o2ZWVxd0taMHp2T1VQQ2pjWnpPZE0yVk45eVRGZnJiOFR4THptSnpmOGJF?=
 =?utf-8?B?ekpieXk2d3NZUmovQ3lOUE1wSzBSWlVEV1VKZTN4K3lJdFFocncvUllJbWp0?=
 =?utf-8?B?VE1TVFdUYnRpdk14eHF3TSthYlBDOUprWEcwd1hZa1hkYjByMnI2clJaOFJV?=
 =?utf-8?B?anloNFQ5Vk9Zb1hkV29GSnh3NCtmQ0lSMHR4RHZwREtiZCtObGdvcHFlMkJv?=
 =?utf-8?B?ZUlnU1g3QkZ6OEVlbVJsMm1FdmUrZkl2dmxyVUg5eXJJUzNBZTZsTjRlaTlv?=
 =?utf-8?B?WTNHTHlCV3ZMRTljWWJxQ2dQa1NyNmRPelZjRkdCM0lsY3RnbnB0RmJQOTBm?=
 =?utf-8?B?V3g1Ti9kVGlHcUlCVUJNRXhzRTVBSisyZURJRnhJTU1rU2VWVTdUSnBiYTZR?=
 =?utf-8?B?MVZUT21La1pLUGxYU0dHdUtWTUcyVzhuRU5iRFBZRzgrY2xGMHc3d29hTk45?=
 =?utf-8?B?aGdwYmxxVW1sWG5UdmRhaVNlc1g5cit2VUxDWlNZaWIwbGd2TTNsQjZwKzRR?=
 =?utf-8?B?RnZaSkNEN1dQbVJuQWJkOVVtazZrcXdPOUVEU3laYUo0MVlmanRnK04yUlFJ?=
 =?utf-8?B?RWF3L29lakJwR1VxS2pacjd2aUFpbDQ4OTZNMCt1MFloRWFrS1hCNHJxc1ZS?=
 =?utf-8?B?bFVCNDNSN0lOanAzYWhML3FQam82aTY2RkFsdjdrSUxwb203aXkrSWhtL01T?=
 =?utf-8?B?RWkyQkk2TU83RGp3WmJDMDFaMnhVRmRFMzQvbS9rVmZjWExjNTlyb2x0S3Fl?=
 =?utf-8?B?bXpwMTdPdmVmb2xzMVdMdWhXTi9vNGxSNXRQR09MV3cyY2Y5TjdtR2NpZ29s?=
 =?utf-8?B?U2Z5VG1JUWdNR045K28xSTBEVWZESnlRTklUcEt3TEdjNGswSU9wTFpKY2lL?=
 =?utf-8?B?WkJ0RWZZVUxpRlJaSWtxOG9Zd1FpSXF2U1ZCSTlzTzdKU2l5dS9vS0RUSElZ?=
 =?utf-8?B?RmthVkg5VFhpcjZQbnpUbnFuT2c5MXBoSXlkd0JaWFA2b1NKZzEzckdPRWdj?=
 =?utf-8?B?czZoVnVybU1rOU5kMVJlY01VNHAyNGt2eVdNWUhtSmR4REFFTWh2Z0VRRE5Z?=
 =?utf-8?B?bXk1RFVNNVd6R3pPQTk2UlVpWmJCQVEzeFFVTEhMYjVFbkxpcTlaNmhMWkdP?=
 =?utf-8?B?MEJjV2xPaTREN2RoWE5GOXJqcERFODIyUDIzUGk4TDFPdmFUaTZ2cWVkZW9S?=
 =?utf-8?B?YVppZmVkSElrM2I1MmZQZlQ3R0g1d2lhVVB6U2xnRmc2RmxLSkorSzJJeWk0?=
 =?utf-8?B?OXNWTWxDL3VCdDQ2eTAyQlZ6d2ZHWnoxSVVncGw1UUROUGJ0L1NkOUV5bzZE?=
 =?utf-8?B?dk4yWXJWTlRxeEx3TjE1REMremZBenNjemlqb2VDc013anRuUXdVQ1lVVnJ3?=
 =?utf-8?B?cmRMYzVwZkk5Z2hnZzN0TEhHc3I0MFhEaWR1ZDhFOFZJQlVabTdUaWxxUHFi?=
 =?utf-8?B?bDBKSFdXb1VaWTEzSmRFVjFFakhweXJKTVplNTFJbGxkRGFtb056emxVSUhQ?=
 =?utf-8?B?Q05JL3B6eWpkYXh3SmRDU01NNXEzcU40OStScG1seGpnS2VaSHhTQnB4N3F5?=
 =?utf-8?B?ZTFmOWdrdnFEZzB4VnptZWo4NDFVam9uSDF2VnV0bS9zZ3hJQlFLcEczQ25X?=
 =?utf-8?B?T1NJZC9EVWRpSlY0ckdhd3IwU3daM3N4WWxVN3E1YkE1RU5waDFneEVreDdy?=
 =?utf-8?B?K3J5d3RZQkt5VHo2WUxYdlU5Vk4rS0NuaFpvd01PdkgyRTBISnY1akZjNnFY?=
 =?utf-8?B?NTczY3k4Rk8rcWl0ZEcyNjJkYVpmYm9NajlkWGVITEM3OFB5RnJvdW5EbXZZ?=
 =?utf-8?B?cHpnS0RsVVJGWmxhWk03aE54MlV2Myt0S3I4bWxGYnJTL0s1SCtDclVtamxS?=
 =?utf-8?B?T0RKTmh5K0szeHBCWXd3bFczcjh6YWk0R1VRMVllaUYyL0JrbFJHVVdKbU4z?=
 =?utf-8?B?dGQxNFc1aFRSUUJvYTczSE9YVmU3NlVTanhhcGpYU01UNzVTanAvTmI3Q3lF?=
 =?utf-8?B?K2ZGejI3RFdmdWF1YzRQQ1pnVTBFWnYzTUwvYkd6Ym9majQ4Nk1KQjFLNGp4?=
 =?utf-8?B?RkVWbVI4bEpwcWlkTXFUWTN2V2x3NnErN1p6UGFjblhmK0NhWEtRSTMySWtE?=
 =?utf-8?Q?MsaEEqsIPcwOHWHX+n1ZHw7tq?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd31c195-d2ea-4411-2203-08dc95a4c791
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 05:56:53.6642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +dMkfxAA8om1vtk9xZCCd5X26gnXnXnlNIjzzPyC7xcVavIy8fTax9a33WBZ4yCK5MwUmJlWLG+TRR2bO8uP1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5989
X-Proofpoint-ORIG-GUID: rzKPyfk2JJStqMWNnSivQ49gm8g0Q-z0
X-Proofpoint-GUID: tGJyTPt_oCdOH24qNMDrVUKxPJ3Uhxch
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_03,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2406260044
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 45Q2FRmT002077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 05:57:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201151

From: Mingli Yu <mingli.yu@windriver.com>

* The date such as "Jun 13" should take 2 columns, so the expected check
item "test/sub2" should the column 9.
 # ls test/sub2 -dl
 drwxr-xr-x 2 root root 4096 Jun 13 06:01 test/sub2

  Corret the check item to fix the below failure in the test/nfsacl.test.
  [11] $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$8}' -- fa=
iled
  drwxr-xr-x 07:23                      !=3D drwxr-xr-x test/sub2
  -rw-r--r-- 07:23                      !=3D -rw-r--r-- test/sub2/blah

* Use the abosulte path otherwise we won't find the expected file blah.

* The calls to getgrnam_r would always fail because the size of the
buffer was smaller than the minimum (170000) specified in the test
implementations of getgrnam_r and getpwnam_r.  Use test_get*_match direct=
ly
because getpwnam and getgrnam should never fail on ERANGE.

This commit fixes the following failure in the test/nfs/nfs-dir.test test=
:

[16] $ su bin -- failed
su: user bin does not exist           !=3D ~

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...s-nfs-dir.test-Use-the-abosulte-path.patch | 46 +++++++++++++
 ...s-nfsacl.test-Correct-the-check-item.patch | 51 ++++++++++++++
 ...0001-tests-fix-getpwnam-and-getgrnam.patch | 67 +++++++++++++++++++
 meta/recipes-support/attr/acl/run-ptest       |  2 +
 meta/recipes-support/attr/acl_2.3.2.bb        |  3 +
 5 files changed, 169 insertions(+)
 create mode 100644 meta/recipes-support/attr/acl/0001-test-nfs-nfs-dir.t=
est-Use-the-abosulte-path.patch
 create mode 100644 meta/recipes-support/attr/acl/0001-test-nfs-nfsacl.te=
st-Correct-the-check-item.patch
 create mode 100644 meta/recipes-support/attr/acl/0001-tests-fix-getpwnam=
-and-getgrnam.patch

diff --git a/meta/recipes-support/attr/acl/0001-test-nfs-nfs-dir.test-Use=
-the-abosulte-path.patch b/meta/recipes-support/attr/acl/0001-test-nfs-nf=
s-dir.test-Use-the-abosulte-path.patch
new file mode 100644
index 0000000000..c48ee9f820
--- /dev/null
+++ b/meta/recipes-support/attr/acl/0001-test-nfs-nfs-dir.test-Use-the-ab=
osulte-path.patch
@@ -0,0 +1,46 @@
+From e87562e4e03450e380bd1ce8e11c561e8f9653d2 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Mon, 17 Jun 2024 11:22:21 +0800
+Subject: [PATCH] test/nfs/nfs-dir.test: Use the abosulte path
+
+Use the abosulte path otherwise we won't find the expected file blah.
+
+Upstream-Status: Submitted [https://lists.nongnu.org/archive/html/acl-de=
vel/2024-06/msg00001.html]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ test/nfs/nfs-dir.test | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/test/nfs/nfs-dir.test b/test/nfs/nfs-dir.test
+index 33e5f5f..7216a6e 100644
+--- a/test/nfs/nfs-dir.test
++++ b/test/nfs/nfs-dir.test
+@@ -14,7 +14,7 @@ EXPORT_PATH =3D> the path that is mounted at the worki=
ng directory.
+ 	Make sure the file can be accessed before.
+=20
+ 	$ su bin
+-	$ cat test/blah
++	$ cat %{EXPORT_PATH}/test/blah
+ 	> blah
+=20
+ 	Set up a situation that triggers the bug.
+@@ -36,12 +36,12 @@ EXPORT_PATH =3D> the path that is mounted at the wor=
king directory.
+ 	fail with "Stale NFS file handle" or "Input/output error".
+=20
+ 	$ su bin
+-	$ cat test/blah
++	$ cat %{EXPORT_PATH}/test/blah
+ 	> blah
+ 	$ sleep 3
+-	$ cat test/blah
++	$ cat %{EXPORT_PATH}/test/blah
+ 	> blah
+-	$ cat test/blah
++	$ cat %{EXPORT_PATH}/test/blah
+ 	> blah
+=20
+ 	Clean up.
+--=20
+2.34.1
+
diff --git a/meta/recipes-support/attr/acl/0001-test-nfs-nfsacl.test-Corr=
ect-the-check-item.patch b/meta/recipes-support/attr/acl/0001-test-nfs-nf=
sacl.test-Correct-the-check-item.patch
new file mode 100644
index 0000000000..f990ca4a31
--- /dev/null
+++ b/meta/recipes-support/attr/acl/0001-test-nfs-nfsacl.test-Correct-the=
-check-item.patch
@@ -0,0 +1,51 @@
+From dfc6328f02821f9c6703f764ec6f53cf81daaab6 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Mon, 17 Jun 2024 11:00:43 +0800
+Subject: [PATCH] test/nfs/nfsacl.test: Correct the check item
+
+The date such as "Jun 13" should take 2 columns, so the expected check
+item "test/sub2" should the column 9.
+ # ls test/sub2 -dl
+drwxr-xr-x 2 root root 4096 Jun 13 06:01 test/sub2
+
+Upstream-Status: Submitted [https://lists.nongnu.org/archive/html/acl-de=
vel/2024-06/msg00002.html]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ test/nfs/nfsacl.test | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/test/nfs/nfsacl.test b/test/nfs/nfsacl.test
+index 4f37322..dfcc323 100644
+--- a/test/nfs/nfsacl.test
++++ b/test/nfs/nfsacl.test
+@@ -8,7 +8,7 @@ The test should be run on an NFS export mount with ACL s=
upport.
+ 	$ echo blah > test/sub/blah
+=20
+ 	$ cp -rp test/sub test/sub2
+-	$ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$8}'
++	$ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$9}'
+ 	> drwxr-xr-x test/sub2
+ 	> -rw-r--r-- test/sub2/blah
+=20
+@@ -23,7 +23,7 @@ The test should be run on an NFS export mount with ACL=
 support.
+ 	>
+=20
+ 	$ cp -rp test/sub test/sub2
+-	$ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$8}'
++	$ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$9}'
+ 	> drwxrwxr-x+ test/sub2
+ 	> -rw-r--r-- test/sub2/blah
+=20
+@@ -31,7 +31,7 @@ The test should be run on an NFS export mount with ACL=
 support.
+=20
+ 	$ setfacl -m u:daemon:rw test/sub/blah
+ 	$ cp -rp test/sub test/sub2
+-	$ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$8}'
++	$ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$9}'
+ 	> drwxrwxr-x+ test/sub2
+ 	> -rw-rw-r--+ test/sub2/blah
+=20
+--=20
+2.34.1
+
diff --git a/meta/recipes-support/attr/acl/0001-tests-fix-getpwnam-and-ge=
tgrnam.patch b/meta/recipes-support/attr/acl/0001-tests-fix-getpwnam-and-=
getgrnam.patch
new file mode 100644
index 0000000000..2fea254fec
--- /dev/null
+++ b/meta/recipes-support/attr/acl/0001-tests-fix-getpwnam-and-getgrnam.=
patch
@@ -0,0 +1,67 @@
+From 6398d3fe7a766b4e3cd15bb77fd0f15f7dba52b2 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Luk=3DC3=3DA1=3DC5=3DA1=3D20Zaoral?=3D <lzaoral@redhat=
.com>
+Date: Wed, 19 Jun 2024 11:11:30 +0800
+Subject: [PATCH] tests: fix getpwnam and getgrnam
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+The calls to these functions would always fail because the size of the b=
uffer
+was smaller than the minimum (170000) specified in the test implementati=
ons
+of getgrnam_r and getpwnam_r.  Use test_get*_match directly because getp=
wnam
+and getgrnam should never fail on ERANGE.
+
+This commit fixes the following failure in the test/root/restore.test te=
st:
+
+[21] $ chown bin passwd -- failed
+chown: invalid user: =E2=80=98bin=E2=80=99        !=3D ~
+
+Fixes: 3737f000d3f17cd283f51eeacac21a71a3472053 ("use thread-safe getpwn=
am_r
+and getgrnam_r")
+
+Upstream-Status: Submitted [https://lists.nongnu.org/archive/html/acl-de=
vel/2024-06/msg00000.html]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ test/test_group.c  | 2 +-
+ test/test_passwd.c | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/test/test_group.c b/test/test_group.c
+index 96dd612..42d6b07 100644
+--- a/test/test_group.c
++++ b/test/test_group.c
+@@ -136,7 +136,7 @@ struct group *getgrnam(const char *name)
+ 	static struct group grp;
+ 	struct group *result;
+=20
+-	(void) getgrnam_r(name, &grp, buf, sizeof(buf), &result);
++	(void) test_getgr_match(&grp, buf, sizeof buf, &result, match_name, na=
me);
+ 	return result;
+ }
+=20
+diff --git a/test/test_passwd.c b/test/test_passwd.c
+index 9428bf8..97f2673 100644
+--- a/test/test_passwd.c
++++ b/test/test_passwd.c
+@@ -119,7 +119,7 @@ int getpwnam_r(const char *name, struct passwd *pwd,=
 char *buf, size_t buflen,
+ 		*result =3D NULL;
+ 		return ERANGE;
+ 	}
+-	last_buflen =3D- 1;
++	last_buflen =3D -1;
+=20
+ 	return test_getpw_match(pwd, buf, buflen, result, match_name, name);
+ }
+@@ -131,7 +131,7 @@ struct passwd *getpwnam(const char *name)
+ 	static struct passwd pwd;
+ 	struct passwd *result;
+=20
+-	(void) getpwnam_r(name, &pwd, buf, sizeof(buf), &result);
++	(void) test_getpw_match(&pwd, buf, sizeof(buf), &result, match_name, n=
ame);
+ 	return result;
+ }
+=20
+--=20
+2.34.1
+
diff --git a/meta/recipes-support/attr/acl/run-ptest b/meta/recipes-suppo=
rt/attr/acl/run-ptest
index 3af75c84fe..bc7947c3ad 100644
--- a/meta/recipes-support/attr/acl/run-ptest
+++ b/meta/recipes-support/attr/acl/run-ptest
@@ -6,8 +6,10 @@
=20
 mkdir -p /tmp/acl-ptest/test
 cp test/test.* /tmp/acl-ptest/test
+export EXPORT_PATH=3D"/tmp/acl-ptest/test"
=20
 set +e
+rm -rf test-suite.log
 make test-suite.log
 exitcode=3D$?
 if [ $exitcode -ne 0 -a -e test-suite.log ]; then
diff --git a/meta/recipes-support/attr/acl_2.3.2.bb b/meta/recipes-suppor=
t/attr/acl_2.3.2.bb
index 6178473873..ee86ce2cae 100644
--- a/meta/recipes-support/attr/acl_2.3.2.bb
+++ b/meta/recipes-support/attr/acl_2.3.2.bb
@@ -19,6 +19,9 @@ SRC_URI =3D "${SAVANNAH_GNU_MIRROR}/acl/${BP}.tar.gz \
            file://run-ptest \
            file://0001-tests-do-not-hardcode-the-build-path-into-a-helpe=
r-l.patch \
            file://0001-test-patch-out-failing-bits.patch \
+           file://0001-test-nfs-nfsacl.test-Correct-the-check-item.patch=
 \
+           file://0001-test-nfs-nfs-dir.test-Use-the-abosulte-path.patch=
 \
+           file://0001-tests-fix-getpwnam-and-getgrnam.patch \
            "
=20
 SRC_URI[sha256sum] =3D "5f2bdbad629707aa7d85c623f994aa8a1d2dec55a73de520=
5bac0bf6058a2f7c"
--=20
2.34.1


