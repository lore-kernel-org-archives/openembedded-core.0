Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEEC7C433FE
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 21:25:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.40.1641590705768389022
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jan 2022 13:25:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=gnU1Ypda;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=80063e4491=saul.wold@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 207KsOd9032695
	for <openembedded-core@lists.openembedded.org>;
 Fri, 7 Jan 2022 13:25:03 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=Cy28KX7xcGgiUETVB/fsMRpKaCxZmHRdEMvTdLh4uAI=;
 b=gnU1Ypda3tH3sWUdkdvzQozv0BSuxFCjitGqpq1HO8YGcTVwT2RCR/Rmmw3BoQUH9759
 Qcs9sEtM2OOaGg+SKk2Q8wc1sa28hP28Wt37MvPU+X6qe7i0Uus0Dj31rrV/zfEniatG
 ka7bgClc0RM9IVqd/pGnS22eDnYEq+AdM+hNG1KKztgaLHAn/8W0d/zBUvWB9kVL9INp
 wLQX/J0b8vWEYyxq93fa+Luv0XcgiewXs4xPXvB3YSNaracvAyh9vNnLpAm38bwYms0R
 1/8xrv550DCdxDMnpBkzfhnctFQxSrsBZw9aaqYW30cGDFrX58iwSBnNRivYNh8kWwEz 0g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3de4wagwa7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jan 2022 13:25:03 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 207LP3Op001096
	for <openembedded-core@lists.openembedded.org>;
 Fri, 7 Jan 2022 13:25:03 -0800
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3de4wagwa5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jan 2022 13:25:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I8Aif2eZx5DQ+utQ4ptN8UfQuEZeLeUWh5TqpZJCtbPYQQZ7ZRfqy8lNMgpgDXld49+eLq353dqCK2RUjo6HGBKqmuzBfzkJMPJCFlUMUdw7fiypIl89nMlhAS96h34758jk1CR/bk4I8h+AitgeIR/zCLMcYae7P04u0nMyFLYwA9EaTPE83ZEvDh/c7Igl3E3xlOgilkTQtY70bMEloR0UCHuGO3D5Q9BhUZzrSZF2RKe8FLOZGQ3GFCLxu5FU+x4i4+c2ze4hp/5/D/4Eee7jS8w1m8lE0wPzf7kxARCzytvMlVEDbrOEPZ8zIb44FpwMx7UW2Wo5nFp9t+0VWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cy28KX7xcGgiUETVB/fsMRpKaCxZmHRdEMvTdLh4uAI=;
 b=g02A/cRXTf7T5w4fP2u7G/T1ugisUuD33XHQwzfPDutunYWzzd2rDQWfmsZ/qZfQ0g96/qYJ76QnJ0mVvfkSbGOl5hNAKRXuytoGaJtGXDydwD73oZ+PgpLcCAX4K+K8ODTQTYXL3QUzOXKS+ObWXplogVEuv+eP0pamBncmTljbxE/I0SrUXEzGwcOdkWPyBuoWXnmlB4Yl+tJDt5QwwAqd4nCr9DKprr8ULAq77v2rCK7jkxYULDnJxEe0oupNA22dhzN1uH4ajIq3Cg4ib2IhQA4taSi//D0JBkaSbqQmcapg9mGfM2PsmU1Cu2yD7CREeBFF1NADWC4kevDp7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MW3PR11MB4602.namprd11.prod.outlook.com (2603:10b6:303:52::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Fri, 7 Jan
 2022 21:25:02 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac%4]) with mapi id 15.20.4867.011; Fri, 7 Jan 2022
 21:25:00 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org, JPEWhacker@gmail.com,
        bruce.ashfield@gmail.com
Cc: Saul Wold <saul.wold@windriver.com>
Subject: [RFC PATCH 0/3] Extend create-spdx to build kernel spdx info
Date: Fri,  7 Jan 2022 13:24:43 -0800
Message-Id: <20220107212446.132386-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR13CA0025.namprd13.prod.outlook.com
 (2603:10b6:a03:180::38) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9576368f-a3dc-471f-27e8-08d9d224296f
X-MS-TrafficTypeDiagnostic: MW3PR11MB4602:EE_
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB4602458303EE5F6A0BFC792AEE4D9@MW3PR11MB4602.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QwrKUs8vMkrrPYD8QgnfSDys1dwR1T9U5rD21K8ajnxcqpRPBfXNWrD8SAK8YvZNyOx7B4y4qfdbQYJW1ZCMfNWoE4byCyDMjM4Z+GStviTYbhsrdlseqTbFrY7eqzO7eNculAzOvJTcKJG7mgUUSXc0pFUw8ijQV37kNHQg+r6M9ea5DKX/Uhr3BegieJnggWYDIoq1foe4nrWS6yvPuftM8TB4K2XEmRYg97Lk27QWNgXwpdso90349Hgh/mtWOHPSMb6gHE5j+ULICLRazJQwLjQJOEczbm2WcoeMdQOdVT1zy498RMTmR7/lp1oHdvja30PUgm4Dhc03qi/doFs9f/UcBZpgllGsvOzNbQP5RG5dUXjgqmpc2WHOyowA+YpjlPVumOU9hZRs/B27cynzok1Kkphufh4Kux427IdPTkP7EihMOAfFrehe0XGQ3/XetzZu5VFGtp5+vBqE6PDX7TvE0d/7X0qV44tMa9H3Gqt44s4Jh9naC8FwUzrliFLhY8tCWHQTQboi6dtUI7f6AoKRaTDu+mK81huquFDaPbYSmZhS1HwJQ2cqMngxBl1WmBDC7lDSHl8O4RZIXhBmQruRcoqlepvbLomZpmUSzFWvgRjFEMJnI1AXjcF9gE2hZ1K0P1xzdJIlJeTS3H0z7ylQM9Au13jmxEMAWT1umNm6j/08aUjbuWU1yREC
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(44832011)(66556008)(1076003)(66946007)(508600001)(6666004)(6486002)(8676002)(5660300002)(26005)(6512007)(36756003)(186003)(6506007)(4326008)(38350700002)(52116002)(316002)(83380400001)(86362001)(2616005)(2906002)(107886003)(38100700002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qWIZi7+XhHoJ6ERYxnBP6dDevdhnNuSyc8Kr/cRQHUjSA7yhTFJ5+CFsc8+f?=
 =?us-ascii?Q?aHGmaOY3dn5X2O2nF8UXoKKBz1bU33UI3tKiwsoYTM4IbTLyUWRZVcPDPVqZ?=
 =?us-ascii?Q?u/Q3CktUzx6sg/R8ByafNo+yE/tQjEl36WsVeXoDF9+KpkI5XNySXPJhW9X5?=
 =?us-ascii?Q?9wqKjTYCLYZ74Hh6pIXCnE7qALpKUNwAP1pjDhETg1qlyyI0mKgWYyA83Mar?=
 =?us-ascii?Q?Rvi1sNIGGH2FZw8goI7k+54YNhRVLEoACfQx2ER/uSxS7F0D1/phM6JqXIkc?=
 =?us-ascii?Q?iRCeqFNVYIoNSOrcXckyDketZiahL6Z+qO1e4axN/FZw4IDrweI9MPaDaYVm?=
 =?us-ascii?Q?c2RZSmSGdGduCTGvrugtB8odplTuO/DoRkV+fvZb1HSChzPchKd/gOEApuD5?=
 =?us-ascii?Q?Tek/lEUnMx7GsyTLh3pDhj3tKV14mmoKnZcZveFuEaEGvE86/Tda+uuN/KPM?=
 =?us-ascii?Q?pmplW15EYTVjUveZEdgVtYK4J13E8pGwXDA4bntKsi4jAsry99kOlx2jqdX2?=
 =?us-ascii?Q?tYb/RLsc6RYPcKJnUCSN7mOReQ1I8773y7mA9ISIBTbs1um4CHrWU7ToIbp7?=
 =?us-ascii?Q?T/MCC6JTiWFPg91vURupHBghPbIb6qISiD5HOGAYtG2d9VR6PogL6TPWuLml?=
 =?us-ascii?Q?2nlCFFYv8OquYz34oSn316+NjlhNEz6wxGoE2YrQ8z+2Mhqq5WQT2I1UPBs7?=
 =?us-ascii?Q?XXijjNQQcRIWFUlbK7bVgN9IDAizVnHf23Ls8bqMKLtVV16UTUY775VnccJC?=
 =?us-ascii?Q?rIK3JqxZBetb1fJaD/jVl7PBwACL0toWz6zn0jT9iexA8HwSQMXUNObnJY1+?=
 =?us-ascii?Q?G42FjU0f5yl9AZqlpfz8cfXKi5to5JW1C1zrRcW5i4iMDmKoSU3e8yG89+0T?=
 =?us-ascii?Q?JE7I1b0YzTkrVT7u5YQQHLC1SpbvVoLRBDRAvUEgz+Lmvdrl28/WttY4k6dV?=
 =?us-ascii?Q?9vP+qTRIsOR5dKkc5ZqgdsQSVAdZ5FysUq4WcYfbBZ8Hgekv1Mf8+Q/BpCin?=
 =?us-ascii?Q?7nBoXgDFmgn9WYTz20KWiBPoUDYZKpPNm81bVoGdrWReHqWJu4w4AOPOE06E?=
 =?us-ascii?Q?VQL8M/ma+rSJi5spkVcgQCfa29SmGnVcEm8/jgDT+2H4jK4TuUqbSvLoaBiO?=
 =?us-ascii?Q?L3cEENh6RKGn42By0FuzwI/KxmMUuV9xcs5dQdZE8PiNe2bqMFoq2C2wO35B?=
 =?us-ascii?Q?x80oitLdxoM3/6BN0sXgIyS1Ew3ufB1/qWoaOk4sgBF5DEjmFanslRijYHds?=
 =?us-ascii?Q?UQp9ExkJytb/RpMdoPPQsjGbaZ1DE0qUNNiiFQMmfY/axbtMZuMcjAWnv10P?=
 =?us-ascii?Q?05DNZ7dgI1qunxCw7jNxlMgYoENrB5/q3t/gnrsu8hDxYvNdhw6TiTUUXkED?=
 =?us-ascii?Q?GRUyL+AplbmKKuG2N5pO79CbjEBsWBsfXaVXQcGPnPC6Cs+wNb9zI+E84cF+?=
 =?us-ascii?Q?ZJDLTFINZRsERqius5Cow6bCivku9f6jZlIHNI7yZnkfFrwDT4PiCOXQH/uf?=
 =?us-ascii?Q?+6k57yhCdug5lPwSbDcC8DBNwWd5NOqE0QKyX9VxSBYTu5RpCw2XKPHWd1Rd?=
 =?us-ascii?Q?YfBpsbDM9Ktp2BL4luG7N7beAF/USfP3vzs+vpOoaxcEKabe5K2PB/w0KbHo?=
 =?us-ascii?Q?xilLLynkAE6k3wr8EJgWXVM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9576368f-a3dc-471f-27e8-08d9d224296f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2022 21:25:00.7941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 r+2y4x/Wq0z53q6Q+7g8q98ZNAxZJUcFaXlX9iZNM8vilXJx92av3XNzaI1G0G15v0oeonwSFCveUgHHYSk/vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4602
X-Proofpoint-ORIG-GUID: uwZD-RHxoSDeFd9jdZ9yjTeKBnNbuZem
X-Proofpoint-GUID: ZiN_VnE5wrWV6gNeBRbSguNNeJzL74NT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-07_09,2022-01-07_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 mlxlogscore=465 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 mlxscore=0 phishscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201070128
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jan 2022 21:25:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160270

This set of changes moves the kernel:do_strip() functionality to 
the packaging code related to split_and_strip_files(). The code
checks the KENREL_IMAGE_STRIP_EXTRA_SECTIONS for the kernel specific
path. This also needs to strip out the "/usr/src/kernel" path since
the kernel uses work-shared, which is added to the search path.

I am still working on testing this, but want to get more eyes on it.

I am most concerned with the change to package.bbclass to handle the
kernel and modules. As mentioned in the other patch thread, there was
some concern about the stripping being too agressive. I am guessing 
that part of the change might need some tuning.

Thanks

Sau!

Saul Wold (3):
  create-spdx: Add kernel work-shared source
  kernel.bbclass: remove do_strip() method
  package: Add support for kernel stripping

 meta/classes/create-spdx.bbclass |  6 +++++-
 meta/classes/kernel.bbclass      | 35 +++-----------------------------
 meta/classes/package.bbclass     | 23 +++++++++++----------
 meta/lib/oe/package.py           |  7 +++++--
 4 files changed, 25 insertions(+), 46 deletions(-)

-- 
2.31.1


