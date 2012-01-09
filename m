Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RkLmR-0003A1-KE
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jan 2012 21:25:19 +0100
Received: by iakh37 with SMTP id h37so7054183iak.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jan 2012 12:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=THGvVKaV/n33a3FSremcmDEVW7aH8z3pgp/YHnoPjcs=;
	b=E4DD+9PRb0qUDvVzvcMweoUvXrgtfEKem7d2ZhHkIY8ORCn3KtSjq+M/Kd6BfhJdHL
	vHzPKVnNQyHsR4+KNt8r1BPTxnMAQ0AunCoIxptBcK7zOlMF1jl9bKhJqShCrbc983H6
	iDsaWm3Z9JYGd++x0qbjLR+UGMdP7YgsYIcps=
Received: by 10.42.147.72 with SMTP id m8mr19413903icv.56.1326140210269;
	Mon, 09 Jan 2012 12:16:50 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id h9sm254620546ibh.11.2012.01.09.12.16.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 Jan 2012 12:16:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jan 2012 12:15:43 -0800
Message-Id: <b48b49a0318976a64f93bbf9ee2b85a786331028.1326140011.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <106d8165fbc1ba1063d46fe268fd8b2595d6d9b8.1326140011.git.raj.khem@gmail.com>
References: <106d8165fbc1ba1063d46fe268fd8b2595d6d9b8.1326140011.git.raj.khem@gmail.com>
In-Reply-To: <cover.1326140011.git.raj.khem@gmail.com>
References: <cover.1326140011.git.raj.khem@gmail.com>
Subject: [PATCH 6/7] findutils: Use CACHED_CONFIGUREVARS to specify cached configure vars
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Jan 2012 20:25:19 -0000

Since this feature is depending on wchar support we only
cache is when we have libc-posix-clang-wchar enabled

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/findutils/findutils_4.4.2.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/findutils/findutils_4.4.2.bb b/meta/recipes-extended/findutils/findutils_4.4.2.bb
index c25ba4c..b2898ed 100644
--- a/meta/recipes-extended/findutils/findutils_4.4.2.bb
+++ b/meta/recipes-extended/findutils/findutils_4.4.2.bb
@@ -1,6 +1,6 @@
 require findutils.inc
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI += "file://01-27017.patch \
             file://02-28824.patch \
@@ -11,7 +11,7 @@ SRC_URI[md5sum] = "351cc4adb07d54877fa15f75fb77d39f"
 SRC_URI[sha256sum] = "434f32d171cbc0a5e72cfc5372c6fc4cb0e681f8dce566a0de5b6fccd702b62a"
 
 # http://savannah.gnu.org/bugs/?27299
-EXTRA_OECONF += "gl_cv_func_wcwidth_works=yes"
+CACHED_CONFIGUREVARS += "${@base_contains('DISTRO_FEATURES', 'libc-posix-clang-wchar', 'gl_cv_func_wcwidth_works=yes', '', d)}"
 
 do_install_append () {
         if [ -e ${D}${bindir}/find ]; then
-- 
1.7.5.4



