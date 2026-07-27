Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB7EDC54F4E
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 22:56:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43799.1785192983242111124
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 15:56:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=mgbhbJgZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1668b11650=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RMo7S41638018
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 22:56:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=0aRYt5AJ5
	TBLhN07wsMwuMgV3iqZMm6P2bKEioWTYI0=; b=mgbhbJgZ0WP4Hr+Z4Pt54MMj/
	Dk2WbAeWmqe9GRyEnEV+HICKGaEmJ/iZoGrXxYwVzx18NS3OURmaQ4R3JS0dSWHH
	nDwLLTkNSy43UTTsGYY0NgSptFNX4Kz8h9EM2hKzZukg/T8ngC61BualOvmPRMTQ
	Edu9HKs5X3gMmDuPNh+hM/e/hhGYOkCJDbRnIuKknE3jEDFoDnwKDNesEwcMZzRM
	0qnOnmtxeIC+RSsjyW+YlxRBCtJMAqd4GRLWvLS6xF9rjhrdpr3q5h6r1sTDM79T
	bIypWNhkZA5ueImow4y9IHOhMfnYvTw8b/9eodpFvy1G7cXoil1iBXAbIjwRg==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011046.outbound.protection.outlook.com [52.101.62.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fmm43u17m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 27 Jul 2026 22:56:21 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Se1FriWStvioWoUmA1piLuqk9DwLnhuiIW01Jp1BMbSFoBp3w/8UlKw7wL4iCeL4c7Cb4UpsABym91Mu4Bjvg83inNXd7fRmmgJNW5osC06OB8jKLqRhUEo3XRGArtqQUEtipFM1tARuuLxWbyRiL959GuEHF3sWPPEm8nTfS5O9u+IBwK0Hghh2m4OTdBLH8Wv1bzQoXkBEDRaFStcS7gsvDfqWk3Lf/WOeVz1On0j2KA9sc7evDcAm6Mnh51lNo9lFPOoytFRmSe5lR4IW9whgTM4DqxhxjdJ357Q/YYNnkh5iijfBovGSqDNjNQ+2ioLIDm4X5Rp+J5abpBChDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0aRYt5AJ5TBLhN07wsMwuMgV3iqZMm6P2bKEioWTYI0=;
 b=ibCfB8kK5KO8M81HaynM6tnFHleh0LNcOXio8Lg/SEl3ULA3aRwpgg+1t1yOIHtlNEiilYiDxrQj09ltGsWK4dFfNvK9QmD1tthunbuL1FEaKeSIoTEG+PCLzICF+dLP/FcUexYrqIGWD8wzbpqk9Oj00GMtpIS2nB946Xuq6Dx+8MYQAdBhNbrfxwiCDWXci03QOrw4zEu5qj0MODYkuKB8WYAmdOlInCUaH4l3KUv7uPSaub/GNjOniMNEGt3YA8oIx1s5m0o8Qp3ePINySpydEzbMP9VKDfXetaxTOzI+wpeUIlWJLxRPlnwUYPQiMmeVSPQJDoZwB48kS6zyKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by PH3PPF8517B3F27.namprd11.prod.outlook.com (2603:10b6:518:1::d35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 22:56:18 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 22:56:16 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v10 0/8] rpm: 4.20.1 -> 6.0.2
Date: Mon, 27 Jul 2026 15:55:52 -0700
Message-ID: <20260727225602.342005-1-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0005.namprd07.prod.outlook.com
 (2603:10b6:a03:505::29) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|PH3PPF8517B3F27:EE_
X-MS-Office365-Filtering-Correlation-Id: d98fc179-2164-43a5-3264-08deec3243cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|23010399003|52116014|1800799024|38350700014|6133799003|11063799006|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	g2FCYWVF2uKBVmMgX96um2k25Xd2WkoRyWLxUWEnHjY0+ISnM01n15MEfc74EB+q+LJSgx1jFemPvPf6mgEbAik8Ln1iWyypxxF0op8DY1pggcgA4SnSfhf/r3RSjAYQsQi/ctTp+OX2uCEjym85l2xc1CYBymkIwL6/TWgW+U6T357mNurRbVpt3rAS0ek/Pfd9mU+zZ0GJp5RudJ8EjashWfMFej3cYelRHffv4Fp28WrxbDEcpmGilu6eIWI1Ozq8+YKub4ZF1VSwi66s/lC+Rqpt617VnIp/XgHz1Opu2I7KQPpOTMK9Pn4hu0RlZcr98fujyRNFCOaluvzz6/Agsx6A02Go5eQs5SCfKyCUY9Rnx7kQOcRigeKV+5wL5Ztby7HXpKMEeNZJl7YD1FGGQywIlrHOq4WmoKk2v3Wf/HP5x05m8FHf7XBz+Yhhpgv10Ww8OhJz9z+gYUPwfXIK/fdk7rCr+ucgGbrZ8yAL8RQbWTkbXslKswwUymxOrcb3lPi0gW4X1FX+CwDsTeD+kBEgIOi70yRrSokF47fzDL6ExbSPOR8Dp61W1/6ETxXi9SGDTTOdoXxfI2C8AQn+z7Wx/7UcCsAGbw7jnOOlJ8+KwnEuQ+SQ71YytRbE3/O1P3OQmiByZbR9ilNzK+WGf2IQXyw1diC4Eu//0tjgkH2XehRZR50xHzMOb4Pt5zouhJEaOgYU0xj52cT3m3P9zuW8mzBosFfFyDz4Rzg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(52116014)(1800799024)(38350700014)(6133799003)(11063799006)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NBiKo5acbPNwfwRZya9q3+W9z32rKZVo5zmTrvDD7SheGXruFFLSxiuOU7P/?=
 =?us-ascii?Q?F+PG1DISfndvarBIEVA+5wGeaO/5pelzzEHPz9JevibT1QkLb8hXsWUgHQ3H?=
 =?us-ascii?Q?qJjuKcBFG1/xiRalKUDtvHiYA0oUL5C/CNoyDY2ekxKmKir3sce7JnnEhkOB?=
 =?us-ascii?Q?hBTLsKUWJ0mjqAtVuYjv0TUzHTACr2hULj5G1VjBZYAq4kngtYdugM/zjBf6?=
 =?us-ascii?Q?M5GhQE+Rn8ZTHATpAOvkj3H5qn4Bdsuy9GbWmFjOuroKdzjYTfOpN6f8aG4A?=
 =?us-ascii?Q?zVqB9qPRGJOfEz2V7QvgzcXGb+DLQ4a6phr/DBuIsvHnvqzGKnLMBYmcjwrf?=
 =?us-ascii?Q?nYC7zXGE8ZgyFWmKq0rERqFB9SJJQWPTspRGql1OZi/hU3Toa0qfNNnaYE5E?=
 =?us-ascii?Q?H0MNoxjno7IKS5v5+6uGYSYQWLDyIT38ffSCWXMYO/1kXSndFlSyuZMcTNLB?=
 =?us-ascii?Q?aIFbJWmp3T/TGHtdKzTrNnrm0OTu/OATTfWdJGYFyN3AFrb4Mdx0KMvZo+Xb?=
 =?us-ascii?Q?a2OzFl1CMUjDcvyC0izENuefltRHUb3qGc8UFY0VPvOMpol6vnxnpG6f9W+T?=
 =?us-ascii?Q?8Gb++9c3Nn1s0W7A9+BboBj609HN4oUl4VM+w4QqiaLS4R/UVRKiWo2einu7?=
 =?us-ascii?Q?8i0SgP2Qhs2RdZddk2LO79LMML8anWWqRn0jUrGWlcirtwDJ9+ioeh6T6tp1?=
 =?us-ascii?Q?LjDczXnXqvNTJVrUGEkXloMQS7tM63pKj5NN+D1D3o9mQjwbkOejk6jRSgxE?=
 =?us-ascii?Q?kz1Jw5GaF6s6cBmmY2EvuegOX4YXNrI6t7rwfdy0awxevjTolyeYw32rNdX9?=
 =?us-ascii?Q?cwlIpx0WmD2mGCloOt4iHYfCRWd8WNIyb3x+BAqEMgzSAilt286aFaROg+iy?=
 =?us-ascii?Q?zK5QF489Md+L5NG5FpkJe1q7c7YEcG9Dqbznym3FVjN92JkIh+5azFXnTQTH?=
 =?us-ascii?Q?HzyJDOUdZXCs96Z5B0jnLna1H0rwQ3WJSqynL+ykC9+GRj0MoLeGs6Jmr2E6?=
 =?us-ascii?Q?x4J/x23DzpPC6iruCTNr5QYKdObGHoSf7Vk0Ru4jmgdeeiAJg7juXn0eINVr?=
 =?us-ascii?Q?PcYE/d6N8HRlfW5IFFqnW7z7TDRm8cU4vDsaW/d/r48170jgpUv9QvKgu3cD?=
 =?us-ascii?Q?wdPL3yMcSE9ZCT11o22b0Hiz2p6Lc9aWUBBw5eexFrgEUy8rcUhy98d8XazO?=
 =?us-ascii?Q?SYhIjQnDKy1ey3HnSSPcdZi7NOEtFg9OR0gtQK6P0Bn50Zpw4Gnl9j1oRQkg?=
 =?us-ascii?Q?ehrSTkwGtmG3tqZH6glcBcCAkMiYECQzct+F2K1cwWgC8xaChu5885DIctne?=
 =?us-ascii?Q?ORaD0mvkHxtZM3NtBTRKN8Df8/hVCbtDKToDO8DvwZIKKh4ZJ376m3uDFRcI?=
 =?us-ascii?Q?V58rNxQhZqtGJK6UX7fZqJoYncLgOaH7e6w2B8P3um/cn9ne2QU5CYgdvU+x?=
 =?us-ascii?Q?Oluw0e36fkpQEM8ygoeGHD3SX/TdzhOHK+YzHRWbujKSCI5daPe1+7yBqCVp?=
 =?us-ascii?Q?vPGCENZsVpPJ33SwVbDH3IJqtREmITxQStpj7u/1GfY6QeXaa1PhtSEGo/fA?=
 =?us-ascii?Q?9jzQc8Kp3wEHcX27uV9IxJKweMG6z7fZ4wEa4pmufPZH54XH/RIpkzmxkmoL?=
 =?us-ascii?Q?5Yu+9rS0X0c3u0oXsfqgkorsHxI/IqCBj4mOd1JMri02zk7EBqUPTN4mETfW?=
 =?us-ascii?Q?9cqvHhtCNv/bTmWTbVbbVhoeU1AxL7kEXseEz7FEX2pbMftA9pQvoy70EqmI?=
 =?us-ascii?Q?AKly4iO8I4V9HaAuAwcmw7HqwwS2w1Q=3D?=
X-Exchange-RoutingPolicyChecked: 
	JK2NSPe1/pob7xzypNHqosuI9TGE6H+ZCXAEASQ051PQWBI2r4dB/uFehVR5ElMttwtiiFYoeg1qIUoQnnGLpTuAfKu+feP2SsIckRW13fOYaMlo/B/Oqfh9ZeOjdRtnqiCTqojCZMddU9KaHTPKSMw7NDfR43293paogo7guwrZbeXzTtVnLBQOBqWKDc8tlO4j/z+n/jyyzLPfIGFVKdGJxYHD9wsvkoKLNf95B5mf6pZwcSjgTyl48i8eNHuQrzLd7gXoPZ7dRdiJc38s16sQcZ9Mma0DrUT4jnRzWRl+v0cckod1LWAvcxhFhEvcV82GcCl4MYgruZtXhvpSfg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d98fc179-2164-43a5-3264-08deec3243cc
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 22:56:16.4718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +kDnvTx6gdOgn+0gcSf/dzV5Mz4E06y9LevlUTol8PIUN46TNJI3/QJfzdFMb/pwsd7IGX1JhsK8KvBPrapmS4dvdX/3a/hZtE6qEnazYVk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF8517B3F27
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=I/JVgtgg c=1 sm=1 tr=0 ts=6a67e215 cx=c_pps
 a=m/LAOfpIcXRJv0ug5Ru3ZQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=NEAV23lmAAAA:8
 a=GAFMdfMewg_YOienFTAA:9
X-Proofpoint-GUID: Fz8kMtwKTGSPru6prYmrZP5Wp_jl_qiZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDIwNSBTYWx0ZWRfX1z/5NGt4TAL1
 meM67dkntzXqn9R9XXR5cmxIjFdRB27W7thsabW6Ykli+cTITEsVX+MbSsZXNl4r0fAFM4UnOxD
 G9dWwaR6GDjkb2belE2tF7KX4umaPkik3Xts0DsJQWUGeq9dHojVvubAs/TOd4oC/j0YFG7y8ba
 rRnwDBMG6fYDYj4sIDRT1kdWjYRMw1TiWiLPanBzDLC8SlpMdSSC1EwAdopn2ZbbWEJAMA6jJk/
 WZ+6I9zBmBnlrUVNNit8Oucw/BnkfDIHN819DpBPb0uqgrk21fsoOjYFmFVXIYnf19IuQoccSMB
 /FAYrOpsP+eYLMVH5pGNUUhgSsqPkVWtN6oQom0WWVjyF020WAnl5rd2tOZuvWXZybsRimh12Ng
 Pb3TL1Ee22+aXyajXJxtZ+AhIzAj0t63MPhiDN1KzujA3z7SstObD5HS06eZFL9gXsMgbmI6OVl
 PER0gsrFpfNPfGfgzqA==
X-Proofpoint-ORIG-GUID: GCukTfvOt6jWXhWrWR-gkaw21bniHKkb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDIwNSBTYWx0ZWRfX5s48tfNVBVuW
 I4Ym7eRzWTq0vkhyoWUVkNAwSbOAfJqpZt2ugiuEWRkUvchp7J1J9v5FATkZXBH39FoO8Fc/wrl
 PTqYcpH+WOvb40FNfmiJ1LiO4OpWa3LJuZs9A+C+8ujUHRVVtfjA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_06,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 phishscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270205
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 22:56:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242131

* v10:
  - The ARCHIVE_FILTER_RPM macro was commented out in a previous
    libarchive change, causing do_compile_ptest_base to fail with:
    error: 'ARCHIVE_FILTER_RPM' undeclared
    Restore the macro definition. The ptest now compiles and passes
    successfully.

* V9:
  - Updated SRCREV to the 6.0.2 tag.
  - Incorporated all V8 changes and updated them as needed for 6.0.2.
  - Dropped
    0001-scripts-pkgconfigdeps.sh-Use-pkg-config-from-PATH.patch
    from V8, as it is no longer needed. After filtering out the
    /usr/bin/pkg-config file dependency, "bitbake core-image-sato -c
    populate_sdk" completes successfully without the patch.
  - Fixed the filtering of the /usr/bin/pkg-config file dependency.
    pkg-config is a build-time tool, not a runtime dependency. Filtered
    the /usr/bin/pkg-config dependency automatically detected by
    pkgconfig.attr for packages containing .pc files, preventing
    unnecessary hard runtime dependencies in -dev packages.
  - Removed v8 libarchive-related changes since the latest version
   (3.8.8) already includes the required updates.
  - Fixed the "oe-selftest -r debuginfod.Debuginfod.test_debuginfod_native"
    failure observed after upgrading to 6.0.2.
  - Verified that previously reported Autobuilder issues are no longer observed.
    The following builds/tests were successfully completed:
     "bitbake core-image-minimal"
     "bitbake core-image-full-cmdline"
     "bitbake core-image-sato"
     "bitbake core-image-sato world"
     "bitbake core-image-full-cmdline:do_testimage"
     "bitbake core-image-minimal:do_rootfs"
     "bitbake core-image-sato -c populate_sdk"

* V8:
  - Fix build with systemd (Check patch 7 for detailes)
  - Make rpmbuild can find the pkgconfig (.pc) files in /usr/share/pkgconfig 
    (Check patch 7 for detailes)
  - Backport a PULL from git/libarchive to fix oe-selftest failures.

* V7:
  - Add 0001-scripts-pkgconfigdeps.sh-Use-pkg-config-from-PATH.patch:
    To fix "bitbake core-image-sato -cpopulate_sdk" error on Ubuntu 24.04 when
    pkg-config is installed on host, now the host contamination has been fixed,
    and the patch has been submitted to upstream:
    https://github.com/rpm-software-management/rpm/pull/4127

* V6
  - Fix -cpopulate_sdk error when DISTRO = "poky"

* V5
  - Fix RP's comments: Don't hardcode libc6 into package_rpm.bbclass
  - Use SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN} to fix the loop dependencies
    between /bin/sh and libc.so. 

* V4
  - Fix loop dependencies issues for libc6 and busybox
  - Fix issues for can't find pkg-config files (.pc) on qemux86-64.

* V3
  - Fix Alexender's comments
    a) Suppot rpm 6
    b) Move rpm-setup-autosign to rpm-build
    c) Remove -DLIBELF_FOUND=False

  - Fix build for nativesdk-rpm

  - Drop patch for createrepo-c since it has been upgraded (rev:
    804a238c8a4e86c2bcfb2192d54cb861d5fd32a6)

* V1 & V2
  - Initial version


--
# Sumanth Gavini
# Wind River Linux 

-----------------------------------------------------------------------



Sumanth Gavini (8):
  package_rpm.bbclass: Drop external dependency generator to support rpm
    6
  package_rpm.bbclass: Define _lib and _libdir for rpmbuild
  lib/oe/package.py: Don't add ldconfig_postinst_fragment for glibc or
    musl
  lib/oe/package.py: Filter out /usr/bin/pkg-config file dependency
  lib/oe/package.py: Don't redirect stderr
  target-sdk-provides-dummy: Add pkg-config to DUMMYPROVIDES
  rpm: 4.20.1 -> 6.0.2
  libarchive: Make it work with rpm 6

 meta/classes-global/package_rpm.bbclass       |   90 +-
 meta/lib/oe/package.py                        |   19 +-
 meta/recipes-core/glibc/glibc-package.inc     |    5 +
 .../meta/nativesdk-sdk-provides-dummy.bb      |    1 +
 .../meta/target-sdk-provides-dummy.bb         |    1 +
 meta/recipes-core/musl/musl_git.bb            |    4 +
 ...olor-setting-for-mips64_n32-binaries.patch |   22 +-
 ...akeLists.txt-Fix-checking-for-CFLAGS.patch |   46 -
 ...et-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch |   50 -
 ...satisfiable-dependency-when-building.patch |   18 +-
 ...lib-rpm-as-the-installation-path-for.patch |   24 +-
 ...1-Do-not-read-config-files-from-HOME.patch |   18 +-
 ...-PATH-environment-variable-before-ru.patch |   16 +-
 ...lling-execute-package-scriptlets-wit.patch |   12 +-
 ...not-insert-payloadflags-into-.rpm-me.patch |   18 +-
 ....c-fix-file-conflicts-for-MIPS64-N32.patch |   18 +-
 ...kgverify_level-to-digest-as-RCPM-4.2.patch |   35 +
 ...ools-elfdeps.cc-Remove-format-module.patch |   38 +
 ...prefixing-etc-from-RPM_ETCCONFIGDIR-.patch |   26 +-
 ...avoid-using-GLOB_BRACE-if-undefined-.patch |   14 +-
 ...ge-logging-level-around-scriptlets-t.patch |   14 +-
 .../rpm/{rpm_4.20.1.bb => rpm_6.0.2.bb}       |   14 +-
 ...end_filter-Keep-iterating-even-if-na.patch |   49 +
 ...egister_bidder-Allow-ARCHIVE_STATE_H.patch |   46 +
 ...er-into-a-proper-format-supporting-b.patch | 1673 +++++++++++++++++
 .../libarchive/libarchive_3.8.8.bb            |    3 +
 26 files changed, 2003 insertions(+), 271 deletions(-)
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-Fix-checking-for-CFLAGS.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-set-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-macros.in-Set-_pkgverify_level-to-digest-as-RCPM-4.2.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-tools-elfdeps.cc-Remove-format-module.patch
 rename meta/recipes-devtools/rpm/{rpm_4.20.1.bb => rpm_6.0.2.bb} (96%)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-archive_read_append_filter-Keep-iterating-even-if-na.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0002-__archive_read_register_bidder-Allow-ARCHIVE_STATE_H.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0003-Convert-RPM-reader-into-a-proper-format-supporting-b.patch


