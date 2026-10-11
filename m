Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11B74CA9ED6
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 20:00:00 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32778.1791748795179627637
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 12:59:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=tYIrmX9U;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-2026101119595289ae00d61d000207a1-dabd3n@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2026101119595289ae00d61d000207a1
        for <openembedded-core@lists.openembedded.org>;
        Sun, 11 Oct 2026 21:59:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=rRKrzjFMUmV9KWePOqOPAAEvsmvZ1cXOzUyNlUOllRg=;
 b=tYIrmX9Urc9nSXV4CSS1+MeRdWyZ0BmTfVLwO+317wcq9zQIO9hkJpwOjsZZl/Wzjl/hzE
 0ls8ojdTGMZVAWAH+aLu3Y9G7f/BzwYNXavPmTaFags79SGNx700VpWG1EGrmc9uknsVolAE
 PHiPfNXz/w6JR5D1lWYDzXCv1KMuul1xGjpj+lGeGkpYGD2F4A7Dm74EC5iCmR5rJ/5LqUVY
 TDRTm7OoElhVr6BJPJz/kDWSIBLVeoxI/yBsBBjOKxYb+bamyGHs0rOErINGhGUFZF9JKl/l
 OjzdKBpCAUVi3M8T2j+ChjPAPku9D3X/9zMR4YQxo5IAzPTsaLdJqNIA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 04/11] runqemu: allocate the slirp MAC address via lock files
Date: Sun, 11 Oct 2026 21:59:09 +0200
Message-ID: <20261011195949.2118607-5-adrian.freihofer@siemens.com>
In-Reply-To: <20261011195949.2118607-1-adrian.freihofer@siemens.com>
References: <20261011195949.2118607-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 20:00:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247581

From: Adrian Freihofer <adrian.freihofer@siemens.com>

The last octet of the slirp MAC address was derived from how many times
a host port had to be incremented to find a free one. That is unreliable
in both directions: two concurrently starting instances that shift their
ports by the same amount end up with the same MAC address, while an
instance that finds all its wished-for ports free always picks the same
one.

It also does not scale with the number of forwarded ports, because every
single port that has to be moved bumps the octet once more. A
configuration asking for many ports, as devtool ide-sdk does for its
debug servers, therefore runs through the single byte quickly, and past
0xff the formatted address stops being a valid MAC address at all, e.g.
"52:54:00:12:35:124" once the counter passes 255.

Allocate the octet from its own lock file directory instead, reusing the
scheme already used for the tap and port locks, which makes it unique
among the qemu instances running on the host and independent of how many
ports are forwarded and whether any of them had to be moved.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/runqemu | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 6544c3884b..ca1f74e9d7 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1133,6 +1133,17 @@ to your build configuration.
                 pass
         return
 
+    def alloc_mac_slot(self, lockdir):
+        """MAC address arbitration for slirp addresses: lock the first free
+        numbered lockfile (1-254) to get an octet unique among concurrently
+        running qemu instances on this host."""
+        self.make_lock_dir(lockdir)
+        for slot in range(1, 255):
+            lockfile = os.path.join(lockdir, str(slot) + '.lock')
+            if self.acquire_lock(lockfile):
+                return slot
+        raise RunQemuError("Too many concurrent qemu slirp instances on this host, can't allocate a unique MAC address")
+
     def setup_slirp(self):
         """Setup user networking"""
 
@@ -1148,7 +1159,6 @@ to your build configuration.
         # Figure out the port
         ports = re.findall('hostfwd=[^-]*:([0-9]+)-[^,-]*', qb_slirp_opt)
         ports = [int(i) for i in ports]
-        mac = 2
 
         lockdir = "/tmp/qemu-port-locks"
         self.make_lock_dir(lockdir)
@@ -1158,15 +1168,13 @@ to your build configuration.
             p_new = p
             while not self.check_free_port('localhost', p_new, lockdir):
                 p_new += 1
-                mac += 1
                 while p_new in ports:
                         p_new += 1
-                        mac += 1
             if p != p_new:
                 ports.append(p_new)
                 qb_slirp_opt = re.sub(':%s-' % p, ':%s-' % p_new, qb_slirp_opt)
                 logger.info("Port forward changed: %s -> %s" % (p, p_new))
-        mac = "%s%02x" % (self.mac_slirp, mac)
+        mac = "%s%02x" % (self.mac_slirp, self.alloc_mac_slot("/tmp/qemu-mac-locks"))
         self.set('NETWORK_CMD', '%s %s' % (self.network_device.replace('@MAC@', mac), qb_slirp_opt))
         # Print out port foward
         hostfwd = re.findall('(hostfwd=[^,]*)', qb_slirp_opt)
-- 
2.56.0


