Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id B7DAF7E86D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2019 10:36:44 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id b2so4833998wrx.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jul 2019 03:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=TVyC2p/W2aHaKLf74q7zEzq33q3TW7HJYy84Yk0LN4g=;
	b=ByfOLIjM4DDP85+ag8rhSt6b02xXIOtZyoevPD0+NTXMzC58JprsvnsBlDY8u0FER2
	nd3lbiv2olVzmm5BaU9+SibhaeyE4AnHlBvSlmi2A0vvvFG3UP6T7PmmSDjRtEfGnlsR
	CMSbmTnOrL5LBnTwuWTpl+k/fUUBPuPwUJvC4h9mtlQNtEl7x8UnhfkZridAtggaSgJq
	SDOV6IBkaOv0cADxR3XP7H7UmG0tCusFxYjk9AuFMf6fedsGgaAk7CyjzG7TKSzJQirZ
	JqhNNBSmM0dc6zyINDBQZHXS01r7KmYZjXfPAqNjpfSpWVWs/Wjk3QRubzE7pSEyMQwx
	0e/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=TVyC2p/W2aHaKLf74q7zEzq33q3TW7HJYy84Yk0LN4g=;
	b=lWThe4KWSY9G+2NxRJQ3J/HJJB/KDOOfjs8FY+qFldHkV3cSM5UW3aJizhVwknSBZ/
	HTReQHlqhuc6ALtyfTMBw2kd3aksALv6NP3A4VJVU7x34X58ZaoaCwPSWNJMzerMjEcE
	4p8bpT8G1hkPgFiX4D4c9fBhYQCRFgZ3+NpT0pk01enDtQGdoiT1s83RKYWDdFBJplcc
	vP6uoH+UvcqwSAKL2jB0il7RPCSN6l0nR+CmfxRrDyT33enelopc9Y1m7TTRX//Fidtl
	D7gk1bdI6uc25nvE6607w0Fozk9P+qykgrWfyTKJ7FxiHEV58Wu4awAOqKozgw2tRTYf
	qlFg==
X-Gm-Message-State: APjAAAXVitaB558VBrOGF35yhnSpZDQGRft56+7lGNj3fEB8oabiGTtZ
	iCSVXlKmZMStdVfNVgWQdHjDibgeJmE=
X-Google-Smtp-Source: APXvYqxHRtjbxSehIXo52mgNb8VNIanb1Itu/GmkxWp61B+XjQP1ErtKj+kcH5GdRYgP0l9IeBe3Fw==
X-Received: by 2002:adf:ec8e:: with SMTP id z14mr8760065wrn.125.1562236605120; 
	Thu, 04 Jul 2019 03:36:45 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	z17sm5411602wrr.13.2019.07.04.03.36.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Jul 2019 03:36:44 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jul 2019 11:36:42 +0100
Message-Id: <20190704103642.2187-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] buildhistory_analysis: ignore ownership for sysroot diffs
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
X-List-Received-Date: Thu, 04 Jul 2019 10:36:45 -0000

The sysroot isn't populated under pseudo, so ownership differences should be ignored.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/buildhistory_analysis.py | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index 8af76c6b3a3..708e1b388e2 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -282,7 +282,7 @@ def file_list_to_dict(lines):
     return adict
 
 
-def compare_file_lists(alines, blines):
+def compare_file_lists(alines, blines, compare_ownership=True):
     adict = file_list_to_dict(alines)
     bdict = file_list_to_dict(blines)
     filechanges = []
@@ -294,16 +294,20 @@ def compare_file_lists(alines, blines):
             newvalue = newsplitv[0][0]
             if oldvalue != newvalue:
                 filechanges.append(FileChange(path, FileChange.changetype_type, oldvalue, newvalue))
+
             # Check permissions
             oldvalue = splitv[0][1:]
             newvalue = newsplitv[0][1:]
             if oldvalue != newvalue:
                 filechanges.append(FileChange(path, FileChange.changetype_perms, oldvalue, newvalue))
-            # Check owner/group
-            oldvalue = '%s/%s' % (splitv[1], splitv[2])
-            newvalue = '%s/%s' % (newsplitv[1], newsplitv[2])
-            if oldvalue != newvalue:
-                filechanges.append(FileChange(path, FileChange.changetype_ownergroup, oldvalue, newvalue))
+
+            if compare_ownership:
+                # Check owner/group
+                oldvalue = '%s/%s' % (splitv[1], splitv[2])
+                newvalue = '%s/%s' % (newsplitv[1], newsplitv[2])
+                if oldvalue != newvalue:
+                    filechanges.append(FileChange(path, FileChange.changetype_ownergroup, oldvalue, newvalue))
+
             # Check symlink target
             if newsplitv[0][0] == 'l':
                 if len(splitv) > 3:
@@ -574,7 +578,7 @@ def process_changes(repopath, revision1, revision2='HEAD', report_all=False, rep
             elif filename == 'sysroot':
                 alines = d.a_blob.data_stream.read().decode('utf-8').splitlines()
                 blines = d.b_blob.data_stream.read().decode('utf-8').splitlines()
-                filechanges = compare_file_lists(alines,blines)
+                filechanges = compare_file_lists(alines,blines, compare_ownership=False)
                 if filechanges:
                     chg = ChangeRecord(path, filename, None, None, True)
                     chg.filechanges = filechanges
-- 
2.11.0


