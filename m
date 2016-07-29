Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 96B02607A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 22:28:15 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id hh10so5840053pac.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 15:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=15wNlEtVNJ/i22axgvmeDaGAWQFtTa26us4K26rHI2I=;
	b=JMA2c59TY/6pXMw+wT/Jd8Gw4ZacGteLv1YJ6vaP83+atOwsn9AVEWd9YPiPUndHvF
	Gtq8j9HDx7be8SfMx834neorpEsYkPbYOXnwScxlqwHKeGSx1iWclrFvBK2vcxIkCh1m
	O/gQKHe73H+5HW+ONi5Wwd+zit+gjvkrcAxosfHs5aIO1WPTHT9ElK1rIYIcE1M3vRAO
	G7yQNYoxWQuYOKHD+mthDTihAsaPHqNeY2eMrirEhPfToRIm+np35D+l+md8J89Ic4ey
	TCMfRD45IGsuPl8701cm2HjQMIlnWk3vpRJdcxDE9z4efI1nV3CrbCP28K+5VYKhEYlc
	fn6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=15wNlEtVNJ/i22axgvmeDaGAWQFtTa26us4K26rHI2I=;
	b=NEyTRmzmhmcA6bDorFCLF38W4TPVgD3JhagDK9L9CFK4/tumkvDyOwjYSLeTRJ/I//
	awe64/fWqwpY604GMaioa5KgYKJMTxaf550KGKx2G5f7uGTJN5NEtwgCdC+AnCJyQmV0
	n5UrhVXSWd6nZlpJxHPSUTrRENTuWV294hbbS0hgJjuM+ma+FjhixYaH7e67gdQI5H4F
	KpuXp8zrUWOmpzKQ72D3psuY9ewY7IK10Dm3UFigWn5qlsL2mCNkkANYYwMUeQy2BL+M
	Czx7XU+tQxraCNJixiVAraDJt74QKtQJPnheJchKWA4cS2cc+QidkEQjMWRhplqPOJB/
	JMzA==
X-Gm-Message-State: AEkooutL412Ru+p4mIi/695GOLxmyt5Ka96m6t47l+JvrAgor0PGPQ3BoYDsd6QR0bcU5A==
X-Received: by 10.66.177.7 with SMTP id cm7mr72997037pac.132.1469831296368;
	Fri, 29 Jul 2016 15:28:16 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	191sm27326626pfx.68.2016.07.29.15.28.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Jul 2016 15:28:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Jul 2016 15:28:01 -0700
Message-Id: <20160729222801.9806-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160729222801.9806-1-raj.khem@gmail.com>
References: <20160729222801.9806-1-raj.khem@gmail.com>
Subject: [PATCH 3/3] gdb: Cache gnu gettext config vars for musl builds
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
X-List-Received-Date: Fri, 29 Jul 2016 22:28:15 -0000

intl is used in gdb as well and we run the configure for
it when running do compile. So we need to insert these
caching of variables to extra oe_make

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gdb/gdb_7.11.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/gdb/gdb_7.11.bb b/meta/recipes-devtools/gdb/gdb_7.11.bb
index f02e643..57cffc9 100644
--- a/meta/recipes-devtools/gdb/gdb_7.11.bb
+++ b/meta/recipes-devtools/gdb/gdb_7.11.bb
@@ -3,6 +3,11 @@ require gdb-${PV}.inc
 
 inherit python3-dir
 
+EXTRA_OEMAKE_append_libc-musl = "\
+                                 gt_cv_func_gnugettext1_libc=yes \
+                                 gt_cv_func_gnugettext2_libc=yes \
+                                "
+
 do_configure_prepend() {
 	if [ -n "${@bb.utils.contains('PACKAGECONFIG', 'python', 'python', '', d)}" ]; then
 		cat > ${WORKDIR}/python << EOF
-- 
2.9.0


