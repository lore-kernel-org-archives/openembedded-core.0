Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sjlcb-0003IU-ER
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jun 2012 08:21:01 +0200
Received: by pbbrq2 with SMTP id rq2so1066681pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2012 23:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=fxapr3JOtuKYh7opy/jiucGJfi/rzK41SKG7ihnQ/rw=;
	b=HTKW3zfmAxhR94TEu5WmmCvy7Q+Mtoo2BWb/RAwRJwjcHGcicWQW6k5hP1ai0cIQ/3
	64GLu9/fSl/z7uCr0B0GoGTtYbekx2b/Ak839BFZ7B6e4Hs+RTNiPqHPlzTniUncW/w4
	+3JJgEUVD9kBBS6m5WS2fuacqGikKXIj3ZfE/ic4hXM7nfPDJlHjlaUo/c+V+pu+yL/J
	qdciUToVqvXKXy12r1I7ZYxpMp94oowa6MCJWPYZ3EAXWal/IiHk+X2ymJLnXzAHkp/3
	iTDNWZ04VLhX8NuQawhg1VASzGaCwoSjF57e6nHVhOntaay8qAD7GaLiCywyaQ9xxUlK
	3WYA==
Received: by 10.68.239.164 with SMTP id vt4mr58453663pbc.166.1340777407753;
	Tue, 26 Jun 2012 23:10:07 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id ob9sm14168304pbb.28.2012.06.26.23.10.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 26 Jun 2012 23:10:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jun 2012 23:09:46 -0700
Message-Id: <3ef3573dcf3deb300a12a1830ccc768c999e61fe.1340777116.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <55a411d66293b6d2196e98376f0fb9e4487b4bdf.1340777116.git.raj.khem@gmail.com>
References: <55a411d66293b6d2196e98376f0fb9e4487b4bdf.1340777116.git.raj.khem@gmail.com>
In-Reply-To: <cover.1340777115.git.raj.khem@gmail.com>
References: <cover.1340777115.git.raj.khem@gmail.com>
Subject: [PATCH 2/7] tclibc-eglibc.inc: Define USE_NLS
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
X-List-Received-Date: Wed, 27 Jun 2012 06:21:01 -0000

USE_NLS is generally defined for uclibc based system builds
and generally its defined to 'no' there. However this variable
does not exist at all for eglibc/glibc distributions. This
patch adds a weak definition to 'yes' on eglibc based system
builds. This will ease out some of the cryptic contructs we
have to define certain options based on USE_NLS and also
checking got uclibc at the same time to avoid pythong exceptions
when its not defined.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tclibc-eglibc.inc |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/distro/include/tclibc-eglibc.inc b/meta/conf/distro/include/tclibc-eglibc.inc
index 4f5607f..e2ca4e8 100644
--- a/meta/conf/distro/include/tclibc-eglibc.inc
+++ b/meta/conf/distro/include/tclibc-eglibc.inc
@@ -32,6 +32,8 @@ LIBC_LOCALE_DEPENDENCIES = "\
 	eglibc-gconv-iso8859-1 \
 	eglibc-gconv-iso8859-15"
 
+USE_NLS ?= "yes"
+
 def get_libc_locales_dependencies(d):
     if 'libc-locales' in (d.getVar('DISTRO_FEATURES', True) or '').split() :
         return d.getVar('LIBC_LOCALE_DEPENDENCIES', True) or ''
-- 
1.7.9.5



