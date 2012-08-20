Received: from li44-10.members.linode.com ([72.14.181.10] helo=plausible.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andy.ross@windriver.com>) id 1T3ZMM-0007Wb-2Z
	for openembedded-core@openembedded.org; Mon, 20 Aug 2012 23:18:06 +0200
Received: from cougar.plausible.org (c-67-171-188-207.hsd1.or.comcast.net
	[67.171.188.207]) (Authenticated sender: andy-wrs)
	by plausible.org (Postfix) with ESMTPSA id A089C1F0A1;
	Mon, 20 Aug 2012 14:06:02 -0700 (PDT)
From: Andy Ross <andy.ross@windriver.com>
To: openembedded-core@openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Mon, 20 Aug 2012 14:05:58 -0700
Message-Id: <1345496758-29154-1-git-send-email-andy.ross@windriver.com>
X-Mailer: git-send-email 1.7.11.2
In-Reply-To: <1345220434.27428.15.camel@ted>
References: <1345220434.27428.15.camel@ted>
Subject: [PATCH] insane.bbclass: Fix RPATH warning in the face of funny path strings
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Aug 2012 21:18:06 -0000

In toolchain edge cases it's possible for the RPATH of a library to be
set to something like "/usr/lib/../lib".  This should be detected as
"/usr/lib" and generate a warning.

Signed-off-by: Andy Ross <andy.ross@windriver.com>
---
 meta/classes/insane.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 556a176..9d085a4 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -166,6 +166,9 @@ def package_qa_check_useless_rpaths(file, name, d, elf, messages):
     """
     Check for RPATHs that are useless but not dangerous
     """
+    def rpath_eq(a, b):
+        return os.path.normpath(a) == os.path.normpath(b)
+
     if not elf:
         return
 
@@ -181,7 +184,7 @@ def package_qa_check_useless_rpaths(file, name, d, elf, messages):
     	m = rpath_re.match(line)
 	if m:
 	   rpath = m.group(1)
-	   if rpath == libdir or rpath == base_libdir:
+	   if rpath_eq(rpath, libdir) or rpath_eq(rpath, base_libdir):
 	      # The dynamic linker searches both these places anyway.  There is no point in
 	      # looking there again.
 	      messages.append("%s: %s contains probably-redundant RPATH %s" % (name, package_qa_clean_path(file, d), rpath))
-- 
1.7.11.2



