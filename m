Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04181C43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 11:16:15 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6153.1783509373245500063
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 04:16:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jVa+IgQ1;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8f0079614b2so5610536d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 04:16:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783509372; cv=none;
        d=google.com; s=arc-20260327;
        b=BiUYUsUxrBbW0UpP9A4mS28BS17UOqRyLkxox3fE8CkQ6nh5jX14PXxYQEavsnaZMK
         62gnoqa9zEdbBnPkXDYJDgqsoOIs9g8AMFbF9tFtffl/sWpV3s76pHSWOcoUhyqO4ogu
         4eKfI+8w+YxcDTpWPKcZhgqJ3u5fe14rD37amzmK+KKduODi0YpqMjcFrOc+dUFhyO7G
         YTDZifUp1PUYsrEtm4EpTSI1yK7lWmcfPAlVUrdw8WpftoBewgeUFcLiF/0XSrgItynU
         ui8/JukvfjGFIJnxNqkKirP55DwcSKsfsGSgGgFjqUeWI0HfOOGswcKWCCmmpnsgoK/g
         XaBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YD6tNLhhcgm92eLynZV3TcbZFEV14cKskTnm5EwNrTE=;
        fh=vrPZWiZmrdKiIBHdPbIF/hlKu+SWMJ+zRuJ9uS1OO9A=;
        b=mHS9wBey9X5zTRkfPmNF/muqsRWHe2btuLkFgDYdCV7UY4eVFZ2YzZauod7cJE4+2p
         nPzamJUE6HjmbDAWCo2ox2KCKf/5rGn3sHSacn0/g8njmFUaJCx77SyeqQesKAOfTRvN
         APzVgyd1iL/EgQT7mEUwfVIPZosSL1wKGgHt90lxISCJxpK9UF6lzO/RbQaKcEg11J4A
         gWOWbuzaW24SxWwuiB7shJclQMolcml2Wv8l4wSZUik7plt/nezurX/IGN7w5FJT32B8
         jBomdMibNOJLsrfo7cNlSVuTsxo207STLysgRy0LlQYb5y+Ht23hS0IMiks4eFBVMBKz
         iS6g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783509372; x=1784114172; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YD6tNLhhcgm92eLynZV3TcbZFEV14cKskTnm5EwNrTE=;
        b=jVa+IgQ1GSJBd8Mru+l4LO34xc8a3NnGSsMsjx0y4kNWiFQ1Skg3JqPtQM1QGnUrMX
         kaJ+uT5cGfPBkQmLLuwaPzuixUlxGvnbYP+34pN/LASloyb480LfTN+EbFFO9DlpRz/G
         uVt7QFe1srU+RlxaTQmdBwKQVLlZLrn0o3PysOh3gRvzw4LE1lBdTmQ3oQlrFf2Gj+FI
         pqayMq0P/b7Hx6nXFw7tMsYHPGZ/EQ8ueHgj9WRgtKEGSVC6ZPgnJv88AWXK0xr1u9zB
         3EJxxpnZI/J2trNTojlZbtRmguiXJFyMicegVE3h5ZpqHaMFvvBPQwCfLObdhkWnoBYZ
         MCnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509372; x=1784114172;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YD6tNLhhcgm92eLynZV3TcbZFEV14cKskTnm5EwNrTE=;
        b=A6nT3KRE/fgQzBB6fpCEy8B1ah6UuY1U/Na9hzAK9SoHKa22RboDTqvIkqWdTMyUlk
         5VK0OLnUHP/nzW7c6a461AaqD1Q9MLV/Bi7PpRlgW/u/US2HTlPlmRZbBp+RPqO8LKGs
         0BT3UlNOHXmI5Poue6xxad9ceAq3Dm/R3+iraVz9Ae78bvfzz0QYhXNFBv12DuMWtleq
         unCDzrgFLYwNNg2hNNezg+Mh/suEAivhu9B8/lLzxpgoiSGg5X3F7CC0zp+w0XRn10Yn
         CQz20Od0stO27NxPnck6zHX352U40zOBEJbtKGVXYez1rRAlM97BYLsJol/wFGZ5C9wA
         alTQ==
X-Gm-Message-State: AOJu0Yw9c0y4jveWQZhkcRG6tJgRjEihE9COObGmfRxQytkTJbcxZmee
	ub3O8W9LS44cS/AZvIWYtkxYfZpoquJoXD0NjMTWoiHjxNSml3eDC3+SwRxX8K7wZiznF1t+Yaw
	h4FYgHtg1SL7ykymD/HyayX0WXEExZbf+/w==
X-Gm-Gg: AfdE7ckgGruBLmiu2gN/dC2EvlOZZCVBK83JHzj0yCivziBPyaaRpsC9H3vysCM1Ew8
	skLp41wgytKRY3iVLCXqquFOyNtoQVc9jCjjLJm1wfOukLVzzp+rZXXmVJJJ6KWm+40zMBVRPfn
	8d2MDBv6MEj+9x5R5Aj2x2F+a4l/RLCNSvjQm85mp8rzMKELYPOsueln5plJYJWRsZs6Cm+Vfpd
	WfyzN615/aWF6hwPoj+UQipBAUKsc0AtOGLqm0ba74GMuoZnO9G0iAAR6nQakMk3lipg04YbxRg
	tKhYp3AOt8xJPzAJPNPDLIxLV2qzr8VBnDSASi5NKg==
X-Received: by 2002:ad4:5b8f:0:b0:8fd:6e22:c7e9 with SMTP id
 6a1803df08f44-8fec38114b0mr17664556d6.58.1783509372127; Wed, 08 Jul 2026
 04:16:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260708092252.1211669-1-HimaniRamesh.Barde@windriver.com> <20260708092252.1211669-2-HimaniRamesh.Barde@windriver.com>
In-Reply-To: <20260708092252.1211669-2-HimaniRamesh.Barde@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 8 Jul 2026 13:16:00 +0200
X-Gm-Features: AVVi8CcX1cq0FCnDWSPJH3cBAiUKz4LmOF0FqFjoilqC5fumnpPlJMyGZU_UQtQ
Message-ID: <CANNYZj93OBAscPMmr2phax-B5QAJOjBBM8kReZBHu6BmYHZF-w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] python3-setuptools-scm: avoid SCM-based
 version detection
To: HimaniRamesh.Barde@windriver.com
Cc: openembedded-core@lists.openembedded.org, tgamblin@baylibre.com, 
	randy.macleod@windriver.com, Shiva.Komati@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 11:16:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240462

On Wed, 8 Jul 2026 at 11:36, Himani Ramesh Barde via
lists.openembedded.org
<HimaniRamesh.Barde=windriver.com@lists.openembedded.org> wrote:
>
> setuptools-scm determines package version from SCM metadata (e.g. git tags).
> In OpenEmbedded builds, sources are fetched as tarballs without a .git directory,
> causing version detection to fail.
>
> Export SETUPTOOLS_SCM_PRETEND_VERSION to override SCM-based version detection
> and use the recipe version instead.

Can you please show the error that occurs without this patch? I
suspect this is not the correct fix. Pypi tarballs are supposed to
work without special arrangements, and if they don't, it's an upstream
issue.

Alex

