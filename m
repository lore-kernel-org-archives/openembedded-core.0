Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web09.24997.1604283501854373519
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Nov 2020 18:18:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=B/0LXXLX;
 spf=softfail (domain: windriver.com, ip: <nil>, mailfrom: kai.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UpLKBgz+3iPmh2M4iRFcoOTWDekhAkNfC+fyB66gn4y39a7pIyZnKAsKw5oZ1psWGofZBKmqn10og4h6TTta4j8zX2YkIuh0JoMqVU4LNxby6yj2jfe7gYzE9vikIQmyqhnvLr5LLDFWVFvhXV5ZbpvwfqkEQecplnn0+xEZ+jXkNXiO8kkGB1an+OEtba2Yj5xarTMxTTVBROgc/6UimSr7VOIPt18dkiHtAbp5DaolgAWBvyYjYBXfZPZH17TYjVGq8nOpVgFxd0Kt3oeScPfxnAYAryuVF72CTdIFWOlQhGAK/wR/LUsLw09QZPxVUpzPhTNdT0LevWsZCI6eaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vnWPqnR1OVmTK6sFPk4+Pm86v8qWHaxrg4wmOR2QLeg=;
 b=dWCeGMjhoSY7LbcCDnEaRbZvAGVWwld9Rjknchk3gI90XCzHaqRvBCZoHcLh3yjhQFaz4t+iV/aPYukqb2eTMMX1aVRdY9qxRiJstOqYc7ZFw+gMFauc4BWYDIdX9XRSTEVt+gi7a/U0gJXAOU2ybYoPHYOJ/x4nuJCUd2l2mAAtoCYb4yew0STUylVjPwYWnmz0RCEHBzxUaDSCutDZsIn3iOYpBZyKdgm/filU8pSrv/yrHtGknOOrbwcjrMaa4X24KBA8aD16Oc6p4usxCXYQ4cKXS9byRNANwwgGto9QvKxwoGVcWh6P5BesmHYj4VTqPQ2hG6w56j72Near8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vnWPqnR1OVmTK6sFPk4+Pm86v8qWHaxrg4wmOR2QLeg=;
 b=B/0LXXLXqSbydRRRK77wDeXQogtgbS9aUnZOoO88mVEc4OC2WW1QP5zew4xEAlZk6CIyhv0jOnzdf+0XkeOKzUOkePZyZjNBIDgqAnNHaC/J2FI9w5DfOpk/UJpsElJuWfVHxgfv8lrXSinYNH+qlzNPt78pYxX58rb2JV9WcFk=
Authentication-Results: opendreambox.org; dkim=none (message not signed)
 header.d=none;opendreambox.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB3294.namprd11.prod.outlook.com (2603:10b6:805:c4::33)
 by SN6PR11MB3485.namprd11.prod.outlook.com (2603:10b6:805:b7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.28; Mon, 2 Nov
 2020 02:18:21 +0000
Received: from SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b49d:2c09:ddcc:f5e2]) by SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b49d:2c09:ddcc:f5e2%5]) with mapi id 15.20.3499.030; Mon, 2 Nov 2020
 02:18:21 +0000
From: "kai" <kai.kang@windriver.com>
To: obi@opendreambox.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] systemd-systemctl: capable to call without argument
Date: Mon,  2 Nov 2020 10:17:56 +0800
Message-Id: <20201102021757.32532-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201102021757.32532-1-kai.kang@windriver.com>
References: <20201102021757.32532-1-kai.kang@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR03CA0112.apcprd03.prod.outlook.com
 (2603:1096:203:b0::28) To SN6PR11MB3294.namprd11.prod.outlook.com
 (2603:10b6:805:c4::33)
Return-Path: kai.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HK0PR03CA0112.apcprd03.prod.outlook.com (2603:1096:203:b0::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Mon, 2 Nov 2020 02:18:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3ff6014-6b27-4f60-e863-08d87ed5919d
X-MS-TrafficTypeDiagnostic: SN6PR11MB3485:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB3485A514B833F66332DBB75495100@SN6PR11MB3485.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xVJS+c60PeX73mvNR1G9WaGUZyVX+jHKqzMpOEhdYpJhpuK/yJ32VRDmXfqjUYDvoBvC0yzLw4j/2jP7z5lJpWYMZPI82HdVLVFPTRsVHLXZiPGcRTv5kpsupFpFMW7oLs+LoweN1ms2SQAM7eG/XG/q8476IGNeSA4ZcGn8eXc5ff1fGRYdTHrD02N8/msbzMELjqJYpF+9hpi+76Wm0Slbx2QeEowiSyniuHBBNJcDnhN7Bo1AzRh78qOavJt/fG2roYlsPRnRei0ImmIEcfunRRzD/1eNZiUDCwcFs4e2icGzbk/CRtWcYT6pj8fH2mwJSmacGl3dquYiarcNLg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3294.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39840400004)(366004)(376002)(396003)(136003)(2616005)(4326008)(956004)(86362001)(8676002)(52116002)(66476007)(8936002)(66556008)(6486002)(66946007)(186003)(16526019)(6512007)(6916009)(316002)(6666004)(1076003)(6506007)(36756003)(478600001)(83380400001)(9686003)(2906002)(26005)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	jv0Zosq4wVcZnAqC9ZZcW7QuFLmLGSCyxenwRqsQvnMeu7ZdTpj9rlkuRYuo35beeihXzSkaUustEKOgDpoWNVs1zA978lbAkvtOUOidOjovO5IpEE0SL/NNi1c7XzXKZrTN/4lSc54A9G516/cJ0ztoFGD+AQ2s4pbHYsF8DfVn0xQWpBxPme3+RIgmTFoYU2pLPpHH6+fsKQ4DTzFB4QHnA1shH3GDimI/6AHQFWOE+Ih0hUlWaks10wubFEr6OJmpbkwDGBfUzImNkbPJhmG0lBk7tfp32aiiBpcpWWhLKkIlTAhkc+nVsMNruvKx2kycpAhJFjXpMuYQ8AU4/h9oLe6HNk5Rwvp7ePYHqDLAGuWkMTkNRp6ptV65X7vZxf7/4smovHb2lE/fH3EhcQqqRDJofmbpT6RQYiz03RMrlHBq59nbw0KNnQt5rxEfS2OKxudnc805AsJ+f3wER6IDu6orLA4Wp+LX6vLNNTIa+mMLwwWUX58nbvB07erPimPuX/L8UU2jp25MoEmwH6Sc04DZb9JfzJNPLfAvuZDROG9E36Oj8Mx6N4DmxCQAMhqhnAq73BQ51wMipM5Y67FdjTE3vMjvcsFTdlSJ1tSYQSMOci48PUijvEY+1KvGEpdi248H9c/c4uxbIn3vtA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3ff6014-6b27-4f60-e863-08d87ed5919d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3294.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2020 02:18:21.2482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6BG/aaXkDNDjwdIVzmH4mbYYa/GLqQcRw1+sXAjW5DBfg78mIuuasDhmUFj7kqYzjd+FEB3c2bHJQ1q7FP7Peg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3485
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Make systemctl prints help mesages if run without any argument. It helps
to judge whether systemctl works in postscripts in systemd.bbclass.

Remove trailing white spaces as well.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-core/systemd/systemd-systemctl/systemctl | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
index 990de1ab39..c692b65920 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -30,7 +30,7 @@ class SystemdFile():
         self._parse(root, path)
         dirname = os.path.basename(path.name) + ".d"
         for location in locations:
-            for path2 in sorted((root / location / "system" / dirname).glob("*.conf")):                
+            for path2 in sorted((root / location / "system" / dirname).glob("*.conf")):
                 self._parse(root, path2)
 
     def _parse(self, root, path):
@@ -282,7 +282,7 @@ def main():
         sys.exit("Python 3.4 or greater is required")
 
     parser = argparse.ArgumentParser()
-    parser.add_argument('command', nargs=1, choices=['enable', 'mask',
+    parser.add_argument('command', nargs='?', choices=['enable', 'mask',
                                                      'preset-all'])
     parser.add_argument('service', nargs=argparse.REMAINDER)
     parser.add_argument('--root')
@@ -300,7 +300,11 @@ def main():
         locations.append(BASE_LIBDIR / "systemd")
     locations.append(LIBDIR / "systemd")
 
-    command = args.command[0]
+    command = args.command
+    if not command:
+        parser.print_help()
+        return 0
+
     if command == "mask":
         for service in args.service:
             SystemdUnit(root, service).mask()
-- 
2.17.1

