Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD8DD66B9A
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 23:26:46 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.60237.1732663596668103392
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 15:26:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f2bCI5gK;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2124ccf03edso61876625ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 15:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732663596; x=1733268396; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=McP/a+7C/sjrFBZUU2fNhzY5vB0iFfzdB0gkK8DCbOs=;
        b=f2bCI5gKCE1yv2v39Yp8rkGzvGYLKtlZAJOUFqhV4AWUVBQTQ9lwvWkPETN2p2KcVt
         iL4iQv9Y1fA0AGcVDZ/30R+owuTmAM9POSndjkVvpjy29tJAMg4CkK9RzmoZs4P0jycU
         PPq+HtabhOh+NCEP1vZs4L1gEH4tDZdJzbkLq11aZzdl9Dsi9OCW4BYczmEm7LyfglBK
         QPuJKgaHPpusuMt+C+4YzsWJ09dVNh+eSFmJy1abNXV66ceZgCbbzTeHPbHMMLgtLDn9
         LgPqF8ZcoBPrdW/NlTVqZ9Y0jiqJl35Ssqz+dJWjARJ9efMp689D6tW51QOwQhafb7A/
         jHtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732663596; x=1733268396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=McP/a+7C/sjrFBZUU2fNhzY5vB0iFfzdB0gkK8DCbOs=;
        b=TwMKG58QNNi27nkI1jvzwaKr66H2D5BNJTeXNaOMoKI0pgKGaItNuZqYNSVWXM3mrx
         ZIhwCOdys0kTpp2aK2ZfOcXBkU+SjhDPryZwnSmcF72Q9v9xLGGz8Jtf3roLV70joQ5u
         xjsggmJzrMh/o11Vrp38WLsUyCWFR074iP9hTz1rA9cUQPeC/uz2oYcbc01lQ/LjDRCB
         QEL5GsofFMXKiMklBm2eC6ORadlW/K5aG7Gp/THh7oYTysgtcqar3AzdDthU77suiy2J
         U1+AB+uNKixdS+64kp1uYcVdy+7peDmBaLQfO1VJnqiptw+rmxeZl6r6K1W8keLsCJ7o
         ez9Q==
X-Gm-Message-State: AOJu0YwGzz0E3ihpWgPNbO4HBmrQV5X5LdZxgxNbWxiz0CqM0R2rbeTB
	e0BoHHOD5XvPw4hO2Ax8pYP5GniUqq9qhY0+LNzCmCmoLTK5pQR+
X-Gm-Gg: ASbGncsLO+oKUwjhXcw4JL13Dii/MYbrof8WmUJwRhy6cofSOZtTsQR1QEnaCQItPea
	uX9pLCEvS4WxRlpy0luiBsbhevY+/OxmdQwH7RU+SdCWglilusgCuR7EruLZNKnuLaR9bUztC3G
	F9Xxhk6UQQ8IvEefE5nJjR2K4yaXSfxufpq2UERtmIrp2UgAenaZ2AOOMyENADAJUEQCM3kZEZd
	+TtudH7JUrlnajEsZXhEakSdmdxYWSepOdurGk9LP0DkeXEk0sz
X-Google-Smtp-Source: AGHT+IFjSu4yM9ojI4JjJCbzU2T2PVv93z7lEhhDPvqPd9rleKCket+63rPxbypbRplFArO9ZV/1dQ==
X-Received: by 2002:a17:903:32c6:b0:20e:57c8:6ab3 with SMTP id d9443c01a7336-21501087088mr10280205ad.4.1732663596018;
        Tue, 26 Nov 2024 15:26:36 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::4338])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dbfa1edsm90279865ad.158.2024.11.26.15.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 15:26:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH 42/47] seatd: upgrade 0.8.0 -> 0.9.1
Date: Tue, 26 Nov 2024 15:26:34 -0800
Message-ID: <20241126232634.612174-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <1731403483-21399-42-git-send-email-wangmy@fujitsu.com>
References: <1731403483-21399-42-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 23:26:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207889

I am seeing a strange behavior on RPI4 after this seatd upgrade where default tty is now tty0 instead of tty7 on which the weston is running. So on boot into graphical.target previously one would see the weston UI on screen, now we see a virtual console. After logging in doing

chvt 7 

does bring up the UI onto screen but this is not an expected change. I am also seeing same behavior on IMX8 machines. 


