Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FBC9C77B75
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 04:54:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.81283.1684126436700733960
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 May 2023 21:53:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=P742R6Ts;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4499d06315=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34F4qCl7017244
	for <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 04:53:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=ydpXJROQQubII5y4vces2GSMlxQ8nk4IXy+c1glhiN8=;
 b=P742R6TsWX+P+suaBKXzoZVRsx4kDt7u9UdEXliRA4JECHVz9lAO4X1Ucah4QxF6CiPp
 g3MXCFain/kQCenAF0SgA848sQSud+19UUrLZcSDYFfCflNlfbGkIBvFZeD2iuJK+6cU
 aEQFQY60gb/OruyLeMk0rt9Hyen7znaUcqAuzLjQuLhjoctpGSrs97ZNOaGFNEW30/ii
 FGsu+yZ3ipHt8AOlZCXwSRdTjzNfsrB9jUa2fIQKbGvvk0kOLhrcJC3qycMhgoV86r1j
 i/sD8tdqNKWvcmsWeLsJyaOHJazu7ZhHdl77exn6ASw6+iGNhh9apwTGdmIssz5VRYy8 PQ== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qhys01f8n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 04:53:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RSQDnvreY4ySipCR75Bd2zPv1DPSCkasZyFy0+3eEIfoLg9yBfXhupZGWOQLpvAcPayY3p5pdRgAHAp17F+70dK3PLeeSr5IUNFteufO9s8iNfFzGihZJ2bVJH+yiPgxpAjyTpUnhX4PInP3+DewUJBIflQzXyMocLmViNnfM58JmOGxPQ6ExZi0j2VoO0wNfU0vRJvdfbvsTLR6t0gZl8OhtQ23mqWiEi+0JTJljkxV4CWhvtYYDbcqNI/TfnCAkRxUUQBx/2E6dj9+omwLlSGpKYfJY8GPB6SbhVrwo3OhMCxLRsQbHapwvdGC4WUTnUeqSss+VbvxxWGG/PADLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ydpXJROQQubII5y4vces2GSMlxQ8nk4IXy+c1glhiN8=;
 b=fY8hp9gpHDYpwUscG8uuXUvfgFHbb+tkFyM937MI7icsrh6g5BZL/w6wIXBMTuo2aKDHT3zPTBuZooNcsD639zKIcAHlJyEqSmwnMDs7sIHJ8Fg1G1qCBVt92MUFrE/4i8637ALK6SkfqpsUTe4+Zx7KM23YAgATuqNYyD3Af8NCfoUEvDg/Zx3ntMFaPOITe4wMMQKfGYQRnqEuEY1RsElmeAsx13pF3OMyeW/+tGajhK/PBL2iUknxLl97BN9qzY444imfTd1Fqyri0X8/4w3Wy26QKLPTJ4HPr+URglLVz07XLRbvJMHnqFuNJfvpTMjNEtgbneIIlM+uwA5mhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA0PR11MB4591.namprd11.prod.outlook.com (2603:10b6:806:9c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 04:53:54 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::fa8:8cc5:a5da:7e07]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::fa8:8cc5:a5da:7e07%5]) with mapi id 15.20.6387.030; Mon, 15 May 2023
 04:53:54 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V3] oe-buildenv-internal: remove path from previous project
Date: Mon, 15 May 2023 12:53:35 +0800
Message-Id: <20230515045335.2025776-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0295.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::10) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA0PR11MB4591:EE_
X-MS-Office365-Filtering-Correlation-Id: d95ec04d-f787-45d9-e18c-08db5500627e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gWRwkn3dx7COuviG2sQBSZnVLWVI84/NIAEqWbZOrmfgLCsm4Tw0Q3BPspb2yb9NCbMrevZhm4C+ozcWqfzuoHT59pwb0pmOvLXjc3ZP/uqH6SXVuuFduJbuh7Z8u3MZcuQ+ZmP7Tzd7V5AWTiwXxQGImfb4fP/V0U1RFj5JWbTjkX6C16gpLQvz7c8ZSeI1tauz/6GgRqr3WtKwIKdXhLVPERvLUuavlnXbP3mklnx8SCblBZM86DgCNXpzdsslAgPnEEHCJVa2LB80srraA0coXAd1Ttyrbwwsm3m+A6NoTurqR+7oU9G3Brkd0vTz/EliVXjCipV9c4sdmrsKYAFcP8xyNxrAJ7M8V8UQJ08upJ262PL7UfCJYhUSsqXUX9aFdmSTJBlUoAuUmRes/VdZsI5CZ3vfTuwm1VPdOzYwxfo5HA7T4ajaXDC8t/YtqaHAjDk4Ro3ifDQdxbw4vYt5CgNHzcNbWUrrXXPRjzRGogoLKUy1oGEZ4rV6uQJduibmJxrKt77y6eBE04JraUVb7sMEkDXs6+d8GsDuVHOWCKaZuwpM3gV9D8p7zMd6pDUAWVX6HDsSHSxTOahWEr/9B9VBg4jAjsipH4BvaK9EE10IAe+iSdF6aWQk8gci
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(396003)(346002)(376002)(136003)(366004)(451199021)(83380400001)(36756003)(38350700002)(6916009)(38100700002)(2906002)(5660300002)(8676002)(8936002)(316002)(86362001)(66476007)(66556008)(66946007)(41300700001)(9686003)(186003)(6512007)(1076003)(26005)(6506007)(52116002)(6666004)(478600001)(6486002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fdtZEDB21dyImDzC6HNJ2nNp5kvlBjikKzuocslNiF028XLinOC7D0k1trkU?=
 =?us-ascii?Q?4JB3DL4kV1GUZv2Jy2zaaiGbSFnNykhZw5ryxvynnZRIyXC6N7kfmNjm5pdq?=
 =?us-ascii?Q?LHcRQGtUyXSfTO4lsb247nKAmbDHcUr3/k3/CpErW6fFHAW0+HPjK32tr99p?=
 =?us-ascii?Q?4e22/vK1TeGzSe1Ur25nF0sGmi0gvbbMwvRQKxOvWw04+O7JDlIIx0QrHZpc?=
 =?us-ascii?Q?GOSJjQs+NOO35cAwAl4sGZJT8mESauvQlNeq7JaOzNGW0qQUU2cN1rMcSzif?=
 =?us-ascii?Q?0QdE8Rp+m/tumLysxitMCRivI34njnboUI8/uwhUV/y384ATV+vSBBjJ6rtX?=
 =?us-ascii?Q?lVhOyvlGaz0Q2mCiZVJGqFCSfmkuFlKIrUqrqT0rXhkN07LYHTZpNHzW90qc?=
 =?us-ascii?Q?NYr2h5q6IX6ea4d1Xl8yzZFmRIN4KXOZr1qwmiuOTjrT9TG299AXr5nj+x6W?=
 =?us-ascii?Q?AgG4HNYcneXy94BYQ/QexoJM+R+997dSMuNx+6XgqtF9r7UR1X+kDmzIr437?=
 =?us-ascii?Q?pnCOB9XRmgc+WYRSRpq3w+MeWeZFPMH+siZCvl5WBy9u1i8oMPpnpHWCXm52?=
 =?us-ascii?Q?fXY/AfLT3ktJP/ldO8ShqgsNkSaevcpblz5JpleNyEXHgcRvV9ZW+5h4oyPc?=
 =?us-ascii?Q?oDzoyPeKZwBDouAnk2L6noYdgw9lZ4blAA3pc1/Nq6VQ9U6N3ikPI5jeuSlT?=
 =?us-ascii?Q?CNEIhzNyIqGl5racZez4VOSaxnk1kN6lVev2eJ/3+Eyk47un2gC4/q9Qr1Bw?=
 =?us-ascii?Q?syYpiIO3aYf3P2wkO+GQI207wA0naBaj1vJDsHmbkOaCgF3QD2fN26/y+BGZ?=
 =?us-ascii?Q?MYEf5P6OJ18Hbq2IJQ798ORfOWA7Wh1luUTzDkrkMsjzpiKRgnmzIe4pGBHt?=
 =?us-ascii?Q?GJLVVZPVxTWAzEPXYdYjH8p+ODUde8iOy2ndLYouWHcK4rTX8/6F9OIIwpIP?=
 =?us-ascii?Q?kMgw1gqiMWlDUzWuBindWNBf4g+qR+EOYB2Jv/eXxtTIUSkhIbZhwBqLwECF?=
 =?us-ascii?Q?8+GHb+cGvzhX+nqvpFuUgyGWVbrY/ucWfmhU5oWu3M+XEKxigcXQJOnRGY4X?=
 =?us-ascii?Q?RxWNKESJD5r2eDuguWWk5MkpoBS0Ta0jBXs10eJdJ0eDcQZcbYRbGLnO1bFl?=
 =?us-ascii?Q?PBIINi+PXQQsE+hIiHChnR1AAAh44pIMPODoKTXweQMMvbGJmPOrLX23B4WJ?=
 =?us-ascii?Q?pnP40dx037RNYE3wWWoEQtAYeHFaexot6bkUBREyspdAamI9avVbKPn2EzsE?=
 =?us-ascii?Q?UWyuGaQpIDd2G7SyOTQ8zjP9LqPppO7LTJCebPK94PEZqwCLMw5eA3igP796?=
 =?us-ascii?Q?YL5k68oJnePEWjrTq1ebhW1bRy/sRtkEBV/9bZynV2M/vRR4JL4oZqo2kear?=
 =?us-ascii?Q?cNnSQeWMwYmL6twZ2YTIWXOsmN6xvuCkfHZ+sN3cvgFTqZQE/xyAuVb2ErVF?=
 =?us-ascii?Q?aQH5eI5GD6esizabY0ikh/23gtuLRRqv/nZIy8N3IPZHHSUMp7YSeOwfVCKA?=
 =?us-ascii?Q?H6+F8Qp0fq5TEGgjTe2kUlfLORuthoMwrxUu7Tcrc9eHroMVqt0FnlnxYMJW?=
 =?us-ascii?Q?EaHVBylHFQX087J45vqLg4bekbaHj9gMmS65BkSU?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d95ec04d-f787-45d9-e18c-08db5500627e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 04:53:54.5398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9kxBQTknHE+uS7k9d8dOHL/GfvO8mW1xQJJqy8MoFVEeYVZtq6IIJTLpGoggN9dHugE4YC0CVCc1s4WHEOIVrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4591
X-Proofpoint-ORIG-GUID: 4SodvZbctGll6JAvYj8xt4u8_7t7Wok3
X-Proofpoint-GUID: 4SodvZbctGll6JAvYj8xt4u8_7t7Wok3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-15_02,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305150041
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 04:54:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181227

From: Chen Qi <Qi.Chen@windriver.com>

Util now, only paths added for current project are removed
to avoid PATH growing unnecessarily. This is to handle the case
of sourcing the init script into different build directories.

However, if we source the init script from different projects into
different build directories, the paths added by previous projects
are not cleaned up.

To avoid this, we record the paths added into OE_ADDED_PATHS, and
remove it in the next sourcing.

The OE_ADDED_PATHS variable is exported mainly for the two reasons:
1. users can clearly see it in the `env' command's output.
2. if the prefixed PATH is carried into the subprocess (e.g., a subshell),
   so should this OE_ADDED_PATHS variable that prefixes it.

Note that the paths, "$OEROOT/scripts:$BITBAKEDIR/bin:", are added
as a whole. A previous commit, "oe-buildenv-internal: Add paths to $PATH individually",
made the change to treat these two paths separately, the reason was
not "assuming the path to the scripts directory always is in $PATH
directly before the bitbake directory". But this is exactly the effect
of the codes. I see no reason why we should complicate things.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 scripts/oe-buildenv-internal | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index 485d4c52e1..f856e618aa 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -92,19 +92,20 @@ fi
 PYTHONPATH=$BITBAKEDIR/lib:$PYTHONPATH
 export PYTHONPATH
 
+# Remove any paths added by sourcing this script before
+[ -n "$OE_ADDED_PATHS" ] && PATH=$(echo $PATH | sed -e "s#$OE_ADDED_PATHS##") ||
+    PATH=$(echo $PATH | sed -e "s#$OEROOT/scripts:$BITBAKEDIR/bin:##")
+
 # Make sure our paths are at the beginning of $PATH
-for newpath in "$BITBAKEDIR/bin" "$OEROOT/scripts"; do
-    # Remove any existences of $newpath from $PATH
-    PATH=$(echo $PATH | sed -re "s#(^|:)$newpath(:|$)#\2#g;s#^:##")
+OE_ADDED_PATHS="$OEROOT/scripts:$BITBAKEDIR/bin:"
+PATH="$OE_ADDED_PATHS$PATH"
+export OE_ADDED_PATHS
 
-    # Add $newpath to $PATH
-    PATH="$newpath:$PATH"
-done
-unset BITBAKEDIR newpath
+# This is not needed anymore
+unset BITBAKEDIR
 
 # Used by the runqemu script
 export BUILDDIR
-export PATH
 
 BB_ENV_PASSTHROUGH_ADDITIONS_OE="MACHINE DISTRO TCMODE TCLIBC HTTP_PROXY http_proxy \
 HTTPS_PROXY https_proxy FTP_PROXY ftp_proxy FTPS_PROXY ftps_proxy ALL_PROXY \
-- 
2.34.1


