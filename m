Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id CE5A97680D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 16:27:40 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so26650536wic.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 09:27:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=OFuzcgf7RF/Bi8uslulCxxf/QYX2RMBfR7VzywMygNk=;
	b=KlteD24jxHCX6Vu+7nO0ARpGZyOvJtAQAtaWWgavBqezXkPrLJjCeXc7hmgThDosgL
	kRJCEESS48HvxFgH1UdOsYX4MTAz3al+LfoBbQn568xci2EpHPPl6+m7Bqfc84bMBJZQ
	IrMCAlpb1jhIv2IpWkWqUQ0yliOTiugXIAUiUGvHIu3UOyWx30xITY9dZIonJVMq/k6s
	XoeozCiK3YCG3IsWzSSChPLfIUK3UWzvD5UQAEeH/SUt5Zd2jvxwP8jDibAc4W8k015q
	u5+PDTPFs774izaxWq0CYSzKTYUnMAXJWFaabary2ZB9rGExemNPkOoK66czfW3Erjz/
	qPYA==
X-Gm-Message-State: ALoCoQlkBA0edtwLPuQNNI25d7SpYd/MNwnCGQJMFF72YuvIjwTG0t/pzRCz+my5SosEIEJRMj94
X-Received: by 10.180.205.234 with SMTP id lj10mr4202644wic.49.1443198460504; 
	Fri, 25 Sep 2015 09:27:40 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id pl7sm4020658wic.4.2015.09.25.09.27.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Sep 2015 09:27:40 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Sep 2015 17:20:35 +0100
Message-Id: <1443198035-30551-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] sstate: fix typo resulting in crazy directory creation
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
X-List-Received-Date: Fri, 25 Sep 2015 16:27:43 -0000

A transposed , and ) meant that a string was passed to a function instead of a
list of strings, so bitbake ends up creating a directory for every character in
the current working directory.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/sstate.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index b257734..d09e27a 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -644,7 +644,7 @@ python sstate_task_postfunc () {
 
     sstate_install(shared_state, d)
     for intercept in shared_state['interceptfuncs']:
-        bb.build.exec_func(intercept, d, (d.getVar("WORKDIR", True,)))
+        bb.build.exec_func(intercept, d, (d.getVar("WORKDIR", True),))
     omask = os.umask(002)
     if omask != 002:
        bb.note("Using umask 002 (not %0o) for sstate packaging" % omask)
-- 
2.1.4


