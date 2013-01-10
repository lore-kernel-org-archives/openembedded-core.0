Received: from mail-ea0-f180.google.com ([209.85.215.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martiert@gmail.com>) id 1TtE4p-0006bZ-DV
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Jan 2013 10:05:34 +0100
Received: by mail-ea0-f180.google.com with SMTP id f13so115797eai.39
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2013 00:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=CoyJVZ3gPw6J+Qi32e4mlqWo0NIpOWcOBog5UaYJe8Q=;
	b=OhrFBJcB7wn96QgLlflcP8vxKIt/5/F4aGW4UNkpiAvPyJww0mot7Jsj68goe75ZB4
	zqzg9Ry/VGQmUjVrmau7uJhRa8u1V3lli5PbHUusvVGK0V6Z60BPEYcTcFkfICUEuA9A
	WwdE/DFe0czUz1oxBpvznFlxZhTpEePLEwzmKBOgPXh4ntnFqstoOJLSdS3W+LK9WXKr
	+WMI8AeABw/ddOaJOlMbBbG90IitJzvVrVWWAAVwID4YYqVTZ1O8Z/M1WICa5rhxDSba
	cgiIMA4p/j7EVX1dR8smpgUh7SE13PaeTUYmjCyKiRqjkJQW1asoVjGtBHRgXu37eAnC
	bz+A==
X-Received: by 10.14.206.197 with SMTP id l45mr191303709eeo.17.1357807818578; 
	Thu, 10 Jan 2013 00:50:18 -0800 (PST)
Received: from dhcp-10-54-86-82.cisco.com (64-103-25-233.cisco.com.
	[64.103.25.233])
	by mx.google.com with ESMTPS id 44sm1908196eek.0.2013.01.10.00.50.17
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 10 Jan 2013 00:50:17 -0800 (PST)
From: Martin Ertsaas <martiert@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Jan 2013 09:50:05 +0100
Message-Id: <1357807806-31720-4-git-send-email-martiert@gmail.com>
X-Mailer: git-send-email 1.7.10.2 (Apple Git-33)
In-Reply-To: <1357807806-31720-1-git-send-email-martiert@gmail.com>
References: <1357807806-31720-1-git-send-email-martiert@gmail.com>
Subject: [PATCH 4/5] lib/oe/path.py: Use shutil.rmtree if the path we wish to remove is a directory.
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
X-List-Received-Date: Thu, 10 Jan 2013 09:05:39 -0000

On mac, os.unlink can not be done to remove directories, and so we have to
explicitly use shutil.rmtree instead to support mac.
---
 meta/lib/oe/path.py |    9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index 7197b23..1da39b7 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -86,14 +86,7 @@ def copytree(src, dst):
 
 def remove(path, recurse=True):
     """Equivalent to rm -f or rm -rf"""
-    for name in glob.glob(path):
-        try:
-            os.unlink(name)
-        except OSError, exc:
-            if recurse and exc.errno == errno.EISDIR:
-                shutil.rmtree(name)
-            elif exc.errno != errno.ENOENT:
-                raise
+    bb.utils.remove(path, recurse)
 
 def symlink(source, destination, force=False):
     """Create a symbolic link"""
-- 
1.7.10.2 (Apple Git-33)



