Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEBD1C4345F
	for <webhook@archiver.kernel.org>; Thu, 18 Apr 2024 08:05:11 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.7696.1713427505136177733
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Apr 2024 01:05:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MfVarsNy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3465921600dso456528f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Apr 2024 01:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1713427503; x=1714032303; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hf6AsvYnXAacu4Yha9Lrx0FiDLZsFqT5HX7yUbw+iVA=;
        b=MfVarsNy+xYTaqd7KwbYLhbcsuNvOpwxlvN3ktKCOKZ8CCAa6WLAttW/H1NjCwdP+a
         DE1/CGarOkhTucMK/6A1pOg4e+0ROh7oJi/8GLBEfXJTS8k9KGvzdeLPFayZUw9JEdPT
         nSsrqu1trx4aScG/R8PKtRXTuIYqlpaahJCmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713427503; x=1714032303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hf6AsvYnXAacu4Yha9Lrx0FiDLZsFqT5HX7yUbw+iVA=;
        b=FbBXPvvXFe63g6FoFOFqc+8/mwVJbIJAK7ZQc5dFM/FjHlh/XJd3xQGxzJiCNBJGGI
         kBTbhBQsRtCKnsV9UdIQxvDlcvleOHzQMA0acV0TM74kY9x08h9MpbV/UWLd4Yw7aHdS
         3DxKbs6FxdzshApvOcd59+tstTaiwcDb12QBlsTC8R4P9jKXn972/44twqL85CIx2T38
         rdb/OPH+ZLVHPM44diyzI8ZWVrxSargBaZgF7pP56w2xAkoY+yEYFEE60OwawxGaL37p
         dO5XCHS4dPNtIJNlly1SNAjE96epjCFWHRrExq/Xb1zQYEv5mx4sQ9Ap6twy2Jh4k6dG
         5o1A==
X-Gm-Message-State: AOJu0YyJBfk35i3nEvfKUIsgvmNNsSGsWDUU91HCforLKqj9Vp0ZuVH1
	gMairs0E5UphdDGUJfru2JYBUq/Ehjk/E6FfoeZ1TBUal0jcAFtA59l/pFgkVjKWzFxd0oaV14T
	jEvU=
X-Google-Smtp-Source: AGHT+IEA8ClBXbIZ9ZJqUvEi7GTuM3n/lmgqB04W3RvxNVJ96p8HtFZycpJtDCz2CIrg0vm5FgmPVw==
X-Received: by 2002:a5d:634d:0:b0:346:72f4:c805 with SMTP id b13-20020a5d634d000000b0034672f4c805mr1065018wrw.66.1713427502787;
        Thu, 18 Apr 2024 01:05:02 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3bc0:7b8b:7b80:40cd])
        by smtp.gmail.com with ESMTPSA id m7-20020adfe0c7000000b00349c54d6cefsm1177276wri.54.2024.04.18.01.05.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 01:05:02 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] git: Backport patch to fix with curl 8.7.0 onwards
Date: Thu, 18 Apr 2024 09:05:01 +0100
Message-Id: <20240418080501.3170793-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Apr 2024 08:05:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198504

bitbake-selftest was failing on a github url on hosts using buildtools.
The issue was tracked down to the curl upgrade 8.6.0 -> 8.7.1 and there
is a fix in upstream git we can backport to address it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...98a77463e9d24c19c8d9473fd2152d5840c4.patch | 195 ++++++++++++++++++
 meta/recipes-devtools/git/git_2.44.0.bb       |   1 +
 2 files changed, 196 insertions(+)
 create mode 100644 meta/recipes-devtools/git/git/eba498a77463e9d24c19c8d9473fd2152d5840c4.patch

diff --git a/meta/recipes-devtools/git/git/eba498a77463e9d24c19c8d9473fd2152d5840c4.patch b/meta/recipes-devtools/git/git/eba498a77463e9d24c19c8d9473fd2152d5840c4.patch
new file mode 100644
index 00000000000..cd04cef30df
--- /dev/null
+++ b/meta/recipes-devtools/git/git/eba498a77463e9d24c19c8d9473fd2152d5840c4.patch
@@ -0,0 +1,195 @@
+Backport a fix from upstream for curl 8.7 compatibility.
+
+Upstream-Status: Backport
+
+From 324231174247c70e66908b78924908fbfcebed19 Mon Sep 17 00:00:00 2001
+From: Jeff King <peff@peff.net>
+Date: Tue, 2 Apr 2024 16:05:17 -0400
+Subject: [PATCH 1/3] http: reset POSTFIELDSIZE when clearing curl handle
+
+In get_active_slot(), we return a CURL handle that may have been used
+before (reusing them is good because it lets curl reuse the same
+connection across many requests). We set a few curl options back to
+defaults that may have been modified by previous requests.
+
+We reset POSTFIELDS to NULL, but do not reset POSTFIELDSIZE (which
+defaults to "-1"). This usually doesn't matter because most POSTs will
+set both fields together anyway. But there is one exception: when
+handling a large request in remote-curl's post_rpc(), we don't set
+_either_, and instead set a READFUNCTION to stream data into libcurl.
+
+This can interact weirdly with a stale POSTFIELDSIZE setting, because
+curl will assume it should read only some set number of bytes from our
+READFUNCTION. However, it has worked in practice because we also
+manually set a "Transfer-Encoding: chunked" header, which libcurl uses
+as a clue to set the POSTFIELDSIZE to -1 itself.
+
+So everything works, but we're better off resetting the size manually
+for a few reasons:
+
+  - there was a regression in curl 8.7.0 where the chunked header
+    detection didn't kick in, causing any large HTTP requests made by
+    Git to fail. This has since been fixed (but not yet released). In
+    the issue, curl folks recommended setting it explicitly to -1:
+
+      https://github.com/curl/curl/issues/13229#issuecomment-2029826058
+
+    and it indeed works around the regression. So even though it won't
+    be strictly necessary after the fix there, this will help folks who
+    end up using the affected libcurl versions.
+
+  - it's consistent with what a new curl handle would look like. Since
+    get_active_slot() may or may not return a used handle, this reduces
+    the possibility of heisenbugs that only appear with certain request
+    patterns.
+
+Note that the recommendation in the curl issue is to actually drop the
+manual Transfer-Encoding header. Modern libcurl will add the header
+itself when streaming from a READFUNCTION. However, that code wasn't
+added until 802aa5ae2 (HTTP: use chunked Transfer-Encoding for HTTP_POST
+if size unknown, 2019-07-22), which is in curl 7.66.0. We claim to
+support back to 7.19.5, so those older versions still need the manual
+header.
+
+Signed-off-by: Jeff King <peff@peff.net>
+Signed-off-by: Junio C Hamano <gitster@pobox.com>
+---
+ http.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/http.c b/http.c
+index e73b136e5897bd..3d80bd6116e9e4 100644
+--- a/http.c
++++ b/http.c
+@@ -1452,6 +1452,7 @@ struct active_request_slot *get_active_slot(void)
+ 	curl_easy_setopt(slot->curl, CURLOPT_READFUNCTION, NULL);
+ 	curl_easy_setopt(slot->curl, CURLOPT_WRITEFUNCTION, NULL);
+ 	curl_easy_setopt(slot->curl, CURLOPT_POSTFIELDS, NULL);
++	curl_easy_setopt(slot->curl, CURLOPT_POSTFIELDSIZE, -1L);
+ 	curl_easy_setopt(slot->curl, CURLOPT_UPLOAD, 0);
+ 	curl_easy_setopt(slot->curl, CURLOPT_HTTPGET, 1);
+ 	curl_easy_setopt(slot->curl, CURLOPT_FAILONERROR, 1);
+
+From c28ee09503ffcb1f32cbb30dc57fa810cdac122c Mon Sep 17 00:00:00 2001
+From: Jeff King <peff@peff.net>
+Date: Tue, 2 Apr 2024 16:06:00 -0400
+Subject: [PATCH 2/3] INSTALL: bump libcurl version to 7.21.3
+
+Our documentation claims we support curl versions back to 7.19.5. But we
+can no longer compile with that version since adding an unconditional
+use of CURLOPT_RESOLVE in 511cfd3bff (http: add custom hostname to IP
+address resolutions, 2022-05-16). That feature wasn't added to libcurl
+until 7.21.3.
+
+We could add #ifdefs to make this work back to 7.19.5. But given that
+nobody noticed the compilation failure in the intervening two years, it
+makes more sense to bump the version in the documentation to 7.21.3
+(which is itself over 13 years old).
+
+We could perhaps go forward even more (which would let us drop some
+cruft from git-curl-compat.h), but this should be an obviously safe
+jump, and we can move forward later.
+
+Note that user-visible syntax for CURLOPT_RESOLVE has grown new features
+in subsequent curl versions. Our documentation mentions "+" and "-"
+entries, which require more recent versions than 7.21.3. We could
+perhaps clarify that in our docs, but it's probably not worth cluttering
+them with restrictions of ancient curl versions.
+
+Signed-off-by: Jeff King <peff@peff.net>
+Signed-off-by: Junio C Hamano <gitster@pobox.com>
+---
+ INSTALL | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/INSTALL b/INSTALL
+index c6fb240c91eb90..2a46d045928a11 100644
+--- a/INSTALL
++++ b/INSTALL
+@@ -139,7 +139,7 @@ Issues of note:
+ 	  not need that functionality, use NO_CURL to build without
+ 	  it.
+ 
+-	  Git requires version "7.19.5" or later of "libcurl" to build
++	  Git requires version "7.21.3" or later of "libcurl" to build
+ 	  without NO_CURL. This version requirement may be bumped in
+ 	  the future.
+ 
+
+From 92a209bf245c6497f3742b9df7a1463ddf067ea6 Mon Sep 17 00:00:00 2001
+From: Jeff King <peff@peff.net>
+Date: Fri, 5 Apr 2024 16:04:51 -0400
+Subject: [PATCH 3/3] remote-curl: add Transfer-Encoding header only for older
+ curl
+
+As of curl 7.66.0, we don't need to manually specify a "chunked"
+Transfer-Encoding header. Instead, modern curl deduces the need for it
+in a POST that has a POSTFIELDSIZE of -1 and uses READFUNCTION rather
+than POSTFIELDS.
+
+That version is recent enough that we can't just drop the header; we
+need to do so conditionally. Since it's only a single line, it seems
+like the simplest thing would just be to keep setting it unconditionally
+(after all, the #ifdefs are much longer than the actual code). But
+there's another wrinkle: HTTP/2.
+
+Curl may choose to use HTTP/2 under the hood if the server supports it.
+And in that protocol, we do not use the chunked encoding for streaming
+at all. Most versions of curl handle this just fine by recognizing and
+removing the header. But there's a regression in curl 8.7.0 and 8.7.1
+where it doesn't, and large requests over HTTP/2 are broken (which t5559
+notices). That regression has since been fixed upstream, but not yet
+released.
+
+Make the setting of this header conditional, which will let Git work
+even with those buggy curl versions. And as a bonus, it serves as a
+reminder that we can eventually clean up the code as we bump the
+supported curl versions.
+
+Signed-off-by: Jeff King <peff@peff.net>
+Signed-off-by: Junio C Hamano <gitster@pobox.com>
+---
+ git-curl-compat.h | 9 +++++++++
+ remote-curl.c     | 3 +++
+ 2 files changed, 12 insertions(+)
+
+diff --git a/git-curl-compat.h b/git-curl-compat.h
+index fd96b3cdffdb6c..e1d0bdd273501f 100644
+--- a/git-curl-compat.h
++++ b/git-curl-compat.h
+@@ -126,6 +126,15 @@
+ #define GIT_CURL_HAVE_CURLSSLSET_NO_BACKENDS
+ #endif
+ 
++/**
++ * Versions before curl 7.66.0 (September 2019) required manually setting the
++ * transfer-encoding for a streaming POST; after that this is handled
++ * automatically.
++ */
++#if LIBCURL_VERSION_NUM < 0x074200
++#define GIT_CURL_NEED_TRANSFER_ENCODING_HEADER
++#endif
++
+ /**
+  * CURLOPT_PROTOCOLS_STR and CURLOPT_REDIR_PROTOCOLS_STR were added in 7.85.0,
+  * released in August 2022.
+diff --git a/remote-curl.c b/remote-curl.c
+index 1161dc7fed6892..603c11ba667246 100644
+--- a/remote-curl.c
++++ b/remote-curl.c
+@@ -1,4 +1,5 @@
+ #include "git-compat-util.h"
++#include "git-curl-compat.h"
+ #include "config.h"
+ #include "environment.h"
+ #include "gettext.h"
+@@ -960,7 +961,9 @@ static int post_rpc(struct rpc_state *rpc, int stateless_connect, int flush_rece
+ 		/* The request body is large and the size cannot be predicted.
+ 		 * We must use chunked encoding to send it.
+ 		 */
++#ifdef GIT_CURL_NEED_TRANSFER_ENCODING_HEADER
+ 		headers = curl_slist_append(headers, "Transfer-Encoding: chunked");
++#endif
+ 		rpc->initial_buffer = 1;
+ 		curl_easy_setopt(slot->curl, CURLOPT_READFUNCTION, rpc_out);
+ 		curl_easy_setopt(slot->curl, CURLOPT_INFILE, rpc);
diff --git a/meta/recipes-devtools/git/git_2.44.0.bb b/meta/recipes-devtools/git/git_2.44.0.bb
index 90e555eba7c..3ae02f29387 100644
--- a/meta/recipes-devtools/git/git_2.44.0.bb
+++ b/meta/recipes-devtools/git/git_2.44.0.bb
@@ -10,6 +10,7 @@ PROVIDES:append:class-native = " git-replacement-native"
 
 SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
            file://fixsort.patch \
+           file://eba498a77463e9d24c19c8d9473fd2152d5840c4.patch \
            file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch \
            "
 
-- 
2.40.1


