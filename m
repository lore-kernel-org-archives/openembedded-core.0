Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A132CD68EB
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 08:39:50 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.12107.1697013586247995227
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Oct 2023 01:39:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QjNKp9QJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4065f29e933so64582735e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 01:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1697013584; x=1697618384; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+NMmOE7HUNTe4PnqNlMHwFJXoDVO2Tk6uj8DgjqV8O4=;
        b=QjNKp9QJAVzAWqTRHTDNp8v69LPoNyEqHB2d37GuqdPonaiqSyZM9qRUdNH378Ii+J
         4zdeVfJMEnfWSMvOECoF6P2EI4wXGSG4uNDyaY/Ajo0dB6535H5b4vlDjhmfOITZMA74
         LK6PLK9B3guYUgpg5T2WU7OU/lYH58UQBgwk4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697013584; x=1697618384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+NMmOE7HUNTe4PnqNlMHwFJXoDVO2Tk6uj8DgjqV8O4=;
        b=BlX4q/FBkW2yib6wrIsCc6FgDSPoQlCZIKm3waV7Hjqsa88xIJW45FNDZCU+5WXXPZ
         ZspK6TQN8Xuyib+rmDnQiyL4Tqr17Vnw61dlRyV0zs/rK2qwqnUisCUzhQDE8o9H2VpR
         lIzBPTeIpO+/DkhDnoBZjVl14qHbHsBbBKWgM9Vmr+44Gau5KtxstplvOUhqQKxAK6JE
         CWR8EA+NJejEnG3eIA1V48BwUjYrFlufQj68wqzukvcn/CZ6RIekaPdjWC8i9ZdVSVE4
         6OdBs2d2/WSTAmlKUb+EwbTk5Gw/6MIPf1ZySEVgqTUTQ2lUwsSxwlMFatjtx56SUUTm
         56YA==
X-Gm-Message-State: AOJu0YwFprKJoDIOnkbaHQPzU/VFOqrmchGnmWlwwUpMQ7HUVB8/0CcE
	MoKwW9adU3f+AKflQzyoRpFXzU1aimcZuNuha0g=
X-Google-Smtp-Source: AGHT+IEsfNy9S9cqE9AQrMLCsJxf599n4g0q18WDuY8a7tYoIC5/LXMSXF7t1vcCkmvtMTLksbdXHA==
X-Received: by 2002:adf:a351:0:b0:32d:88dc:b219 with SMTP id d17-20020adfa351000000b0032d88dcb219mr524551wrb.45.1697013584330;
        Wed, 11 Oct 2023 01:39:44 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:af0b:dd0f:66a6:9b90])
        by smtp.gmail.com with ESMTPSA id o17-20020a5d6851000000b0031779a6b451sm14786222wrw.83.2023.10.11.01.39.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 01:39:44 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/qemurunner: Ensure we retry after BrokenPipeError
Date: Wed, 11 Oct 2023 09:39:43 +0100
Message-Id: <20231011083943.61007-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 08:39:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188950

If the BrokenPipeError occurs when writing to the serial port to wake it
up, defer the write and try again (which will happen on the 5s timeout
of the select call). Why it should return ESHUTDOWN and then work later
I'm not sure but it does appear to make it work. For now we need 'working'
QA tests whilst the issue is debugged.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index cb3231da63b..a52fa41768f 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -465,9 +465,9 @@ class QemuRunner:
                 self.logger.warning('Probing the serial port to wake it up!')
                 try:
                     self.server_socket.sendall(bytes("\n\n", "utf-8"))
+                    sentnewlines = True
                 except BrokenPipeError as e:
                     self.logger.debug('Probe failed %s' % repr(e))
-                sentnewlines = True
             for file in sread:
                 if file is self.server_socket:
                     qemusock, addr = self.server_socket.accept()
-- 
2.39.2


