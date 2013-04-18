Received: from mail-ie0-f181.google.com ([209.85.223.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1USytR-0004nM-5H
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Apr 2013 02:09:52 +0200
Received: by mail-ie0-f181.google.com with SMTP id tp5so1639102ieb.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2013 16:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=hg/M8HaXTX0diNRlbj+moydNsQuACtrqcWQ0WMF3Kos=;
	b=znSlgPzauNuSGMj7eHCnbB9mqU17wWScVUuFrnqn33CY/u/zWl+r16fAN4I+9GnKgH
	7Gerconn6eif5Hrxv45BX0f7K0uGoyweqJ616+ICcFQ+stpK+HH4ZDZg3ZMxt1JNBkBY
	YdZ3z7oGXuNGpoalW5GzMZ1VDcRTzYljmQd6ucAdSYlnziY2wJVdb4jewaacMxfpGomf
	IpbnzBN4e9JG7ku/N4hBSfK7lwyz39VKGBsF3qYmAYQP8sOtVMqR0jR337sD5j9MZVxD
	GpLMXGIAJwJqYvWV27Uzk4dNny74qYBfrNp6fwwcCWJzwte/FBUR4ezYL8DC/E+2LmRv
	smiA==
X-Received: by 10.50.212.105 with SMTP id nj9mr707473igc.17.1366329118905;
	Thu, 18 Apr 2013 16:51:58 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id xc3sm388596igb.10.2013.04.18.16.51.56
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 18 Apr 2013 16:51:57 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Apr 2013 16:51:51 -0700
Message-Id: <1366329111-11949-2-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.8.2
In-Reply-To: <1366329111-11949-1-git-send-email-kergoth@gmail.com>
References: <1366329111-11949-1-git-send-email-kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 2/2] package.bbclass: ensure license excluded files aren't packaged
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



