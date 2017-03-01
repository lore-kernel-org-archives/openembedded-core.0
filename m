Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id 671DE77571
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Mar 2017 17:20:13 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id a6so22562628lfa.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Mar 2017 09:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+L/ByIx/A4h5K5LOIPTLauLtYVsyXvv/y8am/WVcLzQ=;
	b=e2czcy/+c498Rp/YeCeRCDJ/9hBxExgqniDywtFfvmAagUUjzfK+A7v9OJt2rLnTH+
	/HxOLVFw56mgXHGRyzmmAfu4Q/ICbL97Jk/5TAXqSvLOIDpPuTFDSHQaDpUBMUD8Sfqe
	SuwzxieBqpu99Q9dMRU+ZPITT6GQnsmgR+mXbGcMk7k8EWgbBiU40tTjvK9Jmh4+KKog
	gVEoKKrPqJOb6hnscJabApw/TWZy8Ul0cYkjk2Q0SKQBx92nzYXvUKTGZlPuerwoTyk8
	JKbfKsj/D6sd/w/2SQVhJgicEGkSxaKoiszztq74iceXNM5zNNlmMVHL5yuMZ17QH/7j
	EEuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+L/ByIx/A4h5K5LOIPTLauLtYVsyXvv/y8am/WVcLzQ=;
	b=azSG2yv4/deiQk007kfcZlIaR7RAUFX5N6hxCKi1qp6fBbxY3AHYz2OD0oOeu8HWGc
	4LU43eBlf/fwCvkqVw+LTzqMU0AIJoxBSJnyZyAidWLYc0rxyvy+VnOX2JgwGsYLyUJD
	NwPosdqc/qDj4b2+gic2jWP4TVLjRygCW4tp2ubsconUJYYQJQDbz40KUH4W7reA8fD7
	Eb+0NM85Bk5LftQ7Ublr0APXhyTtwBwHHFpR0umGZgK5lD90E+/+1+fEy39sf0QCAYJv
	LZf9TDcQ5Ia3wZDzr/PHocHwOIFSKTfxFepgGhABm10GZsppSjiJPwthqLcd9JUe/fiQ
	kUeA==
X-Gm-Message-State: AMke39nZqYbGa8qmhlTs0ojsfOms11HK+tz65k8oXxXOrMpZ8xm2+u6lRJ9N53cFIIK3zA==
X-Received: by 10.46.80.21 with SMTP id e21mr3362397ljb.100.1488388814279;
	Wed, 01 Mar 2017 09:20:14 -0800 (PST)
Received: from localhost (194-237-220-218.customer.telia.com.
	[194.237.220.218])
	by smtp.gmail.com with ESMTPSA id o91sm928746lfg.1.2017.03.01.09.20.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 01 Mar 2017 09:20:13 -0800 (PST)
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Mar 2017 18:20:00 +0100
Message-Id: <b984feee056fcd7df53bf2cdbfb05b91a3487611.1488388550.git.anders@chargestorm.se>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1488388550.git.anders@chargestorm.se>
References: <cover.1488388550.git.anders@chargestorm.se>
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH 6/7] scripts/lib/create_npm: handle AND and OR in licenses
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
X-List-Received-Date: Wed, 01 Mar 2017 17:20:13 -0000

Handle npm packages with multiple licenses (AND and OR).
Prior to this, AND and OR were treated as licensed in their
own.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 scripts/lib/recipetool/create_npm.py | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetool/create_npm.py
index 6a0f3c2..89973d9 100644
--- a/scripts/lib/recipetool/create_npm.py
+++ b/scripts/lib/recipetool/create_npm.py
@@ -46,6 +46,19 @@ class NpmRecipeHandler(RecipeHandler):
             if isinstance(license, dict):
                 license = license.get('type', None)
             if license:
+                if 'OR' in license:
+                    license = license.replace('OR', '|')
+                    license = license.replace('AND', '&')
+                    license = license.replace(' ', '_')
+                    if not license[0] == '(':
+                        license = '(' + license + ')'
+                    print('LICENSE: {}'.format(license))
+                else:
+                    license = license.replace('AND', '&')
+                    if license[0] == '(':
+                        license = license[1:]
+                    if license[-1] == ')':
+                        license = license[:-1]
                 license = license.replace('MIT/X11', 'MIT')
                 license = license.replace('SEE LICENSE IN EULA',
                                           'SEE-LICENSE-IN-EULA')
@@ -224,7 +237,8 @@ class NpmRecipeHandler(RecipeHandler):
                     packages = OrderedDict((x,y[0]) for x,y in npmpackages.items())
                     packages['${PN}'] = ''
                     pkglicenses = split_pkg_licenses(licvalues, packages, lines_after, licenses)
-                    all_licenses = list(set([item for pkglicense in pkglicenses.values() for item in pkglicense]))
+                    all_licenses = list(set([item.replace('_', ' ') for pkglicense in pkglicenses.values() for item in pkglicense]))
+                    all_licenses.remove('&')
                     # Go back and update the LICENSE value since we have a bit more
                     # information than when that was written out (and we know all apply
                     # vs. there being a choice, so we can join them with &)
-- 
2.10.2


