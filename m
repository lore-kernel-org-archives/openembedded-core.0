Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 358C9C36008
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 07:30:01 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.33654.1742801393727864129
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 00:29:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=HVjUFU74;
 spf=pass (domain: linaro.org, ip: 209.85.167.49, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-549967c72bcso4770140e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 00:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742801392; x=1743406192; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dPShzpoxIDSBJmReUZiXgSaooLes07R0abkPXaZO11A=;
        b=HVjUFU74xwOPaqBDUqPrHsG6brQu2rOfqp2uTNA4UvfWVP14eqSTNg69x7swoHuVPC
         Yxn9lppOOM1Ef55zBSsErOoCZnGHPcOWfuct3Ay4Eu0TD6g9Iz5JHghh50wkXZOiMRbF
         JiLgyB3yF/Q26MkMK4LHAj5oB/8dt5RdiB3iUx/EM79AeIzEVF8cYbcg7biLlgKIBSX9
         Mvd7fF6LVte3nwnn/s9t93AZ2JZ9qmQOr3CX1Ri1/dCNf+R1J9tnLbZR2MbMWJvPR7OG
         JNePykW4+7oZ18ik5IeO4FUjaK+bmwDvYZRAjv1KW+5rSSN/AepRqxBqaXCjDRpNuYPX
         ZmJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742801392; x=1743406192;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dPShzpoxIDSBJmReUZiXgSaooLes07R0abkPXaZO11A=;
        b=izncbWWdUST6+DS5nweCw9jZLKj3yakD/yLkXomKc7/kELWObtor+SIT3r8WnnxLUl
         fAjT+mwEV6QUrqUog+DK7DZzZ2hkxeoBNvVuEjsb01PNTRBUzJ1AU8Qi5mEH+dxU7xtK
         YuNAqBagoBsAvkZC1MGvWOmRQeaXFuyLLsZZEtmDY9kOPf65jg2JOFNaUqUZXidVy0B7
         7DrfZT4alxr8LvqgdCyHg8neQan4ceRjkd1KJqt6SBRRwryZcl0MZISOwl/Gip1pkYtw
         3VxwvwnmUfFp1fBmmrH1INqu/LF7p5aduolA8uQRhp8dyWCBJAN7dV9yfFsFmtVCbzVS
         qyZQ==
X-Gm-Message-State: AOJu0YyVpClEdE/6Zlf4n9TQsmegnfUOX0OvryI/Mu6DL1ur2M2URheT
	OSZp+eqP0YSYNXGd+2avJ71xzMRE26PcOS19CweyTgvVQX62I1lgJE9eLFC7ZrD3RjOH9yDNpLI
	wQ8U=
X-Gm-Gg: ASbGncvtPQ/81gNySlUlJqOm1tHSkAa6JQ9U5y5kWtCUVjY3U1NxeU/ajdEf7syC0rm
	8GENbiJDmlzjbdvJjX3ZRzYysMeht9ZAy7jtMLd6D5+r/7OKQWQdoq9mUtrTXUwf146zMgqpEr/
	5k1THWrygGjEYFAAbcqItZNASQMjTqO1bAGgwwLGhqetMgLyPHbdKThBnZWcd764Dv/iUFzECEM
	15Pm94RuLp2rFAzwVqcYOebSNvH+zIfW4OKSh7A7sAXyCPargJnP2Z+drRPmA2R9Gdn+KnOrQfV
	XHuxZ1WLoHb/EZhYL8PhWU4ynWeVaUW5hZhUmbh5RAl3cTQlLXHsz2sd0sU2hKdsMfizZnk5StK
	ga9sZLRFhGbtA
X-Google-Smtp-Source: AGHT+IED0BRpBGyZy/aH3Hw/rwr7DrUFvvNmQWOutjEoUcU3UAox2iLyZJ9IDAdiVRWpEPwduOUyJQ==
X-Received: by 2002:a05:6512:b94:b0:545:154:52b0 with SMTP id 2adb3069b0e04-54ad648055amr3909588e87.22.1742801391760;
        Mon, 24 Mar 2025 00:29:51 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d800897sm12655181fa.61.2025.03.24.00.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 00:29:50 -0700 (PDT)
Date: Mon, 24 Mar 2025 09:29:48 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2 01/11] systemd: enable efi support if in
 MACHINE_FEATURES too
Message-ID: <Z-EJ7EqalYachfbb@nuoska>
References: <20250321132517.670372-1-mikko.rapeli@linaro.org>
 <20250321132517.670372-2-mikko.rapeli@linaro.org>
 <d0f4460cc8338769479b0efdfbf4ed68b491fae1.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d0f4460cc8338769479b0efdfbf4ed68b491fae1.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 07:30:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213511

Hi,

On Sun, Mar 23, 2025 at 10:53:59AM +0000, Richard Purdie wrote:
> On Fri, 2025-03-21 at 15:25 +0200, Mikko Rapeli via lists.openembedded.org wrote:
> > For example genericarm64 enables "efi" in MACHINE_FEATURES
> > and in u-boot. Boot without "efi" in systemd works with
> > EFI protocols but for example efivars is not mounted at
> > all so various checks fail in userspace. Fix these by
> > enabling "efi" support if it's in MACHINE_FEATURES.
> > Fixes efivars mount to /sys/firmware/efi/efivars etc.
> > 
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> > �meta/recipes-core/systemd/systemd_257.3.bb | 1 +
> > �1 file changed, 1 insertion(+)
> > 
> > diff --git a/meta/recipes-core/systemd/systemd_257.3.bb b/meta/recipes-core/systemd/systemd_257.3.bb
> > index 64fb8fe69a..9bc4532021 100644
> > --- a/meta/recipes-core/systemd/systemd_257.3.bb
> > +++ b/meta/recipes-core/systemd/systemd_257.3.bb
> > @@ -69,6 +69,7 @@ PAM_PLUGINS = " \
> > �
> > �PACKAGECONFIG ??= " \
> > ���� ${@bb.utils.filter('DISTRO_FEATURES', 'acl audit apparmor efi ldconfig pam pni-names selinux smack polkit seccomp', d)} \
> > +��� ${@bb.utils.filter('MACHINE_FEATURES', 'efi', d)} \
> > ���� ${@bb.utils.contains('DISTRO_FEATURES', 'minidebuginfo', 'coredump elfutils', '', d)} \
> > ���� ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', d)} \
> > ���� ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
> 
> This makes the systemd recipe machine specific which isn't currently the case.

Can we enable "efi" in DISTRO_FEATURES by default?

That would solve the issue without checking MACHINE_FEATURES in systemd recipe.

Cheers,

-Mikko

