Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id CCB186C6C5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 13:55:25 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id cb5so1889039wib.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Sep 2013 06:55:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=AM70/t08syfVDCGJEHz1XJ1Q208S/sPx2GF1xwt4OOk=;
	b=HE622W3dmWsaHg4kjaZx0ISlCPPkmq+rdA6aQNg0L1T7QNqbGw3qoYcLXLyDOf9SgY
	0nDEQGSlBezw+JrdpK30rCpoJHC9SHXbp1AniFE8fplm+wfQtR4nwpIiOUPDOlP5kps2
	IWzhiTB05iap0r+qLSbgAaEAspe/vNN8VMccDqNSbsd234DqmfuDFY7xSPinZGJc3Sd9
	telGmQGfj27Mbk7wb0KB0XT/FVyY2V2AG/xVnRFUNnzca6IznzhMQzPV1a/HFHPI7MmJ
	/rbotdKlUY06FM3wnVqKxXfxrAiuWkH12L/4fahlxZypcq7ftTY2k88gjZiN3ODdhTqI
	sblQ==
X-Gm-Message-State: ALoCoQk4vKgsHzGbgAjwY8/pFsoysNSID95JEU11K3sOAf9hgOJ0EfF9Z6rIgGMz7kYKrUia8ir8
X-Received: by 10.180.206.244 with SMTP id lr20mr6387217wic.45.1378389327028; 
	Thu, 05 Sep 2013 06:55:27 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id b11sm5748994wik.1.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 05 Sep 2013 06:55:26 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Sep 2013 14:55:21 +0100
Message-Id: <1378389321-28598-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1378389321-28598-1-git-send-email-ross.burton@intel.com>
References: <1378389321-28598-1-git-send-email-ross.burton@intel.com>
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
X-List-Received-Date: Thu, 05 Sep 2013 13:55:26 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/insane.bbclass |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 524cdca..9809cba 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -919,6 +919,25 @@ Missing inherit gettext?""" % (gt, config))
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
+            whitelist = {'--enable-nls', '--disable-nls', '--disable-silent-rules', '--disable-dependency-tracking', '--with-libtool-sysroot'}
+            # TODO: allow additions per-recipe?
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


