Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDAACE7BD8C
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 10:46:41 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17141.1771238794916045612
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Feb 2026 02:46:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=EdkOeFDr;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48378136adcso14547995e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 02:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771238793; x=1771843593; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rG3mqAeqxdsYLrwdy5WOpR6UQbb/JeKeDYF87r12CRA=;
        b=EdkOeFDrbR/teOcSCJcKJayWGkO+D+vTKqtmiRTBMqZ63y5HdyO20011Jejmq7VPFh
         FAgAb9IEhulQy2l6ZgUvniM5GlXKOwpOYl1PyBRFl8JUC42xpgZ/pJ26KswwYh16/+ck
         8z8hJLCpm1SSe4iY5rGSgMfBHH6TKGkAAM+JU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771238793; x=1771843593;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rG3mqAeqxdsYLrwdy5WOpR6UQbb/JeKeDYF87r12CRA=;
        b=pCZhPsiBUOlbHEk5QSlufPxUasD7aMx+oQVwX7sY0Nx4gKD2iklLRQHuwU0hvpRaQH
         o08JM8dk3EqXMdU5gbKBDd6s6j/JqnkPFVzC9qxzISys/ub/6a8TF8g3ev1RQtaSXRE3
         7i0SACWIoScYCIaTQ/zXXzMI3X0TyzwwxHVEzEEDqWyLqV483aognzIcUXp0W0Xm9x3Q
         H7qiUcvYLq83tqgH72FYniUhRCzEs8UXeX/KsZRHBO2gMAm7KhG5f7Ua0BWSbCeYFOpO
         RC30Vbu9RoSlzy6yhOktZlpOlSm5G4cMtDrWWXAH2Ah42PuYnfwqGPlFQN6f7LfK19Sm
         eUyw==
X-Forwarded-Encrypted: i=1; AJvYcCUd+fHrbSAq8zGk6O1+TY0GZq4UJulRY5qQztFDUGPR4tDCxiFH2sZzlPsASB9vXpqqt6qeU/C6F19SoseP+TfcIw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxuQdyTVWAIeGeMmixkb1VnlqYI2iz7GQpowilHx98GkTs113MX
	UfktYcC9FdX9OAfw73IaRzmIZeYffYG/B6u30rcHUBs6PWRUyw+PlRJhFYs6EYy/v6Y=
X-Gm-Gg: AZuq6aK0kCADFk5GDZD9fCy/K+TRbY8wOCokOFO82VrnWhWai76dW8WQ5vbq09NwAdd
	uNvZ87YVWw5Bsn9m40zrsQ5dQHX6bCXnamKzjg/a2SPFRww7SFd5t4IXjbm2t2Xs0Ps60Qso65n
	5lU6V9jp9rJs8w1z5mooiThvQRnfCWcyQvcQsAZ/fGpddYNh3vsmdU2dzb0e3Zr7AkIJu7czD+u
	MbiGxJQf6xiRiPhS/FAXZ9ONxasr26QK3a/e8mT+IF+9EqOcH4VHPZRG4VdolR4y50kjRtdMdsI
	prGed57XT4mMAtWJnxKttcSoe+bzZMKDIlhRrnPM6l/dlaWSJ0Se3NiBkrEkPnCRQ5xFtcvK4WL
	jrFWfhLNq7MPpghrmFVGSoOyBSE9xY6egWjc7wyIM0yQVUKTTblqIuvryP0BGwlhiAP+BWVK0lI
	s5zZYZ7iU8z8CnBQPNkHDI77n/rcuzKFxYJRjpfLhdwt+9Zm2n6gnoM1d5jVJ4ddwfg72RhnBzL
	5GY3GW4t4w=
X-Received: by 2002:a05:600c:8608:b0:483:7783:537b with SMTP id 5b1f17b1804b1-48379bfd7b7mr101211665e9.24.1771238793119;
        Mon, 16 Feb 2026 02:46:33 -0800 (PST)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835dd0deeasm385666815e9.12.2026.02.16.02.46.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 02:46:32 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Feb 2026 11:46:32 +0100
Message-Id: <DGGBR03F1CHM.2SB3BHQTX46JH@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH 3/3] vim: ignore CVE-2025-66476
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <adongare@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260202040805.596021-1-ankur.tyagi85@gmail.com>
 <20260202040805.596021-3-ankur.tyagi85@gmail.com>
 <CAMSfU+6Bmh+wDLNK-tbJo1OdY2faqh4o+x4pEdAY7yQ0H7K9jg@mail.gmail.com>
 <920657.1771236647380325202@lists.openembedded.org>
In-Reply-To: <920657.1771236647380325202@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 10:46:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231194

On Mon Feb 16, 2026 at 11:10 AM CET, Anil Dongare -X (adongare - E INFOCHIP=
S PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> Hello,
> I hope this message finds you well. I am reaching out to follow up on
> the patch that was submitted by Ankur concerning the update for
> ***CVE-2025-66476*** in the *_scarthgap_* branch.
> Could you please provide us with any updates regarding when this patch
> is anticipated to be merged?

I got the patch for whinlatter.

I'll review this patch for the next whinlatter and scarthgap batches
(planed this week)

> Thank you very much in advance for your assistance.
>
> Best regards,
> Anil Dongare


--=20
Yoann Congal
Smile ECS


