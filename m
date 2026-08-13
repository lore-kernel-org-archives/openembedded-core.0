Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8958FC5CFDB
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 10:46:49 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16219.1786618004563846740
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 03:46:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OGVAeZJm;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8efec2c28f8so13177166d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 03:46:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786618003; cv=none;
        d=google.com; s=arc-20260327;
        b=CZ5OSFEAtfztPHgGKAeThMAu2whSVgG1e7lWQ0iyQoDL0nhswSqn7hYT19yjeqYvTc
         qQCICWj02c6k9QOB5rwfYJBrXPJ6E5hbiAu39XPJGFHgyau8olkTNDrMtyc1v6G+Gney
         5ORpZpVgXqSBcGW4zeOAzZ6TR1rkfsc9dG8lb8Ut0di4SYLv28aO/kiIOPDr/r8k+bq6
         OsD9F+sB5UWi1soS//eWzKJOoxMiNV4srfNTDOEYxePpEFZijwZ7Jo0KcKAiQxo2N40n
         mzu6wLiTHKjV6x8RU/pTlFhdMtadvrCvNMr25hajt8of1+IQe/+yWFNjS7AwQg5K8Kbe
         Einw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4CXqdBqhSIzGA/nd1fSnB+rtPK4vXgrSHuFXCO1F7KY=;
        fh=PZ0g+5shgpNRgQoJbDjHGGj2etrNvkDO6cYPL18oCe0=;
        b=HYYRnPIhAsKI0uEndtZ/oiC9sXqg61aZs233sACDjk4bVGlz56DIGkY9tYsWJ0j0Uj
         CextL7Vtzi7wSWouE6gzC7q8jVJ6anrQsInuMaQAaBa4zzQXWTJ3PpFabrzEYLOCpUhD
         8GZLVcq5A0ap0oQKT1DExadbPkFDopKMyHKXr8S9oMxAa2gvKi+p1eSgH6V1LtdgtNg9
         Zk26zxNzKxym2jTuDksttfQ3Kn75SZtUY0/Iw+8Hhx/GqttnfKl87t01zl5NldggV84n
         nvGWzkAHAsnegBOmgP/FIMi0VpyEQbyvRs23nPEB8iQ7TFHOkRJv410V6kzBx/1W85mR
         WM6Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786618003; x=1787222803; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4CXqdBqhSIzGA/nd1fSnB+rtPK4vXgrSHuFXCO1F7KY=;
        b=OGVAeZJmKbFr+EYsuyTXcuxwnlOjTquoLJsSd4JS4MI9tCbsij1/yR2DxlKaKyHBFZ
         cHCyY5B6YifpAnywvlGwzEVQ+2cjH5Guy353wnF/SSLm+EjRurrdfuDgEPBePWodFbYh
         AnhTqFOIhk0YAgyUzulT5BeK2drPnDh8kwaEdGqjVe3mGMGSI7n0N1vtRtUdiwgOITPX
         eRsqVUwkHIg6nz2KW4Ct1ag5ySdb5qJSnxXhCXkBPQ9wh55zYMs5NMdxDr2RGkop/us9
         oSjBSB6bPzB/R3mAADSUerq8kO1ELKv/T5nByhzDetPyicmZsTNobEwmlOCiu/BQdAFX
         kpyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786618003; x=1787222803;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4CXqdBqhSIzGA/nd1fSnB+rtPK4vXgrSHuFXCO1F7KY=;
        b=ZlWzPkTZpDeBY06bmIAZPX/syGGUXE2Qa9TG87rXVj89Mtjq59cvagwWn9WQsKL1zi
         tVIrGQAFVhg2bKrTH5smWo9ZhGNoD+y7FZmyOUDfZxTCTzpcHFdO2h3daUJeAxNvPIC3
         1b4yE1aJfgJOUZ4o7+E7Q79Zl07LiSixIYFvYpDA6iGdoNGiAEclRW7tKD3873SbUmZf
         wWFr9fPOfFEkisHGUcfNiEWbqlHXI+cD5nk1/wFWgCG3+m1M9RX/ou54uxYVSI39pM2L
         cLMm7/1fLaLpN3HxV/aqvid+MkB92Ej2AddkXlPJLuCO1zNAitz9pSRyeebFr/jQzfN8
         2VSQ==
X-Gm-Message-State: AOJu0YzQ2PvqjZzb6Zz9qYwJZ9xirQn68fQzXt3lKifBcyekospAMlHj
	d0iQPVeAPFTB+w72lnOd54NjUt45qMH+RbGHjedGYmQFP++Xx3oS0PG07HsfXSkmoqn409OF60H
	fEHfKJ44iYEKNo1d4pxMsqZKZQ0oSbulGEw==
X-Gm-Gg: AR+sD10HS2VIEFesvXH4H9S4+UGiyo9u2Usn13JHC8eXvX6xFpS5Yk6UT5QA1BMVRyx
	tmodo0+Hrc5iivj+ODeicMlWOiNpBw1ubQINNsYuVJvb4GUG7qT12jK+wxb3Oz38XOeHlBRQoLt
	axvsBt0XrEeKDeSshJBjJiql1WOlozHYnlzXYJ9a8dCk3tYF8tIbqIaC2mlYi0wMA2v5G0LqCOL
	eTyA1In8cgJimoVwP3fssLrfxwv/S7tWm8NP+GR1ug60BGrb/Sh3TEkx4aAzpjJywJGAaqdVWmt
	fy74EcqKDx0KQ9dvpRqAL8KPRs+5mcgFmJgUuXambVcx+rWDOPsvA9tM1ux0jnGVauf+pCq8Aha
	Uuf8Uk1m45rykIQ==
X-Received: by 2002:a05:6214:401:b0:8f0:b50f:dd1 with SMTP id
 6a1803df08f44-90a809d5baamr43056396d6.5.1786618003448; Thu, 13 Aug 2026
 03:46:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260812-fix-boost-v2-0-cbcb65f5e186@windriver.com> <20260812-fix-boost-v2-2-cbcb65f5e186@windriver.com>
In-Reply-To: <20260812-fix-boost-v2-2-cbcb65f5e186@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 13 Aug 2026 12:46:32 +0200
X-Gm-Features: AUfX_mxUVbsuMuAlkc46zWWPgB8tZ2cdU5liZqa1n3Fdh-anzSkUFULuZ7j_bC8
Message-ID: <CANNYZj_P9HgDR037FQcABPGMJvjNRMN9XZV1KCeHLjBKcy6VoQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] boost-build-native: Add python-numpy-include feature
To: Rob Woolley <rob.woolley@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 10:46:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243343

On Wed, 12 Aug 2026 at 22:34, Rob Woolley <rob.woolley@windriver.com> wrote:
> +Upstream-Status: Pending

Please do not use Pending without a reason for it. This should be
submitted upstream first.

Alex

