Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1B1CA6C250
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2018 22:59:37 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id t15-v6so13060112wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2018 14:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=m05d25wMkZISNYxBB7XgFqsH9OUY0AQrE1SRMgxaGUg=;
	b=A/fp398/ne6n1rOsn5BRq/rTXTQiRPUMbmW4kOgG1uth7CAcqiRFs7hqh8CgpLSpz+
	qO+TZRmrKs5lilHVFCeB7RWpktBTXy/y+mRSJwu36qLW/35srOWapkDIHztdr2o/pfZx
	yfdi3cQD48Zn3peB+uqadG2za8trZYz2q+H2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=m05d25wMkZISNYxBB7XgFqsH9OUY0AQrE1SRMgxaGUg=;
	b=Lkl6cZuk27ZGVib2DT7N/mEf7NY/5f8vonESmqaaA1cUxNMjttcIOVKvDLfvsV8WjD
	yKc9mlVdzgTggGS6VjiRKvVb/6m+qO5J8PLQIiNU+MzviXpgraifEqccfnT4x8NrYQLU
	a96kTskgCKiGv8+3Px0i+MxXQASEGHe/EwPS0R0CYVkSCsvgi/ROcz7RwrCGZm+FqrkI
	ibq3m1jWhUauijpZKN6ZtJUsOGsZZc23nakknJ9BtLzC9Kpxi2YhkkPXWPAS0iwv12iW
	wEgFtAQKdRuMLISC8RuKE+uqWbS4DSqKwbuWvleN4hgNKZMavPcQYqWn1k6pLk6c7UcQ
	L+qw==
X-Gm-Message-State: AGRZ1gIUa4b4mcRYvPjC/90jSFXrIU2IMxCh0hgeJ6kQnPQbax+5ILei
	0dR28ky/+QVaONgq9dNIc7c0hliCAnU=
X-Google-Smtp-Source: AJdET5eiIOGBwhuW+A1sqYV0nO9fpoeSXiH4iURaeawt2a6M3sV0m0WeJLYhErgivHBh/YbBIOJMEw==
X-Received: by 2002:a1c:1cc4:: with SMTP id
	c187-v6mr2367531wmc.75.1542149978140; 
	Tue, 13 Nov 2018 14:59:38 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y2-v6sm36426474wrh.53.2018.11.13.14.59.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Nov 2018 14:59:37 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Nov 2018 22:59:32 +0000
Message-Id: <20181113225932.17726-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181113225932.17726-1-richard.purdie@linuxfoundation.org>
References: <20181113225932.17726-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 5/5] oeqa/utils/commands: Avoid unclosed file warnings
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
X-List-Received-Date: Tue, 13 Nov 2018 22:59:38 -0000

Avoid warnings such as:

meta/lib/oeqa/utils/commands.py:213: ResourceWarning: unclosed file <_io.BufferedReader name=4>
  return runCmd(cmd, ignore_status, timeout, output_log=output_log, **options)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/commands.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 0d9cf23fe42..01add686897 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -146,6 +146,9 @@ class Command(object):
         # At this point we know that the process has closed stdout/stderr, so
         # it is safe and necessary to wait for the actual process completion.
         self.status = self.process.wait()
+        self.process.stdout.close()
+        if self.process.stderr:
+            self.process.stderr.close()
 
         self.log.debug("Command '%s' returned %d as exit code." % (self.cmd, self.status))
         # logging the complete output is insane
-- 
2.17.1


