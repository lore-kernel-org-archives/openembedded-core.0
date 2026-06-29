Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C0F0C43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 12:29:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36424.1782736155326041048
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 05:29:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=JoVj8pEU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=16403eb4e8=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TB4VfL2591841
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 12:29:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=+LhytYvmO
	tPFXlo2SipX20PflljOYdmiT3ciQhMwX0I=; b=JoVj8pEUHLXxm/rmeyVAA63RX
	AmykqwWV5E1FxWC5ydaEnWR2wep7hXmFd/0szDTIlWuQdmb5b4A2TzVtNKHV1JUc
	YqV+3Wl+UbIRiqGEVJ0lkvg7e0tSgzjc7Ta3lrbXnAxpPF/OU7Bs9h3SvGwqJkG3
	nPrWCvbD1WaylyF34KGrodAzkk9kcu2WdvAdQves0m7gr3fhZtPrV/xpDSYpkD5I
	yTFi8aqodLFZHJvpbNMvfpGjP8f7Hj2zyU0Ll/frJn9WMVrkpXs+2tZ+PMehk4vA
	ZXCNmMl6a8HRU+JfqBR87ho/KwiDQwILKRESJp433iyx51NFKdKw1O3j7qxsg==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010031.outbound.protection.outlook.com [52.101.46.31])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f23r0a6bm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 12:29:13 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EXWYdkhQt4mZBdcuDZ2RI1ZfYIRjgtBCzTKk+sU2G3W2ih9/Kl5eeoh6eB8mEjWX7kj6TxNEQXrAqYWcUABOg+NWazbqBDK5jjG4lLWMQeuCiIe5OsBe1lsmdJb6uSpysdjhHVq5lV4IUUvcB0ZeqzyZ2L+uynSDB2Nzue7NZpDYuygXaryReWi09bWqAzmIyx7eBc/tZNM1v8/BON50E7pDVdYbukrauyHdCvTvPgW2HukpDtCXMRNjQpBF6EUDMrQDXPJSEX3fMvO/n30DxDAeB4uZh5wq5kYLtMQN7fklVS96IGdjJTK5F71XdTX2V3nNCzdYo49AGsD9hk3W/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+LhytYvmOtPFXlo2SipX20PflljOYdmiT3ciQhMwX0I=;
 b=Ia9HPIHz959fsAPYBWMHCLCHb577PAKii5+OwyUAHS7MEybjxNevZv47plvzm61jKfnKTHuJdb/eXCWgJ0+oyarTem1lQHyEQ0JLYIiviADXi2msg9ekaVyTxLqFagcUImbp3viUTjoxz/XuZdF0SjcI/X+eSgc7um3jNIV/cr5RIp1NksiSB5bBM8hWdvMDOPVvpoHUrFxwjrhj7cDEwmoOWVmqCv+vz25CZEDr3yvwcBrP9xI5LSGw8yhPwYPqSVl9afG2P2ZwuscXeJzef2onV3fKffAh1eYptE1Y6MKbEJcYwFaKY40ujKbYzgyQ8Igt8Jmi8fIEY/wYRC1HUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by DSSPR11MB9619.namprd11.prod.outlook.com (2603:10b6:8:376::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 12:29:11 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%6]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 12:29:11 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [wrynose][PATCH] clang/llvm: Upgrade to 22.1.8 release
Date: Mon, 29 Jun 2026 05:28:55 -0700
Message-ID: <20260629122855.3248580-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0176.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::31) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|DSSPR11MB9619:EE_
X-MS-Office365-Filtering-Correlation-Id: 4df6ad1c-d317-42e6-a798-08ded5da05e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|23010399003|3023799007|6133799003|5023799004|11063799006|18002099003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info: 
	bTKNiD/df0UTgre4SI93qacbxlyejxUttmoLywaFi/CREMAyGQj7QUZCBUqjyc8hOcosDQHvHIQIUCdbM7oZiB1rk5jjc/NRm9rT7S5QuGa5tDTxCbcwb31A05WkeIXAGLDaBtxxrisBjhV6f/1Bkwx1qfV4zC3ofNmY/wngdo4Sju/D3XkqNiYc91HlA+AiL2m89taGbVDBjSsc5wldUDmw6GwejKn+l8aLfN9XfMmlPXjgtQT9Q19C+z60tgRclXx5uRRxNTQLLBl2X/KwQL936DKfP66hjI1/jmW67nAoiJJj6ipvEoYLdykPaSagutf7LcaBUTsVKoEEzWvDsoF/PGdBwwJ5m72RBgzox/rMXk/77oYhujgvUnbs9QqPkQI0ZodhZNQjvj7nOuXUuam5eetdUB0GU2xqldxgjtDQGfpPxU65MXa+qb/snJZioFW+ombY7SIWDx3IzM1VAkfdoA1g9PJyBrkz2IDd+hm+9SeKwtTpl0apOehtUwHA4n4ECQyt39RvGetyE+NOEWTrsJleQJWW7cvT7k2j5hXURjDG91K3ym+2cZk8tls3ONR2rX/WZSZcBpx8q7kMfiL9GdJNhfD33j49TCdirDV79SBirNz02VY3vfy1x0OCrkWOw+eNq1lsrbHErspCCF9DEO43rq1zoGfnNc/0p4SBprVIeM4os9hIsm3JLGwcpTXixA6n9NhXXZQ15pO+rogllcBi1F49z/SKB8cYQcY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(23010399003)(3023799007)(6133799003)(5023799004)(11063799006)(18002099003)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WX99/NIhrWm4Ys0wUD1rexLAJJv+QSZRn4Xet3qPBlOcrAKJmcLO3xPE8WDw?=
 =?us-ascii?Q?tEgUURG/k7wmkP4Aw0ef00zfVqJQGfJILQfzhOKHtDOLzPOMB/kBY1AzLgrl?=
 =?us-ascii?Q?GBL3iflY1inpcLIP0K/jwFzx674lsEynM6S31OcDjGv9Zz4REkOk7iZiLzRw?=
 =?us-ascii?Q?GQJIDGaWwIe01rcgjWikZ9Xqdri/s8a1YPX29zO2DTcPpHE1PLmJ/JUTgp25?=
 =?us-ascii?Q?LnsRB9Ae104COjfBcttQdabMQoYIL7QIgtHDqM5Phxtrh4rxXAPTEInLsAhs?=
 =?us-ascii?Q?GcfBfcktMh+6OgXtigzILl8YwsuGei+cQTHxf/xDjYbzbXAPpCZcT+boxhSA?=
 =?us-ascii?Q?6Z2KLXqzUSjorfCnw+8gjBurzW9tlPha45n0W3sjVV661NJiXhjBr7KyvJxq?=
 =?us-ascii?Q?V+RU4jOXYIo6Gzs5o1ZGjI0+0vvTXLfQmZnM/Bzlu8Tl84xmm29EpmLi/wZq?=
 =?us-ascii?Q?SMhTVTPm5y1jo2AgoINlU79EJm3GAcH+fWRD5e320PXiiBYaxWZMvvXwMIZI?=
 =?us-ascii?Q?vS+DApTESPWjuerForeoEnO/RAWbYTUqQYoCoqIN7zSq8e7kH5ByY4vvYqMa?=
 =?us-ascii?Q?jLiZv2UrrGGwdd8YdpCV7o61HljdpyklbMjuN3T2vkk1JmX+fqi9Js277Ko5?=
 =?us-ascii?Q?A6+obJnHyJj708042bGmTpJ//XfSFI7SGthT8x+Yv32wPYNk/L2elA11ZTDG?=
 =?us-ascii?Q?8e2EeaX1ouE/JM1Ilu30ZF5xyXJASFVaUmIiZnv9YycYjPCuXcflCWV5VI7T?=
 =?us-ascii?Q?F9G/J5Y6632wMMipvDjfzOtfczIUGpb4sk/i5Rdzo4xtF4xnWwsS4DOS/W9a?=
 =?us-ascii?Q?Mgnmd59HJWpvV7/6Os2/tKgveCwVUZ8jdOu28G8v2/uU0HvDnUKV9Ig+Dx/W?=
 =?us-ascii?Q?R9y1odveOwCitmiSGfyUem+TiZRuYIWgOCSK/RDSyioRSjzQFNFwoxTsrQrB?=
 =?us-ascii?Q?4X9ot5I4Yl77iARgfiIUaQwDc79E3uBniF5lnEfr6dSdHdQMMZ4YSABAkQGV?=
 =?us-ascii?Q?sg9mUUO9I1Gfl+fbo84JrFSAqsXigN7U8cYiA/etvr1CVs8HO1BWHHRMerBh?=
 =?us-ascii?Q?Wzy2PcA2zfccBolgsP/2CLtsfNoXRkIg6DZtstr65gF/OK77zyha6hu33zAm?=
 =?us-ascii?Q?AGr/qtR1FDMqVJ7iB+uj1K/VABG9NfYRCQ/7b9gUsfEGru7ch2XNgk9ez17I?=
 =?us-ascii?Q?yi0oX654qL3dOZ88SfjCTX3WQL3qj+0ZgIUG4QTFsO5cXL+alSqj8hSp4ujw?=
 =?us-ascii?Q?UXgNzKb9aJpnvfWvmpXRKEQQGkEGIK2EH0s3yw0WHGpc+4JWOW0UH2Bp5wr0?=
 =?us-ascii?Q?SkeuaQgKHHDGCR+ez+AbwfuZSucZiUQonr2Vfg3d1EQwWXU/UwdBI4eSMkmf?=
 =?us-ascii?Q?7n6elkuPiNdvqDGsfdaL+HFAN8O0xW3fEB3DoLzwWhICU9NEeXyiNmTJBF4u?=
 =?us-ascii?Q?GEbw8urv+IBwXD2DPQ0HmndDC+t6q7yCbTUXNe6E9OkgWOrSQelKjmdUrbH2?=
 =?us-ascii?Q?DpYrfci/tVqIpirSpBEk/Uzmbwdy9IxCksWzr3m/Rxi3rYHoDZlUg1lhrP93?=
 =?us-ascii?Q?O1IoFoDXeUNCCn+GUPzbXHoSfqcj57gbfhy4s8EMo2Tlsw6uODV/iLC0euJY?=
 =?us-ascii?Q?x0q6DbM+a6qaIbD7q+pBEo8ZzpacEppcmfr0TMuiJ9pMcy5YXlO4UQWHxnj6?=
 =?us-ascii?Q?cOUtwex5cGhXlEFPE4sK3ScUkU97QOjqEhjEAZxuv0Ar7ybDBO/W95bPLhnT?=
 =?us-ascii?Q?MgxxfspCFJfxfhvT3ijOr9UN6aIrbn45G7kRvzOla9vl2T78YGFl?=
X-Exchange-RoutingPolicyChecked: 
	nEruhVHqjHocqQIyFox4P80BV5Ie38NwEfsRhnfo5dwYfQj7ZNZm4GEDavezl6BVOtzcvgImWcptC5+1pWe+SbtifZXG2jyssoeyjmVsbtjregiGZ0Iyf89LUErQ0TJkMcEUzZkiqZP3a3o+4ZZVf17DimMpDRspjCyLfplFwOKUowuV3YQRd61km7PpkdFM1/+s8spnG9gqQ2soKqKZOghsXbrvebkbcupeomQfisVwe07Z5C9I+v9RqPhMW22AMgoAqdWp3lRQnmZArHW0IZnNxDxJkZCqXdnjZ5Ntgg8YPBRGbpDWVWH9r3KwT2WluBh845TusLk7QI35XYaj2g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4df6ad1c-d317-42e6-a798-08ded5da05e3
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 12:29:11.4220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gzeUrMtdXk0OcOxNboTkfj/YdWEmeQ/gss7DIsV1z6VVVQSz3rZp0LDiSRyx+eTNCh3iKISY5NK/4wviEwYU907R1hMJWzwi2bd4c03X8qaDvgYoECmV6u3A/dotlsX7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSSPR11MB9619
X-Authority-Analysis: v=2.4 cv=DNC/JSNb c=1 sm=1 tr=0 ts=6a426519 cx=c_pps
 a=1g1g+NiJF5nyOkqFb40SOQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=Twlkf-z8AAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=iGHA9ds3AAAA:8
 a=3szH12eoZcMTRZNvg0oA:9 a=-74SuR6ZdpOK_LpdRCUo:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: MdAx9T-YGVcFKnKpaKVBSiwYEyjWbZLq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwMiBTYWx0ZWRfX4w/ZhhQbVhNq
 dySBTT7U0S/SBwChhTj8HNsyBE1505G4g0vrE7DrD4OAWEbHZT/ApiF3egW7p+upQaEjIVBM2UN
 e08XRwjSPGX3JsYun53hkTddTcfzxem6oIvNmo93QDtw7/X10dCtRQf3+hQhNzsKi6iu5aa7FJH
 LjRjHyQ82QBx7ClxtRmszrR72F3QFZjgTAGCsjZOD4vnDGqWPw2YBMFoQfrZWFeQryj5uQxmUXy
 MJlZPxyHD9eFqgLn406lABk7BRsEWcnYtUim1EnnCqkA+euwMcz3Ny82o7JSofaEN+y+5pef5Le
 nPMxc8rUpz7nB/eaqC69lqLpkP4SxHNDEssMVEsZyQzxh+EDBGLruuF8YpmVqL5Uh7cBaLZtL/4
 Yore/xZdR0lFf2GBzmoAB/ZC0eRSZkc5d93BAeGwPL+qNgujsA6OpRe3oIchwckApNsb/H6niaY
 REnFJw2oBMcaV1vtD3A==
X-Proofpoint-GUID: MdAx9T-YGVcFKnKpaKVBSiwYEyjWbZLq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwMiBTYWx0ZWRfXwU/9XxLTk7Vh
 4nhuf5dbO35oMGEnCHW+buHtB1l/vvqIq2CciXhocZ+nQ6bHQeiMPuPXhBi1/0ce/hGCUBIMzf6
 tQg+ixmJKXisUSVFNlfz2tNReciSrDSJzqGS1XxPyYvtIYgVCGXz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290102
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 12:29:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239764

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

https://discourse.llvm.org/t/llvm-22-1-8-released/91084

Brings following fixes:
ca7933e47d3a [libc++] Disable mistakenly enabled `optional<T&>` constructors for `optional<T>` (#194446)
208ef916cf20 [WebAssembly] narrow instructions use signed saturation (#201798)
e80beda6e255 [VPlan] Account for any-of costs in legacy cost model
3397c37d5d31 Inline stack probes immediately after `allocateStack` in `eliminateCallFramePseudoInstr` (#195456)
1f5aee55a3fc [DAG] Narrow vselect mask to vXi1 in foldToMaskedStore (#201609)
070e505ce21d [LLD][ELF] Add missing initialization of Symbol `used` member.
761b9134dd9b [BPF] treat compiler fence as codegen no-op (#196734)
724301d98c6e Fix "Cannot select" crash on bitcast between f64 and int vector types (#201509)
60c18c6aeaed [CMake][Release] Use llvm-bitcode-strip on Darwin for build with -ffat-lto-objects (#200764)
b65aa9b5ea8d [Clang] Profile the NNS of UnresolvedUsingType and CXXThisType correctly in concept hashing (#199617)
b4fe3880d09b Bump version to 22.1.8
a255c1ed36a1 (tag: llvmorg-22.1.7) [WebAssembly] Avoid crash in LateEHPrepare with empty cleanup pads (#200322)
a2b779045093 [SystemZ] Fix off-by-one error in backend (#200141)
2615295c15ba [libc++] Fix multi{map,set}::extract not returning the first matching element (#199703)
a760d7c07024 [LLD] [COFF] Fix handling of immediates in ARM64_SECREL_HIGH12A (#200060)
294ae8d1e62a [PowerPC] Drop invalid range metadata when lowering i64 load to fp in INT_TO_FP (#198705)
6db0725886bb [X86] lowerV64I8Shuffle - avoid lowerShuffleAsRepeatedMaskAndLanePermute call on VBMI targets (#183109)
c43c9b426055 [X86] lowerV64I8Shuffle - prefer VPERMV3 byte shuffles to OR(PSHUFB,PSHUFB) on VBMI targets (#182852)
6ac68778a76e [X86] Add test coverage for #137422 (#182832)
ad9524f38657 [PowerPC] Fix i128 vcmpequb optimization for loads with range metadata and small constants (#196801)
48967cc1a0d4 build: adjust LLDB and clang library naming on Windows (#185084)
8798085803f1 [libc] Demote compiler check error to a warning (#198033)
6e5effc4990b [LoongArch] Revert "Add patterns to support vector type average instructions generation" (#198306)
4d5dffb59420 [ELF] Initialize Symbol fields in the constructor instead of via memset (#198129)
823afe046164 Reland [C++20] [Modules] Don't profiling the callee of CXXFoldExpr (#190732) (#195983)
e624f1204282 [CoroSplit] Never collect allocas used by catchpad into frame (#186728)
81c69e140401 Bump version to 22.1.7
fc4aad7b5db3 (tag: llvmorg-22.1.6) [Clang][Coroutines] Don't emit fake uses for coroutine parameters (#194690)
5fb52fc3fda6 [Coverage] Fix assertion failure when a -isystem header invokes a user macro (#195427)
fd10d8f31077 [DAGTypeLegalizer] Add missing BR_CC handler for soft-promoted half operands (#196214)
c0262e742787 [SystemZ] Fix internal error with single-element vector types (#196127)
cbb1eb533ded [lldb-dap] Fix crash in source request handler (#195847)
897d3e2b2a63 [lldb][windows] fix cross DLL file descriptor lookup crash (#195855)
60e3203b2e90 Bump version to 22.1.6
5ea218a153f4 (tag: llvmorg-22.1.5) [CMake] Add multi-target cross to ARM/AArch64 Linux toolchain CMake cache file. (#179598)
7237429c2edc [AArch64] Fix `shufflevector` miscompilation on `aarch64_be` (#193076)
5e29d8aa0481 Prevent undefined behavior caused by combination of branch and load delay slots on MIPS1 (#185427)
c61be37fe844 [clang][CodeView] Prevent the input name from appearing in LF_BUILDINFO (#194140)
a4aca5a91cc3 [libunwind] fix build errors on x32 and mips n32 (#194310)
57370e18b8a9 [Coverage] Fix quadratic propagation in RawCoverageMappingReader (#194996)
932756ad6c64 [X86][FastISel] Restore support for struct returns (#194586)
19f65f31105c [LLD][ELF] Fix performance regression when using linker scripts (#194668)
5c9647b8e680 release/22.x: [WebAssembly] Fix EHPadStack calculation in fixCallUnwindMismatches (#194184)
f3ce7a7db0dc [clang] fix crash with c-style casts involving dependent member-pointer types (#194696)
692d49bdb7ad [clang-tidy] Add note about removal of `hicpp` module
ca0698598261 [SystemZ] Enable -fpatchable-function-entry=M,N (#178191)
0d37e79da8db [X86] lowerV4F32Shuffle - don't use INSERTPS if SHUFPS will suffice (#186468)
9b722024f1be [compiler-rt][sanitizer] Remove linux/scc.h (#194116)
7bf7d99b794d [NFC][AArch64] Allocate AArch64Subtarget on the heap instead of stack (#176488)
98348c38cf17 [C++20] [Modules] Add VisiblePromoted module ownership kind (#189903)
a9fb4799dcad [clang] NFC: Add test case for #178324 and mark it as fixed (#190490)
f131d162201b [clang] fix error: cannot compile this l-value expression yet (#187755)
20fd94cf9314 [SLP] Fix a very long loads offset, being stored in DenseMap
267ce6017a57 [lldb] Add EXPORT to lldb-tblgen (#192610)
c4b74e87ca35 Bump version to 22.1.5
35990504507d (tag: llvmorg-22.1.4) [Hexagon] Add missing MIRParser link dependency (#191010)
22ad4d688a72 [Hexagon][MIR] Serialize HexagonMachineFunctionInfo::StackAlignBaseReg to MIR (#190003)
a1a9924414aa [Hexagon] Add AP register to liveins when used for frame index access (#188942)
7eb182991920 [Hexagon] Fix use-before-def of AP register in prologue CSR spills (#188504)
74049f6e3a70 [VectorCombine] Fix transitive Uses in foldShuffleToIdentity (#188989)
a01a45066dae [NFC][test] Precommit test for pr188989 (#188667)
9f29c1e3fd8a [X86] Fix missing ByValTemporaries update in CopyViaTemp path for musttail calls (#190540)
d46116b2e464 Suppress octal literal diagnostics from system macros (#192481)
a5564a033004 [OpenMP][OMPT] Revert `control_tool.c` changes from #191429 (#192069)
3f9b9936be95 [OpenMP][OMPT] Fix `omp_control_tool` before any directive (#191429)
d1c9116f8442 [clang-format] Correctly annotate binary stars in braced init lists (#186732)
99031a474bb1 release/22.x: [Clang] Track constraint's SubstIndex only if it contains outer parameter packs
5a1590c14433 [ClangLinkerWrapper] Fix `-v` for newer CMake passing it directly (#188883)
c8e984d27b27 [X86] Fix VPMOVPattern folding for extended registers (#191760)
07c19c303387 [compiler-rt] [Darwin] Move macOS ASAN reservation above 512G (#191039)
fa56327584fe [22.x][LoongArch] Revert musttail/byval/sret Changes
10be0a255205 [clang] Allow -Wno-error=X to downgrade -pedantic-errors diagnostics to warnings (#184756)
c2aea991dba1 [Hexagon]  Fix O(N^2) compile-time regression in HexagonOptAddrMode (#189531)
f444cca96bd5 [AArch64][SME] Preserve ZA in agnostic ZA functions without +sme (#190141)
5d161731998c MIPS/expandAtomicBinOp: Remove tailing kill dead register operands (#186055)
def143a6c624 [clang] fix getReplacedTemplateParameter for function template specializations (#189559)
5b4dd04594bd [pdb] Fix public symbol hashing in GSIHashStreamBuilder::finalizeBuckets (#190133)
f42d371a5d72 [WebAssembly] Fix: fixCallUnwindMismatches after fixCatchUnwindMismatches (#187484)
e9a36c0cca40 [CodeGen] Preserve big-endian trunc in concat_vectors (#190701)
53c41b3a599f [PowerPC] Optimize bitcast(truncate) patterns using vbpermq (#181233)
ab2f55b13bcb [LLD] [COFF] Fix crashes for conflicting exports with -export-all-symbols (#190492)
f0593ab291c7 Bump version to 22.1.4

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/conf/distro/include/maintainers.inc     | 2 +-
 meta/recipes-devtools/clang/common-clang.inc | 2 +-
 meta/recipes-devtools/clang/common.inc       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 99242af484..7499f7ab95 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -483,7 +483,7 @@ RECIPE_MAINTAINER:pn-linux-yocto-tiny = "Bruce Ashfield <bruce.ashfield@gmail.co
 RECIPE_MAINTAINER:pn-lld = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-lldb = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-llvm-project-source-22.1.3 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-llvm-project-source-22.1.8 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm-tblgen-native = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-log4cplus = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-logrotate = "Yi Zhao <yi.zhao@windriver.com>"
diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-devtools/clang/common-clang.inc
index 1b8909eeb5..ed628008e0 100644
--- a/meta/recipes-devtools/clang/common-clang.inc
+++ b/meta/recipes-devtools/clang/common-clang.inc
@@ -5,7 +5,7 @@ LLVM_HTTP ?= "https://github.com/llvm"
 
 MAJOR_VER = "22"
 MINOR_VER = "1"
-PATCH_VER = "3"
+PATCH_VER = "8"
 # could be 'rcX' or 'git' or empty ( for release )
 VER_SUFFIX = ""
 
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index 9d45898c68..441ea099a9 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -17,7 +17,7 @@ BASEURI ?= "${LLVM_HTTP}/llvm-project/releases/download/llvmorg-${PV}${VER_SUFFI
 UPSTREAM_CHECK_URI = "${LLVM_HTTP}/llvm-project/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/llvmorg-?(?P<pver>\d+(\.\d+)+)"
 SOURCEDIR ?= "llvm-project-${PV}${VER_SUFFIX}.src"
-SRC_URI[sha256sum] = "2488c33a959eafba1c44f253e5bbe7ac958eb53fa626298a3a5f4b87373767cd"
+SRC_URI[sha256sum] = "922f1817a0df7b1489272d18134ee0087a8b068828f87ac63b9861b1a9965888"
 
 SRC_URI = "\
     ${BASEURI} \
-- 
2.53.0


