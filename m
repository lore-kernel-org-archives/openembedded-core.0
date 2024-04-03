Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A9A7CD128A
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 20:46:39 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.22834.1712177196116305652
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Apr 2024 13:46:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PrbZfKwn;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: rybczynska@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-5c66b093b86so1142242a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 13:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712177195; x=1712781995; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rZezrf1lAia+fjJ4LsXi0iIFRADmVIiWc4pTB4aukHg=;
        b=PrbZfKwnH0t1dBpdhCs3wBpg24eCGzvUKHya1sTd5OJz1hZLd62NAoPLDAQcGFktUM
         uZMbC24yb9Y1Kl0PR2CzZXISiR4pNl2EbbOxhUzPRSSsnE3HXh+h0AUmi5SKmArpi+dI
         drvoH/BpDIbmxKR3PZ11TRvrgn1rVera3usIXPEi3ca9CjukQpZKKiqG+GJNszRK5YDt
         84t72NrGeBeXgi0KB3fG9dc/jN3mpTp4DnIYQ6taEF3ybWOWJsO2xvApQ0Nqptl1181n
         9+d63g/FSHiu9+3YfT5vFAGmJryW5TOP8GvAKV3xCIQItO+w3/a+IqAzILmVtQ53Gi+R
         uu9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712177195; x=1712781995;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rZezrf1lAia+fjJ4LsXi0iIFRADmVIiWc4pTB4aukHg=;
        b=Cz6Jla9TaQA+uih5Bl+rw3rtxR3/TyB/W3DUFy1FUCpujXla7i49+Zrt2yax9jDuTl
         RuoNAZzT5SgjlmaayUh5OO185rPBXSl/ue7yuCCbHNVqX35lqdAVAQM2J7lGtRCTDrOf
         OHgzzyGAh0hgvjBXX2VI86prs/jwSg7jC8E8kuHCrzFsY/t5tqC9apcPnPJwZJFsviUT
         sIafxk+W6gOg6jFbkyiaB7DQjNrG1gA07blbP5g1OlMKxm7BQ8+RXDns9+FwCaacTkhc
         Noun4Sy1YNF8AABZZ43L6mYvSOG/FA9oyykaViPzxqm/JsmXwzgtDcfGXsNF9av/PIGe
         z1CA==
X-Forwarded-Encrypted: i=1; AJvYcCWROqfg9ZBqzb0BExY0gcH/Y9JPskyBwYlM21oTCKlc62Gk9gkxidcVRXNcg+TN/8pWpkii1eTX3VqvJq9FJ0/FKYo21lvVvc3sPVb/0iPX5EoPyQGUpIP/
X-Gm-Message-State: AOJu0YzFajcZqJUt/5HfA4dA7iLbso4AoubelJV04X6WHu2LIjJkH+0D
	kwc3vOgoiPmpofEEQ4L2JX6l2aWJG7O0O1M+SLx8d7SwzrvgXoGKEx7bNoHlZ5yx4pP58e4Se7J
	YzdJCw8r0wTXptSROo5FxqYaQWis=
X-Google-Smtp-Source: AGHT+IFO2EJ3yqAqPc/pQITdBDmCwtqNhuP658r4eu38iMgjfq4XOyemn8AX96h0f7mY8tUu28SW2IKUK71bAOVPlkw=
X-Received: by 2002:a17:90b:374a:b0:2a2:525a:b15e with SMTP id
 ne10-20020a17090b374a00b002a2525ab15emr1063870pjb.3.1712177195405; Wed, 03
 Apr 2024 13:46:35 -0700 (PDT)
MIME-Version: 1.0
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Wed, 3 Apr 2024 22:46:23 +0200
Message-ID: <CAApg2=TS-3GUT5AEgf17rJjk-xP7YxBC+efqgEZhwHWaQR17_g@mail.gmail.com>
Subject: OE-core and meta-openembedded: a vulnerability in HTTP servers
To: yocto-security@lists.yoctoproject.org, 
	OE-core <openembedded-core@lists.openembedded.org>
Cc: Steve Sakoman <steve@sakoman.com>, Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 20:46:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197943

Details: https://kb.cert.org/vuls/id/421644

Affected (amongst others): nodejs, oghttp, nghttp2, Apache httpd, go

Multiple CVEs have been issued.

Quoting from the description:

HTTP allows messages to include named fields in both header and
trailer sections. These header and trailer fields are serialised as
field blocks in HTTP/2, so that they can be transmitted in multiple
fragments to the target implementation. Many HTTP/2 implementations do
not properly limit or sanitize the amount of CONTINUATION frames sent
within a single stream. An attacker that can send packets to a target
server can send a stream of CONTINUATION frames that will not be
appended to the header list in memory but will still be processed and
decoded by the server or will be appended to the header list, causing
an out of memory (OOM) crash.

Marta

