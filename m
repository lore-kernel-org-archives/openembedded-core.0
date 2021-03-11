Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.88])
 by mx.groups.io with SMTP id smtpd.web08.284.1615489024598941020
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 10:57:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=DnY/XyXr;
 spf=pass (domain: windriver.com, ip: 40.107.93.88, mailfrom: stefan.ghinea@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=klxq6FL/n8WlgR/Z/iSa59sBZXak5y+R9Tx3nqtEZSl4CEWo+v21AxWgGNRXEDAfn2cV7M8xshPlx5HQN8t1BAO2ERXM1VTI0FGIAmi6XNOdp1IU8j1YycUKlaAq143LeoAsqlOOESbmtDmETrb9CWBvMwDCw6GYoMQ2XCi+7BslW4HgoAeeuRdgXMjm3C5lMEdxFKodYsg9yeKkO/q/Mv9iZOw4r8Ts0uor3jhfw/t3e/bupk4xwzt+ZriL5vAbGyijxPnMd/IJqKavy5+ZWM8/d4HtdmHDZruU6faXvgOWxLmtuV2iWgeztZ1wsKJHBZ94cu38OcGqviFvZwp20A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJNODnnElC+oO+O/rTit7KkAskgHp5Is2Qzjzg/cY9Q=;
 b=Ko+luwoeCAQ7fCeiju5QrjNiJFowv8bRRk6fRHN9+yilQi5JcPhFWFxafyvgVG6Xwn7YEbvSgnZJ44WStd93zuu3Mc0NAsc+Nl7OonR8p5Z05c5V9vkj3hmyrgKzh2clP7obNG5kUpIxjC+mqWfNtZ6adsfivvB8dIWtHs2uO3HzrvendFn0etRvRbO3YPF9jPHKYs7rm21Vf7jeSbkIaAarnuLMs6q7ObsEZVaxwnU3JzqOhJ6sbjxiLFmoAu8cPfaY8TFfmQRLI8cgGRPW/FLSapnL6uZU88IUn5M7Oxvyf+TJrfqU3Suvz3CVbXLeExy68k202FRYhjhB4Kb6Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJNODnnElC+oO+O/rTit7KkAskgHp5Is2Qzjzg/cY9Q=;
 b=DnY/XyXrTQ3n/U98SLWZXCnESRkaz8nmpKNKEXMi/u0SWKhMS7t8XUApX1h3S05/7dOzQEg0k3vsuwPvrFAziH7+zKHx35HCPhHvbH6ONgjVlbqLZRH9MR5ieEKLXn67W+lcgtnKZ+vZjTJodoFxCztb5PkcgnKN3ykFEfna0Nk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SJ0PR11MB4989.namprd11.prod.outlook.com (2603:10b6:a03:2d9::22)
 by BY5PR11MB4209.namprd11.prod.outlook.com (2603:10b6:a03:1cc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.18; Thu, 11 Mar
 2021 18:57:02 +0000
Received: from SJ0PR11MB4989.namprd11.prod.outlook.com
 ([fe80::31f5:2e4:c15a:6df0]) by SJ0PR11MB4989.namprd11.prod.outlook.com
 ([fe80::31f5:2e4:c15a:6df0%6]) with mapi id 15.20.3912.030; Thu, 11 Mar 2021
 18:57:02 +0000
From: "Stefan Ghinea" <stefan.ghinea@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] [OE-core] [meta-openembedded] quagga: fix do_fetch warning
Date: Thu, 11 Mar 2021 20:56:41 +0200
Message-Id: <20210311185641.24754-1-stefan.ghinea@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [89.137.231.29]
X-ClientProxiedBy: VI1PR07CA0309.eurprd07.prod.outlook.com
 (2603:10a6:800:130::37) To SJ0PR11MB4989.namprd11.prod.outlook.com
 (2603:10b6:a03:2d9::22)
Return-Path: stefan.ghinea@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (89.137.231.29) by VI1PR07CA0309.eurprd07.prod.outlook.com (2603:10a6:800:130::37) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.9 via Frontend Transport; Thu, 11 Mar 2021 18:57:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 165d45d6-5482-4c65-bcc4-08d8e4bf7470
X-MS-TrafficTypeDiagnostic: BY5PR11MB4209:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4209DAA25E31063BA445A6A9F2909@BY5PR11MB4209.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Q+xxKfGnv1ISTyH1m4LufbHzg/bP6oa8pcN3cm04P6H1aZKBoy8F4Dm3qxObGEQnI2bBnObQdIMV383y5RrIoEgZYwbUIlYF8c/3Wj39wXbDQHd0T4TdpAqkpyaspdVfhZR5R6dMG8Fkc2W5ZfsYD7NSu9spsbM1iEFm3l2zzHKtqWVgz+DggZfUdnAjMlPnXRPGEdc8ioJe/m7Dpcuptj6XI2T52bSwwrzdQ7X7Lm0C+OZWzVjmfbRyL2U46dXuPih4iUuvgNZqeEE6fJ6XB2DJ303NF9CxyrBiUXpikz+SMpiOlON1+BDjHxBQm3sPOgi1glg/1pITUwCzNHMYZRsWiCg0Ea+eceHK8tbJrsUpLDxmBRFHPBx3Ywwqhg+0Wx77Qcm8druCNgsvNHANnOKgB0yDFoy9gyXR09b4w6qftSqOPGgUIUuBRHWYkJ3x4LcnbNKlEKhAuXKdct42Q1oDJwWpmaFr0GcN+XOSOQRw+wDXhDkHIXoi2OzbYOQssEESLymqvB6SIjTnp7mKeFXVuaLvUNM2RsXE2/oGq7+ZLolhWBVQbFDYQ7A4eWtpgaSyYCQnylKAfT4i7QiUdkMQh+PE1GoQvxViNVvxDQYK6CRsy17gYN5NWx4q8hHqczWw3n8DbzCwEaCTKKe87oDiGfQDsfIAjzsIiD5eYs8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4989.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(136003)(396003)(39850400004)(376002)(8676002)(69590400012)(6916009)(6666004)(5660300002)(66946007)(1076003)(478600001)(186003)(16526019)(8936002)(6486002)(86362001)(26005)(6512007)(2906002)(6506007)(66476007)(316002)(36756003)(966005)(956004)(66556008)(44832011)(52116002)(2616005)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?5F2czuiNQPaahUrQR5o2ez+Tfib3uvhxEAr0wkOHq4emgXy+k9f1zITLXZyx?=
 =?us-ascii?Q?l8eiGZ+FawJCelgSF/q0rH6hOsi0uV6UdXj5AT+lcN9yujIdegk/4ZKSIlV0?=
 =?us-ascii?Q?zPiy1Nv8bevfZoFc11MSpxAgqrSFAjqQ6/+grJXFEEIz3yJAqf+z/nCkx1vh?=
 =?us-ascii?Q?hSFECzbD9oWp+YIpcow0kh+SZpic9aWWb4/aOan+3HiyMjImsFrLLDIw56MQ?=
 =?us-ascii?Q?YxA0j3jPWtUCGksPKwTmh1t1Zq7Ye5YJycLjcZPGypVZnMCCljPtNseIQ1v5?=
 =?us-ascii?Q?iME2VJWL5Vm/REsP/o4NDEJZa2StnqNEiBVOjjHVzETmD74RhmPMRvRDdXvK?=
 =?us-ascii?Q?FS5dv2Iy6LOTbpVa3TrFPy1JIN3Ttv/OsMBDDe74stSyJQ8qqKlswcU18Efn?=
 =?us-ascii?Q?/cbLFNzHtkODpvWSVB7pbXFuYRZLo+xmvBRqS3lmUOPbPCYp42lswVcNYQL7?=
 =?us-ascii?Q?MJurd5+44Uqf0NLIfU4sywE3He/QtLyWqm0jyFcPq9fWm2IUM83omiot2pxA?=
 =?us-ascii?Q?BsQ3jjtgVHh4t1AUG7qYVxCnoQGdn7IgIsUQ9nBLmMAavA0KGhnSCM70jKjb?=
 =?us-ascii?Q?ev2J5CMpVR/kC6gr3605Ga1LYfnXAOHkH050gfwTvHOEjVOZkmSTdiEgF93u?=
 =?us-ascii?Q?FmV8HtQgK4z3UUH3KR7s4NTBQdnhvJV3nvcQBADkzlfqMeddj2Eq0XFlBiWd?=
 =?us-ascii?Q?OiOL/RuJsx+Je/suPwhNlJ7INW48g+M0S+XqWOjhrc482yhleoYEZe8WwqWd?=
 =?us-ascii?Q?h4wTyUSBHjgXgP/4O9F5vcL8DohUc/U+990UwYYQhV2X3dKwI4kFJ6y1Ejkn?=
 =?us-ascii?Q?uKUprzmwV0ebSscEJwtkm6m52LqO0REwf1yReUmL6aMxluoJx/s6ycM48RLa?=
 =?us-ascii?Q?v/6gj6btQiJMnRKH0d2yxa23Sj7V/opHuRIkUKmBuB8f7g94YzJNLCbcf5Xn?=
 =?us-ascii?Q?HKYPPp1Bi0hqeH3MGZLpico4VgeTMDJNzRMih16uaFMCunMnqQi6LVySO6Eg?=
 =?us-ascii?Q?MqOzRIaNpTHmNes4pW2SbP/Agv04Q5Tvi/XcXClQIWgc7AHZz6wvikNrXlov?=
 =?us-ascii?Q?AdPbdkokzFLNQA2TCc9B+Jo+FAb2k09W8SeAU8kjKFfZL7GTUfhasemOJt3H?=
 =?us-ascii?Q?jc89uxE5xiwKF1rw3ZooqtN7H7fgTNoyURUwtbBEC9Yq4lCM3e0G4jPNQOUX?=
 =?us-ascii?Q?CyZpKckqTz31GRfyGr9VSLdRZVvHzkvk0fbeBr8GUQyKvC1erRXe/UjWrDbp?=
 =?us-ascii?Q?6ucrXKDbtkUHZ6i1XiA7v8Ep1+5MTSTqd+V/CbkgMrCGeqx3lIvfYUbGFbNg?=
 =?us-ascii?Q?Y6ghcMG+8qlhB0cgOY3yuR4z?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 165d45d6-5482-4c65-bcc4-08d8e4bf7470
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4989.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 18:57:02.1305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xnMB9cDhIGxjgIdq6PKfWKX04U2kjY66rKDZDr13/eAzyFmfExJGAasqCATr6lYW89cWpJ26kb2EUPvMnoerWR5h9khdSwgUZmRWtt/WVg0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4209
Content-Type: text/plain

WARNING: quagga-1.2.4-r0 do_fetch: Failed to fetch URL
https://download.savannah.gnu.org/releases/quagga/quagga-1.2.4.tar.gz;,
attempting MIRRORS if available

Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
---
 meta-networking/recipes-protocols/quagga/quagga.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc
index 6df72427b..6680fec01 100644
--- a/meta-networking/recipes-protocols/quagga/quagga.inc
+++ b/meta-networking/recipes-protocols/quagga/quagga.inc
@@ -20,7 +20,7 @@ SNMP_CONF="${@bb.utils.contains('DISTRO_FEATURES', 'snmp', '--enable-snmp', '',
 # the "ip" command from busybox is not sufficient (flush by protocol flushes all routes)
 RDEPENDS_${PN} += "iproute2"
 
-SRC_URI = "${SAVANNAH_GNU_MIRROR}/quagga/quagga-${PV}.tar.gz; \
+SRC_URI = "https://github.com/Quagga/quagga/releases/download/${BP}/${BP}.tar.gz; \
            file://quagga.init \
            file://quagga.default \
            file://watchquagga.init \
-- 
2.17.1

