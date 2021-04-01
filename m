Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web09.6362.1617307301260472681
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Apr 2021 13:01:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Zg1qmR3S;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: armccurdy@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id u10so3504017lju.7
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Apr 2021 13:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cud22TrfYASU+XSk8p28fsljiERAtIUd7JIKc4QSTRQ=;
        b=Zg1qmR3SOBe+KD+ajc3q946qj+B8lBi1EU2IEBiLPJyLlqt6PK15XGrrlpuXpou/8y
         cbjxMCx7yT2a7SYVGx/TFJd3YPqdLTNd+QO5Yb7H4FRufysioFBJA/IGw3i2xPQS6Y+L
         D4rHY/gHOvxUCiSPXy3FbYQMQ5h3HmkIvS8O/vqIIm8IZyeq+cx/h++yMaC+rWIOvOKm
         3JQVZaWJVHTUyZBQ8L8MT72nEo/BE59R3lo1EemuHLYr8jCEERU8JvEyyz7JT+zDqpBR
         NXCoWjX27H1V7Lgg9mfJqWbFDETGlLKbey1SRq+LbmO46JDOxjXbU3NEG7Pm7CSO+jxw
         Pkew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cud22TrfYASU+XSk8p28fsljiERAtIUd7JIKc4QSTRQ=;
        b=LQAEz9zUCLUxxACEJRjBnmZ9RBV5DOqbPjudn+TezV43CZtFFHhPxUfdwsO9bnCo59
         YwJVPoAj5R+i0Xq3NMvxyZfuD5hEossH9mWuit8rBCTLkHpPxw81ISar8KUnvQKSl1Ze
         vWDZ5Wdr/l9wMsPLlpkMNPETnlWZ5vJnMVsjsGcWj+Rs0NRQ7ET879k3r6fCX0mnjM7w
         zIbNjqHrWzPDqfHtZTY8bbtju6wkLmK6nic6imwetaVGjJCpW2ombNs14h0/yiIRzK5u
         2jXtORWjAbmFHrVzIvYGaA9bTtxwkliQS7klgXlW4LzjOM7cs99sc264HwpbRxBfVC7c
         Ullg==
X-Gm-Message-State: AOAM533qO+Qu5uRdvshRf98GeU5HGtb5f/1jPmRJKqT/PrQoP0+Rj4qR
	/tJj+K2uB5dUSZYXnSTJJS8eY1ScphYosItBYww=
X-Google-Smtp-Source: ABdhPJyQ/EYsYtwnx9G0vplT8DkReKUu26Ap6bNCLxLgY/r86Es47pAzjO+WT5ng00z+f5gCFWuyC/EC2GACUm8fF4E=
X-Received: by 2002:a2e:7a11:: with SMTP id v17mr6498637ljc.403.1617307299391;
 Thu, 01 Apr 2021 13:01:39 -0700 (PDT)
MIME-Version: 1.0
References: <a8849ff1-da51-b152-ce3d-6fd8a6b1cf38@crashcourse.ca>
In-Reply-To: <a8849ff1-da51-b152-ce3d-6fd8a6b1cf38@crashcourse.ca>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Thu, 1 Apr 2021 13:01:30 -0700
Message-ID: <CAJ86T=X+CmKXbi-ticjVDA4DCsSj+SQ+y0QULbRt2j6ud564Fw@mail.gmail.com>
Subject: Re: [OE-core] what are the dangers of adding "out-of-tree" files to FILES_${PN}?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 1, 2021 at 6:08 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>   recently, i've run across a couple layers based on pretty much
> up-to-date OE/YP, where fixed files are being added to a package via
> assignments like this:
>
>   FILES_${PN} += "/data"
>
>   i already know that's a bad idea, but i'm curious as to what build
> errors might occur when trying something like this.

What's the specific concern? It won't work well for -native recipes
(as discussed in another of these threads), but apart from that it
should work OK.

To be safe for use in a -native recipe you could change it to:

  FILES_${PN} += "${base_prefix}/data"

> i was first asked
> about what might have caused a "pseudo abort" error as described here:
>
>   https://wiki.yoctoproject.org/wiki/Pseudo_Abort
>
> where the generated error referred to "path mismatch ... ino #######
> db" ... etc etc. my first (admittedly uneducated) guess was that, in
> the midst of installation, some of that external content under /data
> was perhaps being deleted or updated in some way that was changing
> inodes.

I don't think you can corrupt the pseudo database with a packaging rule.

>   even if doing something like technically works, can someone explain
> what ugliness might result, i'm assuming from having any of that
> external data change in the middle of a build?
>
> rday
>
>
>
> 
>
