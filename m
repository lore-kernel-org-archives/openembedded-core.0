Received: from mx0a-00010702.pphosted.com (mx0a-00010702.pphosted.com [148.163.156.75])
 by mx.groups.io with SMTP id smtpd.web10.19803.1607110228007957832
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Dec 2020 11:30:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nio365.onmicrosoft.com header.s=selector2-nio365-onmicrosoft-com header.b=aDX+xZwi;
 spf=pass (domain: ni.com, ip: 148.163.156.75, mailfrom: prvs=5607aca33d=gratian.crisan@ni.com)
Received: from pps.filterd (m0239462.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0B4JThPE029456;
	Fri, 4 Dec 2020 13:30:27 -0600
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
	by mx0b-00010702.pphosted.com with ESMTP id 3573ptjdhh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Dec 2020 13:30:27 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GT934AhzKbmAmsBJPAR11dZzpE0dcByxZZ3R2wfdZNXa9vt7eQTYqn8rQuNGXrID9+bJOdIw50nU+A0O0UNPJ80RxeDT6S9g+ml5ZoYELVSaIe446DpkL3VFNKQAXZGj6FfBSdSWRMkxqW1EwyQbwNcd7ASSG0ZFo5xjQbejNPGErEBfSoIHAk93RqYvUdUPtFJtQodw5P4ON3L/mmMHx3c6DlzadeZiTdGvLVYoKDp3FwQ41D4BD9tS+szwPs5MHHbXAAkmQIQM7z3N7kvHpo/KVu5+EAVG+vJ95OOJUFYqVb+yoKoz/D7fq83WB+gdhEIH5ijJputrrIZvbDtRUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k8FwV/Y4uMZa9gobW8cpqug9iA110hEpDkdKuDJlNxI=;
 b=Awz09RzKaEvv2zxw1pfrz3K+3alZBByju98Joq62yLsjuPtbob7nR8fSNOhwt/FcDXLp89K89/n72UtXfUAxBdRkVgN+NbW2qEGn9mJYS7vUtqpXnBzbVU3sKx3edSNHLpNfuaUOVIGD/G7v0vg1xw01MFgqXGBNnOluW2OP73K18Kw3/NO8nWe8fdYjiltTTzenEsnQlGTGpLVlUZyLDpJN/VdF3kfWrBlW6h3Z7ifNwulveip9FmzKH1bs93TRrqctOVmnmKqzd2c5dTfUDMikgA5fKa/IXU+066+krYCKjNcOqOf+xlQh099f7SaIa1Vm76WWE7L3TzhIVMmppQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k8FwV/Y4uMZa9gobW8cpqug9iA110hEpDkdKuDJlNxI=;
 b=aDX+xZwiqZR21Pys2HrqHkbst+aEBzu8lyvG/HNspbpDonfEdArtqo6rK9812dPBXf4j0+JTT1gccnjmwv8kagpdPAqGWYiyPPsM6MBCSRTIS+qUjSICVRDvlizSBODo/p3VLwR+tJAlJp/iuFWgE3sOXm3YXz8/It9Xq1wwGLE=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none header.from=ni.com;
Received: from SN6PR04MB4496.namprd04.prod.outlook.com (2603:10b6:805:a3::23)
 by SN6PR04MB4077.namprd04.prod.outlook.com (2603:10b6:805:47::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.28; Fri, 4 Dec
 2020 19:30:25 +0000
Received: from SN6PR04MB4496.namprd04.prod.outlook.com
 ([fe80::cc42:669f:a4f2:c1]) by SN6PR04MB4496.namprd04.prod.outlook.com
 ([fe80::cc42:669f:a4f2:c1%5]) with mapi id 15.20.3632.018; Fri, 4 Dec 2020
 19:30:25 +0000
User-agent: mu4e 1.3.2; emacs 27.1
From: "Gratian Crisan" <gratian.crisan@ni.com>
To: openembedded-core@lists.openembedded.org
Cc: yi.zhao@windriver.com
Subject: [OE-core][PATCH] kernel-module-split.bbclass: fix kernel modules getting marked as CONFFILES
Date: Fri, 04 Dec 2020 13:30:21 -0600
Message-ID: <87k0txfjxu.fsf@ni.com>
X-Originating-IP: [130.164.62.170]
X-ClientProxiedBy: SA9PR13CA0186.namprd13.prod.outlook.com
 (2603:10b6:806:26::11) To SN6PR04MB4496.namprd04.prod.outlook.com
 (2603:10b6:805:a3::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from quark (130.164.62.170) by SA9PR13CA0186.namprd13.prod.outlook.com (2603:10b6:806:26::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.10 via Frontend Transport; Fri, 4 Dec 2020 19:30:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c7cbfd0-6817-4084-5d50-08d8988b0c66
X-MS-TrafficTypeDiagnostic: SN6PR04MB4077:
X-Microsoft-Antispam-PRVS: 
	<SN6PR04MB407764F6532BD6CA0241CAAFFEF10@SN6PR04MB4077.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:156;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2l7BvZ8N8NEqcHxSLg/6E7LGOyidb9olX8gAS19AYuvGlCTAJvVtw3hoqHsVRwOB1UGv5sIR8tbuDUKCRMs2F7jvRgIbJHW8LslqLBGa4zWX9pFGyyyH7NfPpx0axlSfOHIx11O0ZikL2Bib/H3ZMxxxf6ZeQqQfDNALF/Ols9KNr9PQJl2tU6flS6ISecSx7c0kQwmUi+6OaZJ+h/7h6xg8Qd4YqjQnGGivFaC83VBlzWYDN6otgib9Py2JzDcKZBCw/Z9wl2duZzn8YOenAsaczJbAW3hSFJXo/MvaJgxuBSVKtUkjmUF7J1B+x4G+zbcQtEpbhTu918zesP1oZg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4496.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(376002)(366004)(39860400002)(396003)(6496006)(6486002)(4326008)(956004)(44832011)(8676002)(6666004)(36756003)(478600001)(6916009)(52116002)(8936002)(16526019)(316002)(2616005)(5660300002)(86362001)(66556008)(186003)(83380400001)(66476007)(26005)(2906002)(66946007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?sHuYD6zgQIkXxXk2sn70myRpI6yYwf9GyudcrYFVorR5HioYL/kPQYRcxbFT?=
 =?us-ascii?Q?h2OnLEf+VSrm4BSs7iYjwYfXv6DyrsPt3Y6SPlipqLDlu482egFt8/KMBa0b?=
 =?us-ascii?Q?PzuuRWg9JH2jdMxUFVjeOSu6SV2DtsVT6fg4qWAOs40eb/ULMbpAnApeZ3zV?=
 =?us-ascii?Q?3wZyCgUgRul9Gmt88yaf2vd5LqzAFz++hTKodJWr7AECydSGo/Mabx28fY05?=
 =?us-ascii?Q?wT9dhnks/1DHw4WkG+OJj7siXAzbv9vzUgGP4FNODdT12ofGqmmKPBUJrmjj?=
 =?us-ascii?Q?sAx8eQCPilPlZf6q7Ab5fvO3TuuqYyiNHR8eygpANg5qUhdORtkZFAKtNsGG?=
 =?us-ascii?Q?4SM2+BcMsQPx3iErA7qkik4wjkc9bhtSFdR+tYOy/hQpvYXZvbDFEPg/YrpF?=
 =?us-ascii?Q?lnrJNh1kAA/Nf+n3wby3sEB15OuBjUOpJq9yYp/IB+0SaFtvXuuyJQHA8DkX?=
 =?us-ascii?Q?tTk1y62WRp7qLY5GH2KLf+gSJvUK/ag+StyhEoCkW9Pn+inxCRhxVLMuY9B3?=
 =?us-ascii?Q?KVd/FvT8PuiK4LKiGfTfSgTvGVBr9H/tyqwxQix1laqrnFzk4uXYGucwEFef?=
 =?us-ascii?Q?sml2Dc+Z6dxj+HBntpwLzQ1UPqHEiV5fO1MX7gTgIKLHdKNIx4WW0TVwCDO8?=
 =?us-ascii?Q?TUYu0f45F0O1zmHUAnOAnfdnS3oZxoAYSBwCON1zi0E0QYvhXIs+UA86JuoT?=
 =?us-ascii?Q?Ba7v5VSaXKwVvvsSje8sUGf1Jlzce+ob+h6GFTGNttngP4RyGi3AJhhRRoJo?=
 =?us-ascii?Q?eb8EBYiKg+6NfTCIip05BZAyZEf7B4RqM0jXE4qacsyV08ISFSYSnremfsab?=
 =?us-ascii?Q?bZWv/g8RmORsKqoh1Pgd6B94sNcF2j8YlIdJ4SGGJZnAgMRr4SfGx7hQ3Wbp?=
 =?us-ascii?Q?NBXVGVVGoIJ42RD0iY9RJ7fnWShmGtLtBS7yi1KLU+X2EkB8ZZWV2Ov26uzo?=
 =?us-ascii?Q?GDG3nDBk9CtMCKOmX40QYv9EMg8SzHSNwrDk6uKeTELXNoFnehUVJH96V9Ro?=
 =?us-ascii?Q?V2Dr?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c7cbfd0-6817-4084-5d50-08d8988b0c66
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB4496.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2020 19:30:25.1205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SwxnDan1THsrPivCzYVZ2TQmVVa76Wr+DzaeSAUxxvZBWzE+SNxLZOMP2m+wBJp0D4CsIoaNX2Azi6UHzsf+hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4077
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-12-04_09:2020-12-04,2020-12-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy score=30 clxscore=1015
 suspectscore=1 mlxscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 impostorscore=0 classifier=spam adjust=30 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2012040111
Content-Type: text/plain

Yi pointed out that commit 1a70a92d1f10 ("kernel-module-split.bbclass:
identify kernel modconf files as configuration files") is
unintentionally adding the actual kernel /lib/modules .ko files to the
CONFFILES variable.

The root cause is the re-use of the 'files' variable in that commit.
Fix it by using a separate variable to keep track of the generated
module .conf files that need to be marked as configuration files.

Fixes: 1a70a92d1f10 ("kernel-module-split.bbclass: identify kernel modconf files as configuration files")
Reported-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Gratian Crisan <gratian.crisan@ni.com>
---
 meta/classes/kernel-module-split.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
index c8ede26996..baa32e0a90 100644
--- a/meta/classes/kernel-module-split.bbclass
+++ b/meta/classes/kernel-module-split.bbclass
@@ -120,7 +120,10 @@ python split_kernel_module_packages () {
         files = d.getVar('FILES_%s' % pkg)
         files = "%s /etc/modules-load.d/%s.conf /etc/modprobe.d/%s.conf" % (files, basename, basename)
         d.setVar('FILES_%s' % pkg, files)
-        d.setVar('CONFFILES_%s' % pkg, files)
+
+        conffiles = d.getVar('CONFFILES_%s' % pkg)
+        conffiles = "%s /etc/modules-load.d/%s.conf /etc/modprobe.d/%s.conf" % (conffiles, basename, basename)
+        d.setVar('CONFFILES_%s' % pkg, conffiles)

         if "description" in vals:
             old_desc = d.getVar('DESCRIPTION_' + pkg) or ""
--
2.29.2
