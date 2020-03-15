Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172])
	by mail.openembedded.org (Postfix) with ESMTP id CAF6E61B95
	for <openembedded-core@openembedded.org>;
	Sun, 15 Mar 2020 18:12:03 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id z5so8539373pfn.5
	for <openembedded-core@openembedded.org>;
	Sun, 15 Mar 2020 11:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=609X12XcHfBrPxik034KVaCAfDA4qNAetJhNCoQ5nTg=;
	b=hlCTC+a37LPkmbCAU8JmFQFsUk8az1FbT4ppPtT+gZhtB4U6jztqtj7qNOTpYocbH3
	FtFTdf6Ih7q96mt7a9epTNyAw/SskvBY/r+j1/fgoqeJNEYEomOeHik/z5uAWAjJQ8Hv
	5ujekj/efh+fblP+QXM8ZEx2uNmTh9v1QeVUBwvuwCIvaP9dnnC7QjtvAwfSFF2Is2Rt
	rhcOV8nWEIXIHusHpZ3Hj6d6hXMP2etxMQZEVnxDgKkwlNlbXRwsQYenzh23UOBLanM8
	qTO6uIBfMnp5Rs3pAkMCHWWZDJ3BZ+bQj9N7XGr8yNkuB2saNjMa16rSK6ZmA6omKKuJ
	SQKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=609X12XcHfBrPxik034KVaCAfDA4qNAetJhNCoQ5nTg=;
	b=cp7dqthbe7aggVGg3/HlxBudHWbUZXCSCxhebui4kkNQJ3rxuSkblWWZIhAmh4fUqT
	8/aNdThiJ+C1vFxzcZae2IPvDG5rjx6BJWoxy9+vpfkfg+qXx/kmTnS7oDYxpwt1zSpg
	WvY12OMzeDfxyzsgRGL55/nXVLMTZ12KvLSqPE39JTOaSNHJtz8TjunNCeNDK/s7SbVV
	yba35QrH/aXFmAp0YBq+JVVqPXbgLiAHT6LE+INGm9eLXZz519mXFJGI+2FMBdGHVMjA
	AI08G4JSdnasprek+xktH9YqCSMq+M5vnGPHkCqjlXYtVNi+nw9CbxgXg7DMcATw9Eei
	wtuw==
X-Gm-Message-State: ANhLgQ3uuu8kWQ2ZjWVd1Q8+bCtIKpQyrqFZ8C5bNEoZ9P8f6a69PlDa
	LDlxQHh2N1l6T7dERfRCVzoE4Fct
X-Google-Smtp-Source: ADFU+vszHbKITDpiXpkIE+XwE1QkEe8mEpjArI5nVFTTtkFCW99hmQhpfuCj3m2//5mdNpaY2jlakw==
X-Received: by 2002:a63:b22:: with SMTP id 34mr22769029pgl.78.1584295924766;
	Sun, 15 Mar 2020 11:12:04 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:c9cd:7c61:9c1c:2d2f])
	by smtp.gmail.com with ESMTPSA id
	n5sm12223816pfq.35.2020.03.15.11.12.03
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Mar 2020 11:12:04 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun, 15 Mar 2020 11:11:45 -0700
Message-Id: <d313a5912d2ecbf7796e75ee7e7cd1d442b4fa40.1584295805.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1584295805.git.akuster808@gmail.com>
References: <cover.1584295805.git.akuster808@gmail.com>
Subject: [zeus 03/16] cve-check: fail gracefully when file not found
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
X-List-Received-Date: Sun, 15 Mar 2020 18:12:04 -0000

With out these changes, a traceback displayed when a file
is listed in the SRC_URI but the file does not exist.

raise FileNotFoundError and print the patch then mark the task as failed.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit d4926c11a4ab9148bdb640a9367c9e1891491a5b)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/cve-check.bbclass | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 01b3637469..74124364b2 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -52,7 +52,10 @@ python do_cve_check () {
     """
 
     if os.path.exists(d.getVar("CVE_CHECK_DB_FILE")):
-        patched_cves = get_patches_cves(d)
+        try:
+            patched_cves = get_patches_cves(d)
+        except FileNotFoundError:
+            bb.fatal("Failure in searching patches")
         patched, unpatched = check_cves(d, patched_cves)
         if patched or unpatched:
             cve_data = get_cve_info(d, patched + unpatched)
@@ -129,6 +132,10 @@ def get_patches_cves(d):
     for url in src_patches(d):
         patch_file = bb.fetch.decodeurl(url)[2]
 
+        if not os.path.isfile(patch_file):
+            bb.error("File Not found: %s" % patch_file)
+            raise FileNotFoundError
+
         # Check patch file name for CVE ID
         fname_match = cve_file_name_match.search(patch_file)
         if fname_match:
-- 
2.17.1


