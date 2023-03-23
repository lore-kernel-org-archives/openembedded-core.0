Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 199F8C6FD1C
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 08:35:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.67679.1679560527514809529
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Mar 2023 01:35:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=U9iWiTg6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2446a955f4=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32N87YnJ015174
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 08:35:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=/XhbvAHNXhHKXwqMdxBhYyBYyZDZUfmtJG57DiKBBes=;
 b=U9iWiTg6r0evKOhGaroPjmqq1Z336ELpy8T3AOo2iZsQD5UGtPn3BEeKncUeisg/+8pI
 YCwDHLA5hgLnnr1RWYd0m4sQiZH2e9nZz4Q7KN3Op4llk+9iojOxv8CBBlP0CZ27oDpl
 lxEB5IEG8f+FUJJsON/cHMonePYbjIKyMu31UgCbqYf5QQ16hn/cpHB/oggZNXIWcWA7
 +9+4omwXYbHO7TEc2X80jZh5tyl92ATc21P4M9uneWT9mZxGR7ixzXxZb0VK9AwA/e04
 1u2N0N9QhWbsuzYYoKq7MAt4FVW/I6kOjPTD1eZm2jUZSDKtEUZBR08YfNMlXlx5m4OK Hw== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pfqsmsgvk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 08:35:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jsp6Rioyp6TUcswxaJPiSpeNg4tx4FRGOY5EEP/ZBN3H5f8+XmVIp/FsYF/qn7eePztRS5A7LIMp+YRgp0jdkuGrFxytiOkHI8a0rN3JeS5lLW1NB0pAOtIZUOYzQZxyO6/m/V8XYI8bQi5tLtu7Kfvp4lokjNFL9J1BwLrWcor8Tblo0UNddGZTcYzlQmGlu4LTY0Immp7+LgHeKzHhJ93gUnMbs53RN6VI4mWfscE7Ei6aLAkuoMuiMRzXi+JOpqm9sa7OSekMnV6lJYkU/GyXru0FTzxGC/WwOo2G63q6igEqU5/gvC53cElxg1knC+gwt48LofzNEKAbwGmR7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/XhbvAHNXhHKXwqMdxBhYyBYyZDZUfmtJG57DiKBBes=;
 b=mgIjRX5L542mwslS/cTvA31xaNudmADg61CFzA6zaGELVD0Felm77qVeLiAEWwH9l/BiBGp6bDzw2/oDHSU5T8ast3y26aF9rmSfpP7awNdl5nBY3mVlgXiwT8pXECLxJ6JayoXtW7U5Pt21w9NxvhyjU7ZH+o5x3tMQl2gmaZgdbRqFGaIfFOXLVgF5Yo49aFeg9qSSLeCmqQtvUmM4ecNBwxF7mIK/8S+GqBGGFKZScOY4beOHN071paWAOcp0GFcwscGZsuH0UB5yTsYwQkfRDN2JO3Ba+zjRsDCdODa1aZstiR6Y9x8ES3OE1kvVifvaiQEnNFPTVvo0M6cBBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by BN9PR11MB5420.namprd11.prod.outlook.com (2603:10b6:408:101::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 08:35:22 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ab37:4985:7b95:2b95]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ab37:4985:7b95:2b95%6]) with mapi id 15.20.6178.038; Thu, 23 Mar 2023
 08:35:22 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] maintainers.inc: add debugedit maintainer
Date: Thu, 23 Mar 2023 16:35:04 +0800
Message-Id: <20230323083504.3628-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::6)
 To CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|BN9PR11MB5420:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bf448b7-08f5-472c-5d1f-08db2b798a6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SMtmmMY24e3qo2e8isU9MC3ox6npHU9ESr+XJYMiVkw5IlevBY12GE5t41hVXIINStIwZ3w5ayyWbMyAUQxQOlykOBdUWUtXm1rAEpzEnCDkx+y2f3jG8PzdFjxsemU4+0WSFe4G4tMJkHzGUO9OV+rDbzTW1hA35ASqR+6+240jMMtaId0YjgJ3ZVZUI5rvQPDC7IlKd5ZkfxGkSjslYAM96OGau2QVtrSwzSu2vZ7mbp/URnGwcDU6ja1YxGlP9B9qqoW1ZPnAgjQxA64e9KYeqqH3v73aZ8D/EJiXZlFjdlB3Hp28Do8o4mmnFhyfKVAjoebUwc47ISZP+cSSGlz6hN5+OUBAstnK9oWmRH74eYnIpfeYtgKHcRavqa1kOXe2qPF+9E2GFO+2RHDzJ+uL63y7cELNoztsgfLpJjBVe7+Z3/PuUBjFo7jiHeSedCRG+CiPgaOoQOwij/55V0vqJNH4nN8kYp+juVIwkoCbEFfgWZbK7xiDZXbokoD/kUQnEuXr121aOBGL89Jz8knQPgE7aCvTpm1VqrYDn06PPb04UhjBEX5Wv9UDCDNDiKJqohEmh15Z9ESZXGJiN3gSv3H9ZaPHujzWHzhjB/4ajOSQ26sGLDxOG4/b2II9a30TtfT1NZOvXcu/bYg6qoVWPX9NqtHQptZuIN8fbTQhNPRhU2lkTUkHP9pbpZA9NxJSypGR+do3LMUz1zCzNQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(376002)(136003)(39850400004)(396003)(346002)(451199018)(86362001)(36756003)(52116002)(38350700002)(38100700002)(4744005)(2906002)(66556008)(41300700001)(5660300002)(66476007)(8676002)(6916009)(8936002)(66946007)(2616005)(186003)(6506007)(478600001)(316002)(6512007)(6666004)(1076003)(26005)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?StC0OEAOBqrKK+syCzBOGd7+/y1b9y2WMXNnx4j5rwf458PAZTWFgPOzW+wU?=
 =?us-ascii?Q?kXtpCOrLEsrHNZCveyXFwZF3kDHzB8gkexvNS1VJK4Y4o6OaYSWUDbRLU67a?=
 =?us-ascii?Q?lONcHzl5c3aaA/6t4IUL45SUDGSw2QFnjYXN0Sunf98F6+kRLOvnIxOecMb3?=
 =?us-ascii?Q?ZIYPM1fT0JjiOEfPBNHhqrViyurl8Du1T14Ba2kiAfbwPYgApApj8GNj2Wan?=
 =?us-ascii?Q?3nwauKKir8A7Z3F+m6hbccLjF9VyQFDQKLVcrR3A01sk7RHj1iTKqgfMyS4L?=
 =?us-ascii?Q?bKI9OKazie+d+EV6BkJb00YlWjcNvKUHNp2c32dF3IRvA0hxQibby+SKKrSO?=
 =?us-ascii?Q?qCwgiPNXDXjkXLXKhBLhyvRfCRVY2a+mz1To27nd5fnKo3wSFGP2fnTHFf+O?=
 =?us-ascii?Q?Lj+FKsDmBlbZkyA4v0iGCG3l7418dFZmpMVSkI/lFDJ/4ncW56syVBHhedZd?=
 =?us-ascii?Q?TXWcp9LgYVZl8sFbIxPb/0stdZ47aPTnlLsv6hnL/Tn2hen+NOZL/EI8EEhq?=
 =?us-ascii?Q?cPZvwLbihIoaM6IOGnfc+tV7LR7Wv0ymDk+kLfqf+saj9idWmWHvLVR3CUAt?=
 =?us-ascii?Q?y0X8FLuLHAC+OsOxX1LCDMTfZcrE7D9gDSv0/vC4GH9QjKXazSnZ0DnNDoT+?=
 =?us-ascii?Q?qOgDBCo0oi/TUglNCUWUHJX+Uq23zj/FGQT3t9cIDsZrgFw2EGY+InCwxttB?=
 =?us-ascii?Q?1OYK851sDY+aojC1vr7brDvhIEhfIF9f72yl10icfornuoHyBm24t+xbgKjT?=
 =?us-ascii?Q?RpcTsMhR5p9xkZYwVfbsLM+24gg1/sq4dchzGLi/2gLWss1mxccrI/xTRI2j?=
 =?us-ascii?Q?Yz/VUaGKOO3PTVV/UTYHLcQPdRnL2flyEeFSmOqtWh9p7erePfdi5hybghpi?=
 =?us-ascii?Q?EyJjE6NQwK7Ip+k+LGCLPd1QGECHApYb7SS1IDNijdPLl2ZVBRKdt7e0YGPF?=
 =?us-ascii?Q?RBdyrEwvuVYkeNV4BpwYNtxsFoRPuQoiRMhTgL4x82PVAcOXe/kcYR4rojff?=
 =?us-ascii?Q?y67YaKkYtlnlOasbvGMvaPIApU8+AH12O8MT4lfNiw2uBi0NbNjDbuH+do/k?=
 =?us-ascii?Q?iFkDPtPW4Cb/iNyT1QfqZbF+d7vHhhB16wwK2rRrirMGSWrsqS2T1bnT8wN5?=
 =?us-ascii?Q?qDENOlFq18tYJT1DsI7QG88WeXFyT4OcINp2RhJrU94WTUla9Qm1X1u4UL9+?=
 =?us-ascii?Q?jf/Dv7u9RecgylMIPLEgy902DJ6dT4+CZ2CgKZuFZGGcqwmQi0hxhP2g+uXs?=
 =?us-ascii?Q?cgO7JGMrjql6VkhfNnJPwP2Me1/Hp9pvus5aBmDzK4hmjm8/3WOJMxDRYLIY?=
 =?us-ascii?Q?1lvzRyrXvuKpnXc/5hZNZFZ//pcagI9++LHrzviG2LqNIfQpGE0fdJCl1RZU?=
 =?us-ascii?Q?y+7iCajv2ZbUFkKxSHCTgk9U8VqUqrwFFy7t4F992SL4VWzEFRAFwlR2R4Og?=
 =?us-ascii?Q?n09oZNw1LL1f2G8nMLmyTi0+cotbJvv662zXv+Jfx1AdqWry9Pn+x6kCFyNm?=
 =?us-ascii?Q?1puHMJtTNRevD/rh6aGaGjxA87ygF8hFBJTrkfGXiqupu10rBkkYhPlFEafj?=
 =?us-ascii?Q?bMmAvJxq3yBGq+/XZb6VIKWq51OKoMt+luG3bxZk?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bf448b7-08f5-472c-5d1f-08db2b798a6d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 08:35:21.9954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0+g/gIWk+EJ8LUq/GFCItHy8wA9xJrsJvYveOUR5WRTidnXTkDjuJEj462c0W4YsVc5fVnhtRmQo48/jbUlulA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5420
X-Proofpoint-ORIG-GUID: 2vGSMEl0BdCAjZJpFTxDZv3m9G0wT5P7
X-Proofpoint-GUID: 2vGSMEl0BdCAjZJpFTxDZv3m9G0wT5P7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_21,2023-03-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 malwarescore=0 mlxlogscore=909 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303150002
 definitions=main-2303230063
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 08:35:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178971

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/conf/distro/include/maintainers.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index c76447a25d..682ec2cfdf 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -135,6 +135,7 @@ RECIPE_MAINTAINER:pn-dbus = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-dbus-glib = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-dbus-wait = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-debianutils = "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER:pn-debugedit = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-dejagnu = "Nathan Rossi <nathan@nathanrossi.com>"
 RECIPE_MAINTAINER:pn-depmodwrapper-cross = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-desktop-file-utils = "Alexander Kanavin <alex.kanavin@gmail.com>"
-- 
2.17.1


