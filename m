Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70F5AC36008
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 09:23:51 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web10.35246.1742808225510610325
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 02:23:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hG3gSAs+;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6e8fd49b85eso67820086d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 02:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742808224; x=1743413024; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ahrBMtFvz5foaC48qrrGxFyhGciLrVKi3zPuo5ibqvA=;
        b=hG3gSAs+mWfcj9b0EODVv0jCPBGnwEVkI1mntsjTZwukHviQ/l2ochWdJ7jZaG1sR+
         9Z3PFfEwNgqCYUZka6QtKoThHpEwiyoDSQuDTyACTQMJhGaCR7D9GefuDmLB7tYrCxTr
         662qJi2zAqGk6dlb9ACuVRqFpmdxBuHeArN2PeSrlk1SXBVAHpjiSepPLNXJGh4YrQas
         MI6Nkth3eoSeDEmDqYlZLH+6ls9/DJ+ocxlFf7q233QxzQlek3RxSJbbEw37uXvQXrF9
         TS9QX5bwZsM8uhXBlS8gUIDunWg4XCXCbSHyEwYPprbwCfMMmWHrZPPCvQGHwguZeoy/
         Eabw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742808224; x=1743413024;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ahrBMtFvz5foaC48qrrGxFyhGciLrVKi3zPuo5ibqvA=;
        b=AXS+ZKV2FNFtaaRHryOaSqjx2jf4cjkvuJ2SPT2bTV7dMd/nTkShahFIiItv6GuuMo
         ePwKh3nv7pFt0nmm3Sv0fuljtOvv/pau6XznPvqG3hs+ZjqsfhDHZ2Oux7u55ZcwD2TG
         cxt8wvYR4NOzeNbSgxzgsLeqs9cD8SBn5l9uJwtRP5SohsP8uqDCIMytj/i5QkaZixut
         u1X8/JqAMi0aczhPTCTAEFC4+sgPZ3eZk3XnLpNV85YdxiHquEG/TU86S14JJWrqyPQe
         FFPoRWf91zHD1J8yx9HVVl8l2psXmFFrpBKk3QGePEfYjOuOAL5i6ocpn6jbXQPxsW8/
         Ci/Q==
X-Gm-Message-State: AOJu0YxINcZ96OvXMEQ7IY4IAs2JNNzpoWrRO4o+KM0WWcFFrOCT8jo9
	2kg6b47RRpOGLKBNmNoqrLSrpMNheefJ+e7Sz9c2Vq8YQaHdsPOuHV9rKCjGd3GF3bGvuDlFqMy
	deXGVVxDxYO3tVjpOf80RJTdGC9D1/Q==
X-Gm-Gg: ASbGncukJTrUdwHMiv08p9RmZPcVqB3f9pXU8hM10RIBWkwjPAjnvmI3tHfmPOlc6OQ
	HEEH8FcIFuP+9i/toNkYvUnMWjAQVwo6p4Tpur0aIobsz6UZKelWdc2HsNu1yEk/tIVg+LPBevo
	f7GoUcvQsLs/D0pewaYkwqUeydlqKM6cl9AfTBk+GhoaI2YccPZmIdHYma4mkJ
X-Google-Smtp-Source: AGHT+IHCWDBQ8xidFSOFgY0x/LIXqN1naKVd1v9H3VwpsZ+qkKMrwAm6264CdIVGoPKXNQd1nM7zrLqHnNWkadrWiW8=
X-Received: by 2002:a05:6214:21ee:b0:6ea:d090:6365 with SMTP id
 6a1803df08f44-6eb3f36c309mr179000966d6.32.1742808224315; Mon, 24 Mar 2025
 02:23:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250321132502.2607941-1-Deepesh.Varatharajan@windriver.com> <20250321132502.2607941-2-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20250321132502.2607941-2-Deepesh.Varatharajan@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 24 Mar 2025 10:23:33 +0100
X-Gm-Features: AQ5f1JrAci_yKLNF0-eli97lOuY_jcCd1moZ_R9iFg1B7NlmfGJBnZtaUpoRWLo
Message-ID: <CANNYZj_5kjhg3WPi7E-UxYX2yFXw-KFpR0gdExet79uG-Xin_A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/5] rust: Fix build failure when multilibs are enabled
To: deepesh.varatharajan@windriver.com
Cc: openembedded-core@lists.openembedded.org, 
	Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 09:23:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213520

On Fri, 21 Mar 2025 at 14:25, Varatharajan, Deepesh via
lists.openembedded.org
<deepesh.varatharajan=windriver.com@lists.openembedded.org> wrote:
>
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> When multilibs are enabled, rustc could not find dynamic libraries in the
> lib64 directory due to the bootstrapping process searching in the lib
> directory. This commit exports both lib and lib64 paths to ensure
> correct library detection.

What is creating and populating this lib64 directory then, and how
does it decide that it should be named 'lib64'? Shouldn't either that,
or the code that looks in 'lib' be fixed so they match each other?

This looks like an incomplete fix, as it does not get to the bottom of
the mismatch problem.

Alex

