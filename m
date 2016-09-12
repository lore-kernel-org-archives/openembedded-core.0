Return-Path: <ulfalizer@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id AA8767715E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 20:11:14 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id a6so15212980wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 13:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=u37GVM/5EmDtLtT/qkOGv24tkFKLqn8I3rAZcmQKjQU=;
	b=grpY9TyXxYMz9X02dHOq2kD3yeCFD3yZRiorTfhCbjwURn5EI5xbqJHprSITC8wD6O
	suyaZPjhfVGfdS+TEOyJc9QVOzfnLVms8OGbuiswf0TWbuizdGv4cZAnz7NqScBC0G2q
	UX8fkkdpo5sEuGaw5ujIybJ72NvyUF2dDEn6qeNl4IyIvwX9egeLxSsMBCPS/INtCUZD
	Fq6jenzyupaS+/pL4ZWSrJ9YF4RjMqbEPDwUG7yxkCUBt3bGj+7+OcKqwfbt8eUoh9RG
	br0FTDYn3Yw1DmpY/mMIyMX5hbgESpluRCg9wFOvSHELEgRLXC/HW4nxApMw9y8MD5GW
	LRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=u37GVM/5EmDtLtT/qkOGv24tkFKLqn8I3rAZcmQKjQU=;
	b=hcyVidSzZndPWaIrUOMLhCVYV1yUqspsfkna8rEG4jvyTGK//4PIRYDRwCmeUd9Lvo
	m6a7NucU0o8WUuXkel7LPT8WPRU7SL+ehhXUIj7I22Mtk06y15X8+QA1tPpOZg6PwJVD
	QwUg2n+GLo1jzQAHq94hxpQQr1tQANtSE0teNDgasxI7t2w7c5xs9BcJIEQtWJ2LJ7XV
	oj9+PqTzK7LQSzTTB22StRj2ejD5tRjhxT8iRGplvgFprePuVzVWDZBCHjqlT+vFuV47
	iDJYhdfGW78BNdhI2WW5Aok1DPRBeESEUj1+2B4ttDr1kPvJqoNsPQwKcl2zf+9ukR1g
	bfYA==
X-Gm-Message-State: AE9vXwNi+re/WwouUS0VhWQYyTqbcHs9Q32AJZy/T7EzXle9aJH//7TjM1ONRNe+v2J/ww==
X-Received: by 10.28.193.5 with SMTP id r5mr1615386wmf.90.1473711074474;
	Mon, 12 Sep 2016 13:11:14 -0700 (PDT)
Received: from huvuddator.home (ip5f5bfeac.dynamic.kabel-deutschland.de.
	[95.91.254.172]) by smtp.gmail.com with ESMTPSA id
	bw9sm19432463wjc.33.2016.09.12.13.11.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 12 Sep 2016 13:11:14 -0700 (PDT)
From: Ulf Magnusson <ulfalizer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Sep 2016 22:11:04 +0200
Message-Id: <1473711064-9680-1-git-send-email-ulfalizer@gmail.com>
X-Mailer: git-send-email 2.5.0
Cc: dev@codyops.com
Subject: [PATCH] bitbake: fetch2: Make SRCREV_FORMAT name substitution safer
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
X-List-Received-Date: Mon, 12 Sep 2016 20:11:15 -0000

Given two names "foo" and "foobar" and SRCREV_FORMAT = "foo_foobar",
"foo" might currently get substituted twice. Work around the issue by
sorting the list of names by length and substituting longer names first.

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 bitbake/lib/bb/fetch2/__init__.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/bitbake/lib/bb/fetch2/__init__.py b/bitbake/lib/bb/fetch2/__init__.py
index 11c75cc..4ca024e 100644
--- a/bitbake/lib/bb/fetch2/__init__.py
+++ b/bitbake/lib/bb/fetch2/__init__.py
@@ -764,7 +764,10 @@ def get_srcrev(d, method_name='sortable_revision'):
     seenautoinc = False
     for scm in scms:
         ud = urldata[scm]
-        for name in ud.names:
+        # Sort the list of names and replace the longest names first. Given two
+        # names "foo" and "foobar", this prevents "foo" being substituted twice
+        # in "foo_foobar" (and "foobar" from not being substituted at all).
+        for name in sorted(ud.names, key=len, reverse=True):
             autoinc, rev = getattr(ud.method, method_name)(ud, d, name)
             seenautoinc = seenautoinc or autoinc
             if len(rev) > 10:
-- 
2.5.0


