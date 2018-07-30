Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3574F788F2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 23:04:10 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id r24-v6so9507650wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 16:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=S9hSvXo/sAFTcFs2BI3Qy4hKhfi3Gv2FOW30rclJEUg=;
	b=dI8MrXeuL+Znq8ODt8bS/9lKgRA5qu3cMidiwSILMZ3QsP1uRwPt6/Q/h/hJk2/XD+
	/7j53CpWe1s0E1NgZaRTaCTeBapoTcvsb5eO52L0XRS8QTyp+V1D1QHzgut6agl0wtz1
	ZPbCXda53V/DULZOHLWuDgJZcckoF4c6BMEtQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=S9hSvXo/sAFTcFs2BI3Qy4hKhfi3Gv2FOW30rclJEUg=;
	b=DxCUwEcVH+EgSjCIDIiOcXvWykkI9YvrHhjhX28zugWRvu5CH82MLuJHCD3zs5Wty4
	q4ExYAEGZWEvM6Yw44BgF01Job3kEK/UEpudhXBqpEKPM1mA+0phQLyfRdEd+1kEJ1R4
	OOfOKrJno6PXNtPL+Bw3oQ0LiPsTZsoywMno3lWJfEF+yVKOZ4o4bJLgJ4GYXiTk4LKU
	BVpGyGWxOoGPQsuyX2vWYHNh9P+lWQUnnarB8OjqhijjchxpkAJScF9FQp5CsWbWaDYS
	At9fR4NELtcWRhMKAsLhoNPCk+QXXxs0vyB4NJ3rG7GioKaW0tLYqntW/MyByw+wkFBK
	2Mgg==
X-Gm-Message-State: AOUpUlHF7+r+oNsr+4XIJ00cXihld4P4GqGRw0wLY5NNyvmhvCQKEmt7
	lAeP8irdwmjsqZma3D7cObRqXQAHdQqBRw==
X-Google-Smtp-Source: AAOMgpe/Es5FiLWrMWB9UEAxsiydkxhCJIN/8hTsA4OC/lfbWRBJ6VET94cDB8+UXl9R3FjJfoejpg==
X-Received: by 2002:a1c:aa0c:: with SMTP id
	t12-v6mr652823wme.109.1532991850602; 
	Mon, 30 Jul 2018 16:04:10 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a11-v6sm14361974wrr.81.2018.07.30.16.04.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Jul 2018 16:04:09 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jul 2018 00:04:08 +0100
Message-Id: <20180730230408.19387-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] package.bbclass: Fix hardlink preservation issue
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
X-List-Received-Date: Mon, 30 Jul 2018 23:04:10 -0000

Recent changes broke the preservation of hardlinks during processing due to a missing index.
Fix this, reducing the size of the git recipe packages in particular (it contains many hardlinks).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 80233a8f5e8..8459d39b27e 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1021,7 +1021,7 @@ python split_and_strip_files () {
                 #  c) Track any hardlinks between files so that we can reconstruct matching debug file hardlinks
 
                 # Use a reference of device ID and inode number to identify files
-                file_reference = checkelf[file]
+                file_reference = checkelf[file][1]
                 if file_reference in inodes:
                     os.unlink(file)
                     os.link(inodes[file_reference][0], file)
-- 
2.17.1


