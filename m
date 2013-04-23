Received: from mail-ee0-f43.google.com ([74.125.83.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UUYhz-0000fq-7V
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Apr 2013 10:36:17 +0200
Received: by mail-ee0-f43.google.com with SMTP id e50so123109eek.16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2013 01:18:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:content-type:content-transfer-encoding:subject
	:message-id:date:to:mime-version:x-mailer:x-gm-message-state;
	bh=19nUc6k1sUmcNfb1pJBZSyD7/AYaFUF6Ug0PKIRu19Q=;
	b=A/dp0k/bb5NpTTXRYezX3ZAIOKuD3TttL/LIqm0akLH+54QE61VUoytfULXWH8hYgh
	lNyozemYFMANpPOmQUA4um5R2g3MdthZeIZrMpRsGxGh6WMFw1NVMVwAcIOlOfvfi+vx
	Cw1tjMmKQ45nN+3EWFVYH9mhvjNh1gWj/mHUpfdiKY+Ut10+RE1Sufe2y2JJdD34X9dz
	dXeEgp83ouWJBoT6aZnQglkuGh+olFYw+l/OPbsHPuOnudLu/tu9mj7Uu4SyYukrB7no
	fkIWiXZRF0BDAki8QjjS8CeD3oodq9QWmsYf0JZK0AH9SsbL5u3Rn+754KctSqwJYcHm
	1pzQ==
X-Received: by 10.14.174.5 with SMTP id w5mr49354162eel.1.1366705115015;
	Tue, 23 Apr 2013 01:18:35 -0700 (PDT)
Received: from [172.20.0.100] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id cd3sm45255864eeb.6.2013.04.23.01.18.33
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 23 Apr 2013 01:18:34 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Message-Id: <DCC98A73-D384-41BC-BF41-E19F9763ABD3@dominion.thruhere.net>
Date: Tue, 23 Apr 2013 10:18:32 +0200
To: "openembedded-core@lists.openembedded.org layer"
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQkzbiM87JC6KsKJupGmlwEzFqW21jyuNRTiuTU+UgdkjFr3QbUsTeM+PVOPA4bW7dWpD8rL
Subject: [RFC] disable SysV compat in systemd when there's no 'sysvinit' in DISTRO_FEATURES
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
X-List-Received-Date: Tue, 23 Apr 2013 08:36:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

A real patch will follow later after I test this (full rebuild going on =
due to the BACKFILL snafu mentioned earlier), but it boils down to:

[koen@rrMBP systemd]$ diff -Nurd systemd_199.bb systemd_202.bb=20
--- systemd_199.bb      2013-04-22 16:53:18.450910639 +0200
+++ systemd_202.bb      2013-04-23 09:48:06.803283711 +0200
-                 --with-sysvrcnd-path=3D${sysconfdir} \
+                 ${@base_contains('DISTRO_FEATURES', 'sysvinit', =
'--with-sysvrcnd-path=3D${sysconfdir}', '--with-sysvrcnd-path=3D', d)} \

Is anyone fundamentally opposed to this going in early in the 1.5 cycle =
provided my tests work out?

regards,

Koen=


