Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12D79C05027
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 06:42:44 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.8403.1676011362717378795
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 22:42:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Pl9OBeOc;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id f47-20020a05600c492f00b003dc584a7b7eso5549138wmp.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 22:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zJQ1tSU9D9GtxjgfsTo3qEcmoDARoNRwacvFi828ybY=;
        b=Pl9OBeOc0NwT0YLoQfzDfnN3kCQ7yD57F1YZ+UvsWFSeSawgbMrR+PNxBuopxbHnSO
         0QqTWEW85li1aw6xsGZHW9Q7xOLc3X9pdtNk+NroxWq0Y8YjB4eTeZz4d3N80e/5dMlk
         yFD+xXICMw9vQ+90yni5JWPJRnF03WstAv27z0HoJvZt4Mlw7jMUXHz/Y8+FdxRBc1BV
         9LsiOqscHg0gp34ytuzdForZsunud8vZZ7ysUgosYKe3Wm5fDSvjFhDas6lHpbaPisQ4
         Dr4oH7xj3j9wIRlFv6LlOuuOybBEaxUZlf9rqMMJBuvlDxW+HcP01XTauMN2rNIoOEx9
         mn4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zJQ1tSU9D9GtxjgfsTo3qEcmoDARoNRwacvFi828ybY=;
        b=DDH73/8xRpRaEJ7JQsFJ4BJC699DnP4QbGqmBCZpkNH6qurTGPxxa7laiov8yHlwos
         G3lBvEAwKmED5KQvLPuaaW8KpT60lCG+J9Ekpd6EbG79ISEsyaFzARc2eltJSgniMwk3
         wIC82o/P9bpkspmA/9KM5+eC052VmJ86yNpGKu9DP8FBRl+tDse2OUMwIzFmIMrYYcYm
         Ngt36mBFfNXu9z9jPT26xgA5GjGws6QlTylBoxBAeVIuzHvYzwpCEnIsBZMNRmZRdTah
         Xt5niR53638UKs+NAf2xc3GdkMUsJFJVS482E6mIUNhK8x/AAQEo4OMUFwzaMVE5Efae
         fjpA==
X-Gm-Message-State: AO0yUKUQ4Q+d0c9I+T26iFhWQ8Frrt+3PCw8sIDMCxQttkCXFEcXS60Q
	Smbm/7OuJZaq/uUx+M4k0gUZf3Buids=
X-Google-Smtp-Source: AK7set8l+V67SiLaSdhWU6oGyg4Qo916aXe4xx6dlTV6QzKBfKWckg0avWjerW56Z1Ej8bPptQQXrQ==
X-Received: by 2002:a05:600c:331c:b0:3dc:9ecc:22a with SMTP id q28-20020a05600c331c00b003dc9ecc022amr12320314wmp.8.1676011361224;
        Thu, 09 Feb 2023 22:42:41 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id y15-20020adfee0f000000b002c3efca57e1sm2896993wrn.110.2023.02.09.22.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 22:42:40 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/8] scripts/oe-setup-layers: print a note about submodules if present
Date: Fri, 10 Feb 2023 07:42:11 +0100
Message-Id: <20230210064216.4123807-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230210064216.4123807-1-alex@linutronix.de>
References: <20230210064216.4123807-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Feb 2023 06:42:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176977

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 scripts/oe-setup-layers | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/oe-setup-layers b/scripts/oe-setup-layers
index d0bc9f1667..461560de9f 100755
--- a/scripts/oe-setup-layers
+++ b/scripts/oe-setup-layers
@@ -46,6 +46,9 @@ def _is_layer_at_remote_uri(layerdir, remote, uri):
         pass
     return False
 
+def _contains_submodules(layerdir):
+    return os.path.exists(os.path.join(layerdir,".gitmodules"))
+
 def _do_checkout(args, json):
     layers = json['sources']
     for l_name in layers:
@@ -90,6 +93,9 @@ def _do_checkout(args, json):
             print("Running '{}' in {}".format(cmd, layerdir))
             subprocess.check_output(cmd, shell=True, cwd=layerdir)
 
+            if _contains_submodules(layerdir):
+                print("Repo {} contains submodules, use 'git submodule update' to ensure they are up to date".format(layerdir))
+
 parser = argparse.ArgumentParser(description="A self contained python script that fetches all the needed layers and sets them to correct revisions using data in a json format from a separate file. The json data can be created from an active build directory with 'bitbake-layers create-layers-setup destdir' and there's a sample file and a schema in meta/files/")
 
 parser.add_argument('--force-bootstraplayer-checkout', action='store_true',
-- 
2.30.2


