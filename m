Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 5AD9D6011F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Dec 2015 09:09:58 +0000 (UTC)
Received: by wmuu63 with SMTP id u63so163714606wmu.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Dec 2015 01:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=iuow8CP0+8JqDwmGlFCEQ2ZNIZAytJxqjTVRQPHoJMY=;
	b=w2V4XdyBTBdi/DDqrMms/tSITU+sLA9+CrxbaBqh3VOMKSK38uJ/hCXVrdz9omn8QG
	B/YwrEkLmHIPJ0aJetqVltwatFvhw0ZHOQtrHIjkWybehcOYhSSl7RJkzmmOwnMm7LF9
	viknWKzuIommcK4Y5aKRZ01nEJ7him3YPdI7nhZ+DhIWaX+F9wM/f4dUQfu0ae2h03q0
	T7LHKiyi2jCNJmkjTNSbeKcLqF2bpzUMc5IvVkqwHjHS90uHygA3UZkxKDJst6wyYlCg
	dE8Z6oj5Rc1VKC6grIrvx2qrTkz+5vexpWi49RD04yXqOStvNoUirgDi00D6XP3V31Zm
	1Xqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=iuow8CP0+8JqDwmGlFCEQ2ZNIZAytJxqjTVRQPHoJMY=;
	b=FVyqIwqIqqewMCN02W4te7Gyx9cHVmwJyyNc084phTmMQuvUj9P0ezReNUk/HZPTmv
	Yv9BxLMZgkL2xNO+6eyHkohEsSqsY0iuOpL7cC9gB54ryRoubFngwtmCXEuJ56WH2UJq
	DcO8BHnpJLo4m1CxQoLY1qdNOK4xCi5z3L5KM2XSENxEap9Yl9+Wlj0fxZkJwsmFqCUv
	I1xnmXSiWWWrr8WE/jIdDifkD5tNaoKlfKsmtNnhM0U1BYBcVTKYqe8WG+0AKBmwENK4
	iuH4HQeZlVYkNUbt9BArolh5mAIGnXDa3Qd56uYvEKrKJT6lhfNexqPHL1pDFRRZqm0j
	yqjw==
X-Gm-Message-State: ALoCoQmPaMzFRh8j/Y/irRU/9XFCCMjDtIir0Opm2eb2PSysUQs3h5S/yJu82UjvYWCJqFndhST3
X-Received: by 10.194.21.170 with SMTP id w10mr91354227wje.29.1448960999288;
	Tue, 01 Dec 2015 01:09:59 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	d2sm50586626wjy.16.2015.12.01.01.09.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Dec 2015 01:09:58 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Dec 2015 09:09:54 +0000
Message-Id: <1448960994-8750-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] base: check for existing prefix when expanding names in PACKAGECONFIG
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
X-List-Received-Date: Tue, 01 Dec 2015 09:09:59 -0000

When the DEPENDS are added as part of the PACKAGECONFIG logic the list of
packages are expanded so that any required nativesdk-/-native/multilib prefixes
and suffixes are added.

However the special handling of virtual/foo names doesn't check that the prefix
already exists, which breaks under nativesdk as in that situation there's an
explicit nativesdk- prefix *and* MLPREFIX is set to nativesdk-.  This results in
the same prefix being applied twice, and virtual packages such as virtual/libx11
ending up as virtual/nativesdk-nativesdk-libx11.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/base.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index e6d1599..4ea400e 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -363,7 +363,10 @@ python () {
                     newappends.append(a)
                 elif a.startswith("virtual/"):
                     subs = a.split("/", 1)[1]
-                    newappends.append("virtual/" + prefix + subs + extension)
+                    if subs.startswith(prefix):
+                        newappends.append(a + extension)
+                    else:
+                        newappends.append("virtual/" + prefix + subs + extension)
                 else:
                     if a.startswith(prefix):
                         newappends.append(a + extension)
-- 
2.1.4


