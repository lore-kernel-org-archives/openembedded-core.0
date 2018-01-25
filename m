Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id B30C76FF7F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jan 2018 17:13:28 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id v71so16296288wmv.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jan 2018 09:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=GrcPQMFS8LS2tvKnrwhQm9YZ3MtEosN/rWbKU8J+zaE=;
	b=GTdUHp8bYOPWw5yUINLQAaVuDavgmPhAbxqnr/WGtFloALIzjszybuhZtH/TwuY4kp
	cX1FghzDZ8ZwXhV1rSZUsJxl6sIaEu87bDDggXwUPsyfDRkytQD0k0madS8DzzsGKaDv
	ejuXqhfyQLUU5T8WCERvVeQ724aCl3NZXxQa7Bzy/Rh9chnvKFcDZwQkhv+KUeueoqCy
	DDYTNp1ofK3IOZgiHp9rGCkDfSvzKZA7o62K5y/A+sdNvISLaEXs/YD4p7q/RZZi7vun
	1+mwvP5bsFhE4wEPkPW6irA3Z7viUC8TKicq618JO9n2tT93RHRabGEbnJ/wNrzWw8dH
	O5/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=GrcPQMFS8LS2tvKnrwhQm9YZ3MtEosN/rWbKU8J+zaE=;
	b=Q+fL2B47SsYingLFzUkRhkWQF4jmfN31v3Fs48iKoX4M+L/vxhhu5tU98wN6XO7csd
	XOHuZ276Tfz1GOYSftvss596ar3T0ffiU0A41VwXHep7ikFAwRwMHHIUJOd1mZyd/zU6
	Y0A2av9aU1g7lw1K2iOL+5bZSIyVhV9g5a5lcmjMx+k8xAeGVGGXWcH7RWkUtyf7fRne
	+P78SeisTjJ8DD2/qkD5h7pEcfUuqs0FO5ysFpzfm3F/VHkRc8saL99sRc81x63Wv9aq
	n/ynofTwZZFBXkIA4nY6Cj96v16M/kwYOZ+eV9n0M24C3i8VxjJqxva80qNwSOMYq2q0
	WKnA==
X-Gm-Message-State: AKwxytdFC3E08txI4wglnrBUNQMi1DCbJsqr1XpeZDAVHupvAXXmMNXI
	bN/sMRjfN/rCyeWMedmG7ZnINy/u
X-Google-Smtp-Source: AH8x226pGQzSUBlRMTny7sfzLjtbIVzFT4tDhbE41RKRHMTQ50w0fQDoueR7HjV7odzNJIrhAz9C5Q==
X-Received: by 10.28.37.5 with SMTP id l5mr8552801wml.133.1516900409170;
	Thu, 25 Jan 2018 09:13:29 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	k125sm2355044wmd.48.2018.01.25.09.13.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Jan 2018 09:13:28 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Jan 2018 17:13:25 +0000
Message-Id: <20180125171325.12289-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] archiver: don't require that images are built using RPM to build SRPMs
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
X-List-Received-Date: Thu, 25 Jan 2018 17:13:28 -0000

The requirement for images being built using RPM is too strict to have access to
the RPM functions, simply checking that package_rpm is in PACKAGE_CLASSES is
sufficient.

Also fail if SRPMs are requested but package_rpm isn't enabled, instead of
silently not doing what we were asked.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/archiver.bbclass | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index ec80ad47a40..0a9c5c16403 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -114,10 +114,9 @@ python () {
     if ar_recipe == "1":
         d.appendVarFlag('do_deploy_archives', 'depends', ' %s:do_ar_recipe' % pn)
 
-    # Output the srpm package
-    ar_srpm = d.getVarFlag('ARCHIVER_MODE', 'srpm')
-    if ar_srpm == "1":
-        if d.getVar('PACKAGES') != '' and d.getVar('IMAGE_PKGTYPE') == 'rpm':
+    # Output the SRPM package
+    if d.getVarFlag('ARCHIVER_MODE', 'srpm') == "1" and d.getVar('PACKAGES'):
+        if "package_rpm" in d.getVar('PACKAGE_CLASSES'):
             d.appendVarFlag('do_deploy_archives', 'depends', ' %s:do_package_write_rpm' % pn)
             if ar_dumpdata == "1":
                 d.appendVarFlag('do_package_write_rpm', 'depends', ' %s:do_dumpdata' % pn)
@@ -129,6 +128,8 @@ python () {
                 d.appendVarFlag('do_package_write_rpm', 'depends', ' %s:do_ar_patched' % pn)
             elif ar_src == "configured":
                 d.appendVarFlag('do_package_write_rpm', 'depends', ' %s:do_ar_configured' % pn)
+        else:
+            bb.fatal("ARCHIVER_MODE[srpm] needs package_rpm in PACKAGE_CLASSES")
 }
 
 # Take all the sources for a recipe and puts them in WORKDIR/archiver-work/.
-- 
2.11.0


