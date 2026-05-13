Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2706ECD4851
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 12:32:31 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6394.1778675544799334540
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 05:32:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HeC2EV+j;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8acb856a674so81639156d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 05:32:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778675544; cv=none;
        d=google.com; s=arc-20240605;
        b=VBQ1XN9X5578ni+jHVdGSULXryp24HcMFKy87AkFs8tTsvvD3TWWVVYZUj5r72knYo
         qTxdBZPd5OrGloD/ie5OEg7LiQoVOZCIW9B430fkY7TALUGymmm5brGjSFLvltYdx9H/
         VE1LPro4XWz7mos+LD2Nu7rS+TPasz7V5/S5Jpmi5CxAgYrYkMIQrf+DTNr0/itV9Bpz
         ucrUudMhyG64OKQXHQQ3F+0WyuRWVh1PicJQtgLyIoXj68MX+Ko8nDixQTFpiYjMiO0L
         w9VuhwzlUi9f56tO61Ta+ZwNBwfhLRhdfUGLFJPyBiiARquO5OWNJ+iHhm83xvEKl930
         pJFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RYqdHrSlXQXwfTTAEiJhrHVVCwAabmqYu4pfTxd6M0s=;
        fh=CBzNg/NL21DWTHY4T0WFOKUAyqx0HIPJNzSHf+IjR2E=;
        b=Lu6m9Bo0mSe3fV/5eNLs1XOFDljvc+0kLHkOSpYAJ91fCwhr3k+r7LX5Nd/OgDby7M
         yhH1ZxOuSQIywRAzgi6KLHi6iEkh8Mz/huA8FYNSJnsq87ePeQY7SC8xRj5KjbsHbCWK
         A296+dq4ztsgBUPss0GaILtncE9yGpLkvdIy1niM8qIbHXb9S//kdUqDBD9ZptUOVy+a
         hMnyGGQDB23mkAdTAXK4qx2gKWDL5mxB9CHxAgsUSp1UEy7lVJ0hEOZnayoXTQrbocPM
         cD/4qy9JnBBFVgBuYrkU1XpU4rAPQtN6SBNXSBQT9gpRlGue+hX6Ywn3CZ+j7HUutIWK
         9sHA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778675544; x=1779280344; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RYqdHrSlXQXwfTTAEiJhrHVVCwAabmqYu4pfTxd6M0s=;
        b=HeC2EV+jjEX0XEe6W3/UKmn71tZjMrwLI0tlJWFx3iObAuPUcP0/2C/ULGKFrFLt6r
         ck9JrGjJO2veSjJLKMg48eMorMFzGSYJpof6CkWunhXN4yriuMMOkgyojatvdNu4cbdu
         RXxV3utD8FiQTRm9t7ZPq/OfDabOl8QXW7jNkJtpUcLGb1GkuWIvzNqEHRP60oOZDm+p
         DQ2Ro+iVeJrQNuLfdujqY6fwl88e5TBLIOY/WIFouwSgxbmC7hzK8yc5jRZb0/gp/0fh
         K2o8SDQoSh2h9CWEOaM15lDMuzSWefsqmxsuwnqgvKZs2BwmIaIL0/i7X8CJM1fimLPt
         /IWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778675544; x=1779280344;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RYqdHrSlXQXwfTTAEiJhrHVVCwAabmqYu4pfTxd6M0s=;
        b=Z0iH/TaWp2nlvH/7aVpYqiZo4w1Cs3xoZB9a1SovF3A+lL5Z+x1dIAympE/BQs+0BW
         JoOKZ+B6F6wo1eQ9RVt1eWIUN+BoYI8PAh6knSYlSptDSlsu0d46IyFn2bgGXIVdP09F
         a6KAKRuCcnCw+fXXyEdm7f+m2WCx6DN6uMzhmxVeUHeeg+ul3oFSvq/838FBsYN7u9gG
         arGpmu/fyFp/z2quNiuU77PeQd2obIq4IErvlO6xRma2kbmYFKlU5OQEmXIq+9xoIRFG
         VFx3RjIHGyVRhix2QEuTMIYUp9GzEw0oPOL4x03XCaoZVHANFX1Vu8ha7oFlUKCKs6pd
         kPvQ==
X-Gm-Message-State: AOJu0YzGx4suMNXiv3sWc8GLAPnv9LHRrHQ4x+nnKacvaPwvLxhcDrAH
	NMZu2gDjfg7skPvYpCxohIuVuRFqkJ/+wPDpLAIfMQv6ZlobTxssEyFSjjqo8OxWgtjZmwfn7rf
	3qrN5n8BdUOBR+QONSf/Y6h6rnGj8vBX2/Q==
X-Gm-Gg: Acq92OHaJglftk28VGovoU2e6HNvX2TnKNUnhYNzJKQjzcuBNSAN6MIirx8tyJzqoDz
	w7rrw7Q5rAQoJ73F8x5JlfqO4W71Jhu6T6bE4KtDkfb9nlzHA7pRvILmDMLQZVxfJX5V+43Zzn6
	s0Q5HfyOvYH8JslweUeNxFrxun8U/H8mH1z73ezSj9nk+2pp8Ckf20hKRpzKpogLqnDHfcEJhOD
	N+QvbX4TDv0R2MZOULzl9zxbjv+N6kGjZnltE9jkJQKSI2Yznikgnf45NFnEJHtC6mgDmvoOQ8Q
	IIZp/fHVV1U0mTssBNnt36D9U/KB1SYyBoCfbSoy6QuQzt2414RW
X-Received: by 2002:a05:6214:3d85:b0:8ae:660a:be75 with SMTP id
 6a1803df08f44-8c6321fbd3bmr110413226d6.9.1778675543647; Wed, 13 May 2026
 05:32:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260513121953.3157310-1-daniel.turull@ericsson.com>
In-Reply-To: <20260513121953.3157310-1-daniel.turull@ericsson.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 13 May 2026 14:32:11 +0200
X-Gm-Features: AVHnY4LIEMLye7yNBrLfB0KfOsom59qOx5Ton5UqZWomU0nLyovi8k-XD9eADRM
Message-ID: <CANNYZj-UhfEb18RMfDqqg=88GZ1nAtbzEZMp6+AKxBRe6Oxceg@mail.gmail.com>
Subject: Re: [PATCH v2] devtool: upgrade: extract changelog between versions
To: daniel.turull@ericsson.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 12:32:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236968

On Wed, 13 May 2026 at 14:20, <daniel.turull@ericsson.com> wrote:
> +    def _check_changelog(self, recipe, oldrecipefile):
> +        """Compare extracted changelog against reference data if available."""
> +        changelog_ref = oldrecipefile + '.changelog'
> +        if not os.path.exists(changelog_ref):
> +            return

I think these last two lines should be removed, so that the changelog
check is enforced. Otherwise it's way too easy to regress the test,
e.g. by replacing the test recipes, or adding new recipes without
associated changelogs, or with changelog files that are slightly
misnamed.

Other than this, lgtm, thanks!

Alex

