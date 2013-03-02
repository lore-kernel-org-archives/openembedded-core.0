Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UBvG4-0004O9-Rb for openembedded-core@lists.openembedded.org;
	Sat, 02 Mar 2013 23:50:40 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r22MfRvH023426; Sat, 2 Mar 2013 22:41:27 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id PoUWVV0-UyPk; Sat,  2 Mar 2013 22:41:27 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r22MfLoZ023422
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Sat, 2 Mar 2013 22:41:24 GMT
Message-ID: <1362263617.11004.17.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 02 Mar 2013 22:33:37 +0000
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Cc: "Ashfield, Bruce" <Bruce.Ashfield@windriver.com>, "Hart,
	Darren" <darren.hart@intel.com>
Subject: [PATCH] qemuimage-tests/dmesg: Add exception for error message on qemuarm with 3.8 kernel
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
X-List-Received-Date: Sat, 02 Mar 2013 22:52:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

With 3.8 kernels we get a harmless error message during kernel boot.
For now we can ignore. This allows the tests to pass and ensures we
can merge the 3.8 kernel.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/scripts/qemuimage-tests/tools/dmesg.sh b/scripts/qemuimage-tests/tools/dmesg.sh
index 66c0223..f0c9318 100644
--- a/scripts/qemuimage-tests/tools/dmesg.sh
+++ b/scripts/qemuimage-tests/tools/dmesg.sh
@@ -13,7 +13,9 @@ if [ $? -ne 0 ]; then
 	exit 1
 fi
 
-dmesg | grep -iq "error"
+# For now, ignore mmci-pl18x errors on qemuarm which appeared
+# from the 3.8 kernel and are harmless
+dmesg | grep -v mmci-pl18x | grep -iq "error"
 if [ $? -eq 0 ]; then
 	echo "QEMU: There is some error log in dmesg:"
 	echo "QEMU: ##### Error Log ######"




