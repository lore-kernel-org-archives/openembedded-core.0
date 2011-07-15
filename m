Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QhgWP-0004nC-Cb
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jul 2011 13:25:29 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QhgSY-00075W-Ly
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jul 2011 13:21:31 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 15 Jul 2011 12:21:28 +0100
In-Reply-To: <6D6FE0B9-0A59-4376-972B-2262C766FDEF@dominion.thruhere.net>
References: <1310634132.2378.36.camel@phil-desktop>
	<6D6FE0B9-0A59-4376-972B-2262C766FDEF@dominion.thruhere.net>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1310728890.3805.1.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH v2] insane: make GNU_HASH check slightly more robust (avoids false negatives with gold); add check for useless rpaths
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
X-List-Received-Date: Fri, 15 Jul 2011 11:25:29 -0000
X-Groupsio-MsgNum: 5962
Content-Type: multipart/mixed; boundary="=-dIYnYQL2ESgAcBEuuRtU"

--=-dIYnYQL2ESgAcBEuuRtU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-07-14 at 21:26 +0200, Koen Kooi wrote:
> The new rpath warning is nice, but a bit too terse:

Yes, agreed.  Try this patch and see if the situation improves.

p.


--=-dIYnYQL2ESgAcBEuuRtU
Content-Disposition: attachment;
	filename="0001-insane-improve-diagnostic-for-redundant-rpath.patch"
Content-Type: text/x-patch;
	name="0001-insane-improve-diagnostic-for-redundant-rpath.patch";
	charset="UTF-8"
Content-Transfer-Encoding: 7bit

From 5083f058ed0c559583cc9b3f4f2ae87bbbc701f9 Mon Sep 17 00:00:00 2001
From: Phil Blundell <philb@gnu.org>
Date: Fri, 15 Jul 2011 12:19:35 +0100
Subject: [PATCH] insane: improve diagnostic for redundant rpath

Make it more obvious which file, and which recipe, are at issue.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/classes/insane.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index c45f2cb..65eda9e 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -142,7 +142,7 @@ def package_qa_check_rpath(file,name, d, elf, messages):
                 messages.append("package %s contains bad RPATH %s in file %s" % (name, line, file))
 
 QAPATHTEST[useless-rpaths] = "package_qa_check_useless_rpaths"
-def package_qa_check_useless_rpaths(file,name, d, elf, messages):
+def package_qa_check_useless_rpaths(file, name, d, elf, messages):
     """
     Check for RPATHs that are useless but not dangerous
     """
@@ -164,7 +164,7 @@ def package_qa_check_useless_rpaths(file,name, d, elf, messages):
 	   if rpath == libdir or rpath == base_libdir:
 	      # The dynamic linker searches both these places anyway.  There is no point in
 	      # looking there again.
-	      messages.append("dynamic section contains probably-redundant RPATH %s" % rpath)
+	      messages.append("%s: %s contains probably-redundant RPATH %s" % (name, package_qa_clean_path(file, d), rpath))
 
 QAPATHTEST[dev-so] = "package_qa_check_dev"
 def package_qa_check_dev(path, name, d, elf, messages):
-- 
1.7.4.1


--=-dIYnYQL2ESgAcBEuuRtU--
