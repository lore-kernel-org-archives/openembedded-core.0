Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.444.1614732433923181351
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 02 Mar 2021 16:47:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gp5bCsdE;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: vivien.didelot@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id n79so10793810qke.3
        for <Openembedded-core@lists.openembedded.org>; Tue, 02 Mar 2021 16:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:message-id:from:to:cc:subject:in-reply-to:references
         :mime-version:content-disposition:content-transfer-encoding;
        bh=YWltAZSr4eLcO+00rBaO9IwUcfO8HFqQ8H29wMGzHXw=;
        b=gp5bCsdEE2OAte/QVq1UDO5+h06YBTErdchdNFqq5s497HPsfH/ky03IQNrrVSM6VN
         0W1FcuPHFdTaAnNVc/NCqgQQPyo78T7Ol7bLD2/tTq8GwXWATIourqgRP56hid0cz37y
         Z9GIny3D7PG4wO5eSRgtP+0RJsLEelGgwqzXE9KWN0krkwrcPSYAfpwDs9zzymk8hbQ8
         W18jklmMSfWS+mlREBbD3kML8O1Sx7vK21+z5gkdcanVp10YAfbX2YUmsgdj1ve4OUAY
         HOXIyHsuYWjVmMlgxdtLvHxLhSGNRMVaOVXcTuYVg9o/g8juc7/4zwHQ/i0xdMSqvKyU
         K2/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:from:to:cc:subject:in-reply-to
         :references:mime-version:content-disposition
         :content-transfer-encoding;
        bh=YWltAZSr4eLcO+00rBaO9IwUcfO8HFqQ8H29wMGzHXw=;
        b=OjIJD2OScrqGOCpKN2jpVzPJ8VkM09XkCBdPPK+QcyirykikOPlIyyweKy8Hq7I3K+
         BGceBv20BePho/iPQ1zMrGDAz3pLgnUr6iHlWeJHQfNSwe1yUQgKm+GwhNJbfUXnfz2z
         e1RPfCSnQSshmk764JcdmdbWqh9y7q/7Vfzp0ZQMUXujfOCbPFIVX3JZgdFbKfVDOTug
         iLn8EdoN36Ap4Wbm8iDlroufEmgRkAqdUfzgD2pipkyts5m0SDKuOmlh5byRAZHemcSz
         8kObV/8sbDxC0eIlQtdoLmaNT+fWKMHF5hZVXMMlMmIhww92I6/fiUukkUlhaECWlfnF
         i5aA==
X-Gm-Message-State: AOAM53341feUuvpRP/aJz5EgE0C0OtSp5QE3/jHyRRY5PNsPb1szKU6H
	vKwDJuzBeITazb19Dtjje5s=
X-Google-Smtp-Source: ABdhPJxIFevWxxoq/dML3htpW15BcKoRixmzegyipwsAHdibCZrOWmJv8V892vUmuRRoCHFT+ogMNQ==
X-Received: by 2002:ae9:f503:: with SMTP id o3mr9986994qkg.331.1614732433064;
        Tue, 02 Mar 2021 16:47:13 -0800 (PST)
Return-Path: <vivien.didelot@gmail.com>
Received: from localhost (modemcable249.105-163-184.mc.videotron.ca. [184.163.105.249])
        by smtp.gmail.com with ESMTPSA id y1sm9163396qki.9.2021.03.02.16.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 16:47:12 -0800 (PST)
Date: Tue, 2 Mar 2021 19:47:12 -0500
Message-ID: <20210302194712.GB95588@t480s.localdomain>
From: "Vivien Didelot" <vivien.didelot@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Openembedded-core@lists.openembedded.org, Chen Qi <Qi.Chen@windriver.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/3] systemd-container: recommend tar
In-Reply-To: <a4329c47-9493-e7b6-039c-84db68f3dc50@gmail.com>
References: <20210301165325.3987311-1-vdidelot@pbsc.com>
 <20210301165325.3987311-2-vdidelot@pbsc.com>
 <a4329c47-9493-e7b6-039c-84db68f3dc50@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Khem,

On Tue, 02 Mar 2021 10:46:51 -0800 Khem Raj <raj.khem@gmail.com> wrote:
> we should be enabling CONFIG_LONG_OPTS=y in busybox when using systemd

To sum up:

  * the systemd-container package contains the machinectl binary;

  * the machinectl "import-*" subcommands require systemd to be configured
    with the "importd" PACKAGECONFIG entry enabled;

  * "machinectl import-tar" uses "tar --numeric-owner" which isn't supported
    by the default busybox configuration.

If busybox configured with CONFIG_LONG_OPTS=y does support tar --numeric-owner,
it might be a better approach to enable this when PACKAGECONFIG[importd]
is used instead of adding "tar" as a recommended package for systemd-container.

However I have no strong opinion on this, and have no clue how to achieve this.


Thanks,

	Vivien
