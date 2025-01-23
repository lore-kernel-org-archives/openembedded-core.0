Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88118C0218F
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 16:29:04 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.19435.1737658097163642393
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jan 2025 10:48:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UMlCS9BP;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alexander.v.yurkov@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aa6a92f863cso258381966b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 10:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737658095; x=1738262895; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QkFqbtGx6m9Itup0JDHCoN3ABAwsKV/pDM/a+JTyHbo=;
        b=UMlCS9BPJQwg+CpaOEQ4LzzD9ajkruZWZHxVA1kDyj+MJr6DwfM6UIk+Ky/7pyLx8u
         JIWw0UKNkKvlAY2jirOfeMWE0/7jNu9TVgCY/9DsMpALcVbNqKOTQJ8ADiHkJl8JQZhN
         8/5pj+wNm1iyIMOjdManjYcxE5ZBBbhxAQ9U43sbRl83d7jwdGAM7WrrcKphpXGBH/N9
         vAg/emzs+A/XW3q/olimBeJP7yw0L8a18qkkRA/aIafuW5A6zZeVPke8bbGMtidl1b9B
         4PvxXVngazpcMPHqSt0xv9M+vNYLpCguT6gp1IeqbRZdcmC1CEzDbp0r1SXa0SXwLLA4
         PYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737658095; x=1738262895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QkFqbtGx6m9Itup0JDHCoN3ABAwsKV/pDM/a+JTyHbo=;
        b=Aax7c8ZcR091GqCZmwSmupGYhDXjw1bAAeqLrNMEhEOxazSD3TRRUObc75/MZrznhv
         G6KLwTzsn1ChH+BWeL0kx6TZlHwj1/nLdxnWtiRxkQFgVqMT7vo+09zJa+CWqxXR6Xh5
         z+trpQpzstBJuW2jmcdBsJxJPod31EdRWHtmWc+37rB4deC6HsjY0+GeeknyBxy5DLv2
         CKgdsPVtF6fu9UUgzd9/RsOHUZAUkle/GviBoQs0TmueRpYNYIwyV5oZBPYD+7fE1YXo
         w6KLx0ifb+pOBIuNF10MDw8O1h4Pu+XNt9bnSRY2R68ogBYEWZ+FDAKvTJKM7y6ckmqc
         vGxg==
X-Gm-Message-State: AOJu0YzW+DTEPBgEiu/lDceudPZXemkpJZ/eg1ETiS9B7JgSaxY/TY2G
	x+IW3EvXVG19tRPpeTAtlbPzUvO0miFyAkwaqNlaayrAT+yMV1gd7AgbACL9auk=
X-Gm-Gg: ASbGncunRf2EQOXwBROiXq25S4Ss3qHjgED3wHL2y+IYHn+S6qzpr2nNhDdkFfVpL+H
	yZvMMgzFDtq26Q85YeZ//XDnctz4evqQZnY8MqTBLxctCN4L1QZnxII/blb7YTnFQ+O30fDgsxG
	yijnX3OtF1v+Lkn6dCvz8AbyQebK3ByRYyxZdBfjmG0pMkUr4FfEBZ1qcMaraphZeFTwXtfIjfW
	DlnIpGrW264zRL+4H8OCIQKsbAsH0OtKAKbTlG3eYEU0REqxbBzwwERo5vT3HbkY1XzoVBkXaUP
	+ART67LVn6mFhHsecWQn
X-Google-Smtp-Source: AGHT+IGMpKToY4XWqo3rquzROOGHawkfmk8dJCoOftQQaM3xorc9WevHOJaPPp7WQbDVM0U1rhUMMA==
X-Received: by 2002:a17:907:3e1f:b0:aaf:117c:e929 with SMTP id a640c23a62f3a-ab38b51c914mr2679792766b.57.1737658094890;
        Thu, 23 Jan 2025 10:48:14 -0800 (PST)
Received: from Ubuntu-2204-jammy-amd64-base.. ([2a01:4f8:272:3f67::2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab676117255sm2005066b.165.2025.01.23.10.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 10:48:14 -0800 (PST)
From: alexander.v.yurkov@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Alexander Yurkov <alexander.v.yurkov@gmail.com>,
	Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH 1/2] oeqa/selftest/recipetool: Update create_go test.
Date: Thu, 23 Jan 2025 18:47:39 +0000
Message-Id: <20250123184740.1815534-1-alexander.v.yurkov@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 16:29:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210234

From: Alexander Yurkov <alexander.v.yurkov@gmail.com>

Adjust test_recipetool_go_create test to a smaller repository.
Combine test_recipetool_go_create and test_recipetool_go_replace_modules
tests into test_recipetool_go_create, the new test performs both tests.

Signed-off-by: Alexander Yurkov <alexander.v.yurkov@gmail.com>
Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 212 ++-------------------
 1 file changed, 16 insertions(+), 196 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index f742dd4d64..36557f270f 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -760,13 +760,13 @@ class RecipetoolCreateTests(RecipetoolBase):
         temprecipe = os.path.join(self.tempdir, 'recipe')
         os.makedirs(temprecipe)
 
-        recipefile = os.path.join(temprecipe, 'edgex-go_git.bb')
-        deps_require_file = os.path.join(temprecipe, 'edgex-go', 'edgex-go-modules.inc')
-        lics_require_file = os.path.join(temprecipe, 'edgex-go', 'edgex-go-licenses.inc')
-        modules_txt_file = os.path.join(temprecipe, 'edgex-go', 'modules.txt')
+        recipefile = os.path.join(temprecipe, 'recipetool-go-test_git.bb')
+        deps_require_file = os.path.join(temprecipe, 'recipetool-go-test', 'recipetool-go-test-modules.inc')
+        lics_require_file = os.path.join(temprecipe, 'recipetool-go-test', 'recipetool-go-test-licenses.inc')
+        modules_txt_file = os.path.join(temprecipe, 'recipetool-go-test', 'modules.txt')
 
-        srcuri = 'https://github.com/edgexfoundry/edgex-go.git'
-        srcrev = "v3.0.0"
+        srcuri = 'https://git.yoctoproject.org/recipetool-go-test.git'
+        srcrev = "c3e213c01b6c1406b430df03ef0d1ae77de5d2f7"
         srcbranch = "main"
 
         result = runCmd('recipetool create -o %s %s -S %s -B %s' % (temprecipe, srcuri, srcrev, srcbranch))
@@ -775,207 +775,27 @@ class RecipetoolCreateTests(RecipetoolBase):
         inherits = ['go-vendor']
 
         checkvars = {}
-        checkvars['GO_IMPORT'] = "github.com/edgexfoundry/edgex-go"
+        checkvars['GO_IMPORT'] = "git.yoctoproject.org/recipetool-go-test"
         checkvars['SRC_URI'] = {'git://${GO_IMPORT};destsuffix=git/src/${GO_IMPORT};nobranch=1;name=${BPN};protocol=https',
                                 'file://modules.txt'}
-        checkvars['LIC_FILES_CHKSUM'] = {'file://src/${GO_IMPORT}/LICENSE;md5=8f8bc924cf73f6a32381e5fd4c58d603'}
+        checkvars['LIC_FILES_CHKSUM'] = {
+            'file://src/${GO_IMPORT}/LICENSE;md5=4e3933dd47afbf115e484d11385fb3bd',
+            'file://src/${GO_IMPORT}/is/LICENSE;md5=62beaee5a116dd1e80161667b1df39ab'
+        }
 
-        self.assertTrue(os.path.isfile(recipefile))
         self._test_recipe_contents(recipefile, checkvars, inherits)
+        self.assertNotIn('Traceback', result.output)
 
         checkvars = {}
         checkvars['VENDORED_LIC_FILES_CHKSUM'] = set(
-                 ['file://src/${GO_IMPORT}/vendor/github.com/Microsoft/go-winio/LICENSE;md5=69205ff73858f2c22b2ca135b557e8ef',
-                 'file://src/${GO_IMPORT}/vendor/github.com/armon/go-metrics/LICENSE;md5=d2d77030c0183e3d1e66d26dc1f243be',
-                 'file://src/${GO_IMPORT}/vendor/github.com/cenkalti/backoff/LICENSE;md5=1571d94433e3f3aa05267efd4dbea68b',
-                 'file://src/${GO_IMPORT}/vendor/github.com/davecgh/go-spew/LICENSE;md5=c06795ed54b2a35ebeeb543cd3a73e56',
-                 'file://src/${GO_IMPORT}/vendor/github.com/eclipse/paho.mqtt.golang/LICENSE;md5=dcdb33474b60c38efd27356d8f2edec7',
-                 'file://src/${GO_IMPORT}/vendor/github.com/eclipse/paho.mqtt.golang/edl-v10;md5=3adfcc70f5aeb7a44f3f9b495aa1fbf3',
-                 'file://src/${GO_IMPORT}/vendor/github.com/edgexfoundry/go-mod-bootstrap/v3/LICENSE;md5=0d6dae39976133b2851fba4c1e1275ff',
-                 'file://src/${GO_IMPORT}/vendor/github.com/edgexfoundry/go-mod-configuration/v3/LICENSE;md5=0d6dae39976133b2851fba4c1e1275ff',
-                 'file://src/${GO_IMPORT}/vendor/github.com/edgexfoundry/go-mod-core-contracts/v3/LICENSE;md5=0d6dae39976133b2851fba4c1e1275ff',
-                 'file://src/${GO_IMPORT}/vendor/github.com/edgexfoundry/go-mod-messaging/v3/LICENSE;md5=0d6dae39976133b2851fba4c1e1275ff',
-                 'file://src/${GO_IMPORT}/vendor/github.com/edgexfoundry/go-mod-registry/v3/LICENSE;md5=0d6dae39976133b2851fba4c1e1275ff',
-                 'file://src/${GO_IMPORT}/vendor/github.com/edgexfoundry/go-mod-secrets/v3/LICENSE;md5=f9fa2f4f8e0ef8cc7b5dd150963eb457',
-                 'file://src/${GO_IMPORT}/vendor/github.com/fatih/color/LICENSE.md;md5=316e6d590bdcde7993fb175662c0dd5a',
-                 'file://src/${GO_IMPORT}/vendor/github.com/fxamacker/cbor/v2/LICENSE;md5=827f5a2fa861382d35a3943adf9ebb86',
-                 'file://src/${GO_IMPORT}/vendor/github.com/go-jose/go-jose/v3/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57',
-                 'file://src/${GO_IMPORT}/vendor/github.com/go-jose/go-jose/v3/json/LICENSE;md5=591778525c869cdde0ab5a1bf283cd81',
-                 'file://src/${GO_IMPORT}/vendor/github.com/go-kit/log/LICENSE;md5=5b7c15ad5fffe2ff6e9d58a6c161f082',
-                 'file://src/${GO_IMPORT}/vendor/github.com/go-logfmt/logfmt/LICENSE;md5=98e39517c38127f969de33057067091e',
-                 'file://src/${GO_IMPORT}/vendor/github.com/go-playground/locales/LICENSE;md5=3ccbda375ee345400ad1da85ba522301',
-                 'file://src/${GO_IMPORT}/vendor/github.com/go-playground/universal-translator/LICENSE;md5=2e2b21ef8f61057977d27c727c84bef1',
-                 'file://src/${GO_IMPORT}/vendor/github.com/go-playground/validator/v10/LICENSE;md5=a718a0f318d76f7c5d510cbae84f0b60',
-                 'file://src/${GO_IMPORT}/vendor/github.com/go-redis/redis/v7/LICENSE;md5=58103aa5ea1ee9b7a369c9c4a95ef9b5',
-                 'file://src/${GO_IMPORT}/vendor/github.com/golang/protobuf/LICENSE;md5=939cce1ec101726fa754e698ac871622',
-                 'file://src/${GO_IMPORT}/vendor/github.com/gomodule/redigo/LICENSE;md5=2ee41112a44fe7014dce33e26468ba93',
-                 'file://src/${GO_IMPORT}/vendor/github.com/google/uuid/LICENSE;md5=88073b6dd8ec00fe09da59e0b6dfded1',
-                 'file://src/${GO_IMPORT}/vendor/github.com/gorilla/mux/LICENSE;md5=33fa1116c45f9e8de714033f99edde13',
-                 'file://src/${GO_IMPORT}/vendor/github.com/gorilla/websocket/LICENSE;md5=c007b54a1743d596f46b2748d9f8c044',
-                 'file://src/${GO_IMPORT}/vendor/github.com/hashicorp/consul/api/LICENSE;md5=b8a277a612171b7526e9be072f405ef4',
-                 'file://src/${GO_IMPORT}/vendor/github.com/hashicorp/errwrap/LICENSE;md5=b278a92d2c1509760384428817710378',
-                 'file://src/${GO_IMPORT}/vendor/github.com/hashicorp/go-cleanhttp/LICENSE;md5=65d26fcc2f35ea6a181ac777e42db1ea',
-                 'file://src/${GO_IMPORT}/vendor/github.com/hashicorp/go-hclog/LICENSE;md5=ec7f605b74b9ad03347d0a93a5cc7eb8',
-                 'file://src/${GO_IMPORT}/vendor/github.com/hashicorp/go-immutable-radix/LICENSE;md5=65d26fcc2f35ea6a181ac777e42db1ea',
-                 'file://src/${GO_IMPORT}/vendor/github.com/hashicorp/go-multierror/LICENSE;md5=d44fdeb607e2d2614db9464dbedd4094',
-                 'file://src/${GO_IMPORT}/vendor/github.com/hashicorp/go-rootcerts/LICENSE;md5=65d26fcc2f35ea6a181ac777e42db1ea',
-                 'file://src/${GO_IMPORT}/vendor/github.com/hashicorp/golang-lru/LICENSE;md5=f27a50d2e878867827842f2c60e30bfc',
-                 'file://src/${GO_IMPORT}/vendor/github.com/hashicorp/serf/LICENSE;md5=b278a92d2c1509760384428817710378',
-                 'file://src/${GO_IMPORT}/vendor/github.com/leodido/go-urn/LICENSE;md5=8f50db5538ec1148a9b3d14ed96c3418',
-                 'file://src/${GO_IMPORT}/vendor/github.com/mattn/go-colorable/LICENSE;md5=24ce168f90aec2456a73de1839037245',
-                 'file://src/${GO_IMPORT}/vendor/github.com/mattn/go-isatty/LICENSE;md5=f509beadd5a11227c27b5d2ad6c9f2c6',
-                 'file://src/${GO_IMPORT}/vendor/github.com/mitchellh/consulstructure/LICENSE;md5=96ada10a9e51c98c4656f2cede08c673',
-                 'file://src/${GO_IMPORT}/vendor/github.com/mitchellh/copystructure/LICENSE;md5=56da355a12d4821cda57b8f23ec34bc4',
-                 'file://src/${GO_IMPORT}/vendor/github.com/mitchellh/go-homedir/LICENSE;md5=3f7765c3d4f58e1f84c4313cecf0f5bd',
-                 'file://src/${GO_IMPORT}/vendor/github.com/mitchellh/mapstructure/LICENSE;md5=3f7765c3d4f58e1f84c4313cecf0f5bd',
-                 'file://src/${GO_IMPORT}/vendor/github.com/mitchellh/reflectwalk/LICENSE;md5=3f7765c3d4f58e1f84c4313cecf0f5bd',
-                 'file://src/${GO_IMPORT}/vendor/github.com/nats-io/nats.go/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327',
-                 'file://src/${GO_IMPORT}/vendor/github.com/nats-io/nkeys/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327',
-                 'file://src/${GO_IMPORT}/vendor/github.com/nats-io/nuid/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327',
-                 'file://src/${GO_IMPORT}/vendor/github.com/pmezard/go-difflib/LICENSE;md5=e9a2ebb8de779a07500ddecca806145e',
-                 'file://src/${GO_IMPORT}/vendor/github.com/rcrowley/go-metrics/LICENSE;md5=1bdf5d819f50f141366dabce3be1460f',
-                 'file://src/${GO_IMPORT}/vendor/github.com/spiffe/go-spiffe/v2/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327',
-                 'file://src/${GO_IMPORT}/vendor/github.com/stretchr/objx/LICENSE;md5=d023fd31d3ca39ec61eec65a91732735',
-                 'file://src/${GO_IMPORT}/vendor/github.com/stretchr/testify/LICENSE;md5=188f01994659f3c0d310612333d2a26f',
-                 'file://src/${GO_IMPORT}/vendor/github.com/x448/float16/LICENSE;md5=de8f8e025d57fe7ee0b67f30d571323b',
-                 'file://src/${GO_IMPORT}/vendor/github.com/zeebo/errs/LICENSE;md5=84914ab36fc0eb48edbaa53e66e8d326',
-                 'file://src/${GO_IMPORT}/vendor/golang.org/x/crypto/LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707',
-                 'file://src/${GO_IMPORT}/vendor/golang.org/x/mod/LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707',
-                 'file://src/${GO_IMPORT}/vendor/golang.org/x/net/LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707',
-                 'file://src/${GO_IMPORT}/vendor/golang.org/x/sync/LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707',
-                 'file://src/${GO_IMPORT}/vendor/golang.org/x/sys/LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707',
-                 'file://src/${GO_IMPORT}/vendor/golang.org/x/text/LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707',
-                 'file://src/${GO_IMPORT}/vendor/golang.org/x/tools/LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707',
-                 'file://src/${GO_IMPORT}/vendor/google.golang.org/genproto/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57',
-                 'file://src/${GO_IMPORT}/vendor/google.golang.org/grpc/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57',
-                 'file://src/${GO_IMPORT}/vendor/google.golang.org/protobuf/LICENSE;md5=02d4002e9171d41a8fad93aa7faf3956',
-                 'file://src/${GO_IMPORT}/vendor/gopkg.in/eapache/queue.v1/LICENSE;md5=1bfd4408d3de090ef6b908b0cc45a316',
-                 'file://src/${GO_IMPORT}/vendor/gopkg.in/yaml.v3/LICENSE;md5=3c91c17266710e16afdbb2b6d15c761c'])
-
+                 ['file://src/${GO_IMPORT}/vendor/github.com/godbus/dbus/v5/LICENSE;md5=09042bd5c6c96a2b9e45ddf1bc517eed',
+                 'file://src/${GO_IMPORT}/vendor/github.com/matryer/is/LICENSE;md5=62beaee5a116dd1e80161667b1df39ab'])
         self.assertTrue(os.path.isfile(lics_require_file))
         self._test_recipe_contents(lics_require_file, checkvars, [])
 
+        # make sure that dependencies don't mention local directory ./matryer/is
         dependencies = \
-            [   ('github.com/eclipse/paho.mqtt.golang','v1.4.2', '', '', ''),
-                ('github.com/edgexfoundry/go-mod-bootstrap','v3.0.1','github.com/edgexfoundry/go-mod-bootstrap/v3','/v3', ''),
-                ('github.com/edgexfoundry/go-mod-configuration','v3.0.0','github.com/edgexfoundry/go-mod-configuration/v3','/v3', ''),
-                ('github.com/edgexfoundry/go-mod-core-contracts','v3.0.0','github.com/edgexfoundry/go-mod-core-contracts/v3','/v3', ''),
-                ('github.com/edgexfoundry/go-mod-messaging','v3.0.0','github.com/edgexfoundry/go-mod-messaging/v3','/v3', ''),
-                ('github.com/edgexfoundry/go-mod-secrets','v3.0.1','github.com/edgexfoundry/go-mod-secrets/v3','/v3', ''),
-                ('github.com/fxamacker/cbor','v2.4.0','github.com/fxamacker/cbor/v2','/v2', ''),
-                ('github.com/gomodule/redigo','v1.8.9', '', '', ''),
-                ('github.com/google/uuid','v1.3.0', '', '', ''),
-                ('github.com/gorilla/mux','v1.8.0', '', '', ''),
-                ('github.com/rcrowley/go-metrics','v0.0.0-20201227073835-cf1acfcdf475', '', '', ''),
-                ('github.com/spiffe/go-spiffe','v2.1.4','github.com/spiffe/go-spiffe/v2','/v2', ''),
-                ('github.com/stretchr/testify','v1.8.2', '', '', ''),
-                ('go.googlesource.com/crypto','v0.8.0','golang.org/x/crypto', '', ''),
-                ('gopkg.in/eapache/queue.v1','v1.1.0', '', '', ''),
-                ('gopkg.in/yaml.v3','v3.0.1', '', '', ''),
-                ('github.com/microsoft/go-winio','v0.6.0','github.com/Microsoft/go-winio', '', ''),
-                ('github.com/hashicorp/go-metrics','v0.3.10','github.com/armon/go-metrics', '', ''),
-                ('github.com/cenkalti/backoff','v2.2.1+incompatible', '', '', ''),
-                ('github.com/davecgh/go-spew','v1.1.1', '', '', ''),
-                ('github.com/edgexfoundry/go-mod-registry','v3.0.0','github.com/edgexfoundry/go-mod-registry/v3','/v3', ''),
-                ('github.com/fatih/color','v1.9.0', '', '', ''),
-                ('github.com/go-jose/go-jose','v3.0.0','github.com/go-jose/go-jose/v3','/v3', ''),
-                ('github.com/go-kit/log','v0.2.1', '', '', ''),
-                ('github.com/go-logfmt/logfmt','v0.5.1', '', '', ''),
-                ('github.com/go-playground/locales','v0.14.1', '', '', ''),
-                ('github.com/go-playground/universal-translator','v0.18.1', '', '', ''),
-                ('github.com/go-playground/validator','v10.13.0','github.com/go-playground/validator/v10','/v10', ''),
-                ('github.com/go-redis/redis','v7.3.0','github.com/go-redis/redis/v7','/v7', ''),
-                ('github.com/golang/protobuf','v1.5.2', '', '', ''),
-                ('github.com/gorilla/websocket','v1.4.2', '', '', ''),
-                ('github.com/hashicorp/consul','v1.20.0','github.com/hashicorp/consul/api', '', 'api'),
-                ('github.com/hashicorp/errwrap','v1.0.0', '', '', ''),
-                ('github.com/hashicorp/go-cleanhttp','v0.5.1', '', '', ''),
-                ('github.com/hashicorp/go-hclog','v0.14.1', '', '', ''),
-                ('github.com/hashicorp/go-immutable-radix','v1.3.0', '', '', ''),
-                ('github.com/hashicorp/go-multierror','v1.1.1', '', '', ''),
-                ('github.com/hashicorp/go-rootcerts','v1.0.2', '', '', ''),
-                ('github.com/hashicorp/golang-lru','v0.5.4', '', '', ''),
-                ('github.com/hashicorp/serf','v0.10.1', '', '', ''),
-                ('github.com/leodido/go-urn','v1.2.3', '', '', ''),
-                ('github.com/mattn/go-colorable','v0.1.12', '', '', ''),
-                ('github.com/mattn/go-isatty','v0.0.14', '', '', ''),
-                ('github.com/mitchellh/consulstructure','v0.0.0-20190329231841-56fdc4d2da54', '', '', ''),
-                ('github.com/mitchellh/copystructure','v1.2.0', '', '', ''),
-                ('github.com/mitchellh/go-homedir','v1.1.0', '', '', ''),
-                ('github.com/mitchellh/mapstructure','v1.5.0', '', '', ''),
-                ('github.com/mitchellh/reflectwalk','v1.0.2', '', '', ''),
-                ('github.com/nats-io/nats.go','v1.25.0', '', '', ''),
-                ('github.com/nats-io/nkeys','v0.4.4', '', '', ''),
-                ('github.com/nats-io/nuid','v1.0.1', '', '', ''),
-                ('github.com/pmezard/go-difflib','v1.0.0', '', '', ''),
-                ('github.com/stretchr/objx','v0.5.0', '', '', ''),
-                ('github.com/x448/float16','v0.8.4', '', '', ''),
-                ('github.com/zeebo/errs','v1.3.0', '', '', ''),
-                ('go.googlesource.com/mod','v0.8.0','golang.org/x/mod', '', ''),
-                ('go.googlesource.com/net','v0.9.0','golang.org/x/net', '', ''),
-                ('go.googlesource.com/sync','v0.1.0','golang.org/x/sync', '', ''),
-                ('go.googlesource.com/sys','v0.7.0','golang.org/x/sys', '', ''),
-                ('go.googlesource.com/text','v0.9.0','golang.org/x/text', '', ''),
-                ('go.googlesource.com/tools','v0.6.0','golang.org/x/tools', '', ''),
-                ('github.com/googleapis/go-genproto','v0.0.0-20230223222841-637eb2293923','google.golang.org/genproto', '', ''),
-                ('github.com/grpc/grpc-go','v1.53.0','google.golang.org/grpc', '', ''),
-                ('go.googlesource.com/protobuf','v1.28.1','google.golang.org/protobuf', '', ''),
-            ]
-
-        src_uri = set()
-        for d in dependencies:
-            src_uri.add(self._go_urifiy(*d))
-
-        checkvars = {}
-        checkvars['GO_DEPENDENCIES_SRC_URI'] = src_uri
-
-        self.assertTrue(os.path.isfile(deps_require_file))
-        self._test_recipe_contents(deps_require_file, checkvars, [])
-
-    def test_recipetool_create_go_replace_modules(self):
-        # Check handling of replaced modules
-        temprecipe = os.path.join(self.tempdir, 'recipe')
-        os.makedirs(temprecipe)
-
-        recipefile = os.path.join(temprecipe, 'openapi-generator_git.bb')
-        deps_require_file = os.path.join(temprecipe, 'openapi-generator', 'go-modules.inc')
-        lics_require_file = os.path.join(temprecipe, 'openapi-generator', 'go-licenses.inc')
-        modules_txt_file = os.path.join(temprecipe, 'openapi-generator', 'modules.txt')
-
-        srcuri = 'https://github.com/OpenAPITools/openapi-generator.git'
-        srcrev = "v7.2.0"
-        srcbranch = "master"
-        srcsubdir = "samples/openapi3/client/petstore/go"
-
-        result = runCmd('recipetool create -o %s %s -S %s -B %s --src-subdir %s' % (temprecipe, srcuri, srcrev, srcbranch, srcsubdir))
-
-        self.maxDiff = None
-        inherits = ['go-vendor']
-
-        checkvars = {}
-        checkvars['GO_IMPORT'] = "github.com/OpenAPITools/openapi-generator/samples/openapi3/client/petstore/go"
-        checkvars['SRC_URI'] = {'git://${GO_IMPORT};destsuffix=git/src/${GO_IMPORT};nobranch=1;name=${BPN};protocol=https',
-                                'file://modules.txt'}
-
-        self.assertNotIn('Traceback', result.output)
-        self.assertIn('No license file was detected for the main module', result.output)
-        self.assertTrue(os.path.isfile(recipefile))
-        self._test_recipe_contents(recipefile, checkvars, inherits)
-
-        # make sure that dependencies don't mention local directory ./go-petstore
-        dependencies = \
-            [   ('github.com/stretchr/testify','v1.8.4', '', '', ''),
-                ('go.googlesource.com/oauth2','v0.10.0','golang.org/x/oauth2', '', ''),
-                ('github.com/davecgh/go-spew','v1.1.1', '', '', ''),
-                ('github.com/golang/protobuf','v1.5.3', '', '', ''),
-                ('github.com/kr/pretty','v0.3.0', '', '', ''),
-                ('github.com/pmezard/go-difflib','v1.0.0', '', '', ''),
-                ('github.com/rogpeppe/go-internal','v1.9.0', '', '', ''),
-                ('go.googlesource.com/net','v0.12.0','golang.org/x/net', '', ''),
-                ('github.com/golang/appengine','v1.6.7','google.golang.org/appengine', '', ''),
-                ('go.googlesource.com/protobuf','v1.31.0','google.golang.org/protobuf', '', ''),
-                ('gopkg.in/check.v1','v1.0.0-20201130134442-10cb98267c6c', '', '', ''),
-                ('gopkg.in/yaml.v3','v3.0.1', '', '', ''),
+            [   ('github.com/godbus/dbus','v5.1.0', 'github.com/godbus/dbus/v5', '/v5', ''),
             ]
 
         src_uri = set()

