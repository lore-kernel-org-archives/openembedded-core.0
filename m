Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web11.2015.1591320956344991408
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2020 18:35:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=o1qS5cYK;
 spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: bkylerussell@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id e16so7247200qtg.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2020 18:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Oqxwz6vLKxkEdKGwKGKLGYQFeuoLcq6cAsiDV0aZmqY=;
        b=o1qS5cYKPMdkdfecT0fngZRUwCNxYjP7m4XFhYLs8YqUFMbkKn9ilfT/rcmaTcBWkG
         sKIvTq7taad/WbRnXtewPDHwSlc/k9X6nFhoPEV1hnnDIy0PO6CtetZVeXfSp2+I6TRl
         lLOv41LzfnhgrK1Zo3OOVci4UqcXNSL6QT9Xdg4BVg5tV0HPGb4pVpfY2sj0XTAY8oHT
         A/dqWF5dPGPnS/bGoXOWi01FD1ulqOAk0OeOdv5L9nb80gnNtTGvDVOIJrmQqYU9hErE
         Y4uscu27WkgVpypnLZoZeXY9IJn6HFItg74UHD3APxKHXWxKy8JgKrgCFEdBkUt4Axpq
         LwgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Oqxwz6vLKxkEdKGwKGKLGYQFeuoLcq6cAsiDV0aZmqY=;
        b=KC30cHcEGrrqocY7C9ODsQGfAOetjjo8/AYhcUSNyAQE4XYL+FtdQOZxvLm9XlXgPg
         odrF78bHlie6KQiOVbvwxiGoI1EprK9P2SgNOPhhcJYkZYVkhQkGxnnP6qFgD6q+H/ag
         RucK/T2jm9/RMuza+wu5k3R2Pd2Qpc6CPIQ46hppMnFj80M0JDlfqeRRVxEnTeIwMIaO
         Lz3e0hbx02JfS6oJKpufkFHlhHu9l6Seht9j3tJZUpjdPDm4Lntjlj2bbZr5YerOKQ9T
         5CfLm52m3oPq6tNqzOoaiXmzA9UURgN/glgruIQ5970iAPIre6dKlHR8MQLCl644PDpH
         YYfA==
X-Gm-Message-State: AOAM5324zJABfjPP5C8MKs8VIDjsrIoB4DlA7HhluNA20qcsaTKW/xxT
	Pa8N6HKhdWYZVDJVhd8tM5WRSftZ
X-Google-Smtp-Source: ABdhPJyuiCIt/i/W+SwN3rbfIw+fL2HwLGinj059zLwKYks3JdxsA/5jZy5Nn/4MAHYGij5D2FLXtw==
X-Received: by 2002:ac8:4e4f:: with SMTP id e15mr7534092qtw.318.1591320955338;
        Thu, 04 Jun 2020 18:35:55 -0700 (PDT)
Return-Path: <bkylerussell@gmail.com>
Received: from poirot.lexmark.ds ([2605:a000:160c:8196:bca8:8efa:5506:d38a])
        by smtp.gmail.com with ESMTPSA id o66sm5959327qka.60.2020.06.04.18.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 18:35:54 -0700 (PDT)
From: bkylerussell@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: wesley.lindauer@gmail.com,
	Kyle Russell <bkylerussell@gmail.com>
Subject: [PATCH v2 0/1] patch.py: don't apply striplevel to git am command
Date: Thu,  4 Jun 2020 21:35:39 -0400
Message-Id: <20200605013540.18777-1-bkylerussell@gmail.com>
X-Mailer: git-send-email 2.17.1

I thought I had sent this out a month ago, but I can't find it in patchwork,
so I'm resending.  This is an updated patch that addresses feedback on v1, and
should hopefully be more clear.

I've dropped the change to 'git apply' since that wasn't behaving as I originally
thought, then I added a selftest on llvm that demonstrates the issue I'm trying to
resolve.  Without the change in patch.py included here, the selftest that I'm
proposing will fail.

One might argue, "Well, if you change the default PATCHTOOL, you could also
just change your patch SRC_URIs and drop the striplevel parameter."  While
that may be true, the same failure can also be demonstrated using devtool on
llvm without modifying PATCHTOOL at all, since by default devtool also uses
GitApplyTree.  So if you don't consider "modifying a recipe's PATCHTOOL without
also modify its SRC_URI patches" to be a valid workflow, devtool is another
common workflow where this behavior could be encountered.

Hope that helps,
Kyle

Kyle Russell (1):
  patch.py: don't apply striplevel to git am command

 .../llvm/files/0001-Test-new-file.patch        | 17 +++++++++++++++++
 .../recipes-test/llvm/llvm_%.bbappend          |  2 ++
 meta/lib/oe/patch.py                           |  2 +-
 meta/lib/oeqa/selftest/cases/bbtests.py        | 18 ++++++++++++++++++
 4 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta-selftest/recipes-test/llvm/files/0001-Test-new-file.patch
 create mode 100644 meta-selftest/recipes-test/llvm/llvm_%.bbappend

-- 
2.17.1

