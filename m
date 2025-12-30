Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39470E95A9B
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 14:16:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.64803.1767104190115706653
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 06:16:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=VkpZbPWE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=54595b53fe=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUBowZO751613
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 14:16:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=zhLNl2NSGvJNCOW6F/zLd57C6NnLEpqpxLX8nnx0XvY=; b=
	VkpZbPWEKI4VWsiDsnLeFVlfN0RYZTA3gK6H5O5raacCm6+zFXDMOeShv+MHAZUB
	MrpqWeHQTozB5gYgdaDN6Xh72LmpYIhHc6xQuKapyNPQTZY5KXmimaKOGZ9cGyGR
	/JaHcTddD+IHI149CGewlNtSyS7aJTgIeHhNp9Irnz5OvqZgCx9YvSDbziU9XUmR
	tg0+AATfbEktI0w3AUQPW56FSkIXhoNeOzKOvg4KfomkFsZ59N2WvA72PNYTgKg+
	2ccdEyAwTwIA4tEfPbt5omRq8hvIPSTkJU2VAKTPrP40xTavSdF0cwA4CA+hDAvP
	66+D+dB2/ER2vrtuGqA5Bg==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013030.outbound.protection.outlook.com [40.93.201.30])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ba6e4tusj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Dec 2025 14:16:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eV6WLb/zU2Nw9yoXZUe6yPAgMToDYgnFlcGA5r5BFdRHryH9um50OqTitwzAcuhoPHE0S6H3TCfJezxEIK3jVRxHNivYyMo8aeN5a1D+rKR6FfXIrXSJ0VyC81ZLyBdDH8WFCEzL7uxUbbMEM1hoX1bkd84HXK3sSLiraWOuGEXXKrYgXJiXt3ax2mtUYuKhkk7xz6aSVLTjOdo8ZwjzgSPGRryFv/s4p3JcZIai1103pLaDHXWXzzKXxUVl8GW90A9H+3U6QlFp9kriz3woVC2214Y4ONgsJlBuVK/Q6f+L+N23cVr0Plw82NBTEu2kmTFQAE0ectmz2m/fkEaebA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zhLNl2NSGvJNCOW6F/zLd57C6NnLEpqpxLX8nnx0XvY=;
 b=LvGUJ929+MdMt63GGG7q9Jv2aUGNfi7gBPDNrISqWJCDekoljKjRB1SvXdcyzhAtOSdKsAW/6yEkvbkHCytpdF+ntSsuyySOZn9lp1+BfVvPaTgIw7wmhhY0xQsRxUYlUv+/CElNCXAEDzPuY9pd7Tf34LE9eHa0jbkbp6oBkn9slAOwxFNJgQsCwWR7auYPidXdjXk7nOwNfv429KfYEwrleeeIjiBQUqSyJyYjLLOU2UqGw/5kL2Faf6P3Fd8lb6n6fYDvdR03J3GvRv/wlr2lDaOdcVxod2zfJoeJ1IQkKwJvw6Vr7T4g9d56NuQr4gtIDB/dOzEYHQnX2/FoOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20)
 by BN9PR11MB5324.namprd11.prod.outlook.com (2603:10b6:408:119::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 30 Dec
 2025 14:16:27 +0000
Received: from CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::ff15:8168:45e5:396a]) by CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::ff15:8168:45e5:396a%6]) with mapi id 15.20.9456.013; Tue, 30 Dec 2025
 14:16:27 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v2 04/15] bitbake.conf: Include "rust-kernel" in native/nativesdk feature filters
Date: Tue, 30 Dec 2025 06:15:29 -0800
Message-ID: <20251230141540.1974380-5-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251230141540.1974380-1-Harish.Sadineni@windriver.com>
References: <20251230141540.1974380-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0004.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::9) To CO6PR11MB5651.namprd11.prod.outlook.com
 (2603:10b6:5:356::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5651:EE_|BN9PR11MB5324:EE_
X-MS-Office365-Filtering-Correlation-Id: 95288709-eedb-4ca2-7875-08de47ae0529
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?APvdix3SuqCScJrQR0cRTnDxq/11fQnYvJJdPxRhU3pjQ/TtUxFR2DLfoXDp?=
 =?us-ascii?Q?Eo1qOr7qTryPXt9egYANj28ep0ctrB/8FZbYLXQNoo8fsW9/U5QDwCdltRsz?=
 =?us-ascii?Q?+fmmo0K5lUFlEUouXngMmhQSIk8DCGqVOaY6P8/W7EuyhTReY2XQgoJTS+zS?=
 =?us-ascii?Q?TeK4hsadJx5AQsi/rjEoCr3TC/OWh+nphDmHs9y+nx5j7lctcBlVZy8RnG1L?=
 =?us-ascii?Q?M2nKtk2ejhH9Z9jnBwRvAIz4Ky86xe4FXMhnNe8vxEKRfJ1lByC+s4QOrgnC?=
 =?us-ascii?Q?litr9TBuoGrrujS7Xzo47JT+czPzgGThfsIM9Qw1my7sVZdIOTCQb9P3Ba3K?=
 =?us-ascii?Q?l6RjHMK/mFtyUmhsgMPCPGrDiJWYYbsXTfHA5MnYVeIQc7XS4OZ0NebLBSHT?=
 =?us-ascii?Q?uvGM9nVElxl2Sjn0zMXJ0EIKDM9PuZR3m2JKtG0R4hjTmYvFMsvSbrLj/WiF?=
 =?us-ascii?Q?r7tB49gBvgXFKduevbYsk8lG8Pi9LTT4sBne6HXFoGfmyLYj4g11wrtYJzjK?=
 =?us-ascii?Q?4ZIsWVgqsykwGhx4iA0ONQCmtHVG5bxy2/Et+Mspu7F+fsd3ZBhm/RcBEOJA?=
 =?us-ascii?Q?UBr2/8hjr6eAloDc8LUR99UjpXUgAAEfPT0x8aZOhopkz38/+bRhF0g3qdQn?=
 =?us-ascii?Q?uP08o3pqIDnpbnkKtdmMy9q2ktwAJQyj57+omAAVIMPoTEahG7ab8lXF+8CF?=
 =?us-ascii?Q?06kHuZW171tPShu5MiDl4ZZebm8X8EDswjg7CZnHAWluoXfG0jeJ7JfZkbaV?=
 =?us-ascii?Q?LO+bLS0Ietzznl6vZKoftTwVkzFKNDdMHOL/kQMXjYaABCfpgli8fcKaUsuV?=
 =?us-ascii?Q?29EQ9e3EKmcKXu4B2DHlWQYqM0jrV69DmnsHnPB15KvtwKORQ0j5JqBhNDYk?=
 =?us-ascii?Q?wAsVdgjXtlVbG9j4iJHHA2rUKCYrv2QOGjbLRupPDWhdqCyeB9Z9qruOE8Jp?=
 =?us-ascii?Q?iJcjkhie1phvVaDqJJEhbGuWnoV0E56Z8z4Jle+SsaUgnZfUuEgmIqZuK48A?=
 =?us-ascii?Q?qbqQesIwBxza18rhLdXs3KolWaT61nLBh+UGrM9CSTh2xXCvUojYA9y8+nKX?=
 =?us-ascii?Q?OKyBY3eO3oIZSpiNQiv73HVEYaiGdh9q8WFnwTXGHl9Qh+x+3+OejbsJq7R9?=
 =?us-ascii?Q?1rUWZW/MVKFcgWAe+NQ/BspudzkkQ/97s+PnpctgBLbgq8bfYkt4wFJqwgw8?=
 =?us-ascii?Q?5B9UVvfBDy8v0EzBwpfzpUHPsphcalJ0BntagxpdBBM2Ud11nRenkO7MgeNZ?=
 =?us-ascii?Q?Ltv18XJNxmESqLAMHNeKQt3vNS6azgixCxcWBqIrl/Yz1cGvoVyIs6mpkMPt?=
 =?us-ascii?Q?5b5bitaETvAUo1jkd1LFRvsfHe7uoAZOFhhtndsPtSzGhAlqRB1MjS3hkrG+?=
 =?us-ascii?Q?0CKglVFeH7kn/pEayG1dyIYuwur3K6rlXSxroS7IpSbpHDYfbwDcq3IqiDS0?=
 =?us-ascii?Q?ZbD2d4AsCiY+vaF3NhpbViiN9/XMeyDbC4b53DCPkh9Em40sfwUs5HMBCmk9?=
 =?us-ascii?Q?5v4mclfXnhxWvUR9l8NtEhwns2E4OSHLRtOp?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5651.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mUbVy+LtfJ8dlLr32D5710C6awOrqs66Qy3inPqWmeuuyD2TKOUey/RKF363?=
 =?us-ascii?Q?WvTJU/G/qXND05yz6rIDoC8HVKyEzSPX5CFsAyQquQOUnkGVtp93Ck1nUca9?=
 =?us-ascii?Q?mpa5VmalNHqUJFtmF6hJ+ga2eLRGWWD+scJ47cYDDYlMv6xy+QzmkQwHmhsH?=
 =?us-ascii?Q?kXGU8k1ayvowiHaZsDXen7eY+cdJEKco0N0FN6Gr++JdPRu3KKCocThipHl2?=
 =?us-ascii?Q?QZRTJIpZsdTN+R5r85hhdvGb9cq2/tMcUWrmyRFcVSLoFntTU/jspKB10FAW?=
 =?us-ascii?Q?7zSYJWn4sZL/MaGDrSDap8lIXCzRrjnF3yNYc73PTAZz+iiU03pgGLUQxwYo?=
 =?us-ascii?Q?9nIB7X7MUAj7i2v2p/7XS/EemPfpLadrjQUqHIuPlBli14wDYoNlNY3bdH4R?=
 =?us-ascii?Q?lHzQ5Q0yuW23+QWoyRn0cUsB1tL7VsHudtD5jdfvc7y0pqNk89mosC3Y3dRY?=
 =?us-ascii?Q?D9m2e1fd+M6e93h5X16D2I0htf9pxhFbqcq3SjdOD9feSxhAw6j/yn+70Xl8?=
 =?us-ascii?Q?pkzaK/xmzxC3lJg5kbPlk8X9l4r3sZghKB0xBZRSO38H8A+DVn936A0amhbY?=
 =?us-ascii?Q?CmUz6dZdxbHkH0lokjLI6tLu+X1zBei+GHBTsrxDs43kTsh/jEzpv1lnkLMC?=
 =?us-ascii?Q?0kbPIAME1FqlOUOIGol95pKJPOgI8QKI1M1JWsHr2HJmvXmjGvvacmUgDwCv?=
 =?us-ascii?Q?/KD0sTsJgXNPOTZk/Bx4mjSwyROodltcXTO4VxxBR72Bi2pnBGMDlG/wswgs?=
 =?us-ascii?Q?svNSe+koja0DGWpm8V47B0YuHJ642Xnu7rsMcAEv3dYELaVBeI9aelXMExg7?=
 =?us-ascii?Q?Br1WQDEK0CaF6V06JrlvNBP5SjZYgt/yKBZPjhcMA6SJAkmgKAWvElEBeNaL?=
 =?us-ascii?Q?fo6C3JRQEd05854nqVirP8jXd1I3Uy+yu8sC0N+1kFtQgRu/ii58VJJbTOE3?=
 =?us-ascii?Q?otXCYSqQBzXCK+UsgPIzK7is34guk+geE6gcENgANqT8GAAHqCV1gh0/9fEX?=
 =?us-ascii?Q?n2ac9dm4YAIhkM85jfgYl31GgWRxFSL2uxUzibz8NwAPO2DHQYS3ac8U9kAR?=
 =?us-ascii?Q?uWCMggPiCCtd5qEgxxUVxpjUHitxI5oQYrveFfqLNoZDG2GRow9PzBfGFqQ3?=
 =?us-ascii?Q?bDEdZAbV3YUotjn46vgWrKlDajUH1jZjyFgK457VhZDVF0Yqi4HAhUEUvRvb?=
 =?us-ascii?Q?5XtP1E01yZacfC7sZNoVWUpYIRSvFMuR+fw1WAKXSq9oh72OF6hf/YECMwZv?=
 =?us-ascii?Q?T8v3YgKurB3dehEv8AdwW1SqwFwxPnu8MZsc8G/Ts7jSJOS7GW2zbb94iAOW?=
 =?us-ascii?Q?FVONTzhRv69u/e/Vu223zkDZXAreeoAu8o6CjioqTXl7gZUoHzpqZB+jkzLr?=
 =?us-ascii?Q?v5dkfA6f5YecHsty+fspWHZIlvXBUIWrj85Q7XHqBpcljWfgUPR/36jrktuY?=
 =?us-ascii?Q?EMNIiL48+TXADN+wKiP5Zj7IMMSUR8u9gWqjGxa6SPoS5sYNllq3GN/A6hnl?=
 =?us-ascii?Q?Mcip8hqYwSGsbzPbVFtRheDHmXiF9AgtVqrGmNVdx/aatEs+eexAVD1LD6Nx?=
 =?us-ascii?Q?emXFLjcwBTVnA7k2/38VhCtpJCffQSZAcWPFC0f2ckqZasKjyrLDs6E1cuvZ?=
 =?us-ascii?Q?ZpB6zvEYUpPNp2wWWVeWUvfG+9jUJWrYeZWTd6fwPHnNdjWGaY7qloOvMt4Q?=
 =?us-ascii?Q?g2Jd7ujlS+UfuU7mdC0lwCWlgY2fxUNXZUjXGW1cwJxB2+fHEwCrqkqo7SgU?=
 =?us-ascii?Q?sCSsRv04RIU7ESwwU32omXjbwrSb0u4=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95288709-eedb-4ca2-7875-08de47ae0529
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 14:16:27.0686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RfmCzEivNatKa8uVw+K+Do5tnn4USiSWnbnxU75RDBCHF2RRrd3RTaxPaFdr2JpjC/ZPVJDBAn/jI9QYNbDtKNhIa7R/JQalr/zNvIii6jM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5324
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: NqyYSEoJlB9lHMj-3xvqg_xMrCxv9TpU
X-Authority-Analysis: v=2.4 cv=V4NwEOni c=1 sm=1 tr=0 ts=6953debd cx=c_pps
 a=9fOKxQ6q+1oHddUNM5AUXA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=xWBQjpzubWhZ7YZo0B4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 8dV2-L6nEFtz_djnN-jVhfSHKQvcKied
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDEyOCBTYWx0ZWRfX9/FwVgTlfyJw
 ud/ncNCdZSLTbXBeP7YSdwFnKaM7Y1MkHg+xfXjh9rTITgjNaFNFPcGhvEgP6gBM57iVNM3OHv4
 mH6uBA5+7FwxWEHM/2Uu+uptJd9xAatA70MrYVmo7I888vnE0BqCljxRt/EVWUds0F+EKKdz9/6
 WeZKZ7vlTNvhuRGyPAyGLFNrvnWh0Wgh84Qod62jSXyFDB5ktTVxkEAF+YINycBGMcX2RzMCogz
 uxci1sXyfq+oQbuywZZZDiw4QJNrTVQzebcoIScGst3Vr2Q71y2VsIM0/gxYaC9Y5fgAwR7ta9+
 CJXik2jyShCYFuXxfWPtNT4urCvkuo7ZfLGSKI0ECmfEmW2KAVr7SLNIHV43RO5+SfP8MbiUckc
 CEWrPXGEkEa7LsdG6eeF0MGYDudeKPqw2Yy+KakNWZgrop1LfBhmmpJ7FYQFl14AyUfoKjCDxy3
 v48AfBUhYGT3H5ZCXxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300128
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 14:16:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228670

From: Harish Sadineni <Harish.Sadineni@windriver.com>

When enabling Rust in kernel, native and nativesdk variants of rust need
to conditionally install Rust standard library sources to support 'make rustavailable'
in the kernel build system.

By adding 'rust-kernel' to DISTRO_FEATURES_FILTER_NATIVE and
DISTRO_FEATURES_FILTER_NATIVESDK, the 'rust-kernel' feature automatically
propagates from target DISTRO_FEATURES to native/nativesdk builds

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/conf/bitbake.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 88f4d0df69..c0bebc3ceb 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -917,8 +917,8 @@ DISTRO_FEATURES_NATIVESDK:mingw32 = "x11 ipv6"
 
 # Normally target distro features will not be applied to native builds:
 # Native distro features on this list will use the target feature value
-DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation debuginfod opencl opengl wayland"
-DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation debuginfod opencl opengl wayland"
+DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation debuginfod opencl opengl rust-kernel wayland"
+DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation debuginfod opencl opengl rust-kernel wayland"
 
 DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit gobject-introspection-data ldconfig"
 MACHINE_FEATURES_BACKFILL = "rtc qemu-usermode"
-- 
2.49.0


