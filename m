Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 383A0CA5FE2
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 06:54:12 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14296.1791183248505834615
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Oct 2026 23:54:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GiJqL+ZJ;
 spf=pass (domain: gmail.com, ip: 74.125.225.76, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6351831so593076f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Oct 2026 23:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791183247; x=1791788047; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jRTp854LI7P4KaAUIS//15uOsW1VfnFB8uAFVSx2Pjc=;
        b=GiJqL+ZJfgFpfYqXqMmbDW+mlLRmVJTWkfTniOBsRjScJlfysZ2d7cQHandbNEdvz/
         /Rg+tgiyHxVugY/hoaPDulwJVUVHEf1qgf7M0JBXPMeraXnWdlQRhqNMLDGbkZ6481Ko
         IN/3QqMCXc2gOBvwm2ZIcSgXxg7PGME+oqII1Z96dKPmfrPuene+mIT0aHqOovFFFMSZ
         ECo5uxtxBrwmY4vgytKbvGcARsoheADQBhLaDcJigsTWozGIUSf1cBjr+2WjDGBVetHy
         RQg8NB4msKk0h3fdv6PIg5G3eWjQckmrgQNceUMb/dSi1xkHO02+g30bJw07+VwbkLIo
         LwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791183247; x=1791788047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jRTp854LI7P4KaAUIS//15uOsW1VfnFB8uAFVSx2Pjc=;
        b=wnthQrzu2boDmyDkl1vTFnjyq5vY3cXJGUjqikB5ur0d0whjy4S9ci9mjj9Vauh/f3
         1T48j9jS15IvSxuZ9gY2Wce1UnXKlinlJKHMQ3T84+rVJ000elw6kfTKWiSizv/IRFRX
         JZRWhspQ0t3AW3aiLH1877y/WKukZiZogS5mdrk9Bi1Pn0KjO7EZVHG5kEPfyDlmlsTQ
         XAb6KJii6fZ8ipI3lUJ5OC0rckDE2F7bZ3+oARbdIap74S9617imPk7/EZkW71Z2eMAf
         tZEtnROgqj7ZNCBEWl8h0WP8A5Mj9UVkc5QIUWItnnPmNKBPoEZxQVXA6Bfzr9js/7mS
         clyg==
X-Gm-Message-State: AFq9FYKu+4CfoqaxLft2K+glkzTz3HL6tCVqQ4vn7PeDRH2edEzt8k+s
	pN/F+2y/OSVV84FyVqHaf7y9vthP5reQALyxkXSddMCkINj8oOf/6bfwu+Arnw==
X-Gm-Gg: AYBFou3ijXdi3jirTL7FBgdPfjnRcUY5iHNALS5yzZ2ZQ7F+2FJlvJ4BrPZKJTbEE6U
	3JALRSHUe6tx88OXAxnPtfSlpQlccoWCrq3qoidU3iaoqDN9JNFPnO68vsqAlOzH/lzMkGgiZ85
	/0JMQ16+vTy3/HiPasYIzOsvCkJl/QmkJEbizi7DtftGFmvqek1FT4DJe+koYzuiK+j3GENmTra
	nLvnd6revcwYir3Y9Q1wJHsM3nThhsaEtnKu7io8MeAyqvOZiVD3DOcpgOsosn14dJJiHZSdbPj
	YUtXmrFCGh4JG/4eUPCfeWZ07RGAoHHThRhb8fsjqysK2GGF4HCIIFQBkfNiI4Nds0bwyWLkDEj
	6QIbvznp+ZJW+Z4Y+rZvjmr9TTvqGr/rnwtVGwvhHd5vPQ2J8lqiqugcdnm4ZxEXDvSByIzzHQX
	ejv/XxmQMxNfX9YI/TP7ss7sk2wkN5mvLte0Us5pLdjUAj+HM4om79UJtX4nJBOZ5kgQYYV8mXz
	VcKtJJ3/ocuRJ+WR4JFRWTK18qoJAryAnXzpG5F1H47XD/U6qPX+U9IYss=
X-Received: by 2002:a05:6000:4025:b0:488:7787:469d with SMTP id ffacd0b85a97d-48b1271790cmr17286856f8f.25.1791183246679;
        Sun, 04 Oct 2026 23:54:06 -0700 (PDT)
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c622b4685sm1487592f8f.41.2026.10.04.23.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 23:54:06 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [PATCH 2/3] sstate-cache-management: skip directories it cannot read
Date: Mon,  5 Oct 2026 07:53:23 +0100
Message-ID: <20261005065322.30522-4-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005065322.30522-2-alex.kiernan@gmail.com>
References: <20261005065322.30522-2-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 06:54:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247218

collect_sstate_paths() walks the cache assuming every entry is a
directory, and only tolerates NotADirectoryError. A directory the user
cannot read raises PermissionError instead, which aborts the whole run
with a traceback. The usual one is lost+found, whenever SSTATE_DIR is
the root of a filesystem - a dedicated disk, a volume, an NFS export -
and the script is run as the build user rather than root.

Warn on stderr and carry on, as find did in the shell script this
replaced. stderr keeps the warning out of the list -D prints.

Run as a non-root user against a cache at the root of an ext4
filesystem: before, PermissionError on lost+found and exit 1; after,
"Skipping .../lost+found: Permission denied" and a complete run.

Fixes: 2fa1b25d7485 ("sstate-cache-management: Rewrite in python")
AI-Generated: Claude Opus 5.5
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 scripts/sstate-cache-management.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/sstate-cache-management.py b/scripts/sstate-cache-management.py
index d088878a92df..c361c3d5a07f 100755
--- a/scripts/sstate-cache-management.py
+++ b/scripts/sstate-cache-management.py
@@ -125,6 +125,9 @@ def collect_sstate_paths(args):
 
         except NotADirectoryError:
             pass
+        except PermissionError as e:
+            # e.g. lost+found when the cache is the root of a filesystem
+            print(f"Skipping {path}: {e.strerror}", file=sys.stderr)
 
     paths = set()
     # TODO: parellise scandir

