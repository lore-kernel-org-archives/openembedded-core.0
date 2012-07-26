Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SuNwa-0008CM-4F for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 15:17:32 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6QD614H021433
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 14:06:01 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21192-02 for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 14:05:57 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6QD5o3v021426
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 14:05:52 +0100
Message-ID: <1343307951.29991.27.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 26 Jul 2012 14:05:51 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] lib/oe/lsb: Add basic LSB functions
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Jul 2012 13:17:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This code was written by Christopher Larson <chris_larson@mentor.com> and
allows generation of the LSB release data based upon the lsb_release
command. It also includes a helper function to generate a string
representing a given distribution.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/lib/oe/lsb.py b/meta/lib/oe/lsb.py
new file mode 100644
index 0000000..a774169
--- a/dev/null
+++ b/meta/lib/oe/lsb.py
@@ -0,0 +1,28 @@
+def release_dict():
+    """Return the output of lsb_release -a as a dictionary"""
+    from subprocess import PIPE
+
+    try:
+        output, err = bb.process.run(['lsb_release', '-a'], stderr=PIPE)
+    except bb.process.CmdError as exc:
+        return
+
+    data = {}
+    for line in output.splitlines():
+        try:
+            key, value = line.split(":\t", 1)
+        except ValueError:
+            continue
+        else:
+            data[key] = value
+    return data
+
+def distro_identifier(adjust_hook=None):
+    """Return a distro identifier string based upon lsb_release -ri,
+       with optional adjustment via a hook"""
+
+    lsb_data = release_dict()
+    distro_id, release = lsb_data['Distributor ID'], lsb_data['Release']
+    if adjust_hook:
+        distro_id, release = adjust_hook(distro_id, release)
+    return '{0}-{1}'.format(distro_id, release)




