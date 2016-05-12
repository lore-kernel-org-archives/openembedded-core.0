Return-Path: <michael.g.wood@intel.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id E1FCC60118
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 13:32:11 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id n129so259687721wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 06:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=cc4FKsKGVR49unAErerbL72bsdygckWnD/ZL/w3ApwU=;
	b=Pkd9kP+i0UYtiPaWeWbJkfVIFrh9nz9SOEOcRTBaf9oUWKt+klBcdviSySehDuvQ6U
	TEAXEr6gHJEj0LAjq3qqBX6FxHZ9726A8JuUJbf2ZiqO6YIswi43w/YkH0sSTUo3Uhdp
	1slTPPzRJ1Hl2zOXPQxy7Kbq27TcNaKaPhSSLUJCPb9VhDCu2caiwlM1B2PsD45sNFmh
	6Pcg1hPHOU7mjFDALOnHnIw710KoLScUnS9qzyIdKuQaPantKb3tzJgh2zaWnmZuu1nS
	j5ceX29bfIavhD5nTOjqKC2Xk3vdYO2zQayi8jkOfqIrbiN3HSp8MEiNjc/gmTOtukUn
	bmDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=cc4FKsKGVR49unAErerbL72bsdygckWnD/ZL/w3ApwU=;
	b=S2by8juIkJdbg1rOdp76C/eMs8TFC0AV6EJQQSRVac5bdTtbCSdlCLUZVy6aHbujuE
	5aDRHgt2c1EjNkGWLW4SW5AvWXP+lJ0Fsl9/Nz/wXkVbqRvmFYNUHhpONkecPaJVYX1M
	pGssja15lfpdhvCv/O0UhwNZ+Cw3CWgjwjqDG0cABxJmQdEpYEPHxngPEMIRABjbnLup
	ZaTF3GW+dh+Px4Nl2aVxtapyLLrhZTsxVBQPG0tKx7r2L75jHSpzgiRy27NASluiLPmh
	rN7ZQXjN6MOm1x2NBS67EVOWgv35djHqHVZITA60AzxjNdiZwUHPspeDTlXAezF/64Ks
	J3Vg==
X-Gm-Message-State: AOPr4FU0g0XlIvRJUa5IML4KqVEdDTeWKMa2onLvsQauw/lJQu6LezIj0mqanCV4l/qkcM06
X-Received: by 10.28.25.129 with SMTP id 123mr6381134wmz.10.1463059931570;
	Thu, 12 May 2016 06:32:11 -0700 (PDT)
Received: from orion.icx.intel.com ([83.217.123.106])
	by smtp.gmail.com with ESMTPSA id
	m20sm13901749wma.23.2016.05.12.06.32.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 May 2016 06:32:11 -0700 (PDT)
From: Michael Wood <michael.g.wood@intel.com>
To: openembedded-core@lists.openembedded.org, ross.burton@intel.com,
	elizabeth.flanagan@intel.com
Date: Thu, 12 May 2016 14:31:58 +0100
Message-Id: <1463059918-9077-1-git-send-email-michael.g.wood@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] report-error: Replace the build directory path in the error text
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
X-List-Received-Date: Thu, 12 May 2016 13:32:12 -0000

Replace the TOPDIR in the output error file so that the error report once
submitted can then be more easily matched to find duplicate error
reports. This also reduces the need to manually redact any information that
might be in the error log path such as hostnames or home directories.

Signed-off-by: Michael Wood <michael.g.wood@intel.com>
---
 meta/classes/report-error.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-error.bbclass
index 82b5bcd..20d2bef 100644
--- a/meta/classes/report-error.bbclass
+++ b/meta/classes/report-error.bbclass
@@ -58,6 +58,11 @@ python errorreport_handler () {
                 try:
                     logFile = codecs.open(log, 'r', 'utf-8')
                     logdata = logFile.read()
+
+                    topdir = e.data.getVar('TOPDIR', True)
+                    if topdir:
+                        logdata = logdata.replace(topdir, ' ')
+
                     logFile.close()
                 except:
                     logdata = "Unable to read log file"
-- 
2.7.4


