Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E1F5C36010
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 11:26:43 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.9307.1743765995808259845
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Apr 2025 04:26:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=T2aNb67Y;
 spf=pass (domain: linaro.org, ip: 209.85.167.49, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54991d85f99so3044826e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 04:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743765994; x=1744370794; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pq9J4GNuBxdogIrJPKbaT6yTDR1DSugEzmU4OHSq860=;
        b=T2aNb67Y6N/6hntvcGlABZDZU3NrDBC7VqW5M7qhvFVOCbUh3oFG9mJ0JsQhaHjWE+
         fgjadgo+ZWF6Jh1MvrPZb5F+msZ2XPJe7kPFQvOz6VMHmjaKYOJB4+oJ/dPsEwCw5hdr
         gjA2cac2ytBZiRSlSl2Bty8N+oJcSaWEECnQsORA1uD9DMYfgVjTaGNjFItR4hIGt0pY
         9BC26VFQIO7LCxyuxqwAoCS44YqjNaja/PkngDR6ElUCp0rGSG3dcl1iE/d7zV6A7AkQ
         X2xMtK7KkRAhdqHcL9sQPBLDrso12XbruID1BFcV9VxhTMa0yc8FfZV938SG8hhvAK4C
         zsjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743765994; x=1744370794;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pq9J4GNuBxdogIrJPKbaT6yTDR1DSugEzmU4OHSq860=;
        b=MxI8G0nquPr8ETSAq1r+NHuu+5oF8DCCJpsdJWpCFcj9kBf3+5i+DRyielDCNmb3YT
         ngBFtyqA/2CI5aA71xZJ2XajFxerQ8XqxG8zp6d9JPYEg5RcSZ8HCD1+mW/7FHH5SrqB
         LaIrCWNqxKfUsCRPvGu2ECFz4mDW/gbQ8+LLTesGnXaXjQhDmdHZAlFfoGQMZ55MnpDX
         6oTFbEOLKK/caS6GvFz8zUFQu1Js2F3jRH1/+2j47C0RWD9IihkiF44M+VH/njJckosU
         xfYDdAudt9yBqf8Gkhgt2hKj7hjBQfKfxP7C4aptoOUSmgG/jXpFNaxd8vFZZ0k80gdp
         dB6Q==
X-Gm-Message-State: AOJu0YwS1tETRVFKjPjlIk1YD+Zl36B/rUeAjgaNGDhjZmh5bHFs16oT
	NJzAS0clVGf9/SanEZVEGfbxxwiOgfF3SHGFtnVtkJNJgCcPRGAKRZ/X+db74Kk=
X-Gm-Gg: ASbGncsNbg9FIOhiy3LUjwnw1W76rthBxObB6fBftTEPH498LLjZdlGlsEIBk7Ip0HJ
	tqEa2L3F4G+Gcd0voA0b1c//5zeui4Gtf7Y2GnKmMEWEhyjMgD73u25GsH501ZAs7fhHmilakDv
	NL9DqlS9onalRVyJtYYzUK34hG0G6vnA8LXKGOcThdPb3eKmMj4jA3bdQN9n2qxQa2JVYXOo9mj
	OQ3sutSs+nDNakvE8FGTSzcDRAlFF4xO1ranjHn2BJmJ+Mi7BTAImWS+TBk2aXL+qZPt1jP9LID
	o4O4o8Z0rxSbYnT4lzDY5qAPBgmAW1DdAkSBgC4pOu04JSjd8ChhRKo64vS6MKJ8YxrMtEM1hXZ
	lng==
X-Google-Smtp-Source: AGHT+IEF5Hfw2ayhszAKDBu5hCWMSwKio9CBn34xJMXZqsUhP1Wp/FbTRKNd0h2I3KsQb116Lnj1FA==
X-Received: by 2002:ac2:57c6:0:b0:549:8b4d:bd47 with SMTP id 2adb3069b0e04-54c1ca63392mr2188268e87.9.1743765993799;
        Fri, 04 Apr 2025 04:26:33 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e63e8c3sm408966e87.158.2025.04.04.04.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 04:26:33 -0700 (PDT)
Date: Fri, 4 Apr 2025 14:26:32 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: AUTOREV with SRCREV_module? (Re: [OE-core] [PATCH] u-boot: set
 git repo branch with SRCBRANCH)
Message-ID: <Z-_B6GF31Zad_xjE@nuoska>
References: <18330E36E620F155.22125@lists.openembedded.org>
 <Z--6O076mTdeC9JX@nuoska>
 <CANNYZj_rH+zUJ1gVGPQ-MvkAnX6941bWUSKKpYLtOnDboJqgoQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj_rH+zUJ1gVGPQ-MvkAnX6941bWUSKKpYLtOnDboJqgoQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 11:26:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214342

Hi,

On Fri, Apr 04, 2025 at 01:07:21PM +0200, Alexander Kanavin wrote:
> I have to note that poky-bleeding is not tested in any way, so you
> probably first want to stop using it, or otherwise propose a test
> plan.

poky-bleeding.bbclass could have some trivial tests. I can try to draft
them. I don't expect oe-core to test it with real SW components.
I plan to use it with some SW components I care about. Finding
and fixing issues from bleeding edge pre-release builds can help
improve releases and reduce maintenance and integration work later on.

This could be more work, or the same amount of work but just done
by developers closer to the SW component upstream which could help
distro maintainers. I find poky-bleeding.bbclass useful.

FWIW, my question seems to be answered by SRCREV_FORMAT and
patch will be:

--- a/meta-poky/classes/poky-bleeding.bbclass
+++ b/meta-poky/classes/poky-bleeding.bbclass
@@ -12,6 +12,10 @@ python pokybleeding_version_handler () {
         if "pseudo" in bpn:
             bb.warn("Here 5 %s %s" % (d.getVar("PN"), bpn))
         d.setVar("SRCREV", "${AUTOREV}")
+        srcrev_format = d.getVar("SRCREV_FORMAT")
+        if srcrev_format:
+            for multi_scm in d.getVar("SRCREV_FORMAT").split("_"):
+                d.setVar("SRCREV_%s" % multi_scm, "${AUTOREV}")
         if "+git" not in d.getVar("PV"):
             d.appendVar("PV", "+git")
 }


Cheers,

-Mikko

