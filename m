Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FED9C54EB4
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 02:21:56 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.33723.1674440510838867656
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jan 2023 18:21:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=EGZ6mPuj;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id c85so7746050pfc.8
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jan 2023 18:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=esiAvX1AcRURrqYUIr8xnM3mGTK/KFTAb75OpUu+fSI=;
        b=EGZ6mPujmuhkeHfESAijBwuQLn++VPiioZLlOcISStT16diD0vmURVv3d8x959i0kd
         i6zePtLYowKNHhmXm7Vf55GWrdVDMQe/GUXQJh/Z8LruxHRqVpEWUOvo2Pf60sk7+Ftx
         rYILAf6/0BoTZlaXS57I0mBWl1HQptaxGYORYcD/06tX1ZDhqiSOkjY8l2QsmelDrkMp
         Sou883s4mVT75cshY9i9jnk3x3lGpMx7rwaVgemHVnwdpdtkTKZoEBL5WU6DYeCPQO+2
         ZwP0uyYj+6+YFOfO9OCfR4y2QodCNcV0qcpCRg989SfXZN696vgTBOiXufezeRyXSi+8
         4fTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=esiAvX1AcRURrqYUIr8xnM3mGTK/KFTAb75OpUu+fSI=;
        b=i32gd9ImlPYkljAEEQe8tLuy9snj7qik7FGrmvZdTFTDNGOshj+NRMiIXamWR2JChg
         WlroNKiXF/gm4ciVrEkToPjeF+un/HvjodDDJVGEHzOXrWkrsuQ5AXaim/hb+/ogbrLK
         Eciak9YRXZWyJvKgMuL8+dX9dY7jearhRmCxunqkjHr0IyOgzt4iTDL23pkqJ+smTaDA
         VtrYU5e4D0AkeCsAoNOG4iTiT6EQ1xqb+QlYzTFjtWVooOpDUqVuha0zqdY8y8l1TmL2
         4I74pNzu57ceKkRyIv5YRaOgRyWWOgNZRm90jiu2TwgHnD3627x9zzY9NU1i1CcFwObZ
         jP1A==
X-Gm-Message-State: AFqh2kqyxMFbWK0P0004u/33Qu2YFHlLwD0ziYWm0TnPlE67LPSfSBGc
	Qy2Y5xYY/rqPEGbUmxqKdVsMkuq+/ssUHVsYTcU=
X-Google-Smtp-Source: AMrXdXsKFMe++63dwsfsQ++bkOuyiLFRoQVh2iZU11BoB8uqyKARE75ndkOFnxil6o/y3A+4iP9n3w==
X-Received: by 2002:a62:1884:0:b0:58b:c7f8:623c with SMTP id 126-20020a621884000000b0058bc7f8623cmr20162956pfy.27.1674440509832;
        Sun, 22 Jan 2023 18:21:49 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id h11-20020a056a00000b00b0058dd9c46a8csm10384222pfk.64.2023.01.22.18.21.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 18:21:49 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/32] cve-update-db-native: show IP on failure
Date: Sun, 22 Jan 2023 16:20:58 -1000
Message-Id: <99f1a8971192f85fefad3cbc993b23a59627eb4c.1674440376.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674440376.git.steve@sakoman.com>
References: <cover.1674440376.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 02:21:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176268

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


