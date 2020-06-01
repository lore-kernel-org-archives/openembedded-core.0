Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web12.38000.1591020719037569772
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2020 07:11:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=hPZraVUD;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id nu7so5200689pjb.0
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2020 07:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=+hto8DeAw9uyZ+5f+7hufZ1I5CO0fIfqK8aGUPviJBI=;
        b=hPZraVUDdG9y5vMiP9u+qf5Sh20bLFpFGEnEwWZk0VQKGjsgogyMBxQyFd2MkQlB93
         gP2I1oJTuClvwcm4UBiFKEzVFO7ZfITdEsU9ijOYvtswz2hjPG6TgEqj8puf5NqB9nS7
         8dWaGT7OCiXYEF33nreiaRr83uO8BJk706/ateiO0RsU0VIy7thysqctEv4xq2f+6NFH
         YczjQJ4MmiSrRrBhSYIXJrzzNvagVbX1g0lqklk0opjRFGg+i/fE2EbkDuT/U7VJlg+y
         RJkzTnCgOGRCLHEvLCNe4acmPgNjEhcwyjah+wLnL3rfr2ilX+yQFWPlRGtNuiAM6Xpy
         No+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=+hto8DeAw9uyZ+5f+7hufZ1I5CO0fIfqK8aGUPviJBI=;
        b=E8F7ncjLFoRolE4JGeOT9cKBqIrplq+nEinB5MvymYiBIClZsvLNKMXRlR98ucrqzu
         iBwHXZPJNPKLAHFixr9A/lhxOr11E92FbVe6A2Y5G2ReYg2mJtw0a21eEN1fJHCVwCrF
         9HwpGzNFQ6vAd/j6Gu0FjuNhlXH1aryXPBaPGJmHcC3cktgjxLzi4K161vNpFclFxJtR
         tUQylMaGHiujRYSJb6EuWGLGqi+j0gOaTPMht4y0RBErnAOD4KN1ueIpEpHxwbOESuT/
         5v0dslq/B+N5Y6lX8rEBfGmjSEvCErIzcZS5TDSmgxeZWznRFfeV79EcOIrD1G5D/D1u
         FiYQ==
X-Gm-Message-State: AOAM533ayOO8Ir2TQQ2rQiNyr0rFDqGoqp5Fpd0/nnhbuaMdZRZgiy8f
	e8DZwwFK1UfNlDHEkt2o8ipd/zJAx+0=
X-Google-Smtp-Source: ABdhPJyrMzmGhMdLJcM/UHkZMvZwngiMdt9M7AC15czETIZNADzkOe3hW9haUwiSkig9FWcQ17W45Q==
X-Received: by 2002:a17:90a:ee85:: with SMTP id i5mr22747477pjz.165.1591020717258;
        Mon, 01 Jun 2020 07:11:57 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u19sm5509859pfk.98.2020.06.01.07.11.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 07:11:56 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/16] archiver.bbclass: Fix duplicated SRC_URIs for do_ar_original
Date: Mon,  1 Jun 2020 04:11:13 -1000
Message-Id: <a7f50876f95a9be9fe045af1e4efddfe53a983f5.1591020366.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591020366.git.steve@sakoman.com>
References: <cover.1591020366.git.steve@sakoman.com>

From: Robert Yang <liezhi.yang@windriver.com>

The argument urls of bb.fetch2.Fetch(urls, d) are duplicated to SRC_URI, which caused errors like:

bb.data_smart.ExpansionError: Failure expanding variable SRCPV, expression was ${@bb.fetch2.get_srcrev(d)} which triggered exception FetchError: Fetcher failure: The SRCREV_FORMAT variable must be set when multiple SCMs are used.
The SCMs are:
git://github.com/docker/notary.git;destsuffix=git/src/github.com/docker/notary
git://github.com/docker/notary.git

The first one is from original SRC_URI, the second one is from the
variable 'urls', so cleanup SRC_URI before call bb.fetch2.Fetch() can fix the
problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b244c4f3427cd07376d4b8f7d27e38735bcc90e7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/archiver.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 43333a7551..780c562b68 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -193,7 +193,13 @@ python do_ar_original() {
                 del decoded[5][param]
         encoded = bb.fetch2.encodeurl(decoded)
         urls[i] = encoded
-    fetch = bb.fetch2.Fetch(urls, d)
+
+    # Cleanup SRC_URI before call bb.fetch2.Fetch() since now SRC_URI is in the
+    # variable "urls", otherwise there might be errors like:
+    # The SRCREV_FORMAT variable must be set when multiple SCMs are used
+    ld = bb.data.createCopy(d)
+    ld.setVar('SRC_URI', '')
+    fetch = bb.fetch2.Fetch(urls, ld)
     tarball_suffix = {}
     for url in fetch.urls:
         local = fetch.localpath(url).rstrip("/");
-- 
2.17.1

