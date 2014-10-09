Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 501F4708B3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Oct 2014 05:29:41 +0000 (UTC)
Received: by mail-ig0-f176.google.com with SMTP id hn15so10746292igb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Oct 2014 22:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=sX74D26GK025Njx6/7jK3l6d/hiEe/2V62eLlrfapcE=;
	b=0cXjKxSk6fXFX3eUQ2SKC2WpG8V3NTe1nG1t2sGYnCSyakJMqwHPvcZ5x1UqU1dbtV
	ddveSEldKIvayKG8Ava+TnL4pAeXeAZiYK+NY9A78HFa6LxyI91wG4BiZMywJzq6c0Y3
	w+Wlwvyp36GdWQmBEzmd0auK6N2YpMvJO+nZ96MtflUUWZXsd4Fg2hvN4Qbi6weFPZeA
	SqHnFEOEORjhogNM8G6lxpwaybpx+Het99+p9ePZqTVWxpYj3Sxbjh5th9DaT4Xg4oaZ
	Vjb+SKiGW/cANHQv6Tvi1JhPHEK8jOiL9sz0lk3Sew1DXSom0W5GM4n3IvErcgTwU9lQ
	+dHQ==
X-Received: by 10.42.15.201 with SMTP id m9mr4273620ica.80.1412832582883;
	Wed, 08 Oct 2014 22:29:42 -0700 (PDT)
Received: from haswell.localdomain (c-76-103-58-225.hsd1.ca.comcast.net.
	[76.103.58.225])
	by mx.google.com with ESMTPSA id dx10sm5075360igb.4.2014.10.08.22.29.40
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Oct 2014 22:29:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Oct 2014 22:33:05 -0700
Message-Id: <1412832785-4946-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.2
Subject: [PATCH] package_do_shlibs: Look for provider in the path thats in shlib_provider dictionary
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
X-List-Received-Date: Thu, 09 Oct 2014 05:29:52 -0000

shlib2 code puts the information about path where a provider
will be found. e.g.

{'/usr/lib/llvm3.3': ('libllvm3.3-llvm-3.3', '3.3')}

This is obtained from new shlib2 pkgdata from

llvm3.3/3.3-r0/pkgdata/shlibs2/libllvm3.3-llvm-3.3.list

However when we search for NEEDED libraries we ignore the
key above which is the path where the provider library is installed
and instead just seach in libdir and base_libdir and hence
libraries which are not in above standard search paths gets
ignored even if they appear in DT_NEEDED sections

and a note is emitted

NOTE: Couldn't find shared library provider for libLLVM-3.3.so, used by
files: ....

IMO this note should actually become an error since if we do
not have all DT_NEEDED libraries in image the system is dysfunctional.

This patch extracts this libpath from key and add it to seach paths
when looing for a provider of a shared library

[YOCTO #6798]

Change-Id: Ie5f08632e37ba8d3439c8aaae33bc68b8996792f
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/package.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index f17c8d5..2aec3e6 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1572,8 +1572,11 @@ python package_do_shlibs() {
                 bb.debug(2, '%s: Dependency %s covered by PRIVATE_LIBS' % (pkg, n[0]))
                 continue
             if n[0] in shlib_provider.keys():
+                shlib_provider_path = list()
+                for k in shlib_provider[n[0]].keys():
+                    shlib_provider_path.append(k)
                 match = None
-                for p in n[2] + libsearchpath:
+                for p in n[2] + shlib_provider_path + libsearchpath:
                     if p in shlib_provider[n[0]]:
                         match = p
                         break
-- 
2.1.1


