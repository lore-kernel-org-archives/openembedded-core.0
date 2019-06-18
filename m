Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id D6C887E6FE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 10:43:45 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id n4so13363995wrw.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 03:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=gkt2oo6GdC/kfE4+y2ORkR4iRy1FXI5chR6TiKT+oSg=;
	b=rP9JYwAtNJhYU4s23/9tipkA92asTY/2jazn6zomo5pxjbur14hBqKlr7OQQMp1TLt
	EwqTHbI46qSNnjQacirB1t9UvrFh4Ce+g2SFAkJs6M1B1K3TaBABP41vaTYY8tzMMq3L
	EzDUUwbqB3ZSyZYAII6E8AtA9Vj4lPUNhKYE5qQz6eR+uZb1KJNnHwxhWKnVy69w1IOc
	lxAbWUSuO30NdMGHH2KT9BE64EucoqX3247zSqWdJl5LW0X8irw0XL1ckXHsMxF3YSv1
	82f5JopNzW/oC0Eu2WZKnXrrE+1VNdA8dFgIATX17fiiBfFT8T7TGOPzhZww3YbLiuLy
	Yk3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=gkt2oo6GdC/kfE4+y2ORkR4iRy1FXI5chR6TiKT+oSg=;
	b=ov5c3fK/ox/fez9+o/mYM64yUjFvl88jrPbSWG3z9hc3VKQ236gf4KXD1Uw7u8sWgx
	A2o0uJlx+K4kEdIgAUtJfdn5Uf/DwWydDWw34Gno7P8ksKJ3eUPf1ud7TuB1FzkLn18k
	7r10rd9T/G/vFJCaTGPI0zfdyX946n8kJO2E5EgXcN3pqLqKT7CUStDFu14zlZdwe3mC
	Uk56fSFlig2JD7leIzDmG0e8LgHkCKA/rjpKFLitXgMCaASu5W7l9+g73RReEPKDGxSc
	MVbzaMecTnqdIZlDZG99slE/w3Wf8Hf+zb0SmalC7J1TEmSY50NJx3ojLJpFHwIgFw/v
	Sq3g==
X-Gm-Message-State: APjAAAXUVIHWkbrlYQri5KTydp9CkzghtYdWK0/aoEWd/+NWgbiJRppm
	0DrNJU+SSYi7MatmsMNdiDmjXkbUt3c=
X-Google-Smtp-Source: APXvYqwn28bJNiWjfaJTaK2kckjV/V7PcabfpOceL/ippdbZ3YGG0vH8sBVxmb1MlS3/G/Kav2W2XQ==
X-Received: by 2002:adf:9dcc:: with SMTP id q12mr11883080wre.6.1560854626381; 
	Tue, 18 Jun 2019 03:43:46 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	r131sm1847824wmf.4.2019.06.18.03.43.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Jun 2019 03:43:45 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Jun 2019 11:43:43 +0100
Message-Id: <20190618104343.24216-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] insane: improve buildpath warning messages
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
X-List-Received-Date: Tue, 18 Jun 2019 10:43:46 -0000

Instead of reporting large chunks of the work directory and not the package
name:

"File /work/corei7-64-poky-linux/libidn2/2.2.0-r0/packages-split/libidn2-dev/usr/lib/pkgconfig/libidn2.pc in package contained reference to tmpdir"

We can clean up the paths and be more useful:

"File /usr/lib/pkgconfig/libidn2.pc in package libidn2-dev contains reference to TMPDIR"

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/insane.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 6e32db00314..0695a044387 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -401,7 +401,8 @@ def package_qa_check_buildpaths(path, name, d, elf, messages):
     with open(path, 'rb') as f:
         file_content = f.read()
         if tmpdir in file_content:
-            package_qa_add_message(messages, "buildpaths", "File %s in package contained reference to tmpdir" % package_qa_clean_path(path,d))
+            trimmed = path.replace(os.path.join (d.getVar("PKGDEST"), name), "")
+            package_qa_add_message(messages, "buildpaths", "File %s in package %s contains reference to TMPDIR" % (trimmed, name))
 
 
 QAPATHTEST[xorg-driver-abi] = "package_qa_check_xorg_driver_abi"
-- 
2.11.0


