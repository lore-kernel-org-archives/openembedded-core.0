Received: from mail-we0-f178.google.com ([74.125.82.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UAi7c-0003eJ-Kv
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 15:36:57 +0100
Received: by mail-we0-f178.google.com with SMTP id x48so513028wey.37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2013 06:20:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=eNxBN32AOJDpoIfgfzwlhSRQeqM/bOgmuSkonVsaI7E=;
	b=pm/7UHMc/d9bw2sjgPoJ6ehKtjGg1lQStAc+5j6b9THtUQ1bsgRZt6F8rDttjmed+J
	nOHPhbQnYE8n9z73kYwApnx+jOt2q6s0X9XGaFey72udJGKjkUBe+vyP1V3kZKZdq+BO
	+D/m6VGx6kDIWjN2F+Y1GwI3BcEv0161LjpKK4md3Eo30DEzalIHNt/tCDTOTFupoX6g
	8oeI9wxr62Yz+Q4kY5Xo9M4vTkphDHa6UYlNM987QxOk2RG4PVHFCV1lAMCeiwZ1ojjg
	osYZzGb8PtsU1APvKSmR6snsPoAlmBQKO6DGNbv9vFLH4Xzgy1n7vaOSieKk8eRivjrs
	pvYw==
X-Received: by 10.194.77.129 with SMTP id s1mr4358897wjw.17.1361974820140;
	Wed, 27 Feb 2013 06:20:20 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bs6sm9053829wib.4.2013.02.27.06.20.18
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 27 Feb 2013 06:20:19 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Feb 2013 14:17:46 +0000
Message-Id: <b4fdb05f5e0f97b427125f27e4d824f09eb7c651.1361974597.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1361974597.git.ross.burton@intel.com>
References: <cover.1361974597.git.ross.burton@intel.com>
In-Reply-To: <cover.1361974597.git.ross.burton@intel.com>
References: <cover.1361974597.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQn/nnhRXfDVje6U+ISu2j3YNFQObJRmSlvit+xDTI7e/TAPDScDIX1LrOUPWNG3gAUqLMfJ
Subject: [PATCH 7/7] systemd: set the location of the kill binary
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
X-List-Received-Date: Wed, 27 Feb 2013 14:37:10 -0000

Otherwise systemd uses AC_PROG_PATH and finds it in the sysroot, which won't
work on the target.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd_197.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_197.bb b/meta/recipes-core/systemd/systemd_197.bb
index 1773aed..ec2ba5f 100644
--- a/meta/recipes-core/systemd/systemd_197.bb
+++ b/meta/recipes-core/systemd/systemd_197.bb
@@ -48,6 +48,8 @@ PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt"
 # Compress the journal
 PACKAGECONFIG[xz] = "--enable-xz,--disable-xz,xz"
 
+CACHED_CONFIGUREVARS = "ac_cv_path_KILL=${base_bindir}/kill"
+
 # The gtk+ tools should get built as a separate recipe e.g. systemd-tools
 EXTRA_OECONF = " --with-rootprefix=${base_prefix} \
                  --with-rootlibdir=${base_libdir} \
-- 
1.7.10.4



