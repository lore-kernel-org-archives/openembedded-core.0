Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id B59A861193
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 14:02:20 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id r11so4708786wrq.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 06:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=J6Hl/d6K60YySGVg5K7MlNpBhwze+qSQkeRiVsHFe9Q=;
	b=JmJEYCCA60QvkPKROqiNHoUtor7z9h5K0TY97Q0r22fnx8aW710mXjb5a1I0NWz1yb
	tQlBJKAg0qtqiXmX0y4U/pKeTwx3KlJlVmz83cAMPj2I/wkDeFZg7GDIUh232JbpxjIM
	aQszDz1NCghHLAsVp91aJDq0lJIR5tQ1Iurm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=J6Hl/d6K60YySGVg5K7MlNpBhwze+qSQkeRiVsHFe9Q=;
	b=ttnT4s88Yu/JtHXJedo4o+gkyeXXYYE4ODd9KKSdF3nVrWL07r6LEk1jOyWhvh1qtm
	IXXte49lm3S3deeDZ62Y1z5c9AE6oniHkF6TAvzL6rCS3wveA/947TWh/AxqWrFnMkJu
	JB4K90FUUylwwxGUKeFV1nY85twJa/jTHztD3FkG5CEKvOCRJTFmf90PMSVqGDkDyGwv
	Ph0/Mbz7Xk1pzBLKlbLX/naywG8BwqHsRekp/bIAPTjQUK0sRIZH68KFLWfi7MxIrM1a
	Tp/apvaA4pL6bku/UAGOiCIh9uMDvF2vjQUGVhXz7G+nSRmxNwv6Jd3y89V73NrwpCDw
	uuGw==
X-Gm-Message-State: APjAAAWV/P4q65W/4Soeqmq8oI3i1RyZi/pxHl2Whnvd3SMZfOwwyQnl
	V1xGXiiDVPeFa/H9wpei2PunKVmnjRg=
X-Google-Smtp-Source: APXvYqzuTzzsIWzow+HjTdK56NWM6b79dAUcJkJiBg4f9KdJtP4i8+5ZeAcaN03oML97YKrOjMoYSw==
X-Received: by 2002:adf:f304:: with SMTP id i4mr14467068wro.379.1582207340720; 
	Thu, 20 Feb 2020 06:02:20 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	f65sm4743147wmf.29.2020.02.20.06.02.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 20 Feb 2020 06:02:19 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Feb 2020 14:02:18 +0000
Message-Id: <20200220140218.165918-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] oeqa/logparser: Fix performance issues with ptest log parsing
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
X-List-Received-Date: Thu, 20 Feb 2020 14:02:21 -0000
Content-Transfer-Encoding: 8bit

On the autobuilder a ptest log with 2.1 million lines took around 18 hours to
process. This is clearly crazy.

We can tweak the processing code to:
a) Stop repeatedly joining large strings together (append to a list instead)
b) Use one startswith expression instead of multiple re.search() operations

With this change it takes 18 hours down to around 12s.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/logparser.py | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/logparser.py b/meta/lib/oeqa/utils/logparser.py
index 7313df8ec35..54037210736 100644
--- a/meta/lib/oeqa/utils/logparser.py
+++ b/meta/lib/oeqa/utils/logparser.py
@@ -25,13 +25,20 @@ class PtestParser(object):
         section_regex['exitcode'] = re.compile(r"^ERROR: Exit status is (.+)")
         section_regex['timeout'] = re.compile(r"^TIMEOUT: .*/(.+)/ptest")
 
+        # Cache markers so we don't take the re.search() hit all the time.
+        markers = ("PASSED", "FAILED", "SKIPPED", "BEGIN:", "END:", "DURATION:", "ERROR: Exit", "TIMEOUT:")
+
         def newsection():
-            return { 'name': "No-section", 'log': "" }
+            return { 'name': "No-section", 'log': [] }
 
         current_section = newsection()
 
         with open(logfile, errors='replace') as f:
             for line in f:
+                if not line.startswith(markers):
+                    current_section['log'].append(line)
+                    continue
+
                 result = section_regex['begin'].search(line)
                 if result:
                     current_section['name'] = result.group(1)
@@ -61,7 +68,7 @@ class PtestParser(object):
                         current_section[t] = result.group(1)
                         continue
 
-                current_section['log'] = current_section['log'] + line 
+                current_section['log'].append(line)
 
                 for t in test_regex:
                     result = test_regex[t].search(line)
@@ -70,6 +77,11 @@ class PtestParser(object):
                             self.results[current_section['name']] = {}
                         self.results[current_section['name']][result.group(1).strip()] = t
 
+        # Python performance for repeatedly joining long strings is poor, do it all at once at the end.
+        # For 2.1 million lines in a log this reduces 18 hours to 12s.
+        for section in self.sections:
+            self.sections[section]['log'] = "".join(self.sections[section]['log'])
+
         return self.results, self.sections
 
     # Log the results as files. The file name is the section name and the contents are the tests in that section.
-- 
2.25.0


