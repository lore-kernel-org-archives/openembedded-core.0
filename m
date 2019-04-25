Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 193767D8EA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2019 13:58:26 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id a12so7228597wrq.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2019 06:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=VO4CtZ3vdRUoDFCMHuokQLyfjqDdyXhu+i6XjHuGcbI=;
	b=XmOwVbZqaug15LLneIcTv5V2VDJPXyWL78cEkaqNyzTWUHqo2dQxtG+iAau2FJe6VY
	T+kK0MuMYT4d8EI1Z/8M11h0+jX+/4b/e248PLeCde/q0P2nbdP4wbvXw0H0RgVejFKG
	coeSBwvRt7pqRV6+/xEUEn3vGhY1wAhP3d+jA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=VO4CtZ3vdRUoDFCMHuokQLyfjqDdyXhu+i6XjHuGcbI=;
	b=eaMl56tztWzcXnE6H/wPAFagHdkUINZ+b/zkyShBaS2UrIceQ2vl2uuZdkC+nwcMK0
	vPRAJ3HIdy8tOiOynWP53YhH0Txy7aOApF9CDny7f4UXT1w/GpPOHzcmZKGQ/1lJf8bv
	j6cpdYRtW+YJXb4r91cPikCXjan4X27twhh8Ju337ZCBLBS3mUXY5gfgcJ6oEeoR2Xmz
	qCmKqYEXWmiLJntxLzcvZ7hfn6xlI/eyIHU+2kKCUU3CF9GZ78++FS3X0/jDqjgV8vve
	cxvRXwU/xe6qI+A06TRcf8g6He8o6BP3CpMSqd1RcGshS7QO+AHTkMff43iwtXP+iSCC
	nLhQ==
X-Gm-Message-State: APjAAAUdWp/GpCpX+703Xf6rsGnOPK/icsr160cYoyGxEUUpcQh/GiH7
	hHs9+uij2qg1saPYZzdTma0cVEzTR6k=
X-Google-Smtp-Source: APXvYqxvmJ4MsLr+qk6M2CmoOzBiLNXcDfX7nkiBje968YU7JwWp6HqrAT+raBCHAFQHSaXst/2ntw==
X-Received: by 2002:adf:ed90:: with SMTP id c16mr24849731wro.74.1556200706630; 
	Thu, 25 Apr 2019 06:58:26 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u17sm40951861wmu.36.2019.04.25.06.58.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Apr 2019 06:58:25 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Apr 2019 14:58:24 +0100
Message-Id: <20190425135824.9517-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] utils/multiprocess_launch: Improve failing subprocess output
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
X-List-Received-Date: Thu, 25 Apr 2019 13:58:26 -0000
Content-Transfer-Encoding: 8bit

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
---
 meta/lib/oe/utils.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index a4fd79ccb21..59251810d43 100644
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
2.20.1


