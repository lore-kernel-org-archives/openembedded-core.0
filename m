Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AA6CECAAA1
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 16:30:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.1557.1666974633850361472
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Oct 2022 09:30:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=TRqYOxWb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=83001d837a=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 29SBSPS8007599
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 16:30:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=y+SdchrLnERZfjQW4QKYSn96EPhNSbpwIKsTSzt7E7Q=;
 b=TRqYOxWb3bvN11Eb8ZFgw+kDxqcusjcpvvCOo+CAiuLpTcrfjN0nvGjLyofCHKKLamzS
 5W/odRFSJtlnGfMnHHqM6rdeZ/qv1LbuB9IcLJVEOs741QJE6f7zsnGEYfg/GkTh828U
 /7+pYJBu4m0sLf0mrdZgK0UWScyK1SGZ8WyLdacrbrmknZqHnlDDvSm5JUtdUKEsVpqg
 yc/IBJOir9c6hO+l9C+58AHvJNQ3itWueiDgTxcsDY6/82jmOh84Px94ZaI/W6cN9uJ/
 I8TJmJwje/bwglMOAhhvEALYX5gWLt6BMPFvvW6VcS02wVeTPC/BmOsrlo6Uc1LJMuCS pA== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kfg56hkmg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 16:30:32 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 28 Oct 2022 09:30:30 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 28 Oct 2022 09:30:28 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>, <Randy.MacLeod@windriver.com>,
        <narpat.mali@windriver.com>,
        Archana Polampalli
	<archana.polampalli@windriver.com>
Subject: [oe-core][PATCH 1/1] libpam: fix CVE-2022-28321
Date: Fri, 28 Oct 2022 16:30:22 +0000
Message-ID: <20221028163022.1620593-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: bnkSDDBynrxI_7C68v9rwKrrog4wvNW1
X-Proofpoint-ORIG-GUID: bnkSDDBynrxI_7C68v9rwKrrog4wvNW1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-28_07,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 phishscore=0 malwarescore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210280103
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 16:30:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172269

The Linux-PAM package before 1.5.2-6.1 for openSUSE Tumbleweed allows
authentication bypass for SSH logins. The pam_access.so module doesn't
correctly restrict login if a user tries to connect from an IP address
that is not resolvable via DNS. In such conditions, a user with denied
access to a machine can still get access. NOTE: the relevance of this
issue is largely limited to openSUSE Tumbleweed and openSUSE Factory;
it does not affect Linux-PAM upstream.

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-28321

Upstream patches:
https://github.com/linux-pam/linux-pam/commit/08992030c56c940c0707ccbc442b1c325aa01e6d
https://github.com/linux-pam/linux-pam/commit/23393bef92c1e768eda329813d7af55481c6ca9f

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../pam/libpam/CVE-2022-28321-0002.patch      | 205 ++++++++++++++++++
 meta/recipes-extended/pam/libpam_1.5.2.bb     |   1 +
 2 files changed, 206 insertions(+)
 create mode 100644 meta/recipes-extended/pam/libpam/CVE-2022-28321-0002.patch

diff --git a/meta/recipes-extended/pam/libpam/CVE-2022-28321-0002.patch b/meta/recipes-extended/pam/libpam/CVE-2022-28321-0002.patch
new file mode 100644
index 0000000000..e7bf03f9f7
--- /dev/null
+++ b/meta/recipes-extended/pam/libpam/CVE-2022-28321-0002.patch
@@ -0,0 +1,205 @@
+From 23393bef92c1e768eda329813d7af55481c6ca9f Mon Sep 17 00:00:00 2001
+From: Thorsten Kukuk <kukuk@suse.com>
+Date: Thu, 24 Feb 2022 10:37:32 +0100
+Subject: [PATCH 2/2] pam_access: handle hostnames in access.conf
+
+According to the manual page, the following entry is valid but does not
+work:
+-:root:ALL EXCEPT localhost
+
+See https://bugzilla.suse.com/show_bug.cgi?id=1019866
+
+Patched is based on PR#226 from Josef Moellers
+
+Upstream-Status: Backport
+CVE: CVE-2022-28321
+
+Reference to upstream patch:
+[https://github.com/linux-pam/linux-pam/commit/23393bef92c1e768eda329813d7af55481c6ca9f]
+
+Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
+---
+ modules/pam_access/pam_access.c | 95 ++++++++++++++++++++++++++-------
+ 1 file changed, 76 insertions(+), 19 deletions(-)
+
+diff --git a/modules/pam_access/pam_access.c b/modules/pam_access/pam_access.c
+index 277192b..bca424f 100644
+--- a/modules/pam_access/pam_access.c
++++ b/modules/pam_access/pam_access.c
+@@ -637,7 +637,7 @@ remote_match (pam_handle_t *pamh, char *tok, struct login_info *item)
+       if ((str_len = strlen(string)) > tok_len
+ 	  && strcasecmp(tok, string + str_len - tok_len) == 0)
+ 	return YES;
+-    } else if (tok[tok_len - 1] == '.') {
++    } else if (tok[tok_len - 1] == '.') {       /* internet network numbers (end with ".") */
+       struct addrinfo hint;
+ 
+       memset (&hint, '\0', sizeof (hint));
+@@ -678,7 +678,7 @@ remote_match (pam_handle_t *pamh, char *tok, struct login_info *item)
+       return NO;
+     }
+ 
+-    /* Assume network/netmask with an IP of a host.  */
++    /* Assume network/netmask, IP address or hostname.  */
+     return network_netmask_match(pamh, tok, string, item);
+ }
+ 
+@@ -696,7 +696,7 @@ string_match (pam_handle_t *pamh, const char *tok, const char *string,
+     /*
+      * If the token has the magic value "ALL" the match always succeeds.
+      * Otherwise, return YES if the token fully matches the string.
+-	 * "NONE" token matches NULL string.
++     * "NONE" token matches NULL string.
+      */
+ 
+     if (strcasecmp(tok, "ALL") == 0) {		/* all: always matches */
+@@ -714,7 +714,8 @@ string_match (pam_handle_t *pamh, const char *tok, const char *string,
+ 
+ /* network_netmask_match - match a string against one token
+  * where string is a hostname or ip (v4,v6) address and tok
+- * represents either a single ip (v4,v6) address or a network/netmask
++ * represents either a hostname, a single ip (v4,v6) address
++ * or a network/netmask
+  */
+ static int
+ network_netmask_match (pam_handle_t *pamh,
+@@ -723,10 +724,12 @@ network_netmask_match (pam_handle_t *pamh,
+     char *netmask_ptr;
+     char netmask_string[MAXHOSTNAMELEN + 1];
+     int addr_type;
++    struct addrinfo *ai = NULL;
+ 
+     if (item->debug)
+-    pam_syslog (pamh, LOG_DEBUG,
++      pam_syslog (pamh, LOG_DEBUG,
+ 		"network_netmask_match: tok=%s, item=%s", tok, string);
++
+     /* OK, check if tok is of type addr/mask */
+     if ((netmask_ptr = strchr(tok, '/')) != NULL)
+       {
+@@ -760,54 +763,108 @@ network_netmask_match (pam_handle_t *pamh,
+ 	    netmask_ptr = number_to_netmask(netmask, addr_type,
+ 		netmask_string, MAXHOSTNAMELEN);
+ 	  }
+-	}
++
++        /*
++         * Construct an addrinfo list from the IP address.
++         * This should not fail as the input is a correct IP address...
++         */
++	if (getaddrinfo (tok, NULL, NULL, &ai) != 0)
++	  {
++	    return NO;
++	  }
++      }
+     else
+-	/* NO, then check if it is only an addr */
+-	if (isipaddr(tok, NULL, NULL) != YES)
++      {
++        /*
++	 * It is either an IP address or a hostname.
++	 * Let getaddrinfo sort everything out
++	 */
++	if (getaddrinfo (tok, NULL, NULL, &ai) != 0)
+ 	  {
++	    pam_syslog(pamh, LOG_ERR, "cannot resolve hostname \"%s\"", tok);
++
+ 	    return NO;
+ 	  }
++	netmask_ptr = NULL;
++      }
+ 
+     if (isipaddr(string, NULL, NULL) != YES)
+       {
+-	/* Assume network/netmask with a name of a host.  */
+ 	struct addrinfo hint;
+ 
++	/* Assume network/netmask with a name of a host.  */
+ 	memset (&hint, '\0', sizeof (hint));
+ 	hint.ai_flags = AI_CANONNAME;
+ 	hint.ai_family = AF_UNSPEC;
+ 
+ 	if (item->gai_rv != 0)
++	  {
++	    freeaddrinfo(ai);
+ 	    return NO;
++	  }
+ 	else if (!item->res &&
+ 		(item->gai_rv = getaddrinfo (string, NULL, &hint, &item->res)) != 0)
++	  {
++	    freeaddrinfo(ai);
+ 	    return NO;
++	  }
+         else
+ 	  {
+ 	    struct addrinfo *runp = item->res;
++	    struct addrinfo *runp1;
+ 
+ 	    while (runp != NULL)
+ 	      {
+ 		char buf[INET6_ADDRSTRLEN];
+ 
+-		DIAG_PUSH_IGNORE_CAST_ALIGN;
+-		inet_ntop (runp->ai_family,
+-			runp->ai_family == AF_INET
+-			? (void *) &((struct sockaddr_in *) runp->ai_addr)->sin_addr
+-			: (void *) &((struct sockaddr_in6 *) runp->ai_addr)->sin6_addr,
+-			buf, sizeof (buf));
+-		DIAG_POP_IGNORE_CAST_ALIGN;
++		if (getnameinfo (runp->ai_addr, runp->ai_addrlen, buf, sizeof (buf), NULL, 0, NI_NUMERICHOST) != 0)
++		  {
++		    freeaddrinfo(ai);
++		    return NO;
++		  }
+ 
+-		if (are_addresses_equal(buf, tok, netmask_ptr))
++		for (runp1 = ai; runp1 != NULL; runp1 = runp1->ai_next)
+ 		  {
+-		    return YES;
++                    char buf1[INET6_ADDRSTRLEN];
++
++                    if (runp->ai_family != runp1->ai_family)
++                      continue;
++
++                    if (getnameinfo (runp1->ai_addr, runp1->ai_addrlen, buf1, sizeof (buf1), NULL, 0, NI_NUMERICHOST) != 0)
++		      {
++			freeaddrinfo(ai);
++			return NO;
++		      }
++
++                    if (are_addresses_equal (buf, buf1, netmask_ptr))
++                      {
++                        freeaddrinfo(ai);
++                        return YES;
++                      }
+ 		  }
+ 		runp = runp->ai_next;
+ 	      }
+ 	  }
+       }
+     else
+-      return (are_addresses_equal(string, tok, netmask_ptr));
++      {
++       struct addrinfo *runp1;
++
++       for (runp1 = ai; runp1 != NULL; runp1 = runp1->ai_next)
++         {
++           char buf1[INET6_ADDRSTRLEN];
++
++           (void) getnameinfo (runp1->ai_addr, runp1->ai_addrlen, buf1, sizeof (buf1), NULL, 0, NI_NUMERICHOST);
++
++           if (are_addresses_equal(string, buf1, netmask_ptr))
++             {
++               freeaddrinfo(ai);
++               return YES;
++             }
++         }
++      }
++
++  freeaddrinfo(ai);
+ 
+   return NO;
+ }
+-- 
+2.37.3
+
diff --git a/meta/recipes-extended/pam/libpam_1.5.2.bb b/meta/recipes-extended/pam/libpam_1.5.2.bb
index bde7fef8a2..3be879082e 100644
--- a/meta/recipes-extended/pam/libpam_1.5.2.bb
+++ b/meta/recipes-extended/pam/libpam_1.5.2.bb
@@ -24,6 +24,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/Linux-PAM-${PV}.tar.xz \
            file://0001-run-xtests.sh-check-whether-files-exist.patch \
            file://run-ptest \
            file://pam-volatiles.conf \
+           file://CVE-2022-28321-0002.patch \
            "
 
 SRC_URI[sha256sum] = "e4ec7131a91da44512574268f493c6d8ca105c87091691b8e9b56ca685d4f94d"
-- 
2.34.1


