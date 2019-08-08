Return-Path: <tim.blechmann@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 74BB27ED56
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 12:34:28 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id g17so94749868wrr.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Aug 2019 05:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0ktJg3ZR/YQoVwKXRQ2PEjpFM9HjXLIpnR8Ua/uha4E=;
	b=sfQ2pf3HydpXOqIyC/LzeE/GWN5+fZsP/NDs/HX/b9/8IURERhnM8ahhGeX0kbeekr
	SOGORtk5HZodrsXrJPVwtMxoU6uYe+FerK3u6nNwz3O03U7WjoyqRoVwcsBE1WtWGcwW
	+OoNe7jPpIsZeauJydCu+NioJmcQqs9Ry5HmuRTn0mWH9qTS2MyObHhIqKeLMxBpjGyP
	ujWsD42IhfbcGnUdSay4Xj1Bxa7f0m+9xKm5aAnogh08tzzuwJkiK0rV2bOMRduDTV2h
	9sKR8JaG8vsqzfac1bcup0FJoLLygr/OxU1ClKFyhIRPIckwCFWC3qdddUJKnQKfmC47
	uqqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0ktJg3ZR/YQoVwKXRQ2PEjpFM9HjXLIpnR8Ua/uha4E=;
	b=ST3Q+r2WSMLY94G6iDW2blRVwt0Zr/EDnHOm4rNY7qhkRFILkBX1k/2H9Dt1/BDnuy
	AK3G3x+CNCUaZ6qZx7ChrXKLVgICm0xJKgyklGvC/ZwWh/N28OVFkUbCEMGrFedq4Agb
	4Z1KB19+nyWjD6BNdzuTLmbZliz2aNn0TNqDfXqK7b+bHtrd+YJL0OnnIUb5YksKAkoK
	R4ZM8F20uchEOtA+Wf0xDTkx8r/nr4FwczMPZpBWjabrVGYWKfwhKr3lCMI89Kfs0GEg
	SNx5vqQpLQJV4ExoaxH3583H06UIuZ+qRe+aj4jUE1D5ioTb0zt994lyppxJF9e9UIlO
	blLg==
X-Gm-Message-State: APjAAAVqGrg4gj14qrjtdrg6ofkk8jII3JC7K6GHEdHOQI4AWN+4k4JQ
	SHd3rsT6s1yvVJiH0OOqsWAYMLPM
X-Google-Smtp-Source: APXvYqwEwaleVdCPcEDb0aJVEkDKSo1o4rjfZ9qKm8M4XGpv+5BwVOEoLMYOOPkqtVkLwsw01w8bXw==
X-Received: by 2002:a5d:4e06:: with SMTP id p6mr17412486wrt.336.1565267668829; 
	Thu, 08 Aug 2019 05:34:28 -0700 (PDT)
Received: from localhost.localdomain ([115.132.198.120])
	by smtp.gmail.com with ESMTPSA id
	o26sm192939088wro.53.2019.08.08.05.34.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 08 Aug 2019 05:34:28 -0700 (PDT)
From: Tim Blechmann <tim.blechmann@gmail.com>
X-Google-Original-From: Tim Blechmann <tim@klingt.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Aug 2019 20:34:21 +0800
Message-Id: <20190808123421.12130-1-tim@klingt.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Cc: Tim Blechmann <tim@klingt.org>
Subject: [PATCH] package_deb: allow dpkg-deb to be customized via DPKG_BUILDCMD
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
X-List-Received-Date: Thu, 08 Aug 2019 12:34:28 -0000
Content-Transfer-Encoding: 8bit

the command line to invoke `dpkg-deb` is hardcoded. there are certain use
cases where we want to tweak how debian packages are compiled: e.g. the
default uses xz compression, which is rather CPU intensive. for local
builds one might want to pass `-Zgzip -z1` to favor speed over compression
ratio.

we therefore introduce a `DPKG_BUILDCMD` variable which allows downstream
code to customize how dpkg-deb is executed

Signed-off-by: Tim Blechmann <tim@klingt.org>
---
 meta/classes/package_deb.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 6f81591653..790b26aef2 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -6,6 +6,8 @@ inherit package
 
 IMAGE_PKGTYPE ?= "deb"
 
+DPKG_BUILDCMD ??= "dpkg-deb"
+
 DPKG_ARCH ?= "${@debian_arch_map(d.getVar('TARGET_ARCH'), d.getVar('TUNE_FEATURES'))}"
 DPKG_ARCH[vardepvalue] = "${DPKG_ARCH}"
 
@@ -269,7 +271,8 @@ def deb_write_pkg(pkg, d):
             conffiles.close()
 
         os.chdir(basedir)
-        subprocess.check_output("PATH=\"%s\" dpkg-deb -b %s %s" % (localdata.getVar("PATH"), root, pkgoutdir),
+        subprocess.check_output("PATH=\"%s\" %s -b %s %s" % (localdata.getVar("PATH"), localdata.getVar("DPKG_BUILDCMD"),
+                                                             root, pkgoutdir),
                                 stderr=subprocess.STDOUT,
                                 shell=True)
 
-- 
2.18.0


