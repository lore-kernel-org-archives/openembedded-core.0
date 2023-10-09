Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBFF1E95A8E
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 07:50:27 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.56080.1696837825181048048
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Oct 2023 00:50:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=o/7KFMI+;
 spf=pass (domain: baylibre.com, ip: 209.85.208.54, mailfrom: jstephan@baylibre.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5384975e34cso7450417a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Oct 2023 00:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696837823; x=1697442623; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I97/vFCr26xokPfIA7AtkdYO/JYS+l400FZFhT38YL0=;
        b=o/7KFMI+Kxx/yQr4HPE/E+W5aemaPJeY38JyT3f7GZq5TpzqGODTg3J4Qya/rXGmFz
         5cLNY2/xG+xjkvruxXeD//fj/vy1idU0QPTS5/+6aW/YrlJa4vOyR7xfUHLFdbwFp0ZY
         MJPNP29GlTobLfwDmY+MV9117EOIOpw+ODT09w19JeMP+IlpF9FaFO0UFpRWYXrwaVRR
         ySBr7PTCc4LCfMAdlarhO4KdTd47keXN8Cc+CewTs7tOfLvPJjmHz21yMlLqHpMbtRHy
         PGCbOyPx0Hn9m3U9pPvSNkP7i0QTn0YICqg27/UTBy1kzfXJvIDn2c4H+EFUZe1BoNlH
         ylOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696837823; x=1697442623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I97/vFCr26xokPfIA7AtkdYO/JYS+l400FZFhT38YL0=;
        b=eo54JPyZ9gna77BYZ1OMTAnXKmQ+AWhbi/Uvh0pm1E010LKH5uSl+82f46JO8l1a25
         nTphD2Gk5R0yanCE1ZPVSqN9qOgqXa4rgxVrMXve4D3x/2pHB24URBtuCGEDp9VLszTJ
         2AOb7ezG81TaCtgaVHGxABVzyxWQESe0E/oLiLn+QuPADE5uO6ZWo91WSygckrgFAWCg
         NkfxX2clYiN1vpPrpPcZkTXKQ4SN20+Lm6jBr3duKMX7fkaHjIYfdqJe4vZN5VL5fW5o
         Rndx0WGD22C4JFu1i7LRQtKS5p540lZWY4M0bKwHL+cdrVvvkbj/JAZZQ0oz8W4rNwgU
         TZQg==
X-Gm-Message-State: AOJu0YxL7sypgu7jw0oxT6ak6ELwbcU5KMOugYMbyfb26VIB2Tm1T+Sf
	Ijby5jxP/1kNmDdpc2cGYbquzueOkgXcctSn7gUmHw==
X-Google-Smtp-Source: AGHT+IF53t3/Iup3fBZKND05SXD1e3Hfxnm/J/7PDB5IHiU2CWRdQiarGhNJXR5jQXw76jA8pxZVQu014/ROIMVpTfM=
X-Received: by 2002:a05:6402:1812:b0:52c:e607:3866 with SMTP id
 g18-20020a056402181200b0052ce6073866mr13162661edy.32.1696837823376; Mon, 09
 Oct 2023 00:50:23 -0700 (PDT)
MIME-Version: 1.0
References: <20231007174701.1890063-1-chris.laplante@agilent.com> <20231007174701.1890063-2-chris.laplante@agilent.com>
In-Reply-To: <20231007174701.1890063-2-chris.laplante@agilent.com>
From: Julien Stephan <jstephan@baylibre.com>
Date: Mon, 9 Oct 2023 09:50:11 +0200
Message-ID: <CAEHHSvZwgpmps095TUSqd31kSvBW-7eTcYB8g2rQeXzAKdw_nA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] oeqa/selftest/devtool: fail if non-selfest
 workspace layer present
To: chris.laplante@agilent.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Oct 2023 07:50:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188829

Le sam. 7 oct. 2023 =C3=A0 19:47, Chris Laplante via lists.openembedded.org
<chris.laplante=3Dagilent.com@lists.openembedded.org> a =C3=A9crit :
>
> The tests will fail anyway (since you will have two 'workspacelayer'
> layers), so might as well make it fail faster and be clear.
>

Hi Chris,

FYI I also sent a patch to fix this issue the day just before you :)
You can find it here:
https://lists.openembedded.org/g/openembedded-core/message/188767

I do a check directly on the setUpModule. I also noticed that
devtool.DevtoolAddTests.test_devtool_add just hangs
if there is a local workspace but I didn't investigate it ;)

Cheers
Julien

> Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
> ---
>  meta/lib/oeqa/selftest/cases/devtool.py | 36 ++++++++++++++++++++++---
>  1 file changed, 33 insertions(+), 3 deletions(-)
>
> diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/self=
test/cases/devtool.py
> index b577f6d62a..2c38eeca17 100644
> --- a/meta/lib/oeqa/selftest/cases/devtool.py
> +++ b/meta/lib/oeqa/selftest/cases/devtool.py
> @@ -3,7 +3,7 @@
>  #
>  # SPDX-License-Identifier: MIT
>  #
> -
> +import dataclasses
>  import os
>  import re
>  import shutil
> @@ -11,6 +11,7 @@ import tempfile
>  import glob
>  import fnmatch
>  import unittest
> +from typing import List
>
>  from oeqa.selftest.case import OESelftestTestCase
>  from oeqa.utils.commands import runCmd, bitbake, get_bb_var, create_temp=
_layer
> @@ -90,6 +91,12 @@ def tearDownModule():
>          bb.utils.edit_bblayers_conf(bblayers_conf, None, None, bblayers_=
edit_cb)
>      shutil.rmtree(templayerdir)
>
> +@dataclasses.dataclass
> +class BBLayerConfEntry:
> +    layer: str
> +    path: str
> +    priority: int
> +
>  class DevtoolTestCase(OESelftestTestCase):
>
>      def setUp(self):
> @@ -100,6 +107,29 @@ class DevtoolTestCase(OESelftestTestCase):
>                          'This test cannot be run with a workspace direct=
ory '
>                          'under the build directory')
>
> +        # Ensure there is no actual workspace dir enabled
> +        self.assertFalse(self.is_external_workspace_layer_enabled(),
> +                         "This test cannot be run with a workspace layer=
 in bblayers.conf")
> +
> +    def is_selftest_workspace_layer_enabled(self):
> +        """Returns true if the selftest workspace layer is enabled in bb=
layers.conf"""
> +        return any([layer for layer in self._read_bblayers() if
> +                    layer.layer =3D=3D "workspacelayer" and layer.path =
=3D=3D self.workspacedir])
> +
> +    def is_external_workspace_layer_enabled(self):
> +        """Returns true if a workspace layer (that wasn't installed by s=
elftest) is enabled in bblayers.conf"""
> +        return any([layer for layer in self._read_bblayers() if
> +                    layer.layer =3D=3D "workspacelayer" and layer.path !=
=3D self.workspacedir])
> +
> +    def _read_bblayers(self) -> List[BBLayerConfEntry]:
> +        """Call bitbake-layers show-layers and return list of layers"""
> +        ret =3D []
> +        for line in runCmd('bitbake-layers show-layers').output.splitlin=
es():
> +            line =3D line.strip()
> +            if match :=3D re.match(r'^(\S+) +([^\n]*?) +(\d+)$', line):
> +                ret.append(BBLayerConfEntry(match[1], match[2], match[3]=
))
> +        return ret
> +
>      def _check_src_repo(self, repo_dir):
>          """Check srctree git repository"""
>          self.assertTrue(os.path.isdir(os.path.join(repo_dir, '.git')),
> @@ -327,8 +357,8 @@ class DevtoolTests(DevtoolBase):
>
>      def test_create_workspace(self):
>          # Check preconditions
> -        result =3D runCmd('bitbake-layers show-layers')
> -        self.assertTrue('\nworkspace' not in result.output, 'This test c=
annot be run with a workspace layer in bblayers.conf')
> +        self.assertFalse(self.is_selftest_workspace_layer_enabled(),
> +                         "This test cannot be run with the selftest work=
space layer in bblayers.conf")
>          # remove conf/devtool.conf to avoid it corrupting tests
>          devtoolconf =3D os.path.join(self.builddir, 'conf', 'devtool.con=
f')
>          self.track_for_cleanup(devtoolconf)
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188798): https://lists.openembedded.org/g/openembedde=
d-core/message/188798
> Mute This Topic: https://lists.openembedded.org/mt/101820643/4356723
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [js=
tephan@baylibre.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

