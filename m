Received: from mail-pa0-f42.google.com ([209.85.220.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1USyt4-0004lr-3D
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Apr 2013 02:09:52 +0200
Received: by mail-pa0-f42.google.com with SMTP id kq13so1904779pab.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2013 16:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=hg/M8HaXTX0diNRlbj+moydNsQuACtrqcWQ0WMF3Kos=;
	b=VEMlr7a+G8NjZf3JzFpyxdigZ6ixIGwPhCqNjNXMjCVvN8/66yrgcVotC3JUihJPPK
	o7tMmNvbSrgKkh8H/Rbjq8BPJ+W2uRvheWTl5Zu/zruxJIiCVbCpQ1dKIrBq0Rv/Bo0V
	D9v6+ir5PU/zuZf6QOTlCurNxAT+/AclEiKYDhF8BMjzmVCSq+IYEkK2+AHL29TcrdcQ
	Fm7MXdgyX99OTkh6c9OozNZhL0jEw8ZK8ALAYcboTJDXGf9KJFR8XIL6T38uFK5Vwt5p
	DS/5aI9xjRXHH1+37vN6hNCGsPTSkS/VLEYu9zDGCdEbbySnamP9C9PfH0dvrtI7f3rA
	Z7hg==
X-Received: by 10.68.200.162 with SMTP id jt2mr15660525pbc.138.1366329095694; 
	Thu, 18 Apr 2013 16:51:35 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id ak5sm12488443pac.4.2013.04.18.16.51.33
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 18 Apr 2013 16:51:34 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Apr 2013 16:51:25 -0700
Message-Id: <1366329085-11756-2-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.8.2
In-Reply-To: <1366329085-11756-1-git-send-email-kergoth@gmail.com>
References: <1366329085-11756-1-git-send-email-kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [for-dylan][PATCH 2/2] package.bbclass: ensure license excluded files aren't packaged
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
X-List-Received-Date: Fri, 19 Apr 2013 00:10:15 -0000

From: Christopher Larson <chris_larson@mentor.com>

An excluded package left its files behind, which meant they could end up in
another package instead, meaning we could ship GPLv3 binaries even with GPLv3
in INCOMPATIBLE_LICENSE. Skip the files belonging to the excluded packages to
prevent this from occurring.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/package.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 5524816..1a8da40 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -925,7 +925,7 @@ python populate_packages () {
     for pkg in packages.split():
         if d.getVar('LICENSE_EXCLUSION-' + pkg, True):
             bb.warn("%s has an incompatible license. Excluding from packaging." % pkg)
-        elif pkg in package_list:
+        if pkg in package_list:
             bb.error("%s is listed in PACKAGES multiple times, this leads to packaging errors." % pkg)
         else:
             package_list.append(pkg)
@@ -965,6 +965,9 @@ python populate_packages () {
                 continue
             seen.append(file)
 
+            if d.getVar('LICENSE_EXCLUSION-' + pkg, True):
+                continue
+
             def mkdir(src, dest, p):
                 src = os.path.join(src, p)
                 dest = os.path.join(dest, p)
-- 
1.8.2



