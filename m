Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63A1AC6FD19
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 09:54:38 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.15610.1678442070949853378
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Mar 2023 01:54:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kLlBdbRK;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id ay14so18086928edb.11
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 01:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678442069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S/vrCF9Awpatu0nZQsPAbJhFNHE2KemoTBAgZItY95Q=;
        b=kLlBdbRKIPZoRTlWaVSiQdMn3vcun114+I8FOJZ6qaqUR3moneNiwdWSOeAezFX/4W
         cWxIpZforDUNG+Ccxr0KGX9zRMQmFtwv23+Fso8KCaLHoY2t8WKxuPhmjzwreTEmaWs7
         AGMGYJi8Zrg5keVw1fYILP8Ta81tAcbYmAET96RdFsJmEnIVjA7ERfn3vHEIe0Wfu+Ca
         xBxSFJamrWD1Im4/uZZU8zFm6GaT8IqKLdDa44Nvqb0NNcxjvkMgGQUDVpHSr9BKhMdz
         TdQHrrYDoTALt46P7eNalAONOA4JtoGFaTNqcDQl0g+CJj7kyIEr5KRl4F5wIbMo0t82
         X3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678442069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S/vrCF9Awpatu0nZQsPAbJhFNHE2KemoTBAgZItY95Q=;
        b=WcvlV6zLG+f5nl9+9I3BaT/F1cEcQnVyDKNHVMvWyLYPpMmJN/1JYVPVQZV4r4lGwi
         dCoIOIX0N8g7MTfpjQzgJO/nGeC15uO+FSXYraNed1ccHypfZsZBuFFUDbqZCuCURqmm
         P9BE+Vznoy2J2B22uv4qcKcuRAa2kOXRf93Yotr8XBTiIj81Z8j+bCAMi2wJANNjBqin
         UVAtvsk3/TaIjCajiQhuYJP2EdkypUUqw4l2/9+fNOUoskxpa2kBSIfTRviJA872Q7YV
         3Xcev89/zivYC6BF5+nV+SVUh3tzP0cLuYw0mR5CgMYD5BCpP7vbmw5RIX0GtE6JsO0c
         RQfw==
X-Gm-Message-State: AO0yUKWqk5iqfQkRp8rgsKUuEKdbmTlFDwFG55dM8329Ue4J3OkZPJaT
	er8Udk7/1MlkjlkVUZGn+Lk1D/ZUp4w=
X-Google-Smtp-Source: AK7set/jjEil756UG9CIMvQK+qRY3JK5n1W62ISlvZt2dfB53jGdTnj0jHQL8YAKET99WXWRcvA2lg==
X-Received: by 2002:aa7:d999:0:b0:4af:765b:b68e with SMTP id u25-20020aa7d999000000b004af765bb68emr24126192eds.9.1678442068995;
        Fri, 10 Mar 2023 01:54:28 -0800 (PST)
Received: from localhost.lan (BC244571.dsl.pool.telekom.hu. [188.36.69.113])
        by smtp.gmail.com with ESMTPSA id kq10-20020a170906abca00b008c405ebc32esm759549ejb.28.2023.03.10.01.54.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 01:54:28 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC] Add new python modules for building others
Date: Fri, 10 Mar 2023 10:54:15 +0100
Message-Id: <20230310095419.3487056-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <174B040A85AB843D.27660@lists.openembedded.org>
References: <174B040A85AB843D.27660@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 09:54:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178315


Some python modules use "import skbuild", "import cmake" or
"import ninja" during their builds.


