Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA3EBCA1013
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 12:35:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.20811.1757075698169043299
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 05:34:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fYMlizjM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1343256814=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5856gSno730447
	for <openembedded-core@lists.openembedded.org>; Fri, 5 Sep 2025 12:34:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=9Tpf6bTjGyDQfVA78o7D
	wws7Y9mx/tU5iv7xzjLRPis=; b=fYMlizjMKibywIGeVRV1tgmlDU+8Vb+fAtYO
	YlFNBpmKElMx76yPrZa+HgryqoDxd1nnfOZcx+gu7ve+0cCS9tipEly5bLcwZuOT
	G/hUZ8UrDnqmXs6La72iLealQsPQKss+eNvnrUc3KK6tu/sw4NOMggTHR97ttT/B
	izKWBdvh9xsmGC5vOfhbIghwgm2cxQxh0BqtHZaQy9gpbk14Me+X8aPf7HvDAHxh
	TYXsXviY4Oy0/HLkENCv32XSt/dLAP4LaNOxWwJ2Mk0KOTUA1by/XEHPOnoOxIIi
	nKu8hz1LThqnoU0qHUOtNdOm/jXKKAK6nR4TeRybVNZbzl24zg==
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04on2066.outbound.protection.outlook.com [40.107.101.66])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48y7k2hwkc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 12:34:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aednRV0JtZHmav4R7qCsEELh+UcPyHiEnRW1DguI1173WifpOPFKrYE7G5cSJawQ9FHLi9UuuNMOgKTba10BJFKK98przVGURoJPc1bBmyr5RisMNl+PKYl1qq9o2awBnN+9XeazCQKgizylcMFsQ+FQcPkMGBwNgWd4PdC6N5A8muPk9TNjiO75QNroV533AlLC+OucbxYIzws8/NrgpmAsdtdNbYCp4Nu16N4mDYlv+ou8vMkpzj9fPU991fKs8pnjnMPobVeFGTvcWPMJS2o9ehl2ZowgNwKJ7fyi6wgtaMILMgJq+/TjK1yxR2jwp6QXpJavZIHSyIEqVWGoDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Tpf6bTjGyDQfVA78o7Dwws7Y9mx/tU5iv7xzjLRPis=;
 b=vF9VyAZ2ZTDdsRuZMzDli7xvd4YcN1QSqB2ffRlKPeTvEEKt33Kk4PllbnkcsuCsk1nw5TJVibGdOYBwEPG2Lmie0TKeYLYNVGFHsjXQJfz3ZU/BIItcTwwlJuvE8YPeS1WeV364tdZq3Z4FHD1NNMS0lxKu7BzLmhu2pocQYACB46QAtbtbUH4F8JCgIW5MTtr/Rml3EALranVXi73GyFsT/0ywaycI5JwCpWqBU/TzDzzGcfRbex4SdlOw4RhQPHXR4QRZo3XeP0eDalL+vZkQ1xm4D6HrCxSRc1G0LK7gKnfNZE+5hxb6XzycvPoHM0XsjiSKx3mCjT2+cW9Tgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by PH8PR11MB8038.namprd11.prod.outlook.com (2603:10b6:510:25e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Fri, 5 Sep
 2025 12:34:54 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%3]) with mapi id 15.20.9094.018; Fri, 5 Sep 2025
 12:34:53 +0000
From: haixiao.yan.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v2] environment.d-openssl.sh: fix unbound variable with 'set -u'
Date: Fri,  5 Sep 2025 20:34:21 +0800
Message-Id: <20250905123421.3940634-1-haixiao.yan.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYXPR01CA0046.jpnprd01.prod.outlook.com
 (2603:1096:403:a::16) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|PH8PR11MB8038:EE_
X-MS-Office365-Filtering-Correlation-Id: fbe0f896-d0b0-4eb8-5c9e-08ddec789d48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?cMqwaMr2e6GLinBR22qKTJ+42L6HL2tGe7R1xcCLnU30V5WEA6MDt8ND9RSV?=
 =?us-ascii?Q?eNCaJHpCLLYkB0mMZ9A2qQcaUeiIyVx4u8lzkBWGaYFwsRnTVezNb6DPeGWn?=
 =?us-ascii?Q?jTGaPlqzXRsa484jQW7J1xyQTS9JHPpBlD/uUqbwUY8BLU/4TTnJllfrz0OU?=
 =?us-ascii?Q?SdHtGHw/c7hsvALz5vt+t7TEqyQMY7m9wyu6MmUWMSa3FiZb3ySx7QDwqNNM?=
 =?us-ascii?Q?Q0AiIhhlJOfNjbTE44p0dewa5+4dl41eA4N1MuYbRoAvhEEeyY/VRH0urQKV?=
 =?us-ascii?Q?AdGY+0KqVCfRvQZv5UUzQCw/LQjwDYvDAX9L69DFTAd05/RULNclpTdEsfwv?=
 =?us-ascii?Q?V8267IGCv0IW2VMbqqWgKnKYn75yVEm9UORsCK6aIP952TR3OUvZZvXZ5CIG?=
 =?us-ascii?Q?D0TyhfHX4fMY18YDldRDo5pJjVyKOJKAOWX6ZhnJ8qPmqCSj1WxmxYx600IZ?=
 =?us-ascii?Q?r/LlNy8K/e/ai0CQtclfXzZsDpF18GpxC+iZdQ5B/h3Hgc0K+zvEGrFhDJ3u?=
 =?us-ascii?Q?DYPRI+b8255FQmAfSmkFGvo14hLD27yMZ4fA38OmFz+7ww8mqW2twe8rwL+R?=
 =?us-ascii?Q?tnhiPf6lhc2co9OgrY5Z+Vv8vNAiZMWB0TY6tcssIyyuo+AmzjeZRTvKb3a1?=
 =?us-ascii?Q?m46P3vWUAnXXh+yQy30SZJHapSFkfSJ1QyxJmQobYCktRNLInqJwdrM8CkyK?=
 =?us-ascii?Q?s0SXoThsRIx4JVEIsJXVa35j9YAiBapA+63Jc46O6YZ9HRmLheHOolpPRo+b?=
 =?us-ascii?Q?xaDbS6dVD2SM4tZdxzEhpo/Z8AlSKicotk5s10gj9n1vipDBlo8eatsCvoPq?=
 =?us-ascii?Q?uG3wt9bKs0ysQsgT2hqS7y4gD3igX6onqA6SZpPwDEhnxfnhLVZDCzJl/IyW?=
 =?us-ascii?Q?aZiQR8uWvEXaSCP+39jngd4guSU/gP2WwmhhfYJh2Or2AUu3/QOsa+ZjTCAt?=
 =?us-ascii?Q?CIwGPYIEg4bGvThu9KaYBu/UqSAsHtH8I+0AKCi5SuUMfrdmAC5GURmM0BfN?=
 =?us-ascii?Q?pB4IAdtp5CcJmJ2EuKxoLtTg0RWaU0jQsqME+U1YuX0sZlyicM1MhXAKgH/l?=
 =?us-ascii?Q?bk7Kt3uwXA5Jbyu9V3ORSDMlc1E9WIui28HPh9auO1wmpM1Puu7QlrIGgAoc?=
 =?us-ascii?Q?r+hEYwqoyjEmTNYsCgNY7EFs3J1lIsAgxf65xJBiKYdgB1nEQaiGYa5G0Caw?=
 =?us-ascii?Q?OKCa/m9BQWH2DNHEnBYHnRxioE87rblp8xh1+5RFkwWOLT23VxOSJIhDUSNc?=
 =?us-ascii?Q?p6QBKE5yf+jFT0X9Rfc31fz0jWcUnasCrhKx6maoLK7RMZ1baOE6R7shPMoW?=
 =?us-ascii?Q?saGNFs//qgAwsyKaVkM5VLhacwIPYB+qTAefYqOqpHavk6CN2yJJYbxu293X?=
 =?us-ascii?Q?CyONJtiudvkAH/vT7iiHsAS55mPxK6iuQk3J4OzX42+00pILFAwIlAY3Nw13?=
 =?us-ascii?Q?VPIjUtJx3QsIpilIw8sa+FcbS6mIp5OT/eSgPImHYwlv2mpHV2uQIA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LdhTbT3sBexFht1XbkB8s0ooWU/eBphdmmW9AsoxtXVDbhgLF5SxmBMm6YzZ?=
 =?us-ascii?Q?Z4h8dLUSRi/eQ+oRY2GP50xKvt3sq42z4RFJuzrjgmuBC8SzFinn98C4LnfS?=
 =?us-ascii?Q?ZSHO7w4y3DqVlF9inIGEelU+SurlcHJKOVcPsaRptT+faq421Bzbj2B0I4Up?=
 =?us-ascii?Q?YBxYEulWorwHYizehZh2SMd6C4coTJsnMz4+Mce9g506Qa9thmObZ4h/nMzw?=
 =?us-ascii?Q?Yj2un/WoYJCaOcvZWmapGiTOWggteo0F96op/1D8CB8XJNzt5gmeXu+BW6Ai?=
 =?us-ascii?Q?O5FAnij3dywGtB+2uAoAFSIJ0NV6hrXnKIvxlhtt0DJt/CjIK1jy4k12Rs+g?=
 =?us-ascii?Q?OFr60etH0tJXtHmnl654A5gh1780pcSGvjCbL6pVNf+PdoNm5m9zpKbw40YY?=
 =?us-ascii?Q?vyotg4AP1JJF9dhHE1EnsFjWcgDa60oXd8f2O/l16tUVVrUji4r2YvEP2/5f?=
 =?us-ascii?Q?tm13NOV89Ru3TZgduhO9G2lvTHUZPXT22JUZzuDoS9jZ5LFSigHDAtN3M6A7?=
 =?us-ascii?Q?eGKCj5s0xCaQtBh+YmTC2BMvvscY1bKAZDNgbkCVtpYtniw5Fc3hccrb9pXv?=
 =?us-ascii?Q?jW2vO/PSGHtwyZwiURhvoCGV/hsBaJZ4OJL0JSa80PEL2O9zoQljEpf0pON4?=
 =?us-ascii?Q?D4T9/6sjRA5hRLOlbPWerBHgkQZhB8dbQyfiAeCDawV06ArNo9KnPQLfRB2s?=
 =?us-ascii?Q?+F/NPghCsk7ttwDKHWBXd8vTQfTTffuMrx2EaVUeM5GrrdtqNHqbRlJyvHaM?=
 =?us-ascii?Q?lruRmFtxlVxLC0gjzNFoecS/fwdfMD5E1CgfJGwm8JFI1svuFJ0SoGvx9J3T?=
 =?us-ascii?Q?ra8XL45bWz3p4NHGoEupzvpFupmanb36Av9dJVyYgPKjv7EE8hdl7YhYbi78?=
 =?us-ascii?Q?K7Z0xYOBUUkUaOXH0rb+mcQDKmzcCJsVEt93qh8eXb+cOn3IOFLvvC3/WvYF?=
 =?us-ascii?Q?+/4MuYDBULh4D3iB0XqFWY3+sH96lKkw04FOxbFrtcJsKtVQGzsA+TooL82b?=
 =?us-ascii?Q?uSatBVysucPlbIF9YXS42eKA6AbXM7MhhhgBODlwEUz326npZzmXBY8hU+mv?=
 =?us-ascii?Q?5EbqOBujsWUd557qh5JqjZtgH82i1ey2uXAO/qw8N6uCDmgpPB/Y7dqYDNTw?=
 =?us-ascii?Q?eUnDI+xqjmYT2htaNw77ijnZqgjK3V7upX9SOa7IcAgE0Kst9bYT/njDKaSZ?=
 =?us-ascii?Q?ncWsCTt/mWr2rrMsm17JVR1eSQaJB9cgLGtPE4jntUoPS5r4vw6OLPr9dEkk?=
 =?us-ascii?Q?0khjJpSm7PWy6W1ozaQX1k4ya52SCndHf0mD4JWe1xlXKnvuseV6QMEswqiv?=
 =?us-ascii?Q?3NRkfiBkMAzJ6oteanXNcxA/cAZgHwQabPWGelGiI5hu7xYbuE9Xr3eX5hb1?=
 =?us-ascii?Q?XFAuIuCuc1OF6Z54f3iolymx1Vy4krq5bCDdarbokDcXRKAD23jKQpmyu39S?=
 =?us-ascii?Q?xLSnbvubZD79lbStMvrfqQPt+W/AUaIUB+dEIW2rweuvsk06ueHy6SHTltgO?=
 =?us-ascii?Q?+4pD5TXOddIeEGQXPY/6UslNl9eTXZu0tsC9OvH3j/H9u9xQ91xsMIE4PECI?=
 =?us-ascii?Q?wyuXVX7m45YBZra4Hz0Ok+Xh9hJ56Rtb5XN+kV/VnwRlxDYTLD7BAklS2NXP?=
 =?us-ascii?Q?qA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbe0f896-d0b0-4eb8-5c9e-08ddec789d48
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 12:34:53.8007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VRm2lLGDL2wumZt5BmfTS7Ioqo2s5wde0mSRvmEKtUEU7jaqKdm1lrszWgZ7ykhD+gronHFol5xjEgW/+W5mYDyhcFN0N/S2Z1diT3YqyrE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8038
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA1MDEyMSBTYWx0ZWRfX7pTbiudY9oYI
 N3uUTGZMj0JzTOME82RYnol4PaL2peHfLGJ2FoKmgIa0luKhSs/+l3Nupf2olhSB7LfLBfXR6+m
 AxtdRlSK2hMjVzDez16q+6DmOKK1uqUBrPNFnfz10wKfSFlv6OnzVctRJyADzCVs8jdUDeanz8v
 a+IOXD2YKoCQY69qSYTOPYzzhelcHbnbb6apsQI8yvw+3yLH53bYfuSQT1I/jJS1H/6Tteoozmy
 Jnij5CSaBnFphH3CuOmFVtNWCEOxksI+i3AgtzaeNd9ckMeCPPZjdNyzVqr336OW6HTkSI3B/HW
 4FT/UXICCCMfs0LVhV97DCWsc2z9VIImz0UqEG5NoCUk3dU6eWeXHcrS54eBNU=
X-Proofpoint-ORIG-GUID: vjynqqrmXlVeh33v9QsRFPpFxTf6lMWP
X-Proofpoint-GUID: vjynqqrmXlVeh33v9QsRFPpFxTf6lMWP
X-Authority-Analysis: v=2.4 cv=E8LNpbdl c=1 sm=1 tr=0 ts=68bad8f1 cx=c_pps
 a=VXidoBynIrxQbkP1uDy9iw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=fc39rYzBk46bR7B9sFYA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 spamscore=0 clxscore=1015 suspectscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 12:35:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222999

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

When Bash runs with 'set -u' (nounset), accessing an unset variable
directly (e.g. [ -z "$SSL_CERT_FILE" ]) causes a fatal "unbound variable"
error. As a result, the fallback logic to set SSL_CERT_FILE/SSL_CERT_DIR
is never triggered and the script aborts.

The current code assumes these variables may be unset or empty, but does
not guard against 'set -u'. This breaks builds in stricter shell
environments or when users explicitly enable 'set -u'.

Fix this by using parameter expansion with a default value, e.g.
"${SSL_CERT_FILE:-}", so that unset variables are treated as empty
strings. This preserves the intended logic (respect host env first, then
CAFILE/CAPATH, then buildtools defaults) and makes the script robust
under 'set -u'.

Note: environment.d-curl.sh, environment.d-python3-requests.sh,
and environment.d-git.sh have the same issue and should be fixed
similarly.

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 .../openssl/files/environment.d-openssl.sh             | 10 ++++++----
 meta/recipes-devtools/git/git/environment.d-git.sh     | 10 ++++++----
 .../python3-requests/environment.d-python3-requests.sh |  6 ++++--
 meta/recipes-support/curl/curl/environment.d-curl.sh   | 10 ++++++----
 4 files changed, 22 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
index c635be8acab3..292ec38ff721 100644
--- a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
+++ b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
@@ -1,19 +1,21 @@
+set -eu
+
 export OPENSSL_CONF="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/openssl.cnf"
 export OPENSSL_MODULES="$OECORE_NATIVE_SYSROOT/usr/lib/ossl-modules/"
 export OPENSSL_ENGINES="$OECORE_NATIVE_SYSROOT/usr/lib/engines-3"
 
 # Respect host env SSL_CERT_FILE/SSL_CERT_DIR first, then auto-detected host cert, then cert in buildtools
 # CAFILE/CAPATH is auto-deteced when source buildtools
-if [ -z "$SSL_CERT_FILE" ]; then
-   if [ -n "$CAFILE" ];then
+if [ -z "${SSL_CERT_FILE:-}" ]; then
+   if [ -n "${CAFILE:-}" ];then
        export SSL_CERT_FILE="$CAFILE"
    elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
        export SSL_CERT_FILE="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs/ca-certificates.crt"
    fi
 fi
 
-if [ -z "$SSL_CERT_DIR" ]; then
-   if [ -n "$CAPATH" ];then
+if [ -z "${SSL_CERT_DIR:-}" ]; then
+   if [ -n "${CAPATH:-}" ];then
        export SSL_CERT_DIR="$CAPATH"
    elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
        export SSL_CERT_DIR="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs"
diff --git a/meta/recipes-devtools/git/git/environment.d-git.sh b/meta/recipes-devtools/git/git/environment.d-git.sh
index 9c7b5a92512a..1b7395b15aca 100644
--- a/meta/recipes-devtools/git/git/environment.d-git.sh
+++ b/meta/recipes-devtools/git/git/environment.d-git.sh
@@ -1,15 +1,17 @@
+set -eu
+
 # Respect host env GIT_SSL_CAINFO/GIT_SSL_CAPATH first, then auto-detected host cert, then cert in buildtools
 # CAFILE/CAPATH is auto-deteced when source buildtools
-if [ -z "$GIT_SSL_CAINFO" ]; then
-	if [ -n "$CAFILE" ];then
+if [ -z "${GIT_SSL_CAINFO:-}" ]; then
+	if [ -n "${CAFILE:-}" ];then
 		export GIT_SSL_CAINFO="$CAFILE"
 	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
 		export GIT_SSL_CAINFO="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt"
 	fi
 fi
 
-if [ -z "$GIT_SSL_CAPATH" ]; then
-	if [ -n "$CAPATH" ];then
+if [ -z "${GIT_SSL_CAPATH:-}" ]; then
+	if [ -n "${CAPATH:-}" ];then
 		export GIT_SSL_CAPATH="$CAPATH"
 	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
 		export GIT_SSL_CAPATH="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs"
diff --git a/meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh b/meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh
index 492177a9c377..f86027aadfa5 100644
--- a/meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh
+++ b/meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh
@@ -1,7 +1,9 @@
+set -eu
+
 # Respect host env REQUESTS_CA_BUNDLE first, then auto-detected host cert, then cert in buildtools
 # CAFILE/CAPATH is auto-deteced when source buildtools
-if [ -z "$REQUESTS_CA_BUNDLE" ]; then
-	if [ -n "$CAFILE" ];then
+if [ -z "${REQUESTS_CA_BUNDLE:-}" ]; then
+	if [ -n "${CAFILE:-}" ];then
 		export REQUESTS_CA_BUNDLE="$CAFILE"
 	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
 		export REQUESTS_CA_BUNDLE="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt"
diff --git a/meta/recipes-support/curl/curl/environment.d-curl.sh b/meta/recipes-support/curl/curl/environment.d-curl.sh
index 7c2971b3dad1..02329ba8426a 100644
--- a/meta/recipes-support/curl/curl/environment.d-curl.sh
+++ b/meta/recipes-support/curl/curl/environment.d-curl.sh
@@ -1,15 +1,17 @@
+set -eu
+
 # Respect host env CURL_CA_BUNDLE/CURL_CA_PATH first, then auto-detected host cert, then cert in buildtools
 # CAFILE/CAPATH is auto-deteced when source buildtools
-if [ -z "$CURL_CA_PATH" ]; then
-	if [ -n "$CAFILE" ];then
+if [ -z "${CURL_CA_PATH:-}" ]; then
+	if [ -n "${CAFILE:-}" ];then
 		export CURL_CA_BUNDLE="$CAFILE"
 	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
 		export CURL_CA_BUNDLE="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt"
 	fi
 fi
 
-if [ -z "$CURL_CA_PATH" ]; then
-	if [ -n "$CAPATH" ];then
+if [ -z "${CURL_CA_PATH:-}" ]; then
+	if [ -n "${CAPATH:-}" ];then
 		export CURL_CA_PATH="$CAPATH"
 	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
 		export CURL_CA_PATH="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs"
-- 
2.34.1


