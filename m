Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.9892.1624032238151912569
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Jun 2021 09:03:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=pGSdELqp;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1803eb4c3a=saul.wold@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15IG3vqj005228
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Jun 2021 16:03:57 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	by mx0a-0064b401.pphosted.com with ESMTP id 3988j28wse-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Jun 2021 16:03:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=On/6/5Lg6nitQYbS5hDHE0pfawWnjkQ5gnd42/9jgTa7g47FYmoUs/4svt5yD1XDQnQZ8xm8mF1ArJg687AX7ZyJnwrvUHVfAss0J4ak52JY5ZREiHHalA8/3DkMEOgb8HjbvK2tdlaR5hX9wYBUg8JHm99hUDlC7Xdl62eyJCgfAdgvzkoqDVn5x4/vEwKVCwJd6rdhIwKpPIUbZHLCcSTQZgI8ln0hnPysyt0b4z3cCkKnEyBowLSJ2i+MWRFhMygCG8WAyMBplGJaeHraLDSDpMNPz73JDwb233L9EcC4r1+daG8b4V7V293ag1fRPjGZcsmOO/UgmmAiHQl07w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GV6TjRieLN679K9jHOQ2x5cm7NsUWGEvuYpa3Es6ZnI=;
 b=ZWKUKOeVp0eJQ1d9dgZ/dnfYaCvXidLYdGf/G4p1G6zW4zWc90Z3VvNf7JBwLCE5ydCECev98d2alznZcWP8VGWcUhmOYy5z+yXxGtbrFbt9NsR/IuQC4uol0FDoUMq/Ows4iImAgo/CDF5maP+IxhUVgYsUXw+G2wb2gVerQnd8sTK7V6sfc9eTI2gfyjSZbpehzJtVHU4Rj5rLKBCflBosrYgXvCF6bQ1fanm/CUEWcZyL+kMwORiLvlr0YhlpcozZnS/LQQD8zfjILFnp9l0h8zuA8FgbbyC/OJdAGOEDzxCj1RbCodEw9N9QmHf7EQHPk3GsqYYei+qGvclIYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GV6TjRieLN679K9jHOQ2x5cm7NsUWGEvuYpa3Es6ZnI=;
 b=pGSdELqpnWSIRntq6UPhXqSBai6pjZuqV7/+H6QFWY3Og0nqfuKTMFlHG5zRWn2AYPOtOKueWAGvx687hSE6M4RultnAntKm5hOsZw1RoWls/ShXjuerSKqQWdM/9WNd1uCl29uljADOM68ot6gRILT4ikBIdxfzhqFnlu+skss=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MWHPR11MB1904.namprd11.prod.outlook.com (2603:10b6:300:111::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Fri, 18 Jun
 2021 16:03:55 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::ddf6:b028:79fe:ec73]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::ddf6:b028:79fe:ec73%6]) with mapi id 15.20.4242.021; Fri, 18 Jun 2021
 16:03:55 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] qemurunner: add second qmp port
Date: Fri, 18 Jun 2021 09:03:42 -0700
Message-Id: <20210618160342.2774380-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: MWHPR20CA0010.namprd20.prod.outlook.com
 (2603:10b6:300:13d::20) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yocto-hs.bigsur.com.bigsur.com (71.238.119.71) by MWHPR20CA0010.namprd20.prod.outlook.com (2603:10b6:300:13d::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15 via Frontend Transport; Fri, 18 Jun 2021 16:03:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c9c52ad-ce24-4778-aa9f-08d93272ac43
X-MS-TrafficTypeDiagnostic: MWHPR11MB1904:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB19046CF3E86D1480A82EC976EE0D9@MWHPR11MB1904.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:608;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+D1xDOCtMan5IOhrRaaMzQmn6JWQvIuOz3rHAzNJ0Tc9V3z2zQn6PlYeR6O7fyMmdCBc23TtVsUR+b8jxOAB1CGQFFMLC+chk7WRDUmJq8MAvielwqPHlzh0f2Mzl/R0EhNnU3Ckzct4JquntDvt3t4JdqxtJ17X4ts5DIn2BwP2m1u58eWSSaraHjznM0oX9qsJY744W1PJtg9TurEHucNg9/ZPdObx5MpwEkuZAszbFK9JdLsyOM8751Am2lSFOIKYX4FfM++t8VL6w7fX3N6imAMHYtEbH2jpAL3ued0KTiCBnqKjFBDIrmbtSXSYqYhPxQfp+Xu1AuOa5aGjGlwIRUB3ZvSk3WfDX0A+DqlJxRzDddceob+gMadt3A0q49ndPnAyH/ZR7EMGb1M1cnxaN+a6LjQlbGJZ/1bWORo2QC+iAyDDLRtwx/jiGxJqGHVv9hWrfEzC4UkGWMbWci8m+v4wJ2fWuNfWpkxCtuvwXHGI2/v2CTN6A+R1m98nm9w0ToFiZ5jwpbFfv8BooZJ33NYFddoHeCf4gTwpoo9WiUebPTftJUQKsWaCOxS39dJrz2J8rIKbtkWXrGdzPfvjr+/+6EuLpUsDhIK1qlJ/EgdA9wP8l2Ht85mWha8vKWfIibpzkYC9wiqMVlYP5w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(396003)(39850400004)(346002)(136003)(956004)(6666004)(36756003)(6916009)(6506007)(316002)(52116002)(1076003)(6486002)(2616005)(5660300002)(6512007)(38350700002)(66556008)(66476007)(66946007)(8676002)(8936002)(83380400001)(86362001)(2906002)(478600001)(26005)(44832011)(186003)(16526019)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5FZDi4Iz59v/42Z2UAT2x2HCRy9reuSqOG51Zi0DN1HeUREWSTdOu+jiXJqI?=
 =?us-ascii?Q?v5w+fW8S1wyRo351P9V9XxmuW5vU7hQAsjnu2NDD5jEjoRxdDxs77bQQn1d2?=
 =?us-ascii?Q?EMxLwOFGXxTwtR1VhGLMx/w0SXDRZHNp0YeBNIjYVNV+bpOjyeJF6gwSltjy?=
 =?us-ascii?Q?ea5ZP9vAK3QTFix3Xr8zJ/9aNYnpH8taDgWgQI1o3dpfn6WwXEHwF8X/gLA4?=
 =?us-ascii?Q?bG1SbZKIR5IHtR9hYXX+Y/sDBDSbK8PYu1bSbH3lYhmEoYrzmt1fXHUvXQEu?=
 =?us-ascii?Q?7GOOsOl1hmBlXSmQy+s+kyn7W0BODql5EooQtdxz0NkJK3PUc+LHN78di98U?=
 =?us-ascii?Q?4hbUSzYeBTv4lg/lBS6xxKtQshFVZqIuaYQkk+3iydpOrM4zDdnXnIuPCh5U?=
 =?us-ascii?Q?Rjn6zKaOLVWHZzzsbpcgtrQqFu3t7XI1/5xOyuOtu1QpSAkkXfkFdm2fDtT1?=
 =?us-ascii?Q?T+1PalfsbO9ke4FwEpG6J0+Kz8Kv6F/1YCo/t+jahn4g4g6pJxm3SFtej7W7?=
 =?us-ascii?Q?8e1cdmZ+24SsJ+KG3k21Wnd3HXWcpbCrRzaXeP2KrHrsh37j/40iYB17rCGf?=
 =?us-ascii?Q?fvpppGADi03Fg3FV8p7P3bcRad5hWwpF9PIAOoig3uBCTDc3oU/cBsw+0c1X?=
 =?us-ascii?Q?9YnZD4YUiPAtPjTrhmed+xDZtLETZ7Cku0/W7qpBpqmWP3HXLlrOAqd/WZjA?=
 =?us-ascii?Q?2BL9rebbJOUqSc6wyqnidL9iejn5DapzD5FvH4X9ab9UEjWNj1NIkQ+YANoG?=
 =?us-ascii?Q?V4UjlJCXpS1jKRyd730xYucZUC4S+59UiWiT88RzwMspl4dHLPwi+x2OdGTb?=
 =?us-ascii?Q?6QAxbosTFsSHco89UM3fevP/pelNTzsI9GBbUd1YO2mviVdtc2wKCA6WfRUx?=
 =?us-ascii?Q?JI+Q3kLDy5XTQ6y//BugXRg1/zjWTCC/FhNd4lHvgk7JUBxCY+jC8QQ08wK+?=
 =?us-ascii?Q?N14rva3qSSw96QFORPtJ6JHJcXXDejfKNbvgDf4j3WGjJ/DlbrAWepDBkVS5?=
 =?us-ascii?Q?pcH+2M5BeKH2OPhnquTFm77D+zs0qq/mSLuvxTJ4HoySXbJZWGj8vQM0+2ur?=
 =?us-ascii?Q?qPBA8OqBXRyyYwnNXkafbN5lXuwQpP9J1PKGkA9eRKpMp246NhJ02p0S9E5Q?=
 =?us-ascii?Q?pSQJxBgyDaIsb4NmCZvObO8auXwDLTbudgznT23Aj10bUF2L2noPvYk5OsbK?=
 =?us-ascii?Q?hYWP6n8YxVKiN1VjQQrKUk+FvnQeKC2YnP5+71O3dXnMBJHzq0b+gGRwMZca?=
 =?us-ascii?Q?60ymvr0D65mz5iCf1lunDVRVVaFK3P13UHMPexqDnIYSg5tmmlDQ+Enyf3TC?=
 =?us-ascii?Q?tuGXZjCBfZDpYvMX5RWmgahf?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c9c52ad-ce24-4778-aa9f-08d93272ac43
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 16:03:55.0130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v7odKNd8BevCEF6rrvaJoIe4cqViZRxAUTaT5tqwQSzzVX/siK8eL1W4V1PZTTU4iZeRv+K4Rcr95FyAfd+nOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1904
X-Proofpoint-GUID: Q_qGkr3Yb0nZdfK0uNie0PEXaJkeYa8a
X-Proofpoint-ORIG-GUID: Q_qGkr3Yb0nZdfK0uNie0PEXaJkeYa8a
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-18_07:2021-06-18,2021-06-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106180094
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This will allow for direct ssh connection without breaking
the first one that is used for monitoring. The "nowait" option
will cause qmp server connection to NOT block waiting.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 5dc1a136e3b..abbc7f7d1f6 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -192,6 +192,12 @@ class QemuRunner:
         qmp_file = "." + next(tempfile._get_candidate_names())
         qmp_param = ' -S -qmp unix:./%s,server,wait' % (qmp_file)
         qmp_port = self.tmpdir + "/" + qmp_file
+        # Create a second socket connection for debugging use, 
+        # note this will NOT cause qemu to block waiting for the connection
+        qmp_file2 = "." + next(tempfile._get_candidate_names())
+        qmp_param += ' -qmp unix:./%s,server,nowait' % (qmp_file2)
+        qmp_port2 = self.tmpdir + "/" + qmp_file2
+        self.logger.info("QMP Available for connection at %s" % (qmp_port2))
 
         try:
             if self.serial_ports >= 2:
-- 
2.25.1

