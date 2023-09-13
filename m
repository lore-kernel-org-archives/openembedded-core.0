Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9501EDEC63
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 14:30:56 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.13603.1694615451972540763
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 07:30:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Jo7vNxn8;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-68a3ced3ec6so6075315b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 07:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694615451; x=1695220251; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kVYlA16YkxQK7qZMdaRn7/QDy+TSyT2JB9Zi/PJ1tIk=;
        b=Jo7vNxn8UIklTdSG04f/EFZE1aQtKC7+BCP7vYb4QxQBVP/qIfjqxxLKybSGjXCcEb
         3DccXRytqCISH6pA/O+XSg53o7XPjxFkjw7sHMq8lTZ1yRSEhQyaTTamk1MIjjRckglJ
         3Ij9cuAw1Lw4h3tb67HQsg0Y+dpFWEUwOy4wVD4pKK2F3+h6hy70aiy24d6J1Ds51tO3
         tpCcN2ZdTl4vD4En07OpMEHcUVpoS2Tpob34GUhqY5ofwGAagttilQGZZCDy3ygZpucs
         JZ8TRmkv/lQzhfmOVvlF5wx/34ckqqvhG17bSESseQiYP7jYJjPd5z6BMt42N4YYLlPI
         PMiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694615451; x=1695220251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kVYlA16YkxQK7qZMdaRn7/QDy+TSyT2JB9Zi/PJ1tIk=;
        b=qe1dtZ36gJBh0hbKRQOw92uy4hY8a/fpgsHTaE5sNOguJBXDKpAOGGTn5cb8XfdDvL
         DDW9qtUx1Dy1SoUm8G/sbJZl/fwVXB7g00HfOseNOmlD6FJ/+XGwwq1orSveVPokFAEh
         0ntUdE/rhyh5YC4BH46pKixilc2eaD8TxYGV3Enqe6kYNmZwPRoqzjID9lfV0BofGY2l
         3GaApOcApcwBZWJnnQFT/f9IQxuXFVr3L6l/Bp0BCHZWs1ZNFRGOrDpQbLOpHOd/dzOZ
         0a98oRIinSNh1CinD6Idyc4yHmf+5Tqui8wih88EsYfB7p+AaYOOZxH92RakK6YwidRG
         W+aw==
X-Gm-Message-State: AOJu0YzrZRjGwpqWUa4ZPsAZItPHUKU5Zex7XTVewGeawbSFdgy2WC4M
	xVdzz0qlAlbcwQBWXbArXbgTGbs0nZZ5oKjV0JE=
X-Google-Smtp-Source: AGHT+IG3c4woDp9z+1753lS1IGD32lKdCrlmAdk4H5KcawIXZ4H1mcJqdgjk2adBg+FZM12AbBFTow==
X-Received: by 2002:a05:6a00:1590:b0:682:4ef7:9b0b with SMTP id u16-20020a056a00159000b006824ef79b0bmr3817010pfk.0.1694615450795;
        Wed, 13 Sep 2023 07:30:50 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u2-20020aa78382000000b00686ec858fb0sm9185796pfm.190.2023.09.13.07.30.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 07:30:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/8] python3-pygments: Fix CVE-2022-40896
Date: Wed, 13 Sep 2023 04:30:33 -1000
Message-Id: <ebb224e65a7e1402ccf0d9517bd72748c18e012e.1694613269.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694613269.git.steve@sakoman.com>
References: <cover.1694613269.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 14:30:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187596

From: Narpat Mali <narpat.mali@windriver.com>

CVE-2022-40896:
A ReDoS issue was discovered in pygments/lexers/smithy.py in pygments
through 2.15.0 via SmithyLexer.

The CVE issue is fixed by 3 different commits between the releases 2.14.0
(for Smithy lexer), 2.15.0 (for SQL+Jinja lexers) and 2.15.1 (for Java
properties) as per: https://pyup.io/posts/pyup-discovers-redos-vulnerabilities-in-top-python-packages-part-2/

1. Smithy lexer commit from 2.14.0 release applies successfully on 2.11.2 version.
Commit: https://github.com/pygments/pygments/commit/dd52102c38ebe78cd57748e09f38929fd283ad04
Hence, backported the patch as CVE-2022-40896.patch.

2. SQL+Jinja lexers commit from 2.15.0 release doesn't apply on 2.11.2 version.
Commit: https://github.com/pygments/pygments/commit/97eb3d5ec7c1b3ea4fcf9dee30a2309cf92bd194
Actually, this code doesn't exist in 2.11.2 version and it has been introduce by
python3-pygments 2.13.0 version. Hence, this is not vulnerable for 2.11.2 version.
SQL+Jinja lexers is introduced by: https://github.com/pygments/pygments/commit/0bdbd5992baca32d18e01f0ec65337e06abf9456

3. Java properties commit from 2.15.1 release also doesn't apply on 2.11.2 version.
Commit: https://github.com/pygments/pygments/commit/fdf182a7af85b1deeeb637ca970d31935e7c9d52
Actually, this code also doesn't exist in 2.11.2 version as the code has been modified
in python3-pygments 2.14.0 by: https://github.com/pygments/pygments/commit/a38cb38e93c9635240b3ae89d78d38cf182745da
Hence, this is also not vulnerable for 2.11.2 version.

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python3-pygments/CVE-2022-40896.patch     | 124 ++++++++++++++++++
 .../python/python3-pygments_2.11.2.bb         |   2 +
 2 files changed, 126 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pygments/CVE-2022-40896.patch

diff --git a/meta/recipes-devtools/python/python3-pygments/CVE-2022-40896.patch b/meta/recipes-devtools/python/python3-pygments/CVE-2022-40896.patch
new file mode 100644
index 0000000000..9848072a94
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pygments/CVE-2022-40896.patch
@@ -0,0 +1,124 @@
+From ed61747f328ff6aa343881b269600308ab8eac93 Mon Sep 17 00:00:00 2001
+From: Narpat Mali <narpat.mali@windriver.com>
+Date: Wed, 6 Sep 2023 10:32:38 +0000
+Subject: [PATCH] Improve the Smithy metadata matcher.
+
+Previously, metadata foo bar baz = 23 was accepted, but according to
+the definition https://smithy.io/2.0/spec/idl.html#grammar-token-smithy-MetadataSection
+it should be "metadata"<whitespace>Identifier/String<optional whitespace>.
+
+CVE: CVE-2022-40896
+
+Upstream-Status: Backport [https://github.com/pygments/pygments/commit/dd52102c38ebe78cd57748e09f38929fd283ad04]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+---
+ pygments/lexers/smithy.py                    |  5 +-
+ tests/examplefiles/smithy/test.smithy        | 12 +++++
+ tests/examplefiles/smithy/test.smithy.output | 52 ++++++++++++++++++++
+ 3 files changed, 67 insertions(+), 2 deletions(-)
+
+diff --git a/pygments/lexers/smithy.py b/pygments/lexers/smithy.py
+index 0f0a912..c5e25cd 100644
+--- a/pygments/lexers/smithy.py
++++ b/pygments/lexers/smithy.py
+@@ -58,8 +58,9 @@ class SmithyLexer(RegexLexer):
+             (words(aggregate_shapes,
+                    prefix=r'^', suffix=r'(\s+' + identifier + r')'),
+                 bygroups(Keyword.Declaration, Name.Class)),
+-            (r'^(metadata)(\s+.+)(\s*)(=)',
+-                bygroups(Keyword.Declaration, Name.Class, Whitespace, Name.Decorator)),
++            (r'^(metadata)(\s+)((?:\S+)|(?:\"[^"]+\"))(\s*)(=)',
++                bygroups(Keyword.Declaration, Whitespace, Name.Class,
++                         Whitespace, Name.Decorator)),
+             (r"(true|false|null)", Keyword.Constant),
+             (r"(-?(?:0|[1-9]\d*)(?:\.\d+)?(?:[eE][+-]?\d+)?)", Number),
+             (identifier + ":", Name.Label),
+diff --git a/tests/examplefiles/smithy/test.smithy b/tests/examplefiles/smithy/test.smithy
+index 3d20f06..9317fee 100644
+--- a/tests/examplefiles/smithy/test.smithy
++++ b/tests/examplefiles/smithy/test.smithy
+@@ -2,6 +2,18 @@ $version: "1.0"
+
+ namespace test
+
++metadata "foo" = ["bar", "baz"]
++metadata validators = [
++    {
++        name: "ValidatorName"
++        id: "ValidatorId"
++        message: "Some string"
++        configuration: {
++            selector: "operation"
++        }
++    }
++]
++
+ /// Define how an HTTP request is serialized given a specific protocol,
+ /// authentication scheme, and set of input parameters.
+ @trait(selector: "operation")
+diff --git a/tests/examplefiles/smithy/test.smithy.output b/tests/examplefiles/smithy/test.smithy.output
+index 1f22489..db44a38 100644
+--- a/tests/examplefiles/smithy/test.smithy.output
++++ b/tests/examplefiles/smithy/test.smithy.output
+@@ -7,6 +7,58 @@
+ ' test'       Name.Class
+ '\n\n'        Text.Whitespace
+
++'metadata'    Keyword.Declaration
++' '           Text.Whitespace
++'"foo"'       Name.Class
++' '           Text.Whitespace
++'='           Name.Decorator
++' '           Text.Whitespace
++'['           Text
++'"bar"'       Literal.String.Double
++','           Punctuation
++' '           Text.Whitespace
++'"baz"'       Literal.String.Double
++']'           Text
++'\n'          Text.Whitespace
++
++'metadata'    Keyword.Declaration
++' '           Text.Whitespace
++'validators'  Name.Class
++' '           Text.Whitespace
++'='           Name.Decorator
++' '           Text.Whitespace
++'['           Text
++'\n    '      Text.Whitespace
++'{'           Text
++'\n        '  Text.Whitespace
++'name:'       Name.Label
++' '           Text.Whitespace
++'"ValidatorName"' Literal.String.Double
++'\n        '  Text.Whitespace
++'id:'         Name.Label
++' '           Text.Whitespace
++'"ValidatorId"' Literal.String.Double
++'\n        '  Text.Whitespace
++'message:'    Name.Label
++' '           Text.Whitespace
++'"Some string"' Literal.String.Double
++'\n        '  Text.Whitespace
++'configuration:' Name.Label
++' '           Text.Whitespace
++'{'           Text
++'\n            ' Text.Whitespace
++'selector:'   Name.Label
++' '           Text.Whitespace
++'"operation"' Literal.String.Double
++'\n        '  Text.Whitespace
++'}'           Text
++'\n    '      Text.Whitespace
++'}'           Text
++'\n'          Text.Whitespace
++
++']'           Text
++'\n\n'        Text.Whitespace
++
+ '/// Define how an HTTP request is serialized given a specific protocol,' Comment.Multiline
+ '\n'          Text.Whitespace
+
+--
+2.40.0
diff --git a/meta/recipes-devtools/python/python3-pygments_2.11.2.bb b/meta/recipes-devtools/python/python3-pygments_2.11.2.bb
index 35d288c89e..6e787f23d2 100644
--- a/meta/recipes-devtools/python/python3-pygments_2.11.2.bb
+++ b/meta/recipes-devtools/python/python3-pygments_2.11.2.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=98419e351433ac106a24e3ad435930bc"
 inherit setuptools3
 SRC_URI[sha256sum] = "4e426f72023d88d03b2fa258de560726ce890ff3b630f88c21cbb8b2503b8c6a"
 
+SRC_URI += "file://CVE-2022-40896.patch"
+
 DEPENDS += "\
             ${PYTHON_PN} \
             "
-- 
2.34.1


