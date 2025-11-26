Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 533ECD11184
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 16:14:17 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16725.1764173651575827649
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Nov 2025 08:14:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UsggZL89;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-88267973e5cso44181236d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 08:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764173650; x=1764778450; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DkTDRGdIVMCwt7gOALdgJa8uLpc8FWwdZhB4SA6SQ6U=;
        b=UsggZL89VCvhG5ZetvVnmNNwpc8Tx+CR60QnAdniSBNjOMR0Dk+WQo/Mc/F3cu0vIy
         6M0OriRSW+cxyljeDo9vGK/Vt5f2P7rdi1F94JKdKUggvJoJmltSmYxFAWq6tgzIdwds
         1w4PSBCMX2cDvGPuwO9CVyHNKM9Tap/kOFwGZDjBosPz8ZiVrybnyVeuK6HExHnHe1xN
         44t0Vy0Nxes9wdtr5+Ux12Ur1Kajtk4kkfGR6Ua9O+236b6fz1FaDGM9e4hFXoTOCSER
         bYKm7BrFZzUcGNMo4yaq/pexXmADghYG8r66/SOKtzrKWhAXrGnofyfr9mg5DZjOay4e
         Lvyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764173650; x=1764778450;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DkTDRGdIVMCwt7gOALdgJa8uLpc8FWwdZhB4SA6SQ6U=;
        b=amz6e2c/3MWICZbnfW2CNfKa33iPBZLqjipFTFfrZXEV/C8cbR/6RXPijYbz0SeUsU
         Ekt9iMyD/1TAAG7GY8DG0iKc33nrTfJcz+IjmyjOIk9xPHFoZNyANjp/UjrajqaCl/YT
         I/LdOXEeFwutVRt//+nwRC7JHsnHGl0j9rnts+TlHCBwrhZguQpBgOSjsvi1hnjnCz4D
         SyV0dLI7sM6fvioDt0c2EsPwM1iituPMQmmxTno9GulC8STOU8L+bHxCBcXjsJTGDj1K
         9WaMVI74zyk9O4xgx5PSbJOWVfpvx5ciRkuzNfMfEusjJCpcHRetsO8z3Yrz6UgJLxke
         S+Gg==
X-Gm-Message-State: AOJu0YwsNqUTKtsYelA3OgpE09hTpKK/vDpyAC4zSZeJ3/jrcJGSaDKW
	hd3AODjww4NHJnLe4ezo/ra0WdXeVttDs8s8Ol0yh0dA4vyt/z0lHW57TQdG9E7BHy+tfjXbfVG
	JZiZAZg0xhu0CIvEtz1wtTDHk43hMxbE=
X-Gm-Gg: ASbGncvDh66dMdu5BNDzaR1zr3gzBM1/WxMnlYQgrVAA37l/Ri61w84r/rn5g9HHK5t
	/pLkbPnAPbKIMP2uPoGQowgXytiXvtUbv2AUNYc7LQzVC5tkw8f0keQzpBt8fLNA33ddwY+n6sM
	iCPG19OzYp3fetJS/GRQB8KTyqD4m86/bnDeqxY7Cvh1InlAp9Jl55oOPbMznfPHbN3MVsOZR5q
	LuImSNFmj7yS8SQ5WI7nsZKl61P2H1uTkC5bNoF/ktH22TMYU4qCoIUCQzRw2P3/ZSbeBCgnBRa
	pGuWhKkV/oCFTFmlciWpaPJAnUgD64fSbg==
X-Google-Smtp-Source: AGHT+IHBYHrD/DUwAp5zD5bKz8E0DLnjm2VTd7vxXXahgnry+reHLgyeAg2l1DIJOdhvC+Y8gZtevWwItC+YNMsrmfk=
X-Received: by 2002:a05:6214:3d07:b0:70f:5a6d:a253 with SMTP id
 6a1803df08f44-8863aff288bmr110146776d6.49.1764173650507; Wed, 26 Nov 2025
 08:14:10 -0800 (PST)
MIME-Version: 1.0
References: <CAK5yBb8SJ79GDs5aGpz0MGuNNdKf26Z7nw81yNtAsUr9VNq01A@mail.gmail.com>
 <187B446507D0D6B0.100836@lists.yoctoproject.org>
In-Reply-To: <187B446507D0D6B0.100836@lists.yoctoproject.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 26 Nov 2025 17:13:59 +0100
X-Gm-Features: AWmQ_blYWL_7VbxdOBr2YnDAlrD_G3MBd2TlspvR6i_ZQpvZD6nZXneu5fvhELA
Message-ID: <CANNYZj_QRWSTZMne1B0PO8rdo19Ltb=QqQGVmSRk7ZpnaY2MAQ@mail.gmail.com>
Subject: sharing sstate in bitbake-setup
To: Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Cc: ",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Joshua Watt <jpewhacker@gmail.com>, Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 16:14:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226804

On Tue, 25 Nov 2025 at 14:54, Alexander Kanavin via
lists.yoctoproject.org <alex.kanavin=gmail.com@lists.yoctoproject.org>
wrote:
> BB_HASHSERVE_SHARED_DB = "/path/to/common/hashserv.db"
>
> bitbake-setup would put this (and SSTATE_DIR) into site.conf that is
> symlinked into every build.

I quickly hacked bitbake's cooker.py to try this out:

-                dbfile = (self.data.getVar("PERSISTENT_DIR") or
self.data.getVar("CACHE")) + "/hashserv.db"
+                dbfile = "/home/alex" + "/hashserv.db"


And then made two build directories with shared SSTATE_DIR.

TL;DR: everything ran smoothly and as expected.

I ran overlapping builds, added no-ops to gnu-config recipe to 'force'
hash equivalency, and there were no errors or crashes, and sstate was
reused as expected.

So I think we should do it like this, subject to 'shared-sstate'
setting in bitbake-setup, on by default.

Alex

