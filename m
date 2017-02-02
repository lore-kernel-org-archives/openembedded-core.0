Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 276DE71D97
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Feb 2017 17:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v12HuX8K016377; Thu, 2 Feb 2017 17:56:33 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id II3TMWfCd8Qw; Thu,  2 Feb 2017 17:56:33 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v12HuW0Q016374
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 2 Feb 2017 17:56:33 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cZLcW-0006LX-2n; Thu, 02 Feb 2017 17:56:32 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Feb 2017 17:56:30 +0000
Message-Id: <1486058190-24356-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] uninative: Make patchelf modified files sparse
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
X-List-Received-Date: Thu, 02 Feb 2017 17:56:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When we switched to recipe specific sysroots (rss), performance took a nose dive. Its
easy to blame rss but it turns out not to be entirely at fault.

Three configurations are compared here:

a) Pre-RSS (revision 45df694a9f472ac2f684aadac4d864c3dfdc48a7)
b) Post-RSS (revision 226a508da955439b881b2f0a544a3aee76e59919)
c) as b) with this change

Overall build times:

a) 22794.25user 2687.88system 30:32.84elapsed 1390%CPU (0avgtext+0avgdata 919056maxresident)k
b) 22677.25user 3238.79system 36:16.68elapsed 1190%CPU (0avgtext+0avgdata 918896maxresident)k
c) 23571.84user 3383.65system 31:36.83elapsed 1421%CPU (0avgtext+0avgdata 919068maxresident)k

For the overall build and sstate directories, du -s shows:
a)
3992588   build-pre-rss/sstate-cache
30804484  build-pre-rss/tmp
b)
4013272   build-with-rss/sstate-cache
36519084  build-with-rss/tmp
c)
4014744   build-with-rss2/sstate-cache
35336960  build-with-rss2/tmp

However more worryingly:

$ du -s build-pre-rss/tmp/sysroots/
2506092 build-pre-rss/tmp/sysroots/
$ du -s build-with-rss/tmp/sysroots-components/
3790712 build-with-rss/tmp/sysroots-components/
$ du -s build-with-rss2/tmp/sysroots-components/
2467544 build-with-rss2/tmp/sysroots-components/

These numbers *should* be equivalent but as you can see, b) is ~1.2GB larger. The reason turned out
to be patchelf. Taking a specific binary from a specific recipe, bc from bc-native, in a) its 82kb
(stripped) yet in b) its 2.17MB.

$ ./patchelf --set-interpreter /bin/rp bc
warning: working around a Linux kernel bug by creating a hole of 2084864 bytes in ‘bc’

https://github.com/NixOS/patchelf/blob/master/src/patchelf.cc#L710 shows that this "hole" is just
padded zeros using memset, its not a proper sparse hole.

This patch copies files with cp --sparse=always after modifying them with patchelf, then replacing
the original file. The better fix will be to fix this in patchself itself and seek() there
when writing the new file but that means new uninative tarballs and will take a bit of work
so I'm proposing this workaround in the meantime.

Also, this patch drops error handling since subprocess check_output() tracebacks will print this
information if the command fails so we can simplify the code.
---
 meta/classes/uninative.bbclass | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index 410fb72..0d1063a 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -121,11 +121,8 @@ python uninative_changeinterp () {
             if not elf.isDynamic():
                 continue
 
-            try:
-                subprocess.check_output(("patchelf-uninative", "--set-interpreter",
-                                         d.getVar("UNINATIVE_LOADER"), f),
-                                        stderr=subprocess.STDOUT)
-            except subprocess.CalledProcessError as e:
-                bb.fatal("'%s' failed with exit code %d and the following output:\n%s" %
-                         (e.cmd, e.returncode, e.output))
+            subprocess.check_output(("patchelf-uninative", "--set-interpreter", d.getVar("UNINATIVE_LOADER"), f), stderr=subprocess.STDOUT)
+            subprocess.check_output(("cp", "--sparse=always", f, f + ".sparse"), stderr=subprocess.STDOUT)
+            os.unlink(f)
+            os.rename(f + ".sparse", f)
 }
-- 
2.7.4


