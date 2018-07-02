Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 4190F789E1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jul 2018 16:27:23 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id z6-v6so8244017wma.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Jul 2018 09:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=IolMV0jowklEFzA7Y/JGxkBpOcZPMIkRVUSPXxDLmGM=;
	b=USGSIsLgBmzT0MZKmhvfHfDLiEmJKh27iJOg0Ibp+uAH1w6GfUwViBIacBbYWDPNE0
	YJn/RDvc7b6h1kZZYyuiDkv8m4UUWq0aRo+14fK0wJcpJO7+tE+lUbC6uB158InH9R/v
	Aexmzlfc9Npx5LOZv60WO4w8WKSY8Fxrd1w1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=IolMV0jowklEFzA7Y/JGxkBpOcZPMIkRVUSPXxDLmGM=;
	b=X5+O6qIi8YEvG8ZE7Cq6mFpJAbwQ0mQjGa1294cwoMFi/Iti1auXbSdVWnNkzoTZ8z
	uuQ+Ep+2Oxn+aoe4Qmg3ZtsYV7znGzIn+VJR0VQuFNIzOd1I//aN5Rqs1hvaTGBGtRwg
	0Nr1YmIMjw4fL7jWIwgf+12YbRg/F0Z0AI+boUXkRGfP+nZ89YcJWKW9BpaM0um15snq
	iYVjJnM0lZtUGDtM8YLz3kVb4uQrqzr5U9ZtuLK86g8hfxImkWJREdydSZXfRUshZS2+
	E9o5lmsjtCaRzGT7sHxVVC/ycic2YMCn6ra6lqRvuc4jQanYAmadRYyFVZ9cfSTHtR1j
	msbg==
X-Gm-Message-State: APt69E3ZPtL/w/ZIq2EWX2DAHcvM82dbveYcYphwerF0Ap8md1j9H7FR
	YAV9IgR2oAmaWRc4bIfyHq0IjrEeC6E=
X-Google-Smtp-Source: AAOMgpf19v8K8etHJgPy1yEv7Vu8zyORXmc9Khootjd76fZSIe5QvtY6QGfbkupvjS/W2MhAff9apg==
X-Received: by 2002:a1c:e409:: with SMTP id b9-v6mr8242220wmh.34.1530548843920;
	Mon, 02 Jul 2018 09:27:23 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	17-v6sm12148012wmm.21.2018.07.02.09.27.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Jul 2018 09:27:22 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jul 2018 17:27:15 +0100
Message-Id: <20180702162718.27038-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180702162718.27038-1-richard.purdie@linuxfoundation.org>
References: <20180702162718.27038-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/6] classes/utils: Improve all_multilib_tune_values
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
X-List-Received-Date: Mon, 02 Jul 2018 16:27:24 -0000

Currently there is duplication in the code, we can clean this up
by extending the multilib variants list.

This code also currently fails its its called from an existing multilib
context since its assumes the data store passed in is the non-multilib
case. When building an image, say lib32-core-image-sato, this leads to
incorrect PATH values.

To fix this, we also request a data store for the "" variant allowing
this corner case to be fixed and for the function to correctly return
values for each multilib even when a multilib is already selected.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/utils.bbclass | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index 3f4f51b56be..7035f9da253 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -328,15 +328,8 @@ def get_multilib_datastore(variant, d):
 def all_multilib_tune_values(d, var, unique = True, need_split = True, delim = ' '):
     """Return a string of all ${var} in all multilib tune configuration"""
     values = []
-    value = d.getVar(var) or ""
-    if value != "":
-        if need_split:
-            for item in value.split(delim):
-                values.append(item)
-        else:
-            values.append(value)
-    variants = d.getVar("MULTILIB_VARIANTS") or ""
-    for item in variants.split():
+    variants = (d.getVar("MULTILIB_VARIANTS") or "").split() + ['']
+    for item in variants:
         localdata = get_multilib_datastore(item, d)
         # We need WORKDIR to be consistent with the original datastore
         localdata.setVar("WORKDIR", d.getVar("WORKDIR"))
-- 
2.17.1


