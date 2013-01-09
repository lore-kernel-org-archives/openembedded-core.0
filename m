Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TsykJ-0007Ic-Py
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 17:43:21 +0100
Received: from mail-la0-f71.google.com ([209.85.215.71])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 09 Jan 2013 08:27:04 -0800
Received: by mail-la0-f71.google.com with SMTP id fn20so1849994lab.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Jan 2013 08:28:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=0vktEwm82ZULBNpiJ2EvVe6ayUKUnPQk+A50ps6sfBw=;
	b=daVxpVxllPpV1RD6jMuylyn2A+Icr0RO3cRf1llJt4A2xDdvaRFz07W6Cb7eLFQeDg
	ePPWikhl+/GeTUSsmgaDLD7dCwpJ3ze59jdB1K97LWDSFKEydfLxGGpmUrWQXfHPGC2L
	786cevPWcRhy5Rv7H14/i+2CuVBzHqK8K+Fme7R03bzVaX+ux2tP6OB5bkZ05QVuXC0t
	mAuWoYjAalUsVCPq3ySdAItC12Wfb1R5UFhU9D1nE85OOUGesuozEFJFlR9yzo0KYif6
	Q1bYx5KePriG20Ygg7HX7/hHS68cZFHsdmfB4gphJh7wipVZFovK+BbRIFF3AHwU5SyD
	yaqw==
X-Received: by 10.194.123.105 with SMTP id lz9mr109939992wjb.43.1357748880573; 
	Wed, 09 Jan 2013 08:28:00 -0800 (PST)
X-Received: by 10.194.123.105 with SMTP id lz9mr109939963wjb.43.1357748880306; 
	Wed, 09 Jan 2013 08:28:00 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id s16sm5023902wii.0.2013.01.09.08.27.58
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 09 Jan 2013 08:27:59 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Jan 2013 16:26:04 +0000
Message-Id: <1357748764-5551-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQm5QzcD3nSZiWLsM3NqMyG9J3paHbTh75m3e489eTxW9sxFi5JFW9k/p/UvojF/eQFUe/Xv+rRWx8WfLeCMVOVjQDmv9NtGfdwlw0RGtvo2EzWU83t8v/tVmXNOO7JUNrbB2qRYKTF6ZTpidb5IHVqOjglNWc/Yn9mN0gr3/kqDdfYHgzzI7tjrpj7KfRn2N6Ot6ngM
Subject: [PATCH V2] musicbrainz: handle rebuilds
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
X-List-Received-Date: Wed, 09 Jan 2013 16:43:22 -0000

When rebuilding build-native already exists.  Sadly handling the directory
existing causes cmake to forkbomb when rebuilding, so delete an existing
build-native.

Also remove a variable that cmake warns isn't being used, and just build the
tool that we need natively, not the entire library.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb b/meta/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
index 7343662..21eec6d 100644
--- a/meta/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
+++ b/meta/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
@@ -20,15 +20,17 @@ LDFLAGS_prepend_libc-uclibc = " -lpthread "
 inherit cmake pkgconfig
 
 do_configure_prepend() {
+    # The native build really doesn't like being rebuilt, so delete
+    # it if it's already present.
+    rm -rf build-native
     mkdir build-native
     cd build-native
     cmake -DCMAKE_C_FLAGS=${BUILD_CFLAGS} \
             -DCMAKE_C_COMPILER=${BUILD_CC} \
             -DCMAKE_CXX_FLAGS=${BUILD_CXXFLAGS} \
             -DCMAKE_CXX_COMPILER=${BUILD_CXX} \
-            -DCMAKE_LINK_FLAGS=${BUILD_LDFLAGS} \
             ..
-    make
+    make make-c-interface
     cd ..
 }
 
-- 
1.7.10.4



