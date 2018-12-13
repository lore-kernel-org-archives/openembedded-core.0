Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id C300C6C4BC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 21:39:01 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id e5so1671560plb.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 13:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=i0Ch/S8/QYeUsFZaVRF9ZPyM5U9/b07aA+ePJyF5ChA=;
	b=UQSJ47Xl9IujQnewcNjZMKBKidppwdiKaGRs7SqfXViG3gS8WslWKXMOVuCrYcMMaT
	zpBlTUbwuQYsLs5aBMPrAZuAcSZbLT4GmEvxirtP41iHLBttzXv9nKiW91FcFO0Kpuz0
	yCc3WdpTSDvWfzyoCTK+gajytINnZDW0YDWLomnN4MHglA2zFtovex0RYVQDRQlJBomi
	qaOWqaqZAqMLmqqJ50MMaBMRPpYna3cXSQwstw8Xyv7ooTo+ubw+02ptl87HTvxSNV1K
	PQWVsFS1NJ9zJiOb3d/EudL9oms30g5206XwaBWiJ6MzB0NLA3wAnfd97f2jHNjhZjrq
	3bHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=i0Ch/S8/QYeUsFZaVRF9ZPyM5U9/b07aA+ePJyF5ChA=;
	b=GFE1Bf/4KqJUh7nAS0HjOLwh2YjSaDKYIrgh6QuGYYaIzuFAopfLfQovSX66hLf1oU
	MNNiTrOefQgihgF93me6SukIKE0t5ZNGwcrwk+uUje0kpkZUJW2T3PIW1qzTjDLA0eYL
	na09w0mWLp8U2O4JRMIzBc9lTGfmym8kpL+rQY4adQA2ZVwOlY7MyCl82t5QHgHjXPXg
	hPpfo7pw49vwOmEyZiHuh7RIR1rBbJGGrzrwjYWetpUu42igMhLXgbjCOCeDoV4G/B4k
	F7bUuIHz7aUCDTAyL8z3rEladK217DaTKwPl2+Gt298yJmcRpRXYqSvEoanJ3ZOMQCGo
	Dz2A==
X-Gm-Message-State: AA+aEWaFsk5eZIXuuU9TcP3mTvKx/ieUQPYj5hgbFqikFVszGKcWd28/
	PvI7bXR513j+g7ZV7lfqNBqGNwKh
X-Google-Smtp-Source: AFSGD/XbTvmpv3hSuy9h75eZE6wn+Th/zJ+IFWUHV+N68f7i/hd4WqBCgaTBCZRNi8qAJ4FeqYFb2Q==
X-Received: by 2002:a17:902:e085:: with SMTP id
	cb5mr460731plb.24.1544737142739; 
	Thu, 13 Dec 2018 13:39:02 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:79af:1f36:1822:3801])
	by smtp.gmail.com with ESMTPSA id
	b9sm3288912pfi.118.2018.12.13.13.39.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Dec 2018 13:39:02 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Thu, 13 Dec 2018 13:38:09 -0800
Message-Id: <04462ef1bdda5e14cf6cc9fd141bb232fc58a622.1544735897.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1544735897.git.akuster808@gmail.com>
References: <cover.1544735897.git.akuster808@gmail.com>
Subject: [PATCH 01/45] scripts/runqemu: Replace subprocess.run() for compatibilty
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
X-List-Received-Date: Thu, 13 Dec 2018 21:39:01 -0000

From: Michael Halstead <mhalstead@linuxfoundation.org>

subprocess.run() was introduced in Python 3.5. We currently support down to
Python 3.4 so I've replaced it with subprocess.check_call() which is available
in that version.

(From OE-Core rev: 1c61f3017a6a2d95747883c722c376763ec77c9d)

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/runqemu | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index bd3aee0..c9a351e 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1313,7 +1313,7 @@ def main():
             logger.info("SIGTERM received")
             os.kill(config.qemupid, signal.SIGTERM)
             config.cleanup()
-            subprocess.run(["tput", "smam"])
+            subprocess.check_call(["tput", "smam"])
         signal.signal(signal.SIGTERM, sigterm_handler)
 
         config.check_args()
@@ -1335,7 +1335,7 @@ def main():
         return 1
     finally:
         config.cleanup()
-        subprocess.run(["tput", "smam"])
+        subprocess.check_call(["tput", "smam"])
 
 if __name__ == "__main__":
     sys.exit(main())
-- 
2.7.4


