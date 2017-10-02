Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 40500771A3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Oct 2017 14:52:43 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id y57so2625297qta.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Oct 2017 07:52:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=EZ7ybwNbcCKUKo5lKJgcuxYteiS2JxnnGm+DGnnpbN8=;
	b=Bs0Fjrj8ggx0cqSmOoj4SKTWzNlDLirE5UtmJERWUAMVGk81kbeZsZZPGcV/3tt2dq
	pitPu/6XTjDpAPaBhf81bUydznb9yuwkB+grIgoclMq2O1u9EdtQ07GQfMvYdhPAcJsR
	cplZ1LHM01ryFD/wD/dM+kEPUIPd9qaZ5FDidjO9mnBZvNNcwTv44pbHTtIQarNtF1uN
	2iq6Pw+vhYNj/U7mUPmW9HmMFfxt84xLPaLsYUZq8lBoanCNimId0wptQeeflgNBtQWl
	QJ9yg9XL9BNNka1W3mlprbiH7TxnB3aBHf3BCab4YrIKzJ6YYR4Cexx8nlo/YyVZaV56
	xIPw==
X-Gm-Message-State: AMCzsaXJ76QeLe3MToUL09ET4Kdn3K8wW7wvH6E7QQzAhkpf3rJy39ul
	G3kgj8YeUEl4Kfy42vguGNeqbg==
X-Google-Smtp-Source: AOwi7QDhjnMYX1Pp3UzWGzs7du4DiJw9ZfyR1w5FwdnO8HNxHexWj31wajoLrQclv2s9xNR42nn1mw==
X-Received: by 10.200.22.8 with SMTP id p8mr19769722qtj.54.1506955964807;
	Mon, 02 Oct 2017 07:52:44 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id w20sm439277qkb.95.2017.10.02.07.52.41
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 02 Oct 2017 07:52:44 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 02 Oct 2017 11:52:35 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon,  2 Oct 2017 11:52:34 -0300
Message-Id: <20171002145234.6306-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.2
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v3] lib/oe/package_manager.py (rpm): Allow use of non-signed packages
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
X-List-Received-Date: Mon, 02 Oct 2017 14:52:44 -0000

When we wish to use the package feed for local development, it does
not uses GPG signed feeds by default but dnf uses package signature
check. We need to configure the GPG signature check out so it works
out of box.

With this patch, installing non-signed packages works:

$: dnf install <package>

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v3:
- Check if package signing is disabled prior disabling it

Changes in v2:
- Improve commit log

 meta/lib/oe/package_manager.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 658c964277..4fbc293992 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -551,6 +551,8 @@ class RpmPM(PackageManager):
         if self.d.getVar('PACKAGE_FEED_SIGN') == '1':
             gpg_opts = 'repo_gpgcheck=1\n'
             gpg_opts += 'gpgkey=file://%s/pki/packagefeed-gpg/PACKAGEFEED-GPG-KEY-%s-%s\n' % (self.d.getVar('sysconfdir'), self.d.getVar('DISTRO'), self.d.getVar('DISTRO_CODENAME'))
+        elif: self.d.getVar('RPM_SIGN_PACKAGES') == '0':
+            gpg_opts = 'gpgcheck=0\n'
         else:
             gpg_opts = ''
 
-- 
2.14.2


