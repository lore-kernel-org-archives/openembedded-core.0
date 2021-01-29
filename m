Received: from EUR03-DB5-obe.outbound.protection.outlook.com (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.84])
 by mx.groups.io with SMTP id smtpd.web10.3824.1611884638625832226
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jan 2021 17:43:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nxp.com header.s=selector2 header.b=KwcpYsFX;
 spf=pass (domain: nxp.com, ip: 40.107.4.84, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eHcGzT0JvoLLRCQyq3ERCaywcG/judkqCOrp+0pQQeVjHiZLQ+bfuYR2HHLIS4UTqgHZ07Xnes1ROUG283zyCU7JrRq8tZ3qNELgYCmmaDy3en/zzGp1Bnd4Y1LUHHeGWv3HZRi8cSOYZYoDJgDRRB+MKXcoLfe/eUwL97sn5yzEnL9sno34NpDIYftXTH2YQ/3IeObmxCqtgqY63vES14cNNtXnfnjvc9BBeeB3LFMohp2F4k9ndwvzoXsTvtWT90G5h7ZVYhrfwheDrhm2urSfAVWKGIKeSZ3rkl2QA+OfDDHNmGaUncGKANGPnE59MDTUTYDmhWcIktgYZYqZfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mIuNW2ke5HT9J/zRcTBfL61qBOyAZojEQfHPGkkfCuk=;
 b=bqKZOt7Xlb41WR+LREWC43WS9AKhYyuuFGdgr0pgUpQeFvqGOdaZbfCwFtUPT7uFziB/ZziiVkdBazLHOXfKngJ+dZPNxRfpP0h052zMeo2npbqH9Qncq0IDyt3sqGUlizC0CQSu28Ab8G+5PXFnzw8qlokk5u9ZvUr4gweXjhoWVW4jEouyLQrPMvp8UjLF1+uSaivY2WcfdtHTFFJvcqPXFik9jbGFNPx28nU4XZ8cXR0hsefXTmWfzPsRKLsjvKatMAQ/IHze4lgr39aFBZ+vMQyWdBKrteNG2/8h+fLlGG0sELC4SP8zf+/2QBpGCzEuJnVjbBS0I2XLnNA6Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mIuNW2ke5HT9J/zRcTBfL61qBOyAZojEQfHPGkkfCuk=;
 b=KwcpYsFX8ARgJEsSoUSbW5eW9G0hOBFoGF1OjqP4hm4kiuY/1W7IPHP3uto8Aqusb73Nu4SyrRuTIuKqY7CxMOGRs23aIs7G9hZre1egI0Oie13OL78M18WOMcEFI4QIFM0bmVl/xdwy5xAOJ5GlXd/w/uPEkWoF2D+FKUQ7yEU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=nxp.com;
Received: from DBBPR04MB7753.eurprd04.prod.outlook.com (20.182.188.69) by
 DB8PR04MB7164.eurprd04.prod.outlook.com (52.135.62.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.17; Fri, 29 Jan 2021 01:43:56 +0000
Received: from DBBPR04MB7753.eurprd04.prod.outlook.com
 ([fe80::6d05:3fa3:ad9:abdb]) by DBBPR04MB7753.eurprd04.prod.outlook.com
 ([fe80::6d05:3fa3:ad9:abdb%7]) with mapi id 15.20.3763.014; Fri, 29 Jan 2021
 01:43:56 +0000
From: "Tom Hochstein" <tom.hochstein@nxp.com>
To: openembedded-core@lists.openembedded.org
Cc: Tom Hochstein <tom.hochstein@nxp.com>
Subject: [meta-oe][PATCH] glm: Fix packaging for header-only recipe
Date: Thu, 28 Jan 2021 19:42:59 -0600
Message-Id: <20210129014259.7985-1-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [192.88.158.246]
X-ClientProxiedBy: BYAPR11CA0061.namprd11.prod.outlook.com
 (2603:10b6:a03:80::38) To DBBPR04MB7753.eurprd04.prod.outlook.com
 (2603:10a6:10:1e1::5)
Return-Path: tom.hochstein@nxp.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv07069.swis.us-cdc01.nxp.com (192.88.158.246) by BYAPR11CA0061.namprd11.prod.outlook.com (2603:10b6:a03:80::38) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17 via Frontend Transport; Fri, 29 Jan 2021 01:43:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8a70a79b-dbee-41fb-b3cf-08d8c3f7572d
X-MS-TrafficTypeDiagnostic: DB8PR04MB7164:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB8PR04MB71641B3EFA1928162B1643C4E2B99@DB8PR04MB7164.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XhiPcxKbe2kLnhYOlIeubM4lI2ghhnqCFHpYD345UnzXCR0sURs5bL0WSImojIekz8dPt3bcPK6bQNrorY8/6n7HgzikAd+1ygwsSANeCCRSbYMlDATcy1JIPkH5tcPqTmrG48MgTOKUl4kvXX+KhF5hHOtd3LXOREmuTjPsoFx4S+vqmXOkDBPTlkqZ8cnMD+FL2nWHfIDC+l5HDCQpJcA6o1KIQUJbTAmhy6XkJxYokv99GMaEYugNWHQC2W3Xp5elrxTbiqC8Qn16Y1OcFO2BXG09EZUYfw9dFzyws0v/Dax4M2w0hEYXSEYWdN0GSgAez9f8L6xc128LPCp0fQMgauxkapJWr95xATWAd4xLGFdp6wZhMwEFKPXVCH97xtuuwKMqASXhLjrBVkTDTad3EYP0+BI/e7c7zcelxGN/UhElyQm4T2rC2APqM0B+6yPu+PcPfzhLlL9MzmKfBig/v8nvFveo6VkQf/sesN8cdNVXzbHHlCNYIs9KcbAfpX2IEFoTeJUUKANkYJpRRQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7753.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(136003)(366004)(396003)(66476007)(956004)(2616005)(52116002)(1076003)(26005)(66946007)(66556008)(44832011)(5660300002)(316002)(4744005)(186003)(7696005)(36756003)(83380400001)(16526019)(8936002)(2906002)(6916009)(478600001)(86362001)(8676002)(6486002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?BkTdjgLg8zVeiXKzrFejyJpQ1//SKhNgm6oo8ltIlewSg/Bf/Q6kUxZppY7p?=
 =?us-ascii?Q?yG3dl3CX3+7K+5DePOxgIqRr9CcSOk5xSsu/hulbz1MwAfMkrWhWqLni4vNA?=
 =?us-ascii?Q?OBBTQrOVslmKlVlrn/I/8Mho9YjVFD9vnTnYQNO/kk9BMZLnz+K3DBjO+NlR?=
 =?us-ascii?Q?MgMMi1ZnS1ggVduNwDwbL1uedpJo6WxFD2rTV/DNkrdkS4dTi2DdSOHzaDOk?=
 =?us-ascii?Q?PbIuOPFi+nfeyYH3y/rQovIc05bMhgaGZr5TuizBWCTJsRoa3NTfdsNTxVxR?=
 =?us-ascii?Q?4iCIxiF+Zg8AQqOLIhmLEodLkR8SZ6V9N6fqaVrL6n8/djcXAWU2MlLlvkWN?=
 =?us-ascii?Q?UnCu0MITVi/ofUmtxxVZAeb7gULFqCnr1gtkRU5q+o5/rX4j9ot+doPX8hwA?=
 =?us-ascii?Q?9aiLJvMkaM3qw5uSSj4FL9yIby2IShRarBC4y8zPONSMcP6XsMS+3jOrfP/f?=
 =?us-ascii?Q?Mt0pAjDKtriZ4awha2puJ+p8nR4z4lLgb0bJGE1WX+HtBichjZRCJYbpjzAe?=
 =?us-ascii?Q?TWU7fllkiZ9mPSdMSjGV2aXtsdTwr8ksEWBkc+ock9ibVDSUVooUFmNstO8I?=
 =?us-ascii?Q?l7e6jauf/O0mDndmQmpPP1bls5bwo8nFU56wz87pQTIdGo3M85TukGp0kzp7?=
 =?us-ascii?Q?vHaflZixA5LPXL1eEZW70wrsuGRkrt6bYp1W8ne2hj+YjcRoidvnvoCcTRvy?=
 =?us-ascii?Q?I9HqPRTHcEKIFh7pgbyhFnnfLxSEJBeoWsaDfCSNG9lb/2sshrR0aLqO7iLT?=
 =?us-ascii?Q?T88PvWydJPZTxq7lgas+3Fs5++8esJMlfLTRZ5USolUb51VBV0cpOpvrOf7i?=
 =?us-ascii?Q?d0a7Wz8Hic20xusquP1h4crPrdxtfFZqiiwzu+Um00ZVtVMcBLD8OnFWb3H5?=
 =?us-ascii?Q?7gEDf4V/RnDjEC6G5SK3ERl8bK5t595qJOV8nQVuDqpjdeFEcRx4I5nYbMTk?=
 =?us-ascii?Q?ReLlVJ8YjyDJwUoj1QquksZ/Z0F0/53G+x71zep8v8/YKGNB3zxI5qNGtvWW?=
 =?us-ascii?Q?+dF/VE0lA1Gpl9kz0o2UAAO9gR4yMsS+7CGKr1oNrUTZUnKlUhbb+C4f/D4l?=
 =?us-ascii?Q?FcnkNTN6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a70a79b-dbee-41fb-b3cf-08d8c3f7572d
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7753.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 01:43:56.4197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3V0Fdz2cp/m2Htw5bW0HYK1s+s0fN5lezDYX6St9IraFJpVROJe6c1EpwvKhRJVFOqpZg3Bqg+3M2OV5t8AFig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7164
Content-Type: text/plain

Set ALLOW_EMPTY for the main package to "1" for this header-only recipe. This
allows the SDK to be created properly when there is an RDEPENDS on glm.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 meta-oe/recipes-graphics/glm/glm_0.9.9.6.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/glm/glm_0.9.9.6.bb b/meta-oe/recipes-graphics/glm/glm_0.9.9.6.bb
index e2f4dbebc..019e6257d 100644
--- a/meta-oe/recipes-graphics/glm/glm_0.9.9.6.bb
+++ b/meta-oe/recipes-graphics/glm/glm_0.9.9.6.bb
@@ -34,6 +34,7 @@ do_install() {
 
 }
 
-RDEPENDS_${PN}-dev = ""
+# This is a header-only library, so the main package will be empty.
+ALLOW_EMPTY_${PN} = "1"
 
 BBCLASSEXTEND = "native"
-- 
2.17.1

