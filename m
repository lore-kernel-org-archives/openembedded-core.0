Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98719C83F15
	for <webhook@archiver.kernel.org>; Sun, 27 Aug 2023 20:52:44 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.124.1693169558741087397
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Aug 2023 13:52:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=u9CzDUEZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-68bedc0c268so2320530b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 13:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1693169558; x=1693774358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KQ7LxSsZy+NKl9Qn+FaGJQPZoqtR8SRx0lhFZsmCQdY=;
        b=u9CzDUEZXu9DsGEwesvjVga0uZ8jerL63x+aLXmLKFanRf3VJOB5VmR1qcvn4w78Ah
         V1ettDneiSSFZjB5Y+o+LCJhii6akmB9O6UkQ4ONs1GGJ3moQpTYEgR5nnY0ZGsiihWg
         /EASy1h7+/9tuLvwzd9gfw7uwyYXaBNwtJ0hHHzUwuZelyoogyIj9ZAVITCzvc5lgdEj
         0Yrzuie6eTwCK7cqjOjNQE+Mb5i0qm4NZ3GxTNPEZbm/YFnORFaeGc6fe5sNIjDyYGdh
         4EniuXEjuKIKdu7RblcHDCa/WKeldIvjggSyXRJtvgvetJ41qOlJTEIXIr+9KQfpYypU
         P1SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693169558; x=1693774358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KQ7LxSsZy+NKl9Qn+FaGJQPZoqtR8SRx0lhFZsmCQdY=;
        b=KvNlrTYh5TfGxvVoocV9RlojCantMp4usUMsxuMOqhUxGDEthCj9Lfj5PjnU4cOApE
         v+48+ySWbyZuIkQDhw7jgGH2ZR8qGbVwxS2iEMZA02m1s9hCzLaMN/pRJdZFldtn5Kd3
         Tg+Fc+H9EH1FTET/wk4xlRCtY6IIBQipwuo7jdzcVt2+LeKjrSPovfnpCEdtXA1ZlZBC
         mrlw3gyYDnaFbgqm/3BTUvDEHRVPEgZYINQfkBXGuvSUZMvV32P7ulZhNHebYcbcCjHd
         2qX1LOMBBFhe0HKoT5Lsm4hg9N0H1OSyaSj4F75cTcMiAWlRJ+PML3HRbJ+VuCsaklUn
         81uQ==
X-Gm-Message-State: AOJu0YwWt+MX+MK+gTOGhph9mrDbGTWaAxLxoFVFOUmVhEQRp/B4kEaw
	LDbVU19y7KkUDE28j2jaElynrSUGsWP0Ekdi7SmKAQ==
X-Google-Smtp-Source: AGHT+IEIkRMrdf4szDsIjSW4IwUM0oSP8++fuqZQpmwzdFmqys9smzZ3wa1w/ExJFbR1KQIjetqz9w==
X-Received: by 2002:a05:6a20:12c2:b0:147:c29e:4c3b with SMTP id v2-20020a056a2012c200b00147c29e4c3bmr31759117pzg.53.1693169557843;
        Sun, 27 Aug 2023 13:52:37 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id p2-20020a63c142000000b00565dd935938sm1220684pgi.85.2023.08.27.13.52.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 13:52:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/8] ffmpeg: add CVE_CHECK_IGNORE for CVE-2023-39018
Date: Sun, 27 Aug 2023 10:52:22 -1000
Message-Id: <e787e364efbba372675081aadd802b43274097f0.1693169420.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693169420.git.steve@sakoman.com>
References: <cover.1693169420.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 20:52:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186797

From: Narpat Mali <narpat.mali@windriver.com>

CVE-2023-39018 belongs to ffmpeg-cli-wrapper (Java wrapper around the FFmpeg CLI)
and not ffmpeg itself. As per CVE description, it is mentioned as FFmpeg 0.7.0 which
is the version for ffmpeg-cli-wrapper and ffmpeg don't have 0.7.0 version at all.

Debian & Bugzilla trackers have already marked as NOT-FOR-US/RESOLVED-INVALID.
As it won't be affecting the ffmpeg package so, we can ignore the CVE-2023-39018
in ffmpeg recipe.

References:
https://github.com/bramp/ffmpeg-cli-wrapper
https://github.com/FFmpeg/FFmpeg
https://security-tracker.debian.org/tracker/CVE-2023-39018
https://bugzilla.suse.com/show_bug.cgi?id=CVE-2023-39018

Upstream master patch:
https://git.openembedded.org/openembedded-core/commit/?id=c21ed498b423c13463a4ae0bb475883cc7901847

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index 6ece34fcfd..1295d5cdf1 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -33,6 +33,12 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
 
 SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
 
+# CVE-2023-39018 issue belongs to ffmpeg-cli-wrapper (Java wrapper around the FFmpeg CLI)
+# and not ffmepg itself.
+# https://security-tracker.debian.org/tracker/CVE-2023-39018
+# https://bugzilla.suse.com/show_bug.cgi?id=CVE-2023-39018
+CVE_CHECK_IGNORE += "CVE-2023-39018"
+
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET:armv4 = "arm"
 ARM_INSTRUCTION_SET:armv5 = "arm"
-- 
2.34.1


