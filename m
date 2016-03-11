Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 9558F731F7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 17:26:32 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id l68so26814289wml.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 09:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=bMnZG2GpPl0dMo3z0mDjHX3Oa8pOcyRDx4DgNdaYC6Q=;
	b=hpS1T11/JoOHmmbM2hfDkolSTxDs1h3ujfPkSx6C5JUnJmLMUQgHUqUsf/eJs4DWYj
	2E8hv9GiZj9dRjyQEh2tzRH3cT5GuTy1a/OMB8IN1qfBIs1ysKEFhwLjdtG4oWcmkSHH
	xsnDPPZkZsxk+CDrg4mfaYaTaJzfggxDH6csvVKYGhuSPUMoNaYcF1D5y3xM2tsBbtbX
	fRCG+PK210IQH8nFj7BAPq0nB6dmLU0VG9gFe9DKbaO+7zvBiIaYKvK+9hEmt2DDJ0Qa
	lwYrwzwa9FvPE/G8kx2I3E6wH7GIfgUtg6OLnRVK14IRMTbNuQwv9Z/TvvnfQiK9CCuo
	OkfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=bMnZG2GpPl0dMo3z0mDjHX3Oa8pOcyRDx4DgNdaYC6Q=;
	b=O31wvjl6WqYkgvRWpynIVQVL7UBDPnmOgFtwt4guCobe35XP8dvJsFdh9/88snHypX
	JVfE6GjLGIElSSh6PTsIqw5CkbOUEWzJZpfn3gbpbRJi4OWop8hTq27AC6jFLsQcUk0k
	kYv4wAdq2pyfsv0SmBmSEqVmtaV9ACAFunc87wjbkc6oIU+qMkxIwOMoL+xIwvODNFLt
	ap6BCUj1OFExyWAy1Dp7lQgyZtiaK+z3Dww9Xqcvd6NEPOQuHBX7TiEkvU6dFZn9/eQz
	DUlvvTthfzMHKn/wLIeC5p7O8f9Pgeem6f0iHrg6ZaZfixkxSztBmQZHQ2RT2uTEHBg9
	35fg==
X-Gm-Message-State: AD7BkJJYv4SAy/BYTbnXdbWqj8fEXPrqygK7SiFaWZ0HOz53Viv86zNzvd4s88u6Au24dmMk
X-Received: by 10.194.236.3 with SMTP id uq3mr10860965wjc.119.1457717193035;
	Fri, 11 Mar 2016 09:26:33 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	da6sm9402326wjb.24.2016.03.11.09.26.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 11 Mar 2016 09:26:32 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Mar 2016 17:26:30 +0000
Message-Id: <1457717190-19925-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] gobject-introspection: stop GLib linking to GConf
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
X-List-Received-Date: Fri, 11 Mar 2016 17:26:33 -0000

If gconf is installed in the sysroot then GLib will use it by default for the
GSettings backend.  This will pull a lot more libraries into the scanner
processes and expands the potential for bad linking through the imperfect qemu
user-mode emulation.

Set GSETTINGS_BACKEND=memory to force it to use the stub backend.  It's possible
that other fixes (such as glib relocation) have mitigated the damage that this
causes but right now it's better to be safe than sorry.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gobject-introspection/gobject-introspection_1.46.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.46.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.46.0.bb
index 684d7cf..384204c 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.46.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.46.0.bb
@@ -54,6 +54,7 @@ do_configure_prepend_class-target() {
         cat > ${B}/g-ir-scanner-qemuwrapper << EOF
 #!/bin/sh
 export GIO_MODULE_DIR=${STAGING_LIBDIR}/gio/modules
+export GSETTINGS_BACKEND=memory
 
 $qemu_binary "\$@"
 if [ \$? -ne 0 ]; then
-- 
2.7.0


