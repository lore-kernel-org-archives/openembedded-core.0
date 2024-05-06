Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D49FC4345F
	for <webhook@archiver.kernel.org>; Mon,  6 May 2024 04:34:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.13590.1714970041048856919
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 May 2024 21:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=VXWIXKwZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=585624214a=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4462ECW8005779
	for <openembedded-core@lists.openembedded.org>; Mon, 6 May 2024 04:34:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=5CGzy
	RTOJWheVDULFiGkZfcx1lU6FV98N9CW+dcR+ok=; b=VXWIXKwZ+aAJ2YP6mYJ7X
	biPwhGCqKfDfipjHgJclAB0S4PV9te05HSn0TyNTJ01tUrWkq5/xPQJbFAY9eGxj
	+ASZcQPmAh5tabuHI7vnf3JX9Z4mRZ7io2nGzyE4SWXAny8zjsUm3Kz6Fe+woXpj
	7oIsClz1GQJe9n6DlwAfwKhsHcJ9WmfW8CDX2Rowml/QS0sNQhz/tLXyPSEINyRi
	rf7i2lKaWV1DLSA8EUQWYBfjgV1wg6kDMsVcQRkKMvzzPWTx0GTJ40JpBSkuLaAj
	X1IFUyCCo291sPBKFFqVH6tIdNtM1kyiCjk5aD8RWPb6fn8AFeYj/9Y36q5QtuK1
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xwc051awn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 06 May 2024 04:34:00 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Sun, 5 May 2024 21:33:57 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/1] ncurses: Fix CVE-2023-45918
Date: Mon, 6 May 2024 04:33:40 +0000
Message-ID: <20240506043340.1002974-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: -znpwCw0H5HFLkJpWqlDynU-y0sXR0LQ
X-Proofpoint-GUID: -znpwCw0H5HFLkJpWqlDynU-y0sXR0LQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-06_01,2024-05-03_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2405060024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 May 2024 04:34:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199034

From: Soumya Sambu <soumya.sambu@windriver.com>

ncurses 6.4-20230610 has a NULL pointer dereference in tgetstr in tinfo/lib_termcap.c.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-45918

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../ncurses/files/CVE-2023-45918.patch        | 180 ++++++++++++++++++
 .../ncurses/ncurses_6.3+20220423.bb           |   1 +
 2 files changed, 181 insertions(+)
 create mode 100644 meta/recipes-core/ncurses/files/CVE-2023-45918.patch

diff --git a/meta/recipes-core/ncurses/files/CVE-2023-45918.patch b/meta/recipes-core/ncurses/files/CVE-2023-45918.patch
new file mode 100644
index 0000000000..172b3f8859
--- /dev/null
+++ b/meta/recipes-core/ncurses/files/CVE-2023-45918.patch
@@ -0,0 +1,180 @@
+From bcf02d3242f1c7d57224a95f7903fcf4b5e7695d Mon Sep 17 00:00:00 2001
+From: Thomas E. Dickey <dickey@invisible-island.net>
+Date: Fri, 16 Jun 2023 02:54:29 +0530
+Subject: [PATCH] Fix CVE-2023-45918
+
+CVE: CVE-2023-45918
+
+Upstream-Status: Backport [https://ncurses.scripts.mit.edu/?p=ncurses.git;a=commit;h=bcf02d3242f1c7d57224a95f7903fcf4b5e7695d]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ ncurses/tinfo/comp_error.c | 15 ++++++---
+ ncurses/tinfo/read_entry.c | 65 ++++++++++++++++++++++++++------------
+ 2 files changed, 56 insertions(+), 24 deletions(-)
+
+diff --git a/ncurses/tinfo/comp_error.c b/ncurses/tinfo/comp_error.c
+index 48f48784..ee518e28 100644
+--- a/ncurses/tinfo/comp_error.c
++++ b/ncurses/tinfo/comp_error.c
+@@ -60,8 +60,15 @@ _nc_get_source(void)
+ NCURSES_EXPORT(void)
+ _nc_set_source(const char *const name)
+ {
+-    FreeIfNeeded(SourceName);
+-    SourceName = strdup(name);
++    if (name == NULL) {
++	free(SourceName);
++	SourceName = NULL;
++    } else if (SourceName == NULL) {
++	SourceName = strdup(name);
++    } else if (strcmp(name, SourceName)) {
++	free(SourceName);
++	SourceName = strdup(name);
++    }
+ }
+
+ NCURSES_EXPORT(void)
+@@ -95,9 +102,9 @@ static NCURSES_INLINE void
+ where_is_problem(void)
+ {
+     fprintf(stderr, "\"%s\"", SourceName ? SourceName : "?");
+-    if (_nc_curr_line >= 0)
++    if (_nc_curr_line > 0)
+	fprintf(stderr, ", line %d", _nc_curr_line);
+-    if (_nc_curr_col >= 0)
++    if (_nc_curr_col > 0)
+	fprintf(stderr, ", col %d", _nc_curr_col);
+     if (TermType != 0 && TermType[0] != '\0')
+	fprintf(stderr, ", terminal '%s'", TermType);
+diff --git a/ncurses/tinfo/read_entry.c b/ncurses/tinfo/read_entry.c
+index 8ccb1570..101bbe09 100644
+--- a/ncurses/tinfo/read_entry.c
++++ b/ncurses/tinfo/read_entry.c
+@@ -140,12 +140,13 @@ convert_16bits(char *buf, NCURSES_INT2 *Numbers, int count)
+ }
+ #endif
+
+-static void
+-convert_strings(char *buf, char **Strings, int count, int size, char *table)
++static bool
++convert_strings(char *buf, char **Strings, int count, int size,
++		char *table, bool always)
+ {
+     int i;
+     char *p;
+-    bool corrupt = FALSE;
++    bool success = TRUE;
+
+     for (i = 0; i < count; i++) {
+	if (IS_NEG1(buf + 2 * i)) {
+@@ -161,13 +162,10 @@ convert_strings(char *buf, char **Strings, int count, int size, char *table)
+		TR(TRACE_DATABASE, ("Strings[%d] = %s", i,
+				    _nc_visbuf(Strings[i])));
+	    } else {
+-		if (!corrupt) {
+-		    corrupt = TRUE;
+-		    TR(TRACE_DATABASE,
+-		       ("ignore out-of-range index %d to Strings[]", nn));
+-		    _nc_warning("corrupt data found in convert_strings");
+-		}
+-		Strings[i] = ABSENT_STRING;
++		TR(TRACE_DATABASE,
++		   ("found out-of-range index %d to Strings[%d]", nn, i));
++		success = FALSE;
++		break;
+	    }
+	}
+
+@@ -177,10 +175,25 @@ convert_strings(char *buf, char **Strings, int count, int size, char *table)
+		if (*p == '\0')
+		    break;
+	    /* if there is no NUL, ignore the string */
+-	    if (p >= table + size)
++	    if (p >= table + size) {
+		Strings[i] = ABSENT_STRING;
++	    } else if (p == Strings[i] && always) {
++		TR(TRACE_DATABASE,
++		   ("found empty but required Strings[%d]", i));
++		success = FALSE;
++		break;
++	    }
++	} else if (always) {	/* names are always needed */
++	    TR(TRACE_DATABASE,
++	       ("found invalid but required Strings[%d]", i));
++	    success = FALSE;
++	    break;
+	}
+     }
++    if (!success) {
++	_nc_warning("corrupt data found in convert_strings");
++    }
++    return success;
+ }
+
+ static int
+@@ -383,7 +396,10 @@ _nc_read_termtype(TERMTYPE2 *ptr, char *buffer, int limit)
+	if (Read(string_table, (unsigned) str_size) != str_size) {
+	    returnDB(TGETENT_NO);
+	}
+-	convert_strings(buf, ptr->Strings, str_count, str_size, string_table);
++	if (!convert_strings(buf, ptr->Strings, str_count, str_size,
++			     string_table, FALSE)) {
++	    returnDB(TGETENT_NO);
++	}
+     }
+ #if NCURSES_XNAMES
+
+@@ -484,8 +500,10 @@ _nc_read_termtype(TERMTYPE2 *ptr, char *buffer, int limit)
+	       ("Before computing extended-string capabilities "
+		"str_count=%d, ext_str_count=%d",
+		str_count, ext_str_count));
+-	    convert_strings(buf, ptr->Strings + str_count, ext_str_count,
+-			    ext_str_limit, ptr->ext_str_table);
++	    if (!convert_strings(buf, ptr->Strings + str_count, ext_str_count,
++				 ext_str_limit, ptr->ext_str_table, FALSE)) {
++		returnDB(TGETENT_NO);
++	    }
+	    for (i = ext_str_count - 1; i >= 0; i--) {
+		TR(TRACE_DATABASE, ("MOVE from [%d:%d] %s",
+				    i, i + str_count,
+@@ -519,10 +537,13 @@ _nc_read_termtype(TERMTYPE2 *ptr, char *buffer, int limit)
+	    TR(TRACE_DATABASE,
+	       ("ext_NAMES starting @%d in extended_strings, first = %s",
+		base, _nc_visbuf(ptr->ext_str_table + base)));
+-	    convert_strings(buf + (2 * ext_str_count),
+-			    ptr->ext_Names,
+-			    (int) need,
+-			    ext_str_limit, ptr->ext_str_table + base);
++	    if (!convert_strings(buf + (2 * ext_str_count),
++				 ptr->ext_Names,
++				 (int) need,
++				 ext_str_limit, ptr->ext_str_table + base,
++				 TRUE)) {
++		returnDB(TGETENT_NO);
++	    }
+	}
+
+	TR(TRACE_DATABASE,
+@@ -575,13 +596,17 @@ _nc_read_file_entry(const char *const filename, TERMTYPE2 *ptr)
+	int limit;
+	char buffer[MAX_ENTRY_SIZE + 1];
+
+-	if ((limit = (int) fread(buffer, sizeof(char), sizeof(buffer), fp))
+-	    > 0) {
++	limit = (int) fread(buffer, sizeof(char), sizeof(buffer), fp);
++	if (limit > 0) {
++	    const char *old_source = _nc_get_source();
+
+	    TR(TRACE_DATABASE, ("read terminfo %s", filename));
++	    if (old_source == NULL)
++		_nc_set_source(filename);
+	    if ((code = _nc_read_termtype(ptr, buffer, limit)) == TGETENT_NO) {
+		_nc_free_termtype2(ptr);
+	    }
++	    _nc_set_source(old_source);
+	} else {
+	    code = TGETENT_NO;
+	}
+--
+2.40.0
diff --git a/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb b/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb
index da1e6d838d..1fa5e036e9 100644
--- a/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb
@@ -5,6 +5,7 @@ SRC_URI += "file://0001-tic-hang.patch \
            file://0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch \
            file://CVE-2023-29491.patch \
            file://CVE-2023-50495.patch \
+           file://CVE-2023-45918.patch \
            "
 # commit id corresponds to the revision in package version
 SRCREV = "a0bc708bc6954b5d3c0a38d92b683c3ec3135260"
-- 
2.40.0


