Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id EE42B6FF91
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Dec 2015 18:14:32 +0000 (UTC)
Received: by iofh3 with SMTP id h3so68555028iof.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Dec 2015 10:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=vE/W0nUuHLmlpYPf70dCWDH8V82SYPQsSiGIIlSl0So=;
	b=KMd5WuoEmA+GgfiYyf2P7QtA4APAHym/ZZdrQf99JQuuF3zCPte9y9Y8Stl6U72H7+
	n9N1+7c3dlbBEkI7EZt6d4c6r5g/Ddu3xttU0pqDO+BT0xymq0QhxtTqtxYB3lQMTnck
	L/aVnG3Zbtkp3kYYYFDKjSVLtB8DrgHT03XYR6XJmKdatSPaVYWBOoF2R+lKY/i3AazV
	9P9qzwbGuRmvWPYgBI3WnKd1/clRcM3thTmlV8SfTfkhxS+C5spS3alDkOokMvwICCZo
	86PqXWu7cghplRqLfsylVClSD3uXCrsp+ijF3fpqz0hcg6eUlG82XMHGPXx9aC2Ba6as
	fiGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=vE/W0nUuHLmlpYPf70dCWDH8V82SYPQsSiGIIlSl0So=;
	b=YJjC2LPD129gNI1PSAv/yr4hWM/YwldeqVtDm5a3pMFZKjOnf/svjD9YtCZcwVdI3w
	mFR0O68awr6O6tinUBZVMmE3leOgfHvHl9kzSVLJHbfQSeKLylExf+lx9p7lQA5NEZ7o
	CSbFISFboWPRKqGe1Ynj0Wl9YxJCBPeE2c1W58aQckj2SK4KErIpfHrugWvMzid8nbsz
	0vsmXsiFzy4dvQ2IADowtJSdEAGIzH+tG7La/NmTUJ8CXOIm17sNe26W3dv7bXX27eQ1
	qANt38C6lcCHRhoaXLW0T/78ZYuf/iWwREQQz8N5yPFkTqTfTt73yh6HQgB0xShwKH1b
	1lmw==
X-Gm-Message-State: ALoCoQlgl9C1uTem3OGuOWCKw2pJR+1OouL+WYDBOIqsyIwYudDgSETNYpFOVos9fesveexbbbbi/tVHyR926WXpWNCVxmKgbQ==
X-Received: by 10.107.162.68 with SMTP id l65mr6430323ioe.179.1449684873169;
	Wed, 09 Dec 2015 10:14:33 -0800 (PST)
Received: from pohly-desktop.fritz.box (p57A560AC.dip0.t-ipconnect.de.
	[87.165.96.172])
	by smtp.gmail.com with ESMTPSA id 79sm3710213ioh.19.2015.12.09.10.14.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 Dec 2015 10:14:32 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Dec 2015 20:14:30 +0100
Message-Id: <50a0e6b65f3a93bcb254d13514122dc499dce4a8.1449683756.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1449683756.git.patrick.ohly@intel.com>
References: <cover.1449683756.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1449683756.git.patrick.ohly@intel.com>
References: <cover.1449683756.git.patrick.ohly@intel.com>
Subject: [PATCH 2/3] busybox.inc: prepare for additional link files
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
X-List-Received-Date: Wed, 09 Dec 2015 18:14:33 -0000

Right now, do_package_prepend() supports putting all applets into one
binary or the suid/nosuid binaries.

It may also be useful to split busybox differently and then use more
fine-grained file capabilities instead of suid to control what each
applet is allowed to do, or use hardlinks and different file
capabilities on each copy.

This change supports this by replacing the hard-coded links file names
with something that operates on all files matching the busybox.links*
shell pattern. For each /etc/busybox.links<foobar> link file there has
to be a corresponding /bin/busybox<foobar>.

set_alternative_vars() now always gets called with full path of the
link file in the host file system (because that is what the caller
has) and, while at it, only checks for existance of the target once.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-core/busybox/busybox.inc | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index fba956e..65a17ee 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -331,7 +331,8 @@ python do_package_prepend () {
     dvar = d.getVar('D', True)
     pn = d.getVar('PN', True)
     def set_alternative_vars(links, target):
-        f = open('%s%s' % (dvar, links), 'r')
+        target_exists = os.path.exists('%s%s' % (dvar, target))
+        f = open(links, 'r')
         for alt_link_name in f:
             alt_link_name = alt_link_name.strip()
             alt_name = os.path.basename(alt_link_name)
@@ -340,16 +341,17 @@ python do_package_prepend () {
                 alt_name = 'lbracket'
             d.appendVar('ALTERNATIVE_%s' % (pn), ' ' + alt_name)
             d.setVarFlag('ALTERNATIVE_LINK_NAME', alt_name, alt_link_name)
-            if os.path.exists('%s%s' % (dvar, target)):
+            if target_exists:
                 d.setVarFlag('ALTERNATIVE_TARGET', alt_name, target)
         f.close()
         return
 
-    if os.path.exists('%s/etc/busybox.links' % (dvar)):
-        set_alternative_vars("${sysconfdir}/busybox.links", "${base_bindir}/busybox")
-    else:
-        set_alternative_vars("${sysconfdir}/busybox.links.nosuid", "${base_bindir}/busybox.nosuid")
-        set_alternative_vars("${sysconfdir}/busybox.links.suid", "${base_bindir}/busybox.suid")
+    import glob
+    base = dvar + "${sysconfdir}/busybox.links"
+    for links in glob.glob(base + "*"):
+        # Suffix might be empty when there is no split between busybox.suid and busybox.nosuid.
+        suffix = links[len(base):]
+        set_alternative_vars(links, "${base_bindir}/busybox" + suffix)
 }
 
 pkg_postinst_${PN} () {
-- 
2.1.4


