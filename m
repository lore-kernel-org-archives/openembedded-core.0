Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web12.657.1585597965859487712
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2020 12:52:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QFLY9047;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id s1so23168238wrv.5
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2020 12:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=AknU01pLLl0DvlPF3UsahedNCow1qnXJFURvbWOe2AI=;
        b=QFLY9047TLQSnCXVR8Z7FHMZmHnxbmyW1FCjwQaOUpUhFRV3j5ni+EIsgs2jo+hMc3
         Mou9fuHfrJ92wF/TekspdO1Yl5CeOA4ClPr8TQNu6eATdK+RG9zRmspn8Mo7qYKrVAFX
         7knbLXlg3M4XGAca55dal3ovUACDAhftSpuA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=AknU01pLLl0DvlPF3UsahedNCow1qnXJFURvbWOe2AI=;
        b=PU4x+h5kUycoKKZCjA7/c5o5q2exVuLt3ZUAyFBpmwlb67nu3m7NKhWMYB3YUtim0D
         83RvVaDAamn+y1wW8aEOSkpEO3dPq6at2QjpmymhlDuSLifSk4i1XZtxfISNcrhhPQyk
         cmlxp5wXibHSQmBNoI1einuFA5KVuyqab07zu4svmzVKWiDek8wrJPnF7WcqJjEd3Uy/
         xYweKqFJUD8EaPxtnjEIdQ6G2Vz0Imeq47NcEbrjtTNqZxXwHJLRRdlVkEbBfdKm/txx
         UuPZfV1ghfFLYpHjNPIKrO+B85iXCZLAJ3dKo31eWin/Rlhu6G8u/yjKmZ8HZ2tfl3yv
         /WCQ==
X-Gm-Message-State: ANhLgQ0mcrB8Xo2Ddbmfmi3l6SUmpYgE129aJEV2h54BZYuX89aLpiFE
	lMacb53jPYGFFtWo2kR0Nwt9Eg==
X-Google-Smtp-Source: ADFU+vt6y64qsWvscjOCekvzxd8ZnW8k6L0vpXn1XZq1IY7Q1m1ulvPxMBqfVukAVESlApR5WVd1yg==
X-Received: by 2002:a5d:464e:: with SMTP id j14mr16528056wrs.339.1585597964322;
        Mon, 30 Mar 2020 12:52:44 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id 71sm24817277wrc.53.2020.03.30.12.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 12:52:43 -0700 (PDT)
Message-ID: <1c499374846e55d377d60b4faf28c50bb7b675f6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 4/4] sanity.bbclass: add test for gcc < 5.0
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Tim Orling <timothy.t.orling@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 30 Mar 2020 20:52:42 +0100
In-Reply-To: <20200330194302.30032-4-timothy.t.orling@linux.intel.com>
References: <20200330194302.30032-1-timothy.t.orling@linux.intel.com>
	 <20200330194302.30032-4-timothy.t.orling@linux.intel.com>
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-03-30 at 12:43 -0700, Tim Orling wrote:
> +# The gcc version in CentOS-7 (4.8.5) is known to be a problem.
> +# Require at least gcc version 5.0.
> +#
> +# This can be fixed on CentOS-7 with devtoolset-6+
> +# https://www.softwarecollections.org/en/scls/rhscl/devtoolset-6/
> +#
> +# A less invasive fix is with scripts/install-buildtools (or with user
> +# built buildtools-extended-tarball)
> +#
> +def check_gcc_version(sanity_data):
> +    from distutils.version import LooseVersion
> +    import subprocess
> +    build_cc = sanity_data.getVar('BUILD_CC').strip()
> +    if build_cc == "gcc":
> +        try:
> +            result = subprocess.check_output(["gcc", "--version"], stderr=subprocess.DEVNULL).decode('utf-8')
> +        except subprocess.CalledProcessError as e:
> +            return "Unable to execute gcc --version, exit code %d\n%s\n" % (e.returncode, e.output)
> +        version = result.split()[2]
> +        if LooseVersion(version) < LooseVersion("5.0"):
> +            return "Your version of gcc is older than 5.0 and will break builds. Please install a newer version of gcc (you could use the project's buildtools-extended-tarball or use scripts/install-buildtools).\n"
> +    return None

I had forgotten we had this but a recent patch reminded me, would we
want to tweak this function:

http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/lib/oe/utils.py?h=master-next#n376

?

Cheers,

Richard


