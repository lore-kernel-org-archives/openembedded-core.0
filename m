Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E236AC10F09
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 15:59:52 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.72357.1701705583932054731
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 07:59:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=dR3Sijx4;
 spf=pass (domain: baylibre.com, ip: 209.85.221.46, mailfrom: jstephan@baylibre.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3333a3a599fso1092989f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 07:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701705581; x=1702310381; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nIx7YvnjCa/8+Bz2qxleueOV9KZV5Mvl+9gLDQ8rN2w=;
        b=dR3Sijx4y8e63zESkUva7cD+iJcMuzldXahdlgnB8r5iGcsBO39E33exR9XOmad40o
         Og4YdWDRvJK324U/wEbgA+WlHh7eBoQPBohLbrtEf8coPhXvnbb5lsua+K+dR+bd3Uvo
         VIbPpFK6vrGBX2poszWP1XneyiDj20wvfRVthKd4lyszjb566aky+eKx3EoLpaOiAyTx
         291akOSVl7sqmpa7k4iC4+x+Vxv95U1vG3mFTUea7QqE2PUyNj6pfAXechqcUzY8vdDV
         yjaCE6xyqgrX+MzlBqMRTEsSqovu7z+e6hvhB2WD02+4+vYq1Ommy0vZtw84VnoNbbH9
         Dsrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701705581; x=1702310381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nIx7YvnjCa/8+Bz2qxleueOV9KZV5Mvl+9gLDQ8rN2w=;
        b=dJrxNG5iYAunzXXc3JM5l+o7L4LdJmwq1fapIk6To6MM/6fizFTbxewLUT9y2Rnus0
         /akeApJ6NwLoIUpr1OiT33C3gIBEHxacZDpll66hazb2asH2IkpuhlCyLgijUO5kXg+1
         tqjrTlz44ekDqdO5zRPOKnHHP632axTS05/0YAwFOns6xUs3OLHIYIOLt2arg7lRG48i
         et4c3yibPnNiotIPyFJaDiAC+oMoVjAKAREXKIpxVzT4TaxXiO8MlP4rRCGbRmiT+ebK
         IpnlV/aw5AZwpIIr9r40pxhWLScadwhAdTBt7Y1cDJx4hYm7pxn8/VIeHL04F0UANgke
         LQIw==
X-Gm-Message-State: AOJu0YwmMTDh6uBcpxrbNetMhgGSladcsYOPmTAlHWwhWOjKNizOLqzV
	TPLs7S8NIq2zFeyP0lHHQhXn9rhj0ZRmWNTQtBmJxQ==
X-Google-Smtp-Source: AGHT+IGmQn2IjNp5m4uin6ibYRW3IWPpdvNCX+Jxe788HB6UCerJmBRSo0ckjaCLowNyZTpxbWbudA==
X-Received: by 2002:a05:600c:155:b0:40b:5e56:7b46 with SMTP id w21-20020a05600c015500b0040b5e567b46mr2980376wmm.143.1701705581624;
        Mon, 04 Dec 2023 07:59:41 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id g16-20020a05600c4ed000b0040b47c53610sm15479595wmq.14.2023.12.04.07.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 07:59:41 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [RESEND][PATCH 0/7] Devtool/Recipetool: adding pypi support 
Date: Mon,  4 Dec 2023 16:59:27 +0100
Message-ID: <20231204155934.836992-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 15:59:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191755

Hello all,

This series adds basic support for the pypi class in devtool/recipetool.

The idea is to be able to detect that a package is available on pypi and
in that case inherits from pypi class. This helps to produce cleaner
recipes for pypi packages.

To do this, I am adding a new optional callback "process_url" that
plugin can register to implement some logic on matching url.

By implementing this callback in create_buildsys_python we can match on
pypi URLs directly or on release tarballs hosted on "files.pythonhosted.org".

To create a recipe taking advantage of the pypi class we can use one of the
following new syntax:

* recipetool create https://pypi.org/project/<package>
* recipetool create https://pypi.org/project/<package>/<version>
* recipetool create https://pypi.org/project/<package> --version <version>

or the old syntax:

* recipetool create https://files.pythonhosted.org/packages/<...>

If the URL points to a github URL or a release tarball not coming from
"files.pythonhosted.org", the created recipe is the same as before.
One can also use the newly added "--no-pypi" switch to NOT inherit 
from pypi class on matching URL, to keep legacy behaviour.

This series also contains some bug fixes I found during my testing.

Pushed my dev branch here: https://git.yoctoproject.org/poky-contrib/log/?h=jstephan/devtool-add-pypi-support 

Cheers
Julien

Julien Stephan (7):
  bitbake: utils: remove spaces on empty lines
  recipetool: create_buildsys_python.py: initialize metadata
  recipetool: create: add trailing newlines
  recipetool: create: add new optional process_url callback for plugins
  recipetool: create_buildsys_python: add pypi support
  oeqa/selftest/recipetool: remove spaces on empty lines
  oeqa/selftest/recipetool/devtool: add test for pypi class

 bitbake/lib/bb/utils.py                       |  16 +--
 meta/lib/oeqa/selftest/cases/devtool.py       |   4 +-
 meta/lib/oeqa/selftest/cases/recipetool.py    | 114 +++++++++++++-----
 scripts/lib/devtool/standard.py               |   3 +
 scripts/lib/recipetool/create.py              |  63 ++++++----
 .../lib/recipetool/create_buildsys_python.py  |  73 +++++++++++
 6 files changed, 208 insertions(+), 65 deletions(-)

-- 
2.42.0


