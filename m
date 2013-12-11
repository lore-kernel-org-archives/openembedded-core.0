Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id 8C97F6DF41
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2013 08:50:27 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id u57so6028858wes.23
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2013 00:50:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0kMwhcZX2FbPoOJoeu+o+zwJ5JUjlY9jvjsNY9avBr4=;
	b=kgmmpLu9lR69IoyA5EOtRSLGqJP+JYg9j0QAJOB4r9yquFs/L2fGlfJcx/kUNyafpO
	aQGElvrt5OIDpw3AbTUJL+agNr5szfbAKBHOT9rKAkO1KqerEH+3CKCfv9ahN8h4EjgD
	sFrDWu4HhpAs/2PXq3jckFu0JlxTmJhYC1Xueu75NBff5jxWIwCNAHJ06AntE8q7AAYG
	8+Trv4nz6L0xfDt3/HpKx8FVqB5ywEhFcLFntL01crC5sTfR62PibIWqNYBcZX0eqIoP
	Bx3fn2EU0z6WiVLcYqt14CoaFTor6/N/+IT017AiauR5b3i/hZxCSVgMrgLkmPU0wx7B
	J7KQ==
X-Gm-Message-State: ALoCoQk/3rJwuHM/zq2TEIEoKYLJwtAanG/zlNNC+vCTJkRl4+h9mQDnwF5uXJMY9OQUhpFfGJOx
X-Received: by 10.180.12.146 with SMTP id y18mr1733912wib.37.1386751826784;
	Wed, 11 Dec 2013 00:50:26 -0800 (PST)
Received: from localhost (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id pi6sm12806058wic.3.2013.12.11.00.50.24
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Dec 2013 00:50:25 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Dec 2013 09:50:09 +0100
Message-Id: <1386751809-8853-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.4.2
In-Reply-To: <1386751809-8853-1-git-send-email-koen@dominion.thruhere.net>
References: <1386751809-8853-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 3/3] cpan_build bbclass: do not install module into /usr/share
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
X-List-Received-Date: Wed, 11 Dec 2013 08:50:27 -0000

https://github.com/openembedded/oe-core/commit/83796edd29561f02b6f7b036351711f8def77a4f is a partial solution, this fixes cpan_build.bbclass as well.

A non-working one looks like this:
	[koen@rrmbp v2013.06]$ dpkg-deb -c deploy/eglibc/ipk/armv7ahf-vfp-neon/perl-module-build-withxspp_0.14-r0.0_armv7ahf-vfp-neon.ipk
	-rw-r--r-- root/root       361 2013-11-28 16:50 ./usr/lib/perl/auto/Module/Build/WithXSpp/.packlist
	-r--r--r-- root/root     22557 2013-11-28 16:50 ./usr/share/perl/Module/Build/WithXSpp.pm

It now looks like this:
	[koen@rrmbp v2013.06]$ dpkg-deb -c deploy/eglibc/ipk/armv7ahf-vfp-neon/perl-module-build-withxspp_0.14-r*.ipk
	-rw-r--r-- root/root       378 2013-11-29 14:44 ./usr/lib/perl/auto/Module/Build/WithXSpp/.packlist
	-r--r--r-- root/root     22557 2013-11-28 17:22 ./usr/lib/perl/vendor_perl/5.14.3/Module/Build/WithXSpp.pm

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/classes/cpan_build.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/cpan_build.bbclass b/meta/classes/cpan_build.bbclass
index eaba40a..5b0ad61 100644
--- a/meta/classes/cpan_build.bbclass
+++ b/meta/classes/cpan_build.bbclass
@@ -32,7 +32,6 @@ cpan_build_do_configure () {
 
 	perl Build.PL --installdirs vendor \
 				--destdir ${D} \
-				--install_path lib="${datadir}/perl" \
 				--install_path arch="${libdir}/perl" \
 				--install_path script=${bindir} \
 				--install_path bin=${bindir} \
-- 
1.8.4.2


