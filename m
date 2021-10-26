Return-Path: <tomasz.dziendzielski@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D957FC433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 07:34:15 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.9072.1635233654989915913
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 00:34:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fFYoRruk;
 spf=pass (domain: gmail.com, ip: 209.85.208.170,
 mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id o26so18223651ljj.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 00:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gTSPt9FPXOfBcAMJoULX0OEmU1PhNfhTEhN+v6jT4Eg=;
        b=fFYoRrukd0341CQI7GEaDre1URoqwJ5Oz18jF4229QvPmQXQOhyERN/KNIanKe4W1L
         3sq6l/qudwbePedNVdNY1Pq2S9QRpkTPv0x2hp9NWDY8yhwv0Al9rb5ZnGun6wJabOKG
         s57ke94m2bWs7ZhVVOO0CA9jLLTcoxxeZoiD0jJQEuMx/gj5jQATOrNlCqTmASA7JqyU
         D7PUofaXLOx95tAE72URPjf3VT+j8UEWY6srsPS4Lba2u09Pyc7jNg2/kdXmJN5Igmn/
         yfClhG4nmn2lUB0eRoTWlLFNfQwJo11T8BNDS3OH0Y0lKS40Mtl7yxO4ATL1zJBYGYI4
         AyNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gTSPt9FPXOfBcAMJoULX0OEmU1PhNfhTEhN+v6jT4Eg=;
        b=TEkDZuXQ09/fpEZlboNCsitA6pXZ8Pyp0IwfcW01uEH1vjYp4/aAden0xn+u3KE2C4
         k/wjfYQkoK1oovkAMkkC5da00vASkgyKm1J7FYICqOZkbxogL8CAa4uCyxqiundgarXV
         FLZA5yNCKKK1XjdMTjiwGis+UBpAZxEoyLuoPuspag+oCw8+8LM5Hg6hDJDBTRA/P34U
         1tAMn6ta+CgGUzLjmO0bk6sOm1NMACEOM0zSGLH8AQJjB33AWCUjNZciX8M8pz1Ort8g
         HFbd6L9Ul+PvQQWLBYEk52GXe7q7dYHBkZMTKqjGRgVe5EXL1c10C/hkwepRpK4RUyTG
         HpWA==
X-Gm-Message-State: AOAM532vSCm95nCOC9J/y7g0AlccZu9FMBU9gBh9LK5NN2LGk61G9cjk
	3TgwJVvJ2uKZgdzNTasECG2HutbrgMgLrA==
X-Google-Smtp-Source: 
 ABdhPJynT7cI1v5T7bpkD+NK5nhFUGSf5pzDIn1eyOAq8XlkgBL3zqkRJMNPmoTJnCAjAvtZcUQGQQ==
X-Received: by 2002:a05:651c:b08:: with SMTP id
 b8mr23468440ljr.515.1635233653179;
        Tue, 26 Oct 2021 00:34:13 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a317:e437:bf00:3580:3e57:72c5:520])
        by smtp.gmail.com with ESMTPSA id
 q6sm1857158lfg.188.2021.10.26.00.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 00:34:12 -0700 (PDT)
From: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>,
	Jan Brzezanski <jan.brzezanski@gmail.com>,
	Ricardo Rodrigues <rrodrigues80@gmail.com>,
	Szymon Czarnuch <szymek125.14@gmail.com>,
	Kamil Kwiek <kamil.kwiek@gmail.com>
Subject: [PATCH] kernel-yocto: Add KERNEL_SKIP_BRANCH_CONVERSION var to skip
 branch conversion from remote to local
Date: Tue, 26 Oct 2021 09:34:06 +0200
Message-Id: <20211026073406.3516-1-tomasz.dziendzielski@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 07:34:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157376

Introduced poky upstream commit:
14df6d53b6 linux-yocto: improve checkout error handling and reporting

converts all remote branches to local branches.
Our Linux repo has ~4500 remote branches:
git branch -a | grep remotes |wc -l  -> 4575

This costs our best workstations ~20 minutes to simply do that conversion
in do_kernel_checkout which is not needed (at least I do not see any
benefit after testing with this patch).

Since this conversion is required for some linux-yocto workflows we
introduce variable that allows skipping this on demand.

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Signed-off-by: Jan Brzezanski <jan.brzezanski@gmail.com>
Signed-off-by: Ricardo Rodrigues <rrodrigues80@gmail.com>
Signed-off-by: Szymon Czarnuch <szymek125.14@gmail.com>
Signed-off-by: Kamil Kwiek <kamil.kwiek@gmail.com>
---
 meta/classes/kernel-yocto.bbclass | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 1d5a8cdf29..68fb1af821 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -363,13 +363,15 @@ do_kernel_checkout() {
 		cd ${S}
 
 		# convert any remote branches to local tracking ones
-		for i in `git branch -a --no-color | grep remotes | grep -v HEAD`; do
-			b=`echo $i | cut -d' ' -f2 | sed 's%remotes/origin/%%'`;
-			git show-ref --quiet --verify -- "refs/heads/$b"
-			if [ $? -ne 0 ]; then
-				git branch $b $i > /dev/null
-			fi
-		done
+		if [ "${KERNEL_SKIP_BRANCH_CONVERSION}" != "1" ]; then
+			for i in `git branch -a --no-color | grep remotes | grep -v HEAD`; do
+				b=`echo $i | cut -d' ' -f2 | sed 's%remotes/origin/%%'`;
+				git show-ref --quiet --verify -- "refs/heads/$b"
+				if [ $? -ne 0 ]; then
+					git branch $b $i > /dev/null
+				fi
+			done
+		fi
 
 		# Create a working tree copy of the kernel by checking out a branch
 		machine_branch="${@ get_machine_branch(d, "${KBRANCH}" )}"
-- 
2.33.0


