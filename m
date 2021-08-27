Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.4423.1630044215750622163
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Aug 2021 23:03:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QBfTzs+m;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id z4so8620249wrr.6
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Aug 2021 23:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=jvkGoLe/NDIYdtrKcBhfmMNQK1KtgT8C9U0Zpfu2CBg=;
        b=QBfTzs+m+wpVKhOJwV+W9j4axWGjZxe5mp29et/mB83C0iveZM2O+X45mMlV5Omy+Q
         7CCQpRoPsXaihOUE5YrPit54nLoDmy8mGXCQ/PHf710C5AmIR7iKi9AFhzZ1WsiLZFvG
         EnddSykPHo2nkT6jUVtCKLo8F2R8d25FOd+FU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=jvkGoLe/NDIYdtrKcBhfmMNQK1KtgT8C9U0Zpfu2CBg=;
        b=I189Vsd0IFH/CxlAW6E7aRkrOsJes/21FUi+6xW/ojufH0RSGEbLs0khTvq/tHZsO2
         IoAtWcp7zHqetcoK0MkDgSKqsYXsYnfxP8p3Inbl1g5tXJew3izxyPvZ4kdU6RROMFF2
         u99/D9+HDFk5yJKyclf4E9nwDK6EEJAKpnts65aZgtqBKk4J3GkJclmYjtbXFoXBCrPg
         V6oP8HM1ePpaeOttlf9FnNHpqKgVeYjFLQoATsnIdqauyPw1qoOEjfw9Xr8ejWfWdzf0
         p39ljhFAQ/HTPoEigINuFz86a07af9OKjgSC3/4SbH9Gv61LXJsaIuDaVeq511Sd/+9P
         LOfA==
X-Gm-Message-State: AOAM5327fmn2NrqVSgOSwUxgojzRbquQEZkj/9I9I0eIY4Xr8I2TdThn
	zu4EBblKkIwNSZGmIJrKhu9gKQ==
X-Google-Smtp-Source: ABdhPJwviM3TWtnNKAj8cjWIzVAPSMQSA5G/7rw2RN13FNuW2op7LH8TFHtprQ0xbs7WreEV77Bl0A==
X-Received: by 2002:adf:c10c:: with SMTP id r12mr504563wre.142.1630044214193;
        Thu, 26 Aug 2021 23:03:34 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:5262:687a:b257:b6af? ([2001:8b0:aba:5f3c:5262:687a:b257:b6af])
        by smtp.gmail.com with ESMTPSA id i21sm5203607wrb.62.2021.08.26.23.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 23:03:33 -0700 (PDT)
Message-ID: <238f403cac24af66f1d11f88dc33c79e2c6e4d81.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] buildhistory: Label packages providing per-file dependencies in depends.dot
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Andres Beltran <abeltran@linux.microsoft.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 27 Aug 2021 07:03:30 +0100
In-Reply-To: <20210818171726.11101-1-abeltran@linux.microsoft.com>
References: <20210818171726.11101-1-abeltran@linux.microsoft.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2021-08-18 at 17:17 +0000, Andres Beltran wrote:
> Currently, depends.dot includes per-file dependencies but not the packages
> providing those files. This makes it hard to obtain all package
> dependencies by just looking at depends.dot.
> 
> Parse the RPROVIDES and FILERPROVIDES fields from pkgdata to map each of
> their values to the package providing the component. Include runtime
> packages as dependencies in depends.dot, together with the component
> provided by the package as a label.
> 
> Signed-off-by: Andres Beltran <abeltran@linux.microsoft.com>
> ---
>  meta/classes/buildhistory.bbclass |  4 +++-
>  meta/lib/oe/utils.py              | 29 +++++++++++++++++++++++++++--
>  2 files changed, 30 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
> index 8a1359acbe..9ec48a879a 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -438,7 +438,7 @@ def buildhistory_list_installed(d, rootfs_type="image"):
>          output_file_full = os.path.join(d.getVar('WORKDIR'), output_file)
>  
>          with open(output_file_full, 'w') as output:
> -            output.write(format_pkg_list(pkgs, output_type))
> +            output.write(format_pkg_list(pkgs, output_type, d.getVar('PKGDATA_DIR')))
>  
>  python buildhistory_list_installed_image() {
>      buildhistory_list_installed(d)
> @@ -479,6 +479,8 @@ buildhistory_get_installed() {
>  	       -e 's:|: -> :' \
>  	       -e 's:"\[REC\]":[style=dotted]:' \
>  	       -e 's:"\([<>=]\+\)" "\([^"]*\)":[label="\1 \2"]:' \
> +	       -e 's:"\([*]\+\)" "\([^"]*\)":[label="\2"]:' \
> +	       -e 's:"\[RPROVIDES\]":[style=dashed]:' \
>  		$1/depends.tmp
>  	# Add header, sorted and de-duped contents and footer and then delete the temp file
>  	printf "digraph depends {\n    node [shape=plaintext]\n" > $1/depends.dot
> diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
> index 83d298906b..0f3dfd644d 100644
> --- a/meta/lib/oe/utils.py
> +++ b/meta/lib/oe/utils.py
> @@ -345,7 +345,26 @@ def squashspaces(string):
>      import re
>      return re.sub(r"\s+", " ", string).strip()
>  
> -def format_pkg_list(pkg_dict, ret_format=None):
> +def rprovides_map(pkgdata_dir, pkg_dict):
> +    # Map file -> pkg provider
> +    rprov_map = {}
> +
> +    for pkg in pkg_dict:
> +        with open(os.path.join(pkgdata_dir, 'runtime-reverse', pkg)) as f:
> +            for line in f:
> +                if line.startswith('RPROVIDES') or line.startswith('FILERPROVIDES'):
> +                    # List all components provided by pkg.
> +                    # Exclude version strings, i.e. those starting with (
> +                    provides = [x for x in line.split()[1:] if not x.startswith('(')]
> +                    for prov in provides:
> +                        if prov in rprov_map:
> +                            rprov_map[prov].append(pkg)
> +                        else:
> +                            rprov_map[prov] = [pkg]
> +
> +    return rprov_map
> +
> +def format_pkg_list(pkg_dict, ret_format=None, pkgdata_dir=None):
>      output = []
>  
>      if ret_format == "arch":
> @@ -358,9 +377,15 @@ def format_pkg_list(pkg_dict, ret_format=None):
>          for pkg in sorted(pkg_dict):
>              output.append("%s %s %s" % (pkg, pkg_dict[pkg]["arch"], pkg_dict[pkg]["ver"]))
>      elif ret_format == "deps":
> +        rprov_map = rprovides_map(pkgdata_dir, pkg_dict)
>          for pkg in sorted(pkg_dict):
>              for dep in pkg_dict[pkg]["deps"]:
> -                output.append("%s|%s" % (pkg, dep))
> +                if dep in rprov_map:
> +                    # There could be multiple providers within the image
> +                    for pkg_provider in rprov_map[dep]:
> +                        output.append("%s|%s * %s [RPROVIDES]" % (pkg, pkg_provider, dep))
> +                else:
> +                    output.append("%s|%s" % (pkg, dep))
>      else:
>          for pkg in sorted(pkg_dict):
>              output.append(pkg)

This seemed to cause failures when generating SDKs:

https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/3914
https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/3895
https://autobuilder.yoctoproject.org/typhoon/#/builders/74/builds/3882
https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/3875
https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/3884
https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/3880

Cheers,

Richard




