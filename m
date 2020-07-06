Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web12.61278.1594051916685830749
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2020 09:11:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=MHzJH6vl;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.196, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f196.google.com with SMTP id g67so17701927pgc.8
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2020 09:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=NiUm8Z2NmtaJ8AK0nIqBYQkCW0ecJBLEe9zIqYtUtDM=;
        b=MHzJH6vlHcSSY/hIj9dOYhuq7EStyLNY8I0uSaz4pm7mWMkUd4c3zK7VGjwKAfUrTx
         2m+cj/TGBqE0tbwSDuWKY9CdUdRXealon1jwOFTRAUIr8Le8LAfgIYhXl+kqPRH58ObO
         wRW4Sgxs9nmwcy3Y7VzM6PKjK4T8PsRk04PezNQldTBrRZrehnsMiTo1noYIn320xnII
         rNpS6nR1B2hg+E4V2oyf+Vyineo6giwuSElriy0G0N9cPbM90aa1ziEglpUyqlYEGdDL
         kvK1HGEpFnh+pYY82rVy9vuD7pjq3VSFQ+OFqtih2Cx0pC920aLKdQpAziI+m0hQe8sS
         Gsjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=NiUm8Z2NmtaJ8AK0nIqBYQkCW0ecJBLEe9zIqYtUtDM=;
        b=e4Zkv91dU2sWuDykgGMq8p9v3vjCzGGJqW4U8jk59JjiKyzJbZMd7GuInRSAS9Da6c
         48NHiL9+Jo6UO5KZeEFu0q8OOpAaUBZPKp5v5kNwe9wf1/A6HEU0PsWJ5kAXlrXx4pAs
         84ub9FIl6XEU2vghi2H8lqhuxGPnNycyft0lHMjhh5Fgf43MP/zyg6EvoiD6GB8mqhIM
         +MYf54P62Bra/824rh6qbYqUVHsuG7Dn+3/jlz/helJBl5J5iGI+I2Wj+DrhZqvdHK5b
         P7105Dy/eygAIOA6iwGY2TgTmk8bfINaZH5OGKvke7pxjvGcubbcpICiR9TtkkPaU0HJ
         DE4A==
X-Gm-Message-State: AOAM530HyBtDDJns2W+geS3QWpc9ffc39xjMZlKxJmd0DyBwKQPpcUrR
	hAEY6zqFoiETfE16w4c8IBehFtUYapx/lA==
X-Google-Smtp-Source: ABdhPJxiDuJuvvBbUM2bjuNbZWPU4dNmEmYjNY6U5JxNOMxHFV6k6W0nSEkoYlw9i3pFA+g9fun1og==
X-Received: by 2002:a63:6741:: with SMTP id b62mr40246829pgc.58.1594051915660;
        Mon, 06 Jul 2020 09:11:55 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i67sm18225811pfg.13.2020.07.06.09.11.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 09:11:55 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 21/25] logrotate.py: fix testimage occasionally failure
Date: Mon,  6 Jul 2020 06:10:23 -1000
Message-Id: <468c8eed12fec94475815cf0242c0835099dc43a.1594050175.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594050175.git.steve@sakoman.com>
References: <cover.1594050175.git.steve@sakoman.com>

From: Changqing Li <changqing.li@windriver.com>

testcase test_systemd_failed occasionally failed with below error:
Failed to start Rotate log files.
logrotate.service: Failed with result 'exit-code'.
logrotate.service: Main process exited, code=exited, status=1/FAILURE
error: stat of /var/log/logrotate_test failed: No such file or directory
error: logrotate_test:1 lines must begin with a keyword or a filename (possibly in double quotes)

above failure caused since testcase test_logrotate_wtmp
add /etc/logrotate.d/logrotate_test, which need /var/log/logrotate_test,
but there is no such file. so when logrotate.service is triggerd
by logrotate.timer after testcase test_logrotate_wtmp is runned,
the testcase test_systemd_failed will fail.

these 3 lines are useless, so remove them to fix above problem.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 22f5f7f86a4d47624c476be00e5121009c48cb7b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/cases/logrotate.py | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/logrotate.py b/meta/lib/oeqa/runtime/cases/logrotate.py
index 3938e91993..a4efcd07c0 100644
--- a/meta/lib/oeqa/runtime/cases/logrotate.py
+++ b/meta/lib/oeqa/runtime/cases/logrotate.py
@@ -37,10 +37,6 @@ class LogrotateTest(OERuntimeTestCase):
         msg = ('Could not write to /tmp/logrotate-test.conf')
         self.assertEqual(status, 0, msg = msg)
         
-        status, output = self.target.run('echo "/var/log/logrotate_test {\\n missingok \\n monthly \\n rotate 1" > /etc/logrotate.d/logrotate_test')
-        msg = ('Could not write to /etc/logrotate.d/logrotate_test')
-        self.assertEqual(status, 0, msg = msg)
-        
         # If logrotate fails to rotate the log, view the verbose output of logrotate to see what prevented it
         _, logrotate_output = self.target.run('logrotate -vf /tmp/logrotate-test.conf')
         status, _ = self.target.run('find $HOME/logrotate_dir -type f | grep wtmp.1')
-- 
2.17.1

