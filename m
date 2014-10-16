Return-Path: <sona.sarmadi@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id E9B9660DD7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 09:04:10 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 16 Oct 2014 11:04:10 +0200
Received: by sestofb10.enea.se (Postfix, from userid 2671)	id 9262228FA68;
	Thu, 16 Oct 2014 11:04:10 +0200 (CEST)
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Oct 2014 11:04:08 +0200
Message-ID: <1413450248-39177-1-git-send-email-sona.sarmadi@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: sona.sarmadi@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH] OpenSSL: SRTP Memory Leak, CVE-2014-3513
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Oct 2014 09:04:13 -0000
Content-Type: text/plain

Reference:
http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-3513
https://www.openssl.org/news/secadv_20141015.txt

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
---
 .../openssl/openssl/openssl-CVE-2014-3513.patch    | 213 +++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.1g.bb |   1 +
 2 files changed, 214 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/openssl-CVE-2014-3513.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/openssl-CVE-2014-3513.patch b/meta/recipes-connectivity/openssl/openssl/openssl-CVE-2014-3513.patch
new file mode 100644
index 0000000..b0f501f
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/openssl-CVE-2014-3513.patch
@@ -0,0 +1,213 @@
+From 2b0532f3984324ebe1236a63d15893792384328d Mon Sep 17 00:00:00 2001
+From: Matt Caswell <matt@openssl.org>
+Date: Wed, 15 Oct 2014 01:20:38 +0100
+Subject: [PATCH] Fix for SRTP Memory Leak
+
+CVE-2014-3513
+
+This issue was reported to OpenSSL on 26th September 2014, based on an origi
+issue and patch developed by the LibreSSL project. Further analysis of the i
+was performed by the OpenSSL team.
+
+The fix was developed by the OpenSSL team.
+
+Upstream-Status: Backport
+
+Reviewed-by: Tim Hudson <tjh@openssl.org>
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+---
+ ssl/d1_srtp.c | 93 ++++++++++++++++++++---------------------------------------
+ ssl/t1_lib.c  |  9 +++---
+ 2 files changed, 36 insertions(+), 66 deletions(-)
+
+diff --git a/ssl/d1_srtp.c b/ssl/d1_srtp.c
+index ab9c419..535539b 100644
+--- a/ssl/d1_srtp.c
++++ b/ssl/d1_srtp.c
+@@ -168,25 +168,6 @@ static int find_profile_by_name(char *profile_name,
+ 	return 1;
+ 	}
+ 
+-static int find_profile_by_num(unsigned profile_num,
+-			       SRTP_PROTECTION_PROFILE **pptr)
+-	{
+-	SRTP_PROTECTION_PROFILE *p;
+-
+-	p=srtp_known_profiles;
+-	while(p->name)
+-		{
+-		if(p->id == profile_num)
+-			{
+-			*pptr=p;
+-			return 0;
+-			}
+-		p++;
+-		}
+-
+-	return 1;
+-	}
+-
+ static int ssl_ctx_make_profiles(const char *profiles_string,STACK_OF(SRTP_PROTECTION_PROFILE) **out)
+ 	{
+ 	STACK_OF(SRTP_PROTECTION_PROFILE) *profiles;
+@@ -209,11 +190,19 @@ static int ssl_ctx_make_profiles(const char *profiles_string,STACK_OF(SRTP_PROTE
+ 		if(!find_profile_by_name(ptr,&p,
+ 					 col ? col-ptr : (int)strlen(ptr)))
+ 			{
++			if (sk_SRTP_PROTECTION_PROFILE_find(profiles,p) >= 0)
++				{
++				SSLerr(SSL_F_SSL_CTX_MAKE_PROFILES,SSL_R_BAD_SRTP_PROTECTION_PROFILE_LIST);
++				sk_SRTP_PROTECTION_PROFILE_free(profiles);
++				return 1;
++				}
++
+ 			sk_SRTP_PROTECTION_PROFILE_push(profiles,p);
+ 			}
+ 		else
+ 			{
+ 			SSLerr(SSL_F_SSL_CTX_MAKE_PROFILES,SSL_R_SRTP_UNKNOWN_PROTECTION_PROFILE);
++			sk_SRTP_PROTECTION_PROFILE_free(profiles);
+ 			return 1;
+ 			}
+ 
+@@ -305,13 +294,12 @@ int ssl_add_clienthello_use_srtp_ext(SSL *s, unsigned char *p, int *len, int max
+ 
+ int ssl_parse_clienthello_use_srtp_ext(SSL *s, unsigned char *d, int len,int *al)
+ 	{
+-	SRTP_PROTECTION_PROFILE *cprof,*sprof;
+-	STACK_OF(SRTP_PROTECTION_PROFILE) *clnt=0,*srvr;
++	SRTP_PROTECTION_PROFILE *sprof;
++	STACK_OF(SRTP_PROTECTION_PROFILE) *srvr;
+         int ct;
+         int mki_len;
+-	int i,j;
+-	int id;
+-	int ret;
++	int i, srtp_pref;
++	unsigned int id;
+ 
+          /* Length value + the MKI length */
+         if(len < 3)
+@@ -341,22 +329,32 @@ int ssl_parse_clienthello_use_srtp_ext(SSL *s, unsigned char *d, int len,int *al
+ 		return 1;
+ 		}
+ 
++	srvr=SSL_get_srtp_profiles(s);
++	s->srtp_profile = NULL;
++	/* Search all profiles for a match initially */
++	srtp_pref = sk_SRTP_PROTECTION_PROFILE_num(srvr);
+         
+-	clnt=sk_SRTP_PROTECTION_PROFILE_new_null();
+-
+ 	while(ct)
+ 		{
+ 		n2s(d,id);
+ 		ct-=2;
+                 len-=2;
+ 
+-		if(!find_profile_by_num(id,&cprof))
++		/*
++		 * Only look for match in profiles of higher preference than
++		 * current match.
++		 * If no profiles have been have been configured then this
++		 * does nothing.
++		 */
++		for (i = 0; i < srtp_pref; i++)
+ 			{
+-			sk_SRTP_PROTECTION_PROFILE_push(clnt,cprof);
+-			}
+-		else
+-			{
+-			; /* Ignore */
++			sprof = sk_SRTP_PROTECTION_PROFILE_value(srvr, i);
++			if (sprof->id == id)
++				{
++				s->srtp_profile = sprof;
++				srtp_pref = i;
++				break;
++				}
+ 			}
+ 		}
+ 
+@@ -371,36 +369,7 @@ int ssl_parse_clienthello_use_srtp_ext(SSL *s, unsigned char *d, int len,int *al
+ 		return 1;
+ 		}
+ 
+-	srvr=SSL_get_srtp_profiles(s);
+-
+-	/* Pick our most preferred profile. If no profiles have been
+-	 configured then the outer loop doesn't run 
+-	 (sk_SRTP_PROTECTION_PROFILE_num() = -1)
+-	 and so we just return without doing anything */
+-	for(i=0;i<sk_SRTP_PROTECTION_PROFILE_num(srvr);i++)
+-		{
+-		sprof=sk_SRTP_PROTECTION_PROFILE_value(srvr,i);
+-
+-		for(j=0;j<sk_SRTP_PROTECTION_PROFILE_num(clnt);j++)
+-			{
+-			cprof=sk_SRTP_PROTECTION_PROFILE_value(clnt,j);
+-            
+-			if(cprof->id==sprof->id)
+-				{
+-				s->srtp_profile=sprof;
+-				*al=0;
+-				ret=0;
+-				goto done;
+-				}
+-			}
+-		}
+-
+-	ret=0;
+-    
+-done:
+-	if(clnt) sk_SRTP_PROTECTION_PROFILE_free(clnt);
+-
+-	return ret;
++	return 0;
+ 	}
+ 
+ int ssl_add_serverhello_use_srtp_ext(SSL *s, unsigned char *p, int *len, int maxlen)
+diff --git a/ssl/t1_lib.c b/ssl/t1_lib.c
+index 022a4fb..12ee3c9 100644
+--- a/ssl/t1_lib.c
++++ b/ssl/t1_lib.c
+@@ -643,7 +643,7 @@ unsigned char *ssl_add_clienthello_tlsext(SSL *s, unsigned char *buf, unsigned c
+ #endif
+ 
+ #ifndef OPENSSL_NO_SRTP
+-        if(SSL_get_srtp_profiles(s))
++	if(SSL_IS_DTLS(s) && SSL_get_srtp_profiles(s))
+                 {
+                 int el;
+ 
+@@ -806,7 +806,7 @@ unsigned char *ssl_add_serverhello_tlsext(SSL *s, unsigned char *buf, unsigned c
+ #endif
+ 
+ #ifndef OPENSSL_NO_SRTP
+-        if(s->srtp_profile)
++	if(SSL_IS_DTLS(s) && s->srtp_profile)
+                 {
+                 int el;
+ 
+@@ -1444,7 +1444,8 @@ int ssl_parse_clienthello_tlsext(SSL *s, unsigned char **p, unsigned char *d, in
+ 
+ 		/* session ticket processed earlier */
+ #ifndef OPENSSL_NO_SRTP
+-		else if (type == TLSEXT_TYPE_use_srtp)
++		else if (SSL_IS_DTLS(s) && SSL_get_srtp_profiles(s)
++			 && type == TLSEXT_TYPE_use_srtp)
+ 			{
+ 			if(ssl_parse_clienthello_use_srtp_ext(s, data, size,
+ 							      al))
+@@ -1698,7 +1699,7 @@ int ssl_parse_serverhello_tlsext(SSL *s, unsigned char **p, unsigned char *d, in
+ 			}
+ #endif
+ #ifndef OPENSSL_NO_SRTP
+-		else if (type == TLSEXT_TYPE_use_srtp)
++		else if (SSL_IS_DTLS(s) && type == TLSEXT_TYPE_use_srtp)
+ 			{
+                         if(ssl_parse_serverhello_use_srtp_ext(s, data, size,
+ 							      al))
+-- 
+1.9.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.1g.bb b/meta/recipes-connectivity/openssl/openssl_1.0.1g.bb
index 5172d52..cc16875 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.1g.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.1g.bb
@@ -41,6 +41,7 @@ SRC_URI += "file://configure-targets.patch \
             file://openssl-1.0.1e-cve-2014-3470.patch \
             file://openssl-CVE-2010-5298.patch \
             file://openssl-CVE-2014-3566.patch \
+            file://openssl-CVE-2014-3513.patch \
            "
 
 SRC_URI[md5sum] = "de62b43dfcd858e66a74bee1c834e959"
-- 
1.9.1


