Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 3346F6C586
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2018 16:55:46 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id x10so23442032wrs.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2018 08:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=dxMZQ3FfAhsbE3zlgHOYtGWPihjTwmvl3MTMwcb1qQc=;
	b=YA7W7LV40g0ZFMbGhxV9IzN8LkZKvclzufXEBDtF+a4sQD2tJ7lzOC8FpGIvqxfYQM
	FY+XLyjnCfcFPTgkAyDV8rEsrr0FQ1RgRx26SE9YkH8gxlEpmPLp2UduEvwKWopIvaYx
	BDvyal+e2aqoaUt8BwrXUoxVUns1fYFZZeuq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=dxMZQ3FfAhsbE3zlgHOYtGWPihjTwmvl3MTMwcb1qQc=;
	b=JSCeW25G6k5Z+fxc0NRRBF0I3XVrzkqN9hoSNSGXRbXuu3XXCRbVVrD/qPDkMxHM6X
	rTB1dv6BxZdhOrInUzEY3ES6BQ438wHCgDh1RfslaPu7Jn2RKp3pGEjnhFW1niWSxLU3
	pgpQto1R4Ijd3OX4jn+v8dtAZ67Sbnwn8D73DDYudxtjaEIsyNT+71/1ixsgNLVGx4di
	fLilXG5YlGmWIbU8VLseP/7mt8PXnhW9o2hTnA49v7Zoma3mH/183zTlK9SlA0iOEIqh
	BTDYmuS3vz0Onredv23suz65tiFIl6NQlyREMg8lqBW/R983LPu8ohOeV7EsEmDeCc27
	9FxA==
X-Gm-Message-State: AA+aEWYWLz1+j7As0Wnt2df3bPhNztlVuc3B0a5an0lrZ6QHaLKwQfky
	t45NlXb8l++nbP7wwWq3Y7o7PJX9JaM=
X-Google-Smtp-Source: AFSGD/XyT9CVarQ2S47Ljx5L/u0LINs2O1QELOsELMNuLVRgNwU+Dzr1ownugINygZLtsOtcrNgueg==
X-Received: by 2002:adf:e149:: with SMTP id f9mr30451582wri.42.1543337746317; 
	Tue, 27 Nov 2018 08:55:46 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	i9sm4606005wrs.34.2018.11.27.08.55.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Nov 2018 08:55:45 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Nov 2018 16:55:43 +0000
Message-Id: <20181127165544.20893-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] oeqa/selftest/case: Use bb.utils.remove() instead of shutil.remove()
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
X-List-Received-Date: Tue, 27 Nov 2018 16:55:46 -0000

This avoids problems where shutil.remove will error with:

  File "/usr/lib/python3.5/shutil.py", line 436, in _rmtree_safe_fd
    os.unlink(name, dir_fd=topfd)
FileNotFoundError: [Errno 2] No such file or directory: 'S.gpg-agent.extra'

when there are races over file deletion (gpg agent may be slow to exit).

We already worked around speed and race issues in bb.utils.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/case.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/case.py b/meta/lib/oeqa/selftest/case.py
index 7a90a6b9758..9c08d595efd 100644
--- a/meta/lib/oeqa/selftest/case.py
+++ b/meta/lib/oeqa/selftest/case.py
@@ -12,6 +12,8 @@ import oeqa.utils.ftools as ftools
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var
 from oeqa.core.case import OETestCase
 
+import bb.utils
+
 class OESelftestTestCase(OETestCase):
     def __init__(self, methodName="runTest"):
         self._extra_tear_down_commands = []
@@ -167,7 +169,7 @@ to ensure accurate results.")
         if self._track_for_cleanup:
             for path in self._track_for_cleanup:
                 if os.path.isdir(path):
-                    shutil.rmtree(path)
+                    bb.utils.remove(path, recurse=True)
                 if os.path.isfile(path):
                     os.remove(path)
             self._track_for_cleanup = []
-- 
2.17.1


