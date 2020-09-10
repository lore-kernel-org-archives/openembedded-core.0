Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.20716.1599740679721418975
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 05:24:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YH/7kLKd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id o5so6429856wrn.13
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 05:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=id7wrZ7cLv33kIOtSjG4/dHy/IpV1G3tBYiWY/HYi/E=;
        b=YH/7kLKdGGIaybec1jsoNkdbA6CR3lIGlSCt5qjOUXGWFRn2HWmfxF3pk03RIKFWc3
         vf6afGUWdi+2UI7nTJtNRYFK+C11vNb9qom43EnsOi+2p3VSdjNlFfCDohJCJB4FOf2j
         gVINAuedQ1FuiyLTT9lik1Wlgi9dyxVbxpynA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=id7wrZ7cLv33kIOtSjG4/dHy/IpV1G3tBYiWY/HYi/E=;
        b=nZnaytlgqwrU2oXWF8LgCzVanHqbGwHS+gyiD5GpujiYZI4XKxOKQVyZ7eZXCQ7HBP
         St4RJ6gYKSTulcGJCKTY48EOA0YNYOrZsnWKiwM6Cm4zb4S/wlqwcwa1LaoNxxxjq9tn
         D2KckQYU6fvtjsP7jHqdnsVjKsVp7tcxnH4UMVXLFRnESOOkZWF57ViggNfXs0awDvg3
         L/Uj6FhXB3UdahzCkUJfqoUIle3HL9NUBCo+4cV3B+YWB/9kkhJ/i5NZmttYf0yWlXMq
         WbP+XZK3FQCmedLgWs/BTm6ezAcsYJwTF6Q8KcZkDtOG29ZrfJBz26sk7YifagcbmtG+
         IuKQ==
X-Gm-Message-State: AOAM532GKXqZtMO6W7CYCx2XSpBVHbfwFIikAghUUOKPwcMgyZm75yVM
	/pvdK2aXAuRXNvWNyFwBflKxKxhJqAYqPg==
X-Google-Smtp-Source: ABdhPJzHZcFfzhBFjjYAOX1SVCkhQxSCesYUUyK4dp/ui2d+LOwg3AbyiC0Tvko+QrIKKhXjxXZKWw==
X-Received: by 2002:a5d:608a:: with SMTP id w10mr8502564wrt.48.1599740677932;
        Thu, 10 Sep 2020 05:24:37 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (2.f.a.6.5.4.b.4.5.7.2.f.a.5.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:605a:f275:4b45:6af2])
        by smtp.gmail.com with ESMTPSA id j7sm8590498wrs.11.2020.09.10.05.24.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 05:24:37 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][thud 05/29] populate_sdk_ext: We now require python3, not python
Date: Thu, 10 Sep 2020 13:24:09 +0100
Message-Id: <20200910122433.2040293-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
References: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We no longer expect a "python" binary in PATH so update the eSDK's
expectations to match. This was the only failure on autobuilder test
systems with python missing.

(From OE-Core rev: 946ce21b10dcad506edcaadb4e4242c049e4c316)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/populate_sdk_ext.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 40b0375e0b9..8245361a335 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -574,8 +574,8 @@ sdk_ext_preinst() {
 		exit 1
 	fi
 	# The relocation script used by buildtools installer requires python
-	if ! command -v python > /dev/null; then
-		echo "ERROR: The installer requires python, please install it first"
+	if ! command -v python3 > /dev/null; then
+		echo "ERROR: The installer requires python3, please install it first"
 		exit 1
 	fi
 	missing_utils=""
-- 
2.25.1

