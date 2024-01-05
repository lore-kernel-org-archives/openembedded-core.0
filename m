Return-Path: <hayama@lineo.co.jp>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3CB2C3DA6E
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 06:04:33 +0000 (UTC)
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (JPN01-TYC-obe.outbound.protection.outlook.com [40.107.114.111])
 by mx.groups.io with SMTP id smtpd.web10.18133.1704434668195978860
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jan 2024 22:04:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@lineo.co.jp header.s=selector2 header.b=kdOu0IzN;
 spf=pass (domain: lineo.co.jp, ip: 40.107.114.111, mailfrom: hayama@lineo.co.jp)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GTeQwo9EDaKu7TAbtRrDLvbTD5deq48R6aUxKq4usQutJyMrUDCKLhMN4x1lVyepU+55FUBX2oEFz6tlahO6LV/m3erJHY4225chk0qiRx8wxjlRoesNirTAcY0CUnEM6elPoGRa0P6/qtcg2ZZH42q7gzo5vwhkL8hkSaeOyZukKzBN0ma6cnBZbhCEuuQVBvRtEsYupOQgbnIF4c09KlQvyqqfXMheTTbL4kpBzJzqbiwgqhvPnE9rCFWgOWghUpvIOCgkoWpahBbWUEWL3YKYOS3BP5EE4Mq2aDToQLSlYol+urfEig/ftlSLXzKWQJfDn1pC2NWcYkQ7ngvgPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d4EB0daYa4j15LWSgENBmQ+WVv724mudHh9XWq3oNfE=;
 b=gdIX1Y3p93z9YbPkxj6wYUaQAvUQvvqzjCife/LL1Iw1ie0Lm6L2p7s9h2S3XTxUxXdBeESXXLlEyyp/vYDi+XWe6RxLtO+k0lx1nUhj6a0w3ziKLb2dwuRmSDV7ROIb/CVwEGQWOrOemGU5ocQw+CQeVBVwljW6G7q2ni5nprvxWlCv76W0CbrLuJbqkcKk+GAJIUpT70GktaMes2tpPN+8vXs4kY7A1yl38b3m6Di4jcyFNHfqs7QH+7crWboe0Zh7T7wqJZ7UGiC9DGxsd79ZStGI8ZwA9wIB/QMi0ze9tjDOxTeI5g4BmGPD5NGM5nxdOM8hKE7mg+79zUF0og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lineo.co.jp; dmarc=pass action=none header.from=lineo.co.jp;
 dkim=pass header.d=lineo.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lineo.co.jp;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d4EB0daYa4j15LWSgENBmQ+WVv724mudHh9XWq3oNfE=;
 b=kdOu0IzN/exiKi/3FG1RdgxeAMmbdJYEMzZ5HhvSWhoIUAyNDg/rfOlWu9ejW0g7eJInIaT30gDDX7tvzHQdqzjNdzNZL1ewXOybaD6KV2j3+EN1XvXUym8VEB1638v7vyNYOufFuUN5AKfwyJeQ8cvMna9loKMMr5EELVnSFpTN518CUGmWIZcD/Z0rc7X8lAdwzKMdY6ikYir5IXlSV/REZH+NX3xALPdbtKsJiqp6ju+oUwsD58BSmVwYaVg5L7823zjVmEzgOG4bFsZU604dZVcaaWXXyR6kmx366MWt4lLvaMXBCCJcHPvamHraSH+Xn8wmIRUSRyJ9SpW7mg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lineo.co.jp;
Received: from OSZPR01MB6309.jpnprd01.prod.outlook.com (2603:1096:604:ef::13)
 by OSZPR01MB8564.jpnprd01.prod.outlook.com (2603:1096:604:18d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.9; Fri, 5 Jan
 2024 06:04:23 +0000
Received: from OSZPR01MB6309.jpnprd01.prod.outlook.com
 ([fe80::4568:90d:4341:e58a]) by OSZPR01MB6309.jpnprd01.prod.outlook.com
 ([fe80::4568:90d:4341:e58a%7]) with mapi id 15.20.7181.009; Fri, 5 Jan 2024
 06:04:23 +0000
Message-ID: <83cc3534-87e4-441c-8d2c-5d26df7cacd2@lineo.co.jp>
Date: Fri, 5 Jan 2024 15:04:22 +0900
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Yuta Hayama <hayama@lineo.co.jp>
To: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: [RFC PATCH] cve-update-nvd2-native: make an error if the DB file is
 not present at the end of do_fetch
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYAPR01CA0151.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::19) To OSZPR01MB6309.jpnprd01.prod.outlook.com
 (2603:1096:604:ef::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSZPR01MB6309:EE_|OSZPR01MB8564:EE_
X-MS-Office365-Filtering-Correlation-Id: 92ddfac8-a528-4e1f-76cf-08dc0db42a57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9rBucMEhNU6UVU0qSJ1Mz+pjM628IxLemlXlel8+PK/A5b0FTr7ZUV2tEK8aWjxOUdTsGKswhz9+jnDvyaLctd5pFq3VL8DEcEoSMhL3+YNgH+hXssYMcOEWdf7ND2b4fYJ/V8UpmAxiYqTqZosBH6ggK2l04CKLvgOv2ABH/M6P6dxx0maEWIzP3TJ652HgaLlz3WPrBFhs3PYzbdRzsLkTB4FElcdZ8P/mG0kC5w31BOLL6KV6oHc1xqOx/B1OHfkTz52eospYi4yF8uEKIHpfSc6Sm4rODoS17jTqcPheAXPDkw8sAzX/HxPusRafPL/xxA0/SODDIYzC3XYrklXKnpsVjsCmpW6KuYj2BIOwA8JPCHDi0WtVpnjf7a1DmxlxpoUzEB47kOyLxIKbdKy10zAqthgfpqYZ19gZ3hfKRF4X+sUFMNG2jtuGHs92i7G1jHwaK17YVEwZWm+ApSfDR1v7MmvF77zg0qUAfkvN8+SARg/YOJyXe/up4OMFUyZ4XXCC5EOqeXYhyVoHydKOOhE+Cvn0oxwSkkuzvfgz1gpUA7HaZW/ybGSewp3z15XsSHVJ+7k4Pt/MAaalUpFZPzb2y67p+hoSHllyivA3Q01g4oYU8ELB1lvqxeirxttRjIL23+i9SfjZCingdw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB6309.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39840400004)(396003)(346002)(366004)(376002)(136003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(38100700002)(36756003)(31686004)(86362001)(31696002)(83380400001)(6506007)(6512007)(8676002)(8936002)(316002)(966005)(478600001)(6486002)(26005)(6916009)(66556008)(66946007)(66476007)(2616005)(41300700001)(2906002)(5660300002)(15650500001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R0FWNFh2OFpRMjhDdWNtanN6bmM1ek9IU2xSRVFyQmRvS0lsakhacHROY09G?=
 =?utf-8?B?U2MxeUdTL3pNcGZZTENwR0JGWFhtU2ZCOERqdHRyUUJWRkgvTlZ0bVBtTTNo?=
 =?utf-8?B?a3BrVjZFbG1BVEg0WnBOcUR5dXNyYmttTlZPa29objNSK0wxSFJRdnpjZUFX?=
 =?utf-8?B?R2pCb1pqbGl4V20veHoyR3oraHkzbUl6YnQyZzJNTGNtd1R3QnNwQmdub2R1?=
 =?utf-8?B?djcrRDhjSlFzcFhGQmVVNmQzbFdmMXpuR3lta2dwekU3THNEWlM5WnRmMDMy?=
 =?utf-8?B?QVF2OWhRTkhPWEpCVU9yZ1pLa0VXQVVJdVFWTUExQzFHQitXUUo1NmNoSzJY?=
 =?utf-8?B?d0NES2c2YUlGVEl4cEN0eGhhTzFZRjFBSmlDbjNSRU9MU2hGeWVrRUJEWm5k?=
 =?utf-8?B?VWFWS01RQkVDZDhkSkVkdWU2Q2VOTGFsakVpNDFxTU1WR3RXczFJZ3hZUXdy?=
 =?utf-8?B?M2FiYVJlT3hOY1hUOUlrWEhTVGtPY0owSG05c0FyUEpNaTVmdURKeVlFenFp?=
 =?utf-8?B?Z3FpT1JJa2Nld1FZNWhDUmRGZjcvNU1MTkNNM0tNL0pKMFcwTUtTQXdCZC9v?=
 =?utf-8?B?RWVLZU1vb3pKUlpST09DVUVBWnVYcGdNMUY4Uk55RkZiRXMrMWxTYXp1cWp4?=
 =?utf-8?B?VTBDN3NzTDVzZHc1Z3o4TjJsMFRPMkV3OTZUWG1rL0trZzJHcnJnS1hCeUdp?=
 =?utf-8?B?N1lxSllMd2k1UEowbS9GQzhpUm5yZUh2dmN1dHNjTys5SmY0OSswc3FqTmQr?=
 =?utf-8?B?aGdnV05YYWloQ3E1SUJ2WkYzRUNST2hZMXZEcVZNbWVxU1ZKV0d4V2dZbVJk?=
 =?utf-8?B?VTd1eEx4OGk5dWs4Q1BpSVVmSW9ZWnJYSTVkUjlLcjEvdzZDdFpFSTFnV1dP?=
 =?utf-8?B?czF6OFd5ZGExWmJ1Y2kzZVM4UGVnMGc5cm5Xb2ZZamkxcnZqUjNNMFhIempL?=
 =?utf-8?B?WSthZ2VuQkRpYXdGNFlHUmtOZko5eFUvemptVFFySS9adzg2U0tnZ2ZHOGlR?=
 =?utf-8?B?aDJ1UHBHdUFCWXIxc1VNUk1jbSt1Tyt4ajE4Mk1mOHhqZTFkWTk2VnUvZnd1?=
 =?utf-8?B?Ly90NHQ1L3I4U210b2NFb3QrMEJYdllXb3YzSW9BY2dDcGZPNmNpbTlxV1p6?=
 =?utf-8?B?eVB0QmhwTWNxeUY5Q0hsdlNqU09MTGsyQno2UFFtaE1GKy9KQnh5V25NTndv?=
 =?utf-8?B?UldJTFA2Y3Q4ZHgxbzRYMm8wQnhzYWpUZW82R2hsUDNNSk1KVS9zR0Z1VDdr?=
 =?utf-8?B?L1JDOFFod2lXYXAxaEJ6NHZTVlRqdEx2SXFZNHYzdm9FYkszVEpsMC9xL0lm?=
 =?utf-8?B?VldJVE80b0JUMFhsODJDK0tPcUlaMHVkelN2anF0dW01VFAvOE85NGYrN0VN?=
 =?utf-8?B?OE5uK3NuSjlIbENKZnJ4R3NuaFpvTitvSnJJbEhRdG1GNzBNVi9GTi9CTDhY?=
 =?utf-8?B?VzU4TXg0NFdodHRhSDNMbkQ3TytyOTdKeFI5TDhOWW5UTEhiSWVLWUVQaEJi?=
 =?utf-8?B?clFqY1M4UkdnZjJZZnBNdERQU1JVNDM4alZJb0lJMmhpTFZVQWVTRWZqZitP?=
 =?utf-8?B?RWR3UXhldERGVGhQTmNoTDJuWFRwYllGaXY5VFZsVWFYdlFIbUF5dks2QjVo?=
 =?utf-8?B?Zm5ycnlId3VQcFVVdFk4WkNyQzF2UmMrNTBMZDMvMklVN054alpYQ2hLNnIx?=
 =?utf-8?B?TkszcDVtOGRMS1gvOHU1eHdsZkFTQ2VVSGZPSnpVeWlIUHE4RU1oNStCWjV4?=
 =?utf-8?B?YzlvYkxESjhtMXhHb2ZDTHhVQUVaRXhtR2lLQzkraFViRFlHdHBOb01HZmN0?=
 =?utf-8?B?ZnY5V0VicWNReTlwQzhLWTVuT3V2QU5LRzlkUW9IRy9qYTVkRWdGZG8vSWF5?=
 =?utf-8?B?dVVhcGYrRXhlakN6dk16a2JCSDJ5amlab29LZVl0emh6YlFnRzU4OVo2Y1pE?=
 =?utf-8?B?Ym43ZjhrY2Jpazh5b2ZLNDM0Q0NGZDNObnpaZkp2NkNTNyszVVJIMFJLa3Vn?=
 =?utf-8?B?UEFqbTl1cXhRU3BRM28rZnVqSFZwcUNSSUVoT1VZMlhZbGlmNit5VmlQTzlZ?=
 =?utf-8?B?M05udlhHWHh3N3pFWGE2ZExhV1ROTjJUTXlPdlZ0bGE2QjZ1eDNON3o5L2pK?=
 =?utf-8?Q?aMT0QS2TSiYirfTt2Ol4T4/zL?=
X-OriginatorOrg: lineo.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 92ddfac8-a528-4e1f-76cf-08dc0db42a57
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB6309.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 06:04:23.6350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 850e1ad4-d43d-42a8-82ab-c68675f36887
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Il95kSVYsjDqomfI0qd+wQMoxo94cJjkG4862UX1g/gBY5mU5k+dsLwou3zWKkoCw+fXd2IOJPGBr8MeiwsuMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8564
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 06:04:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193342

From: Yuta Hayama <hayama@lineo.co.jp>

Signed-off-by: Yuta Hayama <hayama@lineo.co.jp>
---
Please do not apply this. For now, this is just my question.


I think the issue of [YOCTO #14929] is partially still there.
https://bugzilla.yoctoproject.org/show_bug.cgi?id=14929

Certainly, now that 8efe99214d has been applied, do_cve_check no longer runs on
broken DB file. However, if the first cve-update-nvd2-native:do_fetch run after
creating the build environment fails to save CVE_CHECK_DB_FILE, do_fetch will
have succeeded even though the DB file does not exist.

This may be confusing.

* do_cve_check seems to exit without doing anything if CVE_CHECK_DB_FILE is not
  existing. At this time, do_cve_check only logs in bb.note() and nothing seems
  to appear in the console. This may make it difficult for the user to
  understand what happened.

* Similar to cve-update-nvd2-native:do_fetch, do_cve_check is also successful
  even though it does not actually do anything. Yes, a check like this patch
  may be needed for cve-check.bbclass...

  I have written a task in our own recipe (sorry, we can't publish it) that
  depends on do_cve_check and expects ${WORKDIR}/temp/cve.log to be present,
  but I have found that the task may not work because of this. I don't know
  if I didn't understand do_cve_check well or if the current behavior is
  not good...

First, I would like to ask why cve-update-nvd2-native:do_fetch and do_cve_check
are completing successfully even when the DB file does not exist. Well, NVD API
frequently fails with errors, so I don't think it is necessary to fail the
do_fetch task if it "just failed to update". But other than that, I feel it's
better to make an error...

Thanks,


 meta/recipes-core/meta/cve-update-nvd2-native.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index bfe48b27e7..42e50d9cd1 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -83,6 +83,9 @@ python do_fetch() {
         # Update failed, do not modify the database
         bb.warn("CVE database update failed")
         os.remove(db_tmp_file)
+
+    if not os.path.isfile(db_file):
+        bb.error("Failed to fetch the CVE DB. do_cve_check run after this will not work.")
 }
 
 do_fetch[lockfiles] += "${CVE_CHECK_DB_FILE_LOCK}"
-- 
2.25.1


