Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.748.1623941496488930708
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jun 2021 07:51:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=XDWk0veJ;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1802eeb182=saul.wold@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15HEnWvp024247
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Jun 2021 14:51:35 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2102.outbound.protection.outlook.com [104.47.70.102])
	by mx0a-0064b401.pphosted.com with ESMTP id 396yn09req-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Jun 2021 14:51:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ilwlo7zIjY5VfoUgJoTIhHYNrxk2pZMisJ7Sx1hqVWRXkGUE/pf4uIdz25j23xlQsNbQYgRb6Ipx5wA6mc2Qk4rkRnTjJq66KWIRDlm7CACRK7MMxWlzz14JlhH5R8P8xWp8eBmFzZJa+VPGvr4gPfGiS40odZcBz1nZRHUpNVgtW8hKevSd5CH4XylzenvmAJ6EjmEi/YdYCCeR/8/XysGG9tcPmTCt7j0rhWVukoYvs71McLaruojt7onrlhMcBnzgNm3jDW3j154yOokeoOgPFlUciMXLIkXcUe8pT2R3FnIkfE4+wcMOT7fzcRk3E1Jq0y9J5gNR6HPvV60H4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQ7VhlmyWPZ9ZoXtDsXKnCu+T62utNq2Fbr89dXylZY=;
 b=D0LUyuMiuCSS1NKMaGMfTVB9RDhYGVchNlMw6wSrAHEVRJHys4umUSd9k5TXpwPvS8LKXZG1VF44cwySzjKiuf+GxSjYb5cXZ0QRcmUNZW7+F8PsJozHs1L2i6wubEMrw2rPxXlZNoIWBBnilHpO2MYgjqmPHsL4Y6i7GclcPEJfYth84p5mZlcpmjP2nN9INVB8+ead8qj1OgnIiyIJdQpksRrByN90v223vYTxIbvt/Q8cy0JedNABg5KWBtQPpKu/rV7ScS5DKtWTcRYr45MaCh1OYt9j3iNqA+JVpie7feZjgUREXSgslsmZkLBQbrf26oL6ij2/aMFRp+pI9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQ7VhlmyWPZ9ZoXtDsXKnCu+T62utNq2Fbr89dXylZY=;
 b=XDWk0veJfO0YHnuNs/6mm/QzPau20op/pfDPxUQdQcptgXdzeWCUp8XQ6ZH7NQ+SysxQFC6OkSK7YbNiCxifnptad6qoXpocfRi+KYdzTFjIguE6PQgz7s+6BJjT3A4Ee7mbRY9/PvTeqQStcM+udqTJo7t+N2OuNcpTb4QGvJo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MWHPR11MB1855.namprd11.prod.outlook.com (2603:10b6:300:10e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.24; Thu, 17 Jun
 2021 14:51:34 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::ddf6:b028:79fe:ec73]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::ddf6:b028:79fe:ec73%6]) with mapi id 15.20.4219.026; Thu, 17 Jun 2021
 14:51:33 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] qemurunner: add second qmp port
Date: Thu, 17 Jun 2021 07:51:19 -0700
Message-Id: <20210617145119.1867049-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: MW4PR03CA0205.namprd03.prod.outlook.com
 (2603:10b6:303:b8::30) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yocto-hs.bigsur.com.bigsur.com (71.238.119.71) by MW4PR03CA0205.namprd03.prod.outlook.com (2603:10b6:303:b8::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16 via Frontend Transport; Thu, 17 Jun 2021 14:51:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3212d33-a0a3-4240-0d6c-08d9319f6630
X-MS-TrafficTypeDiagnostic: MWHPR11MB1855:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB185570F6A3B37F63B0AA0DDDEE0E9@MWHPR11MB1855.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DXkDA04gGVMoFOi4Dtuskc64hF0Z9fclmES/uqfakqrgJ2Jcox0UFxxcCfFVbTeDpglGGKBckGmmHKK9gCa9hu+rAcH8S0eSa53ZvYbYx1aFi/rQPpTpIIBn6ic0iFcjHQ6UBMfduxnF8/VZfgOOHz50fn6ClhFQGF6aOEOCTjtN3W4swsxtiWEgYtTrxUEpGFXukIKtuANN5VDqPvxZ+AXMNs89WMQp5q9KSk72qsy6TpsTtb7K5LkiXMDfJ+VfiZl85n+60MiPsouP/pE3YpqH4zN9uCMZ6/2KBagjAO9JFL3PunGleyULsl9WvNuhxGg0qgrWLxh/U486KrSRVewggZLHtmfpIQNR6RCqkKK62me0E+X7a0Sn+VQS9S37d71C8M9owxcKai8YyAa7hSTN26JAXeAQuNe3ElcuZg6MklVbo1tt4j5dWqgdvIsqXfccVcIbfUbacDKvwB1NojxR7VGwJieJI2D9yGfz6uoYT5sQ/1jNT5rJKPemE6bGJ4LxEkVC0NIzyRa+Oi9r/YsqMKmue2Qnb3oD0U1BWwgaOcRMOBun43b/pptt1tHCaHF8YRxCIGoEL51AdARCr7jV08vjls6QnzpqBWLtLyqIZwdZtKsE4vObff9wFvFLL1+5edU0lNeCCNBJBrg1Aw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(39850400004)(136003)(366004)(186003)(6916009)(5660300002)(478600001)(316002)(16526019)(2616005)(1076003)(26005)(38350700002)(2906002)(86362001)(66946007)(6486002)(956004)(8676002)(8936002)(6666004)(6506007)(6512007)(66476007)(66556008)(83380400001)(36756003)(38100700002)(52116002)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SXLjE0xcnaBuuW3/Ui6apTX93tUbAeoSdsH/tkON0ZLk3NffMyu6u7HMOWti?=
 =?us-ascii?Q?ISbjKSUtooxQRafTODkS3a8dD9uQ9L6o0IuAP2x4duSzYtgp1mf5e18FyYgG?=
 =?us-ascii?Q?ginjBPRNi2+kLB8hwJ7LKobV0Vz0KTQbc82H/z2CTr9NO0cmtUqwUiPMS7sx?=
 =?us-ascii?Q?M6Rn/lN9wFFQ9ztH0nVsglO6baLLKA3poUDn7GuQE+tHpFkowY1CpGmM4pOJ?=
 =?us-ascii?Q?zEEFt6EJL+s4cLS5hmwQBxLwjUI6d7wfmX2rABvd8S9DLk66QR29eOLwOFuD?=
 =?us-ascii?Q?mmDvq+e09uEfds4kRuAstPvaphetyIot9kMtweJjf3GMHCkIJIkGumr3pujH?=
 =?us-ascii?Q?RiwQerX3aQjnyFcFWVWnvaFhQHV9TN8YpKHWx0krNGzwKg4Cvg9XBxEL875G?=
 =?us-ascii?Q?fTM67bY953pfVx8tTkmbN6BuSYPdGqYib5RyPsnY+PKTaS9WEirVwqgHpF2Y?=
 =?us-ascii?Q?lcDDOMuuYQiN/0jNCBflAw70fheBwMDx5gT3Yldhe/kwe7tuwaGDcXmgcuom?=
 =?us-ascii?Q?jGRBVu6sFOBLRZCgt4q93WlU5+OT76CVlwZ3oF9QujcYc8Bnhsmt8qPDr0kz?=
 =?us-ascii?Q?ak30iqVi48CEZnOlZpPNS5Tba6SwputhsfV/2GTqrOhJ7aTKrhxgaGkfAxPe?=
 =?us-ascii?Q?jYqiYw0BslMkLyglmz2oKz9f7DoKxvBRofGIk/eAXEglZOo2ku3ZDz9BmmyS?=
 =?us-ascii?Q?WqQPT83rdEcKobZINd3rmaSTtBwMrBNhv5eR6hb8hQRAwzKMN2UElFUtYngy?=
 =?us-ascii?Q?VN10lghw4EbfMqj1Bl4zHVxk91og9VpXgMifYGuMbyrYVrno/FzCz4D72dQ9?=
 =?us-ascii?Q?yCHwEG+rVuyujj9d3QaRAqn9ViCO3HPjHtLRhdVZ7YBC4nRIDQ5xPnWfD/bh?=
 =?us-ascii?Q?4/eyPAObbeF8UJxsVEV9pKf/K7iRZYMLuPn/OUk2oB+3A/0Hl3r46+yOlEIV?=
 =?us-ascii?Q?pDT238JMlFR2cXY4+zRxmuQqgZCcvhSuQtY+eeU0M8DIKjRE/hxalo02Lux1?=
 =?us-ascii?Q?Pu15ftOtsi84iC4e91hy1G/3DvWc9TKpISFMa3GzJBWuxhrRjag7V9RcvBjU?=
 =?us-ascii?Q?l5HDvqg+Rsop7r+xf6Z12MlG0mUSf2iKn6tuxhN8frGevqIMTs8dUKqJhiIv?=
 =?us-ascii?Q?Rxiqyb2vOfbwRFxNwRJ3ODU/MeQ8aD93JYaPiDAjm8aVbBzFdGE38KmZG3ty?=
 =?us-ascii?Q?40/FUdh2syQAJ25NTfOysWFbtIYMz0Lh0qU+r4MIWRIrVLtk/9o/VdjO124s?=
 =?us-ascii?Q?KX4gFGRRDu00Q3rmGA8phm4xGGs9ifIyFp6YCZr68nZnVZPM+m2k3VG/GApO?=
 =?us-ascii?Q?knRq7QkscexogGPu6BPE2d8o?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3212d33-a0a3-4240-0d6c-08d9319f6630
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 14:51:33.6399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mwr5jBG1UKjfXvhhwZu/kgaTF3ecOZm69h4gl3hqSUtxn8/a1xFR538GCWDP0ZhIoSGSGsBwKcOXTRHcpwi5Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1855
X-Proofpoint-ORIG-GUID: 8_MqmaWZvQHUNLn7YS4acnVIzJbq_F44
X-Proofpoint-GUID: 8_MqmaWZvQHUNLn7YS4acnVIzJbq_F44
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-17_13:2021-06-15,2021-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 malwarescore=0 spamscore=0 adultscore=0 priorityscore=1501 clxscore=1011
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106170094
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This will allow for direct ssh connection without breaking
the first one that is used for monitoring. This will not
cause qemu to block waiting for connections.

I am not sure where the logging.info() is going, so one has to
observe the qemu cmdline to figure out the port to ssh into.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 0032f6ed8dd..a4727bd14ac 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -192,6 +192,12 @@ class QemuRunner:
         qmp_file = "." + next(tempfile._get_candidate_names())
         qmp_param = ' -S -qmp unix:./%s,server,wait' % (qmp_file)
         qmp_port = self.tmpdir + "/" + qmp_file
+        # Create a second socket connection for debugging use, 
+        # note this will NOT cause qemu to block waiting for the connection
+        qmp_file2 = "." + next(tempfile._get_candidate_names())
+        qmp_param += ' -qmp unix:./%s,server' % (qmp_file2)
+        qmp_port2 = self.tmpdir + "/" + qmp_file2
+        self.logger.info("QMP Available for connection at %s" % (qmp_port2))
 
         try:
             if self.serial_ports >= 2:
-- 
2.25.1

