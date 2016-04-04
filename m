Return-Path: <bjorn.forsman@gmail.com>
Received: from mail-lb0-f172.google.com (mail-lb0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id 899AC7325A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Apr 2016 19:02:34 +0000 (UTC)
Received: by mail-lb0-f172.google.com with SMTP id u8so175210032lbk.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Apr 2016 12:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=l3vWdkT3jWohL9IOLfBVW20FdTuRoQMU0mHHRYEQF/U=;
	b=TFrVfbFWzbOqjrz7xePelBtK6b6ZJWXxvW1AtG0s79KZ1yyjBUQukQSkjbLy2X5EqE
	2B88PE6NPNk8bLxe4E7AvfZRjmtWIG+rTwhFyLN0P5n+Fo3636INAaZoy5yB0n6xkuD0
	qxV1BWWM7DVsp3eoEz3Hgtcbh+e+1PCkh32FwjZbf+2OI4PNutNuwbYO1l2LUN8oHSBY
	s8b0R4CH/NnNVws3IBCQVAby72oPCNPBvZa8yyxiI+dltDVQVCr1j6D5/0/oLDTmnE2d
	hFawkqCUYYSTQpIKey5ISZi+RDjBKqk3WtId9W4Gzc8bKIffoRK1aZyXAHm3bAspjkjc
	MiAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=l3vWdkT3jWohL9IOLfBVW20FdTuRoQMU0mHHRYEQF/U=;
	b=XzUBQlkYSfHNkn4UunRlpZ07xIT1mUou4lBbo2qDoRMvesm/2Q/Tn3zDzRfNypXMim
	4YI/a2o60FjrsTtT63KSBsGgkdizVDK3ks8mURwMBdqGOcGmESgNmpcxOyRETJysTQXi
	t6nAbN5yi0KbEfTy9Qy30++4OConSXc2VEBo9FaeZ2gtPjGx7I+mGdtEA5E6d/vUtyfu
	Wipxy29FwIe7b5AYCIe19D6FlOQcj24NGxzykctPh0eZoMZWbSCPT+O/TwydlJURye8e
	hFePujx1ZW4Z7UYLzZqsqjaR0aWz6rsiaehA5CSJtasOLHCANkM8Xu7XcyPRnS1dOggu
	2p6g==
X-Gm-Message-State: AD7BkJIgnfT80qwCXc9H0ApJs/WeSNtajaA7Ejfs8W01PWa3NyJNZGNBO+jGry3Tt/2fQA==
X-Received: by 10.112.13.33 with SMTP id e1mr5396676lbc.79.1459796554105;
	Mon, 04 Apr 2016 12:02:34 -0700 (PDT)
Received: from localhost (cm-84.208.208.120.getinternet.no. [84.208.208.120])
	by smtp.gmail.com with ESMTPSA id
	ez1sm4996645lbc.29.2016.04.04.12.02.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Apr 2016 12:02:33 -0700 (PDT)
From: =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Apr 2016 21:02:29 +0200
Message-Id: <1459796549-29882-1-git-send-email-bjorn.forsman@gmail.com>
X-Mailer: git-send-email 2.5.4
MIME-Version: 1.0
Subject: [PATCH] license.bbclass: fix warnings when run in unprivileged "container" env
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
X-List-Received-Date: Mon, 04 Apr 2016 19:02:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

An unprivileged "container" environment like this[1] doesn't have root
account (uid 0) which causes tons of "Invalid argument" warnings:

  $ bitbake ...
  ...
  WARNING: Could not copy license file [src] to [dest]: [Errno 22] Invalid argument: '[src]'
  WARNING: Could not copy license file [src] to [dest]: [Errno 22] Invalid argument: '[src]'
  WARNING: Could not copy license file [src] to [dest]: [Errno 22] Invalid argument: '[src]'
  ...

Fix it by handling EINVAL similar to existing handling of EPERM (which
was added for when not running under pseudo).

[1]: The real environemnt is buildFHSUserEnv from NixOS/nixpkgs, but a
  demonstration of the issue can be done like this:

    $ touch f
    $ unshare --user --mount chown 0:0 f
    chown: changing ownership of ‘f’: Invalid argument

Signed-off-by: Bjørn Forsman <bjorn.forsman@gmail.com>
---
 meta/classes/license.bbclass | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index ba95c9a..94be559 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -354,9 +354,11 @@ def copy_license_files(lic_files_paths, destdir):
                     os.chown(dst,0,0)
                 except OSError as err:
                     import errno
-                    if err.errno == errno.EPERM:
-                        # suppress "Operation not permitted" error, as
-                        # sometimes this function is not executed under pseudo
+                    if err.errno in (errno.EPERM, errno.EINVAL):
+                        # Suppress "Operation not permitted" error, as
+                        # sometimes this function is not executed under pseudo.
+                        # Also ignore "Invalid argument" errors that happen in
+                        # some (unprivileged) container environments (no root).
                         pass
                     else:
                         raise
-- 
2.7.4


