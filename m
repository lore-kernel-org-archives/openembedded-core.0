Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id 195FF71BF0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jul 2018 15:36:55 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id q10-v6so29459131wrd.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jul 2018 08:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=v+w5q8ejpK/IIFFMEjfpc/tQbPjCgHfhXtYHci0XNgk=;
	b=L8yzjYgzFpbEUcpBk9vZ0PZ1sbocyXfi6s8AefZiX4yMpRVH7B0x4EbaFdmKexlG5u
	964VDQNsr8yveJqKxcdcKWo3/LcwHsU/wncN47Pozwu5xCo+zDnLMzxDtxGt0NaoHYjh
	4pJi0YDeLXuMRsdz3kKbU4sMUZWlHalDnWlG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=v+w5q8ejpK/IIFFMEjfpc/tQbPjCgHfhXtYHci0XNgk=;
	b=ioxydbMiP2iEpoQdoEPX+MJLha7XqrNq2lSQtTkSUf4dxbeb8XxtqaihBXRerSJ+uk
	wmltfAaHQD3S9I0C+tQOC5T//P9GOldicYO5PA26KI7wC6ArGBLE4XO2g7ncGAvthXDb
	qjoVD0+LHeVPm+B/f9bbJ/CkkFXsBw2ZFpqqYvf1gVOdErAtmLYyWE5bQdyulR8mnED+
	7xXyR5YnJaYE5QILIjBUe0yiFle1cLARI7oWywlYdgQQpURxiY1YRyIJ2Xuj3HnELFTh
	ra0fSTwi6435m4KUOBDFlHZKQOgOKkdDHuKKRSniTen2waviOOOlMP0vTWVv8t0GsX5I
	tDxA==
X-Gm-Message-State: AOUpUlF/s/b5Fv5IOyTzsBoaqSJwH6xjXAGdgA8ufA4DNRbZiA4x+HFR
	+KYkdp6VvgR3lyRwBlF3bJVaCb8bxPg=
X-Google-Smtp-Source: AAOMgpcgoZNR2KQ3TrefWn3QNlGqYKfQbHJ6qbHt5bBsDsC+QY48hx5b27zUordxAOonE9PfFv/ixg==
X-Received: by 2002:adf:dc4c:: with SMTP id
	m12-v6mr10462127wrj.84.1531669015777; 
	Sun, 15 Jul 2018 08:36:55 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z9-v6sm54571558wre.49.2018.07.15.08.36.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Jul 2018 08:36:54 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 15 Jul 2018 16:36:37 +0100
Message-Id: <20180715153641.21029-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180715153641.21029-1-richard.purdie@linuxfoundation.org>
References: <20180715153641.21029-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 08/12] oeqa/selftest/wic: Ensure initramfs exists for test_iso_image
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
X-List-Received-Date: Sun, 15 Jul 2018 15:36:55 -0000

AssertionError: Command 'wic create mkhybridiso --image-name core-image-minimal -o /var/tmp/wic.oe-selftest/' returned non-zero exit status 1:

ERROR: _exec_cmd: gzip -f -9 -c /var/tmp/wic.oe-selftest/tmp.wic.drhn6edm/initrd.cpio > /var/tmp/wic.oe-selftest/tmp.wic.drhn6edm/initrd.cpio.gz returned '1' instead of 0
output: gzip: /var/tmp/wic.oe-selftest/tmp.wic.drhn6edm/initrd.cpio: No such file or directory

This is because in a clean build directory, the initramfs may not be rebuilt.
Add a call to ensure it is built to avoid the error.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/wic.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 5302e47da1a..2771af63674 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -191,7 +191,7 @@ class Wic(OESelftestTestCase):
                  'MACHINE_FEATURES_append = " efi"\n'\
                  'DEPENDS_pn-core-image-minimal += "syslinux"\n'
         self.append_config(config)
-        bitbake('core-image-minimal')
+        bitbake('core-image-minimal core-image-minimal-initramfs')
         self.remove_config(config)
         cmd = "wic create mkhybridiso --image-name core-image-minimal -o %s" % self.resultdir
         self.assertEqual(0, runCmd(cmd).status)
-- 
2.17.1


