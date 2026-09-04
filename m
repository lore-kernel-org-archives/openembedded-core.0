Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36B4CC79F82
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 12:54:07 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13167.1788526440550548460
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 05:54:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FfSsxjL0;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91041ee9230so6821856d6.2
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 05:54:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788526439; cv=none;
        d=google.com; s=arc-20260327;
        b=f2RainqS9vMomirRZkMw+TgJhty6KY6v3+PpauxG0RJqx4KxBp/oQzWFLbQ9VrogaW
         cd7nCZveBrAbB3GasgSwJiRDdkc+0GQoaI4eule0D9eRwoOfyPoVd+cdfpYfJhPAY1uB
         sxVwNBAmiSCGSR6vg4DedEci846KpOYNkhyPG/xmk8xFrrS4wNlgZgIl+pH3l61+jQBn
         NCX1hW2IrHmyc4sNpcKaw7iv3bJmLuih5kp4mdwz+cXaYPMfjfiKiokY3KuTYVzvVDet
         n7ZseaKMoJ7FC8k61/RXXE1sICsjk1SCIPQjbnajgr+fSPPAedl3ktNX3DpmWNfUZgYq
         UEOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SKCYTu5oIiKSx4Vkpaiv5a9H/adVrVp9Fu1fJ3KHuYg=;
        fh=ZfVU6jf+dRkaj7NBogrTyOVyJIDyPKrCJHCtfvSwpGE=;
        b=lBr3ZRtqvB8lVlPs4NVmbCb9uRQ4yIrWvC6Lc5cF7QD6V2A8XXTTUXa9efRNn9iWQP
         4CvYb/eqvl+/GddsOjeW6T/MQdflIjLAvB4pD1T+0ahmxiZCB+ctx8sPM3zw8sHWLd1s
         Iph34MKASJPICf9ZJbKc/Qe5GXUTMi/F/8qrNah6v/rfysXkDsNya+SyKMD2uU5KWF23
         DAWrQ2Jixl3/U5SbmkA56GsrGOeQwWwTpbLWsBFZR2Q6c23sGg5CIA+IQ8PRBUdNvNH2
         EP9FWF5aTiy7TmNfVIeyrFFx3T/vp8/WrB1S2OOX41s/1R62jrM7V2BbfrnIEt8RbX/+
         Tghw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788526439; x=1789131239; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SKCYTu5oIiKSx4Vkpaiv5a9H/adVrVp9Fu1fJ3KHuYg=;
        b=FfSsxjL0cWW1qJvek78W0iE7uJeBdOZ8+nwxDRlJCEWH46Uj7kpxFInK92N5OxC3Wm
         FRUdkm9gkiBv0z3Rryxpkdcqb59pzV7iCoo0COmaVW4shwSPb4cPqjet74xA6gHBt+aV
         wgogCiFm3vhqx/pnA2CnmCb/oqUoP61bWWMRhSJhtbW8PT8LZTVJDDlwpjfHbZJjVqkV
         8Y2Zb4TZ5SBj5nBt8YigZIkMGu9MfS53m53gx+NrDYKlEl74V8BewSbU+G6QjZQqOuQx
         7I/2FE/45uyqW9QLRiWtkBR6XlCgYigOd6o+wh4p7GaTjPfDPR+uZsV+MgOK7eXurWMK
         Bb+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788526439; x=1789131239;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SKCYTu5oIiKSx4Vkpaiv5a9H/adVrVp9Fu1fJ3KHuYg=;
        b=LjqgTXU6sdX1UEdRYjYWO+z9ABCfFvdbtgpKghmeEcg7i+eHagX421C1zvFUbq2AQo
         bn6WYpedr62TRVYZ88O9RzAjQn6uHJ+HWEascQWSzxcHPHOGZSjQV2L30u0sryrizACx
         pQhpr+pdyENTMRjlm1mb+f+RvME4FgUdrF6w+eCC2XTbeul7k+5a6qOW0S0h2OaBzpPx
         N1aCmZtPDcqF5cAJTAyzUSnZsOe6X+EpgnWycR8llpDIsPv/F+1zWEH6lPn7TPsydsj0
         n+5XMHMvtj5y0idJWZhdcNOl71n2vaJTjb+Q3hAdUSHwkBKLic7mr1D6flpq+d/29uz3
         Lb5A==
X-Gm-Message-State: AFuF++ngck3FkHTyTQ5tJxzJvEkknqYa2M2zJ04B6AcD3+mQ+YrBFeGo
	wnDXU9ASGgswBVTNBw6CwyevK3of+sUvuStE+geNegQjojYIX8kkiA/9AT9LJFKj+K4waCC7aUL
	1+b4jmtVr6Dse6J31EEXfufPqWbPdIM4W8w==
X-Gm-Gg: AYBFou3nbcrf6Xj4SeLb3dPYosGw8U2ck3rYnHRSt7OVi5DTIx4frUBSUKu7s3vpxbB
	UsamQG0Zr+80NwVaXkL32JMychMmLXrGNGlyyazqQiWDDUN07pSWVuaCGXRYx+PL9hCnRG9+eBs
	Dohy8PA79x9TpPpgywCZr7iVZqx34imp0OFNbLQ39GkoFZcyXIl6X9VbglOw80IgKk+Ugi9sZkP
	NBBlUAmiKfekJfQjfiWTe8gfnWyreayQPPsl6twRxJFbqykZGAwAi9mSwFw4wSSaUlK+aH1E+AX
	wGOTsFRNn1qU91ZHZSCd49sHIMj73jYHw3oqEvEYTqeQEvQUKqsZBVYEctUOO/Q/acDp9ZtamwM
	UMZUSmpuC5/GxPg==
X-Received: by 2002:a05:6214:4a89:b0:910:3452:d580 with SMTP id
 6a1803df08f44-9103f057b0amr67082056d6.32.1788526439389; Fri, 04 Sep 2026
 05:53:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260904100208.3052527-1-gustali@axis.com>
In-Reply-To: <20260904100208.3052527-1-gustali@axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 4 Sep 2026 14:53:48 +0200
X-Gm-Features: AcwNN1Xxbm4EzZ2YU3ytiPN638quWhGtdFgB_TTdnK6E2qy00MGsY_Xnj8wsJlk
Message-ID: <CANNYZj8+JD0nUxr9QuN6S2gkCzE4Fs=AXV5qzd+hDXNCqOv5LA@mail.gmail.com>
Subject: Re: [OE-core] [PATCHv8] boost: Add support for building boost-asio as
 a shared library
To: gustali@axis.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 12:54:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245102

On Fri, 4 Sept 2026 at 12:02, Gustav Lindberg via
lists.openembedded.org <gustali=axis.com@lists.openembedded.org>
wrote:

> > No custom compiler executions please. Building a shared library should
> > be done by the boost build system itself, and enabled via a flag to it
> > during do_configure (e.g. via PACKAGECONFIG_CONFARGS or BJAM_EXTRA).
> > You probably need to patch boost to do this, and send the needed patch
> > upstream.
>
> I spent a day trying to get that to work, but it doesn't seem to be possible. Everything I tried either breaks
> the header-only version or doesn't build the shared library.

The next step is to ask boost upstream to help, maybe by filing a
ticket, and/or continue maintaining a .bbappend with these changes.

I know boost is horrible, and has a convoluted non-standard
boost-specific build system, but we should not be bypassing that
entirely, especially when no one else is asking for asio-shared for
now.

Adding asio to BOOST_LIBS is fine, and can go in as a separate patch.
Can you send that please?

Alex

