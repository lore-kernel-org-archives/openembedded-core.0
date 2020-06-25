Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com [209.85.167.195])
 by mx.groups.io with SMTP id smtpd.web12.7610.1593081672285785372
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 03:41:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=aqVaSZE9;
 spf=pass (domain: konsulko.com, ip: 209.85.167.195, mailfrom: paul.barker@konsulko.com)
Received: by mail-oi1-f195.google.com with SMTP id r8so4540208oij.5
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2020 03:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=A1GJxRJ4o/41wbOJqtuodljW5x3Mp2IKHabcBf0c/6U=;
        b=aqVaSZE9aP9d41UAWsswtkqW/nvlCiEf5QsVsX09ILzCaQSZiNrzdfmbtAw6xJKJWP
         5p3MYIaq/tlh6LKgGvVw8/sSTD3oqWk9lV9RQz+L3xbkCpUQQbQ8sZ0P3GemCbVdxJoX
         aZgMsg0A9CBwlzgbaXDuMO75twmOVIhSjKEgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=A1GJxRJ4o/41wbOJqtuodljW5x3Mp2IKHabcBf0c/6U=;
        b=CyWMJaJMMNdE1bn7BrahtVkOaX5iOFG/rU91GcMwPKHPr2pFTtXIrhDdWLRhfrsQU3
         eyFhEyOnsgXjlflYanoXcPsFaQK76Oggh9Uoi2wVFYpRXQNT1cZfSJJfKR5Wvnh3DN0o
         RW6hfdeGjsInOUIkhvQ1+Swh6EZSk+/uXXzdqqoI8R9ReOKYmNDdEgGepug9akRtRPdZ
         +TXs+gfz6L65kgY2vPpCvtj4yjKW+bEl2kSKqfURa64uuYkvzWX3cJz1b1aiVMq7KTbA
         0TEDzr7ojByzAzHeQ/B7s4x4yJSMpvUPc0DvZSEpA6AfGHwQ5IC3/m19mZljBpnoecRn
         IcYg==
X-Gm-Message-State: AOAM533MMbNmL3FpzMYZ/s3X6qXoMQGy5DX1sTIp31HgMOkpy5XydRnu
	2V5CE+orV74fbGGuSVM1fRAmxQYQjfQj1tosx7qU0A==
X-Google-Smtp-Source: ABdhPJxRPsWIN455iKkNieSj5ZCuEdSJjgraeuldsHblwWg5AuG/4aoCBwnu6lkQKe04tWYzETRQn21/tV7GmDc7krs=
X-Received: by 2002:aca:df04:: with SMTP id w4mr1603123oig.27.1593081671602;
 Thu, 25 Jun 2020 03:41:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200625102145.7139-1-fredrigu@axis.com> <20200625102145.7139-2-fredrigu@axis.com>
In-Reply-To: <20200625102145.7139-2-fredrigu@axis.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Thu, 25 Jun 2020 11:41:01 +0100
Message-ID: <CAM9ZRVs5-VbFijHhCSet54JezehjHPOkkDK46N0XS_2y9-jVJQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 01/26] nopackages.bbclass: Get tasks from variable
To: Fredrik Gustafsson <fredrik.gustafsson@axis.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, 
	tools-cfpbuild-internal <tools-cfpbuild-internal@axis.com>, Hugo Cedervall <hugo.cedervall@axis.com>, 
	Fredrik Gustafsson <fredrigu@axis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 25 Jun 2020 at 11:22, Fredrik Gustafsson
<fredrik.gustafsson@axis.com> wrote:
>
> Get tasks from a variable instead of having them hardcoded. This will
> enable other layers to add tasks that should be deleted when nopackages
> is used.
>
> Signed-off-by: Fredrik Gustafsson <fredrigu@axis.com>
> ---
>  meta/classes/nopackages.bbclass | 19 +++++++------------
>  1 file changed, 7 insertions(+), 12 deletions(-)
>
> diff --git a/meta/classes/nopackages.bbclass b/meta/classes/nopackages.bb=
class
> index 559f5078bd..f36666ef5f 100644
> --- a/meta/classes/nopackages.bbclass
> +++ b/meta/classes/nopackages.bbclass
> @@ -1,12 +1,7 @@
> -deltask do_package
> -deltask do_package_write_rpm
> -deltask do_package_write_ipk
> -deltask do_package_write_deb
> -deltask do_package_qa
> -deltask do_packagedata
> -deltask do_package_setscene
> -deltask do_package_write_rpm_setscene
> -deltask do_package_write_ipk_setscene
> -deltask do_package_write_deb_setscene
> -deltask do_package_qa_setscene
> -deltask do_packagedata_setscene
> +NO_PACKAGES +=3D "do_package do_package_write_rpm do_package_write_ipk d=
o_package_write_deb do_package_qa do_packagedata do_package_setscene do_pac=
kage_write_rpm_setscene do_package_write_ipk_setscene do_package_write_deb_=
setscene do_package_qa_setscene do_packagedata_setscene"

Could we use a more descriptive name here, e.g. NO_PACKAGES_DELTASKS?


--
Paul Barker
Konsulko Group
