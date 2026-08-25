Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4817CC61CE3
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 00:46:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11831.1787618782737769283
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 17:46:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=StPUdpfz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2697b458cb=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P0jnui3986794
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 00:46:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=QGvlrlWArdVviZENMUVVcISa3tiJlqfQvViIAGrgaho=; b=
	StPUdpfzvKIoYMGremoZvypfrhOZqicdlc0/fsVeGldC9qVocBJz4CVgexqIYXFf
	vGFhgX6bDgGtE4wJtGaoUSLD6jUC3k4GGTY1aGQeufMGx5dsckQrHlKUL0BGmdla
	z7hzNHpMaOb20R3lNf3KXmzTOMepgid033Us9rCl42uiFRW0cl2M9J51YlENei7G
	iK5AsbISsv6yl7m4FaUlblW3ZX40T3qFJkMUTXBOGornZdXgmQ6guBWi0FEnj4ne
	uwiC1jM0iZr9ToTl9PIlqqgzlktbmMhDQVAC/n/B9gmYuUFD2KD3UpOr+AYJ+FxX
	7dJJ3iSurjRP1liyQHgs2w==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020122.outbound.protection.outlook.com [52.101.46.122])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g72r6unmt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 25 Aug 2026 00:46:21 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KSINENaVUsSqeq/tb0X8Amh7SGad89yWtNQgNJJcGe7Un01ZWvbjMlEKr/GU60GQYmXYAKWufYH3vNpk8ZWaLk+6hz2/42ggV1KDO1ady43mwlMh9BAmy7vb8d+1HhF1xqvm5hMNAKElwFmJI8KDxz8PNIDDQ9drGjV/j64fmSqDw7bP1VuZzQH4EYg8W7jsOkoQcddL8Gh4029gnG16vuVenINVuTgN7qbkTu68ZCDMR7+W9eVs300JtByQgVpii+i7FyqoBWnb0HzUvjqBI2gYUBY4dS/ZQArCoQyd7vsMasp3ejJ7fj/TFNdhadrN+wA2eO7d1ApHWGhOoUEPCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QGvlrlWArdVviZENMUVVcISa3tiJlqfQvViIAGrgaho=;
 b=bAx64FG26gJLScQOrQyIirQKbnseNb+EwBOMFGxQiJTa5ljp4c4wVIy0fHKxyihwHKFVVg3ZkTcj8KjKJ1Q7Cd/XwQM3H5qbRvDFdbEfK6+FSLc2cnG4pLxnfLyG9sA9Q/f1VaBM/PWFbXHcoNB1yRZFqslPVsQiXqX/5AuiQ9gBYmhN4sgHqLz66cTuz43Ya9mvAumDb5u8SaUeKrs7T+BTboEYfs5cGEh/5O4dzRyAuD4AFVwzea8cmOhrYJm3A/4IWxA7kyZMtHylIvrIg27HzY2BWt7jR7Uvwk3BAGV7WNTBc07YcFvHCQ38WPMo5as13EdcbQQA7eUI2u+B2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by DSSPR11MB9642.namprd11.prod.outlook.com (2603:10b6:8:377::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 00:46:19 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 00:46:19 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v16 11/14] package_rpm.bbclass: Suppress pkgconfig() Requires for sstate compatibility
Date: Mon, 24 Aug 2026 17:45:48 -0700
Message-ID: <20260825004555.4111831-12-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260825004555.4111831-1-sumanth.gavini@windriver.com>
References: <20260825004555.4111831-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0027.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::32) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|DSSPR11MB9642:EE_
X-MS-Office365-Filtering-Correlation-Id: 7278d0e4-4be4-4982-28eb-08df0242470b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|23010399003|5023799004|11063799006|10067099003|56012099006|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	KRtwsbeP5A0BdMpCMub6l6q72aDcTTBYCBw97uKYm9yJUEObze85GI//fSqXDj6DMQEWbqwZRnxMsVcK+Bx+3HcduXBY9wtn9L2z2dcLv1sMAltTXmGxKhyfTnMWdqumXC6XNXOMF5F3UAOUYwfLnGdmUZHTucSXNIytzZGjI1MhEaNwArhSy4gP2hi/TQgxjF/WY5M38OHFJDsDAh/CIFcgAy+zVcfbCTZbnXRHUG0BVslkZc9C+pxdNGQApLDzEdYfd4XYgXTxbFLyybwX4msF/7/6kLMgKa5I2C8UI7oK1pKA+PpwWUCPVWYhDmWD00lZnTy5EkaDPI8biOdBJUtijCZ9LvbvqKc3pxCv0cZ4DRzjY9nhzKbpHdjUwCK5JNBTQ+WtuyPiJovWrePjE5nLpP2go4F+BtC/x4vlTIr4TjIkBheUHKc9T+XuakkLhObTHv+RxXPYgeQIfVzTZkB23uYvuEvZhxXVpNRBwf+dhUkA2IF8EVxKVab+p0j/ADhc4e5rt+1rAJku+Q4nJ4oWXRzVOCxkAPTZrOzjhGHyW234vvqgFlSyDN6vl7boscRaNAVzjXGSivYaeFEzA7JX9I1EWe+FQLyYDTME38HDuiTEWyFIXceyD5wRzr2wwmQmcS9Wwc3gou8ufFusHso4zXLcfR31dSRIDVPNfsc06FUIvYgAyIGFkVoHhAB/iU1Yl5h2WSxcJynXcoSDodk4Qj7pGKepOr021gzN6Kg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(23010399003)(5023799004)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UBQHXWduORTVY0KLutF/a3oZ7peZxoCzChpesJBo28OxZHLkpyKeiZeE6v7G?=
 =?us-ascii?Q?y0Il2tldYHGbt0TjTKkg4ITrDzDQ/a2XQ83XFjO2zYRl45Wsix9jO8yFu7aI?=
 =?us-ascii?Q?Tr35VAHo87rbT9aEFEqnfqEWXVQ2uE6md8+wzfHyw8ET58bEtz/B7Z8EVeae?=
 =?us-ascii?Q?wjjwSFWv39Kq4Smbj0Vqwz3RstojZcstKGi4tL2/Le9HR2aZnUaORCcG3kB6?=
 =?us-ascii?Q?ZXJbnbQvBscSzjcM4h2H49wBQHF3qqkGp3+ZEKbhsg75VwOzjs8VJARnMRYZ?=
 =?us-ascii?Q?raY9UNO3vA45G5TFXTnWGYtd+arc+VCc3p/nJqByaS/ky4w9JhZUmbB3B02N?=
 =?us-ascii?Q?be9nAwH4K9UGjvRjFTZPne1gTzAEvM5AJNQcVSV5ov9bPCJnvKbYZ49E5BId?=
 =?us-ascii?Q?DYydmOCmqdAQ/2HtsTmdb4hcengvsm7KToxkU0AxRXhdDaLVGbHDwYTZKJFC?=
 =?us-ascii?Q?TJ3wetDmJYYv9uW84JSWo1vNOh74GRQsCNwzob6HaIFu8PNUj4Qa6nHpv0h3?=
 =?us-ascii?Q?r+3pFquL9kVVa9FIQVEx6eZzi4vpDT9vJtVYl0wk3GUVcbuHRIOplskJmc1e?=
 =?us-ascii?Q?ty3fA0A71BJQndwCy+QMRZt8JdcQFa3+L1Y+v03e9mVwwbSTJGFZBZC58Peu?=
 =?us-ascii?Q?JdGH7vRUwPZJi5ynEv8wNUSCDhAA9i12+/9Wos28gz+ZthxFq6GVuqXqdSNQ?=
 =?us-ascii?Q?qZU1BaOT20aIQ1id+J+Fg+Sa/EBD4Xj8mVzsw8/3EpRwbqrhxcmPMUqIkoDU?=
 =?us-ascii?Q?p2xUMcEsioDMuHHHqzmCGtgdYmg64SsOiKneXLfftbnhs1p0o9bWHOUUa3ZO?=
 =?us-ascii?Q?RV/fvEaJ6X0d0tpt6XEH60Tmrz4cHj5TkRaeSH9TQ1xAYuSXCD9IlDPyP6Qy?=
 =?us-ascii?Q?Jjbgi45xV5fno2Mbq48345RhTDo4Nat3oFqkDPu8YhsVoHp8tkQJ6d+RyeK2?=
 =?us-ascii?Q?IrTOWZrUGYpyrnRsNlL6hZalfNtSZcl1q6+MGBpoEVx/12z44jXXE8R9O8OD?=
 =?us-ascii?Q?7STWkUyL/ARvAH5nFhqc9IJbAAR5HI2/DEGdZdMfXKiTwe3XFgqDKdPowMXL?=
 =?us-ascii?Q?3KQBslv/8xVxh/V4xMLzpPNWIc6fUsb/n83xstAwPhAUblvPhRC/kOZO3Ixt?=
 =?us-ascii?Q?NpX5nmFetnfOX9hjHexZypXCwi842mMhnxBbuMirNt2uTrC7UjJJ719Jk62k?=
 =?us-ascii?Q?/wnUGZ7zORiPuQs3TCgN7+lO5wnZ++jqTKcaRMcr63cQkBYD6d4UtNJjLJH1?=
 =?us-ascii?Q?sk3i9yl8kSHuTD3+OGkrLVPONRBCZ7rM+oog5A6MKFDX2KplVvmQbAcZ3y6T?=
 =?us-ascii?Q?hCUFsgWMx33/wcccSP5N9TH5xIIKY//22FOQdC1zAu9GaSiowdM//gqBvVMZ?=
 =?us-ascii?Q?TDoYKN5Z5xOeX6ZOx/4mT7/UOut3mvvJ5EA9GNOAVC3R8lOiFJZMf3m4a/b2?=
 =?us-ascii?Q?z2LEC5WxbhcEwv+J6Z0hvocmyOrRxAE7JP/ZAxyhW7VpW2eVEwjJX6jC2Wo3?=
 =?us-ascii?Q?pqLGz7ZlHO3FtGx6utPi1d/3ifj/KI+I8M1wMZx2ilZyouJdg54FzUWbpTOf?=
 =?us-ascii?Q?n2EIcwcCNLXNA0/owmpS55GpewGWMs/vm4Db3pyAP3XIS5r9IloXWAwyXQZG?=
 =?us-ascii?Q?XqG7ghKgKj8Oa/nyA2nvEtUQvDg8e1iuuGJ+We/5thkSJQe/wbo+XUEME+Zx?=
 =?us-ascii?Q?U9Leny7yDZ4EHEklKW+CYkElyqjr6WkNd+69CFk7ZGLJLwNmR+rvV4vRg35D?=
 =?us-ascii?Q?okffzTumvyBgb2gExCgCG7U9PpGwwI0=3D?=
X-Exchange-RoutingPolicyChecked: 
	cR1HXKQZFPc0CI/Yg++S1a3qGHwKd5qkJWHhHBtOI4HECT+fNM5O6Kq0YDqVUjVCAd4TqdF21mRLDGOKOZqfmqszlU2B292G3FsfexXRTu4ltigaZEL0z8YLMqq/wjTkdJVwMBSJsUmFpQwBweFFZlnJXiF2U01sve6br0yDWo4UiYZD4TXAmazU7GzEL7nB9hctG0/muRO6c8a7lxQmtWhqGyIyWmd2zDACV12W7zq62Eoa142PM1sukAqOfFB6eZPALz/2j7LaCL+Zp1P0Tlm0I+86/Gu3kWYSCFf1a/GPnzDM8kv/0SIMzfwCOpDPCIPMJN6IPq9L9wlkvDEJmg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7278d0e4-4be4-4982-28eb-08df0242470b
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 00:46:19.4645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +pQXRrdMNCIY8HHrY4lw6i9aPAyax4fZPk+lKExVbVjmpvxjT+38/jEYkA3CrnMkcLjn68KkaleqLP2vfMPklGaXuJiZ1fipvW9F1wVkb84=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSSPR11MB9642
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDAwMyBTYWx0ZWRfX4RvFcORvrc5d
 14lPoZFcRWwYxLjO5KTM94vntiSB9UCSouONItehyppyv2iE35w5eh7e/RZ6Df7ZEVl+6lWAano
 4EZcxxEEqs9khJVjhSTrjWhLGrk6SYNAogfDWqglCxK+Yfuduq1z
X-Proofpoint-ORIG-GUID: Hy1bW-gkAKTLVIavZHW5w_ykNd8mIEM5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDAwMyBTYWx0ZWRfX+P5AvfncUiA1
 2lI3UYenSNhq1QQmbk1gw+MfN8Gh1JBlgWXuYpwS9iHf/q7B9H949aBOvtOiCAQP3kOICHtvJO8
 oW4Ko0hbQjrW7SREtX6NXR94qyhRWkr2KgT2rZpfkxDCSqZP9QrX647ogYlN9xs9QamZuAqX7u9
 xBVaxCIMfzxCtGjhvtvpe1yUkocd6/rRmGcCz0S+fzciY/d0qpVWtLNKVUy+B5OgHAMup3s7biq
 mhFT8hpog8WXqKgBCbGB5yUC414vSkGnvoox3rCbNdrS/nX8xs9fomTbq7+LDMrh2OvGZR63mn+
 Sbm5lZEEsQe4VY8+j+GGUoxFrJsrrO8d69UQUqFxRAjYp1HjYz8tgJHR42fYDRf/7d69BDZ0+Xk
 sVmUozPsJVADvtBIMHQYQGIin8wH5VQHS2dIzyULuF7PgjBRHaCICXfYoAW4nR7RdvujXnvuNvx
 BgJ0E/kdCT1jlcWe8Qw==
X-Proofpoint-GUID: cIy7M83fkjH5EeAmsDGkNIz5j559sPYZ
X-Authority-Analysis: v=2.4 cv=RLiD2Yi+ c=1 sm=1 tr=0 ts=6a8ce5dd cx=c_pps
 a=Ov5XJGn/dQMl/+TwTE/lXw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=0YVC25x4kLZrtsW4MIcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_07,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250003
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 00:46:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244168

rpm 4 had two dependency generation systems: an external generator
(System 1) and an internal fileattr-based generator (System 2).
OE used System 1 and disabled everything via:

  --define '_use_internal_dependency_generator 0'
  --define '__find_requires %{nil}'
  --define '__find_provides %{nil}'

This meant pkgconfigdeps.sh (part of System 2) never ran in OE builds.

rpm 6 removed System 1 entirely. For v6-format packages it only runs
the fileattr system (System 2), and _use_internal_dependency_generator
is ignored.  So __find_requires %{nil} no longer works, and
pkgconfigdeps.sh now runs for the first time in OE builds.

pkgconfigdeps.sh --requires generates both "Requires:/usr/bin/pkg-config"
and "Requires: pkgconfig(foo)" for each .pc dependency.  This creates a
sstate compatibility problem: packages built before the pkgconfigdeps.sh
fix (which unsets PKG_CONFIG_SYSROOT_DIR) have no "Provides:pkgconfig(foo)"
because pkg-config was failing silently.  When DNF installs a mix of old
sstate packages (no Provides) and new packages (now generating
Requires),
it fails with:

  nothing provides pkgconfig(zlib) needed by elfutils-dev
  nothing provides pkgconfig(x11) needed by libdrm-dev

In rpm 6, the correct way to suppress a specific fileattr generator is
via its per-generator macro.  Set __pkgconfig_requires %{nil} so new
packages don't generate Requires that old sstate packages can't satisfy.
Provides generation (__pkgconfig_provides) is kept so packages still
advertise their pkgconfig modules.

OE manages build and runtime deps via DEPENDS/RDEPENDS; auto-generated
pkgconfig() Requires from rpmbuild are not needed.  This follows the
same pattern as the existing __font_provides %{nil}.

Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/classes-global/package_rpm.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index 51ad195baa..1e016971f5 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -599,6 +599,7 @@ python do_package_rpm () {
     cmd = cmd + " --define 'use_source_date_epoch_as_buildtime 1'"
     cmd = cmd + " --define '_buildhost reproducible'"
     cmd = cmd + " --define '__font_provides %{nil}'"
+    cmd = cmd + " --define '__pkgconfig_requires %{nil}'"
     cmd = cmd + " --define '_unpackaged_files_terminate_build 0'"
     cmd = cmd + " --define 'debug_package %{nil}'"
     cmd = cmd + " --define '_tmppath " + workdir + "'"

