Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EC5AC77B7C
	for <webhook@archiver.kernel.org>; Fri, 12 May 2023 03:16:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.15757.1683861368283723147
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 May 2023 20:16:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=KT8Zt9iJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4496f8c645=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34C2wQY1006648
	for <openembedded-core@lists.openembedded.org>; Fri, 12 May 2023 03:16:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=t/LvWb//ZPXft06OwqzsideD8MeZLg2//pJWtFygVCw=;
 b=KT8Zt9iJcGj4NboG3Gpri6Ax97kbD1HdJWzT/dSOK6BeGb3jZQTXUnwbG32+22UH8OZY
 LhzgKKpmfAx8jMNPcKp0j1aFFJmNckAKWTcr4wqQG9VirjgkiuC4lQ7T6ahkpiONr6GE
 MKWqBAcBngLZqxPBQ10vstugDjQGA3PukAxUHtvJjZa401Gyila5QBRk8XFlRco4iT0U
 Lc8dxB/7NJcZqpN3lKCQCO26X225GOEoKE15F9J/3SKlyXYLYeF8av8+AF3eTLEbpDGb
 wcMc7WIad1zSz5MFSfyBg+Y1iyxMPr/AsUhO8u3GeDsTY5XVvslpjUWAvlur9pjonpP6 5w== 
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qf82x3bxe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 12 May 2023 03:16:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nyg7OSgJozutRyy+tKuTt0qDmcMGGt+5UWewcuLWSXSINnp8CyQop/PK5+i9YkooZjJe2naOBkj3uA5VI28mYpLnO7Cu9GDgFWi6/gqJMCrFJAFWTMGa7gen8zDwfI7kYYJ6U3mA/p9WCR9nT9kxS9oFyCMgBu7HFZc1XE0S79O2tZ5+PZ2tolcxuuqZ58kKmumebSPsSG/WDJ+LgtxIIfCGMkW1HK5zvIr5Pc96DldAtyQ5CqZ27h3sIMHFIGxb5XnIZDIXJFnhaCUyY27IV36WGe6IWAkBXZJ/U/cTsGftrJxn0+PsrZ5zjdJy+GfrsDIc8hPqzcZTfJRi3SwE6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t/LvWb//ZPXft06OwqzsideD8MeZLg2//pJWtFygVCw=;
 b=Una1Rp0XsUp9sb/wPuCL+ZDzmyVeyyziILYMF5CkrXFbM8rJVdYUTO872PDmuNwlKoU7HcLs2FTKCMhz3wOq1/u6rq4NbQsl3y4iHg9wY40fHNBYGLLbrwBvXJ3adqNKKl7UcfRg82Dfr1FSfBVNUOC8qDUMbFd5PSzkkPPNT625X34GeEeJZSKGF/UdQUVsYMiMAmKM4PE4VwsUBJTa+KbzxEXcW8sTuzCDjSrqMimRB43Iz36TH1k/RYhhJauJpk4a6njpds8V3SibBSrIcRkYyBHJtyuqRv6L+xdql096VT/alObLt9AohQ+AXmHX1cEvt2W6B6UkEuabVIaevQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA1PR11MB7756.namprd11.prod.outlook.com (2603:10b6:208:420::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.23; Fri, 12 May
 2023 03:16:04 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::fa8:8cc5:a5da:7e07]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::fa8:8cc5:a5da:7e07%5]) with mapi id 15.20.6387.021; Fri, 12 May 2023
 03:16:04 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V2] oe-buildenv-internal: remove path from previous project
Date: Fri, 12 May 2023 11:15:50 +0800
Message-Id: <20230512031550.1715288-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0045.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::19) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|IA1PR11MB7756:EE_
X-MS-Office365-Filtering-Correlation-Id: 714a1974-5af3-403c-3634-08db5297382c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PI7Uax5sA+MH20JJv7mVDBiJjQWYKyuteNMoB3peKvVqhj1dfXMZQBptx3MYNfnD3daFfAqIiJgy3Mwf0xQ84dY1iWjH4DUu87Q/maexpI9TcWj8c8/egFV8zAg/t6WDUe+ftWwx10/OFtgupvWCqS7PH4JSUfRPuWW3mW4S0c7P2aF+JlBcJ9CuUTe1W5C5uMggCnJFPnAGbi87HHvfBj9rK8bckqjaZeYLH4EIRlavZW4yp7HEfhU7V0KHEuTccb8rADBeqCES1xdr50iXkVIwJRqSJvSEGF3f9q23yhpeedPmlN2CIbpiYG3hi9JSWKD0pFH4JDE910ACDbPWcFekjT1ZswXaG6Es3AV7Wt0CIty8AUmBvoFucvpoOlGNVpkGRNkOL19Tn7ZpKt4vRJ1lW9SOA1JJNe3Abfks6i1qrN1x+WX1oMy84YqDh+uo4UCdlbXO3T4McF6e4aEmlHO0+HAQVyiprpb+yy3VzaXy/OIeDaOQGb5FJfo49uJIZ2DhtCywrrJSpS+SDRUy8ynaTo4HL0n21JHfCOrJFY2NBEwpRtGML1pdqa2lmFpV3764tW5taguZxmNc3mkqFFuqWGDCYdsUeCBC+3C2cQWd6pSLqFsRWGjFZg5O6AFO
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(346002)(396003)(39850400004)(136003)(451199021)(38350700002)(38100700002)(36756003)(86362001)(5660300002)(8936002)(8676002)(1076003)(2616005)(9686003)(6506007)(6512007)(26005)(186003)(2906002)(66556008)(66946007)(66476007)(478600001)(6916009)(52116002)(41300700001)(6666004)(316002)(6486002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rpC/aDxr3b5Wgv6iJS/6JalMNKvUjAw2CfS93N2rgicvupx0hW4ap5YXXWUp?=
 =?us-ascii?Q?jZRmUMr1vkskGP5AQRJhpmcgwEscsiss4DfACf1CVMI0zZosZv3BLjt8n6D7?=
 =?us-ascii?Q?UAKkoAcRiYUZlXFfDq54Z6hJlL3M7VhsS9Ff+wj8Qizjh52dSvpMRYuDLG7o?=
 =?us-ascii?Q?HLHaGD8+rBNrFcy9y6sJQ+v3vUf8c7l62ardjquwBMRP3iLvTH0Ile1koNub?=
 =?us-ascii?Q?YbiqeseE5PAD+tEEzVKxeAPOkgIAtGEy9BQ1G2ZoCzqXI6ehT17Kghyg73yV?=
 =?us-ascii?Q?0KZQbHEI4vrAtaYcD9Q/jFipAGO8wthknKJtBusEMxjl3QWFzLrNRN71//2V?=
 =?us-ascii?Q?D9Ii0OmB7XDGe9xzhIwF4aoKsw9ki3e6epAubnPdn2JRcbHfgk19wAUhpNMv?=
 =?us-ascii?Q?fM3SISHIk9RFAL8v/OVBRgTgr0Pe/QJMpCIE8D1EVLOuBfLcIgyzhsSo8ezO?=
 =?us-ascii?Q?rCrUyBy1ItrHHFZ16ltCWkWGtGj/T6qRq3s2aw61jrPiogpfA39tDMbyj9aY?=
 =?us-ascii?Q?Ujf1eRjMcSRgxQSia4SvZkpl4YPQQGLWIlI6lyDamsvw30INt1IuE2PoTMht?=
 =?us-ascii?Q?BThgVdPZ1H+Iiz2xC2ktznWHfYfF4apSFlj0AyM1FnZiFcVBo2F4tH0I+F/7?=
 =?us-ascii?Q?q46wFeIaTxBRqNp+hL/VGN9yQPffzA2ON5wrk6bYSEWKy25QUxR2SlhpeQBf?=
 =?us-ascii?Q?11DZU52MZdAIS0B91DAs5fVSLnobmklSJ8WirEG0/HxxH/vI5hUh1Yj/jpei?=
 =?us-ascii?Q?SbHmKMdSKFcAp9gs3N0ffrnXqbvkm0jJz2kte2C1CmhMIiPlQOYn1Pg/CAMe?=
 =?us-ascii?Q?9Lw8W76gpa3KefLJ3hkt8AJVAvn3tCyTOOyE/FpKKsustbhGqim+UiEwoYpy?=
 =?us-ascii?Q?LC75ROcAjrDpWElS2yDB2bbUGb8DUmbRTWDgMaJ2Jn0sgyBXTmDLyF8BEl7P?=
 =?us-ascii?Q?ANm/K4qJB+N+vIj0R5J5x5GZnlRoD5IblgcvpdKrWCvWplMHFkQR/wfxFgVv?=
 =?us-ascii?Q?KPhOcRKD01FuxVSnOlVsvv3uVu9dw2EN/9OV1ieEEf/c1qUAdsI0JrGS7bU6?=
 =?us-ascii?Q?DOSqCvbO9/G0H5EXioTGWMmNNobpsPxbnaxvizymvTrTR+fILIlYUDRQ9hJD?=
 =?us-ascii?Q?8zD3hJWD30rOGKwlMUjFTsrzAHE1XitLOsg9OKGrMvY64J+YYSH8kuJwaHPv?=
 =?us-ascii?Q?IlCQCWPKVARdD7tLeFC91yHDyCcH3l323IEH+EDM34mNP9WRWO67BSPjt3aU?=
 =?us-ascii?Q?CKkfgr4rW2f7s080HH44VTlmXOpLR1ooaNQbCg8k8gabm0/55sDVU+goWyQM?=
 =?us-ascii?Q?qd+nAmFe5yeu06ZTjy0A5ywDNmMkl/PZvb1/dp4xqjOrGjhniGj0QcAZbj95?=
 =?us-ascii?Q?hUkjJj88wciKpi7T6N2wu/1idt6kgNQdngJMX2BIjpSxHWFWA78Sdxz5T2IC?=
 =?us-ascii?Q?9j0yZUwyCH7uoQiCakn3dqCwEWg/mAOS1uPSPGU/VQ4YyzcjR1F5f41eqQeE?=
 =?us-ascii?Q?XA19wq0q1jnAWy1VxY0Olll2NH1AaUJ1Gy76PWOBGcZ7bwcVoUi2G7aKt7fA?=
 =?us-ascii?Q?uH3FICTJhpVPPvYptPW1sbCXpPKXWEiH5F9A5Ghc?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 714a1974-5af3-403c-3634-08db5297382c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 03:16:04.1309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RyYOD1aFOwSm93xUAtxWav6XurqGFfBIb+7Msz4tCCWsFuUOwl6vxg3ZVA915RQwGjmP/w3Cc7UFHej4n/mYNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7756
X-Proofpoint-ORIG-GUID: KHMbDl-8ZAsuUyMPpwmtTykqYIWxT-cf
X-Proofpoint-GUID: KHMbDl-8ZAsuUyMPpwmtTykqYIWxT-cf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-11_19,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 mlxlogscore=958 lowpriorityscore=0 adultscore=0 spamscore=0
 phishscore=0 mlxscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305120027
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 May 2023 03:16:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181173

From: Chen Qi <Qi.Chen@windriver.com>

For now, only that paths added from current project are removed
to avoid PATH growing unnecessarily. This is to handle the case
of sourcing the init script into different build directories.

However, if we source the init script from different projects into
different build directories, the paths added by previous projects
are not cleaned up.

To avoid this, we record the paths added into OE_ADDED_PATH, and
remove it in the next sourcing.

Note that the paths, "$OEROOT/scripts:$BITBAKEDIR/bin:", are added
as a whole. A previous commit, "oe-buildenv-internal: Add paths to $PATH individually",
made the change to treat these two paths separately, the reason was
not "assuming the path to the scripts directory always is in $PATH
directly before the bitbake directory". But this is exactly the effect
of the codes. I see no reason why we should complicate things.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 scripts/oe-buildenv-internal | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index 485d4c52e1..598120a86d 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -92,15 +92,13 @@ fi
 PYTHONPATH=$BITBAKEDIR/lib:$PYTHONPATH
 export PYTHONPATH
 
+# Remove old added path
+[ -n "$OE_ADDED_PATH" ] && PATH=$(echo $PATH | sed -e "s#$OE_ADDED_PATH##") || PATH=$(echo $PATH | sed -e "s#$OEROOT/scripts:$BITBAKEDIR/bin:##")
+OE_ADDED_PATH="$OEROOT/scripts:$BITBAKEDIR/bin:"
 # Make sure our paths are at the beginning of $PATH
-for newpath in "$BITBAKEDIR/bin" "$OEROOT/scripts"; do
-    # Remove any existences of $newpath from $PATH
-    PATH=$(echo $PATH | sed -re "s#(^|:)$newpath(:|$)#\2#g;s#^:##")
-
-    # Add $newpath to $PATH
-    PATH="$newpath:$PATH"
-done
-unset BITBAKEDIR newpath
+PATH="$OE_ADDED_PATH$PATH"
+export OE_ADDED_PATH
+unset BITBAKEDIR
 
 # Used by the runqemu script
 export BUILDDIR
-- 
2.34.1


