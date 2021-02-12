Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web09.1853.1613171565439503810
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Feb 2021 15:12:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ABk2tnJB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id x4so1285272wmi.3
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Feb 2021 15:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=3tXtiPQNfCt/KC8QPvOuUetoW5cHjLQSeKjU7L/QXLc=;
        b=ABk2tnJBCQQvVqhrvyWJY2CEI7mH9Udrd7oKVAZePvdBebH6Dy99u4pgh6+gn+kLlt
         H64vd7jK8OO9gQV+CubEPhfKshj/Dct6/wFriuVZit3H9fldk1NLNZ03iWbKzQ8UW0Q7
         0N72sLsqA4VYHcLNPRHayh9FPqjPfB+m9nYB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=3tXtiPQNfCt/KC8QPvOuUetoW5cHjLQSeKjU7L/QXLc=;
        b=dDutJgzhGc4dfoCTOlqXVLgyyKg4V9WQeJ038aD9UTWlHvbW149Jp7+MTDhqrs27Mb
         UA9q4QB60glMXei8CUcvqzXr28rXjbanfLnOtdBdQUXYCx8Ip3Mx2bJUyzq8ORNvFj7w
         6F6oM9XYkv6mJyTy7BnoeJNKnwE2xyH8hNU617dFdXxeftsWMBsk62tGf9gCii0YxJj0
         L96/xYUqJQuGMM/p+FiWts52jch0rA9N96GIp2oKctbjQXZ+9lBwmxTGh5Ssyv3iqiJ/
         ZglGlOrjcQ35q+TkVoqsXEoM15+ezPC3vOaNyL+3wmpimR/jm4M2tqtZHa9IrU7rE/15
         2ysA==
X-Gm-Message-State: AOAM530/W6EvDWYeyUkLbS5F2iVWKxl2+o5ywc5RChvCLgRTQ3rMiCLE
	0t9oDjtlifSBFa5EPm8A0Dlzaw==
X-Google-Smtp-Source: ABdhPJzN+LDxCAX9X05u05FmEQG7mcfa5OmsM8plg7N2pqXmdPXUupTBfG6dBZMPO74tjz0fDwwP4A==
X-Received: by 2002:a7b:c2aa:: with SMTP id c10mr4529739wmk.101.1613171563656;
        Fri, 12 Feb 2021 15:12:43 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:91a5:e7fd:31d5:331? ([2001:8b0:aba:5f3c:91a5:e7fd:31d5:331])
        by smtp.gmail.com with ESMTPSA id m131sm18530537wmf.41.2021.02.12.15.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Feb 2021 15:12:43 -0800 (PST)
Message-ID: <b2cb11119c9ea7b6276a374bc79d281d99312528.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] insane: Add test for native/nativesdk inherit order
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Tomasz Dziendzielski
	 <tomasz.dziendzielski@gmail.com>, Konrad Weihmann <kweihmann@outlook.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Feb 2021 23:12:42 +0000
In-Reply-To: <d00ff6214c464610951e8984625f1eed@XBOX03.axis.com>
References: <20210124095546.3329-1-tomasz.dziendzielski@gmail.com>
	 <AM9PR09MB46421810B3B2B59AAB545357A88C9@AM9PR09MB4642.eurprd09.prod.outlook.com>
	 <CAJkqNs21=9-B-oWU4AqLSLKZ9286N5UgoXNr7Smxr3+PqgZdVw@mail.gmail.com>
	 <d00ff6214c464610951e8984625f1eed@XBOX03.axis.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-02-12 at 18:26 +0000, Peter Kjellerstedt wrote:
> Since the order of inheriting native/nativesdk is important, rather
> than adding warnings about when it is done in the wrong order, which
> conflicts with bbappends that want to add inherit statements for
> native recipes, wouldn’t it make sense to instead handle this
> properly in the code so that native/nativesdk are always inherited
> last. An idea to solve this would be to rename native.bbclass and
> nativesdk.bbclass to, e.g., native-internal.bbclass and nativesdk-
> internal.bbclass, and then make the original classes only set a
> special variable (similar to BBCLASSEXTEND), and then later when it
> is appropriate check this variable and import the native-
> internal/nativesdk-internal class.

We have code to do this properly, it's called BBCLASSEXTEND. It
automatically adds the inherit at the end of the recipe.

I will also state publicly and clearly than any proposal that involves
"-internal" renaming of class files or variables is unlikely to be
accepted by me, I have a strong dislike of even the idea of them.

Cheers,

Richard

