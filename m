Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id F06067D18D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 08:17:53 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id k3so6167252pga.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Apr 2019 01:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=mVM+Hn+bIX9GvzQq42HYHp6XG7jurNfLPp/EEGegwwA=;
	b=jLS30O8sAMiLTU6BGTfYeHHJWxs1M8BvJayjod6ipeHJYESH4x/bi2IdDr896yRC0B
	/XQD8eQVy68LWJ8/ixTK2pXxv7aW4Ma+N/KNLxirx5XVnIn09HVOdanQkfIx91goSfjY
	Mtpa/TA5vKsuqE5ukNMS/Qq+prrDSdKxaVDn0fDkeaIWhDSST7oeJDhSLYesT4upCZoD
	NElwSGXHH9kEHxtSCNv4W/NHdDkmKpQIxjUKc3H4FegEpdjf3FakehT8rvIlBKlgrEiV
	rBlRLJPalxJCRAdtEKmXI9MvD70AzBX0jreKAWs+0ssdkDeoiFbg1Mas7Obok3SReK95
	N4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:content-transfer-encoding:mime-version;
	bh=mVM+Hn+bIX9GvzQq42HYHp6XG7jurNfLPp/EEGegwwA=;
	b=KVaAVN3nxccUnkmAesjJUxXNLDuDU1HCrOZXcugGRFeKB2pU3Sz/Wyzs8ghBUQt9Pb
	m3S79QgPzGa6AL7XtP0YfK53/SvlrkZrcnONWXDxJ/JITIVRMy6iQpl0Gy0cRvjwdbhA
	DBZ1y/reEFMbBwbtMx79ly7pVi/DK3d18U+DdR2scLFP9jqCYMFqi80VMAFAMA+arQyI
	QfK7GyUJ2vLlnkLixdcz6smdGIESEn7mT9tzRq6SSLoE7idLrGr+LpBA5dwHm4+DWhAl
	rw/AAnuCSOC5HGmK+v2W2x/NZU9kK35dzBqQMcM9eGuANkdRGMl4J5IToOALUyG/X7Gc
	eoBQ==
X-Gm-Message-State: APjAAAV+RfwYISSEDYyzI9duniO/xSzPLw3MNOGH7hIz3OsISM9eTpFU
	Khy2nvQfCc/aurJmOvfcD0K8Xg==
X-Google-Smtp-Source: APXvYqylAeB0e+3ALfnYs5YQSSUrEvM+XHrrLapmrJ1XTsHpCG1HRcKqJ3lpoddZh4o3o7xYPdWAJg==
X-Received: by 2002:a63:fc0b:: with SMTP id j11mr1068810pgi.74.1554193075155; 
	Tue, 02 Apr 2019 01:17:55 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.73.181])
	by smtp.gmail.com with UTF8SMTPSA id
	h187sm13380978pfc.52.2019.04.02.01.17.53
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 02 Apr 2019 01:17:54 -0700 (PDT)
Date: Tue, 02 Apr 2019 08:17:39 +0000
Message-Id: <20190402081739.3316-2-nathan@nathanrossi.com>
In-Reply-To: <20190402081739.3316-1-nathan@nathanrossi.com>
References: <20190402081739.3316-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH 2/2] cml1.bbclass: Use POSIX sh instead of var-SHELL
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
X-List-Received-Date: Tue, 02 Apr 2019 08:17:54 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Use the default POSIX sh instead of relying of var-SHELL being set to a
compatible shell. Such that in cases where SHELL is set to a
incompatible shell (e.g. csh, zsh, fish, etc.) the terminal command does
not just silently fail.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/classes/cml1.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
index 7f6df4011b..98d24cec74 100644
--- a/meta/classes/cml1.bbclass
+++ b/meta/classes/cml1.bbclass
@@ -26,7 +26,7 @@ python do_menuconfig() {
     except OSError:
         mtime = 0
 
-    oe_terminal("${SHELL} -c \"make %s; if [ \\$? -ne 0 ]; then echo 'Command failed.'; printf 'Press any key to continue... '; read r; fi\"" % d.getVar('KCONFIG_CONFIG_COMMAND'),
+    oe_terminal("sh -c \"make %s; if [ \\$? -ne 0 ]; then echo 'Command failed.'; printf 'Press any key to continue... '; read r; fi\"" % d.getVar('KCONFIG_CONFIG_COMMAND'),
                 d.getVar('PN') + ' Configuration', d)
 
     # FIXME this check can be removed when the minimum bitbake version has been bumped
---
2.20.1

