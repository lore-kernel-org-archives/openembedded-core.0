Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web09.9691.1616509350395032807
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Mar 2021 07:22:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZgML97DD;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id g8so19779503lfv.12
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Mar 2021 07:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=22YwLf3fz4iETlHHmkOoRfCJ5HGDvZPu6L++Ca6EsZk=;
        b=ZgML97DDfM3ywrYoidh/FL1biV6Rr+PNCC8kqBpgdO9vC1tQQ67NW0GRH+/RhED3Wu
         NFO2Q/CaA3A0MvzkR2J3A7Ved3dy9QLY7iCR1nBiVxJpGJWjlF3/bO2kKxn8JCPhDNeD
         cugfr0VXpfs3fV6SVuWGDDQ9D+/UGvqQPB4Ge8giHQrbfAlNXlllT52E/TdMI1qDZDPJ
         llRVPbUjL7bWeptqkF7tN71WLV6VLp43Sa4zJ4akZKReNZLCKmna5PzwkaAk+Q/18Zy6
         LTnD1dBqabUW9ST8C53sPYcvCn2OedvlLsyw7xzU30vxIwJgUQcYlYJrAA/V9x4eohRt
         jo+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=22YwLf3fz4iETlHHmkOoRfCJ5HGDvZPu6L++Ca6EsZk=;
        b=OvAlbuAFLawD17PG6G7DSwDz0VPqu25D+vTHfP+UI7xfmft5Nfv87IWfiz+XZLKigc
         bJubC+r2u+18BFNUYZEvQ3z1A6q73lC5sp58fESB1BOVnK8z4zh4ID7HA4/bKyUP7MkR
         McGu5e8TI1QjTIcuOcReOhLktrj2W7TVKjS7WX8tbpAQNBQMmIUMlcF9o1F3FIDDbh+Y
         YX+u44qAygiFakCv4Y3jNMi5mZbfcRGekRB1uKY/6rPDQEwzvu8cq8zWfw8ycq2rTIJz
         eGRQ4e30lcYZJ20X62S+r4qzbobqAbdhJl/mRTmL+o1w5L+bkgXgCTP/7hpyjy+7sJ6W
         Kksg==
X-Gm-Message-State: AOAM532seFgK5V8qFG3waFG70TLgY0YNeHvl1jrCBs81Z55wGVtb9qCF
	3m2nmcfTg0Ik8m9BDOzk6hnb2/SM8C4fwQ==
X-Google-Smtp-Source: ABdhPJwAUBKOpQ44szBxiEevR6jdGRNE7NIEoHeG9uhbt1qqEC0HiL5gSYoL6p5u27SM6D7Hj46fww==
X-Received: by 2002:ac2:46f0:: with SMTP id q16mr2664217lfo.589.1616509348014;
        Tue, 23 Mar 2021 07:22:28 -0700 (PDT)
Return-Path: <tomasz.dziendzielski@gmail.com>
Received: from localhost.localdomain (h124200.man.tk-internet.pl. [93.175.124.200])
        by smtp.gmail.com with ESMTPSA id l12sm2361037lji.122.2021.03.23.07.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 07:22:27 -0700 (PDT)
From: "Tomasz Dziendzielski" <tomasz.dziendzielski@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Wladislav Wiebe <wladislav.kw@gmail.com>,
	Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Subject: [PATCH] kernel-yocto: stop converting remote branches to local branches
Date: Tue, 23 Mar 2021 15:25:03 +0100
Message-Id: <20210323142503.11688-1-tomasz.dziendzielski@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wladislav Wiebe <wladislav.kw@gmail.com>

Introduced poky upstream commit:
14df6d53b6 linux-yocto: improve checkout error handling and reporting

Converts all remote branches to local branches.
Our Linux repo has ~4500 remote branches:
git branch -a | grep remotes |wc -l  -> 4575

This costs our best workstations ~20 minutes to simply do that conversion
in do_kernel_checkout which is not needed (at least I do not see any
benefit after testing with this patch).

Signed-off-by: Wladislav Wiebe <wladislav.kw@gmail.com>
Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
---
 meta/classes/kernel-yocto.bbclass | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 35587dd564..e3bc9938ff 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -363,15 +363,6 @@ do_kernel_checkout() {
 		git clean -d -f
 	fi
 
-	# convert any remote branches to local tracking ones
-	for i in `git branch -a --no-color | grep remotes | grep -v HEAD`; do
-		b=`echo $i | cut -d' ' -f2 | sed 's%remotes/origin/%%'`;
-		git show-ref --quiet --verify -- "refs/heads/$b"
-		if [ $? -ne 0 ]; then
-			git branch $b $i > /dev/null
-		fi
-	done
-
 	# Create a working tree copy of the kernel by checking out a branch
 	machine_branch="${@ get_machine_branch(d, "${KBRANCH}" )}"
 
-- 
2.31.0

