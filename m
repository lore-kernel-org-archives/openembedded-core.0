Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A578171FC3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Nov 2014 18:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sA5IgXjA028197 for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Nov 2014 18:42:33 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id pW-rsuvc3zRI
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Nov 2014 18:42:33 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sA5IgTlQ028193
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Nov 2014 18:42:30 GMT
Message-ID: <1415212983.23396.57.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 05 Nov 2014 18:43:03 +0000
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Subject: [PATCH] base: Make PRINC warning an error
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
X-List-Received-Date: Wed, 05 Nov 2014 18:43:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Apparently 1.5 years of warnings isn't enough to get anyone to take any
notice. We therefore make this an error so people can ignore it for
another 6 months whereafter we can finally give up and remove the
obsolete code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index e1b25ff..f5b216b 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -375,7 +375,7 @@ python () {
     # obsolete.  Return a warning to the user.
     princ = d.getVar('PRINC', True)
     if princ and princ != "0":
-        bb.warn("Use of PRINC %s was detected in the recipe %s (or one of its .bbappends)\nUse of PRINC is deprecated.  The PR server should be used to automatically increment the PR.  See: https://wiki.yoctoproject.org/wiki/PR_Service." % (princ, d.getVar("FILE", True)))
+        bb.error("Use of PRINC %s was detected in the recipe %s (or one of its .bbappends)\nUse of PRINC is deprecated.  The PR server should be used to automatically increment the PR.  See: https://wiki.yoctoproject.org/wiki/PR_Service." % (princ, d.getVar("FILE", True)))
         pr = d.getVar('PR', True)
         pr_prefix = re.search("\D+",pr)
         prval = re.search("\d+",pr)



