Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 776F1CD5BD2
	for <webhook@archiver.kernel.org>; Tue, 26 May 2026 10:19:07 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32558.1779783143585701053
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2026 01:12:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Yhu41YPt;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: mehmet.fide@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-393c40246afso115297551fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 01:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779783141; x=1780387941; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FWq7cLOLGFigAXOhf3OsuEXvXehhZpgYszTPZForeIo=;
        b=Yhu41YPtII/yUFWbXeuDbKHq6N41csWcESeSpc/FihCcvarnOqixftM7s6uRj08dOz
         AZP2cDGot5Wz7TTBJzmGzGC7rYFzR7w7F71jD0jrBHl/LvNVOFLIY3y7N523WuBIIoqI
         C/19m0uywtt2GjmGcfx6dkf7j2fWTY+HiKv16Pz6sMgaFybl+cb/FzBg1t59FeIXOfyE
         snWu9OokefgALhupkKJ74L+D/YPG299q8GJNJaF102cGq4go9VCk0u3DTpG52iqikAhd
         01wN+OP+Fhz1s5nd3/+pKxjpIF/xNqya+xAkdDy1BDTZj2J6X1+vrgIKd6xDCqh9Fdd0
         3eJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779783141; x=1780387941;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FWq7cLOLGFigAXOhf3OsuEXvXehhZpgYszTPZForeIo=;
        b=rrliVxe7Gu3KL3qYZ7cLeHky/WQ2+gGNrLG1vZH1VoVC9SX60j4BKFHkiFT5m7QnTE
         dznMC49Md+IFQlKKUOPR4fbzHOHBAoKGFlN2w18ZqWRO1kmZEsPmD6V//OuDwqcMyCyL
         z00hcfNf6jLfLKPzX+iIE5dybyMCjrN+40CcFyzzXHEqzfqhokgGG3MYC/3ZOQHrYCAo
         MueK6pButUqGpAPQl1Qe2XTN8T/49bpmt9a5w+TF1O9xdV4WNMU5Vfohpe5CvTMQJec2
         XnSu/S5g2fwXEymDbK5Tqfy6Gi6X6kHT5zplOGd8C0LPv1Ipm8yAms7I8FGyvfqrf+zd
         Hn0w==
X-Gm-Message-State: AOJu0YyLsw7UgkX2h2hmAKVhJXPLz+bxUhXiA39CPdq6RmwGW/BXznVx
	DSiq30CKyZMKMvCWqYy4aQ5joo/ElgOsCF2JxbGX9L9tW+2yUIoI5Vpt4QriFSaf81o=
X-Gm-Gg: Acq92OERlmPBu/JxKbH0ZUmMg2yPSpaIbbEQogJENr0/rHm3mUDteQAEKsW6oD8S2cm
	cruqJSun6Q/35uquEYgfdzsOy518MjI7vZ2jnAQut8L5RsBoYtMdphQ8zAGYO115EpKCbeqG94F
	GS6eXc8A6UtDYGA9okiC7IcoKN6nBPfO+qYwDw3t7A1TzCbZUf/CSZysO/hiSaFsXwx8UmGVvUh
	pOhYyEXdOjsIsoRcgNjJnqMeWUc/BXeHyl4/cIRyyC4mewH+0lF1EZmkY1/GGIewk6QhzSVJmk+
	JiZ2jES+VOnYttcSMb0tvtwxHiDZ9DzKalyhPZArN0wQbVKg1CH5kzAWV9lqMcTKtqxuqUrMWtv
	DpUXC9TSgNysh5UOui8s4wuz2YrYT+qfgh4I0CjEGxC0Ts/+QHNBUHkqKl+tiQkeHFpy23n9lPG
	h/TZq9OkfNE/jiV41TCSFXr6QysGR9GA==
X-Received: by 2002:a05:600c:628f:b0:490:5057:f602 with SMTP id 5b1f17b1804b1-49050580d79mr230470115e9.17.1779782755547;
        Tue, 26 May 2026 01:05:55 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904526ca50sm283974465e9.2.2026.05.26.01.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 01:05:54 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
	Steve Sakoman <steve@sakoman.com>,
	Peter Marko <peter.marko@siemens.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][PATCH][walnascar] cve-update-nvd2-native: re-introduce CVE_SOCKET_TIMEOUT to bound urlopen()
Date: Tue, 26 May 2026 10:05:53 +0200
Message-ID: <20260526080554.674948-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 10:19:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237595

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The fetch task calls urllib.request.urlopen() with no timeout argument, so
when an NVD endpoint accepts the TCP connection but stops sending data,
the call blocks forever and the existing retry loop driven by
CVE_DB_UPDATE_ATTEMPTS never gets a chance to run. We observed worker
processes wedged for over an hour on a single recv() syscall before the
build was killed manually.

Re-introduce the CVE_SOCKET_TIMEOUT variable (removed in commit
d6d94eed1e "cve-update-nvd2-native: remove unused variable
CVE_SOCKET_TIMEOUT" as it was a leftover from the JSON 1.1 feed) and
plumb it through update_db_file() and nvd_request_next() so it is
actually honoured by urlopen(). The default of 60 seconds matches the
prior historical default; users behind slow proxies may raise it.

With the timeout in place, a stalled NVD endpoint produces a clean
exception, the retry loop runs, and after CVE_DB_UPDATE_ATTEMPTS
failures the task returns False and the build falls back to the
previously cached database (bb.warn, not a hard error).

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 32a14a932b..271679b7bd 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -34,6 +34,12 @@ CVE_DB_INCR_UPDATE_AGE_THRES ?= "10368000"
 # Number of attempts for each http query to nvd server before giving up
 CVE_DB_UPDATE_ATTEMPTS ?= "5"
 
+# Per-request socket timeout (seconds) for HTTP queries to the NVD server.
+# Without this, urllib uses the global default (None) and a stalled connection
+# can block the do_fetch task indefinitely, preventing the retry loop driven
+# by CVE_DB_UPDATE_ATTEMPTS from ever running.
+CVE_SOCKET_TIMEOUT ?= "60"
+
 CVE_CHECK_DB_DLDIR_FILE ?= "${DL_DIR}/CVE_CHECK2/${CVE_CHECK_DB_FILENAME}"
 CVE_CHECK_DB_DLDIR_LOCK ?= "${CVE_CHECK_DB_DLDIR_FILE}.lock"
 CVE_CHECK_DB_TEMP_FILE ?= "${CVE_CHECK_DB_FILE}.tmp"
@@ -134,7 +140,7 @@ def cleanup_db_download(db_file, db_tmp_file):
 def nvd_request_wait(attempt, min_wait):
     return min ( ( (2 * attempt) + min_wait ) , 30)
 
-def nvd_request_next(url, attempts, api_key, args, min_wait):
+def nvd_request_next(url, attempts, api_key, args, min_wait, timeout):
     """
     Request next part of the NVD database
     NVD API documentation: https://nvd.nist.gov/developers/vulnerabilities
@@ -153,7 +159,7 @@ def nvd_request_next(url, attempts, api_key, args, min_wait):
 
     for attempt in range(attempts):
         try:
-            r = urllib.request.urlopen(request)
+            r = urllib.request.urlopen(request, timeout=timeout)
 
             if (r.headers['content-encoding'] == 'gzip'):
                 buf = r.read()
@@ -216,6 +222,7 @@ def update_db_file(db_tmp_file, d, database_time):
         url = d.getVar("NVDCVE_URL")
         api_key = d.getVar("NVDCVE_API_KEY") or None
         attempts = int(d.getVar("CVE_DB_UPDATE_ATTEMPTS"))
+        timeout = int(d.getVar("CVE_SOCKET_TIMEOUT"))
 
         # Recommended by NVD
         wait_time = 6
@@ -224,7 +231,7 @@ def update_db_file(db_tmp_file, d, database_time):
 
         while True:
             req_args['startIndex'] = index
-            raw_data = nvd_request_next(url, attempts, api_key, req_args, wait_time)
+            raw_data = nvd_request_next(url, attempts, api_key, req_args, wait_time, timeout)
             if raw_data is None:
                 # We haven't managed to download data
                 return False
-- 
2.54.0


