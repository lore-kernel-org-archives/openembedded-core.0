Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 167837714F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 13:27:18 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id p63so22732532wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Feb 2016 05:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=Gvjg6XG8iXzmKck1+S1bOLClEmDj5W1ke78Uf9/1t88=;
	b=dX/ZVc7bntTVauALWP7q5OZgShYQvgfcu4HFa6s+I79pSeNOUz4OhbDLS+T/4QWjBx
	FgeLaZGPPA60r4K/HamXCg1gNIxpXKHRmrs4XJ3jx7U271E7vyCVvFuTug1m86bKdmF2
	EabXncQZp/3XAT6T6J0EuaCDymBpWsluErblZqixfgeN7cDdh3s+6bicYMDUpudDAyOH
	UJoNdxquSs/gUEzUxR5Na5T3cUmzier0QVBLtcTwhjR3zLXJ/MpfuEvNvNtXNnWk0zhM
	HTWxvkh9kU1A7Uu0X/Cz+nCrM5kHpcR0ukcilqONcy4YOF02rYVe9VbiT8GjkvWnpkh3
	I6GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Gvjg6XG8iXzmKck1+S1bOLClEmDj5W1ke78Uf9/1t88=;
	b=hq/Ag+W4NqOnr+QGwFr4Gb9/knPhNOPOHwn/vXGL5yX87slxEky1MkmQfIHhG/tjJJ
	a0ARrFMYkfO3oiOSK+bjkVzuT0hVTGRMmH/hbZRYI3Xbx4fgFP/9cHg0XpRbWpy6bCAa
	U7UGgZdnd/uTB0a4GGvCNT4uWAEpFkqxxIH03FSRUqMgVdiQ6rsFP40YNZ2ujXIOoScT
	XQ3YtnwfwvP/b4GSciEqMX6Zc99hs9Y0VWuUQPPcgUU7wPjB4xZMsT2ly0QAyH1+UCM4
	tyrFKb+PhjbqE3mL3/mgoO//UOJsCh9q2vKakXoTEzGcLyOtLYBylxIolhx2813YbZc3
	SkhQ==
X-Gm-Message-State: AG10YOQSu/tDfsNXdF6QawTKs9cav48tLlR2WddpFPxeoog7qn4EoQVh34/piN+G0Xbvx5ZS
X-Received: by 10.28.5.213 with SMTP id 204mr17334854wmf.20.1454419639154;
	Tue, 02 Feb 2016 05:27:19 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	l67sm16433764wmf.11.2016.02.02.05.27.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 02 Feb 2016 05:27:18 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Feb 2016 13:27:11 +0000
Message-Id: <1454419635-10822-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH 1/5] remove-libtool: add new class
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
X-List-Received-Date: Tue, 02 Feb 2016 13:27:19 -0000

This class adds a postfunc to do_install to remove all .la files installed by
libtool, so that they are absent from both the sysroots and target packages.

If a recipe needs these files to be installed then it can be overridden by
setting REMOVE_LIBTOOL_LA.

Note that this class isn't enabled by default.

[ YOCTO #2380 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/remove-libtool.bbclass | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta/classes/remove-libtool.bbclass

diff --git a/meta/classes/remove-libtool.bbclass b/meta/classes/remove-libtool.bbclass
new file mode 100644
index 0000000..3fd0cd5
--- /dev/null
+++ b/meta/classes/remove-libtool.bbclass
@@ -0,0 +1,11 @@
+# This class removes libtool .la files after do_install
+
+REMOVE_LIBTOOL_LA ?= "1"
+
+remove_libtool_la() {
+	if [ "${REMOVE_LIBTOOL_LA}" != "0" ]; then
+		find "${D}" -ignore_readdir_race -name "*.la" -delete
+	fi
+}
+
+do_install[postfuncs] += "remove_libtool_la"
-- 
2.6.4


