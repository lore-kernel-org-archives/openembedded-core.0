Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 834CA71DCF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 17:13:43 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id c85so35686046wmi.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 09:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=dCFe0MjKzXHTNAKp1EJdhTtmFGPQIpu8LIyUBcupUko=;
	b=wxhIeDvmYOpwuiszQ7UBqGp0Qbnp5Thi1jkemXPzB8GoeN2mxpM0nXSe77fQeQfHoL
	cflfrgVrXv9wjyykITw0sw1rSvdhaZuD78SOfsI7L1xTTRFb+hQrCb8Dz3O7QOeKb9aq
	7EFEsRp9d6EMMBN1XQMNrGCfDJxduTn0vjbwOCH2ekhazq8U9V0ymOtnwqB2wqDzBPbY
	fXJXZNcYKN4TY5oGdIcjJ7ThX+scvzv0FzVcsfyELIvzB7XgdKnhvROIiW3O0PaDJ9Xa
	+ULDYB6Ld+Qx3Nfjqe7Fpd6797cOJxCB7qSD3tENrWx2nQcoigZa0syYfxsDHTk9HFg5
	HVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=dCFe0MjKzXHTNAKp1EJdhTtmFGPQIpu8LIyUBcupUko=;
	b=k3TShNpj3kOUbjG6uX71xuBZOQyO7+yXNvu1E7BhMEvsSgH/w/uyIVr/NuekqyA7TB
	CoGfYdQUA6G5GCGzWpaYs/2CGxeRPxXoQl/lqHaU0AUgxeCf56KG87LHiaegjja5oel2
	cxagJYdLPkefI4HTsJxUBn9sO6Asgnrd3noSTqXPGrNB0gUJvRC3goIP+4iytg5dnOlC
	uxUlWB6pCdnl8jaL3y3hm7XJPzz7o63lfiJ18kTmX15oCFMiERabLg73yUA669PtCho6
	bygIepY+R/8czzdZ9PL4fmF5p4FLAVb4FMlNfTsxsYs4uaiBjhEfV0S1Vzaeut8IhTRm
	tefA==
X-Gm-Message-State: AIkVDXLvwZgjjQJML0Njleqcdcl7kKUYhEzonmrKnfJMP000n5Rwrmn+5KV3TXr4atZPwKmm
X-Received: by 10.28.111.220 with SMTP id c89mr22366189wmi.102.1485364423022; 
	Wed, 25 Jan 2017 09:13:43 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	z90sm26068925wrc.24.2017.01.25.09.13.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Jan 2017 09:13:42 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jan 2017 17:13:40 +0000
Message-Id: <1485364420-21561-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] package_deb: handle allarch when mapping tune to dpkg architectures
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
X-List-Received-Date: Wed, 25 Jan 2017 17:13:44 -0000

It was discovered that buildtools-tarball can't be built with Debian packaging:

E: Unable to locate package nativesdk-buildtools-perl-dummy

The package exists but dpkg doesn't see it because the Architecture field isn't
valid: for this package the Architecture field is 'allarch' which isn't in the
list of valid architectures we define.

package_deb already has a mapping of OE architectures (PACKAGE_ARCH) to dpkg
architectures (DPKG_ARCH), for example our x86_64 is amd64 in dpkg.  However
allarch.bbclass sets an invalid TARGET_ARCH of 'allarch' (to break anything
which attempts to use the target architecture) and package_deb relied on the
PACKAGE_ARCH check later turning the Architecture field into 'all'.

This usually works, but nativesdk-buildtools-perl-dummy inherits allarch but
then changes PACKAGE_ARCH to buildtools-dummy-nativesdk to isolate the packages
in a separate feed.  We can handle this by explictly checking for allarch in the
TARGET_ARCH check, as that everything that inherits allarch will want to have
Architecture: all in their packages.

[ YOCTO #10700 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/package_deb.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 47fcd6b..eb549ca 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -17,6 +17,8 @@ APT_ARGS = "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMENDATIONS") ==
 
 def debian_arch_map(arch, tune):
     tune_features = tune.split()
+    if arch == "allarch":
+        return "all"
     if arch in ["i586", "i686"]:
         return "i386"
     if arch == "x86_64":
-- 
2.8.1


