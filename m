Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 881FF7FC44
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jan 2020 03:48:06 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id b137so20204085pga.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Dec 2019 19:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=INYsgW9j0qWP78yp6xZQfk49nZ58D54f3gqyBM3GAzk=;
	b=krKlAPzoYc7fmJ6Tozxj5gheL3YmT18ryStWkfGo+0xmSo01Ig8ABX7rEMxqPnqQeA
	U3RwkrSax9THRwBNQbWdO63X4q3WilUrYrKSmv0/YxH5XpKLILxWxs/Y+ID5jLru3d1i
	2IWAQQJYTH43fXGU85c5IjS/ZflGo/n6kEav7JSqzg4/vGK9iE0DMXMBo8gGshbkgbxC
	fIID2pA91oWZrcQy06ydAeLbH43BaepNO09gAExXDWn6ibSpqFLa884KvBZkQ7WN+1Rj
	oOymmSNv+3sCTVC99Wn9WZgmRLDMB6q0wL2Zooi//9mV2eR7GVctZItCOb7sHz0m+AmP
	XDIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=INYsgW9j0qWP78yp6xZQfk49nZ58D54f3gqyBM3GAzk=;
	b=XdkVCD0NhuTMJJ0oTIrrCg1E1ztFC1NimoPAjBGPyZh3hd0cf1ohPh08wqyoX30atX
	B4LN3uYl/0JeMacuoDOyd1TcPptI/xUyIq14cqY2SywKDfrYYm5tArUMdYaswY8+Tdqm
	2aQsRW7E9K4WGB1z2KKGgX5Ho+112BTF/cPwIs2D2jltGJL2h1txnI7TCTXos1EOisRS
	5nEzZw8ftI/5r354R6spBzQPX+qRdTJigyH4jDhoKjvfNAOoZ2JFdAERn+80rXk55L7x
	vgTzphaswNllSlt+9iQLnj2PpBktCg9KclpICHPw937cL49+xi0sb3muR4Q4Rx1HAM2b
	WH/g==
X-Gm-Message-State: APjAAAUcDFfLAk4rWQwESXt9ajzS9FEmAE0GVQpBX5Sc6ZGyNtwOEQ5V
	XBENyIthaWHAqxz7VRFrCtpXqvx8rDU=
X-Google-Smtp-Source: APXvYqztToRpWcWPcKte9drCaDu1s3BjEBw7x7vcagmq4rLFMjnXFVfIARLrHTx2/v1Qq6pKtfWYDA==
X-Received: by 2002:aa7:86c3:: with SMTP id h3mr72244648pfo.225.1577850487198; 
	Tue, 31 Dec 2019 19:48:07 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::fa4b])
	by smtp.gmail.com with ESMTPSA id
	o134sm53291473pfg.137.2019.12.31.19.48.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 31 Dec 2019 19:48:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Dec 2019 19:47:59 -0800
Message-Id: <20200101034759.8085-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH] gettext: Backport patch to fix po files without translations
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
X-List-Received-Date: Wed, 01 Jan 2020 03:48:06 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...aviour-of-for-msgfmt-on-PO-files-wit.patch | 87 +++++++++++++++++++
 meta/recipes-core/gettext/gettext_0.20.1.bb   |  1 +
 2 files changed, 88 insertions(+)
 create mode 100644 meta/recipes-core/gettext/gettext-0.20.1/0001-msgmerge-Fix-behaviour-of-for-msgfmt-on-PO-files-wit.patch

diff --git a/meta/recipes-core/gettext/gettext-0.20.1/0001-msgmerge-Fix-behaviour-of-for-msgfmt-on-PO-files-wit.patch b/meta/recipes-core/gettext/gettext-0.20.1/0001-msgmerge-Fix-behaviour-of-for-msgfmt-on-PO-files-wit.patch
new file mode 100644
index 0000000000..2245889386
--- /dev/null
+++ b/meta/recipes-core/gettext/gettext-0.20.1/0001-msgmerge-Fix-behaviour-of-for-msgfmt-on-PO-files-wit.patch
@@ -0,0 +1,87 @@
+From 75e315fdec82d1a17ebcd9e0712d109323578d68 Mon Sep 17 00:00:00 2001
+From: Bruno Haible <bruno@clisp.org>
+Date: Sun, 19 May 2019 11:10:06 +0200
+Subject: [PATCH] msgmerge: Fix behaviour of --for-msgfmt on PO files with no
+ translations.
+
+msgmerge: Fix behaviour of --for-msgfmt on PO files with no translations.
+
+Reported by Don Lawrence <dlawrence@iecok.com>
+in <https://lists.freedesktop.org/archives/p11-glue/2019-May/000700.html>
+via Daiki Ueno
+in <https://lists.gnu.org/archive/html/bug-gettext/2019-05/msg00124.html>.
+
+* gettext-tools/src/msgmerge.c (main): Treat force_po like true if for_msgfmt
+is true.
+* gettext-tools/tests/msgmerge-26: Add test of PO file with no translations.
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/gitweb/?p=gettext.git;a=commitdiff;h=2336451ed68d91ff4b5ae1acbc1eca30e47a86a9]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gettext-tools/src/msgmerge.c    |  4 ++--
+ gettext-tools/tests/msgmerge-26 | 36 ++++++++++++++++++++++++++++++---
+ 2 files changed, 35 insertions(+), 5 deletions(-)
+
+diff --git a/gettext-tools/src/msgmerge.c b/gettext-tools/src/msgmerge.c
+index cd762c0..92c9b7a 100644
+--- a/gettext-tools/src/msgmerge.c
++++ b/gettext-tools/src/msgmerge.c
+@@ -520,8 +520,8 @@ There is NO WARRANTY, to the extent permitted by law.\n\
+   else
+     {
+       /* Write the merged message list out.  */
+-      msgdomain_list_print (result, output_file, output_syntax, force_po,
+-                            false);
++      msgdomain_list_print (result, output_file, output_syntax,
++                            for_msgfmt || force_po, false);
+     }
+ 
+   exit (EXIT_SUCCESS);
+diff --git a/gettext-tools/tests/msgmerge-26 b/gettext-tools/tests/msgmerge-26
+index cd3862e..b86f7a0 100755
+--- a/gettext-tools/tests/msgmerge-26
++++ b/gettext-tools/tests/msgmerge-26
+@@ -73,7 +73,37 @@ msgstr "Papaya"
+ EOF
+ 
+ : ${DIFF=diff}
+-${DIFF} mm-test26.ok mm-test26.out
+-result=$?
++${DIFF} mm-test26.ok mm-test26.out || Exit 1
+ 
+-exit $result
++# Test with a PO file that has no translated messages.
++
++cat <<\EOF > mm-test26a.in1
++msgid ""
++msgstr ""
++"Content-Type: text/plain; charset=UTF-8\n"
++
++msgid "Hello world"
++msgstr "Hallo Welt"
++EOF
++
++cat <<\EOF > mm-test26a.in2
++msgid ""
++msgstr ""
++"Content-Type: text/plain; charset=ASCII\n"
++
++msgid "Hello, world!"
++msgstr ""
++EOF
++
++: ${MSGMERGE=msgmerge}
++${MSGMERGE} --for-msgfmt -o mm-test26a.tmp mm-test26a.in1 mm-test26a.in2 \
++    || Exit 1
++LC_ALL=C tr -d '\r' < mm-test26a.tmp > mm-test26a.out || Exit 1
++
++cat <<\EOF > mm-test26a.ok
++msgid ""
++msgstr "Content-Type: text/plain; charset=UTF-8\n"
++EOF
++
++: ${DIFF=diff}
++${DIFF} mm-test26a.ok mm-test26a.out || Exit 1
+-- 
+2.24.1
+
diff --git a/meta/recipes-core/gettext/gettext_0.20.1.bb b/meta/recipes-core/gettext/gettext_0.20.1.bb
index a6fc219568..ca155fe8bf 100644
--- a/meta/recipes-core/gettext/gettext_0.20.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.20.1.bb
@@ -23,6 +23,7 @@ SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
            file://use-pkgconfig.patch \
            file://run-ptest \
            file://serial-tests-config.patch \
+           file://0001-msgmerge-Fix-behaviour-of-for-msgfmt-on-PO-files-wit.patch \
            "
 
 SRC_URI[md5sum] = "bb5b0c0caa028105f3ca1905ddc306e2"
-- 
2.24.1


