Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 26EE1607AD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Dec 2018 09:58:36 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id t27so26114756wra.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Dec 2018 01:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=46/Ufsc9Wz+yKJOb0goQDP3xEfaV4jNMVLGb++tZKzo=;
	b=R2813w8T2YZliFhOC+CfsC29e494hDySLQWdSAPAEE5sJw75s0I3Eaart8ug790o6r
	Y1zg+kBLAKtVv4Ko83MFpxWHKbLlKZLLNTsFnvZ5o5I/yaBEmK94eYRB4OWO6AGblJei
	LdPzfO/UQRu1bRsqxGGgpyzewpzNFmFdsRtDdeBI6kfB5A5RLdQ3HdCbR0yLpWVRUkFk
	PtipkriIjnEfAHHvusdbfKlzT/ctO8ZJsdWkfXftTzIByd2HvjDdDbiTWiavnHDDLTep
	+E5LOzd6iBMTd828NfGrWdcaAvg0xZbCXROvbOnqSVI3S2JPGq8je5HR/8NZpSkAzC8t
	2/Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=46/Ufsc9Wz+yKJOb0goQDP3xEfaV4jNMVLGb++tZKzo=;
	b=hpK34bg8rN4MuZmlm2lKYRdUXgNiJELZWQLLC8UzMtj+2+Famcr01k4XqU7jhiINcW
	hvtKyt6eKQriyP6o5Nj+gj/GuPiPaR3LEfaz1XrZOot8MOU1YlitO2NBVLciD1UxC7R+
	HCe/n39Qe+Ac5B1JgSodSlMdlj4FiKK/OgUut2lpIIo9PJLB5fYDRF80aoNus9WLhtF6
	JAVD55N9tDjGulrIpqjrZLiGnR/SQKK7jVObvgEt1KcTUPrDKz+EK6x3q7jcEHFJRUC2
	FYWLkscIRVdHfCxLzcRna9m6J4AMeClfWfuIl+8pKkVm3vj7Vdr9OAp/e3fjGWcmsD6h
	6eRw==
X-Gm-Message-State: AJcUukfCk4gmsbU5bngGaNzFmwzIEWJT3+o5mdA8SbM40XKpeLK2zuyt
	1JzJelQ4Dn8s7fxx4B8eHXjwVkOx
X-Google-Smtp-Source: ALg8bN7R0xYfNF84Z1whD+JlEgQfdOKoazXtRaUrAzjVtB2OMEjPzwAeE6mCW6Kh3mHdRdyhRG7IZA==
X-Received: by 2002:adf:d1d2:: with SMTP id m18mr34030343wri.138.1546250317528;
	Mon, 31 Dec 2018 01:58:37 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id m4sm42378317wmi.3.2018.12.31.01.58.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 31 Dec 2018 01:58:36 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Dec 2018 09:58:35 +0000
Message-Id: <20181231095835.21196-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] sstate.bbclass: catch ValueError from incorrectly written sstate manifests
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
X-List-Received-Date: Mon, 31 Dec 2018 09:58:37 -0000

* in some rare cases the file format might be broken, e.g. when you run
  out of disk space while writing to it (hint: make sure to use
  BB_DISKMON_DIRS on _all_ the builds, to make sure that they can stop
  gracefully before this happens).

* will show error like this:
  ERROR: Invalid line '/OE/build/luneos-thud/webos-ports' in sstate manifest '/OE/build/luneos-thud/webos-ports/tmp-glibc/sstate-control/index-allarch'
  when the file isn't complete, like in my case:
  $ tail -n 2 /OE/build/luneos-thud/webos-ports/tmp-glibc/sstate-control/index-allarch
  /OE/build/luneos-thud/webos-ports/tmp-glibc/stamps/all-webos-linux/org.webosports.app.calculator/0.1.1+gitrAUTOINC+9e9eb67c28-r0 /OE/build/luneos-thud/webos-ports/tmp-glibc/sstate-control/manifest-allarch-org.webosports.app.calculator /OE/build/luneos-thud/webos-ports/tmp-glibc/work/all-webos-linux/org.webosports.app.calculator/0.1.1+gitrAUTOINC+9e9eb67c28-r0
  /OE/build/luneos-thud/webos-ports

* instead of much longer exception which doesn't really show what's
  wrong to selectively fix that (other than removing while TMPDIR):

  ERROR: Command execution failed: Traceback (most recent call last):
  File "/OE/build/luneos-thud/webos-ports/bitbake/lib/bb/command.py", line 113, in runAsyncCommand
    self.cooker.updateCache()
  File "/OE/build/luneos-thud/webos-ports/bitbake/lib/bb/cooker.py", line 1562, in updateCache
    bb.event.fire(event, self.databuilder.mcdata[mc])
  File "/OE/build/luneos-thud/webos-ports/bitbake/lib/bb/event.py", line 225, in fire
    fire_class_handlers(event, d)
  File "/OE/build/luneos-thud/webos-ports/bitbake/lib/bb/event.py", line 134, in fire_class_handlers
    execute_handler(name, handler, event, d)
  File "/OE/build/luneos-thud/webos-ports/bitbake/lib/bb/event.py", line 106, in execute_handler
    ret = handler(event)
  File "/OE/build/luneos-thud/webos-ports/openembedded-core/meta/classes/sstate.bbclass", line 1083, in sstate_eventhandler2
    (stamp, manifest, workdir) = l.split()
  ValueError: not enough values to unpack (expected 3, got 1)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/sstate.bbclass | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 8b48ab465f..be5f19b33e 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -1081,12 +1081,15 @@ python sstate_eventhandler2() {
         with open(i, "r") as f:
             lines = f.readlines()
             for l in lines:
-                (stamp, manifest, workdir) = l.split()
-                if stamp not in stamps and stamp not in preservestamps and stamp in machineindex:
-                    toremove.append(l)
-                    if stamp not in seen:
-                        bb.debug(2, "Stamp %s is not reachable, removing related manifests" % stamp)
-                        seen.append(stamp)
+                try:
+                    (stamp, manifest, workdir) = l.split()
+                    if stamp not in stamps and stamp not in preservestamps and stamp in machineindex:
+                        toremove.append(l)
+                        if stamp not in seen:
+                            bb.debug(2, "Stamp %s is not reachable, removing related manifests" % stamp)
+                            seen.append(stamp)
+                except ValueError:
+                    bb.fatal("Invalid line '%s' in sstate manifest '%s'" % (l, i))
 
         if toremove:
             msg = "Removing %d recipes from the %s sysroot" % (len(toremove), a)
-- 
2.17.1


