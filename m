Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web12.12994.1604676224121454337
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2020 07:23:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=yUZZStUH;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.42, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f42.google.com with SMTP id b9so1638315edu.10
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2020 07:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n5lrjvOyKocMjuzbIu1fiQ4y5NB98Vd4Wa5TtYR96Qg=;
        b=yUZZStUH3WZTCE/ykijJYz80QI6L/l/i9EUmnEYkbTf4s3hDgCH3A3lZwO61Y+TVjA
         0RT+h7OWMCjlPMikDuzz/+hDACHxmriPob6Roj6BhY81kD+bC1iaTsVUIglzwbPcaThD
         tFXVfkul0byLC5d+6nUXSkrVjnM5SUizvPGfKJbcTwnriKCOuDG7Du7XJ7/5v2ISAjeu
         uKIDl82PTKtKgT5sVhnak80Fiur5h/vQzf5hVwrFR2vWJGznfKfXpUKaGuAqsjb6FJyE
         3C+sanryjlY4fpOX4K+YZ0Kga9HWBYA1NciXofn+2RvFonuGNI4HalHMdQGUCbeIE+aN
         TfPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n5lrjvOyKocMjuzbIu1fiQ4y5NB98Vd4Wa5TtYR96Qg=;
        b=WCrSzvpGHOLIG5QUsYRaVOdBeBrPOH0eguUrpuOnMy/spyEhHpTXtSIET1zt9Uq6UQ
         +Kwz+1yf6v2LL/SKkDiFmyJB0/N0BlRa3WW1/LJDGIb+qnyeOYuTbjvV2A8mZLSih3+s
         kzhVuU1QJpVvAD8MsipqusIx/4rK1QqRzU2N6NrJIhwxAbv4PIkvXm+h+TCr2BMu0LTH
         HeYyt/yzv4u4K0F6lzHOc2vnBOPT4hFq5iDE2qobIXWXPAxqBnxogJjksWMnSA0A8qj0
         e/zBb3LcC44fjhTbJ8yM0yIfBSI+zwgSddPgoW1pr22v37H4vvc1ihvokrsf2fd4toXk
         rqew==
X-Gm-Message-State: AOAM530Qvn+PB776d3sbuA2ctcXR/dt4TEl0ODG5kGmhHTafCafZ36+x
	ap8g+eWYrU4z2TfPH1gyMah6grV40swiCDUZZ5G+Lw==
X-Google-Smtp-Source: ABdhPJyS264bnGNzWqutR4lEcQdNUQXaHml3JpHuKb0qdRSc/9cOblHuq940zHhHu0XWZjXQLTWERFMWMcIenpGF0c0=
X-Received: by 2002:aa7:d550:: with SMTP id u16mr2450747edr.147.1604676222503;
 Fri, 06 Nov 2020 07:23:42 -0800 (PST)
MIME-Version: 1.0
References: <20201102004431.67408-1-chee.yang.lee@intel.com> <20201102004431.67408-2-chee.yang.lee@intel.com>
In-Reply-To: <20201102004431.67408-2-chee.yang.lee@intel.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Fri, 6 Nov 2020 05:23:30 -1000
Message-ID: <CAOSpxdZztUz3aznmmO9ZmiH8NOH4wj6WTAWE4hJsgRWAd3oFhA@mail.gmail.com>
Subject: Re: [OE-core] [gatesgarth][PATCH 2/2] ruby: fix CVE-2020-25613
To: Lee Chee Yang <chee.yang.lee@intel.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

This patch also applies to dunfell, so I'll add it to my list of
patches to test.

Thanks for helping with CVE reduction!

Steve

On Sun, Nov 1, 2020 at 2:44 PM Lee Chee Yang <chee.yang.lee@intel.com> wrote:
>
> From: Chee Yang Lee <chee.yang.lee@intel.com>
>
> Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
> ---
>  .../ruby/ruby/CVE-2020-25613.patch            | 40 +++++++++++++++++++
>  meta/recipes-devtools/ruby/ruby_2.7.1.bb      |  1 +
>  2 files changed, 41 insertions(+)
>  create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2020-25613.patch
>
> diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2020-25613.patch b/meta/recipes-devtools/ruby/ruby/CVE-2020-25613.patch
> new file mode 100644
> index 0000000000..1abcb7547e
> --- /dev/null
> +++ b/meta/recipes-devtools/ruby/ruby/CVE-2020-25613.patch
> @@ -0,0 +1,40 @@
> +From 8946bb38b4d87549f0d99ed73c62c41933f97cc7 Mon Sep 17 00:00:00 2001
> +From: Yusuke Endoh <mame@ruby-lang.org>
> +Date: Tue, 29 Sep 2020 13:15:58 +0900
> +Subject: [PATCH] Make it more strict to interpret some headers
> +
> +Some regexps were too tolerant.
> +
> +Upstream-Status: Backport
> +[https://github.com/ruby/webrick/commit/8946bb38b4d87549f0d99ed73c62c41933f97cc7]
> +CVE: CVE-2020-25613
> +Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
> +---
> + lib/webrick/httprequest.rb | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/lib/webrick/httprequest.rb b/lib/webrick/httprequest.rb
> +index 294bd91..d34eac7 100644
> +--- a/lib/webrick/httprequest.rb
> ++++ b/lib/webrick/httprequest.rb
> +@@ -227,9 +227,9 @@ def parse(socket=nil)
> +         raise HTTPStatus::BadRequest, "bad URI `#{@unparsed_uri}'."
> +       end
> +
> +-      if /close/io =~ self["connection"]
> ++      if /\Aclose\z/io =~ self["connection"]
> +         @keep_alive = false
> +-      elsif /keep-alive/io =~ self["connection"]
> ++      elsif /\Akeep-alive\z/io =~ self["connection"]
> +         @keep_alive = true
> +       elsif @http_version < "1.1"
> +         @keep_alive = false
> +@@ -508,7 +508,7 @@ def read_body(socket, block)
> +       return unless socket
> +       if tc = self['transfer-encoding']
> +         case tc
> +-        when /chunked/io then read_chunked(socket, block)
> ++        when /\Achunked\z/io then read_chunked(socket, block)
> +         else raise HTTPStatus::NotImplemented, "Transfer-Encoding: #{tc}."
> +         end
> +       elsif self['content-length'] || @remaining_size
> diff --git a/meta/recipes-devtools/ruby/ruby_2.7.1.bb b/meta/recipes-devtools/ruby/ruby_2.7.1.bb
> index 3dd9fb0a62..f87686f6f7 100644
> --- a/meta/recipes-devtools/ruby/ruby_2.7.1.bb
> +++ b/meta/recipes-devtools/ruby/ruby_2.7.1.bb
> @@ -6,6 +6,7 @@ SRC_URI += " \
>             file://remove_has_include_macros.patch \
>             file://run-ptest \
>             file://0001-Modify-shebang-of-libexec-y2racc-and-libexec-racc2y.patch \
> +           file://CVE-2020-25613.patch \
>             "
>
>  SRC_URI[md5sum] = "debb9c325bf65021214451660f46e909"
> --
> 2.17.1
>
>
> 
>
