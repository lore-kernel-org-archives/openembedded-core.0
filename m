Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web12.11048.1598353221463693805
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2020 04:00:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OLIKGY0x;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id a65so1933927wme.5
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2020 04:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=xSvHPfW9qzMvtZOBNqDeLUMZO6uuC+o/jeSs1wcn79Q=;
        b=OLIKGY0xcUH2wlzK18njkeVLqnJ4ZkkLjBqPsqCTsePJOfbBjJzDW59Bjtq5HUfs3n
         TCgNOGjfG2oL+BNoJE6K1cpre9i2ea57fR8AnghKRHqdMoH6wpYFlsrZ91PeBHic62HT
         ceZQVEC5GN5an6EfEp2xXBdnF0RNHfoxs7DiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=xSvHPfW9qzMvtZOBNqDeLUMZO6uuC+o/jeSs1wcn79Q=;
        b=mXBVvohhfqSNZzDbLU6gcHzJsEf0+1MTtws2EYq4oiSHKPOyMtiASbu96oKY54JPeR
         30qKB+oP84SEBR58R6gkoOTymbbAVhGKPcx4+Vyu4kktkJqyvYrTDI3aOMebn75Fr+hL
         AJBXnM0KkWy3kF5ZQBuytbL+EVYuc1Ehnk4eD3E0bw2vwyTxPzTwWBKOIp9y5M3+IsU8
         TprEgixbViquIDWFxiOxRPhRlTdrbs1DmFlSBtvN5Jbe20eUQzt34opuDMz9Vv8ZL2s9
         MYKLSF58AZEMawjYs4L2OgFvy38pwim3MV+RcRmZpsayaH73ysl2Emk8HphCQ/vB8ZFZ
         gmXw==
X-Gm-Message-State: AOAM5325D581q00OOc6h6Ve0rSOnOOHrWOzO+PahK1tSCYIGDFp9TDIG
	5vtUIL1p1qEPn+NkW1bl8zAYWg==
X-Google-Smtp-Source: ABdhPJzuw9bgi0pq16AO272ulvc90/7PohSUF//erTBzhtLImqvLXeNbRMpI/tciD4BXE7LxLyBMlQ==
X-Received: by 2002:a7b:cb47:: with SMTP id v7mr1493053wmj.36.1598353219618;
        Tue, 25 Aug 2020 04:00:19 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.9.b.8.7.0.d.0.8.3.5.0.7.0.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.9.b.8.7.0.d.0.8.3.5.0.7.0.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c407:538:d07:8b9d])
        by smtp.gmail.com with ESMTPSA id m10sm2076151wmi.9.2020.08.25.04.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 04:00:19 -0700 (PDT)
Message-ID: <27eb03568d6da2dbe904cdbabecd4ab4f3798461.camel@linuxfoundation.org>
Subject: Re: [OE-core] [master][PATCH 4/5] package / packagedata bbclass: Change the way PRAUTO and AUTOINC are handled
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@kernel.crashing.org>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 25 Aug 2020 12:00:18 +0100
In-Reply-To: <20200824232930.150388-5-mark.hatle@kernel.crashing.org>
References: <20200824232930.150388-1-mark.hatle@kernel.crashing.org>
	 <20200824232930.150388-5-mark.hatle@kernel.crashing.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-08-24 at 18:29 -0500, Mark Hatle wrote:
@@ -2396,6 +2399,14 @@ addtask do_package_setscene
>  python do_packagedata () {
>      src = d.expand("${PKGDESTWORK}")
>      dest = d.expand("${WORKDIR}/pkgdata-pdata-input")
> +
> +    bb.build.exec_func("package_get_auto_pr", d)
> +    # Store this for later retrieval
> +    data_file = src + d.expand("/${PN}_prservice.oe_nohash")
> +    with open(data_file, 'w') as fd:
> +        fd.write('PRAUTO: %s\n' % d.getVar('PRAUTO'))
> +        fd.write('PRSERV_PV_AUTOINC: %s\n' % d.getVar("PRSERV_PV_AUTOINC"))
> +
>      oe.path.copyhardlinktree(src, dest)
>  }

My instinct here is to drop this oe_nohash file and instead, run a 

sed -i -e "s@${PRSERV_PV_AUTOINC}@val@g" -e "s@${PRAUTO}@val2@g"

over the files in dest to expand out the values.

You can then drop much of the other changes trying to expand these
things out. We don't know what out of tree things are also using the
pkgdata files and I'm not sure we should force everything through the
API either.

Cheers,

Richard

