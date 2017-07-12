Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7057878096
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 12:43:44 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id c11so32101440wrc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 05:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=bB5ELG07FjaE2Dzzy+13s6zTd8eMwbaNnbj/nLoH12w=;
	b=cbkhet9BJV0/iQT03WRjWyaynNF2gE0J5UiAJ8GyFNC3yuvpDtiZou6mAoTPKQOWSc
	Ut5vd+L0KYTHJ41UIYHv2OHEtCWvFc56/GznFp0NLeXv1I7zMKqAcrtuxko2ThXvJO05
	AWLXHzN3ee0jQucUshu9gE6ASl7COZ87+pkbiuBdPuyjfUZiXYghrhHyECvHSHQr7QN0
	eAHGXAAZa87yjlga9ItepPbavz5/whhePP5ZyJBpXRA6XYlpDOVBGbQkeEik8yOiX6bX
	QEyJv2xP8U/rhY50ZW58NR84915TrWQJZ+W3W2eZ9H7TKMVlYPjXZ8xdswiOBbVnR4hs
	1+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=bB5ELG07FjaE2Dzzy+13s6zTd8eMwbaNnbj/nLoH12w=;
	b=TU+P5Rvxbo9m/Ys949Lpjrbe50Cc7+cRr+T+/67wvtEDIy+r+lH+KCu36UVhWViZjc
	4+hDrpOKA4zfUfBNecYbOm9NAWfPTPSQxjuXiww7kqeYnS+ThqOS0PVak9/4aCg8mbOG
	Mbo3MATzG28NLrpfSWDaianlJxiANf5ldS6wWySrSTsxuhP565W3QSr46omOdCHV7dZ+
	8OFzIjJ39Ev17bpcxGAmOHsWu7IY/Qs3RYi4mBA2wNlBHKPUIVG9Rs56HLbppGJLmFIU
	oXMU9DUHIabJ7fM8yfyaRl7TejF5acyilvlnHzm35qhI9gvMjnq5oDoekkEDDQEPy2sh
	RQyA==
X-Gm-Message-State: AIVw111yJz0cGc6VKeHjAb0/PnNMTylmuB1U9R5cySs9wH3DNGZ2CJv7
	h6zB2sDnrb7pZ7JZDmo=
X-Received: by 10.223.172.15 with SMTP id v15mr3014132wrc.84.1499863425662;
	Wed, 12 Jul 2017 05:43:45 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	r70sm2800052wmb.16.2017.07.12.05.43.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Jul 2017 05:43:45 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jul 2017 13:43:31 +0100
Message-Id: <20170712124331.12444-5-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170712124331.12444-1-ross.burton@intel.com>
References: <20170712124331.12444-1-ross.burton@intel.com>
Subject: [PATCH 5/5] lib/oe/sstatesig: exclude ccache-native from signature hashes
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
X-List-Received-Date: Wed, 12 Jul 2017 12:43:45 -0000

Enabling ccache should not cause a complete rebuild, so filter out ccache-native
from the dependencies the same way we do for quilt-native (so the world doesn't
repatch if quilt changes).

This doesn't effect the actual dependencies, just the dependencies that impact
the hash.

[ YOCTO #11417 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/sstatesig.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index b8dd4c869ed..5a4093266d4 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -29,7 +29,7 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCache):
         return True
 
     # Quilt (patch application) changing isn't likely to affect anything
-    excludelist = ['quilt-native', 'subversion-native', 'git-native']
+    excludelist = ['quilt-native', 'subversion-native', 'git-native', 'ccache-native']
     if depname in excludelist and recipename != depname:
         return False
 
-- 
2.11.0


