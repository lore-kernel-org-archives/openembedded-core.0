Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 67FC860D27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 16:20:13 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id en1so5541370wid.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 08:20:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=X0u8CqoalmVVsblXDTiCWJkqpMUUv5FG6l9p9gOxlX8=;
	b=eUI2yPPUib0QrqXZBVg9X4PQ1WegUmJhvgdzZscnEPex6Ga8SAhBD5QL49DJHP4ady
	zokeZJ5UPzDQvzgYi/rh5oRQW1T/aIgq+Jznqnp3RKPYkGHLT8KiQ/UuBLSYLtO5YCZ0
	YwWEGpdOSLQssL4gzDeAYLKy1uKj0oWpe+4lP5tmIXhIPQxzgH1e1cLXl9qhuWLfZrwF
	th9VxCB0UG61Kr74ShNtNZOtUsDxsJVs9gyVoIm6pA/cXZClcZab5s9k9TxOMeJS8Vdx
	j20PhedOVv9qNl9cD5tIpiXaLQeOeY3qFd+0eWq1+5ioSh+dqT/9Kvf/hXFLa5MD7mbY
	a2Uw==
X-Gm-Message-State: ALoCoQnI7eRvg3Df6sR4HffUIzse88/VDqYUsRlzj0ZU2esKVAVIJmc9vMfayrZR/Lg2ah6WUUnk
X-Received: by 10.194.59.240 with SMTP id c16mr25375338wjr.13.1387383613674;
	Wed, 18 Dec 2013 08:20:13 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id e1sm2179947wij.7.2013.12.18.08.20.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Dec 2013 08:20:12 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Dec 2013 16:20:02 +0000
Message-Id: <1387383607-4005-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/6] useradd.bbclass: add dependency on base-files
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
X-List-Received-Date: Wed, 18 Dec 2013 16:20:14 -0000

Packages that use useradd.bbclass should have a dependency on base-files so that
the /etc/skel directory is populated.  Without this dependency base-files may or
may not be installed when the postinst runs, and the skel content may or may not
be copied.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/useradd.bbclass |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index a850e9d..a2ad648 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -182,6 +182,8 @@ fakeroot python populate_packages_prepend () {
         rdepends = d.getVar("RDEPENDS_%s" % pkg, True) or ""
         rdepends += ' ' + d.getVar('MLPREFIX') + 'base-passwd'
         rdepends += ' ' + d.getVar('MLPREFIX') + 'shadow'
+        # base-files is where the default /etc/skel is packaged
+        rdepends += ' ' + d.getVar('MLPREFIX') + 'base-files'
         d.setVar("RDEPENDS_%s" % pkg, rdepends)
 
     # Add the user/group preinstall scripts and RDEPENDS requirements
-- 
1.7.10.4


