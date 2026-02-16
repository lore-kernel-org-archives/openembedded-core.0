Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAD7CE63F21
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 02:16:38 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11495.1771208196318162220
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Feb 2026 18:16:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FEac/fTN;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-506251815a3so26911321cf.0
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Feb 2026 18:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771208195; x=1771812995; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/o19VsvRTKcvFu2MUltwvpPvHAouiMeFahPuFktEyVQ=;
        b=FEac/fTNCYO3KwKmDQVg38xPPhKMTkE3aRIM3mlvhwfBxcCHMcI/CA/aGiK4B5MwqG
         p6GLqCns0NQjGGEK3SYlCGhIFVBeynCvUMHpmy3TbuBS8enqC6TpdLq0mlEuLb6b/rOM
         2uPHKF83T7CE7IM0vwS6Do2VFOVi33MHgOV/T2XjrFFv4jpXm8HOtGYZ39kpFWS79oAF
         RmkoLoQeLXOrALZb+RaYID10yeo/WMona4zKiD3cxq7qWt6F1wws+evJ+XimefZJcmNb
         mWVBx+agc6QQg+/2xyKdUXphc1tQzpbTXJSApAglBoKBx/ERjG6nV6MbIIhcqz68WDiv
         kzsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771208195; x=1771812995;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/o19VsvRTKcvFu2MUltwvpPvHAouiMeFahPuFktEyVQ=;
        b=RYzw+3o8r/QILHQMpBz0fI0+JnLgE8ssrGleera8ogDrol7v7ab7MbVb+xzp458krI
         0dOE0fT4aLhbKExLSl1o90KqtZ1uWl5KpvgnXlrN/fZ0W+sd3LWIIVHrqpGHwDRR4pO/
         DB1JzQbOZ/Wg5NhqYcV7I4Ok6Vva2DnjHgMto3hfo/Yg4gC4B0pJyoUYomk/4pVMyWA0
         umQyFWWIgbF9IqJf4Lz1MCEv7c3SK3dUreiQO2z8APVAGti75HT+mxAsqz/Art+n/flH
         6F47fACS3KUNYdwOTOf5h9psSDuZYhR+hPHgnSsGXv77nD2MZUDxvV06hSe4olX8ciqm
         hslQ==
X-Gm-Message-State: AOJu0YzKO9RNNtVj+AC9S0WiDg4j6ijI1Tz6smvpC5I3xUAseJX14XGW
	GaRwwozq/6tCWKc8ZUh13Gs5wyXf0oY+s3kBm7o4eKgEhBZxWZyac0eoo6KcDV+h
X-Gm-Gg: AZuq6aJhCz+XGKIrff6CiXVGAhRlmDxY+KSPbwMd5drdCB29iOP9M6nun6s8Hwc9/6G
	rTxMkN48+XhAndo3D+JGxDccqgonXVMEQHy+iNAxTWxC+mkbfwtULG9anuKHlbg/bi6VrAm6uo8
	ixUkACEC0hge3YGcfEfp4/6p4wkUEigDaJ0iPk6vz7j2VYzAtTONT2tUi4iB5OyN8yQgnLkUcev
	2GAsTGXW2t51obpZfNxWvp8t9DOhmqcX97UoNETsZBYqR9djIwEhccNvaB45TNOcxPMTWj8u/oZ
	nzosumR1CzbCXh2gULwx+SIBYIKwahx/6Ckwt552WrslIiONrQ8cAwrny0Ysann+yNgVIey4P5N
	Fl2gSR9/7Hqp8E3j0Ym3vYQdOooR3p6yAq9GCHukxwuZmmlli8iYVGNsIb6TQGXLmiWQ2B5jfvA
	U7cCvqWJH6fdmU+Loxgf8LXSwkxjQ5VJrrDHMw5Yc1L0riG0Sb5Jb0U2OjagPe9IYNvQ==
X-Received: by 2002:ac8:7d89:0:b0:503:41f2:df94 with SMTP id d75a77b69052e-506a832daffmr126777811cf.52.1771208194708;
        Sun, 15 Feb 2026 18:16:34 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-506849fbb11sm120156601cf.13.2026.02.15.18.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 18:16:34 -0800 (PST)
Date: Sun, 15 Feb 2026 21:16:31 -0500
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: mathieu.dubois-briand@bootlin.com
Subject: Re: [OE-core] [PATCH v2 1/2] wic: re-implement sector-size support
Message-ID: <aZJ9_zO9JjZRC1ts@localhost.localdomain>
References: <1894961F69C9F4D9.151929@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1894961F69C9F4D9.151929@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 02:16:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231174

Mathieu, please ignore this v2. It does not fix the warning.

