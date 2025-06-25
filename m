Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44F50C7115C
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 13:57:00 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.15955.1750859816030414351
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jun 2025 06:56:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=sucw5Kyq;
 spf=pass (domain: linaro.org, ip: 209.85.208.171, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32b78b5aa39so67755841fa.1
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 06:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750859814; x=1751464614; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZY3CG6rMOXTiPlWGEvJqYlCk7cfQas04IpO9Pr3QU/g=;
        b=sucw5Kyq8SDpfx2qfybNYcc0NtklKJEo5cfsT9vXMOPTtrIEJs1Lbx0nUcP4n1/C+B
         FKS/LfYDAKlCe42ZAnpKY4J0cfP34pd5HplzHwuHbMRtsGBQXxANduMORBOZACJ0fygz
         p/uXoaqCNQ6g3D7aJuxHkxS0Kp+9rTAF74n+DhQptYW578edfykNfG4o9whWZQP1fWGP
         dKqAoVmSq43DAeXaPOlLIJ0jNcg34qZibF7vJCsDJWXYrE7SyBUKRA8q7t55dvf5TwDT
         7EorCCAHL/t1D6y2wxl9in2Czn7lGL4vFr1luBre23eDRcAQkpADOb2ixY/lkoEi7UZ9
         T8fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750859814; x=1751464614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZY3CG6rMOXTiPlWGEvJqYlCk7cfQas04IpO9Pr3QU/g=;
        b=ASpWdB8V0d7QFgyJnDeq5IhxfS4g/iRmPpHqbTUXV0WoXz3WMBRFYaSFNvV2J7QYpm
         4/UauLtABTeaAW1RClwtNvrgyT2+kMinwH6UOS8tvsAYohssc35+XoNu1kQXU/0Kk519
         kqsoqAy/2rN6gKhQn2p/jFFQ0DEleLhzmFxYicRyerkwdaqEnNVjUb7Kw072nYDH6FGd
         TvLTyvhJzE9SwPCBTaMssCjZK0Wt+lv5N35HQbzO0amgsvft8WsyJRNayOez58QBlBrQ
         ONHoFDzbMB3bpBiihtS6EGBUodz39kn3UG3Dby6Fh1qgkgfn5kt6JWCK9ryRZUAOJi3h
         7Rzw==
X-Gm-Message-State: AOJu0Yx/O05HCjASe3QVlSUrK4daCCTRfRrxbAmKLM6ZGKoUFDX4oJm4
	heOqlvXGqMyTLLVelbli4z3TndHRuEgCtcc3i4iEoMsHBKebE+B6v542iL9MLPk1PWPgHFum+TY
	w1dNSJGE=
X-Gm-Gg: ASbGncvsk9wtAA2oAPynkX8ZpS3DumlhT3qsw9Y0e6y8iwVIsulhQb7pYS/QNykN+oe
	FfLGYpi4T3fAGv3utTutLZ1sp8AQwaywVXTewtiUEWM3Rsq32ag7C7oW08XEMcjOcsGvoy4lzel
	xH1atjvRdmP84b2MH83ti+d5FsgDmWuIu1Cp8SUbRd+UNHIsZ0S+jXqT5R0BFA/xCqdjedbFiie
	ujZC+YlIliNR71uuaKcvMKp8e0kE7i9Xu9rZyyKGDoywoWUIawjpcU5Y9A3cKiLVdC95chLFU6N
	dukLi15W3znSOsyi9sRBUMjWzHsvLcsrXmDff/6mxZGV3RpySmKvjqgKYNzQifOYUUScyZm8zz4
	ayLjTvPSApwbeZEv+kU6dnOVnQrzIYxf33E6IVEA9W/4eziWiqA==
X-Google-Smtp-Source: AGHT+IHN0jN4zUDXYqvQ1UDVUEbyQWfUc2qFsUcEv5HIhctmJ1H5yPtJxNF3eQ0fjBcfjBceHuMybA==
X-Received: by 2002:a05:651c:20c2:b0:32a:5fe2:81bf with SMTP id 38308e7fff4ca-32cc6549139mr6017291fa.24.1750859814061;
        Wed, 25 Jun 2025 06:56:54 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32c9e553c5asm14636021fa.49.2025.06.25.06.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 06:56:53 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] oeqa runtime ethernet_ip_connman.py: remove test_set_virtual_ip reference
Date: Wed, 25 Jun 2025 16:56:40 +0300
Message-ID: <20250625135640.683672-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 13:57:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219323

It was removed. Fixes test loading after testexport.bbclass
has exported the tests:

oeqa.core.exception.OEQADependency: TestCase ethernet_ip_connman.Ethernet_Test.test_get_ip_from_dhcp depends on ethe
rnet_ip_connman.Ethernet_Test.test_set_virtual_ip and isn't available, cases available odict_keys(['apt.AptRepoTest.
test_apt_install_from_repo', 'boot.BootTest.test_reboot', 'buildcpio.BuildCpioTest.test_cpio', ...

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/runtime/cases/ethernet_ip_connman.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/ethernet_ip_connman.py b/meta/lib/oeqa/runtime/cases/ethernet_ip_connman.py
index 4e671ec0ccd4..c3be60f006c3 100644
--- a/meta/lib/oeqa/runtime/cases/ethernet_ip_connman.py
+++ b/meta/lib/oeqa/runtime/cases/ethernet_ip_connman.py
@@ -10,7 +10,6 @@ from oeqa.core.decorator.data import skipIfQemu
 class Ethernet_Test(OERuntimeTestCase):
 
     @skipIfQemu()
-    @OETestDepends(['ethernet_ip_connman.Ethernet_Test.test_set_virtual_ip'])  
     def test_get_ip_from_dhcp(self): 
         (status, output) = self.target.run("connmanctl services | grep -E '*AO Wired|*AR Wired' | awk '{print $3}'")
         self.assertEqual(status, 0, msg='No wired interfaces are detected, output: %s' % output)
-- 
2.43.0


