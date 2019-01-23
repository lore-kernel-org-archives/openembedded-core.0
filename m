Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id EC64460402
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 16:17:54 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id f188so2502862wmf.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 08:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nEDrc37phmsrpMpfynNDyalXtsvWZt+0tyXKa7ar058=;
	b=YiBq5Hovltru0uU5aTNg9oejm6c7Zht3PyyC4g3p9ybn5AJhgZEC/IeYhtsskpeS0T
	G59lzs7dMDqJPdYDkTZ2gF8l4mu7bb/ZT8YhhncwHmHe8fwWabix9rqu++2UTCZxanat
	x5HHn3rPz5gyiOthlkimblLNrZ7zfyfRhvY/FL5qUO4wvl6X8jo2DIEq6wTwg0Ys/ERW
	PdHEWMRQY+vyuEP65EJt8O2l9tnTAZz+nwRBbgrQaGMycnHWKr4YTJ38114YeBxKBHRO
	J1lgVrlj1y+u6goV1eqhWFaqSThbOfb614Hu2EWdY0tDV1P0Dv/8lDCSjho7bhkdU9xA
	PSVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nEDrc37phmsrpMpfynNDyalXtsvWZt+0tyXKa7ar058=;
	b=dXv4MOz6OZNSidKGU8hX8dl+YuQTQeJeKVzfYAbHpxlgM2zIz/7BzTQdB1CLwXsttX
	X2ekBjuDChFQ/dDjXbmQGizhhK/7EwdW8JWMt02g2IORp3gkOUeuCiPFxojCfr8eoMOU
	x5hHRn+L1H5WZzo4ZeWVfrmvyGKjBG2C8I7gh99fhR+Nu6T+6XLeXjje3cp0INCtcW3r
	fg0YYZJ3l7pWa8XEVYK6C1zmiftADOYPxwxxINzeZUb2c/G2gndQbJAppLyiPdqQtqie
	B1ZuIED9pdQHDLqEasBK0O5vC5vzScYCOl62XbcgPd3F0FMuc79XdLSiKBp2H8JJvvMS
	p4Wg==
X-Gm-Message-State: AJcUuketbmg3YGu3euXzBx3kMAPvw1j8WBhtkVl5Trb/KMif4ECefbzt
	tKjkiw7+yI6Pj0EjySmRqBWVXQ3N
X-Google-Smtp-Source: ALg8bN5qp32ASP8Nhc7SjDiG6nuxU/GIVMBKHo6G+BwPzYlUD26BeC/qz1bl3k+cwRmwObxgSdb4vg==
X-Received: by 2002:a7b:c34c:: with SMTP id l12mr3287250wmj.147.1548260275431; 
	Wed, 23 Jan 2019 08:17:55 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	j33sm161192189wre.91.2019.01.23.08.17.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Jan 2019 08:17:54 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Jan 2019 17:17:38 +0100
Message-Id: <20190123161744.45763-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190123161744.45763-1-alex.kanavin@gmail.com>
References: <20190123161744.45763-1-alex.kanavin@gmail.com>
Subject: [PATCH 04/10] lib/oe/package_manager: turn postinst_intercept warnings into failures for nativesdk
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
X-List-Received-Date: Wed, 23 Jan 2019 16:17:55 -0000

The few cases where they failed should be now all fixed. The only allowed
exception is when building mingw32 SDKs, as there is currently no support for running
postinst_intercepts through wine.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oe/package_manager.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 1087144d47f..f26f597d03d 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -439,6 +439,11 @@ class PackageManager(object, metaclass=ABCMeta):
                 self._postpone_to_first_boot(script_full)
                 continue
 
+            if populate_sdk == 'host' and self.d.getVar('SDK_OS') == 'mingw32':
+                bb.warn("The postinstall intercept hook '%s' could not be executed due to missing wine support, details in %s/log.do_%s"
+                                % (script, self.d.getVar('T'), self.d.getVar('BB_CURRENTTASK')))
+                continue
+
             bb.note("> Executing %s intercept ..." % script)
 
             try:
@@ -447,7 +452,7 @@ class PackageManager(object, metaclass=ABCMeta):
             except subprocess.CalledProcessError as e:
                 bb.note("Exit code %d. Output:\n%s" % (e.returncode, e.output.decode("utf-8")))
                 if populate_sdk == 'host':
-                    bb.warn("The postinstall intercept hook '%s' failed, details in %s/log.do_%s" % (script, self.d.getVar('T'), self.d.getVar('BB_CURRENTTASK')))
+                    bb.fatal("The postinstall intercept hook '%s' failed, details in %s/log.do_%s" % (script, self.d.getVar('T'), self.d.getVar('BB_CURRENTTASK')))
                 elif populate_sdk == 'target':
                     if "qemuwrapper: qemu usermode is not supported" in e.output.decode("utf-8"):
                         bb.warn("The postinstall intercept hook '%s' could not be executed due to missing qemu usermode support, details in %s/log.do_%s"
-- 
2.17.1


