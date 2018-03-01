Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id ACCA278882
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 18:26:46 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id w77so7592754wrc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2018 10:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=JiI0yLyGnULS2BwF0V0yVVwzDZYOoTs0o6Z2fWwTYtM=;
	b=tSAMuQ0goc8NbjQJjsPOqZkl0CijBMiYaC0223+vofbeizrxrsptBzrxkHzfggDzB0
	E7m1MTC+l7n79DGO5B1o9ck1zbo1ilL4GReWFXi/vYIDrezDLk1dNY+0SGKxN5jaCiQG
	55e2Zvo/Do+UDTt1q0oHURe1BbUcAwd9dReJHe6TbPGNfifaziYr6xMO7Y+TNkeKKv8b
	SRbjURcVj2DaWXC+P9ikJ5q4Imscmw7sYFnXvASRaX6KGchuJzmCrsLBj9Il8KcOr6at
	yOd/r6a5dW37q27zvfcs6NmrG1OTkPsZjW4BQk+esr+3LgRyfaE6/GmvBxEyp84rpg8p
	LWTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=JiI0yLyGnULS2BwF0V0yVVwzDZYOoTs0o6Z2fWwTYtM=;
	b=lgzHAIhHYqZBQ51IkSvXXTQrQs/eEb/xipY0rEzayKrD8hbQmQARSt//Np9CThMjzt
	z1AMzvUmg08C2e3FpmCBhLx3ZipyU/ORBX+I9cFt/rqquosQMr6BrGWz8B7WU53KENRx
	YbOJZhPpbxwM0f7TTwBCa+rD9IgBpUx9QG3mUIyp4rbv6djBqw4SFN7TgTyiVZXrx6AI
	2aoaHuWR/3nUxExMHUoplVppi7vhbGCkg5W8fCjomkmEBajIg41D4WDx0QLozBGTxdMx
	vX3yJQrLeKqu6Yyhmk/1n0Vc8luWUUFqWRs46FFaGI5+43HwloXrf2z3J/j/6hQYZuGH
	C7lg==
X-Gm-Message-State: APf1xPCU0dRGjnPJ5B+xzc/njvIWvlf2f4pA/4GDErnlVhoJ/d78aCNJ
	dSFBn1RO9e0UZvDPaEqxFrG8uQox
X-Google-Smtp-Source: AG47ELtAP0g1s7u1J/0VXApu3kEUxwRTk9z7SRm/gNj/RTYgB+lyzLfYBpTN8sEw49diEP+eUwxBRg==
X-Received: by 10.223.163.93 with SMTP id d29mr2808339wrb.187.1519928807080;
	Thu, 01 Mar 2018 10:26:47 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	h188sm4955285wmf.23.2018.03.01.10.26.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Mar 2018 10:26:46 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Mar 2018 18:26:29 +0000
Message-Id: <20180301182634.20502-6-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180301182634.20502-1-ross.burton@intel.com>
References: <20180301182634.20502-1-ross.burton@intel.com>
Subject: [PATCH 06/11] package_manager: improve install_complementary
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
X-List-Received-Date: Thu, 01 Mar 2018 18:26:47 -0000

- No need to use bb.utils.which() as subprocess will search $PATH
- Clarity flow by moving the install inside the try/except

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/package_manager.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index f7e013437c9..e37dd4e8a2f 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -402,7 +402,7 @@ class PackageManager(object, metaclass=ABCMeta):
             installed_pkgs.write(output)
             installed_pkgs.flush()
 
-            cmd = [bb.utils.which(os.getenv('PATH'), "oe-pkgdata-util"),
+            cmd = ["oe-pkgdata-util",
                    "-p", self.d.getVar('PKGDATA_DIR'), "glob", installed_pkgs.name,
                    globs]
             exclude = self.d.getVar('PACKAGE_EXCLUDE_COMPLEMENTARY')
@@ -412,11 +412,11 @@ class PackageManager(object, metaclass=ABCMeta):
                 bb.note("Installing complementary packages ...")
                 bb.note('Running %s' % cmd)
                 complementary_pkgs = subprocess.check_output(cmd, stderr=subprocess.STDOUT).decode("utf-8")
+                self.install(complementary_pkgs.split(), attempt_only=True)
             except subprocess.CalledProcessError as e:
                 bb.fatal("Could not compute complementary packages list. Command "
                          "'%s' returned %d:\n%s" %
                          (' '.join(cmd), e.returncode, e.output.decode("utf-8")))
-            self.install(complementary_pkgs.split(), attempt_only=True)
 
     def deploy_dir_lock(self):
         if self.deploy_dir is None:
-- 
2.11.0


