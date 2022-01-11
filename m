Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ED9AC433EF
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 23:59:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.16242.1641945542627249100
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 15:59:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ZgLZ0zIz;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=8010f76d9b=saul.wold@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20BNx1ip029154
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 23:59:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=lzkSkT6Ej7t3tYzVKXe1IC4h+eJrK8kuXf3zP52Gq3g=;
 b=ZgLZ0zIzBJ290Upvur/i02PRGLb6SM1y95M6gaZGGdAP6JDLr0sYjOWVjM5cBmVKPbAf
 zJfhabf6qdjfmBDN/DNlfW7OUy0sp/zhYYMI63ItWL7zhaEl6q22VBLM0LMN73HO2Gns
 y7/JgsY2auXtXNOAfY4ZRjRNHII32k3TSXLYz3sLS0VaHK072sinW2NPvUZqU1P2P4cF
 UbXBznTWn2lN2fOfgH50z2+rIaDJeLehEtjikWW99L4N4KgE0ocFBrsE9v7TWyp0fD0W
 J+fckMSdFcSMMmOUcYlGjn3Co5nbI5fe5GMdILs5pkQAfBdVi8F4kvzQfjace1T0Jy+C JA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dgdxj1gce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 23:59:01 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20BNx1v2029112
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 23:59:01 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dgdxj1gcc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jan 2022 23:59:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dmm7iPHzrZrVDiOWiLseJr/M+ydIUhP9swDrkyIE51oKam9ybpXbqt3lVbd+qDBJ1V+tbTSLkXb9hvTvbtLRjk84nAvaUysRfl8wzPWxkao8qRpMiLVH4FGaNn85wvwwm9SUi/PSTUuGo3Xna+/n1rWpGmDlRXMdfcJo0v53ee4A+42rakamaiRuvisWH2yfDSYARCanf4nERavpe5+M1PZxYWRitx2xXR4MyKM9AqGuXxyO6dG77pWxi0ccl/apKczAoan91Dy3MMKLAEfNxWAOxnyq6TvddwMAC1F/xNTnvnG9ElQhJgS9qyQvqJyB+N0rbpqChWleaLUUyN/KQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lzkSkT6Ej7t3tYzVKXe1IC4h+eJrK8kuXf3zP52Gq3g=;
 b=apqpYVxbSTmWWWFofEw/3pkmBisRFUZAXj1n7U450kD+9ryoLWU3AnWVL229SKs0WwfRh69wVXjAiLA4BfMHSIzz7XuAg+fHI7YMgnSALCmhq32pKiHo5qxvvT9wikLO++//Hk8h0ja14aFNmQsMoun5Fx1Ni37CRn/VzhBRFx12cNpCnItVmti0BOnh6Zaozo+3+On+C9HIJt2GHByf92gMGZzABaSuvmx+7pJ666Q1uE/lVEWaXAPfZtDU6tUYv+y3OyR/6MBjna51IRRPRuMOgsNV4aFCSjdFgopaKysN8gzbbsgS4U6WMycFuxzHzMyNvEdJw+db0KV23TqKEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MWHPR11MB1280.namprd11.prod.outlook.com (2603:10b6:300:2b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Tue, 11 Jan
 2022 23:58:58 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac%4]) with mapi id 15.20.4888.009; Tue, 11 Jan 2022
 23:58:58 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org, bruce.ashfield@gmail.com,
        JPEWhacker@gmail.com
Cc: Saul Wold <saul.wold@windriver.com>
Subject: [RFC PATCH v2 0/3] Extend create-spdx to build kernel spdx info
Date: Tue, 11 Jan 2022 15:58:37 -0800
Message-Id: <20220111235840.81471-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM6PR11CA0018.namprd11.prod.outlook.com
 (2603:10b6:5:190::31) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73417dac-ffa0-4d00-5c22-08d9d55e5513
X-MS-TrafficTypeDiagnostic: MWHPR11MB1280:EE_
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB1280E0FB2E5BEDA7FD75E090EE519@MWHPR11MB1280.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	o1/65h98DqpSIGa/X+9aqjy6HUSJ4aJh7YBnhO3ntTtl4WY+FCyMDKgPTBblSAKGYJObXavXXGKPhzJcT3PzI8ONNpkcYLzILq5es5YRuWtSWGgPWzxP3KR2VQWwJf5/5MTgNs0sO9SALDdobxPN6/n/UOmpxxpoAjtaQAO53bUdFFunpH3cW28vLkm9G2vaIYi8gYSWSxExFai/If4kihqkI2GC3prRTUfl7F6PWGg1rfd9sVglKwVMOJHI56TVxT5gaBRAX/W5g3RDDJualbXOZNvA86UU+WKV8PXY5cEvRshCfS5aXTSxjBIRRsH7l0aiypBY0tv5OIpfYH93auBWlfr3XRAXvlyfGthBtP2qOsZY34dl/retyAJIVhIfTDV+s9rooEzDnwtkKU5iGWfFwIwxzBo2fUAqlE0aAHzSEgClbRF3kZVv9YhMYHfm7x0/QkQJOtZ3p5bg68G7euVcHyLnPCUvoncoEw0DWnYfuVzRR7KVlrbout/44sOyrjGSpxT+hyvJBG5wd/6mgZSnkrHV+AesucPKRH1IPWcgwmh5iaoiw739LQzR8QrHcjksMIDrLaKOYElVOt3rxIzbIEDmQ4SfOpDRB3TGvA3OrInXlN387olr8GD9so6pWEHhNjQE2zSS5+t2SzIAsL+0L/yDXxyR35sOOI/SQnVaG6VZOmLfx1yZ3xKQ91hgwJ3tmIehzZrx8pz/NtG+hw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(1076003)(508600001)(36756003)(107886003)(52116002)(2616005)(2906002)(44832011)(38350700002)(6512007)(5660300002)(86362001)(26005)(4326008)(6506007)(66476007)(66946007)(66556008)(38100700002)(186003)(6666004)(6486002)(8676002)(83380400001)(8936002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zPUaY3PiEGxSI2jthzx7kA7YnzRbr+7IGdymko5Sektx6fvP8hxw57aI0MgA?=
 =?us-ascii?Q?JtovyR0WYOAxSxElbF2xFYt41eGyvdIVvEuFQc37VQAAEsX5ggNX3G8zV6Wn?=
 =?us-ascii?Q?eEgBQ5CaTJC9eFgjwHQytXxBDPQv4Km8y+qkusL8DrDW503mu8rAB1l1ZrCN?=
 =?us-ascii?Q?BUwRa45cEEy6WqcuRl7mQm9yTcRCcCMydLnfcV/bhtd05F4vSEtWXNxrYy1N?=
 =?us-ascii?Q?/klGHmP8z6Wg4Cc83bMbiQknGZx8H0N8d2llT3KciTMkDDOOMeDgf8wGGB2N?=
 =?us-ascii?Q?beexlgnkZOCMPNNX/2/R07Pk5q4LdksYB/nHPpubysh5B0PyXeI7WQUfIo0s?=
 =?us-ascii?Q?B7fRI31yPoczpZQfeDUpIPUxuaJTtpammIXatp/zcKOmYGgVxeox66rYktVb?=
 =?us-ascii?Q?iEnhyXzqUDL/BueBjeeTXBVkbKswVNDUkYEpHvz9U4nJXrl96gUZ+cqmLMIZ?=
 =?us-ascii?Q?EmLNiB+Gqcx8dMzpd6mxVCpZriL0FnYylcFfkp7ZlM6NQ8t5jy1/GrwKzFb3?=
 =?us-ascii?Q?fPlkz71ZwlP2v6KgaTDH+NMUAvMAF8PNhsQiNF+qbPDSN5n4gfNPOgc/DFX9?=
 =?us-ascii?Q?mdUFSn3jNjnITuJBUn0rXJi4UisxHdatz8od9I+FurC9PvgTbSL/CmuOulm5?=
 =?us-ascii?Q?pulK5l8d5MnWzakpn465L11ChfctryiDiBlCsRzwovBw0L4c3xgDpPbHll3W?=
 =?us-ascii?Q?YtAfinIEdHu5QZmAd0XRIn06OCGI19XxntH0ngYrA1Y4Jl3acYbxfYtTT/yz?=
 =?us-ascii?Q?uidCWa4YtuvbHu3hq3VdJ3sMMI4As3ZTbttfvsiX/IYZw4jigbpYA3XuF18K?=
 =?us-ascii?Q?YjZ3t6l+lyAmKdPHyBWjfkA1TTA0Gw5LLwRzrsbfuGPg8eBfrsfIWxyeB+w/?=
 =?us-ascii?Q?0ssj2ZEamYaezHTrVfmBixBuX0KJBrqXPUL8FlA9JRCA5fWarKUK6giTSIgY?=
 =?us-ascii?Q?VLEkg6Y24a2VkF2S218zl+BEpLCbdnz9uVrliVjMp1p1OaJzzBjajA4wywRH?=
 =?us-ascii?Q?95KINqjcfBsYONxofzXiapXqAF+L3ERmGskKezyZM8Qej0UtyUvxyJmXw6jF?=
 =?us-ascii?Q?EA82d1exrBfPM1YWfZhqaxbZPNOhBCojmKiU6Wi6r06VVBAARVW1I7zi3JtS?=
 =?us-ascii?Q?2ObdRnFeHicudgETlU2NFciPVaqqoifpitc/y8CWdo6XqfQENv/5FMPZiP8e?=
 =?us-ascii?Q?rB1VCrFR02wl/Z7bJPqVY0s4peXS9R87TdPmdM5DFzp4KH7gUPTsSi5AiuS2?=
 =?us-ascii?Q?w9HVHlClbz/NzvxksofprzNiboF8SI8tEvGVAts5dV7AK8mWXg9d23PcH+pt?=
 =?us-ascii?Q?J3d1YaTlwKSGdlqo55nsVOs1/rNKp5BxEspBYu3KaSkmIxeIZR6ij5tT37r6?=
 =?us-ascii?Q?66u9EvfS/PtixgMIbEK7LgL8nCcDMm1d5gI/eGCedYn//F2xKlGoVXKzi5ed?=
 =?us-ascii?Q?g7S59Y5vEAmtcg6mcC2ryz+zAVsBjZmOUDYvL5oBInecpgxUMDAEJk7lUthB?=
 =?us-ascii?Q?dE6P0s1ChY1J6751BHnZxmS1+bAaKDysnVZGB46IRfZn1qg7XcxS0IuZ4emD?=
 =?us-ascii?Q?cBV2ur8JmjeYo5/zzf9WkvZOyX/IHK1GuapmTpqz36w83gvdve/McaREDF6S?=
 =?us-ascii?Q?8TESlZ/0B3jtnmmO+31mRjk=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 73417dac-ffa0-4d00-5c22-08d9d55e5513
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 23:58:58.3578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 1wexTEx73hCRwWKCJu17jNsyT1Li7ljvrwIInGn/0WpcLTIF85e5brV4Roxv2oWvKJQArEUyxYz7EsheAIymjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1280
X-Proofpoint-ORIG-GUID: MS4bpL7CjvdSlnAyt1mnzJ9zgkDRpcao
X-Proofpoint-GUID: mpH8phIio1VLM5FOwVj6Y__ZkBp0ifiE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-11_04,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=520 lowpriorityscore=0 spamscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 mlxscore=0 adultscore=0 bulkscore=0
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2201110124
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 23:59:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160472

This second change set, enables the kernel:do_strip() to share the
oe.package:runstrip() method. A copy of the kernel is made for the
kernel strip processing which is ultimately deployed, while the 
unstripped kernel image can be used by package.bbclass to generate
the extended packagedata (debug info).  The extended packagedata is
also used to genrate the SPDX data.

This change also needs to strip out the "/usr/src/kernel" path since
the kernel uses work-shared, which is added to the search path.

I have tested this with edgerouter which uses the
KERNEL_IMAGE_STRIP_EXTRA_SECTIONS variable

If this looks good, I will send a non-RFC patch set tomorrow.


Sau!


Saul Wold (3):
  create-spdx: Add kernel work-shared source
  package: Add support for kernel stripping
  kernel.bbclass: use common strip()

 meta/classes/create-spdx.bbclass |  6 ++++-
 meta/classes/kernel.bbclass      | 44 ++++++++++++++------------------
 meta/classes/package.bbclass     | 21 +++++----------
 meta/lib/oe/package.py           |  7 +++--
 4 files changed, 36 insertions(+), 42 deletions(-)

-- 
2.31.1


