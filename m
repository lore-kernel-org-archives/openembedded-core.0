Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T2PnS-0002Ri-UM for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 18:53:19 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7HGfKGT010990
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 17:41:20 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10094-07 for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 17:41:16 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7HGfDu8010984
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 17:41:14 +0100
Message-ID: <1345221673.27428.16.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Aug 2012 17:41:13 +0100
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] chrpath.bbclass: Ensure we only process tmpdir in paths which actually contain that path
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
X-List-Received-Date: Fri, 17 Aug 2012 16:53:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Without this change, a path to "/lib/xxx" or "/usr/lib/xxx" would also
attempt to be remapped to be relative to $ORIGIN which makes no sense.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/chrpath.bbclass b/meta/classes/chrpath.bbclass
index 8922248..659db31 100644
--- a/meta/classes/chrpath.bbclass
+++ b/meta/classes/chrpath.bbclass
@@ -60,10 +60,12 @@ def process_dir (directory, d):
                 # NOTE: This will not work reliably for cross packages, particularly in the case
                 # where your TMPDIR is a short path (i.e. /usr/poky) as chrpath cannot insert an
                 # rpath longer than that which is already set.
-                else:
+                elif rpath.find(tmpdir) != -1:
                     depth = fpath.rpartition(tmpdir)[2].count('/')
                     libpath = rpath.partition(tmpdir)[2].strip()
-
+                else:
+                    new_rpaths.append(rpath.strip())
+                    continue
                 base = "$ORIGIN"
                 while depth > 1:
                     base += "/.."




