Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09BBBC4332F
	for <webhook@archiver.kernel.org>; Sun, 29 Oct 2023 10:36:44 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.70135.1698575797710325188
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Oct 2023 03:36:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ELw+VcEZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40839807e82so20159685e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Oct 2023 03:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1698575796; x=1699180596; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SK78Y5F41OvGgAuy7/OgdOxlOKFlJhywllPaprUA0tY=;
        b=ELw+VcEZ76kYniv3g31RFs3lC1VxVEDa4QS3SdwABGExmvUv0tUmtm+fwcchB/RoKZ
         SHs2pR7XKZX+78nb/2QGb1nnYU7iD1kDlEqh0kmB/H5fDljK71LwR8fA6Bcz7r8DkuGz
         RuYEDM3gAokSbIoISNzTg2hw7dVqTqDH9EAak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698575796; x=1699180596;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SK78Y5F41OvGgAuy7/OgdOxlOKFlJhywllPaprUA0tY=;
        b=DsKYSJi0CFsbiJEDjHAWlu5hOJocrMbuT6SJdM+E5a7IXKd7mRguA11wVFG0Dczgfa
         sdBaQ6GRc4r/xJrQtE6uQK6DJBZY1QwxLaQGID0r95I/i3l9lqXqS4CJa1PVZhJztgln
         0WiGpsgYqqO7Yq9iBy3UxwTo6TK9524Utk+1p05vqkFhVrTUpCFQD+HmURO/VIlwY+fD
         0T8UkNjqEhkSAVBggzxwcvjTURKHQzywfzjXW77O3B4nHvfO6YWzeBNo6Bsr2X2Aldah
         7PzNdNKGmgAWy0DgyQ3mHh4v7oyRRR6me0rpSzCcT0MUZwOoU2/f6OuCsrFquwerzbNu
         TWkw==
X-Gm-Message-State: AOJu0YzXcae3gRy40o/CJoaxNjwU9DnTEYC3Wmpf2sTbA9OWqqtkxPKh
	Avj/nqJEqHcpacG4Frht4dPyE3OE6pEdtg222Fg=
X-Google-Smtp-Source: AGHT+IHiNaskZOLjsgLzL1WOXY2zwiRTdmba2aPWWpeqp0db4zAlvfY7Jqsh6LXeFWxK4XxxQpH7Dg==
X-Received: by 2002:a05:600c:4356:b0:401:c7ec:b930 with SMTP id r22-20020a05600c435600b00401c7ecb930mr11418623wme.10.1698575796001;
        Sun, 29 Oct 2023 03:36:36 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:561a:25f9:86bc:16b4? ([2001:8b0:aba:5f3c:561a:25f9:86bc:16b4])
        by smtp.gmail.com with ESMTPSA id o14-20020a05600c4fce00b0040775501256sm6233145wmq.16.2023.10.29.03.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Oct 2023 03:36:35 -0700 (PDT)
Message-ID: <cf0692a137a26de0da1e59de98cad4e37e1e97c2.camel@linuxfoundation.org>
Subject: Re: [oe-core][master][mickledore][kirkstone][PATCH 1/1] avahi: fix
 CVE-2023-38470
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: meenali.gupta@windriver.com, openembedded-core@lists.openembedded.org
Date: Sun, 29 Oct 2023 10:36:34 +0000
In-Reply-To: <20231029093644.3918509-1-meenali.gupta@windriver.com>
References: <20231029093644.3918509-1-meenali.gupta@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Oct 2023 10:36:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189771

On Sun, 2023-10-29 at 09:36 +0000, Meenali Gupta via
lists.openembedded.org wrote:
> From: Meenali Gupta <meenali.gupta@windriver.com>
>=20
> The only allowed exception is single dot, where it should return empty
> string.

This patch doesn't appear to apply to master I'm afraid. The commit
message above is a little bit out of context too, for the OE level
commit we should have more information about the CVE itself rather than
implementation details which make no sense without the source code for
context.

Cheers,

Richard

