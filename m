Return-Path: <mateuszmar2@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85682C61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 18:43:39 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.25257.1675968215729341205
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 10:43:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YFaOiyGw;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: mateuszmar2@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id m2so9175275ejb.8
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 10:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hxwkRiXABr9EUV/AEBLCMSWQO7e4SRd7Ps6o9uaOcF0=;
        b=YFaOiyGwZCnZq11Q2qKfLcpEYwfVeEan3c4Y2jGjJp+JWsuOyNOw6ZZBw+d83fvkwk
         JaK/yWKZocFzYx8kuRLrLh+9MLuRfxMysOVr0KkDDaQCRQmfH5r96+NmZn1D7ORQZ44H
         peAgwodBHGdGQiN+x9NVbX5yREz8Z7+RbN+HhhyfdgD872WEwGM32QeXQyWnemrQi/fu
         C7QEP14+Um4P41NJ2FuoCqjZ3NbsN6SZUKndXPcueJEDISHVg+AvTuJ1PvG5xxPD2SP+
         lWmLjlTtoG/xR3Db1Z6rzdy5+MN5S+VUP1VHw9hk3xs5C+vsKogW+X2UOygRsWeyPjKa
         WuQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hxwkRiXABr9EUV/AEBLCMSWQO7e4SRd7Ps6o9uaOcF0=;
        b=2mITgezUnsMBv0HQ5NiPuiMhs+cD3B7TD4oXYEI9GFmctLtf+Cl90lHyYNr6M9L4z6
         +1hpgfl2x+66luV8pH3f3puIhqjKvQMLtYKPcPe0PPTKq21/1P461RtJcG77DMjwiIca
         KXOZhj9xbsdnQftcfdxzBES59SXjG3PERQIO3quI1J/Xw7IZf7uiDZzbQWJNm58W1Q1E
         lZrjCANIANUs5enMoX7J1wfNKIqUdO2aPKcwaKYK4Xl5wArRXvxteByyZnO6k90LARVU
         uEgnbF6cqoAiMObCIcBghDoSRj+gGyTSc+mEzTY6OL91MR4z+IxiPP/7QB6Gx2ds96am
         YJ0A==
X-Gm-Message-State: AO0yUKUedZys3w7wxeC+YUmsDYP0+w1/GfcRSqKjkh8MlSI4l4jd0h7p
	X3sso0FERJqT3qcl5x+AxbW/rDrUcrft8A==
X-Google-Smtp-Source: AK7set+qI4HRQaMM1LJAW5BUR+mvIqi6+7FFZLm3ReSwFFbI7MFlzS1xUdXMqLN6ibjYEqh5dbwn1A==
X-Received: by 2002:a17:906:6bd4:b0:7b2:757a:1411 with SMTP id t20-20020a1709066bd400b007b2757a1411mr7544242ejs.9.1675968213932;
        Thu, 09 Feb 2023 10:43:33 -0800 (PST)
Received: from mateusz-gf75thin8rd.NAT.wroclaw_krzyki.vectranet.pl (178235146058.dynamic-3-poz-k-0-0-0.vectranet.pl. [178.235.146.58])
        by smtp.gmail.com with ESMTPSA id 7-20020a170906300700b0085fc3dec567sm1216131ejz.175.2023.02.09.10.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 10:43:33 -0800 (PST)
From: mateuszmar2@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Mateusz Marciniec <mateuszmar2@gmail.com>,
	Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Subject: [OE-core][PATCH v2] sstatesig: Improve output hash calculation
Date: Thu,  9 Feb 2023 19:43:19 +0100
Message-Id: <20230209184319.332814-1-mateuszmar2@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 18:43:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176969

From: Mateusz Marciniec <mateuszmar2@gmail.com>

Symbolic links to the files are included during the output hash
calculation but symlinks to the directories are missed.
So if the new symlink to a directory was the only change made,
then the output hash won't change,
and the Hash Equivalence server may change unihash.
In the next run bitbake may use an older package from sstate-cache.

To fix this followlinks=True flag could be set for os.walk
but it can lead to infinite recursion if link points
to a parent directory of itself.
Also, all files from a directory to which symlink points
would be included in depsig file.
Therefore another solution was applied, I added code that will loop
through directories and process those that are symlinks.

Signed-off-by: Mateusz Marciniec <mateuszmar2@gmail.com>
Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
---
 meta/lib/oe/sstatesig.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index f0224454c9..71b71cec31 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -652,6 +652,11 @@ def OEOuthashBasic(path, sigfile, task, d):
                 if f == 'fixmepath':
                     continue
                 process(os.path.join(root, f))
+
+            for dir in dirs:
+                if not os.path.islink(os.path.join(root, dir)):
+                    continue
+                process(os.path.join(root, dir))
     finally:
         os.chdir(prev_dir)
 
-- 
2.39.1


