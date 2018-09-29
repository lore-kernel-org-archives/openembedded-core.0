Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 483AC79988
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 06:08:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8T68ZkM026332
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2018 23:08:35 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Fri, 28 Sep 2018 23:08:34 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 29 Sep 2018 14:13:30 +0800
Message-ID: <0757cd5ae9957cdac6fc55b6df44457fc9dfe4b9.1538201555.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1538201555.git.Qi.Chen@windriver.com>
References: <cover.1538201555.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] libsdl2: disable sndio explicitly to avoid inconsistent result
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
X-List-Received-Date: Sat, 29 Sep 2018 06:08:34 -0000
Content-Type: text/plain

Explicitly disable sndio to avoid inconsistent result on different
hosts having or not having libsndio.

This must be done if we take into consideration of eSDK.

I built eSDK on Ubuntu 14.04 which has libsndio installed, and then
installed the eSDK on Fedora 27, which does not have libsndio. In
fact, on Fedora 27, I even cannot find libsndio in its repo.

The problem happens when trying to use `devtool runqemu'. The qemu
binary built on Ubuntu 14.04 needs to link to libsndio, and thus
the following error.

  runqemu - ERROR - Failed to run qemu: /path/to/qemu-system-x86_64:
            error while loading shared libraries: libsndio.so.6.1:
            cannot open shared object file: No such file or directory

So explicitly disable sndio for libsdl2 to avoid the above problem.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
index 52bb93a..812a9ab 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
@@ -30,6 +30,7 @@ EXTRA_OECONF = "--disable-oss --disable-esd --disable-arts \
                 --enable-pthreads \
                 --enable-sdl-dlopen \
                 --disable-rpath \
+                --disable-sndio \
                 "
 
 # opengl packageconfig factored out to make it easy for distros
-- 
1.9.1


