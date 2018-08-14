Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 76B5379029
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 17:32:05 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id y2-v6so13081232wma.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 10:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Bt7vtF1aFRN/Ma7BUyv2uRoqVvtExvBaGcHdj+a31mg=;
	b=Lvg8ygOTfcT4W/dWkM/ZR7EjwqLYd1O2+tBNq2Hhd0HSFQ83ybnBKWDzDAj0reeK1h
	nvglKyNspud3ZS9K2ArFgSF8WBXvT6ucFM1VMPPHzo/7oXxLWuX5wKEZ++BMV2eVosSy
	f37q4I6F74FEqCt1Lp1pnXeqAGB7stinjK5FY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Bt7vtF1aFRN/Ma7BUyv2uRoqVvtExvBaGcHdj+a31mg=;
	b=ZNPVM+fsjIKwalLfPMzwPgZbBM5MlDW/aBrWlJS1NhG2vBkCXU/uss5R692b4mkr7k
	61ohPFnDCLQMGhLNnogoqxpgYnfe7AX+1p8sivrLyQq3kiuN9qFz2poPvbFebYgxYg1l
	znilPB4tt4ymmCfBBsKK4rCI8RgycJtwOs9TR+x7G/MmhRZ0Y9Dqk31lJw/ZSypd4FjO
	//3nba3VRstZ/OG88GthUiwxh1gzaM47yRpHAdTdjXSg0oLmFxmAU9PxB7IMLE2UcVXf
	Rax/cQ7ZL2ThhMjcrTvPZVpIM3rOt9HVSbHTpAkVQBZ1VvHjzkHep0tyu7/4tAQceBw3
	4Ekw==
X-Gm-Message-State: AOUpUlF2zsQXki33UdduHYwWK+enYcJ/XeCkN0IE5vvlQ791p7TQi6cv
	kexpLfjolxrAeelPpJR9kj8eu0xXLOc=
X-Google-Smtp-Source: AA+uWPyfqrTLDjzsvccsfmoo5E3zRQeep2kkq1+PMzibGL1rTVCN2MDCprdaz0dZPiOURPS5mD3Awg==
X-Received: by 2002:a1c:ae8d:: with SMTP id
	x135-v6mr11523661wme.20.1534267925926; 
	Tue, 14 Aug 2018 10:32:05 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t70-v6sm14519462wmt.30.2018.08.14.10.32.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Aug 2018 10:32:04 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2018 18:31:58 +0100
Message-Id: <20180814173201.6723-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180814173201.6723-1-richard.purdie@linuxfoundation.org>
References: <20180814173201.6723-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/6] sstate: Ensure a given machine only removes things which it created
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
X-List-Received-Date: Tue, 14 Aug 2018 17:32:05 -0000

Currently if you build qemux86 and then generic86, the latter will
remove all of the former from deploy and workdir. This is because
qemux86 is i586, genericx86 is i686 and the architctures are compatible
therefore the sstate 'cleaup' code kicks in.

There was a valid reason for this to ensure i586 packages didn't get into
an i686 rootfs for example. With the rootfs creation being filtered now, this
is no longer necessary.

Instead, save out a list of stamps which a give machine has ever seen in
a given build and only clean up these things if they're no longer
"reachable".

In particular this means the autobuilder should no longer spend a load of time
deleting files when switching MACHINE, improving build times.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 9927c76596e..a091c6e843e 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -1045,6 +1045,15 @@ python sstate_eventhandler2() {
         with open(preservestampfile, 'r') as f:
             preservestamps = f.readlines()
     seen = []
+
+    # The machine index contains all the stamps this machine has ever seen in this build directory.
+    # We should only remove things which this machine once accessed but no longer does.
+    machineindex = set()
+    mi = d.expand("${SSTATE_MANIFESTS}/index-machine-${MACHINE}")
+    if os.path.exists(mi):
+        with open(mi, "r") as f:
+            machineindex = set(f.readlines())
+
     for a in sorted(list(set(d.getVar("SSTATE_ARCHS").split()))):
         toremove = []
         i = d.expand("${SSTATE_MANIFESTS}/index-" + a)
@@ -1054,7 +1063,7 @@ python sstate_eventhandler2() {
             lines = f.readlines()
             for l in lines:
                 (stamp, manifest, workdir) = l.split()
-                if stamp not in stamps and stamp not in preservestamps:
+                if stamp not in stamps and stamp not in preservestamps and stamp in machineindex:
                     toremove.append(l)
                     if stamp not in seen:
                         bb.debug(2, "Stamp %s is not reachable, removing related manifests" % stamp)
@@ -1083,6 +1092,11 @@ python sstate_eventhandler2() {
         with open(i, "w") as f:
             for l in lines:
                 f.write(l)
+    machineindex |= set(stamps)
+    with open(mi, "w") as f:
+        for l in machineindex:
+            f.write(l + "\n")
+
     if preservestamps:
         os.remove(preservestampfile)
 }
-- 
2.17.1


