Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA196CCD18D
	for <webhook@archiver.kernel.org>; Sat, 11 Oct 2025 01:27:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3117.1760146028828196727
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Oct 2025 18:27:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cmUDpmlO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=23790b5689=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59B17o6i3922595
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 18:27:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=SnY4bqnNPOFd20OHizYW
	cXuAnKxJhVKhu+x2BIYQjoM=; b=cmUDpmlOQtp6ldqrBYWN7pYvQlln4qUZzeYm
	XXZ9U+qzZyadKHefYs4IkJq8vg0lJ09jOec781hksbwQ0rkqWnLrns+HhWyLA9XZ
	nyqMm3QObYjWpLFruDJ1eL7Ii/QHzolQe38JXJi4tin4m9Kp9v/SoAUeGMhDSidy
	ITnGMkY9aZSZ5uKPq8V+eS8Ntfkq8pBhx8BZU0Q3ONmM8lPZGxN9Q/tb4v5i/6K1
	U3cP1BGcDs3AsL6dzGZdO+IjMSmtwMU/pjZAvy/SY6b4zkuWRaqhTpJGmK63ueAR
	nedla9X4rY4Y/UtCe7vwlDwp4/pH27TOH0gheXJPIhs2qS5mkQ==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010040.outbound.protection.outlook.com [52.101.61.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49q677gbxj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 18:27:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ue3kDnw9YdcayYExzdpDNfcVqaH5YwaJ4g+hHNHGx+q/lKqhTPsVBNOUM9mhNSmpDM+4N87ZqnVHoAOwxmR08uYj3r+JIDkQslJUu5dmcl80HrlCvS0/v7biIexwkbRVOqlyia8z/37WOWDOzgx+EKFetkGCSyUJy8RjH6li9CxaogGKBvlUDFXBkwCt9YY2uRkabd42c5uYLd7ZsUTpMeIOR4yleEPYfZcTJmOGnjmp37tBtOk70YfFxhr+pRC6GI1AYLLbJu5InsvjElBTZRgLgaLEVD0pujaJqFwOio0R+quaDG9iVwRc8i0SC1VmbZ49ZdZnn6tMiGDnpeQEYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SnY4bqnNPOFd20OHizYWcXuAnKxJhVKhu+x2BIYQjoM=;
 b=ZNRMb/5qkPPeVm8hwzMSvRUNSRQQdaNj2ccJysLklMeHuz7WZ5jnsKHfpAME55FTDwV9BjyPMDbPeqz3q95bMemDh3Vlna6sjQDMu1lSF7W82m5+n04F6kpttwIcCj+uNtA5NOTewymplceT3velRZ2BL5Ger60y/c2jwz8zOsQOjwsf6AXNW+Mqmh7F6Qljdsi3uRPBKn84NACiUDwWgd1ESYBhfxQtvAiSrMIemRvatyE+m5FGmL5UckFiLgc3l2cjfK7pUNEVansbnkkcQAAJvYOJnJCpZckxDj5YWTS6PeLyxevDYTz+IOn8YQ4F9rgh6p5caSD5LuKbRkAoKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 IA0PR11MB7752.namprd11.prod.outlook.com (2603:10b6:208:442::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.18; Sat, 11 Oct
 2025 01:27:06 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9203.009; Sat, 11 Oct 2025
 01:27:06 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] json-glib: upgrade 1.10.6 -> 1.10.8
Date: Sat, 11 Oct 2025 09:26:47 +0800
Message-Id: <20251011012648.1012302-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0021.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::20) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|IA0PR11MB7752:EE_
X-MS-Office365-Filtering-Correlation-Id: 6eb67c93-f714-44e4-ac11-08de086549eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XSgumg/u+04vymLzc7pnx0++auT83KLe8rBUNH8pei56Frvfnkgu8e2HEv8m?=
 =?us-ascii?Q?mfPiY1bebKFMbo8w3DoFv59ysLJnaRxRAnu/V8k4YIj0nhHqrTuCA1NqgT36?=
 =?us-ascii?Q?zlervHg1EtdDAbhAuotI12AVCc0v/wYOBXLy/fWGslf5Vg8mkfK4txq5WNpi?=
 =?us-ascii?Q?Mp4+/LBnUMc5bGZDNXokshdaW/6eeDQMKKYzyk0xnIiUi225hKcxriIdyG8W?=
 =?us-ascii?Q?V6YJ5z8K9se1v4I3EZhFjRKOLuOmtqtK6427O5l2epC8AFd4VhGNrZCatHUI?=
 =?us-ascii?Q?LSmwnML7lLWZdNwkje+2wPUIstKMxiag36979Wp9933YnDu3hLAE2aNZfAQ4?=
 =?us-ascii?Q?gIiaKHKqsY+BrsHhrzwG3obUAtzYNwrMsv9Exz3dRxU/DwqbVLAmL04RiMlT?=
 =?us-ascii?Q?6HFXh7NUY39YYmcaTYL2EehidfSS+XV77M97IvSvhlJ/yorAC7TU35luuR9L?=
 =?us-ascii?Q?ODC+X1Qd4wUMuw/b19eFLbzFYXU680jxc05Wxs5/97f6UeXhWyDb77tNRaEN?=
 =?us-ascii?Q?Olo6MvrlsQy3sAzb015TQoGA0vooPVG7Yyk/pwk7btkKipmi2KpzGPgAAM0h?=
 =?us-ascii?Q?za8JM3U9+2tOdP1vmbNNSiltwwQNPp70S1Uxy8iG+X3zvR1vTewVfYPmgyrn?=
 =?us-ascii?Q?3QkfOMyKElytt1MY5GteMBRJ1L29UE07bdKscwj5XdEZcrz9X/7QNOzcu2EC?=
 =?us-ascii?Q?BlDt0R9RderUkk1fBuPtaEt9FXELxdXfufDfBz33nyHvFQ0NzEDZNUuaVXs1?=
 =?us-ascii?Q?VXcdoCzNLRoiv5g+6+UNj49TNWwv99ygnY2mL0InpBXWTJDHHJlRj6nCeMBo?=
 =?us-ascii?Q?8Wf1wO3I/l+CaoVoEublg3QRl1Ga9CrjF1aOhoCij5GYSeNKMKGQJPUf/Drz?=
 =?us-ascii?Q?P1SSoXTxTeENYXmlcBupYVchCy0hyPlQWBI5a2Xd8Fch5+kGn8tgDvA75Vf6?=
 =?us-ascii?Q?ZsfsYfQe3bDkaig00jzNvht06kv44X8YmMtqkalfW69BYYbGSk1g4m/UZG/d?=
 =?us-ascii?Q?Q00u7z+74JLPX98z9f7FKnq6gMfykyYijHrqLX9rlc7SrcI79rBvMDhE0obu?=
 =?us-ascii?Q?VBPsFNgE3cW4w+9I26jFKvd1at5Lb8iddNzJH03hRNyXF+J98SsEQGvelQ7o?=
 =?us-ascii?Q?IKjSLopp8eMWaSg6B31QmblqhSPe0cKpfS0VampwE1MWtfZiPqURkwC3bLE7?=
 =?us-ascii?Q?EVFLYVPgrwL19JLZ5xea/+o5BlY2VnEtKtZ30EWQEaucKq9CY5QDtMl/srrq?=
 =?us-ascii?Q?NTizC/Oz2Jxnx8ZfBh10ePRm77UYxVPltW1m9PQF3wAZLRsFs6uSVYaYxA3v?=
 =?us-ascii?Q?lddJyRHa/xrRQmCn1AC1mbhMIi8vtDSBn7X4vGjT8bcAPck/FSiYa7UgrcIf?=
 =?us-ascii?Q?1egnrDMyruUuGLAOtEYCo2GUM7rT8YL0Tu8yPofFHOCs8hsZ/Qky5Gc7UgDg?=
 =?us-ascii?Q?GPTXY8iktNrljx9iY1tGuhiApCiKMa7BdbbN0DCdz3CoZzgXZ1lE8m6PGEcB?=
 =?us-ascii?Q?X9wOIQJREUXVtiB6oggv73kA+BZ5O+gdzrrr?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dposKFFzlcVMHy0oFo1UxBcCxmHK0pK6sUZ0avdBVm6vy3LegtT9pF9qH174?=
 =?us-ascii?Q?aOaLViruOQwsNxHXIk/bWdBekGDWV3l8E8F/vTNYdx926sy6pMKZXYHmuYEf?=
 =?us-ascii?Q?jtIwfkemhMr0Oc2ukLMC8JGZ0ejajUnfJfAUpEBGa4lzy1x0218RNvON9N7s?=
 =?us-ascii?Q?Q3L0BxiyGX9vZxPsDpukteA4fXz1Mgj06RjKKux7XjhI5NOfWdUin9CCbkmI?=
 =?us-ascii?Q?x0aDxlyuWs7rXsIZ/MrTAje+fBMrqhte73ajBKDuN2xuTisDUC9Dt8i40Qmm?=
 =?us-ascii?Q?oH/cM4ItK/cOrcrxoA08Ay8y5NnSdPm5uCiOFzGdrS5j0WJ15X+FyX5N5DlY?=
 =?us-ascii?Q?R1++eGHLsHT3mVjMCie1YsY3Di7VObJxZJww5ZdnT+D+xDDTUujikgOUYqda?=
 =?us-ascii?Q?GhwfsqnkMKvvIw8GLIpQJw+JJ83Z+gxQYp5tcsn5cMCqxdo/bn1lghroIBSL?=
 =?us-ascii?Q?ZsAxHMYER7NHtSsHcec8UhNdxHE2/v8p48ZZbpWRdfJN1mOcWHPjqmusfR7o?=
 =?us-ascii?Q?9f3G7WDhTtucA8eTWMCEUjXKYFYnev0lFGIayUbTFWoVtNfQVxYz4MraqTa7?=
 =?us-ascii?Q?C8sc2I0/YzeM6H9TLVcif2lK1mM16ghXiF3DyMqyVHNSJES3PeZu7SOidiD5?=
 =?us-ascii?Q?jbq8zWznhq6Y3E4mUxvU4PfshbI7iH2SMmtJOCKWnjEacIpP02b/PePDsn8E?=
 =?us-ascii?Q?bTNi2HD4gfOBOPPZeZ9TkYP+FFwfqiTqb7BqRJ7IScr7hmMs7j+n7qp77cZ6?=
 =?us-ascii?Q?fSltLHGzSvShYY1Cr5/y8qp2EOxFrDtTlcuZs4TpHxYVJ2kiGv319wWEBLU4?=
 =?us-ascii?Q?fTpJjj5hA/t4+5eu2jpKWxNDbjQJ8ne6ldv/Wo8ouu9pNZQ08/4WYwIh6uHP?=
 =?us-ascii?Q?ddSgTEk+ho8fZB36Ma11e3Uipo9nZDe9MWqHPQpmWafX3//8i08tet0e2PLQ?=
 =?us-ascii?Q?cjGnAHHsl1GxqvcvbZ6EAQfn/bKFGwfV+f2w/6lw2VU/LBFqZ0DU4yOS/QZl?=
 =?us-ascii?Q?wSlQQ5meYPJy8OfBNoBh5kX3gKHlTKDjtOv0YoLpgUkmTlliWx5v1onYKZi+?=
 =?us-ascii?Q?ArTn5hdu94ftc3Dlbwn0TVz24+PBiNcBgwJwJRfDizg2xdRrMf2RpSqPBlhH?=
 =?us-ascii?Q?lze6hJnuptcxRG5pU5vcXVM9cCWGtuAV1WQQLyKlLb/S2IbhK9QCrML6GTok?=
 =?us-ascii?Q?QagkrRgb7xdZqwjz2LZltH2L+WfSahp5e5m3dVQNih21rviVXoL2Zkmhiv0t?=
 =?us-ascii?Q?FPUjuy3bSyRoAgeXgcCgH2Q8CdnjnwA7WSgbqT4TcgZIQ1T8PdAsRsJwb7tZ?=
 =?us-ascii?Q?QR0rL1xjWMN/GS2QcmUos84wPO0zzwIT8DLxJ3vFrthEItQGPf8rlgmWXv5f?=
 =?us-ascii?Q?WEISdjzn6H/P9zEL7wHGoRei4TYm+6mw0k48jySebrDp7scx+igEKbmr5uDb?=
 =?us-ascii?Q?ITVXfzKUuc4azy+UN655BMNkKaHjRZpfU2DB6UwujK686GuWpq+cjVmVPY98?=
 =?us-ascii?Q?s2ioURlEBvwiyON8htxzwjRs/teqvSE7VCk3/UjsemY5GsNj0OMgI1Lmn7hE?=
 =?us-ascii?Q?CyjTr3wFlJoNL5DYJU7O89m6qbMBRFSVHLCya7uv?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eb67c93-f714-44e4-ac11-08de086549eb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2025 01:27:06.1400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SArZeGm+ssu0nxTJtxESf96nqA9ePkDHHVWAXlGxsV9Szidt6om4ikUKsqw5RJA+aydKYVwyYVfUYCnUo/q4AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7752
X-Proofpoint-GUID: Bbl5pRnCegKkjUiSQQOI_AYambjTQAec
X-Proofpoint-ORIG-GUID: Bbl5pRnCegKkjUiSQQOI_AYambjTQAec
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAwNiBTYWx0ZWRfXyaD06peI5UBD
 6Is1Tm8bwWsehEVc93z8Xoh5mVdeYsp3iQUBK6b6IDvAxW2rGLTfMvAg0IfpObWDu7iNAuoD1VC
 O41bCiQ5awNvSLmMtJpMRQGGEvLN/JQg63QzDEBF1qFV1dTLKJAXnVWM0oeN2kOpp0GT8zVEHoC
 3pULuwTqyyYRk0s7EAHlJG5ACo1LXSsH7rxVelYlU2D5ZCBxyHanyGVHkL7FREoo9dqKMyFKbVE
 OaBBM6hjtaoVJtB9CxOQeb6duHD/HMcPAH/Q4K8doOhpDZ3+U76MejznnKjnsFP/ZCVkWQGrU7G
 +WPQoQRqZX7t56Vh7Q7+LSXzsyJLCLeObSYGsLj8Wzba6XCvetBP1OY6AY4p3MVQUv2dtMAxrkR
 En6bOeenGFUFvMxz+2zoar/vSmbjnw==
X-Authority-Analysis: v=2.4 cv=Hu172kTS c=1 sm=1 tr=0 ts=68e9b26c cx=c_pps
 a=v5NpUkBk8u87wj8Ets5Xkg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=t7CeM3EgAAAA:8 a=kPQONVxf2EfcJdckqVcA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510110006
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Oct 2025 01:27:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224710

ChangeLog:
 * Add missing escape
 * Fix static builds

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../json-glib/{json-glib_1.10.6.bb => json-glib_1.10.8.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/json-glib/{json-glib_1.10.6.bb => json-glib_1.10.8.bb} (93%)

diff --git a/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb b/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb
similarity index 93%
rename from meta/recipes-gnome/json-glib/json-glib_1.10.6.bb
rename to meta/recipes-gnome/json-glib/json-glib_1.10.8.bb
index 8b009bc17b..1f68fb8c51 100644
--- a/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb
@@ -19,7 +19,7 @@ GIDOCGEN_MESON_ENABLE_FLAG = 'enabled'
 GIDOCGEN_MESON_DISABLE_FLAG = 'disabled'
 
 SRC_URI += " file://run-ptest"
-SRC_URI[archive.sha256sum] = "77f4bcbf9339528f166b8073458693f0a20b77b7059dbc2db61746a1928b0293"
+SRC_URI[archive.sha256sum] = "55c5c141a564245b8f8fbe7698663c87a45a7333c2a2c56f06f811ab73b212dd"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native xmlto-native python3-docutils-native"
-- 
2.34.1


