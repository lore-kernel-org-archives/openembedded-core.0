Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16F0CC02198
	for <webhook@archiver.kernel.org>; Fri, 14 Feb 2025 05:01:07 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.14278.1739509258563282508
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 21:00:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4140961d8f=yogita.urade@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51E4WBXi024563
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 21:00:58 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44qwtqbwtd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 21:00:57 -0800 (PST)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 13 Feb 2025 21:00:55 -0800
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][scarthgap][PATCH 1/3] curl: fix CVE-2024-11053
Date: Fri, 14 Feb 2025 05:00:33 +0000
Message-ID: <20250214050035.1049565-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: xj3OHQeonMCfAmTZ2N7eJdrazyJZfFn6
X-Authority-Analysis: v=2.4 cv=DNd14zNb c=1 sm=1 tr=0 ts=67aece09 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=T2h4t0Lz3GQA:10 a=ugkhXdxtAAAA:8 a=NEAV23lmAAAA:8 a=yEquWHxyAAAA:8 a=HnMHPIp3AAAA:8 a=t7CeM3EgAAAA:8
 a=A1X0JdhQAAAA:8 a=-2Dz5L61PMglCO4OAakA:9 a=r-HJ9bD__24A:10 a=Wpz8ju6o9T4A:10 a=3UGHni60EXgA:10 a=VinBSYM5t5AA:10 a=s5zKW874KtQA:10 a=Ea3xMBwKpvXIEc3eveN9:22 a=_j3XSMEICZ-j_p4bQif0:22 a=j7VXw0cNxiiRp7-5Gr1y:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: xj3OHQeonMCfAmTZ2N7eJdrazyJZfFn6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_01,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 bulkscore=0 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502140034
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Feb 2025 05:01:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211372

From: Yogita Urade <yogita.urade@windriver.com>

When asked to both use a `.netrc` file for credentials and to
follow HTTP redirects, curl could leak the password used for
the first host to the followed-to host under certain circumstances.

This flaw only manifests itself if the netrc file has an entry
that matches the redirect target hostname but the entry either
omits just the password or omits both login and password.

CVE-2024-11053-0001 is the dependent commit and CVE-2024-11053-0002
is actual CVE fix. CVE-2024-11053-0003 fixes the regression caused by
CVE-2024-11053-0002.

Reference:
https://curl.se/docs/CVE-2024-11053.html

Upstream patches:
https://github.com/curl/curl/commit/3b43a05e000aa8f65bda513f733a73fefe35d5ca
https://github.com/curl/curl/commit/e9b9bbac22c26cf67316fa8e6c6b9e831af31949
https://github.com/curl/curl/commit/9fce2c55d4b0273ac99b59bd8cb982a6d96b88cf

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../curl/curl/CVE-2024-11053-0001.patch       | 801 ++++++++++++++++++
 .../curl/curl/CVE-2024-11053-0002.patch       | 734 ++++++++++++++++
 .../curl/curl/CVE-2024-11053-0003.patch       | 130 +++
 meta/recipes-support/curl/curl_8.7.1.bb       |   3 +
 4 files changed, 1668 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2024-11053-0001.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2024-11053-0002.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2024-11053-0003.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2024-11053-0001.patch b/meta/recipes-support/curl/curl/CVE-2024-11053-0001.patch
new file mode 100644
index 0000000000..c65c3c9417
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2024-11053-0001.patch
@@ -0,0 +1,801 @@
+From 3b43a05e000aa8f65bda513f733a73fefe35d5ca Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Thu, 10 Oct 2024 18:08:07 +0200
+Subject: [PATCH] netrc: cache the netrc file in memory
+
+So that on redirects etc it does not reread the file but just parses it
+again.
+
+Reported-by: Pierre-Etienne Meunier
+Fixes #15248
+Closes #15259
+
+CVE: CVE-2024-11053
+Upstream-Status: Backport [https://github.com/curl/curl/commit/3b43a05e000aa8f65bda513f733a73fefe35d5ca]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ lib/multi.c           |   3 +
+ lib/netrc.c           | 406 ++++++++++++++++++++++++------------------
+ lib/netrc.h           |  14 +-
+ lib/url.c             |   4 +-
+ lib/urldata.h         |   5 +
+ tests/unit/unit1304.c |  48 ++++-
+ 6 files changed, 292 insertions(+), 188 deletions(-)
+
+diff --git a/lib/multi.c b/lib/multi.c
+index ed9cac7..8a05b37 100644
+--- a/lib/multi.c
++++ b/lib/multi.c
+@@ -800,6 +800,9 @@ static CURLcode multi_done(struct Curl_easy *data,
+       data->state.lastconnect_id = -1;
+   }
+
++  /* flush the netrc cache */
++  Curl_netrc_cleanup(&data->state.netrc);
++
+   return result;
+ }
+
+diff --git a/lib/netrc.c b/lib/netrc.c
+index cd2a284..d72959b 100644
+--- a/lib/netrc.c
++++ b/lib/netrc.c
+@@ -31,7 +31,6 @@
+
+ #include <curl/curl.h>
+ #include "netrc.h"
+-#include "strtok.h"
+ #include "strcase.h"
+ #include "curl_get_line.h"
+
+@@ -49,21 +48,56 @@ enum host_lookup_state {
+   MACDEF
+ };
+
++enum found_state {
++  NONE,
++  LOGIN,
++  PASSWORD
++};
++
+ #define NETRC_FILE_MISSING 1
+ #define NETRC_FAILED -1
+ #define NETRC_SUCCESS 0
+
+ #define MAX_NETRC_LINE 4096
++#define MAX_NETRC_FILE (64*1024)
++#define MAX_NETRC_TOKEN 128
++
++static CURLcode file2memory(const char *filename, struct dynbuf *filebuf)
++{
++  CURLcode result = CURLE_OK;
++  FILE *file = fopen(filename, FOPEN_READTEXT);
++  struct dynbuf linebuf;
++  Curl_dyn_init(&linebuf, MAX_NETRC_LINE);
++
++  if(file) {
++    while(Curl_get_line(&linebuf, file)) {
++      const char *line = Curl_dyn_ptr(&linebuf);
++      /* skip comments on load */
++      while(ISBLANK(*line))
++        line++;
++      if(*line == '#')
++        continue;
++      result = Curl_dyn_add(filebuf, line);
++      if(result)
++        goto done;
++    }
++  }
++done:
++  Curl_dyn_free(&linebuf);
++  if(file)
++    fclose(file);
++  return result;
++}
+
+ /*
+  * Returns zero on success.
+  */
+-static int parsenetrc(const char *host,
++static int parsenetrc(struct store_netrc *store,
++                      const char *host,
+                       char **loginp,
+                       char **passwordp,
+-                      char *netrcfile)
++                      const char *netrcfile)
+ {
+-  FILE *file;
+   int retcode = NETRC_FILE_MISSING;
+   char *login = *loginp;
+   char *password = *passwordp;
+@@ -71,204 +105,211 @@ static int parsenetrc(const char *host,
+   bool login_alloc = FALSE;
+   bool password_alloc = FALSE;
+   enum host_lookup_state state = NOTHING;
++  enum found_state found = NONE;
++  bool our_login = TRUE;  /* With specific_login, found *our* login name (or
++                             login-less line) */
++  bool done = FALSE;
++  char *netrcbuffer;
++  struct dynbuf token;
++  struct dynbuf *filebuf = &store->filebuf;
++  Curl_dyn_init(&token, MAX_NETRC_TOKEN);
+
+-  char state_login = 0;      /* Found a login keyword */
+-  char state_password = 0;   /* Found a password keyword */
+-  int state_our_login = TRUE;  /* With specific_login, found *our* login
+-                                  name (or login-less line) */
+-
+-  DEBUGASSERT(netrcfile);
++  if(!store->loaded) {
++    if(file2memory(netrcfile, filebuf))
++      return NETRC_FAILED;
++    store->loaded = TRUE;
++  }
+
+-  file = fopen(netrcfile, FOPEN_READTEXT);
+-  if(file) {
+-    bool done = FALSE;
+-    struct dynbuf buf;
+-    Curl_dyn_init(&buf, MAX_NETRC_LINE);
++  netrcbuffer = Curl_dyn_ptr(filebuf);
+
+-    while(!done && Curl_get_line(&buf, file)) {
+-      char *tok;
++  while(!done) {
++    char *tok = netrcbuffer;
++    while(tok) {
+       char *tok_end;
+       bool quoted;
+-      char *netrcbuffer = Curl_dyn_ptr(&buf);
++      Curl_dyn_reset(&token);
++      while(ISBLANK(*tok))
++        tok++;
++      /* tok is first non-space letter */
+       if(state == MACDEF) {
+-        if((netrcbuffer[0] == '\n') || (netrcbuffer[0] == '\r'))
+-          state = NOTHING;
+-        else
+-          continue;
++        if((*tok == '\n') || (*tok == '\r'))
++          state = NOTHING; /* end of macro definition */
+       }
+-      tok = netrcbuffer;
+-      while(tok) {
+-        while(ISBLANK(*tok))
+-          tok++;
+-        /* tok is first non-space letter */
+-        if(!*tok || (*tok == '#'))
+-          /* end of line or the rest is a comment */
+-          break;
++      if(!*tok || (*tok == '\n'))
++        /* end of line  */
++        break;
+
+-        /* leading double-quote means quoted string */
+-        quoted = (*tok == '\"');
++      /* leading double-quote means quoted string */
++      quoted = (*tok == '\"');
+
+-        tok_end = tok;
+-        if(!quoted) {
+-          while(!ISSPACE(*tok_end))
+-            tok_end++;
+-          *tok_end = 0;
++      tok_end = tok;
++      if(!quoted) {
++        size_t len = 0;
++        while(!ISSPACE(*tok_end)) {
++          tok_end++;
++          len++;
+         }
+-        else {
+-          bool escape = FALSE;
+-          bool endquote = FALSE;
+-          char *store = tok;
+-          tok_end++; /* pass the leading quote */
+-          while(*tok_end) {
+-            char s = *tok_end;
+-            if(escape) {
+-              escape = FALSE;
+-              switch(s) {
+-              case 'n':
+-                s = '\n';
+-                break;
+-              case 'r':
+-                s = '\r';
+-                break;
+-              case 't':
+-                s = '\t';
+-                break;
+-              }
+-            }
+-            else if(s == '\\') {
+-              escape = TRUE;
+-              tok_end++;
+-              continue;
+-            }
+-            else if(s == '\"') {
+-              tok_end++; /* pass the ending quote */
+-              endquote = TRUE;
++        if(!len || Curl_dyn_addn(&token, tok, len)) {
++          retcode = NETRC_FAILED;
++          goto out;
++        }
++      }
++      else {
++        bool escape = FALSE;
++        bool endquote = FALSE;
++        tok_end++; /* pass the leading quote */
++        while(*tok_end) {
++          char s = *tok_end;
++          if(escape) {
++            escape = FALSE;
++            switch(s) {
++            case 'n':
++              s = '\n';
++              break;
++            case 'r':
++              s = '\r';
++              break;
++            case 't':
++              s = '\t';
+               break;
+             }
+-            *store++ = s;
++          }
++          else if(s == '\\') {
++            escape = TRUE;
+             tok_end++;
++            continue;
+           }
+-          *store = 0;
+-          if(escape || !endquote) {
+-            /* bad syntax, get out */
++          else if(s == '\"') {
++            tok_end++; /* pass the ending quote */
++            endquote = TRUE;
++            break;
++          }
++          if(Curl_dyn_addn(&token, &s, 1)) {
+             retcode = NETRC_FAILED;
+             goto out;
+           }
++          tok_end++;
+         }
+-
+-        if((login && *login) && (password && *password)) {
+-          done = TRUE;
+-          break;
++        if(escape || !endquote) {
++          /* bad syntax, get out */
++          retcode = NETRC_FAILED;
++          goto out;
+         }
++      }
+
+-        switch(state) {
+-        case NOTHING:
+-          if(strcasecompare("macdef", tok)) {
+-            /* Define a macro. A macro is defined with the specified name; its
+-               contents begin with the next .netrc line and continue until a
+-               null line (consecutive new-line characters) is encountered. */
+-            state = MACDEF;
+-          }
+-          else if(strcasecompare("machine", tok)) {
+-            /* the next tok is the machine name, this is in itself the
+-               delimiter that starts the stuff entered for this machine,
+-               after this we need to search for 'login' and
+-               'password'. */
+-            state = HOSTFOUND;
+-          }
+-          else if(strcasecompare("default", tok)) {
+-            state = HOSTVALID;
+-            retcode = NETRC_SUCCESS; /* we did find our host */
+-          }
+-          break;
+-        case MACDEF:
+-          if(!strlen(tok)) {
+-            state = NOTHING;
+-          }
+-          break;
+-        case HOSTFOUND:
+-          if(strcasecompare(host, tok)) {
+-            /* and yes, this is our host! */
+-            state = HOSTVALID;
+-            retcode = NETRC_SUCCESS; /* we did find our host */
++      if((login && *login) && (password && *password)) {
++        done = TRUE;
++        break;
++      }
++
++      tok = Curl_dyn_ptr(&token);
++
++      switch(state) {
++      case NOTHING:
++        if(strcasecompare("macdef", tok))
++          /* Define a macro. A macro is defined with the specified name; its
++             contents begin with the next .netrc line and continue until a
++             null line (consecutive new-line characters) is encountered. */
++          state = MACDEF;
++        else if(strcasecompare("machine", tok))
++          /* the next tok is the machine name, this is in itself the delimiter
++             that starts the stuff entered for this machine, after this we
++             need to search for 'login' and 'password'. */
++          state = HOSTFOUND;
++        else if(strcasecompare("default", tok)) {
++          state = HOSTVALID;
++          retcode = NETRC_SUCCESS; /* we did find our host */
++        }
++        break;
++      case MACDEF:
++        if(!*tok)
++          state = NOTHING;
++        break;
++      case HOSTFOUND:
++        if(strcasecompare(host, tok)) {
++          /* and yes, this is our host! */
++          state = HOSTVALID;
++          retcode = NETRC_SUCCESS; /* we did find our host */
++        }
++        else
++          /* not our host */
++          state = NOTHING;
++        break;
++      case HOSTVALID:
++        /* we are now parsing sub-keywords concerning "our" host */
++        if(found == LOGIN) {
++          if(specific_login) {
++            our_login = !Curl_timestrcmp(login, tok);
+           }
+-          else
+-            /* not our host */
+-            state = NOTHING;
+-          break;
+-        case HOSTVALID:
+-          /* we are now parsing sub-keywords concerning "our" host */
+-          if(state_login) {
+-            if(specific_login) {
+-              state_our_login = !Curl_timestrcmp(login, tok);
+-            }
+-            else if(!login || Curl_timestrcmp(login, tok)) {
+-              if(login_alloc) {
+-                free(login);
+-                login_alloc = FALSE;
+-              }
+-              login = strdup(tok);
+-              if(!login) {
+-                retcode = NETRC_FAILED; /* allocation failed */
+-                goto out;
+-              }
+-              login_alloc = TRUE;
++          else if(!login || Curl_timestrcmp(login, tok)) {
++            if(login_alloc)
++              free(login);
++            login = strdup(tok);
++            if(!login) {
++              retcode = NETRC_FAILED; /* allocation failed */
++              goto out;
+             }
+-            state_login = 0;
++            login_alloc = TRUE;
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
++          found = NONE;
++        }
++        else if(found == PASSWORD) {
++          if((our_login || !specific_login) &&
++             (!password || Curl_timestrcmp(password, tok))) {
++            if(password_alloc)
++              free(password);
++            password = strdup(tok);
++            if(!password) {
++              retcode = NETRC_FAILED; /* allocation failed */
++              goto out;
+             }
+-            state_password = 0;
+-          }
+-          else if(strcasecompare("login", tok))
+-            state_login = 1;
+-          else if(strcasecompare("password", tok))
+-            state_password = 1;
+-          else if(strcasecompare("machine", tok)) {
+-            /* ok, there's machine here go => */
+-            state = HOSTFOUND;
+-            state_our_login = FALSE;
++            password_alloc = TRUE;
+           }
+-          break;
+-        } /* switch (state) */
+-        tok = ++tok_end;
+-      }
+-    } /* while Curl_get_line() */
++          found = NONE;
++        }
++        else if(strcasecompare("login", tok))
++          found = LOGIN;
++        else if(strcasecompare("password", tok))
++          found = PASSWORD;
++        else if(strcasecompare("machine", tok)) {
++          /* ok, there is machine here go => */
++          state = HOSTFOUND;
++          found = NONE;
++        }
++        break;
++      } /* switch (state) */
++      tok = ++tok_end;
++    }
++    if(!done) {
++      char *nl = NULL;
++      if(tok)
++        nl = strchr(tok, '\n');
++      if(!nl)
++        break;
++      /* point to next line */
++      netrcbuffer = &nl[1];
++    }
++  } /* while !done */
+
+ out:
+-    Curl_dyn_free(&buf);
+-    if(!retcode) {
+-      /* success */
+-      if(login_alloc) {
+-        if(*loginp)
+-          free(*loginp);
+-        *loginp = login;
+-      }
+-      if(password_alloc) {
+-        if(*passwordp)
+-          free(*passwordp);
+-        *passwordp = password;
+-      }
++  Curl_dyn_free(&token);
++  if(!retcode) {
++    /* success */
++    if(login_alloc) {
++      free(*loginp);
++      *loginp = login;
+     }
+-    else {
+-      if(login_alloc)
+-        free(login);
+-      if(password_alloc)
+-        free(password);
++    if(password_alloc) {
++      free(*passwordp);
++      *passwordp = password;
+     }
+-    fclose(file);
++  }
++  else {
++    Curl_dyn_free(filebuf);
++    if(login_alloc)
++      free(login);
++    if(password_alloc)
++      free(password);
+   }
+
+   return retcode;
+@@ -280,7 +321,8 @@ out:
+  * *loginp and *passwordp MUST be allocated if they aren't NULL when passed
+  * in.
+  */
+-int Curl_parsenetrc(const char *host, char **loginp, char **passwordp,
++int Curl_parsenetrc(struct store_netrc *store, const char *host,
++                    char **loginp, char **passwordp,
+                     char *netrcfile)
+ {
+   int retcode = 1;
+@@ -329,7 +371,7 @@ int Curl_parsenetrc(const char *host, char **loginp, char **passwordp,
+       free(homea);
+       return -1;
+     }
+-    retcode = parsenetrc(host, loginp, passwordp, filealloc);
++    retcode = parsenetrc(store, host, loginp, passwordp, filealloc);
+     free(filealloc);
+ #ifdef _WIN32
+     if(retcode == NETRC_FILE_MISSING) {
+@@ -339,15 +381,25 @@ int Curl_parsenetrc(const char *host, char **loginp, char **passwordp,
+         free(homea);
+         return -1;
+       }
+-      retcode = parsenetrc(host, loginp, passwordp, filealloc);
++      retcode = parsenetrc(store, host, loginp, passwordp, filealloc);
+       free(filealloc);
+     }
+ #endif
+     free(homea);
+   }
+   else
+-    retcode = parsenetrc(host, loginp, passwordp, netrcfile);
++    retcode = parsenetrc(store, host, loginp, passwordp, netrcfile);
+   return retcode;
+ }
+
++void Curl_netrc_init(struct store_netrc *s)
++{
++  Curl_dyn_init(&s->filebuf, MAX_NETRC_FILE);
++  s->loaded = FALSE;
++}
++void Curl_netrc_cleanup(struct store_netrc *s)
++{
++  Curl_dyn_free(&s->filebuf);
++  s->loaded = FALSE;
++}
+ #endif
+diff --git a/lib/netrc.h b/lib/netrc.h
+index 9f2815f..fac223a 100644
+--- a/lib/netrc.h
++++ b/lib/netrc.h
+@@ -26,9 +26,19 @@
+
+ #include "curl_setup.h"
+ #ifndef CURL_DISABLE_NETRC
++#include "dynbuf.h"
++
++struct store_netrc {
++  struct dynbuf filebuf;
++  char *filename;
++  BIT(loaded);
++};
++
++void Curl_netrc_init(struct store_netrc *s);
++void Curl_netrc_cleanup(struct store_netrc *s);
+
+ /* returns -1 on failure, 0 if the host is found, 1 is the host isn't found */
+-int Curl_parsenetrc(const char *host, char **loginp,
++int Curl_parsenetrc(struct store_netrc *s, const char *host, char **loginp,
+                     char **passwordp, char *filename);
+   /* Assume: (*passwordp)[0]=0, host[0] != 0.
+    * If (*loginp)[0] = 0, search for login and password within a machine
+@@ -38,6 +48,8 @@ int Curl_parsenetrc(const char *host, char **loginp,
+ #else
+ /* disabled */
+ #define Curl_parsenetrc(a,b,c,d,e,f) 1
++#define Curl_netrc_init(x)
++#define Curl_netrc_cleanup(x)
+ #endif
+
+ #endif /* HEADER_CURL_NETRC_H */
+diff --git a/lib/url.c b/lib/url.c
+index 224b9f3..5cdf83c 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -329,6 +329,7 @@ CURLcode Curl_close(struct Curl_easy **datap)
+   Curl_wildcard_dtor(&data->wildcard);
+   Curl_freeset(data);
+   Curl_headers_cleanup(data);
++  Curl_netrc_cleanup(&data->state.netrc);
+   free(data);
+   return CURLE_OK;
+ }
+@@ -532,6 +533,7 @@ CURLcode Curl_open(struct Curl_easy **curl)
+
+     data->progress.flags |= PGRS_HIDE;
+     data->state.current_speed = -1; /* init to negative == impossible */
++    Curl_netrc_init(&data->state.netrc);
+   }
+
+   if(result) {
+@@ -2736,7 +2738,7 @@ static CURLcode override_login(struct Curl_easy *data,
+       url_provided = TRUE;
+     }
+
+-    ret = Curl_parsenetrc(conn->host.name,
++    ret = Curl_parsenetrc(&data->state.netrc, conn->host.name,
+                           userp, passwdp,
+                           data->set.str[STRING_NETRC_FILE]);
+     if(ret > 0) {
+diff --git a/lib/urldata.h b/lib/urldata.h
+index ce28f25..165136e 100644
+--- a/lib/urldata.h
++++ b/lib/urldata.h
+@@ -144,6 +144,7 @@ typedef unsigned int curl_prot_t;
+ #include "dynbuf.h"
+ #include "dynhds.h"
+ #include "request.h"
++#include "netrc.h"
+
+ /* return the count of bytes sent, or -1 on error */
+ typedef ssize_t (Curl_send)(struct Curl_easy *data,   /* transfer */
+@@ -1324,6 +1325,10 @@ struct UrlState {
+   struct curl_trc_feat *feat; /* opt. trace feature transfer is part of */
+ #endif
+
++#ifndef CURL_DISABLE_NETRC
++  struct store_netrc netrc;
++#endif
++
+   /* Dynamically allocated strings, MUST be freed before this struct is
+      killed. */
+   struct dynamically_allocated_data {
+diff --git a/tests/unit/unit1304.c b/tests/unit/unit1304.c
+index 0288562..34cfb7a 100644
+--- a/tests/unit/unit1304.c
++++ b/tests/unit/unit1304.c
+@@ -49,17 +49,22 @@ static void unit_stop(void)
+ }
+
+ UNITTEST_START
++{
+   int result;
++  struct store_netrc store;
+
+   /*
+    * Test a non existent host in our netrc file.
+    */
+-  result = Curl_parsenetrc("test.example.com", &login, &password, arg);
++  Curl_netrc_init(&store);
++  result = Curl_parsenetrc(&store,
++                           "test.example.com", &s_login, &s_password, arg);
+   fail_unless(result == 1, "Host not found should return 1");
+   abort_unless(password != NULL, "returned NULL!");
+   fail_unless(password[0] == 0, "password should not have been changed");
+   abort_unless(login != NULL, "returned NULL!");
+   fail_unless(login[0] == 0, "login should not have been changed");
++  Curl_netrc_cleanup(&store);
+
+   /*
+    * Test a non existent login in our netrc file.
+@@ -67,13 +72,16 @@ UNITTEST_START
+   free(login);
+   login = strdup("me");
+   abort_unless(login != NULL, "returned NULL!");
+-  result = Curl_parsenetrc("example.com", &login, &password, arg);
++  Curl_netrc_init(&store);
++  result = Curl_parsenetrc(&store,
++                           "example.com", &s_login, &s_password, arg);
+   fail_unless(result == 0, "Host should have been found");
+   abort_unless(password != NULL, "returned NULL!");
+   fail_unless(password[0] == 0, "password should not have been changed");
+   abort_unless(login != NULL, "returned NULL!");
+   fail_unless(strncmp(login, "me", 2) == 0,
+               "login should not have been changed");
++  Curl_netrc_cleanup(&store);
+
+   /*
+    * Test a non existent login and host in our netrc file.
+@@ -81,13 +89,16 @@ UNITTEST_START
+   free(login);
+   login = strdup("me");
+   abort_unless(login != NULL, "returned NULL!");
+-  result = Curl_parsenetrc("test.example.com", &login, &password, arg);
++  Curl_netrc_init(&store);
++  result = Curl_parsenetrc(&store,
++                           "test.example.com", &s_login, &s_password, arg);
+   fail_unless(result == 1, "Host not found should return 1");
+   abort_unless(password != NULL, "returned NULL!");
+   fail_unless(password[0] == 0, "password should not have been changed");
+   abort_unless(login != NULL, "returned NULL!");
+   fail_unless(strncmp(login, "me", 2) == 0,
+               "login should not have been changed");
++  Curl_netrc_cleanup(&store);
+
+   /*
+    * Test a non existent login (substring of an existing one) in our
+@@ -96,13 +107,16 @@ UNITTEST_START
+   free(login);
+   login = strdup("admi");
+   abort_unless(login != NULL, "returned NULL!");
+-  result = Curl_parsenetrc("example.com", &login, &password, arg);
++  Curl_netrc_init(&store);
++  result = Curl_parsenetrc(&store,
++                           "example.com", &s_login, &s_password, arg);
+   fail_unless(result == 0, "Host should have been found");
+   abort_unless(password != NULL, "returned NULL!");
+   fail_unless(password[0] == 0, "password should not have been changed");
+   abort_unless(login != NULL, "returned NULL!");
+   fail_unless(strncmp(login, "admi", 4) == 0,
+               "login should not have been changed");
++  Curl_netrc_cleanup(&store);
+
+   /*
+    * Test a non existent login (superstring of an existing one)
+@@ -111,13 +125,16 @@ UNITTEST_START
+   free(login);
+   login = strdup("adminn");
+   abort_unless(login != NULL, "returned NULL!");
+-  result = Curl_parsenetrc("example.com", &login, &password, arg);
++  Curl_netrc_init(&store);
++  result = Curl_parsenetrc(&store,
++                           "example.com", &s_login, &s_password, arg);
+   fail_unless(result == 0, "Host should have been found");
+   abort_unless(password != NULL, "returned NULL!");
+   fail_unless(password[0] == 0, "password should not have been changed");
+   abort_unless(login != NULL, "returned NULL!");
+   fail_unless(strncmp(login, "adminn", 6) == 0,
+               "login should not have been changed");
++  Curl_netrc_cleanup(&store);
+
+   /*
+    * Test for the first existing host in our netrc file
+@@ -126,13 +143,16 @@ UNITTEST_START
+   free(login);
+   login = strdup("");
+   abort_unless(login != NULL, "returned NULL!");
+-  result = Curl_parsenetrc("example.com", &login, &password, arg);
++  Curl_netrc_init(&store);
++  result = Curl_parsenetrc(&store,
++                           "example.com", &s_login, &s_password, arg);
+   fail_unless(result == 0, "Host should have been found");
+   abort_unless(password != NULL, "returned NULL!");
+   fail_unless(strncmp(password, "passwd", 6) == 0,
+               "password should be 'passwd'");
+   abort_unless(login != NULL, "returned NULL!");
+   fail_unless(strncmp(login, "admin", 5) == 0, "login should be 'admin'");
++  Curl_netrc_cleanup(&store);
+
+   /*
+    * Test for the first existing host in our netrc file
+@@ -141,13 +161,16 @@ UNITTEST_START
+   free(password);
+   password = strdup("");
+   abort_unless(password != NULL, "returned NULL!");
+-  result = Curl_parsenetrc("example.com", &login, &password, arg);
++  Curl_netrc_init(&store);
++  result = Curl_parsenetrc(&store,
++                           "example.com", &s_login, &s_password, arg);
+   fail_unless(result == 0, "Host should have been found");
+   abort_unless(password != NULL, "returned NULL!");
+   fail_unless(strncmp(password, "passwd", 6) == 0,
+               "password should be 'passwd'");
+   abort_unless(login != NULL, "returned NULL!");
+   fail_unless(strncmp(login, "admin", 5) == 0, "login should be 'admin'");
++  Curl_netrc_cleanup(&store);
+
+   /*
+    * Test for the second existing host in our netrc file
+@@ -159,13 +182,16 @@ UNITTEST_START
+   free(login);
+   login = strdup("");
+   abort_unless(login != NULL, "returned NULL!");
+-  result = Curl_parsenetrc("curl.example.com", &login, &password, arg);
++  Curl_netrc_init(&store);
++  result = Curl_parsenetrc(&store,
++                           "curl.example.com", &s_login, &s_password, arg);
+   fail_unless(result == 0, "Host should have been found");
+   abort_unless(password != NULL, "returned NULL!");
+   fail_unless(strncmp(password, "none", 4) == 0,
+               "password should be 'none'");
+   abort_unless(login != NULL, "returned NULL!");
+   fail_unless(strncmp(login, "none", 4) == 0, "login should be 'none'");
++  Curl_netrc_cleanup(&store);
+
+   /*
+    * Test for the second existing host in our netrc file
+@@ -174,14 +200,18 @@ UNITTEST_START
+   free(password);
+   password = strdup("");
+   abort_unless(password != NULL, "returned NULL!");
+-  result = Curl_parsenetrc("curl.example.com", &login, &password, arg);
++  Curl_netrc_init(&store);
++  result = Curl_parsenetrc(&store,
++                           "curl.example.com", &s_login, &s_password, arg);
+   fail_unless(result == 0, "Host should have been found");
+   abort_unless(password != NULL, "returned NULL!");
+   fail_unless(strncmp(password, "none", 4) == 0,
+               "password should be 'none'");
+   abort_unless(login != NULL, "returned NULL!");
+   fail_unless(strncmp(login, "none", 4) == 0, "login should be 'none'");
++  Curl_netrc_cleanup(&store);
+
++}
+ UNITTEST_STOP
+
+ #else
+--
+2.40.0
diff --git a/meta/recipes-support/curl/curl/CVE-2024-11053-0002.patch b/meta/recipes-support/curl/curl/CVE-2024-11053-0002.patch
new file mode 100644
index 0000000000..f066b0b1d5
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2024-11053-0002.patch
@@ -0,0 +1,734 @@
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
+Conflicts:
+- Use old variable names password and loging instead of s_password and s_login.
+- Test files are added in Makefile.inc.
+
+CVE: CVE-2024-11053
+Upstream-Status: Backport [https://github.com/curl/curl/commit/e9b9bbac22c26cf67316fa8e6c6b9e831af31949]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ lib/netrc.c             | 113 +++++++++++++++++++++++-----------------
+ lib/url.c               |  60 ++++++++++++++-------
+ tests/data/Makefile.inc |   2 +-
+ tests/data/test478      |  73 ++++++++++++++++++++++++++
+ tests/data/test479      | 107 +++++++++++++++++++++++++++++++++++++
+ tests/data/test480      |  38 ++++++++++++++
+ tests/unit/unit1304.c   |  75 ++++++++------------------
+ 7 files changed, 345 insertions(+), 123 deletions(-)
+ create mode 100644 tests/data/test478
+ create mode 100644 tests/data/test479
+ create mode 100644 tests/data/test480
+
+diff --git a/lib/netrc.c b/lib/netrc.c
+index d72959b..8b0192a 100644
+--- a/lib/netrc.c
++++ b/lib/netrc.c
+@@ -54,6 +54,9 @@ enum found_state {
+   PASSWORD
+ };
+
++#define FOUND_LOGIN    1
++#define FOUND_PASSWORD 2
++
+ #define NETRC_FILE_MISSING 1
+ #define NETRC_FAILED -1
+ #define NETRC_SUCCESS 0
+@@ -94,24 +97,24 @@ done:
+  */
+ static int parsenetrc(struct store_netrc *store,
+                       const char *host,
+-                      char **loginp,
++                      char **loginp, /* might point to a username */
+                       char **passwordp,
+                       const char *netrcfile)
+ {
+   int retcode = NETRC_FILE_MISSING;
+   char *login = *loginp;
+-  char *password = *passwordp;
+-  bool specific_login = (login && *login != 0);
+-  bool login_alloc = FALSE;
+-  bool password_alloc = FALSE;
++  char *password = NULL;
++  bool specific_login = login; /* points to something */
+   enum host_lookup_state state = NOTHING;
+-  enum found_state found = NONE;
+-  bool our_login = TRUE;  /* With specific_login, found *our* login name (or
+-                             login-less line) */
++  enum found_state keyword = NONE;
++  unsigned char found = 0; /* login + password found bits, as they can come in
++                              any order */
++  bool our_login = FALSE;  /* found our login name */
+   bool done = FALSE;
+   char *netrcbuffer;
+   struct dynbuf token;
+   struct dynbuf *filebuf = &store->filebuf;
++  DEBUGASSERT(!*passwordp);
+   Curl_dyn_init(&token, MAX_NETRC_TOKEN);
+
+   if(!store->loaded) {
+@@ -124,7 +127,7 @@ static int parsenetrc(struct store_netrc *store,
+
+   while(!done) {
+     char *tok = netrcbuffer;
+-    while(tok) {
++    while(tok && !done) {
+       char *tok_end;
+       bool quoted;
+       Curl_dyn_reset(&token);
+@@ -197,11 +200,6 @@ static int parsenetrc(struct store_netrc *store,
+         }
+       }
+
+-      if((login && *login) && (password && *password)) {
+-        done = TRUE;
+-        break;
+-      }
+-
+       tok = Curl_dyn_ptr(&token);
+
+       switch(state) {
+@@ -211,11 +209,18 @@ static int parsenetrc(struct store_netrc *store,
+              contents begin with the next .netrc line and continue until a
+              null line (consecutive new-line characters) is encountered. */
+           state = MACDEF;
+-        else if(strcasecompare("machine", tok))
++        else if(strcasecompare("machine", tok)) {
+           /* the next tok is the machine name, this is in itself the delimiter
+              that starts the stuff entered for this machine, after this we
+              need to search for 'login' and 'password'. */
+           state = HOSTFOUND;
++          keyword = NONE;
++          found = 0;
++          our_login = FALSE;
++          Curl_safefree(password);
++          if(!specific_login)
++            Curl_safefree(login);
++        }
+         else if(strcasecompare("default", tok)) {
+           state = HOSTVALID;
+           retcode = NETRC_SUCCESS; /* we did find our host */
+@@ -237,44 +242,54 @@ static int parsenetrc(struct store_netrc *store,
+         break;
+       case HOSTVALID:
+         /* we are now parsing sub-keywords concerning "our" host */
+-        if(found == LOGIN) {
+-          if(specific_login) {
++        if(keyword == LOGIN) {
++          if(specific_login)
+             our_login = !Curl_timestrcmp(login, tok);
+-          }
+-          else if(!login || Curl_timestrcmp(login, tok)) {
+-            if(login_alloc)
+-              free(login);
++          else {
++            our_login = TRUE;
++            free(login);
+             login = strdup(tok);
+             if(!login) {
+               retcode = NETRC_FAILED; /* allocation failed */
+               goto out;
+             }
+-            login_alloc = TRUE;
+           }
+-          found = NONE;
++          found |= FOUND_LOGIN;
++          keyword = NONE;
+         }
+-        else if(found == PASSWORD) {
+-          if((our_login || !specific_login) &&
+-             (!password || Curl_timestrcmp(password, tok))) {
+-            if(password_alloc)
+-              free(password);
+-            password = strdup(tok);
+-            if(!password) {
+-              retcode = NETRC_FAILED; /* allocation failed */
+-              goto out;
+-            }
+-            password_alloc = TRUE;
++        else if(keyword == PASSWORD) {
++          free(password);
++          password = strdup(tok);
++          if(!password) {
++            retcode = NETRC_FAILED; /* allocation failed */
++            goto out;
+           }
+-          found = NONE;
++          found |= FOUND_PASSWORD;
++          keyword = NONE;
+         }
+         else if(strcasecompare("login", tok))
+-          found = LOGIN;
++          keyword = LOGIN;
+         else if(strcasecompare("password", tok))
+-          found = PASSWORD;
++          keyword = PASSWORD;
+         else if(strcasecompare("machine", tok)) {
+-          /* ok, there is machine here go => */
++          /* a new machine here */
+           state = HOSTFOUND;
+-          found = NONE;
++          keyword = NONE;
++          found = 0;
++          Curl_safefree(password);
++          if(!specific_login)
++            Curl_safefree(login);
++        }
++        else if(strcasecompare("default", tok)) {
++          state = HOSTVALID;
++          retcode = NETRC_SUCCESS; /* we did find our host */
++          Curl_safefree(password);
++          if(!specific_login)
++            Curl_safefree(login);
++        }
++        if((found == (FOUND_PASSWORD|FOUND_LOGIN)) && our_login) {
++          done = TRUE;
++          break;
+         }
+         break;
+       } /* switch (state) */
+@@ -293,23 +308,23 @@ static int parsenetrc(struct store_netrc *store,
+
+ out:
+   Curl_dyn_free(&token);
++  if(!retcode && !password && our_login) {
++    /* success without a password, set a blank one */
++    password = strdup("");
++    if(!password)
++      retcode = 1; /* out of memory */
++  }
+   if(!retcode) {
+     /* success */
+-    if(login_alloc) {
+-      free(*loginp);
++    if(!specific_login)
+       *loginp = login;
+-    }
+-    if(password_alloc) {
+-      free(*passwordp);
+-      *passwordp = password;
+-    }
++    *passwordp = password;
+   }
+   else {
+     Curl_dyn_free(filebuf);
+-    if(login_alloc)
++    if(!specific_login)
+       free(login);
+-    if(password_alloc)
+-      free(password);
++    free(password);
+   }
+
+   return retcode;
+diff --git a/lib/url.c b/lib/url.c
+index 5cdf83c..247a8f9 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -2703,6 +2703,17 @@ static CURLcode parse_remote_port(struct Curl_easy *data,
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
+@@ -2733,29 +2744,40 @@ static CURLcode override_login(struct Curl_easy *data,
+     bool url_provided = FALSE;
+
+     if(data->state.aptr.user) {
+-      /* there was a user name in the URL. Use the URL decoded version */
++      /* there was a username with a length in the URL. Use the URL decoded
++         version */
+       userp = &data->state.aptr.user;
+       url_provided = TRUE;
+     }
+
+-    ret = Curl_parsenetrc(&data->state.netrc, conn->host.name,
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
++      ret = Curl_parsenetrc(&data->state.netrc, conn->host.name,
++                            userp, passwdp,
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
+index d89e565..7a6b153 100644
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
+index 0000000..7d7454d
+--- /dev/null
++++ b/tests/data/test478
+@@ -0,0 +1,73 @@
++<testcase>
++<info>
++<keywords>
++netrc
++HTTP
++</keywords>
++</info>
++#
++# Server-side
++<reply>
++<data crlf="yes">
++HTTP/1.1 200 OK
++Date: Tue, 09 Nov 2010 14:49:00 GMT
++Server: test-server/fake
++Last-Modified: Tue, 13 Jun 2000 12:10:00 GMT
++ETag: "21025-dc7-39462498"
++Accept-Ranges: bytes
++Content-Length: 6
++Connection: close
++Content-Type: text/html
++Funny-head: yesyes
++
++-foo-
++</data>
++</reply>
++
++#
++# Client-side
++<client>
++<server>
++http
++</server>
++<features>
++proxy
++</features>
++<name>
++.netrc with multiple accounts for same host
++</name>
++<command>
++--netrc --netrc-file %LOGDIR/netrc%TESTNUMBER -x http://%HOSTIP:%HTTPPORT/ http://debbie@github.com/
++</command>
++<file name="%LOGDIR/netrc%TESTNUMBER" >
++
++machine github.com
++password weird
++password firstone
++login daniel
++
++machine github.com
++
++machine github.com
++login debbie
++
++machine github.com
++password weird
++password "second\r"
++login debbie
++
++</file>
++</client>
++
++<verify>
++<protocol>
++GET http://github.com/ HTTP/1.1
++Host: github.com
++Authorization: Basic %b64[debbie:second%0D]b64%
++User-Agent: curl/%VERSION
++Accept: */*
++Proxy-Connection: Keep-Alive
++
++</protocol>
++</verify>
++</testcase>
+diff --git a/tests/data/test479 b/tests/data/test479
+new file mode 100644
+index 0000000..48bcdfe
+--- /dev/null
++++ b/tests/data/test479
+@@ -0,0 +1,107 @@
++<testcase>
++<info>
++<keywords>
++netrc
++HTTP
++</keywords>
++</info>
++#
++# Server-side
++<reply>
++<data crlf="yes">
++HTTP/1.1 301 Follow this you fool
++Date: Tue, 09 Nov 2010 14:49:00 GMT
++Server: test-server/fake
++Last-Modified: Tue, 13 Jun 2000 12:10:00 GMT
++ETag: "21025-dc7-39462498"
++Accept-Ranges: bytes
++Content-Length: 6
++Connection: close
++Location: http://b.com/%TESTNUMBER0002
++
++-foo-
++</data>
++
++<data2 crlf="yes">
++HTTP/1.1 200 OK
++Date: Tue, 09 Nov 2010 14:49:00 GMT
++Server: test-server/fake
++Last-Modified: Tue, 13 Jun 2000 12:10:00 GMT
++ETag: "21025-dc7-39462498"
++Accept-Ranges: bytes
++Content-Length: 7
++Connection: close
++
++target
++</data2>
++
++<datacheck crlf="yes">
++HTTP/1.1 301 Follow this you fool
++Date: Tue, 09 Nov 2010 14:49:00 GMT
++Server: test-server/fake
++Last-Modified: Tue, 13 Jun 2000 12:10:00 GMT
++ETag: "21025-dc7-39462498"
++Accept-Ranges: bytes
++Content-Length: 6
++Connection: close
++Location: http://b.com/%TESTNUMBER0002
++
++HTTP/1.1 200 OK
++Date: Tue, 09 Nov 2010 14:49:00 GMT
++Server: test-server/fake
++Last-Modified: Tue, 13 Jun 2000 12:10:00 GMT
++ETag: "21025-dc7-39462498"
++Accept-Ranges: bytes
++Content-Length: 7
++Connection: close
++
++target
++</datacheck>
++</reply>
++
++#
++# Client-side
++<client>
++<server>
++http
++</server>
++<features>
++proxy
++</features>
++<name>
++.netrc with redirect and default without password
++</name>
++<command>
++--netrc --netrc-file %LOGDIR/netrc%TESTNUMBER -L -x http://%HOSTIP:%HTTPPORT/ http://a.com/
++</command>
++<file name="%LOGDIR/netrc%TESTNUMBER" >
++
++machine a.com
++  login alice
++  password alicespassword
++
++default
++  login bob
++
++</file>
++</client>
++
++<verify>
++<protocol>
++GET http://a.com/ HTTP/1.1
++Host: a.com
++Authorization: Basic %b64[alice:alicespassword]b64%
++User-Agent: curl/%VERSION
++Accept: */*
++Proxy-Connection: Keep-Alive
++
++GET http://b.com/%TESTNUMBER0002 HTTP/1.1
++Host: b.com
++Authorization: Basic %b64[bob:]b64%
++User-Agent: curl/%VERSION
++Accept: */*
++Proxy-Connection: Keep-Alive
++
++</protocol>
++</verify>
++</testcase>
+diff --git a/tests/data/test480 b/tests/data/test480
+new file mode 100644
+index 0000000..aab889f
+--- /dev/null
++++ b/tests/data/test480
+@@ -0,0 +1,38 @@
++<testcase>
++<info>
++<keywords>
++netrc
++pop3
++</keywords>
++</info>
++#
++# Server-side
++<reply>
++
++</reply>
++
++#
++# Client-side
++<client>
++<server>
++pop3
++</server>
++<name>
++Reject .netrc with credentials using CRLF for POP3
++</name>
++<command>
++--netrc --netrc-file %LOGDIR/netrc%TESTNUMBER pop3://%HOSTIP:%POP3PORT/%TESTNUMBER
++</command>
++<file name="%LOGDIR/netrc%TESTNUMBER" >
++machine %HOSTIP
++  login alice
++  password "password\r\ncommand"
++</file>
++</client>
++
++<verify>
++<errorcode>
++26
++</errorcode>
++</verify>
++</testcase>
+diff --git a/tests/unit/unit1304.c b/tests/unit/unit1304.c
+index 34cfb7a..db2a2c0 100644
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
+@@ -60,89 +55,61 @@ UNITTEST_START
+   result = Curl_parsenetrc(&store,
+                            "test.example.com", &s_login, &s_password, arg);
+   fail_unless(result == 1, "Host not found should return 1");
+-  abort_unless(password != NULL, "returned NULL!");
+-  fail_unless(password[0] == 0, "password should not have been changed");
+-  abort_unless(login != NULL, "returned NULL!");
+-  fail_unless(login[0] == 0, "login should not have been changed");
++  abort_unless(password == NULL, "password did not return NULL!");
++  abort_unless(login == NULL, "user did not return NULL!");
+   Curl_netrc_cleanup(&store);
+
+   /*
+    * Test a non existent login in our netrc file.
+    */
+-  free(login);
+-  login = strdup("me");
+-  abort_unless(login != NULL, "returned NULL!");
++  login = (char *)"me";
+   Curl_netrc_init(&store);
+   result = Curl_parsenetrc(&store,
+                            "example.com", &s_login, &s_password, arg);
+   fail_unless(result == 0, "Host should have been found");
+-  abort_unless(password != NULL, "returned NULL!");
+-  fail_unless(password[0] == 0, "password should not have been changed");
+-  abort_unless(login != NULL, "returned NULL!");
+-  fail_unless(strncmp(login, "me", 2) == 0,
+-              "login should not have been changed");
++  abort_unless(password == NULL, "password is not NULL!");
+   Curl_netrc_cleanup(&store);
+
+   /*
+    * Test a non existent login and host in our netrc file.
+    */
+-  free(login);
+-  login = strdup("me");
+-  abort_unless(login != NULL, "returned NULL!");
++  login = (char *)"me";
+   Curl_netrc_init(&store);
+   result = Curl_parsenetrc(&store,
+                            "test.example.com", &s_login, &s_password, arg);
+   fail_unless(result == 1, "Host not found should return 1");
+-  abort_unless(password != NULL, "returned NULL!");
+-  fail_unless(password[0] == 0, "password should not have been changed");
+-  abort_unless(login != NULL, "returned NULL!");
+-  fail_unless(strncmp(login, "me", 2) == 0,
+-              "login should not have been changed");
++  abort_unless(password == NULL, "password is not NULL!");
+   Curl_netrc_cleanup(&store);
+
+   /*
+    * Test a non existent login (substring of an existing one) in our
+    * netrc file.
+    */
+-  free(login);
+-  login = strdup("admi");
+-  abort_unless(login != NULL, "returned NULL!");
++  login = (char *)"admi";
+   Curl_netrc_init(&store);
+   result = Curl_parsenetrc(&store,
+                            "example.com", &s_login, &s_password, arg);
+   fail_unless(result == 0, "Host should have been found");
+-  abort_unless(password != NULL, "returned NULL!");
+-  fail_unless(password[0] == 0, "password should not have been changed");
+-  abort_unless(login != NULL, "returned NULL!");
+-  fail_unless(strncmp(login, "admi", 4) == 0,
+-              "login should not have been changed");
++  abort_unless(password == NULL, "password is not NULL!");
+   Curl_netrc_cleanup(&store);
+
+   /*
+    * Test a non existent login (superstring of an existing one)
+    * in our netrc file.
+    */
+-  free(login);
+-  login = strdup("adminn");
+-  abort_unless(login != NULL, "returned NULL!");
++  login = (char *)"adminn";
+   Curl_netrc_init(&store);
+   result = Curl_parsenetrc(&store,
+                            "example.com", &s_login, &s_password, arg);
+   fail_unless(result == 0, "Host should have been found");
+-  abort_unless(password != NULL, "returned NULL!");
+-  fail_unless(password[0] == 0, "password should not have been changed");
+-  abort_unless(login != NULL, "returned NULL!");
+-  fail_unless(strncmp(login, "adminn", 6) == 0,
+-              "login should not have been changed");
++  abort_unless(password == NULL, "password is not NULL!");
+   Curl_netrc_cleanup(&store);
+
+   /*
+    * Test for the first existing host in our netrc file
+    * with login[0] = 0.
+    */
+-  free(login);
+-  login = strdup("");
+-  abort_unless(login != NULL, "returned NULL!");
++  login = NULL;
+   Curl_netrc_init(&store);
+   result = Curl_parsenetrc(&store,
+                            "example.com", &s_login, &s_password, arg);
+@@ -159,8 +126,9 @@ UNITTEST_START
+    * with login[0] != 0.
+    */
+   free(password);
+-  password = strdup("");
+-  abort_unless(password != NULL, "returned NULL!");
++  free(login);
++  password = NULL;
++  login = NULL;
+   Curl_netrc_init(&store);
+   result = Curl_parsenetrc(&store,
+                            "example.com", &s_login, &s_password, arg);
+@@ -177,11 +145,9 @@ UNITTEST_START
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
+   Curl_netrc_init(&store);
+   result = Curl_parsenetrc(&store,
+                            "curl.example.com", &s_login, &s_password, arg);
+@@ -198,8 +164,9 @@ UNITTEST_START
+    * with login[0] != 0.
+    */
+   free(password);
+-  password = strdup("");
+-  abort_unless(password != NULL, "returned NULL!");
++  free(login);
++  password = NULL;
++  login = NULL;
+   Curl_netrc_init(&store);
+   result = Curl_parsenetrc(&store,
+                            "curl.example.com", &s_login, &s_password, arg);
+--
+2.40.0
diff --git a/meta/recipes-support/curl/curl/CVE-2024-11053-0003.patch b/meta/recipes-support/curl/curl/CVE-2024-11053-0003.patch
new file mode 100644
index 0000000000..ec55a68c5b
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2024-11053-0003.patch
@@ -0,0 +1,130 @@
+From 9fce2c55d4b0273ac99b59bd8cb982a6d96b88cf Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Tue, 17 Dec 2024 23:56:42 +0100
+Subject: [PATCH] netrc: fix password-only entries
+
+When a specific hostname matched, and only a password is set before
+another machine is specified in the netrc file, the parser would not be
+happy and stop there and return the password-only state. It instead
+continued and did not return a match.
+
+Add test 2005 to verify this case
+
+Regression from e9b9bba, shipped in 8.11.1.
+
+Reported-by: Ben Zanin
+Fixes #15767
+Closes #15768
+
+CVE: CVE-2024-11053
+Upstream-Status: Backport [https://github.com/curl/curl/commit/9fce2c55d4b0273ac99]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ lib/netrc.c             |  7 +++++-
+ tests/data/Makefile.inc |  2 +-
+ tests/data/test2005     | 55 +++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 62 insertions(+), 2 deletions(-)
+ create mode 100644 tests/data/test2005
+
+diff --git a/lib/netrc.c b/lib/netrc.c
+index 8b0192a..85b72ba 100644
+--- a/lib/netrc.c
++++ b/lib/netrc.c
+@@ -264,7 +264,8 @@ static int parsenetrc(struct store_netrc *store,
+             retcode = NETRC_FAILED; /* allocation failed */
+             goto out;
+           }
+-          found |= FOUND_PASSWORD;
++          if(!specific_login || our_login)
++            found |= FOUND_PASSWORD;
+           keyword = NONE;
+         }
+         else if(strcasecompare("login", tok))
+@@ -273,6 +274,10 @@ static int parsenetrc(struct store_netrc *store,
+           keyword = PASSWORD;
+         else if(strcasecompare("machine", tok)) {
+           /* a new machine here */
++          if(found & FOUND_PASSWORD) {
++            done = TRUE;
++            break;
++          }
+           state = HOSTFOUND;
+           keyword = NONE;
+           found = 0;
+diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
+index 7a6b153..32d8fee 100644
+--- a/tests/data/Makefile.inc
++++ b/tests/data/Makefile.inc
+@@ -230,7 +230,7 @@ test1941 test1942 test1943 test1944 test1945 test1946 test1947 test1948 \
+ test1955 test1956 test1957 test1958 test1959 test1960 test1964 \
+ test1970 test1971 test1972 test1973 test1974 test1975 \
+ \
+-test2000 test2001 test2002 test2003 test2004 \
++test2000 test2001 test2002 test2003 test2004 test2005 \
+ \
+                                                                test2023 \
+ test2024 test2025 test2026 test2027 test2028 test2029 test2030 test2031 \
+diff --git a/tests/data/test2005 b/tests/data/test2005
+new file mode 100644
+index 0000000..69e14d9
+--- /dev/null
++++ b/tests/data/test2005
+@@ -0,0 +1,55 @@
++<testcase>
++<info>
++<keywords>
++HTTP
++netrc
++</keywords>
++</info>
++#
++# Server-side
++<reply>
++<data>
++HTTP/1.1 200 OK
++Date: Fri, 05 Aug 2022 10:09:00 GMT
++Server: test-server/fake
++Content-Type: text/plain
++Content-Length: 6
++Connection: close
++
++-foo-
++</data>
++</reply>
++
++#
++# Client-side
++<client>
++<server>
++http
++</server>
++<name>
++netrc match with password only in file, no username. machine follows
++</name>
++<command>
++--netrc-optional --netrc-file %LOGDIR/netrc%TESTNUMBER http://%HOSTIP:%HTTPPORT/
++</command>
++<file name="%LOGDIR/netrc%TESTNUMBER" >
++machine %HOSTIP
++password 5up3r53cr37
++
++machine example.com
++</file>
++</client>
++
++#
++# Verify data after the test has been "shot"
++<verify>
++<protocol>
++GET / HTTP/1.1
++Host: %HOSTIP:%HTTPPORT
++Authorization: Basic %b64[:5up3r53cr37]b64%
++User-Agent: curl/%VERSION
++Accept: */*
++
++</protocol>
++</verify>
++</testcase>
+--
+2.40.0
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 439fcb7881..81243d1873 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -20,6 +20,9 @@ SRC_URI = " \
     file://CVE-2024-7264-2.patch \
     file://CVE-2024-8096.patch \
     file://CVE-2024-9681.patch \
+    file://CVE-2024-11053-0001.patch \
+    file://CVE-2024-11053-0002.patch \
+    file://CVE-2024-11053-0003.patch \
 "
 SRC_URI[sha256sum] = "6fea2aac6a4610fbd0400afb0bcddbe7258a64c63f1f68e5855ebc0c659710cd"
 
-- 
2.40.0


