Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E240C54E94
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 14:42:17 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.46705.1674657734301697325
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jan 2023 06:42:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Hw1h2/Bt;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id c26so13548201pfp.10
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 06:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lQ74lyvlbBq7LFMJCU/zSOEkF8SHlCjuiNHxLudWJIY=;
        b=Hw1h2/BtTN8KUNs3Ly/a5owp8oZBxt6EDkyAOOfYYewQFsSzB0EvROGFSUJLGOK/G4
         J3x7nV4MupMk9z0gMgJgJDOVQOyBSEPjBEYTqAtoVkEB+Wx7OFVjlqzBVnRsE5g8NT4I
         KKTcGM4fxMdjUJERYUx9anez6fCYW8E6yXSWcFtMrhlBLxe/8+ZzP0vrhM9usw2hdm31
         XLxH0OccwrepVenXrWtVYVoAzJM9Cls7F4gZQmRjC8wRQ3xYUiXKcwXajjUDqpTklTur
         gPO6QedUewy229aXmIaJgou4KHXxMvC+ekcLRP0iyrsoEP2JjaM9vw/WSe+ebkWHpInI
         uAwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lQ74lyvlbBq7LFMJCU/zSOEkF8SHlCjuiNHxLudWJIY=;
        b=Qv98lqoUI7ikP9Kn18g/8uWBzE5MNqPFhiuRvIQFf0j0gW6v/Vp9RjFoyNYmOCUp/y
         lOKQXmvEO6iyIzVxtRM1sdxrPYpSJ0Y2j0l9IYA8VKGfNv/NVzIdSGjTiPaGSJryJ+tT
         HqKvsXRJwPI07jGX1QWyx+eJmhnjvowfbn2wcrHdHXWpakXg006YqVG61RycKgFHv4f0
         PIkDVAOs9J+WfSJPwFwYkswAVQcKloyBbb3+pP3s5DPdMuHWW5p57IHcdcJsVQdtODdU
         ixJtA7+eqrbnuZYxdA847FD0mApxtnUAadBNIvZDeAK5LYkbLwq0R7SeS5R8JU4vLdj4
         EuEw==
X-Gm-Message-State: AFqh2kpRQdewEfhhncWUeEz58sbsxhlhf+plH3EAgqAi4+6rzIdJi2Q3
	sXpeL1YPyKtKSscUfBAI5yWCry7EIfRzEpyuCow=
X-Google-Smtp-Source: AMrXdXsXePqniEjU1sn13Lc4cBMnKalVB2SdKVFPhZJY+Ya/b91YncY0jPZdQ0rSAAapwVzZcJk38A==
X-Received: by 2002:a05:6a00:d68:b0:576:dc40:6db9 with SMTP id n40-20020a056a000d6800b00576dc406db9mr27037140pfv.13.1674657733243;
        Wed, 25 Jan 2023 06:42:13 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id d2-20020aa78142000000b005810c4286d6sm3723703pfn.0.2023.01.25.06.42.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 06:42:12 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/16] cve-update-db-native: show IP on failure
Date: Wed, 25 Jan 2023 04:41:47 -1000
Message-Id: <48c0e427675f4c99c395cc0a75743ac70eb64802.1674657501.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674657501.git.steve@sakoman.com>
References: <cover.1674657501.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 14:42:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176355

From: Ross Burton <ross.burton@arm.com>

We get random SSL failures when fetching the CVE database, and it's
notable that the NVD server is behind a DNS round-robin or geographically
diverse servers.

On a hunch that there is one misconfigured server, dump the IP that we
connected to.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 91f46d431dc8f40e8c6475c800bb61cb08b82b0a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 28605bc13b..efc32470d3 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -129,7 +129,10 @@ def update_db_file(db_tmp_file, d):
                 response = urllib.request.urlopen(meta_url, timeout=cve_socket_timeout)
             except urllib.error.URLError as e:
                 cve_f.write('Warning: CVE db update error, Unable to fetch CVE data.\n\n')
-                bb.warn("Failed to fetch CVE data (%s)" % e.reason)
+                bb.warn("Failed to fetch CVE data (%s)" % e)
+                import socket
+                result = socket.getaddrinfo("nvd.nist.gov", 443, proto=socket.IPPROTO_TCP)
+                bb.warn("Host IPs are %s" % (", ".join(t[4][0] for t in result)))
                 return False
 
             if response:
-- 
2.25.1


