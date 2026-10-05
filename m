Return-Path: <luciano.dittgen@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A88C1CA5FFE
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 17:10:26 +0000 (UTC)
Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25337.1791220220721370995
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2026 10:10:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems.com.br header.s=os header.b=CqQpXKEP;
 spf=pass (domain: ossystems.com.br, ip: 74.125.229.42, mailfrom: luciano.dittgen@ossystems.com.br)
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-3512f0ac09bso1181415eec.1
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 10:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems.com.br; s=os; t=1791220220; x=1791825020; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C3vVUDaX4KDNB7HvGI3omnz0UW7G+FgcZPsMzc6tpKg=;
        b=CqQpXKEPLtqARRGx+RFT858Hnf+/u8Tv/sQKFyDhWT3eiB+y3+WueIC4I6Bpx8HUEk
         cTGRJjaCGH3bi5IJtpNk0OhpSigjWhQlYAOPIKnxyXLZUdULBI30+eFa3XAkdlXEVV++
         0WnnYBOxZzdXiVqBmuTSur8mOSiV7RchaY9+pYIQh+uqgNZ1fs+ZKQsIkyVsCBbvBQ2m
         cBJrJi9NOYYmEO+JDnvrJB+nHlIYpANI0UXkxfbJFJ81kZLNo79nX21bxqTlZ6YjDMzN
         JlpNPriUoaOQsBH2PNDU/vaKhXnyr31bpYLmUAC7cqwccTUuOFQCuco2JgK3upDp987l
         iiQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791220220; x=1791825020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C3vVUDaX4KDNB7HvGI3omnz0UW7G+FgcZPsMzc6tpKg=;
        b=V4/453gAVnGoWkKzr6hiQg+FuUis7OyBUIs/YYmmjxZvmrlpe0S/fMpFZaHn5W+gGi
         lmuQygMZOTqd5RAEq9FdWi+XyqwJgdjzjQypobJK/RxiVsJsLMedF+YzKGu29DEoPAAw
         +0/Xcutt9BRzGXUhTWLUfjybyT7CWomu2cifxLWJVLqasFOgqnLFXFXc+UPh7uIbssW2
         /q1eFgdOQNSzPvUQgxHGGnLlDjmNIeRHYsEgqNzv03fvVYHD6eT32nqmfTyZ6N2Hj8Z4
         Tp+0fWNV28ZscK0qXa63yl0k1wu46/i17QHe4nNUuj5Npw+m0uJWr9OwNaXvpeO4c/vP
         9PYA==
X-Gm-Message-State: AFuF++lOPqNddRX3fkLiXqVLFd1wPHg8oa77gPdfJofl4+g+R29sPbbD
	VXv+PCvYVbDV+Gv+uPH5HdonmCCuZYKJky3LfbQ1fo8PTcLu6ZPcxl0eVh3uSMO/TlLSlfatCJi
	MzKWU
X-Gm-Gg: AYBFou2sYt8bXkysQPn0SceKZXNBahEa5GDqmmcxcE511fqrwz9bmOiQQTORHJ5saRI
	wusuXH83sdypPCWNy8/3LqE4b1MqvyamOtwO369bvxsFKnjiZ2lNy43F3FWLjIi4eRb7vnNCwLd
	Pv+wvcmis1bFpnR+gyhQg/lAC3s7BxrMkPs+AkM8iVqpfo/ZIjIWHg/q4JMLjooaRbJERkmiZ/b
	+MNNlduISFFcjvp09l16N7B6/9hFC8GZxWygvRRaRrd+reN9eyLMk8h4LuVYiNoOTKmqt+M/MbY
	ZErsjULLtpc+fDRhPa3p0w0UBazvYT1MdGXvS13Ps0TEeGsa3AwHmVYmmzJZX897RPqFyj0UGwI
	N4aZv7wcXvULD4B6+D1PFDXTb+z66DHX2VTowwnsdqx7Ro2iXI4hXHBZKjjjj9C+oVRA8KpfXbw
	CK2A3VtZTP5tku3Cs8jbvEjO3oSvvgOB1X33pcijO7QiPgrpzA/rJl32emlaqODDUn16MBsiv9Q
	RIl90iAsltTpt6nldQ65S0tB9/shg==
X-Received: by 2002:a05:7022:7e0c:b0:159:125a:f863 with SMTP id a92af1059eb24-159125afb01mr4614753c88.10.1791220219867;
        Mon, 05 Oct 2026 10:10:19 -0700 (PDT)
Received: from centrium.lab.ossystems ([177.22.171.68])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fcec9a95sm25189110c88.15.2026.10.05.10.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 10:10:19 -0700 (PDT)
From: Luciano Dittgen <luciano.dittgen@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Luciano Dittgen <luciano.dittgen@ossystems.com.br>
Subject: [PATCH 0/2] Use GI_DATA_ENABLED for the python3-pygobject consumers
Date: Mon,  5 Oct 2026 13:54:10 -0300
Message-ID: <20261005165412.1120027-1-luciano.dittgen@ossystems.com.br>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 17:10:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247253

python3-pygobject skips itself on target unless GI_DATA_ENABLED, which
also needs qemu-usermode in MACHINE_FEATURES. blueprint-compiler and
python3-dbusmock only check the gobject-introspection-data DISTRO_FEATURE,
so on machines without qemu-usermode (e5500/e6500, and their lib32/lib64
multilibs) world has no provider for python3-pygobject. Found with
yocto-check-layer test_machine_world on meta-freescale.

Same mismatch as "gstreamer1.0-python: Skip when GI data is not
available". blueprint-compiler skips on target like python3-pygobject
(blueprint-compiler-native, which epiphany uses, is unaffected);
python3-dbusmock only recommends python3-pygobject when GI_DATA_ENABLED,
as glib's ptest already does for python3-dbusmock.

Luciano Dittgen (2):
  blueprint-compiler: Skip on target when GI data is not available
  python3-dbusmock: Recommend python3-pygobject only with GI data

 meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb  | 4 ++--
 .../blueprint-compiler/blueprint-compiler_0.20.4.bb      | 9 ++++++++-
 2 files changed, 10 insertions(+), 3 deletions(-)

-- 
2.54.0


