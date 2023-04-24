Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05AADC7618E
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 09:53:31 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.47313.1682330007932580257
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Apr 2023 02:53:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=QsQDScSe;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4ec8133c59eso4221234e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Apr 2023 02:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682330006; x=1684922006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PvGDPg8q3f29PJ2GoporiZdQQ4LSVldIsVt/bTiCM0w=;
        b=QsQDScSeklJ6GQF8TfCatFy5tkjB788+XNQL/FlM0u0ey+b1/AX/Arrvebk9vl1Cyo
         8fBfajwGozYL7V/Jjkx+fQvVWV3F+RvpT/Q89gpFEE1SV+z/2bF7YJxGHQ0lmikD6gsH
         F4BE87QzxuRSyx4aqEDFN0qu0lRp+49dpcYQZqIorT35CcJTgUhIZ32tNtOmLw7/vRN5
         SR5jpEnmLvhwrk0NRkDR0DWPdfOiTnUkmphhJYs3FSU63LiArD7c8UeVKSl+5w3DQtNn
         FW83B1vjrt9ivBX2EkHmTYC5abtqsQxtMIRrN0PpXdd7O0hLLGHocbM2TfCbt67utahn
         g2EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682330006; x=1684922006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PvGDPg8q3f29PJ2GoporiZdQQ4LSVldIsVt/bTiCM0w=;
        b=cmNPcx4Ks2kJEX6het8K735J9RTC6TsDItoYoKAPvK4mjTr1acWHaDR1b12Vk7G22I
         HVdyCV6ijaXI0XnBhhrApV3y7rQRRYmofQq35FGQALlyss23emF1GsunGtKq/ffRQ7Y0
         t41mBOdLP1EPtlqEVoHNYSb2muJFAApeHwRmvBwVrQPkxDmWTTZcpds60Ykp/rUjhQt3
         EiD0K2OaEnjsI05MP9HhMhxxr435tcv3uEcnkTem2RioNksHyUoyH6HfqAfiyTXSw4ob
         AjxM03cxCvngefbUaIcOi9O00mFPmBGC+myLwjwDN6nZHVkLn6e+aRKiDF5SsnaGXplv
         weLA==
X-Gm-Message-State: AAQBX9ejYosJydpvjiJzGD3a0XWBcU+uYNTWsKl66CpJH2CwdKB3e6Lb
	K0FlfabxTwOwmTnMcjcfZqrOByvtFphKeIGt5Bs=
X-Google-Smtp-Source: AKy350aj1BfFB+BSqiUskRp+KluqP+nNbmZUMmvAonLMIPkQjmVzIU+Iln6URkJFWVPyH0YZjoyfZb9pStA+dAaH+d8=
X-Received: by 2002:ac2:42c4:0:b0:4ec:a0e8:9efc with SMTP id
 n4-20020ac242c4000000b004eca0e89efcmr3144319lfl.29.1682330005831; Mon, 24 Apr
 2023 02:53:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1682178812.git.frederic.martinsons@gmail.com>
 <CANNYZj-z_nV55eatamXDzGh5Y0TzPX3=yOJ1UnL9qtOHgtpKbA@mail.gmail.com>
 <1758D12BE8A5C7D7.10313@lists.openembedded.org> <CA+cAker=3c7CYdq8WRnaVmr45n-Ja2Tt7p-0iMWKmDeAcZJUqQ@mail.gmail.com>
In-Reply-To: <CA+cAker=3c7CYdq8WRnaVmr45n-Ja2Tt7p-0iMWKmDeAcZJUqQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 24 Apr 2023 11:53:14 +0200
Message-ID: <CANNYZj9hHYvzsVxXDYySxFX2kZD0Am9K_xEVg_hGcF7ACb+izg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/3] Create class for building rust unit test
To: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Apr 2023 09:53:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180347

On Mon, 24 Apr 2023 at 11:44, Fr=C3=A9d=C3=A9ric Martinsons
<frederic.martinsons@gmail.com> wrote:
> I looked again and python3-bcrypt is already in PTESTS_FAST , for zvarian=
t , the recipe is in meta-selftest
> so this layer is not always included, is this will be a problem to add zv=
ariant into PTESTS_FAST ?

zvariant could be skipped for now then. Are the newly expanded bcrypt
tests still quick (under kvm)?

Alex

