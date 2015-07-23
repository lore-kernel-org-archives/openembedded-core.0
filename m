Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id E3521761C6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 22:05:45 +0000 (UTC)
Received: by wicgb10 with SMTP id gb10so3363746wic.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 15:05:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ujsQKXv4phbxG1s6JN6ffBdVQXTxSY2FTRKtdhooMeo=;
	b=nIULgB0SziBXWS+Vczix5QVBXdIfYWu+xQhoCNielyjkqrT0TY5+CdY2L1AVKKf3Rb
	l3sshcxmnYU5RbU1kMQYurrhUtArwZ2uA9DdIk8v6wWTrJIEwl6Ad7bMwFToaTkXWrul
	c8v8o2tD+35iQZCKnmIKXFxj7FB8kXUbDdJZUz8oosJMP5AFzg8BGEpsp3wBolaZn4V2
	e9m6Dike5ske9VNgcnqjSuwwXOd3pqbZ6mvQqkjNSc6ZrX0v7PCTCUmMBCIITDMIBw0A
	AXWM41Gmj8W5wArp2mpxlWbIZTKq6L2WHnZ/67mb3w6TWg3Ols0gw/T9GHlCR/gWMIGZ
	cQDw==
X-Gm-Message-State: ALoCoQkCLkaZUUghoN6enlqi8hYWZJUeHrCtafsRlZWj9g/tXJHYmUN7m6wuvLbNijkg9piz294G
X-Received: by 10.194.178.99 with SMTP id cx3mr19457005wjc.33.1437689145408;
	Thu, 23 Jul 2015 15:05:45 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id w8sm9479436wja.15.2015.07.23.15.05.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Jul 2015 15:05:44 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jul 2015 22:59:48 +0100
Message-Id: <1437688790-31620-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1437688790-31620-1-git-send-email-ross.burton@intel.com>
References: <1437688790-31620-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/5] oeqa/selftest/imagefeatures: handle killpg victim not existing
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
X-List-Received-Date: Thu, 23 Jul 2015 22:05:46 -0000

If Pexpect throws an exception it may be because the child has already died, in
which case killpg will fail.  Catch the latter exception silently, and output
the exception from Pexpect.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/selftest/imagefeatures.py | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oeqa/selftest/imagefeatures.py b/meta/lib/oeqa/selftest/imagefeatures.py
index 70ebbe4..82ea164 100644
--- a/meta/lib/oeqa/selftest/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/imagefeatures.py
@@ -43,9 +43,12 @@ class ImageFeatures(oeSelfTest):
             proc_qemu.expect(self.get_ip_patt, timeout=100)
             qemu_ip = proc_qemu.match.group('qemu_ip')
             proc_qemu.expect('qemux86 login:', timeout=100)
-        except:
-            killpg(proc_qemu.pid, signal.SIGTERM)
-            self.fail('Failed to start qemu.')
+        except Exception as e:
+            try:
+                killpg(proc_qemu.pid, signal.SIGTERM)
+            except:
+                pass
+            self.fail('Failed to start qemu: %s' % e)
 
         # Attempt to ssh with each user into qemu with empty password
         for user in [self.root_user, self.test_user]:
@@ -93,9 +96,12 @@ class ImageFeatures(oeSelfTest):
             proc_qemu.expect(self.get_ip_patt, timeout=100)
             qemu_ip = proc_qemu.match.group('qemu_ip')
             proc_qemu.expect('qemux86 login:', timeout=100)
-        except:
-            killpg(proc_qemu.pid, signal.SIGTERM)
-            self.fail('Failed to start qemu.')
+        except Exception as e:
+            try:
+                killpg(proc_qemu.pid, signal.SIGTERM)
+            except:
+                pass
+            self.fail('Failed to start qemu: %s' % e)
 
         # Attempt to ssh with each user into qemu with empty password
         for user in [self.root_user, self.test_user]:
@@ -147,9 +153,12 @@ class ImageFeatures(oeSelfTest):
             proc_qemu.expect(self.prompt)
             proc_qemu.sendline('rpm --version')
             proc_qemu.expect(self.prompt)
-        except:
-            killpg(proc_qemu.pid, signal.SIGTERM)
-            self.fail('Failed to boot qemu.')
+        except Exception as e:
+            try:
+                killpg(proc_qemu.pid, signal.SIGTERM)
+            except:
+                pass
+            self.fail('Failed to start qemu: %s' % e)
 
         found_rpm_version = proc_qemu.before
 
-- 
2.1.4


