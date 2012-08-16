Received: from li44-10.members.linode.com ([72.14.181.10] helo=plausible.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andy.ross@windriver.com>) id 1T22qW-0005UZ-Fs
	for openembedded-core@openembedded.org; Thu, 16 Aug 2012 18:22:56 +0200
Received: from cougar.plausible.org (c-67-171-188-207.hsd1.or.comcast.net
	[67.171.188.207]) (Authenticated sender: andy-wrs)
	by plausible.org (Postfix) with ESMTPSA id 2FA3E1EBC1;
	Thu, 16 Aug 2012 09:11:00 -0700 (PDT)
From: Andy Ross <andy.ross@windriver.com>
To: openembedded-core@openembedded.org,
	Chris Larson <clarson@kergoth.com>
Date: Thu, 16 Aug 2012 09:10:47 -0700
Message-Id: <1345133447-12833-2-git-send-email-andy.ross@windriver.com>
X-Mailer: git-send-email 1.7.11.2
In-Reply-To: <1345133447-12833-1-git-send-email-andy.ross@windriver.com>
References: <CABcZANnFML0a-qAZA33skkJK+=9sTN_bG=KWsGbLYfXZgqDbnQ@mail.gmail.com>
	<1345133447-12833-1-git-send-email-andy.ross@windriver.com>
Subject: [PATCH] insane.bbclass: Fix RPATH warning in the face of funny path strings
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
X-List-Received-Date: Thu, 16 Aug 2012 16:22:56 -0000

In toolchain edge cases it's possible for the RPATH of a library to be
set to something like "/usr/lib/../lib".  This should be detected as
"/usr/lib" and generate a warning.  Also clarify the warning text to
indicate potential link-time pollution from the host libraries.

Signed-off-by: Andy Ross <andy.ross@windriver.com>
---
 meta/classes/insane.bbclass | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 556a176..dfaa9dc 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -161,6 +161,10 @@ def package_qa_check_rpath(file,name, d, elf, messages):
             if dir in line:
                 messages.append("package %s contains bad RPATH %s in file %s" % (name, line, file))
 
+def rpath_eq(a, b):
+    import os.path
+    return os.path.normpath(a) == os.path.normpath(b)
+
 QAPATHTEST[useless-rpaths] = "package_qa_check_useless_rpaths"
 def package_qa_check_useless_rpaths(file, name, d, elf, messages):
     """
@@ -181,10 +185,13 @@ def package_qa_check_useless_rpaths(file, name, d, elf, messages):
     	m = rpath_re.match(line)
 	if m:
 	   rpath = m.group(1)
-	   if rpath == libdir or rpath == base_libdir:
-	      # The dynamic linker searches both these places anyway.  There is no point in
-	      # looking there again.
-	      messages.append("%s: %s contains probably-redundant RPATH %s" % (name, package_qa_clean_path(file, d), rpath))
+	   if rpath_eq(rpath, libdir) or rpath_eq(rpath, base_libdir):
+	      # The dynamic linker searches both these places anyway.
+	      # There is no point in looking there again.  And it may
+	      # be harmful: the RPATH may point to host directories
+	      # (e.g. /usr/lib) which will be searched at link time,
+	      # creating build issues.
+	      messages.append("%s: %s contains probably-redundant, possibly host-polluted RPATH %s" % (name, package_qa_clean_path(file, d), rpath))
 
 QAPATHTEST[dev-so] = "package_qa_check_dev"
 def package_qa_check_dev(path, name, d, elf, messages):
-- 
1.7.11.2



