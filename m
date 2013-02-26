Received: from mail-we0-f171.google.com ([74.125.82.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UAOit-0001fk-TK
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 18:54:24 +0100
Received: by mail-we0-f171.google.com with SMTP id u54so3630616wey.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 09:37:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=XYjeK5wCWB7yFwY6bhQHe4GkOf2enER78cjAS1LfWN0=;
	b=SQCCNMzOpbJ0ncgyfw1+36y13SgX9XkCsZRbp3cIm8rCRWhxS4AXNFmJMHj5zxtGbA
	508ofP64S2/tr/DFmh6322KvFPyGbNgHH+cRvqvwc5jiMRC9rc5Zv7+TiIAhV458o7ow
	P6qF5X8I/KXotcK5htP1q4AA1/yUp672eHfC0kgmS3Okc95rREUVMR9KxqKbWN/lkwPj
	ulSptvAmZNGKYog6R7fkX6CXlsQ+YOKNx3fqmbaiN4Pb17GvnujmVkhQg69nQrYbChJ4
	SS0e+xIh/NI8GjK9hMt+ZCp985fcQ8JdW6AV1b9OHoE58JHJcvj/wJqWPbf+2PzqpPP0
	fGYA==
X-Received: by 10.180.100.169 with SMTP id ez9mr21259662wib.3.1361900252383;
	Tue, 26 Feb 2013 09:37:32 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fg6sm3349582wib.10.2013.02.26.09.37.30
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 26 Feb 2013 09:37:31 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Feb 2013 17:35:09 +0000
Message-Id: <1361900109-21869-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQkxQ3gtXQ9VTQbq2itxiMe6B9bds9KdkdATvWzLcomdsrEDXmDVhjw5HAmNL97PaD0nliTu
Subject: [PATCH] systemd: set the location of the kill binary
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
X-List-Received-Date: Tue, 26 Feb 2013 17:54:26 -0000

Otherwise systemd uses AC_PROG_PATH and finds it in the sysroot, which won't
work on the target.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd_197.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_197.bb b/meta/recipes-core/systemd/systemd_197.bb
index c765c18..44cd919 100644
--- a/meta/recipes-core/systemd/systemd_197.bb
+++ b/meta/recipes-core/systemd/systemd_197.bb
@@ -48,6 +48,8 @@ PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt"
 # Compress the journal
 PACKAGECONFIG[xz] = "--enable-xz,--disable-xz,xz"
 
+export ac_cv_path_KILL="/bin/kill"
+
 # The gtk+ tools should get built as a separate recipe e.g. systemd-tools
 EXTRA_OECONF = " --with-rootprefix=${base_prefix} \
                  --with-rootlibdir=${base_libdir} \
-- 
1.7.10.4



