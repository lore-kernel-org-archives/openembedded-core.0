Return-Path: <jdmason@kudzu.us>
Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com
	[209.85.219.193])
	by mail.openembedded.org (Postfix) with ESMTP id 781617E416
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Jun 2019 18:29:17 +0000 (UTC)
Received: by mail-yb1-f193.google.com with SMTP id w127so5775139yba.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Jun 2019 11:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kudzu-us.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=OOsAO4B2UfG1ZZrzuHRR76tpig3KhpLHmvgmJmPOfso=;
	b=gLCluFK9NHIoWMwb0RORXzCik/K9gllLt4dBjWMrb6Efgs0kYwpwKDJS6HUR6gfhk/
	Yu0Kc0QEI4WUXBcIiZgeC436FL3ys+rQ9aeeBpwW1Y6kJo1zLCcfu8YIvlRxzZzlIqz9
	g3GBm788qDKVIsJPZaCMwC/Q39uDtRnId+9VErFFBQUTyFwknYIgk1q26OI9WSXNvslc
	eFdBWjh1vrIvMibHsvkj7sL7Cze/S+SDvZBVibCmRffVA18gJFxO2QdTvgYs1cMS3+Hs
	Lj1f3/VwdAOYISS+l9sOzAXb/up3IYOXYt4WMZxHbuTXDcYAsBlGnuSHn5kv/GApENJh
	A0Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=OOsAO4B2UfG1ZZrzuHRR76tpig3KhpLHmvgmJmPOfso=;
	b=FsbHuFUURgnIXWU7twwTNtSQnExfpc9ADk4QjhO0/Ytk4XSA5UVSZAY5He70G4HFdc
	WVL8Ie9wAOBx+JqyrqGZvk+I8lp7Kv0zf9zzjeLZUOth22gbjy9DPxrrW5Wns10Yo9oU
	Riu8bEuEFUxzdJMAgGzKfSZKKc0UWgrH9dVCDDNAMgBnKMQCR23t+QT0K4D6B5QvzdlT
	7sse1b8OLqa9CNUh0qxEFSicjVOj5pLVHjp0W95V/4Unuuygnj/fb91ZBXNwqn2pJiym
	TnorO8QOotynLQpzCAnkZgWGRMrvZBik7YvZcnR4jTTX5jiQDFeF1giXPy3es9mDCjvM
	wctQ==
X-Gm-Message-State: APjAAAWoOA7pAyOhwxiN7Pga9g8Q34ADdRHi8Y0bdXHNaK/UKLOcsvOg
	QNd0QyN6XicUFO77K3lHfHqeGsZVdUPglQ==
X-Google-Smtp-Source: APXvYqz31wl6OLm6nylEhqJr8xg4nRugx8Uu03Ws1HJbOQkdkCj/Y9KPYsGBi4/KH7ZirPxBTEh5Sw==
X-Received: by 2002:a25:758a:: with SMTP id q132mr8036945ybc.157.1559500158064;
	Sun, 02 Jun 2019 11:29:18 -0700 (PDT)
Received: from graymalkin (76-230-155-4.lightspeed.rlghnc.sbcglobal.net.
	[76.230.155.4]) by smtp.gmail.com with ESMTPSA id
	y62sm3231643ywf.110.2019.06.02.11.29.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 02 Jun 2019 11:29:17 -0700 (PDT)
Received: by graymalkin (sSMTP sendmail emulation);
	Sun, 02 Jun 2019 14:29:16 -0400
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Date: Sun,  2 Jun 2019 14:29:13 -0400
Message-Id: <20190602182913.9233-2-jdmason@kudzu.us>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190602182913.9233-1-jdmason@kudzu.us>
References: <20190602182913.9233-1-jdmason@kudzu.us>
MIME-Version: 1.0
Subject: [PATCH 2/2] resulttool: Prevent multiple results for the same test
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
X-List-Received-Date: Sun, 02 Jun 2019 18:29:17 -0000
Content-Transfer-Encoding: 8bit

Currently, if a test occurs multiple times over different series, the
code will sum these.  This can lead to confusion over the desired
results.  Change the code to report the redundant tests and skip adding
an additional values.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 scripts/lib/resulttool/report.py | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/scripts/lib/resulttool/report.py b/scripts/lib/resulttool/report.py
index a48c59f632..f706280aa7 100644
--- a/scripts/lib/resulttool/report.py
+++ b/scripts/lib/resulttool/report.py
@@ -203,8 +203,22 @@ class ResultsTextReport(object):
             testresults = resultutils.load_resultsdata(source_dir)
         for testsuite in testresults:
             for resultid in testresults[testsuite]:
+                skip = False
                 result = testresults[testsuite][resultid]
                 machine = result['configuration']['MACHINE']
+
+                # Check to see if there is already results for these kinds of tests for the machine
+                for key in result['result'].keys():
+                    testtype = str(key).split('.')[0]
+                    if ((machine in self.ptests and testtype == "ptestresult" and self.ptests[machine]) or
+                        (machine in self.ltptests and testtype == "ltpiresult" and self.ltptests[machine]) or
+                        (machine in self.ltpposixtests and testtype == "ltpposixresult" and self.ltpposixtests[machine])):
+                        print("Already have test results for %s on %s, skipping %s" %(str(key).split('.')[0], machine, resultid))
+                        skip = True
+                        break
+                if skip:
+                    break
+
                 test_count_report = self.get_aggregated_test_result(logger, result, machine)
                 test_count_report['machine'] = machine
                 test_count_report['testseries'] = result['configuration']['TESTSERIES']
-- 
2.21.0


