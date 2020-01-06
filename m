Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8B7F76BE2D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2020 12:47:29 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id p17so15145599wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jan 2020 04:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Bs8ZNseYCBXO496kHAg/Sng+aHcvyXfgIEfnpecXS9w=;
	b=lARtzUZ4da647yxRflehPPse7TDLb3ZNL2gJfzq4C4lBAkU6MecEgjG64s75qQo+rW
	mR3fJvJPWBlCW6PE/srz8QtDOZ3hcSH/7U5DzmupPY4aCXJPb1lD6JUIIlzL3Kmmms3Z
	B6/WDXdhlvNtjeDT87jHC3w1oC35FfLvPD5eRx8lC6vRV5J7+w0xn6afig2NWAbKqsmQ
	vUdYcQHKrFVig39eEHoFwszQWCZAgDf25AcctCuH7zxFJwb45BZgJtHmr4V3ZzTD2HkC
	emUClx3XO0zwSyGl86eLfb2dRfChG1fbx08jS7DuytuDuuFwzAmudIiJlNUzPrwDy93x
	idUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Bs8ZNseYCBXO496kHAg/Sng+aHcvyXfgIEfnpecXS9w=;
	b=GChM78cTqCnaxAeKUduDo3EgNjYUWcfAJxT2GfCTkc8/GhgjWQpxwI+vyJhGmWG3WT
	i/AJ94AwYwN53mWyG0fUuQfVX903g/30LLmQoelfJdWYRnhzQDPmS0Cv4/bNMrnVvs3E
	OJyVv89EbxT72h21XdIOdremHoDUpTBHicYzIg0wtRy9KqgB6NzsRIC09QoYcctT7VYk
	ewA5DTodFYYhfWyMZ+8lZmwYWnlYHuNbDxv/ehqWV5IavLoKWR383xPeeE8233135ltv
	uysewIBHGw1OUww6tmhxRD3JtG0908uBpvE46tlNr2SMI21dypVLwVrmM6TbnL7TGWWC
	aBLw==
X-Gm-Message-State: APjAAAVLl3QxtpKm2aWsU/o3D2sCqskHqOqvKrH7UKtooXLJ8LExbrQW
	Y0TlEwWlXQj1ABFn37OiY4g4p4iSHXI=
X-Google-Smtp-Source: APXvYqyzktQN4hCGfcwYYJAeJ6w+F64kDrMmcrOqhcF8HnewYhWejWKwZZPBYi7PgS1mzHJ+P7md+Q==
X-Received: by 2002:a05:600c:220e:: with SMTP id
	z14mr34405680wml.114.1578314849969; 
	Mon, 06 Jan 2020 04:47:29 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	z8sm71033810wrq.22.2020.01.06.04.47.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 04:47:28 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jan 2020 12:47:26 +0000
Message-Id: <20200106124726.3292-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] glib: set missing cross property
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
X-List-Received-Date: Mon, 06 Jan 2020 12:47:30 -0000
Content-Transfer-Encoding: 8bit

GLib 2.60 onwards checks for /proc/self/cmdline instead of assuming that
it exists on Linux (because Cygwin also has it).  As this is a runtime
test it doesn't execute in cross builds so defaults to false, but under
Linux this should be true.

Restore the previous behaviour and silence the warning by setting the
cross property appropriately.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/glib-2.0/glib-2.0/glib-meson.cross | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/glib-meson.cross b/meta/recipes-core/glib-2.0/glib-2.0/glib-meson.cross
index b5df4007275..5246c776014 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/glib-meson.cross
+++ b/meta/recipes-core/glib-2.0/glib-2.0/glib-meson.cross
@@ -4,6 +4,7 @@ have_c99_snprintf = true
 have_unix98_printf = true
 va_val_copy = true
 growing_stack = false
+have_proc_self_cmdline = true
 
 [binaries]
 env = "/usr/bin/env"
-- 
2.20.1


