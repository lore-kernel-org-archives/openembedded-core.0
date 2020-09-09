Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web12.5746.1599682775959425248
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 13:19:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=zs96ebGg;
 spf=pass (domain: burtonini.com, ip: 209.85.208.194, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f194.google.com with SMTP id v23so5289887ljd.1
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2020 13:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P06gtF8PV+Obu24y6qoNU07TDDcFrXFdsHIjRm6E008=;
        b=zs96ebGgiLyDPAqouM2zdpiTA3fD2GsCc/wYm8BeVszzT0sklJ0D+DUVVPy3jbracE
         BEL9HOepFIV61I4grp1ZVG+gz52tgH1UyLYigK3A+Rl0/nsvFe6oY4wOZqaPaBYod0Zw
         j3Lms+4V6hIW7j7clTU8HSH5LiUFL4uzXIPYt+Fk8UTsIwVWW1NtDhKQ4/wj/ApayduU
         6JKSxNBzMpfcQMK+yedDO+msww5sASD8YXOKFjabdyOfxOgHHuNMINXNSrAC2xsMAyhl
         lMBOUYrayFhEk4c9OywUkV1smpOhu+mYx81bvJfQvVEt5ac7yIs7SbjIS5sP+kXtstY5
         Sm5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P06gtF8PV+Obu24y6qoNU07TDDcFrXFdsHIjRm6E008=;
        b=P5DgvaZLxO1Cy3JrqAlgxl1+2ItB39YuX/kv4BhCQPsEEmC5rFaTcMZ0HduhwxdMCv
         f614wIOW1W+Zqz0/xslOZ5dJH6Ah9KF2FltxlpSm9Be2wUHbMJmXo+BXz2RI29h8wM8Y
         FLPElV7MoPxZWLjESjiPYH2OqfO9SMFXXWRJGBrF6IvjL4jftu+hdHGSep1nFR65woiD
         Y1f75oSxuHFUaQA012d8HLm6jL2YNfSzYDERwxGzFanAnBEl0MGjnDBxehOLz3LMlxFT
         nrsYIxWP+E/lCQ/5/IeNJBXq13OlIyNQmA+2TDbmgWJf6SJ0p+KuvKUuARS35dciyub/
         hgMw==
X-Gm-Message-State: AOAM533CLigMvTZxZkHKubM8kAfwQtA88mqHxjkugnzljDENcREcvkQU
	DWJFR2d/AW5l2f4lTlYmkhwGi/RDLb5/GAS+pd/oWQ==
X-Google-Smtp-Source: ABdhPJxWjyHhv7eEx2aE5XMbZ9W3dYB4yGj6S7tePzw5b9bKFmIkROJaZ8WaQ7RU33tJ86ZpMLicacXT8FJUhDZNilI=
X-Received: by 2002:a05:651c:1122:: with SMTP id e2mr2692981ljo.36.1599682773967;
 Wed, 09 Sep 2020 13:19:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200909173510.114925-1-chris.laplante@agilent.com> <20200909173510.114925-2-chris.laplante@agilent.com>
In-Reply-To: <20200909173510.114925-2-chris.laplante@agilent.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Wed, 9 Sep 2020 21:19:23 +0100
Message-ID: <CAAnfSTufbRYeTjS4ovx=5Bj1jqYsheYzJcysCo7j-1PqmD+x-A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/4] cve-check/cve-update-db-native: fix under multiconfig
To: chris.laplante@agilent.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Sep 2020 at 18:35, Chris Laplante via lists.openembedded.org
<chris.laplante=agilent.com@lists.openembedded.org> wrote:
>
> Previously CVE_CHECK_DB_FILE / CVE_CHECK_DB_DIR was the same across
> multiconfigs which led to a race condition wherein multiple
> cve-update-db-native:do_populate_cve_db tasks could attempt to write to
> the same sqlite database. This led to the following task failure:

But the databases will be identical so that's basically a waste of
time.  How about adding a lock file so the second task waits for the
first to complete, and then does nothing as the database is up to
date?

Ross
