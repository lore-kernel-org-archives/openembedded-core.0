Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 286567FCE5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 04:41:27 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id n15so8059620qtp.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jan 2020 20:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=4mbsXe2aqctHaCrZ8+ip7p1xaL4XkaZRbqMVscYHJ4I=;
	b=Hmgb2xvcpavVbyn36TLfE1+42TGpNyUzfv4Wfl0wNrds5MUNieuGsHuOMgQ8zOWNBF
	aQ5XFAWkjugNK8qgMtOBxWEqW68M5xQLSgCsNbsdp8Wh+HRJ7oiFGNldXkuA1jKKcMrm
	caccblwIbzCU37xf6nHzScBpY/lhz/oy3DIhqocqRjytvQ5pujWRWrePasiTSihwFyiq
	Ihw1h849og+ViQY4jg3I2s5lNXiLJ+82zlOBwFiAJrwCRbzTVYm2CJm38kSkwQlTKEfY
	ZJcEzenhOkEwFAKGoNgaOdS77lkIvupraWGH4g0h3JEFngNUtNBVNu7qMzn3ViUIItTH
	0lEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4mbsXe2aqctHaCrZ8+ip7p1xaL4XkaZRbqMVscYHJ4I=;
	b=XD4jQJvlxME/6+CHjhY4oMjK1a0ftwg74dTzfZ2ZDPTZ8RQ/FFdTRxw9gbvPgBdohU
	/6OHEpNFQEo9vJK6pFQcd2saFJctcr1qZ2BBqSQyu6qP/refdwr/8DBRVAJ1eRXjjKZj
	N5ZTuJkhI6C24fQLSnPgKLNSwgY7uuRSql7k2QHFIquq2ZqHXWOYa91+Gix5uC+Rh8NC
	S1T77Qz3nNsrQr3J1rIl616jRVP6n6aOiW63IbdEEsCfEJgruO9PJlm9vW0mpNVPA3ug
	7rrQLL8dC+Kp5L94kwjvP752insCQpATIlePq8Uf1H++u53svCKYE6DuS09Rg4V5tRVt
	LZiw==
X-Gm-Message-State: APjAAAVqtHCJGwPGyHz+5ce6lxn2jj0hoF0mz5fxmmTjBk909/jVhTyA
	jFlGOUTos8TmsWiJSR7X7TwtIfHTnuI=
X-Google-Smtp-Source: APXvYqxswS7J3Q6jCX3i6fFIUVNUlwPvX2JsnMAH67u2SRq2VvWJLs3JLvnaFqcXpZgiepj42BfpXw==
X-Received: by 2002:ac8:65da:: with SMTP id t26mr12577420qto.5.1578890488243; 
	Sun, 12 Jan 2020 20:41:28 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95]) by smtp.gmail.com with ESMTPSA id
	s20sm4472974qkg.131.2020.01.12.20.41.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 12 Jan 2020 20:41:27 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Sun, 12 Jan 2020 23:41:23 -0500
Message-Id: <1ade4ffec10f27bd13af1e46c56c0f6d82d6ce16.1578890313.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1578890313.git.bruce.ashfield@gmail.com>
References: <cover.1578890313.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] perf: fix build for v5.5+
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
X-List-Received-Date: Mon, 13 Jan 2020 04:41:28 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

In kernel 5.5+ there are python3 scripts that explicitly use
/usr/bin/python3 as the interpreter. That will find the host
python and produce undefined results.

We add that interpreter path to our substitutions to ensure
that our sysroot variant is used.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/perf/perf.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 5f0ba7c180..840f3008b5 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -241,6 +241,7 @@ do_configure_prepend () {
         sed -i 's,/usr/bin/python,/usr/bin/env python3,' "${s}"
         sed -i 's,/usr/bin/python2,/usr/bin/env python3,' "${s}"
         sed -i 's,/usr/bin/env python2,/usr/bin/env python3,' "${s}"
+        sed -i 's,/usr/bin/python3,/usr/bin/env python3,' "${s}"
     done
 
     # unistd.h can be out of sync between libc-headers and the captured version in the perf source
-- 
2.19.1


