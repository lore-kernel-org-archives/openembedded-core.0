Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UAP11-0002v5-FX
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 19:12:36 +0100
Received: by mail-wi0-f175.google.com with SMTP id l13so5225916wie.14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 09:56:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=iYM/JnRvj03aVF//OD6XJmDnrmcmj4GfsaS3KL54Tpg=;
	b=a1iHpsIMQ123nUQ+QI3sX6dxArfnDLzFzel1XsVoHGpIZCAGmRcnaqy8BgecTFc2Rz
	oPKEjrKaeKZvphr3Teb9WD1r2/RMqI+VUA6gSVojgJl52CfCQAe/RdFVL2cNDSBSHTrC
	2BxN7aERQtlCpJHVzhY1kaKDUAkg8Ym0/iy2v626jV4yVhnYMOr2XUTFnBr71BJkoc/I
	k4PmYkR65tJMDHr27clkMUSWhdgcFzUSW50Jm/wlEmyVpYcSdsd9eGw4mSllCCn2xo2H
	NqWjcHDcxjFI9w4n25E+IZvS7Y8R8kkLcRd33tkW9raJpIrK1XOACN/PyNINIPvAy6H9
	xKsw==
X-Received: by 10.180.85.97 with SMTP id g1mr21305422wiz.29.1361901375343;
	Tue, 26 Feb 2013 09:56:15 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id gy2sm3488703wib.3.2013.02.26.09.56.13
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 26 Feb 2013 09:56:14 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Feb 2013 17:53:53 +0000
Message-Id: <1361901233-23197-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQkUedCc+E1fsxSiR4/wmKQO7L8JG8vc5ZHEX+/PdRlZTsm/Hqbqwc9nA9yL2mhKDhbE2Pey
Subject: [PATCH V2] systemd: set the location of the kill binary
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
X-List-Received-Date: Tue, 26 Feb 2013 18:12:39 -0000

Otherwise systemd uses AC_PROG_PATH and finds it in the sysroot, which won't
work on the target.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd_197.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_197.bb b/meta/recipes-core/systemd/systemd_197.bb
index c765c18..001d111 100644
--- a/meta/recipes-core/systemd/systemd_197.bb
+++ b/meta/recipes-core/systemd/systemd_197.bb
@@ -63,6 +63,7 @@ EXTRA_OECONF = " --with-rootprefix=${base_prefix} \
                  --disable-microhttpd \
                  --without-python \
                  --with-sysvrcnd-path=${sysconfdir} \
+                 ac_cv_path_KILL=/bin/kill \
                "
 # uclibc does not have NSS
 EXTRA_OECONF_append_libc-uclibc = " --disable-myhostname "
-- 
1.7.10.4



