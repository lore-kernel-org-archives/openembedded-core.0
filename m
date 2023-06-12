Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5159AC7EE2E
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 09:29:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.54755.1686562161350687988
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jun 2023 02:29:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5527558713=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35C6eA6S029164
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jun 2023 02:29:21 -0700
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r4mf3194s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jun 2023 02:29:20 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 12 Jun 2023 02:29:20 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Mon, 12 Jun 2023 02:29:19 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [mickledore]][PATCH] curl: Fix CVEs
Date: Mon, 12 Jun 2023 17:29:19 +0800
Message-ID: <20230612092919.3139210-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CAOSpxdYn4H=dOyoa8Eoi-LKLZYo+6bzi_7x2Y9Dy-ORNZXAajw@mail.gmail.com>
References: <CAOSpxdYn4H=dOyoa8Eoi-LKLZYo+6bzi_7x2Y9Dy-ORNZXAajw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: nPsdbkDOtlXwIKfDKQYI0xI41mmD9foe
X-Proofpoint-GUID: nPsdbkDOtlXwIKfDKQYI0xI41mmD9foe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-12_06,2023-06-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306120081
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jun 2023 09:29:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182658

From: Mingli Yu <mingli.yu@windriver.com>

Backport patches to fix the below CVEs:
  CVE-2023-28319
  CVE-2023-28320
  CVE-2023-28321
  CVE-2023-28322

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../curl/curl/CVE-2023-28319.patch            |  38 ++
 .../curl/curl/CVE-2023-28320.patch            |  88 ++++
 .../curl/curl/CVE-2023-28321.patch            | 111 +++++
 .../curl/curl/CVE-2023-28322.patch            | 441 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.0.1.bb       |   4 +
 5 files changed, 682 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-28319.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-28320.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-28321.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-28322.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-28319.patch b/meta/recipes-support/curl/curl/CVE-2023-28319.patch
new file mode 100644
index 0000000000..c843a18174
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-28319.patch
@@ -0,0 +1,38 @@
+From 8e21b1a05f3c0ee098dbcb6c3d84cb61f102a122 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 8 May 2023 14:33:54 +0200
+Subject: [PATCH] libssh2: free fingerprint better
+
+Reported-by: Wei Chong Tan
+Closes #11088
+
+CVE: CVE-2023-28319
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/8e21b1a05f3c0ee098dbcb6c]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+
+---
+ lib/vssh/libssh2.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/lib/vssh/libssh2.c b/lib/vssh/libssh2.c
+index bfcc94e16..dd39a844c 100644
+--- a/lib/vssh/libssh2.c
++++ b/lib/vssh/libssh2.c
+@@ -728,11 +728,10 @@ static CURLcode ssh_check_fingerprint(struct Curl_easy *data)
+      */
+     if((pub_pos != b64_pos) ||
+        strncmp(fingerprint_b64, pubkey_sha256, pub_pos)) {
+-      free(fingerprint_b64);
+-
+       failf(data,
+             "Denied establishing ssh session: mismatch sha256 fingerprint. "
+             "Remote %s is not equal to %s", fingerprint_b64, pubkey_sha256);
++      free(fingerprint_b64);
+       state(data, SSH_SESSION_FREE);
+       sshc->actualcode = CURLE_PEER_FAILED_VERIFICATION;
+       return sshc->actualcode;
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/curl/curl/CVE-2023-28320.patch b/meta/recipes-support/curl/curl/CVE-2023-28320.patch
new file mode 100644
index 0000000000..c7cfd6a42f
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-28320.patch
@@ -0,0 +1,88 @@
+From 13718030ad4b3209a7583b4f27f683cd3a6fa5f2 Mon Sep 17 00:00:00 2001
+From: Harry Sintonen <sintonen@iki.fi>
+Date: Tue, 25 Apr 2023 09:22:26 +0200
+Subject: [PATCH] hostip: add locks around use of global buffer for alarm()
+
+When building with the sync name resolver and timeout ability we now
+require thread-safety to be present to enable it.
+
+Closes #11030
+
+CVE: CVE-2023-28320
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/13718030ad4b3209a7583b]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ lib/hostip.c | 19 +++++++++++++++----
+ 1 file changed, 15 insertions(+), 4 deletions(-)
+
+diff --git a/lib/hostip.c b/lib/hostip.c
+index 2381290fd..e410cda69 100644
+--- a/lib/hostip.c
++++ b/lib/hostip.c
+@@ -70,12 +70,19 @@
+ #include <SystemConfiguration/SCDynamicStoreCopySpecific.h>
+ #endif
+ 
+-#if defined(CURLRES_SYNCH) && \
+-    defined(HAVE_ALARM) && defined(SIGALRM) && defined(HAVE_SIGSETJMP)
++#if defined(CURLRES_SYNCH) &&                   \
++  defined(HAVE_ALARM) &&                        \
++  defined(SIGALRM) &&                           \
++  defined(HAVE_SIGSETJMP) &&                    \
++  defined(GLOBAL_INIT_IS_THREADSAFE)
+ /* alarm-based timeouts can only be used with all the dependencies satisfied */
+ #define USE_ALARM_TIMEOUT
+ #endif
+ 
++#ifdef USE_ALARM_TIMEOUT
++#include "easy_lock.h"
++#endif
++
+ #define MAX_HOSTCACHE_LEN (255 + 7) /* max FQDN + colon + port number + zero */
+ 
+ /*
+@@ -254,11 +261,12 @@ void Curl_hostcache_prune(struct Curl_easy *data)
+     Curl_share_unlock(data, CURL_LOCK_DATA_DNS);
+ }
+ 
+-#ifdef HAVE_SIGSETJMP
++#ifdef USE_ALARM_TIMEOUT
+ /* Beware this is a global and unique instance. This is used to store the
+    return address that we can jump back to from inside a signal handler. This
+    is not thread-safe stuff. */
+ sigjmp_buf curl_jmpenv;
++curl_simple_lock curl_jmpenv_lock;
+ #endif
+ 
+ /* lookup address, returns entry if found and not stale */
+@@ -832,7 +840,6 @@ enum resolve_t Curl_resolv(struct Curl_easy *data,
+ static
+ void alarmfunc(int sig)
+ {
+-  /* this is for "-ansi -Wall -pedantic" to stop complaining!   (rabe) */
+   (void)sig;
+   siglongjmp(curl_jmpenv, 1);
+ }
+@@ -912,6 +919,8 @@ enum resolve_t Curl_resolv_timeout(struct Curl_easy *data,
+      This should be the last thing we do before calling Curl_resolv(),
+      as otherwise we'd have to worry about variables that get modified
+      before we invoke Curl_resolv() (and thus use "volatile"). */
++  curl_simple_lock_lock(&curl_jmpenv_lock);
++
+   if(sigsetjmp(curl_jmpenv, 1)) {
+     /* this is coming from a siglongjmp() after an alarm signal */
+     failf(data, "name lookup timed out");
+@@ -980,6 +989,8 @@ clean_up:
+ #endif
+ #endif /* HAVE_SIGACTION */
+ 
++  curl_simple_lock_unlock(&curl_jmpenv_lock);
++
+   /* switch back the alarm() to either zero or to what it was before minus
+      the time we spent until now! */
+   if(prev_alarm) {
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/curl/curl/CVE-2023-28321.patch b/meta/recipes-support/curl/curl/CVE-2023-28321.patch
new file mode 100644
index 0000000000..d328d83afa
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-28321.patch
@@ -0,0 +1,111 @@
+From 199f2d440d8659b42670c1b796220792b01a97bf Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 24 Apr 2023 21:07:02 +0200
+Subject: [PATCH] hostcheck: fix host name wildcard checking
+
+The leftmost "label" of the host name can now only match against single
+'*'. Like the browsers have worked for a long time.
+
+Reported-by: Hiroki Kurosawa
+Closes #11018
+
+CVE: CVE-2023-28321
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/199f2d440d8659b42]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ lib/vtls/hostcheck.c    |  50 +++++++--------
+ 1 file changed, 202 insertions(+), 180 deletions(-)
+
+diff --git a/lib/vtls/hostcheck.c b/lib/vtls/hostcheck.c
+index e827dc58f..d061c6356 100644
+--- a/lib/vtls/hostcheck.c
++++ b/lib/vtls/hostcheck.c
+@@ -71,7 +71,12 @@ static bool pmatch(const char *hostname, size_t hostlen,
+  * apparent distinction between a name and an IP. We need to detect the use of
+  * an IP address and not wildcard match on such names.
+  *
++ * Only match on "*" being used for the leftmost label, not "a*", "a*b" nor
++ * "*b".
++ *
+  * Return TRUE on a match. FALSE if not.
++ *
++ * @unittest: 1397
+  */
+ 
+ static bool hostmatch(const char *hostname,
+@@ -79,53 +84,42 @@ static bool hostmatch(const char *hostname,
+                       const char *pattern,
+                       size_t patternlen)
+ {
+-  const char *pattern_label_end, *wildcard, *hostname_label_end;
+-  size_t prefixlen, suffixlen;
++  const char *pattern_label_end;
+ 
+-  /* normalize pattern and hostname by stripping off trailing dots */
++  DEBUGASSERT(pattern);
+   DEBUGASSERT(patternlen);
++  DEBUGASSERT(hostname);
++  DEBUGASSERT(hostlen);
++
++  /* normalize pattern and hostname by stripping off trailing dots */
+   if(hostname[hostlen-1]=='.')
+     hostlen--;
+   if(pattern[patternlen-1]=='.')
+     patternlen--;
+ 
+-  wildcard = memchr(pattern, '*', patternlen);
+-  if(!wildcard)
++  if(strncmp(pattern, "*.", 2))
+     return pmatch(hostname, hostlen, pattern, patternlen);
+ 
+   /* detect IP address as hostname and fail the match if so */
+-  if(Curl_host_is_ipnum(hostname))
++  else if(Curl_host_is_ipnum(hostname))
+     return FALSE;
+ 
+   /* We require at least 2 dots in the pattern to avoid too wide wildcard
+      match. */
+   pattern_label_end = memchr(pattern, '.', patternlen);
+   if(!pattern_label_end ||
+-     (memrchr(pattern, '.', patternlen) == pattern_label_end) ||
+-     strncasecompare(pattern, "xn--", 4))
++     (memrchr(pattern, '.', patternlen) == pattern_label_end))
+     return pmatch(hostname, hostlen, pattern, patternlen);
+-
+-  hostname_label_end = memchr(hostname, '.', hostlen);
+-  if(!hostname_label_end)
+-    return FALSE;
+   else {
+-    size_t skiphost = hostname_label_end - hostname;
+-    size_t skiplen = pattern_label_end - pattern;
+-    if(!pmatch(hostname_label_end, hostlen - skiphost,
+-               pattern_label_end, patternlen - skiplen))
+-      return FALSE;
++    const char *hostname_label_end = memchr(hostname, '.', hostlen);
++    if(hostname_label_end) {
++      size_t skiphost = hostname_label_end - hostname;
++      size_t skiplen = pattern_label_end - pattern;
++      return pmatch(hostname_label_end, hostlen - skiphost,
++                    pattern_label_end, patternlen - skiplen);
++    }
+   }
+-  /* The wildcard must match at least one character, so the left-most
+-     label of the hostname is at least as large as the left-most label
+-     of the pattern. */
+-  if(hostname_label_end - hostname < pattern_label_end - pattern)
+-    return FALSE;
+-
+-  prefixlen = wildcard - pattern;
+-  suffixlen = pattern_label_end - (wildcard + 1);
+-  return strncasecompare(pattern, hostname, prefixlen) &&
+-    strncasecompare(wildcard + 1, hostname_label_end - suffixlen,
+-                    suffixlen) ? TRUE : FALSE;
++  return FALSE;
+ }
+ 
+ /*
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/curl/curl/CVE-2023-28322.patch b/meta/recipes-support/curl/curl/CVE-2023-28322.patch
new file mode 100644
index 0000000000..d0786d7a4b
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-28322.patch
@@ -0,0 +1,441 @@
+From 7815647d6582c0a4900be2e1de6c5e61272c496b Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Tue, 25 Apr 2023 08:28:01 +0200
+Subject: [PATCH] lib: unify the upload/method handling
+
+By making sure we set state.upload based on the set.method value and not
+independently as set.upload, we reduce confusion and mixup risks, both
+internally and externally.
+
+Closes #11017
+
+CVE: CVE-2023-28322
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/7815647d6582c0a4900be2e1de]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+
+---
+ lib/curl_rtmp.c    | 4 ++--
+ lib/file.c         | 4 ++--
+ lib/ftp.c          | 8 ++++----
+ lib/http.c         | 4 ++--
+ lib/imap.c         | 6 +++---
+ lib/rtsp.c         | 4 ++--
+ lib/setopt.c       | 6 ++----
+ lib/smb.c          | 6 +++---
+ lib/smtp.c         | 4 ++--
+ lib/tftp.c         | 8 ++++----
+ lib/transfer.c     | 4 ++--
+ lib/urldata.h      | 2 +-
+ lib/vssh/libssh.c  | 6 +++---
+ lib/vssh/libssh2.c | 6 +++---
+ lib/vssh/wolfssh.c | 2 +-
+ 15 files changed, 36 insertions(+), 38 deletions(-)
+
+diff --git a/lib/curl_rtmp.c b/lib/curl_rtmp.c
+index 2679a2cdc..406fb42ac 100644
+--- a/lib/curl_rtmp.c
++++ b/lib/curl_rtmp.c
+@@ -231,7 +231,7 @@ static CURLcode rtmp_connect(struct Curl_easy *data, bool *done)
+   /* We have to know if it's a write before we send the
+    * connect request packet
+    */
+-  if(data->set.upload)
++  if(data->state.upload)
+     r->Link.protocol |= RTMP_FEATURE_WRITE;
+ 
+   /* For plain streams, use the buffer toggle trick to keep data flowing */
+@@ -263,7 +263,7 @@ static CURLcode rtmp_do(struct Curl_easy *data, bool *done)
+   if(!RTMP_ConnectStream(r, 0))
+     return CURLE_FAILED_INIT;
+ 
+-  if(data->set.upload) {
++  if(data->state.upload) {
+     Curl_pgrsSetUploadSize(data, data->state.infilesize);
+     Curl_setup_transfer(data, -1, -1, FALSE, FIRSTSOCKET);
+   }
+diff --git a/lib/file.c b/lib/file.c
+index 51c5d07ce..c751e8861 100644
+--- a/lib/file.c
++++ b/lib/file.c
+@@ -240,7 +240,7 @@ static CURLcode file_connect(struct Curl_easy *data, bool *done)
+   file->freepath = real_path; /* free this when done */
+ 
+   file->fd = fd;
+-  if(!data->set.upload && (fd == -1)) {
++  if(!data->state.upload && (fd == -1)) {
+     failf(data, "Couldn't open file %s", data->state.up.path);
+     file_done(data, CURLE_FILE_COULDNT_READ_FILE, FALSE);
+     return CURLE_FILE_COULDNT_READ_FILE;
+@@ -422,7 +422,7 @@ static CURLcode file_do(struct Curl_easy *data, bool *done)
+ 
+   Curl_pgrsStartNow(data);
+ 
+-  if(data->set.upload)
++  if(data->state.upload)
+     return file_upload(data);
+ 
+   file = data->req.p.file;
+diff --git a/lib/ftp.c b/lib/ftp.c
+index f50d7baf6..4ff68cc45 100644
+--- a/lib/ftp.c
++++ b/lib/ftp.c
+@@ -1348,7 +1348,7 @@ static CURLcode ftp_state_prepare_transfer(struct Curl_easy *data)
+                                data->set.str[STRING_CUSTOMREQUEST]?
+                                data->set.str[STRING_CUSTOMREQUEST]:
+                                (data->state.list_only?"NLST":"LIST"));
+-      else if(data->set.upload)
++      else if(data->state.upload)
+         result = Curl_pp_sendf(data, &ftpc->pp, "PRET STOR %s",
+                                conn->proto.ftpc.file);
+       else
+@@ -3384,7 +3384,7 @@ static CURLcode ftp_done(struct Curl_easy *data, CURLcode status,
+     /* the response code from the transfer showed an error already so no
+        use checking further */
+     ;
+-  else if(data->set.upload) {
++  else if(data->state.upload) {
+     if((-1 != data->state.infilesize) &&
+        (data->state.infilesize != data->req.writebytecount) &&
+        !data->set.crlf &&
+@@ -3640,7 +3640,7 @@ static CURLcode ftp_do_more(struct Curl_easy *data, int *completep)
+                            connected back to us */
+       }
+     }
+-    else if(data->set.upload) {
++    else if(data->state.upload) {
+       result = ftp_nb_type(data, conn, data->state.prefer_ascii,
+                            FTP_STOR_TYPE);
+       if(result)
+@@ -4225,7 +4225,7 @@ CURLcode ftp_parse_url_path(struct Curl_easy *data)
+     ftpc->file = NULL; /* instead of point to a zero byte,
+                             we make it a NULL pointer */
+ 
+-  if(data->set.upload && !ftpc->file && (ftp->transfer == PPTRANSFER_BODY)) {
++  if(data->state.upload && !ftpc->file && (ftp->transfer == PPTRANSFER_BODY)) {
+     /* We need a file name when uploading. Return error! */
+     failf(data, "Uploading to a URL without a file name");
+     free(rawPath);
+diff --git a/lib/http.c b/lib/http.c
+index 80e43f6f3..bffdd3468 100644
+--- a/lib/http.c
++++ b/lib/http.c
+@@ -2112,7 +2112,7 @@ void Curl_http_method(struct Curl_easy *data, struct connectdata *conn,
+   Curl_HttpReq httpreq = (Curl_HttpReq)data->state.httpreq;
+   const char *request;
+   if((conn->handler->protocol&(PROTO_FAMILY_HTTP|CURLPROTO_FTP)) &&
+-     data->set.upload)
++     data->state.upload)
+     httpreq = HTTPREQ_PUT;
+ 
+   /* Now set the 'request' pointer to the proper request string */
+@@ -2423,7 +2423,7 @@ CURLcode Curl_http_body(struct Curl_easy *data, struct connectdata *conn,
+     if((conn->handler->protocol & PROTO_FAMILY_HTTP) &&
+        (((httpreq == HTTPREQ_POST_MIME || httpreq == HTTPREQ_POST_FORM) &&
+          http->postsize < 0) ||
+-        ((data->set.upload || httpreq == HTTPREQ_POST) &&
++        ((data->state.upload || httpreq == HTTPREQ_POST) &&
+          data->state.infilesize == -1))) {
+       if(conn->bits.authneg)
+         /* don't enable chunked during auth neg */
+diff --git a/lib/imap.c b/lib/imap.c
+index c2f675d4b..1952e66a1 100644
+--- a/lib/imap.c
++++ b/lib/imap.c
+@@ -1511,11 +1511,11 @@ static CURLcode imap_done(struct Curl_easy *data, CURLcode status,
+     result = status;         /* use the already set error code */
+   }
+   else if(!data->set.connect_only && !imap->custom &&
+-          (imap->uid || imap->mindex || data->set.upload ||
++          (imap->uid || imap->mindex || data->state.upload ||
+           data->set.mimepost.kind != MIMEKIND_NONE)) {
+     /* Handle responses after FETCH or APPEND transfer has finished */
+ 
+-    if(!data->set.upload && data->set.mimepost.kind == MIMEKIND_NONE)
++    if(!data->state.upload && data->set.mimepost.kind == MIMEKIND_NONE)
+       state(data, IMAP_FETCH_FINAL);
+     else {
+       /* End the APPEND command first by sending an empty line */
+@@ -1581,7 +1581,7 @@ static CURLcode imap_perform(struct Curl_easy *data, bool *connected,
+     selected = TRUE;
+ 
+   /* Start the first command in the DO phase */
+-  if(data->set.upload || data->set.mimepost.kind != MIMEKIND_NONE)
++  if(data->state.upload || data->set.mimepost.kind != MIMEKIND_NONE)
+     /* APPEND can be executed directly */
+     result = imap_perform_append(data);
+   else if(imap->custom && (selected || !imap->mailbox))
+diff --git a/lib/rtsp.c b/lib/rtsp.c
+index ea99d720e..ccd7264b0 100644
+--- a/lib/rtsp.c
++++ b/lib/rtsp.c
+@@ -493,7 +493,7 @@ static CURLcode rtsp_do(struct Curl_easy *data, bool *done)
+      rtspreq == RTSPREQ_SET_PARAMETER ||
+      rtspreq == RTSPREQ_GET_PARAMETER) {
+ 
+-    if(data->set.upload) {
++    if(data->state.upload) {
+       putsize = data->state.infilesize;
+       data->state.httpreq = HTTPREQ_PUT;
+ 
+@@ -512,7 +512,7 @@ static CURLcode rtsp_do(struct Curl_easy *data, bool *done)
+         result =
+           Curl_dyn_addf(&req_buffer,
+                         "Content-Length: %" CURL_FORMAT_CURL_OFF_T"\r\n",
+-                        (data->set.upload ? putsize : postsize));
++                        (data->state.upload ? putsize : postsize));
+         if(result)
+           return result;
+       }
+diff --git a/lib/setopt.c b/lib/setopt.c
+index 38f5711e4..0c3b9634d 100644
+--- a/lib/setopt.c
++++ b/lib/setopt.c
+@@ -333,8 +333,8 @@ CURLcode Curl_vsetopt(struct Curl_easy *data, CURLoption option, va_list param)
+      * We want to sent data to the remote host. If this is HTTP, that equals
+      * using the PUT request.
+      */
+-    data->set.upload = (0 != va_arg(param, long)) ? TRUE : FALSE;
+-    if(data->set.upload) {
++    arg = va_arg(param, long);
++    if(arg) {
+       /* If this is HTTP, PUT is what's needed to "upload" */
+       data->set.method = HTTPREQ_PUT;
+       data->set.opt_no_body = FALSE; /* this is implied */
+@@ -664,7 +664,6 @@ CURLcode Curl_vsetopt(struct Curl_easy *data, CURLoption option, va_list param)
+     }
+     else
+       data->set.method = HTTPREQ_GET;
+-    data->set.upload = FALSE;
+     break;
+ 
+ #ifndef CURL_DISABLE_MIME
+@@ -888,7 +887,6 @@ CURLcode Curl_vsetopt(struct Curl_easy *data, CURLoption option, va_list param)
+      */
+     if(va_arg(param, long)) {
+       data->set.method = HTTPREQ_GET;
+-      data->set.upload = FALSE; /* switch off upload */
+       data->set.opt_no_body = FALSE; /* this is implied */
+     }
+     break;
+diff --git a/lib/smb.c b/lib/smb.c
+index a1e444ee6..d68222135 100644
+--- a/lib/smb.c
++++ b/lib/smb.c
+@@ -530,7 +530,7 @@ static CURLcode smb_send_open(struct Curl_easy *data)
+   byte_count = strlen(req->path);
+   msg.name_length = smb_swap16((unsigned short)byte_count);
+   msg.share_access = smb_swap32(SMB_FILE_SHARE_ALL);
+-  if(data->set.upload) {
++  if(data->state.upload) {
+     msg.access = smb_swap32(SMB_GENERIC_READ | SMB_GENERIC_WRITE);
+     msg.create_disposition = smb_swap32(SMB_FILE_OVERWRITE_IF);
+   }
+@@ -762,7 +762,7 @@ static CURLcode smb_request_state(struct Curl_easy *data, bool *done)
+   void *msg = NULL;
+   const struct smb_nt_create_response *smb_m;
+ 
+-  if(data->set.upload && (data->state.infilesize < 0)) {
++  if(data->state.upload && (data->state.infilesize < 0)) {
+     failf(data, "SMB upload needs to know the size up front");
+     return CURLE_SEND_ERROR;
+   }
+@@ -813,7 +813,7 @@ static CURLcode smb_request_state(struct Curl_easy *data, bool *done)
+     smb_m = (const struct smb_nt_create_response*) msg;
+     req->fid = smb_swap16(smb_m->fid);
+     data->req.offset = 0;
+-    if(data->set.upload) {
++    if(data->state.upload) {
+       data->req.size = data->state.infilesize;
+       Curl_pgrsSetUploadSize(data, data->req.size);
+       next_state = SMB_UPLOAD;
+diff --git a/lib/smtp.c b/lib/smtp.c
+index 7a030308d..c182cace7 100644
+--- a/lib/smtp.c
++++ b/lib/smtp.c
+@@ -1419,7 +1419,7 @@ static CURLcode smtp_done(struct Curl_easy *data, CURLcode status,
+     result = status;         /* use the already set error code */
+   }
+   else if(!data->set.connect_only && data->set.mail_rcpt &&
+-          (data->set.upload || data->set.mimepost.kind)) {
++          (data->state.upload || data->set.mimepost.kind)) {
+     /* Calculate the EOB taking into account any terminating CRLF from the
+        previous line of the email or the CRLF of the DATA command when there
+        is "no mail data". RFC-5321, sect. 4.1.1.4.
+@@ -1511,7 +1511,7 @@ static CURLcode smtp_perform(struct Curl_easy *data, bool *connected,
+   smtp->eob = 2;
+ 
+   /* Start the first command in the DO phase */
+-  if((data->set.upload || data->set.mimepost.kind) && data->set.mail_rcpt)
++  if((data->state.upload || data->set.mimepost.kind) && data->set.mail_rcpt)
+     /* MAIL transfer */
+     result = smtp_perform_mail(data);
+   else
+diff --git a/lib/tftp.c b/lib/tftp.c
+index 164d3c723..8ed1b887b 100644
+--- a/lib/tftp.c
++++ b/lib/tftp.c
+@@ -370,7 +370,7 @@ static CURLcode tftp_parse_option_ack(struct tftp_state_data *state,
+ 
+       /* tsize should be ignored on upload: Who cares about the size of the
+          remote file? */
+-      if(!data->set.upload) {
++      if(!data->state.upload) {
+         if(!tsize) {
+           failf(data, "invalid tsize -:%s:- value in OACK packet", value);
+           return CURLE_TFTP_ILLEGAL;
+@@ -451,7 +451,7 @@ static CURLcode tftp_send_first(struct tftp_state_data *state,
+       return result;
+     }
+ 
+-    if(data->set.upload) {
++    if(data->state.upload) {
+       /* If we are uploading, send an WRQ */
+       setpacketevent(&state->spacket, TFTP_EVENT_WRQ);
+       state->data->req.upload_fromhere =
+@@ -486,7 +486,7 @@ static CURLcode tftp_send_first(struct tftp_state_data *state,
+     if(!data->set.tftp_no_options) {
+       char buf[64];
+       /* add tsize option */
+-      if(data->set.upload && (data->state.infilesize != -1))
++      if(data->state.upload && (data->state.infilesize != -1))
+         msnprintf(buf, sizeof(buf), "%" CURL_FORMAT_CURL_OFF_T,
+                   data->state.infilesize);
+       else
+@@ -540,7 +540,7 @@ static CURLcode tftp_send_first(struct tftp_state_data *state,
+     break;
+ 
+   case TFTP_EVENT_OACK:
+-    if(data->set.upload) {
++    if(data->state.upload) {
+       result = tftp_connect_for_tx(state, event);
+     }
+     else {
+diff --git a/lib/transfer.c b/lib/transfer.c
+index e9ab8fbf0..cb69f3365 100644
+--- a/lib/transfer.c
++++ b/lib/transfer.c
+@@ -1293,6 +1293,7 @@ void Curl_init_CONNECT(struct Curl_easy *data)
+ {
+   data->state.fread_func = data->set.fread_func_set;
+   data->state.in = data->set.in_set;
++  data->state.upload = (data->state.httpreq == HTTPREQ_PUT);
+ }
+ 
+ /*
+@@ -1732,7 +1733,6 @@ CURLcode Curl_follow(struct Curl_easy *data,
+          data->state.httpreq != HTTPREQ_POST_MIME) ||
+         !(data->set.keep_post & CURL_REDIR_POST_303))) {
+       data->state.httpreq = HTTPREQ_GET;
+-      data->set.upload = false;
+       infof(data, "Switch to %s",
+             data->req.no_body?"HEAD":"GET");
+     }
+@@ -1770,7 +1770,7 @@ CURLcode Curl_retry_request(struct Curl_easy *data, char **url)
+ 
+   /* if we're talking upload, we can't do the checks below, unless the protocol
+      is HTTP as when uploading over HTTP we will still get a response */
+-  if(data->set.upload &&
++  if(data->state.upload &&
+      !(conn->handler->protocol&(PROTO_FAMILY_HTTP|CURLPROTO_RTSP)))
+     return CURLE_OK;
+ 
+diff --git a/lib/urldata.h b/lib/urldata.h
+index cca992a02..a8580bdb6 100644
+--- a/lib/urldata.h
++++ b/lib/urldata.h
+@@ -1462,6 +1462,7 @@ struct UrlState {
+   BIT(rewindbeforesend);/* TRUE when the sending couldn't be stopped even
+                            though it will be discarded. We must call the data
+                            rewind callback before trying to send again. */
++  BIT(upload);         /* upload request */
+ };
+ 
+ /*
+@@ -1838,7 +1839,6 @@ struct UserDefined {
+   BIT(http_auto_referer); /* set "correct" referer when following
+                              location: */
+   BIT(opt_no_body);    /* as set with CURLOPT_NOBODY */
+-  BIT(upload);         /* upload request */
+   BIT(verbose);        /* output verbosity */
+   BIT(krb);            /* Kerberos connection requested */
+   BIT(reuse_forbid);   /* forbidden to be reused, close after use */
+diff --git a/lib/vssh/libssh.c b/lib/vssh/libssh.c
+index b31f741ba..d60edaa30 100644
+--- a/lib/vssh/libssh.c
++++ b/lib/vssh/libssh.c
+@@ -1209,7 +1209,7 @@ static CURLcode myssh_statemach_act(struct Curl_easy *data, bool *block)
+     }
+ 
+     case SSH_SFTP_TRANS_INIT:
+-      if(data->set.upload)
++      if(data->state.upload)
+         state(data, SSH_SFTP_UPLOAD_INIT);
+       else {
+         if(protop->path[strlen(protop->path)-1] == '/')
+@@ -1802,7 +1802,7 @@ static CURLcode myssh_statemach_act(struct Curl_easy *data, bool *block)
+       /* Functions from the SCP subsystem cannot handle/return SSH_AGAIN */
+       ssh_set_blocking(sshc->ssh_session, 1);
+ 
+-      if(data->set.upload) {
++      if(data->state.upload) {
+         if(data->state.infilesize < 0) {
+           failf(data, "SCP requires a known file size for upload");
+           sshc->actualcode = CURLE_UPLOAD_FAILED;
+@@ -1907,7 +1907,7 @@ static CURLcode myssh_statemach_act(struct Curl_easy *data, bool *block)
+         break;
+       }
+     case SSH_SCP_DONE:
+-      if(data->set.upload)
++      if(data->state.upload)
+         state(data, SSH_SCP_SEND_EOF);
+       else
+         state(data, SSH_SCP_CHANNEL_FREE);
+diff --git a/lib/vssh/libssh2.c b/lib/vssh/libssh2.c
+index f1154dc47..f2e5352d1 100644
+--- a/lib/vssh/libssh2.c
++++ b/lib/vssh/libssh2.c
+@@ -2019,7 +2019,7 @@ static CURLcode ssh_statemach_act(struct Curl_easy *data, bool *block)
+     }
+ 
+     case SSH_SFTP_TRANS_INIT:
+-      if(data->set.upload)
++      if(data->state.upload)
+         state(data, SSH_SFTP_UPLOAD_INIT);
+       else {
+         if(sshp->path[strlen(sshp->path)-1] == '/')
+@@ -2691,7 +2691,7 @@ static CURLcode ssh_statemach_act(struct Curl_easy *data, bool *block)
+         break;
+       }
+ 
+-      if(data->set.upload) {
++      if(data->state.upload) {
+         if(data->state.infilesize < 0) {
+           failf(data, "SCP requires a known file size for upload");
+           sshc->actualcode = CURLE_UPLOAD_FAILED;
+@@ -2831,7 +2831,7 @@ static CURLcode ssh_statemach_act(struct Curl_easy *data, bool *block)
+     break;
+ 
+     case SSH_SCP_DONE:
+-      if(data->set.upload)
++      if(data->state.upload)
+         state(data, SSH_SCP_SEND_EOF);
+       else
+         state(data, SSH_SCP_CHANNEL_FREE);
+diff --git a/lib/vssh/wolfssh.c b/lib/vssh/wolfssh.c
+index 17d59ecd2..2ca91b736 100644
+--- a/lib/vssh/wolfssh.c
++++ b/lib/vssh/wolfssh.c
+@@ -557,7 +557,7 @@ static CURLcode wssh_statemach_act(struct Curl_easy *data, bool *block)
+       }
+       break;
+     case SSH_SFTP_TRANS_INIT:
+-      if(data->set.upload)
++      if(data->state.upload)
+         state(data, SSH_SFTP_UPLOAD_INIT);
+       else {
+         if(sftp_scp->path[strlen(sftp_scp->path)-1] == '/')
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/curl/curl_8.0.1.bb b/meta/recipes-support/curl/curl_8.0.1.bb
index 5cf044615f..ecef173df2 100644
--- a/meta/recipes-support/curl/curl_8.0.1.bb
+++ b/meta/recipes-support/curl/curl_8.0.1.bb
@@ -13,6 +13,10 @@ SRC_URI = " \
     https://curl.se/download/${BP}.tar.xz \
     file://run-ptest \
     file://disable-tests \
+    file://CVE-2023-28322.patch \
+    file://CVE-2023-28319.patch \
+    file://CVE-2023-28320.patch \
+    file://CVE-2023-28321.patch \
 "
 SRC_URI[sha256sum] = "0a381cd82f4d00a9a334438b8ca239afea5bfefcfa9a1025f2bf118e79e0b5f0"
 
-- 
2.25.1


