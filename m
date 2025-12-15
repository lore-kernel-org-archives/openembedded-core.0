Return-Path: <corentin.guillevic@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 441A9D5B170
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 10:33:24 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45402.1765794797162177598
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Dec 2025 02:33:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ADVx6ebu;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: corentin.guillevic@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47a95efd2ceso14318145e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 02:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1765794795; x=1766399595; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BbtOfV0BNsQjwzhyan5JeFiHk1qnqK6zPI6QDCcliU4=;
        b=ADVx6ebu95gnlwg5RklzkKeFhiC2BZfqEl2RNr6uyYPO3t04fWiv5ORf9ANkwo+iHG
         20mkJDgfSxMfkoIy4vNM3+ANe2DeLvYCV7CKaMwsfTajTZDAC84hVO9wVtb7ooYRA4gP
         aMxgyozsmhxP9coh/K4p1xbqEI2Sge0CcZrF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765794795; x=1766399595;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BbtOfV0BNsQjwzhyan5JeFiHk1qnqK6zPI6QDCcliU4=;
        b=XxgIhJA1fE9cY3jaFMb3wR3uq/xUqFPppOak+b3GDDIWjdsCYdUsX6khNKGoX/aBy2
         tfPSvxFgSGQnuIxZwwhADasH6l6Rv4jaw3QmlSs7rcXl6bK/gJBl2yu+Vroi35AOI0Rz
         OjNusCTTUbPjiNc1n+nFldyBlMDL+UY4nCcXSJjKjcNJLfBdJ6voMq7b6xfSiUi07CTT
         D1tD3KO5SLlNm5BBON8L2MPd23KlCYjhpM3JV8jJM24gqJ89DuzhCb5bx1kyS+0ll8L1
         ZxO+n7ibSEB7WevnuYTg1UE9uPnRNO2VDWJ4GVy4y3eX79pXEymwUMcE5/j35AzUE1iF
         Q4HQ==
X-Gm-Message-State: AOJu0Yx89+aWzAXI7dtn31aO5LZaSJRSSSLFppE237Kxx5iDFg1cLiT7
	6VLHIFDKZ6BZtNSA9lT7g/MjePqxkEf3TsHqRqWtXHVlNPwLksuOzi8yOMfGTu4InspSIp2PcqA
	sti3G2Zk=
X-Gm-Gg: AY/fxX56SVRno7cR0MeCh+AKdxNXR3mBMrtE8aofFQckkcp4q3zcT1CcITwdFa+er3E
	haprPE8LIXkRmJMOwfJhOytltgVIZAQRQaI21MIB6v/bkoynKa0lebzCyFSj5Za2S/OxJ4abU9C
	tu65+zpW+G+yy3d3RPKbwdNwGgjuAmWv9lpfzAsv1SGAA6CP8O6pMvc5ajT2EL4icIv6xlRBd/5
	+z+HOYjI3MGkGBfd+P44t76aiQJJVN0GZeqKFoWLqQvMRrKx0kHiCEAsDh6tSnmHW1ycUKLHsj+
	Dfqgh2QKpAP81loRJXnAX+B92UcLudRmE0CsM1LhcaL66zJB3tGFmmrf0yUAoZW3cqheJcRBLd0
	UMC7a/z4eIxyHFcejIVFc2b4ZapQPJwmLQuBFezY/9mf6fFI7Mm5Ugu5SV9jWrFY82OVFOSbKZb
	3NuCSvJMishaTkGhyAD/teqjg4R+yzTCy4GKWZGK19aLDReCYaPiJ9RvOG550Nwh1bHjEHKB68T
	9/dxhxsIYeTJEjeARE=
X-Google-Smtp-Source: AGHT+IFMjx6gDfC0X+jFobUJCaK2B+9LBjdZnmDaFyytUyhBku3RIDGQllqFgxBQ/r/YF0lYHSJJIQ==
X-Received: by 2002:a05:600c:4e09:b0:477:9c73:267f with SMTP id 5b1f17b1804b1-47a8f914a25mr119594275e9.33.1765794795566;
        Mon, 15 Dec 2025 02:33:15 -0800 (PST)
Received: from heaven.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f4f2e8esm180810675e9.9.2025.12.15.02.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 02:33:15 -0800 (PST)
From: Corentin Guillevic <corentin.guillevic@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Corentin Guillevic <corentin.guillevic@smile.fr>
Subject: [PATCH v2 1/2] oe-setup-layers: support inline URI
Date: Mon, 15 Dec 2025 11:33:11 +0100
Message-ID: <20251215103312.902774-1-corentin.guillevic@smile.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 10:33:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227724

Most of the time, when we describe a remote, the layer data (also used by
the script bitbake-setup) looks like this:

"bitbake": {
    "git-remote": {
        "remotes": {
            "origin": {
                "uri": "https://git.openembedded.org/bitbake"
            }
        },
        ...
    }
}

i.e. an URI with the common name 'origin'. Alternatively, we could simplify this, by
using a shorter structure with the property 'uri' only:

"bitbake": {
    "git-remote": {
        "uri": "https://git.openembedded.org/bitbake

",
        ...
    }
}

These properties can be used together.

Signed-off-by: Corentin Guillevic <corentin.guillevic@smile.fr>
---

Changes in v2:
- The keys are complementary, rather than mutually exclusive
- Updated configuration in meta/files/layers.schema.json

 scripts/oe-setup-layers | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/scripts/oe-setup-layers b/scripts/oe-setup-layers
index 31cb963251..c8799fe265 100755
--- a/scripts/oe-setup-layers
+++ b/scripts/oe-setup-layers
@@ -60,6 +60,33 @@ def _write_layer_list(dest, repodirs):
     with open(layers_f, 'w') as f:
         json.dump({"version":"1.0","layers":layers}, f, sort_keys=True, indent=4)
 
+def _get_remotes(r_remote):
+    remotes = {}
+
+    if not 'remotes' in r_remote and not 'uri' in r_remote:
+        raise Exception("Expected key(s): 'remotes', 'uri'")
+
+    if 'remotes' in r_remote:
+        remotes = r_remote['remotes'].copy()
+
+    if 'uri' in r_remote:
+        r_name = ''
+
+        if 'remotes' in r_remote:
+            if not 'bitbake-setup-uri' in r_remote['remotes']:
+                r_name = 'bitbake-setup-uri'
+            else:
+                idx = 1
+                while 'bitbake-setup-uri_{}'.format(idx) in r_remote['remotes']:
+                    idx += 1
+                r_name = 'bitbake-setup-uri_{}'.format(idx)
+        else:
+            r_name = 'bitbake-setup-uri'
+
+        remotes.update({r_name: {'uri': r_remote['uri']}})
+
+    return remotes
+
 def _do_checkout(args, json):
     repos = json['sources']
     repodirs = []
@@ -80,7 +107,8 @@ def _do_checkout(args, json):
         if not desc:
             desc = rev[:10]
         branch = r_remote['branch']
-        remotes = r_remote['remotes']
+
+        remotes = _get_remotes(r_remote)
 
         print('\nSetting up source {}, revision {}, branch {}'.format(r_name, desc, branch))
         if not _is_repo_git_repo(repodir):
-- 
2.51.0


