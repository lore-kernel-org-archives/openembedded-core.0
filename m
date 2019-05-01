Return-Path: <jpewhacker@gmail.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3CB257D8EC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 May 2019 20:35:27 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id o39so140121ota.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 May 2019 13:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=kIXv/7TP3MXKs5wGbodnk/XqkcmeAC3093WoDqWOgk4=;
	b=ZFEhpFzvn2DBVV6JVR74bCt3LVOb30wo7rbV90ALqc+sFURy0ME+dTLpBPYOMVqsZt
	V1tpsQsjv36GMhzk3qNnaT/DeUATpQtKju0VCIXd/zoQ469pd1M85j340ZwgGy/MRH/Z
	JCZM7n/y8ECqt5e7EkmTMTZingRT5addgTnrCdGBJdegExC4EGMYrXFS3VHvqHXKgdRb
	1Y4SFag/eKaOCeCKdbWDdBJn0E2o7NA0qx1amFFGd6Tr6f+sMrircFors920Akxk2j4C
	sMAQmTryesMS7q9MFv/0G7wRyqSD3QwQoW/swxd5s1Zv/crUtHnnQkqbwXgoZJmhF4Qg
	9PIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=kIXv/7TP3MXKs5wGbodnk/XqkcmeAC3093WoDqWOgk4=;
	b=GUJE4Y44CwvCYLrwEmIfx5Cii/F926aqB+NLQelw7C6ZzGZ/fFSOJ0J+AhOHwf+glA
	H4+utQ5Fq46alLb4ROx+rNMWFccMa868CVvFuiNHmr0zQ0LT98Mjtd4B3bMnSwH/JyOB
	OERu15ZnB/LJaMsuXch+RKsLz19auUi5Nj2il2S6MRgrJjDEOWUHsX5NtTPUpkw2OSh0
	+dbKyT7o75q0qH4aoL0jpE7w5QlrtDdM1M4+RchbY7RmB4PjufNEcNMgG40CQlapUsMt
	jySVsal/eZd3ELZdINVG0t0OtOUXu1ZSWRe+4m8vpqI5COi51TMfnMMpdK33MAIkzUkU
	ILdw==
X-Gm-Message-State: APjAAAXKfrXrhPQjh2TLhVlwcVSAMnp+b05bBRWy1l0czTOYJpFk9/Ri
	JVAAc74C7fgEyRHikW5nhGw2P56JUfo=
X-Google-Smtp-Source: APXvYqzyQRaZc3+WWPv+pUnUppuRRTd6isUISF6ADWxMTl6zKx4iLWGxMvSUQbEEgG88gmFqFc/ILg==
X-Received: by 2002:a9d:2c45:: with SMTP id f63mr7296743otb.349.1556742927871; 
	Wed, 01 May 2019 13:35:27 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	i203sm8636857oif.32.2019.05.01.13.35.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 01 May 2019 13:35:27 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 May 2019 15:35:23 -0500
Message-Id: <20190501203523.4833-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: trini@konsulko.com
Subject: [PATCH] bitbake.conf: Account for older versions of bitbake
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
X-List-Received-Date: Wed, 01 May 2019 20:35:27 -0000
Content-Transfer-Encoding: 8bit

Older versions of bitbake (prior to 1.42) don't expose the BB_UNIHASH
variable which is being used by sstate. For compatibility with these
older versions of bitbake, set BB_UNIHASH to BB_TASKHASH (which is the
value it should be for non-hash equivalent aware signature generators).
if bitbake hasn't already set it.

[YOCTO #13314]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/conf/bitbake.conf | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index d35a6f64d97..14b0764f222 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -901,3 +901,9 @@ BB_SIGNATURE_EXCLUDE_FLAGS ?= "doc deps depends \
 
 MLPREFIX ??= ""
 MULTILIB_VARIANTS ??= ""
+
+# Older versions of bitbake (< 1.42) don't set BB_UNIHASH. For compatibility with these
+# versions, set BB_UNIHASH equivalent to BB_TASKHASH if unspecified, which is
+# what it would be anyway if the signature generator (e.g. OEEquivHash) doesn't
+# support unihashes.
+BB_UNIHASH ?= "${BB_TASKHASH}"
-- 
2.20.1


