Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7245105A589
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 11:39:09 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19488.1773315540255137322
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 04:39:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Oi8iBU7a;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-899fb2b94c1so11734276d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 04:39:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773315539; cv=none;
        d=google.com; s=arc-20240605;
        b=N8484Htpm3neNZ/66UfX7F9pdSLQLeP1oIaP2p0Cu9SiD/DAkjVxt92zuxlTxj9xdg
         LJmNmJXvpzI1hlVJx8vLxTlWHsEiva2tCt3SRvOwyae0Q8upMusN+vBpZTFZHmO1h8ob
         Mj0AJF5PJmFkQiCu2tJGKxRzgOJbRqBSdrc0pUEjM6N+eCEDpQ3dQS4xOS1nyVtloS32
         Qx7t9OKHaURozIBzzp6ngtaIGMINtPhZWZZ478DxBcUN2gW97+/6uJ9WQgbtyAFwUgam
         //4b8HNx2nGZ3IgK443IEVRwhPUoNh9Qk+c4GWlKNaxym0d1w9IgrxtkncXE5BGtp7zY
         GebQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GeysEM/ELqTsDrw3+mlXIJtxDIECAdKLOzWSex+i9FA=;
        fh=BEpW/TMtW3XUFSiH6f7/bM2XhP//jPcj3/e2KXMTRb0=;
        b=b1MGioek+cXbKzpglTK+49gJ9CyUjRRxpEIowR8KT8O5YTMGbWAoMzwLbQQZEMj9MD
         /kff5NEv41sItiMSXiVXicXgPM2aimIzFASj0s5SiROC/w67z+SRVsr+9sNLKPzl2Asl
         BytUITBTrOYMWMVAO/J0jq0SXoBSkoyjN70u2KDTeSEw3qm+S4ijesvtdAsvxtWYsBLS
         olUhpUI3CMuvpZ2gdVVt1+QHmfIo77yz5XnH7uOii4/CVYb/gkx63uwMSZQrThPi0J1I
         qLeSN8SV8W2gyBS33SGr81f7mNKFawLYP+k943aFMrXzmO2c8omHUScl2Juyl60C9wXW
         wH/g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773315539; x=1773920339; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GeysEM/ELqTsDrw3+mlXIJtxDIECAdKLOzWSex+i9FA=;
        b=Oi8iBU7aszrp5Owcev3EEC+G9uxq5zh5NdvicQwcXS/aqFlE0fbIHEHldQzQ2YRRjR
         jjvsr163SrSWwk9ZkzizQE4SAGKtH33NGkYdtFmjGIWtpwdJYtp2DOQiJULZVGKoBcEd
         JHjgg5wvHV7DZ70d7V1cx3XqBBamypFLIVHI5fwwfCrKIwvf3K0Sp+FO+6ZXtF14tieb
         3RSVUNIRNGuwJWLGNv2Fy6fEgusX2zgkg3hghNY+dDUDhUa5SbyhHEoWvJqg5w9seICA
         rIbRER6yAMUK+KDpijY/PN6a3NOKh17EELbyaSY2mAicIkB34v3nX8QM8Icd67oOQJ9c
         b+Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773315539; x=1773920339;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GeysEM/ELqTsDrw3+mlXIJtxDIECAdKLOzWSex+i9FA=;
        b=FQWpoCsI+I8iwlzi/d0/o+ttvo6Eg5Cdd084Iv7ZRmfYajqpC22eKrgawvLdWX1RYq
         /8fOnEgQDWb/FKjhTEXvdg8C/sUzDRuidIm1zyHX8B+HGGJcq5z6jT6pcokM0qd2uCR1
         1TM+xrwoFHuj26fad1MP+muugawg3ntlc3gVa2gNQf2F2A+X6aHa9e5YZpa+4x/W0omv
         5OEXgB1kNgSOT+g+mQikv/3s7aaASfY0SEHrsVkNmMI9Pb6Uc6oPMldvA9YdrK5jdrQ8
         c3uILPeFMn0auGk95LytqNKMZOFZgHC/FhY+zAYd1sF3v7aUidB3boPIL0eLgysMz+fr
         gaaQ==
X-Gm-Message-State: AOJu0Yx+K/b54mjDEoA2H+E4KArPzLCP/tumgep2mevI7pCaA7NqwipU
	qxMPX7WyQ91wKOoMa+f9lAUaHABqo7WKFJuGIYyzmLKnqfx+YDik02CnbzgW+J52FhhNv8J5fkm
	xEfU6i6WeEyVLOsTR544kU+6EajL9Zdk=
X-Gm-Gg: ATEYQzw/ZS+XKk0Q8/rOdKzvh3HVdpXZVFeiBpdbvuEWI1ZSvTBaiSI4LbF5xv4/UeY
	zauaU2WfyZF68T+IkTGoHKtUO6sxnQXf0FyLaYZtVcS3MOCPJt/6bFfPBREPLQIduOPn808B7oy
	dl+V7G6hWPygG4LNVH1yepQ/zvZYdgGpwa9wqZYQOzcymSPKLmFe0ztW6lmklPc7UgG3iOCxoAV
	TXRL3sPnVnSUGm6GKr5c6qVqagFjXc50KeEgSz9JYh4hbGCZPEFeMrukYk9L+DcgqCYt3WXTF4M
	x8qXcsqa3wwqS/QSQgSZ+dxz0CBhZpgUeQp9sJXWxA==
X-Received: by 2002:ad4:5aa5:0:b0:89a:98:ff1d with SMTP id 6a1803df08f44-89a669e8a60mr78534186d6.20.1773315539237;
 Thu, 12 Mar 2026 04:38:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260312113343.3570819-1-zboszor@gmail.com>
In-Reply-To: <20260312113343.3570819-1-zboszor@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 12 Mar 2026 12:38:46 +0100
X-Gm-Features: AaiRm501T7R9ENjgNSspMzePywoSIaFKYm7BpL9j395sJ5A6J1Il8qEkBRxcjUQ
Message-ID: <CANNYZj8xS5QaWCE8s=0X5W0CLxVGfxx5Czj7D2NheGjh73U0-Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3: Add a new PACKAGECONFIG knob for free threading
To: zboszor@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 11:39:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232941

On Thu, 12 Mar 2026 at 12:33, Zoltan Boszormenyi via
lists.openembedded.org <zboszor=gmail.com@lists.openembedded.org>
wrote:
> +PACKAGECONFIG[freethreading] = "--disable-gil,"

For build determinism, the enabling option is useful too, even if
upstream is not likely to change defaults or introduce some kind of
auto-detection.

Alex

