Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id CD8436C586
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2018 16:55:46 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id t3so23444457wrr.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2018 08:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=o9anI368OEg004p+NZo4XiqNJINq/tHb/1Y7bapM97M=;
	b=cs1d0bbrVKM/FmXK0Bw9LDfj1zfQjzA/Mw5vWqQ1PSxc7P8a6bExBC0r3El48eiOur
	h1ouWbntpIJMoRBpfVfObMxnLMsSr+lJm7BhUo7V9JxY/Hpst/SXZw+VPmpm3yL5Fb3v
	/IJVrSC6FF5zQa/ao64W0xOiTV7eCjLVHkox0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=o9anI368OEg004p+NZo4XiqNJINq/tHb/1Y7bapM97M=;
	b=aqj6SbdE0LzrbHyWwtpAYgc90lHoISaH7m5kK4m0OBHXdil3IgI78bKxcxPankq7dq
	vqKB65PEVODwe6kpgeIG/+07x02+eURyhDvfqVu1vqyw2htphBNbtR7M02JrfOV1MPb7
	FL7iaJRK/mypf9D/7zvGe9r2ndWI2N8HWqKoH6xd/5ZmYM8L03AbF4P18sVAbvSvxbuc
	bz2RjwtWMO8AjSiH2aBQ51E7vMv0uJvPfvxSTlbgyufXu2PJ4NfmeD0oQL9NNSeOsPjv
	egb856guCFR7xVaThxumxJ0PbvRYWaHGIgdlZS6W6ka7nr+I2hNSJZ1E7jttw1YqM9kH
	ikwg==
X-Gm-Message-State: AA+aEWbVRbl1+AFp1ktU7PkD1RMOGGLtLhSEA7CQ83ZbYMv3tFmZwpk2
	nLGp5zboSB6KqWG4FqCL+oAKrELJyLA=
X-Google-Smtp-Source: AFSGD/XxamMrAEt4Orxj580VzHGjxziYOOSfDE5egS1EdeEyl048bnHhnx8hn2DV9QcBi8XImMO7IA==
X-Received: by 2002:adf:a20a:: with SMTP id
	p10-v6mr20780712wra.249.1543337747193; 
	Tue, 27 Nov 2018 08:55:47 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	i9sm4606005wrs.34.2018.11.27.08.55.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Nov 2018 08:55:46 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Nov 2018 16:55:44 +0000
Message-Id: <20181127165544.20893-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181127165544.20893-1-richard.purdie@linuxfoundation.org>
References: <20181127165544.20893-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/2] oeqa/selftest/buildoptions: Improve ccache test failure output
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
X-List-Received-Date: Tue, 27 Nov 2018 16:55:47 -0000

The current failure mode doesn't show us what the logs actually looked like
and later cleans can lose them. Show the whole log in case of failure
to aid debugging intermittent problems on the autobuilder.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/buildoptions.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa/selftest/cases/buildoptions.py
index 4ebfdb71234..9b87e7fcfcc 100644
--- a/meta/lib/oeqa/selftest/cases/buildoptions.py
+++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
@@ -40,8 +40,9 @@ class ImageOptionsTests(OESelftestTestCase):
         self.add_command_to_tearDown('bitbake -c clean m4')
         bitbake("m4 -f -c compile")
         log_compile = os.path.join(get_bb_var("WORKDIR","m4"), "temp/log.do_compile")
-        res = runCmd("grep ccache %s" % log_compile, ignore_status=True)
-        self.assertEqual(0, res.status, msg="No match for ccache in m4 log.do_compile. For further details: %s" % log_compile)
+        with open(log_compile, "r") as f:
+            loglines = "".join(f.readlines())
+        self.assertIn("ccache", loglines, msg="No match for ccache in m4 log.do_compile. For further details: %s" % log_compile)
 
     @OETestID(1435)
     def test_read_only_image(self):
-- 
2.17.1


