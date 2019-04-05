Return-Path: <just.another.mariano@gmail.com>
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
	[209.85.167.194])
	by mail.openembedded.org (Postfix) with ESMTP id 407287D5B9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2019 14:26:55 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id j132so5013625oib.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Apr 2019 07:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=wNNMjqrTd12lGxNcTihsm9jJXZuf9NWk4MufcvvRPJc=;
	b=OnUC6L8ZtgAl8xNF319PTFpMDIKWhZruQSwZTD4qFH7LKgNGb2RhBLpUNP9N0tXBaa
	OH2n5ajK4BCLZaFBKfEwibFDkdTd2Epv25bzymbuvZ+Lz+Uxfo7IfLIL6RaGue4GMzx/
	IJxl2AbfOgr4Tfd4P1lc+p38pbwT1ob5hJpZ7olbYhoeGMLkRrtsJDsZ62i3oNjAAUoL
	ZA1jqBenpKBvyi9zviBAxTA0Y7Nhh1tR0rzcyeytZ32jk9uV/tDLQgV+40cnrcrWB2CZ
	dcwGbUpI9tY0+S1kvZRiPByeFgPHgzErg/SjUCy//B/1UWd1NcUtgjQ6g0Mpqbr1pi1n
	V5gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=wNNMjqrTd12lGxNcTihsm9jJXZuf9NWk4MufcvvRPJc=;
	b=n5YntGZC4ItnIhJ0P8oKGfwkZrsu9VkGMbs67TyICkhA7KGRJSjWN1tavu0TNw1NtE
	yV0XD0Q6BZAU0YsqMeoRE1nh7HCAnhgwbPCfBl2wJYFTLQ49QMsEb5mDp22xk493g66k
	yVlRZpQuNdsYZD2/AKNo98td5tu3slSpKRXcicuiKm3Ijz4OMQPL37bjioReEs0oZ0X4
	lBatICjG4EVfO4kftcwfe1OLRSM1KYvu9nQQrqBMyX36ETDu+Rbz2QW5SoCzUhW6ItPu
	Gpr5Izzmmyp+CSlyUlVk7HOJ1W3SJKsmanDVErqNwnzUmW7JRxvaNmVKWK9Bftm3PlF9
	JLBg==
X-Gm-Message-State: APjAAAUQUmxDDFtQ2D4bc0mAfPTxfeEwiadCR5zzBODtNi98g+2DvKWe
	enVUvoSTkZe3VoGJl6nAQuqQij5Y
X-Google-Smtp-Source: APXvYqykdXa7oi6xC4jIWh6L8sS4N1EjF3Uf1SL94grB+jXl5v2vb7LLGsGjWrRm4JLd6sHettBIew==
X-Received: by 2002:aca:5605:: with SMTP id k5mr6800207oib.43.1554474416063;
	Fri, 05 Apr 2019 07:26:56 -0700 (PDT)
Received: from ultima.ninicasiopea.net
	([2605:a601:43d5:f700:215:17ff:fe90:1065])
	by smtp.googlemail.com with ESMTPSA id
	j82sm4056967oih.31.2019.04.05.07.26.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Apr 2019 07:26:55 -0700 (PDT)
From: Mariano Lopez <just.another.mariano@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Apr 2019 09:26:40 -0500
Message-Id: <8890eba9a456d6751d6da884e57da539b8833df8.1554474048.git.just.another.mariano@gmail.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <cover.1554474048.git.just.another.mariano@gmail.com>
References: <cover.1554474048.git.just.another.mariano@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] ptest.bbclass: Add feature to populate a binary directory
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
X-List-Received-Date: Fri, 05 Apr 2019 14:26:55 -0000
Content-Transfer-Encoding: 8bit

This adds a functionality to populate a binary directory with symlinks
within the PTEST_PATH directory to the binaries build by the package. This
is helpful for binaries that are renamed by update-alternatives.

This will take all the package binaries' that are in bindir, sbindir
base_bindir, and base_sbindir and create symlinks in PTEST_BINDIR_PATH. To
enable this feature just add PTEST_BINDIR = "1" to the recipe.

[YOCTO #13238]

Signed-off-by: Mariano Lopez <just.another.mariano@gmail.com>
---
 meta/classes/ptest.bbclass | 52 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
index 97865c9338..735057c44d 100644
--- a/meta/classes/ptest.bbclass
+++ b/meta/classes/ptest.bbclass
@@ -63,6 +63,58 @@ do_install_ptest_base() {
             fi
         done
     done
+
+    if [ "${PTEST_BINDIR}" == "1" ]; then
+        install_ptest_bindir
+    fi
+}
+
+PTEST_BINDIR_PATH="${D}${PTEST_PATH}/bin"
+
+install_ptest_bindir() {
+    # Create ${PTEST_PATH}/bin to create symlinks to the package's binaries
+    # this way the path can be added to PATH and execute the binaries easier
+    # from ptest-runner.
+    bbdebug 1 "Generating PTEST's bin directory"
+    binary_paths="${bindir} ${sbindir} ${base_bindir} ${base_sbindir}"
+    mkdir -p ${PTEST_BINDIR_PATH}
+
+    for path in ${binary_paths}; do
+        for src in ${D}${path}/*; do
+            binary=`basename ${src}`
+            ln -s ${path}/${binary} ${PTEST_BINDIR_PATH}/${binary}
+        done
+    done
+}
+
+# This function needs to run after apply_update_alternative_renames because the
+# aforementioned function will update the ALTERNATIVE_LINK_NAME flag. Append is
+# used here to make this function to run as late as possible.
+PACKAGE_PREPROCESS_FUNCS_append = "${@bb.utils.contains("PTEST_BINDIR", "1", " ptest_update_alternatives", "", d)}"
+
+python ptest_update_alternatives() {
+    """
+    This function will fix the symlinks in the PTEST_BINDIR that
+    were broken by the renaming of update-alternatives
+    """
+
+    if not bb.data.inherits_class('update-alternatives', d) \
+           or not update_alternatives_enabled(d):
+        return
+
+    bb.note("Updating PTEST symlinks after the renaming of update-alternatives")
+
+    ptest_pkgd_bindir = os.path.join(d.getVar("PKGD"),
+                                     d.getVar("PTEST_PATH")[1:],
+                                     "bin")
+    links_dict = { os.path.join(ptest_pkgd_bindir, link):
+                   os.readlink(os.path.join(ptest_pkgd_bindir, link))
+                   for link in os.listdir(ptest_pkgd_bindir) }
+    for filename, link in links_dict.items():
+        alt_link = update_alternatives_get_alt_target(d, link)
+        if alt_link:
+            os.unlink(filename)
+            os.symlink(alt_link, filename)
 }
 
 do_configure_ptest_base[dirs] = "${B}"
-- 
2.19.2


