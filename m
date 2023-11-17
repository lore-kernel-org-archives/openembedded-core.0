Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BB9BC072A2
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 11:12:43 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.9053.1700219559306122820
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Nov 2023 03:12:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=L3b2g04O;
 spf=pass (domain: baylibre.com, ip: 209.85.221.51, mailfrom: jstephan@baylibre.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-32d81864e3fso1166055f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 03:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1700219556; x=1700824356; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nIx7YvnjCa/8+Bz2qxleueOV9KZV5Mvl+9gLDQ8rN2w=;
        b=L3b2g04Oh2lzmUnBdmMI9AuXFxEOi+GnlnWiQDyXDLpjc+3gMiUVnF6N81V6rtdryL
         w2NkvudvliiMewll+vpbnworMsxHmsXoKVEP/VFyxBzu9AH7qOym/R4KtEVvtRv+i3Qc
         7KczOxs5vbvdxlMpnl5eGz+41gJEfs09PqyguTMbF7UUHD3hJOrVoKE+4UT0tfzZewyk
         +6c1QadBk+yeuFgdYdatzbPkXPO9hSZ0T1yDr6g2F+L2QaU1xcTjWRLkrAaQfATgFBAn
         4r2BU8ITglX6Kv/rfnbP7gkuKrn2ifzTYAVtBNyGZSf0grcg7BXiJDDtRyY8BtNBps8t
         3RNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700219556; x=1700824356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nIx7YvnjCa/8+Bz2qxleueOV9KZV5Mvl+9gLDQ8rN2w=;
        b=tyhRcVDNLq8CQjoINaoQtRlbdkrd4RT3gFnBFQhPd7x+uv1EYunp3bEaj09+neUzTu
         4MyRfSAHvnkYXSCQWIj7k8Co6Vx37J9mfhI/62MIt7zHbB7nd75YdAinZ8FiogJV8lsk
         JfznhvqhMdOVl/TdLHT6jdztz3xjQdaxAOpwTIHzNvn22gj3qZRBxXAY4cetVC1cA2ro
         e0oaFSGUJRVxqAreVC7gvpdNPxv0moo4BbKNbx8HkH+Ffifha1JCCjC+Vskeb0PNiFo8
         EIdMPZg2afns42ouG7ihigvud2ItjqpZ3DfYqGR5Lqa80Owo14HVPF5XEp4Bel8VQLS9
         oHIg==
X-Gm-Message-State: AOJu0YxZKdlM4mFmWQmRH5erm0fnROuyVMCuqb0Bmii8w5388RpQjYcU
	wFEJfbObk8n6Yb0PtKHQWoj/uXgS7aUcUKxDh1ghsQ==
X-Google-Smtp-Source: AGHT+IHnURUm4Qgjh0hNnfEzjf8NUVQJmZa+hVkpag9OOqSJmbjjDh+3i5EpEynG2FC+OWe852i3pQ==
X-Received: by 2002:a5d:4fce:0:b0:331:6c3f:624d with SMTP id h14-20020a5d4fce000000b003316c3f624dmr651380wrw.61.1700219556332;
        Fri, 17 Nov 2023 03:12:36 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id z5-20020adff745000000b0032d829e10c0sm1982440wrp.28.2023.11.17.03.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 03:12:35 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH 0/7] Devtool/Recipetool: adding pypi support 
Date: Fri, 17 Nov 2023 12:12:11 +0100
Message-ID: <20231117111218.3344066-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 11:12:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190836

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


