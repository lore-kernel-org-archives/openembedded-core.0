Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id 977E077BC5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 15:25:40 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id k16-v6so11316278iom.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 08:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=+KwsRHdl1MystCjHWQDfMf6Qyw2Cw1fGDks82VfaIp4=;
	b=Fo+zUkWpSw0ezs0xjb5coCnDOFHhkxWYTqOZShT9jUAhMGmUsz2jzuQmFJDE4Z3dKi
	V2Qpxmsk8ozCorLcAMn5goc0AlTfWm8vQ6GFODESVIR1boONYAejHTMngY+RiVJtVzjH
	QsiNfzO9bqvXdz3t07d/MhMW1eiQbgpEfymE1J2uxfpfC/Rp7iWlrmsBg5dgcuu34oTR
	IOV31vmVC5ubhbJgUfzPv/HPS7kUxwY1ycLHVaPQ/hxgvD4qWC0onsP7xiZcAJg1/haJ
	jbvLKSd+SAaTIvu1U3yumLpD0YU8+tH/8BXmx7HeYvyy+RfLKfhnc+NvnfMQVSaE/7BZ
	yemg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+KwsRHdl1MystCjHWQDfMf6Qyw2Cw1fGDks82VfaIp4=;
	b=PwhwiJNpQpbljWLVwMqNsWnWwfVAUAt+0gom3uWnfpoOmmRfEy65NAaMK1xf1EbYG5
	oCurQEIFu36yK1x1twUFA45XYrF3sYomYhIFBRxZw/RvMDJ3ZvqMVM2x9j3EWEWL45bV
	Rpb5C2IvZzot5gWgh1aqh6Qwgyq7W5LfL++ysLPZhVyxOZdSwjyjAAb5Z5BAHXfnDQH2
	uuz0tKyFgGASdm1jNy45cr4FB8LILXY8zbXjwCBIp80lDQaI6UkKDvU5Es43+h6r4Mx8
	nIMaESQ5S+qBGSsbqmF1E5PpRyQqK1c7oSf/tnpvxzAgCiRQIqhleeSLGAS60sWS7GJR
	jifQ==
X-Gm-Message-State: AOUpUlGZgY7tHahGqZqE6j63oX8Wytj0shf2HZ0LHsN1fqaDeLwq1Zuj
	BEWUOryscr+O1gpRtpd9WDpvDwBT
X-Google-Smtp-Source: AAOMgpfhpJbyyot41ZDbkTfpX28bpwk9Wq9pss9uB1B/605i+ZFBKRRW7Z0Sz3rjhCG7SCu70Gy8jQ==
X-Received: by 2002:a6b:580c:: with SMTP id
	m12-v6mr14839146iob.228.1533569141519; 
	Mon, 06 Aug 2018 08:25:41 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	a7-v6sm3802633ioc.25.2018.08.06.08.25.40
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 Aug 2018 08:25:41 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Aug 2018 10:25:09 -0500
Message-Id: <20180806152509.7951-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] classes/reproducible_build: Avoid dereferencing symlinks
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
X-List-Received-Date: Mon, 06 Aug 2018 15:25:40 -0000

Using os.path.getmtime() will dereference symbolic links in an attempt
to get the last modified time. This can cause errors if the target
doesn't exist, or worse map to some absolute build host path which would
make a build not reproducible.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/reproducible_build.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reproducible_build.bbclass
index 2df805330aa..268b5fb8f19 100644
--- a/meta/classes/reproducible_build.bbclass
+++ b/meta/classes/reproducible_build.bbclass
@@ -56,7 +56,7 @@ def get_source_date_epoch_known_files(d, path):
     for file in known_files:
         filepath = os.path.join(path,file)
         if os.path.isfile(filepath):
-            mtime = int(os.path.getmtime(filepath))
+            mtime = int(os.lstat(filepath).st_mtime)
             # There may be more than one "known_file" present, if so, use the youngest one
             if mtime > source_date_epoch:
                 source_date_epoch = mtime
@@ -114,7 +114,7 @@ python do_create_source_date_epoch_stamp() {
             for fname in files:
                 filename = os.path.join(root, fname)
                 try:
-                    mtime = int(os.path.getmtime(filename))
+                    mtime = int(os.lstat(filename).st_mtime)
                 except ValueError:
                     mtime = 0
                 if mtime > source_date_epoch:
-- 
2.17.1


