Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web12.188.1630174457546892000
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Aug 2021 11:14:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=162PfWRM;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.180, mailfrom: steve@sakoman.com)
Received: by mail-il1-f180.google.com with SMTP id i13so10893543ilm.4
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Aug 2021 11:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3Wc/QiBQyG3NrYnjh70xhAgUh7bwbAWF7r4SRaGv3go=;
        b=162PfWRM0u5ah52PHhdAmDFK0iXNtEmpzMdhZnEPpxalYp67pEGnDq9T+jrykn7d5r
         Z5NFkTnmARLUneeljryAR15GtAuyr9UK31+50eLuJOxWuDR9qZegpX5fVOc5zn9DgCjm
         rQSMeCUyMn81Z7D7b0QJNjpzV7/TaROnyiNXo7+QUomHSlOjWKh+g6IFWn7hwnnsmyXm
         JmnXJyjKQ/DcW80MPjRJStOjOuLlbpYGfV6tjjRItU4KGMe3IP0D4ujB3Dd5PgBSR17w
         0wXJmEnefILbjbbaZuQD4HtJsYvlb0Af1C8+UpNuQfFsMBgARruWNZkiZVnjZrXUgLSR
         BTrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3Wc/QiBQyG3NrYnjh70xhAgUh7bwbAWF7r4SRaGv3go=;
        b=MhRPmu1uMYi9+ziesXbBwgWPomy3khIK8A2XEngs86awhYyDbA5AprkcTHAKaxHoNy
         en7Y7ehRRbQbGt0P7x9lTgMV34CiF1tNS9iOxv1gmNaibs8U/mDHk7pOMD+Uau6a/EpH
         RlCUhZEf4zHVIj9sz9qshj04UALkyTrrM4Qf24MLpU/+Z/YKD1KS0rnhY0VB971iJdNL
         4pwJpwpIA65LycpnhqP+rN1CCt2UR2VrI3pxkt1DddXYuqtOke54NrCul9gZqogW6P1W
         g5HHg4FuDr6i4CYKWItBDsttQ3BsGhTzICFwXG9cgD1GRm9AdF7AAi8Flp3q1RPTSeOS
         9FXA==
X-Gm-Message-State: AOAM532o704iwVUzIipErTdDpxPPthCJbxBS3hthoXogubbyc+tUm7Di
	IjKJLcN5QAMUQnAInNMho6yk6z8pjRQ8ztiu
X-Google-Smtp-Source: ABdhPJxDCBmTE2bttuBw6f2PwDs5lEddfVvHR5ZdhaQEWNgSzrkZiwBoQU1xY95Dal3M+ZOOOUoG5Q==
X-Received: by 2002:a05:6e02:d06:: with SMTP id g6mr10884184ilj.153.1630174456532;
        Sat, 28 Aug 2021 11:14:16 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s16sm5511664iln.5.2021.08.28.11.14.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 11:14:16 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 28/36] utils: Reduce the number of calls to the "dirname" command
Date: Sat, 28 Aug 2021 08:11:16 -1000
Message-Id: <912c9eda653c45fee2f55092fbe281efba897bc0.1630174149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1630174149.git.steve@sakoman.com>
References: <cover.1630174149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Popovych <opopovyc@cisco.com>

utils.bbclass contains create_cmdline_wrapper() function that
creates wrapper script with additional arguments for any passed
"$cmd" command, and uses several calls to "dirname".

Because "dirname" is an external command, in cases of lots of
calls to wrapped "$cmd", each call of "dirname" will incur
significant overhead.

There are three same calls to "dirname": one for saving it`s
output to "realdir" variable, and other two in "exec" command.
So last two "dirname" calls can be replaced with cached value
from "realdir" variable.

Signed-off-by: Oleksandr Popovych <opopovyc@cisco.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4b9cf2c80fd14386e0b88a2e6c40a9fa3f1ae0f7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/utils.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index cd3d05709e..99f68f7505 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -233,7 +233,7 @@ create_cmdline_wrapper () {
 #!/bin/bash
 realpath=\`readlink -fn \$0\`
 realdir=\`dirname \$realpath\`
-exec -a \`dirname \$realpath\`/$cmdname \`dirname \$realpath\`/$cmdname.real $cmdoptions "\$@"
+exec -a \$realdir/$cmdname \$realdir/$cmdname.real $cmdoptions "\$@"
 END
 	chmod +x $cmd
 }
-- 
2.25.1

