Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id E2C2F78674
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jan 2018 13:37:58 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id e41so14856739wre.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jan 2018 05:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=WMa561vAFEmIQeSyuA/q8s2Nq38zkviV8ceeoxk9aeU=;
	b=VCtpy5btivGAiAWmDam5dnYS5frAwEMh/JYEftJ/4CzG29iylnsTuzVGTMtsdTrt4B
	IUXUxS4YnRcXn5KdfhKTjxOejdx8+GouHAdrX6+BCQSxadzg3Gvt/wzE3XiprM4y76mI
	KrOVSb6SJXx3wBzpbKXAyYuMc3GKE/95Sn9JSkroWeirVgNyWp6keMvJmxmcW6evN3lC
	Q7W3AHvuzqXHd1T8yXOasrvaiKf2Di2S3vt27OQnRGW1dFV4Yo5dm/4yb/P/oDgMLs+K
	wuNX5TFpWxcQ/ilms0oHvtPwWAUadblWIfr7j9iTJrn3ymqQnjMhxv29F9B0Me3ZCZQz
	+BGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=WMa561vAFEmIQeSyuA/q8s2Nq38zkviV8ceeoxk9aeU=;
	b=onmuD9O3TZrqwHM8juj5VyYrmyaXBfCWtFftbPRIiTotutracipH95GQQS6iS216bo
	Q0G5ejzeJgTMZqzWZ26HJffpq5VELPmR7VMu5kkUZLT14+pC1A5w83wtSdRlPusYVXQe
	qcoDTE7t8Lid3Xi+7OTQhDUEQ3drtWezyG7dQ6A/TAIOJRu+7ln84KkOcIsxYwRFXfxC
	YixEnk9S/70sOTdfZP1Om3gdyn+4nqWWYF4ta8aeBP5IPWDgQMtd9PX5Sab5WJaDHvxl
	/vD/6aK6Em4UiCWBr50O44bYmE2pHzLwMSWYiuiILePMkTpIdhHy8/mh/Rqk05hmn+H1
	KsUQ==
X-Gm-Message-State: AKwxytc1DoHBsRfJspU1bGkkZlyIpl2S+HFWDobNxnsxezPZUteR3hAw
	QF1BNbm7McC3wILjzyIVo4hI6RW5
X-Google-Smtp-Source: ACJfBovFHt7jXgTFQ5w1xu6livHMZRjt46sZ2ofAL0WpXft/8b+9gs0LNYeZYNtHXKox1tVPaONDyw==
X-Received: by 10.223.186.194 with SMTP id w2mr24059403wrg.173.1516109879841; 
	Tue, 16 Jan 2018 05:37:59 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id f48sm462153wra.72.2018.01.16.05.37.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Jan 2018 05:37:59 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Jan 2018 13:37:54 +0000
Message-Id: <20180116133754.29471-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180116133754.29471-1-ross.burton@intel.com>
References: <20180116133754.29471-1-ross.burton@intel.com>
Subject: [PATCH 2/2] classes/debian: clean up process spawning
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
X-List-Received-Date: Tue, 16 Jan 2018 13:37:59 -0000

This code is old and was of it's time, rewrite it to use modernish (we support
Python 3.4, so can't use subprocess.run()) subprocess and re idioms instead.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/debian.bbclass | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/meta/classes/debian.bbclass b/meta/classes/debian.bbclass
index edc6da1ba3a..989ea8f8d28 100644
--- a/meta/classes/debian.bbclass
+++ b/meta/classes/debian.bbclass
@@ -25,7 +25,7 @@ python () {
 }
 
 python debian_package_name_hook () {
-    import glob, copy, stat, errno, re, pathlib
+    import glob, copy, stat, errno, re, pathlib, subprocess
 
     pkgdest = d.getVar("PKGDEST")
     packages = d.getVar('PACKAGES')
@@ -76,15 +76,14 @@ python debian_package_name_hook () {
             if path in libdirs:
                 has_libs = 1
                 if so_re.match(os.path.basename(f)):
-                    cmd = (d.getVar('TARGET_PREFIX') or "") + "objdump -p " + f + " 2>/dev/null"
-                    fd = os.popen(cmd)
-                    lines = fd.readlines()
-                    fd.close()
-                    for l in lines:
-                        m = re.match("\s+SONAME\s+([^\s]*)", l)
-                        if m and not m.group(1) in sonames:
-                            sonames.append(m.group(1))
-
+                    try:
+                        cmd = [d.expand("${TARGET_PREFIX}objdump"), "-p", f]
+                        output = subprocess.check_output(cmd).decode("utf-8")
+                        for m in re.finditer("\s+SONAME\s+([^\s]+)", output):
+                            if m.group(1) not in sonames:
+                                sonames.append(m.group(1))
+                    except subprocess.CalledProcessError:
+                        pass
         bb.debug(1, 'LIBNAMES: pkg %s libs %d bins %d sonames %s' % (orig_pkg, has_libs, has_bins, sonames))
         soname = None
         if len(sonames) == 1:
-- 
2.11.0


