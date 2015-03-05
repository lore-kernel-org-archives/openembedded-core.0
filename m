Return-Path: <roosesweb@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id C966771637
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2015 14:53:24 +0000 (UTC)
Received: by wiwl15 with SMTP id l15so3657229wiw.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Mar 2015 06:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:from:date:message-id:subject:to:content-type;
	bh=uiIgL0azdsvq4wiFalS4iRRQl+BQs1jcO0gLhV2JrlU=;
	b=hcefirIUHSLXcdQNHyipO8ExGbE0IN2/HBCtlolMHSwvSBF76ftsvtpZ0DFSCvsCan
	OQqLyAn39t5YBkGpd1koKxrFjuqAKR/6Liq8FOSgkt876lOiaow8xsegZXEYdH15BfWN
	g7v79KMcWZvhQAR+lFoYoH+xtgz0JB7r0UDHTNovVx+2UB5AB8L32faE2+xsvx3cJc0y
	M5l5wCkssT26jpUZ2ADloUwpMFUkd+fsm8WZ71/nBxN7zzKKxg1sBfTPEn8iGcvHb23U
	z5VHg4IntADhSz1GWg2EYa1+BpkudXBg1wD0KzFjBic0lnCHwjLdxhvYtMHUDIIosuJw
	esXg==
X-Received: by 10.194.81.1 with SMTP id v1mr18758344wjx.50.1425567205164; Thu,
	05 Mar 2015 06:53:25 -0800 (PST)
MIME-Version: 1.0
Sender: roosesweb@gmail.com
Received: by 10.194.119.194 with HTTP; Thu, 5 Mar 2015 06:53:04 -0800 (PST)
From: Thomas Roos <thomas@roosesweb.de>
Date: Thu, 5 Mar 2015 15:53:04 +0100
X-Google-Sender-Auth: 2BuzMuAWQSz7gLW5IJGE81TTOI4
Message-ID: <CAAVZOXsFDXnWjSRETihjbwuJie4-kJK_9ucmRvrxA3OJ02qSqg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: regenerate pyc files when py files changed by sed
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
X-List-Received-Date: Thu, 05 Mar 2015 14:53:25 -0000
Content-Type: text/plain; charset=UTF-8

---
 meta/classes/distutils.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
index 6ed7ecc..c6963ee 100644
--- a/meta/classes/distutils.bbclass
+++ b/meta/classes/distutils.bbclass
@@ -42,8 +42,8 @@ distutils_do_install() {
         bbfatal "${PYTHON_PN} setup.py install execution failed."

         # support filenames with *spaces*
-        # only modify file if it contains path to avoid recompilation
on the target
-        find ${D} -name "*.py" -exec grep -q ${D} {} \; -exec sed -i
-e s:${D}::g {} \;
+        # only modify file if it contains path and recompile it
+                find ${D} -name "*.py" -exec grep -q ${D} {} \; -exec
sed -i -e s:${D}::g {} \; -exec
${STAGING_BINDIR_NATIVE}/python-native/python -mcompileall {} \;

         if test -e ${D}${bindir} ; then
             for i in ${D}${bindir}/* ; do \
-- 
1.9.1

