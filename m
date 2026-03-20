Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BEA5109193F
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 00:28:37 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2621.1773966511638006081
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 17:28:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=w3iF4B4g;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-486fd27754bso6837605e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 17:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773966510; x=1774571310; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YGnVqFYJL3fZw0Y22jbWMqVE80Z5RvKp0Pyuslu9W6A=;
        b=w3iF4B4gpOv+robX77NOV+K0QsAN8aL1wTyJOI6xOatjoz5rwb7ptMgkmxBvq5mUY2
         O8sj1LEdzDnKTmR5jP1/jan8dn06d26VAKQIpg3qYe14clRHR9eRnDXgG7gJhh/27S2+
         e8CmNtCSi0wk5wccpoGlEmgX0X8k3YKyRgHqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773966510; x=1774571310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YGnVqFYJL3fZw0Y22jbWMqVE80Z5RvKp0Pyuslu9W6A=;
        b=BvJ4s1byqyWnCBN55EnaxqyasH5+ozXncGV8ijxPvXmimZOgL5kd+QeIAFPrXfIp0q
         npzx8tVZbdSh70XpRtELO5BwcbiaWIZEtwb2HXugGLXBV2QdKnfOIpaQRne5CTYzJ2bG
         FpsEWKAIyM4jaEtHgAU5xKH2myUwB/hCjgYGIdq+sMFUHvEMB1g7krKjrfdMq4uM/R4J
         NN4C9fryCtqJ9I2gzQkyLNlYiXZ3FSA5nzpSXL8BrBkeTp5v9Eog73PhSn7H+Av5tUkx
         Ds2DLjXpECF2Ju4NKYgstTNbgdD8xnrg+lCNgphNtn9Y6g5pQ6pwA0HstEtFWbvzumK+
         opPw==
X-Gm-Message-State: AOJu0YxO4MAnAONilpi9iaaF4yO0w6z83+Xz9VdWgc/ZhPmuwkTEoNzK
	h/P1VWMbwuHFgrbaiZr8EzK0d22VSEyVUqzCLPX8kO1VlZzoX9DgXCo4QLfju2t+1dArTDD809j
	agXLn
X-Gm-Gg: ATEYQzwn9vyzfzk0GxrPxto41T2KoRKBQ+nc0+DvkGYGUa06v1D0XJTfdh5WkhkOpPf
	2ZJicQmxZAEhTqeqrcKRA/aYCq0sEhWle1gKsyoTzL4/vbCFJwAfQgaJe57tFCdPmwOWafB8IVU
	JF9UPH7RPWupTCENaVcwJscTKfTjWYbYk4boFzB7xDyz3EToSz17q7zNKGNS9OOcop3HyB3nRDT
	Wyr8hUKWOwrSbo4HbstrCCiNeEQ1JeFjP11IhDJtKPNZDOw16Q795zIFU/us33xIBVktmHRaO/R
	Cc2OTtZuxT/Dsm/266S1EFfnEcUtWpNLVqjiuZrrNM6lRRj34j9DoKA7DnAxfxoI463bSUWXkdr
	uSeImGTUFe98i0o3C7wSHMIbFhNM6T3DJVK+Fkk0Owdz2jpcOTiK6Vkv5+7PJxLqKsbsBsS6Uy+
	oCnWYNDgE79G67tT69darVWLCin8dGEk5GGDm6XAcjKWW6QMMSiQ+vl+9A+Z2APzWMmOgSvZv8/
	NuxBXW5WzAqPABdDtu3MdRLDpTBUdCwo7PsEw==
X-Received: by 2002:a05:600c:46cc:b0:485:3b9e:caa7 with SMTP id 5b1f17b1804b1-486fee230d1mr14103695e9.23.1773966509730;
        Thu, 19 Mar 2026 17:28:29 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe8359acsm23850655e9.12.2026.03.19.17.28.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 17:28:29 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/15] lsb.py: strip ' from os-release file
Date: Fri, 20 Mar 2026 01:28:10 +0100
Message-ID: <b33b40496b44df3988451468f5d5a7ed6a79a3b8.1773966414.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773966414.git.yoann.congal@smile.fr>
References: <cover.1773966414.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 00:28:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233564

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
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 55f82653deb1ea8f1304fcba4d588bd55695b616)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oe/lsb.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/lsb.py b/meta/lib/oe/lsb.py
index 3ec03e5042b..1fc3b968a0a 100644
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

