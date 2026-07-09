Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83112C43458
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 10:08:48 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5869.1783591721779148199
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2026 03:08:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bPLYpE6w;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8ef1dc934d1so6792596d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 03:08:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783591721; cv=none;
        d=google.com; s=arc-20260327;
        b=qRjTgGLkOThoX0RehGJhfW8yREWOyGysFWPbzrn/3IHa9H0m0SsA8Jbtz7O02L+RbQ
         P+Y1jZUVqY5dFc/GeKYbOrHP/Au57l3HeXcJ3EqVz0W0KspXCpm+j3ta4EcJO3DsQqco
         rkzjNalMXKCTxe5rp2SNGBsZCaqF5KeNKZwSx9kCJ558wKDFFt8hX3Pba1Jryqel6ZYq
         RLFNiufS4xMNZ325by7yPZ9vGqQxh70rfFugvzHeucPki0OCANdy8+nBj3/vBIlMT+Hu
         IVgh2lYTXhp+hdeTM/+0yERX8MHlZ2302S3voUHMrL64+Qmi9kFjuAvrMyHgR+JtvYzu
         mw6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=R/eWQzVusBKWoOwvbQNkbgjQIrXQbja/WltCD0kJQ64=;
        fh=cPBSa2bPcOK65+sz6qCMWy/OU7OhGJNaXGJCXkhGLPo=;
        b=at5CdYnBa6FBVqmPC7GkY4VuZcMkqReMu0OYadx5EFBxW0FeYsIl84vB6DMOQbmUZl
         99mnuZqJzUlsnacmyTqqoLJgvYW9POJKDPDMFcnCYnfe152HDTQVTlf4gCBDY8lhBuT9
         jvKSi1dhaUdk4LfkgM4iNGPDx5XMa0ngn5KG+doQjw0WhLlJU+7flke+TucHK66B7QF4
         butQAzTo9U/1wmURn0i1iclVb9jBM3P3xqX8u3vYf41duTCT8Kw5EKNomYbN4kpxB8La
         WE0D1NbjPUfdfdNUsVUBVVmhob/ZQo3fWZOX1YpZvSR+B0+fl8VWKzrrx24kbotyP2AK
         szQw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783591721; x=1784196521; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R/eWQzVusBKWoOwvbQNkbgjQIrXQbja/WltCD0kJQ64=;
        b=bPLYpE6wDsAGg3kfiENYWG+TFl+T2xkW8SFkYd6GceijOm72IfFY/wujFrlSZbGDuR
         x+N1gaX9TJc6HZSUKchc2Dx+3ADARkJEBJBUYiEW/JDZnTvYT2JfkJWEaLCSChkgJHUu
         QvjJF9Q9fsyhG/GteHZK4qaKkQo798dk2eBhyPEy1sqlCmvpjfX+9AUd3e63xKu1+Knf
         fJQjFVCR13FUml/0q3BSyA/+hkglY4leXYAGPCYru+GOSyh/Zm2+ELBKvAtbzVTBZ7ns
         Ea7NDSBDu8o2CQvAuB+pUpc4K+1jqwKYZRcRJn172gnhT5066J/xLfeg8Miq1beVes1A
         A8xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591721; x=1784196521;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R/eWQzVusBKWoOwvbQNkbgjQIrXQbja/WltCD0kJQ64=;
        b=sgLqzXUHK7q3LlRcGg5gvYoyNcQExVj59WqngwKIHmA0eiMmrOPjM9/Fp79luZ8hRb
         GAbKum+SOhI7Wrf9CaZ4kCP64S2bF3hI/Q6D58OSk3lGhbs2R2fGZn1P99DINWdYCged
         mj8zjssdWqhS5Od/1lfwszm/5uagskOUoVjv9WjJJ2Bi7E++dYo7R0ggOC7tphPwtNEw
         dNFdFPX10IaZYwfNEqT9Q6QLedwgv1ZTiuefVKsNTmModv5dHUrIM5ChXPhcFZBY+S08
         JDPR/uQpDTCYVWaQr4lEYS7Jzw+3/mP0q4gOprgW9gTvGW3H+hmLFxJvVdZoc2EDsO4O
         XSsQ==
X-Gm-Message-State: AOJu0YxaHhkikTWR/tGg9fKFSzd87tvk9htO3q1sYYVPpGdTAeZJgq7/
	NUFPRsPGyC590b+B0NrLPk1jp7Cj2e0KzlDwwUivuJh8wPWhlei2aZQmNc/JTAtvGIdtzPsktXY
	x5tGWfaPkkmsoEJWRFi9gEjHyO5TjBzA=
X-Gm-Gg: AfdE7cnLq37HGRgZqoK2g+SWac/P+Fz4SZvAu4uJeEYey186EYTFb8SgfVrlxP0+cnh
	AtmIVoJBFyG4wG2YxpY7QAQK1+PmyACYwC6Fh4yUYMPFo9ilshEHRk13XmbS8YAbF3rxcTUI4LB
	eBY1iYFJGsjkcRyp8ink88i6PH212McNCg/sQcCR8hsqX1XUowAEa77pKJO34AH/pPgUcuDOGdy
	C/sZdVsTbcniihAUeUp69LtG3OZ5OGAmxa5OI7/icrdc7w8X+T721R+DU2P9ibpstOu3QXr1g7l
	mmzTuOtA8YIjQ0glRYIFRwk3KtTC6CU=
X-Received: by 2002:a05:6214:20a5:b0:8cc:f3a0:209b with SMTP id
 6a1803df08f44-8ffebaed6aemr23096306d6.17.1783591720559; Thu, 09 Jul 2026
 03:08:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1783457902.git.john.ripple@keysight.com> <20260707211507.2585072-2-john.ripple@keysight.com>
In-Reply-To: <20260707211507.2585072-2-john.ripple@keysight.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 9 Jul 2026 12:08:29 +0200
X-Gm-Features: AUfX_myxRCb7AkVxf9fSWJHP1vPB803yoP0su2mwmEkI9EkGWQSpcx2s7dT5fqs
Message-ID: <CANNYZj-xdkU0bwLNU4_urNXe4Lpe6ZLA_+pGuhd5DuTY9N_Cdw@mail.gmail.com>
Subject: Re: [OE-core] [meta][PATCH 2/3] oeqa/selftest: Add go-vendor.bbclass
 selftest suite
To: john.ripple@keysight.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 10:08:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240573

On Tue, 7 Jul 2026 at 23:15, John Ripple via lists.openembedded.org
<john.ripple=keysight.com@lists.openembedded.org> wrote:
> +def setUpModule():
> +    global templayerdir
> +    templayerdir = tempfile.mkdtemp(prefix='govendorqa')
> +    create_temp_layer(templayerdir, 'selftestgovendor')
> +    runCmd('bitbake-layers add-layer %s' % templayerdir)
> +
> +
> +def tearDownModule():
> +    runCmd('bitbake-layers remove-layer %s' % templayerdir, ignore_status=True)
> +    runCmd('rm -rf %s' % templayerdir)

There is no need to create a new layer, and place files into it in the
test. There's meta-selftest in oe-core, and it exists exactly for this
purpose. As far as I see they're all static files, and do not get
modified inside the test.

Alex

