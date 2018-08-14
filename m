Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 159B779064
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 18:21:08 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id s17-v6so8643219plp.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 11:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=0Ubo+Z4IP9tkVp0TGfF5mijkESsoJ1+9v4jY54s1Vzg=;
	b=AYnikTwxKM/gVAZeC2Vgp5o3yP8/jVDYgW97skkHcmFc1MJsQblIs1NTGJVBqOUIve
	9B3rXjDK7GMyYB02wCAKPGmeYfEICsWcpEOoekovi66EW6ANIiS7FM0r9+H2ZoS2Wy5w
	XoTbKDGb9mnBpb1XzbgqUeASQC9rvIM6hxx2htfRJ6M1dUrcxmwfZmRxc2+lM5mN2zc4
	QlWQYssohrt80eyeKGdmN05qWZ1QlI4unJMD2e9apBrC9t9RU9DFhJXcmAEdG4zCHRf+
	zd+7qnnjorYWd/ARbl3IjZZRnBi4bE9yKVroPJDfzuzMuz2J9PaJTadd2ic9a0pfnWLw
	3Lhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0Ubo+Z4IP9tkVp0TGfF5mijkESsoJ1+9v4jY54s1Vzg=;
	b=qgAAZsA/bO9184uWZ9sVp1Otnp8ajPXoMYQcJcf52bnu3GBdALR3mlO3HSJLhU4a6A
	I1ItGcV/u5ezXrjplReJC1B8bfWAKeKRnZqdRDyvU3MqOtK6RJZOHbp60FLZdDTLjQc5
	GR45n/N+UFEksmisN1ER094QvoguoRMh8K72TsyB1mlyakfy4caJzyDRwlMggfdy3x8t
	UAU67FOWAGNfZC6YurYMELQ2tPMu00VYqj7ONg4trainuFLcJY7yAQvcxeRRt753lf7j
	gPxNbXbkxmxCi9DIM7GNGmM1UYMSzEK5s5FP+JxcXEpAaGvou2bX6nAlwOTni/9aj8gH
	ryFw==
X-Gm-Message-State: AOUpUlHvYA04aj4w/3sJAm0kSIpsk6njofopUVSDnwlwMJnroC/ejF0B
	duZN8Z0kQH9hOCu3p3bPaslRcS1J
X-Google-Smtp-Source: AA+uWPz/ONI1EBcbHALlKM65Gi4BTZoAjs0Ib2Xpi4Eb+iuzqjRtEGAfpi5vh+Dmxal5tW+/BdTlKg==
X-Received: by 2002:a17:902:158b:: with SMTP id
	m11-v6mr6373054pla.102.1534270869790; 
	Tue, 14 Aug 2018 11:21:09 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f217])
	by smtp.gmail.com with ESMTPSA id
	f4-v6sm23395940pfj.46.2018.08.14.11.21.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Aug 2018 11:21:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2018 11:21:02 -0700
Message-Id: <20180814182102.3115-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH] mesa: Disble TLS for musl
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
X-List-Received-Date: Tue, 14 Aug 2018 18:21:09 -0000

See https://bugs.freedesktop.org/show_bug.cgi?id=35268
mesa should infact stop using __attribute__((tls_model("initial-exec")))
until then we disale TLS in glx for musl
The problem could happen even on glibc if static TLS sizes are large enough
which would mean that additional space the glibc leaves for such rogue libraries
get consumed and then same problems show up there as well

Fixes errors seen in xorg logs e.g.

(EE) Failed to load /usr/lib/xorg/modules/extensions/libglx.so: Error relocating /usr/lib/libGL.so.1: _ITM_deregisterTMCloneTable: initial-exec TLS resolves to dynamic definition in /usr/lib/libGL.so.1

enable readonly text segment on x86 for musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 860a2d94cc..3a723b59a6 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -105,11 +105,15 @@ PACKAGECONFIG[osmesa] = "--enable-${OSMESA},--disable-${OSMESA}"
 
 PACKAGECONFIG[unwind] = "--enable-libunwind,--disable-libunwind,libunwind"
 
+EXTRA_OECONF_remove_libc-musl = "--enable-glx-tls"
+EXTRA_OECONF_append_libc-musl = " --disable-glx-tls"
+
 # llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
 FULL_OPTIMIZATION_append = " -fno-omit-frame-pointer"
 
 CFLAGS_append_armv5 = " -DMISSING_64BIT_ATOMICS"
-
+CFLAGS_append_x86_libc-musl = " -DGLX_X86_READONLY_TEXT"
+CFLAGS_append_x86-64_libc-musl = " -DGLX_X86_READONLY_TEXT"
 EXTRA_OEMAKE += "WAYLAND_PROTOCOLS_DATADIR=${STAGING_DATADIR}/wayland-protocols"
 
 # Remove the mesa dependency on mesa-dev, as mesa is empty
-- 
2.18.0


