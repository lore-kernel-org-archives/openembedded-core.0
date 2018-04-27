Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id CB889745A6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Apr 2018 18:46:20 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id o15-v6so2647929wro.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Apr 2018 11:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=vhvoLhzC5WeTJ2jQB5RAlIhEFOVL+ofB0wP963TlWU8=;
	b=bFgE+y+Jfz5gDzd5Dxjd7M+yj0Da0wXD8ZhbKMX77ns9VC1AnUtpeiB2RR5OIqMBwp
	clJXoZPylKY/Ph2ftUXM6CBY8w1i83VHUartU4JVhQHqGsrHmTDBpZS0yC8mHuTxRuu/
	myHr2GLUwEmuJD1rq/K7QNAE/4f3Ig1YKLSWjm6W/RRg5UDFkkRtRlatziZz0F0XsAoM
	bAnHtzNcLnX1elJuQHLSXZ9hSDkYigJOJO6WZTccjLoiK13MjP51zoRtwG8/qByQkPwV
	fukbH6hOtZTUebIJA3cxPQXgH/DrlsRFmKIwUZH51ieWM6ch5OAhzNP+cC7vNWDXLxxR
	YuzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=vhvoLhzC5WeTJ2jQB5RAlIhEFOVL+ofB0wP963TlWU8=;
	b=lnQ4AqUoeAy60XG0//sxJpx90rLauKdU6SUdMRfPWGf+csmvlSFZCLKIpcDnX0szhu
	CQ89dUrNSpUos3+zBYgdqjFezQOiHLoO4QbBQsZmYMqzkpSfpYpWv3k1myc7Mnbwmzlj
	tfhMptKxEmwwhugilXUafluPJMV+53ANJAJeWFwoc4wUwIz9zRFTV7RlfP83x6yo6871
	XWlMpLgBu0QLmxCjlepQawRBETKwZVYbgmf5zlkpX+w3j98nAdw7m69WHFEGh3MDyL1n
	UAaZqmdRjP7Cc7OjVkIe5kgJGvQkXk5Y6uMdqwpWaNy2J2NiD0L2n7TH3Nc8xVFT6nqy
	hSxg==
X-Gm-Message-State: ALQs6tB9gDhhUT0KEy+Fm+iJ9fWTS7cm4IVMpjoq83wmRxo4CfZi41BM
	/svXo3Npd68GdfbxOmgx0gUE8p4m
X-Google-Smtp-Source: AB8JxZo3Loqepw9QYXpgTHgF9Raz+/+SBUFZLk7F2TWw8B/QcNXYj+ZQDdJnbAJZjmQ9gLo/lFIb+w==
X-Received: by 2002:adf:b839:: with SMTP id
	h54-v6mr2628802wrf.141.1524854780882; 
	Fri, 27 Apr 2018 11:46:20 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id w62sm1738410wmb.6.2018.04.27.11.46.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Apr 2018 11:46:19 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Apr 2018 19:46:17 +0100
Message-Id: <20180427184617.19111-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] base: improve do_unpack[cleandirs] logic
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
X-List-Received-Date: Fri, 27 Apr 2018 18:46:21 -0000

If a recipe sets S to ${WORKDIR}/ then the S != WORKDIR test doesn't work as
expected.  Use os.path.normpath() to normalise the paths so string comparison
works.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index bb1f4b75336..d5798f9c48c 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -152,7 +152,7 @@ python base_do_fetch() {
 addtask unpack after do_fetch
 do_unpack[dirs] = "${WORKDIR}"
 
-do_unpack[cleandirs] = "${@d.getVar('S') if d.getVar('S') != d.getVar('WORKDIR') else os.path.join('${S}', 'patches')}"
+do_unpack[cleandirs] = "${@d.getVar('S') if os.path.normpath(d.getVar('S')) != os.path.normpath(d.getVar('WORKDIR')) else os.path.join('${S}', 'patches')}"
 
 python base_do_unpack() {
     src_uri = (d.getVar('SRC_URI') or "").split()
-- 
2.11.0


