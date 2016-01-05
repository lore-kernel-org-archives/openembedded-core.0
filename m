Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 147D060797
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 12:32:49 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id b14so26757253wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jan 2016 04:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=XsY+h7spmN04ono7CMEa8CaXTSwh8YX+wfAWabKxG18=;
	b=IJzEFqA5NoGfFVUz3V/00vgWdB1S2MeDiWSS1Moafagmu70zdM46tx5LZF5SIPwWTJ
	zEIdM1OmHj500kUYI/fz4ZAFU00CI/4pZjdZbYMK2ZKlOpxk8tLremBQTknJoWCLEytG
	Mc5nm/AbXHKQNO5wGNX/evNVwFp3HOu5u5Rnqp6sVzrEghZ8hXzocj0xk2DodgSSL/Av
	5Zi07v3R0i8Y/LtNmSuPFao9T5vmCQrJGlDmv+KulBZDrQNAKyQU/Mq+Tf24JK/bIqh+
	zh6Qlkt6I2qn8A3kUbwghIKqSZMXE+lEOlp+r2VbS9ia48uz52E8fueGe2b73MWj96je
	T+nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=XsY+h7spmN04ono7CMEa8CaXTSwh8YX+wfAWabKxG18=;
	b=JIcgTsdlyF36CjnBaj0opzM4k/t2UoFqDqHSQ2RKHpcuzbgDt4Tae7ujkhb2Yg7AZV
	LsAT3q4MprMc/sQAyini57/2Wcmh0GpbXRIVxG58rN/TnptYxhhR/pfcEvUzWAjsWrg4
	xjzAa4nAxVY6+3c5PhLzo6Dxx2LMgxUMxyT6FvM5eTQE8DsqY0VzyuijA67FR9kcz2mz
	XhIXCe/c00q7hFc8KyJ4QHE/TxpK4lnOZu8X8GddFDA07yyTsYvxX6bIFhlNwDK1IFs0
	5aLjgxpwTL7qnHyLOGh9JggeAhkWjv2yo/6VAcX9SWi+0+ftPBfXWCtfQDcybIeW2yqW
	CaCA==
X-Gm-Message-State: ALoCoQkvw679UMjlE2jJv5HgNqgHgWGHpUWpP/C/k3P5RL5M+uPjlSi7BAFVWh16xYRdVV5MaFrWsJeY/Cbyqf4PK+LIQ9GWaw==
X-Received: by 10.194.185.42 with SMTP id ez10mr118579042wjc.82.1451997169653; 
	Tue, 05 Jan 2016 04:32:49 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 79sm3385034wmo.7.2016.01.05.04.32.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 05 Jan 2016 04:32:48 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jan 2016 12:32:45 +0000
Message-Id: <1451997165-25159-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH] sstate: change "stamp is not reachable, removing manifests" message from info to debug
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
X-List-Received-Date: Tue, 05 Jan 2016 12:32:50 -0000

This code path has proven to work, so change the log level from info to debug so
it doesn't spam the log in normal use.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/sstate.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 9bef212..9201146 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -952,7 +952,7 @@ python sstate_eventhandler2() {
                 if stamp not in stamps:
                     toremove.append(l)
                     if stamp not in seen:
-                        bb.note("Stamp %s is not reachable, removing related manifests" % stamp)
+                        bb.debug(2, "Stamp %s is not reachable, removing related manifests" % stamp)
                         seen.append(stamp)
         for r in toremove:
             (stamp, manifest, workdir) = r.split()
-- 
2.6.4


