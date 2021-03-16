Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web09.2566.1615934062958298154
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Mar 2021 15:34:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=bUkzwd+o;
 spf=pass (domain: burtonini.com, ip: 209.85.221.52, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f52.google.com with SMTP id w11so11279530wrr.10
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Mar 2021 15:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+Hz/YABrzKt9wwwrXTj6qMpqW1d9zx0EloubOO2Gng8=;
        b=bUkzwd+oGwuFMGKMw48TYLgtuaWRVYKOGhIBSZ5r9qrzTaNoqG5EjHweS2LOPvdhGl
         9gZOJ0Jk5gq/+tcFPq9TAdQ3Vq8b4X6ncshg6xfNJ/wSq0/cKDnx00niW04z6J0Cr7Nv
         xW44j8Lcmh8TUzoZD6DpmK1vnFX7xGh9jFOg5ZRwn1aQahfTv0glYXF78Fpnye4uheR4
         yAuJr7UvB/MioFtvCEer2DWITpFK0zilhWTmvx3jtWzlY+hdyUHPnLDIGlgYm2hHgmHv
         OcjSOh11+jS2Kc9pQThH/db6XG/vrZ6ncN/Ee8KkNf6+w5hj1zlXAJcousXWSf1UUJqA
         1RtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+Hz/YABrzKt9wwwrXTj6qMpqW1d9zx0EloubOO2Gng8=;
        b=jXCKr6WAQ2Q3fov8izocSeciQXvjnJFRjFMgBHtyv3qRWpMeUnfLXLIxKNfIr9lI63
         +u0/ucWP1HWfeRPI704UVC9FY70+dDy/pL+KEM6Ov3iK5RqyDrJHmu1OmSnDSh3nK7FG
         AuR5tJH4Z+uWgA7Aw9lNW+bsOU0wzkGTkzqX262fs697JiKhX7IPSnrnGtHY1wXSuNtI
         Q2WfvElrVzHdtP4EuwmLWj1ABJ2YIVVYF9goKJGyCAZgAYr3oe+AL2PEeu4olPl1rmnb
         YvqNZMs9kq9jLAafJhULvbpbM/At47kOFNtdmjyIDSyq7hOeRd3NyqxS1sVnfJgAJQ7O
         BIXw==
X-Gm-Message-State: AOAM533nR3Y5QtobjpxM0Xxue1HQXUlxDCL29hfJcBLb5CbG13ahGXMm
	rz0HxYULSSf7xZEcyOBWvgU1fie/vbhWPpXqx9ODEg==
X-Google-Smtp-Source: ABdhPJwadx+H/3R/vVJL2UvoUurCasVq3vcV0vYxa+iQ/Ht7wHGeTRFf8pUg03J50HhOanxCOyFFpAUYpiMItLZqQRo=
X-Received: by 2002:a5d:6404:: with SMTP id z4mr1200899wru.109.1615934061468;
 Tue, 16 Mar 2021 15:34:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210224111108.41864-1-chee.yang.lee@intel.com>
In-Reply-To: <20210224111108.41864-1-chee.yang.lee@intel.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Tue, 16 Mar 2021 22:34:10 +0000
Message-ID: <CAAnfSTupOB3EanUAhE8bwwQVxk8-xy8_89uaEiY73Rid8SS-zA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cve-check: produce cve-summary in JSON format
To: Lee Chee Yang <chee.yang.lee@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Feb 2021 at 11:11, Lee Chee Yang <chee.yang.lee@intel.com> wrote:
+    json_string = ""

You're asking for a world of pain here.  Just build a data structure
and json.dump() it instead.

+        json_string += ',"LAYER": "%s"' % layer
+        json_string += ',"PACKAGE NAME": "%s"' % d.getVar("PN")
+        json_string += ',"PACKAGE VERSION": "%s%s"' %
(d.getVar("EXTENDPE"), d.getVar("PV"))
+        json_string += ',"CVE": "%s"' % cve
+        json_string += ',"CVE SUMMARY": %s' %
json.dumps(cve_data[cve]["summary"])
+        json_string += ',"CVSS v2 BASE SCORE": "%s"' % cve_data[cve]["scorev2"]
+        json_string += ',"CVSS v3 BASE SCORE": "%s"' % cve_data[cve]["scorev3"]
+        json_string += ',"VECTOR": "%s"' % cve_data[cve]["vector"]
+        json_string += ',"MORE INFORMATION": "%s%s"}\n' % (nvd_link, cve)

If we're going to write a new format, can we at least use nice key
names instead of all THE SHOUTING KEYS.  Keys like layer, name,
version, ID, summary, CVSSv2, CVSSv3, link, etc would be a lot easier
to consume.

If we merge JSON reporting we don't need two almost-but-not-quite
human-readable formats in the code, so I'd propose deleting the .txt
generation after the next major release.  At least JSON is easier to
transform into something that is actually human readable.

Ross
