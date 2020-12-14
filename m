Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web12.36007.1607958571713752365
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 07:09:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fHufpzto;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id 22so5601699qkf.9
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 07:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7r3eGDnX9igTZWI8Ggcq6R/82CmZOvULgInNLe8AQKg=;
        b=fHufpztofMQEYlIV0iZ3zkWc62+g4vK7tNn9vyK2+bksSwLPUmUyLMYvQccE3jevIV
         beZ5jNOl2FYtVybq15N1F4QAz+GpcrVSRnJ3srtZhcpfanZTymrZzDN9Q2ZVSS2KuRzV
         8Lsl5ACKzD8+bZ1I4FFzm9MNCr/LiP01+SdFfpObz34fni2RLsU6zsDzeZGVaC8vxwMS
         eFZJpyBH6+mauLJpBjFT47evJv8xfRhdKNUfGzzzjU+/DwzmgNWkTpUWnnGKHGHEnrwH
         4szL2Vv+Z6rlk7K1nsKfTjXOOOU/M5orm7RKefZp/7k/qRoG7b4yERfwb/n/yJDLZ8Dv
         psXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7r3eGDnX9igTZWI8Ggcq6R/82CmZOvULgInNLe8AQKg=;
        b=tMfiYtDXizAYBlMbvRl2Y3gW/Xmpm1GjccKFijNSI3ZqFE4Pwhe5h8ZF9a6AOGVjH4
         R4YRuvLl05+kV2bXf1FqkXHO9mgDFBlgECsap3Qn4NkYVf9F6AMyrmyCFyO/22pmWXvA
         eldBVhXKtP4o4KLOnqpYsy5iMSe8bRic3LykTUmOENpZTBxpRwfcK58H+pUhSwliZ3CF
         aWjooXeJGeFMb3QoNW3MngkjVfGZU6GF1dZdEDkf18FGTjEPXLi3v/Mh01kxrpCcj6C4
         LTwFf0AEFe+QYUKX/hBVxDD/mWwKB6FDepJLE1cDs57mNcsgGJ1K0CnGw5ajGwsF8Dn9
         pDSw==
X-Gm-Message-State: AOAM530BPd6jTBzrtc1kVAIGB9WW6a0ynGkzk+uLvHabCNfgIr0z2xmt
	3pT7i6yaiWLuykNGJh7BziQ=
X-Google-Smtp-Source: ABdhPJz+sw/C0E0SF4xeqeab1aiGaUXxeyEW27qiwKTVPmSN1ajBEbWVc1OvI6sC6DiUGJHAnSDQXA==
X-Received: by 2002:a37:5242:: with SMTP id g63mr32248287qkb.317.1607958570884;
        Mon, 14 Dec 2020 07:09:30 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id a194sm13565070qkc.70.2020.12.14.07.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 07:09:30 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/8] kern-tools: non-gcc config support and option re-classification
Date: Mon, 14 Dec 2020 10:09:19 -0500
Message-Id: <b4e15cbba75d1832e39c334a4e3b0798ccea74b8.1607958349.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1607958349.git.bruce.ashfield@gmail.com>
References: <cover.1607958349.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commits:

  1aa9046 merge_config.sh: Translate some env variables to make variables
  6fdcd64 symbol_why: allow re-classification from non-hardare to hardware

With these, a non-gcc compiler can be used, since the invocation of the
kernel configuration explicitly passes the variables as command line
vars, versus environment variables. This means the kernel Makefile
assignments are overriden and the desired compiler used.

With option re-classification, we can inhibit warnings when an option
has incorrectly been classified has 'hardware', and hence triggers a
visible warning.

[merge_config.sh: Translate some env variables to make variables]
Signed-off-by: Tyler Hicks <tyhicks@linux.microsoft.com>
[symbol_why: allow re-classification from non-hardare to hardware]
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index ea33732a3e..d2dfd8c8a8 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://tools/kgit;beginline=5;endline=9;md5=9c30e971d435e249
 
 DEPENDS = "git-native"
 
-SRCREV = "df4390b18a500a1a7d4695e1856971f8e36ce517"
+SRCREV = "1aa90463ad5d63f51aeeefed84fd6618b17da157"
 PR = "r12"
 PV = "0.2+git${SRCPV}"
 
-- 
2.19.1

