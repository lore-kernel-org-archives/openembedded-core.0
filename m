Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 8AACB71979
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jun 2017 03:19:57 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id 7so87367420wmo.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Jun 2017 20:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=JsxU3LYS6e9X4oDfzP5SzS/mNxXW6cOutZVw4kmBdb0=;
	b=S6Dl31O7d89bCq84p9lRcEXt6gbL15QLNqnMBHUBKTr5iYtnYrKR2RquO95vRZiTGt
	Z2/RSJil5u3djfCWgxwBESye9TQN4KT/VoRZwlbCF2yxM8cVWKaQn6whOWqou8cHhsMR
	6Qp1O+JDfwLbKlFYh3ipEnCJeKMACSJaExhOqF0cmI174Vv6GU3qL3KaRJQSzAiHTrq4
	WtF1CBoqomjmMKM/tVzRwb/xVCylVUqZ2FmRK4CVhzKlBH4vju3hrdVjuXkX6+6fk5u3
	1j2ptmFieNndl++l80Ea1Ba1755iYZHONNB3JDPlGqqcQGr26EkJgt+3iJyCLwdIXoRW
	/ZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=JsxU3LYS6e9X4oDfzP5SzS/mNxXW6cOutZVw4kmBdb0=;
	b=AJPYQC9gSMtXqswmsU4+egpFkPm5Lsn5HifecZDE3PEgpcUtqjJEwn0t5chP1LOcar
	0hxEnaELBKSbOufDXPKy1oAOw6TAjCxtAdm0WqzSaVKbztuTco5q7MOG6sqhxAPKBO+N
	bO6Ge2ElcnM79IxO3Jk0tROisWbRWM5snVqeHvTT9E+g8Vt5jTkOjqQDHaRJokP/Q1E4
	dy1kCappCu0eqbO+xJCwLbmWv+Y2bGjSUqJM/RIovSV1+RdRk8958vps6wL5N5PlrNpw
	QnqzoH4SP1VZNZbGeJIQVrK/ZuhD/c19wTim4yfZW110Ahx60Lgz7hVf1ZfVIIkF9v+E
	2NpA==
X-Gm-Message-State: AODbwcAZ2euFGzyffqp4sNUg6oODDokGeeNxK9z4Rjic/WeBoxGip/H7
	e89TmduW+P6gSrdQ
X-Received: by 10.80.159.33 with SMTP id b30mr13079594edf.5.1496719197832;
	Mon, 05 Jun 2017 20:19:57 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.119.199.183]) by smtp.gmail.com with ESMTPSA id
	q42sm15214841edd.24.2017.06.05.20.19.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 05 Jun 2017 20:19:56 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Jun 2017 05:19:43 +0200
Message-Id: <1496719183-2847-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] buildstats-diff: show more graceful error messages
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
X-List-Received-Date: Tue, 06 Jun 2017 03:19:57 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

I got a following error when I run buildstats-diff against a invalid
buildstats file:
| Traceback (most recent call last):
|   File "/poky/scripts/buildstats-diff", line 548, in <module>
|     sys.exit(main())
|   File "/poky/scripts/buildstats-diff", line 534, in main
|     bs1 = read_buildstats(args.buildstats1, args.multi)
|   File "/poky/scripts/buildstats-diff", line 222, in read_buildstats
|     return read_buildstats_dir(path)
|   File "/poky/scripts/buildstats-diff", line 165, in read_buildstats_dir
|     os.path.join(recipe_dir, task))]
|   File "/poky/scripts/buildstats-diff", line 124, in read_buildstats_file
|     bs_task['elapsed_time'] = end_time - start_time
| UnboundLocalError: local variable 'end_time' referenced before assignment

the root cause is that a task was terminated by me on the terminal,
so the generated buildstats file was invalid, supposing that it would
make the buildstats.sh fail, but the script should give more graceful
error messages.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 scripts/buildstats-diff | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/buildstats-diff b/scripts/buildstats-diff
index 4276464..8e64480 100755
--- a/scripts/buildstats-diff
+++ b/scripts/buildstats-diff
@@ -97,6 +97,7 @@ def read_buildstats_file(buildstat_file):
     """Convert buildstat text file into dict/json"""
     bs_task = BSTask()
     log.debug("Reading task buildstats from %s", buildstat_file)
+    end_time = None
     with open(buildstat_file) as fobj:
         for line in fobj.readlines():
             key, val = line.split(':', 1)
@@ -121,7 +122,10 @@ def read_buildstats_file(buildstat_file):
                 bs_task[ru_type][ru_key] = val
             elif key == 'Status':
                 bs_task['status'] = val
-    bs_task['elapsed_time'] = end_time - start_time
+    if end_time is not None and start_time is not None:
+        bs_task['elapsed_time'] = end_time - start_time
+    else:
+        raise ScriptError("{} looks like a invalid buildstats file".format(buildstat_file))
     return bs_task
 
 
-- 
2.7.4


