Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id DECE4608B7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 15:43:52 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id u125so18272845wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 08:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=9jTsxXVFixQvAFzN+RB5ocdIo/bvuBHy3Vbf4ytUUI4=;
	b=MclH8i+2fjXkUKY8hJkUzHjYux3IqYYFK6j705hdlTCqaSr2MlNAwabac2UpCzcdkY
	saThHf/7nG5Tz3/jFddzXQqXj03Tu0sOgl3qk5DQzqeMxC6p2tOZoOFU6prx6oqM7/LH
	dl8QFHWjOpe6Z/2/sHYKjVeVJl2cvokSFELdhtnRuvCQGoKIqpC7nZ4EW5uVDXb4huvG
	704Dz5picFqn12zCt8fvoDL2CU/IU99xec5t1zGzIJ49dIseLcHZz88DWu68NxW+9oKF
	q7R0vRoUD65w/eVzkgF76y5TXKSSc5WliZEG1DAdgNkmFpubnBhUzxMH8qhi6/jQ6d0H
	+gMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=9jTsxXVFixQvAFzN+RB5ocdIo/bvuBHy3Vbf4ytUUI4=;
	b=Jl1+v4qaUPUkMye3olKZvmElU0t6k21oEga+S7vQthk8vMpHkHQKoJjjY5b4B9f5ie
	2Ksmf1bBQAF9LHM09T3X3sfKEJTRHpdqw6ZzmFaI6yQ1E5S7wMPW+H9UDITfA8ygvGMM
	+mXBCAqPewqHr5UuCcNxc+4fAK7dVrL9A0NFW165tMPbrDLqmW2pa2L7wCCCNw+rsEFT
	uOH9YSsxmaDe/Vh+AtFsvlXr8l6gbtYhHdxoj4pGytE+hobdIhY3HbshlXcx58zp9pMZ
	T+b961WWoSn+esYjjIHGrskpbgU6t8wkqgcdIVs9bmvfOt3Y0FK3/6dymqxZBKrw/0FX
	QQNA==
X-Gm-Message-State: AD7BkJJ/xb6PU73dGru8UdBp3lfMoDbVp5uUYxyvYFUddJ1TLLwqK3Qb2YiW5XUYNo0ZJC1R
X-Received: by 10.28.46.132 with SMTP id u126mr35418600wmu.67.1458834233430;
	Thu, 24 Mar 2016 08:43:53 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id v2sm8300568wmd.24.2016.03.24.08.43.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 Mar 2016 08:43:52 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Mar 2016 15:43:46 +0000
Message-Id: <1458834228-23233-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH 1/3] uninative: ensure patchelf errors are visible
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
X-List-Received-Date: Thu, 24 Mar 2016 15:43:55 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/uninative.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index d3208e7..b045a28 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -130,7 +130,8 @@ python uninative_changeinterp () {
 
             try:
                 subprocess.check_output(("patchelf-uninative", "--set-interpreter",
-                                         d.getVar("UNINATIVE_LOADER", True), f))
+                                         d.getVar("UNINATIVE_LOADER", True), f),
+                                        stderr=subprocess.STDOUT)
             except subprocess.CalledProcessError as e:
                 bb.fatal("'%s' failed with exit code %d and the following output:\n%s" %
                          (e.cmd, e.returncode, e.output))
-- 
2.7.0


