Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8E9DC48260
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 14:01:48 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.23032.1706104906085955032
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jan 2024 06:01:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=aFpkJq/Q;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6dbb003be79so4714608b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 06:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706104905; x=1706709705; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=49JsrqzRkgKEsDGeY6XJXdAHleU0+KGttIJmkGr/9aM=;
        b=aFpkJq/QrEU+5sE5MstrWbDZeYBEJvUENj7/NoZi6rfcc+4gZVceFVkQdu7QeMYZBR
         ZyRTdBPFFiH/StpkepWhQwEN5QIBI6Fcbzc0uEU39olbQVgHVq9Lb+H41w7dg+C/g8cn
         DnQFmNXcrNcJFDU7heKZmshCKAOni11Q3NCIxVsr4MHDp4QLfT/KgGxxt04xt5A9kkXL
         xsdPu/qtW4hhICy29KgsLfR7tFzHmmmN2mfkBxcOluj5n7ZXMsyCx72wc158StsuPDYI
         vE/b1eISrckoVCVzktgE/9GLvl+TUnrbhSA/iQ4e8j2I/U+lrbRRkIiTQdDUgMteApTg
         CCsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706104905; x=1706709705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=49JsrqzRkgKEsDGeY6XJXdAHleU0+KGttIJmkGr/9aM=;
        b=Kib9njIHP9Mtoo+yzD8temLNN6+LBwttplbrbZdcFUp8dYMutHvKDMcBGaJAX3hi+W
         LNWLrSJdxzDI1md58HIJQ19L/qFS9oUZhDjb/Zg8Hejdc43Gc/VOOzrOax2jR10hLut3
         fldvV4HRk3q9mS24gxd9ZvP/ie79ZvL2Oz787bI2W0a6ZoKC76lGG8aNC6VzuJEZH8MQ
         lnn53LLDV//9dpnH8u4RUNwc4XQ3i7brZn8MWuK8flpYY5RWMZquOvz0NyOG0V3/Yujc
         CnBC6omcKvy4dv6e2yAlObDk69DOJnv9QyrqzGvdfFVEam7iWVkRBSUU4cRwzBRpPjQH
         Bdqg==
X-Gm-Message-State: AOJu0YxYpyMdTi7U9+f1iF8pkcS+b/jfssOlJLSyvTnxfI2Z9uPs6nd7
	1U6QBZvLE3Ne8K1eZbTPhCReT/a6tHGJu/ijO6qTDZ/YV1a8JhEdhto8EndmfGuSikOnx4yT+DY
	MfQ0=
X-Google-Smtp-Source: AGHT+IF2BdP4I3ZQ5EhYdikplnkEBuxywCJFkO6zTMjuAGOzXU4Ph0RQ3u9dmiVoGwWYxPAirsEmeg==
X-Received: by 2002:a05:6a20:3d0b:b0:19a:37be:1af9 with SMTP id y11-20020a056a203d0b00b0019a37be1af9mr1219539pzi.43.1706104904590;
        Wed, 24 Jan 2024 06:01:44 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id 8-20020a631648000000b005ccf10e73b8sm11535739pgw.91.2024.01.24.06.01.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 06:01:44 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 10/12] devtool: modify: Handle recipes with a menuconfig task correctly
Date: Wed, 24 Jan 2024 04:01:13 -1000
Message-Id: <91192e861f0f764799f0ae9943cf387b18c70820.1706104658.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706104658.git.steve@sakoman.com>
References: <cover.1706104658.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 14:01:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194286

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

This avoids the following error when running `devtool modify` on a
recipe that has a menuconfig task, but does not have
KCONFIG_CONFIG_ENABLE_MENUCONFIG set.

  .../temp/run.do_configure.4163366: line 152:
  ${@ oe.types.boolean('${KCONFIG_CONFIG_ENABLE_MENUCONFIG}') }: bad substitution
  WARNING: .../temp/run.do_configure.4163366:152 exit 1 from
  '[ ${@ oe.types.boolean('${KCONFIG_CONFIG_ENABLE_MENUCONFIG}') } = True ]'

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e87e6fa84a0c4b5ac8e736dc62f6e08390ba2436)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/devtool/standard.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 55fa38ccfb..0126f75022 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -971,7 +971,7 @@ def modify(args, config, basepath, workspace):
                         '}\n')
             if rd.getVarFlag('do_menuconfig','task'):
                 f.write('\ndo_configure:append() {\n'
-                '    if [ ${@ oe.types.boolean(\'${KCONFIG_CONFIG_ENABLE_MENUCONFIG}\') } = True ]; then\n'
+                '    if [ ${@oe.types.boolean(d.getVar("KCONFIG_CONFIG_ENABLE_MENUCONFIG"))} = True ]; then\n'
                 '        cp ${KCONFIG_CONFIG_ROOTDIR}/.config ${S}/.config.baseline\n'
                 '        ln -sfT ${KCONFIG_CONFIG_ROOTDIR}/.config ${S}/.config.new\n'
                 '    fi\n'
-- 
2.34.1


