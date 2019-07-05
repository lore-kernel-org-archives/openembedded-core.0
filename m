Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id C97C07EBDB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2019 16:14:11 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id f4so4686083ioh.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Jul 2019 09:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=qCuhk0lPADogfNYox+qLluN0XfwAT7SXQaU5BCFWY/M=;
	b=eUbdr7uCZgfEX1BDaQ4DhbCfA+rZq/0KusF9DYtVlJei1HWWroOOMn5P2aiHaDSsxN
	xYUyCOKL7bcV6lQ67dWgKkIjj8cLAV16jXXJAYKqQqUZcFmZerU1uiXEFU5qa8m0x7r1
	XOErbdclOQ5qb1adeEK2WfV6Rbs2nDOEYyZJcSmgTDw+iYZz2jcRskIm2NTG9EWgnNYt
	udPt0W49C+TU5lXh81ezBRNXukgQwDP+8ZO0VrmRtTE5YWttPdIjT95PtfzxpyAUhnNT
	SR/eVp09yImGR91SfcErY7UOs8VCiZgDY6TMWnm9Y6cbEjdMKRW9Ek3/OGZ1KjPXzwFm
	1sJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=qCuhk0lPADogfNYox+qLluN0XfwAT7SXQaU5BCFWY/M=;
	b=tBbQ846rffmjWvOMdV9LPtRYSTAvxIt+PN9P+RBRPy6YHoM6Fw/017+YW7BkaAVFMp
	/1zdaswbg1/4ecNLgBi+pt/rKNvZy7/vMHw+0xc09RHHcGBqnOcsq/Kp2Gpt/cUACooa
	g+cvc4WLNwOKrCkC1RdCV2FfDpqkQKiEsr/bBjO7WpiFJexH/SlvDa35GmEq9T/7OY0i
	1lhW8ZJJPIJ0uXheuzCvF3PVAbToszqs/0cA03CZ77gLPh8USfu76ClptKzWzH4u12Ea
	peO7bnffa6bDK2Wmps17iSrSOjUBsbQDeKbOCTb5Qc1zd7HFmEI3X8RidV2A43OrbjUi
	0Dyw==
X-Gm-Message-State: APjAAAUYFpX31D5Ks0kEZ4GXPdHljRhAVvGYY3TwfRxn1QNHk1LpXjuP
	J7lJvxxdiI/f4mQUgEdkyT2pgoDpyAc=
X-Google-Smtp-Source: APXvYqymL9Td2IYsZRhchcjpI7tc3l2WDPVhcsCvgdgPIkoDyQQf5PGF042VrfNInaec0UA9v3AU7Q==
X-Received: by 2002:a5d:8411:: with SMTP id i17mr3118840ion.83.1562343252488; 
	Fri, 05 Jul 2019 09:14:12 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	m10sm1871386ioj.75.2019.07.05.09.14.11
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 05 Jul 2019 09:14:11 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Fri,  5 Jul 2019 12:14:05 -0400
Message-Id: <778778135f69e74a4f2774698c52957af62ee3b3.1562342843.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1562342843.git.bruce.ashfield@gmail.com>
References: <cover.1562342843.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] package: check PKG_ variables before executing ontarget postinst
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
X-List-Received-Date: Fri, 05 Jul 2019 16:14:11 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@xilinx.com>

If a package uses PKG_ variables to map package names to version specific
variants, on target postinstall functionality will be broken.

i.e. something like the following casuses rootfs assembly errors:

  d.setVar('pkg_postinst_ontarget_linux-source', 'cd /usr/src/; ln -sf %s linux-source' % source_pkg)

This breakage is due to the fact that the original package name (as specified by
the PACKAGES variable) is logged by the intercept scripts, but the mapped /
specific version is actually installed to the rootfs (and hence logged by the
package manager).

When the runtime listing of on-target scripts is performed, we get a package
manager error due to a missing package, since it checks the generic version
logged by the intercept scripts.

We can fix this by ensuring that the PKG_ variable mapped package name
is logged by the intercept phase, and hence the package manager can locate
and execute the on target postinst script.

This variable check is consistent with other places in the code, and has
no impact if PKG_ variables are not used.

Signed-off-by: Bruce Ashfield <bruce.ashfield@xilinx.com>
---
 meta/classes/package.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index b4471532a3..8b89fb1129 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1358,12 +1358,16 @@ python emit_pkgdata() {
     import json
 
     def process_postinst_on_target(pkg, mlprefix):
+        pkgval = d.getVar('PKG_%s' % pkg)
+        if pkgval is None:
+            pkgval = pkg
+
         defer_fragment = """
 if [ -n "$D" ]; then
     $INTERCEPT_DIR/postinst_intercept delay_to_first_boot %s mlprefix=%s
     exit 0
 fi
-""" % (pkg, mlprefix)
+""" % (pkgval, mlprefix)
 
         postinst = d.getVar('pkg_postinst_%s' % pkg)
         postinst_ontarget = d.getVar('pkg_postinst_ontarget_%s' % pkg)
-- 
2.19.1


