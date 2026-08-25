Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5B06C61DB9
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 18:39:24 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29446.1787683151933547217
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 11:39:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=aUTosAlu;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20260825183914caac0ba8860002076d-oan3r2@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20260825183914caac0ba8860002076d
        for <openembedded-core@lists.openembedded.org>;
        Tue, 25 Aug 2026 20:39:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=wgb4hwgy0eZn5Sgw/OcDpPNmEy2sQhCIWNXWahzWT14=;
 b=aUTosAlunAwQ5+YftJPgtet8DfYTQDHcsYHoBeTIGVbpuc4jtjmsc15zXQ3Fg/NcYNqbI8
 pPV0XxIW5FA/r2lsyw6+Z17sNsOEpBKRJklAQaQZe2xbaLaMh7/tFmIkHU2Lt1fbO9dtjNKo
 459NXO+dxaSQg2hufClNu+mvsyhO2ul3JJ2TjnspJX4KYlTWgMkc81I/PRJpVU2XfI9awXkv
 0/RaW1+c9ZQ/lQ+8nESM7YaFoMosjwByx0l4Z0v5Bzd6V509VnzVszRQ1PM5AlXQEDgHEQ85
 albxMQqIGibnNNCUC+fwqiYLjn9GTFkXpnGff+oGCQnPFc9sxcz27mew==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH 3/5] curl: patch CVE-2026-9080
Date: Tue, 25 Aug 2026 20:38:51 +0200
Message-ID: <20260825183853.1017950-3-peter.marko@siemens.com>
In-Reply-To: <20260825183853.1017950-1-peter.marko@siemens.com>
References: <20260825183853.1017950-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 18:39:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244258

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://curl.se/docs/CVE-2026-9080.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../curl/curl/CVE-2026-9080.patch             | 95 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
 2 files changed, 96 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-9080.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-9080.patch b/meta/recipes-support/curl/curl/CVE-2026-9080.patch
new file mode 100644
index 0000000000..b1cf613f8a
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-9080.patch
@@ -0,0 +1,95 @@
+From 5ab34cba42e4ee4282fe8bab43f311d51b9bf9bd Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Tue, 26 May 2026 09:52:19 +0200
+Subject: [PATCH] multi: handle pause in multi socket callback
+
+The mev_sh_entry object might be removed if curl_easy_pause() is called
+from within the socket callback.
+
+Introduced a 'magic' struct field to to 'mev_sh_entry' to make it easier
+to programmatically detect/assert if the pointer is bad - in debug
+builds.
+
+Reported-by: Joshua Rogers
+Closes #21748
+
+CVE: CVE-2026-9080
+Upstream-Status: Backport [https://github.com/curl/curl/commit/5ab34cba42e4ee4282fe8bab43f311d51b9bf9bd]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/multi_ev.c | 23 ++++++++++++++++++++---
+ 1 file changed, 20 insertions(+), 3 deletions(-)
+
+diff --git a/lib/multi_ev.c b/lib/multi_ev.c
+index 478d5a48d5..7ea3b2827e 100644
+--- a/lib/multi_ev.c
++++ b/lib/multi_ev.c
+@@ -40,6 +40,8 @@ static void mev_in_callback(struct Curl_multi *multi, bool value)
+   multi->in_callback = value;
+ }
+ 
++#define SH_ENTRY_MAGIC 0x570091d
++
+ /* Information about a socket for which we inform the libcurl application
+  * what to supervise (CURL_POLL_IN/CURL_POLL_OUT/CURL_POLL_REMOVE)
+  */
+@@ -51,6 +53,9 @@ struct mev_sh_entry {
+                          * libcurl application to watch out for */
+   unsigned int readers; /* this many transfers want to read */
+   unsigned int writers; /* this many transfers want to write */
++#ifdef DEBUGBUILD
++  unsigned int magic;
++#endif
+   BIT(announced);       /* this socket has been passed to the socket
+                            callback at least once */
+ };
+@@ -75,6 +80,9 @@ static void mev_sh_entry_dtor(void *freethis)
+ {
+   struct mev_sh_entry *entry = (struct mev_sh_entry *)freethis;
+   Curl_uint32_spbset_destroy(&entry->xfers);
++#ifdef DEBUGBUILD
++  entry->magic = 0;
++#endif
+   curlx_free(entry);
+ }
+ 
+@@ -113,7 +121,9 @@ static struct mev_sh_entry *mev_sh_entry_add(struct Curl_hash *sh,
+     mev_sh_entry_dtor(check);
+     return NULL; /* major failure */
+   }
+-
++#ifdef DEBUGBUILD
++  check->magic = SH_ENTRY_MAGIC;
++#endif
+   return check; /* things are good in sockhash land */
+ }
+ 
+@@ -223,6 +233,7 @@ static CURLMcode mev_sh_entry_update(struct Curl_multi *multi,
+ 
+   /* we should only be called when the callback exists */
+   DEBUGASSERT(multi->socket_cb);
++  DEBUGASSERT(entry->magic == SH_ENTRY_MAGIC);
+   if(!multi->socket_cb)
+     return CURLM_OK;
+ 
+@@ -272,12 +283,18 @@ static CURLMcode mev_sh_entry_update(struct Curl_multi *multi,
+   rc = multi->socket_cb(data, s, comboaction, multi->socket_userp,
+                         entry->user_data);
+   mev_in_callback(multi, FALSE);
+-  entry->announced = TRUE;
+   if(rc == -1) {
+     multi->dead = TRUE;
+     return CURLM_ABORTED_BY_CALLBACK;
+   }
+-  entry->action = (unsigned int)comboaction;
++  /* curl_easy_pause() is documented as callable from any callback; it
++   * re-enters mev_assess() which may free this 'entry'. Re-fetch. */
++  entry = mev_sh_entry_get(&multi->ev.sh_entries, s);
++  if(entry) {
++    DEBUGASSERT(entry->magic == SH_ENTRY_MAGIC);
++    entry->announced = TRUE;
++    entry->action = (unsigned int)comboaction;
++  }
+   return CURLM_OK;
+ }
+ 
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 6ad1bfe55f..9de6b1c4dd 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -27,6 +27,7 @@ SRC_URI = " \
     file://CVE-2026-11586.patch \
     file://CVE-2026-7009.patch \
     file://CVE-2026-8925.patch \
+    file://CVE-2026-9080.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

