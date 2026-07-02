Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA7D9C43458
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 17:12:49 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.74345.1783012363015584845
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2026 10:12:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BORJM5Vy;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8ea70ca4fc8so7806236d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 10:12:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783012362; cv=none;
        d=google.com; s=arc-20260327;
        b=lAyg78nG+NTRIDNy7hRWM6o0D/flSDv/nuGDgDQdcnLxlfvX5dqfI90zPpTZcmerwJ
         Zn66Oc1pCQCpBUWUSBQ3NLAvmmXwnHVIcil6vOILYGHCv63F66PD7fWbBbdA0+U/DlNm
         EBoSjgBIupSki493fvt7gZF6xZcXd5kOAVm++DQCB5iURE+zOn8VmKxf5YFO2QHNlHON
         dCc/W2H9qRB+rzNaI2mGjmUlhpPqrQWvfLheUF6lpS0oDd0J7eQUbCRcEnBl5Yx8FByF
         Eh+5EZDsSuTpYZF9jQXNroGrgrIWGZjU4yjkMsGFjg4+3wqlhRFdewhcnhvP1ORXVW8k
         gN1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GTFQtT45JhYEgqS6Q0t81kZk2s7lc5mcQHRJ1ebYyrY=;
        fh=jalLMzWPjSFYQ8BXTRC3XbuNnPhi7LuTXzN2Y0v25RI=;
        b=nYHXk+zvfy2Vs6pmOhV/44Z+dzzgrfycIjrE9S8WKePHVtMPO25+sgudcYnS8Dj45o
         nWDV3Q43m/sBLMflCnkVExxb29LYG4A5H2kcQpQj1BB9Pa1ZlYsGJ3h+hEUx1xl9IvX3
         RqyZ7bEwBai9H4zua4iHfFoL30im9kev+Nc/GdVV5sr7l/XrL53i8qE+Qg7mSjTn9R8A
         sTq0mS7GVmRoBzJ9I87l2056IioZD0ruwdI6P2RHriLfcmdhIPqasuli/brbQxLfta8o
         bpLLXkvcF1XyIsPlN7Inw1HEtB1WWl68P2AmhobUsflHaLLcaQQvVUaohQRRlqSBBpeW
         /tHA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783012362; x=1783617162; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GTFQtT45JhYEgqS6Q0t81kZk2s7lc5mcQHRJ1ebYyrY=;
        b=BORJM5VyhxA/5nMIa2bLEsEi62G4wJ98liF3A8COlJsUxVbWXGKuYKPR9jZdG8egRj
         fbXlM3CCwSpydOqyYtF1YbtjRDt5BEV9kDmcAIaTkjRdswRK2IiaCBk59sc9MAMVY2oL
         FZC5JK/extFZ7019HRO8GpVw6YuWyqbOoQUeOjQv1sjjEYxz/HuNCLoBLeMU8Aci3t+b
         v9V6HPprbRfY5DcKj/sVSMy3nzcIw9cawYAwm+JS7CMk5t5JfsPEaW8X7EamsdL9sF5Y
         Uobo15ISKqx9jYIqnjUPe6lCObA9Zc8/3nIVTCPL19nXd6wgckyPGUxC3UX0WaisznSS
         4JSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783012362; x=1783617162;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GTFQtT45JhYEgqS6Q0t81kZk2s7lc5mcQHRJ1ebYyrY=;
        b=fyaabif+4KYSK5e/qNkZ42lmgOfpuvA0tDK6qihKl+pH5U6aTa1GUNG+SBL8kicDmp
         wuhmYRCEuCUs68pwSy+/mNj+1FX8cPhGhpkBhX4FvjLG2YQjEuc2LsI/TObIciAqUDeh
         /O/t6lulQ7/yUmqY1MYI+uKphuuwU8bRrvvXm4r34uR5j4DoiJ7U4tnQCaMPWbPu/wpF
         v3l0evXLkpBJVAaviaKB0ap4guf8Ow9Ptog/W++cjGBPT3tMntXUO7Cv+umYEmNiaTw5
         nB2T/WbvAnYNlHNtZLmmvP3WIIDXfsSbgmiuqpSxTXzFAKRdMUIEqhLptfdqEBgScCs6
         cOjQ==
X-Forwarded-Encrypted: i=1; AHgh+RoQodqD5yQmsowp0M1hzFu3DbIh1n/j1dFw5C4EETxDjpsLkqRfo0TXO38EkWMsShkJD2/p5O2QujCBR/ZqD84VVA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwwBithlOUTSYuCRAlntEfzI3UvY4htgjBDPP8i1naDhgATNid1
	hTNH9GNiy+qhDEU/REM4kkAgAzVGOqP7ArvJfnB7jmPdVupV9IUNOPagIOlLlbBjBrzRyQFCZg0
	EkGruq9SBB7QwbUrAp+79fyJCVVMGqtI=
X-Gm-Gg: AfdE7cmBi8pBHasZTg7wc8dEaZfI4YC6fUb847rZIYGeZTfEkZW9SMxg4wg39JKf/3s
	AU3TBZGDqigIfe7H/KX1MQ2rfd0rm6WZRmAHQY85ihCvl/DOkArm0Fi/S+UbnjViwoXboipWFWg
	NdPIf4YQRNIwqSibIjHrMuCksbCiEcrwF+P1DRGN3u91+ekyjMJVLNIgHDV4KmPQQh/kxNDouCg
	jlLuViYp84sm/lsJ3daoIn0eiuzBw1HwnBTxO7w2J8+XIqz+pejvtk+PJT9UbkMc0LcKJxboxm4
	ELds70Dzj6qey1XwnBjan7e07E2f
X-Received: by 2002:a05:6214:20a4:b0:8ef:1c10:65fa with SMTP id
 6a1803df08f44-8f5bc5b45damr12115336d6.8.1783012361821; Thu, 02 Jul 2026
 10:12:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260630115028.4001775-1-daniel.turull@ericsson.com>
 <DJNY5PFZT70X.2O5P68RPD0PJU@bootlin.com> <afbb3cf90ff55c3b4e693b8a28a6903b7f34f946.camel@ericsson.com>
 <DJNZTL96C89O.1S6YFZXO1KCJI@bootlin.com> <CANNYZj-duZWDtw2XP8SYg8gqhEbVDhnATLByJw+kAN2EjY0ZNg@mail.gmail.com>
 <7ad0d4852da4b1f13d6637f1e6e7dc6c674e2731.camel@ericsson.com> <abbb21f83c63fecd56c11da7ba4442094e96ccda.camel@linuxfoundation.org>
In-Reply-To: <abbb21f83c63fecd56c11da7ba4442094e96ccda.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 2 Jul 2026 19:12:29 +0200
X-Gm-Features: AVVi8CeAS7zuy8I6dPgnb87-6stGzNsZ8g9jmvIfFOhai1Ave8OO_mGQUA8NlGU
Message-ID: <CANNYZj8RjYjcdT3yNGKHaS1jxYR9+e7qu_ZXAVwginXBpuiwyA@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] systemd: update to 261 and be compatible with rhel8
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Daniel Turull <daniel.turull@ericsson.com>, 
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>, 
	"qi.chen@windriver.com" <qi.chen@windriver.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Ross.Burton@arm.com" <Ross.Burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 17:12:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240065

On Thu, 2 Jul 2026 at 15:34, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> If we start putting buildtools everywhere, we may as well just stop
> testing on most of the distros :(.
>
> I'm already worried about the implications of buildtools on RHEL9
> derivatives :(.

The reasons for using buildtools are well understood: it's when the
host software (gcc, python) is too old to try to be compatible with.

Debian 11 is almost 5 years old at this point (one year older than
rhel 9) and goes EOL in just eight weeks. It also has a glibc version
that systemd explicitly does not support and fails to build with. I
think this fits the reasons.

Alex

