Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EE8EC4321E
	for <webhook@archiver.kernel.org>; Fri,  2 Dec 2022 20:59:44 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com [148.163.158.57])
 by mx.groups.io with SMTP id smtpd.web10.87795.1670014783780197519
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Dec 2022 12:59:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=kvtovTeZ;
 spf=pass (domain: ni.com, ip: 148.163.158.57, mailfrom: prvs=9335fb5549=alex.stewart@ni.com)
Received: from pps.filterd (m0239463.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B2EaVZg013428
	for <openembedded-core@lists.openembedded.org>; Fri, 2 Dec 2022 14:59:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS11062020;
 bh=XnFUUOJe26wWeOTkEW6YlOZm4eH8GNPLLny5pWRa3I8=;
 b=kvtovTeZLO5HFdS9G8vvgvkql7w5IInIs4sxt4S0ilOX1FZjH5/5q8v34r/IG1eOxpKI
 p/yG5nHjYZw4xEbJblw2vHmov2PT67GQMScXTe7G59+sXXBWQDJc2uiWPaukgW7JMTSU
 Acf4L2mFwPEmmCCvAspWVtBddhDxQpIz7Au4mNndS2C4TPmVDdmHcnBLtgt40/xICgMA
 RRLCP3kaSdvr/3mkb9QruTTshFjknRhAdds6BqD8w0SWPDRzrka+JldBjwR8+uDmmI9g
 ym/jna7eMO+iWQcouUzAMtgPMKZyPmTKJZyf9jsPo2NGJm9n+qEJS9pryqJdU+PtXmxz cg== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0b-00010702.pphosted.com (PPS) with ESMTPS id 3m6k4tumpj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 02 Dec 2022 14:59:42 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OoCuasyhvbijhk+moetUAqojTZFNZs8vHS/iXfCbKmjJ7R/SiqnL7kFv7B7oynUqnxx2tHt9j5uESWKWEObf4VMfLofICTNOv2YTaiBH3UsI9ZmyEcnAK78+JIApyKvLMOaz/35pgk6C/RPhgSXOjcBOP/VdTcAYJeWZiprRd+YnzB8yYnTt90CI54HOFY3wES9R198QTnSaKVQGi+rFheEc8J+6Y6uEm4Bm9MLnlYwre1YSyMDokE8oRIuYsBdjJaU79snNbO4FklQzcrskscVohbSz+ZpgldsFpVX45WGtqp3X9sRPr5PaTLAlMuCU8DwVvZDJXFACgUvXb1zr5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XnFUUOJe26wWeOTkEW6YlOZm4eH8GNPLLny5pWRa3I8=;
 b=lMIwe7jrVNZR4AMH1amwkTq24MgnW2KwEBobEGu3Hk+ZAyebLphvXWWlmeYwbFQwkGYWnLgjH/pGKcOENheajmAqwwvUXRomt5Wmal9tLzaYm+IaJ2SDvi+TMgz2bLIj4mxq//DVwfRFHHuaGg7YPW423Lx65cS1fKO4B36+ee4KBGJBeHk8oKVcFCjOy42sIuIeHrE2r4/ItA2LwJ3wJlTBPB6eI51WxWxJxOPucTk1xULVqukQwgjklirjnuyo1XtjARyVECd+5eVxWAEGsNEDGxd8GmJP9Wv5egHgo3hoPzojSYBPW6W/AdR5SoHvwxIHR0jQDimKCm68qG159g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XnFUUOJe26wWeOTkEW6YlOZm4eH8GNPLLny5pWRa3I8=;
 b=PZQwnwh5JqJXfuVxNeKhYGATjK1bsOmdsRXG5i0PphBbsUonbc5adacPMWr+5WaMIZDd+MoBzxMMwhuZiJ2x+lM+CC/zTToqDNr9ZrovyP7vTbuxl4vFGniPSq3zK3Tp9h7G73RpEkivQ3ZealwKp1gXFVQosGxxKjhr3gLy1Ow=
Received: from SN6PR04MB5151.namprd04.prod.outlook.com (2603:10b6:805:90::25)
 by BN8PR04MB5810.namprd04.prod.outlook.com (2603:10b6:408:a4::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Fri, 2 Dec
 2022 20:59:38 +0000
Received: from SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::d240:66cd:3152:9511]) by SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::d240:66cd:3152:9511%3]) with mapi id 15.20.5857.023; Fri, 2 Dec 2022
 20:59:38 +0000
From: Alex Stewart <alex.stewart@ni.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Stewart <alex.stewart@ni.com>, Kyle Roeschley <kyle.roeschley@ni.com>
Subject: [OE-core] [PATCH] lsof: add update-alternatives logic
Date: Fri,  2 Dec 2022 14:59:10 -0600
Message-Id: <20221202205910.316426-1-alex.stewart@ni.com>
X-Mailer: git-send-email 2.38.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0173.namprd04.prod.outlook.com
 (2603:10b6:806:125::28) To SN6PR04MB5151.namprd04.prod.outlook.com
 (2603:10b6:805:90::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB5151:EE_|BN8PR04MB5810:EE_
X-MS-Office365-Filtering-Correlation-Id: 73de50f9-7c64-420b-91eb-08dad4a82014
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ISr0iw50UkbmKiVyLo3VtGHEn5L8cCuv8tUCuJgkIoM85OXfggmjPr9WrdFKbrgMrCkwqCTc+4hUBFKLHoop19CjZydkHHH1F5SgQS/HdBsAN5xri6WjN1+ZZRAzbekuwCxbMgC5el2NSDfsf0Rseyk6OdSkUa5BAKO9VusUW0aXNvjDfW+csZjtytEdiO1CfHq4w1IDdDC2uMn2ctYb3fxa6O0Mxsn03TPpL8WX8+nSP/YcsBMyme/4qFzE56uLj61b4h3af07tUIcUoveouwKIKeo5IA4hQpAsaLUISeaGwARrPQWz8fva6zBXEkEB+ddOq2KbBg12oorOsSH/RN9jgFzAN8v73fjwMC4ffvm5uaNn3D2YNWL7/5po6QSuo+zoz2AWEC9RNsnWt95hcdQ5XIRuY90c0OvijfVy2H7OzzIIKW9EiAItaFLq6qOiA7xy/cSPvVX0dA60rz+m9Uko5sYAWwskzs+hTHLG4rA9ntG9sTiWVxKdc5BLYhgb1HN7E2VO0So1yXmCl0LtXrX1ZiVOVyVxHIZZSfkm00D87Dwwr2ToVywaehLZQciLdjtujGU3h+5ED0ko+imjhVo3/f4yHY4Dqaa1cNNClD6vXsYjTM+Fy9HMF/BMEO+I
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB5151.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(366004)(39860400002)(346002)(376002)(396003)(451199015)(36756003)(38100700002)(86362001)(316002)(6512007)(54906003)(6916009)(66946007)(8676002)(66556008)(66476007)(478600001)(6486002)(6666004)(186003)(26005)(6506007)(83380400001)(2906002)(15650500001)(2616005)(41300700001)(1076003)(4326008)(5660300002)(8936002)(44832011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iYka9w+BlenLEljStbMtSycEmbbuBJMPh9ZNqlc/6d1Hq/MyzGl7+PRutMYc?=
 =?us-ascii?Q?HJRzhDA+PE+4t/xxNMjl9F6EaOM8ooV97hkE1t5Avh8JV1uRSm7+/KjoRZzw?=
 =?us-ascii?Q?51fOBkBcUOO6w1MzPAcdfh/IMJzK4tdtC+Nukb/eEOF8okoz7oRn7HZuWsIU?=
 =?us-ascii?Q?Ja+G66nAUS2OdHCY0bGzvIiNLg6pQs4e/As2lqRdueC5R30Z0m8IGRs0ZgCM?=
 =?us-ascii?Q?8oY+zOJQOFxsVJrilNoMKCnoqLoRLrrTPnNaSs1+/nVx3XOe7HxAbBQoFkDy?=
 =?us-ascii?Q?5pU5KhVj3KA8nObAxsqTZu3P2/dVDzHEjJ8fyqBaRbgwWebXXYBYRDLcDADX?=
 =?us-ascii?Q?hHbmSXbTHVAfwO9qzY2o7x2N6kUvWKHvJxQMMWKkLqkQqs2cT+XjRMgQvtTE?=
 =?us-ascii?Q?dagyvzBicx0PpTYOZwzQn0ibNejyCzM+GKVfrfp8BgGIM6Dj0SClOBsGrtzx?=
 =?us-ascii?Q?pXVbZ39NppqEi9Anx4DyOsQBIAeYc67ZF8C8ggdKJMOnakUSKhmRmMfGW1P8?=
 =?us-ascii?Q?nmpD4kco14D7sGBDksRkI9MfbTIiaRv+YiMbOADYqMG2zbdD1lxbpYoPcCl5?=
 =?us-ascii?Q?Z2iOuJTRfaFoGj226YO5NINVYK4mrGN3UQKz53BRAEWiv7KStydgQKUG/ZG0?=
 =?us-ascii?Q?6O8ZTK6Vg+6etylkQBwlqa5nUsiJQ5vz9q2aW5WD13+CaLcw73uqoJkWEtfg?=
 =?us-ascii?Q?PmFlxP8BrBe9kqcdGpP3OHFqLg34Pw5ZQxhBnD2zonUwZbaEU2TW8/XiL4sr?=
 =?us-ascii?Q?Orxp3Hsna6m5CiLuJSMtxiL/jv4Xqmo4vVcraVoLkBZfWi8mKtoP0audBF7y?=
 =?us-ascii?Q?dAf2bgPb9ee/fYDIuUdywxmAg4KedPvn7ypwKkfzPku3Z2SgqEPNzaQTDLWb?=
 =?us-ascii?Q?eJfIxgVhffm1lkMWzDSPyk++vj8Coy7P8n4RY1YSAfVVYDkg00cdrt/gZMOn?=
 =?us-ascii?Q?8Mv/SNiIZQEzkoml2fOIxEs0pYLrAPkaCFQO6bNg2lA4c5+bOsaBiY1bzaBk?=
 =?us-ascii?Q?Y6aOoV1WAyh78GlMb1PBfCuGSzbHGl4DXycgRYj2BN3IhZmKOGNdmVXBDBqI?=
 =?us-ascii?Q?xulQGGg3DRn/5/rivuTdlQIasenzHG5LJ3huNIW6dfZF4HgUZKbngIiN9s8X?=
 =?us-ascii?Q?hL/NTzVEVr1q3qvIaK56F2O3Vno1VXcgW32Udq5OLgTF6prpD2hfdmG0SulX?=
 =?us-ascii?Q?KF9qysP3SVTalsz42HFiFogmDaU/WW9ndvvHk2efELwnvPHdI/878fazHZ5B?=
 =?us-ascii?Q?PzCz6Qk+KSktn3piE08U0AhdX7C36Bfqb5GEqbGksldpp/yjLsEi4Ki7nly/?=
 =?us-ascii?Q?giNVRk/3ciAGRvrlXFWpgeYZp0UjBPUfuNtqktNO/DOnYj9n4hQCtmqC/pFa?=
 =?us-ascii?Q?XwJuEJVKosCl4hLAsfD5lyPKysUe2qWFAaaUbHVhsEqmdz7LO0z4dkwW4i4G?=
 =?us-ascii?Q?bJMxL/07axcGzfOKQraCt6gfWuHax4BW1/L+evoyLUD0dP6ulUzF2bDM2GhE?=
 =?us-ascii?Q?9Vqk58Sq2UK7yYKqQvNTcrY5/2P0cbfklVeIt0Y+5o91WJTs9Jn5P+Wx9yeZ?=
 =?us-ascii?Q?9xBAFEOUEbdG7BwR0n3sr9nKoWPyyjZt51bJYb5Z?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73de50f9-7c64-420b-91eb-08dad4a82014
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB5151.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2022 20:59:38.5409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A7cgdkJczgIj9FzzcCo97j+Q03d4uEXnzZA083mccBmFf4CFy0Lx+IyKLt3UQOTAG3RTgx4OS66VdBDmI2L3/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR04MB5810
X-Proofpoint-GUID: IqYIwlIMng7-Nbr9yevmhgjuk9iqBULi
X-Proofpoint-ORIG-GUID: IqYIwlIMng7-Nbr9yevmhgjuk9iqBULi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-02_12,2022-12-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy score=30
 mlxlogscore=912 mlxscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1011 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 classifier=spam adjust=30 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2212020169
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Dec 2022 20:59:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174245

Some distributions (NI LinuxRT) provide both busybox-lsof and
full-featured lsof implementations. When users install the full-featured
lsof package, the full-binary fails to replace the bbox-binary in PATH,
because `lsof` contains no update-alternatives logic.

Inherit the update-alternatives bbclass and assert that the
full-featured lsof package has higher priority than the busybox
implementation.

Co-Authored-By: Kyle Roeschley <kyle.roeschley@ni.com>
Signed-off-by: Alex Stewart <alex.stewart@ni.com>
---
 meta/recipes-extended/lsof/lsof_4.96.4.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-extended/lsof/lsof_4.96.4.bb b/meta/recipes-extended/lsof/lsof_4.96.4.bb
index bdd883d0ce..11de535a0f 100644
--- a/meta/recipes-extended/lsof/lsof_4.96.4.bb
+++ b/meta/recipes-extended/lsof/lsof_4.96.4.bb
@@ -12,6 +12,15 @@ SRCREV = "669c33a253e414feb60fbbcf2984c25dc413cd75"
 
 S = "${WORKDIR}/git"
 
+
+inherit update-alternatives
+
+ALTERNATIVE_${PN} = "lsof"
+ALTERNATIVE_LINK_NAME[lsof] = "${sbindir}/lsof"
+# Make our priority higher than busybox
+ALTERNATIVE_PRIORITY = "100"
+
+
 export LSOF_INCLUDE = "${STAGING_INCDIR}"
 
 do_configure () {
-- 
2.38.1


