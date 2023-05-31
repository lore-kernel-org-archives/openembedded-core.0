Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76CCBC7EE31
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 02:34:39 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.4687.1685500477331477877
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 19:34:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=t4bjh1do;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2566ed9328eso2908839a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 19:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685500476; x=1688092476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ezYNjg80I9qagsTJIoQO+tPsi0XBWPcpE8QOfsN43xU=;
        b=t4bjh1domquXSiKsoYOU+yHMeGy/9x2KB3YHz4gZozgRKCNUTHp/dtOgEubuK0MT/g
         HCASfsOIieX4NrvBu7eZzxX0waJ7J8rsR3lDcRBeT/fpjmgB9PlSzpWN3HcUg6B2mSDG
         G8NQmILBWFEDmBmNxPreISHFIfgBYzi1q6ClBzEeu/uuxM2gyp+vpu0FaQyxoCxY5Y6j
         LzYRTjjjLOtapgTcUWaMCjwAbM5AM4Qx0N2VcXeqcfxCUe1pPnKD4Gz91paDJEusncrU
         BHX3s5pGL4+Y+21pFw0qkMEgnp4LZY2pXkda4eK2gM0w/eEp4YjOoWq2KJCPTsDbiJan
         sXqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685500476; x=1688092476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ezYNjg80I9qagsTJIoQO+tPsi0XBWPcpE8QOfsN43xU=;
        b=PmTQwUq28hvohYSbnOPswepFM6J0/76qTOKczEWXdxg0QLNhfkD38Ea9qbmtBJ7k5h
         WNC/EaAln1TizYy726FORMx7DrBR/wpdPz8ZBFJWhGZ0f8ji1ZBKzncXJ2YpIJ2nN/G2
         S/n4HXSPuEnGJ5akgI0vu79n8dT3BUC0Ci9ClK2m5tYaw4jeXkOVE2Ud/Q3kYipsqYV2
         rgcUljf3gd1CKj7H1tyZ9pJHQOh5iHyGcin6G+o3zXTxgUwlzB6aHDy2Vji1i3Jo+rYO
         uaZmvgCl/11keGU9eJ1Atejr4Un2BFTuU3RO6OMnrYRaGvbc4nT3q/W6sWqSJrVglvnL
         xllg==
X-Gm-Message-State: AC+VfDxBtsHyB79CFJAbrGZc3DxSY0QHbnHN3GeceRn7l25etUuaICAH
	c6/gRvC0fjEcdejRhegMdwFxEGe4hGonIX3QnL4=
X-Google-Smtp-Source: ACHHUZ6abowSp1PFu7VmrJ4P/Z0I6fT2PkVMvLmcEV6diKvLWtMKSRG0BOljb4vJ5lPEDHH75asbCg==
X-Received: by 2002:a17:90b:3b8e:b0:256:51e6:3ac2 with SMTP id pc14-20020a17090b3b8e00b0025651e63ac2mr4339419pjb.12.1685500475883;
        Tue, 30 May 2023 19:34:35 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k91-20020a17090a3ee400b0023a9564763bsm92877pjc.29.2023.05.30.19.34.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 19:34:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/13] curl: Fix CVE-2023-28322
Date: Tue, 30 May 2023 16:34:11 -1000
Message-Id: <9ef793eca87ac568d9c22067aa854a50837cf92f.1685500244.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685500244.git.steve@sakoman.com>
References: <cover.1685500244.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 02:34:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181973

From: Bhabu Bindu <bhabu.bindu@kpit.com>

Add patches to fix CVE-2023-28322

more POST-after-PUT confusion

When doing HTTP(S) transfers, libcurl might erroneously use the read
callback (`CURLOPT_READFUNCTION`) to ask for data to send, even when
the `CURLOPT_POSTFIELDS` option has been set, if the same handle
previously was used to issue a `PUT` request which used that callback.

This flaw may surprise the application and cause it to misbehave and
either send off the wrong data or use memory after free or similar in
the second transfer.The problem exists in the logic for a reused
handle when it is (expected tobe) changed from a PUT to a POST.

CVE-2023-28322-1.patch is a supporting patch to resolve hunk
error in the actual patch file : CVE-2023-28322-2.patch

Link: https://curl.se/docs/CVE-2023-28322.html

Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../curl/curl/CVE-2023-28322-1.patch          |  84 ++++
 .../curl/curl/CVE-2023-28322-2.patch          | 436 ++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |   2 +
 3 files changed, 522 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-28322-1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-28322-2.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-28322-1.patch b/meta/recipes-support/curl/curl/CVE-2023-28322-1.patch
new file mode 100644
index 0000000000..547127001d
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-28322-1.patch
@@ -0,0 +1,84 @@
+From efbf02111aa66bda9288506b7d5cc0226bf5453e Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Sun, 12 Feb 2023 13:24:08 +0100
+Subject: [PATCH] smb: return error on upload without size
+
+The protocol needs to know the size ahead of time, this is now a known
+restriction and not a bug.
+
+Also output a clearer error if the URL path does not contain proper
+share.
+
+Ref: #7896
+Closes #10484
+
+CVE: CVE-2023-28322
+Upstream-Status: Backport [https://github.com/curl/curl/commit/efbf02111aa66bda9288506b7d5cc0226bf5453e]
+Comments: Hunks refreshed
+Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
+---
+ docs/KNOWN_BUGS    | 5 -----
+ docs/URL-SYNTAX.md | 3 +++
+ lib/smb.c          | 6 ++++++
+ 3 files changed, 9 insertions(+), 5 deletions(-)
+
+diff --git a/docs/KNOWN_BUGS b/docs/KNOWN_BUGS
+index cbf5be352a279..a515e7a59bdfd 100644
+--- a/docs/KNOWN_BUGS
++++ b/docs/KNOWN_BUGS
+@@ -58,7 +58,6 @@
+  5.7 Visual Studio project gaps
+  5.8 configure finding libs in wrong directory
+  5.9 Utilize Requires.private directives in libcurl.pc
+- 5.10 curl hangs on SMB upload over stdin
+  5.11 configure --with-gssapi with Heimdal is ignored on macOS
+  5.12 flaky Windows CI builds
+
+@@ -332,10 +331,6 @@ problems may have been fixed or changed somewhat since this was written.
+ 
+  https://github.com/curl/curl/issues/864
+ 
+-5.10 curl hangs on SMB upload over stdin
+-
+- See https://github.com/curl/curl/issues/7896
+-
+ 5.11 configure --with-gssapi with Heimdal is ignored on macOS
+ 
+  ... unless you also pass --with-gssapi-libs
+diff --git a/docs/URL-SYNTAX.md b/docs/URL-SYNTAX.md
+index 691fcceacd66c..802bbdef96979 100644
+--- a/docs/URL-SYNTAX.md
++++ b/docs/URL-SYNTAX.md
+@@ -360,6 +360,9 @@ share and directory or the share to upload to and as such, may not be omitted.
+ If the user name is embedded in the URL then it must contain the domain name
+ and as such, the backslash must be URL encoded as %2f.
+ 
++When uploading to SMB, the size of the file needs to be known ahead of time,
++meaning that you can upload a file passed to curl over a pipe like stdin.
++
+ curl supports SMB version 1 (only)
+ 
+ ## SMTP
+diff --git a/lib/smb.c b/lib/smb.c
+index 8a76763c157ce..dc0abe784bcee 100644
+--- a/lib/smb.c
++++ b/lib/smb.c
+@@ -763,6 +763,11 @@ static CURLcode smb_request_state(struct Curl_easy *data, bool *done)
+   void *msg = NULL;
+   const struct smb_nt_create_response *smb_m;
+ 
++  if(data->set.upload && (data->state.infilesize < 0)) {
++    failf(data, "SMB upload needs to know the size up front");
++    return CURLE_SEND_ERROR;
++  }
++
+   /* Start the request */
+   if(req->state == SMB_REQUESTING) {
+     result = smb_send_tree_connect(data);
+@@ -993,6 +998,7 @@ static CURLcode smb_parse_url_path(struct Curl_easy *data,
+   /* The share must be present */
+   if(!slash) {
+     Curl_safefree(smbc->share);
++    failf(data, "missing share in URL path for SMB");
+     return CURLE_URL_MALFORMAT;
+   }
diff --git a/meta/recipes-support/curl/curl/CVE-2023-28322-2.patch b/meta/recipes-support/curl/curl/CVE-2023-28322-2.patch
new file mode 100644
index 0000000000..f2134dd1c3
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-28322-2.patch
@@ -0,0 +1,436 @@
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
+Upstream-Status: Backport [https://github.com/curl/curl/commit/7815647d6582c0a4900be2e1de]
+Comments: Hunks refreshed
+Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
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
+index 2679a2cdc1afe..406fb42ac0f44 100644
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
+index 51c5d07ce40ab..c751e8861a99b 100644
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
+index f50d7baf622f8..4ff68cc454cbc 100644
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
+@@ -4233,7 +4233,7 @@
+     ftpc->file = NULL; /* instead of point to a zero byte,
+                             we make it a NULL pointer */
+ 
+-  if(data->set.upload && !ftpc->file && (ftp->transfer == PPTRANSFER_BODY)) {
++  if(data->state.upload && !ftpc->file && (ftp->transfer == PPTRANSFER_BODY)) {
+     /* We need a file name when uploading. Return error! */
+     failf(data, "Uploading to a URL without a file name!");
+     free(rawPath);
+diff --git a/lib/http.c b/lib/http.c
+index 80e43f6f361e8..bffdd3468536d 100644
+--- a/lib/http.c
++++ b/lib/http.c
+@@ -2033,7 +2033,7 @@
+   Curl_HttpReq httpreq = data->state.httpreq;
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
+index c2f675d4b2618..1952e66a1efcd 100644
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
+index ea99d720ec4eb..ccd7264b00e74 100644
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
+index 38f5711e44191..0c3b9634d1192 100644
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
+@@ -625,7 +625,6 @@
+     }
+     else
+       data->set.method = HTTPREQ_GET;
+-    data->set.upload = FALSE;
+     break;
+ 
+   case CURLOPT_HTTPPOST:
+@@ -888,7 +887,6 @@ CURLcode Curl_vsetopt(struct Curl_easy *data, CURLoption option, va_list param)
+      */
+     if(va_arg(param, long)) {
+       data->set.method = HTTPREQ_GET;
+-      data->set.upload = FALSE; /* switch off upload */
+       data->set.opt_no_body = FALSE; /* this is implied */
+     }
+     break;
+diff --git a/lib/smb.c b/lib/smb.c
+index a1e444ee6b97e..d6822213529bc 100644
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
+index 7a030308d4689..c182cace742d7 100644
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
+index 164d3c723c5b9..8ed1b887b4d21 100644
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
+index e9ab8fbf09510..cb69f3365855a 100644
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
+@@ -1767,7 +1767,6 @@
+          data->state.httpreq != HTTPREQ_POST_MIME) ||
+         !(data->set.keep_post & CURL_REDIR_POST_303))) {
+       data->state.httpreq = HTTPREQ_GET;
+-      data->set.upload = false;
+       infof(data, "Switch to %s",
+             data->set.opt_no_body?"HEAD":"GET");
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
+index cca992a0295aa..a8580bdb66fe8 100644
+--- a/lib/urldata.h
++++ b/lib/urldata.h
+@@ -1487,6 +1487,7 @@
+   BIT(url_alloc);   /* URL string is malloc()'ed */
+   BIT(referer_alloc); /* referer string is malloc()ed */
+   BIT(wildcard_resolve); /* Set to true if any resolve change is a wildcard */
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
+index b31f741ba9492..d60edaa303642 100644
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
+index f1154dc47a74e..f2e5352d1fd3a 100644
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
+index 17d59ecd23bc8..2ca91b7363b1d 100644
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
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index 3241867d7e..96280b31b2 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -48,6 +48,8 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2023-28319.patch \
            file://CVE-2023-28320.patch \
            file://CVE-2023-28321.patch \
+           file://CVE-2023-28322-1.patch \
+           file://CVE-2023-28322-2.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 
-- 
2.34.1


