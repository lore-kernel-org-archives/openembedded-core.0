Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.79])
 by mx.groups.io with SMTP id smtpd.web08.4900.1603337264262758786
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2020 20:27:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=OTcGURJe;
 spf=pass (domain: windriver.com, ip: 40.107.223.79, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gGsrTRRLXsSMIm4o80BWsVy1t60jiJchkvHayN52/43EAsSqU2+GVMOtEB0CW2sanUyIgTvFiHxfTRhuJxDpO49IiWGJm7X0vBFlbYlkN01Z0Rx16Ps80WLOe0/NN2eKalmFZxPnIeraPYR4BuNcPDs/l7EPKg6rpoYuBkyGDyNRCjgxACwLZQiSiezV4mnIlmTME8DQF77m6AtSELuXXj1GkCwNsAdrWEt3eREy0nVDqRjnWndInHMm9mitIYULeRtrwq0CP1ejUlxGOy4WWdDtN4sy4NBSBZSj9KhSMxQxncWcKi7LzYiD7YHGvNAK9UQcz4YMsW/RY3+S+T4B9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mmfWC8WLZpN8ITTC45RzgGwlKTiVKug75JwV2Ubv7pY=;
 b=KUIpPdVSPsXM37qEipwu3WMOpN83dnE4f5T86oKQE+OdSPcHCfs1JjO9reXULzNWkpBANLhqXQsx/YSz/bJByACjWi6c0+M2gSlQtVHhXIPsAIiv0q4fBT/RdO7r9TMKhpZPG+EixWo/933Mekim34zh7Qe/spfS7ihr2xyuqBZznG6AbTxAHIRzP49l4WMTFsl3LvV7vFh24bMealMp4bz3kxhNwsD2DvUwJn603juzifPLKEvd1q2pffCofeznRkUqolbF/KqdoJJkGBWBNPWTqOLWZ+gfK/7xlUuMY8mBOX+vPzp/pe7UO6rp60se14Ob2dWfsvc+Zf63WiIYKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mmfWC8WLZpN8ITTC45RzgGwlKTiVKug75JwV2Ubv7pY=;
 b=OTcGURJeF6eTfzr1OW0uLiwiYOnj0OpLTGwrW03RAmNsbn96NuWL7Ae3sSs8vs3NB1BEjt8A+9UdQOkB24TNqocVGdXq2SpZb8dGHHzjZKsJAAF5DP/F7zNipIN2eadTkJAD0CteAesbvfkYwJTnjVu/gIBq8Fo85ECwf5FE3t4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB2598.namprd11.prod.outlook.com (2603:10b6:a02:cb::17)
 by BYAPR11MB3608.namprd11.prod.outlook.com (2603:10b6:a03:b1::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Thu, 22 Oct
 2020 03:27:42 +0000
Received: from BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::c400:8b2e:c0f8:55bc]) by BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::c400:8b2e:c0f8:55bc%7]) with mapi id 15.20.3477.028; Thu, 22 Oct 2020
 03:27:42 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: openembedded-core@lists.openembedded.org,
	martin.jansa@gmail.com
Subject: [PATCH v2] tcl: adapt to potential pseudo changes
Date: Thu, 22 Oct 2020 11:27:25 +0800
Message-Id: <20201022032725.32268-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <c1d1aef4a2b900c727360463d929730d671d7f81.camel@linuxfoundation.org>
References: <c1d1aef4a2b900c727360463d929730d671d7f81.camel@linuxfoundation.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: YT1PR01CA0064.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::33) To BYAPR11MB2598.namprd11.prod.outlook.com
 (2603:10b6:a02:cb::17)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by YT1PR01CA0064.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Thu, 22 Oct 2020 03:27:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1589cc01-9da9-4a7c-c27a-08d8763a6f17
X-MS-TrafficTypeDiagnostic: BYAPR11MB3608:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB36082DC4E7D90AA806445209F11D0@BYAPR11MB3608.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gIE07ZrxAJBtXIhkmhQF/rWubQZMPvxhk1lMindm1RJvIe+LyHvWf1zTvh0QGwBstqaAf2G2KH4t35Dtane5emwRQ2BsDhYkiD1QZckJZDT0LL7LyILNjzEavBVTKfidWbQTGAazVe2hC+NFiWwJVelQdj/77nWIwo5fHvFQMfCNdVMEdsCLou3BOxd+blBQH4rgiJRNkI1UzYVR4QhhAJv2GKMUwWKR6ZeYdUM6GAxeYEsLLP5fstAexD7kUBsqG1SHTAx/ix0bsvMUfGyGzBRdg+ioYbYwh26SRtWrBlMTuvpTlccyhz0zfiWm2ecsnv7SLeTUr/lcLTz9P5NYJwyXpFwbffphxwfv2trSm+WYXm+icA7OjU7yJBaNi9Zwf6QgHj9LciYUnoeVlUkCKw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(376002)(136003)(346002)(396003)(26005)(6512007)(86362001)(9686003)(478600001)(5660300002)(316002)(1076003)(2906002)(956004)(6506007)(8936002)(2616005)(36756003)(16526019)(186003)(66556008)(66476007)(966005)(8676002)(6486002)(66946007)(6666004)(52116002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	UlBQCl5/awbbReCv2JTJrXuh3ueUwOP763a6ssMH0WED5urQTmwr1HUspOajfMFpLjONaoLDiUs1KK+q+7SZLFSkzQHVTGSUQqDKKM0nBvXmyur+v2HgecVNO7u1EAK9uvWChDwanMTU4Y4Z9Q4Z3uZn+fvkwRkrpIvqPt+RTb3xSRxpyUPndZ5x+odBVhxiv8Q/okD3Vkfu68T5KdPAmxYfVlvzE3QGcH+TiLWlRw4FprwbjCXcd/szjV/cOsNqJnG/bMOCvDJZuJ/Uf58fVZOIsb3BBLgG9cHtWlfaLYqrx0FQP6vzn/Hnq/frWiwYdmRF8iUHeYqUVUI2W7OMttpEi2L2nVMhtscLCt4R5+7Q8RplN8GfuY9WjRS+AgqcEeZgxhESLAiqpXMtzoWjICrNbv1VRGvEEMWfX+bmhunblKVygf16pbw8UICVyCna/YuQMxWF4pcQtWgnFJ6PghrmBrkLs5120EgE2m4YHl8LmHXFrZCnHYxeEFLHITpuC2146MMeJaOKwhLzIccPR3DfSivqp/ZvLDJ0MPeCN6F9Ns7S+wuhcb5mKTVr3g3OYmZViV++ewf/bel1d499v2RsoO4CEMOVAliNiR5SHhF7OQ8r9LuLEkyS0GZR7jnQ27IleIkJMzGLiEpUh3eISw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1589cc01-9da9-4a7c-c27a-08d8763a6f17
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2020 03:27:42.1651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n/IriM10FKfyYRsSuIndQyvoyZC588TH1UORftLhWVQ2ZfEdhzfJP4NaKUnsh/g9UWm35EX6Sj6Ko9tH7cVfTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3608
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

It failed as below when rerun do_install for tcl:
 $ bitbake tcl
 $ bitbake tcl -f -cinstall
 [snip]
 | NOTE: make -j 72 DESTDIR=/build/tmp/work/core2-64-wrs-linux/tcl/8.6.10-r0/image install
 | abort()ing pseudo client by server request. See https://wiki.yoctoproject.org/wiki/Pseudo_Abort for more details on this.
 | /build/tmp/work/core2-64-wrs-linux/tcl/8.6.10-r0/temp/run.do_install.3490694: line 184: 3499214 Aborted                 (core dumped) make -j 72 "$@"

By default the S is ${WORKDIR}/${BPN}-${PV}, but after unpack,
the tcl source [1] unpacked to ${WORKDIR}/${BPN}${PV} and all the
files under ${WORKDIR}/${BPN}${PV} are acutally the source files.

But the the main Makefile.in is under ${WORKDIR}/${BPN}${PV}/unix
for tcl, so there is below logic in tcl recipe:
S = "${WORKDIR}/${BPN}${PV}/unix"

To adapt the potential pseudo changes, there is a general logic to
exclude ${S} from pseudo database in base.bbclass in [2]. That's to
say, just the dir ${WORKDIR}/${BPN}${PV}/unix is excluded from the
pseudo database.

But it's not enough for tcl, we need to exclude the actual source dir
${WORKDIR}/${BPN}${PV} from pseudo database specifically to fix the
above do_install failure.

[1] https://downloads.sourceforge.net/tcl/tcl8.6.0-src.tar.gz
[2] https://git.openembedded.org/openembedded-core/tree/meta/classes/base.bbclass#n396

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-devtools/tcltk/tcl_8.6.10.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.10.bb b/meta/recipes-devtools/tcltk/tcl_8.6.10.bb
index aedd96b021..e6feb25a7e 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.10.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.10.bb
@@ -32,6 +32,7 @@ SRC_URI_class-native = "${BASE_SRC_URI}"
 
 S = "${WORKDIR}/${BPN}${PV}/unix"
 
+PSEUDO_IGNORE_PATHS .= ",${WORKDIR}/${BPN}${PV}"
 VER = "${PV}"
 
 inherit autotools ptest binconfig update-alternatives
-- 
2.17.1

