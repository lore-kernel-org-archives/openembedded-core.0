Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB500C3DA6E
	for <webhook@archiver.kernel.org>; Thu, 28 Dec 2023 06:41:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.118489.1703745660795295974
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Dec 2023 22:41:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=D6qKZQI+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0726f05314=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BS67aed022046
	for <openembedded-core@lists.openembedded.org>; Thu, 28 Dec 2023 06:41:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=Yx+njVa6hQ9f6BRUosfzs0OrVU/nsdhgAQAGvZt/7wc=; b=
	D6qKZQI+bBxcYk+R5MgzR0DmKrrTOCMUY3HM+kojwko8SG0br3iE4Zq/A2r4Fkzu
	DXiHs9aiDzoCzj+UAieDBSGbl04/+Ss502lLJpp8uSZ8DLBs3qnnetUlPlStSA8w
	Qbtxa96H6KWjxYfgrFPJ9F4bPQBtQoICR9rE84Zx9DubCFkvSpDr24X8KLvtq2PD
	uMHgiBVGK73y1/kWr7zo4Tsd71003rjVzWbCcspkQcxGcX+y96C7FOB6Xiqx2wZ/
	R4dreOGh5jIkDyoX4o8AD7+SoIWibZ7Ooz68FiNMenFiTkEUK1l86bxE3vBG8H1L
	e9C0hK0NKJ/OUP9g09fRlw==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v5mrxv02t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 28 Dec 2023 06:40:59 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Dec 2023 22:41:01 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 2/2] openssh: fix CVE-2023-51385
Date: Thu, 28 Dec 2023 06:40:39 +0000
Message-ID: <20231228064039.965852-2-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231228064039.965852-1-archana.polampalli@windriver.com>
References: <20231228064039.965852-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: ece7TnRBTV9YKpFGaSfgcc5FvX-dOmUG
X-Proofpoint-GUID: ece7TnRBTV9YKpFGaSfgcc5FvX-dOmUG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312280052
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Dec 2023 06:41:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192975

From: Archana Polampalli <archana.polampalli@windriver.com>

In ssh in OpenSSH before 9.6, OS command injection might occur if a user name or
host name has shell metacharacters, and this name is referenced by an expansion
token in certain situations. For example, an untrusted Git repository can have a
submodule with shell metacharacters in a user name or host name.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-51385

Upstream patches:
https://github.com/openssh/openssh-portable/commit/7ef3787c84b6b524501211b11a26c742f829af1a

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../openssh/openssh/CVE-2023-51385.patch      | 97 +++++++++++++++++++
 .../openssh/openssh_8.9p1.bb                  |  1 +
 2 files changed, 98 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2023-51385.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2023-51385.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2023-51385.patch
new file mode 100644
index 0000000000..b8e6813857
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2023-51385.patch
@@ -0,0 +1,97 @@
+From 7ef3787c84b6b524501211b11a26c742f829af1a Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Mon, 18 Dec 2023 14:47:44 +0000
+Subject: [PATCH] upstream: ban user/hostnames with most shell metacharacters
+ This makes ssh(1) refuse user or host names provided on the commandline that
+ contain most shell metacharacters.
+
+Some programs that invoke ssh(1) using untrusted data do not filter
+metacharacters in arguments they supply. This could create
+interactions with user-specified ProxyCommand and other directives
+that allow shell injection attacks to occur.
+
+It's a mistake to invoke ssh(1) with arbitrary untrusted arguments,
+but getting this stuff right can be tricky, so this should prevent
+most obvious ways of creating risky situations. It however is not
+and cannot be perfect: ssh(1) has no practical way of interpreting
+what shell quoting rules are in use and how they interact with the
+user's specified ProxyCommand.
+
+To allow configurations that use strange user or hostnames to
+continue to work, this strictness is applied only to names coming
+from the commandline. Names specified using User or Hostname
+directives in ssh_config(5) are not affected.
+
+feedback/ok millert@ markus@ dtucker@ deraadt@
+
+OpenBSD-Commit-ID: 3b487348b5964f3e77b6b4d3da4c3b439e94b2d9
+
+CVE: CVE-2023-51385
+
+Upstream-Status: Backport
+[https://github.com/openssh/openssh-portable/commit/7ef3787c84b6b524501211b11a26c742f829af1a]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ ssh.c | 39 +++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 39 insertions(+)
+
+diff --git a/ssh.c b/ssh.c
+index 8ff9788..82ed15f 100644
+--- a/ssh.c
++++ b/ssh.c
+@@ -611,6 +611,41 @@ ssh_conn_info_free(struct ssh_conn_info *cinfo)
+	free(cinfo);
+ }
+
++static int
++valid_hostname(const char *s)
++{
++	size_t i;
++
++	if (*s == '-')
++		return 0;
++	for (i = 0; s[i] != 0; i++) {
++		if (strchr("'`\"$\\;&<>|(){}", s[i]) != NULL ||
++		    isspace((u_char)s[i]) || iscntrl((u_char)s[i]))
++			return 0;
++	}
++	return 1;
++}
++
++static int
++valid_ruser(const char *s)
++{
++	size_t i;
++
++	if (*s == '-')
++		return 0;
++	for (i = 0; s[i] != 0; i++) {
++		if (strchr("'`\";&<>|(){}", s[i]) != NULL)
++			return 0;
++		/* Disallow '-' after whitespace */
++		if (isspace((u_char)s[i]) && s[i + 1] == '-')
++			return 0;
++		/* Disallow \ in last position */
++		if (s[i] == '\\' && s[i + 1] == '\0')
++			return 0;
++	}
++	return 1;
++}
++
+ /*
+  * Main program for the ssh client.
+  */
+@@ -1097,6 +1132,10 @@ main(int ac, char **av)
+	if (!host)
+		usage();
+
++	if (!valid_hostname(host))
++		fatal("hostname contains invalid characters");
++	if (options.user != NULL && !valid_ruser(options.user))
++		fatal("remote username contains invalid characters");
+	host_arg = xstrdup(host);
+
+	/* Initialize the command to execute on remote host. */
+--
+2.40.0
diff --git a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
index 3860899540..bc8e2d81b8 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
@@ -35,6 +35,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://fix-authorized-principals-command.patch \
            file://CVE-2023-48795.patch \
            file://CVE-2023-51384.patch \
+           file://CVE-2023-51385.patch \
            "
 SRC_URI[sha256sum] = "fd497654b7ab1686dac672fb83dfb4ba4096e8b5ffcdaccd262380ae58bec5e7"
 
-- 
2.40.0


