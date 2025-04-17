Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BCF1C369B2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 10:36:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5640.1744886192636453009
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 03:36:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6202619fc1=yogita.urade@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53H9oZGi022534
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 10:36:31 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 461u2madnx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 10:36:31 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 17 Apr 2025 03:36:28 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][scarthgap][PATCH 1/2] curl: fix CVE-2024-11053
Date: Thu, 17 Apr 2025 10:36:05 +0000
Message-ID: <20250417103606.3841180-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: mRgTo1LHfPLeu57j3F4ptd-FQEgas_Wc
X-Proofpoint-GUID: mRgTo1LHfPLeu57j3F4ptd-FQEgas_Wc
X-Authority-Analysis: v=2.4 cv=BaLY0qt2 c=1 sm=1 tr=0 ts=6800d9af cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=XR8D0OoHHMoA:10 a=ugkhXdxtAAAA:8 a=danhDmx_AAAA:8 a=NEAV23lmAAAA:8 a=yEquWHxyAAAA:8 a=HnMHPIp3AAAA:8
 a=t7CeM3EgAAAA:8 a=A1X0JdhQAAAA:8 a=FzFw0_VsxEFl-ty5ScYA:9 a=w_PdG_UVPmfrREP6:21 a=r-HJ9bD__24A:10 a=Wpz8ju6o9T4A:10 a=3UGHni60EXgA:10 a=VinBSYM5t5AA:10 a=s5zKW874KtQA:10 a=Ea3xMBwKpvXIEc3eveN9:22 a=_j3XSMEICZ-j_p4bQif0:22 a=j7VXw0cNxiiRp7-5Gr1y:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_03,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 mlxscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504170079
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 10:36:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215056

From: Yogita Urade <yogita.urade@windriver.com>

When asked to both use a `.netrc` file for credentials and to
follow HTTP redirects, curl could leak the password used for
the first host to the followed-to host under certain circumstances.

This flaw only manifests itself if the netrc file has an entry
that matches the redirect target hostname but the entry either
omits just the password or omits both login and password.

Reference:
https://curl.se/docs/CVE-2024-11053.html
https://git.launchpad.net/ubuntu/+source/curl/commit/?h=applied/ubuntu/noble-devel&id=9ea469c352a313104f750dea93e78df8d868c435

Upstream patches:
https://github.com/curl/curl/commit/9bee39bfed2c413b4cc4eb306a57ac92a1854907
https://github.com/curl/curl/commit/e9b9bbac22c26cf67316fa8e6c6b9e831af3194

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../curl/curl/CVE-2024-11053-0001.patch       | 353 +++++++++
 .../curl/curl/CVE-2024-11053-0002.patch       | 728 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |   2 +
 3 files changed, 1083 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2024-11053-0001.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2024-11053-0002.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2024-11053-0001.patch b/meta/recipes-support/curl/curl/CVE-2024-11053-0001.patch
new file mode 100644
index 0000000000..52ba390cde
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2024-11053-0001.patch
@@ -0,0 +1,353 @@
+From 9bee39bfed2c413b4cc4eb306a57ac92a1854907 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Sat, 12 Oct 2024 23:54:39 +0200
+Subject: [PATCH] url: use same credentials on redirect
+
+Previously it could lose the username and only use the password.
+
+Added test 998 and 999 to verify.
+
+Reported-by: Tobias Bora
+Fixes #15262
+Closes #15282
+
+Changes:
+- Test files are added in Makefile.inc.
+
+CVE: CVE-2024-11053
+Upstream-Status: Backport [https://github.com/curl/curl/commit/9bee39bfed2c413b4cc4eb306a57ac92a1854907]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ lib/transfer.c          |  3 ++
+ lib/url.c               | 19 +++++----
+ lib/urldata.h           |  9 +++-
+ tests/data/Makefile.inc |  2 +-
+ tests/data/test998      | 92 +++++++++++++++++++++++++++++++++++++++++
+ tests/data/test999      | 81 ++++++++++++++++++++++++++++++++++++
+ 6 files changed, 195 insertions(+), 11 deletions(-)
+ create mode 100644 tests/data/test998
+ create mode 100644 tests/data/test999
+
+diff --git a/lib/transfer.c b/lib/transfer.c
+index e31d1d6..ccd042b 100644
+--- a/lib/transfer.c
++++ b/lib/transfer.c
+@@ -700,6 +700,9 @@ CURLcode Curl_pretransfer(struct Curl_easy *data)
+       return CURLE_OUT_OF_MEMORY;
+   }
+
++  if(data->set.str[STRING_USERNAME] ||
++     data->set.str[STRING_PASSWORD])
++    data->state.creds_from = CREDS_OPTION;
+   if(!result)
+     result = Curl_setstropt(&data->state.aptr.user,
+                             data->set.str[STRING_USERNAME]);
+diff --git a/lib/url.c b/lib/url.c
+index 224b9f3..05431b9 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -1899,10 +1899,10 @@ static CURLcode parseurlandfillconn(struct Curl_easy *data,
+     return result;
+
+   /*
+-   * User name and password set with their own options override the
+-   * credentials possibly set in the URL.
++   * username and password set with their own options override the credentials
++   * possibly set in the URL, but netrc does not.
+    */
+-  if(!data->set.str[STRING_PASSWORD]) {
++  if(!data->state.aptr.passwd || (data->state.creds_from != CREDS_OPTION)) {
+     uc = curl_url_get(uh, CURLUPART_PASSWORD, &data->state.up.password, 0);
+     if(!uc) {
+       char *decoded;
+@@ -1915,12 +1915,13 @@ static CURLcode parseurlandfillconn(struct Curl_easy *data,
+       result = Curl_setstropt(&data->state.aptr.passwd, decoded);
+       if(result)
+         return result;
++      data->state.creds_from = CREDS_URL;
+     }
+     else if(uc != CURLUE_NO_PASSWORD)
+       return Curl_uc_to_curlcode(uc);
+   }
+
+-  if(!data->set.str[STRING_USERNAME]) {
++  if(!data->state.aptr.user || (data->state.creds_from != CREDS_OPTION)) {
+     /* we don't use the URL API's URL decoder option here since it rejects
+        control codes and we want to allow them for some schemes in the user
+        and password fields */
+@@ -1934,13 +1935,10 @@ static CURLcode parseurlandfillconn(struct Curl_easy *data,
+         return result;
+       conn->user = decoded;
+       result = Curl_setstropt(&data->state.aptr.user, decoded);
++      data->state.creds_from = CREDS_URL;
+     }
+     else if(uc != CURLUE_NO_USER)
+       return Curl_uc_to_curlcode(uc);
+-    else if(data->state.aptr.passwd) {
+-      /* no user was set but a password, set a blank user */
+-      result = Curl_setstropt(&data->state.aptr.user, "");
+-    }
+     if(result)
+       return result;
+   }
+@@ -2730,7 +2728,8 @@ static CURLcode override_login(struct Curl_easy *data,
+     int ret;
+     bool url_provided = FALSE;
+
+-    if(data->state.aptr.user) {
++    if(data->state.aptr.user &&
++       (data->state.creds_from != CREDS_NETRC)) {
+       /* there was a user name in the URL. Use the URL decoded version */
+       userp = &data->state.aptr.user;
+       url_provided = TRUE;
+@@ -2778,6 +2777,7 @@ static CURLcode override_login(struct Curl_easy *data,
+       result = Curl_setstropt(&data->state.aptr.user, *userp);
+       if(result)
+         return result;
++      data->state.creds_from = CREDS_NETRC;
+     }
+   }
+   if(data->state.aptr.user) {
+@@ -2795,6 +2795,7 @@ static CURLcode override_login(struct Curl_easy *data,
+     CURLcode result = Curl_setstropt(&data->state.aptr.passwd, *passwdp);
+     if(result)
+       return result;
++    data->state.creds_from = CREDS_NETRC;
+   }
+   if(data->state.aptr.passwd) {
+     uc = curl_url_set(data->state.uh, CURLUPART_PASSWORD,
+diff --git a/lib/urldata.h b/lib/urldata.h
+index ce28f25..b68d023 100644
+--- a/lib/urldata.h
++++ b/lib/urldata.h
+@@ -1207,6 +1207,11 @@ struct urlpieces {
+   char *query;
+ };
+
++#define CREDS_NONE   0
++#define CREDS_URL    1 /* from URL */
++#define CREDS_OPTION 2 /* set with a CURLOPT_ */
++#define CREDS_NETRC  3 /* found in netrc */
++
+ struct UrlState {
+   /* Points to the connection cache */
+   struct conncache *conn_cache;
+@@ -1344,7 +1349,6 @@ struct UrlState {
+     char *proxyuser;
+     char *proxypasswd;
+   } aptr;
+-
+   unsigned char httpwant; /* when non-zero, a specific HTTP version requested
+                              to be used in the library's request(s) */
+   unsigned char httpversion; /* the lowest HTTP version*10 reported by any
+@@ -1354,6 +1358,9 @@ struct UrlState {
+   unsigned char select_bits; /* != 0 -> bitmask of socket events for this
+                                  transfer overriding anything the socket may
+                                  report */
++  unsigned int creds_from:2; /* where is the server credentials originating
++                                from, see the CREDS_* defines above */
++
+ #ifdef CURLDEBUG
+   BIT(conncache_lock);
+ #endif
+diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
+index d89e565..03cb6a0 100644
+--- a/tests/data/Makefile.inc
++++ b/tests/data/Makefile.inc
+@@ -126,7 +126,7 @@ test952 test953 test954 test955 test956 test957 test958 test959 test960 \
+ test961 test962 test963 test964 test965 test966 test967 test968 test969 \
+ test970 test971 test972 test973 test974 test975 test976 test977 test978 \
+ test979 test980 test981 test982 test983 test984 test985 test986 test987 \
+-test988 test989 test990 test991 test992 \
++test988 test989 test990 test991 test992 test998 test999 \
+ \
+ test1000 test1001 test1002 test1003 test1004 test1005 test1006 test1007 \
+ test1008 test1009 test1010 test1011 test1012 test1013 test1014 test1015 \
+diff --git a/tests/data/test998 b/tests/data/test998
+new file mode 100644
+index 0000000..596b18e
+--- /dev/null
++++ b/tests/data/test998
+@@ -0,0 +1,92 @@
++<testcase>
++ <info>
++ <keywords>
++ HTTP
++ --location-trusted
++ </keywords>
++ </info>
++
++ #
++ # Server-side
++ <reply>
++ <data>
++ HTTP/1.1 301 redirect
++ Date: Tue, 09 Nov 2010 14:49:00 GMT
++ Server: test-server/fake
++ Content-Length: 0
++ Connection: close
++ Content-Type: text/html
++ Location: http://somewhere.else.example/a/path/%TESTNUMBER0002
++
++ </data>
++ <data2>
++ HTTP/1.1 200 OK
++ Date: Tue, 09 Nov 2010 14:49:00 GMT
++ Content-Length: 6
++ Content-Type: text/html
++ Funny-head: yesyes
++
++ -foo-
++ </data2>
++
++ <datacheck>
++ HTTP/1.1 301 redirect
++ Date: Tue, 09 Nov 2010 14:49:00 GMT
++ Server: test-server/fake
++ Content-Length: 0
++ Connection: close
++ Content-Type: text/html
++ Location: http://somewhere.else.example/a/path/%TESTNUMBER0002
++
++ HTTP/1.1 200 OK
++ Date: Tue, 09 Nov 2010 14:49:00 GMT
++ Content-Length: 6
++ Content-Type: text/html
++ Funny-head: yesyes
++
++ -foo-
++ </datacheck>
++
++ </reply>
++
++ #
++ # Client-side
++ <client>
++ <features>
++ proxy
++ </features>
++ <server>
++ http
++ </server>
++ <name>
++ HTTP with auth in URL redirected to another host
++ </name>
++ <command>
++ -x %HOSTIP:%HTTPPORT http://alberto:einstein@somwhere.example/%TESTNUMBER --location-trusted
++ </command>
++ </client>
++
++ #
++ # Verify data after the test has been "shot"
++ <verify>
++ <strip>
++ QUIT
++ </strip>
++ <protocol>
++ GET http://somwhere.example/998 HTTP/1.1
++ Host: somwhere.example
++ Authorization: Basic YWxiZXJ0bzplaW5zdGVpbg==
++ User-Agent: curl/%VERSION
++ Accept: */*
++ Proxy-Connection: Keep-Alive
++
++ GET http://somewhere.else.example/a/path/9980002 HTTP/1.1
++ Host: somewhere.else.example
++ Authorization: Basic YWxiZXJ0bzplaW5zdGVpbg==
++ User-Agent: curl/%VERSION
++ Accept: */*
++ Proxy-Connection: Keep-Alive
++
++ </protocol>
++ </verify>
++ </testcase>
+diff --git a/tests/data/test999 b/tests/data/test999
+new file mode 100644
+index 0000000..184821d
+--- /dev/null
++++ b/tests/data/test999
+@@ -0,0 +1,81 @@
++<testcase>
++ <info>
++ <keywords>
++ HTTP
++ --location-trusted
++ </keywords>
++ </info>
++
++ #
++ # Server-side
++ <reply>
++ <data nocheck="yes">
++ HTTP/1.1 200 OK
++ Date: Tue, 09 Nov 2010 14:49:00 GMT
++ Content-Length: 6
++ Content-Type: text/html
++ Funny-head: yesyes
++
++ -foo-
++ </data>
++
++ <datacheck>
++ HTTP/1.1 301 redirect
++ Date: Tue, 09 Nov 2010 14:49:00 GMT
++ Server: test-server/fake
++ Content-Length: 0
++ Connection: close
++ Content-Type: text/html
++ Location: http://somewhere.else.example/a/path/%TESTNUMBER0002
++
++ HTTP/1.1 200 OK
++ Date: Tue, 09 Nov 2010 14:49:00 GMT
++ Content-Length: 6
++ Content-Type: text/html
++ Funny-head: yesyes
++
++ -foo-
++ </datacheck>
++
++ </reply>
++
++ #
++ # Client-side
++ <client>
++ <features>
++ proxy
++ </features>
++ <server>
++ http
++ </server>
++ <name>
++ HTTP with auth in first URL but not second
++ </name>
++ <command>
++ -x %HOSTIP:%HTTPPORT http://alberto:einstein@somwhere.example/%TESTNUMBER http://somewhere.else.example/%TESTNUMBER
++ </command>
++ </client>
++
++ #
++ # Verify data after the test has been "shot"
++ <verify>
++ <strip>
++ QUIT
++ </strip>
++ <protocol>
++ GET http://somwhere.example/%TESTNUMBER HTTP/1.1
++ Host: somwhere.example
++ Authorization: Basic YWxiZXJ0bzplaW5zdGVpbg==
++ User-Agent: curl/%VERSION
++ Accept: */*
++ Proxy-Connection: Keep-Alive
++
++ GET http://somewhere.else.example/%TESTNUMBER HTTP/1.1
++ Host: somewhere.else.example
++ User-Agent: curl/%VERSION
++ Accept: */*
++ Proxy-Connection: Keep-Alive
++
++ </protocol>
++ </verify>
++ </testcase>
+--
+2.40.0
diff --git a/meta/recipes-support/curl/curl/CVE-2024-11053-0002.patch b/meta/recipes-support/curl/curl/CVE-2024-11053-0002.patch
new file mode 100644
index 0000000000..7f45f79cf2
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2024-11053-0002.patch
@@ -0,0 +1,728 @@
+From e9b9bbac22c26cf67316fa8e6c6b9e831af31949 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Fri, 15 Nov 2024 11:06:36 +0100
+Subject: [PATCH] netrc: address several netrc parser flaws
+
+- make sure that a match that returns a username also returns a
+  password, that should be blank if no password is found
+
+- fix handling of multiple logins for same host where the password/login
+  order might be reversed.
+
+- reject credentials provided in the .netrc if they contain ASCII control
+  codes - if the used protocol does not support such (like HTTP and WS do)
+
+Reported-by: Harry Sintonen
+
+Add test 478, 479 and 480 to verify. Updated unit 1304.
+
+Closes #15586
+
+Changes:
+- Refresh patch context.
+- Adjust `%LOGDIR/` to 'log/' due to its absence in code.
+- Backported only required enum found_state defination from:
+  https://github.com/curl/curl/commit/3b43a05e000aa8f65bda513f733a73fefe35d5ca
+- Replaces the previous usage of the state_login, state_password, and
+  state_our_login variables with the found_state enum, which includes the
+  values NONE, LOGIN, and PASSWORD. As a result, all conditionals and memory
+  management logic associated with these variables were updated.
+
+CVE: CVE-2024-11053
+Upstream-Status: Backport [https://github.com/curl/curl/commit/e9b9bbac22c26cf67316fa8e6c6b9e831af3194]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ lib/netrc.c             | 122 ++++++++++++++++++++++------------------
+ lib/url.c               |  59 ++++++++++++-------
+ tests/data/Makefile.inc |   2 +-
+ tests/data/test478      |  73 ++++++++++++++++++++++++
+ tests/data/test479      | 107 +++++++++++++++++++++++++++++++++++
+ tests/data/test480      |  38 +++++++++++++
+ tests/unit/unit1304.c   |  75 +++++++-----------------
+ 7 files changed, 347 insertions(+), 129 deletions(-)
+ create mode 100644 tests/data/test478
+ create mode 100644 tests/data/test479
+ create mode 100644 tests/data/test480
+
+diff --git a/lib/netrc.c b/lib/netrc.c
+index cd2a284..64efdc0 100644
+--- a/lib/netrc.c
++++ b/lib/netrc.c
+@@ -49,6 +49,15 @@ enum host_lookup_state {
+   MACDEF
+ };
+
++enum found_state {
++  NONE,
++  LOGIN,
++  PASSWORD
++};
++
++#define FOUND_LOGIN    1
++#define FOUND_PASSWORD 2
++
+ #define NETRC_FILE_MISSING 1
+ #define NETRC_FAILED -1
+ #define NETRC_SUCCESS 0
+@@ -59,23 +68,20 @@ enum host_lookup_state {
+  * Returns zero on success.
+  */
+ static int parsenetrc(const char *host,
+-                      char **loginp,
++                      char **loginp, /* might point to a username */
+                       char **passwordp,
+                       char *netrcfile)
+ {
+   FILE *file;
+   int retcode = NETRC_FILE_MISSING;
+   char *login = *loginp;
+-  char *password = *passwordp;
+-  bool specific_login = (login && *login != 0);
+-  bool login_alloc = FALSE;
+-  bool password_alloc = FALSE;
++  char *password = NULL;
++  bool specific_login = login; /* points to something */
+   enum host_lookup_state state = NOTHING;
+-
+-  char state_login = 0;      /* Found a login keyword */
+-  char state_password = 0;   /* Found a password keyword */
+-  int state_our_login = TRUE;  /* With specific_login, found *our* login
+-                                  name (or login-less line) */
++  enum found_state keyword = NONE;
++  unsigned char found = 0; /* login + password found bits, as they can come in
++                              any order */
++  bool our_login = FALSE;  /* found our login name */
+
+   DEBUGASSERT(netrcfile);
+
+@@ -97,7 +103,7 @@ static int parsenetrc(const char *host,
+           continue;
+       }
+       tok = netrcbuffer;
+-      while(tok) {
++      while(tok && !done) {
+         while(ISBLANK(*tok))
+           tok++;
+         /* tok is first non-space letter */
+@@ -156,11 +162,6 @@ static int parsenetrc(const char *host,
+           }
+         }
+
+-        if((login && *login) && (password && *password)) {
+-          done = TRUE;
+-          break;
+-        }
+-
+         switch(state) {
+         case NOTHING:
+           if(strcasecompare("macdef", tok)) {
+@@ -175,6 +176,12 @@ static int parsenetrc(const char *host,
+                after this we need to search for 'login' and
+                'password'. */
+             state = HOSTFOUND;
++            keyword = NONE;
++            found = 0;
++            our_login = FALSE;
++            Curl_safefree(password);
++            if(!specific_login)
++              Curl_safefree(login);
+           }
+           else if(strcasecompare("default", tok)) {
+             state = HOSTVALID;
+@@ -198,48 +205,55 @@ static int parsenetrc(const char *host,
+           break;
+         case HOSTVALID:
+           /* we are now parsing sub-keywords concerning "our" host */
+-          if(state_login) {
++          if(keyword == LOGIN) {
+             if(specific_login) {
+-              state_our_login = !Curl_timestrcmp(login, tok);
++              our_login = !Curl_timestrcmp(login, tok);
+             }
+-            else if(!login || Curl_timestrcmp(login, tok)) {
+-              if(login_alloc) {
+-                free(login);
+-                login_alloc = FALSE;
+-              }
++            else {
++              our_login = TRUE;
++              free(login);
+               login = strdup(tok);
+               if(!login) {
+                 retcode = NETRC_FAILED; /* allocation failed */
+                 goto out;
+               }
+-              login_alloc = TRUE;
+             }
+-            state_login = 0;
++          found |= FOUND_LOGIN;
++          keyword = NONE;
+           }
+-          else if(state_password) {
+-            if((state_our_login || !specific_login)
+-               && (!password || Curl_timestrcmp(password, tok))) {
+-              if(password_alloc) {
+-                free(password);
+-                password_alloc = FALSE;
+-              }
+-              password = strdup(tok);
+-              if(!password) {
+-                retcode = NETRC_FAILED; /* allocation failed */
+-                goto out;
+-              }
+-              password_alloc = TRUE;
++          else if(keyword == PASSWORD) {
++            free(password);
++            password = strdup(tok);
++            if(!password) {
++              retcode = NETRC_FAILED; /* allocation failed */
++              goto out;
+             }
+-            state_password = 0;
++          found |= FOUND_PASSWORD;
++          keyword = NONE;
+           }
+           else if(strcasecompare("login", tok))
+-            state_login = 1;
++            keyword = LOGIN;
+           else if(strcasecompare("password", tok))
+-            state_password = 1;
++            keyword = PASSWORD;
+           else if(strcasecompare("machine", tok)) {
+-            /* ok, there's machine here go => */
++            /* a new machine here */
+             state = HOSTFOUND;
+-            state_our_login = FALSE;
++            keyword = NONE;
++            found = 0;
++            Curl_safefree(password);
++            if(!specific_login)
++              Curl_safefree(login);
++          }
++          else if(strcasecompare("default", tok)) {
++            state = HOSTVALID;
++            retcode = NETRC_SUCCESS; /* we did find our host */
++            Curl_safefree(password);
++            if(!specific_login)
++              Curl_safefree(login);
++          }
++          if((found == (FOUND_PASSWORD|FOUND_LOGIN)) && our_login) {
++            done = TRUE;
++            break;
+           }
+           break;
+         } /* switch (state) */
+@@ -249,24 +263,22 @@ static int parsenetrc(const char *host,
+
+ out:
+     Curl_dyn_free(&buf);
++    if(!retcode && !password && our_login) {
++      /* success without a password, set a blank one */
++      password = strdup("");
++      if(!password)
++        retcode = 1; /* out of memory */
++    }
+     if(!retcode) {
+       /* success */
+-      if(login_alloc) {
+-        if(*loginp)
+-          free(*loginp);
++      if(!specific_login)
+         *loginp = login;
+-      }
+-      if(password_alloc) {
+-        if(*passwordp)
+-          free(*passwordp);
+-        *passwordp = password;
+-      }
++      *passwordp = password;
+     }
+     else {
+-      if(login_alloc)
++      if(!specific_login)
+         free(login);
+-      if(password_alloc)
+-        free(password);
++      free(password);
+     }
+     fclose(file);
+   }
+diff --git a/lib/url.c b/lib/url.c
+index 05431b9..1439c9e 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -2699,6 +2699,17 @@ static CURLcode parse_remote_port(struct Curl_easy *data,
+   return CURLE_OK;
+ }
+
++static bool str_has_ctrl(const char *input)
++{
++  const unsigned char *str = (const unsigned char *)input;
++  while(*str) {
++    if(*str < 0x20)
++      return TRUE;
++    str++;
++  }
++  return FALSE;
++}
++
+ /*
+  * Override the login details from the URL with that in the CURLOPT_USERPWD
+  * option or a .netrc file, if applicable.
+@@ -2730,29 +2741,39 @@ static CURLcode override_login(struct Curl_easy *data,
+
+     if(data->state.aptr.user &&
+        (data->state.creds_from != CREDS_NETRC)) {
+-      /* there was a user name in the URL. Use the URL decoded version */
++      /* there was a username with a length in the URL. Use the URL decoded
++         version */
+       userp = &data->state.aptr.user;
+       url_provided = TRUE;
+     }
+
+-    ret = Curl_parsenetrc(conn->host.name,
+-                          userp, passwdp,
+-                          data->set.str[STRING_NETRC_FILE]);
+-    if(ret > 0) {
+-      infof(data, "Couldn't find host %s in the %s file; using defaults",
+-            conn->host.name,
+-            (data->set.str[STRING_NETRC_FILE] ?
+-             data->set.str[STRING_NETRC_FILE] : ".netrc"));
+-    }
+-    else if(ret < 0) {
+-      failf(data, ".netrc parser error");
+-      return CURLE_READ_ERROR;
+-    }
+-    else {
+-      /* set bits.netrc TRUE to remember that we got the name from a .netrc
+-         file, so that it is safe to use even if we followed a Location: to a
+-         different host or similar. */
+-      conn->bits.netrc = TRUE;
++    if(!*passwdp) {
++      ret = Curl_parsenetrc(conn->host.name, userp, passwdp,
++                            data->set.str[STRING_NETRC_FILE]);
++      if(ret > 0) {
++        infof(data, "Couldn't find host %s in the %s file; using defaults",
++              conn->host.name,
++              (data->set.str[STRING_NETRC_FILE] ?
++               data->set.str[STRING_NETRC_FILE] : ".netrc"));
++      }
++      else if(ret < 0) {
++        failf(data, ".netrc parser error");
++        return CURLE_READ_ERROR;
++      }
++      else {
++        if(!(conn->handler->flags&PROTOPT_USERPWDCTRL)) {
++          /* if the protocol can't handle control codes in credentials, make
++             sure there are none */
++          if(str_has_ctrl(*userp) || str_has_ctrl(*passwdp)) {
++            failf(data, "control code detected in .netrc credentials");
++            return CURLE_READ_ERROR;
++          }
++        }
++        /* set bits.netrc TRUE to remember that we got the name from a .netrc
++           file, so that it is safe to use even if we followed a Location: to a
++           different host or similar. */
++        conn->bits.netrc = TRUE;
++      }
+     }
+     if(url_provided) {
+       Curl_safefree(conn->user);
+diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
+index 03cb6a0..e3508cb 100644
+--- a/tests/data/Makefile.inc
++++ b/tests/data/Makefile.inc
+@@ -73,7 +73,7 @@ test426 test427 test428 test429 test430 test431 test432 test433 test434 \
+ test435 test436 test437 test438 test439 test440 test441 test442 test443 \
+ test444 test445 test446 test447 test448 test449 test450 test451 test452 \
+ test453 test454 test455 test456 test457 test458 test459 test460 test461 \
+-test462 test463 test467 test468 \
++test462 test463 test467 test468 test478 test479 test480 \
+ \
+ test490 test491 test492 test493 test494 test495 test496 test497 test498 \
+ test499 test500 test501 test502 test503 test504 test505 test506 test507 \
+diff --git a/tests/data/test478 b/tests/data/test478
+new file mode 100644
+index 0000000..4acc72e
+--- /dev/null
++++ b/tests/data/test478
+@@ -0,0 +1,73 @@
++<testcase>
++ <info>
++ <keywords>
++ netrc
++ HTTP
++ </keywords>
++ </info>
++ #
++ # Server-side
++ <reply>
++ <data crlf="yes">
++ HTTP/1.1 200 OK
++ Date: Tue, 09 Nov 2010 14:49:00 GMT
++ Server: test-server/fake
++ Last-Modified: Tue, 13 Jun 2000 12:10:00 GMT
++ ETag: "21025-dc7-39462498"
++ Accept-Ranges: bytes
++ Content-Length: 6
++ Connection: close
++ Content-Type: text/html
++ Funny-head: yesyes
++
++ -foo-
++ </data>
++ </reply>
++
++ #
++ # Client-side
++ <client>
++ <server>
++ http
++ </server>
++ <features>
++ proxy
++ </features>
++ <name>
++ .netrc with multiple accounts for same host
++ </name>
++ <command>
++ --netrc --netrc-file log/netrc%TESTNUMBER -x http://%HOSTIP:%HTTPPORT/ http://debbie@github.com/
++ </command>
++ <file name="log/netrc%TESTNUMBER" >
++
++ machine github.com
++ password weird
++ password firstone
++ login daniel
++
++ machine github.com
++
++ machine github.com
++ login debbie
++
++ machine github.com
++ password weird
++ password "second\r"
++ login debbie
++
++ </file>
++ </client>
++
++ <verify>
++ <protocol>
++ GET http://github.com/ HTTP/1.1
++ Host: github.com
++ Authorization: Basic %b64[debbie:second%0D]b64%
++ User-Agent: curl/%VERSION
++ Accept: */*
++ Proxy-Connection: Keep-Alive
++
++ </protocol>
++ </verify>
++ </testcase>
+diff --git a/tests/data/test479 b/tests/data/test479
+new file mode 100644
+index 0000000..62a2057
+--- /dev/null
++++ b/tests/data/test479
+@@ -0,0 +1,107 @@
++<testcase>
++ <info>
++ <keywords>
++ netrc
++ HTTP
++ </keywords>
++ </info>
++ #
++ # Server-side
++ <reply>
++ <data crlf="yes">
++ HTTP/1.1 301 Follow this you fool
++ Date: Tue, 09 Nov 2010 14:49:00 GMT
++ Server: test-server/fake
++ Last-Modified: Tue, 13 Jun 2000 12:10:00 GMT
++ ETag: "21025-dc7-39462498"
++ Accept-Ranges: bytes
++ Content-Length: 6
++ Connection: close
++ Location: http://b.com/%TESTNUMBER0002
++
++ -foo-
++ </data>
++
++ <data2 crlf="yes">
++ HTTP/1.1 200 OK
++ Date: Tue, 09 Nov 2010 14:49:00 GMT
++ Server: test-server/fake
++ Last-Modified: Tue, 13 Jun 2000 12:10:00 GMT
++ ETag: "21025-dc7-39462498"
++ Accept-Ranges: bytes
++ Content-Length: 7
++ Connection: close
++
++ target
++ </data2>
++
++ <datacheck crlf="yes">
++ HTTP/1.1 301 Follow this you fool
++ Date: Tue, 09 Nov 2010 14:49:00 GMT
++ Server: test-server/fake
++ Last-Modified: Tue, 13 Jun 2000 12:10:00 GMT
++ ETag: "21025-dc7-39462498"
++ Accept-Ranges: bytes
++ Content-Length: 6
++ Connection: close
++ Location: http://b.com/%TESTNUMBER0002
++
++ HTTP/1.1 200 OK
++ Date: Tue, 09 Nov 2010 14:49:00 GMT
++ Server: test-server/fake
++ Last-Modified: Tue, 13 Jun 2000 12:10:00 GMT
++ ETag: "21025-dc7-39462498"
++ Accept-Ranges: bytes
++ Content-Length: 7
++ Connection: close
++
++ target
++ </datacheck>
++ </reply>
++
++ #
++ # Client-side
++ <client>
++ <server>
++ http
++ </server>
++ <features>
++ proxy
++ </features>
++ <name>
++ .netrc with redirect and default without password
++ </name>
++ <command>
++ --netrc --netrc-file log/netrc%TESTNUMBER -L -x http://%HOSTIP:%HTTPPORT/ http://a.com/
++ </command>
++ <file name="log/netrc%TESTNUMBER" >
++
++ machine a.com
++   login alice
++   password alicespassword
++
++ default
++   login bob
++
++ </file>
++ </client>
++
++ <verify>
++ <protocol>
++ GET http://a.com/ HTTP/1.1
++ Host: a.com
++ Authorization: Basic %b64[alice:alicespassword]b64%
++ User-Agent: curl/%VERSION
++ Accept: */*
++ Proxy-Connection: Keep-Alive
++
++ GET http://b.com/%TESTNUMBER0002 HTTP/1.1
++ Host: b.com
++ Authorization: Basic %b64[bob:]b64%
++ User-Agent: curl/%VERSION
++ Accept: */*
++ Proxy-Connection: Keep-Alive
++
++ </protocol>
++ </verify>
++ </testcase>
+diff --git a/tests/data/test480 b/tests/data/test480
+new file mode 100644
+index 0000000..47db7ab
+--- /dev/null
++++ b/tests/data/test480
+@@ -0,0 +1,38 @@
++<testcase>
++ <info>
++ <keywords>
++ netrc
++ pop3
++ </keywords>
++ </info>
++ #
++ # Server-side
++ <reply>
++
++ </reply>
++
++ #
++ # Client-side
++ <client>
++ <server>
++ pop3
++ </server>
++ <name>
++ Reject .netrc with credentials using CRLF for POP3
++ </name>
++ <command>
++ --netrc --netrc-file log/netrc%TESTNUMBER pop3://%HOSTIP:%POP3PORT/%TESTNUMBER
++ </command>
++ <file name="log/netrc%TESTNUMBER" >
++ machine %HOSTIP
++   login alice
++   password "password\r\ncommand"
++ </file>
++ </client>
++
++ <verify>
++ <errorcode>
++ 26
++ </errorcode>
++ </verify>
++ </testcase>
+diff --git a/tests/unit/unit1304.c b/tests/unit/unit1304.c
+index 0288562..b2b4366 100644
+--- a/tests/unit/unit1304.c
++++ b/tests/unit/unit1304.c
+@@ -32,13 +32,8 @@ static char *password;
+
+ static CURLcode unit_setup(void)
+ {
+-  password = strdup("");
+-  login = strdup("");
+-  if(!password || !login) {
+-    Curl_safefree(password);
+-    Curl_safefree(login);
+-    return CURLE_OUT_OF_MEMORY;
+-  }
++  password = NULL;
++  login = NULL;
+   return CURLE_OK;
+ }
+
+@@ -56,76 +51,48 @@ UNITTEST_START
+    */
+   result = Curl_parsenetrc("test.example.com", &login, &password, arg);
+   fail_unless(result == 1, "Host not found should return 1");
+-  abort_unless(password != NULL, "returned NULL!");
+-  fail_unless(password[0] == 0, "password should not have been changed");
+-  abort_unless(login != NULL, "returned NULL!");
+-  fail_unless(login[0] == 0, "login should not have been changed");
++  abort_unless(password == NULL, "password did not return NULL!");
++  abort_unless(login == NULL, "user did not return NULL!");
+
+   /*
+    * Test a non existent login in our netrc file.
+    */
+-  free(login);
+-  login = strdup("me");
+-  abort_unless(login != NULL, "returned NULL!");
++  login = (char *)"me";
+   result = Curl_parsenetrc("example.com", &login, &password, arg);
+   fail_unless(result == 0, "Host should have been found");
+-  abort_unless(password != NULL, "returned NULL!");
+-  fail_unless(password[0] == 0, "password should not have been changed");
+-  abort_unless(login != NULL, "returned NULL!");
+-  fail_unless(strncmp(login, "me", 2) == 0,
+-              "login should not have been changed");
++  abort_unless(password == NULL, "password is not NULL!");
+
+   /*
+    * Test a non existent login and host in our netrc file.
+    */
+-  free(login);
+-  login = strdup("me");
+-  abort_unless(login != NULL, "returned NULL!");
++  login = (char *)"me";
+   result = Curl_parsenetrc("test.example.com", &login, &password, arg);
+   fail_unless(result == 1, "Host not found should return 1");
+-  abort_unless(password != NULL, "returned NULL!");
+-  fail_unless(password[0] == 0, "password should not have been changed");
+-  abort_unless(login != NULL, "returned NULL!");
+-  fail_unless(strncmp(login, "me", 2) == 0,
+-              "login should not have been changed");
++  abort_unless(password == NULL, "password is not NULL!");
+
+   /*
+    * Test a non existent login (substring of an existing one) in our
+    * netrc file.
+    */
+-  free(login);
+-  login = strdup("admi");
+-  abort_unless(login != NULL, "returned NULL!");
++  login = (char *)"admi";
+   result = Curl_parsenetrc("example.com", &login, &password, arg);
+   fail_unless(result == 0, "Host should have been found");
+-  abort_unless(password != NULL, "returned NULL!");
+-  fail_unless(password[0] == 0, "password should not have been changed");
+-  abort_unless(login != NULL, "returned NULL!");
+-  fail_unless(strncmp(login, "admi", 4) == 0,
+-              "login should not have been changed");
++  abort_unless(password == NULL, "password is not NULL!");
+
+   /*
+    * Test a non existent login (superstring of an existing one)
+    * in our netrc file.
+    */
+-  free(login);
+-  login = strdup("adminn");
+-  abort_unless(login != NULL, "returned NULL!");
++  login = (char *)"adminn";
+   result = Curl_parsenetrc("example.com", &login, &password, arg);
+   fail_unless(result == 0, "Host should have been found");
+-  abort_unless(password != NULL, "returned NULL!");
+-  fail_unless(password[0] == 0, "password should not have been changed");
+-  abort_unless(login != NULL, "returned NULL!");
+-  fail_unless(strncmp(login, "adminn", 6) == 0,
+-              "login should not have been changed");
++  abort_unless(password == NULL, "password is not NULL!");
+
+   /*
+    * Test for the first existing host in our netrc file
+    * with login[0] = 0.
+    */
+-  free(login);
+-  login = strdup("");
+-  abort_unless(login != NULL, "returned NULL!");
++  login = NULL;
+   result = Curl_parsenetrc("example.com", &login, &password, arg);
+   fail_unless(result == 0, "Host should have been found");
+   abort_unless(password != NULL, "returned NULL!");
+@@ -139,8 +106,9 @@ UNITTEST_START
+    * with login[0] != 0.
+    */
+   free(password);
+-  password = strdup("");
+-  abort_unless(password != NULL, "returned NULL!");
++  free(login);
++  password = NULL;
++  login = NULL;
+   result = Curl_parsenetrc("example.com", &login, &password, arg);
+   fail_unless(result == 0, "Host should have been found");
+   abort_unless(password != NULL, "returned NULL!");
+@@ -154,11 +122,9 @@ UNITTEST_START
+    * with login[0] = 0.
+    */
+   free(password);
+-  password = strdup("");
+-  abort_unless(password != NULL, "returned NULL!");
++  password = NULL;
+   free(login);
+-  login = strdup("");
+-  abort_unless(login != NULL, "returned NULL!");
++  login = NULL;
+   result = Curl_parsenetrc("curl.example.com", &login, &password, arg);
+   fail_unless(result == 0, "Host should have been found");
+   abort_unless(password != NULL, "returned NULL!");
+@@ -172,8 +138,9 @@ UNITTEST_START
+    * with login[0] != 0.
+    */
+   free(password);
+-  password = strdup("");
+-  abort_unless(password != NULL, "returned NULL!");
++  free(login);
++  password = NULL;
++  login = NULL;
+   result = Curl_parsenetrc("curl.example.com", &login, &password, arg);
+   fail_unless(result == 0, "Host should have been found");
+   abort_unless(password != NULL, "returned NULL!");
+--
+2.40.0
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index ddd591dd96..fe3c5182c9 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -20,6 +20,8 @@ SRC_URI = " \
     file://CVE-2024-7264-2.patch \
     file://CVE-2024-8096.patch \
     file://CVE-2024-9681.patch \
+    file://CVE-2024-11053-0001.patch \
+    file://CVE-2024-11053-0002.patch \
 "
 SRC_URI[sha256sum] = "6fea2aac6a4610fbd0400afb0bcddbe7258a64c63f1f68e5855ebc0c659710cd"
 
-- 
2.40.0


