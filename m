Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 47E516D523
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 21:39:04 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id u6so1722796pfh.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 13:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=DWgXJHldSGkqPUN8P4yueWQDdN+7/oy9aL3jFMLpouU=;
	b=ABypsQKAiG78AOEeJdNa0LUl/TYKCvqg1U2ZCA+EXA5QRi5Xy0ZMTpk+/Be4WtbO5n
	oV6HdErdW9EyuAxaYN9DEBmx0vH1dmmMayzz8+I8lwonVC2IPRuBGqKDCbXbRhNmL17o
	ROUcyCJS5YpSJzRkfTQZ6+lCfqPC0fPVK8qsrh8rZgUWjLy5M/I0v2cvBaopB2GCMjXN
	PfRf1DRsQh6XYpA5ZRxdky5Eta58WMr3YCNCfaI9z8TaywiMTyJsqR2B+bFEg9hz4ogh
	2ydCSZZzynB/ujpcEpYqdOSAXcwrEuJ3ss2quAKrKeRm7FSbRLfZi6PssFTlG3b25Gs9
	b4zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=DWgXJHldSGkqPUN8P4yueWQDdN+7/oy9aL3jFMLpouU=;
	b=oH1n1ytOAIJMYgGZDSHl2n3CnIvueCN1kWf3jAfdXALxHQDogWd7loL7ndJX/Pi39M
	K1Hfu88kxcUUm9fvcxEYh8WyUbnxC9DeHVN1iCt2kHvVqKjUze0rgbUWPqymEibEhX7/
	hGXtMpArYK6oDypqfYH0feUs6VRpCJ5DejFp3V4OJ+wA+Q+7n4ahcXZt4HLsYB6Iv72I
	fuSSExJUIz2yrJoe83OzeE/7bKrT7wc07rMnvSWAx39vxTRs9ZeQlOAEPm2qrSNiYxnf
	zo+nrcCxWtTEM9SVHH9BEx613eRAPbqns41x196U73WNeMMBxy4na9zpK0/Yp/POgSlC
	qHCQ==
X-Gm-Message-State: AA+aEWYo8Tw17wYt2CsMmw4TChVcHCtxiniBG8LlpvIdUqCwbkj5dSYP
	m0SWwYjHAuvBXf/u2ONIQTrK+1oM
X-Google-Smtp-Source: AFSGD/UNStMXp2bfQnFIgshDGE54/cQ5D5OsYVIZVTYA3aTr4xWeSkEimMbii5q2yEI2BOCG8Ut68Q==
X-Received: by 2002:a63:d450:: with SMTP id i16mr415215pgj.246.1544737145022; 
	Thu, 13 Dec 2018 13:39:05 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:79af:1f36:1822:3801])
	by smtp.gmail.com with ESMTPSA id
	b9sm3288912pfi.118.2018.12.13.13.39.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Dec 2018 13:39:04 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Thu, 13 Dec 2018 13:38:11 -0800
Message-Id: <26e07efe25a151ad019b19a7c5cb2992a22798dd.1544735897.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1544735897.git.akuster808@gmail.com>
References: <cover.1544735897.git.akuster808@gmail.com>
Subject: [PATCH 03/45] scripts/runqemu: Improve lockfile handling for python with close_fd=True
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
X-List-Received-Date: Thu, 13 Dec 2018 21:39:04 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

On python versions with close_fds=True (python 3.2 onwards), the tap
device lockfile isn't passed to the child process.

Since this guards against use of an active interface, we really want this
here, so pass it in pass_fds. This means if the parent exits early, the child
still holds the lock, avoiding messages like:

runqemu - ERROR - Failed to run qemu: qemu-system-x86_64: could not configure /dev/net/tun (tap0): Device or resource busy

(From OE-Core rev: 17a0a067d597c445c5892ff9914e91a2187f7e09)

(From OE-Core rev: d3b3c55ddc312039380ce8e23e68dd8bb2439388)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/runqemu | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index a83c8a6..c6b7580 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1215,7 +1215,10 @@ class BaseConfig(object):
         cmd = "%s %s" % (self.qemu_opt, kernel_opts)
         cmds = shlex.split(cmd)
         logger.info('Running %s\n' % cmd)
-        process = subprocess.Popen(cmds, stderr=subprocess.PIPE)
+        pass_fds = []
+        if self.lock_descriptor:
+            pass_fds = [self.lock_descriptor.fileno()]
+        process = subprocess.Popen(cmds, stderr=subprocess.PIPE, pass_fds=pass_fds)
         self.qemupid = process.pid
         retcode = process.wait()
         if retcode:
-- 
2.7.4


