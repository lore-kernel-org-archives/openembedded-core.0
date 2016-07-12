Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4EE44606D0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 09:42:52 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id f65so94083672wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 02:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=yO/9b+Wial1yCpKnzvgiV/FEZ9kTq62NACGzgz/uyhw=;
	b=LouYs3qTjpsK0e4F6MOghSMz6HjxjJnnYcyYmAPlrhlVdBXUzNrtjHBjuaoiB+vScL
	1QzTMv2trF7/hUaMWQ4DY4c44EZJCJ4xT30w3jm81k5JcqVHXG/aqPiHy26pK0fjGzL4
	zINvaL076ua0cXQYp1knORExpM3RU5jk9NpDFU7igv7IBe8KZSy+MoenDiLVC6LhPeTp
	czrYwjxwzpdz5nUiyMNTAwu9Tz1nIu5fBDGs1pCTswfU7b6dv+DJDN5D2mr2jcDC7zTE
	WvBj4D+rDugnJmXAlYhEpQL8n2fhdhYKV9Ved2HetThK3ydcXPSOl7jwSW0jaN6MQ6Lf
	4hKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=yO/9b+Wial1yCpKnzvgiV/FEZ9kTq62NACGzgz/uyhw=;
	b=QqJkts8VT64+tf6nhe5YiqcBenJbEzqHtTxwmXXdoCG52zRZZ7ya1N/VZ/VA6QwAyb
	E7Ae9/VOrFPbdu7r6xY9ZhgDEzmNUG45N61Wtyzt28NYRB07qoGRarO7TqciPZh2Yr5D
	ou1bkZq2qQ4mhJM+bNJVPMvEe5zIbJi7gnb5++FyH1WlGRjexb8bBWuo3cPU2w/HN6mu
	xCAwsIaxsc7FzukHPdOi9P1xN71FtlQc6/marFwLU/N0dbpFnrwoPtqp4uKqS2D5pS9F
	9SVJbuja0WGs2GMu/HPQJKRCTcBd+9U8kLh4ebSsNuRavwC9/cLtydk/J7PjY9/itXQS
	49cQ==
X-Gm-Message-State: ALyK8tJozPk8wUkjYfZH3mCafPrVd6bhOQrHsombieSM0FMUC1jy9r6wJSpiX5/Dc/14BKtX
X-Received: by 10.28.238.154 with SMTP id j26mr17651070wmi.94.1468316572684;
	Tue, 12 Jul 2016 02:42:52 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	b200sm2391677wmb.9.2016.07.12.02.42.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 12 Jul 2016 02:42:51 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jul 2016 10:42:50 +0100
Message-Id: <1468316570-26620-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] report-error: replace build paths with markers not whitespace
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
X-List-Received-Date: Tue, 12 Jul 2016 09:42:54 -0000

To remove potentially personal information and reduce irrelevant noise when
searching for similar reports the error reporting class removes ${TOPDIR} from
the logs.  Whilst this is valid intention, the replacement of ' ' results in
potentially confusing logs as it appears that builds are happening in /tmp, or
whitespace can appear in places where it isn't allowed which can look like a
bug.

Solve both of these by replacing the value of TOPDIR with the literal string
TOPDIR.

Also replace TMPDIR after TOPDIR, as it's not uncommon to have TMPDIR somewhere
other than directly under TOPDIR.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/report-error.bbclass | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-error.bbclass
index 5cbf8f0..c8c15bd 100644
--- a/meta/classes/report-error.bbclass
+++ b/meta/classes/report-error.bbclass
@@ -59,9 +59,11 @@ python errorreport_handler () {
                     logFile = codecs.open(log, 'r', 'utf-8')
                     logdata = logFile.read()
 
-                    topdir = e.data.getVar('TOPDIR', True)
-                    if topdir:
-                        logdata = logdata.replace(topdir, ' ')
+                    # Replace host-specific paths so the logs are cleaner
+                    for d in ("TOPDIR", "TMPDIR"):
+                        s = e.data.getVar(d, True)
+                        if s:
+                            logdata = logdata.replace(s, d)
 
                     logFile.close()
                 except:
-- 
2.8.1


