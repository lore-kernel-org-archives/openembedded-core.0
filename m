Return-Path: <dan.dedrick@gmail.com>
Received: from mail-it1-f175.google.com (mail-it1-f175.google.com
	[209.85.166.175])
	by mail.openembedded.org (Postfix) with ESMTP id 0A4E56D268
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 19:17:48 +0000 (UTC)
Received: by mail-it1-f175.google.com with SMTP id y184so17905725itc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 11:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AF9a76SgYhPo9wEBtv9SZ7bkurtFqq2wboqFEhoR+lE=;
	b=kWyz7ZdSsAao5VQZ6Qj7FEBgtoLnX7qyrJg/6hd+I9JG0FDc6g7szEFN36Jx1U4bh/
	LiBkgw1hLc4kIi7mgFIeX6DCCzbF4cTY0SrBGkfx9AOWpTIBOUudSPTEm/+ce/oMTHdo
	bZMqmKDf3BK9WOn+oqdecnYu+FJ0lh7FFrKKf8XLA0oTjz86hU0NbBMLF5GgV8NfiuUq
	Tcq1KkxMibprXfVejP7odeH3cIeT8cRERObeAwHU9EwvJA4ff0tVZo/i++F3ni6WB45r
	JEIk0V2yM/aU4aNxhIrgn1XC9I6LWfKKBXE1uBCan59NlxTakFnec02iwvtkDQGkQa2e
	HAwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AF9a76SgYhPo9wEBtv9SZ7bkurtFqq2wboqFEhoR+lE=;
	b=VUjWGOKA9MYxFCX4AjXLwY0ewXLrlBHzJdSzWfRbPuIkr7K5bz0+4pHE324o3oI75E
	If0buIfQ3yowJrVGFSnVyTW/CJG54262WQ5zANKXDqyu1oOkPi4XKyNr91echCBGOg2V
	oUXp6smcFpGWHRx33F9BfQWXRo2afT2VTjJVB5RR3inwFnd5L21f4wqoNxfr5ll15l7T
	o4DBJqencuXaC0jqoLZOVbdh3RcC+AP+VZv7G6sMRu7Gv6Dwf3QHw98Rigm+d+N5LuRH
	4JFZ0Fm4WLbHI8fw9WsTV61Ot3hWNQLPZCdxd76PzxmbHzvATBQq7xN4DWGQCYP1HH5p
	1gVA==
X-Gm-Message-State: AHQUAuZ+7YAwxYVMWZpYIcaZWt/wpsBD76N30v77nZas2kg7eJU4MCj+
	edBUpBfePbLkbdVe99v3dwHbU7FJ
X-Google-Smtp-Source: AHgI3IYOOWJ8efBFFl1ZwE+IABK1GbCDOedeuWbqXkxB83xGlNr8+HkyWuS5FxKIjuQZ5hkVKQSL2g==
X-Received: by 2002:a05:660c:a45:: with SMTP id
	j5mr2896663itl.83.1550171869689; 
	Thu, 14 Feb 2019 11:17:49 -0800 (PST)
Received: from dargo.lpdev.prtdev.lexmark.com ([192.146.101.90])
	by smtp.gmail.com with ESMTPSA id
	q64sm1310034iod.48.2019.02.14.11.17.49
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 14 Feb 2019 11:17:49 -0800 (PST)
From: Dan Dedrick <dan.dedrick@gmail.com>
X-Google-Original-From: Dan Dedrick <ddedrick@lexmark.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Feb 2019 14:17:06 -0500
Message-Id: <20190214191706.87864-1-ddedrick@lexmark.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] cve-check: allow filtering out patched issues
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
X-List-Received-Date: Thu, 14 Feb 2019 19:17:49 -0000
Content-Transfer-Encoding: 8bit

It can be useful to filter out patched issues since they are no longer
vulnerable. This makes it easier to sift through what CVEs still might
need to be fixed.

Signed-off-by: Dan Dedrick <ddedrick@lexmark.com>
---
 meta/classes/cve-check.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 743bc08a4f..a486d686ae 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -35,6 +35,7 @@ CVE_CHECK_DIR ??= "${DEPLOY_DIR}/cve"
 CVE_CHECK_MANIFEST ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cve"
 CVE_CHECK_COPY_FILES ??= "1"
 CVE_CHECK_CREATE_MANIFEST ??= "1"
+CVE_CHECK_EXCLUDE_PATCHED ??= "0"
 
 # Whitelist for packages (PN)
 CVE_CHECK_PN_WHITELIST = "\
@@ -54,6 +55,8 @@ python do_cve_check () {
     if os.path.exists(d.getVar("CVE_CHECK_TMP_FILE")):
         patched_cves = get_patches_cves(d)
         patched, unpatched = check_cves(d, patched_cves)
+        if d.getVar("CVE_CHECK_EXCLUDE_PATCHED") == "1":
+            patched = []
         if patched or unpatched:
             cve_data = get_cve_info(d, patched + unpatched)
             cve_write_data(d, patched, unpatched, cve_data)
-- 
2.20.1


