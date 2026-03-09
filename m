Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A697DEF3700
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 08:01:42 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9179.1773043293199855678
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 01:01:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bSlzCRV0;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439c5cce2c6so5036481f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 01:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773043291; x=1773648091; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l8vwxgvZq5hOSE4x7X/Rw7Auo0NT2Ug1C6WHA1Mk+0E=;
        b=bSlzCRV0bxBenjG5R8UOEH8qQKFSOKXy5871v8fOG4E6Xw8NBZ/RUtI0anmfM+s/yj
         bvegTyBs44HIAQFuAzRYvo3mmEcgRDbqi6MgCw20TvNRgUEhIj+8G18+BUoToQ7Efs90
         9VzngkSCJLQdtYM0mjaB8CpqZiQ3cnR8Nl2zl2gejH1no2eLdXZiAWRs2KV1GepCLeP6
         72EK1CpKr5oTdOaKYtLhJb/qE7AtZbGXcgGloHlVfHJM+pM/tF0y491EL94/eq4HMSRB
         LfQd2BG4aqq0W+c6k+5jPwt0m9Zr0UV7+o0iHKFbjn14Ses2rGi042cQgUiqjEQb17lA
         4osw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773043291; x=1773648091;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l8vwxgvZq5hOSE4x7X/Rw7Auo0NT2Ug1C6WHA1Mk+0E=;
        b=itCiWysmoGcBqFrJBV+WfsksOYCVt2Or9tKORCRmx3XtHDjdB9wZPtOxdIaY5wopEN
         iTIc7xvJJKq25TlmvdaXqCnXyA9REYlvXsP3UlHisXZkzkX4YeKIWjwaKukQXrSdY55U
         qo1c/HtZnc3r9MVlAVFDTQKSPz+hLjUBOcbSJGtkVLqOwAnCLGXpedutpK1PMIZEgIcK
         JwUlCQXWSR8giajp0s9gY4/bjHY3DCsWQ+4LxRa2CjxrH91rwutof9hPsl0z3uNSee11
         TiUQJNGx/Xzx0fzejVfj2Hs5siwdcO5WQl6NgRLf1kjPKCq+QEK/cdjC+XxFEu9C1vCo
         ifjQ==
X-Gm-Message-State: AOJu0Yw7GfymA7AVdxtC7z4PmFtb/qo9UUxmuZvCtYkqNc6DVlUywsEV
	45BlX25aPJkdN5v5Y4KuGx71QQ4Zy2MhJlWY6p/hEY8rkCnYp4aeC6Cvf/Iwy+kK
X-Gm-Gg: ATEYQzxOsGgkNWjbAwoosUhSkqKyQs4qE/6X8g7MD4CDQKf7TMSQmdzSOACG4LSpDE2
	50oUP5mE5DDr/mspX9dz6ZHxUXPivlhnUJRDSRitKktVLaDxPDB4u87AD9rs7pftlcywsCyGgcA
	HM4bYyDKynnetH/Jy/CLSSJu+mVNT1JHO+dVBkfMWDaPkW+EbgevImLer4F4aFGoD5kScjjjzvy
	HsdzTYa+LlRGp1z9dq/Ma0H1mcjN/mfpiZNl7tRKOTsQs3RdjmZxKlWCbVGHiuiz3uo0QukUSgV
	YhKb+6E4SXlygyvwmc2S6RS/Ly57DKZJncd3PokepRcdvwCJFyZTn/PnXiMZitg68fUZP/lHgdM
	IcdV3abUrY/3hkAtjh80yHum/sJqM6xkcM8FNttVZFnJYF1cvXWzaSyt3qGUX0KoHKDvy8aPpV+
	ZlGpvDBFKpcFpKDHAMykVRo231kQ==
X-Received: by 2002:a05:6000:3113:b0:439:ba75:7dab with SMTP id ffacd0b85a97d-439da65450fmr17909985f8f.9.1773043290794;
        Mon, 09 Mar 2026 01:01:30 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad97abasm22419514f8f.10.2026.03.09.01.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 01:01:30 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [scarthgap][PATCH] lsb.py: strip ' from os-release file
Date: Mon,  9 Mar 2026 09:01:26 +0100
Message-ID: <20260309080126.470598-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 08:01:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232686

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
index 3ec03e5042..1fc3b968a0 100644
--- a/meta/lib/oe/lsb.py
+++ b/meta/lib/oe/lsb.py
@@ -16,7 +16,7 @@ def get_os_release():
                     key, val = line.rstrip().split('=', 1)
                 except ValueError:
                     continue
-                data[key.strip()] = val.strip('"')
+                data[key.strip()] = val.strip('"\'')
     return data
 
 def release_dict_osr():

