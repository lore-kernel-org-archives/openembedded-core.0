Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.5257.1616921363765345283
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Mar 2021 01:49:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YZXnf1ol;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id b9so9753309wrt.8
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Mar 2021 01:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=56fF5cHSDDA6Io6X9bFg6htkWRbpfA05zRfGiFO9Qzk=;
        b=YZXnf1olKOqvVgJAUCfTHRxsRWmaKJmPmjdNqxvUEaHHR6G2FiPLdidKAmX8uIZ0Ui
         PMl26xhSoNVU92OPOnUezdH5i5PoEICL6FNMJuzGQ8O5PgMXg2Lfvl63BZnmzk381sye
         /MJ7i0xp+tVtl0CEcyX6YOuLB+V20wc9DW5cU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=56fF5cHSDDA6Io6X9bFg6htkWRbpfA05zRfGiFO9Qzk=;
        b=t74RKEUEK5HOIwv+RPKMeUcKDUKjNklMMa5qWHNYz+jatuZA4g12ziCZm8eMq7BaJm
         b5KzojebCWCZeLxMvGJY9AG7uumIY26qQaZ/7PcWih2L8yAbUl/bagLD/dWRGe7+3uAP
         BcyDS9/LPfstsOTink0sXZCHj0rvKJF9dAqyE1MhR5Ht2vX4R1UQEL31OqM7dFXbLMxw
         WnVKtHeLgdWHW9foa3P/cmQaSzVUws2lWUaSehiIHhpX0UrBvgP/2ArEHmj9IelNmooy
         mjvqCB4ZF+H5/cYkRmbSrAdbSYZapGBJ935/ZvVhu4fvVbS+JVBqIefJajuCyRn4SZF3
         veWA==
X-Gm-Message-State: AOAM532nyehgsDY/2SkgCaZacxZ5uhQ+nmN1l8nXq9JLlV9XiTy5pK5p
	Fkslq4EhYwLMWt7V025iO8LJog==
X-Google-Smtp-Source: ABdhPJylzAoIEDumdSHSFrp57I78mvXCKOurK/jwjWNHzmI9hO7yZ5zPVLPUDP7ipyNG/+ujktDyqg==
X-Received: by 2002:adf:e7cf:: with SMTP id e15mr23061352wrn.346.1616921362231;
        Sun, 28 Mar 2021 01:49:22 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:1d2c:6290:11e9:3ac1? ([2001:8b0:aba:5f3c:1d2c:6290:11e9:3ac1])
        by smtp.gmail.com with ESMTPSA id n9sm22324271wrx.46.2021.03.28.01.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Mar 2021 01:49:21 -0700 (PDT)
Message-ID: <4a140ff56eff93c1552d57899fb34cdb01ab2e86.camel@linuxfoundation.org>
Subject: Re: [OE-core] [poky-contrib][PATCH v2 6/6] Moved logic to get filelics from package.bbclass to license.py
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Meh Mbeh Ida Delphine <idadelm@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 28 Mar 2021 09:49:20 +0100
In-Reply-To: <20210316084845.379201-6-idadelm@gmail.com>
References: <20210316084845.379201-1-idadelm@gmail.com>
	 <20210316084845.379201-6-idadelm@gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Ida,

On Tue, 2021-03-16 at 09:48 +0100, Meh Mbeh Ida Delphine wrote:
> The logic to obtain filelics is moved from package.bbclass to license.py 
> as a standalone function.
> Also, the check in package.bbclass after obtaining filelics ensures licenses 
> with * WITH Linux-syscall-note" are ignored, as long as they're only in header files.
> 
> Signed-off-by: Ida Delphine <idadelm@gmail.com>
> ---
>  meta/classes/package.bbclass | 35 ++++++++++++-----------------------
>  meta/lib/oe/license.py       | 29 +++++++++++++++++++++++++++++
>  2 files changed, 41 insertions(+), 23 deletions(-)

I have spent quite a bit of time thinking about this patchset and I'm
not sure we're yet into a position where it can merge. The code has
definitely moved on from where things started but I'm not sure it 
is far enough along to be useful to others yet in this form.

For example, we should only ever generate warnings if there is a clear
path the user needs to take or a clear benefit for fixing it. The warnings
from this code, whilst reduced from where they were, are still going
to be large in number and not focused enough for general use. I realise
I added the warnings in the original code but the idea was that was
only a temporary thing to help debug it with and illustrate what it was
doing, it was never intended to merge like that. Ultimately a warning
should only be shown when we know there is something serious wrong.

If this data was being written to a log for someone to review, that
would perhaps be better but even then, I'm not sure the quality of
the output data is yet high enough for that to be useful for people 
review.

Some of the function abstraction does look useful but it is
entwined in with the rest of the patches so can't be merged without them
I do also have some concerns about the function names, I think they'd
need to be improved before it could be merged too.

What we do have here is a set of building blocks that the next steps
in license development can take place from so its good to have the 
progress. 

Cheers,

Richard

