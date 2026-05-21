Return-Path: <tgaige.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A578CD5BB0
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 10:10:48 +0000 (UTC)
Received: from mx-relay25-hz12-if1.hornetsecurity.com (mx-relay25-hz12-if1.hornetsecurity.com [94.100.139.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33229.1779358238533228389
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2026 03:10:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=ir32K6p4;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.139.225, mailfrom: tgaige@witekio.com)
Received: from mail-francecentralazon11023101.outbound.protection.outlook.com ([40.107.162.101]) by mx-gate25-hz12;
 Thu, 21 May 2026 12:10:36 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dJ+SWbs3pNlxo4Mdv+75YcZ+EOMYp/f8KytOr3+DaJbWr6dmRUoMjlhTgRWh9yefeQNkr4kDZxXj65lWU15Bk3fHeHsLMhR/dS55E4M/Sj86OzAtKGAy72hA8J0yz+wOKYYoBApAhKJLWzBp24maJcJpXiAHKRZMpow8fBnC1hFXcxpXwbv2b72wWDI7KU0qD1xsOt9F8uBrPI53jeBp5IMPzo2r1gw1OzI+OTzqVyYDm5jGRMpBJpTRLzCaTIeIIJ/XPSZYUoK8T00DqPNMjFgjHcwJUGsuwxRXQyPOFDABLL09R91Ko+rXPzfPLkT0CJqRuIVKR8XQNWdjxUzeog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lTNYcddcrGVfvb+QBr+GuUG0H58CV1VvlBc4Es4y+FM=;
 b=CjtJsKI+zbOajzPcEs7w5OPnUFHSKf56Tu97qZGBcOEawTWysSfGipyzQ7/Gf6BeEoPDp4TOzpIQrc9dBp3f2FyXyniU3N063y0tQ5nXTCYpDotaKqdHqkyqWd2mLBkcgnSeP9pEBXDNWM2pTUEWintti8CSvWWfci3Qm8FuHryml73rLSSMmJ1rWFTRNvjvUfVapyB7O1qelJjkvOKlMkiPP5sKlWYzovSXeHGzPPJ4XXBYvG3lxn1/jAxakfSiU80CKmYm+/kjTg/U0qN090YfiDb4AgTp2rl2hmAPQn6NBUJIEd6XB0u4bAVEdOjyKf695FjU1iw0llufnZEcYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lTNYcddcrGVfvb+QBr+GuUG0H58CV1VvlBc4Es4y+FM=;
 b=ir32K6p4OWMzxsnZy1Y0DsirjBEtszbjUCPOhrsSYpZGoh6Z72wkFW+de+e/OBGIXdIVnRwCCXK5uRncLJBPATuDpeOod2GasYyaj5RD2/yUX2ckZkvGEDES9ri8uoH/3KUkyX20Q5yXGO6Vo+yMY/Hkv+7+pCGXCqaCS7DoVA5heSb0b55LL+m8JyLPX227RdKzMBV8EJot6SugtJETlZ8GZ0j/ojLfL37eSgapTDhRrv+2a7SnB9dAqB6U+ReFluxSISBHsu8KuQm2MR8kqa7p5cbdeZ/pebHgeX7Ch8Q5Y1cqOl58uXgWNsMNlzVRJxtZh7ZI3adGSyOegsG8zQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:3ad::23)
 by AS4P192MB1672.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:507::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 10:10:15 +0000
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38]) by AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38%5]) with mapi id 15.21.0025.023; Thu, 21 May 2026
 10:10:15 +0000
From: tgaige.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: hsimeliere.opensource@witekio.com,
	"Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>,
	Bruno Vernay <bruno.vernay@se.com>
Subject: [scarthgap][PATCH 13/14] go: patch CVE-2026-42504
Date: Thu, 21 May 2026 12:09:46 +0200
Message-ID: <20260521100949.1299757-13-tgaige.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260521100949.1299757-1-tgaige.opensource@witekio.com>
References: <20260521100949.1299757-1-tgaige.opensource@witekio.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR0P278CA0104.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::19) To AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:3ad::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P192MB1396:EE_|AS4P192MB1672:EE_
X-MS-Office365-Filtering-Correlation-Id: 8eb8fb94-68e9-4e88-2c20-08deb721272e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|22082099003|18002099003|56012099003|38350700014|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info: 
	gHyQckRBK39SCus5/7taF9hjYFb/DNhzpqFmtwoy8sx8w30emXR3G0iu9P3k2jacsNizSBL2Ejoh0iMS8zNYcmd98IZFAUkP+vEqZHUD997ArQf7JCRRajQ+OpnZPTThxTqduRV6E3xBUcZtUJst4XaXa706kToy8jLUbbAHWOfmw3gZKW9eWxtDp6ILCjtKa/BMirQL5dd7nFEwty9UjCS38583wGBMpZWlOhwpnxjZoW6ntIZUjPuYIPKmrE5iqojaBQ9dmn5v9xP4lfZQ3u7xFBRvl11KdQzexUO3uhw6tzdn8tk58dACcHIiLVk7o/YCVs6Pn0IYE59Rzdq5xdSbUqnqqa13QaAKY1OXNaZEEqTRcGYG8rNAWp/pJ2J5pCbgspAPH2o1xyPyhnHF3fYFoIowJgo2dQIlW6NsphIDFBwX7sbOTM2feh6CTj1gwj/VdwuZCvQm7gIgNkW5A00G+XElQBgl5VM4V4y8D6RVTd83M+W0Zf54YjeNAV2B8sJaL33BKVh946LgUL1KNN9H7Zih+Yb9LRRxuJN+mflS8/7kdPRocJiFC0C/mR2vUTtyR8NOiHwp94zzbG4JglOgguTUUum3oaazTLV9cuC6BvUAAYWRncFhtdANIhZNSDd7D7fPFD6M9mEMvq6sDoEnvivGCqPmrzOhYoRc5sTE4rTcGcaDu5DybWeOH4UtnwJ/whG2N4vX4gFlzgQopA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P192MB1396.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(22082099003)(18002099003)(56012099003)(38350700014)(3023799007)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WmNRMXVtL1lXUHRuMEVxTGYyODJhVGs3N2JYamltYi90U1dRRUN0RUp1VUNV?=
 =?utf-8?B?ZHJrV3FCanF1TW5sLzJvVDJKZXJvejkwS1VtS0JBSHpQaWFrVkhXbXAvT2dY?=
 =?utf-8?B?dC9qNnI3Zy8zV3VEcVhwclJsVldhMk9Ic0xIZUdKcEpIYkZxUUxIbk5aaFhI?=
 =?utf-8?B?b1FteVltWkpYNWV3M2lLd09OcmNwNno1RkNPRkpNNDFHTlBEeTJaUVNuZThP?=
 =?utf-8?B?bHJTM3ROTlJ2QlNEcVpOMDdjZ1VrUU41SU9PMFg4eXg2cW9ZVkJJZ3NEeWtM?=
 =?utf-8?B?OURmRkJMaW9FcER5cFBCbHE0dzFNaXR3ZFlUZUJzdldCVlFjbk1iYlIwQUdU?=
 =?utf-8?B?MERZeXRWL0Rpb2NDL2hFTkZrT3h0STZreFpJMmcrK2FuZ3FCUm1vU01jS293?=
 =?utf-8?B?ajZQQ0xqUkpUSmZKVmFWN0RVR3NlNHN2Z21ML3RSOFpPdU91eFB0TGtIOWpT?=
 =?utf-8?B?NkRIalB1WHNBKzZkM3l0NG1oZEJjWi9DcFRwK3M3T1JMRlFiQ0ZOd3NaZjQ4?=
 =?utf-8?B?RkR2dkt6THh5V21ueXZiZWNGMTVJSjJIVVdWdVJCNjAzNkJtd2ZjWTZCRlJq?=
 =?utf-8?B?Wjlja2pyZnJ5NHBiQXJjYkNLTzRoWXA2YVAwaS93NHVoM1l5WHdrWGF3MzFp?=
 =?utf-8?B?VGpDRDg4WGc1bGMwVnZlUTVUbS91MUlTOU5VNFlFR2dJSW1vTjE3ejR5RVBn?=
 =?utf-8?B?VklNMUJnNUNQUzNiN1d5aHhiSmdaQjZkcWpJYkY1NE1ZSWEyN2RHdEFmQ0Jk?=
 =?utf-8?B?VHFJeGdlUzdYOXdwV1Jia2QwYVNob1IxUmdldWxVV0p5emtvbS84eElma0NI?=
 =?utf-8?B?OG1tLzl2bHVNOFFvQThrRFo0NUZiQVNTd2tGVXoxNzVLbzFFRCtiQzNJaWhO?=
 =?utf-8?B?UXEyRW84VUJ5SXljU2FtTU5FckVrUUxzMURPREVhcXhzbm9Ka0VMd204bVkr?=
 =?utf-8?B?cEdwRnNpeUZjNmpGVjFCNUIzeHlrMXNqYUxNS0Vod0pCOHV5Wk1yd0Z0MGJ4?=
 =?utf-8?B?ckp0S2hRTE1NSFJaRkEyTXhCTC9aT0xiUmFoMlZMK296OENhcWg3VXE0aDdI?=
 =?utf-8?B?cW9FYnVmZFk2Tm9QeHFvTm04ZTk0bWFHY0xsSlZTd2N0WnZtejRPWitJNG1k?=
 =?utf-8?B?UHRrbHgwdVp2c3N6VGFKeC9kZmUrbmJ1bGhIeTh4YmdoTWthZ0RCZGIvS1pD?=
 =?utf-8?B?aFlkOEpEcG5KS0h0RlJWZ1FWYnQwb0lvTDI2RmFJMnRyLzZvKzFscW9YVk0v?=
 =?utf-8?B?K01zNmNSVmVXRm10eklERmw0dndGVCtNdDRrMENhcHlzTys3TllJdTZxYy8r?=
 =?utf-8?B?MEpLbWVad1FBNlVJdUwzcEJ1a2JPUGt5bGJDUzZTbWxZQnZlbVJKSmVPdi9G?=
 =?utf-8?B?THE3ZXI2eVlwRlg1VThlNlo0ZWZSVjYyVWpPMlRvVnQ3N1gwUjVvQ1JCSnJn?=
 =?utf-8?B?bkFZYkZDSlA5WmZSNm5BWlpFeGdIcDY4bURKa2c0TU9MdEUxSFZzQU9JRXh2?=
 =?utf-8?B?dGlCSW42dEtoOHVlZ2lTTDViMXdKN3h0dFFCSVVQb2tqU1JWUURyQklOU2NJ?=
 =?utf-8?B?NzByQnFMcUhyRGtZQkxOaU1COHNOMktrKzZHQkM5dGlRMjU1TWR0N0lnOFpJ?=
 =?utf-8?B?TUFoa05iellCZTZoMXZEd0RnUnNRd3FGWmFkYys5NXAvUTM3SDlxSDZjRkdm?=
 =?utf-8?B?bm9ON3Q4OFNyVVZjT09mZnZCazFIRHhPT2hIYTZ0ZElCRE9uVE5iSDVDRkxV?=
 =?utf-8?B?bTA4NHRwN1ZiVHRIdjQ1Ly83Z2tNV1hqdG0yNEEya3RTMk9SVDlOblNENUsx?=
 =?utf-8?B?TFBpNmQ4dFYzUjhROHhpUS90NlVYcHJWSWRSODJZNllZZkFvQm00czdPNzhI?=
 =?utf-8?B?M0VzZG1GUFlmc2VKNHg0a0ZhMVRQeXJOUXVBQ2oxSS9lYnhzQUdsdWNTSFFt?=
 =?utf-8?B?MjVPR1Jjc3lUTGhqbkRIWnlxNUc3YXo3dkZCNVZQVlZTMFA1eVpjNEtCa1BZ?=
 =?utf-8?B?aTZjcFpQTkZLNnpXTjY0YUVyY3NQdlVYdG5Vd3ZjR29LcW4vV3BocVNxVTF0?=
 =?utf-8?B?YjFCOTlNQkNyWWpaUzA3KzYwSHhBbUZieFdnelh5cXcwU0N4MjdvVG93K2dB?=
 =?utf-8?B?SkZtaUd3YjU5SVdvaWptTWVacjRSMUNSR2hjdXBUY2JLUzZTVXdhcUZTZVNx?=
 =?utf-8?B?Y0VvcXk5SkVIYytFNUdMTGg2ckpCdUtqV0k4OVlKQkJ5VzhkdVI0NXlSei9W?=
 =?utf-8?B?YXBRS01vYnNESVU4d1lrWHhPVWhCTXNaMEpleDhjR05rMTY3ZDg0cW43S2lp?=
 =?utf-8?B?WXpkKzBldm5IQlY4Y0N5dE5hellvd0dDNEpJNHo2bFBURnpZZ1oyZz09?=
X-Exchange-RoutingPolicyChecked: 
	JKdQtY61bUCvrA8/X/geoXnSNkHNMdeVV2cUobRbIuyRma61PRBXLKiNjNMmXAd13H7zVUYgSIkmie3FV4h38HOC2Zn1e37lnAdEss2sarX94B3if2KI0bOhGQ47wMuuVdGrFkAorshQH8XPH3RCcv2TtgEb6Gk4C68LaEF/eBDqP3re05nlpfnokQnM4EtOX/vK4+R5gkQDov0bOSfKktuDJnVH853TmfOoQcrH630GrmizaGr9+zgy2dxkVC62fEO8TAsd1F4Naz0shG1O/NCsHZUOJSMZw3Y49hg51rNJvCB4+XFji3WrYFAFk3BhcT+rGiyJnVPcbqMR7Eka2w==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	xBoSUo/7syuboMFpbIbZirFrCueWZW7/1dKLeUzO7a6n+RQep6fO9akbEpW1EEK/ti1w1hbJl/fL7jth/QboB7tcFkAhBpaKrcyPdp4ktAujX45AEdOsHBJVS4XXLEoR7KEY1WE9DeisSiNAACjTmyO9N0386caOeTD8u+ff6aGNXRDc0GW4etYDRx/qdEPieWqLNMFyc+B9BTWpDLe4EMHMXxU8D7VVi2m3cCOdA32dsZsN0HvHyRaQh9xAZy27a8aAeae+Qx91MGLBavv/pRsrMZMyh4JvzmDd/q8oLfcGXEsjb9i3G1T6xNFOGYE56rhFHGL5NWk74UD5d1YFMBpHiL0ZTHnm/OYd10ZksZRPwSft0jwpa9IoXwxtwgQzTc7c4KxDbjEYoEt9df3fc8loY/CExTR+eW7BhCXA2t7KQZ2bvGwxrB+fJVzP2pPE/T24CCMb6IFId2p4biMyPOt8eAoZn6jBWVjorEvZ1R4hvQoo+grAalJW7siDjXtz/bRCPxO2XTOfSgvBMVRRQYYbgjAVBoyKNPuFuECf/6lugQa/zB9JOAKGXT6THr+a2lwGHiH9Xj/czmsmF/vH2Ut4t/Aydyf1npio+5BW6JqgUUD37FuJRfzDBYE368d9
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eb8fb94-68e9-4e88-2c20-08deb721272e
X-MS-Exchange-CrossTenant-AuthSource: AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 10:10:15.3330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zQSREPjirpG1m0AinsPJINIBkdU+0LwAoKVaBEAIUco0DgDNzmeqtPPkQb03PPesERub8PRoI+5I0Qs2ixsPJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P192MB1672
X-cloud-security-sender: tgaige@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: tgaige.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate25-hz12 with 4gLkgW6nRWz1X2Xr
X-cloud-security-connect: mail-francecentralazon11023101.outbound.protection.outlook.com[40.107.162.101], TLS=1, IP=40.107.162.101
X-cloud-security-Digest: 6da34fb3f6d673473c9233e63053a13e
X-cloud-security: scantime:1.443
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 10:10:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237496

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patch from [1]

[1] https://go.dev/cl/774481

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Reviewed-by: Bruno Vernay <bruno.vernay@se.com>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |  1 +
 .../go/go/CVE-2026-42504.patch                | 58 +++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-42504.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index 03a1a81fc3..ba4fe9a734 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -53,6 +53,7 @@ SRC_URI += "\
     file://CVE-2026-39826.patch \
     file://CVE-2026-42499.patch \
     file://CVE-2026-42501.patch \
+    file://CVE-2026-42504.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2026-42504.patch b/meta/recipes-devtools/go/go/CVE-2026-42504.patch
new file mode 100644
index 0000000000..1ae104ae19
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2026-42504.patch
@@ -0,0 +1,58 @@
+From 41ca50d68cd74e0a68f3917cd902885c84fedbf7 Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Tue, 5 May 2026 15:20:34 -0700
+Subject: [PATCH] mime: avoid quadratic complexity in WordDecoder.DecodeHeader
+
+When encountering an undecodable encoded-word,
+skip over the entire word rather than just the initial "=?".
+
+Fixes #79217
+Fixes CVE-2026-42504
+
+Change-Id: I28605faa235459d2ba71bd0f3ae3dce96a6a6964
+Reviewed-on: https://go-review.googlesource.com/c/go/+/774481
+Reviewed-by: Nicholas Husin <nsh@golang.org>
+LUCI-TryBot-Result: golang-scoped@luci-project-accounts.iam.gserviceaccount.com <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+Reviewed-by: Nicholas Husin <husin@google.com>
+
+CVE: CVE-2026-42504
+Upstream-Status: Backport [https://github.com/golang/go/commit/f230dd8a1d0a63d73e92685e378dcd725f7aac00]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ src/mime/encodedword.go      | 4 ++--
+ src/mime/encodedword_test.go | 4 ++++
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/src/mime/encodedword.go b/src/mime/encodedword.go
+index e6b470b1fb..a7059f3bc4 100644
+--- a/src/mime/encodedword.go
++++ b/src/mime/encodedword.go
+@@ -275,8 +275,8 @@ func (d *WordDecoder) DecodeHeader(header string) (string, error) {
+ 		content, err := decode(encoding, text)
+ 		if err != nil {
+ 			betweenWords = false
+-			buf.WriteString(header[:start+2])
+-			header = header[start+2:]
++			buf.WriteString(header[:end])
++			header = header[end:]
+ 			continue
+ 		}
+ 
+diff --git a/src/mime/encodedword_test.go b/src/mime/encodedword_test.go
+index 2a98794380..befc3cd996 100644
+--- a/src/mime/encodedword_test.go
++++ b/src/mime/encodedword_test.go
+@@ -140,6 +140,10 @@ func TestDecodeHeader(t *testing.T) {
+ 		{"=?ISO-8859-1?Q?a?=  =?ISO-8859-1?Q?b?=", "ab"},
+ 		{"=?ISO-8859-1?Q?a?= \r\n\t =?ISO-8859-1?Q?b?=", "ab"},
+ 		{"=?ISO-8859-1?Q?a_b?=", "a b"},
++		// Undecodable words
++		{"=?UTF-8?b?garbage?= =?UTF-8?b?QW5kcsOp?= =?UTF-8?b?garbage?=", "=?UTF-8?b?garbage?= André =?UTF-8?b?garbage?="},
++		{"=?UTF-8?b?QW5kcsOp", "=?UTF-8?b?QW5kcsOp"},
++		{"=?UTF-8?x?y?=?UTF-8?x?y=?", "=?UTF-8?x?y?=?UTF-8?x?y=?"},
+ 	}
+ 
+ 	for _, test := range tests {
+-- 
+2.43.0
+
-- 
2.43.0


