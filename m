Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web12.12878.1614955717291514665
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Mar 2021 06:48:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=KM7t1jVY;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id t29so2175998pfg.11
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Mar 2021 06:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=e3VjI8dvaE4FAtbhkTVlNjb7uzV75SeFluxDKb3vURU=;
        b=KM7t1jVYK7fSjL4Fw/FGDhyhhcHgEbuYNaJFT8DLf93494VetrqsYCFibFNjQOb6+J
         Fqhd7Vr6xcrQX2xLILT8ZF22SDbASu9ESLZlTqAyqwGVB9v8OSUd5fp6M3ibywW7JPdj
         1COqMePM5pLVfckjjYOPWYgAzPtRPf9rtnfuGZOOXuVjaqoIzFv95fbR7q+HQnAHkrlS
         eGl6VyfUMHYLcFQqfCuyroVDN7WlIu73nhTazPqZFrFIlXPzTbA2tq6SIFGs41xqmp3B
         y2PR3iaBVR8DDRn9xuzFj0OAqjpSR0TDZyF/NrR2GCretTwWnZDRe2/4eNLZYGE5h/H4
         laZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e3VjI8dvaE4FAtbhkTVlNjb7uzV75SeFluxDKb3vURU=;
        b=ZGTbKaNuRZnhc0Mi1M4nlYVl7P4+YRK+3GLmTVc2EpDlFWNVf2Q2Yx20j7HAyBTb02
         lpEKhmWs/DnrFS+Fa1kxJFn8GCf7mLcP58utKmdk61aPxX2KzQ4yQh5/FdVl7nAAiAJX
         9oDky96AN/SZDPxPXntLWv7BYn9y/0mtBiXaDEgF8s9A2GyI7ifIeNVgMxliJnR7aK1w
         hbhgO4aW16FFaxmbX8IJPJXFLcvg7ByX9s1WYmqCnKW9xIZ1Y9TJ80pB/1qQCf33gfZv
         oewvvyBgrP4F02qfF4jn5KieZpmIM5G3B+N7qclZWdx/Zf7lneXZOquUllklfijAj82a
         bnIQ==
X-Gm-Message-State: AOAM531InaFdkaCW6hkn+louvyJS4nYkLRoNDmtPXbGpVIo9VBll7xDT
	FlBZ9rZuuqAJStBQtUr2SzcpTPlgT7cerkmw
X-Google-Smtp-Source: ABdhPJwQxqpFVSKNE70jx09Ju7Y0Z5b3MAo6GTB+YYqtmLPM3afeoHNXdOC37nB5BPWZJNYXyVIoBw==
X-Received: by 2002:a63:2214:: with SMTP id i20mr8679866pgi.189.1614955716296;
        Fri, 05 Mar 2021 06:48:36 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id c72sm2659261pfb.165.2021.03.05.06.48.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 06:48:35 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 18/27] report-error.bbclass: Add layer and bitbake version info to error report
Date: Fri,  5 Mar 2021 04:46:27 -1000
Message-Id: <b6d941126e92e26ae26cc4550c6849829eb88af9.1614955420.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614955420.git.steve@sakoman.com>
References: <cover.1614955420.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Milan Shah <mshah@mvista.com>

Instead of just providing local.conf info, add layer names and their
revisions with bitbake version information into error report
makes it easier to understand and reproduce failed build.

[YOCTO #9700]

Signed-off-by: Milan Shah <mshah@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a5afd7b1857c0012ab6e3d8bbafa67a96ff9e9e0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/report-error.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-error.bbclass
index 1a12db1206..9cb6b0bd31 100644
--- a/meta/classes/report-error.bbclass
+++ b/meta/classes/report-error.bbclass
@@ -6,6 +6,8 @@
 #
 # Licensed under the MIT license, see COPYING.MIT for details
 
+inherit base
+
 ERR_REPORT_DIR ?= "${LOG_DIR}/error-report"
 
 def errorreport_getdata(e):
@@ -64,6 +66,8 @@ python errorreport_handler () {
             data['failures'] = []
             data['component'] = " ".join(e.getPkgs())
             data['branch_commit'] = str(base_detect_branch(e.data)) + ": " + str(base_detect_revision(e.data))
+            data['bitbake_version'] = e.data.getVar("BB_VERSION")
+            data['layer_version'] = get_layers_branch_rev(e.data)
             data['local_conf'] = get_conf_data(e, 'local.conf')
             data['auto_conf'] = get_conf_data(e, 'auto.conf')
             lock = bb.utils.lockfile(datafile + '.lock')
-- 
2.25.1

