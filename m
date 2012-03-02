Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S3RRx-0007Gu-UV for openembedded-core@lists.openembedded.org;
	Fri, 02 Mar 2012 13:19:06 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q22CAZHw030591
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Mar 2012 12:10:35 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29538-05 for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2012 12:10:30 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q22CAQ0t030585
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Mar 2012 12:10:27 GMT
Message-ID: <1330690229.15224.7.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 02 Mar 2012 12:10:29 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] base.bbclass: If unpacking again, wipe out ${S}/patches
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
X-List-Received-Date: Fri, 02 Mar 2012 12:19:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If we unpack again, its assumed the data in any patches directory is invalid
since do_patch will run again. This ensures old patch data doesn't get
reused in a confused way.

Ideally we should probably wipe out ${S} here but that is probably a change
for another time.

[YOCTO #2043 partially]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index a76fe55..39d3e78 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -94,6 +94,7 @@ python base_do_fetch() {
 
 addtask unpack after do_fetch
 do_unpack[dirs] = "${WORKDIR}"
+do_unpack[cleandirs] = "${S}/patches"
 python base_do_unpack() {
 	src_uri = (d.getVar('SRC_URI', True) or "").split()
 	if len(src_uri) == 0:




