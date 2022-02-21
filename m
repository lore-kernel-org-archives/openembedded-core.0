Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C6AFC433FE
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 14:14:56 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.11168.1645452895761145155
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 06:14:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ug1kyzyf;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id d16so14405427pgd.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 06:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=opPOliLAYazmIpb2Evexr0shrXzL9Zwom4ukjbIoAYo=;
        b=ug1kyzyfrbFfPjmK120uh68mJh40KD+DqeIF3jPx4lQph91u8H5ecn6/ROZMkdGW3e
         W/llBe3hCSBd/Y8RpSFNt1EUHv7TQUtTfdtoyDj/FmpWXo7daHpMu5TFrdjp1gDuL4CZ
         WTHOA4Yx9MaDsdT/7PCBfhM7CK3u3F9vNYWoRnHI2LdrI8Ce8XNjygES/OVvQmXuHXy6
         M0fuHN5hBavucf5i/HXj8WtHgtL6NHepzPZzsmV5Yh8e8dg3bMyuQ23NvkwE6QqeSNT1
         CACSk5UchzunNwh/UORIVUrf/1Vjizmi6GJkD4Sz6JTpIOGvRJiL/M4RxCo9W6aTMVCO
         7bmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=opPOliLAYazmIpb2Evexr0shrXzL9Zwom4ukjbIoAYo=;
        b=r5cMLpEtad8NRCZGJxwu2MQjnq4a8lU6tR0mSkKBEjyx+gl+//UaFY+bB2i92xi/AD
         r/KuQBuKEWHsu/e7G2m34zUoKArjIlkblsGUJ9T+a4crAoJH2T+LJAnCanbkbZWXiEtE
         gNeOjUFeoyogRd/V4JYhk1ytPAj5HGTnEnpuW6zFeoCG8nnU7JWrnarSNubXQDxdQo+s
         uaTpTyhbqlQ/s0E6QHxWEEUXjdrjy8Khd1idE7jG0jCknBU7XQYPVHvcxOv0JsDzF7oJ
         8gEHv9d7VsfY4WFOR6dm8ew6z5Zzod3LOLJ7tkOnOThRXMRqsGcQX627mBrZNAizUK5Z
         D98g==
X-Gm-Message-State: AOAM532df9HkT63VMw19AK/rwqOKXLGD7jwc29/HjWRJHXDhA0iI1fPh
	GbF99dHEC16dJqyXjDxu9niz6jJ07Gq8wR+e
X-Google-Smtp-Source: 
 ABdhPJzZ/lgeKjDzam59nlXiDySRp0OkEvqgWVIbFbWSSttXcshf83yf9WJnVJVN6uxkUrLNvnuzaw==
X-Received: by 2002:a63:1a51:0:b0:34d:c269:566 with SMTP id
 a17-20020a631a51000000b0034dc2690566mr16264089pgm.305.1645452894752;
        Mon, 21 Feb 2022 06:14:54 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 8sm12919235pfl.164.2022.02.21.06.14.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 06:14:54 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/20] devtool: deploy-target: Remove stripped
 binaries in pseudo context
Date: Mon, 21 Feb 2022 04:14:09 -1000
Message-Id: 
 <b293bcf4c312156cb57814dd71f13f8ab2a8ae80.1645452535.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645452535.git.steve@sakoman.com>
References: <cover.1645452535.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 14:14:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162039

From: Florian Amstutz <florian.amstutz@scs.ch>

deploy-target may fail the second time with "pseudo abort" because
devtool-deploy-target-stripped is deleted outside of pseudo's fakeroot
context.

Signed-off-by: Florian Amstutz <florian.amstutz@scs.ch>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2338a33b690b0bbe279cde3f73764911b239cb50)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/devtool/deploy.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index d802b22e8f..e0f8e64b9c 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -170,7 +170,7 @@ def deploy(args, config, basepath, workspace):
             srcdir = recipe_outdir
             recipe_outdir = os.path.join(rd.getVar('WORKDIR'), 'devtool-deploy-target-stripped')
             if os.path.isdir(recipe_outdir):
-                bb.utils.remove(recipe_outdir, True)
+                exec_fakeroot(rd, "rm -rf %s" % recipe_outdir, shell=True)
             exec_fakeroot(rd, "cp -af %s %s" % (os.path.join(srcdir, '.'), recipe_outdir), shell=True)
             os.environ['PATH'] = ':'.join([os.environ['PATH'], rd.getVar('PATH') or ''])
             oe.package.strip_execs(args.recipename, recipe_outdir, rd.getVar('STRIP'), rd.getVar('libdir'),
-- 
2.25.1


