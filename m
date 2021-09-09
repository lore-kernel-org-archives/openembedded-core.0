Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web08.598.1631201780018726942
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Sep 2021 08:36:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XX+hNxhJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id e26so1673117wmk.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Sep 2021 08:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ugv1y9cO8GdA0M2eBjspw2P/CVYf8cvqWHE6fBNDGOI=;
        b=XX+hNxhJKMzLFrgwPz6bCt+eoYn0R4IPWt6oQbFkruwlB1wvlgDTFmYZeJKuple174
         JdOu/vYz635LiD/f2mtH+PKs0pogkQtt4SCidLqd1c91BHKmkU33hdSV9jQxK58i+dT3
         dQpGuxvYoyzvAsaNMBCk/QcdgynduY02rUTVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ugv1y9cO8GdA0M2eBjspw2P/CVYf8cvqWHE6fBNDGOI=;
        b=N6uoG3GTGofk1Dpsf8NQ5VR448P1/qF8aiBdBfMmnD79voxOuzFNjq30Jqrk9F9gVo
         TlkT62SLof7Lahj/6yC12ZdJXClXyx6FEI7MJVSGnvJinou1+ndM6rZciudb53hYgjWc
         KKD2qi27CVWY4hxXksLX8FNYhfX2Zcwz9ofu/6cC+DybY1EU5ABKJjkQVo+/1UPzCs3R
         /o7MftggraPAtR4AkIgwV+fGn8DjYw4w98MK/6oYnY4XZLrpcYwmN9G/wFmloyiu6itg
         Si/q0HMKq8MbOKbFjqAD/GNs138E7edZJdxqbEHvKUo69syc7NyMEgfEG/O0nTS8nhLK
         WNoA==
X-Gm-Message-State: AOAM533mHTNrLB+kboDzfmx/G6PlIuC06Siok5yIHGyJZ1u3lWUYNRW0
	M9Z95QvSMAo49ynPMAoXpShNh0GnNzH+MTcm
X-Google-Smtp-Source: ABdhPJyFgnkdRFOJaYPp+hm55Nb2K3ZPr8BWS3L6PyKb3wSWlDAECPB3LoGbywHNWkh9K9usDJH51A==
X-Received: by 2002:a7b:c148:: with SMTP id z8mr3621749wmi.147.1631201778486;
        Thu, 09 Sep 2021 08:36:18 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:a4a5:76db:a94c:ced7])
        by smtp.gmail.com with ESMTPSA id d29sm2245173wrc.6.2021.09.09.08.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 08:36:18 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: seebs@seebs.net
Subject: [PATCH 5/6] pseudo_client: Make msg static in pseudo_op_client
Date: Thu,  9 Sep 2021 16:36:13 +0100
Message-Id: <20210909153614.1225570-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210909153614.1225570-1-richard.purdie@linuxfoundation.org>
References: <20210909153614.1225570-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The address of msg is returned by the function in the OP_CHROOT case.
Whilst the way it is used means it is just a way of saying true/false,
the compiler doesn't know this and can warn and this isn't really
allowed.

The other pseudo funcitons in this area already use a static msg so
make this function match the others. There wouldn't be re-enterancy
in this context.

Need to be careful about clearing the data upon each function entry
and not just once at init.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 pseudo_client.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/pseudo_client.c b/pseudo_client.c
index 2583bca..546bdb1 100644
--- a/pseudo_client.c
+++ b/pseudo_client.c
@@ -1589,7 +1589,8 @@ int pseudo_client_ignore_path(const char *path) {
 pseudo_msg_t *
 pseudo_client_op(pseudo_op_t op, int access, int fd, int dirfd, const char *path, const PSEUDO_STATBUF *buf, ...) {
 	pseudo_msg_t *result = 0;
-	pseudo_msg_t msg = { .type = PSEUDO_MSG_OP };
+	static pseudo_msg_t msg;
+	msg = (pseudo_msg_t) { .type = PSEUDO_MSG_OP };
 	size_t pathlen = -1;
 	int do_request = 0;
 	char *path_extra_1 = 0;
-- 
2.32.0

