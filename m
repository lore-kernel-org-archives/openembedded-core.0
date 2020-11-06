Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.76])
 by mx.groups.io with SMTP id smtpd.web09.6648.1604631292742821418
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2020 18:54:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=VZNLsIE2;
 spf=pass (domain: windriver.com, ip: 40.107.223.76, mailfrom: yi.zhao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OKwAFM9X2zlsDLq60xwZzX+Q6sFa8D3eaGwiGXEUDPIqVNOcw7muH5TlcgClsJsUm6H5DKcuIqR6zxJ+fX5M87xDgzwlWDysF4iHvd0shH2tS9keLk6A7ZM9r0PYQKIUWI7bBaOzvA4F8HoaXxq4uDEUWXnnAPAIA8qE32BS7huRqhxCTFoCUgQFLdrRsQF1i8I9px2tH8feJe9WJicdDMdBMzb2aHvp8jaJwu9Jr12K/Ww0uZZ/SRFyCbysmLJfd3At6HTP4hPTzi9ugCTq4U3O0FbUzkCBpkKjCeuQ7VVmoeuf9Ofq6XojIcuZ0syQ4ka6wxQmRrHUdI/XkMX/Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZgXT9lPp9qTdcQfA/cbJUTgWCzL+RUe37jM2NiRfGXg=;
 b=b9WWYVYdWE+eiN+3lJTOyeIMW6aWZFzkeo1LeVNXrKsX3oSJZyPEOBpZBxIUfIULUL3cDKaRP0U27m6SJAgiLaMsYFfsFdE+rkDDfvCeUc/o15GcVfYW4iXhVkklHujP0hRibYrOo0NdImvK33Rq1jMBklLt+fdKL05mWWnQHBkpKzDLTjpz7AO4KMrYx0oDp+R0zjPzUL8fuVDuD55EHDJyNqfvZh5H0ZTBArO5Ii4bJpn3sOWNGMK3xy5ROyQnCOgqlXwv1nbjrW1kN6c3KI4AAiI326vsP3JDFRHKsJlHbJiWWlcm7sLE8TFA9zDp0RKiL7w7ywVPVO1kmfsb6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZgXT9lPp9qTdcQfA/cbJUTgWCzL+RUe37jM2NiRfGXg=;
 b=VZNLsIE26bpFrJgtHScL0rtdj8uMeSxJeJ7YhmJJa1kt2UJMBY3OcFUUGjhM0BsunRVgU8ymptqdtbBWc51H2mrDvqWwsj75HsrSaA/5g3JO83naI651JhsoTqy3UI+UYcK4Vow9J2iMadX1wbmKwpWG3OSioh2vQ2Z+Y8SyEw4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB0047.namprd11.prod.outlook.com (2603:10b6:301:68::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.30; Fri, 6 Nov
 2020 02:54:51 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::d844:ac89:6b05:ed98]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::d844:ac89:6b05:ed98%6]) with mapi id 15.20.3499.032; Fri, 6 Nov 2020
 02:54:51 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] dhcpcd: install dhcpcd to /sbin rather than /usr/sbin
Date: Fri,  6 Nov 2020 10:54:26 +0800
Message-Id: <20201106025427.7269-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR06CA0017.apcprd06.prod.outlook.com
 (2603:1096:202:2e::29) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
Return-Path: yi.zhao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by HK2PR06CA0017.apcprd06.prod.outlook.com (2603:1096:202:2e::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Fri, 6 Nov 2020 02:54:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 422a732d-ecfb-4e3d-9510-08d881ff54df
X-MS-TrafficTypeDiagnostic: MWHPR11MB0047:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB00471C5A16D150D13768F4C9F9ED0@MWHPR11MB0047.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/LEfjSZljaZptLF/YzkpHCoj1oBY3JWlLPfPiF4joNmNDJmZ19FGYVEnG7n4q+/C/lnoulNu4dbT8gNUxuReT1poHR8pAV9QAu6C1MsifVWQyEP2GxB5o0Ou6tgkk4baBtzniYOpBsVLTDBf+Ftbez9vrOaVfA+bpB6EHH28gwRkSzoSBPiXePMi5fRSq7XMBGJi6KA4Qw20p6+qzOKb3oTacQsjVJXlpm5JmbwK2p/9JA9dK1cVBizV33oAByuzNFj3hgMV5+3r0ecOmyjhauBtpCMG5TjTGc71jKQVV4PQBTZgLrq4sTUl9uc/U37AmEYdqM/Uggqw2Q4mRAodaQ/SCtfDCwDRxgJQKUVmFdRbPpvLG1quPqp8qBRzt1Oc
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(396003)(366004)(39850400004)(376002)(8676002)(186003)(6666004)(6916009)(6506007)(83380400001)(86362001)(16526019)(478600001)(2906002)(52116002)(2616005)(956004)(6486002)(44832011)(8936002)(1076003)(66476007)(5660300002)(66556008)(316002)(6512007)(26005)(36756003)(66946007)(40753002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	P6ENDiZ+UHpdauclce0KzP2qXtXnQtFJGa7ipgRi+uVDQtIvLd81P+Bd4znhr6tT+dSWTCPj6bk+e0+e5w51vwgiHWC36xsuIS2uMe+d4L7AYZNyic4d+tFluAoENtEzXNchFymnhRPTuXzpSELdaMgubjJBN56USvNu9uaPB9Mb3c5/HxdBNDHrAFZQM6lwtwTXwtAM9amXSLKGwJ2/IYO5FxMg2CaO9KLJTKzdu9TlEfKm7mVX16Bqc/eaNY3FrS3NS+nYAzdDpxjBPgGuA60kG/71CjqpNlRbIaBf2xjxf1mr1Lr8ewNsvi3AfzebqPunTMxJQTYCB/jTrpr+WXHOig20FmBOnrue3q+YAepUabOBT5gBLEpIUTlfEHID/IKNCKPAPnj4J7+E+1nzzhoP7ATj0h0fYIZ+Pe3LtdYf2ZdEn5srW1i0VS+tAxacRmpjXoQ/7HMvoaqjiuqCQCB/nrNGJvV09A0I3X470ztrAQ37wchvZuPx3vyBzIEtkM/G2jfz7Lq1ohoeyJyyMR7wnmizj+4hlcaBKFK4I3O4orZYseBOURRK1sBlx4rj/rjrNYUdVu9Hj7gXSRAt7LBnVnYsdpIoDLiUIcp6Bt7asKB076pNpsu9kaXURXqfFRdiQX2b6JsuUxB4bEpswg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 422a732d-ecfb-4e3d-9510-08d881ff54df
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2020 02:54:51.5080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XAajeO66ywrfrSUQqFDisz1CjlxVD2LzUDRm4Xe06zBrMaBPWUklr7lsZ/rPMaWZQIoYntyJkbDSQwcEkkK9Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB0047
Content-Type: text/plain

The dhcpcd path is hardcoded to /sbin in ifupdown package. Move dhcpcd
from /usr/sbin to /sbin to make sure ifup/ifdown can find it when dhcpcd
as the dhcp client backend.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-connectivity/dhcpcd/dhcpcd_9.3.1.bb       | 1 +
 meta/recipes-connectivity/dhcpcd/files/dhcpcd.service  | 2 +-
 meta/recipes-connectivity/dhcpcd/files/dhcpcd@.service | 4 ++--
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.3.1.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.3.1.bb
index e520115f71..c572868c7e 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.3.1.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.3.1.bb
@@ -34,6 +34,7 @@ PACKAGECONFIG[ypbind] = "--with-eghook=yp, , ,ypbind-mt"
 
 EXTRA_OECONF = "--enable-ipv4 \
                 --dbdir=${localstatedir}/lib/${BPN} \
+                --sbindir=${base_sbindir} \
                 --runstatedir=/run \
                 --enable-privsep \
                 --privsepuser=dhcpcd \
diff --git a/meta/recipes-connectivity/dhcpcd/files/dhcpcd.service b/meta/recipes-connectivity/dhcpcd/files/dhcpcd.service
index bbed6d85c4..6c967ddaf0 100644
--- a/meta/recipes-connectivity/dhcpcd/files/dhcpcd.service
+++ b/meta/recipes-connectivity/dhcpcd/files/dhcpcd.service
@@ -5,7 +5,7 @@ Before=network.target
 Conflicts=connman.service
 
 [Service]
-ExecStart=/usr/sbin/dhcpcd -q --nobackground
+ExecStart=/sbin/dhcpcd -q --nobackground
 
 [Install]
 WantedBy=multi-user.target
diff --git a/meta/recipes-connectivity/dhcpcd/files/dhcpcd@.service b/meta/recipes-connectivity/dhcpcd/files/dhcpcd@.service
index 389b076c38..845b83b9e5 100644
--- a/meta/recipes-connectivity/dhcpcd/files/dhcpcd@.service
+++ b/meta/recipes-connectivity/dhcpcd/files/dhcpcd@.service
@@ -9,8 +9,8 @@ Conflicts=connman.service
 [Service]
 Type=forking
 PIDFile=/run/dhcpcd/%I.pid
-ExecStart=/usr/sbin/dhcpcd -q %I
-ExecStop=/usr/sbin/dhcpcd -x %I
+ExecStart=/sbin/dhcpcd -q %I
+ExecStop=/sbin/dhcpcd -x %I
 
 [Install]
 WantedBy=multi-user.target
-- 
2.17.1

