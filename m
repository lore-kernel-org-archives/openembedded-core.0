Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id A969373695
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 12:34:18 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id i5so13166954wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 05:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=1ZsBn6X0/B8Z3txm5RyPYQmTPBWRKCrVgrQn1m+Lsac=;
	b=em7NWjDQ+tv97M9ttI1uH6ALLZ8zz8DgV2j3p96gq81AuAHEMlkctV4g2yeIA/5epW
	T3UEqN1cBlAtqKBXSWiWgHvI5aU5o70rQ9vInsFeYkGnlnl8D+veWMDJ5H0EJ62LPOGm
	rozrDzzaUSWkV4iSTgTaIjCgGMT45HjL+5gmImt+pcDWbz5ScxSgiEyn4fB98XgcRWY1
	BHtaUtjqKc9IfFLIx4pkNtfDTHF/kGVjYnHRs2vglr0DUH8Xu7OUqed2DTArhGMzBZr0
	mznMX90bPLAqntnbtBPryOCZIhpLxO2f2EfFLE2m1LZAkZUmtztrRyNhlfIcwstz4lPs
	knDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=1ZsBn6X0/B8Z3txm5RyPYQmTPBWRKCrVgrQn1m+Lsac=;
	b=J4oRTVeEN62I6zoOlR3cQMZ5u7WINsX6hsFJTnqRImziwtTk8YwnTTHoIX7qr8FwPP
	qmZtE78FPT969UmLxDKi9PdHnh/v5hvisP6sqNkhfUPr+MtEv5iIPiK3mqIY5RQhsYOx
	RtJ/lLk7F48F+FFdWrPD6YL6GgvwLb7AsFzNmYLUu+LasOOHGCVes8Ud3+0T3zkJ76e5
	tSM6HJwLlJKecKRIRjh0vwOIf68Kmzr5LEIngfCMjMFRGA4JcxJXU4kzQB7SRsiXuf9P
	l5YPHYsNsCovAATTLrvTcNaBWP0pVNHjWgJ7XTBqT6WZcqr+Q/jfHvpFyRm1whwYGwPj
	CXIw==
X-Gm-Message-State: AEkoouuJZGVV/02on1RZ3ku0ZRAxqfB34CENkCmm2xS8rJbzLecbR5UxiQyjvAkfSLeW1D7K
X-Received: by 10.28.46.204 with SMTP id u195mr8526476wmu.57.1470918858108;
	Thu, 11 Aug 2016 05:34:18 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id a9sm2533419wjf.16.2016.08.11.05.34.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 11 Aug 2016 05:34:16 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2016 13:34:15 +0100
Message-Id: <1470918855-8429-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] lib/oeqa/selftest/bbtests: don't report expected failures
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
X-List-Received-Date: Thu, 11 Aug 2016 12:34:20 -0000

Another instance where expected failures need to be not reported to the error
reporting service.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/selftest/bbtests.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/selftest/bbtests.py b/meta/lib/oeqa/selftest/bbtests.py
index 8698400..d8cb835 100644
--- a/meta/lib/oeqa/selftest/bbtests.py
+++ b/meta/lib/oeqa/selftest/bbtests.py
@@ -134,6 +134,7 @@ class BitbakeTests(oeSelfTest):
         self.write_recipeinc('man', data)
         self.write_config("""DL_DIR = \"${TOPDIR}/download-selftest\"
 SSTATE_DIR = \"${TOPDIR}/download-selftest\"
+INHERIT_remove = \"report-error\"
 """)
         self.track_for_cleanup(os.path.join(self.builddir, "download-selftest"))
 
-- 
2.8.1


