Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.794.1589820562880499961
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2020 09:49:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=fqOkZvQD;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id u35so5091973pgk.6
        for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2020 09:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=AhJMEf1YKX6vdDcCJe3mrC7HZJlUBbo7k4xCWMDNgRA=;
        b=fqOkZvQDB65ux9ujAmlZ7dun6VnVLvd9z42dpWwvluxUlkOM9fREZ3gZ5Z1cSa0TBb
         V1DaBgPyG3g9kqBOqs7cqZ6w4uFbyn9JLU2EqeMx5xhwjTWvRMXVWzbiG8+71C1rQMiG
         S9NDvdAJ75WNyw17n8GK4p8ay4GxZw+I47H6+jQzVjPIW1n8CExkz2pcMdrLwjs5wyo2
         e/kwv1qh1+Z62qjbmfm86ctRAme2CKDs2Se7JxeckD3zN5EeT0OXHxMubDsP++bzYpT+
         RDbJpyO1uU8PDcyJ8GMHoqEVw6C+YDJFDbn4ARVjIA+8ECjGCx/Qu5DNj1BX6hhsJVnj
         aIsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=AhJMEf1YKX6vdDcCJe3mrC7HZJlUBbo7k4xCWMDNgRA=;
        b=qpQDTFcRhIIHx+KIwrN3O4v8DIagY/9QvvglLKXX6iTRHGgFkpYebtH11GptiZ1dFJ
         ApbeVpgtxXliAciryFPlc7iHpiYKIrxPK2P9y9ojnP6FDoQV1iNQpzKqfbio14Mn1oXB
         My41k6/bK32qX+ixTaoVvSBteQWyFTUqORs/wGff/f9y61VoHaqB0JITIrSk+tPS8cfr
         U6sz/N11NZu7Dlk5PpuRNk7VWMKQzYoNwdv8Zy2yBSA26AlzkylD6ivwa1+p2GI7Ubya
         KZhsXbseCZXhW0wrqg6Ab3xM0CSss1tp0n0tVF9p6VIPOs6nRW9MFbnspbD3n7CK8VMX
         1ZrA==
X-Gm-Message-State: AOAM530XnhWlBWmzEIPlSa3QDhVaP5EuEEyozk1XUUUYELlFbycvAuL9
	HkUz9CDtavvTjr7lL7bni6fLCLVCpO0dUg==
X-Google-Smtp-Source: ABdhPJxR5amoEe8i8aRilP3ctFu7wNuOuMQjKv5XEeLm388x0xfO4xLn/NsGQqememOpW+Wj6l079w==
X-Received: by 2002:a65:6703:: with SMTP id u3mr15428761pgf.179.1589820562036;
        Mon, 18 May 2020 09:49:22 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id g6sm62869pjx.48.2020.05.18.09.49.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 09:49:21 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/19] sstate.bbclass: Do not fail if files cannot be touched
Date: Mon, 18 May 2020 06:48:27 -1000
Message-Id: <f528d6ffc9649536d21d625f65b415bfec7db258.1589820011.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589820010.git.steve@sakoman.com>
References: <cover.1589820010.git.steve@sakoman.com>

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

It may be that a file is not allowed to be touched, e.g., if it is a
symbolic link into a global sstate cache served over NFS.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/sstate.bbclass | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index c73c3b42a7..aa9c30b4e1 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -690,7 +690,10 @@ def sstate_package(ss, d):
     if not os.path.exists(siginfo):
         bb.siggen.dump_this_task(siginfo, d)
     else:
-        os.utime(siginfo, None)
+        try:
+            os.utime(siginfo, None)
+        except PermissionError:
+            pass
 
     return
 
@@ -776,7 +779,7 @@ sstate_task_postfunc[dirs] = "${WORKDIR}"
 sstate_create_package () {
 	# Exit early if it already exists
 	if [ -e ${SSTATE_PKG} ]; then
-		touch ${SSTATE_PKG}
+		[ ! -w ${SSTATE_PKG} ] || touch ${SSTATE_PKG}
 		return
 	fi
 
@@ -810,7 +813,7 @@ sstate_create_package () {
 	else
 		rm $TFILE
 	fi
-	touch ${SSTATE_PKG}
+	[ ! -w ${SSTATE_PKG} ] || touch ${SSTATE_PKG}
 }
 
 python sstate_sign_package () {
@@ -1122,7 +1125,11 @@ python sstate_eventhandler() {
         if not os.path.exists(siginfo):
             bb.siggen.dump_this_task(siginfo, d)
         else:
-            os.utime(siginfo, None)
+            try:
+                os.utime(siginfo, None)
+            except PermissionError:
+                pass
+
 }
 
 SSTATE_PRUNE_OBSOLETEWORKDIR ?= "1"
-- 
2.17.1

