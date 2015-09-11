Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4FB107423D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Sep 2015 12:25:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8BCOuNs027258 for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Sep 2015 13:25:03 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id y_NpKORiKjgi
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Sep 2015 13:25:03 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8BCOoQc027253
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Sep 2015 13:25:01 +0100
Message-ID: <1441974290.24871.382.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 11 Sep 2015 13:24:50 +0100
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] testimage: Fix SDK extraction error handling
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
X-List-Received-Date: Fri, 11 Sep 2015 12:25:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently if the SDK fails to extract, no error is shown and the test is marked
as passed! Clearly this is incorrect, fix it to correctly raise an error.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index f0b732a..ad1f0d1 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -379,7 +379,10 @@ def testsdk_main(d):
     sdktestdir = d.expand("${WORKDIR}/testimage-sdk/")
     bb.utils.remove(sdktestdir, True)
     bb.utils.mkdirhier(sdktestdir)
-    subprocess.call("cd %s; %s <<EOF\n./tc\nY\nEOF" % (sdktestdir, tcname), shell=True)
+    try:
+        subprocess.check_output("cd %s; %s <<EOF\n./tc\nY\nEOF" % (sdktestdir, tcname), shell=True)
+    except subprocess.CalledProcessError as e:
+        bb.fatal("Couldn't install the SDK:\n%s" % e.output)
 
     try:
         targets = glob.glob(d.expand(sdktestdir + "/tc/environment-setup-*"))



