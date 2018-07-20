Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id 4697C7885C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 10:39:57 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id t6-v6so10849079wrn.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 03:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=1O8OAoCn/nlPF/uYsfcHHbHMcAojJfAPJtOagrUxw9A=;
	b=gWqi03eRMokJn1cgArQjMy938gMM26cZqGtO5ZHSkpUrvTEno7E5F+CxpOZlQZGBvr
	wZX2Y8J1Lc1d2GRXcbG7RheFHqXwLbwbiMgiBGJEVO2fqFKd0gUP+zTPS4RUb9DkYFkC
	eJGZsPyZf8e5UeK4d/bHPEBFmHyNOzBNQuao0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=1O8OAoCn/nlPF/uYsfcHHbHMcAojJfAPJtOagrUxw9A=;
	b=jVadAc4ERpnSMDslT5uIEMVVL239ish0oeAKthmdUKPEjHwGMXqE0LIQDoSlzo4qhN
	wqfkuJA37hxTc8kOmhFy1r6tLGpbw/qzF3gjwwQDDBAkjU4e6uGS1DOafNZsXS9RlwQu
	e9ixhf0iClSIhvYo2tDw+vlnM1BwMTGPHk/Pgl9sk9kBi9OqYb1YnP5+o0fLEakdXhDz
	CaTJVRwiE58rGvAbfx6zqmYxj2m5R4zHoFoVI+lBIhilzYrc1NMJDNNKL1bd6CaYKSFl
	LGSS+Z2CgCNP/CUSgOfsWp9HWYyU9fI5c9LON+cgHA+YbMFjUdR5imjbGz3jidhStYqz
	wCrQ==
X-Gm-Message-State: AOUpUlHWDPhrp7d9XnQCeYLKFBB0yYA4YsFwbLLGXYA6CZ1zRw6ghlih
	kxVNtQups8g2ZrSZCKGQUECthdlk5iFwJQ==
X-Google-Smtp-Source: AAOMgpeGtXdloFOqHqaAF9M3HEyshIc5+wKfADYNeCq8QAsRiq/mRxbEz8gJyxW1di4F1DpsarO50A==
X-Received: by 2002:adf:de84:: with SMTP id
	w4-v6mr1164256wrl.270.1532083197809; 
	Fri, 20 Jul 2018 03:39:57 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t184-v6sm1204848wmf.18.2018.07.20.03.39.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Jul 2018 03:39:56 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jul 2018 11:39:44 +0100
Message-Id: <20180720103948.30044-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180720103948.30044-1-richard.purdie@linuxfoundation.org>
References: <20180720103948.30044-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 06/10] package: Allow parallel processing of debug splitting
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
X-List-Received-Date: Fri, 20 Jul 2018 10:39:57 -0000

Adjust the code so that the splitting of debug symbols from files happens
in parallel. To to this we need to move some path handling code into the
main function and pass more parameters in.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 02914b52bb1..03fe18de580 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -367,10 +367,12 @@ def append_source_info(file, sourcefile, d, fatal=True):
     # of rpm's debugedit, which was writing them out that way, and the code elsewhere
     # is still assuming that.
     debuglistoutput = '\0'.join(debugsources) + '\0'
+    lf = bb.utils.lockfile(sourcefile + ".lock")
     open(sourcefile, 'a').write(debuglistoutput)
+    bb.utils.unlockfile(lf)
 
 
-def splitdebuginfo(file, debugfile, debugsrcdir, sourcefile, d):
+def splitdebuginfo(file, dvar, debugdir, debuglibdir, debugappend, debugsrcdir, sourcefile, d):
     # Function to split a single file into two components, one is the stripped
     # target system binary, the other contains any debugging information. The
     # two files are linked to reference each other.
@@ -379,6 +381,15 @@ def splitdebuginfo(file, debugfile, debugsrcdir, sourcefile, d):
 
     import stat
 
+    src = file[len(dvar):]
+    dest = debuglibdir + os.path.dirname(src) + debugdir + "/" + os.path.basename(src) + debugappend
+    debugfile = dvar + dest
+
+    # Split the file...
+    bb.utils.mkdirhier(os.path.dirname(debugfile))
+    #bb.note("Split %s -> %s" % (file, debugfile))
+    # Only store off the hard link reference if we successfully split!
+
     dvar = d.getVar('PKGD')
     objcopy = d.getVar("OBJCOPY")
 
@@ -1046,16 +1057,7 @@ python split_and_strip_files () {
     # First lets process debug splitting
     #
     if (d.getVar('INHIBIT_PACKAGE_DEBUG_SPLIT') != '1'):
-        for file in elffiles:
-            src = file[len(dvar):]
-            dest = debuglibdir + os.path.dirname(src) + debugdir + "/" + os.path.basename(src) + debugappend
-            fpath = dvar + dest
-
-            # Split the file...
-            bb.utils.mkdirhier(os.path.dirname(fpath))
-            #bb.note("Split %s -> %s" % (file, fpath))
-            # Only store off the hard link reference if we successfully split!
-            splitdebuginfo(file, fpath, debugsrcdir, sourcefile, d)
+        oe.utils.multiprocess_launch(splitdebuginfo, list(elffiles), d, extraargs=(dvar, debugdir, debuglibdir, debugappend, debugsrcdir, sourcefile, d))
 
         if debugsrcdir and not targetos.startswith("mingw"):
             for file in staticlibs:
-- 
2.17.1


