Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 06B1078293
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 13:04:22 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id y77so32734236ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Jun 2017 06:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=V5AJVnWLEgl9L5Vez0pPscpHSOzDt6iJpsM1NC/GOxM=;
	b=EEfejLgHXVlw8px8pYkcP1BY4BgB3uUdbPPekoLIipUkMOYEb6oPVH5n4A9+ATQ227
	9soptWHAQnx9WpupdziuUdjaak947QtYZXqY+LMd0HEnVEj1hNzgSXhYgsr8dx/Ylc7l
	nD30KrGO/ZVqW2/pXqUxtRLT5pOp6zgO9aVqOwon2fudT578B9jxbhoQIQEuRpm3qJ+T
	ddGuDkcXTGzPRLMqRW/+DsKTqbImje71jzduROKFWG3uKKxI85z7IJgu4iNb+AxisK+d
	D4OwUkBHZTSe1MjQ3w0sV9FmuNiMgTj9pSQzbBBPrOimUUwjAsRPLbyqUftFg6xwYsnb
	w3Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=V5AJVnWLEgl9L5Vez0pPscpHSOzDt6iJpsM1NC/GOxM=;
	b=tIotiCXTyH9yP5P94me4fms4tS6kx18FJvmpkifO4UD6N36EY0CgAqFxgahWj50ULJ
	QRGZAIvwEEiQ0yd8DW6GWxd/2jI4eS1XR/VXRnw070m9FZiwJ117KyTKfbpTKj+Qib73
	FoIFCjXkCPzgUMrub+7IZreptFeydi1kkjuKn/jIHOXewZH74pGXqZ1CHL59JWw9F7EQ
	1uVMTtUWeasJOW0LRVOxiGRvJOpR2zACtICbJscsPPVtAwzkrowakmNgdZzCyOLiPsPU
	JDJ9QJn4YOR7GU9XqWR9aAVH7t3kUOpdvJHfKwC0mBjg1+AQ2EKEzC1I9C9sLHRnahjz
	spwQ==
X-Gm-Message-State: AODbwcBcuz14KFOUPYOmW5i8n1bSVbmhT0FovWKSF3lRa3B5ni3qImZa
	UbDraA4bkPWgi98nNEI=
X-Received: by 10.107.142.135 with SMTP id q129mr22197604iod.186.1497013462443;
	Fri, 09 Jun 2017 06:04:22 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8C0DE.dip0.t-ipconnect.de.
	[93.232.192.222])
	by smtp.gmail.com with ESMTPSA id e81sm861643ite.6.2017.06.09.06.04.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 09 Jun 2017 06:04:21 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Jun 2017 15:04:04 +0200
Message-Id: <9e9f8785b3ae7dd86be3ee171a1807d7220da37a.1497013310.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.8ea05a588020117b72a57015f699c7acd76b93e6.1496849345.git-series.patrick.ohly@intel.com>
References: <cover.8ea05a588020117b72a57015f699c7acd76b93e6.1496849345.git-series.patrick.ohly@intel.com>
In-Reply-To: <cover.85d08ae286e0b2f8503f9e657148201e6b90edde.1497013310.git-series.patrick.ohly@intel.com>
References: <cover.85d08ae286e0b2f8503f9e657148201e6b90edde.1497013310.git-series.patrick.ohly@intel.com>
Subject: [PATCH v2 2/2] utils.py: helper function for optional include files
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
X-List-Received-Date: Fri, 09 Jun 2017 13:04:22 -0000

The main intention is to provide easy-to-use and read helper functions
for including files only when certain distro features are
set. Functionally they are the same as bb.utils.contains and
bb.utils.contains_any.

Distro features are part of the base configuration and thus safe to
use for conditional inclusion in recipes and bbappends, in contrast to
recipe variables which might still change during parsing. Therefore
the check is limited to DISTRO_FEATURES. This is the reason for having
this in OE-core instead of bitbake.

Default values are set so that no redundant parameters have to be
passed for conditional includes. As a secondary usage, the functions
can also be used in boolean checks.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/lib/oe/utils.py | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 330a5ff..822d0cd 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -126,6 +126,46 @@ def features_backfill(var,d):
     if addfeatures:
         d.appendVar(var, " " + " ".join(addfeatures))
 
+def all_distro_features(d, features, truevalue="1", falsevalue=""):
+    """
+    Returns truevalue if *all* given features are set in DISTRO_FEATURES,
+    else falsevalue. The features can be given as single string or anything
+    that can be turned into a set.
+
+    This is a shorter, more flexible version of
+    bb.utils.contains("DISTRO_FEATURES", features, truevalue, falsevalue, d).
+
+    Without explicit true/false values it can be used directly where
+    Python expects a boolean:
+       if oe.utils.all_distro_features(d, "foo bar"):
+           bb.fatal("foo and bar are mutually exclusive DISTRO_FEATURES")
+
+    With just a truevalue, it can be used to include files that are meant to be
+    used only when requested via DISTRO_FEATURES:
+       require ${@ oe.utils.all_distro_features(d, "foo bar", "foo-and-bar.inc")
+    """
+    return bb.utils.contains("DISTRO_FEATURES", features, truevalue, falsevalue, d)
+
+def any_distro_features(d, features, truevalue="1", falsevalue=""):
+    """
+    Returns truevalue if at least *one* of the given features is set in DISTRO_FEATURES,
+    else falsevalue. The features can be given as single string or anything
+    that can be turned into a set.
+
+    This is a shorter, more flexible version of
+    bb.utils.contains_any("DISTRO_FEATURES", features, truevalue, falsevalue, d).
+
+    Without explicit true/false values it can be used directly where
+    Python expects a boolean:
+       if not oe.utils.any_distro_features(d, "foo bar"):
+           bb.fatal("foo, bar or both must be set in DISTRO_FEATURES")
+
+    With just a truevalue, it can be used to include files that are meant to be
+    used only when requested via DISTRO_FEATURES:
+       require ${@ oe.utils.any_distro_features(d, "foo bar", "foo-or-bar.inc")
+
+    """
+    return bb.utils.contains_any("DISTRO_FEATURES", features, truevalue, falsevalue, d)
 
 def packages_filter_out_system(d):
     """
-- 
git-series 0.9.1

