Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 562E8CA0EDC
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 10:52:51 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.17130.1755687169545798094
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Aug 2025 03:52:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=fauIg6Hs;
 spf=pass (domain: mvista.com, ip: 209.85.215.173, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b4717390ad7so4205668a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 03:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1755687168; x=1756291968; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PGMYU/clxcqtc3o6ZsStmQZUIubiqGXmg0dcCg6i7eE=;
        b=fauIg6Hs1qWpMB6kj5t/cXPZSRxFUsDtyn2BhVO6ffXiZdI/nx+ldetvkPIHS4YhJt
         +kCFZbCRobMVeS1vD14DDVRopoSXwA3bphyWloamMCtPBYrPqA/fXE/M73OMAWcwJ0K0
         0I5O0/WOS6GOz1v9KQwj2UkiTn/TroX6dNsCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755687168; x=1756291968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PGMYU/clxcqtc3o6ZsStmQZUIubiqGXmg0dcCg6i7eE=;
        b=vl5KDs78qRVC5A6r2QZzfAKxDpDhsXrXdd5phkTR0utDRAZ32oVgCkDKgVHo9CMQxF
         j052SZUw1pCCQtMO+JSEmXWovF53NI0w6wRLHOPX+39oiGaNotohMDTB+XKOp36FGXfM
         DBu77JK9Evkpgn3mmS50g+WTg+eWZO6acZ37penN09WhnfY1UwyPDuGKf+b1rTXWMWHS
         4Yo4vhefw4UtYUE9mLi//X4NlEInUW0hHe+u9pqac6NiIA9cnKGHROBqDY2/kdmdPA7O
         1Rg0gMjbeAal9mzI9dllTjEsuKVENAxRjy+m9eScxmVUv1z+TKvuPSz05HCTXHKQNR5n
         LQSw==
X-Gm-Message-State: AOJu0YxZVRQmG30UM/1SNxvWXTxiLW6RVgIFs4GvcwHdMOba1oTfYiCQ
	+EviRP0TzkdjnNWiu3p+VIwOfJU6ZqMu0vOf8r2B+vXmohur/NV6SbX9wLOBDABc2mTw06P+91w
	+AEjQKqk=
X-Gm-Gg: ASbGncs+Iu8bThHi8m+BRZDPycarqyPWxWzHU+Zts6uuON2Ybq56KyhMvjlavlEHc44
	xy78U3fKf+C98l3ZAlVRU/khMnNv22Djh3eN8SGIIkttZcxiApk0Gf9Yg03ygmQ7I56P63h/ItA
	SNLlkJR8ywPk/4HGT9iiyYir2Z/O4Q/ENvy4kNupFliqvwZPxzrrBi19geDa+rTtFEL0ltlbPh5
	AKf/cJIwotp6aUzUkz/VOcvWiDPW880XScA3MM1qGVXPXvAXywWpsPE1OVwQgpBWNRPPPJwcNvA
	1iVb3Zm2eUbTfyyl2dU+ghExGI+6y8g8Yxy9lRQxT13MNV1JbZx9yf6z7KNJm2DqduklPxIBs3G
	zuiGN5s14WFg9B2yfH9/WB1OKD5nxJVw=
X-Google-Smtp-Source: AGHT+IFDT/RNJEgmbwOYKwbhIXNC9UrTeDr7ithkoFZMCA1mHVjBsV80PZri4PHZaTkqhbWR6R57Ng==
X-Received: by 2002:a17:902:d4cf:b0:240:52c8:2564 with SMTP id d9443c01a7336-245ef22710dmr28166295ad.26.1755687168266;
        Wed, 20 Aug 2025 03:52:48 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.204.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324e254cbd1sm1976663a91.16.2025.08.20.03.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 03:52:47 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 1/3] xserver-xorg: Fix for CVE-2025-49178
Date: Wed, 20 Aug 2025 16:22:30 +0530
Message-Id: <20250820105232.201407-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 10:52:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222169

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.freedesktop.org/xorg/xserver/-/commit/d55c54cecb5e83eaa2d56bed5cc4461f9ba318c2

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xserver-xorg/CVE-2025-49178.patch         | 49 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_21.1.8.bb       |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-49178.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-49178.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-49178.patch
new file mode 100644
index 0000000000..ce3e2f415f
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-49178.patch
@@ -0,0 +1,49 @@
+From d55c54cecb5e83eaa2d56bed5cc4461f9ba318c2 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Mon, 28 Apr 2025 10:46:03 +0200
+Subject: [PATCH] os: Account for bytes to ignore when sharing input buffer
+
+When reading requests from the clients, the input buffer might be shared
+and used between different clients.
+
+If a given client sends a full request with non-zero bytes to ignore,
+the bytes to ignore may still be non-zero even though the request is
+full, in which case the buffer could be shared with another client who's
+request will not be processed because of those bytes to ignore, leading
+to a possible hang of the other client request.
+
+To avoid the issue, make sure we have zero bytes to ignore left in the
+input request when sharing the input buffer with another client.
+
+CVE-2025-49178
+
+This issue was discovered by Nils Emmerich <nemmerich@ernw.de> and
+reported by Julian Suleder via ERNW Vulnerability Disclosure.
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2024>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/d55c54cecb5e83eaa2d56bed5cc4461f9ba318c2]
+CVE: CVE-2025-49178
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ os/io.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/os/io.c b/os/io.c
+index 3e39c10e6f..e7b76b9cea 100644
+--- a/os/io.c
++++ b/os/io.c
+@@ -441,7 +441,7 @@ ReadRequestFromClient(ClientPtr client)
+      */
+ 
+     gotnow -= needed;
+-    if (!gotnow)
++    if (!gotnow && !oci->ignoreBytes)
+         AvailableInput = oc;
+     if (move_header) {
+         if (client->req_len < bytes_to_int32(sizeof(xBigReq) - sizeof(xReq))) {
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
index 1fceec89f7..67e146bf97 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
@@ -40,6 +40,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://CVE-2025-49176-1.patch \
            file://CVE-2025-49176-2.patch \
            file://CVE-2025-49177.patch \
+           file://CVE-2025-49178.patch \
            "
 SRC_URI[sha256sum] = "38aadb735650c8024ee25211c190bf8aad844c5f59632761ab1ef4c4d5aeb152"
 
-- 
2.25.1


