Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 407A77F820
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2020 00:06:54 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id d16so47882793wre.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Jan 2020 16:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=F8aorwGYXkjKQyGzRmQ08UFpBXG9kWYCtbQc6wctwfo=;
	b=iPKcEQMFGTIs7UTrIaIKpMy9E5AaM5TzKltSPWbcQFf5ITZTodQMtQrWK4uvbknIA3
	7UVSuZwAXgUuFsrkVPzknBRIxYWKDMumeCqNgBdk1JPKxFy8MKfYQ4CWgT8ero//QhTr
	7AlSzB2xtM5UiRE6RIkTy+BB8aqgljTtvRXGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=F8aorwGYXkjKQyGzRmQ08UFpBXG9kWYCtbQc6wctwfo=;
	b=tOVa4PbFySU2G+JnJqlkfEhXJatMraIxiwHS+hmqwi6VnpsfFQ5ryHH9b8tMCRBwnu
	VZhfaJZaDAITpIFlGSd7MGYDog7nvgQyg9uubVQeYwzYSxeTIebMvgyEP0O5B8B3J0Jo
	iNx+3Ev/IDZI5MN/gYs9efJNkoIq3/yTarKX5UmceV1pB6Uj//FBqJdvwglVo5HEcFnt
	uV17V4JNZnHv8JaVfpqhk0QpkkuIMMGb59fXQDsC65+0EEZJmJ7ylTpk+I7OROSOsLXK
	oYob+0XWa2Pkfdp2fMxrcXUQArZgQ5tymWLmqih7BQ4im2Ai2qArCCYcR+gNLpQNSSXn
	HE4w==
X-Gm-Message-State: APjAAAW0Y5DVthvwkNR4Cd45djFPf2NbNuoNyU6cJIe5hC/APE+OhpUp
	oG2jPnVnMCKnQ87B2dyPqigBqPK4UfE=
X-Google-Smtp-Source: APXvYqzCxkNZTIKHKX5F5M4yNnpF1e+wAyqbdDILoqBotnVaf8ZQSU8ubmflJNH+OWxqtoi8NPyuJA==
X-Received: by 2002:a5d:5273:: with SMTP id
	l19mr102133334wrc.175.1578269214467; 
	Sun, 05 Jan 2020 16:06:54 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n10sm69174229wrt.14.2020.01.05.16.06.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 05 Jan 2020 16:06:53 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jan 2020 00:06:49 +0000
Message-Id: <20200106000650.26105-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200106000650.26105-1-richard.purdie@linuxfoundation.org>
References: <20200106000650.26105-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 3/4] sstate: Merge file name generation into single function
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
X-List-Received-Date: Mon, 06 Jan 2020 00:06:54 -0000
Content-Transfer-Encoding: 8bit

Move the task handling and extension handling into one common filename
construction function.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 5bd4031e536..71ae0900777 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -3,15 +3,20 @@ SSTATE_VERSION = "3"
 SSTATE_MANIFESTS ?= "${TMPDIR}/sstate-control"
 SSTATE_MANFILEPREFIX = "${SSTATE_MANIFESTS}/manifest-${SSTATE_MANMACH}-${PN}"
 
-def generate_sstatefn(spec, hash, d):
+def generate_sstatefn(spec, hash, taskname, siginfo, d):
+    if taskname is None:
+       return ""
+    extension = ".tgz"
+    if siginfo:
+        extension = ".tgz.siginfo"
     if not hash:
         hash = "INVALID"
-    return hash[:2] + "/" + hash[2:4] + "/" + spec + hash
+    return hash[:2] + "/" + hash[2:4] + "/" + spec + hash + "_" + taskname + extension
 
 SSTATE_PKGARCH    = "${PACKAGE_ARCH}"
 SSTATE_PKGSPEC    = "sstate:${PN}:${PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}:${PV}:${PR}:${SSTATE_PKGARCH}:${SSTATE_VERSION}:"
 SSTATE_SWSPEC     = "sstate:${PN}::${PV}:${PR}::${SSTATE_VERSION}:"
-SSTATE_PKGNAME    = "${SSTATE_EXTRAPATH}${@generate_sstatefn(d.getVar('SSTATE_PKGSPEC'), d.getVar('BB_UNIHASH'), d)}_${SSTATE_CURRTASK}.tgz"
+SSTATE_PKGNAME    = "${SSTATE_EXTRAPATH}${@generate_sstatefn(d.getVar('SSTATE_PKGSPEC'), d.getVar('BB_UNIHASH'), d.getVar('SSTATE_CURRTASK'), False, d)}"
 SSTATE_PKG        = "${SSTATE_DIR}/${SSTATE_PKGNAME}"
 SSTATE_EXTRAPATH   = ""
 SSTATE_EXTRAPATHWILDCARD = ""
@@ -822,9 +827,6 @@ BB_HASHCHECK_FUNCTION = "sstate_checkhashes"
 def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True, **kwargs):
     found = set()
     missed = set()
-    extension = ".tgz"
-    if siginfo:
-        extension = extension + ".siginfo"
 
     def gethash(task):
         return sq_data['unihash'][task]
@@ -851,7 +853,7 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
 
         spec, extrapath, tname = getpathcomponents(tid, d)
 
-        sstatefile = d.expand("${SSTATE_DIR}/" + extrapath + generate_sstatefn(spec, gethash(tid), d) + "_" + tname + extension)
+        sstatefile = d.expand("${SSTATE_DIR}/" + extrapath + generate_sstatefn(spec, gethash(tid), tname, siginfo, d))
 
         if os.path.exists(sstatefile):
             bb.debug(2, "SState: Found valid sstate file %s" % sstatefile)
@@ -914,7 +916,7 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
             if tid in found:
                 continue
             spec, extrapath, tname = getpathcomponents(tid, d)
-            sstatefile = d.expand(extrapath + generate_sstatefn(spec, gethash(tid), d) + "_" + tname + extension)
+            sstatefile = d.expand(extrapath + generate_sstatefn(spec, gethash(tid), tname, siginfo, d))
             tasklist.append((tid, sstatefile))
 
         if tasklist:
@@ -944,11 +946,11 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
         evdata = {'missed': [], 'found': []};
         for tid in missed:
             spec, extrapath, tname = getpathcomponents(tid, d)
-            sstatefile = d.expand(extrapath + generate_sstatefn(spec, gethash(tid), d) + "_" + tname + ".tgz")
+            sstatefile = d.expand(extrapath + generate_sstatefn(spec, gethash(tid), tname, False, d))
             evdata['missed'].append((bb.runqueue.fn_from_tid(tid), bb.runqueue.taskname_from_tid(tid), gethash(tid), sstatefile ) )
         for tid in found:
             spec, extrapath, tname = getpathcomponents(tid, d)
-            sstatefile = d.expand(extrapath + generate_sstatefn(spec, gethash(tid), d) + "_" + tname + ".tgz")
+            sstatefile = d.expand(extrapath + generate_sstatefn(spec, gethash(tid), tname, False, d))
             evdata['found'].append((bb.runqueue.fn_from_tid(tid), bb.runqueue.taskname_from_tid(tid), gethash(tid), sstatefile ) )
         bb.event.fire(bb.event.MetadataEvent("MissedSstate", evdata), d)
 
-- 
2.20.1


