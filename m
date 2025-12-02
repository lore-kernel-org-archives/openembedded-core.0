Return-Path: <corentin.guillevic@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA080D116F6
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 15:51:05 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.344.1764690657698416615
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Dec 2025 07:50:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qwZ7xtgC;
 spf=pass (domain: smile.fr, ip: 209.85.128.68, mailfrom: corentin.guillevic@smile.fr)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-477aa218f20so39119695e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 07:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1764690656; x=1765295456; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wJbP5DbUgmeGkEI2GBxOkpi1gqkUDBfeSzxl87woMwk=;
        b=qwZ7xtgCiwGcg0IRu+SHvbejKm4b1gAWzlfL/xNZvwSXX3Wyd+rNvTfUtkj2IlaYdu
         lgmFiNsUM7B7ixMRiNQx6lb4eHdhokqLeA7plXNOB92VzCLnk5Tp8oowXDXhfvXnIme8
         hV2H/Ocs/LXXf41bbU2flp7TJqa9ssoFRh0PI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764690656; x=1765295456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wJbP5DbUgmeGkEI2GBxOkpi1gqkUDBfeSzxl87woMwk=;
        b=VTqlC2vMWZEopHFKeAGFQt/GXtruavasqTOb7rGPhkZUS0uSKT9IMKUkTlJgxHTSC8
         EH8NIcUJNOBwpKo8BONgF8X8++ZFff5kbZ9gLsPrMofrAmfZZhhBpiNdyNb4bJN1Yl7P
         0GJgw01KI3SVvg4feGSwtMO7pMNR6lTEfpEgWY63a6kU91KDFie73Hw3VCpLO+wkAhoa
         BdgHygb6FEHo+X5aQGOtyuGBgkFBk5XbH8tqHQvVFMYsj2xhFyp7UieJteDlpVC6LwXI
         /xc8DNXcurv1SqejVv3NS/gp55axcN5hoDS4YmHglAzEWZj8C6/3zIeAQKEWgF2cR4TO
         IukA==
X-Gm-Message-State: AOJu0Yxz0imk8ICfrfsM0nqwc/xy6qwz+hOtcKen2vpctOCCFQFcGSaA
	btQRheAlIAP/SvL7Go3MW4HGUY57DO7XcUH3WiS/AygVYx/ezImBIKHk/AakJBtu+IRyiq4YAxV
	8ZkK47YHF/lKO
X-Gm-Gg: ASbGncv+u0pEca6hfN6fnmekFhtNUQiyLId72EC4b04MXrTcbqH4gLp2n22Y5bcSzmC
	IIvQwZkmRvxuLynNdL2HoZSbeY2V1/g9KUO9fN8DXic5KYQV3xkOSwfRzqBXUSJfd8znrviEm66
	QlNf64ObdGkB8WnnEZJ6cXSU4baBJmQDd6rV3zCx7z1h3ejpXqp3UoEcaAe8Tw2DDkOx5uMFFYg
	PQb8/jEbcOM/ZuI/FF6zq3+d7DnP9xideLi5KI56QFBm/nKzBzA50X3GaoA/+B/BehqBkqWhqLF
	SpvhM9exf4FDBbyGmtHb5RG63orINuWrtYsuJ2mvd2eSvnPO6je3v5PsSFMktKHc9NgY97XJ/lp
	kxAEeWad2wMMLFwhC6DZCM/Pc0iBUWFhvzW0ZIwxkDIaIrgGnXptCONmzddP7tsEMnf0FU9ymDb
	2MF5jycYqSZIwS7nZ/RejXvw==
X-Google-Smtp-Source: AGHT+IEB/JPjiKiI5+j62tCx6DZ+0AH83azIpaPaUvRQCFcl0HTChNMo/5Cx0VaJ2BwuzMxdHa3E1A==
X-Received: by 2002:a05:600c:548b:b0:477:6d96:b3c8 with SMTP id 5b1f17b1804b1-477c01c4c03mr408878125e9.23.1764690655777;
        Tue, 02 Dec 2025 07:50:55 -0800 (PST)
Received: from heaven.lan ([2001:861:3080:b0f0:3dbf:6e88:6b4c:feb7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5d614asm33641446f8f.12.2025.12.02.07.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 07:50:55 -0800 (PST)
From: Corentin Guillevic <corentin.guillevic@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Corentin Guillevic <corentin.guillevic@smile.fr>
Subject: [PATCH] oe-setup-layers: support inline URI
Date: Tue,  2 Dec 2025 16:50:43 +0100
Message-ID: <20251202155043.815098-1-corentin.guillevic@smile.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 15:51:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227172

Most of the time, when we describe a remote, the layer data (also used by
the script bitbake-setup) looks like this:

"bitbake": {
    "git-remote": {
        "remotes": {
            "origin": {
                "uri": "https://git.openembedded.org/bitbake"
            }
        },
        ...
    }
}

i.e. an URI with the common name 'origin'. Alternatively, we could simplify this, by
using a shorter structure with the property 'uri' only:

"bitbake": {
    "git-remote": {
        "uri": "https://git.openembedded.org/bitbake",
        ...
    }
}

'uri' and 'remote' are then mutually exclusive.

Signed-off-by: Corentin Guillevic <corentin.guillevic@smile.fr>
---
 scripts/oe-setup-layers | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/scripts/oe-setup-layers b/scripts/oe-setup-layers
index 31cb963251..bac685a209 100755
--- a/scripts/oe-setup-layers
+++ b/scripts/oe-setup-layers
@@ -60,6 +60,14 @@ def _write_layer_list(dest, repodirs):
     with open(layers_f, 'w') as f:
         json.dump({"version":"1.0","layers":layers}, f, sort_keys=True, indent=4)
 
+def _handle_uri_shortcut(r_remote):
+    if 'remotes' in r_remote and 'uri' in r_remote:
+        raise Exception("Keys 'remotes' and 'uri' are mutually exclusive")
+
+    if 'uri' in r_remote:
+        r_remote['remotes'] = {'origin': {'uri': r_remote['uri']}}
+        del r_remote['uri']
+
 def _do_checkout(args, json):
     repos = json['sources']
     repodirs = []
@@ -80,6 +88,9 @@ def _do_checkout(args, json):
         if not desc:
             desc = rev[:10]
         branch = r_remote['branch']
+
+        _handle_uri_shortcut(r_remote)
+
         remotes = r_remote['remotes']
 
         print('\nSetting up source {}, revision {}, branch {}'.format(r_name, desc, branch))
-- 
2.49.0


