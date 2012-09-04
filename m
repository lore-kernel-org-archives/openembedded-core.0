Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T8pJi-0002Gv-V3
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 11:21:07 +0200
Received: by bkcik5 with SMTP id ik5so3124168bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Sep 2012 02:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=U9tXOygiiXf5hKBg3vQvEQ0eTSibeviX5JETPEv3rDQ=;
	b=p/dPaRJ7K4nbSaRQHRwZFu7id3ZG1RQppseguNLoaO2Z5j5S7vWCR+BWzCk245MC+0
	ATFazBbhdBdYDJe+RKTo7L6jjgRWgoq4vNK/NfPem8IIA/PQ13kgDwYguyzBf7rnCE6K
	W4QsJejE80tGfxEFkigrMK4hygxiFbZoARBuCrz5DHtzzyl3e9/g3HEB3kWpQJiCyqJD
	bTH5iLod0Kmgw4hhzsj8LDvqAjf8fYfFDba44oPEg4kpgfPR+KZO/wMBX3xKy7NEAMhf
	6O/0kEOqFrcGohVu3yNcI+UNhExxiD+NddzzNGUJ9vHose16jk0zWI6YQX5o8owiF9Kr
	E4fQ==
Received: by 10.204.156.87 with SMTP id v23mr8040005bkw.0.1346749725546;
	Tue, 04 Sep 2012 02:08:45 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id m9sm9639679bkm.10.2012.09.04.02.08.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Sep 2012 02:08:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Sep 2012 11:09:11 +0200
Message-Id: <1346749751-25699-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
Subject: [PATCH] bitbake.conf: FETCHCMD_svn add --non-interactive --trust-server-cert
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
X-List-Received-Date: Tue, 04 Sep 2012 09:21:07 -0000

* now with subversion-native we know those 2 options are supported
* with https protocol used for SVN checkouts we cannot confirm certificate and do_fetch fails
  Error validating server certificate for 'https://foo:443':
  - The certificate is not issued by a trusted authority. Use the
    fingerprint to validate the certificate manually!
    Certificate information:
    ...
    (R)eject, accept (t)emporarily or accept (p)ermanently? svn: E175002: Unable to connect to a repository at URL 'https://foo/trunk'
    svn: E175002: OPTIONS of 'https://foo/trunk': Server certificate verification failed: issuer is not trusted (https://foo)
    ERROR: Function failed: Fetcher failure for URL: 'svn://foo;protocol=https;module=trunk'. Unable to fetch URL from any source.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 1d56813..161cdaf 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -578,7 +578,7 @@ XORG_MIRROR = "http://xorg.freedesktop.org/releases"
 #  export DEBIAN_MIRROR = "ftp://ftp.de.debian.org/debian/pool"
 #     into your local.conf
 
-FETCHCMD_svn = "/usr/bin/env svn"
+FETCHCMD_svn = "/usr/bin/env svn --non-interactive --trust-server-cert"
 FETCHCMD_cvs = "/usr/bin/env cvs"
 FETCHCMD_wget = "/usr/bin/env wget -t 2 -T 30 -nv --passive-ftp --no-check-certificate"
 FETCHCMD_bzr = "/usr/bin/env bzr"
-- 
1.7.12



