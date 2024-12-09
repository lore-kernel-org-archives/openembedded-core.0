Return-Path: <ohnatiuk@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BE43E7717D
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 20:29:44 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.web10.112281.1733776182962851427
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Dec 2024 12:29:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=RhpCWiA1;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: ohnatiuk@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1520; q=dns/txt; s=iport;
  t=1733776183; x=1734985783;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7ZCgII8DdSIwr1H+6bVVbDuDUGA4le88fimcjOOMEDM=;
  b=RhpCWiA1u5jQjZ9tq07OCmbS/5IK1NB9YBWlF06pTzFWU1mrtEbdy3Gq
   afL5n4fMIJbQabDNnXt0oO48QSExzV/+Sbo5UbO7TxvqDDJJ7qkAzznps
   ce7FS0RHRsPe4HWk7lzstFRglccD7ItNMkNZku1xfmVToZnaUacEK+K+E
   Q=;
X-CSE-ConnectionGUID: FY0ssGi0ROibJ7cLyLag6w==
X-CSE-MsgGUID: 9WQD5UE3Tq+I6nUaMB3qKQ==
X-IPAS-Result: =?us-ascii?q?A0BrCQDkUVdnj5D/Ja1aHAECPQEEBAEQAQcBgV0CAYM+W?=
 =?us-ascii?q?kJIlCKCIZ4bgSUDVg8BAQEPFAIbEwQBAY9yAiY0CQ4BAgQBAQEBAwIDAQEBA?=
 =?us-ascii?q?QEBAQEBAQELAQEFAQEBAgEHBRQBAQEBAQE5BUmFew1JAQwBhjwBghaDAQGCZ?=
 =?us-ascii?q?AIBrzWCLIEBhHvZOIFtgUgBjUmFZycbgUlEglCCLYUQhXcEhSKDeYwNkAdIg?=
 =?us-ascii?q?SEDWSERAVUTDQoLBwWBdAM5DAsxFYNggQOCSWlLOgINAjaCJHyCTYUXhGmEW?=
 =?us-ascii?q?IYkghlCQAMLGA1IESw3FBsGPm4HmmABRoNZAXoJCoE9Z4EComaCIKEBhCSMF?=
 =?us-ascii?q?5UtGjOFW6R1AZh7pESEZoFnOoFbMxoIGxWDIglJGQ+OOolGuTIiNTwCBwsBA?=
 =?us-ascii?q?QMJjUCEbwEB?=
IronPort-Data: A9a23:YXqvHKggLxred81MbJtgMUGPX161axAKZh0ujC45NGQN5FlHY01je
 htvXT/SOvyNNmv3eYsjOYm39R4H75WDyYUwSAI4+HpkHn9jpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOCn9SQkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZSFULOZ82QsaD5NsfrS8EkHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqU2y75sGk5Pr
 cY/KTovMRunlsa/z+ykH7wEasQLdKEHPasFsX1miDWcBvE8TNWbHOPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZgt/5JEWxI9EglH4cztRtFOIpoI84nPYy0p6172F3N/9IY3WHJoPwRjAz
 o7A1zXGOz1HCfHE9SPG0yyqu+bqt3jie7tHQdVU8dYx3QXMnTZMYPEMbnO8ufS/h0u0Vt5TJ
 kBR8S00oIA29Ve3VZ/6RxC+rXuOsxIQVtYWFPc1gDxh0YLO6AqfQ2xBRTlbZZl+64k9RCch0
 RmCmNaB6SFTXKO9Z0PF7ay7rGuIHikfDzAJQT4gRARb/Iy2yG0stS7nQtFmGa+zq9T6HzDs3
 jyHxBTSYZ1N1qbnMI3lpjj6byKQm3TfcuIiCuzqsoOZAuFROdXNi2+AsASzARN8wGCxFAjpU
 J8swJT20Qz2JcvR/BFhuc1UdF1T296LMSfHnXlkFIQ7+jKm9haLJN8Lu28ufhk4aZlfJFcFh
 XM/XysMvve/21P3PcdKj36ZUZ5CIVXITI68D6uFNLKinLAoJFPaoEmCmnJ8L0i2zRBzyvtgU
 XtqWc2tFn0dQb921ya7QvxV0LkggEgDKZD7G/jGI+Cc+ePGPha9EO5dWHPXN7BRxP3f+m39r
 Y0AX/ZmPj0DC4USlAGLqtZLdTjn7BETWfjLliCgXrXbeVQ/SD9xUa65LHFIU9UNopm5X9zgp
 hmVMnK0AnKl7ZEbAW1mskxeVY4=
IronPort-HdrOrdr: A9a23:Yfok4q+BlSiElNISTMZuk+DLI+orL9Y04lQ7vn2ZLiYlEfBw+P
 rAoB1273XJYVUqOE3I5+rvBEDoexq1nqKdirN8AV7NZmTbUROTTb2LKeDZsljd8+qUzJ8+6Z
 td
X-Talos-CUID: 9a23:Is4DrWB/NzCfgun6EwdWrFUPNcF9SFrcxlWPKGupLW9mFqLAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3AP8ovqw+/apepUv9In+UhJkyQf5ZX2ojzNW1WrYx?=
 =?us-ascii?q?FmpeCCCVVEWyErw3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.12,220,1728950400"; 
   d="scan'208";a="394172760"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 09 Dec 2024 20:29:42 +0000
Received: from sjc-ads-3960.cisco.com (sjc-ads-3960.cisco.com [171.68.251.157])
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTP id F28FD18000236;
	Mon,  9 Dec 2024 20:29:41 +0000 (GMT)
From: Oleksandr Hnatiuk <ohnatiuk@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/selftest: Fix failure when configuration contains BBLAYERS:append
Date: Mon,  9 Dec 2024 12:29:41 -0800
Message-Id: <20241209202941.1056020-1-ohnatiuk@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.251.157, sjc-ads-3960.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 20:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208494

When used with `--newbuilddir` option, it replaces relative paths in
BBLAYERS variable with absolute paths by evaluating the final value of
the variable, converting paths and saving result by assignment
(`BBLAYERS =`) at the end of bblayers.conf.

This breaks tests when bblayers.conf contains BBLAYERS:append because
:append statements are evaluated after all assignments and we end up
with the appended layer added twice - first by evaluating final value
of the variable, then again by bitbake evaluating BBLAYERS:append.

The error is as follows:
AssertionError: Command 'bitbake  -e' returned non-zero exit status 1:
ERROR: Found duplicated BBFILE_COLLECTIONS 'layer-name', check bblayers.conf or layer.conf to fix it.

Signed-off-by: Oleksandr Hnatiuk <ohnatiuk@cisco.com>
---
 meta/lib/oeqa/selftest/context.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index acc3b073bd11..5eb4cc44fd3c 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -114,6 +114,7 @@ class OESelftestTestContext(OETestContext):
                 bblayers_abspath = [os.path.abspath(path) for path in bblayers.split()]
                 with open("%s/conf/bblayers.conf" % newbuilddir, "a") as f:
                     newbblayers = "# new bblayers to be used by selftest in the new build dir '%s'\n" % newbuilddir
+                    newbblayers += 'unset BBLAYERS\n'
                     newbblayers += 'BBLAYERS = "%s"\n' % ' '.join(bblayers_abspath)
                     f.write(newbblayers)
 
-- 
2.35.6


