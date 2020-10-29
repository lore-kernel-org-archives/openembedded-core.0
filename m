Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.62])
 by mx.groups.io with SMTP id smtpd.web11.4942.1603953087491137084
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 23:31:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=mb2AXSjn;
 spf=pass (domain: windriver.com, ip: 40.107.92.62, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ShQMqcuPXaGOPCcarZbPpme5gR9iDZs+HjGBetGT6TWI7SlknYQDrAufrl6kZkiWPE0d+UpLSqk0IlR7iX30MjBYi5g+1Nn9osvCJw+bkBy0q1a1WqXjCTjydA9+jk0dyBV0u9eT+b6C1MrFpxQzCtb38doSVzIjCFYAo/fTVoxhXfacw8oozsnpgMbsUQSESGg3bOS7Pi7WYlPTNe88D3Dpk9p6CzPrGOz/PPn9mZwOwpuxu3zPVbRaLwBKDz7GSdcDEfg2Adw78wEeJwAir1cK2MDRVAqhHXfvY6NnCZNYFYhDPcdSv5qtNOspagzav7VB9LzR463oToY01ZEstg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uMTBshuZr+COQirGxC1wRhysiugIbkMvseVg8mAysB4=;
 b=hNDS5Xg6W5BMMmui1w1y1qoC35LbgqWny7L3d+rvHTPFg4n/QUgKP/WF8aaWWuqr3TCb4W8bt3ndYDO4i4wVAp6Xmk9NS/l6RauXHsdUnSpX5J5elMcZVXkwkx3WqPzVaUrejKIVGgkpPaWv8BmDQL3lKo1jllWT2JpyASdyKdd3FjJyG8MoC8IWXUgnQFvnxhEawFVtT30vVaOTQKKHjQw3GkoTQYy26TSNKGJa3pgmOEopGnEQo/tN1gX1o0Nc3/s3XycHCkrCIEFzu28PWZ1EpzvV7N2qwTyX8Xvv9vgjxHwrXIstl5vIQ1WFLFABD8EZSlbQP41Xvq0lcX4dwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uMTBshuZr+COQirGxC1wRhysiugIbkMvseVg8mAysB4=;
 b=mb2AXSjnGUYgmYA0x9kji93nXCvNEr2jsRSM6AVkZTy05CqTPXc5eLMWHUv6vPeXNu7d8kZox0kIJOal0U1MbBxsxfMVVDQulGqi7ZzDhQ6H4RmfHA6/hIFVkTI8UkXzpnrvwmfnphoYjGQiqhOsSZQ0PPPyrzzgf8qa0fJWcug=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MWHPR11MB1264.namprd11.prod.outlook.com (2603:10b6:300:27::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Thu, 29 Oct
 2020 06:31:25 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::105b:9105:2a38:9e9f]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::105b:9105:2a38:9e9f%7]) with mapi id 15.20.3499.027; Thu, 29 Oct 2020
 06:31:24 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] update_udev_hwdb: clean hwdb.bin
Date: Thu, 29 Oct 2020 14:31:08 +0800
Message-Id: <20201029063108.34921-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: YT1PR01CA0120.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::29) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by YT1PR01CA0120.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Thu, 29 Oct 2020 06:31:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e27b2ea8-9283-4d08-b9af-08d87bd441e9
X-MS-TrafficTypeDiagnostic: MWHPR11MB1264:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB126492C14294835AD8DD9FFFF1140@MWHPR11MB1264.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VSLa+3xyesTS9lwrEVCH7E/iFFhtP7GkkV4vSF6Air1RTBSivDUTHefTijq9QUkklm9thpGAOJxMLl/tWBWQ66nCLQE1PU9xdsD4XG7cfbmAsiev1ZwoLBshRWcoeb9AbgdT7CBzOtYnR1yTikAiYMwUmmAnf8aD4IEIQYM3M/lm3tRDgXhXEeSuw70PvRUEzCNCC+Xj5xyRWtFYuKTtvNts+GQu7e07uN6sQxUUKAGIgatB48WtxaaCtNbWOvrywmII3CqvfCWGQcmgnUEiwF7fuhW5fDqTRbyAXHwVJaCN5SxfLiXu1VGOo/I71QlUppGkNESjVmngmyYqxd8JZQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(376002)(39850400004)(366004)(8936002)(186003)(16526019)(478600001)(6666004)(26005)(83380400001)(66946007)(2616005)(66556008)(66476007)(956004)(86362001)(6506007)(52116002)(316002)(9686003)(6512007)(1076003)(8676002)(36756003)(6486002)(2906002)(15650500001)(5660300002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	sRVdxYkj+cRs+wHEP0HKbd9stCJsOZOBuTwqPze6ZrWlro+QlCWewtSqKW2LXGQhnc8jyMnHuW3A3rOqxIpN7jkNX5sEP6dXwoI85RFxK85pzmpVgE6Jo/kiXCeMmnTiap4zLHkztfgQOc8Y3n0wRQDGTjsiIQ8IcHxGCSYztXzMzje90h5akleCRif1NnLrAnQZpsZK8VL8YvO/dLp2fKGtCebKISJgnABTyyfZGSNfI2u3dF0ivr98Jx70dEe5URwOREYUh2mgLKCdcunlB7s1KsUExSS3hBHZZe/0LnOtDfA53TUf6nj3A3zkSXSa04j0AsnSJqZylfFSduVKRJtn3nUmAg5B5SaQS5x0X5F3y9fHg+9NglWWg+7cKpMQlczTjISRTPC4CQnuQW3VHwAfaMAYhkblAt9RYe2LRvkDJf6IRkbmwcKvL2czt70Iv2272SrV/STM7g1ePzwseC377M9lHt/gwqFNTsXBgPNtEhLUsoJWsfkMtg5ZPg3KilbqKWyu2qgk2LL33Lt2bwNxL++MrZu3tHqMdUcTtf3nPa/frY9da9QiQajCCP4gHgJ+6xYqE7eWyMdyTBPhEF3pFeSqhDkN/G7hD1enA/5nBor5dXoirRoGn4D+qf369lqosY1/txcXIaipXmNkOw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e27b2ea8-9283-4d08-b9af-08d87bd441e9
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2020 06:31:24.7022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pnWOhtXtYKX3Ev4Ml4KdeuVGSBPr7iK5IpLQrCegMgqMCz4fP90z0IdXokfjBlflgRJB8Bd4fDj4uTOZbzpADw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1264
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Steps to reproduce:
echo "IMAGE_INSTALL_append = \" udev-hwdb lib32-udev-hwdb\"" >> conf/local.conf

When install both udev-hwdb and lib32-udev-hwdb as above,
there comes below do_populate_sdk error:
 $ bitbake core-image-sato  -c populate_sdk
 ERROR: Task (/path/core-image-sato.bb:do_populate_sdk) failed with exit code '134'
 NOTE: Tasks Summary: Attempted 5554 tasks of which 0 didn't need to be rerun and 1 failed.

 $ cat /path/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0-r5/pseudo/pseudo.log
 [snip]
 inode mismatch: '/path/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0-r5/sdk/image/usr/local/oecore-x86_64/sysroots/core2-64-poky-linux/lib/udev/hwdb.bin' ino 427383040 in db, 427383042 in request.
 [snip]

It is because both udev-hwdb and lib32-udev-hwdb will generate
${SDK_OUTPUT}/${SDKTARGETSYSROOT}/lib/udev/hwdb.bin during do_populate_sdk
and it triggers pseudo error.

So clean hwdb.bin before generate hwdb.bin to avoid conflict to
fix the above do_populate_sdk error.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 scripts/postinst-intercepts/update_udev_hwdb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/postinst-intercepts/update_udev_hwdb b/scripts/postinst-intercepts/update_udev_hwdb
index 102e99b947..cf06977c10 100644
--- a/scripts/postinst-intercepts/update_udev_hwdb
+++ b/scripts/postinst-intercepts/update_udev_hwdb
@@ -17,5 +17,6 @@ case "${PREFERRED_PROVIDER_udev}" in
 		;;
 esac
 
+rm -rf $D${UDEVLIBDIR}/udev/hwdb.bin
 PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D $D${libexecdir}/${binprefix}udevadm hwdb --update --root $D ${UDEV_EXTRA_ARGS}
 chown root:root $D${UDEVLIBDIR}/udev/hwdb.bin
-- 
2.17.1

