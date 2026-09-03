Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3B99C624A4
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 08:10:18 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2821.1788423014182165232
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2026 01:10:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=F5DoJ4cz;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-51bfe810293so18229011cf.1
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 01:10:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788423013; cv=none;
        d=google.com; s=arc-20260327;
        b=QMd4+Xj8PynX8/tMvKC9Y0D+I9tmxPvkVU/31dqmFvkVU3VDOgHSlSHKJqZNZGyAUq
         TBhxzaeJINSOsc1EhyCL9SGYtC1cRUzJlg8beTkgBC9Gn4mL3w7zEvzScChJ5wK+yvxZ
         fq8mlLTf7AVpSjFYoE69eMQz/dQpFxYFDMx/rFl6Nm9PkMUHDwbrLjCzAdTcPJQm4tAR
         gHCUdCKVfQXnrIll5sX562lE3VyLTbn/HxE1uwCCGzS6bBNrzE7jjmEKEXluDJaUjxHP
         bGhtfeCSix9zhj4ni7/QRCKWkisV5I2k5Yn52E5kuX/POpuQ4bQO1ResKB6UqgSAZpPO
         utSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qsi/mT/12KdZt7dcGvXktDgOSgKcVgsaT7R6QxoyYFg=;
        fh=6trZKu6CeeobEveUQkVRxCghTyh9FO/k4oP6dTfwfYo=;
        b=bc6T7tARVf8zv2932D0vtgGG9yEhNhpVOHpY6kGCLmI5e/o8PpOXgJYAiu18R1aoPH
         SJnOggVkJ+D5KbOql1VDrtp2iKKcH3Jup0JIeWqlarQaXIEUVwcg4CLMuDpYDBeEZPSL
         X6nUCxh00E3pT+6mKnzabax4zWm7oGkfFw9+m3nFSsv76LrKC+Cu2/uj/KIlQJINewom
         50sn7+RBdmC9gi5kdyhE3Bc2kUTE+ATxIawjAPjW1FPN7leQDoGqfc95V4LAbAguPZYp
         vRetkswlFnflV34V0ISmDoVZeO/o2o7zji0vPWb28AEdq4vgw/Ep/SQsv9AesVasn/Q3
         l0oQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788423013; x=1789027813; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qsi/mT/12KdZt7dcGvXktDgOSgKcVgsaT7R6QxoyYFg=;
        b=F5DoJ4czi1oInFL6kudjX4zzQStQTg5gwopgn7wfm+3iH+jEbXWROBGoItzM8pvhH/
         EsCp+ouPKZ1d8AicaaoGikTle8uWdYTmLww9nZ0lnHZWNsfTbgLS5hL1p17KEaiI+FZr
         zCEt47kLVA9Sh2uUH7HPtfuhrvxePiZl4aY+Oy4AXQe20TFPXeCpwBr7yqnDsCVERBbL
         v/eSyz7v1ZBauquavkHpFCWhnygQczMc/tMxAVj83b/YibqpkZ7p96fJSv0+hJufC93W
         qneFt33DI816hFZcluXBMIGNiPuEOSrkB+kdHyFylOftAPYTqsxD1lR+k3msmCK7uQbt
         /0ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788423013; x=1789027813;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qsi/mT/12KdZt7dcGvXktDgOSgKcVgsaT7R6QxoyYFg=;
        b=JA3sTr7uMpyZiQNjcYWh4G6r/VneuIcyfSSnAmOJ0sVkvXYcT5A2FzisGF86awl+p8
         oeIdEqXA7HQIU+CQVDNl0L90BFr5EJ/nuG1omxE2ztEvqYfJs04mneVOldGquS13+nae
         Ph1DCo8YGU98r+5pA/g2YCBKu5aJwNfY8okS9UNFdwl48djTTj4nm4gBFRqHLG7dFYjy
         8W43tfzIo9wx5Tbomu0Ay0yEkZp6HqPyW1Yhdapf0Gl2x8vZtb8Mt75PjgKEKUB6srm0
         gRJ21Ltim3mcupxtJlAE0MlfgmE2oiX1267EhWrkLogVr0AoYeYas4hWYOUffkDjCerk
         0q7Q==
X-Gm-Message-State: AFuF++m/WKCWVEcgtNsRCfl422Fo9FnxqbTOztZT9tl28hSfKbg+iLYt
	aCCUC/xAlJZLxiiy0iGkrMk/Gpi5WEOPfncxQqLCVA6O/HaQJB4swFOaeimD9exfDO2xRaheqCY
	6yswRs/E93Ws1FoMFOWdrP3tWk/836cY=
X-Gm-Gg: AYBFou1TXgEz+k5prOfYau2FZMoEaOw+EYJCIW3hBZublTspHv3HLFjqn+VpiShC7La
	NljX5YYktVSyY0d5QH4YqC+bUxD1eliTKhmAh1xj83RfXaz9If9CKNAG+r+Q1fJ/CpYFTV0BFpE
	m6g6A2ndyhktDTAWHHsTEBhK9eEi/wK6S9bAQQRXtnPFhhxwK6WHPE/JRc0EA/j8qTeEVjpremd
	YSoQwMu8uW3EMFxi8l3xAoP7cu0I5TdaP+KXRmXXRlVQyy9RyUetWi7jm5YPBsrTO+dxxhVNG3d
	gmZj02FY68dFjl7sdUy7fN2YDioHwNgJrijKektWuZwYh58eEoycqItvb/vTlalIqmLJdoYOy+E
	a+QYaZ+nZMHrpRg==
X-Received: by 2002:a05:622a:c13:b0:530:42d4:4c97 with SMTP id
 d75a77b69052e-53042d458b4mr59158411cf.41.1788423012969; Thu, 03 Sep 2026
 01:10:12 -0700 (PDT)
MIME-Version: 1.0
References: <010101a065cacddf-8c4c8571-518d-437d-988e-c3642ad3b435-000000@us-west-2.amazonses.com>
 <24c12b9706da066e59f1581c91a8f238f5fe83b8.camel@linuxfoundation.org>
In-Reply-To: <24c12b9706da066e59f1581c91a8f238f5fe83b8.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 3 Sep 2026 10:10:01 +0200
X-Gm-Features: AcwNN1UzVcDWDk1v1iRB5jZccSL7AezZuE-xm6LMW3oYSlalbRnkTHtdnqrEuI4
Message-ID: <CANNYZj94sKa-ziuwUpmfZSN+xjdgnM7ir_U8-RHiPjphjO5+dQ@mail.gmail.com>
Subject: Re: [OE-core] [AUH] mesa-tools-native,mesa: upgrading to
 26.2.2,26.2.2 SUCCEEDED
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	"daniel.turull" <daniel.turull@ericsson.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 08:10:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245017

On Thu, 3 Sept 2026 at 08:46, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> The changelog is a bit weird on mesa, it always seems to find the N-1
> version rather than the one it is upgrading too.
>
> I'm also thinking the AUH shouldn't include the same info twice for the
> changelog, or the version in the subject line. If it is the same, we
> don't need it twice?

Yes, definitely. AUH should be tweaked to not repeat 'old.version ->
new.version' if it's the same for all recipes in a group, and also
drop consecutive changelogs if they're the same. Daniel, can you add
this to the list of tweaks you're planning to do please?

Alex

