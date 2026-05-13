Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F6A2CD4F21
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 13:06:51 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2468.1778659389131456723
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 01:03:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MaY9QzcZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: ernestvanhoecke@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48e8132c6d0so27176125e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 01:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778659387; x=1779264187; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZyXaxz7cr8KMuEbik8Q80RyvYc4Bz0kt1/gIzfGqpAM=;
        b=MaY9QzcZ+YYOJ3pR3SrCtYxtrqOLwbV0z90cUMVO9qgvYA+QPVSoMQjUI7MtCc8FUU
         C7odm39woeHA7bZW7oNRrsfogXQWgS1tNB0mPrNgFLsOBDabo17+UgqPyn+TSpT6rd33
         9Csmzx1ErCkAoR0XCkd5yMfNyg3KWJN/TmnQ6FqMJ7oDs1fd/v/Hk8ntUQB6fC9nbm1j
         R5W2d9sM0JrPkY4LXLLu0qkPhKzI6/kiIg4nDsXSsD1+1GQxxa/BYQMTqeoLTQ4e4LD+
         MkWfCl5tOvKr3uEXbGUWFsbPH9SBFnHI5RDZClwomvrckTHBGd87bZZh9/+1xGI3nynT
         KEFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778659387; x=1779264187;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZyXaxz7cr8KMuEbik8Q80RyvYc4Bz0kt1/gIzfGqpAM=;
        b=TBpPEdt7mEXK6yVw+6DNp95qY0wsFuvtrxYoC0mCo6rVUFMlB3yQMdsAYKKGDVECuw
         /qM7sUd0oAkEIttFtyHAU6uDcN97M8XVuvsGMwfUzTwpx0lOcndVbDYe38O4Xk787o6/
         mQiRGqlCUkGAJVsi+3+dhNhAEeBlr2FR6NYFkODd0kXWlx+UuZbiTe3ZGxbq+5gYEFWI
         I6BiPeIQHxt6hoPnUmDCrCXDsh+LxXZQ/Uj+XkFrbAO8euTLJDlFrDCXLU6ySnWkbjqj
         kGVQEhR+CI2C6vdX9IMsGu6x3l4dmN9EYxpMtycDYWzKaR/uFXKNSyiVHU+QbDd2xlHY
         lyDQ==
X-Forwarded-Encrypted: i=1; AFNElJ/OLO4tLFmaS+3jzCxTv4VSmT6xEjE48kqmkc1luwKjL6iv8JRx+rkX7+CG7Ci04OmCTWT0hCYk5mvb+2rBIOIlsA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwK39yhkSUMzL/kqsb9EyG+9OWiaQqIo3TF0GGvjHQYI0tIH59U
	sKVFGrDN3DCrTE0hNgsDEdMG8yn7AI2gqlv//eZpFS43046UGjf+pNqH
X-Gm-Gg: Acq92OEpeG6fCoS5cQK69BGZY8RPln9nEgAvfHKoQvYWbGwyfxDiB3QNC/TwrauOiEY
	sEYYL9xJzqRhYwhMqRMfwZku+cSPLjBfDub0ZSXGb/d1KIsQmAeh9jtx4R8hByzfkGAQpaS/D0I
	xpMBuvNcH86R742v114nBnW1YodBzF6sJomc/MxVL5hP/QhjDnQ24F13injHkaqwJhBAHai29Lq
	HB+hw8W4Z1GmFw+3m7vBhSF/YSx/lOnJJ9SVe372l9JDcE17RMDsdhvmlq228Fak9NXJzwYuQe1
	zOUoME/W5sfRSyFB/FgHR2yRTcJKBvSqe2/88e495FAZIezQNFc16+SIy+CNRs9PII4CVmGLvsJ
	s6nTGTOpwIdwjfB3QKn2V13rkAL36kgq5f46TWkIJpTGg0kxkwRrHkI7cTD86Etqk5UlK/sqoiK
	3POd0x20bulbFPMwnZUoGRPN31UyMafLfHmUbP3b3lHAj6SqnKo/htaWBNpw+lO6CaPvCChKWZ2
	y8aRHHmLdQoEfXRyeR3NC256M0=
X-Received: by 2002:a05:600c:1547:b0:48e:8499:4bd7 with SMTP id 5b1f17b1804b1-48fce9eb099mr22189585e9.17.1778659387174;
        Wed, 13 May 2026 01:03:07 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8d69d0bsm45085535e9.13.2026.05.13.01.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 01:03:06 -0700 (PDT)
Date: Wed, 13 May 2026 10:03:04 +0200
From: "Ernest Van Hoecke" <ernestvanhoecke@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
	Peter Marko <peter.marko@siemens.com>, Zeming LIU <zeming.liu@windriver.com>, 
	openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] jsoncpp: Fix C++11 ABI breakage when compiled with C++17
Message-ID: <4cuhef6vftli2pf6xqtz36dbtw7y23ok2pkbi6xyjl6tkj2e34@nyrw6ab3wf63>
References: <20260501160902.1164934-1-ernestvanhoecke@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260501160902.1164934-1-ernestvanhoecke@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 13:06:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236975

On Fri, May 01, 2026 at 06:08:59PM +0200, Ernest Van Hoecke wrote:
> From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> 
> When jsoncpp is built with C++17, 1.9.7 drops several legacy overloads
> that C++11 consumers can still link against.
> 
> Backport the upstream fix to restore compatibility.
> 
> Fixes errors such as:
> |  undefined reference to `Json::Value::operator[](char const*)'
> 
> Patch can be dropped when we move to 1.9.8.
> 

Hi all,

Any updates on the state of this patch? I believe it's still relevant.

Thanks!

Kind regards,
Ernest
 

