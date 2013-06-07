Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 35A286A4AB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 02:27:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r572RegM029301
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Jun 2013 19:27:40 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.158) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Thu, 6 Jun 2013 19:27:39 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Jun 2013 10:27:43 +0800
Message-ID: <2c0eacd59aacc23859ab90389cd238d26a2679b8.1370568886.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1370568886.git.rongqing.li@windriver.com>
References: <cover.1370568886.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] openssh: three fixes
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
X-List-Received-Date: Fri, 07 Jun 2013 02:27:38 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

1. fix a alignment issue on ARM v7 NEON cpu
2. fix a empty passwd issue
3. enable tcp-wrappers by default

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 .../openssh-6.2p1/mac_compute-alignment.patch      |   39 ++++++++++++++++++++
 .../openssh-permit_empty_passwd.patch              |   33 +++++++++++++++++
 meta/recipes-connectivity/openssh/openssh_6.2p1.bb |    5 +++
 3 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh-6.2p1/mac_compute-alignment.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh-6.2p1/openssh-permit_empty_passwd.patch

diff --git a/meta/recipes-connectivity/openssh/openssh-6.2p1/mac_compute-alignment.patch b/meta/recipes-connectivity/openssh/openssh-6.2p1/mac_compute-alignment.patch
new file mode 100644
index 0000000..ea8a31a
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh-6.2p1/mac_compute-alignment.patch
@@ -0,0 +1,39 @@
+Upstream-Status: Pending
+
+The mac_compute() function in openssh calls umac_final() to prepend a tag
+to a buffer.  Umac_final() calls pdf_gen_xor() on the tag as its final
+operation, and as implemented, pdf_gen_xor() assumes an appropriate
+alignment for 64-bit operations on its buffer.  However, the buffer
+is declared in mac_compute() as a static u_char array, and the linker
+doesn't guarantee 64-bit alignment for such arrays.  On ARM v7 NEON
+platforms with gcc, 64-bit values must be 64-bit aligned, and the
+unaligned buffer declaration caused alignment faults when executing
+certain openssh tests.
+
+Force the buffer in mac_compute() to be 64-bit aligned.
+
+Signed-off-by: Donn Seeley <donn.seeley@windriver.com>
+---
+ mac.c |    8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+--- a/mac.c
++++ b/mac.c
+@@ -132,12 +132,14 @@ mac_init(Mac *mac)
+ u_char *
+ mac_compute(Mac *mac, u_int32_t seqno, u_char *data, int datalen)
+ {
+-	static u_char m[EVP_MAX_MD_SIZE];
++	static u_int64_t m_buf[(EVP_MAX_MD_SIZE + sizeof (u_int64_t) - 1)
++	    / sizeof (u_int64_t)];
++	u_char *m = (u_char *)m_buf;
+ 	u_char b[4], nonce[8];
+ 
+-	if (mac->mac_len > sizeof(m))
++	if (mac->mac_len > EVP_MAX_MD_SIZE)
+ 		fatal("mac_compute: mac too long %u %lu",
+-		    mac->mac_len, (u_long)sizeof(m));
++		    mac->mac_len, (u_long)EVP_MAX_MD_SIZE);
+ 
+ 	switch (mac->type) {
+ 	case SSH_EVP:
diff --git a/meta/recipes-connectivity/openssh/openssh-6.2p1/openssh-permit_empty_passwd.patch b/meta/recipes-connectivity/openssh/openssh-6.2p1/openssh-permit_empty_passwd.patch
new file mode 100644
index 0000000..c1d7f8e
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh-6.2p1/openssh-permit_empty_passwd.patch
@@ -0,0 +1,33 @@
+Subject: [PATCH] openssh: fix permit_empty_passwd
+
+Upstream-Status: pending
+
+When pam enabled, userauth_none calls auth_password("") -->
+pam_authenticate("") will cause pam_auth process in the fail
+status. This will block all login, even users with a correct
+password.
+
+userauth_none should alway return false since sshd
+would check passwords in userauth_passwd using pam* modules.
+
+Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
+---
+ auth2-none.c |    2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/auth2-none.c b/auth2-none.c
+index c8c6c74..560feef 100644
+--- a/auth2-none.c
++++ b/auth2-none.c
+@@ -61,6 +61,8 @@ userauth_none(Authctxt *authctxt)
+ {
+ 	none_enabled = 0;
+ 	packet_check_eom();
++	if (options.use_pam)	
++		return 0;
+ 	if (options.permit_empty_passwd && options.password_authentication)
+ 		return (PRIVSEP(auth_password(authctxt, "")));
+ 	return (0);
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-connectivity/openssh/openssh_6.2p1.bb b/meta/recipes-connectivity/openssh/openssh_6.2p1.bb
index 20502c4..198c09d 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.2p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.2p1.bb
@@ -25,6 +25,8 @@ SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
            file://ssh_config \
            file://init \
            file://openssh-CVE-2011-4327.patch \
+           file://mac_compute-alignment.patch \
+           file://openssh-permit_empty_passwd.patch \
            ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
 
 PAM_SRC_URI = "file://sshd"
@@ -45,6 +47,9 @@ inherit autotools
 CFLAGS += "-D__FILE_OFFSET_BITS=64"
 export LD = "${CC}"
 
+PACKAGECONFIG ??= "tcp-wrappers"
+PACKAGECONFIG[tcp-wrappers] = "--with-tcp-wrappers,,tcp-wrappers"
+
 EXTRA_OECONF = "--with-rand-helper=no \
                 ${@base_contains('DISTRO_FEATURES', 'pam', '--with-pam', '--without-pam', d)} \
                 --without-zlib-version-check \
-- 
1.7.10.4


