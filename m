Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D38D6F364CB
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 22:08:35 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.143827.1775772515014407127
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 15:08:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=EwvIZ8W+;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-488ba6366a7so16589485e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 15:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775772513; x=1776377313; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tKZ9G/NdOtagwAPvJOKTWSQfsxyhuSqzb1tWjjrrk6I=;
        b=EwvIZ8W+AAi7KWtLfM0t8Zfp0vZxpCGMq7fj6gg9kK0DU8lXpHZ5rNraKM5ENFB5gB
         JkJqmtEprQHyK2qKhfFAj9lQFBaJVwoTAeCmJ/Vg1XfcuU2Qlxw9xHUKLJxkbFMWcDfD
         LA6h49uWW0fRS4ehhFdIOM8x8a296hDi0Whq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775772513; x=1776377313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tKZ9G/NdOtagwAPvJOKTWSQfsxyhuSqzb1tWjjrrk6I=;
        b=TDD3eNTKjj3K7p+43fC2k/fHACk2lMO5wxXjawPQFuxH56wN1lu4gextxq4z9koP4w
         vf+1dfepg3YDgsMt9P0P/CiW2aB7tc0IU/MWrGVTzKbmqANQ0HlcAbq0OMzGkgiY5iiK
         BVA71KoRLKGTwc4yqNz3vhzOou/E/29Wx1EPLX50JjNiGnLor3vrfZeXVuqTrxCSDRvA
         s0zKAT+HaG6WsWhPfgGQ5V4zqPcw9aoWu6tlsjKlRYDkwT/mZ+j5B4JLZCNtW702dEgW
         QoZqiwQNHGF4GXZzeZSeuU20buW0gTpA+4YnQC9HMINqXm4gaKr/fwCMOMpktpm3x/8T
         Muog==
X-Gm-Message-State: AOJu0YwK6LtaCMZjIHviY3LYra2ySgLIwhfBArscNfWk6jVOgSHXa90f
	lKydWpqxKVbOfS5WaH/nUlfaNhJKyCYrSs6AxUjjXDEk1Qj7mvmXWqrJXzlcvi+jdCGq1FjDIF8
	t/uLlBZ/fbymA
X-Gm-Gg: AeBDiev+oMSemJdYBkWQxhS2Kg5xZTY4dnoCTSuL1Gew7ZXNReUvNBUXIH2eufFHImW
	Mb7rbt8K1yYsihvakOoustMEBEQPjcJlaxxaWwnsNmlbVo3GWCHVcNjt96+megXnhxc9z+jF2x4
	Qn0KxFEvGa+L9nnPhjnqo7V6CNp61S3wR0quXMKv6iYgSZg98ALiT4zuakl/3uFs1ZfMAc3qJkf
	tkLf/PfQaQ6IhgL7K3md9UIMYluBfmSYZjK4lNMIAgFaubc2o62WDkem7P0AQtdw6P+1dfmqzjU
	0p0I3LoN3SyI3kmj9olr0KzecTgPqZtg/CkGckPfAKZBis2oftEmQxxr/BRmGpIyHBt2KAb7hPH
	GsnZT7FRMVX7oagUX1SZQgZUqRQFzXkquEjPtsEfXz2baVVPuIcsaPcXZ0Bwhuxn7IqS0/P8T4d
	HDkI1rPPu9YQz4Trl59qtCJd4Ilyd8QqiXG9jh7lCT08S9oNfTVlv0Euf2oDvCygaWBeSNi5/Jk
	qsZzBo8ktrZBNVig7Q+BULShHs=
X-Received: by 2002:a05:600c:c088:b0:486:f9d0:aac8 with SMTP id 5b1f17b1804b1-488d6843187mr4175565e9.18.1775772513184;
        Thu, 09 Apr 2026 15:08:33 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d58bb830sm22123045e9.7.2026.04.09.15.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 15:08:32 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-core ML <openembedded-core@lists.openembedded.org>
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH v2 5/6] recipetool: Recognise https://git. as git urls
Date: Fri, 10 Apr 2026 00:08:18 +0200
Message-ID: <20260409220819.2427583-5-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409220819.2427583-1-yoann.congal@smile.fr>
References: <20260409220819.2427583-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 22:08:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234957

From: Richard Purdie <richard.purdie@linuxfoundation.org>

If a url has git. in it, assume it is likely to be a git cloneable url
and should be treated as such.

This allows us to switch from https://git.yoctoproject.org/git/XXX urls to
the preferred https://git.yoctoproject.org/XXX form.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cedc9209e3bae0da8d61423b16c74c49a132aa63)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/lib/recipetool/create.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 7b4c501456b..c4b99619f5e 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -366,7 +366,7 @@ def supports_srcrev(uri):
 def reformat_git_uri(uri):
     '''Convert any http[s]://....git URI into git://...;protocol=http[s]'''
     checkuri = uri.split(';', 1)[0]
-    if checkuri.endswith('.git') or '/git/' in checkuri or re.match('https?://git(hub|lab).com/[^/]+/[^/]+/?$', checkuri):
+    if checkuri.endswith('.git') or '/git/' in checkuri or re.match('https?://git(hub|lab).com/[^/]+/[^/]+/?$', checkuri) or re.match(r'https?://git\..*', checkuri):
         # Appends scheme if the scheme is missing
         if not '://' in uri:
             uri = 'git://' + uri

