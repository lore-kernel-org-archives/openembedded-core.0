Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id DACC671B1D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Sep 2019 14:38:09 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id m29so1603819pgc.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Sep 2019 07:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=L0Eh6jqbNqEqek377ALVXnJou16+RD4DO8r1L06uFZ8=;
	b=glWnNR+/oQXRCk0TvCCJH0oWfOyDlkMiPXjnZwVVnn64bmpaqSM6TdCACMALyUXfRg
	vAtGms24pLHPI8xwP2n9MkeNcqyumI4ClhW+syUwo2LSJgTtNRwWqYIpCXdrDOrMeX4M
	JeLKUkFItQE7mUKrIr968+iZ1ZfRnONH7OEEBXPjNtq39lAgTS2tSLGJ4GWcf+eCL9wR
	bYrTOeUuRAJw1DhmPXYRaA9/0c/tTt4i9AI399y4MT6pfT9uW1oA2lGIVYtW9vl2I44R
	ZqudAEC+bob0nXxFO1yYEWgLvAt3vofozJ9QG4j2SbaM+hF5+c+at4C20AUiz32kGEd9
	36QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=L0Eh6jqbNqEqek377ALVXnJou16+RD4DO8r1L06uFZ8=;
	b=FST+EdTp0EJkRyhRtxscDhtZQy9VhYzSgPk0fltYIHgMa4Pyl0EinNIZ1Q19aLC5NX
	5Ux2IGoPM8OVg52p3Ch4sPYPEtIC43L2uwiwnjQq7/b61YaHu/e2Fg5Qd4wkqxGvuJ12
	0ZMwcAbEML3/y4EcTaOLUlE+y5+lf6fH5QokGnWkpTm9iAI6n8lDwycZqbkdkgtRdYCb
	5hQLbZSaMCZAV5ICUg6X6NXNfP8qw1rRWBj12SOm0RO1/0DlZtJTcLP8mfQFgI21jmka
	fzTHe5flf+g7YGTrRif8GYp3h7oBRffh/VRiCyXRHN1HrEaxjGH6JHcM/apjcPxkcTaQ
	vcrg==
X-Gm-Message-State: APjAAAXwbare5SceF/lyblX1rdWVeUfJdh3CEM+CgQdWQHEOa0YTeOW2
	39oL/J7q2O58yExE3qphVO+HU8ilohw=
X-Google-Smtp-Source: APXvYqx4cuqgM+G9lyMV1z5JH6/fEvFoMczO0Dc7ak4GqX1pDnvEvgRjoICHSB80EJCxRx4L4voXIg==
X-Received: by 2002:a17:90a:f0c7:: with SMTP id
	fa7mr15921808pjb.137.1568558290529; 
	Sun, 15 Sep 2019 07:38:10 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:c1:3eb6:7e0:d804])
	by smtp.gmail.com with ESMTPSA id
	6sm58887866pfa.162.2019.09.15.07.38.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 15 Sep 2019 07:38:09 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 15 Sep 2019 07:38:08 -0700
Message-Id: <1568558288-4039-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Armin Kuster <akuster@mvista.com>
Subject: [warrior][v2][PATCH] Curl: Security fix for CVE-2019-5482
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
X-List-Received-Date: Sun, 15 Sep 2019 14:38:10 -0000

From: Armin Kuster <akuster@mvista.com>

Source: curl.org
MR: 99905
Type: Security Fix
Disposition: Backport from https://github.com/curl/curl/commit/facb0e4662415b5f28163e853dc6742ac5fafb3d
ChangeID: e0c807da8937f687a4b2e28eaa6b4b5a51845bc5
Description:

Fixes CVE-2019-5482
- Affected versions: libcurl >= 7.19.4 to and including 7.65.3
- Not affected versions: libcurl < 7.19.4

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-support/curl/curl/CVE-2019-5482.patch | 65 ++++++++++++++++++++++
 meta/recipes-support/curl/curl_7.64.1.bb           |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2019-5482.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2019-5482.patch b/meta/recipes-support/curl/curl/CVE-2019-5482.patch
new file mode 100644
index 0000000..30122d1
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2019-5482.patch
@@ -0,0 +1,65 @@
+From facb0e4662415b5f28163e853dc6742ac5fafb3d Mon Sep 17 00:00:00 2001
+From: Thomas Vegas <>
+Date: Sat, 31 Aug 2019 17:30:51 +0200
+Subject: [PATCH] tftp: Alloc maximum blksize, and use default unless OACK is
+ received
+
+Fixes potential buffer overflow from 'recvfrom()', should the server
+return an OACK without blksize.
+
+Bug: https://curl.haxx.se/docs/CVE-2019-5482.html
+CVE-2019-5482
+
+Upstream-Status: Backport
+CVE: CVE-2019-5482
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ lib/tftp.c | 12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+Index: curl-7.64.1/lib/tftp.c
+===================================================================
+--- curl-7.64.1.orig/lib/tftp.c
++++ curl-7.64.1/lib/tftp.c
+@@ -973,6 +973,7 @@ static CURLcode tftp_connect(struct conn
+ {
+   tftp_state_data_t *state;
+   int blksize;
++  int need_blksize;
+ 
+   blksize = TFTP_BLKSIZE_DEFAULT;
+ 
+@@ -987,15 +988,20 @@ static CURLcode tftp_connect(struct conn
+       return CURLE_TFTP_ILLEGAL;
+   }
+ 
++  need_blksize = blksize;
++  /* default size is the fallback when no OACK is received */
++  if(need_blksize < TFTP_BLKSIZE_DEFAULT)
++    need_blksize = TFTP_BLKSIZE_DEFAULT;
++
+   if(!state->rpacket.data) {
+-    state->rpacket.data = calloc(1, blksize + 2 + 2);
++    state->rpacket.data = calloc(1, need_blksize + 2 + 2);
+ 
+     if(!state->rpacket.data)
+       return CURLE_OUT_OF_MEMORY;
+   }
+ 
+   if(!state->spacket.data) {
+-    state->spacket.data = calloc(1, blksize + 2 + 2);
++    state->spacket.data = calloc(1, need_blksize + 2 + 2);
+ 
+     if(!state->spacket.data)
+       return CURLE_OUT_OF_MEMORY;
+@@ -1009,7 +1015,7 @@ static CURLcode tftp_connect(struct conn
+   state->sockfd = state->conn->sock[FIRSTSOCKET];
+   state->state = TFTP_STATE_START;
+   state->error = TFTP_ERR_NONE;
+-  state->blksize = blksize;
++  state->blksize = TFTP_BLKSIZE_DEFAULT; /* Unless updated by OACK response */
+   state->requested_blksize = blksize;
+ 
+   ((struct sockaddr *)&state->local_addr)->sa_family =
diff --git a/meta/recipes-support/curl/curl_7.64.1.bb b/meta/recipes-support/curl/curl_7.64.1.bb
index 00c8c5a..151d74a 100644
--- a/meta/recipes-support/curl/curl_7.64.1.bb
+++ b/meta/recipes-support/curl/curl_7.64.1.bb
@@ -9,6 +9,7 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
            file://CVE-2019-5435.patch \
            file://CVE-2019-5436.patch \
+           file://CVE-2019-5482.patch \
 "
 
 SRC_URI[md5sum] = "790c101927845208a9d7e8c429ddd1b2"
-- 
2.7.4


