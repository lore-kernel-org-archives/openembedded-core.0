Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 7487C770E3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 06:51:10 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id x1so52558912qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Feb 2016 22:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZwQQ9PVqtSj6APhQlnKJ0PKACDk/J076ERtylEBLYuI=;
	b=Ghc6NaNSQf8SYKhP1S5pQeoAwegJAYx1K6P1pZxxnbsZjOPWzWV/lz6SXkb+KJIQB7
	3dTlOWkJ12PSuGerp/12EwVGGvRRnN04+B54C5eKvaqMxOlje1i0b+uMmB0VShjUZBED
	/UmugLIquyl1IKpXGSut4Av9kF4igyYeUP4CVB2/bf+tSqVGThv21EJzXepjB4ZbZTSZ
	/gj++RTJ+AAVvFanWlH6DLKAfejACSa3hEVxA8+cLYCR3fxt0VeB5MocZmQ7DQ4KKqpx
	C5MM0o+nRlJhCIpcOrK/7se6LNkxo6XYorx6H6H68aMI2040Ptx3rg/HBbuENKo9JKJq
	kVKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ZwQQ9PVqtSj6APhQlnKJ0PKACDk/J076ERtylEBLYuI=;
	b=NIyZ2I6EmrtW6Qr+pV05pD9B4r55PBWemHRtuqrXN0kqwQl6vRooWzvyxfWVEX2SUQ
	n3mQy0iu9GbF7h+x4GINwR+OFG06cPKZVGLBzko0HbqbJWoYz6tFYVGX3ZgTGT70Jkp/
	8KaItUsoerQ0ZBaZlRQgBlXT2baBikxKw6K8hJmq33ThPq3I3YAMSKB9dL7ehQ+4tdP8
	BheF6TuuEqr97iGLAMvQPHCiJo8dXxNpNJbWSCM85BRmayWBPxpY/xr9rx++NLChgbvr
	VKrP5SI9Kgw4d4zqRIoEsml4lkzycrrm7lrPtFIjgJVeYuOR1Bdw/eVCFyqaYHI6jXx4
	Jxhw==
X-Gm-Message-State: AG10YOQpkGy67k9OJCzVIEymtHXD0R/8lWVe1tVP86BSU/dGoPRgVNWQnllf2UGYOxdC0w==
X-Received: by 10.55.80.68 with SMTP id e65mr32598611qkb.46.1456123870588;
	Sun, 21 Feb 2016 22:51:10 -0800 (PST)
Received: from nyx.sys.comcast.net (a-96-118-179-135.sys.comcast.net.
	[96.118.179.135])
	by smtp.gmail.com with ESMTPSA id f30sm6114265qga.6.2016.02.21.22.51.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 21 Feb 2016 22:51:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Feb 2016 06:50:56 +0000
Message-Id: <1456123857-8502-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1456123857-8502-1-git-send-email-raj.khem@gmail.com>
References: <1456123857-8502-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 3/4] security_flags: Disable ssp when compiling uclibc
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
X-List-Received-Date: Mon, 22 Feb 2016 06:51:11 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/security_flags.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 2ba2755..ed82087 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -81,6 +81,8 @@ SECURITY_CFLAGS_pn-python3 = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-syslinux = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-tcl = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-tiff = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-uclibc = ""
+SECURITY_CFLAGS_pn-uclibc-initial = ""
 SECURITY_CFLAGS_pn-valgrind = ""
 SECURITY_CFLAGS_pn-zlib = "${SECURITY_NO_PIE_CFLAGS}"
 
@@ -96,6 +98,8 @@ SECURITY_LDFLAGS_remove_pn-gcc-sanitizers = "-fstack-protector-strong"
 SECURITY_LDFLAGS_remove_pn-glibc = "-fstack-protector-strong"
 SECURITY_LDFLAGS_remove_pn-glibc-initial = "-fstack-protector-strong"
 SECURITY_LDFLAGS_remove_pn-libgcc = "-fstack-protector-strong"
+SECURITY_LDFLAGS_remove_pn-uclibc = "-fstack-protector-strong"
+SECURITY_LDFLAGS_remove_pn-uclibc-initial = "-fstack-protector-strong"
 SECURITY_LDFLAGS_pn-xf86-video-fbdev = "${SECURITY_X_LDFLAGS}"
 SECURITY_LDFLAGS_pn-xf86-video-intel = "${SECURITY_X_LDFLAGS}"
 SECURITY_LDFLAGS_pn-xf86-video-omapfb = "${SECURITY_X_LDFLAGS}"
-- 
1.8.3.1


