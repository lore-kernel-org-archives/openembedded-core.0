Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id E50987C603
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 10:11:42 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id y19so14555021wrd.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2019 03:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=V4uv2jjIExOJ0uFNb42cxmh8UlcYcxq3+XSSCFIxMEo=;
	b=DrUlU3zzwbYqWk0LNFE/NwYkZyFfgx+tYQA5oFnyZlKrWgWDAMzOpik0MEiJzH+QKb
	dIQgoDe1xfYMSiy7BjEzDRYuo6hJxg6b0UzRh/OCIOuXUXRldiedX5XYgTNLSGQg4K+J
	p2pZRJSAtYmBKL55nYPZFEYbBrSa2yBMlZUKVv1EfTWND92PMaHb6w3NJj+F0oUixOKB
	SDlAX62JyWorddM6iMA+FRClfkM+dxdLFplLhvZV+5GtIFh3BSp3kOUzuoUGx9CTWQe9
	I673SG0KERHwE0Oz1UwUuq+qyO/RdwOz6KpR1/eyntKPx6HI4jRZ2Mm/BkTAJfrCpm/y
	76dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=V4uv2jjIExOJ0uFNb42cxmh8UlcYcxq3+XSSCFIxMEo=;
	b=thamiOy++p+rQTM3FsS52nBk1P1ouG4PAvLFqXhwFaVS4xYkHaFFyJfL3OFtgsFWar
	d1XlvrNVDvU7tcvawaquBB4pgvWsMokZxnTOexGa7ZPF+ilPQojaNBpJByUXzVl7wCbx
	xDZTNpz/AwkjJZEqdRTwmG6rS1obEmlJLyLXymoIcr+vLWm3J2hKCTS3wazG9tCOqlsG
	vAzCuDSGZ6NOAc2wEZQzfHe/AK5UOej0g6CWRBgw9v1bLjEEIZVErw3WOHej3rLOogkc
	7n6YTLqhmQ+rsqKf3k6QfiQ7kqUAt3eD3MqbsAhf9pCRxYp4Nkd0DMw1EGhSo7MhDqZp
	MDAA==
X-Gm-Message-State: APjAAAX/BrvC2olL22j/9pm7zmN/GwJWO30D8Qc16CTsVmhbBOLrdQx4
	fPrxDl/kyJNGnggvKrDPdyHkHxQQyRA=
X-Google-Smtp-Source: APXvYqyU8RVf32WURTbKeJ9TAzsBrlaJAFoST7TWwlp75huvxNsuQyfJp1IO+79P0JjbKtUotjZxlg==
X-Received: by 2002:adf:f1c3:: with SMTP id z3mr21827227wro.147.1570443103254; 
	Mon, 07 Oct 2019 03:11:43 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	q22sm13823289wmj.31.2019.10.07.03.11.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 07 Oct 2019 03:11:41 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Oct 2019 11:11:36 +0100
Message-Id: <20191007101138.3722-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/3] meson: fix RDEPENDS
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
X-List-Received-Date: Mon, 07 Oct 2019 10:11:43 -0000
Content-Transfer-Encoding: 8bit

Meson needs python3-pkg-resources to work to add to RDEPENDS.

Remove python3-core as this is automatically pulled in by python3-modules.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/meson/meson.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index 2958a2a8de4..d365bcd8a35 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -32,6 +32,6 @@ UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
 
 inherit setuptools3
 
-RDEPENDS_${PN} = "ninja python3-core python3-modules"
+RDEPENDS_${PN} = "ninja python3-modules python3-pkg-resources"
 
 FILES_${PN} += "${datadir}/polkit-1"
-- 
2.20.1


