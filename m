Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id ABD8D78650
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 16:04:17 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id u83so11448467wmb.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 08:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=JHM5K9Di1+ACRfo35mLMVIS8wabsImta+0RLVTzDDQ4=;
	b=IwsocCbdmlHiIfzvrOvBY8WNrB83HmKVPRraCyMyads2qaH9XFgLYnitWVbAzDAs+x
	6Cc2KXEuCKdkM9jKf4baSqZ1W2HbJXrtMYOIn3PfNwENjWZC7ftSI3zzfZvN9/kAJGPK
	rcidY7jJlFKzsbAqoqD6WZDq056tCMPt+3iXBq0nfPFxLvOJo2E4WvjNqJnK0AQrRyQG
	aJKVQkbw0Ju1ck6a3v99WNf0Jk0ZQgbsuvB3Z2mPv4dokCuxcvtsBxcRXrOVtobQwUQc
	FsS6AQBDxgYnw8c4HH6r2mFOqtBg3Z/Y2WrdM6El8bpLisWoNihwKkb/AIvQzNACF6Iv
	uMxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=JHM5K9Di1+ACRfo35mLMVIS8wabsImta+0RLVTzDDQ4=;
	b=hkJ2FFYyaF3Qz8lOMBRD4D0DakbF3qxZUMTNPGrd+e0bFlqFrXEWtx0Yk7nzbV6qio
	6j0pVOcwQq1pj8ibr9FVJ0IKlzq88u1r0lJCTu41tDpZy/RF3An/aanXEPfcGX6w0ppY
	P8zglnVNQbAfC24EHe1hS/2fgQfzCSNEhzCed2/iOgFWU+MEdz7Dd3LcbwOfwWNqqnBO
	sOSoOGzM7s1XXKX6/FC0VIbQRq1OVXgf25NUindvMVFYRh5qiRF44auvHg6EXfyr6Zxf
	nIrvICas1UvI/4Fu4zAJZWS2oBQ5U20yhgrzPjjoSK3/onFPaN4raHrr6yt4/9BRuwIN
	IzZw==
X-Gm-Message-State: AJaThX7kl+chDDcSv5tdmEeL+CwqzqPv6Pw3AwITJfw+FmDY4GP6g0gx
	vZDnfU7Rm7IxGPSDKs79zgGCWqnQ
X-Google-Smtp-Source: AGs4zMZZlDQtLZue0eHK1l0o+wIjGg76XQv1iZ+g3RsKfuYfvynkH4AmPZgFY4MR2CwYdkcej7R9vA==
X-Received: by 10.28.158.212 with SMTP id h203mr4579741wme.157.1511366657929; 
	Wed, 22 Nov 2017 08:04:17 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	k30sm28923728wrf.63.2017.11.22.08.04.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Nov 2017 08:04:17 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Nov 2017 16:04:12 +0000
Message-Id: <20171122160414.14093-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/3] oeqa/commands: don't break if get_bb_vars is passed a tuple
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
X-List-Received-Date: Wed, 22 Nov 2017 16:04:17 -0000

get_bb_vars was using variables.copy() to duplicate the list of variables passed
but this function only exists in lists [1,2] and not tuples (1,2).

Instead of throwing an exception if the variables are in a tuple, simply
construct a new list using the passed sequence-like object.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/utils/commands.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 0bb90028dc6..cad0bea0be9 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -227,7 +227,7 @@ def get_bb_vars(variables=None, target=None, postconfig=None):
     bbenv = get_bb_env(target, postconfig=postconfig)
 
     if variables is not None:
-        variables = variables.copy()
+        variables = list(variables)
     var_re = re.compile(r'^(export )?(?P<var>\w+(_.*)?)="(?P<value>.*)"$')
     unset_re = re.compile(r'^unset (?P<var>\w+)$')
     lastline = None
-- 
2.11.0


