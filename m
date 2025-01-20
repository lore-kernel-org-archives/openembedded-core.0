Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D159DC02185
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 14:00:13 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.35797.1737377272297373317
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jan 2025 04:47:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QGU/WlCI;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: arturkow2000@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53df80eeeedso4473103e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 04:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737377270; x=1737982070; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OuqMJd2+C7hCieAtVq1D1/xUcjUaCcQf1AXTgts8+Zk=;
        b=QGU/WlCIVW+XusM5d5MkW/uO1WpIL2QVGuT1arufrQNWNJq7aLA2sPs3Yv0X0hbG9N
         Mn2pS32z+ZfmmmdVsTGwkrBrBROy0whSF3lgvw2sGirZE1cTvbNXZwOdjwuH7Bgv7BgJ
         AaN7A5nqX0J3KXAkOfOcsuPDVb4Sy2axWnikTegc4yCof2l72PSNxb6/bYS+DliD+FPq
         NJMdNbQFnor3NapgHlFhLdz8ilMJe3tgWYBjmjPAGNmgOw+XdhMz5gvgU9tPmIRmINpg
         GCARVrtKudtiOTtzzLaA0TRkLcz8WvAwToEZ07DlhFfhkzaqbc7sKy2LjylfEEBy4TE3
         OCrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737377270; x=1737982070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OuqMJd2+C7hCieAtVq1D1/xUcjUaCcQf1AXTgts8+Zk=;
        b=bQriB2HpHdth/YADZzDv2Q9q7z6ayy3nr1CaHdu324YG7bTPWfEK+AOdOeDEsN7JJc
         43lSDRa2sayG/ykrQRdES8hn/K9IygJ22lT0m3y2363B+fn/5aItI5/AMRME/ddwYw5B
         CO9QDkN+Sx24x5FcW1/q9gBJUw174hot4my5NHSkyuLxxas1m7NEs19mMt0ACUXCAK0z
         VJijGFKKZ0nuRmNYBHhokcfHJtYV6oogQ+8+5ToXTgd9jIP79mtwoKE9/KWejMBLqshC
         3Rh1nmaoePeW6g8gugaTUedeFRDI0neUfmZ5fVKK0IWDtredmoGVTaI4wDSXwlMIFq4A
         gHHQ==
X-Gm-Message-State: AOJu0Yze7uPBLEfvFEslHZiD67OmZ33aNgt2owF32OvqQQcOVXGV/BXU
	IPVp0GrMAuguKD7RdUwV7p4zDeqbYygTOa86w6zYB2G27D1BFixfGsup+oE6
X-Gm-Gg: ASbGnctnkjIr3I5lD1cy2AieLcv5RIQiBmvWr9Eftj4jC3egu0yheGW6YWyDn5OEZZs
	PpsBbRQ0FRYoCxZ+zRqOhe/gstVJ1Ohl6rtJFOZIPUmhDxidC/xaQm6rto2m/Bt4bgn7oCqlCGl
	0ANa+VIhgF0eoBJeHIfCzr33ZnDfLS2C6Zuc0wbmHQ4xLQeqY/tJuHZbtZaENX9jQp6GhO4CSYV
	J/RnPZD6nNIAi4AFvWf+xkV1b8OPTJ3iP4WsP3b4bZY/PI1DwlY2ix+1rY2NANkyhj7vczykXfo
	/g==
X-Google-Smtp-Source: AGHT+IH0bw0XPQXUOfTJJupihJK/hDq6ZARL39uB1a7VPFchToejLW7vBhE2McJbbaNbA9oUAc6Gyw==
X-Received: by 2002:a05:6512:b90:b0:542:8ddb:7036 with SMTP id 2adb3069b0e04-5439c285606mr5209710e87.44.1737377269510;
        Mon, 20 Jan 2025 04:47:49 -0800 (PST)
Received: from eta.play.pl ([2a02:a312:c49b:a180:23ed:c831:8228:ebaa])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af0742csm1307523e87.37.2025.01.20.04.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 04:47:49 -0800 (PST)
From: "Artur Kowalski" <arturkow2000@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Artur Kowalski <arturkow2000@gmail.com>,
	Alex Kiernan <alex.kiernan@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH v3 0/8] Systemd user presets support
Date: Mon, 20 Jan 2025 13:45:58 +0100
Message-ID: <20250120124605.263817-2-arturkow2000@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 14:00:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210031

This is v3 of the series. I renamed the `glob` variable to `opt_global` in
the first commit. With this last change in place the series are ready
for testing.

Artur Kowalski (8):
  systemd-systemctl: add support for --global flag
  systemd.bbclass: add ${sysconfdir}/systemd/user to search path
  systemd.bbclass: factor out service lookup logic into separate
    function
  systemd.bbclass: introduce systemd_service_searchpaths()
  systemd.bbclass: properly handle user units in systemd_create_presets
  systemd.bbclass: update postinst and prerm hooks
  systemd.bbclass: support user units in postinst and prerm hooks
  image.bbclass: enable systemd user services

 meta/classes-recipe/image.bbclass             |   1 +
 meta/classes-recipe/systemd.bbclass           | 118 +++++++++++++-----
 .../systemd/systemd-systemctl/systemctl       |  42 ++++---
 3 files changed, 112 insertions(+), 49 deletions(-)

-- 
2.47.1


