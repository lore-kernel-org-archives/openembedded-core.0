Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35283CD13CF
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 12:07:08 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15757.1762862823169272113
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Nov 2025 04:07:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=au4lJXG4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42b387483bbso1751575f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 04:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1762862821; x=1763467621; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0BVKGzw/LDiEaovTI3j652hHCNXE07/m2bBwjBLjUlQ=;
        b=au4lJXG44uj28TR8FOUuxO29PEQu1g8b4NTEyiz7HgPKa7hb+MZ9BWdz2mJplCDW4N
         E4uwh5T5EOmOA8xQjFt92cJnDF6fIEc3nCl+/BIAR8k82I4AObx9V7c3bILL++Putzjz
         GfijgED5yujxorAgn2T6LcDCAvdHdoLcxJcNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762862821; x=1763467621;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0BVKGzw/LDiEaovTI3j652hHCNXE07/m2bBwjBLjUlQ=;
        b=WlOuC17hmiZJG41kF0kqTeSXd/5Et9XVYIc8tATOYJVCMe5udSVg9id4x5sLY1tFQ1
         GqQo/cnxtiGQdYYK43RLnt6ugse5IVFlIqduiXJBbKGtsR4qvj4UsFsAfRofau+MA664
         xf/8Cm/6EuDjcI6ppagwfodfMPeXwdda2wZcb7u2cwbsoI8aXrhJoGGVHO3qU0yiMcG5
         qDLPOMFvDuSE9m6xy0ebny7MDVffUDEWsLUadHHclAqNmtKiTEp6zxWJQyn9yw2fpwxk
         ZzkFuL2gQrROWGbbQSsTJ6ZFtzLvx7eC6b8TivKn0H8+DwOcY/XlxoTPIHnpvXcSEYeF
         bGUw==
X-Forwarded-Encrypted: i=1; AJvYcCWr4WAP5AYQsVLgWsjgG/cW/aCGwcQeVoRgrlmHom9OCBti/ZSPMBLvJSUE3tj6q2b+mmyJHNWQjVfnpUcNHYKFQQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzcxCzki4q1ewIf4Mz9uwnwQw1dSNpqSpkgqKhnSDHaF1iFxFU2
	7gU8lPex0dbNYYFc6nlSUIcTwOnRrPhY8XsKAu6rNzUVDXMXm94LOJOgTuPR855dCTk=
X-Gm-Gg: ASbGncurgoyS4p4QRj4dtYJPQ77DFQTToWzD25Y/7diAfGC5/PUhWQzZXXBUqy7K1aE
	HIZ4RokEP7HuUyugma4gBRaXVjRuRG71a2g2Kd1nyM3xGBHswlJzGMpnS90Ry7JJ/yFx93U4icR
	RIfw/jJIv2CYy+vTKJZczLwgFw+vzFTdiBfGMnIm7uPOrErWSct2BSngi0hkog48D/7dwSxrrem
	SjfJjxx2Y6GaTGE5OhAKt6LX4OIkVmTFsdpoU9vYi2dxFHIIrfa2qiGfqJq+/xV1hWA77aulFgw
	r9Xolv8YvONxx3J0sB1DQORUdsyfbEsAylv4k+b3LyiIx6bL4QxzSMYn7FKgu8UiuaEHG+wNPOZ
	61CwEggXBEJ/euLos0z8XYLCh0vnV5UsOImKnG2i8qYgPMBC+MZ0qRnDJU4zKMx9x+owG0UGXYZ
	v4TT9Ix7sO0ggl/lI5SgNtsgdtaARvbXQMuu3CyDTskQC68swfToxOYX351d02Hb0b
X-Google-Smtp-Source: AGHT+IGsEVERFiybIiT5yVOh1nl9sD5fSc8GFaP+A9tCEgqkScC3IoxnOf8wRX6iT6T6A7VDXFTV/A==
X-Received: by 2002:a5d:5f83:0:b0:429:b5a8:5c65 with SMTP id ffacd0b85a97d-42b2dc825famr9181320f8f.30.1762862821328;
        Tue, 11 Nov 2025 04:07:01 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:e5b4:de25:c1b8:e4ca? ([2001:8b0:aba:5f3c:e5b4:de25:c1b8:e4ca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac679c5dcsm31373678f8f.44.2025.11.11.04.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 04:07:00 -0800 (PST)
Message-ID: <29595a8ed6b004a981a82b14abf8e60592b14777.camel@linuxfoundation.org>
Subject: YP 5.3 Release readiness - not there yet
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-architecture
	 <openembedded-architecture@lists.openembedded.org>, openembedded-core
	 <openembedded-core@lists.openembedded.org>, bitbake-devel
	 <bitbake-devel@lists.openembedded.org>
Date: Tue, 11 Nov 2025 12:06:59 +0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 12:07:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226160

Having gone through trying to use bitbake-setup again, I'm sad to say
that this isn't ready yet.

The basic structure is there and is good but it has significant rough
edges that cause usability problems and putting this in front of new or
existing users is going to do the project reputation harm.

I don't mind rough edges, but not when they're at the level they're
currently at.

I appreciate saying this instantly puts the pressure on me to say
why/where it has issues and how to fix them. I will try and provide
some thoughts on that but I am pretty burnt out at this point and not
at my best. It is frustrating that I'm the one having to say this and
that in saying it, I just make things worse for myself but it is what
needs to be done.

I had hoped more eyes, working through the docs and so on would let us
get through this but as yet, that hasn't happened. I don't think we can
release until we're in a better state.

Sorry,

Richard




