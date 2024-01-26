Return-Path: <hayama@lineo.co.jp>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A78FDC47258
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 02:04:38 +0000 (UTC)
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (JPN01-OS0-obe.outbound.protection.outlook.com [40.107.113.107])
 by mx.groups.io with SMTP id smtpd.web11.5697.1706234676026322171
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jan 2024 18:04:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@lineo.co.jp header.s=selector2 header.b=Z47ErcJr;
 spf=pass (domain: lineo.co.jp, ip: 40.107.113.107, mailfrom: hayama@lineo.co.jp)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fU78ifs/gVqc6C+q/WSnaVWgrvf+7K7EQPU416jubGVb96IX02FTlohBM8FaUS5/HIfuxMMEb/D5LeGC27qAUqFKS7Yxqy5fc979fVYhv39LO2PBVRf0AoWK6Nq1ZLe/t2y5gkHBTT+GPKVGOrg25VX9Cz88anXvyhBHbZCWsrgekKmGFr5BnXYAu4ZLJW72iQLbRd7QQxZosnFwtb3L022JG7C5zL9OkWQyYLZBw7BFJtivytaI0XhEoPT9uDWg2mOiTqbPHqCJQDhqcoKoMXAG2r+e6WFTUVANvibwZFVDCtIqmKd69144q2qdw6SPHvgKG9sTfC5Fs+jOO2llVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d4EB0daYa4j15LWSgENBmQ+WVv724mudHh9XWq3oNfE=;
 b=hjpTcHfAwBXh3jqm+kkE6v1yJN9+FuuRb1qmDOKI9u09peDrJwLNFap5zBF8ugcaanqS4KDmN5l18IxdeskiMJE/FuzjN8gSEwV0HKOFqArxvGHQL2cyF+t9P9XJAns8jeMeFqJhfPKnNj+rkd4YRHGecX7sCbQfx3gzit6WYb6RZS5BQ7xl0yFUQCFR8vF9Ns7qoaNcR6HKCx0GegiUaER1SXtd+GqF6lfzWbblzlOFoYJPHzhf8AjUIycLE7lWEOnqTj0b22Wszz3H6zWbfj7RR8SiI2EitglZp1MEQbgc0s1N1ixlipF7nCbEDVmjfnoGTs6FW7pyBlbS8FyVSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lineo.co.jp; dmarc=pass action=none header.from=lineo.co.jp;
 dkim=pass header.d=lineo.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lineo.co.jp;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d4EB0daYa4j15LWSgENBmQ+WVv724mudHh9XWq3oNfE=;
 b=Z47ErcJrv0qHDjxF8fb1Vf+6XONCBMgpLtgav+Tp8KzymqMcYACA4JrVyWWcHkbHnYnyL2zLIZoOtp4E73CiWvaeWHpuuseZTnSAdUk2HM92Ptz7unE7lL7QhrSxxeS6JnazUoWl15hNnUiFFdZbeN4TpAH7aJNJTV2wdF6H1sGwjbmA3qDgB00nOAnu37B/whCdC4Pr29h0Q9cKxNSsTlJzx03BI+ER3jcqtZ508r/5qWZ3gonMSiMN4HdlMZ9N63mOKYnIsaWh+K7D2V7Y3bXzIDiAjVUywvtYP1hPcq7rfe+yarwwbmcJvsTQt4fu2sQeUkRcBdKwKu6WSNeY3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lineo.co.jp;
Received: from OSAPR01MB3937.jpnprd01.prod.outlook.com (2603:1096:604:31::10)
 by TYCPR01MB11008.jpnprd01.prod.outlook.com (2603:1096:400:3aa::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.15; Fri, 26 Jan
 2024 02:04:32 +0000
Received: from OSAPR01MB3937.jpnprd01.prod.outlook.com
 ([fe80::101f:a775:8434:50d]) by OSAPR01MB3937.jpnprd01.prod.outlook.com
 ([fe80::101f:a775:8434:50d%6]) with mapi id 15.20.7249.015; Fri, 26 Jan 2024
 02:04:32 +0000
Message-ID: <290d833f-f6da-47ec-bfda-7d46400bbc70@lineo.co.jp>
Date: Fri, 26 Jan 2024 11:04:31 +0900
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Yuta Hayama <hayama@lineo.co.jp>
To: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: [RFC PATCH][RESEND] cve-update-nvd2-native: make an error if the DB
 file is not present at the end of do_fetch
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: OS7PR01CA0107.jpnprd01.prod.outlook.com
 (2603:1096:604:258::9) To OSAPR01MB3937.jpnprd01.prod.outlook.com
 (2603:1096:604:31::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSAPR01MB3937:EE_|TYCPR01MB11008:EE_
X-MS-Office365-Filtering-Correlation-Id: ca0fcf25-5ada-44f5-54b6-08dc1e132302
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0JJbpG0k1hfNJ5xH2sPgfwFnXDv6lnob8WQfwKTbBWClj+Q5Miw5MS0XfAQrhFfqX88gl46NgQeGrCYRuwmWp42twlNEW9PYgyH6RrrGdibTYmM8IidoDwdVI2swGkd4sRlsXerZWJf0Bu/rUiLr5EJpE7JkxalM22EflbnMun6PjSiod3bCo/xBmAgrfjY47XrR++SpUoG3eavd0uQpELJ+JAjKzDah8Te9gT8FkcNnRtdDf192r5s3hHgFGFwYfzvNLq5tgkMpZK18jaQ3cyUhtTjrbTDxFEHMhG5xI5nDAmjoU24C4p0EaJgXab4K8XGh2DLsUhg0x+uQWDtQs75ccdf25ON2Eo3xh7S5ksISQgPEU36xrJB9zcXJB33qLFMMls1WTR3zqkWXQv3ioepgPwfefHsaHV3Q+DpLD8szR+FqnqdAA05ip1FkiWvy1+Yh7N6U6GW7CyI21SU6XVVPva6lx7LQfCoJHWS8haeN/MLwYOcZiBXCbE6rcu6RZBxEcfGEQRVAALwC4Cm0pPjmP5oCF3H0tMQ6UJNuxBAFOkin0eUMBGt0ucXjHoOLqKIXp6ncw98UBO8Q9avJ3NtK08P+WdLc5urWx+GBJmrDuRaw6QbTNPm+3ZWBCKEoWHFEi/iUBtuTZgM94P8VpA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB3937.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(39840400004)(376002)(396003)(136003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(26005)(86362001)(31696002)(36756003)(2616005)(83380400001)(2906002)(41300700001)(966005)(478600001)(6486002)(6512007)(6506007)(6916009)(66946007)(66476007)(66556008)(38100700002)(31686004)(15650500001)(5660300002)(316002)(8676002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b1p3cEZ2UVQzUmtMckJGeVMxdHVoYThCdSs5YkIzUWg4empkNG1DNm8xQUZ2?=
 =?utf-8?B?YS9YMmI5VFhVSERWTENnL2s2dlRHUlJYaE10Z05PcGM4eUN2THJWa0xRbHBi?=
 =?utf-8?B?eVBYL2RQbVQ2bkV5dFNzVUdrNWtyaUtpUTdVdHNRa091aTlBNXd5TkRIUXg0?=
 =?utf-8?B?QlQvUTFVZVQxTys3QVF2MFpYZ3NMWFUrRlgyY1cyTUhXM3M4ZWlhcEhpaXlp?=
 =?utf-8?B?QXI3azg5ck1jTEFkR2lxa0VNZkc4QzdxajVTa3JkbTZXQUl2TTlCcUJMQlRu?=
 =?utf-8?B?L0k3UFZ6YS8rL0J2aDAzMlU0d2tRVXNTT2tuNi8xVG85cFBxZ0xsWllrYnBx?=
 =?utf-8?B?UmlJYzRQczdzSlFNNFlHaG9zNWVCcmhXVXk0S0h4bFdmMVlJd1lZWjRkWDNy?=
 =?utf-8?B?WmQ4ckg1bVN0Q2EwTFVPc1RnTktYbmUwdXl5cFIvUHljZHRvdjdrUHVCcXU4?=
 =?utf-8?B?Y2tWRG54bnRSYjAxVUlHZTEwbEhrcVlGaUc2K2ZsRDhGcG1XQWFNbUNxUUtJ?=
 =?utf-8?B?NVkvRVpickVoQUR6TjAyUmQ3bG5HN0F5YnM3MFJwREo3NkV0UE9Pd29kblRS?=
 =?utf-8?B?TjR6T0ttR0oxZlh6OGpRSkp4TVAxdVZYUVdFNmJrbmxLVmJZNTR2VWNxT241?=
 =?utf-8?B?MUpPazFYbHFTZlVIZlJpeHNJbGRlMEFyNnJkRkN6N29ENmF2QmJYN3lCTG93?=
 =?utf-8?B?Ymw1bDE1NGZSK3h5Y2tndHhia2FHQXhkTFhHcFZlL0t1L0tKQVRPMFpnbGRu?=
 =?utf-8?B?U01KRllhKzlGUVBRUkNRRnhyYnh6U3dPTDlvYVUvK2hXSTlOZVNGbCsyRGsz?=
 =?utf-8?B?elV2WEd2SnlKQ0FUcTI2UjNKRmZ0VDNlSGNUNGhybHVoclVINHNTM3NYcGJp?=
 =?utf-8?B?M0MvWmZ1cVlnN0QwYUNyd2RRdldsdGV3MmhzZzhyenNRZEpoWjNiUTNEWWFS?=
 =?utf-8?B?VmFobDZWNlY0ejY5QlpTbmpCU0lQbVBPMkpjSHh5RlVJVk1wUEZsdEl3ZHVR?=
 =?utf-8?B?dGd5ek9BUXdqOHFndGVGbmlhc21nUi9nczlzZE4waklERVNPOEVlYTJMT3Jz?=
 =?utf-8?B?aHdsTlNDYlBxZndJOXVza3JjczFHSlZFUjk0SWtFcXdSeENDWUNheWtVd3R6?=
 =?utf-8?B?MjkzOTNEd0FhVEdjL01QQ0VuZ0NZUU1zdDBhR1FrRTF2RjBpV094ckFkTjNM?=
 =?utf-8?B?alJRVzF5ODY2TExlNkQ0TkZFUVh6TXNVT0puSWcyczNJK0Z2V1lUSUhCa2N3?=
 =?utf-8?B?a0ZIVm1QU2NUWk16eFk0NkZucW96bUp3R0FKZERIellkeGV4ejVVZWhqNEU4?=
 =?utf-8?B?T1dpbXF4ZTA3M1FvVkw1NkRzSWRuWjJHcDIvNWJUb2VlRnBBS3BqK25wUDJj?=
 =?utf-8?B?V1VZQ2tEZXR2VWRhY1RkTk9mQ05PNTFSVXlqandiaTFVT0ZDd0QwMTVsbUM5?=
 =?utf-8?B?aFdGWmVZa1JqNW15SXN3bFIrQm5JUTllV242SHNxRFZ2Q3EzVGNrSXhSQ2dL?=
 =?utf-8?B?bHlJSXBlKy9KaU9iQ0VtK0s4WlRuQ3NCZG56OHNMN0I5d0FyN283K2R2akxD?=
 =?utf-8?B?WjdJL0ttUHdvcmdlQk5YVUdrUk16U0ZsUzBPN1g1L21ISTFMRDBIanJQbGR5?=
 =?utf-8?B?RTFtczY5YXowOGVxVGlnMWpQQnY4aTFKeGJxYTdnRmd2YXZtOHBENmVpVXNM?=
 =?utf-8?B?dzNiemZDT3FyaE5INUxBbWxkRlZSQ2w2US9BSEtNZ3pkdW9oWklFOVNHcXZP?=
 =?utf-8?B?SWkvVGpKdFRuMEM2eWNnM2NNdzFoblViQWt1dUpVNWlLQ3ZhZnhtQUVFVEdt?=
 =?utf-8?B?bTZZTmZYcnJSSU8rMUFnTEFsNWJZOCtuY2pDanZ0MWxWUjN0SGp2ZTlHVjRs?=
 =?utf-8?B?U3NSQVRSZndjYlJsMXVGT3Avd1dSQ05icHBFUlVCUDVwalpMK0thSTNKbkJp?=
 =?utf-8?B?R2pXMGRkd0tSS21Xd1kxc1d3eHFJbGdZL0M3Q0J5TlI3ZzdjL1h2L3psY0tB?=
 =?utf-8?B?MDZFVzF0WWpoU3pzYXBNUVA1Rittd0JsMTV6NXVVWVZ4VkhCTENsRm5lcWx2?=
 =?utf-8?B?Z2FiWlZkRVpLT1o0cXduKzNYakgvM2d6WHZUMmV6eEg4alBWdktYOVNyWHc2?=
 =?utf-8?Q?xpmgr/zvC8KDNpqmn2eJ2wstm?=
X-OriginatorOrg: lineo.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: ca0fcf25-5ada-44f5-54b6-08dc1e132302
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB3937.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 02:04:32.1411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 850e1ad4-d43d-42a8-82ab-c68675f36887
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8lgmx5LjfIAKF42iIQ5idgylEpwA47BLCsxtReA/5qVNRV+5HWjexQRjFCfj6lS/WJgrPnvMzowRzG3VJ02fEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11008
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 02:04:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194339

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


