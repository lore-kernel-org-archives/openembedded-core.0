Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web11.7513.1589295429116566471
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2020 07:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=ypWFt4rh;
 spf=pass (domain: burtonini.com, ip: 209.85.208.196, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f196.google.com with SMTP id j3so13982313ljg.8
        for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2020 07:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1LryLi3u/x7IZ3BFokXTYdKEp7n7IenZLw2TLMwWvCs=;
        b=ypWFt4rhP39N4EmPbIy4QL73v0XNCB13RzAw3ujB07ZgSfkQz1f+JA8IWUU5lE8LP5
         AXj8EuUbyZwR+eUVo5q1YGcYhhRMeAbKHkP4TFtG/zlZyJG/tXw7FIhqbxAnpaV7F8ne
         duLi0PmO2xDM/8aDy2xJ4ob+deVMsA5O+kbRzVoV6Px2W4juGVHpoYex1Rg9z0z/HCgg
         ybF2m410oHdOQe7bhW1HiqPrmKyxygfc4PWHZN1q3XKUoBKOiWhAtLahRH64OWd4mjzC
         lXgxCGj/Yk0YFhsIsbdBB2DTs6NS3mxf4+qq6DR7MppOqLfSN5QE2C9njpOUYTru2k6h
         eKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1LryLi3u/x7IZ3BFokXTYdKEp7n7IenZLw2TLMwWvCs=;
        b=e4edDeE1riBWXGaKAudl3Vf7blotZ+C36FyMMSHhdaN6Xc2tzmcz46V2M9wel1ZWt6
         8ulsFlrjVyTBa+5dEO6moRP45U9+ENbvB/QvDXVARQLmbRo2pC8WuuuL5nT+cFYMmmzX
         e8UeBuLi7JhiWSkqPAP+sYAxYEwWAHH37jNgRPkABfia4X3ZLwQb6JeROc1J58UHM6V0
         aHscyk+XqMcjeUXGzZXcVFi7ozIUDT/dFcj6+sAfQifG1TFbrzW3gOyQumVZMLr5qYJ5
         SWZ7X1FYoucw+fhZVtFAed+F5OUhyp3RCQEpbHJfFJ77mP671eVWTHl+8Biy7pjjSGBA
         x1VA==
X-Gm-Message-State: AOAM5313t3f87qtdLYdy0DB3fLO3wfx0aXxlwb7JQlwLbnWhhkNwJ5EX
	QC4KAvK+Yr2tmJU0+7RvuNP9bICqZPiUgTKBTM14xw==
X-Google-Smtp-Source: ABdhPJwLxIg+8t09H9DpwHWDp3OYPG36/4oNwf/vWn/AxllmxY6VMJjWhBJy187uFj75C3GXGho36jlymbgFdnSIeMo=
X-Received: by 2002:a2e:b248:: with SMTP id n8mr13730090ljm.207.1589295427172;
 Tue, 12 May 2020 07:57:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200512081709.3914-1-timon.ulrich@kabelmail.de>
In-Reply-To: <20200512081709.3914-1-timon.ulrich@kabelmail.de>
From: "Ross Burton" <ross@burtonini.com>
Date: Tue, 12 May 2020 15:56:55 +0100
Message-ID: <CAAnfSTvj=6nhjoz-QvsTBRTEn9mUBNnyUzAxJgNKEtR4YHmmYQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] cve-check: add option to format reports as comma seperated values
To: timon.ulrich@kabelmail.de
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Timon Ulrich <t.ulrich@anapur.de>
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 May 2020 at 09:17, <timon.ulrich@kabelmail.de> wrote:
> +        if d.getVar("CVE_CHECK_FORMAT_CSV") == "1":
> +            manifest_name += ".csv"
> +
> +            with open(cve_tmp_file, "r") as f:
> +                db_update_timestamp = f.readline()
> +                orig_tmp_file = f.readlines()[1:]
> +            with open(cve_tmp_file, "w") as f:
> +                f.write(db_update_timestamp+'\n')
> +                f.write("PACKAGE NAME;PACKAGE VERSION;CVE;CVE STATUS;"
> +                       "CVE SUMMARY;CVSS v2 BASE SCORE;CVSS v3 BASE SCORE;"
> +                       "VECTOR;MORE INFORMATION\n")

If writing a CSV file, it's really best to use the built-in csv writer
classes as they handle quoting and so on for you.

> +        write_string += "%s%s%c" % ("PACKAGE NAME: " if d.getVar("CVE_CHECK_FORMAT_CSV") != "1" else "", d.getVar("PN"), eol_char)
> +        write_string += "%s%s%c" % ("PACKAGE VERSION: " if d.getVar("CVE_CHECK_FORMAT_CSV") != "1" else "", d.getVar("PV"), eol_char)
> +        write_string += "%s%s%c" % ("CVE: " if d.getVar("CVE_CHECK_FORMAT_CSV") != "1" else "", cve, eol_char)

This is getting unreadable.

How about having a report class and separate implementations for each
type, instead of trying to support both forms in the same code path?

Ross
