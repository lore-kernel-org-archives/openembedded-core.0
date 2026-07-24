Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 105CBC53219
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 20:04:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27435.1784923483259228261
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2026 13:04:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=O+cHS94N;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1665965d86=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OGr66Y2220133
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 13:04:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=PMSnjZ0Om9lyxUFPVbIQJjkiscHUQYRXHfWjUy1dvfU=; b=
	O+cHS94N8McnsIi3N4QGTngy4bk2tkGHQESnF+2+2cgmOvVXoroO2zDvk6UJcEHZ
	GEQuvbt0zEEDvVpptTzqzm7WahFBSWPDoKTOUZh9n7GNLlzX3wlUNc2fq7LBQbQH
	/BDp36NJEpI5rvxsnlr6fMOYU1LVeI5Tn86lLkyeBX9DWQKLhicDSHXT+dCoMYvp
	4/+AcefDhT5SOUX5KJI6eQEOk1UDkt7ftuJG+1cdc55PSlD6eHXnOS7qymx+0U67
	5iJjv0fnNN6b26tgCjtNdsf+0IMpwKtE0iL9BDuuJqyW0YjLa0Y+g9TrB3ac28El
	QXv60yrPk95dM4JxVcpYjg==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010036.outbound.protection.outlook.com [52.101.56.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fm8ay0q0n-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 13:04:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SjaLPA1qipITfmVkfe41fcpccgHTuR1xXMyBXZyxkj6eKk7dN/uc+tvi6+/iTpPcqrApTcu8anwXyqUjzA5E8jaTHZ5DKAzeVudtYVBZLnogHJyuWZ3flkDTRWUkhc7fe4Dlc6KzVOA3hJuUn+AZKwnLvm0elyDKbGHQZuGeXf8aqeTqoHBY5zyMeVTuphHQcOHyYo/1bpEqWh63b3b4117cbG3vPht16YDsFd0jjKrJOb8wFNMD9pc3ie2hilRezAVAw8nysYyRx9dwqwWrw0OsNtrBdFQH8oQm6VVe0lzJbX8lrHUsAMpO39xvFhACiLVj3K+SrB5SmP7/dJqrNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMSnjZ0Om9lyxUFPVbIQJjkiscHUQYRXHfWjUy1dvfU=;
 b=l3Pnuv4wc5kNqd76QBBUq2VAjMELFOimKog90Uqi81zTe9MJVx6qIqk8OTQuFemCY5gy5f7W4cVL+jtP18BFmUZdZrF+Renv3iWOzV/dBdpLggBeEP7waBvPtBRtuynsnvMlqpR3C3FnH1Gtrx7maVs/R/aUxPFHV56mmELx1VczaWcTSALclQv5fpLGg7ArgRxdAHMHH8BdF/E7F1yjvizarWPP66xi4WqRaNF+lRaB9QAxbh6ev5f0LnfniRyQvgSvXWmnN3as22b4vLXGqbPmnR2bgBOHg5YpSfcp1eoeoNDjAtPqzeHXWccGAGZxVs+Ei5WoWcgJEO7Scan1IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by PH8PR11MB6562.namprd11.prod.outlook.com (2603:10b6:510:1c1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Fri, 24 Jul
 2026 20:04:39 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0245.012; Fri, 24 Jul 2026
 20:04:39 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org, alex.kanavin@gmail.com
Cc: esparlin@cisco.com, mathieu.dubois-briand@bootlin.com, mattware@cisco.com,
        peter.marko@siemens.com, randy.macleod@windriver.com,
        sumanth.gavini@windriver.com
Subject: [PATCH v9 2/8] package_rpm.bbclass: Define _lib and _libdir for rpmbuild
Date: Fri, 24 Jul 2026 13:04:17 -0700
Message-ID: <20260724200424.954199-3-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260724200424.954199-1-sumanth.gavini@windriver.com>
References: <CANNYZj-hrPf-CVJwTaEJ6dgUuWnipYKKiPZ3r_t1_HPYhCKvYg@mail.gmail.com>
 <20260724200424.954199-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::8) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|PH8PR11MB6562:EE_
X-MS-Office365-Filtering-Correlation-Id: 32101975-6e21-47d9-55bc-08dee9becaf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|52116014|38350700014|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	zBqh5V84k1bJrDimGUSMQsBcKrUGtt8ggKmqL/fQQaZrbTPToX7pdPo8FxEdnhH06kMR229eJjASGnzm00iIBx20/m0HIGkp9vb2VAOz3Pplqq8ZEUsmVXsytP3psrL9aCyzH6Sf5e5ORb+asRCnzPmOKySOZse9jbd6I0/jpdzjSE1R89FcJIyOb8d4Iy1MZhNCvrVL5DfWyO4uJb7Yz6PVlf63dYR7146pE4sMawy1rIUfUzfdvmQfXAKbnm2SwPh2zyb+9fHE4FGQJgudbW8njPsAYaDNBlj7ZaMfiX2/roQHkM2KW0wmXNgDuwUMNVF91ABiJaMQ4/lxXZOrMcn3b4RqkgrjfMPkRjGXsBxFxn8ZPRGy7gRK4SeMQ1m1AMa4DaOKNQiVJJOvYlwSxpfTB4V2qBm5QnOb9i6BPY0tkwi3RZWtjS3Vy2q6nS1LuIuZam7MOAC1RU/b5l4PV9ePl2ykz7jfPJtDSdbmYAFEWCSn84U15WsF1ceucoCtlqDk5+CD1+Hd2okO2AFbNCCYrkCvYDAG4gwl7rskerXL0jfTY3HbxZ7x5CtJVxi7PAGdJGTMA7gkrL5cBHaPmYAF8QUj/t5gxSsEb7hmpFtwx7EGRrBBxYu3GchP9kOAW8+n/D2KPmOTGCQ0l8xpQcOLoTjVlohBDkIJQaJZKOokM2JZq8HV/GlMQwcnsA32kgqMfH0omnUFEmIvFzRlkDpcJ7MsaKMeRTRYHbYVDTY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(52116014)(38350700014)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cAwPv1Iv9TptSNEGWsmP8t/zVVtLG/iSxJp6Iu6tVMhZZDCeS9ec2pVCjMPe?=
 =?us-ascii?Q?axewPBxaD7yimaM8BzWTyZT6zvgL43e2Na32egrzUIxivV8w0kQy2AVcxw0c?=
 =?us-ascii?Q?zZgkkAzgyKZm6p2ZgU8y1kiRTx4f374sua2UBnhRgFOj+5dNFujMcJuX22Ym?=
 =?us-ascii?Q?1osHCUq6zhyerGU71lgq07xHOkYCedD2B+hjDKrf7rhbQ2DRh4mva380p2qp?=
 =?us-ascii?Q?CjNK181lDV/DlA0c2FFpLIDXnjxglksxV/yKY1MgjFdnnGWJcxBuYCd9N3lB?=
 =?us-ascii?Q?nLywvq9dbJAjn0NyX10Gjw726+Dbw8zz4dCkc7bnFIahWrnDBrlb9SdwMiMB?=
 =?us-ascii?Q?fIBc8SmDq5G36GonOZ8Mmis9W2v4lWIfN7h4HdLpWCqdQOTm4lJLUGOzrbWN?=
 =?us-ascii?Q?0Dlm7/1fPzsgHw7NgYS3lll8TGCkGcRCGl/6TsiRRW2OzVFhza709EM0A0O9?=
 =?us-ascii?Q?28URw+zsd4VLP+8su87YXP27OvAcEB4OTkM5eSXcGJksQrt3T0mE7DWxJa9Q?=
 =?us-ascii?Q?tlmyIVAjdZHzIru5cJzJAkivsNQxxdKPvBO2yzwZGdB7X8A8+9+eaAQ6eBig?=
 =?us-ascii?Q?JdDY7CI8yjLHcHRgQhU5KaQcBQuMxN97tORfcIaYFZBJIpmrXiQbOgA9PO8Z?=
 =?us-ascii?Q?4WrSkbRmG3da2UNy8pCFbfB5N/ziXuiRi2T4L/+LrsfTof3H98TxDS4Q+abO?=
 =?us-ascii?Q?Pr0NDFqMdogw4vrJ9GWqKoJikGcC7wbDB8fSU6mz95h47lRBRE7y+ij3PlDv?=
 =?us-ascii?Q?UhwE4ulR+uFVl1adpm9t2rCSOx069OSZ40YglQTx48iiE/TvXUqIWoHr1+U2?=
 =?us-ascii?Q?Rsnc70QTbJXulwm4OujKHzDEjhnMUklt8Qi9sA1ZZgDhwpGihVJdKRGo4+lb?=
 =?us-ascii?Q?6bmHqNwhTRWOJxCBMNShfGZihy5FA039uwF/aCqlg4uygaUqUUcdX5BQrToX?=
 =?us-ascii?Q?0o6AG2NGvpeSt6peaJoRTOGCjzeYuV+sitQJ/bYr/hL2wmib38IMrzIe2nSN?=
 =?us-ascii?Q?5CmoTvBMWZi6e4+YQCaJ4A9uporEO7K3LeJxmV659Dm9G3KJlBcoain47Qfo?=
 =?us-ascii?Q?qRTBqBNqiE68Va+oS/EJMBDqGtxWkWL4PHVKXINOQSEawZWlHOxbl40Qv2d9?=
 =?us-ascii?Q?8/kk2vykdnsvz+sU4t635Zt+AjTpS4qK9OuxMxln4bhqTyhnoUX/Fu1JCHs6?=
 =?us-ascii?Q?IEaJjfZBnG+RYSbpouKtf81L2lfdg0d80QWqGUV+wlQY+GySJnOM+ATU8KL7?=
 =?us-ascii?Q?MamK3sF3dSNb1Q9u2Xn50xryajc+mUoDpUztFsaymsll4jpX3ADiAqVB1yuJ?=
 =?us-ascii?Q?pGwQ5tD6anvFNnWEao/UUfSRON+0xQmaWgKm4r/tCOIUPmLC5PQPrgvERCqf?=
 =?us-ascii?Q?FX8frQ97TFCZinKHfxp5kfca20EzUhgF+YwgOvYjlMbYorbXTcrF84jT+Yv4?=
 =?us-ascii?Q?5dgTCfEnKYyIePnGFMpDagBtOzfEsQlcgr62t+09dE+C6LnJyGHdZPE98Hns?=
 =?us-ascii?Q?H+xGbvfDKCQNnXWcVKuoGrtaXwGHJHLr/FqQW6t/8mOGKXiAyZUUvnjaAMRG?=
 =?us-ascii?Q?W1AtMXjIuro1b7R9bqm1XDJzjvqVf/qNKb1lHwxyE0coisGaF0VkKNGkadTO?=
 =?us-ascii?Q?ItJ7TlFwwjpb+dGMIT78m+h2xc9LmTOfA8eHWgBgBUU0DOWDKsCdfw8+go06?=
 =?us-ascii?Q?uWd7u58KuOYG1KPSkJYObnVcyBbohO7D60BrExJRNFlgX1yHPhi8YKu1Li4k?=
 =?us-ascii?Q?fyk4btZDHphv6y350YYUUkAwOviYLHE=3D?=
X-Exchange-RoutingPolicyChecked: 
	rGC+WpyDbn06pXz2A07A8Ad/bArKgdZeuC5nOQVzkOARrXXQqbSznvB7UIOjhiLIOkKUMS7fY+VyHXh0FpjNGTfsMTVJvYzK1UMnGx3v+hl+2+/fOUF/A1AV6ZJxsbw4gg+KBTsHQTu7OLdAZE/95562nrbBPxIlYxUDimqzZ3Ti0jfax5YK38Vm5lrYvF/2wxeUAreX1dQ+sDdS8joX+jHyLH0Khgzo2wu+vOjQon5dMVuzAsahsRpJGq0ltgYUSIrk/Q/gzVtuaJ5aLXAwH51UmOZfXuvO5B9FIsNicA+ZskImoDE/xglB0sQ6DSZVR6Gwb5hPqi72+Wh3D7qgzg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32101975-6e21-47d9-55bc-08dee9becaf8
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 20:04:39.2750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /EyLS2Cy0x/eEfIATTs9i+GgxdHx24Q4aDkBz1UcR09AWyhpNjhdAlnSlcJO5IuZx6ADqfQrqJzNrhfYia/M6/BBnPTncDr3RGZ59nAajCo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6562
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: sWT7LQNOM59s3QmdohD35EUZBZesBVa1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE4MCBTYWx0ZWRfX6N6kHp8YlSRa
 4Y5f1eHUYNB3qZJMtpQrFIbckBhdgBdbEYl8l5hRAhsL1mmHyiKn+fHqlsT2mdHWGEvR5Z9cJex
 YRQ+JAZGLi/xVKXF6+NgZcBgpmuqH2u5ED8Tmkljd76oUkGgp3FRJn80AhJmpOF9rwAyt9KBC7I
 1ik5rkrSyy6SBZvW4lla8znrPEf8aI2l5wQrrbtk0oE75lCzzmJ3SprWhCZxyH1GhxskMFUIZND
 YIGxWfK9NsVt2Qx9yofkF094svZ2PctJ6lK22SDzDnHZljqfv0tEBbEc2KrBuF+VZZspFCgYC05
 IYaII0LReIHhrvmTh5zzcAlHC0gg9eCB5ZhJaR9+o1EG0OomrbzEzFLFPywNvKNVLWmax3fS4CI
 ixScLMjXJfiNHGnuhiYe5s9ZPRX6zP8HCqtVjvekHr42bIyNQmBktJQ4TgMyyeq5Oi0mzt54tMy
 UkjBIyha50FhoTnuf5w==
X-Authority-Analysis: v=2.4 cv=LOFWhpW9 c=1 sm=1 tr=0 ts=6a63c55a cx=c_pps
 a=tl4IwOQKiBOeKWF7Rad3dg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=uhQZ5Q_QBcnTBNJc4ooA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE4MCBTYWx0ZWRfXw0VC9JhQKSF6
 dFKqQJA6Xb5i9/WBUw7kPqBTsRPgx+twBHPS9HGa6BzVxWZC03Rf7trNdreGj44nV7LYF5sRnAV
 EPPMafDN57DimrFLONpG0NtBjOUVdmQHimmRdgwhw4ca96mmEosj
X-Proofpoint-GUID: aqArKMmk0JDZvFI9xFTKYSQiZJwuZAW7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1011 impostorscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 20:04:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241943

The rpmbuild is from rpm-native, the lib and _libdir may be
incorrect for target, for example:

* rpm 4.20.1:
  No pkg-config files can be found for qemux86-64 or qemuarm64

* rpm 6.0.2:
  - qemux86-64: The _lib is lib64, this is incorrect when multilib is not
                enabled, and _libdir is RECIPE_SYSROOT_NATIVE/usr/lib,this
                makes the pkg-config files can't be matched.

  - qemuarm64/qemux86: The _lib is lib64, this is incorrect, but _libdir is
               correct (/usr/lib), so the pkg-config files can be found,
               this also looks wild.

The rpmbuild is like cross build, define the values when run it can fix the
problems for rpm 6.0.2.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/classes-global/package_rpm.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index f286d3a0e2..9af4cbdd94 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -585,6 +585,8 @@ python do_package_rpm () {
     cmd = rpmbuild
     cmd = cmd + " --noclean --nodeps --short-circuit --target " + pkgarch + " --buildroot " + pkgd
     cmd = cmd + " --define '_topdir " + workdir + "' --define '_rpmdir " + pkgwritedir + "'"
+    cmd = cmd + " --define '_lib ${BASELIB}'"
+    cmd = cmd + " --define '_libdir ${libdir}'"
     cmd = cmd + " --define '_builddir " + d.getVar('B') + "'"
     cmd = cmd + " --define '_build_name_fmt %%{NAME}-%%{VERSION}-%%{RELEASE}.%%{ARCH}.rpm'"
     cmd = cmd + " --define '_binaries_in_noarch_packages_terminate_build 0'"

