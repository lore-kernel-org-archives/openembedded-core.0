Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C2B4CD98E2
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 17:15:59 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.331.1781716558867881566
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 10:15:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Kan1bkuM;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8dc09919aa2so15296326d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 10:15:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781716558; cv=none;
        d=google.com; s=arc-20240605;
        b=OhqkpHejIpM2fZuBmWPb+xmg8cvdkwJrqMHw5oQNECj38kOrhNbN4IOtUqPZXfObV1
         Uc10h/T+BfDvANEcThEzKiksufGbcbxBZy6LMVcVGm+C+2tFNVbr+kX3f0sPgVu9F2H+
         jH020skF3ZyqnK+aHDAE5MOvpRZTOpFF7dykyixYGDph43bCtwSogxf03PvecMwEEHVZ
         ljZZfbdjevSJWZSTOapg719l9pEhyi2hjgcB8FqFdzPwHBrghzWhRwwHF2ni3ulTJPPt
         8RpoWHKfZtw5UMkCxJIpgN+BYtKMzRRzujFDzgjDPKr02rlZQ05vbExyK7zE0dlRpeQ2
         6ZHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=n7ObmWOPxlPGbTfphdbbFpeSQ7q7FzQZ/osWRB31ZAA=;
        fh=fDq0W2i3w4UCs3XAS96L/mrnY0ELhh/lsJwqL51845Y=;
        b=HuByBYUaY2fYldMVYh2NkZviMLG8a85scL/L4VuXi+cheQ+J1E+bGNJWOq/cTMG3Vk
         u+F3w3ob/xcns542bkhPx/EHnSSErEPeZuGwYReVx6WEkNdDEc96VZ8tVPS2qZo/2zlb
         x0kdWGit95OMoGF1NXt4AEQjUXKDGJY3Kmg/DL0HVKALLqtdZVPiOE6QKT/zRu/6X9De
         ghVNgx8hsiT9jbLnz4CifhG9lAdqkqNyh0dKszS2byK2sSgUjcHY52uwmbl8DOLy5vdt
         zRRaWjHeVUaL2ABT45MkuJJcSvoaTaelL0U7c/LTASS8O1S5qO2oMYZfwqJ1fyTxNjzU
         tnVw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781716558; x=1782321358; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n7ObmWOPxlPGbTfphdbbFpeSQ7q7FzQZ/osWRB31ZAA=;
        b=Kan1bkuMx1onS/Kl5WuKRiqA5ZH5kv/s/uiw14TLI9zb7MzaLm2XjEBYt2jWyrZVg7
         C+BsJsOFb2JtM/69gTjkRqo8oQj6SWcMZBzHgh9KfOSH35nCa/F1VgoNRwTmdTe+FQim
         U9BJqwbDWpblsdhSHGrPU2NhNcrbHPq+dizAydJeC25yUK7bewFtV8fsAddiARVVfomg
         VHM1ZFUsjGFmTBgZbWp+BdAlY8uJo/Z7flAJ4F1mxa4oN+Kd35JHxP+jrSzYURWA2tnT
         YnynI1I3etRYJTkH7cZpFqQAFoveecj/HnwmfKTTUjZzPenJlZ8dhiX0J0iA1ZEY/doA
         vmkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781716558; x=1782321358;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n7ObmWOPxlPGbTfphdbbFpeSQ7q7FzQZ/osWRB31ZAA=;
        b=XfKXITNyhmtm3DuxvxhbME6dmBAsuFpmJUL8LoNbVM0J5fygJr9rzP9nZHY7kCQNn+
         q4ZRAik7wTwFAFEWu2s2CIhI/GYIsDqmqnCOPX6nsMa/Kg60K/sVZwF+zzEC6xYVkUNC
         t206XmhTsaINwAibXEOVpCrBtMW13QKoi9cGCVH5G5lBLDfYc9Bmzphpf3RSx9DgmT3E
         BHfOPfPEGpgRKZbZpP94NgIB9F5mkiwwWVcuorGAq7hI4qSWM5zHZrXYIOUfTizI1wfH
         JHW5niL+s+mmRLa1oXvR+8/9TN/etcSUIDzccRwjRa+7bR+LXuEup+DMRcUaSAy5LKT9
         +3MA==
X-Gm-Message-State: AOJu0Yw2dYApHkcCItbwVW6fd1meqeuFwKkB9zNgcx0JYf0mjmmb8OEY
	mRlwvvHZ6/4nZmYsxz0FaCgvUfZf43oUpfgemUv65SQ0KqRAjWM/1PgUagmzjS8+o0AOq0y+OAp
	Pe5y+Cv3rC7C87+dGKn11GSVraULN+5s=
X-Gm-Gg: AfdE7ck7Nl6h0ttWPtrkyRWHUcQd6OyCXilPHi/sx+/8t4YmOCTe4pHWdNxJDPlwoCc
	y9nvPVqG8W+FbeVI34s5bDZbLP8hMo6QfTnwJhzSnNiDWwP5xr96U3ltKXvmDzaL49G6IfhIYfO
	VjQabMsUffJJMJonk0XC9p9T62y0ymmhKLpiR7MdGT81fq5KaMjNjwa9AjJF3GlNF5R7/6aEPfW
	uqRKkEaahAkpodxBFSCwV+DjvfYrsoUO+K1OeL10sHiMUmHBPCpc68DMBDz+1KZEfnKwFViF73W
	0jHgqvwmHysEc/7s7lDEujcHt4bL9QA=
X-Received: by 2002:ad4:5146:0:b0:8cc:ccb:48d8 with SMTP id
 6a1803df08f44-8dce1a54881mr372956d6.33.1781716552935; Wed, 17 Jun 2026
 10:15:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260616191628.2014553-1-alex.kanavin@gmail.com>
 <20260616191628.2014553-2-alex.kanavin@gmail.com> <DJBHMQ37OJNP.MM0EK1L3DGP2@bootlin.com>
In-Reply-To: <DJBHMQ37OJNP.MM0EK1L3DGP2@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 17 Jun 2026 19:15:41 +0200
X-Gm-Features: AVVi8Cfl4JFptCXGdzxQ8WwFxgmgPQAZESOewnSXAm-8R7F_f1gNFGTX18Kb7NI
Message-ID: <CANNYZj8QiMOGOq7GVe-4Nij3cakYM336NcE0N4TaktA6+mxkpw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 02/30] gstreamer1.0: upgrade 1.28.2 -> 1.28.4
 (the remaining pieces)
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 17:15:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239040

On Wed, 17 Jun 2026 at 19:07, Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
> So what about the beaglebone issue you mentioned? So far I confirm the
> error is present:
>
> ERROR: gstreamer1.0-plugins-base-1.28.4-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/beaglebone-alt/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/gstreamer1.0-plugins-base/1.28.4/temp/run.do_compile.378675' failed with exit code 1
> ...
> | Assembler messages:
> | {standard input}:774: Error: unexpected character `w' in type specifier
> | {standard input}:774: Error: bad instruction `add.w r8,r8,ip'
> | {standard input}:776: Error: unexpected character `w' in type specifier
> | {standard input}:776: Error: bad instruction `add.w r8,r8,ip'
> | {standard input}:778: Error: unexpected character `w' in type specifier
> | {standard input}:778: Error: bad instruction `add.w r8,r8,ip'
> | {standard input}:891: Error: unexpected character `w' in type specifier
> | {standard input}:891: Error: bad instruction `add.w r8,r8,ip'
> | {standard input}:893: Error: unexpected character `w' in type specifier
> | {standard input}:893: Error: bad instruction `add.w r8,r8,ip'
> | {standard input}:895: Error: unexpected character `w' in type specifier
> | {standard input}:895: Error: bad instruction `add.w r8,r8,ip'
> ...
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/10/builds/3938

That needs to be addressed in meta-yocto, and I sent a patch for it to
the poky mailing list at about same time as this patchset.

Alex

