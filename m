Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2E88579B2D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 16:50:10 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id y16so30501112wrw.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 09:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=6ZSd9W7qojyJN+ep/SudWkEwrH3eWef7ZvLeYh40Zrs=;
	b=fhNSrqZtsgICzC6170tQoHiYMMQaCobSJwQy1PzyepSC0pvoGuZVski6tA7b3cIEVW
	FSAyVshxm6NUOJNlwWJTCK6EDnasFfeAwPKVa9owaUQ2jKGgYPVBKpBqEHQbhPhXKyLD
	bBvd4cDjNPKeTVUDbCDAUJX564IegPHqt7GytKWiSxKsbbLUrnzbEX2G/DQFQgMF2gKb
	NsxtzdUU+coSkK4RhIqUA5iUPDjx/x7o12XWfOapv1mPB5yrizdFihKSh+8t88hObM2z
	07ng9LLNf6vg4b4l0rc6FZVzJ56Ud9q1uRyL9Km6ltBCSuqa/ct0le04aZ6AhqydKmMJ
	nhGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=6ZSd9W7qojyJN+ep/SudWkEwrH3eWef7ZvLeYh40Zrs=;
	b=FQBgXEZSTLBx2baXIJQENTTjbY+R1BgQOO1TvrJcJnd9OqOOjC4Lp1GzxLdnNY3PrM
	l0a/awNBHWHEtJDFlprT1XXTaPVO94sZVg2TPujbVTsL+oIWTX0/auj/gFte+HlQmvVw
	l48P8GdGfg+C+igstMwUyT7G8II3ZhYrvOHx9+JVrbyDCv0gJdD2GPU7ew08WmSPH3zZ
	EF/6NjBZVwJ5H2Grhfr0pco/pkyG4yGr/BOBLBdUMpzH5UzHGTfsxujByzNPQxf6FtDN
	/rG7+txJY+z8kLKuSM6Nw9BTK65aXfEebV6qyQsjiX6WxshUwj0p8Fr8HlS9lM5zVlRB
	JPag==
X-Gm-Message-State: ABuFfojCyLQ3rFV6ZtbCWn63bA7J+xdd+9yZXt6TxPY7bQXy8ooK1qOo
	muZoQ7dhyXFVb+Yq/9pW9dggf5DajM0=
X-Google-Smtp-Source: ACcGV63+/m4h+WBpEQl89TXbS2w2P8T8guVFWOQj/jEunjy7lOeQsbYEku2LXQIpv//J3dM/5wFmEw==
X-Received: by 2002:adf:d249:: with SMTP id
	o9-v6mr22721382wri.66.1539795011311; 
	Wed, 17 Oct 2018 09:50:11 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	h63-v6sm1413480wmf.31.2018.10.17.09.50.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Oct 2018 09:50:10 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Oct 2018 17:50:08 +0100
Message-Id: <20181017165008.5385-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] package_manager: implement PACKAGE_EXCLUDE for opkg
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
X-List-Received-Date: Wed, 17 Oct 2018 16:50:11 -0000

opkg has supported the --add-exclude option to install since 0.3.0, so use it to
implement support for PACKAGE_EXCLUDE.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/package_manager.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 1ab3761c24a..b32d6464b21 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1334,7 +1334,11 @@ class OpkgPM(OpkgDpkgPM):
         if not pkgs:
             return
 
-        cmd = "%s %s install %s" % (self.opkg_cmd, self.opkg_args, ' '.join(pkgs))
+        cmd = "%s %s" % (self.opkg_cmd, self.opkg_args)
+        for exclude in (self.d.getVar("PACKAGE_EXCLUDE") or "").split():
+            cmd += " --add-exclude %s" % exclude
+        cmd += " install "
+        cmd += " ".join(pkgs)
 
         os.environ['D'] = self.target_rootfs
         os.environ['OFFLINE_ROOT'] = self.target_rootfs
-- 
2.11.0


