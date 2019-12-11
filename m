Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
	[209.85.216.52])
	by mail.openembedded.org (Postfix) with ESMTP id 170E17FA30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2019 15:57:57 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id w23so9105881pjd.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2019 07:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=QjK9cV5OUDsv26KiqZnW9gHLJM/E3c5kJBKU5iyMnVo=;
	b=j1FaR4S8YLuVQPjewHnoPvqnze4D2CXv5MKPzvk3BoQ+XBaFRPGA6i5Q67FpqVohx6
	mJ5OqYd6d2T9IBiVHL2UsdY7zFdpxbyFe2dmuVRWl/njSFtaqi85dM+ouYdu1Aw1eVfw
	uqubHrbA68qJy3ZMJq6c9QpQv8VG5ZXdzaO4CxnDX2Fe6c8/VOEqI23xZu4kA/5977ZB
	l0/lufO1fO+6GTN1wODiR9OrxmL603GeCj8dVjeEVQx5igqOQF0Dz1koNBztOQD056PT
	xY54NEe/fXzfLpVS7ARCllKDpNNDmfGbsgtcnekQ6rDLoNMxS0lGn4W87nk8C4mKyGM3
	CgBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=QjK9cV5OUDsv26KiqZnW9gHLJM/E3c5kJBKU5iyMnVo=;
	b=uLRl2fzTjzGizaVNgL0AO5Si4vV+iRnCoibjVjamqRriqdTsazw5Jh927EnybsgT6c
	MYJwW1RkW/dS3T5Qso+vjCwm6m89et40Sl+HB56HajTbjxiwOFz3dcQl7ASom+iuxJca
	yeFtsbij0ZDp31r+pqEQbsZA8pTA8/1PtFqDfHCcFjVj6f9B7ty+0ggo2NOMG8sfYd+N
	bvBBosQ7p3gEFhXgwAofUlsw46uJSCyVsWOemu+nNTEF5kA54FyeeyjeYpdrOoBN8OqL
	gIS32PBpFLrRW071ANrwP2hz5VWwMVDf5ff+ju84gzDboWdlaLTmawODqDePw15z2Zbs
	416w==
X-Gm-Message-State: APjAAAXTXYOuaYEkMg/fZ9SmfYnu8BuJ45vL7Cen8cyOgJSSJN23WIXq
	HFPbj2Do9HtKZdu9xUFh9fOwhOz3gls=
X-Google-Smtp-Source: APXvYqzoUit71DLpEpVTJz60YtD5Ip5rQrmL7BZbvAgoRmA2n1A91H7DEt6ypGvyR/PskK1YCkHdwQ==
X-Received: by 2002:a17:90a:d801:: with SMTP id
	a1mr4399351pjv.34.1576079878752; 
	Wed, 11 Dec 2019 07:57:58 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:50a9:9288:81a1:163b])
	by smtp.gmail.com with ESMTPSA id o6sm3455566pgg.37.2019.12.11.07.57.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 Dec 2019 07:57:58 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Dec 2019 07:57:56 -0800
Message-Id: <1576079876-13443-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] cve-check: fail gracefully when file not found
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
X-List-Received-Date: Wed, 11 Dec 2019 15:57:58 -0000

With out these changes, a traceback displayed when a file
is listed in the SRC_URI but the file does not exist.

raise FileNotFoundError and print the patch then mark the task as failed.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/cve-check.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 01b3637..c2dbb8d 100644
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
@@ -129,6 +132,9 @@ def get_patches_cves(d):
     for url in src_patches(d):
         patch_file = bb.fetch.decodeurl(url)[2]
 
+        if not os.path.isfile(patch_file):
+            raise FileNotFoundError
+
         # Check patch file name for CVE ID
         fname_match = cve_file_name_match.search(patch_file)
         if fname_match:
-- 
2.7.4


