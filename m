Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web10.538.1594415800541607648
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2020 14:16:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=V82561/n;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id l17so7486438wmj.0
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2020 14:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=ZU0tQzeJGJP1Ccpp1S9LG/95QOKf2weDmwLmWda0MBc=;
        b=V82561/n03keNQeZjf3rIfZUIOao/x3GnSQqjQc4MrQKAk0mPWxlTBNgIGvqU69nwn
         wNtklGnQM3FSBJcIs7qwlHUtCvOLoiUnLa8J3UJ8slNhnkCMBOt+Q6VeEYnZflOgm0lf
         n0XKjcPU0ixGxZ3VmH1xlkRuMB78Z/X73UE/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ZU0tQzeJGJP1Ccpp1S9LG/95QOKf2weDmwLmWda0MBc=;
        b=XsVnkEKbANxVDfResMk6u/NFbT1uLjGemp/AOF+MIvxFDh3LHzTdRjGpTYQrVmHy50
         fP54AS/Qk4W/Bvw9tWtxyRqv3nvhj1sDJuhay4I0RyFEL6uG0R1acVPjih93cn9M71tg
         4KYljWR7XGknInp1mxk8GQft0+FOLd+VKkiixs3udXOU8GOv45gPlu3CXxJH/AmL8eBj
         nNMxqYOyN9JZBRCUrxCQuf9+WNyLQY9wXaZYEsZYKZwTJb8c77FeOHq2fg6kDUUR8qK2
         J7EQqmnIIJUTVWdwDuRICaCO6ej23c/Jdq3UpZ65ScDsu28B/32mb7Nh6Fto0sLpqOcC
         yjlg==
X-Gm-Message-State: AOAM533qT3B5SDn6HkNMmkEGUKsIzdt0C0mXaU6nZtiIDSyy6SKKpc1o
	flPQ2WujPOqqJsnZUxzrlVQnJA==
X-Google-Smtp-Source: ABdhPJw6IzQxFBBYLxRY7eSsyQ2gg2BJCl08LJM5uP+jELw6xkvfF9ITLuw+2kBt12/4Mj/nMtj/KA==
X-Received: by 2002:a7b:cf2b:: with SMTP id m11mr6949714wmg.110.1594415799014;
        Fri, 10 Jul 2020 14:16:39 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id w7sm11337240wmc.32.2020.07.10.14.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 14:16:38 -0700 (PDT)
Message-ID: <231f7c8e83cea1ef2d99bc6c40fb7b089192180b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH] devtool: remove _PYTHON_SYSCONFIGDATA_NAME to fix do_unpack
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Taras Kondratiuk
	 <takondra@cisco.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	"xe-linux-external(mailer list)"
	 <xe-linux-external@cisco.com>, Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 10 Jul 2020 22:16:36 +0100
In-Reply-To: <CANNYZj9sJAaPdPQ2yPkN5iPBiUA9jNQ4qLSvbhxGGXja2oTR-A@mail.gmail.com>
References: <20200710190810.1967868-1-takondra@cisco.com>
	 <CANNYZj9sJAaPdPQ2yPkN5iPBiUA9jNQ4qLSvbhxGGXja2oTR-A@mail.gmail.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-07-10 at 22:41 +0200, Alexander Kanavin wrote:
> I am able to do 'devtool modify gpgme' without any errors. In what
> setting does it fail for you?
> 
> The purpose of _sysconfigdata is to substitute configuration values
> that are specific for target python when running native python in
> cross builds with requests from target component build systems to
> supply those values. For that to work, the recipe also needs to have
> target python3 in its DEPENDS. It 
> 
> I feel the patch is fixing the symptom rather than the issue somehow?

We've had other patches like this and were playing "whack-a-mole" since
as soon as one merged, an issue appeared somewhere else. In the end I
stopped taking them and asked the issue be debugged and fixed properly.
There should be more info in the archives about what I suggested/asked
for to move forward with this...

Cheers,

Richard

