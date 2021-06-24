Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web12.4238.1624519314765821911
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jun 2021 00:21:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jVKY2b82;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: armccurdy@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id c16so6405872ljh.0
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Jun 2021 00:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3I1LssK3I114Fk11NfKtnuevWku5HorZcIMepULiftU=;
        b=jVKY2b82JoUPHGDQhfhMzD7Rydc2K9xsjgEbOfPM1z6nLK/pDal0wRynUj+sXdLdLn
         /MuI7ltbTLfqLfq15WcLERmZlAYLc0E7QuJJFNE3DfnMNdgcpqctTcPwz/28AhCfIqt0
         kjCntJ9UDsOmSY5Iqh7gGT8xJif93Rufr4FwKFxYp5+PuGd815lNfxevL2SmAvaRGh5b
         p5NtU+9VgbOLTlJ6JcZGP3IvCnYs0Y2kLfkcz/DUDxI4wDbzB4NYRusUC8kbGrxoFHRm
         qBntdobrJF1CdkXw2IpYEhxLJ0OQXtEdL18wNlTAQkMhjuEY2yZwb23B3x87jAbmlh2r
         ycTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3I1LssK3I114Fk11NfKtnuevWku5HorZcIMepULiftU=;
        b=KvLkkpaeKZByCY9FwcY5TlIgoz4kQPm1EUJzp4pP03Qvp7uiweNTs23r1zZeTt0F0u
         RsnhbZHHULwZGQ2k5ynJWqqRmppU5Sz1866NCrcqOFEoJn8S6DFbbesAt7XK3iaYFIU+
         yUezxUFAZGpk1oLySZ3G1ZBe+Z1YDspPm66i8Q0MRtaLu0VVg/tfDuxMN7041efIjTjJ
         RlrTr3IjcZxzBdiN2DmPEtSW4qrd/3kf81NNd3dJtJlmShwz9zu1wwUBKr3vI5DxpPVX
         phj/tLbHldNzxVpjzH+mx0KZNdPHbvr7WyZM26Sh//JRQPwLdtU++cpeWqqQ9KnK5is0
         8Qeg==
X-Gm-Message-State: AOAM532pMCkU4UvDUEKA02Y+N5GYg9lZ4mIUuyouHmE97Eb8L9GUh50J
	s1vs5tub9xRjbz1EsHvCMn2+W/znbfcfmv345lM=
X-Google-Smtp-Source: ABdhPJzodTPDVc1p5Q2o+deqWGHdixX2qxu+Ulny80JE2K2mjiDBtgA/AimDiCBo+9EE0dIosuu1tyGROavB4uqPmLY=
X-Received: by 2002:a2e:894e:: with SMTP id b14mr2902644ljk.112.1624519313065;
 Thu, 24 Jun 2021 00:21:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210622192723.2041345-1-alex.kanavin@gmail.com>
 <3324.1624431667479717516@lists.openembedded.org> <CANNYZj_wbfFtDL+8HSAJzqvrmx+y0ofbmmrve91qBd8PfO9WFw@mail.gmail.com>
 <6dd3291340e74358bdd444d563077690@XBOX03.axis.com> <CANNYZj9M5diDQ_jirzug2rRDCugTrCnhjHS7a6tXNwBrMAFwvA@mail.gmail.com>
In-Reply-To: <CANNYZj9M5diDQ_jirzug2rRDCugTrCnhjHS7a6tXNwBrMAFwvA@mail.gmail.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Thu, 24 Jun 2021 00:21:41 -0700
Message-ID: <CAJ86T=WnCZ9pFtejfiNOe5TVzu3niRiaRPoGLfEJX9hC99Q2bQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] pypi: set SRC_URI with =, not with +=
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Konrad Weihmann <kweihmann@outlook.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 23, 2021 at 3:18 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Frankly guys, I think maybe we should just break stuff in this case, and have it fixed up properly, then try to guess what workaround might work.
>
> From that perspective the original patch is the most clear.

The typical ordering of variables etc in recipes is to put SRC_URI
before inherit.

From the perspective of trying to get recipes to stick to a standard
ordering of variables etc, _prepend seems to be the best solution.
