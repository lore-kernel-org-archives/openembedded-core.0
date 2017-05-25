Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 99659780FD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 11:16:59 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id 123so32619064wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 04:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yXw+m6MehVrIAvbt5g3AXn6iE3lPfoGzVKWp8NRRBLU=;
	b=f7cpB9t+hr8En5DL7Lj7qcAHF1hL6FjJT2/eTh/wmAFle+QZFSKBez+S0bF6Nsq4U7
	7kZ78Z/lujglczq4EW3kuOAwSDv3iieP2S0VFQ20P+dZS1DYx93tElfrTKPQ+t+zwgix
	16TJ7VHUuxDmQQpjDgJ7Bl61Ed99X9by187hJAg+p1NWldsHcODlB++Hyjf+1keK9915
	HHS6QYrBpj4VIkVw+27Cq97cVS4pTmdF8HOpZ+l7d9UScsSo7+2EJwFf54p6kyUvYK1M
	AxCp2rXz47cL4WTbH6Ta62CDDpKNkP/lmbZVZeLmGXuYWgauJvX+hQXgZV5fhzKd62TV
	F7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=yXw+m6MehVrIAvbt5g3AXn6iE3lPfoGzVKWp8NRRBLU=;
	b=M6e1PltBiJx80wJRMFzXh0xXLCEQfHPHjVZ5SGepRd7EvIrQKP6u+TIypRwwW1eiC4
	y0p9TpZJHFlj/J/7Z3ITUsBLca6i9WTh8ngTkomtGBfNocKUaPM43S5HolSdnxYT+icR
	iI8kzCAD58sEFk9LtIRitwWn8/aU5OJXaUiFC+3H+jpSHyd1ZzkRdrlxoAiVyMQKpoqg
	Hd8Zn2FKzF042oj1Z6XmTwXfgMak2USSmdIwZAwkW2n2AtwgdgCUaPuArXGCcVKCpWoq
	ROhtgH4jM8998FP1sxN5yWLow0E2mvrCDPNr93ZyM0ruMlgkc2nDT+WSnGlsMvlpu/yg
	TfiQ==
X-Gm-Message-State: AODbwcBs6qwbSABrxu8++UVcEpL2WGU43PcSxqSbRoc+T0ATAr7dmbBH
	HMd7dEmeyeO9N7r9
X-Received: by 10.28.1.198 with SMTP id 189mr9020885wmb.18.1495711020327;
	Thu, 25 May 2017 04:17:00 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id d74sm8544169wmi.3.2017.05.25.04.16.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 25 May 2017 04:16:59 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 May 2017 12:16:52 +0100
Message-Id: <1495711012-6397-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1495711012-6397-1-git-send-email-ross.burton@intel.com>
References: <1495711012-6397-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH][morty 3/3] selftest: do not perform a full build in test_continue
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
X-List-Received-Date: Thu, 25 May 2017 11:17:00 -0000

From: Alexander Kanavin <alexander.kanavin@linux.intel.com>

This was fetching and building the toolchain and everything else
against empty download dir and sstate cache, and so was enormously slow.
The test does not need that, it only checks that one fetch task fails and
another succeeds when using bitbake's -k option.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/selftest/bbtests.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/bbtests.py b/meta/lib/oeqa/selftest/bbtests.py
index baae1e0..c9802a4 100644
--- a/meta/lib/oeqa/selftest/bbtests.py
+++ b/meta/lib/oeqa/selftest/bbtests.py
@@ -221,7 +221,7 @@ INHERIT_remove = \"report-error\"
         self.track_for_cleanup(os.path.join(self.builddir, "download-selftest"))
         self.write_recipeinc('man',"\ndo_fail_task () {\nexit 1 \n}\n\naddtask do_fail_task before do_fetch\n" )
         runCmd('bitbake -c cleanall man xcursor-transparent-theme')
-        result = runCmd('bitbake man xcursor-transparent-theme -k', ignore_status=True)
+        result = runCmd('bitbake -c unpack -k man xcursor-transparent-theme', ignore_status=True)
         errorpos = result.output.find('ERROR: Function failed: do_fail_task')
         manver = re.search("NOTE: recipe xcursor-transparent-theme-(.*?): task do_unpack: Started", result.output)
         continuepos = result.output.find('NOTE: recipe xcursor-transparent-theme-%s: task do_unpack: Started' % manver.group(1))
-- 
2.8.1


