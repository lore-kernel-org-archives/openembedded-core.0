Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67B79106B525
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 12:39:03 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21182.1774442342573821993
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 05:39:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Czsyw9Qs;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-899ee87355dso75470516d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 05:39:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774442341; cv=none;
        d=google.com; s=arc-20240605;
        b=NTTOkdhTnjjPIx2R6LRcw2KuBgY6+queKG6WzPzXCC8Sw9E+XZLZI2jL1CrLrARkfg
         O6DL912YImgft5LTsePcc9j7gKKJ3JY/BrLOWg6paqVHd1ITuxjD/oUbb603DdlCN69/
         7YI7FofZpwXcV3cOYLE8Ob57hjeZHF8pptDLimXDO9jTTPD0iDIJuyfl0yfCTdfX7Acp
         lnMHLOViOtSmTB5+CKXzo8yGs9UVkcZaUhZB5kUmLeTdpTCnc++DrruAb7khPTrvCs4h
         g7jyVgf/fQ0t8iU+YzeJA41h4zkHR1UkBbMpn7yMO0W8QFseF3GiqS1On1vWLdkC2NlH
         3PnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9PQQ+HNIWP91KWdLeF4vH8LANqbz8htBLMhre2JlzGk=;
        fh=yg9HFI/65n1Nxbxfc79cW9kOSWF6ummo0d6ZzmDjQ68=;
        b=TKWW6rQVEUxhUAL3bALnDLq3+VOYdiykBAG93pyDoqVk02QKvhC4wnTgBMNoHNrg86
         E/chRm8Xan+2d0AsUH+SCuLowhF3gOPEjaiEW45br/iSu+08A1K0HlvhiQl6aBa0Pn72
         fRNdsiaDnvQgL3apPeRKzkSsgZEW4UNg5FxFiBXr2uij2e7J/naqYULRYDZxIRdDr8R6
         EhAPxWe+tqx7tPrWqFkWURdF62Ms7lvGVWtN3Z9S/eraAxnhGRfsKM1m3IUtzVykDXW+
         XPQYS3EDwce85Tn7UEqfTMkqbjw04PKEQ3H78ERrorYwmrGmZTE0NjYgajisykmUKfbs
         StSA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774442341; x=1775047141; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9PQQ+HNIWP91KWdLeF4vH8LANqbz8htBLMhre2JlzGk=;
        b=Czsyw9Qso6dNBOG9em2/JAU1fo3LrDI743NalNL4CQGwvP9bIvKaRgxp7/X73VOe4G
         RI//SviQQ2WUJO93cQ5kzKPbpgpFf7mwc8R/u+615a2VrkMH+EfV9EMD9CbaTu450T3L
         lfHIasChSRo4ntZ6lzoMjLwwQPUF0FvuEKjPDLDGERu8GjzHP7uNDLQvtQhu+Wag+x4Q
         qNTf4i9bM7IPVzY0hsaOviWAssVsYvvxbbSp9gcK9pzZ1On0IV6N3hWEEdVyGAkGP0Nh
         pZ60MeXm85X491kxVE/b4Nln//BYccG5xMnlMEQ6BJBBnWYOTteqECm9YE4zOSXLq0tV
         m5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774442341; x=1775047141;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9PQQ+HNIWP91KWdLeF4vH8LANqbz8htBLMhre2JlzGk=;
        b=svTDKoNrpdaMg+8ypTJ87ZIUh8k8IfOH2jXnSDGvtzjvZSb1VgG+hik+0paN2k98OU
         XzJZNdRcnKkAjgRppXnj5bDCy+9BlyuAlzW2V0Us/ZspYr50QFze/I/kI4atni4zQ0rl
         pAkc/X5Y/FJ5fHJv9QTJs3FDmYVFsFHDi+LB15Wm17oKfyYNZVTXyTc9zsJLQ/ftBoqT
         hj/Pmehsw075IaUrjX2ZnYBwYY/fE+yOUYdirRTtrK7y6y36saq0DHi3o8YJ5x0pvoeJ
         4rrdVN6nXEkeDxedvc5pM+7BtZcB7kxO5ydn+EE1o295hb2qlhwIeKQV28evHIbYs6wI
         fmzA==
X-Gm-Message-State: AOJu0Yy7lNnvjuxskwmr9auFl8ympfPgOsleghfpfM+HY7KJg//4G5Ba
	Mm9Idgiu47KRaBaySf1AIpb8Tdr+9DCclFH5YxIiT/DJN5o3rGGEVsug1x08H+zVUDOkr2dlest
	OVe4F6OYTMnUAvIKDZEb3pTXGZhJhTmc=
X-Gm-Gg: ATEYQzwqyzM5rDNj9dqH34mVJ19uJb4/a5DDENeemw43oRXZwMVfX6bWXSCkr8j+PtP
	D3kGT7YGCv9DLWTDnqGQmZx02RoSTFs6hZq8PkMVeiAH77DT42TEd7wsygvam8HcF1aWkquKO/v
	Agc6lOVr/ffknD+7/n/qZfc8yK+/eK4XcXswy+oiiEn0V7OmPpL1/vfUIltM2XbmWOQ9fumUe6B
	1qvd1PUMtPEnUEPq9ArOItVkEQ35A4rJfypfBXwP5BxKp28O0oc3AlDD+5PljLlyaV4QkgrzbHc
	xffLnkR+IXhsDJgUdVKjE5jyO8DmIe9JCgx3ByUaiQ==
X-Received: by 2002:ad4:5ece:0:b0:899:ec22:688b with SMTP id
 6a1803df08f44-89cc4b04b4dmr50105616d6.57.1774442341492; Wed, 25 Mar 2026
 05:39:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260325084021.3915804-1-daniel.turull@ericsson.com> <20260325084021.3915804-2-daniel.turull@ericsson.com>
In-Reply-To: <20260325084021.3915804-2-daniel.turull@ericsson.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 25 Mar 2026 13:38:50 +0100
X-Gm-Features: AQROBzB-MHZcVP6a8-naRR3ARxxESeiXIeaAQNoL59Ztf69mfwiSi2W5NBBPvnk
Message-ID: <CANNYZj_V96gfFBCt-pqpeGz1UPtmjrJLadnG0Xv0p3jbzzmHxQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] oeqa: replace runltp with kirk
To: daniel.turull@ericsson.com
Cc: openembedded-core@lists.openembedded.org, pratik.farkase@est.tech, 
	richard.purdie@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 12:39:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233898

On Wed, 25 Mar 2026 at 12:07, Daniel Turull via lists.openembedded.org
<daniel.turull=ericsson.com@lists.openembedded.org> wrote:
> -            parser = LtpParser()
> -            results, sections  = parser.parse(os.path.join(self.ltptest_log_dir, "%s" % stress_group))
> +            # Copy kirk JSON report from target
> +            dst = os.path.join(self.ltptest_log_dir, "%s.json" % stress_group)
> +            remote_src = "/opt/ltp/results/%s.json" % stress_group
> +            (status, output) = self.target.copyFrom(remote_src, dst, True)
> +            if status:
> +                msg = 'File could not be copied. Output: %s' % output
> +                self.target.logger.warning(msg)
> +
> +            parser = LtpKirkParser()
> +            results, sections  = parser.parse(dst)

Why is an extra copying step added?

Alex

