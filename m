Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97065C36008
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:08:10 +0000 (UTC)
Received: from smtp-1908.mail.infomaniak.ch (smtp-1908.mail.infomaniak.ch [185.125.25.8])
 by mx.groups.io with SMTP id smtpd.web10.61610.1742893689787859336
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Mar 2025 02:08:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 185.125.25.8, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4ZMPGH66Nzz4BC;
	Tue, 25 Mar 2025 10:08:07 +0100 (CET)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4ZMPGH2McLzyG3;
	Tue, 25 Mar 2025 10:08:07 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Tue, 25 Mar 2025 10:07:54 +0100
Subject: [PATCH] b4-wrapper-poky.py: output errors to stderr
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250325-b4-poky-stderr-v1-1-85c23d0f950b@cherry.de>
X-B4-Tracking: v=1; b=H4sIAGpy4mcC/x3MwQpAQBCA4VfRnE2tXRt5FTkYZpkUmpVI3t3m+
 B3+/4HIKhyhyR5QPiXKtiYUeQbD3K8To4zJYI31xlmPVOK+LTfGY2RVrCtbDUTBERlI0a4c5Pq
 Hbfe+H0iQ48hgAAAA
X-Change-ID: 20250325-b4-poky-stderr-8727cbbf3bb0
To: openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>, 
 Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Mar 2025 09:08:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213597

From: Quentin Schulz <quentin.schulz@cherry.de>

Print error messages to stderr instead of stdout.

The commands run as part of send-auto-cc-cmd and send-auto-to-cmd b4
commands will make b4 raise an Exception if they return a non-zero
return code and it will only print the content of stderr before that.

Because print defaults to stdout, b4 would raise the exception and not
tell the user why. This commit should now provide a hint to the user
about what went wrong.

Reported-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 scripts/b4-wrapper-poky.py | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/scripts/b4-wrapper-poky.py b/scripts/b4-wrapper-poky.py
index ec6568eb9b7cab389178c08173a43caa2fc6bd48..f1170db06bf0d41c7251dca54cf43912c04ace7b 100755
--- a/scripts/b4-wrapper-poky.py
+++ b/scripts/b4-wrapper-poky.py
@@ -53,7 +53,7 @@ subject = None
 ref = None
 
 if not shutil.which("lsdiff"):
-    print("lsdiff missing from host, please install patchutils")
+    print("lsdiff missing from host, please install patchutils", file=sys.stderr)
     sys.exit(-1)
 
 try:
@@ -80,7 +80,7 @@ try:
                 break
 
         if not ref:
-            print("Failed to find ref to cover letter (References:)...")
+            print("Failed to find ref to cover letter (References:)...", file=sys.stderr)
             sys.exit(-2)
 
         ref = ref.group(1)
@@ -143,7 +143,8 @@ try:
 
     if cmd == "prep-perpatch-check-cmd":
         if len(projs) > 1:
-            print(f"Diff spans more than one project ({', '.join(sorted(projs))}), split into multiple commits...")
+            print(f"Diff spans more than one project ({', '.join(sorted(projs))}), split into multiple commits...",
+                  file=sys.stderr)
             sys.exit(-3)
 
         # No need to check other patches in the series as there aren't any
@@ -164,7 +165,8 @@ try:
         series_check.write_text('\n'.join(uniq_series_projs))
 
         if len(uniq_series_projs) > 1:
-            print(f"Series spans more than one project ({', '.join(sorted(uniq_series_projs))}), split into multiple series...")
+            print(f"Series spans more than one project ({', '.join(sorted(uniq_series_projs))}), split into multiple series...",
+                  file=sys.stderr)
             sys.exit(-4)
     else:  # send-auto-cc-cmd / send-auto-to-cmd
         ml_projs = {

---
base-commit: 6edb7e77f1342cb63f11067c50f9a2b10f10b3b9
change-id: 20250325-b4-poky-stderr-8727cbbf3bb0

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


