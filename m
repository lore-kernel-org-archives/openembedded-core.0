Return-Path: <joshuagloe@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id D817475CF1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Sep 2016 13:35:22 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id g202so9838790pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Sep 2016 06:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=rgJ9U+UxUoXbZCsmHRMFe6gXlfFE/6WUowGIHplaM4E=;
	b=lim2tTyxLzjG9kUNhYa5s1+vNuoeAeHRq+FvmvRZ0WSiKxm/pYwyFOOf4UJEG8yNCb
	nkI4ClzxtMRjt0ZHQQ/3OZo4x6oUsDhpq5KfdlMgx5MUs5euCA2gkH8ajMWn2AF4M4uy
	Qk5FY5sD+D0Ic1CdsgWg35YjBrIYzcXB7zKznRg7EHsTlxbWme2txVU6G0vPL4DqyXY6
	2TAbbbBDp8t5DyS2xLutjwUI7XFXJOxO2Y57OswnvQ3P/Upd9BsKkGNXS0D4+UWEFqEv
	AOVu74eqldgt/Ybn7zmx+P4ZC0IAYeY+65/C2EV3GKd8q/LfgnU5ZIN3oOWcBHmoGSxh
	guKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=rgJ9U+UxUoXbZCsmHRMFe6gXlfFE/6WUowGIHplaM4E=;
	b=hjT2JK578KJrSNQIRHLYdSzY+8a/7vVyoH4ztcM1BbMK6wpOXH7pesCpuccH6MvRFM
	ad6G2g11ebJIBra0edfz2P2mcHqdjOEa+y6SIXAMRWJvYC9/UA23ObEXZLto5jvWKj+V
	6EPjh8r3rJVCrys63nNE0x8WkUX5nYN5BEp3bnEWlysSX00n/HT3ojqUw3OmNWf4k+hj
	pTrWArFL13anatp0RXmryT1DlOkHTY88akxzNBOePRh3NRaKW0pexcn6Qzj8qm6Y3Frk
	MuQxr0hoAoq4ILuZ26zBe/8PiwNrnQwKD/P60SoKO3ilctJSt0zExhmpsbMumpwr2K9v
	PstQ==
X-Gm-Message-State: AE9vXwOGaEn1SxhfxOL1bJ1YkvZ2omvgX47XaBkIMZnd1pZpI4Px0N309EJ25xGkmUJXAg==
X-Received: by 10.98.222.5 with SMTP id h5mr55671591pfg.144.1473082523224;
	Mon, 05 Sep 2016 06:35:23 -0700 (PDT)
Received: from jlock-mobl1.ger.corp.intel.com ([192.55.54.42])
	by smtp.gmail.com with ESMTPSA id
	a71sm15312551pfg.38.2016.09.05.06.35.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Sep 2016 06:35:22 -0700 (PDT)
From: Joshua Lock <joshuagloe@gmail.com>
X-Google-Original-From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Sep 2016 14:35:09 +0100
Message-Id: <967bc92b0b4daec99210ebca7ef0b896ef22de38.1473064318.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1473064318.git.joshua.g.lock@intel.com>
References: <cover.1473064318.git.joshua.g.lock@intel.com>
In-Reply-To: <cover.1473064318.git.joshua.g.lock@intel.com>
References: <cover.1473064318.git.joshua.g.lock@intel.com>
Subject: [PATCH 1/2] oe.path: fix copyhardlinktree()
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
X-List-Received-Date: Mon, 05 Sep 2016 13:35:22 -0000

The change to preserve extended attributes in copytree() and
copyhardlinktree() (e591d69103a40ec4f76d1132a6039d9cb1555103)
resulted in an incorrect cp invocation in copyhardlinktree() when
the source directory contained hidden files.

This was because the passed src was modified in place but some code
paths expected it to remain unmodified from the passed value.
Resolve the issue by constructing a new source string, rather than
modifying the passed in string.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/lib/oe/path.py | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index 631c3b4..06a5af2 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -79,12 +79,15 @@ def copyhardlinktree(src, dst):
         # writers try and create a directory at the same time
         cmd = "cd %s; find . -type d -print | tar --xattrs --xattrs-include='*' -cf - -C %s -p --no-recursion --files-from - | tar --xattrs --xattrs-include='*' -xf - -C %s" % (src, src, dst)
         subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
+        source = ''
         if os.path.isdir(src):
             import glob
             if len(glob.glob('%s/.??*' % src)) > 0:
-                src = src + '/.??* '
-            src = src + '/*'
-        cmd = 'cp -afl --preserve=xattr %s %s' % (src, dst)
+                source = '%s/.??* ' % src
+            source = source + '%s/*' % src
+        else:
+            source = src
+        cmd = 'cp -afl --preserve=xattr %s %s' % (source, dst)
         subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
     else:
         copytree(src, dst)
-- 
2.7.4


