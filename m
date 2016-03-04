Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id F3EB67317E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Mar 2016 16:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u24GMUAk001866 for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Mar 2016 16:22:30 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id HvN1U85Lg5Gl
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Mar 2016 16:22:30 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u24GMQ8v001863
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Mar 2016 16:22:27 GMT
Message-ID: <1457108546.2804.37.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 04 Mar 2016 16:22:26 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] ext-sdk-prepare: Catch setscene tasks which should have run but didn't
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
X-List-Received-Date: Fri, 04 Mar 2016 16:22:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

When installing the eSDK, if setscene task fail for some reason, the tests 
would ignore this. This is bad since we assume they're working.

This adds some sanity test code which detects if setscene tasks are 
needing to run and errors if there are any.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/files/ext-sdk-prepare.py b/meta/files/ext-sdk-prepare.py
index 143e0fe..c99e34f 100644
--- a/meta/files/ext-sdk-prepare.py
+++ b/meta/files/ext-sdk-prepare.py
@@ -72,12 +72,14 @@ def main():
                 else:
                     line = line.split('Running', 1)[-1]
                     unexpected.append(line.rstrip())
+            elif 'Running setscene' in line:
+                unexpected.append(line.rstrip())
     except subprocess.CalledProcessError as e:
         print('ERROR: Failed to execute dry-run:\n%s' % e.output)
         return 1
 
     if unexpected:
-        print('ERROR: Unexpected tasks left over to be executed:')
+        print('ERROR: Unexpected tasks or setscene left over to be executed:')
         for line in unexpected:
             print('  ' + line)
         return 1



