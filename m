Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28B78C54ED1
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 03:31:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7797.1748403078620362194
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 May 2025 20:31:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=72430432df=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S1F1xl004947
	for <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 20:31:18 -0700
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04on2053.outbound.protection.outlook.com [40.107.101.53])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46u9d43dqs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 20:31:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r9I8HTBu3WckAynz4Q/rV0wyLByvOSa22pqESlTskO7XRX18sXWtYecV8RSJ3yTlcdvTgPLMGMqMbkdGKstoNJHMhiiMS2Yx9Etx5XXsjXroK8gzQwhUCDkPujXHTKHT4RKUdPyqLssZP/O1C6/Wg8ECRxjHCJuIHnuNg7KX3MjbCI+yssargZ10KoVB1xVCvI/rndl9oPFb9zjEl+Hiku3VclydUdd6LAgJ0F+Si10chUmczdghcW1uKrJTc1X1m6u19PQ0FN8qwDAcaXrZvP8e/iLAcvlemTk8BpFceYnfW/jgRRvpvylkfZ5Z1CxEnBPSFr0+j1huLuO/Q4dJdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/1TaoFCZ2v5gmE0SVuu83OVwd8ogzGU/V9MuBarRMLA=;
 b=EL6MMb6TcGA6FBO24xifeUNvTSvos1GG6RihAPa0ythKHs6ndtRiLh9vBBpdxLd6Lnlz04Yb78kVjDtptusBuCu92ySDIAiw+dQJm/Kwp2Ag5RxD8P3XORde0E57jmnB9VELFHT92UDczbD4blx82hxABhYwv6op2RBiZqoM79QlnprdXlj7c5VP360l9axv+VTNxU8J3TnSxKbOwwv/x4MIxx2CUZm3iQbfoGYEuE0FqxP3AWgd+2iDLpHOHOZub3xIoOOAEiOpc+B/5WaviY11utYS3bHeneszm2gkoyfajmd7DXPzrp5qBG+2AYSv+syyONMMpRLU/hxv4uyrlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA3PR11MB8895.namprd11.prod.outlook.com (2603:10b6:208:579::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Wed, 28 May
 2025 03:31:14 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8769.025; Wed, 28 May 2025
 03:31:14 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] shadow: upgrade from 4.17.3 to 4.17.4
Date: Wed, 28 May 2025 11:30:59 +0800
Message-Id: <20250528033059.4037290-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0048.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::11) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|IA3PR11MB8895:EE_
X-MS-Office365-Filtering-Correlation-Id: d3f3f3c4-01fd-4c5f-2ca3-08dd9d98195f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ZUUuZAppPS9mBoM9iwYE/88H74/Ydp1RoCqLXO/jfL4yG3E+f/+j+gVjsx3S?=
 =?us-ascii?Q?OD5YN+Bb35ihlhIr+fnLvW5L72Da0xQKN8uqwJvg1Dp5Dx1hz6gfNVrpts+O?=
 =?us-ascii?Q?mj18dyjWOISfJtcaSNh3/Ne07i7SGXxw5hCf2dGCer7MqniWhg5u7mG9QfRF?=
 =?us-ascii?Q?byh9iVAIBW8axT0p25zJXG18dbbRjodXkubL0XsEgqzcxqGnVajApNZ7Jho1?=
 =?us-ascii?Q?OTZIMla95jcTkdx6cUsGfKmdSxdC2cwFlUElMPV044Bq4YUFsUbSBLd/Befj?=
 =?us-ascii?Q?y+DzeyWqZhx6zfxzxQjAShQoiTo+Q9/aglSIZ+q6AD1bH0X0XgN+gg+dAssR?=
 =?us-ascii?Q?1opzJRz9LsAu/mWMzx8B2eAryHL22gFILGkdapj7S49xdonpWqizd5h+YwlQ?=
 =?us-ascii?Q?v+kHhupoh4geSm4y3WKR7oxftybo4bMPqBPK7M+rX9C6QpUNC7B+JO4tQQMp?=
 =?us-ascii?Q?t/1QI62nyfkMp8xHZZxHpy+G8pVhdqvF4/WXbBlfZEqsM8OOqxvwmXOreDu5?=
 =?us-ascii?Q?6zMD1Tt22klJ7L3ODrJSR4L7jVY/gjYRqXhZwyZHb/xE2+k9ZUnQdJxxpDpL?=
 =?us-ascii?Q?wJgI+eHm6DjLqz+amW3zs8idriqt9IxzQnaMIWQZ5lVCjSSTBJev1sDiEhmc?=
 =?us-ascii?Q?B8HdkWx0zOenYWqaAkrdKYYJaG3BhGqwkrsD6mpoS2Ee+iy4Vd0jtsroLUWn?=
 =?us-ascii?Q?ZWl6uabAjGS1eZVAPsFNZWW5ionDL3Z8WEfTwJ+k0WbFHGs1s0xUDCSCzKiT?=
 =?us-ascii?Q?Jx/AoqkdtlkCUudl7LRw2AO+28ApAlhGai1xYRj8toQBXPK36fj91/2tczZ3?=
 =?us-ascii?Q?zHSoBmYiPQQqDjVK9bmN4ewKRPX7FY+Wl9wrbAnOuUq4YFOOkbCs7LjyIW5n?=
 =?us-ascii?Q?4x/jEuphuYuK/C5kXqbMbAvi4qmpCUmtV+tyPaVuD+WnGIor1ZOcMtoilM1a?=
 =?us-ascii?Q?asrm6USPlqDtvqC09s7Avm/7aZNELSSzh+uNKGJOkMptObkR3Eq7CA3QGcrP?=
 =?us-ascii?Q?8z8qLEwF47Uf1Qsd864UVrqE+YGeSCSa5j/VtSlG06WHbd2TzBiLipmdisyC?=
 =?us-ascii?Q?3sjF0B8dry+R6b8qZERLz/katOGjt/f3wSjOrB0o6Bdr6Xro8ksUbX0Yefoi?=
 =?us-ascii?Q?A6ktc9LNJni41TdWkZGNyY8VpZ5H7W2JMMXiZw4bTBnomuInr3/o4Jluz+St?=
 =?us-ascii?Q?RmVKV4tHi9Lu5GEXUtDzUiXNzRJA5dj7W//SEeeBKtAl2Dk1p+F5nMI7FJJA?=
 =?us-ascii?Q?a754NSPlAFiVsMOoP8oa51Zmxo/OjTHvrhENofT7og0afIlIv4LpoanpYqmW?=
 =?us-ascii?Q?qK8GIvxemvJC/f2J014to3XufDWVK8B1JQEPXUhk61ITuP4jwHPB7x5g7a3f?=
 =?us-ascii?Q?vrTgXcOzfsOfAyusKPfJ4lLi9Z11Apl+VD92KyJY7ZTLdagRwkX65PfDyJPd?=
 =?us-ascii?Q?QPfFyeWueWIDR393sSfK3UAojP0nFAcSgGQlJsQBE+r0pcQNxy4aDQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5y9gd4FX8pfWRX75pO0rUK0U7k9bWx6BnMYYbT7hBlai6+PrVQ/yDL6JoBaf?=
 =?us-ascii?Q?BTPiTHrqWxh6AdZmSv80Vl3Qrn+GhPM2/r4aMy3aQ9NQ/GIaV2A+2flsvBzu?=
 =?us-ascii?Q?ljNKbXrZ4vcuZlPRybdxj8yDdgdLml984nkBseRRfYpoGvyQRMyrFGb0gVta?=
 =?us-ascii?Q?tkvCyBElQDT7275KNxBBnXHjxDxqnr5hO+TeMJJKwwSdBF4Nyw6zA/UTIJCO?=
 =?us-ascii?Q?gMf7re1v/OdP7yVjrHylFyNHOxzA20FDhF0OrHlBApgTyUJH3XB/BkzyyN/V?=
 =?us-ascii?Q?9wW50DJ2fyPdClD9YgP9hd2FHKR3rSR3F4EWbg6ikq9IBuY6oYb2t9IEiQdf?=
 =?us-ascii?Q?xGfy/T8SH+s2us4fXHKoTu+BEye637RptYFCw3OvDUfZp5Lx4Xn7l9bOtyH3?=
 =?us-ascii?Q?lQYwmbTgWwfMWCfQZzsKoMILxjzEzMRRvRvEZGEelp5/ZWFTpEotpqLQy+aV?=
 =?us-ascii?Q?BOgzIxh7Ke+QNJqsjumoerv+fAuEJzLvQe7WuCxbSGPPm6ZLyRcK9RW0CQgR?=
 =?us-ascii?Q?xcu6DFCFfrUVLOjpVDtk+RSMpTRbqI2PhQGnh+ZeBbGFIPUUXuPG8dtGw4+Q?=
 =?us-ascii?Q?UvgDdaBd+9JdD4O4v1EG8Saatc+ftHwjSR9T9xByX3Td7qKUlv1/fZXOPrHa?=
 =?us-ascii?Q?48AJ5KCW0QQwcpyphbp3/a27b2OmFNtXES/5NDcqRegmuobNANxFjQVBJ0yU?=
 =?us-ascii?Q?ihdJTJwdbLQAfRDYwgpTDNBssAjeR1o9qllTiyLDzsLdaY+PhebeFdfTS3Ms?=
 =?us-ascii?Q?z4KA7NDuqUfgX/zMkw1/yhAmq5uyGCbi/zoVyLwE2d+lARQxYUenFHYbeDC3?=
 =?us-ascii?Q?G4t1ArY7+XN+LDYSJhOlFJDWk52PK0v1mH5KAWikyOMgN5YaAeIChcXak+1B?=
 =?us-ascii?Q?/rdj5SG2zhFQVsg7UUft8RRXH4iLd06GSvW1wShlRESkCYLEDXVBuhTah3Vs?=
 =?us-ascii?Q?+QPi44f0AopoWYOtbTznYsc/dWwVGCuecFNP51CMODXmDy/R0Gm/DSvagDhS?=
 =?us-ascii?Q?xNvnH8YXydHjb7WgeTzI/aA76V8pkZybQ8YgxcmXk7zJhRfQSWkGOMcIOF0W?=
 =?us-ascii?Q?ebnS26jSnALN/7pLiAfyo+fm0738FTSIL4KIGx1d7KhlaBcTpELd9ISMbHT+?=
 =?us-ascii?Q?Z8UDiD6a6rcXuhC2PslS12t8l0SSTijnkB+7TUKjhYBRgc8CllqX2AEiJgvj?=
 =?us-ascii?Q?uhZySllIgqndkAZzoYKbehoSvfbCjOG7siKjlNM4ZM6mH6WX6T9fdtR1I9w0?=
 =?us-ascii?Q?ZD9h9PIabtCCgT5lRBu3l36EYnkko+Ts/93vV/E/xFqV7cQu5382R8VZPsDG?=
 =?us-ascii?Q?cAVZ3gDVYD+rG3rf1B18WE/V7W1t79VG7BbudIG/ylnJmWUOQIDfw/5qjQPm?=
 =?us-ascii?Q?00sXtFlP0LdmaAPJLuIKkBL8JlSzXuQEfgLLZa8TqX1OvnJ61we0DZtOoobK?=
 =?us-ascii?Q?ZEsip98kG3Y2qoNjOvFQ5Fn6QmB6ZkR816NM0OGZh6g3lvioTLr426p4qDr/?=
 =?us-ascii?Q?vmSWWLZtUoE/1HXzo7goYyRQiuo2HM2xdNzXuasV42E5EtV3pJa/f2iRA4Wz?=
 =?us-ascii?Q?k0U3BpAeXdOZZ/zWNk/DOG9Hcx4BeEYQCo8Nv7+k?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3f3f3c4-01fd-4c5f-2ca3-08dd9d98195f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 03:31:14.5358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cVox1r8+ZUobNtWSW0pkWurADC5tPCqqs91nycLQuMPJEX2/ckz3TuuhZTR9JxXQQlmbaHMVkeUfckGmKrRsRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8895
X-Proofpoint-GUID: cano-Z3R3HjLQhs3genvg06wVCeYMe3N
X-Proofpoint-ORIG-GUID: cano-Z3R3HjLQhs3genvg06wVCeYMe3N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDAzMCBTYWx0ZWRfXzAkXjAmUcaP1 EwsAyiBeNjk9lpNVgnhUB7mF/LwLq6jf4t1mWswWFebp9BdmhGwnghBwBhvFoogX9fOHSl0HkGN PSn7XdhfViXxvANYgeMiwYmxWf8pK3aPcK8Bd6iTkmBZjnzsXFmCrgOnUlWhejsv/bviS33u1cP
 OiSfsv+DGnQAzgLWLevR4r9Z3/XbZ1vmOK9g/9WA4sFg/33njj4+iOGTMx7Qg2ysGCYsDsB6cNI ryamCuIk4ZZK/sx+0bWgUULeAk5Hb2oCrG4zneABJwOKN4uAxKLNyL4jE2ml9hOU24ThBNyfJfz 4C+sG1Pd6wnVU8bQZNJzibBiiCe6/Ffh9nH0FzH5ON31yCIGVXo2SzjhzPHVvt7WqibfLnIewfV
 F2nASZkpPh4x3VO/qP06h7zRFFZ1wPpfJtzMmsOrP9aRanBRvHRQowG5eW4E2VrtHiQZOquQ
X-Authority-Analysis: v=2.4 cv=fdCty1QF c=1 sm=1 tr=0 ts=68368386 cx=c_pps a=hUsz26bhODo9u3wNMtt6CA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=t7CeM3EgAAAA:8 a=DYhWAiVjeaHXrFRB85UA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_02,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 clxscore=1015 mlxscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505280030
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 03:31:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217330

From: Chen Qi <Qi.Chen@windriver.com>

Upgrade shadow to 4.17.4.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../shadow/{shadow_4.17.3.bb => shadow_4.17.4.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/shadow/{shadow_4.17.3.bb => shadow_4.17.4.bb} (99%)

diff --git a/meta/recipes-extended/shadow/shadow_4.17.3.bb b/meta/recipes-extended/shadow/shadow_4.17.4.bb
similarity index 99%
rename from meta/recipes-extended/shadow/shadow_4.17.3.bb
rename to meta/recipes-extended/shadow/shadow_4.17.4.bb
index 3d07aec3d6..73942888b6 100644
--- a/meta/recipes-extended/shadow/shadow_4.17.3.bb
+++ b/meta/recipes-extended/shadow/shadow_4.17.4.bb
@@ -25,7 +25,7 @@ SRC_URI:append:class-native = " \
            file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
            file://disable_syslog.patch \
            "
-SRC_URI[sha256sum] = "2a029091d2c2f116f51b3a817ec16e7da22310a6c8116394457483c668c84b36"
+SRC_URI[sha256sum] = "0a288c251f339846af6bdfd4447b196153204deba42407bce5b0917998322e9b"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
 
 # Additional Policy files for PAM
-- 
2.34.1


