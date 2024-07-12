Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DC21C41513
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 13:10:42 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.7397.1720789841612004975
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jul 2024 06:10:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MXJs6zKt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4279ca8af51so8667565e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 06:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720789840; x=1721394640; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k4U9Y2nwJ71OqXd5d695Fkn/6fyHGJ9gAEG5hiRzmio=;
        b=MXJs6zKtMZhyjjvgoOPCVHRxWwu1C2Uely3xt32rETdjIIpfSgE43J0BKqc0DHAFXv
         Pm/HHxBvxSRYDAddGhKT2Q+qGbmkix4JGXDGoxgME2u6D++u/ZF65OrYVgETGHwgL7ZC
         GC9N5NVjNdcgxrUec3w5Ib/xVtoesn1uDX2WE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720789840; x=1721394640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k4U9Y2nwJ71OqXd5d695Fkn/6fyHGJ9gAEG5hiRzmio=;
        b=d2jUvf+QVsh3iaOqdDBGJvyqmKQDTE5KRjQNFtz5sS/F6G2YEeYu3di8M2iC7EOJfE
         RMr5i3QpnvcXjNYZWMEA3z2+kL9atx24eVnD0shBOUxSurKnrolYX/qPhv+eYlsT3YDo
         IieH0HlLJZfkQyjRoYSc3elTTvuLV1j1DMarHFC/na8feOKxjQpaxERi/xUH8vjN3/JD
         uytp6oENv0wXufL7FGR01V8gSaYRYUoO4q1VnHw4PTyENjLuxN1dAyGWNWeNA77vmIfg
         de1iicCe77ATI57kcL14xZBzR0skMJ4SSUuhFRTj/cTPq9/zj72Cafli46LszTsur3yU
         XzWg==
X-Gm-Message-State: AOJu0Ywkv+FIdWLwPf0FodWJpylLJ5UmXcmREzQsMtpuu0iFdyHfsCYU
	HGl+qDeU8Q6HKomo0YFP0nl4ZmOmJn4leE4xJsYd9SqY9E1EWRiEmXEnUGvuslou7uKiHNGCG9N
	n
X-Google-Smtp-Source: AGHT+IHd2+5oQABAkbjfzjyDwUsGj5i5A1ApoeKbGWEIkk+tb2VsDHsaxS0EVrtXk2DlmjHhew8DjQ==
X-Received: by 2002:a05:600c:4a98:b0:426:64a2:5362 with SMTP id 5b1f17b1804b1-426707cf1bdmr86823825e9.8.1720789839741;
        Fri, 12 Jul 2024 06:10:39 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c138:9d7a:7e79:ba70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f23999csm23630235e9.8.2024.07.12.06.10.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 06:10:39 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] meson: Fix native meson config
Date: Fri, 12 Jul 2024 14:10:36 +0100
Message-ID: <20240712131036.1598257-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240712131036.1598257-1-richard.purdie@linuxfoundation.org>
References: <20240712131036.1598257-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 13:10:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201825

When the optimization flags were reduced to a single option, a different
and clearly untested codepath was used where the output was unquoted. This
caused errors when testing meson in the SDK.

Use repr() in the single item case as per the multiple item case to correctly
quote the output and fix build failures.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/meson/meson_1.4.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/meson/meson_1.4.0.bb b/meta/recipes-devtools/meson/meson_1.4.0.bb
index 5db100ff1cd..a0c2ee633ae 100644
--- a/meta/recipes-devtools/meson/meson_1.4.0.bb
+++ b/meta/recipes-devtools/meson/meson_1.4.0.bb
@@ -47,7 +47,7 @@ inherit meson-routines
 #   them.
 def var_list2str(var, d):
     items = d.getVar(var).split()
-    return items[0] if len(items) == 1 else ', '.join(repr(s) for s in items)
+    return repr(items[0]) if len(items) == 1 else ', '.join(repr(s) for s in items)
 
 def generate_native_link_template(d):
     val = ['-L@{OECORE_NATIVE_SYSROOT}${libdir_native}',

