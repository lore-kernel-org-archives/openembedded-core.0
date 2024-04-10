Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43D77CD11C2
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 05:29:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.159812.1712726981110682683
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Apr 2024 22:29:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=AA3hFovA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4830dd134d=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43A5FXw8008446
	for <openembedded-core@lists.openembedded.org>; Tue, 9 Apr 2024 22:29:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=EZIqr
	ovFFJAHkV0mdtTX6ScGQgY2jyGyYLRz6i6Brac=; b=AA3hFovAFUexuDb56rodp
	DEa6Tv85Yj4SQCP645nCnt2+qkX7P/VIjp4Kk7i1NBYd5RmomroH5eEkubsv+x2L
	dpOc7ETU4CWLtDIn5BitFcH8QKKzTJlPTuC1nfpapgp5e9oyOO1y28m8CyQrTanW
	UOfCkDHoqSjbk+LPCpiZA3m4POJCZgnehoMcgHy3GXVhIVdUqxxSUMYZmx9esqGt
	Y0dOATK/dAn5+T5DAG9u72iwN+WbOORnBcRYmvGEHupOmvjQCZfT3hlSeb+bBUaz
	/dXwSJ1Zcu3elPOABmWxsJKyC+cNrTuxfkQaQbxyC/gEwC2YqTu8UxRudydHlhEs
	w==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xb5wgkjm3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 22:29:40 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Tue, 9 Apr 2024 22:29:39 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.37 via Frontend Transport; Tue, 9 Apr 2024 22:29:39 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] ncurses: Fix CVE-2023-50495
Date: Wed, 10 Apr 2024 13:29:38 +0800
Message-ID: <20240410052938.2802706-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: t4G15g4a8237x6Km9j6Py5KKqb2PfUNb
X-Proofpoint-ORIG-GUID: t4G15g4a8237x6Km9j6Py5KKqb2PfUNb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-09_12,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404100038
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 05:29:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198077

From: Mingli Yu <mingli.yu@windriver.com>

Backport a patch [1] to fix CVE-2023-50495.

[1] http://ncurses.scripts.mit.edu/?p=ncurses.git;a=commitdiff;h=7723dd6799ab10b32047ec73b14df9f107bafe99

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../ncurses/files/CVE-2023-50495.patch        | 301 ++++++++++++++++++
 meta/recipes-core/ncurses/ncurses_6.4.bb      |   1 +
 2 files changed, 302 insertions(+)
 create mode 100644 meta/recipes-core/ncurses/files/CVE-2023-50495.patch

diff --git a/meta/recipes-core/ncurses/files/CVE-2023-50495.patch b/meta/recipes-core/ncurses/files/CVE-2023-50495.patch
new file mode 100644
index 0000000000..7d90ddd30f
--- /dev/null
+++ b/meta/recipes-core/ncurses/files/CVE-2023-50495.patch
@@ -0,0 +1,301 @@
+From 7daae3f2139a678fe0ae0b42fcf8d807cbff485c Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Sun, 4 Feb 2024 13:42:38 +0800
+Subject: [PATCH] parse_entry.c: check return value of _nc_save_str
+
+* check return value of _nc_save_str(), in special case for tic where
+extended capabilities are processed but the terminal description was
+not initialized (report by Ziqiao Kong).
+
+* regenerate llib-* files.
+
+CVE: CVE-2023-50495
+
+Upstream-Status: Backport [http://ncurses.scripts.mit.edu/?p=ncurses.git;a=commitdiff;h=7723dd6799ab10b32047ec73b14df9f107bafe99]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ ncurses/llib-lncurses       | 15 +++++++++++++++
+ ncurses/llib-lncursest      | 15 +++++++++++++++
+ ncurses/llib-lncursestw     | 15 +++++++++++++++
+ ncurses/llib-lncursesw      | 15 +++++++++++++++
+ ncurses/llib-ltinfo         | 15 +++++++++++++++
+ ncurses/llib-ltinfot        | 15 +++++++++++++++
+ ncurses/llib-ltinfotw       | 15 +++++++++++++++
+ ncurses/llib-ltinfow        | 15 +++++++++++++++
+ ncurses/tinfo/parse_entry.c | 23 ++++++++++++++++-------
+ 9 files changed, 136 insertions(+), 7 deletions(-)
+
+diff --git a/ncurses/llib-lncurses b/ncurses/llib-lncurses
+index 211cf3b7..e4190aa2 100644
+--- a/ncurses/llib-lncurses
++++ b/ncurses/llib-lncurses
+@@ -3656,6 +3656,21 @@ char	*tiparm(
+ 		...)
+ 		{ return(*(char **)0); }
+ 
++#undef tiparm_s
++char	*tiparm_s(
++		int	num_expected,
++		int	tparm_type,
++		const char *string,
++		...)
++		{ return(*(char **)0); }
++
++#undef tiscan_s
++int	tiscan_s(
++		int	*num_expected,
++		int	*tparm_type,
++		const char *string)
++		{ return(*(int *)0); }
++
+ #undef _nc_tiparm
+ char	*_nc_tiparm(
+ 		int	expected,
+diff --git a/ncurses/llib-lncursest b/ncurses/llib-lncursest
+index 1b09d676..e07abba6 100644
+--- a/ncurses/llib-lncursest
++++ b/ncurses/llib-lncursest
+@@ -3741,6 +3741,21 @@ char	*tiparm(
+ 		...)
+ 		{ return(*(char **)0); }
+ 
++#undef tiparm_s
++char	*tiparm_s(
++		int	num_expected,
++		int	tparm_type,
++		const char *string,
++		...)
++		{ return(*(char **)0); }
++
++#undef tiscan_s
++int	tiscan_s(
++		int	*num_expected,
++		int	*tparm_type,
++		const char *string)
++		{ return(*(int *)0); }
++
+ #undef _nc_tiparm
+ char	*_nc_tiparm(
+ 		int	expected,
+diff --git a/ncurses/llib-lncursestw b/ncurses/llib-lncursestw
+index 4576e0fc..747c6be8 100644
+--- a/ncurses/llib-lncursestw
++++ b/ncurses/llib-lncursestw
+@@ -4702,6 +4702,21 @@ char	*tiparm(
+ 		...)
+ 		{ return(*(char **)0); }
+ 
++#undef tiparm_s
++char	*tiparm_s(
++		int	num_expected,
++		int	tparm_type,
++		const char *string,
++		...)
++		{ return(*(char **)0); }
++
++#undef tiscan_s
++int	tiscan_s(
++		int	*num_expected,
++		int	*tparm_type,
++		const char *string)
++		{ return(*(int *)0); }
++
+ #undef _nc_tiparm
+ char	*_nc_tiparm(
+ 		int	expected,
+diff --git a/ncurses/llib-lncursesw b/ncurses/llib-lncursesw
+index 127350d2..862305d9 100644
+--- a/ncurses/llib-lncursesw
++++ b/ncurses/llib-lncursesw
+@@ -4617,6 +4617,21 @@ char	*tiparm(
+ 		...)
+ 		{ return(*(char **)0); }
+ 
++#undef tiparm_s
++char	*tiparm_s(
++		int	num_expected,
++		int	tparm_type,
++		const char *string,
++		...)
++		{ return(*(char **)0); }
++
++#undef tiscan_s
++int	tiscan_s(
++		int	*num_expected,
++		int	*tparm_type,
++		const char *string)
++		{ return(*(int *)0); }
++
+ #undef _nc_tiparm
+ char	*_nc_tiparm(
+ 		int	expected,
+diff --git a/ncurses/llib-ltinfo b/ncurses/llib-ltinfo
+index a5cd7cd3..31e5e9a6 100644
+--- a/ncurses/llib-ltinfo
++++ b/ncurses/llib-ltinfo
+@@ -927,6 +927,21 @@ char	*tiparm(
+ 		...)
+ 		{ return(*(char **)0); }
+ 
++#undef tiparm_s
++char	*tiparm_s(
++		int	num_expected,
++		int	tparm_type,
++		const char *string,
++		...)
++		{ return(*(char **)0); }
++
++#undef tiscan_s
++int	tiscan_s(
++		int	*num_expected,
++		int	*tparm_type,
++		const char *string)
++		{ return(*(int *)0); }
++
+ #undef _nc_tiparm
+ char	*_nc_tiparm(
+ 		int	expected,
+diff --git a/ncurses/llib-ltinfot b/ncurses/llib-ltinfot
+index bd3de812..48e5c25a 100644
+--- a/ncurses/llib-ltinfot
++++ b/ncurses/llib-ltinfot
+@@ -1003,6 +1003,21 @@ char	*tiparm(
+ 		...)
+ 		{ return(*(char **)0); }
+ 
++#undef tiparm_s
++char	*tiparm_s(
++		int	num_expected,
++		int	tparm_type,
++		const char *string,
++		...)
++		{ return(*(char **)0); }
++
++#undef tiscan_s
++int	tiscan_s(
++		int	*num_expected,
++		int	*tparm_type,
++		const char *string)
++		{ return(*(int *)0); }
++
+ #undef _nc_tiparm
+ char	*_nc_tiparm(
+ 		int	expected,
+diff --git a/ncurses/llib-ltinfotw b/ncurses/llib-ltinfotw
+index 4d35a1e1..64dfdfa5 100644
+--- a/ncurses/llib-ltinfotw
++++ b/ncurses/llib-ltinfotw
+@@ -1025,6 +1025,21 @@ char	*tiparm(
+ 		...)
+ 		{ return(*(char **)0); }
+ 
++#undef tiparm_s
++char	*tiparm_s(
++		int	num_expected,
++		int	tparm_type,
++		const char *string,
++		...)
++		{ return(*(char **)0); }
++
++#undef tiscan_s
++int	tiscan_s(
++		int	*num_expected,
++		int	*tparm_type,
++		const char *string)
++		{ return(*(int *)0); }
++
+ #undef _nc_tiparm
+ char	*_nc_tiparm(
+ 		int	expected,
+diff --git a/ncurses/llib-ltinfow b/ncurses/llib-ltinfow
+index db846764..7e17a35f 100644
+--- a/ncurses/llib-ltinfow
++++ b/ncurses/llib-ltinfow
+@@ -949,6 +949,21 @@ char	*tiparm(
+ 		...)
+ 		{ return(*(char **)0); }
+ 
++#undef tiparm_s
++char	*tiparm_s(
++		int	num_expected,
++		int	tparm_type,
++		const char *string,
++		...)
++		{ return(*(char **)0); }
++
++#undef tiscan_s
++int	tiscan_s(
++		int	*num_expected,
++		int	*tparm_type,
++		const char *string)
++		{ return(*(int *)0); }
++
+ #undef _nc_tiparm
+ char	*_nc_tiparm(
+ 		int	expected,
+diff --git a/ncurses/tinfo/parse_entry.c b/ncurses/tinfo/parse_entry.c
+index 14bcb67e..0a0b5637 100644
+--- a/ncurses/tinfo/parse_entry.c
++++ b/ncurses/tinfo/parse_entry.c
+@@ -110,7 +110,7 @@ _nc_extend_names(ENTRY * entryp, const char *name, int token_type)
+ 	/* Well, we are given a cancel for a name that we don't recognize */
+ 	return _nc_extend_names(entryp, name, STRING);
+     default:
+-	return 0;
++	return NULL;
+     }
+ 
+     /* Adjust the 'offset' (insertion-point) to keep the lists of extended
+@@ -142,6 +142,11 @@ _nc_extend_names(ENTRY * entryp, const char *name, int token_type)
+ 	for (last = (unsigned) (max - 1); last > tindex; last--)
+ 
+     if (!found) {
++	char *saved;
++
++	if ((saved = _nc_save_str(name)) == NULL)
++	    return NULL;
++
+ 	switch (token_type) {
+ 	case BOOLEAN:
+ 	    tp->ext_Booleans++;
+@@ -169,7 +174,7 @@ _nc_extend_names(ENTRY * entryp, const char *name, int token_type)
+ 	TYPE_REALLOC(char *, actual, tp->ext_Names);
+ 	while (--actual > offset)
+ 	    tp->ext_Names[actual] = tp->ext_Names[actual - 1];
+-	tp->ext_Names[offset] = _nc_save_str(name);
++	tp->ext_Names[offset] = saved;
+     }
+ 
+     temp.nte_name = tp->ext_Names[offset];
+@@ -364,6 +369,8 @@ _nc_parse_entry(ENTRY * entryp, int literal, bool silent)
+ 	bool is_use = (strcmp(_nc_curr_token.tk_name, "use") == 0);
+ 	bool is_tc = !is_use && (strcmp(_nc_curr_token.tk_name, "tc") == 0);
+ 	if (is_use || is_tc) {
++	    char *saved;
++
+ 	    if (!VALID_STRING(_nc_curr_token.tk_valstring)
+ 		|| _nc_curr_token.tk_valstring[0] == '\0') {
+ 		_nc_warning("missing name for use-clause");
+@@ -377,11 +384,13 @@ _nc_parse_entry(ENTRY * entryp, int literal, bool silent)
+ 			    _nc_curr_token.tk_valstring);
+ 		continue;
+ 	    }
+-	    entryp->uses[entryp->nuses].name = _nc_save_str(_nc_curr_token.tk_valstring);
+-	    entryp->uses[entryp->nuses].line = _nc_curr_line;
+-	    entryp->nuses++;
+-	    if (entryp->nuses > 1 && is_tc) {
+-		BAD_TC_USAGE
++	    if ((saved = _nc_save_str(_nc_curr_token.tk_valstring)) != NULL) {
++			entryp->uses[entryp->nuses].name = saved;
++			entryp->uses[entryp->nuses].line = _nc_curr_line;
++			entryp->nuses++;
++			if (entryp->nuses > 1 && is_tc) {
++			    BAD_TC_USAGE
++		    }
+ 	    }
+ 	} else {
+ 	    /* normal token lookup */
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/ncurses/ncurses_6.4.bb b/meta/recipes-core/ncurses/ncurses_6.4.bb
index 2c621525f9..31f18bbadc 100644
--- a/meta/recipes-core/ncurses/ncurses_6.4.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.4.bb
@@ -6,6 +6,7 @@ SRC_URI += "file://0001-tic-hang.patch \
            file://exit_prototype.patch \
            file://0001-Fix-CVE-2023-29491.patch \
            file://0001-Updating-reset-code-ncurses-6.4-patch-20231104.patch \
+           file://CVE-2023-50495.patch \
            "
 # commit id corresponds to the revision in package version
 SRCREV = "79b9071f2be20a24c7be031655a5638f6032f29f"
-- 
2.25.1


