Return-Path: <richard.rojfors@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id AE1487847D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jul 2017 08:39:38 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id d80so10950769lfg.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jul 2017 01:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:date:mime-version
	:content-transfer-encoding;
	bh=yuDPH/Pkz4CRhiD4CQlcD+T9m7KMDcKy+xbJXbG9Vy4=;
	b=LP/srS/VKpvRMfjJJxrXugtY83XEW10jzKQRoWrjXtNHbP8AHzjtwA7wTvlCso+Eht
	M1ghu8xW3KtONLNr95Rvw91VjZ8rZdTaEv7NY9lm3Q0uV9sG3tjOIRE/iCjERLr5CsR9
	St74YZfvdT288m1kSgIR5pmQpU0sPUnXa0w/yWLG+6BdMnSVO+5yBNjiw1zxm217lSw1
	B2LlfbjL2wyy57y6dKwopqe4FvYIfN5W3xPrIg7Hulr2s1TFn9UL+Nui8MXHok3R4GgZ
	dk5W3XF2wBySXXrrygTc94/1AzH9Ip2VFZoyt+T1Pf9uS5XizFZWHO2htZI1b06KXwH9
	GP2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:mime-version
	:content-transfer-encoding;
	bh=yuDPH/Pkz4CRhiD4CQlcD+T9m7KMDcKy+xbJXbG9Vy4=;
	b=mULm2313P1G7/nAPX6jhPASd3LPut8OMVYN7a6MmKl39zhRO/VFyu98RBF5VMj1NM6
	XHWwewhepepgXCRLndaEZ6uXvW+E9OXEtDNRRjaAZnYxNaYwHoH/QBs6f37siDxiG9Sf
	3kdgjNGeGoSloLCdTggxixu78F1FPXAQvqLQN2BeJbkgIoWJvUAh73Z/uvmNoWKygbJ2
	+WRlQwSxNQMmpfp6AImuJXHBtiURwQ/oms9jPMMcXueaRVPMfTw8RSQ1lm8CNOrcJn1K
	2rIKgFwYf5QemnFJkFvBZDR2c3oXXikoeTP1JmSEwM/ssPj7nQcDOsMxEbJhKhG3IdbB
	T60A==
X-Gm-Message-State: AIVw113ZTla63q2pYhmWmAoTEMsF5AoH+u56rdkFDYT9KTEEmlIrF0Xl
	lUXV7UoeUFpft95oC6E=
X-Received: by 10.25.221.77 with SMTP id u74mr4186442lfg.29.1501403979244;
	Sun, 30 Jul 2017 01:39:39 -0700 (PDT)
Received: from ellan7 ([213.115.5.18]) by smtp.googlemail.com with ESMTPSA id
	193sm3326453ljj.30.2017.07.30.01.39.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 30 Jul 2017 01:39:38 -0700 (PDT)
Message-ID: <1501403977.9238.2.camel@gmail.com>
From: Richard =?ISO-8859-1?Q?R=F6jfors?= <richard.rojfors@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 30 Jul 2017 10:39:37 +0200
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] package_manager: Fix support for NO_RECOMMENDATONS
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
X-List-Received-Date: Sun, 30 Jul 2017 08:39:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

When support for dnf was introduced the check of the
no NO_RECOMMENDATIONS variable got broken.
    
This fixes the issue by compairing to the string "1"
rather than the number 1.
    
Signed-off-by: Richard Röjfors <richard@puffinpack.se>
---
diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 72503eb9d3..518cf8dbe3 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -585,7 +585,7 @@ class RpmPM(PackageManager):
 
         output = self._invoke_dnf((["--skip-broken"] if attempt_only else []) +
                          (["-x", ",".join(exclude_pkgs)] if len(exclude_pkgs) > 0 else []) +
-                         (["--setopt=install_weak_deps=False"] if self.d.getVar('NO_RECOMMENDATIONS') == 1 else []) +
+                         (["--setopt=install_weak_deps=False"] if self.d.getVar('NO_RECOMMENDATIONS') == "1" else []) +
                          (["--nogpgcheck"] if self.d.getVar('RPM_SIGN_PACKAGES') != '1' else ["--setopt=gpgcheck=True"]) +
                          ["install"] +
                          pkgs)

