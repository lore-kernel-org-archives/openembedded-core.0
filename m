Return-Path: <tom.rini@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id D108678268
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 00:00:27 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id w143so2781530yww.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Jun 2017 17:00:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=nJich8F2hbymqRjtxnee6bZ7jmkzl9Xh782LfFuPBlw=;
	b=rprtD+ALmhNYIlBXJzqsjpBjRMOimnTDCDGk1DgCASNs6vYRcwJFJ5/fux9N5gO88W
	PRX10MdVHZHBPNBfWd/aL/unBY/xmfBBHfQO25aQ8JKloZe7HCEaCG+iNaTRbRMpPXCH
	Ni8qDYEQPmnwIYLxat3VF+C4iN0llR+dJGNCh4kTn45iGe8zCfe4vSIH1uO1v6ZCns3p
	aiaktDYXFlPN6hCFX0BnqjbMCQj7CBLQG3OEtOkQEFpOy3/HWhl05DkYOfp/Q1VYRGC6
	/FuMc7sNgb4VssSXRZXwbtd77Grj63ROyd8Bb39ISHKEdx0A3NHkwOPD2WOX6NelDUSd
	ypoA==
X-Gm-Message-State: AODbwcB5lH0nbO7gW7tBiLsIhQJNGNiwdz94CiG4hXWoZO5CUzyr4oMD
	J4KxPzGde8b5pPKN
X-Received: by 10.13.234.213 with SMTP id t204mr2014219ywe.180.1496966428562; 
	Thu, 08 Jun 2017 17:00:28 -0700 (PDT)
Received: from localhost.localdomain (cpe-75-180-228-133.ec.res.rr.com.
	[75.180.228.133]) by smtp.gmail.com with ESMTPSA id
	w191sm3085796ywg.10.2017.06.08.17.00.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 08 Jun 2017 17:00:28 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Jun 2017 20:00:41 -0400
Message-Id: <1496966441-30260-3-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1496966441-30260-1-git-send-email-trini@konsulko.com>
References: <1496966441-30260-1-git-send-email-trini@konsulko.com>
Subject: [PATCH 3/3] dpkg: Add missing RDEPENDS for dpkg-perl
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
X-List-Received-Date: Fri, 09 Jun 2017 00:00:28 -0000

In order to be able to use dpkg-perl on a system various stock perl
modules must also be installed on the system.  Create the list of
required modules based on a read of the code and testing with additional
utilities and list them in RDEPENDS_${PN}-perl.

Signed-off-by: Tom Rini <trini@konsulko.com>
---
 meta/recipes-devtools/dpkg/dpkg.inc | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index a61839b21540..836bb1a82252 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -69,6 +69,25 @@ RPROVIDES_update-alternatives-dpkg += "update-alternatives"
 PACKAGES += "${PN}-perl"
 FILES_${PN}-perl = "${libdir}/perl/${PERLVERSION}"
 
+RDEPENDS_${PN}-perl += "perl-module-carp perl-module-constant \
+                        perl-module-cwd perl-module-digest \
+                        perl-module-digest-md5 perl-module-errno \
+                        perl-module-exporter perl-module-fcntl \
+                        perl-module-feature perl-module-file-basename \
+                        perl-module-file-compare perl-module-file-copy \
+                        perl-module-file-find perl-module-file-path \
+                        perl-module-file-spec perl-module-file-temp \
+                        perl-module-list-util perl-module-overload \
+                        perl-module-parent perl-module-storable \
+                        perl-module-filehandle perl-module-io \
+                        perl-module-io-handle perl-module-io-seekable \
+                        perl-module-posix perl-module-scalar-util \
+                        perl-module-selectsaver perl-module-symbol \
+                        perl-module-term-ansicolor perl-module-tie-handle \
+                        perl-module-tie-hash perl-module-storable \
+                        perl-module-time-hires perl-module-time-piece \
+                        perl-module-xsloader"
+
 # Split out start-stop-daemon to its own package.  Note that it
 # is installed in a different directory than the one used for
 # the bitbake version.
-- 
1.9.1


