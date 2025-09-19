Return-Path: <osama.abdelkader@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8D58CAC59A
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 18:32:40 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.3823.1758306755844325976
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Sep 2025 11:32:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YrSLvJ+a;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: osama.abdelkader@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45f2f10502fso16162485e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 11:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758306754; x=1758911554; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ue8jYP4Zii9iscyTSuF9jBz0QigvOX/CS6AIp+eRJUk=;
        b=YrSLvJ+agqGdCsNIP3Q7/dEVphGirvVj5T7WeK8KSrkrrrWgqnqkI5n5pm0KIy9bXV
         4oJLZcZTPlqTTA9cnK5GUsBsME/2YK3k1DqLSrEpl0TbG8STApNHxMiN9fvFP+nX1nK/
         W1WpfD4z2uU6eGR1tqgTsDx9+7lsYhy1e1SVtymzKc57saLShHL3aSVW/ujAUw8SkBo4
         0PSylmM0LgdpKziSm6RpSYd6w86chKm0VNN/gkl//q+ZQUw2TqLkpz36yJJqrtwpfGsu
         g+Se+KPb/47jtSoZc3UBnm2wFz6Th2ZgIgUM84XuBO1KFp+Cj3xkT2s7Gbrn4oEtRtn5
         65hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758306754; x=1758911554;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ue8jYP4Zii9iscyTSuF9jBz0QigvOX/CS6AIp+eRJUk=;
        b=OhZv4qZqh3IDYqV8W8vAA8D1gkDwFKqj0bLh/0pk5j70ccl7/3ot34niWARQ0bZD9+
         LZAb8FFy9r6AASLA7S+g3xM4BjthXZBOOWjJIHCDWixaGB2eVb0BNA6fiBCF1r7rxwjQ
         dOD/506GNyga5fLR1mg8Gyx+ClgunLhdkLy9kQmxnF8wUU3tesXji2OU2CwG9QA89mxw
         XXWUPqeycgPTYXNEj5fdtmOrKHigV6Lp5J6o7WgC8TUwlPX6PE1mliItzcs6J0moB/RN
         IUN28S57bieCoGKadVqAkakcZiiYrUTsgGqyNbQB8lxVKTI9wS9WG0veXDFmN6pD7MHi
         0I3Q==
X-Gm-Message-State: AOJu0YyyM2IZiAosXtzA3vWO77GEQdnKKkNk9pyjgalpqlP9vwvLlhMU
	AgYszYXY/uuJWmXc6FjSTRD4uKcPBeTcaYr7ulrS0HM50Q88L2wbz3CD
X-Gm-Gg: ASbGncvCR65Q1ABs4MDWM95M0XwjwyurZ6RzNgXJjdzhoI7rOS7BmG9hcMP2z0M1dro
	kPKvfFVqRi1OYLGGVyIt/zAI2Gar5ve+TrD1fdQ+kHlIJFf8uXERIJXMQtCCysfgGCTgZMldRoa
	cmnealXklLRVioxK1i3RIyhaBkSM1aZbzwkKDtMIFXwbcIJk/0b152Lk52ol6neOgflnygj5O0q
	qGbi3/WCp8jHqJDpEVk7Ca6xgykftHcw3+9JNolgrZ+fLcps8dUCsXJ5JijPqTpX2WH7eLGRSTl
	eAFI/MEsCNMAlSQP8Rt/qrVCXNEdQGs9NFaA2PQF0IUt/HnBrvQycEK/0uCnplHYbt9X/Q3yiBI
	Yx0KPZrWnUfQ206BpiNSIF7LcJL4YwTGJrbY3pleXV7acQpzJhQkwBvaLwAyXexICl3PdG5B727
	Gm
X-Google-Smtp-Source: AGHT+IFEg21WoxbZmPlpAtAWC0nXt7fgxRgz1Rqick8+hVcDYh0zH2JbKjX8Z1zQxQZ+4693nn8wow==
X-Received: by 2002:a05:6000:2486:b0:3ed:f690:a390 with SMTP id ffacd0b85a97d-3ee8481fdffmr3767115f8f.40.1758306749445;
        Fri, 19 Sep 2025 11:32:29 -0700 (PDT)
Received: from osama ([156.223.20.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45f32085823sm87601475e9.0.2025.09.19.11.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 11:32:29 -0700 (PDT)
Date: Fri, 19 Sep 2025 21:32:26 +0300
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Ross Burton <Ross.Burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3 2/2] go: add sdk test
Message-ID: <aM2huooiCa_LBfpb@osama>
References: <20250914182550.24959-1-osama.abdelkader@gmail.com>
 <20250914182550.24959-2-osama.abdelkader@gmail.com>
 <DD553AF1-287D-4891-9584-F434A80A65BF@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DD553AF1-287D-4891-9584-F434A80A65BF@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 18:32:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223766

On Thu, Sep 18, 2025 at 02:00:01PM +0000, Ross Burton wrote:
> Hi Osama,
> 
> On 14 Sep 2025, at 19:25, Osama Abdelkader via lists.openembedded.org <osama.abdelkader=gmail.com@lists.openembedded.org> wrote:
> > 
> > +class GoHostCompileTest(OESDKTestCase):
> > +    td_vars = ['MACHINE', 'SDK_SYS', 'TARGET_ARCH']
> > +
> > +    # Architecture mapping from Yocto/Poky to Go
> > +    ARCH_MAP = {
> > +        'aarch64': 'arm64',
> > +        'cortexa57': 'arm64',  # ARM Cortex-A57 is ARM64
> > +        'cortexa72': 'arm64',  # ARM Cortex-A72 is ARM64
> > +        'cortexa53': 'arm64',  # ARM Cortex-A53 is ARM64
> > +        'x86_64': 'amd64',
> > +        'i586': '386',
> > +        'i686': '386',
> > +        'mips': 'mips',
> > +        'mipsel': 'mipsle',
> > +        'powerpc64': 'ppc64',
> > +        'powerpc64le': 'ppc64le',
> > +        'riscv64': 'riscv64’,
> 
> We’ve merged these tests, thanks very much.
> 
> However, this mapping is duplicating an existing map that is in meta/lib/oe/go.py.  Can you instead use that directly (import oe.go)  and delete this copy?
> 
> Thanks,
> Ross

Hi Ross,

Thanks for the notice, I'm going to do that yes.

Thanks,
Osama

