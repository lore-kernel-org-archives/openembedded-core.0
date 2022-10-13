Return-Path: <zhe.he@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96A56C433FE
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 08:43:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.5266.1665650581596878847
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Oct 2022 01:43:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=HXO4DMc8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=72852ec7f4=zhe.he@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.5) with ESMTP id 29D771Ne002984
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 01:43:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=ITWiDV00E1xmtBMwXDp7cnx4+k9K05iEPUnpsCQtM4E=;
 b=HXO4DMc8VMbx2HTHn9xvwkyr/sQ7QLYdHmpNM9+wV+FAFjOOVbDxULkCFHLj8cKp5TJY
 F4Bik+0eTyYkxIAsSNROzC+aahsgAjqLrBd27eJbC/9lHHgXEELbeGV/wyBEqHX/K50F
 nbCayfvikqEKKIhHmBy+eqvWC+vlNMjO0iTwLBO9Mj7v5+/Kbx+t8Vxf6hqzMkVMYpDS
 OhSB45g6sqxB4FsOIrLqhmBvlPc982pyFsei6DG7ia17sT+rFEQmi1ZfJU5WTHhn5QSP
 w8rDGCPRWXBYRtU47pUXCyH8y/+ZSUa9iJiSkIR1htb+WzI+EIpAhmtxFD2N8NIFrtwK Zg== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2044.outbound.protection.outlook.com [104.47.74.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3k38qjbtvq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 01:43:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fqdyJh0AXnyK/q7R3Nk1LRG/ZGgoGCnt18xqM2pW/q9bEDjnhDaGafFMh7Mg+ztjShWvJY/inv69qDQoTVujxw9s85KKiYsSwimRRUTIPv8nqCUisBUM3hn8e6y/iqw6Gr/0DaXorwwta3TIs2D0vsiQTWdllwBP5xIzzAtth8xKfhlwRkLvROJ48fNEu8bt+CI+XBF8PJRAjb+t+Nv2XfRH+cXbjg7pL0XAhU/XgW7+ANWi+JVIzvsbIOEZ5LIApx1SYK5hSjt55iCxyOk5SO/S6lx9BD6qiw/ipiEzzdEPGtrWwo3LNh0LVEIK4AHwSUcsJnzmWGFVBLBM4z8uHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ITWiDV00E1xmtBMwXDp7cnx4+k9K05iEPUnpsCQtM4E=;
 b=TYcGfW+mW4aKfhFTqpXxrj7cmlP7OHE8Jz+RBc3J2sO/sOCxdFAw6djKmdIKpJC/mU6VheJgLytg5uVGCrdXb1KbEUsTloPe9yED438ts0zIMu7eT5WuUBQQXndxuI51URMvRRY+a+wWAv6Fit7Dz4PRA1+77fa5LKgMw6vQuzUApBRKkdwRTUNDFhqaQH9YEUqXqlLD4wUwGQqHsi8i+3nIwUrwKI/TvLIoGNXWAxHLt69TFWo731+s6NK+BUoDUz719WADNZO2hawRVjQwipQehim4Yzxjzfn6Z54aIituJtXGE1ON9i9Zr9/Lx/VW/UxxXXHXsCAjm3UO+CY7mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
 by MN2PR11MB4709.namprd11.prod.outlook.com (2603:10b6:208:267::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Thu, 13 Oct
 2022 08:42:57 +0000
Received: from MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::2572:6bb3:3214:81f8]) by MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::2572:6bb3:3214:81f8%11]) with mapi id 15.20.5709.021; Thu, 13 Oct
 2022 08:42:57 +0000
From: He Zhe <zhe.he@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone][PATCH] lttng-tools: Upgrade 2.13.4 -> 2.13.8
Date: Thu, 13 Oct 2022 16:42:39 +0800
Message-Id: <20221013084239.3461244-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0104.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:3::19) To MWHPR11MB1358.namprd11.prod.outlook.com
 (2603:10b6:300:23::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1358:EE_|MN2PR11MB4709:EE_
X-MS-Office365-Filtering-Correlation-Id: 257d9bdb-356e-4bf1-3e69-08daacf6ed3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ERxARRgz0O1dBN1Dia6oJtZYc6KyrXPWcFDPqRiAJqjxCjGGnbcjkpol/6DoC2/c2ri7JvHmNygaLnnjI/n1nioA+x6V0ooa/Xhtv16YkrMgSBdvyNwE8HwyZMVYeIBnK2+O/bkVv+W5iEROBxSvE7ULv7qcGaLSnlqXtK4b5H3AMWdVAM8KSCPCnzmzYHqH0paz/paRmw7Q3ySk+Hrs+kYvbKrC+CaYZRy8GJMUAVwGMsWQ2/+u73YeFM0VTCOQmmYnioXLCUf/robHKvRTW9RTAjPQUmFQ2a6gm7+qx1XIerzIQodLN3BQfcMRuMQ5DvSmR8u/iT0hmQozxtvOkautXilsdu/q8xKA91hZb270cFIumXp4v1YNWH/tv/ZoETBl/64CFbzdeijus8AZ6AAbz1NzvSCvG0flqdbmeS+M/29VKaM622502ArA3xThVWU6jmL0u+10XSh4+NT9cQan5ihX74JeTyPi3wl6pLw7BE4qRMd6ealaOZHpbws5+P75opKd247dZ/OXvhTWlleWml3jTMRYAUjZeh5/zGzjp3w0B+fKPyjdugNzZZQ+uHMuZKWqLiptUBDwXJoGfq5+Iy93pHpSIZfYMycuJZDa25lmjd/U6vrgzkWl0BnXF82qAQxZ8B35ulRf0e903oUVuoAsbc8SMz5iSLhV6Gp/vtfEcdmGYa3OwxV1ostjdyBmB8dhj1pnLeJ5O7MnrvBqDif4xKPzUCukGkbUthBD28lUeg1dbLn+FUOUqniE/8CPW8rMoYDbk/orPuQkuyNZ3PGWakPhv8iTmqC6+z0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1358.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(346002)(136003)(396003)(39850400004)(451199015)(26005)(52116002)(6506007)(36756003)(83380400001)(86362001)(38100700002)(6916009)(38350700002)(41300700001)(8676002)(66476007)(66946007)(66556008)(2906002)(2616005)(1076003)(186003)(6666004)(5660300002)(6512007)(8936002)(316002)(478600001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iDoI7GsdP/f6pv+Raurk2JTOKllLVnNT/cLmlVrfzedb13Yu0HJLZa6G3SpC?=
 =?us-ascii?Q?RwzApumNMyOxC8EglrvbvNXvM0h7H15Lto87GYIvhZVFq0CQDvhIIQJmpFGQ?=
 =?us-ascii?Q?WzyV9hxOE9qsKcF7GMhR7uJZlghy2I2x4fhAetR+TCTfnyhqmHw8cM3KrHke?=
 =?us-ascii?Q?rhylu8Rs5EiSwMmaeFZPLbsUheQHioVvD/2/iuuMC27ISrs8mrNDkcPZm5hB?=
 =?us-ascii?Q?5BFbN68BAZN7HZfEK9GfYAyWXoDatJj4QoZwXTdf/6Bh7uuKT/pHcIjQBg+w?=
 =?us-ascii?Q?tdfGVysI8HSDIxKon3uVVnbe9FKVbTNgX8O0Pv2qoxCSSnhwq1IXwFkcflZO?=
 =?us-ascii?Q?Ni0QobQQME1Ppy+SS4K9JP3XMUid1HacImG7i1kjH0e2T51ENmema1NaC++p?=
 =?us-ascii?Q?0jISqkqWYD6z+rt9ByTMA8lMGklK44hx6146Vg69rwmZzWs1/cM73Zf3omO2?=
 =?us-ascii?Q?tV5CRAmlIul3rIcUxqqlhOEEO3KKm5N3Zaqmmnt9Pkfi2z0/YPQU2OpikXOk?=
 =?us-ascii?Q?tBff98WWkGOcxNXkPlumF9E0LbM498n6Ze+eoFcFg3997nRcTNYKoLZ86wqL?=
 =?us-ascii?Q?X8kRSx4H1SaCSuxDgMODWOfEbw2J8VpA5qLomiphkTBPOz4Tc7In/TTa0o40?=
 =?us-ascii?Q?jr+dnWsufhcuol8cur/HF5JgpIodPx08rzbiMyLglRtf9nxLfOgU/Chy5r/Q?=
 =?us-ascii?Q?Notz/7Lsty+nBLGd0Ig9hYE7ACmC3EW7eqFER6piBC2Ase3poXH2edtMA5EV?=
 =?us-ascii?Q?he8CPuyq2EQ1o1GXPT9h854HqrKEhMqkII2PUxW1CQmaxkK/K6jhUQatq6+E?=
 =?us-ascii?Q?9/N2SVN4+Ts4Jr2FH7+Mh7lT2XddElLypuOxTOOsq/aKwBDKf/cy0U1n1QsY?=
 =?us-ascii?Q?6llHWH17Ac+gFLgmj5gBlyDDsHg9WUkRvSPVeYhocKgT3odBsehUEPfULf1V?=
 =?us-ascii?Q?iTvuF/okFtt4MxigfvXqhWbvDtgYIgZlmRsE42OOGiQGVhFKKLZB5TgzUYS8?=
 =?us-ascii?Q?6XmdCjBpxsfW4mRi9+xRJACzRxLIll3yg0GRGQDeiGgWXmOg/j+QnZoHLck/?=
 =?us-ascii?Q?tQq+zodB1UwU/wrzRyNRY3GM3um7ScEHUu8KTJedcAteJwzF4hFiUNC7aB4E?=
 =?us-ascii?Q?K3nLmaVqkicg4W+5SyZKfafzy6mXuLY+Lx2WUOEteBssxxDlN5/Ex4VD3sAu?=
 =?us-ascii?Q?6pgJ7PQtETuBeOxQypsJv7ACtZKKzOPYpJTedsLvsGVI44jp8fxO1tvlvdZr?=
 =?us-ascii?Q?J27KEbdOEe3jBeTIDcAyqPP50JbnqXx2DCd551IBunISTGLEj7DnXwc+V2z8?=
 =?us-ascii?Q?GKyM5geFC81XIcU7LMjOPzc2FsokAch6KYCaawJ0QUkz7+BLaqkU6MxBS6YB?=
 =?us-ascii?Q?oG3yj7+Ku07VysQ/FmKDpKrwn+LNlVFm4DQlQcaaZ1RapW3JzlT3mMbkUQuw?=
 =?us-ascii?Q?VSIlu3NIMPOnzzhk9Ds4OMhdO5/74UnHviZNB4S6x4waDnTkz0VubHLJNojQ?=
 =?us-ascii?Q?pnYUIVX79cRDL55OB7+UjGz8LuGsgx/o+Uk/dqVMU0Cs7lCBcMuHzZPd4kOz?=
 =?us-ascii?Q?Z9+4ZXZPOEHSq8uwDGrsKwDH7w7gwRmZtIn1IMYz?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 257d9bdb-356e-4bf1-3e69-08daacf6ed3b
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 08:42:57.2111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6IuEHoof6HYpkkwiYf04L3F9tkhY2pA29rFi2ox4pF1IIaY22Mq5z1RP6QGyEL1iezwr/6rz0IZKL+LCSbbCnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4709
X-Proofpoint-ORIG-GUID: bPnpEQ0EFaI-rLukziu3cOqtphJRKFXz
X-Proofpoint-GUID: bPnpEQ0EFaI-rLukziu3cOqtphJRKFXz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-13_06,2022-10-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=713 bulkscore=0 impostorscore=0 mlxscore=0 adultscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210130052
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 08:43:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171691

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 .../lttng/{lttng-tools_2.13.4.bb => lttng-tools_2.13.8.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.13.4.bb => lttng-tools_2.13.8.bb} (98%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb b/meta/recipes-kernel/lttng/lttng-tools_2.13.8.bb
similarity index 98%
rename from meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.13.8.bb
index 0ea4da05ce..0b6dfa48a4 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.13.8.bb
@@ -39,7 +39,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://disable-tests.patch \
            "
 
-SRC_URI[sha256sum] = "565f3102410a53d484f4c8ff517978f1dc59f67f9d16f872f4357f3ca12200f6"
+SRC_URI[sha256sum] = "b1e959579b260790930b20f3c7aa7cefb8a40e0de80d4a777c2bf78c6b353dc1"
 
 inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
 
-- 
2.25.1


