Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7A3C060765
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Oct 2017 09:03:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v9V93kKM009075
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Oct 2017 02:03:46 -0700 (PDT)
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 31 Oct 2017 02:03:44 -0700
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 31 Oct 2017 17:02:58 +0800
Message-ID: <1509440578-173066-1-git-send-email-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] wget: CVE-2017-13089 and CVE-2017-13090
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
X-List-Received-Date: Tue, 31 Oct 2017 09:03:45 -0000
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit

CVE-2017-13089:The http.c:skip_short_body() function is called in some
circumstances, such as when processing redirects. When the response is
sent chunked in wget before 1.19.2, the chunk parser uses strtol() to
read each chunk's length, but doesn't check that the chunk length is a
non-negative number. The code then tries to skip the chunk in pieces of
512 bytes by using the MIN() macro, but ends up passing the negative
chunk length to connect.c:fd_read(). As fd_read() takes an int argument,
the high 32 bits of the chunk length are discarded, leaving fd_read()
with a completely attacker controlled length argument.

CVE-2017-13090:The retr.c:fd_read_body() function is called when
processing OK responses. When the response is sent chunked in wget before
1.19.2, the chunk parser uses strtol() to read each chunk's length, but
doesn't check that the chunk length is a non-negative number. The code
then tries to read the chunk in pieces of 8192 bytes by using the MIN()
macro, but ends up passing the negative chunk length to retr.c:fd_read().
As fd_read() takes an int argument, the high 32 bits of the chunk length
are discarded, leaving fd_read() with a completely attacker controlled
length argument. The attacker can corrupt malloc metadata after the
allocated buffer.

External References:
https://nvd.nist.gov/vuln/detail/CVE-2017-13089
https://nvd.nist.gov/vuln/detail/CVE-2017-13090

Patches from:
http://git.savannah.gnu.org/cgit/wget.git/patch/?id=d892291fb8ace4c3b734ea5125770989c215df3f
http://git.savannah.gnu.org/cgit/wget.git/patch/?id=ba6b44f6745b14dce414761a8e4b35d31b176bba

CVE: CVE-2017-13089 CVE-2017-13090

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 .../wget/wget/wget-CVE-2017-13089.patch            | 36 ++++++++++++++++++++
 .../wget/wget/wget-CVE-2017-13090.patch            | 39 ++++++++++++++++++++++
 meta/recipes-extended/wget/wget_1.19.1.bb          |  2 ++
 3 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/wget-CVE-2017-13089.patch
 create mode 100644 meta/recipes-extended/wget/wget/wget-CVE-2017-13090.patch

diff --git a/meta/recipes-extended/wget/wget/wget-CVE-2017-13089.patch b/meta/recipes-extended/wget/wget/wget-CVE-2017-13089.patch
new file mode 100644
index 0000000..f7fa90c
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/wget-CVE-2017-13089.patch
@@ -0,0 +1,36 @@
+From d892291fb8ace4c3b734ea5125770989c215df3f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Tim=20R=C3=BChsen?= <tim.ruehsen@gmx.de>
+Date: Fri, 20 Oct 2017 10:59:38 +0200
+Subject: Fix stack overflow in HTTP protocol handling (CVE-2017-13089)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+* src/http.c (skip_short_body): Return error on negative chunk size
+
+CVE: CVE-2017-13089
+
+Upstream-Status: Backport
+
+Reported-by: Antti Levomäki, Christian Jalio, Joonas Pihlaja from Forcepoint
+Reported-by: Juhani Eronen from Finnish National Cyber Security Centre
+---
+ src/http.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/http.c b/src/http.c
+index 5536768..dc31823 100644
+--- a/src/http.c
++++ b/src/http.c
+@@ -973,6 +973,9 @@ skip_short_body (int fd, wgint contlen, bool chunked)
+               remaining_chunk_size = strtol (line, &endl, 16);
+               xfree (line);
+ 
++              if (remaining_chunk_size < 0)
++                return false;
++
+               if (remaining_chunk_size == 0)
+                 {
+                   line = fd_read_line (fd);
+-- 
+cgit v1.0-41-gc330
diff --git a/meta/recipes-extended/wget/wget/wget-CVE-2017-13090.patch b/meta/recipes-extended/wget/wget/wget-CVE-2017-13090.patch
new file mode 100644
index 0000000..34de81e
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/wget-CVE-2017-13090.patch
@@ -0,0 +1,39 @@
+From ba6b44f6745b14dce414761a8e4b35d31b176bba Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Tim=20R=C3=BChsen?= <tim.ruehsen@gmx.de>
+Date: Fri, 20 Oct 2017 15:15:47 +0200
+Subject: Fix heap overflow in HTTP protocol handling (CVE-2017-13090)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+* src/retr.c (fd_read_body): Stop processing on negative chunk size
+
+CVE: CVE-2017-13090
+
+Upstream-Status: Backport
+
+Reported-by: Antti Levomäki, Christian Jalio, Joonas Pihlaja from Forcepoint
+Reported-by: Juhani Eronen from Finnish National Cyber Security Centre
+---
+ src/retr.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/retr.c b/src/retr.c
+index c1bc600..6555ed4 100644
+--- a/src/retr.c
++++ b/src/retr.c
+@@ -378,6 +378,12 @@ fd_read_body (const char *downloaded_filename, int fd, FILE *out, wgint toread,
+               remaining_chunk_size = strtol (line, &endl, 16);
+               xfree (line);
+ 
++              if (remaining_chunk_size < 0)
++                {
++                  ret = -1;
++                  break;
++                }
++
+               if (remaining_chunk_size == 0)
+                 {
+                   ret = 0;
+-- 
+cgit v1.0-41-gc330
diff --git a/meta/recipes-extended/wget/wget_1.19.1.bb b/meta/recipes-extended/wget/wget_1.19.1.bb
index 78bde95..09520ca 100644
--- a/meta/recipes-extended/wget/wget_1.19.1.bb
+++ b/meta/recipes-extended/wget/wget_1.19.1.bb
@@ -1,6 +1,8 @@
 SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
            file://CVE-2017-6508.patch \
+           file://wget-CVE-2017-13089.patch \
+           file://wget-CVE-2017-13090.patch \
           "
 
 SRC_URI[md5sum] = "87cea36b7161fd43e3fd51a4e8b89689"
-- 
1.9.1


