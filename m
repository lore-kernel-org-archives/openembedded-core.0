Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.42])
 by mx.groups.io with SMTP id smtpd.web09.1682.1604356144448492204
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 14:29:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=O6YtLw42;
 spf=pass (domain: windriver.com, ip: 40.107.237.42, mailfrom: jason.wessel@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uak5NRbHSHmSvSn3VuxWabXiv1trgRQeuvcAO5hAdNWmbkQuaxeSDIcXZmtz2QatxYLqnARuUHAqFPSt9Teb//8eljQxnEwnCCIL4USFZpnaGnEx3oEgqXA3IBr6KLbpaYkzq+KZgLUswoAd0L526esVwIhWfyIWyMw+G35oDxcVzVSVu7ea58cUZ5BQQGI6I/k3sbSZ1c+OHh0xC3o9WQEUqLgyNmzxPsfR2tZkrEHoZiTDcDnQZv7fiSFZ2fAHnKwqq5YcDKHroC3WOJy5/NQWUwbuAkHs05Kxr3nHEiFBAz3NiskgP6e6IQKmzMcU0U4f+x2aqctHwotm3aL1QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w4/nynAV96jDLMp1Tl3ik5d0XB3qebO40P1rBC+A9NA=;
 b=QJQZPH91u8vcHrcrRBXMSdKeL3Brdbd4SG/XWuRMQVP1mxIP2nk9TNZTiBl/0nw9ahjyzpoJtXgm5VxA2VukrAzRRuEOmFFpiXu3pMDLojUvtEr4+wACGpGDM+kEL2qtx1b+5yMS3T5vdTKVb5vGgQwJtoClMEc9XIbKC7qdX3AMUzzWTLABcxnoA+ieNx7/hDH6sGvi8BUeYtwcOQyRqHfRJ8HpeTQchiEP2ECtG/wXa4Alba8doZoHr9xibIgRQXD2vgHgCzC2LUbCklml0hNKGUCL+3DT4UhV7dnWfHtKHddSSPf5AuI7h74K2VSBbkcQqq37bCTABDsL8CfixA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w4/nynAV96jDLMp1Tl3ik5d0XB3qebO40P1rBC+A9NA=;
 b=O6YtLw421eTkHacGqBSDk5EB8XXfgainsTVa1WIhU9goEHX+szOQ2PwDN9IES10fJ6PzVkteCOOdg66gnCyiHY6XwxoK3BBCK5i6q6RRrYfAJfhbIHLSncfolTuQt3phwbnsV8vZ6f7Eo+PtRT3JfKNtX4KXXphgf+WUFo89juw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3514.namprd11.prod.outlook.com (2603:10b6:5:61::26) by
 DM6PR11MB3594.namprd11.prod.outlook.com (2603:10b6:5:13b::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18; Mon, 2 Nov 2020 22:29:03 +0000
Received: from DM6PR11MB3514.namprd11.prod.outlook.com
 ([fe80::9945:c647:8f02:4a97]) by DM6PR11MB3514.namprd11.prod.outlook.com
 ([fe80::9945:c647:8f02:4a97%2]) with mapi id 15.20.3499.030; Mon, 2 Nov 2020
 22:29:03 +0000
From: "Jason Wessel" <jason.wessel@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/2] base-files/profile: Add universal resize function
Date: Mon,  2 Nov 2020 14:28:51 -0800
Message-Id: <20201102222852.38452-1-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [147.11.105.123]
X-ClientProxiedBy: SJ0PR13CA0106.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::21) To DM6PR11MB3514.namprd11.prod.outlook.com
 (2603:10b6:5:61::26)
Return-Path: jason.wessel@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp2.wrs.com (147.11.105.123) by SJ0PR13CA0106.namprd13.prod.outlook.com (2603:10b6:a03:2c5::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.10 via Frontend Transport; Mon, 2 Nov 2020 22:29:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89b3e337-733b-436c-48b1-08d87f7eb390
X-MS-TrafficTypeDiagnostic: DM6PR11MB3594:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB35949C9FBB89242F264A928E97100@DM6PR11MB3594.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oTkkPnZi37ITLwX2lrXykuU1dmuWZF2XalMu9aASWmMYGqKOe4Cgqu2zRXS8hYx0G9y1CCCLMVK9Sk9v2REGgGqllNF89GWB9fWk17x+1aXAkk9MOjaJeQjbTQAJ33RNk2tfIH5vNOZ/XPRwYKJa8eyLpXveCvBY1SHCVnG6RcJlySPyO3TZ6RHyT9ddLj9wU5rt04zIfwSdFEM23IjpJle2m22AXAzkZYvDZyQ0J3wRMvIGIrL7l5nnvJZgtj4dcgWjo6SW7XTZSGyeWHrYsbBDVVGnzY4Wh5FRs+dv9Z/c/uV9RwxjQNwO6VacUIPeoM9ZW1oXhlUo6ZS4D2ivRg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3514.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39850400004)(376002)(366004)(346002)(2616005)(86362001)(44832011)(6512007)(52116002)(36756003)(1076003)(83380400001)(26005)(6506007)(956004)(316002)(6486002)(186003)(16526019)(478600001)(5660300002)(2906002)(6666004)(8676002)(66476007)(66556008)(6916009)(66946007)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	2QidRm2hO0MZFBFe0bHjxVR+KxUQ4U8ahn4I2kwp3iIQH1ESHyGu6z9pgZHZv/JR7KV+7L+cHt3Bv1IW+h7YMQKvGM08V1oWfDEz64MDaNOdzKtC7ldaobi7Cc+ArE7a4srhp0vt076QHJBZQEOUvMAub8s4841B6P5JBUszrTaW5ZgpugR9Q4jrweI8eutQXlV/2izt1gDFcNgSLGmrxe/ScvxPWBIjpyXKQRYon4WoC1skA8XCpog/sh9FG3fGqP2D3YHSiBVJuVnZeiZoy6qoSfNVFMqem6WxVRqpXgWOyCQKTTz4drHTW+ZyFK1P/bjS9xJpvX2Ve+zx8aReM4hYMHltyIWa4KXygLJ2EwYV1YY2KDUnYT5sDUXn4V84CvibgijZ8lLa2evZsSNYBbldyleUTqK/r3is0SfQqDaDKcrNACXZkahCNRzZbmBsHyuPdvZ/5/iTfgHgRiUcFgMvg/biwqg9f0xkoSyuZcLLKPq1ZKwSfyFt0Pofg2UHIgkHlihln0zFt1OKSJIDPZxwZtVpVSHnIon4d40QJiyJUg8WRPZnnuOJBHRjdfNRNKbRejwzuYexa2nPXX7nSdXo5na0n9DTygup7d5NMrXBMb0oC3coe0F7040gigZSym1MvpbPrdik8vzyW8OPXg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89b3e337-733b-436c-48b1-08d87f7eb390
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3514.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2020 22:29:02.9728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wHjHI/DSaEfnFYM/nW1/OOrD++/XGSzbsmCLe9Wtr1KaXBmeCnpP5LHsF561VGuSsWmu3vjZoUjEYORmCe9/dgIWlO5T4ULBpXTXYh6o5b4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3594
Content-Type: text/plain

Using an editor or any kind of command line that wraps beyond the
column width of the session on a serial port is quite problematic
unless you are using an 80x24 session.

The original /etc/profile tried to use the resize binary if it was
available.  The problem is that you only get the resize binary if
xterm, or busybox is installed.

This updated /etc/profile will add a resize function available to the
shell when no xterm or busybox resize binary is found.  More care is
taken in this new version to test that terminal is interactive.  The
EDITOR and SHLVL environment variables are checked to prevent resize
from running necessarily.

The function definitions are not indented intentionally to keep them
to the 80 column width.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 .../base-files/base-files/profile             | 48 ++++++++++++++++---
 1 file changed, 41 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/base-files/base-files/profile b/meta/recipes-core/base-files/base-files/profile
index 9e4283e0c7..cc37e1ba77 100644
--- a/meta/recipes-core/base-files/base-files/profile
+++ b/meta/recipes-core/base-files/base-files/profile
@@ -2,7 +2,6 @@
 # and Bourne compatible shells (bash(1), ksh(1), ash(1), ...).
 
 PATH="/usr/local/bin:/usr/bin:/bin"
-EDITOR="vi"			# needed for packages like cron, git-commit
 [ "$TERM" ] || TERM="vt100"	# Basic terminal capab. For screen etc.
 
 # Add /sbin & co to $PATH for the root user
@@ -20,13 +19,48 @@ if [ -d /etc/profile.d ]; then
 	unset i
 fi
 
-# Make sure we are on a serial console (i.e. the device used starts with
-# /dev/tty[A-z]), otherwise we confuse e.g. the eclipse launcher which tries do
-# use ssh
-case $(tty 2>/dev/null) in
-	/dev/tty[A-z]*) [ -x @BINDIR@/resize ] && @BINDIR@/resize >/dev/null;;
-esac
+if [ -t 0 -a $# -eq 0 ]; then
+	if [ ! -x @BINDIR@/resize ] ; then
+		if [ -n "$BASH_VERSION" ] ; then
+# Optimized resize funciton for bash
+resize() {
+	local x y
+	IFS='[;' read -t 2 -p $(printf '\e7\e[r\e[999;999H\e[6n\e8') -sd R _ y x _
+	[ -n "$y" ] && \
+	echo -e "COLUMNS=$x;\nLINES=$y;\nexport COLUMNS LINES;" && \
+	stty cols $x rows $y
+}
+		else
+# Portable resize function for ash/bash/dash/ksh
+# with subshell to avoid local variables
+resize() {
+	(o=$(stty -g)
+	stty -echo raw min 0 time 2
+	printf '\0337\033[r\033[999;999H\033[6n\0338'
+	if echo R | read -d R x 2> /dev/null; then
+		IFS='[;R' read -t 2 -d R -r z y x _
+	else
+		IFS='[;R' read -r _ y x _
+	fi
+	stty "$o"
+	[ -z "$y" ] && y=${z##*[}&&x=${y##*;}&&y=${y%%;*}
+	[ -n "$y" ] && \
+	echo "COLUMNS=$x;"&&echo "LINES=$y;"&&echo "export COLUMNS LINES;"&& \
+	stty cols $x rows $y)
+}
+		fi
+	fi
+	# Use the EDITOR not being set as a trigger to call resize
+	# and only do this for /dev/tty[A-z] which are typically
+	# serial ports
+	if [ -z "$EDITOR" -a "$SHLVL" = 1 ] ; then
+		case $(tty 2>/dev/null) in
+			/dev/tty[A-z]*) resize >/dev/null;;
+		esac
+	fi
+fi
 
+EDITOR="vi"			# needed for packages like cron, git-commit
 export PATH PS1 OPIEDIR QPEDIR QTDIR EDITOR TERM
 
 umask 022
-- 
2.17.1

