Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE9BCDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 15:51:51 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.130299.1697471506113943381
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Oct 2023 08:51:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=OIJh6qG+;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-32db8f8441eso793458f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 08:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1697471504; x=1698076304; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GXo4Z/4rcL5S8BTikgGkq5EVtSw4IbdBNVdi9sLN4Ow=;
        b=OIJh6qG+hoZq2TdWgUPvJeaOfUhdtGBcLhw9/7JjYXSouSlwzX4pW+EtRnccItoScg
         g1nCcaOz+h0mvYQtUPA7KaRKuraK7RKuDDnPcU3XPcUlfR1UQqZw4FX1iF3fFSY+Uz7u
         hzXruy9HdxVugiUaUK+O7liZNHHFP7lEV/4i23DBde8eyM8J3+TXUfNOk7HkAetZDacO
         Q/ozUKkTDVww20NKEsQjAOkPLTk0FKOy++nX4w82+MBs+pWYuL6mG2ly2tcXnqGlD2Kh
         qfYwbacngG5JcDogmYdnFaEpZVQrGIQQVgHvFWKYoTIP4wiAh6ajTgFVp/GCRBtLF8yw
         EzIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697471504; x=1698076304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GXo4Z/4rcL5S8BTikgGkq5EVtSw4IbdBNVdi9sLN4Ow=;
        b=QqzR8WL5lcVyxb1xZsn6rYakGpIT6JtNnGia/ExMlYnlhbRu3Wnd5pi7Ie6O4tl0Gh
         8i6TnlSKtl0/1aEew5igMnXfoRPq51giAPKTaFcYqeoqToZafgfZWS+ubaHkmtmBJugp
         AiCga0RkYgflE4vcYge3LX8QFz7P/5tgeJeHDmo5Rsf2taNmCh1TxXfgqGhlvlw83XKs
         owijsNaJt8bf07XuMEr39s8MvXRC3qEd2EikDpc8c2KWattWvvwgEi0Z+BMwqSGA+yY+
         K7hro2csuj3Pmue9cgkPjS1LJ9IfLk2MGl9X9bcgxUdq85MiFzfI1BIUJbBnUf24961j
         fjsw==
X-Gm-Message-State: AOJu0YxzfVQo+TeGfhR+DUZZYJoFlDAj5LJELB+yQgyt7k0VdltoM96v
	Hirk3+8RZ7xe6vp57UQghDkBOg7y8zNJrAYgaOw=
X-Google-Smtp-Source: AGHT+IHbSlrTTJJt2j/BMuqG7Igjunv5dlkQPPJpUpFlIBvSl/rodjdzvM/Tw16n90MyfWE7oqkJcA==
X-Received: by 2002:a5d:58eb:0:b0:32d:bef3:8b23 with SMTP id f11-20020a5d58eb000000b0032dbef38b23mr847571wrd.62.1697471503944;
        Mon, 16 Oct 2023 08:51:43 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id l23-20020a056402231700b0053e89721d4esm54132eda.68.2023.10.16.08.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 08:51:43 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Mark Hatle <mark.hatle@amd.com>
Subject: [PATCH 2/2] insane: unimplemented-ptest: ignore source file errors
Date: Mon, 16 Oct 2023 17:51:13 +0200
Message-Id: <20231016155113.54796-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231016155113.54796-1-yoann.congal@smile.fr>
References: <20231016155113.54796-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 15:51:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189302

In some cases, pathlib.Path.glob() might throw FileNotFoundError when
file/directory disappear while it is iterating over them.

This "warning" is not important enough to crash build in this case so
just take a bb.note of the problem and move on.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Reported-by: Mark Hatle <mark.hatle@amd.com>
Closes: https://lists.openembedded.org/g/openembedded-core/message/189254
---
 meta/classes-global/insane.bbclass | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index f7a2c392cf..6f3cd3026d 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1353,16 +1353,22 @@ python do_qa_patch() {
     ###########################################################################
     def match_line_in_files(toplevel, filename_glob, line_regex):
         import pathlib
-        toppath = pathlib.Path(toplevel)
-        for entry in toppath.glob(filename_glob):
-            try:
-                with open(entry, 'r', encoding='utf-8', errors='ignore') as f:
-                    for line in f.readlines():
-                        if re.match(line_regex, line):
-                            return True
-            except FileNotFoundError:
-                # Broken symlink in source
-                pass
+        try:
+            toppath = pathlib.Path(toplevel)
+            for entry in toppath.glob(filename_glob):
+                try:
+                    with open(entry, 'r', encoding='utf-8', errors='ignore') as f:
+                        for line in f.readlines():
+                            if re.match(line_regex, line):
+                                return True
+                except FileNotFoundError:
+                    # Broken symlink in source
+                    pass
+        except FileNotFoundError:
+            # pathlib.Path.glob() might throw this when file/directory
+            # disappear while scanning.
+            bb.note("unimplemented-ptest: FileNotFoundError exception while scanning (disappearing file while scanning?). Check was ignored." % d.getVar('PN'))
+            pass
         return False
 
     srcdir = d.getVar('S')
-- 
2.30.2


