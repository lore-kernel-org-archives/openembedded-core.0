Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id 300E27FDBA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 20:30:33 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id q17so4533811wrx.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 13:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=NGO09iFn3SKjd7tOmDkChDZ292zIqUkNOiKj3RTquo0=;
	b=qK3KIdVVg1F2xXU2Yt+RLPIquTPkQNint/+SEjpaS5O39DJ2HkjHTCTTgi/Odrc4vf
	YJe6vh/kef9nKbZDUXLPXm5d7lG006lmS/1yT2f2yrtAdruSGgwxxRiSnlfre2zEBMvY
	6IA+FoKiJsGlJFCZ81B4rHutjU5Q7GoAGfjp9pxq3YXZ9VrJZ6isAz6f7CQRFlWHTZTQ
	7f08U3ZcTeCMLhxKbjtuHWdcb4kpKD4DCnM6qT9sPFDe/92Rxwj2xIcbbhZkfMgwmWZj
	TskFvWEf+b8fAzUPeWe0yi+I6F3KpeokDGci+OpUoJFMQV3lSQkEVfL+nsjf2A8CagDo
	hTaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=NGO09iFn3SKjd7tOmDkChDZ292zIqUkNOiKj3RTquo0=;
	b=mZxO00p6YknrmMCoH8gZPKLx8mYpot1FbSUB0UB3rka65dnNx1dTv6E2Dr9DYCNj4D
	apOoEf3OQ7Ais0W9MEeCUOo9XTY7tj54Cu6rgorpSv6o4up4ycqUiV8npJIPE/KhF7qw
	tmXPkRjI/WQAsL+fRgdKPgLGnwUvPZ4sVvUqovThTeNGfL0OUKtLv1/2AowSNYufy7eH
	Ccmj58KZ1qfB7DpvTyErdSuwzK2oFieyYGy4nEBP8mRDhl9XCfMPPMGfnLxAsuVdJj1Z
	fkErViZiPvMRafUCXFqx8Dlgh5cPN47y43gejNcVd8Hn5fYd53U9f6MoJuv5OFZdDolr
	DfSA==
X-Gm-Message-State: APjAAAVPLTGdYuf7mkYwoR7frnSA8zfF26NgyczZD9dFV+D0pNfa1Cyo
	xcrUuFxk6nb0c+y6wfkravwwAyutWKA=
X-Google-Smtp-Source: APXvYqxC9kINXdz7yDXiwdpkm3fC3wYxCquHYW1H8of7n4AuV3+i2EBuIMv30e0GNA8FgjZkvzxMxg==
X-Received: by 2002:adf:e3c4:: with SMTP id k4mr325316wrm.157.1568752233722;
	Tue, 17 Sep 2019 13:30:33 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	s12sm5778528wra.82.2019.09.17.13.30.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Sep 2019 13:30:32 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Sep 2019 21:30:30 +0100
Message-Id: <20190917203030.29832-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] systemd-systemctl-native: don't care about line endings
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
X-List-Received-Date: Tue, 17 Sep 2019 20:30:34 -0000
Content-Transfer-Encoding: 8bit

It's possible for a service file to accidentally contain mixed line endings, but
the string cleanup code was assuming Unix endings.

[ YOCTO #13535 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd-systemctl/systemctl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
index 8837f54e166..ebac863739a 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -57,7 +57,7 @@ class SystemdFile():
                 if skip_re.match(line):
                     continue
 
-                line = line.rstrip("\n")
+                line = line.strip()
                 m = section_re.match(line)
                 if m:
                     if m.group('section') not in self.sections:
-- 
2.20.1


