Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 906F6C88E53
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 14:19:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24193.1789481946357436043
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 07:19:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gEyz4063;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=371803a4be=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FD0rlt3118785
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 07:19:06 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=nQvOK68S/Dbmdg0ix2F7GV2cKD91kF4FUPWM/REVOMQ=; b=
	gEyz4063YqOLiiKQeQP3isZHdzjwhwEpYUXFaAE/BGPQei+gIkcLv2jO2bBuH4pZ
	oU1ilI2iw6fSBB4kFVeEDKn5+fS8YjC5UhCFX4HkbKFpVHpxvpCSO44Cn7WkPWar
	TixE+h7poouoiD/Md9/nNzGUpDJ2TGLPbfsC197Ai8+z9AfguyBYj9CCWu52IdaP
	gO0mbMuWcnyjex7FdtcsWdCZMHnkYGE50DMX6m534Ibs2fRfKKhohoJvXxKt/oZB
	kMuIOBLt5QCALs11QvuFvaoOl7WxkRzEDum1aqGn7RmJ06o5YVKyKxH3q1sbKgOH
	EGwx0ApqZ9sAYxFFrT3qPA==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020093.outbound.protection.outlook.com [52.101.85.93])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gn210p3sr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 07:19:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Phvpln3pooLknApf/M3HVFjN7m9KJY6OE8s5uFy+7ihXs5Qa3onvxHBUC3ScbkOaYNO2qwAPJazK1RFe9t1pbWlHkkSBsATR55ac3smCXixdjeTbpKHtNdtDCeTzhL5au7XQDAM8zzeU1NB22bHvBqe3+rt0Mw9dCUh2UZOBK3ZH2LtwOGSrfMKHEde5z2mLl+EuhDfzpTkazgRgn2wSTdEt1snS2zjfNS4Z9+X0i52dKMAvLZt9cMoDyVfUGaP128lodr+AC9Yzm6Th+8Jv+zDvgcl+I/T24GngoiJOSJNx0FY2T9tdtXNizyblSQsDi+FUKPzNBduAn/ZiO4O5bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nQvOK68S/Dbmdg0ix2F7GV2cKD91kF4FUPWM/REVOMQ=;
 b=mTb5OXJRl9o673EfycIc3uTYofsX/Nw7haUhKBuXplbXYNyEJ3nCbM3kT1AYZ2JBRCFW4hTWR7yVPXHb3VWHi+yhYJYh0zmMRyiZCFk3k2P8neWPOn1/ld4wpejYUfHcYqGP95PaUhO73G58VoqAlwhmWGdzcYn5X+ZwArSbK33HPNNkRsQ0rBDxUvq5k2RsBUI8plQ/MD58UrQs+8qJSGnTiHW35KUj4Sgq4MaQMvF7ADXVoENiNvmCNZ+IVthv/bgVnk6q+3KDXeQGGpdgliZXYT9RiNc+oXTWLrI7eZmNsmIikCi06u0dE+LuvGZSe0K7CVve8oMLdj/XIVofoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 DS4PPFDB7809488.namprd11.prod.outlook.com (2603:10b6:f:fc02::56) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 14:19:03 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 14:19:03 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, sundeep.kokkonda@windriver.com,
        sunilkumar.dora@windriver.com, Randy.Macleod@windriver.com,
        alejandro@enedino.org
Subject: [PATCH 3/5] rust: keep the build host triple out of cargo unit metadata
Date: Tue, 15 Sep 2026 19:48:32 +0530
Message-ID: <20260915141834.1212812-4-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915141834.1212812-1-sunilkumar.dora@windriver.com>
References: <20260915141834.1212812-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0162.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1cf::17) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|DS4PPFDB7809488:EE_
X-MS-Office365-Filtering-Correlation-Id: b3accfca-d35e-402f-8634-08df13344b8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|23010399003|29003799003|6133799003|12006099003|25016099003|18002099003|22082099003|3023799007|13003099007|10067099003|11063799006|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info: 
	1fwnbc5Cv9Vl8V0kLQ1bv/lsRi+3Ci5rqKga0H84jtipyzJP+llAZlpB++OjYLVpn3tFUzmUgwsCF5pG8CMm3CFPrjwHMmv51M35tZ9u52nQ118DfmyPdLjgjA+PIiXKGmpInN8ed8l9IN01gsIbuQw5kBH8R5tpA8SowgrHFhADkqW7o2fNxV6GDgIWwmR0MRsapuvJ/xneoXmwMwIzLaaX4epvS8jipMPFAF7aZ7u2cvSa2/v9wLudpALh/fDABN8+i+6p6OA5iOK5Z/f6btUetsGW1YMW3knxagPHfHyhIatJ+FwbTVfMZ9m0264/bofMfLqH84uIekbmSniKMnvoNCQMxMCK2DyY62a8tRCKklk7Jxo/zB1uk/p2YQCZEBqc9B2u1dMo09zGuEoozIPuA8p2ES5WzBcVcgRQZHUdQFQDaQN8Ek4s/L+n9uChV6THy/WePxztID1ayKPDi0JZkoqyTV4XPJMTIBUrUsW+ff7lrjmW29MOq5Hmqvm4imR3SW9hW6P88tMZhBxqYiON7i5kTwjY8IDATpKehSXAp4n3a1oRq7FInpySS+AIArbHUV12O0B79wxNGkyqZfpLaC73Hst4QjDKqRSA293dx2rPloeBfQjnM6qCthclDbHuplyxuz14wmqcDNGaKEwrFAGoW7DO9wFNiGgmeEs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(23010399003)(29003799003)(6133799003)(12006099003)(25016099003)(18002099003)(22082099003)(3023799007)(13003099007)(10067099003)(11063799006)(56012099006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lUpuefszXPpfsHuXNQdvadjLz2V+Lcey92gfwltc5IyDCjec2Lc7cr538o1E?=
 =?us-ascii?Q?lpKT1SX55qi7TL7vJkYjn0Q2vUnep3O8B+yyThR+4XlccZ7LupmG/lUKFKjU?=
 =?us-ascii?Q?YNAwISoNgi2vMFu1ohPheirRAR7HVhGOKNfWBc2SXAi1qkcKyoTZupovrPlg?=
 =?us-ascii?Q?0P34pHC56NwbEITdm/IFxKn0pkCPZS1RgplGqVdp1uyssum/0cQQtzf3KXC4?=
 =?us-ascii?Q?lrQma0Jc8gB2bPQrjSxzb4yB4yla1aCMt2UuuSOjdsq7RM2bPBZQqTDHTsVO?=
 =?us-ascii?Q?lZWjqd6H2Ov3Z36AslheSb5jIJ1loHH5BlaqhGwF64wpCGWn0Li4sYEUizs6?=
 =?us-ascii?Q?ZoSzi3Ff6jpHyFUQg3+JypJKev4b1T+PM1NipbzMIeCb5eQAwBC60VGy27Dg?=
 =?us-ascii?Q?dPA+Yc0d5mc9eVwXrQX38MUPes2CQR35STmRQMtHEFS7FOuXWNoaqCOFZbi9?=
 =?us-ascii?Q?agV3plj8OKg5CNazo4+Mi5JGaKHVbPRUV42SQYSAg26G28pE9MzdDpQFovjA?=
 =?us-ascii?Q?ns9+kiR0Efm9H95Xw3cBCgGutkDvRrHR4DrofjxEzNFVZs3mw1CT2/9VflXP?=
 =?us-ascii?Q?iFgMmnS/x+AFyiN2nmKCXHHVbF9iDDAx7ZzlIFRDKZCqQThiTSNVUbjnaUV/?=
 =?us-ascii?Q?dCdpIgAeFJu9ZKFS3kHmqGgo2KsD6ozNsmULvnJHf1rch4oiBAaQTxA81rfm?=
 =?us-ascii?Q?9nmXfs7feP8qsTOhu1x6i49NQr6nH57zDDdiaYufO2LeMVrvx4mFteAoNvw5?=
 =?us-ascii?Q?ZwITIWLel0/DvMQSlxZYQJdTPuVAmSQd7H4TAgvMR38cqgUHEQ1loJiK93K1?=
 =?us-ascii?Q?kWW9gml8hdmASLFWCWfuWbBkt+kYUHdf8kJqlZNK5RkBcC6gZvLkWb1IhI7Q?=
 =?us-ascii?Q?/fHka5Ww4bq4+RBOCEvAqoinrZib3j+paSOUOLk2+Zg4Xf4qt6CIeQhLV6xC?=
 =?us-ascii?Q?VbKiOTS9KwSzauL06ySHMh4C1oK39T2l/jFHa/EQf5mbanpV9srsrETp3Vfp?=
 =?us-ascii?Q?D7WCVKrQIbF8v0j/vQ5yZtOA+Xdzq5sSz1HJZpNUFol2U6Epc5VgwaR4StHe?=
 =?us-ascii?Q?ecTNqAACP9NXzCzJwBY3vYD51NbEwm0/NQtYkFpA84IRcGIX8yP/Q4Fs0MLc?=
 =?us-ascii?Q?XaedLSiwfHoP6Us7QYIT25PDNFfCbj2EvHAUiOipu9Bw3CzrFCBj9yvtddTL?=
 =?us-ascii?Q?Cdc/IFlhKFYvQgaDDLdJwM/HkrYML/otYgnzOSCFaH+jf/vDjZU0yNvza4tg?=
 =?us-ascii?Q?PlWD/t9DHfuFRQCbpLZ2Hgyj8ixpSUKKmKBS1RsKQuEKLQ0Ge9LgOe3efPgd?=
 =?us-ascii?Q?M9EyoB6QKROaZy2c/IqMNk5zziWyf66UYv3xed8I9ZMhzk01ZsPXjVPPY1W4?=
 =?us-ascii?Q?LeMqVOgrUVCAXvsXHwIfyYYrho+GQQGTNfEPoIIVq8V3jDm9ej/fcEgFt0xC?=
 =?us-ascii?Q?mYc+aSqNixTGzPTsw6JKOFaYDCikD3qNfeFzK3TbzAafeHdz2EwtAtLBn2At?=
 =?us-ascii?Q?FRDwU0Ou77JyOT/ASOR5t0KPJ5vMDttV3zRcsGSrhS/dN7R+KgFMeeoMJCaP?=
 =?us-ascii?Q?kpI4x2cxy/WVo06340nNV1dW8vKAdyNfWRvkrnlhli9S6G2jhWuqCaqd13tF?=
 =?us-ascii?Q?9ryy6+9569gS6i1l1ZQI2XnAopmjkcKGyb+RQGMNF+5l6fjdSb61IyZAc6u2?=
 =?us-ascii?Q?g5TQlVj7UgFug2ohArZvPQBdRBOeiDN/F7J5o4Fl90MnhbIfandxQ7DIDJKV?=
 =?us-ascii?Q?GNoHO/0iciz+mOI6NQxGREcecd6mItU=3D?=
X-Exchange-RoutingPolicyChecked: 
	qOyunaXDmfUM2lGBBiMow0bUHvXIwx+iBW6K7FqchrQQBde0PPXOnXw80yo3YIegWBxZ7flD4vg9Y2muHy7Y00+2D7KORE0hSSZAp0TCBx7QtsuglyDtYyhAmIkAfCLG+iGxIxIgiZZ9orFyqi/FdnWI4sQ66qsr4xH4IbjRic8WulSY9gdSA8+5PxOlilt5AOBWAriY5YeK7eCsZo/cveCahlp0CasjeMQjx/wrl/7CE5KkXrNwuJKtZbpMoIh+lAPNk77kX84e19cxs52N9ocYuGG8UbfMUeKp4W+QSs/xg1U1gp31nj6q9kH9vTojJIhlOa2dCotlN4GF0I4H+Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3accfca-d35e-402f-8634-08df13344b8d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 14:19:03.7828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E3NJ0hpem6oLOqo1CyruBgdJuoia9+nClKFUPwkMUlB7xiSVKUyG1EEmNcZv2cpopAh06y3INkDpRG6+A+cAILjQdrb3WYhege/MCszfwBM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFDB7809488
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: HuZ7BYdhrwC8YAIHK6TiNFNh67onC04B
X-Proofpoint-ORIG-GUID: GEidMH5D7LhlZkaiuPsOw56kaOjyV3sj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDIwOCBTYWx0ZWRfX7RRRAGf7lIMI
 CIfP+Lr2HVGa5PLsMcTuUwlIfwD0oh/5QUb0SWt8mjcXdgOB/sh0a8xXw/CZKLZ8LEtTvCD2f2+
 Bux7rvfwOblv1ykKS9O1QSQPuIg30iJv5S/KwF9ZVIjp/enGZcwpTWGckxdPO0tEOfpUJTvsX36
 28UyDx2OrWRrkbZ9NmiK5Rw9yV2pHCawfkCA7Nc+8shNQJPUNstelnsag7uFBMOcyRz1pcwIQds
 2SncwcZr/DabVSMx1H6YLi2u0jxnws8h9gjqZKkxvSlEqSk8nDxGlBfmcxOc9xMqG1DlNng1D24
 82deXxiR0M0B04Wq4han0baKqjgodP4Qbb3ByrEXa+LDwziyBRBQD7eKeEK9fyh37wToOSwPDOt
 X3cfdRQT718cpisHhAoVWZnOnvukNbgESNmo7Cbc5QeTX+PpTftVSSln+38b4q8HZbnplzH9/iB
 TTQRt1hzLQYymhH9QUA==
X-Authority-Analysis: v=2.4 cv=J5Y/fwnS c=1 sm=1 tr=0 ts=6aa953d9 cx=c_pps
 a=GdPAKRNZCFWq8uDyhvyBig==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=Q4-j1AaZAAAA:8
 a=NEAV23lmAAAA:8 a=ei4SEBeUAAAA:8 a=t7CeM3EgAAAA:8 a=zjtiufAZAAAA:8
 a=TrGZlGhXKWsQoEPy0aEA:9 a=9H3Qd4_ONW2Ztcrla5EB:22 a=8zIOOLb7Ym0NljyPXbuS:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=2tRhtM0yMehlNRDZlsEQ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDIwOCBTYWx0ZWRfX7kXdHHfs0h7e
 XKLxUzZvRghzz5B9i+ipJeS5qDAuRbXXFynJLCg3uPujRFxfc90g4coJXB1iY9Vt69OzSu8J7Ke
 swLrwUpG9yOrdNi2dxaxvy/UdELnRmSIJAYEJrfTLd9CNxCXmSBU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150208
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 14:19:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245845

From: Sunil Dora <sunilkumar.dora@windriver.com>

cargo hashes the "host:" line of "rustc -vV" into the metadata of build
scripts and proc-macros. Every target crate that depends on one picks it
up, so the same crate gets a different -C metadata and StableCrateId on
an x86_64 and an aarch64 build host. The added patch drops the host line
from that hash.

Patch from Alejandro Enedino Hernandez Samaniego's strict-version-hash
series:
https://lists.openembedded.org/g/openembedded-core/topic/120939810

[YOCTO #16376]

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 ...-host-triple-from-unit-metadata-hash.patch | 62 +++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/0007-cargo-omit-host-triple-from-unit-metadata-hash.patch

diff --git a/meta/recipes-devtools/rust/files/0007-cargo-omit-host-triple-from-unit-metadata-hash.patch b/meta/recipes-devtools/rust/files/0007-cargo-omit-host-triple-from-unit-metadata-hash.patch
new file mode 100644
index 0000000000..d4cb48a7a3
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/0007-cargo-omit-host-triple-from-unit-metadata-hash.patch
@@ -0,0 +1,62 @@
+From 5c4fd7d8b85f4de5be387777a782fc3ddd1227d8 Mon Sep 17 00:00:00 2001
+From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
+Date: Tue, 15 Sep 2026 17:05:36 +0530
+Subject: [PATCH] rust: keep the build host triple out of cargo unit metadata
+
+cargo hashes the "host:" line of "rustc -vV" into the metadata of host
+units, that is build scripts and proc-macros. Every target crate that
+depends on one picks that up through its own metadata, so the same crate
+gets a different -C metadata and StableCrateId on an x86_64 and an aarch64
+build host. Drop the host from the hash. The same class of problem is
+reported upstream, framed as OS differences, in
+https://github.com/rust-lang/cargo/issues/8140.
+
+Patch by Alejandro Enedino Hernandez Samaniego, from his strict-version-hash
+v5 series for openembedded-core:
+https://lists.openembedded.org/g/openembedded-core/topic/120939810
+
+Upstream-Status: Inappropriate [OE-specific]
+
+Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ .../core/compiler/build_runner/compilation_files.rs    | 10 ++--------
+ 1 file changed, 2 insertions(+), 8 deletions(-)
+
+diff --git a/src/tools/cargo/src/cargo/core/compiler/build_runner/compilation_files.rs b/src/tools/cargo/src/cargo/core/compiler/build_runner/compilation_files.rs
+index 88cab85..9dbd203 100644
+--- a/src/tools/cargo/src/cargo/core/compiler/build_runner/compilation_files.rs
++++ b/src/tools/cargo/src/cargo/core/compiler/build_runner/compilation_files.rs
+@@ -877,7 +877,7 @@ fn has_remap_path_prefix(args: &[String]) -> bool {
+ }
+ 
+ /// Hash the version of rustc being used during the build process.
+-fn hash_rustc_version(bcx: &BuildContext<'_, '_>, hasher: &mut StableHasher, unit: &Unit) {
++fn hash_rustc_version(bcx: &BuildContext<'_, '_>, hasher: &mut StableHasher, _unit: &Unit) {
+     let vers = &bcx.rustc().version;
+     if vers.pre.is_empty() || bcx.gctx.cli_unstable().separate_nightlies {
+         // For stable, keep the artifacts separate. This helps if someone is
+@@ -886,7 +886,7 @@ fn hash_rustc_version(bcx: &BuildContext<'_, '_>, hasher: &mut StableHasher, uni
+         // omitted since rustc should produce the same output for each target
+         // regardless of the host.
+         for line in bcx.rustc().verbose_version.lines() {
+-            if unit.kind.is_host() || !line.starts_with("host: ") {
++            if !line.starts_with("host: ") {
+                 line.hash(hasher);
+             }
+         }
+@@ -899,12 +899,6 @@ fn hash_rustc_version(bcx: &BuildContext<'_, '_>, hasher: &mut StableHasher, uni
+     // This assumes that the first segment is the important bit ("nightly",
+     // "beta", "dev", etc.). Skip other parts like the `.3` in `-beta.3`.
+     vers.pre.split('.').next().hash(hasher);
+-    // Keep "host" since some people switch hosts to implicitly change
+-    // targets, (like gnu vs musl or gnu vs msvc). In the future, we may want
+-    // to consider hashing `unit.kind.short_name()` instead.
+-    if unit.kind.is_host() {
+-        bcx.rustc().host.hash(hasher);
+-    }
+     // None of the other lines are important. Currently they are:
+     // binary: rustc  <-- or "rustdoc"
+     // commit-hash: 38114ff16e7856f98b2b4be7ab4cd29b38bed59a
+-- 
+2.43.0
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 54502ccc9e..a294201c6e 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -9,6 +9,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0003-bootstrap-skip-StdarchVerify-when-remote-testing.patch;patchdir=${RUSTSRC} \
             file://0004-Backport-commits-from-rust-Fix-selftest-llvm23.patch;patchdir=${RUSTSRC} \
             file://0005-rustc_codegen_llvm-Do-not-pass-amx-tf32-to-LLVM-23.patch;patchdir=${RUSTSRC} \
+            file://0007-cargo-omit-host-triple-from-unit-metadata-hash.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "be1816e7f6c40abb90245ad6e024bed2a7e88d7dda4561e4d5470207df616b9f"
 
-- 
2.43.0


