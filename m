Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id B8A9B7F344
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 10:57:32 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id c3so16961893wrd.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Sep 2019 03:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BjtuJTaObvcpgMzFjMO4yfnNBc8CTe1wND4m4pr5EYA=;
	b=X2ajwn64CrmQpUGrdEWEslLDFC7k7FhYJfkvElB5cVqir8DqhvLcEceNFUJWEnaKwO
	y0CpyyytGCMApKTHyPphcEmy/ehuQK0EA6mOgnYc8Ziv31SWoqacoluigsdaxiTz5gtr
	szu9Tv8FblHScSYsXdxNFYJEOGn/Gm4nYJJYojDX9EDW92s/KuQKCXymiA7vXgiLTbvW
	wrkEhqaehw3pLC8myCrDKWP/vbiGSRIeK2NfPiWC3JvohjXthiztJ3kITXYbqbK4K7MA
	xi8tg/jdErEbgmFCx8LuPBGKSFiLUetbZHID0WMc4opO0j/Db5tFnNquq7WPNTQX85vf
	PW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BjtuJTaObvcpgMzFjMO4yfnNBc8CTe1wND4m4pr5EYA=;
	b=E/TjWjyL5he5IlRxrMjHLri85FPWckUafysaFggq36H3nbNVFiNssnV9AKycW1Vy0f
	o5br/KYQ2mp5CR9Jh3tOlNUioPMYDBObZKUkd6XhY3Wh3xgVtKD7ok4n9EBobiau6uY+
	hcTWSZmeGoc9Cz0KbgG/cllM2Ry65GjeGoK8l9NuqRgKLGulE1QztUK2R6eWBYx1bNWR
	lir3OpgwyPWeCJm3AeBWhWk9iw9id6m4ARr3MkUdbJdIHfQHvWR2vrZzzftmCleYvVdk
	GyCG3sHOG2+BdFvBJFt7Zvbv9Yb/kMZTwBxWckPrB+YTbYiCIYhHHGwp7GB9QzHPRE7v
	GWZQ==
X-Gm-Message-State: APjAAAWRnylwXV3NwIhabU4hvR1mcsCEQ1MMAdTdJFl89rV/FmXmS/zy
	RaQ8uxjHMwy0JTn4PYsEcPqHfgJxnak=
X-Google-Smtp-Source: APXvYqzEh2cfm4pnpt6skVU+6fuLtYENSR727xcTZ4UuD4wr0FPb5naGFfRp4GlUesZ7MNWBX2jYFg==
X-Received: by 2002:adf:e44d:: with SMTP id t13mr36506381wrm.240.1567508252964;
	Tue, 03 Sep 2019 03:57:32 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	o9sm14008691wrm.88.2019.09.03.03.57.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Sep 2019 03:57:31 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Sep 2019 11:57:29 +0100
Message-Id: <20190903105729.13043-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] libedit: remove FETCHCMD append
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
X-List-Received-Date: Tue, 03 Sep 2019 10:57:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This dates from when upstream was for some reason refusing the wget user agent,
but this isn't the case anymore:

$ wget http://www.thrysoee.dk/editline/libedit-20190324-3.1.tar.gz
...
HTTP request sent, awaiting response... 200 OK
Length: 521999 (510K) [application/x-gzip]
Saving to: ‘libedit-20190324-3.1.tar.gz’
2019-09-03 11:53:20 (1.22 MB/s) - ‘libedit-20190324-3.1.tar.gz’ saved [521999/521999]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/libedit/libedit_20190324-3.1.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/libedit/libedit_20190324-3.1.bb b/meta/recipes-devtools/libedit/libedit_20190324-3.1.bb
index 85855411868..25667ccce7c 100644
--- a/meta/recipes-devtools/libedit/libedit_20190324-3.1.bb
+++ b/meta/recipes-devtools/libedit/libedit_20190324-3.1.bb
@@ -10,8 +10,6 @@ DEPENDS = "ncurses"
 
 inherit autotools
 
-# upstream site does not allow wget's User-Agent
-FETCHCMD_wget += "-U bitbake"
 SRC_URI = "http://www.thrysoee.dk/editline/${BP}.tar.gz \
            file://stdc-predef.patch \
            file://0001-readline.c-fix-cannot-get-history.patch \
-- 
2.20.1


