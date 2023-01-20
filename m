Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 226EEC38141
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 18:11:10 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.82045.1674238268398348032
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 10:11:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=dDhhiL1P;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id 36so4727914pgp.10
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 10:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=esiAvX1AcRURrqYUIr8xnM3mGTK/KFTAb75OpUu+fSI=;
        b=dDhhiL1PVBMkgfy8a5cG4Paxbhy4hCU0rO/SKPX6WnEqCpSi+rHkNmQqd77RgvDJuQ
         KVUxji6s98Z9VCzmnzo4p0KD/fUcAPmAJOV6KZH6DQapjYo2+sdDmD9JuFmpn3bRbRlf
         ZLjEa8qIg5OHwla+bVtpJo7gdySlsQVglcjJVzZzmXwvQyDhtYs6PXL98HKl01g4kvLP
         tJCV+K+3ZTG8PP3yq0gJnFTiVewmTWrUW0/wI9Yn30Cz3KI1OCGkyGbWTjBKkBvHCZA2
         nfHIaH/R/hiNuvvSc33TYAGA2ajLj/muvebp0coXnSOsAbP8jB4juFKAGOjeohsScJkA
         0ENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=esiAvX1AcRURrqYUIr8xnM3mGTK/KFTAb75OpUu+fSI=;
        b=ztjDC5OjeT7QcdQAPOZPFm7zhuCx5RgMXJ++PyBxUINTw3s+VGTFJ7yAl7HmO9t9S1
         ebqfU8LBES4HOHyMLbRguC9/edLxcpHT/NHNiAvX3TtmF+gaguXWRyONWyJYPiGaHJE+
         o9Gk5IpBdb4Tb2by+4IwjkayHX1cWJYuFUTDNDmirjFQfn5ACMEMxKO6aBJGuBRRj53i
         bDARLueA4H02sK5/2Rfb00/gUX1Az9W0cc6eXtDNSDNRhdePyXtPotmTPO7W+PvhNxWZ
         J/CM7xZLT8zTqNwKCrq6Zo9mpWflb1sPns4L/IgMrszEBsTzdT75XRZDa9A7PzpD1XPo
         GTLQ==
X-Gm-Message-State: AFqh2kp8MIJevEUcr8jCTA64TscBYyCEbPRzX6pnLieD0Xw+kN8fBJGP
	pfT/IREwisPfkyr9RwDzSvFOTRZcVbIPw7iz5UU=
X-Google-Smtp-Source: AMrXdXu7BOko9u+64f4ENUMQPHO0ZcCzelp6R9nL2y0Tq6Kf1avnzKdNP/pI6HRxHNILWHCq9CBpng==
X-Received: by 2002:a62:38d8:0:b0:582:ca4d:f6a7 with SMTP id f207-20020a6238d8000000b00582ca4df6a7mr40348918pfa.4.1674238267469;
        Fri, 20 Jan 2023 10:11:07 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id i128-20020a626d86000000b0058db8f8bce8sm8990396pfc.166.2023.01.20.10.11.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 10:11:07 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 02/41] cve-update-db-native: show IP on failure
Date: Fri, 20 Jan 2023 08:10:19 -1000
Message-Id: <60e06c9666a2b254c50b2f51932d395f88dd550c.1674238148.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674238148.git.steve@sakoman.com>
References: <cover.1674238148.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 18:11:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176208

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
index 079f062f79..e042e67b09 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -130,7 +130,10 @@ def update_db_file(db_tmp_file, d):
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


