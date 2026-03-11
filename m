Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87801112589B
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 19:27:45 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4875.1773257262258247127
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 12:27:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=riFRq47a;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439c56e822eso243496f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 12:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773257260; x=1773862060; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YGnVqFYJL3fZw0Y22jbWMqVE80Z5RvKp0Pyuslu9W6A=;
        b=riFRq47aAmaKBUsig2NB6k1s3vXBs7zN2hT2DNGXuMIY20SlTham+/mpCylwDKNj5i
         aPYN2TB6gTqfKWEJ9ejF7nM919fwz3v6uW0yHa9HfOuaDNLvSy4Xu2pnqFhRnSs0T2KE
         kB6DqCauCb41CN7IugA6DyqixvSydRzekxlEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773257260; x=1773862060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YGnVqFYJL3fZw0Y22jbWMqVE80Z5RvKp0Pyuslu9W6A=;
        b=I6NUVHcF0ryMgiOvEWwtrlhINQC5PjHEYx0DLS/FdM3vZjpUzQq0Np9Cff8p9zJ9Zl
         lHYyNx9+OUF2o1zPNYBmh41cHrNoO+7U6LUSoClCCE2fBf0fhUpUbOn/HDkOQlPOTQZt
         HCOXbEkOc4PE0dH67Vkjg8H6NcSuda/QgBm3gIyvClfHT2MJGWLybyyCiT+CNokMoe7b
         b9u0CX4/UEWoh0voicW6ivvtWEiKx9wzBOLrf+RN6V/IquR5OIXTbMonnZn8lck9N3uK
         /XyBR6lvGzIO2frMfrCYmaHk990K0LTVG2EXIv1YJhFxAFZom20wwFzRlnp6h0E16b7e
         oO8g==
X-Gm-Message-State: AOJu0YzLwgCmqgFByClmBdnwrXIbb01mcjPA65MDCTdvn4cg5/+/ktlu
	kXzCKG+3k2H98JGUKiaQpC/36dQwwb8m9VvZQfhte8KVVGo7/8cUdyha5rarW8UEyIg2pVxlsYX
	iQK77
X-Gm-Gg: ATEYQzyEreWFW+2UuKK7zHbk4b9KZ3cX9SdXlarq5vNovanR2Gjj/5zuWB9thGSw/Py
	tIK8io8FqAnsTpxGe11SpWq/kYh37Mc31A16iU+phb7cOHtFPKrNt3xEw8hah9jOX97IJLYyK2e
	M3NeIpbQctYF43vDew3eSp6kKFNs+uS2i500nBaoy6IYs5hfyPCLRT1nr6myhoCtJ4ADeyUJ5L4
	Jw6skEGMxruiHSuJg2CatHXs+OLA7GM52zJYeUDQmT/5oz6nCtvPsbeX+LTGtU91Cdw5Q1U34Mk
	fIf7PsmL8zdxzv0ulynBuVUgyUsMBe2Q+4V1Ljhf1x4DHLF9VyUcm6Rx2hWFgE+bmGoLECSD0Eu
	y+AZuNYDNCjkwPePB0uqI+knaVOexs3YuIQSYgSxJnrlRpsxpLr71g+DWmUCuxpHs8kQ6MWpN1v
	fMScgqaKABzvOnNI/LQBsXjuP/iOmceOlxEcDS42tCkH0kvujArJaMK/2srXplApruliizNbxnD
	3YjzSuYSX5vvuk+8Pyw6Lk6+ks=
X-Received: by 2002:a05:6000:2dc5:b0:439:be78:e1e9 with SMTP id ffacd0b85a97d-439f81c0248mr7558504f8f.14.1773257260333;
        Wed, 11 Mar 2026 12:27:40 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe22f3a4sm1452450f8f.38.2026.03.11.12.27.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 12:27:40 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 6/6] lsb.py: strip ' from os-release file
Date: Wed, 11 Mar 2026 20:27:08 +0100
Message-ID: <b37db2db1a03c856f7b4cc94e70b7e6c1ef437b5.1773257124.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773257124.git.yoann.congal@smile.fr>
References: <cover.1773257124.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 19:27:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232905

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

