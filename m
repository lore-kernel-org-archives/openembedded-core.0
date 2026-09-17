Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02ADFC982E6
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:29 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1697.1789682899741120390
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=O6Bf/LIK;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso868255e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682898; x=1790287698; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1Q3F9P0wcq/ozNBj/QUbwUt6lFl1fsGLoLnDNYX0zv4=;
        b=O6Bf/LIKhxKiBGfY5Pe7Bl0HiPGFln4zESOprfKno0z7uxbwGKwX/oFQXKMPfhZwZj
         8kH8T1ra0rI650Pbfk1ClUe4x8y+LC41+hpZBNZrBqFIfV9DVFiuTBp9c6ztflZnYJVs
         ss8pUHfGmFSn4cfcUMVFF0rdnz4qV7VBVwTfw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682898; x=1790287698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1Q3F9P0wcq/ozNBj/QUbwUt6lFl1fsGLoLnDNYX0zv4=;
        b=N5kfftll4p+E6siFyewwYP0Vl8B/JCK7lnH6X6DEDNQLH+Zhir+PhLUzvBzuE5ZnoD
         Cq0xqI22mkPQaevOd8pkER6asyiMeKnwi/onPvZdrUHkJxEuEsvqQUj1sFkhHX24ymvY
         +5joXLrQD5Wr+4peDDl0nO0HUs0Nta4ljlohggpQ92nvWKGEQGeB6kIxkwUFNrw6mxGH
         6o2DT0ECkqFVWFOxkQPbbusXAZZq3vBkgFfoACpUUVgxODdHX4khT4PeDjsWEKoOp0qa
         6OynIvXjuqwuJWOFDZvvCr4dCaspndFDErEnttoNAhbqMpdcb/jfhmRC8fTiLPdWCw8c
         Uruw==
X-Gm-Message-State: AFuF++lI5+7NwpQtP/bbQYG34onVh47kfnn0XuT2t4Drm0p6W1Y0pVak
	vouE4i0a//VN+RuW71SmlFMwwW3A98cWHWKclliIN5YCLGCyxjOo6lIlB0fY/JE9EmGykF0PiaL
	OKdXPEDQ=
X-Gm-Gg: AYBFou2LfaiboyrWCYjbn7vuseEvvfnaKmn8oyXMxDX/c7UWt8CQbFZYRTVI5trnWIk
	+LVoIUBhBP6sr58vLpzIIFNsbRUdaCSDyd+KUTLimILv0CTttJOOYzlsI8ZyV53B0w5BZl+GYsl
	yVFA3lg04hocXTrJMBKojm1pFQARnKluH3qTftPc43QGqA/SozpFSM+euI1gnw4ljS7teQeSkTY
	6cH6nhpROQz42RJkdKD7LBEe3E0KJPyygSmUKArxk3gYpNP93ZQk6lxa4pN/GNsjleD8WQr2Vwi
	uP+wdwu49ZTiiREcj5B/WCB+iEqquLjrpKOknOlMyM2NXs9kR1tuXr3xzNkvXIEwELAv7Ndq/ys
	n40JWlZKOuKecSfry80IfBmUk55YegJAXUqCeRo9bR/nCigwU3qeBP5Znnv4KiTDgQ7VV/XyQC+
	OmFOP06O3pZsrZFOT2cbHSq9KaAOyhrJeoDSQyOCTNgoS65YAy/FvmBqk7TJ0hHG/rYPEdPR5Js
	+FAfDAjbR+AUo7SzdXuHMNjNLk+R9h4iu2Ab7rVfwgRgxN8RWiAO+IuNfcXMiZqnVvGnz79LmI=
X-Received: by 2002:a05:600c:3b8c:b0:49f:bd3c:bc16 with SMTP id 5b1f17b1804b1-49fc572f58fmr3849785e9.17.1789682898078;
        Thu, 17 Sep 2026 15:08:18 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:17 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 53/79] curl: patch CVE-2026-9080
Date: Fri, 18 Sep 2026 00:06:38 +0200
Message-ID: <3c1af6137fa043ad97c7092926006673793a4ca5.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246147

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://curl.se/docs/CVE-2026-9080.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2026-9080.patch             | 95 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
 2 files changed, 96 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-9080.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-9080.patch b/meta/recipes-support/curl/curl/CVE-2026-9080.patch
new file mode 100644
index 00000000000..b1cf613f8a5
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
index bed11141ea6..4f28b63a746 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -31,6 +31,7 @@ SRC_URI = " \
     file://CVE-2026-11586.patch \
     file://CVE-2026-7009.patch \
     file://CVE-2026-8925.patch \
+    file://CVE-2026-9080.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

