Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AF03C43602
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 07:50:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15821.1782805822179874886
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 00:50:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=mIE9d7ru;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1641dd4043=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U5iJLS289132
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 00:50:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=0O4gMRrBa
	XenXuFBlCzc6F/Sq6g1xTRszjib9W2cXpQ=; b=mIE9d7rurG5cq32PT16YrrTVF
	I75Da4AS9rYBI6DC8+zaAWI4BO9bjvdY8TEkaZhPfLOsVn22chIx8uvLtRUPFdyJ
	Nv6SgQb2+rZVnS5FfwXEYsNwfOCJwnY6Xsbhdv7M38qDf0CxdcZoBLPcS8n4CN6h
	TciMaLN9JGRA8UhL/SLK0kGeBIgirFT2o/UqHXmumO9WlUbMLylLHZTTlvhjBRlH
	LVfS4qVG9m5S5mN9Oc594mEE4VF3G22afYGtHQyvCaXV2tkJiwKKwnY16dSEAbwb
	UQXvDD/QrMPaBJwPdKt6UUhLi7VoohFTXfZUHybbSM5UlxluyybI0rGkJUDdA==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010062.outbound.protection.outlook.com [52.101.56.62])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f29sykf5n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 00:50:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ewfwnLREZts58fAmtnef3qwpvhaAV23qLvWfUqytSAMdRlICGO7f9LM/QHWk7T9jRozM+cIu+Lo8kbB80sAnHfSmO+m1WzVP+p8TELwrvrhEovJ3WuJl+il9/6r2RGYb3dmN4IVkAvN29nZ1TcEEkw4ht4PA/nlSb4eaRgyyNR6D5N5IXyJLeFEaFTLXr++kz4YqVhKwCgEWW/rSOr4Y9Zk5fpi7O89yM+J0uHjX2dKy2fuyfn1tcTCMqbmANjjGg3SYLB9V8Y5c9hz2QKnwA+DeFYri8YxcORHQaJib70jaINKdWdTSkYPoX1YWgXq9Cmh4nDuCdap7GTNUHyXUXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0O4gMRrBaXenXuFBlCzc6F/Sq6g1xTRszjib9W2cXpQ=;
 b=k4JgfLlUYKTBeXXkrYiYxggzHo9UNindb1iXRBY8+WEHlv24l3InAMs91ZT/FS5q2tG4jX91unEJzpAFshlc/c3D7nA8ulg8FSTa/ODOz4H6hqRhS/GCNv/+8InVpRZjAj76LeyEZIi/+saI+uDDJms0Lihh2jHihYd4T4CLVyj3W3q/haclv+F8zWHWhngitABrRJuUqGVn7Rpv1eWB7Wn4k9Sm1WHkQ9MkoBYrWkra2V54zi5xA+bTPHv1wr29tEUan6CXlWGDzIh9fAWVY+piyrdBsRM+JLso91jhJqG/trH+QRNcAuo+UVB/QxgatTkJ+Dnd5xW8fR5onBQ4Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by PH8PR11MB9878.namprd11.prod.outlook.com (2603:10b6:510:3c5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 07:50:18 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%6]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 07:50:18 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [wrynose][PATCH V2] gdb: Upgrade 17.1 -> 17.2
Date: Tue, 30 Jun 2026 00:50:03 -0700
Message-ID: <20260630075003.1692482-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0019.namprd04.prod.outlook.com
 (2603:10b6:a03:217::24) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|PH8PR11MB9878:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a97bf18-704a-4181-6ae5-08ded67c3ab7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|23010399003|366016|56012099006|18002099003|6133799003|3023799007|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info: 
	PGFJqF2arML+c/AIc4YkZIP3LW8ut6/JnZ1bDIWsEw2fcrm838ax4CYEuVGr1/qecMzeOjdjZXwxGAaF4lMSfOmi1XQDDiVnNMAfwxPPEer+CaZjLIhbGRuXXAuwe33AphQb3BOUR5BZTyi1g6F/1fruUue8nEJ/YVqQex148kEG+UsrinYe8+r0FGrG4yvGxZB47NFIoKtga5Kdkdlz1Vmy3MpstaQ+Xr1qfcM3GUuGacqm6JMTza8dUUhAfRls9sU4LNIVl+AN70dRKB2Gf4svLXrPTibB7mbEWInOo8aUlENt7nVqdcQuSnSpcTP/VhAfvmBGACyE1vK2WciWdRfGDVuaQrFnzfNRPujmrre8ZYhGzhS0S81HDS/0sx3fncBUyVQa+fiOGQtti1aRXIaURzCdHWAr4GulGPg6mAfNYsdwsdbsA2c2TyI5+VKYFYpfw1QIx7Q/vbQ3bUZe+YZHGU5J6V+8sc5/cJM0v0u9uW9j3YbVqp4TKBx4z56fHjB37P7+OiIp56H8WL3BPVDD7VVxKX2rHGKPetQf4Fl1MCKTbnFkpIF2WcaTW7xYUVk0SAR15cnxudSLx97sZHlg29UqDGPblsJqT8ren5BlyAUkhRTxLeKJf5VIoCJVTboNzzJb7GbPo5UIFWO8Ddn3FMyqnKtHZMCnMEqrGfA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(23010399003)(366016)(56012099006)(18002099003)(6133799003)(3023799007)(11063799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4enwHSAoNNb9GIoKjbUg//EuLAhnHL9G1ztBQhN0NiVxXjFq8hObsX7xRYL1?=
 =?us-ascii?Q?fRgfyjGFMpdFODccUV8yuvEtYaSZUdrxYGO3sC3/A6xal3FpU/Rh7jFuvUoa?=
 =?us-ascii?Q?YXB2+oBE599Z9tTYwLeAPoaLtCvZSANpCug8pIq8ZzL7TrMT2heWHFZ0DJ/r?=
 =?us-ascii?Q?TmJmpplNnEYBEcQiM3ENGZkhz/3GyK7fQC6/pVd0lSLCyIqMQbgtcrFJIIJa?=
 =?us-ascii?Q?kqeRemWMQ6mqRbzqYvkX9Ry4OR0mj39+2lkumTVRrWUcUvzEF+CaCdmiwzk7?=
 =?us-ascii?Q?iT6sj9aWWrjwqItYbGbQ6RVrbfT/L4WtmiU4287ghANNa6Mv52huX18kfmg9?=
 =?us-ascii?Q?ao6Kf/bIMDAIaKXSHj3PbIJUNOVHIkzAsR2CArqhbdtkoI9Mst/B3MDOKOjs?=
 =?us-ascii?Q?KGT8G247NGobgCWFMNhtU4QK3WB2ovBrAcibGAeQ50oZYNvQQLcK939JshPr?=
 =?us-ascii?Q?+q2bXV3UKJttsyOvHKmX1avxULIxCjLXNUMJ153EnM2fvvmxoEuO22ekyx2B?=
 =?us-ascii?Q?H3S18LOUAPdPAuGyNVd21u9kem8PiY16Ur05W+qYHq/TwjKHpcWWCEa6Uzry?=
 =?us-ascii?Q?RP57phXfpP7+t1wdGAIwmAwUXQRFyrp6G96mO9Cf4mKTSJg+gDtXQJN2AadN?=
 =?us-ascii?Q?xjNGtx/MkvGuigyoVudzRWoycK5+VqbrrxCy6Eb/CDNRk75fPR3jGuzFmT9h?=
 =?us-ascii?Q?r9AMQZjdcaRiIcojzI5t4GGfAguAujIVZvgkdKkTL5JrKrbNNCxewDmbWIiO?=
 =?us-ascii?Q?+BX/5IpQaCiWaQeVuF8W/O6RjusGSi8C7pmHPiaXYU499KhTfFrp6bs2Ldx3?=
 =?us-ascii?Q?m5KPlxg5CKuw4Hx9SmdvBf0uV/jRl/+MqSvshU5EvxjNMXE1SAC2jzCzLEbg?=
 =?us-ascii?Q?SX23MXBAF/IORh67rDGOxCl47J2KaEEmCVHznW/uOOZhWBR3CnC+D0ACRY7J?=
 =?us-ascii?Q?h+dwQ7ArBGP781V7mVtEM0VYXcDOYSszBscXMoU1HNQlmkjKa2vehCQ2Phi9?=
 =?us-ascii?Q?gAZv5i2UXbfndH2moeZSotHxEBaix6GiOKmwQFCM0ih1tgEpa33VSNt+sktE?=
 =?us-ascii?Q?KjajDJ8X6TJTFHV6Efd1lTwZabGkxOX3PNhvEvQ6P4S+/nNOXUX6uGLMSe3u?=
 =?us-ascii?Q?UxDEBJE4MMYRPH8v95O0HZwnRdFPLO4/1LYgM2HbtOrcjQcC0ZYwpPep2acJ?=
 =?us-ascii?Q?eUtS5ab+GvmowkagCUO5a6nmg9s5ah4foCp/xY7oOacPvPrTy/q6/y0IeH2+?=
 =?us-ascii?Q?oQubVyNEP6FtEyr5pXyN9q80wygC4YxTpPPbNWgOusrMEp+ahYGYRYxK4S9h?=
 =?us-ascii?Q?m/uz2B0EoP2ya9SLyWFgQBObH0YC7nMttlgk5l/iVin/E+qCqmeu4fdT7PrS?=
 =?us-ascii?Q?Hkv7DjExQkGfoZfUzVVKWRCAa6/PJxGwCmJMXx32VLmANEdk1oE+tuDIgfwG?=
 =?us-ascii?Q?548hoKbVD01aqTRcslWLb2WLLnVX78TLocd4jXWnVld5HEprp2n/qf/d1J46?=
 =?us-ascii?Q?nK2UeaEeMfJ5beqbZ6Cf1oi0oc2mJM/sPywvfwpt4NpaNryX7cro9ikV53KH?=
 =?us-ascii?Q?r+2dUcusNGndb2JMt15FKmsGYX7J9llsYNzjUF/sYFdF9dnJdc0nyy1Ze771?=
 =?us-ascii?Q?4ylNNwVAC/akM7nrM8myJOZ9HbUJfHirP1zertV9JloD+oTgltrpBHjoR0I9?=
 =?us-ascii?Q?e3Vov6EjaTOEPs/WUDqE1jwYSkeKE83aw8IahGfs/ndqtcQR2LxVIK/iK7a7?=
 =?us-ascii?Q?Pfnimz9SNbNgNiev5dG1QF3JO2+1H5ZBQCho25jZbngjaYbunPlO?=
X-Exchange-RoutingPolicyChecked: 
	GRiXUyj/kMdGrR+xtbhJgZQMPo4PRa8u9JxCMd70x8pgc0nthGJNthOCHZS7lfuIxVeqitF0AMpaa8ZO2+ESvlj+52xpgxPPGxtKP1gcO5P4jp5WzI1gykKw9o/tOJIZbA8maaJ8m6YDFlxC01q0PYHIivE55Km9zDSDYLoNMw+XnDx841lQzLV0J1blaugs2I9tJBFicC48XgB8YsAJJw2SeHX/DRzHcPlFraNC8LBpn/9tfQkuwZQXBH8RaEpjeXWI11yPK6Nz6JyUzNcV7g7EuWHd+02Qf6jb10nmGMb0DnolFGVz+xKShEyu+jwHWTerEjtLE3Q8R/G05fACxw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a97bf18-704a-4181-6ae5-08ded67c3ab7
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 07:50:18.3875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uxIRc0yO5e90StbQGxz//oticPtKE72CSWvZtuHkuX1fGiKi9RFYEfqr+7QYCKz5J1UI70z00Y7Dl5qQ923CqOMpw5GfsziQ/b7RXP8Lg0l+2UsQ7jq4aT8uPXHKukJB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9878
X-Proofpoint-GUID: FR4h9-haP5422JJYsqsizY_HwYswxKQM
X-Authority-Analysis: v=2.4 cv=HsJG3UTS c=1 sm=1 tr=0 ts=6a43753d cx=c_pps
 a=i7V4Gi3kv8keisB7wl6Q2w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=CCpqsmhAAAAA:8
 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=BcPKCTjPAAAA:8 a=KKAkSRfTAAAA:8
 a=pGLkceISAAAA:8 a=m7CUszNA7STTOgLsIdMA:9 a=HCINmKHFQ_U6d0ff:21
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22 a=MNXww67FyIVnWKX2fotq:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: FR4h9-haP5422JJYsqsizY_HwYswxKQM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA2OCBTYWx0ZWRfX5rEqd1lGozmQ
 eLOb/OIEMcHgzGbUjyCCJXwGEShtt/dRj8d7osGCKcHFKN783XajZ08sUcRB4LnKoUIvoKVd64Y
 Qnwa9cKlGRJMoXCTkxQXs75OYuGKgDoLok6D63YCqNQkfE5YKsQb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA2OCBTYWx0ZWRfX7eBLBg417vIF
 32nmu63kEgmvIntgPwG4otsTtV9HiKRUZaiYR2D65QJg/tW9PFPiBXczuVutc+EUoSmofpVTxPN
 sg+Uo9AgLsXxZ6h58Ia5YkR0wfNhFtBfoxxui1qhayY6ml4OwgGW4kl91IQU8ZEPSvnPLTHc98/
 y3L46pKIIxeGSEWM88TWsOtqGdeSfAN2OFY7xszm7F+SsJOtvnLNWKVS+Xy4FqtNOzp2PR1wxU0
 lhwccZZf6IdcXo9CuKFWukWJABhCWewLxfYwR9Hxq26JWBTJv1Cue8X2iy55oyIjKfAGZWDpY32
 0NIT+r+dikcBM+8YQreYdj6zNfBxkuMNT83Al7AFBSMWWbeXvw38hifsxticx2FeKJ3Ox7J/+El
 804tM6x70YomzrZv3HQJeqbbjC/RAEuppjwDZX9+gwL3MUwH3ih6pQt+MwFldHPTysZAaEPiaKc
 H2Y/j4F7lpnuXsANJgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 07:50:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239863

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

This is a corrective release over GDB 17.1, fixing the following issues:

 * PR dap/33228 ([gdb/dap] error while listing register children)

 * PR gdb/33737 (gdb --help says 'For more information, type "stream"
   from within GDB', but "stream" is not a defined command)

 * PR build/33747 (Incompatible with MUSL libc: no member named 'c_ospeed'
   in 'termios')

 * PR gdb/33748 (gdb17 regression with displaying ANSI colors)

 * PR gdb/33753 (Out-of-bounds writes in string_{v}printf -- threads
   and static data don't mix)

 * PR cli/33761 (Setting style colors is broken on MS-Windows)

 * PR gdb/33768 (Loading compressed GDB scripts from .debug_gdb_scripts fails)

 * PR symtab/33775 ([gdb/symtab] data race in
   dwarf2_per_cu::{set_addr_size,set_offset_size,set_ref_addr_size})

 * PR symtab/33777 ([gdb/symtab] dw2_get_file_names doesn't cache result
   for dummy CU)

 * PR symtab/33825 ([dwz] Extremely slow symbol lookup with DWZ-compressed
   debug info (thousands of partial units))

 * PR testsuite/33845 (gdb: There are 4 unexpected failures in
   breakpoint-in-ro-region.exp)

 * PR gdb/33872 (`skip -gfile` has inverted logic)

 * PR gdb/33926 (GDB 17.1 AArch64: redefinition of user_gcs struct on musl)

 * PR breakpoints/34112 (rbreak `file:regex` sets breakpoints for matches
   outside of `file` [reproducer attached])

Drop patches merged upstream:
  * 0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch
  * 0010-GDB-aarch64-linux-Fix-build-failure-on-musl-systems.patch

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 ...ian_17.1.bb => gdb-cross-canadian_17.2.bb} |   0
 .../{gdb-cross_17.1.bb => gdb-cross_17.2.bb}  |   0
 meta/recipes-devtools/gdb/gdb.inc             |   4 +-
 ...-ser-unix-modernize-Linux-custom-bau.patch | 248 ------------------
 ...ux-Fix-build-failure-on-musl-systems.patch | 196 --------------
 .../gdb/{gdb_17.1.bb => gdb_17.2.bb}          |   0
 6 files changed, 1 insertion(+), 447 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_17.1.bb => gdb-cross-canadian_17.2.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_17.1.bb => gdb-cross_17.2.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch
 delete mode 100644 meta/recipes-devtools/gdb/gdb/0010-GDB-aarch64-linux-Fix-build-failure-on-musl-systems.patch
 rename meta/recipes-devtools/gdb/{gdb_17.1.bb => gdb_17.2.bb} (100%)

diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_17.1.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_17.2.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross-canadian_17.1.bb
rename to meta/recipes-devtools/gdb/gdb-cross-canadian_17.2.bb
diff --git a/meta/recipes-devtools/gdb/gdb-cross_17.1.bb b/meta/recipes-devtools/gdb/gdb-cross_17.2.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross_17.1.bb
rename to meta/recipes-devtools/gdb/gdb-cross_17.2.bb
diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index d367486d02..cbb5885459 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -13,7 +13,5 @@ SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0006-Fix-invalid-sigprocmask-call.patch \
            file://0007-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
            file://0008-Add-fix-for-packages-that-are-not-compatible-with-C2.patch \
-           file://0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch \
-           file://0010-GDB-aarch64-linux-Fix-build-failure-on-musl-systems.patch \
            "
-SRC_URI[sha256sum] = "14996f5f74c9f68f5a543fdc45bca7800207f91f92aeea6c2e791822c7c6d876"
+SRC_URI[sha256sum] = "1c036c0d72e4b3d1fb5c94c88632add6f9d76f4d7c4d2ea793c12a9f19a3228c"
diff --git a/meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch b/meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch
deleted file mode 100644
index 30d22b21f9..0000000000
--- a/meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch
+++ /dev/null
@@ -1,248 +0,0 @@
-From 1a77c71303b552140613d49595baebdff1a4716e Mon Sep 17 00:00:00 2001
-From: Sunil Dora <sunilkumar.dora@windriver.com>
-Date: Tue, 17 Mar 2026 01:58:55 -0700
-Subject: [PATCH] PR gdb/33747: gdb/ser-unix: modernize Linux custom baud rate
- support
-
-The Linux custom baud rate implementation previously accessed the
-struct termios members c_ispeed and c_ospeed directly. These fields
-exist in glibc but are not exposed by musl, causing builds to fail on
-musl-based systems.
-
-Update set_custom_baudrate_linux to use a capability-based approach,
-with three distinct code paths:
-
-1) If POSIX cfsetispeed/cfsetospeed accept arbitrary baud rates
-   (HAVE_CFSETSPEED_ARBITRARY), use them to set input and output
-   speeds.
-
-2) Else if Linux termios2 interface is available (TCGETS2/BOTHER),
-   use it to support arbitrary baud rates.
-
-3) Else if legacy struct termios supports c_ispeed/c_ospeed, use
-   the TCGETS/TCSETS fallback (primarily for glibc on older
-   architectures).
-
-4) Otherwise, emit an error indicating that custom baud rates are
-   unsupported on this platform.
-
-This preserves existing behavior on glibc systems while restoring
-build compatibility with musl and other libc implementations.
-
-Bug: https://sourceware.org/bugzilla/show_bug.cgi?id=33747
-
-Upstream-Status: Submitted [https://sourceware.org/pipermail/gdb-patches/2026-March/225952.html]
-
-Suggested-by: Kevin Buettner <kevinb@redhat.com>
-Suggested-by: Maciej W. Rozycki <macro@orcam.me.uk>
-Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
----
- gdb/config.in    |  6 ++++++
- gdb/configure    | 52 +++++++++++++++++++++++++++++++++++++++++++++
- gdb/configure.ac | 22 +++++++++++++++++++
- gdb/ser-unix.c   | 55 ++++++++++++++++++++++++++++++++++--------------
- 4 files changed, 119 insertions(+), 16 deletions(-)
-
-diff --git a/gdb/config.in b/gdb/config.in
-index efc3100cb9e..b2469c8dabd 100644
---- a/gdb/config.in
-+++ b/gdb/config.in
-@@ -110,6 +110,9 @@
-    the CoreFoundation framework. */
- #undef HAVE_CFPREFERENCESCOPYAPPVALUE
- 
-+/* Define if cfsetispeed/cfsetospeed accept arbitrary baud rates */
-+#undef HAVE_CFSETSPEED_ARBITRARY
-+
- /* Define if compiling support to gdb compile. */
- #undef HAVE_COMPILE
- 
-@@ -517,6 +520,9 @@
- /* Define to 1 if `st_blocks' is a member of `struct stat'. */
- #undef HAVE_STRUCT_STAT_ST_BLOCKS
- 
-+/* Define to 1 if `c_ospeed' is a member of `struct termios'. */
-+#undef HAVE_STRUCT_TERMIOS_C_OSPEED
-+
- /* Define to 1 if `td_pcb' is a member of `struct thread'. */
- #undef HAVE_STRUCT_THREAD_TD_PCB
- 
-diff --git a/gdb/configure b/gdb/configure
-index d0bdba6eb36..8a0e2fa2771 100755
---- a/gdb/configure
-+++ b/gdb/configure
-@@ -27336,6 +27336,58 @@ if test "$ac_res" != no; then :
- fi
- 
- 
-+# Check whether cfsetispeed/cfsetospeed accept arbitrary baud rates.
-+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking whether cfsetispeed/cfsetospeed accept arbitrary baud rates" >&5
-+$as_echo_n "checking whether cfsetispeed/cfsetospeed accept arbitrary baud rates... " >&6; }
-+if ${gdb_cv_cfsetspeed_arbitrary+:} false; then :
-+  $as_echo_n "(cached) " >&6
-+else
-+
-+  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
-+/* end confdefs.h.  */
-+#include <termios.h>
-+int
-+main ()
-+{
-+
-+       #if B9600 != 9600
-+       #error B-constants are not numeric symbols
-+       #endif
-+
-+  ;
-+  return 0;
-+}
-+_ACEOF
-+if ac_fn_c_try_compile "$LINENO"; then :
-+  gdb_cv_cfsetspeed_arbitrary=yes
-+else
-+  gdb_cv_cfsetspeed_arbitrary=no
-+fi
-+rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
-+
-+fi
-+{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $gdb_cv_cfsetspeed_arbitrary" >&5
-+$as_echo "$gdb_cv_cfsetspeed_arbitrary" >&6; }
-+
-+if test "$gdb_cv_cfsetspeed_arbitrary" = yes; then
-+
-+$as_echo "#define HAVE_CFSETSPEED_ARBITRARY 1" >>confdefs.h
-+
-+fi
-+
-+# Check for members required by the legacy Linux custom baud rate path.
-+ac_fn_c_check_member "$LINENO" "struct termios" "c_ospeed" "ac_cv_member_struct_termios_c_ospeed" "#include <termios.h>
-+"
-+if test "x$ac_cv_member_struct_termios_c_ospeed" = xyes; then :
-+
-+cat >>confdefs.h <<_ACEOF
-+#define HAVE_STRUCT_TERMIOS_C_OSPEED 1
-+_ACEOF
-+
-+
-+fi
-+
-+
- 
- 
- # Check whether --with-jit-reader-dir was given.
-diff --git a/gdb/configure.ac b/gdb/configure.ac
-index 52924106bca..26e8d1ee276 100644
---- a/gdb/configure.ac
-+++ b/gdb/configure.ac
-@@ -733,6 +733,28 @@ AC_CONFIG_FILES([jit-reader.h:jit-reader.in])
- 
- AC_SEARCH_LIBS(dlopen, dl)
- 
-+# Check whether cfsetispeed/cfsetospeed accept arbitrary baud rates.
-+AC_CACHE_CHECK([whether cfsetispeed/cfsetospeed accept arbitrary baud rates],
-+  [gdb_cv_cfsetspeed_arbitrary], [
-+  AC_COMPILE_IFELSE(
-+    [AC_LANG_PROGRAM([[#include <termios.h>]],
-+      [[
-+       #if B9600 != 9600
-+       #error B-constants are not numeric symbols
-+       #endif
-+      ]])],
-+    [gdb_cv_cfsetspeed_arbitrary=yes],
-+    [gdb_cv_cfsetspeed_arbitrary=no])
-+])
-+
-+if test "$gdb_cv_cfsetspeed_arbitrary" = yes; then
-+  AC_DEFINE([HAVE_CFSETSPEED_ARBITRARY], [1],
-+           [Define if cfsetispeed/cfsetospeed accept arbitrary baud rates])
-+fi
-+
-+# Check for members required by the legacy Linux custom baud rate path.
-+AC_CHECK_MEMBERS([struct termios.c_ospeed], [], [], [[#include <termios.h>]])
-+
- GDB_AC_WITH_DIR([JIT_READER_DIR], [jit-reader-dir],
-                 [directory to load the JIT readers from],
-                 [${libdir}/gdb])
-diff --git a/gdb/ser-unix.c b/gdb/ser-unix.c
-index 6f2766518be..fbd73970dbb 100644
---- a/gdb/ser-unix.c
-+++ b/gdb/ser-unix.c
-@@ -508,36 +508,59 @@ set_baudcode_baudrate (struct serial *scb, int baud_code)
- 
- #if HAVE_CUSTOM_BAUDRATE_SUPPORT && defined(BOTHER)
- 
--/* Set a custom baud rate using the termios BOTHER.  */
-+/* Set a custom baud rate.
-+
-+   Prefer the POSIX cfsetispeed/cfsetospeed interface when it accepts
-+   arbitrary baud rates.  Otherwise fall back to Linux-specific termios2
-+   (BOTHER) or legacy termios interfaces.  */
- 
- static void
- set_custom_baudrate_linux (int fd, int rate)
- {
--#ifdef TCGETS2
--  struct termios2 tio;
--  const unsigned long req_get = TCGETS2;
--  const unsigned long req_set = TCSETS2;
--#else
-+#if defined(HAVE_CFSETSPEED_ARBITRARY)
-   struct termios tio;
--  const unsigned long req_get = TCGETS;
--  const unsigned long req_set = TCSETS;
--#endif
-+  if (tcgetattr (fd, &tio) < 0)
-+    perror_with_name (_("Cannot get current baud rate"));
-+
-+  cfsetispeed (&tio, rate);
-+  cfsetospeed (&tio, rate);
-+
-+  if (tcsetattr (fd, TCSANOW, &tio) < 0)
-+    perror_with_name (_("Cannot set custom baud rate"));
-+
-+#elif defined(TCGETS2)
-+  struct termios2 tio2;
-+  if (ioctl (fd, TCGETS2, &tio2) < 0)
-+    perror_with_name (_("Cannot get current baud rate"));
-+
-+  tio2.c_cflag &= ~CBAUD;
-+  tio2.c_cflag |= BOTHER;
-+  tio2.c_ospeed = rate;
-+  tio2.c_cflag &= ~(CBAUD << IBSHIFT);
-+  tio2.c_cflag |= BOTHER << IBSHIFT;
-+  tio2.c_ispeed = rate;
- 
--  if (ioctl (fd, req_get, &tio) < 0)
--    perror_with_name (_("Can not get current baud rate"));
-+  if (ioctl (fd, TCSETS2, &tio2) < 0)
-+    perror_with_name (_("Cannot set custom baud rate"));
-+
-+#elif defined(HAVE_STRUCT_TERMIOS_C_OSPEED)
-+  struct termios tio;
-+  if (ioctl (fd, TCGETS, &tio) < 0)
-+    perror_with_name (_("Cannot get current baud rate"));
- 
--  /* Clear the current output baud rate and fill a new value.  */
-   tio.c_cflag &= ~CBAUD;
-   tio.c_cflag |= BOTHER;
-   tio.c_ospeed = rate;
--
--  /* Clear the current input baud rate and fill a new value.  */
-   tio.c_cflag &= ~(CBAUD << IBSHIFT);
-   tio.c_cflag |= BOTHER << IBSHIFT;
-   tio.c_ispeed = rate;
- 
--  if (ioctl (fd, req_set, &tio) < 0)
--    perror_with_name (_("Can not set custom baud rate"));
-+  if (ioctl (fd, TCSETS, &tio) < 0)
-+    perror_with_name (_("Cannot set custom baud rate"));
-+
-+#else
-+  error (_("Custom baud rate not supported on this platform"));
-+#endif
- }
- 
- #elif HAVE_CUSTOM_BAUDRATE_SUPPORT && defined(IOSSIOSPEED)
--- 
-2.49.0
-
diff --git a/meta/recipes-devtools/gdb/gdb/0010-GDB-aarch64-linux-Fix-build-failure-on-musl-systems.patch b/meta/recipes-devtools/gdb/gdb/0010-GDB-aarch64-linux-Fix-build-failure-on-musl-systems.patch
deleted file mode 100644
index 2d91a351d2..0000000000
--- a/meta/recipes-devtools/gdb/gdb/0010-GDB-aarch64-linux-Fix-build-failure-on-musl-systems.patch
+++ /dev/null
@@ -1,196 +0,0 @@
-From 654223c799910837c80d0964a971fbdf7808864a Mon Sep 17 00:00:00 2001
-From: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
-Date: Tue, 17 Mar 2026 02:24:48 -0700
-Subject: [PATCH] GDB: aarch64-linux: Fix build failure on musl systems
-
-(cherry picked from commit 02090062127d59978ccc312dabf63c6ea838cd85)
-
-When building against musl (e.g. on Alpine Linux), the following error
-happens:
-
-    CXX    linux-aarch64-low.o
-  In file included from /home/bauermann/src/binutils-gdb/gdbserver/linux-aarch64-low.cc:42:
-  /home/bauermann/src/binutils-gdb/gdbserver/../gdb/arch/aarch64-gcs-linux.h:35:8: error: redefinition of 'struct user_gcs'
-     35 | struct user_gcs
-        |        ^~~~~~~~
-  In file included from /home/bauermann/src/binutils-gdb/gdbserver/linux-aarch64-low.cc:35:
-  /usr/include/asm/ptrace.h:329:8: note: previous definition of 'struct user_gcs'
-    329 | struct user_gcs {
-        |        ^~~~~~~~
-  make[2]: *** [Makefile:565: linux-aarch64-low.o] Error 1
-
-aarch64-linux-tdep.c fails to build in the same way.  This happens because
-aarch64-gcs-linux.h uses GCS_MAGIC to see whether the system headers
-have GCS-related definitions.  The problem is that GCS_MAGIC is defined in
-<asm/sigcontext.h> while struct gcs_user is defined in <asm/ptrace.h>.
-It's fine on glibc systems because in the set of system headers that
-linux-aarch64-low.cc and aarch64-linux-tdep.c include, <asm/sigcontext.h>
-ends up being included implicitly as well.  This doesn't happen when using
-musl's headers though.
-
-There isn't a macro in <asm/ptrace.h> whose presence is correlated with
-the presence of the struct user_gcs definition, so a configure check is
-needed to detect it and conditionally define the struct.
-
-Also, this change requires aarch64-linux-tdep.c to stop using
-struct user_gcs because target-dependent code can't include <asm/ptrace.h>
-and thus even if HAVE_STRUCT_USER_GCS is set, the file won't have the
-struct definition available. To fix this problem, also backport the
-definition of AARCH64_LINUX_SIZEOF_GCS_REGSET and use it there.
-
-Note that there's another build issue with musl, described in
-PR gdb/33747 affecting compilation of gdb/ser-unix.c.  In order to be
-able to test this patch, I applied the patch in comment 11 there.
-
-Tested with a native build on an Alpine Linux aarch64 system, and also
-verified that all gdb.arch/aarch64-gcs*.exp tests pass on it.
-
-Bug: https://sourceware.org/bugzilla/show_bug.cgi?id=33926
-
-Upstream-Status: Submitted [https://sourceware.org/pipermail/gdb-patches/2026-March/226049.html]
-
-Co-authored-by: Chris Packham <judge.packham@gmail.com>
-Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
----
- gdb/aarch64-linux-tdep.c     |  5 +++--
- gdb/arch/aarch64-gcs-linux.h |  8 +++++---
- gdbsupport/config.in         |  3 +++
- gdbsupport/configure         | 36 ++++++++++++++++++++++++++++++++++++
- gdbsupport/configure.ac      | 19 +++++++++++++++++++
- 5 files changed, 66 insertions(+), 5 deletions(-)
-
-diff --git a/gdb/aarch64-linux-tdep.c b/gdb/aarch64-linux-tdep.c
-index 76bde85188b..6c402e7ecdd 100644
---- a/gdb/aarch64-linux-tdep.c
-+++ b/gdb/aarch64-linux-tdep.c
-@@ -1684,8 +1684,9 @@ aarch64_linux_iterate_over_regset_sections (struct gdbarch *gdbarch,
- 	  gcs_regmap, regcache_supply_regset, regcache_collect_regset
- 	};
- 
--      cb (".reg-aarch-gcs", sizeof (user_gcs), sizeof (user_gcs),
--	  &aarch64_linux_gcs_regset, "GCS registers", cb_data);
-+      cb (".reg-aarch-gcs", AARCH64_LINUX_SIZEOF_GCS_REGSET,
-+	  AARCH64_LINUX_SIZEOF_GCS_REGSET, &aarch64_linux_gcs_regset,
-+	  "GCS registers", cb_data);
-     }
- }
- 
-diff --git a/gdb/arch/aarch64-gcs-linux.h b/gdb/arch/aarch64-gcs-linux.h
-index 018ca37a522..632823a8120 100644
---- a/gdb/arch/aarch64-gcs-linux.h
-+++ b/gdb/arch/aarch64-gcs-linux.h
-@@ -27,8 +27,7 @@
- #define HWCAP_GCS (1ULL << 32)
- #endif
- 
--/* Make sure we only define these if the kernel header doesn't.  */
--#ifndef GCS_MAGIC
-+#ifndef HAVE_STRUCT_USER_GCS
- 
- /* GCS state (NT_ARM_GCS).  */
- 
-@@ -39,6 +38,9 @@ struct user_gcs
-   uint64_t gcspr_el0;
- };
- 
--#endif /* GCS_MAGIC */
-+#endif /* HAVE_STRUCT_USER_GCS */
-+
-+/* The GCS regset consists of 3 64-bit registers.  */
-+#define AARCH64_LINUX_SIZEOF_GCS_REGSET (3 * 8)
- 
- #endif /* GDB_ARCH_AARCH64_GCS_LINUX_H */
-diff --git a/gdbsupport/config.in b/gdbsupport/config.in
-index 0beacf22c05..2957ee0f030 100644
---- a/gdbsupport/config.in
-+++ b/gdbsupport/config.in
-@@ -271,6 +271,9 @@
- /* Define to 1 if `st_blocks' is a member of `struct stat'. */
- #undef HAVE_STRUCT_STAT_ST_BLOCKS
- 
-+/* Define to 1 if your system has struct user_gcs. */
-+#undef HAVE_STRUCT_USER_GCS
-+
- /* Define to 1 if you have the <sys/param.h> header file. */
- #undef HAVE_SYS_PARAM_H
- 
-diff --git a/gdbsupport/configure b/gdbsupport/configure
-index 133ddfa7f6c..66135791aa5 100755
---- a/gdbsupport/configure
-+++ b/gdbsupport/configure
-@@ -14307,6 +14307,42 @@ ac_compiler_gnu=$ac_cv_c_compiler_gnu
- 
- 
- 
-+# Check for `struct user_gcs`
-+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for struct user_gcs" >&5
-+$as_echo_n "checking for struct user_gcs... " >&6; }
-+if ${gdb_cv_struct_user_gcs+:} false; then :
-+  $as_echo_n "(cached) " >&6
-+else
-+  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
-+/* end confdefs.h.  */
-+#include <sys/ptrace.h>
-+	 #include <asm/ptrace.h>
-+int
-+main ()
-+{
-+struct user_gcs u;
-+
-+  ;
-+  return 0;
-+}
-+_ACEOF
-+if ac_fn_c_try_compile "$LINENO"; then :
-+  gdb_cv_struct_user_gcs=yes
-+else
-+  gdb_cv_struct_user_gcs=no
-+
-+fi
-+rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
-+
-+fi
-+{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $gdb_cv_struct_user_gcs" >&5
-+$as_echo "$gdb_cv_struct_user_gcs" >&6; }
-+if test "$gdb_cv_struct_user_gcs" = yes; then
-+
-+$as_echo "#define HAVE_STRUCT_USER_GCS 1" >>confdefs.h
-+
-+fi
-+
- # Set the 'development' global.
- . $srcdir/../bfd/development.sh
- 
-diff --git a/gdbsupport/configure.ac b/gdbsupport/configure.ac
-index b7ccfabd6c6..d3b4c05daeb 100644
---- a/gdbsupport/configure.ac
-+++ b/gdbsupport/configure.ac
-@@ -68,6 +68,25 @@ GDB_AC_PTRACE
- AM_GDB_COMPILER_TYPE
- AM_GDB_WARNINGS
- 
-+# Check for `struct user_gcs`
-+AC_CACHE_CHECK(
-+  [for struct user_gcs],
-+  [gdb_cv_struct_user_gcs],
-+  [AC_COMPILE_IFELSE(
-+     [AC_LANG_PROGRAM(
-+	[#include <sys/ptrace.h>
-+	 #include <asm/ptrace.h>],
-+	[struct user_gcs u;]
-+      )],
-+     [gdb_cv_struct_user_gcs=yes],
-+     [gdb_cv_struct_user_gcs=no]
-+  )]
-+)
-+if test "$gdb_cv_struct_user_gcs" = yes; then
-+  AC_DEFINE(HAVE_STRUCT_USER_GCS, 1,
-+	    [Define to 1 if your system has struct user_gcs.])
-+fi
-+
- # Set the 'development' global.
- . $srcdir/../bfd/development.sh
- 
--- 
-2.49.0
-
diff --git a/meta/recipes-devtools/gdb/gdb_17.1.bb b/meta/recipes-devtools/gdb/gdb_17.2.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb_17.1.bb
rename to meta/recipes-devtools/gdb/gdb_17.2.bb
-- 
2.49.0


