Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFC45F3029D
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 03:24:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43265.1773631435157453773
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 20:23:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=o0Wzn7CP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75355d60f7=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G3GDD92948197
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 20:23:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=3wqivEPfh
	ZxuFtAysQODR/71ylG1T9QMiOhDgphA9Xw=; b=o0Wzn7CPyjLwlrgbORsr7eLv+
	mkoT97MvHiPCuVWkTztCfhYeZHov+m2wIpIPZWmA10EMiWs55AcrH1n85tRBxPd9
	npvIFRRZS1f0ay0qukIIC81fdFALZibZBL6/pO3GJ/t4vU0A4ICSO8jwE2Cgk/5f
	+4bEFJMjUxBb2sBoosWSuWh6F5EyfOYqGNK3Np4ef3ZLgCd6hxBs/rX+PW3Cu6eR
	Jd1nYDjDCBFg8wvMT/J18ZKclPSzgh3Kyr+4EHQQ528Knu2pKyCID6PPLfIECHP8
	c9yBzmG5FDUmXLujSZvXlt3Gim4FMbUSmTtfYUkBgt2dOXLFUX7DJ02z366Gw==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012022.outbound.protection.outlook.com [52.101.43.22])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cw76ds71n-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 20:23:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nwmxKta/iXr2zDiKrk1qQcFhlOPz6hJd2uW0xAV/MwH0EgKQirBwy8D90yem5hs3IOlH/JlbI8O6A58v7vBS1wE7ZPxFVKk2DEkIfxrKAqR/NNz+MVg1//9KhxKyq8ngNdKAgh3vdJ+hH4l+Bcu6qQFkkCPHXL+fvQbf89Zr1Afe0nhNnI2ijl+1nA7mfuRTVij4yy7pu9b41EsQwWRNvKiU1/ERw1wgk6djzOXdkDwxUVvdcaWBVp7uj4XRDZUMOCIOAfH3mrbxsqq+Xv8CE8NnGEBuF9sTObp1R4Hrx+c9YnJJ4V16hAWli1+nn5K/aJymlM4XTfNjpxW5fjl7ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3wqivEPfhZxuFtAysQODR/71ylG1T9QMiOhDgphA9Xw=;
 b=jhb56hwbTlth98+2S7dSY8YAaYdG/zGYcwHqYmrEl0B7uvOfM9j/aNJNHfMo8KIncDgyWw34VnJZyFIzRpOZFrsVKKs3tPdw4vN0uAi4leqIczrWFHm7OEq0OG5e72WZEvs71U7k58EGm4n8ZJi6IW+NTdV8rTf/rTrBR9zs6YCBakBBI0HRIS8k0QDdUAw/hq1SQDcxNTAh4c0iJELbTkDGHRJWJF0veNyMlBjRWROsdQqnUxacc7E8rQ18iGaKrdvwID3gjs0PQ6yHUIXFthUDQRjlgDrP3H5/5IbEejM/jGpVlpOYY2sK3ZrwYYof5fAdz6KrCFIAqpskMoomyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 IA4PR11MB9395.namprd11.prod.outlook.com (2603:10b6:208:55f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.4; Mon, 16 Mar
 2026 03:23:51 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.20.9723.014; Mon, 16 Mar 2026
 03:23:51 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, sunilkumar.dora@windriver.com
Subject: [PATCH V4 0/1] gdb: upgrade to 17.1
Date: Sun, 15 Mar 2026 20:23:28 -0700
Message-ID: <20260316032329.2695161-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0013.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::26) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|IA4PR11MB9395:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b5a69ec-ec5a-4bee-5c2e-08de830b7207
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|52116014|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	JsVIaYU1x6F8vwslk9JeiLEEHC7HZwAjQUfXxUBhCLIgYufw7zJwrUJtWCajdKIjAOkNfvCK757UwahEQkuzpNCNifFEHyOKeaMtzHtKjR2sPsgk7PW3NlnDBhDXzHgphZcdMz9sZhUV6dGOEtieEMf9/4tRCA6nAURyAnqrXxlmYRFIDrLX+zJQrJZGdC3Hd71vPUiv+IT+Qch1L9zFeWP9XX6f+3hxhg4pSVZ7keTPPI/PgFO6pQgCzadl3azyRFCotwqQ2su6MMLUfGYQ7H/QFKIQxE5ySo+SAaUGckt8RwAHZddSqRoNBLF/xHuzUvGtzM/Qw8oh5CUV532XkShoe73/grLGuoJm/cAxV2pYmn7aIq69goDFlq+lEpNFWFlu+2BZmKbxbnb+Uq7jxoPS2HDIGJxIfAODJlttFmRh6miQ/zxShcWvzmcnxMPUkPy2oTHzeRB2iJJnPucOMIAjTAGPgKRreWAfHqnicDv8Ho/0Ldx2SnZ2n9YIk1gMw+EZ4z1DwQWVaxRAYerpKKHi1Qnb2SXZ73hKoyRG+PRPUQO6QLLtdWbCT1K9qtM+NeQsep3QQxAmAx0W4YgHwN9ne/+i+qx7yigYac9/wwHqAy5NX7kT0CxYjro6SuO/oatFvdFxO2EsBkIimaqruxS+gHWM2jn3wJDQWl+UYMFUMnX8eZPZnByPE8D1lmp/wVjR/2GU2cGGyekeA7B2ER67D+ZP4JG5Gpx6+bJdVmfeFF52nk264SlDgtQAXdkV
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6fV8qDzEQw77O6WV+oDr77zs/mbSXk3IkoFPayDGfHpAKeGfuTRwPL9pcxF+?=
 =?us-ascii?Q?BqocRXxj24j9gksIvFmXyx4Zdz1UNy3ansZaJcZcZiuwE9bE8SbnpFYdRZ25?=
 =?us-ascii?Q?w/xRw1vxNp8InbenS2LpvakckTrRynJymVcllVon/Z/pq36+zpBJoo3gnBpL?=
 =?us-ascii?Q?GDpaniSxb2oOaLmvYQExmNbgQ+WNEYOqcXhDyxeNcAGkAkfpYRBMtcD/Sf7k?=
 =?us-ascii?Q?JL+6M+Ih+nKN2a9Mf7uhFlZU8xS9m0NBJrGwx8LVinBeY2rtBW/z/E3h3B6s?=
 =?us-ascii?Q?pfqr4ni0YF9s89HDUedDEtB6VG2qxONjCzRWOEDT88KkPAel3fqb1hngtP+/?=
 =?us-ascii?Q?HALgvhDvfYRa/VTmdkCixCP/bzu0Z27ItGm1Q98zSd7Txu9mt300iZvzze4G?=
 =?us-ascii?Q?IBgeRwPgH01nsSZJYbJNiJQ0+N1jrmbqtRg4kVn15m1zaanAkJfL7WmNZgMR?=
 =?us-ascii?Q?g+OKWfBV9c0qcmSF5ho/TQCFfZTU5TM7tCmD00E8zlr2v885sgBTAzPxjhvK?=
 =?us-ascii?Q?UKVq8i/2oN4K3ltGHqE+nvN8I8ihwGOVrBxERLi094/CluSiSee4Azosvd/N?=
 =?us-ascii?Q?t2aNPYgF8OMKH1YrXrI03kNd97UffttL/0db7qmgO0OIDeS+VAVlETo87egU?=
 =?us-ascii?Q?aNxknfHLaHwXC0BBvCNWw7cYL74zLYJzHMgs8gzWxk7+xXC//b5P03WpN8cF?=
 =?us-ascii?Q?auTRxIO8Kk5TOtIqfnIUZLX2eoic6uSQqEMd6xWaaP8YFtKR0hxCOC+ma1hz?=
 =?us-ascii?Q?2taGTk/7Sxn4Z68JjXuC0i6c2gq7381vg4NxqI5VzZOkwp67qpa8G9EesGLS?=
 =?us-ascii?Q?8z5vTzQf3+xWrwRAyWcX9ogB1FtXpv3jO8X1oMRi5Ec7VBBE20MXods0rZwJ?=
 =?us-ascii?Q?2/GSG17BAmRiu5iSWYG+2ynT7Jy4/F/wgMvdCh8MSXqugtheO9CvAQRhbF7A?=
 =?us-ascii?Q?usljN0dfkVvJO4MbloPwmK47carpBwHwmBB3PXGsOINubYknhM+6bf7ACgT+?=
 =?us-ascii?Q?jjXHRsqKEyLz99fT7mPNLnMA5HFhkp+ySxJ+rhARHaF8VdVlf/kIhFOYu6ef?=
 =?us-ascii?Q?8k9nsU4URhEDV61hkcKQneouSDceNM+eH8TTATPRushHK8UAVVeiZh6nhzZT?=
 =?us-ascii?Q?OJyid2s5qKRH2KWv7pwbT+VzM8F0w5kuIMQLphsaiPlFfslE0UCFcz2mHiHS?=
 =?us-ascii?Q?QNRQNDeYeagiMlEp1koznY4RH87ZRB8adRcjz+u6mG/7XDa7bEymhT9c2HCs?=
 =?us-ascii?Q?p8+4J6RV2GD2GjMDncxQcOTx7Y7GzyShBjvWZVS45OsFeAzQ5+N9q5jQqWOq?=
 =?us-ascii?Q?2LeW49zL9IEDQ9Luc/ls4Y9MGr5UBDkB9A1hZvEyxh14TO8FUV752w2taPvx?=
 =?us-ascii?Q?ooo0v+BtPLx0+Xpf16mi+1vYpItLPcuUM5X5wQBQdtzf9UujZzl+IlB6TlGr?=
 =?us-ascii?Q?LaVb1xrdkR0INo2eVOKXqjsOOeqEbMSJzo0m7PD8aHmS2KNrJwxpmJp2Oh6q?=
 =?us-ascii?Q?b0tfEbe9+eYBpWcjPS7EoB05/lYSSi1bQqHnrB47L7sLZ6YHG7iRyvsB72DC?=
 =?us-ascii?Q?JQI7JkhPtb38c3yuIIbXjyp6/Sg0tIjDZRZH0UIw6UEDm8fmNgPes9+RHQnX?=
 =?us-ascii?Q?vXbNhvqZD4VB8hTcbgUMWsKMLOo4nrgxs2ZmAcc2uUggUhYkaeRFiq2haQ2j?=
 =?us-ascii?Q?jll3piSqgxc5moaHWrAP+0JTcwAbVSICyYauBDKeqv/fB0jBlPjPVFY17VnE?=
 =?us-ascii?Q?0aMVfKe2ILMr0Rzgtz7tdoKpy9ik//o=3D?=
X-Exchange-RoutingPolicyChecked: 
	ApDRj+1U9DFEV3/MhPTm4pra9vNlnsTD9otDC5tZ8bhRFYk/u5HatWJqtQ0Uw/hWbsKNiUPmF0aBmQytN/Oxb60alDtCeUnXf+4+iOF/SmYwg/Aeld2fbCCOczEf5w6rM+6BIeQzj5jexwckG8UHcT3B+tiOQe0ImEt1lZY7L7nc5YeFX89t+YOZIkf0Gq2Kq/eWkEOZIzRHmf9J0WGxeqtRuCAXJx398AWk172c2dPAEfA+bSj8GxQP6PO+E4wVXXFUb5N64P32Z9aULtSVtobtFlK/ZVDB1wOKLVzCrZGhZJcp9YTG8v4L24WwaLOjCrvz3pkyRnsNAc6ls/WjOQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b5a69ec-ec5a-4bee-5c2e-08de830b7207
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 03:23:51.5810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a/5+8Gv/s/QcC9WiD9Ah7dz5m6g//6cwV9y9TyB2ZmFvFPXIOawXvqX6r3O4vHiymWPeUhPdiyBVaodlpXdzUot2HbjBctt/wEoNmgDe0+k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9395
X-Authority-Analysis: v=2.4 cv=S9nUAYsP c=1 sm=1 tr=0 ts=69b777ca cx=c_pps
 a=DKBbczBT0NfZzOMt9NccUg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=CCpqsmhAAAAA:8
 a=t7CeM3EgAAAA:8 a=Trik1TV-rLQ7WaJNbpcA:9 a=ul9cdbp4aOFLsgKbc677:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDAyNCBTYWx0ZWRfX6UaDUdnj2WJ0
 WlXzhq6GPr4gORgCf6ptsr1IWIIVOB0Giz7d+CmYrXibUZxTNdMSMbaMGbYWJ1gXIVnYTP/xC9W
 hdX8ZkCveBMP6mRdSST9eSS8TPfxM4aG3h8dzfkjEY4TiZE3V5hqodg1T/C7cY+9LgQSmKhoXMy
 ij3KNkocPSVamllahN+pisTOSUgusbU4vhd38w1eeNrX92yF8x5n8YVz+dW8W8HhUUS8KLsJW9h
 c7KVvleHeht1hXHgO1EATWe2a/4Ocmnx7VI2TWSW5n4Ksh9qrgRaZAF1apSFI9HBz8WIuiE4ZKr
 hs8TLZYrS0fuOiDFnL/SSuF4lvjzH/0UwG2+aOFf8D7UjYRLbEp7MRUBRRP5TuWYPsC0VIjz2rq
 54peOk9uGgQz1b3RP4y7aMKZRYbNiWAR2Lq76TBUOO7KPX/N7dBuGef3cpomtfz8idW3jrVtUkQ
 CV3aildTNLkWYbvUWFw==
X-Proofpoint-ORIG-GUID: ilREhenfQrByx03aXos4TbUCEVbezkb7
X-Proofpoint-GUID: ilREhenfQrByx03aXos4TbUCEVbezkb7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_01,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 03:24:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233203

From: Sunil Dora <sunilkumar.dora@windriver.com>

Upgrade GDB from 16.3 to 17.1.

This upgrade resolves build issues with newer toolchains and musl-based
systems. Two fixes are included to address musl compatibility and
AArch64 kernel header changes.

The previously carried Readline 8.3 alpha backport is no longer needed
and has been removed.

Changes in v4:
- Filed upstream bug for header visibility issue
- Coordinated with upstream and added workaround
- https://sourceware.org/bugzilla/show_bug.cgi?id=33926

Changes in v3:
- Fixed GDB custom baudrate issue and submitted upstream
- https://sourceware.org/pipermail/gdb-patches/2026-March/225952.html
- https://sourceware.org/bugzilla/show_bug.cgi?id=33747

Changes in v2:
- Updated patch metadata and commit title

Changes in v1:
- Initial submission upgrading GDB

Build-tested on:
- x86-64 (glibc)
- x86-64 (musl)
- aarch64 (glibc)
- aarch64 (musl)

root@qemuarm64:~# gdb --version
GNU gdb (GDB) 17.1

root@qemuarm64:~# ldd /usr/bin/gdb
        /usr/lib/ld-musl-aarch64.so.1 (0xffff8f690000)
        libc.so => /usr/lib/ld-musl-aarch64.so.1 (0xffff8f690000)

Sunil Dora (1):
  gdb: Upgrade 16.3 -> 17.1

 ...ian_16.3.bb => gdb-cross-canadian_17.1.bb} |   0
 .../{gdb-cross_16.3.bb => gdb-cross_17.1.bb}  |   0
 meta/recipes-devtools/gdb/gdb.inc             |   5 +-
 ...-ser-unix-modernize-Linux-custom-bau.patch | 249 ++++++++++++++++++
 .../gdb/0009-Readline-8.3-alpha-release.patch | 164 ------------
 ...support-fix-AArch64-struct-user_gcs-.patch | 181 +++++++++++++
 .../gdb/{gdb_16.3.bb => gdb_17.1.bb}          |   0
 7 files changed, 433 insertions(+), 166 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_16.3.bb => gdb-cross-canadian_17.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_16.3.bb => gdb-cross_17.1.bb} (100%)
 create mode 100644 meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch
 delete mode 100644 meta/recipes-devtools/gdb/gdb/0009-Readline-8.3-alpha-release.patch
 create mode 100644 meta/recipes-devtools/gdb/gdb/0010-PR-gdb-33926-gdbsupport-fix-AArch64-struct-user_gcs-.patch
 rename meta/recipes-devtools/gdb/{gdb_16.3.bb => gdb_17.1.bb} (100%)

-- 
2.49.0


