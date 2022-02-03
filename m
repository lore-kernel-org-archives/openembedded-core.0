Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC13BC433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 17:07:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.561.1643908062988563315
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 09:07:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Ufdrhw4S;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=90331aff7d=saul.wold@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 213EpMH5032434
	for <openembedded-core@lists.openembedded.org>; Thu, 3 Feb 2022 17:07:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=0indfwTqivuPWN1tcqIbEY4uwdAPAG9bqewdYHtFm9w=;
 b=Ufdrhw4S6kPtKEeEpLWK7WczMuE4EwQTys5w3AxNEoKo8QPXapZ1iXw3ADqUeY8vx0jD
 QRoEYepYkkFOHgGcPl7JIZ9g11HC4M2eMx6bHlI/H5+qtuAivNEUSi853AzVCRP1/Hd6
 Q4YEacbOw57R7EHIKqLFLTlq6DZ+9baa3ARFMAHUlHyO5f1XMICB7YjZ5+CIN7+RGJAL
 QrLNQJwf9xVNCZkkFa3K7adPtB0hdOFuC/48H6ZbN8N3h2j70DLhtgfbZ9dlGMJA6Ac2
 vdzDa5OJYpW5QOmk+h+icwU//86B13WJQSfsxX4AI22yI20MNZgIICCOrxuthekwiJH4 3w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3e03e78jbe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 17:07:42 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 213H7fW2004352
	for <openembedded-core@lists.openembedded.org>; Thu, 3 Feb 2022 17:07:41 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3e03e78jbc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Feb 2022 17:07:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GARNEF0uUjDzgQsfMlZxP26S9romUyoFMaGY8YrDJLhlAyRmkr7v5m7dX6UtkUwijEKFV4xP5+Sv+EuvGfC4xJKA80muh7yA3+AylhFdJUZajtNXY+LuQk+gHV1XnVxNSp/fdMMLKk7xbexlVBarNQC9jj/Z7FWWnXcc2bQ68kx/NYmoXqemaxQ4HYuE5cZiR2EzLtTh1v5zhq8BTkHL4dD3y8P08PoInppxUXxFg0BsYjoeWN3wqp49CzxZFPVJ8pZnsZYUukyvV3li+JLcW0aqa6qmIdnWnPyay65/n8qFWcK/+P+8KjXfTgK7iA9ZQm46XlFACzCaEVY8+M4gug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0indfwTqivuPWN1tcqIbEY4uwdAPAG9bqewdYHtFm9w=;
 b=Qxh4INeKLmDpPY7oxQaAVuOkRj8ONCTWE1XfAMsoOSA3ZFyEN/Sd23pjzrPknYqy1WkC6IDRAitPxu4lHseu6RvXiN4mipKcQxdbLCx07uLB0prv/mfXnpyGOzhFBUH/U4zD5vuvp0gh6L0rvwkDSOIu1mCmJfZmn4lrvBbbBdHRPuzBiR94wGGecGYaFFaSiPMwQLPFUdj0JQRg37ozUO4vVtQc3rf5h5UJxi8vrInkxLHqLNiKaBjMby5syNmffTwBq1t9ZFV4tQaCaEOec8YrMtz7SDyR07qFLkiFfDWFGEXN0I8E9r0rSCz9RmP+u5BfKg9NvCEuLBTe+hwd2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MW3PR11MB4745.namprd11.prod.outlook.com (2603:10b6:303:5e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 17:07:38 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac%4]) with mapi id 15.20.4951.012; Thu, 3 Feb 2022
 17:07:38 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org, ticotimo@gmail.com
Subject: [PATCH] recipetool/create: Scan for SDPX-License-Identifier
Date: Thu,  3 Feb 2022 09:07:24 -0800
Message-Id: <20220203170724.1319808-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CO1PR15CA0102.namprd15.prod.outlook.com
 (2603:10b6:101:21::22) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0ffef36-c4fb-4388-a0f7-08d9e737ae64
X-MS-TrafficTypeDiagnostic: MW3PR11MB4745:EE_
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB4745CAB8CBDABEB8C0A3C5EAEE289@MW3PR11MB4745.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OqFuKcwprOeoaS2EOvn7wVJsmBe0iMqdz+P0KfikKeDO7eKe+2ymQfdv/ft7o4xOXF9ONh5x+MUljsaKnc31QAwcnEuMBpNh1FtlGdNkqHTQa2iwUXtUJSwGud0ttIwqL22pruVDeyPrAUwvuwW8xTpBrzqiWDxz1q07Q4xzoOJvjd47jtkwHvYCrj8fxtI3FQvrb6NJYyeJs3Y8Kf8kAErkAwsTSsgIbXbnd9RD5pVTL9a2Etb/zZ3iv9DCg0Rg2KzFDM9Okla/o1J/inO2fKchpkhhAkVaGlBw0thmPCZ+JRoxaLCIbxQ8z6WKkPHv6HUCYzqWpgIlYbct9O2Vk5An5KGiHSvq16/vlU6O/HVABARu6S/aNIGVyrWUZsJGAEXwhr9F4qZMTcUfQaFY4M0e9yy8JHAZ4/dTyikGIvRcXknNHPuTBmh8beGeY5W0bfXhArfX4sR8YpmG+TXzr2IzSPNys1gOPa29eOBP82Cilxt5RMnbeTyedJF8SMY0dQs6DdZRdaBO0dHw5CNN+WPbOKipbHWlM629HsInhIiItVGLxaVIhGBlxDslttYeUchcz8Sq77UhexQsJTBmQurDBTqJy04OnOWMuLEdDItynkcN2sf3iUJj9QXwPgHoiqiHOtLb9JUzMeJscHeF9ORpY06ceLz671JHxSDQJh+AjJ9uoRylFm02tH06uMTkQgDHOUFawDlOCNIKNc4yNQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(38350700002)(36756003)(38100700002)(316002)(6486002)(508600001)(66556008)(44832011)(66476007)(8936002)(83380400001)(6666004)(8676002)(52116002)(6506007)(26005)(1076003)(66946007)(186003)(2906002)(6512007)(5660300002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zDv+aTiBRAtE2pryQFGejt9sj6GaQcJR60Kr1WKMeMEMbTwTyYGm8BXtH0RO?=
 =?us-ascii?Q?5CA5UfoOie0jDwCubnTnwe+8wGRP7sY0QPkDmpzYz9En2XKibRn55GqpBdnz?=
 =?us-ascii?Q?zKbEyQPbXPxE6/abaljGUhVa58lEHMasp4evY97IxSNooHCQcw/cRw4i3cxR?=
 =?us-ascii?Q?DohDvLK3sISk3f8SqhirFuDVgu520Qnr7ksrpYHA7M4ybTM8UGo9w6ORHWx3?=
 =?us-ascii?Q?7dBu8zATNNAE8m6E0WCCbEHfAfO1FXwkx/pacbQYJWRXd3/Dvn/gOf9KnJnJ?=
 =?us-ascii?Q?4bkRKeBvbfTALoBHwcdAauqE5dESIGDp2GNSIA/Sz1yCmughzwuDetv4dr3k?=
 =?us-ascii?Q?fnhDVEO3FEKTT2O0FU5izJMMWDK8Wjj+aVtZiC6yxF0U6Yl6DhN1cQjuVQv6?=
 =?us-ascii?Q?biXXJbeYYm/pFtf7NmKQXU+bGf6aRvBnUwJJboX2fMebPcGBgax5kOOl2Lkk?=
 =?us-ascii?Q?XGxnj9oXw5lu3PyUfpmWqfFp8oKP2xQBQFSMe+nON86o/X8cekG05IOMjH6b?=
 =?us-ascii?Q?CW25a/KIZVuiPQCX6ThB3aApRnx+z4NHKabJH3ywJvfdUh+BcVfqDcGtWKRG?=
 =?us-ascii?Q?ugBxxsbhLLvl5widnlh1aOng9VcLGD0PG+ENkWn+MuHd3HEMJSWkdwr7LwBS?=
 =?us-ascii?Q?JhlfajdBvpshYvn0seMsQngoxcfv6qkVvcTWQ7spe2H1Id0vGlc1Pc+2HJ4R?=
 =?us-ascii?Q?2reCRSH0DGUHLFGlgBuxQMlmczMW/zw37bWB9X9AI/KAheLOyjh1AB1GL94l?=
 =?us-ascii?Q?g+1jvSTp3WTwxSA7fNAwzUUBbdFrkKVYnt04HNSLoQHKhU5dWovetl9WEv6r?=
 =?us-ascii?Q?mGKCM8OiRf9ocjvYMBht3Z99yZDvAcqfB7Va53pr6pOE4mktG0pHPnIVnZRu?=
 =?us-ascii?Q?TH3WRIfheHYzdRfOlkunp0i/ZgMnmXBUVY3jEYVBpAZ1o4lNBibjMpjr2C77?=
 =?us-ascii?Q?dZL+D97NupOZXVB5hVCssjUPS4Ompa4xrQmoDXqbEMTUBwJJeq81VMIVz7CA?=
 =?us-ascii?Q?xNMQJh7cngFDG2e72cJmgqPXDzDSLfCjiPCzX8740EC12Uj6QyhDjhZm2yoT?=
 =?us-ascii?Q?js7LYn2dsrNAHxAjFYvSdDaxUdnU0573nKf+IidmLhhhkHYTLQGbTB/L+5j3?=
 =?us-ascii?Q?EHO089x0W/YQ0CH71rYJbEv5SczU/z9nzkH3y8EtUtwuGvn+BDPlOIuG9RZZ?=
 =?us-ascii?Q?Kgns/g15hkczTNZlVvQdje2mnTvbnOTNOqEI6yeLGJm5EjdQuKCgWDBdPpAg?=
 =?us-ascii?Q?bIpik2Mog93s4OBKZ36WgKpOErZ/kIhVwKpeBpeQcgTumQBpNllVgdlHlxdd?=
 =?us-ascii?Q?+XSRrx8uxrzMEizrUD4lwMGNNGLXH2ZZJWIKOi5sUa7F4k6N6TeuX23c23KC?=
 =?us-ascii?Q?wMeYi/53wYu+Y9bOnJK2HJZ6bqT6oJxBy71rBjEDns9oZ7XNeETVFZuOvdXd?=
 =?us-ascii?Q?WCEeRmBVnkts0N90NnQE3cmgHHuA6dVXS3ntIxaZV1xA0h0+brvoaeV64O6T?=
 =?us-ascii?Q?u1o9QOBiit1WLMTyGp+44DzbhqQM78ExIpHRVRRD3UWIJeGhntl5kuIcOs8+?=
 =?us-ascii?Q?ygPRUAxrQ17SWpYWjRRUPCTFiHsQ+/CeqgZ3l5dCCwAEiq/IJhfOJqa1vPb5?=
 =?us-ascii?Q?PvEdxENOeve9cKfOEyecDak=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d0ffef36-c4fb-4388-a0f7-08d9e737ae64
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 17:07:38.5933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 fpuFwCtmovnp6kQfAPiCiCxY0EU+NWnYaFBroOo6zFIDBWjtC95rw4bygbLSPcI2UXyC6CoP17dH+0KemlzyHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4745
X-Proofpoint-GUID: jFrWywy8tSIQz17eWnHVoUfvqsIXf2xM
X-Proofpoint-ORIG-GUID: 5ZiE1MVFq2HamK59qRH4yMTkoQiGoDok
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-03_06,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202030104
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 17:07:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161291

When a file can not be identified by checksum and they contain an SPDX
License-Identifier tag, use it as the found license.

[YOCTO #14529]

Tested with LICENSE files that contain 1 or more SPDX-License-Identifier tags

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 scripts/lib/recipetool/create.py | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 507a230511..9149c2d94f 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -1221,14 +1221,20 @@ def guess_license(srctree, d):
     for licfile in sorted(licfiles):
         md5value = bb.utils.md5_file(licfile)
         license = md5sums.get(md5value, None)
+        license_list = []
         if not license:
             license, crunched_md5, lictext = crunch_license(licfile)
             if lictext and not license:
-                license = 'Unknown'
-                logger.info("Please add the following line for '%s' to a 'lib/recipetool/licenses.csv' " \
-                    "and replace `Unknown` with the license:\n" \
-                    "%s,Unknown" % (os.path.relpath(licfile, srctree), md5value))
-        if license:
+                spdx_re = re.compile('SPDX-License-Identifier:\s+([-A-Za-z\d. ]+)[ |\n|\r\n]*?')
+                license_list = re.findall(spdx_re, "\n".join(lictext))
+                if not license_list:
+                    license_list.append('Unknown')
+                    logger.info("Please add the following line for '%s' to a 'lib/recipetool/licenses.csv' " \
+                        "and replace `Unknown` with the license:\n" \
+                        "%s,Unknown" % (os.path.relpath(licfile, srctree), md5value))
+        else:
+            license_list.append(license)
+        for license in license_list:
             licenses.append((license, os.path.relpath(licfile, srctree), md5value))
 
     # FIXME should we grab at least one source file with a license header and add that too?
-- 
2.25.1


