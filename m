Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rongqing.Li@windriver.com>) id 1SyMwU-0006Uo-P1
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Aug 2012 15:01:55 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q76Co8tB021787
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Aug 2012 05:50:09 -0700 (PDT)
Received: from [128.224.162.163] (128.224.162.163) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Mon, 6 Aug 2012 05:50:08 -0700
Message-ID: <501FBD86.3090705@windriver.com>
Date: Mon, 6 Aug 2012 20:50:14 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, "Yang, Liezhi"
	<Liezhi.Yang@windriver.com>, "Hatle, Mark" <mark.hatle@windriver.com>
Subject: Could we build tar-replacement firstly and not parallel if tar-replacement is needed to build
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
X-List-Received-Date: Mon, 06 Aug 2012 13:01:55 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi:

Building failed several times when building tar-replacement-native is 
needed,
The error log shows 
"bitbake_build/tmp/sysroots/x86_64-linux/usr/bin/tar: Text
file busy". this log proves "an attempt was made to execute a 
pure-procedure
program that is currently open for writing."


Before this error, tar-replacement do_populate_sysroot just starts,
(tar-replacement-native-1.26-r2: task do_populate_sysroot: Started)
After this error, we see tar-replacement do_populate_sysroot just
finish.

So I think the root cause is that do_populate_sysroot sqlite is using
a tar command which being opened to written. in fact, all packages
need tar to do_popolate_sysroot()

I see building tar-replacement-native is started in bitbake file,
could we build tar-replacement firstly, not parallel if needed.



diff --git a/scripts/bitbake b/scripts/bitbake
index 3772d82..1bb8fed 100755
--- a/scripts/bitbake
+++ b/scripts/bitbake
@@ -134,7 +134,10 @@ if [ $buildpseudo -gt 0 ]; then
              fi
          done
      done
-    bitbake pseudo-native $TARTARGET $additionalopts -c populate_sysroot
+
+    if [ $needptar = "1" ]; then
+       sed -i 's/BB_NUMBER_THREADS =/#BB_NUMBER_THREADS =/g' 
conf/local.conf
+       bitbake $TARTARGET
+       sed -i 's/#BB_NUMBER_THREADS =/BB_NUMBER_THREADS =/g' 
conf/local.conf
+    fi
+
+    bitbake pseudo-native $additionalopts -c populate_sysroot
      ret=$?
      if [ "$ret" != "0" ]; then
          exit 1


since building tar-replacement or not depends on host tar version, it is
hard to add a tar dependence to any package, and I did not have a good way
to fix this bug except the upper.

Any advice and suggestion are welcome


-- 
Best Reagrds,
Roy | RongQing Li



