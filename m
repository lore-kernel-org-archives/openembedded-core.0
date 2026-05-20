Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5539ACD4F54
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 08:15:11 +0000 (UTC)
Received: from mx-relay22-hz1-if1.hornetsecurity.com (mx-relay22-hz1-if1.hornetsecurity.com [94.100.128.32])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7306.1779264904977767612
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 01:15:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=ZJ90YVL2;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.128.32, mailfrom: hsimeliere@witekio.com)
Received: from mail-norwayeastazon11023134.outbound.protection.outlook.com ([40.107.159.134]) by mx-gate22-hz1;
 Wed, 20 May 2026 10:15:02 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RBdCoXRiJMV5qVk+ZFaZiIZCIewt8soTN3hWQE7RF+ByV6cHJTZDw9vpUeHEA1MGRaMRpwx9bBbV/yXyp7e+CzUO6pz5lgJuh49NSUQ9s9Lu9OIcmNmVwu3QvdqjWF5L76rZE/6wR1QZA6OYB6Nge0eBztks9Tm/Ku2/u99l/ZzfC1oHuz/dgJ3uF/YDnO6ZCnLEcRn9xt+IHYAeFY3Zg6yWYOGwZ31IZv69PtXfopqTTctUdHHm0nubpFAPlcQ27B+Wkq30rbrJwyXXWQqCeeidlj1x5XhIU2KGREh/PhAs70PZHTT5o/ywxMahcVl/XfdySwIHCqIpKuYqP8LbAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3usLVmIbIYz55DBIKsuAanuSZYqtOtw/FOgv1Bx0b4s=;
 b=UY6oYIyoJ4B0I1ImJtBAqkjzAC1CzuI596/di+z1Wxy/PplI8cfDks6XGXPLGRoaTyj8CHs/75WXt3vzg37HO4ZwrlAA/4Dtw0xYGdgbDhLPoogRVFJnPB5dzONdvEQ+EX63ccGu+dVsuTqgakVAB3bibf/Oq7J6kmL8EbHpQsYd8ZpZTXdFVFXfqKHXkeHIC6azQNOAlVOJLkpjYcn0OsUDGW339vkxA2/WdXPTkUUoabMjl09MsE/Vr1fvxSlgt3n2sK8uFFY3XvetSe/I6UIWaB+QL2lYHxQYTM0KmCmSjGy5Wo9zZw8RGnUJsJw+jI8xEU72v5WUtGWfA7Kdcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3usLVmIbIYz55DBIKsuAanuSZYqtOtw/FOgv1Bx0b4s=;
 b=ZJ90YVL23MLlClzITdaEWJKEaDcHs4t9Xctm9ycvFvSMjPeMEaMuVjrGpgdbqvlJk2/7ikYgxOUmDrjZ12FDqqA7rhDPrTY27UCZ1fMjHYAsDBnvvFgTsfez3sckLtAMxP8g7qFF+Hr3zBSU4MzqIad1ZcqmJYFyjduIo4FjDw7NXagvWoPR1YB8lckx2RYZMcOKAF5KVurz5mrLnsxtKIy3tPL8qPKIqb+kHSa5cT49UkT/r7h1TCjowXvcqKKyG4FBt+TW59ZT0ULU8vW2mZmqK/rALeZWKDQvK7x8/QlM5ATqh4/u2RSwBkfk5uJGCw+gmc66P4JRxTREu9Wyeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM (2603:10a6:501:87::6) by
 DU4P192MB2472.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:573::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.14; Wed, 20 May 2026 08:14:43 +0000
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4]) by MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4%6]) with mapi id 15.21.0025.020; Wed, 20 May 2026
 08:14:43 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>,
	Bruno VERNAY <bruno.vernay@se.com>
Subject: [OE-core][scarthgap][PATCH 5/7] gnutls: Fix CVE-2026-42014
Date: Wed, 20 May 2026 10:14:01 +0200
Message-ID: <20260520081403.3052797-5-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520081403.3052797-1-hsimeliere.opensource@witekio.com>
References: <20260520081403.3052797-1-hsimeliere.opensource@witekio.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0410.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:39b::22) To MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:501:87::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWP192MB3504:EE_|DU4P192MB2472:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ca72af5-2c0f-46e9-8d85-08deb647d929
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|10070799003|376014|52116014|366016|13003099007|22082099003|56012099003|18002099003|12006099003|25016099003|29003799003;
X-Microsoft-Antispam-Message-Info: 
	9zY9c0AlU1vMj16qEIwUyh0NrgROhG7EXMnWj5iYh9RoZbTR7WOeeDzBpVC4VRPDVqJk5R65pCv4cXMqxEwD4xnQHl/CEh3O3wCBkpZlVMeu00CXXMGR41WdNhRXxZTm+vKIotunqItQhcs8wjt1bfFpyrG3yuLGzEA6amfx+bTWy5zugDfn+2ArBJXzbek2xZ4nDbCZ0BXvRi60LNRA4WFtiLZMaRBb0oTCySTRlzN62XzkLCJkWdWmSsuIjIzyrO3Xg7RTxtpxxWFX4Ui8aWcpMzyt7Jtl4tQ/q3yz/b3QM9zinS4D5epfW42i/HReoxB9F/XM9ZfFJVif36ImONTzh8R7K2FXmr9vKEZs/H37fQqicxa2yDUckvXQVuoMxSJthX7Vkw5lI/UN+bpUkdrw6C/HskZ3k03XXGjKBxd+xeRbOrc4l6pXvDsUL5AgDTt7NadEGgu5nVk6uwzz9PBGEF4zQ3oS3ALc0qjzkc6T0gi5u0qdoYzpmqCbh7Oavm/Ahxeb7PqmzYgbCDKFMMyJ0Lb5WUUiXz0kO3D5+l33rtZR551K6n+Fuv7JZ2PMFZzmZV6Phh534bylwFj0Gb7HP5Op/+0pYrqBFXKY/e8cExXhmwi1fEqDMFvfGRnA1XTRwgrDSACp7lRs6WNh9rUVy32MBW3iMf6T21vuHWh35wqNfTbV4xxBJB+CeAo5
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWP192MB3504.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(52116014)(366016)(13003099007)(22082099003)(56012099003)(18002099003)(12006099003)(25016099003)(29003799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RpeWP0Ji0iXw5RWqKFsE6DuKI38C5fQudyqjYjezosWPCZ5ZIb5z27Fol5Pr?=
 =?us-ascii?Q?efpv/uAerH+9mb4ggU7d63b+AwuZuBVARRy3H5jY1x14txfmWMMlL3M2q7vs?=
 =?us-ascii?Q?iGyGCV5y5uQDNO8pjEBmkQAOpfFI253B7rWnMhQmK5PzbcwQmlwKa/4kcaXj?=
 =?us-ascii?Q?+knhErfZw7S2jpqawZK9B5bA/I19aeee5qnagOohNedUCqUemoIIzW92T6hv?=
 =?us-ascii?Q?4aYCcAU9KkLct1BJiwYGcHJd6IxPAg4BXIY+TYJr15MBJW3KVfNodHSGd5kD?=
 =?us-ascii?Q?drDXqssva8NQA4qOEI7J2bEFyhYyrVoQzKz+tWp9HvKoaayDZaAmd/lEiWBO?=
 =?us-ascii?Q?XtJAaaoLw1Pg/hwh+tyrTMFamRRInCOF/QSo4dXytPERgUAyOqBUBItVU4Rt?=
 =?us-ascii?Q?6dU6GfnbiW7UP79ljdTGYA7H/vPdCJHRYjp0shozNYFFxsO5/FMrWSvRsYS/?=
 =?us-ascii?Q?IQU+PLqBdd8iYKBUDgHCUucTzVI6JfcqnAq0d04DXLRQMALmuHzh/jpluRQE?=
 =?us-ascii?Q?2uatPxXH0GdfP/aiTPTXF765ABAKZ4b4PyG7WZ1PhHb4O+njaEkRHL/6dvAO?=
 =?us-ascii?Q?hQeVupeBPSrwY4oztakd4koCBJKye6XJ3gaNeYGKCbVtYgBNe234MnA+5EaI?=
 =?us-ascii?Q?NlGx23ZfxN6QJT7Wg199ekMJKO87qqt0z2oVEFm2qxko9IqA8s7WnLkd1zmg?=
 =?us-ascii?Q?olCljhUSLdmrxqfvjpe02zdIuJ7WXpiKhK833okxnPvoVCmJkyXqTJXoTboj?=
 =?us-ascii?Q?pD3QhdSLVWK3X3Z9fzyd9Itu/vwFEDiz4ZZ9h9QzK4y8Q9vlBmTIO1fmBpL8?=
 =?us-ascii?Q?WKaiXSIgA7zjel3EbV+Pv2EaG85mJ3AVWXwpBbgUxIvZGZ/n7h42MSm5L3a4?=
 =?us-ascii?Q?FHqOhwIi2b3iE9ezxE2aJVHF3ObKzqb/T8bdQlKU4ltDr/aTbTWtmYmOQw03?=
 =?us-ascii?Q?2JSZZ8oQ0omv8fT+8N1WerrONwkJub3huVYZTfr03jjBqQEYNpIQIjANBk5H?=
 =?us-ascii?Q?vrpa7Zqanp+w9f11IfDwumOtcfgqVdoXFVU8X0Q5uqYnTOeV+lVKPmL5Z76N?=
 =?us-ascii?Q?v1h1H7f4uUgdNfoRoQ5ttXayVhdJjfy/62CMW79TEc3zKoqK2Q7u5V2p8Z1l?=
 =?us-ascii?Q?WRkBZ/CvrKK29awYRgj2TAryhXWfkuLiy7L9xv6B6KPbnSngIuKTRZ2BgcPq?=
 =?us-ascii?Q?FhBdrHxrrsBpcUDCAwLnL9etT6g1gF6dwIJKjRMO35gw2vjPPX6Qs90PkKdQ?=
 =?us-ascii?Q?o6MbmoV8MFqTQ8LCh1nlyNl9SNcm2+ORwIkH4aKAjR4stDOIvFLCg488O0UX?=
 =?us-ascii?Q?BHrXYXqDgSj+JBYy+7qyr/UO36/59b3Wem6Q6wdKBkqIVKsB4iATIzw/lCyZ?=
 =?us-ascii?Q?dszEbRMAddpY81iV3VBISe703Hx/oh6VrHuQkzKmjn/nHSlUZbhxi2RYOaKy?=
 =?us-ascii?Q?i3A5j9ll10QpjqUAG9lbgwMJ3LZQRd1Raop/H/6LefOgarwGqxQ9L85o6kyX?=
 =?us-ascii?Q?8qei8Ut3Of0yX9/J2eLmBntW8C+eKLQdH3uRJlSWmpiVkTjrY1UYGVwgZFBK?=
 =?us-ascii?Q?53ilddv5RzBPsLQg/zvEDe5ipYoaO/9hKpisZFySA8QQr2e68RYE4P9dAp3V?=
 =?us-ascii?Q?haA2uz1NC1YYZEtPWFrUsE0gJ4LBhHOrlTAkNX70xVWG8JexR0c42VS3NkxW?=
 =?us-ascii?Q?h6Akl0ceRGNh01ankZCeFbIvXbpVHrASMpWkFA+9O1u6yzrMznCZFGtCP8SJ?=
 =?us-ascii?Q?cKb+iqd0oKs/smQ/Fc+sFN5kzKJ6a5kz1s0HIfylN9S5u29wozE5kuP9XXlU?=
X-MS-Exchange-AntiSpam-MessageData-1: sfQB+yrc3SdVwg==
X-Exchange-RoutingPolicyChecked: 
	eN8NP96Ym2tWnaGYxJODoxP+YqXjakwhFklmhKqc2NlAL5t7QO5oeTN+94g+VLMtAqGNOHaPKoO2BnbuwHd2XCX7Oj4WWFYeyw42SJXFIxJyMwvrIF6bTTSe+KrGiL3UgHJt2geByE5aPFFU+YrBJ861TmyCKJ3di9uZustrDNujlYVZlmm2x3Jyz6TeDC5lpV355Fj2l7B9f41A7GsMexdEbdBWxAifpJNpDXiwqrEPsY9lXxtOq6w9BebQ6nX4XI4kQVTbUvoQrCgY/nLVrrtUJPJj3Cv1PlLa5gDtvCzRhtAhb9CN/diZZ0pkm5hQU9N82pjiBVTRvoy9bdEzVw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	69Lhyd7enXn1HlwTfwjNMiRu2PL4dkdeM0egYEKYHkUkdMGLVQ3MqoNm52hMk1vzvFCdTFgCS0VWZGL7jNf0kFOWL0bWwwp+fiL6ZIj1igYBw35vV2OpdTKc5erS56sxR+WIXexzHKzvar5649wFCKm/BSFdTizIK0ffohO6lCeWwp/ILdIXIHJ/4cqWBUTpHtO3BcvZFPbZZ/TTWIHWVGVYUNjaHGQmOtvaPRwujotQujhVOcd78ngRvM8pzBp4667hh6vizmc2Jd18ZrEwIZ54bplj4Cq8DH1abt9HlLXF2BsbOBws5zfThNNl6kNZ8gxmJP1lzFoEfdzu5ljw4vaTbaUgjHQunDW32kniQStZ5v64vC9uxQ3sYnFnXLXxODWMS8UkaXkholAlaiqBXGJbvXQ1qi+HmeHz5US3HRLzaESUqn17qyAW3ITVm2C7QZTaMK56ghPZcwbiieyfhfgDiYMf9dQ7f5RWv6+L/jPFnJhaFq83qeVHj24O7/lolJsqG3Hqf0dfd1kwjYSLJLokp1zmue5G0klRgdOgMbRvPNhaZdyu6pI9AUkRIwubek3bvL5eMOD6iJMnshtYbRLmx3rIq1v17NKN9ZpPjdgs2IB4Rdby4vQSrTQsm6/C
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ca72af5-2c0f-46e9-8d85-08deb647d929
X-MS-Exchange-CrossTenant-AuthSource: MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 08:14:43.6132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T7gHECTc23ySi4J7HgkWJbiPrfzQAOXf6Bn3h+OqKUHNhO2fClf+oPVX9qd+D+gSlRmlDF9fNl1OLAneH5sTSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4P192MB2472
X-cloud-security-sender: hsimeliere@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: hsimeliere.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate22-hz1 with 4gL48c28WBz2Bdvm
X-cloud-security-connect: mail-norwayeastazon11023134.outbound.protection.outlook.com[40.107.159.134], TLS=1, IP=40.107.159.134
X-cloud-security-Digest: 0b7ae71439da6be8eff2eb65789e915c
X-cloud-security: scantime:1.676
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 08:15:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237397

From: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>

Pick patch from [1] as mentioned in Debian report in [2].

[1] https://gitlab.com/gnutls/gnutls/-/commit/3957f136e2ed23caf176a594b54b3827f5cef701
[2] https://security-tracker.debian.org/tracker/CVE-2026-42014

Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
Reviewed-by: Bruno VERNAY <bruno.vernay@se.com>
---
 .../gnutls/gnutls/CVE-2026-42014.patch        | 67 +++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42014.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-42014.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-42014.patch
new file mode 100644
index 0000000000..ceaf05bf1e
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-42014.patch
@@ -0,0 +1,67 @@
+From b48f025e58763f3975e5d65d698df27a5211bc51 Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Wed, 18 Mar 2026 18:19:06 +0100
+Subject: [PATCH] pkcs11_write: fix UAF and leak in gnutls_pkcs11_token_set_pin
+
+Changing Security Officer PIN with gnutls_pkcs11_token_set_pin() with
+oldpin == NULL for a token that lacks a protected authentication path
+led to a use-after-free.
+
+Reported-by: Luigino Camastra and Joshua Rogers of AISLE Research Team
+Fixes: #1766
+Fixes: #1809
+Fixes: CVE-2026-42014
+Fixes: GNUTLS-SA-2026-04-29-9
+CVSS: 4.0 Medium CVSS:3.1/AV:L/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:L
+
+CVE: CVE-2026-42014
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/3957f136e2ed23caf176a594b54b3827f5cef701]
+
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+(cherry picked from commit 3957f136e2ed23caf176a594b54b3827f5cef701)
+Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
+---
+ lib/pkcs11_write.c | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/lib/pkcs11_write.c b/lib/pkcs11_write.c
+index 961e1b9d8..9fe571ea2 100644
+--- a/lib/pkcs11_write.c
++++ b/lib/pkcs11_write.c
+@@ -1267,10 +1267,9 @@ int gnutls_pkcs11_token_set_pin(const char *token_url, const char *oldpin,
+ 		ses_flags = SESSION_WRITE | SESSION_LOGIN;
+ 
+ 	ret = pkcs11_open_session(&sinfo, NULL, info, ses_flags);
+-	p11_kit_uri_free(info);
+-
+ 	if (ret < 0) {
+ 		gnutls_assert();
++		p11_kit_uri_free(info);
+ 		return ret;
+ 	}
+ 
+@@ -1291,9 +1290,11 @@ int gnutls_pkcs11_token_set_pin(const char *token_url, const char *oldpin,
+ 		oldpin_size = L(oldpin);
+ 
+ 		if (!(sinfo.tinfo.flags & CKF_PROTECTED_AUTHENTICATION_PATH)) {
+-			if (newpin == NULL)
+-				return gnutls_assert_val(
++			if (newpin == NULL) {
++				ret = gnutls_assert_val(
+ 					GNUTLS_E_INVALID_REQUEST);
++				goto finish;
++			}
+ 
+ 			if (oldpin == NULL) {
+ 				struct pin_info_st pin_info;
+@@ -1325,6 +1326,7 @@ int gnutls_pkcs11_token_set_pin(const char *token_url, const char *oldpin,
+ 	ret = 0;
+ 
+ finish:
++	p11_kit_uri_free(info);
+ 	pkcs11_close_session(&sinfo);
+ 	return ret;
+ }
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
index 20946c1030..dc8e28c99b 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
@@ -49,6 +49,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://CVE-2026-33845.patch \
            file://CVE-2026-3833.patch \
            file://CVE-2026-42015.patch \
+           file://CVE-2026-42014.patch \
            "
 
 SRC_URI[sha256sum] = "2bea4e154794f3f00180fa2a5c51fe8b005ac7a31cd58bd44cdfa7f36ebc3a9b"
-- 
2.43.0


