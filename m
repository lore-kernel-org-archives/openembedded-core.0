Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U0B6Z-0002Hc-55
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 14:20:07 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa10so384003pad.20
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2013 05:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=bbrC0JC5meLD6vpwfOqrAXx4CzEeGVFx+Xeqi92z2A4=;
	b=lYDzH1rWyBUiHjmW1brZfU+v5HhJAoa6OnF1wevWxrAEvwJ6ZSe37NgYuc/yvUI3p2
	88X7qQOiJRBtEwWAtSQyuZth69tBfyQtRG/ankB/3RJtdVbSIioCupGIm1Jj7MGhlsza
	dUP4ySHECsQxsUXmSpU572vUzWQAiuo754ykPRIYBcMLfj1ZJ3F2GMEuWYLWCebMSgMC
	hCOOnHE0gv7vCXQFZi/xQ7XPYdVTmXoTUgzQDCDLQvM4fWqkxjw7AGTEnNR1vStEZZzr
	g5Dm2JAor5dmYkPMiMOeK/XrtFdX7auXFW4V4YdYVTqU6mSMjmMUfRboC+JpsVuOPk4V
	S7jA==
X-Received: by 10.66.72.225 with SMTP id g1mr2346436pav.79.1359464662135;
	Tue, 29 Jan 2013 05:04:22 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id kp4sm8375449pbc.52.2013.01.29.05.04.19
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 29 Jan 2013 05:04:21 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Jan 2013 14:04:16 +0100
Message-Id: <1359464656-27638-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1359463060-12321-1-git-send-email-Martin.Jansa@gmail.com>
References: <1359463060-12321-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCHv2] license: fix LICENSE_CREATE_PACKAGE to stay disabled by default
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
X-List-Received-Date: Tue, 29 Jan 2013 13:20:08 -0000

* as reported by Enrico on #oe
  11:06:50 < ensc|w> JaMa: might this be caused by dc78ef91a2bf01efb8028c9afbe69e506e016265
  which checks for 'd.getVar('LICENSE_CREATE_PACKAGE', True)' evaluating to 'True' for every
  string (including the default 0)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/license.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index d4ebb26..229f755 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -103,7 +103,7 @@ python do_populate_lic() {
 # it would be better to copy them in do_install_append, but find_license_filesa is python
 python perform_packagecopy_prepend () {
     enabled = d.getVar('LICENSE_CREATE_PACKAGE', True)
-    if d.getVar('CLASSOVERRIDE', True) == 'class-target' and enabled:
+    if d.getVar('CLASSOVERRIDE', True) == 'class-target' and enabled == "1":
         lic_files_paths = find_license_files(d)
 
         # LICENSE_FILES_DIRECTORY starts with '/' so os.path.join cannot be used to join D and LICENSE_FILES_DIRECTORY
-- 
1.8.1.2



