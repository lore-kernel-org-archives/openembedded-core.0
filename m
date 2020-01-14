Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id B65897F88B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 21:06:02 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id t14so15394969wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 13:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5bwkMK1ZuVfpB9+rZb3tq7RVCjD+ScseyqOp0ZUTbck=;
	b=dIkOnKmFn+lKw3Jp3pOvLJroD1s6druG+FzVH2nFvhWvYqgrQR2J+2LYC3lfP3Ldh+
	C87R/mJNW7T/PLuya4PqyoENWB3Flj7ygMmYEGz6KcXBBrtwx/1FDMP48g4eXJ9GUOkc
	04yAELrDpNAoFXnvCREMy4+R1gSmtkjVUI6J0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5bwkMK1ZuVfpB9+rZb3tq7RVCjD+ScseyqOp0ZUTbck=;
	b=aEo/I2mjRzgHdkZOR3d2cxNHbTLYJQ8PWhgOaF48YrrlUJpCk5nLHb6F9vwCfY2JFC
	F8bGoiNlZXl1iMsle/F/fsljdlvJhlN2A7xGI2yEyJcH6VP8rQxsDRtTGSj6Odks7O1W
	xjqFjGgQchQLQsF9hHgjUFh95SQu1M3jxVeMgc60Fr4tjgko4loOp/L2zUvUUZ7vwcUH
	CBWfrW6sK+cDZxF5h2uio6ezXM5alaGDBWPUNHAcgGZsTXeNm0g/xy2RptS2NYj5CMSC
	nEQZs9E0cfNUHM7CziWiCtoiJL+IOnIjUpG/dkn9jPpQ/TCQZ5+xllcc+4FtNz933EE8
	i7Vw==
X-Gm-Message-State: APjAAAUfm/V+u/EXYCpFoNFKBWlh81GUxhzi9ECjSorc33gDjIqPvgJT
	PwDqBaIeAxf+nJPEPSLwWYYtasRmw5o=
X-Google-Smtp-Source: APXvYqwZjky9YLrL1Hmn5ryMBpos8ylfX8Ju6wZSv4jo2SMVCVQfQP2GEIAhSCqsCERZ2Bm8DVW8jg==
X-Received: by 2002:a7b:c956:: with SMTP id i22mr29361211wml.67.1579035963182; 
	Tue, 14 Jan 2020 13:06:03 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l3sm19284182wrt.29.2020.01.14.13.06.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 14 Jan 2020 13:06:02 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jan 2020 21:06:01 +0000
Message-Id: <20200114210601.26465-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] sstatesig: Improve debug output if getpwuid() fails
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
X-List-Received-Date: Tue, 14 Jan 2020 21:06:03 -0000
Content-Transfer-Encoding: 8bit

If getpwduid fails, we don't see which file it failed on which is key information
to aid debugging. Print this information when exceptions are raised.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/sstatesig.py | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 0e17ad6f5b7..4325b66a9ee 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -541,8 +541,12 @@ def OEOuthashBasic(path, sigfile, task, d):
                     add_perm(stat.S_IXOTH, 'x')
 
                 if include_owners:
-                    update_hash(" %10s" % pwd.getpwuid(s.st_uid).pw_name)
-                    update_hash(" %10s" % grp.getgrgid(s.st_gid).gr_name)
+                    try:
+                        update_hash(" %10s" % pwd.getpwuid(s.st_uid).pw_name)
+                        update_hash(" %10s" % grp.getgrgid(s.st_gid).gr_name)
+                    except KeyError:
+                        bb.warn("KeyError in %s" % path)
+                        raise
 
                 update_hash(" ")
                 if stat.S_ISBLK(s.st_mode) or stat.S_ISCHR(s.st_mode):
-- 
2.20.1


