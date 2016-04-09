Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0679B771C6
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Apr 2016 22:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u39MGAD3012654 for <openembedded-core@lists.openembedded.org>;
	Sat, 9 Apr 2016 23:16:10 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id xEuNYBLzQcWS
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Apr 2016 23:16:10 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u39MG9mw012651
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 9 Apr 2016 23:16:10 +0100
Message-ID: <1460240169.9308.10.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 09 Apr 2016 23:16:09 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] distrodata: Exclude DATETIME reference from sstate checksum
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
X-List-Received-Date: Sat, 09 Apr 2016 22:16:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Otherwise the task hash changes between server and worker context
leading to changing task checksums.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
index 44c06e1..51bfc1e 100644
--- a/meta/classes/distrodata.bbclass
+++ b/meta/classes/distrodata.bbclass
@@ -104,6 +104,7 @@ python do_distrodata_np() {
             line = line + "," + i
         bb.note("%s\n" % line)
 }
+do_distrodata_np[vardepsexclude] = "DATETIME"
 
 addtask distrodata
 do_distrodata[nostamp] = "1"
@@ -196,6 +197,7 @@ python do_distrodata() {
             f.close()
         bb.utils.unlockfile(lf)
 }
+do_distrodata[vardepsexclude] = "DATETIME"
 
 addtask distrodataall after do_distrodata
 do_distrodataall[recrdeptask] = "do_distrodataall do_distrodata"



