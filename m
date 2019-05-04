Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id 113CE7D7A0
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 May 2019 15:27:51 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id y3so4174092plp.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 May 2019 08:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=c6tBHrrEn/doOF5f5FpFo0G+SMhAMGc6XmMQy1VSEaY=;
	b=otYeE6HkI+C1e93JdmfqHGw4+CA140Sgwb5BwsLckXcdbssfjoVFjkQhiLjWo9aYuY
	jd8grygwmIQwM7UFHLFTkPmPtAMkhRxp78p9DidytVvnggq3i1u2M/rV0YC14jtzXhJB
	JGp+uTWoMeZW3/gDugXZdXor8bq+5NI63TiT+Oqrbj6SVnJJ82mUj6qWF/y1KWKt89dJ
	zbYMcevDjhKqnqyj1zFJBmTPGF5he3tkeGhQLxKoUUZ0mL2mOr5FHMTxYePGNWpzZFcj
	Nz7x4PfOOPn1Ofdz9tfDU8+lpbNdOwpVc+LqBBwz2Fh4Ih8jlw0SAQm5tUx1J0d9G0Nl
	PVVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=c6tBHrrEn/doOF5f5FpFo0G+SMhAMGc6XmMQy1VSEaY=;
	b=PusKTHdd7qn6qMMMRxZEJY/2arf5JyXRRiqhTCLCkfa1fP9G7UbzF9ac4ntw0YnhzP
	jZkw9FjbHx27+Un4nM4k56h6R0zMBL+psrd329RTjV7IraRhD/wD5Sob4WbBbVaDJNTL
	IxSQsa+Vc9fSNVK6LBrPfUqK+4xK9X+ZtcvIxQFsuYQzklCWH9V9cWAhSLX0vqiK+KKp
	uIW8Gricg/M5KMmUsQGT+tpKfuiwhh5svgGCJ/P8VAP5GXi+Ie9aiz9G5Y9SP1W4fENM
	TRmrWKZ17yGktMHiRylgveLwLllwQn9E4Sb89meLPqGolCkFlsEOy250xF+gqvYkn81f
	iVPg==
X-Gm-Message-State: APjAAAVph5IymdrLumAXSdjRk1YGPESCxDZ7vRCd5R70XTlj5kvZZAZ7
	SKsDTH+WX9NE00l6aqrBwSC4uc7L
X-Google-Smtp-Source: APXvYqz0Kx3H1nkG8GPObBR85/Q7JaRnEzttnRanWhyT/aotZPf8fklj+JHuz5XbYYPwBywVTIWQbw==
X-Received: by 2002:a17:902:201:: with SMTP id 1mr19524615plc.89.1556983672996;
	Sat, 04 May 2019 08:27:52 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:e5bb:fdcb:954:875c])
	by smtp.gmail.com with ESMTPSA id
	k12sm6394214pfk.86.2019.05.04.08.27.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 04 May 2019 08:27:52 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 May 2019 08:27:03 -0700
Message-Id: <c27cc2355d331e063f170b45728671988a967deb.1556983501.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1556983501.git.akuster808@gmail.com>
References: <cover.1556983501.git.akuster808@gmail.com>
Subject: [PATCH 27/43] utils/multiprocess_launch: Improve failing subprocess output
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
X-List-Received-Date: Sat, 04 May 2019 15:27:52 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Output before this patch:

ERROR: bash-4.4.18-r0 do_package_write_ipk: Fatal errors occurred in subprocesses:
Command 'PATH="X" opkg-build -Z xz -a "--memlimit=50% --threads=88" Foobar /media/build1/poky/build/nodistro-glibc/work/core2-64-oe-linux/bash/4.4.18-r0/deploy-ipks/core2-64' returned non-zero exit status 1.: Traceback (most recent call last):
  File "/media/build1/poky/meta/lib/oe/utils.py", line 272, in run
    ret = self._target(*self._args, **self._kwargs)
  File "/media/build1/poky/meta/classes/package_ipk.bbclass", line 230, in ipk_write_pkg
    shell=True)
  File "/usr/lib/python3.6/subprocess.py", line 336, in check_output
    **kwargs).stdout
  File "/usr/lib/python3.6/subprocess.py", line 418, in run
    output=stdout, stderr=stderr)
subprocess.CalledProcessError: Command 'PATH="X" opkg-build -Z xz -a "--memlimit=50% --threads=88" Foobar /media/build1/poky/build/nodistro-glibc/work/core2-64-oe-linux/bash/4.4.18-r0/deploy-ipks/core2-64' returned non-zero exit status 1.

Note how stdout/stderr from the failing command isn't shown.

After this patch:

ERROR: bash-4.4.18-r0 do_package_write_ipk: Fatal errors occurred in subprocesses:
Command 'PATH="X" opkg-build -Z xz -a "--memlimit=50% --threads=88" Foobar /media/build1/poky/build/nodistro-glibc/work/core2-64-oe-linux/bash/4.4.18-r0/deploy-ipks/core2-64' returned non-zero exit status 1.
Subprocess output:Foobar
*** Error: Package name Foobar contains illegal characters, (other than [a-z0-9.+-])

opkg-build: Please fix the above errors and try again.

We suddenly get a much more usable error message. The traceback is supressed
as its distracting from the real problem in this case.

Ideally python itself would handle this but it doesn't so we have to
wrap the exception. We already do this in bitbake itself for the same reason.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oe/utils.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index a4fd79c..5925181 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -324,7 +324,12 @@ def multiprocess_launch(target, items, d, extraargs=None):
     if errors:
         msg = ""
         for (e, tb) in errors:
-            msg = msg + str(e) + ": " + str(tb) + "\n"
+            if isinstance(e, subprocess.CalledProcessError) and e.output:
+                msg = msg + str(e) + "\n"
+                msg = msg + "Subprocess output:"
+                msg = msg + e.output.decode("utf-8", errors="ignore")
+            else:
+                msg = msg + str(e) + ": " + str(tb) + "\n"
         bb.fatal("Fatal errors occurred in subprocesses:\n%s" % msg)
     return results
 
-- 
2.7.4


