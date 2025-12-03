Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ABF9D1BDE4
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 21:24:10 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27093.1764797046647395037
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 13:24:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WoDHMfCN;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8824888ce97so2139686d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 13:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764797046; x=1765401846; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kLS4L7NV0Fehyrd/YltEvwkVbCkEd/hMvEF9FHxdoWQ=;
        b=WoDHMfCNPvvP2maqQGNh9S03FWWIlnAmcxS6O8ZJy+PPdSNeWOcWhGQyyULPF24hry
         bghel7zbsc8HqtA+1XX1Ufzxe9m9xajMvwBaTfTOm2t2F4Qs5gJmSozMpn9BxSsSvx4h
         +SuV7QNyQ+KQEVHEx4H0sf0Oe01HGSiOVS/0KWStmFDfMFLDN5/2XmwsOyLrZeWspgub
         D6N86MfR6lGv3reIuSkLdcufgGLt979xQRJQtWxznGRWJugbpckArYisWKZjK26JwhE3
         rb6rbdbiig6oMfWN6L+InA5TESmIu7bmZFeGNWpx3q3oLDh4P3DHR4o73w4y439MbUfO
         zhvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764797046; x=1765401846;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kLS4L7NV0Fehyrd/YltEvwkVbCkEd/hMvEF9FHxdoWQ=;
        b=wRe/vyWJtR6QfCN+Ye4SQhFxE7jvwGxw8aFL9V68wf0BE6YQ/TF+GNPAhzUxz5/tx4
         PKeEjcJyTkrKXfx0e/xNJzSpg0TqktiUmiyNOh3wzGgZMdQtuXAIXahjY2Q7zisKUNz+
         Q46edKLVjtAL96KlI3sXpN4EMx0RRtHjSj6Ty4nzOa50Dq0F3slGPY+8n5dTLGviusoe
         oH5EHxIJZHttSIo+9Ymkrz1fo6wGcS51bWVKLW6Yt00OCDmvBgZ6+fzazad4bNHPyUBg
         urnswrPQiZDJUTMFniGmswXXo0SpH+RbJJAf1vvwb2vrMsLNsxWRvI3RlUr+XbwDkkEh
         VSFw==
X-Gm-Message-State: AOJu0YyQNZniz0opwMn46y5VhbScKmVU1kOazq1pG03nwQ25goCc0ZO9
	rCHqtIrQGUxSmylc6kOjgL9zMxa2pvdlTGtuMG0bvpz9C87GI1c6wZOkQBb9lTy8xMuw2r+TOlx
	+F5cDUh0TU9NqoKkjRLp5Ai4txyYqjXUjUYaH
X-Gm-Gg: ASbGncsYIGsk8NGhX2KCXtZyDCqWWeKDVcHjGILhauDAAgCHpAUDOD2pS0EXOS1VbUM
	9b0mWtESjuh0XWK35wdL9rX8la21iEfsxsFloj7yuXCgic3RnZUu0jSTK+VpsNZ80qC+3quC+es
	4O7n5oTPZdiCIj5gn84V85kiUSrcQ5w8TyrZ/Mp6ihiSVRGXW6W26uAiZcmZZFMthu3Hlm9v742
	85c8CTNPQHYRgV0fIddhHV5TRguM6/x96+J/oDoPpTAqiw5rK/wwiibrovzOg5nCY+OeEzku+kK
	CD4+BXGxhwTWYZUCvl5iphecIH3hlQ==
X-Google-Smtp-Source: AGHT+IGd++NfEzjuCRNOjVN/aSsUDc3HK9wypxlWwM+tABAKPJUWtWe4Na93DnSED3TUeSi0M08ZjSVsioFi43c+4tM=
X-Received: by 2002:a05:6214:519b:b0:880:834d:ff69 with SMTP id
 6a1803df08f44-888194c9ccamr50935616d6.1.1764797045645; Wed, 03 Dec 2025
 13:24:05 -0800 (PST)
MIME-Version: 1.0
References: <f5199a88-ed0b-0423-3aae-61f882f8e6ca@crashcourse.ca>
In-Reply-To: <f5199a88-ed0b-0423-3aae-61f882f8e6ca@crashcourse.ca>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 3 Dec 2025 22:23:54 +0100
X-Gm-Features: AWmQ_blVeegNffOlv3lrCPzRzd-kjCVE2ag2Xq0Is5bexYKoujNJVz2HxyuZ43Q
Message-ID: <CANNYZj_kAFMLiyiWwbXC99MWvMcJyFaJFdViRKjvZ2nEhU5o+w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cpio_2.15.bb: delete superfluous ptest RDEPENDS
 on "ptest-runner"
To: rpjday@crashcourse.ca
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 21:24:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227241

On Wed, 3 Dec 2025 at 21:55, Robert P. J. Day via
lists.openembedded.org <rpjday=crashcourse.ca@lists.openembedded.org>
wrote:
> This appears to be the only recipe in all of oe-core that had this.

I see it in meta/recipes-devtools/quilt/quilt.inc as well.

Alex

