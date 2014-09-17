Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8E79A713C1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Sep 2014 16:16:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8HGFqU6008429; Wed, 17 Sep 2014 17:16:35 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id M0Q0Y8N7Ohsr; Wed, 17 Sep 2014 17:16:35 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8HGGXYL008444
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 17 Sep 2014 17:16:34 +0100
Message-ID: <1410970596.14624.108.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Hongxu Jia <hongxu.jia@windriver.com>
Date: Wed, 17 Sep 2014 17:16:36 +0100
In-Reply-To: <7e57c471b593b7be818545b5da25869cb506bde1.1410939794.git.hongxu.jia@windriver.com>
References: <cover.1410939794.git.hongxu.jia@windriver.com>
	<7e57c471b593b7be818545b5da25869cb506bde1.1410939794.git.hongxu.jia@windriver.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 9/9] sstatesig: incremental dump lockedsigs
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
X-List-Received-Date: Wed, 17 Sep 2014 16:16:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-09-17 at 16:08 +0800, Hongxu Jia wrote:
> The idea of incremental sig is:
> 
> New sig file = Old sig file (if available) + New sig items in current build.
> 
> Limit the modification within the dump_lockedsigs, and add two variables
> 'self.lockedsigs_types' and 'self.lockedsigs_raw' keep old sig file.
> 
> How to config for incremental dump:
> ...
> USER_CLASSES += "sstate_lockedsig"
> SIGGEN_LOCKEDSIGS_CONFIG = "${TOPDIR}/locked-sigs.inc"
> require ${SIGGEN_LOCKEDSIGS_CONFIG}
> ...
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>

I'm fine with the idea in principle. Why can't we do something like:

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index af7617e..1da282e 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -158,10 +158,14 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
                 sortedk = sorted(types[t], key=lambda k: self.lockedpnmap[k.rsplit(".",1)[0]])
                 for k in sortedk:
                     fn = k.rsplit(".",1)[0]
+                    pn = self.lockedpnmap[fn]
                     task = k.rsplit(".",1)[1]
                     if k not in self.taskhash:
                         continue
-                    f.write("    " + self.lockedpnmap[fn] + ":" + task + ":" + self.taskhash[k] + " \\\n")
+                    if pn in self.lockedsigs and task in self.lockedsigs[pn] and self.hashtask[k] == self.lockedsigs[pn][task]:
+                        continue
+                    sigentry = pn + ":" + task + ":" + self.taskhash[k]
+                    f.write("    " + sigentry + " \\\n")
                 f.write('    "\n')
             f.write('SIGGEN_LOCKEDSIGS_TYPES_%s = "%s"' % (self.machine, " ".join(types.keys())))
 

which is substantially simpler though?

Cheers,

Richard



