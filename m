Return-Path: <nathan@nathanrossi.com>
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id 03F347F342
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2019 12:41:14 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id x20so2942794plm.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2019 05:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=JwmJ3kzGTGW2oXyuPjAw5Skc8yFYpTf+dcI4c4dCEKY=;
	b=EfCjNa0yWMLKZWdKthkpTgiBeQdo9NB0G8H97nDmBiZOldJayTqw4XrVNOhV91suYH
	js1oyGkDB44cqjHVGzdNvx4puWmVh07MhOIbcS0FJZbXtHqcfQEXhnTlHQpgu3LWepQd
	O6FRwp6lu/pHUoVVzL7wdNTUAAWlV4aLBTlkrJlVVTQ45aKsi6KutmYo4riwNQ7lZl9v
	PZ4rD3JjxB2DSVc0ZJyFdt8mhT6IXrcpLNVIgqNGOKnT3HWR/oO2GmSMmIMpqECHKNj9
	AobuKDLGimdmkF86p1S/CT1PLd/mmngfGqr8EX1TcU+Sky36bPpggi3vnfkcG5+rcI1R
	oIFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:content-transfer-encoding:mime-version;
	bh=JwmJ3kzGTGW2oXyuPjAw5Skc8yFYpTf+dcI4c4dCEKY=;
	b=uMtLbLzqYwmJpKgvBAjT0IUdI/V6GlsnKX2y/UHsVnWnWzv/SFodBQgLa/RDOEL9x7
	9/R/N54xQm2qoohNj3OB7eubuJOIwoQ3fEAbOYvdq7isZ+WQSx6O6L0LelHvJ2x8mV61
	UijT+oI4feLWS8gpsls+SZkmSssfOLvYCL7aJGj/W1MEbY+SfLzMpXnbDahZwjs25fLz
	+4YUFhqRAYn8KBVHJTvsvFQ6p+Bu0RWEMafq65Ovw4OkjP98ofN9bBaPa8RW0uCSZFWw
	JWpHJq6A1V81kE0/t1RqUksM7hTr6Q6+oV63ntF0imXmWiiAzqocV/Zwa9Xyr1tGcPTH
	+/lA==
X-Gm-Message-State: APjAAAU1ltz909/rFcclgQL8GmNu02xuztxHsdsekWmt71ZvFW8+y+5E
	hDGv1QqqO9h6+YdHGtD6nu0BSw==
X-Google-Smtp-Source: APXvYqwety+nWE0QnMXO4d5MeqagDc0KWDDBEcyHK31mXJvJX8aS0uY9iuY2jfqzVsb7kX8N0odA2A==
X-Received: by 2002:a17:902:20e3:: with SMTP id
	v32mr29509429plg.142.1568119275767; 
	Tue, 10 Sep 2019 05:41:15 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.76.229])
	by smtp.gmail.com with UTF8SMTPSA id
	f128sm25491580pfg.143.2019.09.10.05.41.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Sep 2019 05:41:15 -0700 (PDT)
Date: Tue, 10 Sep 2019 12:40:59 +0000
Message-Id: <20190910124059.3908-2-nathan@nathanrossi.com>
In-Reply-To: <20190910124059.3908-1-nathan@nathanrossi.com>
References: <20190910124059.3908-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH 2/6] oeqa/selftest/context.py: For -t/-T use append argparse action
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
X-List-Received-Date: Tue, 10 Sep 2019 12:41:15 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Use the 'append' action of argparse instead of nargs. This changes the
behaviour of the option from "-t foo bar -r" to "-t foo -t bar -r".

Additionally rename the long form options to be consistent with
behaviour, such that they specifying a single tag at a time.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/lib/oeqa/selftest/context.py | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index 3126ada716..c4eb5d614e 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -78,12 +78,12 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
         parser.add_argument('--machine', required=False, choices=['random', 'all'],
                             help='Run tests on different machines (random/all).')
 
-        parser.add_argument('-t', '--select-tags', dest="select_tags",
-                nargs='*', default=None,
-                help='Filter all (unhidden) tests to any that match any of the specified tags.')
-        parser.add_argument('-T', '--exclude-tags', dest="exclude_tags",
-                nargs='*', default=None,
-                help='Exclude all (unhidden) tests that match any of the specified tags. (exclude applies before select)')
+        parser.add_argument('-t', '--select-tag', dest="select_tags",
+                action='append', default=None,
+                help='Filter all (unhidden) tests to any that match any of the specified tag(s).')
+        parser.add_argument('-T', '--exclude-tag', dest="exclude_tags",
+                action='append', default=None,
+                help='Exclude all (unhidden) tests that match any of the specified tag(s). (exclude applies before select)')
 
         parser.set_defaults(func=self.run)
 
---
2.23.0.rc1

