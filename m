Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id A9A126CED2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2013 14:30:16 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id l18so6496013wgh.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Oct 2013 07:30:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=5CeEeX+pS1dghYazYpi/HcPK+qk0+nAqb/K42soqUcY=;
	b=Tezaqy9Id0kAlHM3IFmPk6teyG/UBb2c37ZfG7fwYtgFOdXN6rNaeKwQjTtqf63RfH
	8udx0+aK2qndko6zEUoJESqL0tNpj2F3m/FOW9/XG5nJDeU623fIJFLloqdVxAeX28WG
	S/uxXAxpvL4UvAbDTvnSxiUzOMLNQmthuJNDw/vCecVz5MxuOWc9SwLKrPhIlU3nHkHu
	0lHRuYRIlE/2aCskwVRS60FrdwinJvxUgxafI/XU5MZCF/BXxEqvKXyHMT/jOUN5E7i5
	bEIi+pkqAZpGDUWvVnKCuMtYeZx5rv8/rcLWwL8+AlqQN4eWWZHKwoiz38SR89hLkgtN
	F+jg==
X-Gm-Message-State: ALoCoQkfU4XP8mnFl2EaN6Y5o+9vo3Ki1AEgVWq6yg7Ljm0mPa+0RgielbRHibUCHHB5aKxgQNvd
X-Received: by 10.194.93.135 with SMTP id cu7mr1684789wjb.73.1381242618102;
	Tue, 08 Oct 2013 07:30:18 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id gp9sm5678976wib.8.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Oct 2013 07:30:17 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Oct 2013 15:30:05 +0100
Message-Id: <1381242605-13393-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1381242605-13393-1-git-send-email-ross.burton@intel.com>
References: <1381242605-13393-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH] insane: configure option checking
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
X-List-Received-Date: Tue, 08 Oct 2013 14:30:17 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/insane.bbclass |   20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index a784aff..6aaae6b 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -42,6 +42,8 @@ ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
 
 ALL_QA = "${WARN_QA} ${ERROR_QA}"
 
+UNKNOWN_CONFIGURE_WHITELIST ?= "--enable-nls --disable-nls --disable-silent-rules --disable-dependency-tracking --with-libtool-sysroot"
+
 #
 # dictionary for elf headers
 #
@@ -916,6 +918,24 @@ Missing inherit gettext?""" % (gt, config))
     if not package_qa_check_license(workdir, d):
         bb.fatal("Licensing Error: LIC_FILES_CHKSUM does not match, please fix")
 
+    ###########################################################################
+    # Check unrecognised configure options (with a white list)
+    ###########################################################################
+    if bb.data.inherits_class("autotools", d):
+        bb.note("Checking configure output for unrecognised options")
+        try:
+            flag = "WARNING: unrecognized options:"
+            log = os.path.join(d.getVar('B', True), 'config.log')
+            output = subprocess.check_output(['grep', '-F', flag, log])
+            options = set(map(lambda s: s.strip(' ,'), output.partition(flag)[2].split()))
+            whitelist = set(d.getVar("UNKNOWN_CONFIGURE_WHITELIST", True).split())
+            options -= whitelist
+            if options:
+		pn = d.getVar('PN', True)
+                error_msg = pn + ": configure was passed unrecognised options: " + " ".join(options)
+                package_qa_handle_error("unknown-configure-option", error_msg, d)
+        except subprocess.CalledProcessError:
+            pass
 }
 # The Staging Func, to check all staging
 #addtask qa_staging after do_populate_sysroot before do_build
-- 
1.7.10.4


