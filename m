Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.51])
 by mx.groups.io with SMTP id smtpd.web11.3338.1604343575960576654
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 10:59:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=OmFZnv9u;
 spf=pass (domain: windriver.com, ip: 40.107.93.51, mailfrom: jason.wessel@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Um7YGvB+VY2/CxN6yfY9CfdEoIxEPZTtRT87HHqdiS2lu2SEumCNU3s42ua3WXS1f5SH4DYO4frdIqpwQ7t53BcY/pBFniEcrKNTcM5WMdbDMHZ35eLPSWSEu9lX37PgmgJUUgryau7SRvuqFCcENu4aLdy1tlkcsAqhVj0V55z9oq54ic7bMqR0vPIzADBUavbIEeiX4B567/ii+FEXTBCRpQEDKCKkzdweKfa3xWdJ7iSBMGuvQkmYwfX9eQPBI9K0359ggoGEDDVLvCPCYsvqPm8UO/Hsnv15q74WD/4c/Ds046Z4l64TsNArceOP4e4u8NDMd/bqDs2qleE3jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w4/nynAV96jDLMp1Tl3ik5d0XB3qebO40P1rBC+A9NA=;
 b=Rikf1IKXp8ZN8FIzoYbu3QK4Z4O9ce4RQQ+ohPr43bRPf0yTMwYuDJLfHQOkBC1HS89SzFjG6W0INJlhng3yVtWSME6LiCPe8rD3H/k15LQshwnmUDNqmWPbJrgNizx7XM9fUBv7xBA0dmY7Uw+yuu8jiU51emdJ9Eqs8D71eTLv7Pr5536nZEFTLffL9YNrFlSxpdZwo8lvVkZjH/hTJEKhyVVetCMXsqBvSmTif7NGB0FmNWNigxLgtYRde6mlnkWj52sNjFJcLExyVW4hwH7b9ZyKe9lCZi9+r1Wp6hO+T9/dkv/S/wRyKzG/mdYABWk/OMQkxSCMIxz/3VmWwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w4/nynAV96jDLMp1Tl3ik5d0XB3qebO40P1rBC+A9NA=;
 b=OmFZnv9u68av6pq1BUu0qglP/zdyXu8HbLBpYcyfMVA6uL7C7WnvYRhrjYsltmLTjbWnI4V73pHdPX1c+xGXRP8UrYPW4fmVpf0iHcZ6NLG8xMTuN3AawpstZ6bogC0U50lgKkQBtNF1/xoccim5yP7AL7JP0NiaoYTLVgYrJtc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3514.namprd11.prod.outlook.com (2603:10b6:5:61::26) by
 DM5PR11MB1433.namprd11.prod.outlook.com (2603:10b6:4:6::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18; Mon, 2 Nov 2020 18:59:33 +0000
Received: from DM6PR11MB3514.namprd11.prod.outlook.com
 ([fe80::9945:c647:8f02:4a97]) by DM6PR11MB3514.namprd11.prod.outlook.com
 ([fe80::9945:c647:8f02:4a97%2]) with mapi id 15.20.3499.030; Mon, 2 Nov 2020
 18:59:33 +0000
From: "Jason Wessel" <jason.wessel@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] base-files/profile: Add universal resize function
Date: Mon,  2 Nov 2020 10:59:20 -0800
Message-Id: <20201102185921.65148-1-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [147.11.105.123]
X-ClientProxiedBy: BYAPR06CA0006.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::19) To DM6PR11MB3514.namprd11.prod.outlook.com
 (2603:10b6:5:61::26)
Return-Path: jason.wessel@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp2.wrs.com (147.11.105.123) by BYAPR06CA0006.namprd06.prod.outlook.com (2603:10b6:a03:d4::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Mon, 2 Nov 2020 18:59:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 467fdedb-915b-4559-c1ce-08d87f616fac
X-MS-TrafficTypeDiagnostic: DM5PR11MB1433:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB1433CB668BBBF98A9C7ECD0E97100@DM5PR11MB1433.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aeJyRKfvu0HnfFX6n9CbskAF37QoeAbNdWfQosk0IzI35e7bP31WmtQrB9R8zsZZUus3WS84LuWm6jW5oAh+YSxvOu6qQdkhd5WvTgT652wlHRqrvSK4lED4H26ruvb4Xmr8Wg5J5XPgPcqublAI2oEmHTx+M8qFL4w3FRKkMYlgbbV2TaIud5ucwyqQuDLAvIATrGyH+OMWdGLd1r/DmoCOtIL2W2rGGZkNrK9sNXGePYipfPNwDyfDHH24lad6dgQ2Sljd99HbPEjJ/A0qjW6mTll1qeJO75ClRp+NgXpOydccQblVbchllvlIeyETI8wUXJ8h121X689jF/I+tw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3514.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(136003)(366004)(39850400004)(6916009)(8936002)(26005)(186003)(8676002)(478600001)(5660300002)(6666004)(16526019)(6486002)(6506007)(1076003)(52116002)(83380400001)(44832011)(2616005)(36756003)(66946007)(66556008)(2906002)(66476007)(6512007)(956004)(316002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	gDTgf0sTJko9WYCgL7NfKpbSYf0tW4oAu9FL2quVPKl/s8f2UqZ6mR/PDHWR4rZzIt75Z95tKSWCMMORWqtY+Tla4Xp45qTYGGpi486OfPqiWWhqziCYylOOVLF4y9U15h9quQqLe+68wfJpUI25G9Fml6J3mRbG/L+q73C79wvDf3VpVLPDQe/6rERqx6e+F/wb3CoBg+UmB78sBgErDluLjz5eTktsZ1zKx1pQmu+cadG7P+w6C/fEfAmYzXkci+82llvZNMvhcDIHjos6lbz+j43Ob9kldcusTOQaL+Udl2J7GwpEEaANWySUlL/xSpH7MDmjjI7vxiLnuSwxl4GVA53rWM5wvbEzZnZQMhqjw2/geH8rQbPmD8zVeyY7cj1gLUK4hgSLZmKtElNbcXo2+RCeu5NQGeknshGJ1QENpG4Vw3D7IsffbVGWyRj79jVRm4A3yh5ZfMNvXNEqv7H2zie2vGe8sxZElxVTgYlsPrC+waZNaCd0vERUPkwDS3Qy8adYKxdiWe8DOYSRtLJyexFVBg1gxlGa8Dzjs+zAbSEJ2kcyBJYMlkRFhQf3mxwcjc8kPXVUmNtM+06yd2GCwYGe3RwvINw1qOVwbMgGUbYhg+BvUXCIhs8UongjfiYlbUjRy9SwQJZ6wPj0dg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 467fdedb-915b-4559-c1ce-08d87f616fac
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3514.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2020 18:59:33.6192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dROLimmTmuuXh+8HFKZAOP27mjdpQjC9x8NQ/7HOZSeZ0a/gJN8hIYklHdC1ok1dx1keTPA/QzziL1Yd/91uQVFd2mqSx/aH0KqvS+HK9Hw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1433
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

