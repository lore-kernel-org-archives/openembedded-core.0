Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 654C860745
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 12:19:10 +0000 (UTC)
Received: by wmec201 with SMTP id c201so157657189wme.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 04:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=2VWLxSLu/csq9Q3u2pelDaC5lbqXd8QiCNtMeFzdNv0=;
	b=In6Eex7Mkfqr8Dc5As/NjMBsCGThR93879hUV95xSB+DupIq+qHTRPkreaXbtVzH8E
	fjp7y9XkB+5CsWnl9SRg+Jz1aYjXge9H957r6bl35GUA8s/tewbHpZ+MGS8BaRebf1Rf
	IT53MA6PiXlOJhxCt8Gib/6T0EYXVAGI4R6b5ry1EhVBITNN+kjTXD4ADz6flZOfIDwc
	ZEo/MGV+snfCm4vRfTOajwjW/IbGuIA0qyGFNzG97UMrCTzx6IX8BK4zYmszPqKQdK1n
	AI1pgJZz7s4Hd27krPhPwiYVU+Cw/tawKUX0QN8g1p+pMC5KGdZsoQR8jYAR19146UgQ
	Q90w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=2VWLxSLu/csq9Q3u2pelDaC5lbqXd8QiCNtMeFzdNv0=;
	b=JNADksSlba+m0aU1S3mcUzLhstBvhNkILYhYSgFjlOEHpctOGxsbekplrMS6zqEtzu
	lrbzbj6zBSOGi0175cP49WUB/KajpXcXBAuWYdT+pvkVEGUn9n2UOkBJOjwEV5KqCE7F
	SMtzqhAZDVHl+czAy0SO9OnME6DIhYSKM+OC3TRAwqELnNUwAYvuPc2hvhK4AtRHjp7A
	sGV/l3GqRnHdeb6xV1yesINC6ZwabdV/EA8pbmYfH5FdQDelcv4uGa7hZU/N0Cnpod4Z
	Hg/UzOxjNCtPhsPiSjCHUZ7N865PXAKZsHEsMNwuBmJmKhIrWOXxCuUQFJtZr/ODK4lY
	lBPQ==
X-Gm-Message-State: ALoCoQnzVrNl7I49ie3Mr7/3MMI2cWBgFEqTU1DUKg0KKC/qTO/cnA5SADGWxkyLfdZjR1KgbGKf
X-Received: by 10.194.192.106 with SMTP id hf10mr29983013wjc.131.1448281151099;
	Mon, 23 Nov 2015 04:19:11 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	k125sm6258257wmf.2.2015.11.23.04.19.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Nov 2015 04:19:10 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Nov 2015 12:10:27 +0000
Message-Id: <1448280627-22439-4-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1448280627-22439-1-git-send-email-ross.burton@intel.com>
References: <1448280627-22439-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 4/4] sanity: don't enforce DISPLAY for testimage
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
X-List-Received-Date: Mon, 23 Nov 2015 12:19:11 -0000

Now that qemurunner doesn't need DISPLAY set, let whether DISPLAY is set be up
to the user.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/sanity.bbclass | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index ae86d26..ad9dda8 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -749,14 +749,6 @@ def check_sanity_everybuild(status, d):
 
     check_supported_distro(d)
 
-    # Check if DISPLAY is set if TEST_IMAGE is set
-    if d.getVar('TEST_IMAGE', True) == '1' or d.getVar('DEFAULT_TEST_SUITES', True):
-        testtarget = d.getVar('TEST_TARGET', True)
-        if testtarget == 'qemu' or testtarget == 'QemuTarget':
-            display = d.getVar("BB_ORIGENV", False).getVar("DISPLAY", True)
-            if not display:
-                status.addresult('testimage needs an X desktop to start qemu, please set DISPLAY correctly (e.g. DISPLAY=:1.0)\n')
-
     omask = os.umask(022)
     if omask & 0755:
         status.addresult("Please use a umask which allows a+rx and u+rwx\n")
-- 
2.1.4


