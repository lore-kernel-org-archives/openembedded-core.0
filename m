Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4F7CEF3706
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 08:03:32 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9189.1773043411529883341
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 01:03:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K4cjwzON;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4852a8482fcso20009785e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 01:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773043410; x=1773648210; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ro592whFbFolqkdxMA2JY3Em96aOociDo5U9HaQCBAs=;
        b=K4cjwzONo6jnFsYlsri+ITe7hyjQ78lbOlKwHGMs4hdvK+mdDv605JUAyxWmV5/B7F
         7pxQD+YP/faYw2+uBxDp/Q0p28/goPP1ErTA5AKL7nOwTbUZ3/A9Z+iT01tjABIA08CJ
         RlJhDA6yA7JRmVH25Tm35PoCZb8LG5BxznduX9ObXVRJF/lHGfmnCZyPe1OQ7gUWO4on
         EQwaZ9vesEGMl/viw0XTJPLZz1rm8A39hpvQQXFdB2AvPF3lgJrxx9sF+BWRBtDaFNOL
         9SAVIQv9jBgUfzqfjn/Dghz/gbGzzbLXqc5zUSZhB4Iq4fJsjhEd/fquMX2kZthNvCv6
         tbRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773043410; x=1773648210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ro592whFbFolqkdxMA2JY3Em96aOociDo5U9HaQCBAs=;
        b=Oj3Es9MgBHHbYQZ/0ORqDDxJfK7BZkNWqVKeAwq874AVaKtiBzvtCaddoN5BYa7BpV
         1wLOmsL70fN4drw+l1qW2bzZ9tW+fuCzGXh1ctzZ6YLaXzgoelQpS+ySFbnZaJ3mToUG
         EZ6ByLiccmpX+jyHQm+5ZsolPluEekX0l4ExvG1StNMg2lTpCBB0GUoraYUD7HtovOGx
         mR3BTKnhJa/LGjnOyZ8/FgovIkfCQf3ARwc37zX18PTmStEcZUcVVssKppEtZi5bUtlz
         6cw2YeZ3PAetKYCjJTYeMTsLiB0U71VHJ+y2Y9r4HQ97fBM4JI3RAwlyrbJXVEZbBbSl
         TrBQ==
X-Gm-Message-State: AOJu0YxEFM2LYL/E8gD1do4KiEX/9I610efLv4DusF0XL4yhidHmnmsc
	sREKHIw/BDsokqPNi4M6ivsHsnwkVjFqn11xXEqg7qqNIureoBhDK8M/VHlWveBn
X-Gm-Gg: ATEYQzyQhFQa1LKJsjyoBoyO939/GqwXujNFlL/xjCls4DuPuRvfuD7LpiP3gxnrci2
	jfN7oWtTYdwnJ0La9X0XTTKoWWZHvPMkhyA0ZkVzD58CduQu9+fukRKDuuNr13IT0leZ53O4B/X
	DDwas0Q9AERNQz5UaaTi9Mu0U2++n/AEHrw+sTkc1Ckhu5DQKAU6pdSNImeWO832JTRe7Xo1rVV
	7/FHggQ1c0yErocxJ//tgzfN3hnvBe6Wph/YU34kVXQ2m5hoL3SBiCGU3umMi/ZWYlm5ckqiGiQ
	1eu6rFaQGvnu5Q4DDEHdxI3g0W8ZkHJsbKmlY940+bgLGx1mORTka1FY0ZSAYx2gu0q2NwO3ZEI
	f3BVsFYEAAdJQ9ANfJcH7IXC3AqznuuSoXz6DK9HlBTXVY/Q+lkm1r+9EDvkf7x8UpmB0fu9uZa
	wbXyP+EcRe1IbjcVa6qnjCQH+lzNOWoWoagJzl
X-Received: by 2002:a05:600c:3f19:b0:485:3e6c:aabc with SMTP id 5b1f17b1804b1-4853e6caf6emr14138605e9.19.1773043409835;
        Mon, 09 Mar 2026 01:03:29 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485237e8095sm145030615e9.2.2026.03.09.01.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 01:03:29 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [kirkstone][PATCH 2/2] lsb.py: strip ' from os-release file
Date: Mon,  9 Mar 2026 09:03:24 +0100
Message-ID: <20260309080324.470847-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309080324.470847-1-martin.jansa@gmail.com>
References: <20260309080324.470847-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 08:03:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232688

From: Martin Jansa <martin.jansa@gmail.com>

In gentoo the file looks like this:

NAME='Gentoo'
ID='gentoo'
PRETTY_NAME='Gentoo Linux'
VERSION='2.18'
VERSION_ID='2.18'
HOME_URL='https://www.gentoo.org/'
SUPPORT_URL='https://www.gentoo.org/support/'
BUG_REPORT_URL='https://bugs.gentoo.org/'
ANSI_COLOR='1;32'

' were added with:
https://github.com/gentoo/gentoo/commit/2f590e35c9d3d13d5673163527120b2de97fdc80

before that the os-release file looked like this:

NAME=Gentoo
ID=gentoo
PRETTY_NAME="Gentoo Linux"
ANSI_COLOR="1;32"
HOME_URL="https://www.gentoo.org/"
SUPPORT_URL="https://www.gentoo.org/support/"
BUG_REPORT_URL="https://bugs.gentoo.org/"
VERSION_ID="2.18"

The ' is stripped from the ID later in distro_identifier with:
    # Filter out any non-alphanumerics and convert to lowercase
    distro_id = re.sub(r'\W', '', distro_id).lower()
but not from version which results in a weird NATIVELSBSTRING like:
    NATIVELSBSTRING      = "gentoo-'2.18'"

And similarly the directory name in sstate-cache:

oe-core $ ls -d sstate-cache/gentoo-*
"sstate-cache/gentoo-'2.18'"   sstate-cache/gentoo-2.18

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/lib/oe/lsb.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/lsb.py b/meta/lib/oe/lsb.py
index 43e46380d7..f2c3c0ff56 100644
--- a/meta/lib/oe/lsb.py
+++ b/meta/lib/oe/lsb.py
@@ -14,7 +14,7 @@ def get_os_release():
                     key, val = line.rstrip().split('=', 1)
                 except ValueError:
                     continue
-                data[key.strip()] = val.strip('"')
+                data[key.strip()] = val.strip('"\'')
     return data
 
 def release_dict_osr():

