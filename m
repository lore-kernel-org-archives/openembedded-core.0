Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52395C5DF9A
	for <webhook@archiver.kernel.org>; Sun, 23 Aug 2026 07:51:40 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10606.1787471494426868127
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2026 00:51:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iHydN7JY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4998e0916faso14800125e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2026 00:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787471493; x=1788076293; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hncYH+gSeyTMiWOS+tU2xfillYFL/Zw0uhK85Jit6fE=;
        b=iHydN7JYImUxONzm1Q4p1zWdcv36aLY1PjWU7jdkhVea2cMSpJDRMd8WNb42BNKpVg
         1nfEIhj7Be1yBtax+dyuGsrvqPKCtATcYlKcqqV3AMj9/02X7RsYKeJXrJeLaw8/VXGK
         CtfxKALWCvyH9goEpd8d2vk6W90+6+wso00PQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787471493; x=1788076293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hncYH+gSeyTMiWOS+tU2xfillYFL/Zw0uhK85Jit6fE=;
        b=HOW9smZ9S77wHunIO3D7uyCl7ppy9Upsd8XRD03bZGUrj53pRtvnn5jeKdqYrDT+tb
         1zamUz69gFb5FYp5jF6+G/6JkAwnNODDPOcUaGTov5RS9tZ/lncP9sd5s+sd2QRDn3+F
         YB/YLwL9zfN+EH+s/HIBYjXzc5DIpvhMuER1P4tF5BZsTJb8mIGEEuaWN3nlRWSMBzkj
         gRXg78RFitTDXw6WM+Red5zLEj5qbagtwg8VeK40sgMJHvBBACSKYIjZKEACPtQT40LB
         OskB5eqsz/25NcuxjCPes0jnZvxGyNlRRNvQ5fDKnEenlw/R+IEYDTreKGDsR5hPh9/l
         WqLQ==
X-Gm-Message-State: AFuF++l0rssMaq/tv87vhSir4BRDSEN98U8bkomwCxEAIquEDknn9jqC
	APNNn7QSMb9Zbot990gkXk8BmWQLwVSMiblxKJUdCL64zo7TGy1L3Sq7qSZvr56Oz0e2HQauUa+
	HOi5Gvuc=
X-Gm-Gg: AR+sD10NVynzBt9xwSrsOh4ybq6bMbLixCfOCkI0jhM44nfeFHHXy0XScWi1IDTmLxa
	qdyJz4fTwIDQOI6MJIg41Sn0HZZuNOBthRv4J4Sf+TxaJTIt1IW8everAS1qQDepygca+NOYcB9
	CHLMdzR3dZA9AAzYkoCSv/U3YDVcuRucBKf7KD9y7+AgSDrKehvxKqJoOI6zjcJ9p5xM+z1Vs+O
	UbiOeqoi3j25KqVL81rV1EUe4tD1yTaeCRQoJU3N87MWOAVL3mP+Z2HHDk5EXIE/UoPnOi4IaOA
	E8Qw7YDuPt4a6v/kjM4Ozla5C0Vul5RJv+EuNlubxje4P/dLLP3Z29iFhF0E6N5qwNN9wL1L8j2
	aHEik0Sml4V1xWQnNRJ5kjk6Rs6SqzO1qPdpFhL15kd1BP/RJ7/Nheh/p17wrtge0frK24h0sq5
	wQfrIKsGFBTqTRBK9onHTvYSAxMqlo2LTJdMAwrLt3CE1Zg/kQZvycXvI2iEBkPjAf9lnHuI/06
	gGSaOBXmEXY980scSWpdxiI0lmD
X-Received: by 2002:a05:600c:608f:b0:499:a4d1:d7d9 with SMTP id 5b1f17b1804b1-499c19d7367mr87893805e9.9.1787471492568;
        Sun, 23 Aug 2026 00:51:32 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8601:39db:494d:605c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499bd581a49sm40990695e9.1.2026.08.23.00.51.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 00:51:29 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] ed: upgrade 1.22.5 -> 1.22.6
Date: Sun, 23 Aug 2026 08:51:25 +0100
Message-ID: <20260823075125.1733690-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260823075125.1733690-1-richard.purdie@linuxfoundation.org>
References: <20260823075125.1733690-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2026 07:51:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244020

Changes in version 1.22.6:

"""
Some changes have been made to the code to pacify gcc's static analyzer.

'regex(7)' has been added to the --help output and to section 'SEE ALSO' in
the man page.

It has been documented in the manual that the cut buffer is deleted when a
new file is read with 'e' or 'E'.

It has been documented in the manual that using a regular expression inside
the command-list of a global command may cause the "last regular expression
processed" to differ between the first and subsequent executions of the
command-list.
"""

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/ed/{ed_1.22.5.bb => ed_1.22.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/ed/{ed_1.22.5.bb => ed_1.22.6.bb} (93%)

diff --git a/meta/recipes-extended/ed/ed_1.22.5.bb b/meta/recipes-extended/ed/ed_1.22.6.bb
similarity index 93%
rename from meta/recipes-extended/ed/ed_1.22.5.bb
rename to meta/recipes-extended/ed/ed_1.22.6.bb
index 0301dd42c98..e65fe835abd 100644
--- a/meta/recipes-extended/ed/ed_1.22.5.bb
+++ b/meta/recipes-extended/ed/ed_1.22.6.bb
@@ -19,7 +19,7 @@ bindir = "${base_bindir}"
 SRC_URI = "${GNU_MIRROR}/ed/${BP}.tar.lz"
 UPSTREAM_CHECK_URI = "${GNU_MIRROR}/ed/"
 
-SRC_URI[sha256sum] = "56e107ddc2f29dad6690376c15bf9751509e1ee3b8241710e44edbe5c3a158cc"
+SRC_URI[sha256sum] = "3f33b22135219c39c3c695f7b7171c2567d3e2a17c798c0a90607320cbb268f2"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 

